-- =============================================================================
-- 📖 KADRO KONU ANLATIMI — Tarih · Atatürk İlke ve İnkılapları
-- Kaynak: docs/konu_anlatimi/tarih/06_ataturk_ilke_ve_inkilaplari.md
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
  'tarih.ataturk_ilke_ve_inkilaplari.01',
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  1,
  'Bölüm 1: Mustafa Kemal''in Hayatı ve Siyasi Alandaki İnkılaplar',
  'Mustafa Kemal''in fikir dünyasının şekillendiği dönemleri ve görev yerlerini sınavda birbirine karıştırmamalısın.  Selanik''teki ilk ve orta öğreniminin ardından 1896-1899 yılları arasında okuduğu Manastır Askeri İdadisinde tarih öğretmeni Mehmet Tevfik Bilge''den tarih bilinci almış; Namık Kemal ve Mehmet Emin Yurdakul''un eserleriyle milliyetçilik ve hürriyet düşüncesini derinleştirmiştir.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Mustafa Kemal''in fikir dünyasının şekillendiği dönemleri ve görev yerlerini sınavda birbirine karıştırmamalısın. Selanik''teki ilk ve orta öğreniminin ardından 1896-1899 yılları arasında okuduğu **Manastır Askeri İdadisi**nde tarih öğretmeni Mehmet Tevfik Bilge''den tarih bilinci almış; Namık Kemal ve Mehmet Emin Yurdakul''un eserleriyle milliyetçilik ve hürriyet düşüncesini derinleştirmiştir. Ayrıca Fransız aydınlanma düşünürleri Rousseau, Voltaire ve Montesquieu''nün eserlerini okuması, ileride kuracağı cumhuriyetin egemenlik ve hukuk anlayışına doğrudan yön vermiştir. Harp Okulu ve Harp Akademisi''ni tamamladıktan sonra atandığı **ilk görev yeri** olan **Şam 5. Ordu**da 1906 yılında arkadaşlarıyla **Vatan ve Hürriyet Cemiyeti**ni kurmuştur (İttihat ve Terakki''ye daha sonra üye olmuştur). Bu ilk örgütlenme deneyimi, onun meşrutiyet ve ulusal egemenlik fikirlerini erken yaşta sahaya taşıdığını gösterir."
  },
  {
    "type": "paragraph",
    "text": "Atatürk''ün kaleme aldığı eserler arasında **Nutuk** önemli bir yer tutar. 1927 yılında CHP 2. Kurultayı''nda 6 gün boyunca (36,5 saat) okunan Nutuk, Samsun''a çıkıştan gençliğe hitabeye kadar **1919-1927** yılları arasını kapsar; 1927 sonrası inkılapları ve 1938''e kadar olan dönemi içermez. Eser, Milli Mücadele''nin ve Cumhuriyetin kuruluş sürecinin bizzat kurucu lider tarafından belgelerle anlatıldığı temel kaynaktır. Atatürk''ün ayrıca **Geometri** kitabı (üçgen, açı, boyut gibi matematik terimlerini Türkçeleştirmiştir), **Cumalı Ordugahı**, **Bölüğün Muharebe Eğitimi** ve **Zabit ve Kumandan ile Hasbihal** gibi askeri eserleri vardır; **Zeytindağı** ise Falih Rıfkı Atay''a aittir. Bu eserlerin bilinmesi, Atatürk''ün yalnızca bir asker ve devlet adamı değil, aynı zamanda bilim ve dil konularında da öncü bir düşünür olduğunu ortaya koyar."
  },
  {
    "type": "heading",
    "text": "Siyasi İnkılaplar ve 3 Mart 1924 Paketi"
  },
  {
    "type": "paragraph",
    "text": "Cumhuriyetin ilanı ve öncesindeki siyasi düzenlemeler, ulusal egemenliği tek bir meclis çatısında toplamak ve devlet yapısını laik-çağdaş bir temele oturtmak için art arda hayata geçirildi. 1923 yazında kurulan II. TBMM''nin inkılapçı karakteri sayesinde bu dönüşüm hızlı bir yasama süreciyle gerçekleşti:"
  },
  {
    "type": "bullets",
    "items": [
      "**Saltanatın Kaldırılması (1 Kasım 1922):** Lozan Konferansı''na hem TBMM hem İstanbul Hükümeti çağrılınca ikiliği önlemek ve ulusal egemenliği tek elde toplamak için kaldırıldı. Dikkat: **1 Kasım 1922''de yalnızca saltanat kaldırıldı, halifelik henüz kaldırılmadı!** Bu ayrım, I. TBMM içindeki gelenekçi grupların tepkisini yumuşatarak kararın geçmesini kolaylaştırdı.",
      "**Ankara''nın Başkent Olması (13 Ekim 1923):** Cumhuriyetin ilanından 16 gün önce TBMM kararıyla yasalaştı; böylece yeni devletin siyasi merkezi İstanbul''daki eski monarşi mirasından ayrıştırıldı.",
      "**Cumhuriyetin İlanı (29 Ekim 1923):** Hükümet bunalımını aşmak için Meclis Hükümeti sisteminden **Kabine Sistemi**ne geçildi; ilk Cumhurbaşkanı Mustafa Kemal, ilk Başbakan **İsmet İnönü**, ilk Meclis Başkanı ise **Ali Fethi Okyar** oldu (Başkanlık sistemine değil, parlamenter kabine sistemine geçildi).",
      "**3 Mart 1924 Kanunları:** Aynı gün kabul edilen devrim paketiyle **Halifelik** kaldırılıp Osmanlı hanedanı yurt dışına çıkarıldı, **Tevhid-i Tedrisat Kanunu** kabul edildi, Şeriye ve Evkaf Vekaleti kaldırılıp **Diyanet İşleri Başkanlığı** kuruldu ve **Erkan-ı Harbiye Vekaleti** kaldırılarak hükümette sivil **Milli Savunma Bakanlığı** kurulurken askeri sevk ve idare için bağımsız **Genelkurmay Başkanlığı** oluşturuldu. Türkiye''nin ilk Genelkurmay Başkanı olan **Mareşal Fevzi Çakmak**, 1944 yılına kadar bu görevde kalarak ordunun siyasetten ayrı tutulmasında kilit rol oynadı.",
      "**1928 Anayasa Değişikliği:** **10 Nisan 1928**''de 1924 Anayasası''ndan **\"Devletin dini İslam''dır\"** maddesi çıkarıldı ve milletvekili yeminleri laikleştirildi (6 ilkenin anayasaya girişi ise **1937** yılındadır). Bu adımla devletin tüm inançlara eşit mesafede durması anayasal güvence altına alındı."
    ]
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM adayların iki tarihi birbirine karıştırmasını ister: Saltanat **1 Kasım 1922**''de, Halifelik ise **3 Mart 1924**''te kaldırılmıştır. Ayrıca **Tekke ve Zaviyelerin Kapatılması** 3 Mart 1924 paketinde değil, **30 Kasım 1925**''tedir."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Erkan-ı Harbiye Vekaleti''nin kaldırılıp Genelkurmay Başkanlığı ile Milli Savunma Bakanlığı''nın ayrılmasının temel amacı nedir?\" Cevap: Askerlik ile milletvekilliğini ayırarak **ordunun siyasete karışmasını kesin olarak önlemek**tir; ilk Genelkurmay Başkanı ise Mareşal Fevzi Çakmak''tır."
  },
  {
    "type": "key_points",
    "items": [
      "İlk görev yeri Şam''dır ve burada 1906''da Vatan ve Hürriyet Cemiyeti''ni kurdu; Nutuk 1919-1927 arasını anlatır.",
      "Saltanat 1922''de, Halifelik 3 Mart 1924''te kaldırıldı; Ankara Cumhuriyetten 16 gün önce başkent oldu.",
      "Cumhuriyet ile Meclis Hükümeti''nden Kabine Sistemi''ne geçildi; ilk Başbakan İsmet İnönü''dür.",
      "\"Devletin dini İslam''dır\" ibaresi 1928''de çıkarıldı; Atatürk ilkeleri 1937''de anayasaya girdi."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": [
      "02664667-cbd5-4ebf-bb40-0b4df4cc6415",
      "02829eb1-11fb-5f8d-8377-e2cfd558ea56"
    ]
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
  'tarih.ataturk_ilke_ve_inkilaplari.02',
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  2,
  'Bölüm 2: Çok Partili Hayat Denemeleri ve Rejim Karşıtı Olaylar',
  'Milli Mücadele''yi yürüten Anadolu ve Rumeli Müdafaa-i Hukuk Cemiyeti (ARMHC), 9 Eylül 1923''te sıfırdan değil, doğrudan teşkilatın partileşmesiyle Halk Fırkasına (sonradan CHP) dönüştü.  Atatürk, demokrasinin tek partiyle tam anlamıyla yerleşemeyeceğini, halkın farklı görüşlerinin mecliste temsil edilmesi ve hükümetin denetlenmesi gerektiğini düşündüğü için çok partili hayata geçişi destekledi.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Milli Mücadele''yi yürüten Anadolu ve Rumeli Müdafaa-i Hukuk Cemiyeti (ARMHC), 9 Eylül 1923''te sıfırdan değil, doğrudan teşkilatın partileşmesiyle **Halk Fırkası**na (sonradan CHP) dönüştü. Atatürk, demokrasinin tek partiyle tam anlamıyla yerleşemeyeceğini, halkın farklı görüşlerinin mecliste temsil edilmesi ve hükümetin denetlenmesi gerektiğini düşündüğü için çok partili hayata geçişi destekledi. Bu amaçla Atatürk döneminde iki muhalefet partisi denemesi yapıldı; ancak her ikisi de inkılaplara ve laik cumhuriyet rejimine karşı çıkan çevrelerin sığınağı haline gelince sonlandırıldı ve Türkiye 1945''e kadar tek parti yönetimiyle inkılaplarını korudu."
  },
  {
    "type": "heading",
    "text": "Terakkiperver Cumhuriyet Fırkası ve Şeyh Sait İsyanı (1924-1925)"
  },
  {
    "type": "paragraph",
    "text": "**17 Kasım 1924**''te Kurtuluş Savaşı''nın önemli komutanlarından Kazım Karabekir, Rauf Orbay, Ali Fuat Cebesoy, Refet Bele ve Adnan Adıvar tarafından kurulan **Terakkiperver Cumhuriyet Fırkası (TCF)**, Türkiye Cumhuriyeti''nin **ilk muhalefet partisi**dir. Ekonomide liberalizmi, tek dereceli seçim sistemini ve yerinden yönetimi savunan parti, tüzüğünde yer alan \"dini inançlara saygılıdır\" ifadesi nedeniyle kısa sürede saltanat ve hilafet yanlısı çevrelerin odağı haline geldi."
  },
  {
    "type": "paragraph",
    "text": "1925 başında Doğu''da **Şeyh Sait İsyanı** patlak verince mevcut Başbakan **Ali Fethi Okyar** isyanı bastırmakta yetersiz görülerek istifa etti. Yerine hükümeti kuran **İsmet İnönü**, **4 Mart 1925**''te hükümete basını denetleme ve olağanüstü önlemler alma yetkisi tanıyan **Takrir-i Sükun Kanunu**nu çıkardı ve **İstiklal Mahkemeleri**ni yeniden kurdu (isyan bölgesinde ve Ankara''da görev yaptı). İsyanla bağlantılı görülen TCF kapatıldı; ayrıca bu iç karışıklık nedeniyle Türkiye, İngiltere ile yürütülen Musul görüşmelerinde askeri gücünü masaya koyamadı ve **Musul Sorunu** 1926 Ankara Antlaşması''yla aleyhimize sonuçlandı. Böylece ilk çok partili hayat denemesi rejim güvenliği gerekçesiyle sona ermiş oldu ve ülke içi istikrarın sağlanmasına öncelik verildi."
  },
  {
    "type": "heading",
    "text": "İzmir Suikastı (1926), Serbest Cumhuriyet Fırkası ve Menemen (1930)"
  },
  {
    "type": "paragraph",
    "text": "**16 Haziran 1926**''da eski İttihatçıların Mustafa Kemal''e yönelik **İzmir Suikastı** girişimi önceden ortaya çıkarıldı; bu olay sonrası yapılan yargılamalarla eski İttihatçı muhalefet tasfiye edildi. Suikast girişimi, inkılaplara karşı yeraltı muhalefetinin sürdüğünü göstermiş ve cumhuriyet yönetiminin kararlılığını artırmıştır. Atatürk''ün Anadolu Ajansı''na verdiği **\"Benim naçiz vücudum elbet bir gün toprak olacaktır; fakat Türkiye Cumhuriyeti ilelebet payidar kalacaktır\"** ünlü sözü Cumhuriyetin ilanında değil, **İzmir Suikastı sonrasında** söylenmiştir."
  },
  {
    "type": "paragraph",
    "text": "1929 Dünya Ekonomik Bunalımı''nın yarattığı ekonomik sıkıntılar sırasında hükümetin ekonomi politikalarını denetlemek amacıyla **12 Ağustos 1930**''da Atatürk''ün isteğiyle arkadaşı **Ali Fethi Okyar** tarafından **Serbest Cumhuriyet Fırkası (SCF)** kuruldu (ekonomide devletçiliğe karşı liberalizmi savunan ikinci muhalefet partisi). Parti kısa sürede Ege Bölgesi''nde büyük bir ilgi gördü; ancak laiklik ve cumhuriyet karşıtlarının partiye sızarak odağı değiştirdiğini gören kurucusu Ali Fethi Okyar, yeni bir iç çatışmaya yol açmamak için partiyi **17 Kasım 1930''da kendiliğinden feshetti**. Fesih sonrasında ortaya çıkan siyasi boşlukta gerici çevrelerin kışkırtmaları sürdü."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "**EN BÜYÜK ÖSYM ÇELDİRİCİSİ:** Adayların çoğu İzmir Menemen''de Asteğmen Kubilay''ın şehit edildiği **Menemen Olayı (23 Aralık 1930)** yüzünden Serbest Cumhuriyet Fırkası''nın kapatıldığını zanneder! Kronolojiye dikkat et: SCF **Kasım 1930**''da kapandı; Menemen Olayı ise parti kapandıktan bir ay sonra **Aralık 1930**''da gerçekleşti! Bu iki olay toplumsal zeminde inkılapların henüz tam sindirilemediğini ve çok partili hayata geçişin erken olduğunu göstermiştir. Olay sonrası bölgede sıkıyönetim ilan edilmiş ve sorumlular Divan-ı Harp''te yargılanmıştır."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Şeyh Sait İsyanı çıktığında başbakan kimdi ve isyanı bastırmak için hangi kanun çıkarıldı?\" İsyan başladığında başbakan **Ali Fethi Okyar**dı; istifası sonrası **İsmet İnönü** başbakan oldu ve **Takrir-i Sükun Kanunu** (1925) çıkarıldı (Hıyanet-i Vataniye 1920''dedir). Çok partili hayata kesin geçiş ise ancak II. Dünya Savaşı sonrası 1945-1946 yıllarında mümkün olabilecektir; bu tarihe kadar Türkiye tek parti hükümetiyle inkılaplarını yerleştirmiştir."
  },
  {
    "type": "key_points",
    "items": [
      "CHP, ARMHC''nin partileşmesiyle kuruldu; ilk muhalefet partisi TCF (1924), ikinci muhalefet partisi SCF''dir (1930).",
      "Şeyh Sait İsyanı sonrası Ali Fethi Okyar istifa etti, İsmet İnönü Takrir-i Sükun Kanunu''nu çıkardı; TCF kapatıldı ve Musul kaybedildi.",
      "\"Benim naçiz vücudum...\" sözü 1926 İzmir Suikastı sonrasında söylendi; bu olayla eski İttihatçı muhalefet tasfiye edildi.",
      "SCF kendi kendini feshettikten sonra Menemen Olayı (Aralık 1930) yaşandı."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": [
      "05c798a5-6f4d-452c-b427-b4c5cabdc988",
      "089f5230-9013-4857-8c34-a572db40a6d0"
    ]
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
  'tarih.ataturk_ilke_ve_inkilaplari.03',
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  3,
  'Bölüm 3: Hukuk ve Eğitim-Kültür Alanındaki İnkılaplar',
  'Cumhuriyetin hukuk devriminde Osmanlı''dan kalan şer''i-örfi ikiliğinin ve kapitülasyon kalıntılarının ortadan kaldırılması hedeflendi; bu amaçla farklı Avrupa ülkelerinin en güncel, laik ve gelişmiş kanunları esas alındı.  Medeni Kanun ve Borçlar Kanunu (1926) İsviçre''den alınırken; Ceza Kanunu (1926) İtalya''dan, Ticaret Kanunu Almanya''dan, İdare Hukuku ise Fransa''dan alındı (tüm kanunların İsviçre''den alındığı yanılgısına düşme!',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Cumhuriyetin hukuk devriminde Osmanlı''dan kalan şer''i-örfi ikiliğinin ve kapitülasyon kalıntılarının ortadan kaldırılması hedeflendi; bu amaçla farklı Avrupa ülkelerinin en güncel, laik ve gelişmiş kanunları esas alındı. **Medeni Kanun** ve **Borçlar Kanunu (1926)** **İsviçre**''den alınırken; **Ceza Kanunu (1926)** **İtalya**''dan, **Ticaret Kanunu** **Almanya**''dan, **İdare Hukuku** ise **Fransa**''dan alındı (tüm kanunların İsviçre''den alındığı yanılgısına düşme!). İsviçre Medeni Kanunu''nun seçilmesinde akılcı, pratik ve kadın-erkek eşitliğini esas alan en yeni metin olması etkili oldu."
  },
  {
    "type": "heading",
    "text": "Medeni Kanun ve Kadınlara Siyasi Haklar"
  },
  {
    "type": "paragraph",
    "text": "**17 Şubat 1926 Türk Medeni Kanunu** ile Mecelle yürürlükten kaldırıldı; tek eşlilik, resmi nikah, boşanmada ve mirasta kadın-erkek eşitliği, mahkemelerde şahitlik eşitliği ve meslek seçme özgürlüğü getirildi. Ayrıca azınlıkların kendi cemaat mahkemelerini kurma ayrıcalıkları sona erdirilerek tüm vatandaşlar tek bir hukuk sistemi altında eşitlendi ve patrikhanelerin dünyevi yetkileri kaldırıldı. Medeni Kanun ile toplumsal ve ailevi alanda sağlanan bu eşitlik, birkaç yıl sonra kadınlara tanınacak siyasi hakların da toplumsal temelini oluşturdu."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM''nin hukuk inkılabındaki değişmez kuralı şudur: **1926 Türk Medeni Kanunu''nda kadınlara SİYASİ HAKLAR (seçme ve seçilme) KESİNLİKLE YOKTUR!** Medeni Kanun yalnızca sosyal, hukuki ve ekonomik hakları düzenler. Kadınlara siyasi haklar 1930-1934 arasında ayrı yasalarla verilmiştir."
  },
  {
    "type": "callout",
    "kind": "mnemonic",
    "text": "Kadınlara siyasi hakların veriliş sırasını **B-M-M** (Belediye - Muhtarlık - Milletvekilliği) şeklinde kronolojik olarak aklında tut: - **1930:** **B**elediye seçimlerine katılma hakkı - **1933:** **M**uhtarlık seçimlerine katılma hakkı - **1934:** **M**illetvekili seçme ve seçilme hakkı Ayrıca öncü kadın isimleri de karıştırma: İlk Türk kadın hekim **Safiye Ali**, ilk Türk kadın bakan **Türkan Akyol** (1971), ilk Türk kadın başbakan ise **Tansu Çiller**dir."
  },
  {
    "type": "heading",
    "text": "Eğitim, Dil, Tarih ve Üniversite Reformu"
  },
  {
    "type": "paragraph",
    "text": "Eğitim ve kültür alanındaki yenilikler, yeni kurulan ulus-devletin fikri ve bilimsel altyapısını oluşturmak amacıyla birbirini tamamlayacak şekilde planlandı:"
  },
  {
    "type": "bullets",
    "items": [
      "**Tevhid-i Tedrisat Kanunu (3 Mart 1924):** Tüm eğitim kurumları Milli Eğitim Bakanlığı çatısında toplandı, medreseler kapatıldı ve yabancı okulların denetimsizliğine son verildi (hem **Milliyetçilik** hem **Laiklik** ilkesidir; kanun olduğu için Devletçilik sanma!).",
      "**Harf İnkılabı (1 Kasım 1928) ve Millet Mektepleri (24 Kasım 1928):** Okuma yazmayı kolaylaştırmak ve Batı bilimiyle bütünleşmek için Latin esaslı yeni Türk harfleri kabul edildi; ardından yeni harfleri yetişkin halka öğretmek amacıyla **Millet Mektepleri** açıldı (**Halkevleri** 1932, **Köy Enstitüleri** ise 1940''ta kuruldu).",
      "**Türk Tarih Kurumu (TTK, 1931):** Ümmetçi ve hanedan merkezli tarih anlayışı yerine bilimsel ve milli Türk tarihini araştırmak için kuruldu. İlk adı Türk Tarihi Tetkik Cemiyeti''dir; **ilk başkanı Tevfik Bıyıklıoğlu**, resmi yayın organı ise **Belleten** dergisidir.",
      "**Türk Dil Kurumu (TDK, 1932) ve Güneş Dil Teorisi:** Türkçeyi yabancı kelimelerin etkisinden arındırıp bilim ve kültür dili haline getirmek için kuruldu; halk ağzından derlemeler yapılarak öz Türkçe kelimeler canlandırıldı. 1935-1936''da Viyanalı dilbilimci Hermann Kvergic''in çalışmasıyla Atatürk''ün desteklediği **Güneş Dil Teorisi**, Türkçenin kökenini doğaya ve güneşe bağlayan dil kuramıdır.",
      "**Halkevleri (19 Şubat 1932):** 9 farklı şubeyle kültür ve inkılapları halka yaydı; yayın organı **Ülkü** dergisidir (Şevket Süreyya Aydemir ve Yakup Kadri''nin çıkardığı **Kadro** dergisiyle karıştırma).",
      "**1933 Üniversite Reformu:** İsviçreli Prof. Albert Malche''nin raporu doğrultusunda Osmanlı''dan kalan ve çağın bilimsel gelişmelerine ayak uyduramayan **Darülfünun** kapatılarak **İstanbul Üniversitesi**ne dönüştürüldü (Ankara Üniversitesi ise sonradan kurulmuştur). Aynı dönemde Almanya''dan kaçan pek çok bilim insanı da Türkiye''ye davet edilerek üniversite kadroları güçlendirildi."
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"1926 Medeni Kanunu aşağıdakilerden hangisini sağlamamıştır?\" Doğru yanıt daima **\"Kadınlara seçme ve seçilme hakkı tanınması\"** veya siyasi temsille ilgili bir seçenek olur. Siyasi haklar 1930-1934 arasında aşamalı olarak tanınmıştır; böylece Türk kadını pek çok Avrupa ülkesinden daha önce seçme ve seçilme hakkına kavuşmuştur."
  },
  {
    "type": "key_points",
    "items": [
      "Medeni/Borçlar İsviçre''den, Ceza İtalya''dan, Ticaret Almanya''dan, İdare Hukuku Fransa''dan alındı.",
      "Medeni Kanun''da siyasi hak yoktur; kadınlara siyasi haklar B-M-M (1930 Belediye, 1933 Muhtarlık, 1934 Milletvekilliği) sırasıyla verildi.",
      "Yetişkinlere okuma-yazma için Millet Mektepleri (1928) açıldı; TTK''nin ilk başkanı Tevfik Bıyıklıoğlu, dergisi Belleten, Halkevleri''nin dergisi Ülkü''dür.",
      "1933 Üniversite Reformu ile Darülfünun İstanbul Üniversitesi''ne dönüştürüldü."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": [
      "09d5cb86-633f-4e29-9ff0-4425d4d1f365",
      "0aeb844d-67a1-4a15-bb69-8f3f357a9803"
    ]
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
  'tarih.ataturk_ilke_ve_inkilaplari.04',
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  4,
  'Bölüm 4: Toplumsal ve Ekonomik Alandaki İnkılaplar',
  'Toplumsal alandaki düzenlemeler çağdaş görünümü sağlamak, laikleşmeyi pekiştirmek, günlük yaşamda ve uluslararası ticarette Avrupa ile uyumu yakalamak ve ayrıcalıksız bir toplum ku',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Toplumsal alandaki düzenlemeler çağdaş görünümü sağlamak, laikleşmeyi pekiştirmek, günlük yaşamda ve uluslararası ticarette Avrupa ile uyumu yakalamak ve ayrıcalıksız bir toplum kurmak amacıyla yapıldı:"
  },
  {
    "type": "bullets",
    "items": [
      "**Şapka Kanunu (25 Kasım 1925):** Mustafa Kemal şapkayı İzmir veya İstanbul''da değil, **23-31 Ağustos 1925 Kastamonu ve İnebolu gezisi**nde bizzat halka tanıttı; kanunla birlikte kılık kıyafette ikilik ve statü göstergeleri kaldırıldı.",
      "**Tekke, Zaviye ve Türbelerin Kapatılması (30 Kasım 1925):** Atatürk''ün **\"Türkiye Cumhuriyeti şeyhler, dervişler, müritler, mensuplar memleketi olamaz\"** sözü Halifeliğin kaldırılmasında değil, **677 sayılı bu kanun** sırasında söylenmiştir.",
      "**Takvim, Saat, Ölçü ve Soyadı:** Batı ile ticari ve resmi işlemlerde yaşanan aksaklıkları gidermek için 1926''da miladi takvim ve uluslararası saat, 1931''de metre ve kilogram kabul edildi (1935''te ise hafta tatili cuma gününden pazara alındı). **1934 Soyadı Kanunu** ile resmi işlemlerdeki karışıklık önlenirken, **hacı, hoca, hafız, molla, bey, paşa** gibi ayrıcalık bildiren unvanlar yasaklandı."
    ]
  },
  {
    "type": "heading",
    "text": "Ekonomi Politikaları ve Kurumsal Yatırımlar"
  },
  {
    "type": "paragraph",
    "text": "**1923 İzmir İktisat Kongresi**nde belirlenen hedefler doğrultusunda özel girişimi destekleyen adımlar atıldı. **Kazım Karabekir** başkanlığında toplanan kongrede **Misak-ı İktisadi** kararları alındı; komünist/kolektivist model kesinlikle reddedilerek özel teşebbüsü destekleyen **liberal ve milli bir karma ekonomi** benimsendi (Devletçilik ilkesine henüz 1923''te değil, 1929 Dünya Ekonomik Bunalımı sonrasında geçilmiştir). Kongreye çiftçi, tüccar, sanayici ve işçi temsilcilerinin katılması da ekonomik kalkınmanın toplumsal uzlaşıyla planlandığını gösterir."
  },
  {
    "type": "table",
    "headers": [
      "Ekonomik Adım / Kurum",
      "Yıl",
      "Temel Amaç ve Sınav Notu"
    ],
    "rows": [
      [
        "Türkiye İş Bankası",
        "1924",
        "İlk özel/ulusal banka; ilk Genel Müdürü **Celal Bayar** (Merkez Bankası 1930''da kuruldu)"
      ],
      [
        "Aşar Vergisinin Kaldırılması",
        "1925",
        "Devlet gelirlerinin yaklaşık dörtte birinden vazgeçilerek köylü rahatlatıldı (**Halkçılık + Laiklik**)"
      ],
      [
        "Atatürk Orman Çiftliği",
        "1925",
        "Ankara''da bataklık kurutularak kurulan modern tarım laboratuvarı"
      ],
      [
        "Kabotaj Kanunu",
        "1926",
        "Karasularımızda yabancı ayrıcalıklarına son verildi (**Milliyetçilik**)"
      ],
      [
        "Alpullu Şeker Fabrikası",
        "1926",
        "Türkiye''nin **üretime geçen ilk** şeker fabrikası (Uşak aynı yıl açıldı)"
      ],
      [
        "Teşvik-i Sanayi Kanunu",
        "1927",
        "Özel sektörü kalkındırma denemesi; başarısız olunca **Devletçilik** doğdu"
      ],
      [
        "Sümerbank",
        "1933",
        "**I. Beş Yıllık Sanayi Planı**nı finanse etmek ve tekstil kurmak için açıldı"
      ],
      [
        "MTA ve Etibank",
        "1935",
        "**MTA** yer altı madenlerini arar; **Etibank** finanse eder ve işletir"
      ],
      [
        "Karabük Demir-Çelik",
        "1937",
        "Temelini İsmet İnönü''nün attığı **ilk ağır sanayi** yatırımı (KARDEMİR)"
      ]
    ]
  },
  {
    "type": "paragraph",
    "text": "1929 Dünya Ekonomik Bunalımı''nın tarım fiyatlarını düşürmesi ve özel sermayenin yetersiz kalması üzerine 1930''lardan itibaren planlı sanayileşmeye geçildi. **I. Beş Yıllık Sanayi Planı (1933)** hazırlanırken Sovyetler Birliği''nden **Prof. Malışev** başkanlığındaki heyetten teknik rapor ve kredi desteği alındı; ancak Türkiye Sovyet rejimini değil, özel mülkiyeti koruyan **karma ekonomi temelli Devletçilik** modelini uyguladı. II. Beş Yıllık Sanayi Planı ise II. Dünya Savaşı''nın çıkması nedeniyle tam uygulanamadı. Sağlık alanında da Cumhuriyetin ilk Sağlık Bakanı adını taşıyan **Refik Saydam Hıfzıssıhha Enstitüsü** kurularak salgın hastalıklarla mücadele edildi, aşı üretimi yapıldı ve yurt dışına dahi kolera aşısı ihraç edildi. Ayrıca ulaşım alanında demiryolu ağının devletleştirilip yaygınlaştırılmasıyla iç pazar bütünlüğü sağlandı."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "İki ilke ve kurum eşleştirmesini karıştırma: **Kabotaj Kanunu** ekonomi/denizcilikle ilgili olsa da karasularını millileştirdiği için doğrudan **Milliyetçilik**tir; **Aşar Vergisi**nin kaldırılması ise köylüye eşitlik ve refah getirdiği için öncelikle **Halkçılık** (şer''i vergi olduğu için de Laiklik) ilkesidir. Ayrıca 1924''te kurulan İş Bankası özel sermayeli milli bir bankayken, 1930''da kurulan **Türkiye Cumhuriyet Merkez Bankası** para basma yetkisine sahip devlet bankasıdır."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"1927 Teşvik-i Sanayi Kanunu''ndan beklenen sonucun alınamaması aşağıdakilerden hangisini hızlandırmıştır?\" Cevap: Özel sermaye yetersizliği üzerine 1930''larda **Devletçilik** politikasına ve planlı kamu sanayileşmesine geçilmesini hızlandırmıştır. 1929 Buhranı da bu geçişi zorunlu kılan dış etkendir; böylece devlet doğrudan fabrika ve banka kurarak sanayileşmenin lokomotifi olmuştur."
  },
  {
    "type": "key_points",
    "items": [
      "Atatürk şapkayı Kastamonu-İnebolu''da tanıttı; \"şeyhler, dervişler...\" sözü Tekke-Zaviye kanununda (1925) söylendi.",
      "1923 İzmir İktisat Kongresi Kazım Karabekir başkanlığında liberal/milli çizgide toplandı; devletçilik 1929 Buhranı sonrası başladı.",
      "İlk şeker fabrikası Alpullu (1926), ilk ağır sanayi Karabük Demir-Çelik (1937), tekstil bankası Sümerbank (1933), maden ikilisi MTA-Etibank''tır (1935).",
      "Kabotaj = Milliyetçilik; Aşar''ın kaldırılması ve unvanların yasaklanması = Halkçılık."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": [
      "0b10b422-2bb0-4dca-a382-9846043d6d7d",
      "0c5d3fed-7398-425d-aa77-cba0f876d813"
    ]
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
  'tarih.ataturk_ilke_ve_inkilaplari.05',
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  5,
  'Bölüm 5: Atatürk İlkeleri (Kavram ve Eşleştirme Rehberi)',
  'KPSS sorularında inkılapların hangi Atatürk ilkesiyle doğrudan ilişkili olduğu sıkça sorulur.  Bir inkılabın birden fazla ilkeyle bağı olabilir; ancak soru kökündeki anahtar kelime seni doğru ilkeye götürür.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "KPSS sorularında inkılapların hangi Atatürk ilkesiyle doğrudan ilişkili olduğu sıkça sorulur. Bir inkılabın birden fazla ilkeyle bağı olabilir; ancak soru kökündeki anahtar kelime seni doğru ilkeye götürür. Atatürk''ün altı temel ilkesi birbirinden kopuk değildir; aksine ulusal egemenliği, toplumsal eşitliği, akılcılığı ve ekonomik bağımsızlığı aynı potada eriten bütüncül bir modernleşme projesidir (1931''de CHP programına girmiş, 5 Şubat 1937''de ise Anayasa''ya eklenmiştir). Bu ilkeler aynı zamanda birbirini tamamlar: Örneğin Cumhuriyetçilik olmadan Halkçılık, Laiklik olmadan çağdaş hukuk, Milliyetçilik olmadan ekonomik bağımsızlık düşünülemez."
  },
  {
    "type": "bullets",
    "items": [
      "**Cumhuriyetçilik:** Anahtar kavramları **ulusal egemenlik, meclis, seçim, oy kullanma, çok partili rejim ve anayasa**dır. Yönetim biçimi ve sandıkla ilgilidir; egemenliğin bir kişiye veya zümreye değil millete ait olmasını esas alır (Saltanatın kaldırılması, Cumhuriyetin ilanı, kadınlara 1930-1934 siyasi hakları, ordunun siyasetten ayrılması).",
      "**Milliyetçilik:** Anahtar kavramları **ulusal bağımsızlık, milli tarih-dil, milli ekonomi ve yabancı tekelinin kaldırılması**dır. Irkçılığı ve ümmetçiliği reddeder; \"Ne mutlu Türk''üm diyene\" anlayışıyla ortak kültür, tarih ve vatandaşlık bilincine dayanır (Kabotaj Kanunu, TTK, TDK, Tevhid-i Tedrisat''ta yabancı okulların denetimi, Hatay mücadelesi).",
      "**Halkçılık:** Anahtar kavramları **eşitlik, sosyal adalet, ayrıcalıkların kaldırılması ve halka hizmet**tir. Sınıf çatışmasını ve imtiyazlı grupları reddeder; devletin her vatandaşa kanun önünde eşit mesafede durmasını esas alır (Medeni Kanun''la kadın-erkek eşitliği, Aşar vergisinin kaldırılması, Soyadı Kanunu ile hacı/hoca/paşa gibi unvanların yasaklanması, Millet Mektepleri).",
      "**Laiklik:** Anahtar kavramları **akıl, bilim, din ve devlet işlerinin ayrılması, vicdan ve inanç özgürlüğü**dür. İnsanı dogmalardan kurtarıp bilimsel düşünceyi devlet yönetiminin ve eğitimin temeli yapar (Halifeliğin kaldırılması, Diyanet''in kurulması, Tekke-Zaviyelerin kapatılması, 1928''de devletin dini maddesinin çıkarılması).",
      "**Devletçilik:** Anahtar kavramları **ekonomik kalkınma, kamu yatırımı, fabrika, banka ve beş yıllık sanayi planları**dır. Sosyalizm veya komünizm değildir; özel mülkiyeti ve bireysel girişimi reddetmez, özel sektörün gücünün yetmediği büyük yatırımları devlet eliyle yaparak kalkınmayı hızlandırır (Sümerbank, Etibank, MTA, Karabük Demir-Çelik).",
      "**İnkılapçılık:** Anahtar kavramları **çağdaşlaşma, dinamizm, sürekli yenilenme ve tutuculuğu reddetme**dir. Yapılan yeniliklerin donup kalmasını önler, aklın ve bilimin rehberliğinde toplumun çağın gereklerine göre sürekli gelişimini, yenilenmesini ve ilerlemesini savunur."
    ]
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM''nin ilke sorularında üç klasik tuzağı vardır: 1. **Ulusal egemenlik** (içeride halkın yönetimi) = **Cumhuriyetçilik**; **Ulusal bağımsızlık** (dışa karşı özgürlük) = **Milliyetçilik**tir. 2. Soyadı Kanunu''nda **\"hacı, hoca, hafız\"** unvanlarının kaldırılması din kelimeleri nedeniyle Laiklik sanılır; oysa toplumda sınıf/ayrıcalık farkını kaldırdığı için doğrudan **Halkçılık**tır. 3. Devletçilik kesinlikle ekonomiyle ilgilidir; siyasi veya eğitim kanunları devlet tarafından çıkarıldığı için Devletçilik sayılmaz!"
  },
  {
    "type": "paragraph",
    "text": "Ayrıca ilkelerin bütüncül yapısını anlamak için bütünleyici ilkelere de dikkat etmelisin: **Milli egemenlik** Cumhuriyetçiliği, **milli bağımsızlık** ve **milli birlik-beraberlik** Milliyetçiliği, **akılcılık ve bilimsellik** Laikliği, **çağdaşlık ve batılılaşma** İnkılapçılığı, **yurtta barış dünyada barış** ise hem Milliyetçiliği hem de insanlık sevgisini tamamlar. Soru kökünde bu bütünleyici kavramlar geçtiğinde doğrudan bağlı olduğu ana ilkeye yönelmelisin. Sınavlarda sıkça yapılan bir diğer hata, bir inkılabı yalnızca tek bir ilkeyle sınırlı sanmaktır: Örneğin Tevhid-i Tedrisat Kanunu yabancı okulları denetim altına aldığı için Milliyetçilik, eğitimi çağdaş ve akılcı temele oturttuğu için Laiklik, tüm yurttaşlara eşit eğitim hakkı tanıdığı için de Halkçılık ile ilişkilidir. Bu çok yönlü bakış açısı, öncüllü ilke sorularında yanılmanı önler."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"1) Kabotaj Kanunu, 2) Aşar vergisinin kaldırılması, 3) Sümerbank''ın kurulması. Bu üç gelişme sırasıyla hangi ilkelerle doğrudan ilgilidir?\" Cevap: 1) **Milliyetçilik**, 2) **Halkçılık**, 3) **Devletçilik**tir. Buna karşılık 1928''de anayasadan devletin dini ibaresinin çıkarılması doğrudan Laiklik ilkesinin gereğidir; bütünleyici ilkeler arasında ise milli birlik ve beraberlik ile akılcılık ve bilimsellik öne çıkar. Ayrıca kadınlara 1930-1934 yılları arasında tanınan seçme ve seçilme hakları hem Cumhuriyetçilik hem de Halkçılık ilkelerini birlikte güçlendirir."
  },
  {
    "type": "key_points",
    "items": [
      "Cumhuriyetçilik yönetim ve sandık (ulusal egemenlik), Milliyetçilik dış özgürlük ve milli değerlerdir (ulusal bağımsızlık).",
      "Halkçılık eşitlik ve imtiyazsızlık demektir (Aşar, Soyadı/unvanlar, Medeni Kanun).",
      "Devletçilik karma ekonomik kalkınmadır; özel sektörü yasaklamaz, onu tamamlar.",
      "İnkılapçılık statükoyu reddeder ve sürekli çağdaşlaşmayı savunur; bütünleyici ilkeler ana ilkeleri anlamca pekiştirir."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": [
      "0c6f8341-00f3-482d-a46b-d847e148863b",
      "0d026f53-7b9b-476f-a05a-290acf279f4c"
    ]
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
  'tarih.ataturk_ilke_ve_inkilaplari.06',
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  6,
  'Bölüm 6: Atatürk Dönemi Türk Dış Politikası (1923-1938)',
  'Atatürk dönemi dış politikasının temel ilkesi "Yurtta sulh, cihanda sulh" (barışçı, gerçekçi, eşitliğe ve uluslararası hukuka dayalı diplomasi) anlayışıdır.  Bu dış politika iki belirgin evrede şekillendi: 1923-1930 arası Lozan''dan kalan sorunların barışçı yollarla çözümüne, 1930-1938 arası ise Almanya ve İtalya''nın saldırganlaşmasıyla yaklaşan II.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Atatürk dönemi dış politikasının temel ilkesi **\"Yurtta sulh, cihanda sulh\"** (barışçı, gerçekçi, eşitliğe ve uluslararası hukuka dayalı diplomasi) anlayışıdır. Bu dış politika iki belirgin evrede şekillendi: 1923-1930 arası Lozan''dan kalan sorunların barışçı yollarla çözümüne, 1930-1938 arası ise Almanya ve İtalya''nın saldırganlaşmasıyla yaklaşan II. Dünya Savaşı tehlikesine karşı bölgesel güvenlik ittifaklarına odaklanıldı. Türkiye bu süreçte yayılmacı emeller gütmeyen, mevcut uluslararası sınırları koruyan ve sorunları güç kullanmadan hukuk yoluyla çözmeye çalışan bir dış politika izledi."
  },
  {
    "type": "heading",
    "text": "Lozan Sonrası Sorunların Çözümü"
  },
  {
    "type": "bullets",
    "items": [
      "**Yabancı Okullar Sorunu:** Fransa başta olmak üzere bazı devletlerin müdahale etmek istediği bu konuda Türkiye, yabancı okulları Türk kanunlarına, Türk müfettişlerine ve Milli Eğitim müfredatına bağlayarak meseleyi **iç mesele** saydı ve uluslararası görüşmeyi reddetti (Fransa ile ayrıca Osmanlı Borçları ve Adana-Mersin demiryolları da görüşüldü).",
      "**Musul Sorunu (5 Haziran 1926 Ankara Antlaşması):** Şeyh Sait İsyanı''nın yarattığı iç sıkıntı nedeniyle Türkiye askeri harekat yapamadı ve **Musul ile Kerkük** İngiliz mandasındaki Irak''a bırakıldı (Hakkari Türkiye''de kaldı). Böylece Misak-ı Milli''den **üçüncü taviz** verildi; Irak petrollerinin %10''unun 25 yıl Türkiye''ye verilmesi kararlaştırıldı.",
      "**Nüfus Mübadelesi (10 Haziran 1930 Ankara Ahali Sözleşmesi):** Lozan''da kararlaştırılan nüfus değişiminde \"yerleşik\" (etabli) tanımı yüzünden Yunanistan ile yaşanan ve mallara el koyma krizine kadar tırmanan gerilim 1930''da aşıldı; İstanbul''daki Rumlar ile Batı Trakya''daki Türkler yerleşme tarihine bakılmaksızın yerleşik (**etabli**) sayıldı. Bu barış sonrasında Yunan Başbakanı **Elefterios Venizelos**, 1934 yılında Atatürk''ü **Nobel Barış Ödülü**ne aday gösterdi ve iki ülke arasında uzun süreli bir dostluk dönemi başladı."
    ]
  },
  {
    "type": "heading",
    "text": "Uluslararası Üyelikler, Paktlar ve Hatay"
  },
  {
    "type": "paragraph",
    "text": "1930''larda İtalya''nın Akdeniz''de ve Habeşistan''da, Almanya''nın ise Avrupa''da yayılmacı bir çizgiye yönelmesi Türkiye''yi hem batı hem doğu sınırlarını güvenceye almaya itti:"
  },
  {
    "type": "table",
    "headers": [
      "Gelişme",
      "Yıl",
      "Katılanlar / Karar",
      "Kritik Sınav Tuzağı"
    ],
    "rows": [
      [
        "Milletler Cemiyeti",
        "1932",
        "Türkiye davet üzerine üye oldu",
        "Başvurmadık; **İspanya** teklif etti, **Yunanistan** destekledi"
      ],
      [
        "Balkan Antantı",
        "1934",
        "**TAYYAR** (Türkiye, Yunanistan, Yugoslavya, Romanya)",
        "**Bulgaristan** (revizyonist) ve Arnavutluk katılmadı"
      ],
      [
        "Montrö Boğazlar Söz.",
        "1936",
        "Boğazlar Komisyonu kalktı; tam Türk egemenliği",
        "20 yıllık imzalandı ama **hala yürürlüktedir**"
      ],
      [
        "Sadabad Paktı",
        "1937",
        "Tahran''da Türkiye, İran, Irak, Afganistan",
        "**Suriye** o tarihte Fransız mandası altında olduğu için yer almadı"
      ]
    ]
  },
  {
    "type": "paragraph",
    "text": "**Hatay Sorunu**nda ise Fransa 1936''da Suriye üzerindeki manda yönetimini sonlandırma kararı alınca Türkiye, Sancak (Hatay) bölgesinin Suriye''ye bırakılmasına karşı çıkarak konuyu Milletler Cemiyeti''ne taşıdı. İsveçli diplomat **Sandler''in hazırladığı Sandler Raporu** doğrultusunda Hatay''a özerklik tanındı (**Bristol** ve **Harbord** raporlarıyla karıştırma). 1938''de kurulan **Bağımsız Hatay Cumhuriyeti**nin ilk ve tek Cumhurbaşkanı **Tayfur Sökmen**, Başbakanı ise **Abdurrahman Melek** oldu. Atatürk''ün hastalığına rağmen Adana ve Mersin''de tatbikat yaptırıp \"Kırk asırlık Türk yurdu düşman elinde esir kalamaz\" ve \"Benim şahsi meselemdir\" dediği Hatay, Atatürk''ün vefatından sonra **1939** yılında kendi meclis kararıyla anavatana katıldı; bu birleşme Türkiye''nin barışçı diplomasiyle sınırlarını genişlettiği tek örnektir."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Dış politikadaki iki güvenlik paktının katılımcılarını karıştırma: **Balkan Antantı**na revizyonist (mevcut sınırları değiştirmek isteyen) politikaları nedeniyle **Bulgaristan** ve İtalya etkisindeki Arnavutluk katılmamıştır. **Sadabad Paktı** ise Türkiye, İran, Irak ve Afganistan arasında doğu sınırlarını korumak için imzalanmıştır; Suriye o dönemde henüz bağımsız bir devlet olmayıp Fransız mandası altında bulunduğu için paktta yer almamıştır. Her iki pakt da yaklaşan II. Dünya Savaşı öncesinde Türkiye''nin bölgesel barış girişimlerinin ürünüdür."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Türkiye''yi Milletler Cemiyeti''ne üyelik için teklif eden devlet hangisidir?\" İngiltere veya Fransa değil, teklifi sunan **İspanya** ve destekleyen **Yunanistan**dır. Türkiye barışçı politikaları sayesinde ilk kez doğrudan davetle üye olan ülkelerden biri olmuştur; bu üyelik aynı zamanda Türkiye''nin uluslararası sistemle bütünleşerek Montrö ve Hatay gibi dosyalarda diplomatik meşruiyet kazanmasını kolaylaştırmıştır."
  },
  {
    "type": "key_points",
    "items": [
      "Yabancı Okullar iç mesele sayılarak çözüldü; 1926 Ankara Antlaşması ile Musul Irak''a bırakıldı.",
      "1930 Mübadele Antlaşması sonrası Yunan lider Venizelos Atatürk''ü 1934''te Nobel Barış Ödülü''ne aday gösterdi.",
      "Balkan Antantı''nda Bulgaristan yoktur; Sadabad Paktı Türkiye, İran, Irak ve Afganistan arasında imzalandı; Montrö ile Boğazlar Komisyonu kaldırıldı.",
      "Hatay''da Sandler Raporu etkili oldu; Cumhurbaşkanı Tayfur Sökmen, Başbakan Abdurrahman Melek''tir (1939''da katıldı)."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": [
      "0e74e46e-8c12-40b6-9db5-24f4ff024bf9",
      "159c32a6-154a-4840-b99e-8955aedae200"
    ]
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
