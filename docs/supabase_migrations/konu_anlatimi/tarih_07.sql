-- =============================================================================
-- 📖 KADRO KONU ANLATIMI — Tarih · Çağdaş Türk ve Dünya Tarihi
-- Kaynak: docs/konu_anlatimi/tarih/07_cagdas_turk_ve_dunya_tarihi.md
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
  'tarih.cagdas_turk_ve_dunya_tarihi.01',
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  1,
  'Bölüm 1: İki Savaş Arası Dünya, Türk Dünyası ve 1929 Buhranı',
  'I.  Dünya Savaşı sonrası kurulan SSCB''de Lenin''in 1924''te ölümünün ardından iktidarı alan Josef Stalin, serbest piyasa esnekliği tanıyan NEP politikasına son verdi; tarımda Kolektifleştirme (Kolhoz) ve beş yıllık ağır sanayi planlarını başlattı.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "I. Dünya Savaşı sonrası kurulan **SSCB**''de Lenin''in 1924''te ölümünün ardından iktidarı alan **Josef Stalin**, serbest piyasa esnekliği tanıyan NEP politikasına son verdi; tarımda **Kolektifleştirme (Kolhoz)** ve beş yıllık ağır sanayi planlarını başlattı. Bu sert devletçi dönüşüm, SSCB''nin 1929 ekonomik krizinden Batılı ülkeler kadar etkilenmemesini sağlarken milyonlarca köylünün ağır bedel ödemesine yol açtı. Kızıl Ordu''nun kurucusu **Troçki** ise Stalin ile giriştiği iktidar mücadelesini kaybederek sürgüne gönderildi."
  },
  {
    "type": "heading",
    "text": "Türkistan ve Türk Dünyası Mücadelesi"
  },
  {
    "type": "paragraph",
    "text": "Çarlık Rusyası''nın yıkılmasından sonra Sovyet yönetiminin Orta Asya üzerindeki baskısını artırmasıyla Türkistan''da bağımsızlık mücadelesi başladı. Bu direnişe **Basmacı Hareketi** adı verildi; yerel direniş önderlerine **Koranbaşı** denirdi (Ergaş Koranbaşı gibi). I. Dünya Savaşı sonrası Türkistan''a geçen **Enver Paşa**, Basmacı Hareketi''nin başına geçerek liderleri birleştirdi ve çarpışırken şehit düştü (Talat Paşa Berlin''de, Cemal Paşa ise Tiflis''te şehit edilmişti). Her ne kadar Basmacı Hareketi Sovyet Kızıl Ordusu karşısında askeri olarak bastırılsa da Türkistan halklarının bağımsızlık bilincini canlı tuttu."
  },
  {
    "type": "paragraph",
    "text": "Türk dünyasının uyanışında dört büyük isim sınavda sıkça karşılaştırılır; her biri eğitim, basın ve siyaset alanlarında kalıcı izler bırakmıştır:"
  },
  {
    "type": "bullets",
    "items": [
      "**İsmail Gaspıralı:** Kırım Bahçesaray''da *Tercüman* gazetesini çıkardı, *Usul-i Cedid* okullarını açtı ve **\"Dilde, fikirde, işte birlik\"** şiarını yaydı.",
      "**Yusuf Akçura:** Kazan Türküdür; *Üç Tarz-ı Siyaset* makalesiyle Türkçülüğün temel metnini yazdı (Ziya Gökalp *Türkçülüğün Esasları*nı yazmıştır).",
      "**Zeki Velidi Togan:** Başkurt milli hükümet başkanı ve *Umumi Türk Tarihine Giriş* eserinin yazarıdır.",
      "**Mehmet Emin Resulzade:** **1918**''de kurulan **Azerbaycan Halk Cumhuriyeti**nin kurucu lideridir (1991 sonrası bağımsızlığın lideri olan **Ebulfez Elçibey** ile karıştırma)."
    ]
  },
  {
    "type": "heading",
    "text": "Meiji, 1929 Buhranı ve Totaliter Rejimler"
  },
  {
    "type": "paragraph",
    "text": "Uzak Doğu''da **1868**''de Japon İmparatoru Mutsuhito''nun başlattığı ve Japonya''yı feodal yapıdan sanayi gücüne taşıyan modernleşme hamlesine **Meiji Restorasyonu** denir (Kültür Devrimi ise Çin''de Mao Zedong tarafından yapılmıştır); bu sayede Japonya 20. yüzyıla Asya''nın en güçlü devleti olarak girdi. Avrupa''da ise kalıcı barışı korumak için imzalanan **1928 Briand-Kellogg Paktı** savaşı ulusal politikanın aracı olmaktan çıkararak kanun dışı saydı (1925 Locarno ise yalnızca Almanya''nın batı sınırlarıyla ilgiliydi)."
  },
  {
    "type": "paragraph",
    "text": "**1929 Dünya Ekonomik Buhranı (Kara Perşembe)** New York Borsası''nın çökmesiyle başlayıp tüm dünyaya yayıldı, işsizliği artırdı, uluslararası ticareti daralttı ve Avrupa''da otoriter rejimlerin güç kazanmasını hızlandırdı. Bu kriz karşısında ABD Başkanı F. D. Roosevelt 1933''te devlet müdahalesini artıran Keynesyen **New Deal (Yeni Düzen)** paketini uyguladı (Marshall Planı 1947''dedir); Türkiye ise döviz kıtlığını aşmak için dış ticarette malın malla değişimine dayalı **Kliring ve Takas** sistemine geçti ve korumacı devletçiliğe yöneldi (**IMF** ise 1944 Bretton Woods ile kurulmuş, Türkiye 1947''de üye olmuştur). Aynı süreçte Avrupa''da faşist İtalya lideri Mussolini Akdeniz''i canlandırmak için **Mare Nostrum (Bizim Deniz)** derken, Hitler 1923 Birahane Darbesi sonrası yazdığı *Kavgam (Mein Kampf)* kitabında Alman ırkı için Doğu Avrupa''ya yayılma doktrini olan **Lebensraum (Hayat Sahası)**nı savundu. İspanya İç Savaşı''ndaki yıkımı ise kübist ressam **Pablo Picasso** 1937 tarihli **Guernica** tablosuyla ölümsüzleştirdi (Salvador Dali ile karıştırma). Tüm bu ideolojik ve ekonomik gerilimler, Versay Antlaşması''nın yarattığı hoşnutsuzlukla birleşerek II. Dünya Savaşı''nın zeminini hazırladı."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Sınavda **1929 Buhranı** ile **II. Dünya Savaşı sonrası (1947)** önlemler karıştırılır: **New Deal** ve **Kliring-Takas** 1929 krizi önlemleridir; **Marshall Planı, Truman Doktrini ve IMF üyeliği** ise II. Dünya Savaşı sonrasına aittir."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Üç Tarz-ı Siyaset eseri kime aittir ve ''Dilde, fikirde, işte birlik'' ilkesini kim savunmuştur?\" İlk sorunun cevabı **Yusuf Akçura**, ikincisinin cevabı **İsmail Gaspıralı**dır. Gaspıralı''nın çıkardığı Tercüman gazetesi ve açtığı Usul-i Cedid okulları, Kırım''dan Türkistan''a kadar bütün Türk dünyasında ortak eğitim ve kültür bilinci oluşturmayı amaçlamıştır."
  },
  {
    "type": "key_points",
    "items": [
      "Stalin NEP''i bitirip Kolhoz''a geçti, Troçki sürgüne gitti; Basmacı Hareketi''nin yerel önderleri Koranbaşı''dır.",
      "Gaspıralı Tercüman, Akçura Üç Tarz-ı Siyaset, Togan Başkurt lideri, Resulzade 1918 Azerbaycan kurucusudur.",
      "Japonya Meiji Restorasyonu (1868), Briand-Kellogg (1928) savaşı kanun dışı saydı; Picasso Guernica''yı çizdi.",
      "İtalya Mare Nostrum, Almanya Hayat Sahası (Lebensraum) politikası izledi; 1929''da ABD New Deal, Türkiye Kliring-Takas ve devletçilik uyguladı."
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
  'tarih.cagdas_turk_ve_dunya_tarihi.02',
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  2,
  'Bölüm 2: II. Dünya Savaşı (1939-1945) ve Türkiye''nin Savaş Yılları',
  'Almanya savaştan önce Avusturya''yı ilhak etmiş (Anschluss) ve Çekoslovakya''nın Südet bölgesini almıştı; ancak II.  Dünya Savaşı resmen 1 Eylül 1939''da Almanya''nın Polonya''ya saldırmasıyla başladı (İngiltere ve Fransa 3 Eylül''de savaş ilan etti).',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Almanya savaştan önce Avusturya''yı ilhak etmiş (**Anschluss**) ve Çekoslovakya''nın Südet bölgesini almıştı; ancak **II. Dünya Savaşı** resmen **1 Eylül 1939**''da Almanya''nın **Polonya**''ya saldırmasıyla başladı (İngiltere ve Fransa 3 Eylül''de savaş ilan etti). Fransa, Almanya sınırına güvenerek inşa ettiği güçlü **Maginot Hattı** savunma sisteminin aşılamayacağını düşünüyordu; ancak Alman ordusu Belçika ve Ardenler üzerinden bu hattı arkadan kuşatarak Fransa''yı hızla işgal etti. İşgal sonrasında teslimiyetçi **Vichy Hükümeti** (Petain) kuruldu; ancak **General Charles de Gaulle** Londra''ya geçerek BBC radyosundan Fransız direnişini yönetti."
  },
  {
    "type": "heading",
    "text": "Savaşın Dönüm Noktaları ve Sonu"
  },
  {
    "type": "paragraph",
    "text": "Savaşın kaderini belirleyen muharebeler Avrupa, Doğu Cephesi ve Pasifik''te Müttefiklerin üstünlüğü ele geçirmesiyle sonuçlandı:"
  },
  {
    "type": "bullets",
    "items": [
      "**Stalingrad Muharebesi (1942-1943):** Sovyet Kızıl Ordusu Alman Mareşal Paulus''u durdurdu ve Almanların genel taarruz inisiyatifi tamamen kırıldı (Kursk ise tarihin en büyük tank savaşıdır).",
      "**Pearl Harbor Baskını (7 Aralık 1941):** Japonya''nın ABD Pasifik filosunu vurmasıyla ABD tarafsızlığı bırakıp savaşa girdi (ABD 6 ay sonra Haziran 1942 Midway''de Japon donanmasını yendi).",
      "**Normandiya Çıkarması (6 Haziran 1944):** Kod adı **Overlord Harekatı**dır; Müttefikler Batı Cephesi''ni açarak Fransa''yı kurtardı ve Almanya''yı iki cephe arasında sıkıştırdı (Meşale Harekatı Kuzey Afrika çıkarmasıdır).",
      "**Atom Bombaları ve Savaş Sonu:** Avrupa''da savaşın bitmesine ve Almanya''nın teslim olmasına karşın Japonya Pasifik''te teslim olmayı reddedince ABD 6 Ağustos 1945''te *Enola Gay* uçağıyla **Hiroşima**''ya (uranyum bombası), 9 Ağustos''ta **Nagazaki**''ye (plütonyum bombası) atom bombası attı (Tokyo yangın bombalarıyla vuruldu). Bu yıkımın ardından Japonya 14 Ağustos''ta teslim oldu ve II. Dünya Savaşı resmen sona erdi."
    ]
  },
  {
    "type": "heading",
    "text": "Konferanslar ve Türkiye''nin İç Politikası"
  },
  {
    "type": "paragraph",
    "text": "Savaş boyunca Müttefik liderler hem savaş stratejisini hem de savaş sonrası dünya düzenini belirlemek için bir dizi konferans düzenledi; Türkiye ise denge politikası izleyerek savaşa fiilen girmekten kaçındı:"
  },
  {
    "type": "table",
    "headers": [
      "Konferans / Olay",
      "Tarih",
      "Temel Karar ve Sınav Tuzağı"
    ],
    "rows": [
      [
        "Adana Yenice Görüşmesi",
        "1943",
        "İnönü ile Churchill tren vagonunda görüştü; Kahire Konferansı daha sonra toplandı"
      ],
      [
        "Yalta Konferansı",
        "1945",
        "1 Mart 1945''e kadar Almanya''ya savaş açanlar BM kurucusu olabilecek"
      ],
      [
        "San Francisco Konferansı",
        "1945",
        "**Birleşmiş Milletler (BM)** resmen kuruldu (Bretton Woods ekonomi, Potsdam Almanya konferansıdır)"
      ],
      [
        "Nürnberg Mahkemeleri",
        "1945-46",
        "Nazi yöneticilerinin insanlığa karşı suçlardan yargılandığı ilk uluslararası ceza mahkemesi"
      ],
      [
        "Paris Barış Antlaşması",
        "1947",
        "İtalya **On İki Ada**''yı (1912''den beri elindeydi) silahsızlandırma şartıyla **Yunanistan**''a bıraktı"
      ]
    ]
  },
  {
    "type": "paragraph",
    "text": "Türkiye savaş boyunca topraklarını korurken olası bir işgal ihtimaline karşı karartma uyguladı, ekmek karnesi dağıttı, Köy Enstitülerini açarak kırsal kalkınmayı destekledi ve ekonomiyi sıkı denetim altına aldı: **1940 Milli Korunma Kanunu** ile hükümete ürünlere narh koyma ve zorunlu çalışma yetkisi verildi. **11 Kasım 1942 Varlık Vergisi** ile savaş zenginlerinden ve tüccarlardan bir defaya mahsus servet vergisi istendi; vergiyi ödeyemeyenler Erzurum **Aşkale** çalışma kampına gönderildi (**Toprak Mahsulleri Vergisi** ise köylüden ayni alınan tarım vergisidir). Türkiye, 1945''te Yalta şartı gereği Almanya ve Japonya''ya kağıt üzerinde savaş ilan ederek BM''nin kurucu üyeleri arasında yerini aldı; böylece savaş dışı kalarak hem insan kaybını önledi hem de savaş sonrası uluslararası sisteme katıldı."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "İki konferans tuzağına dikkat et: **İsrail Devleti**nin kuruluşu 1945 Yalta Konferansı''nda değil; 1947''de BM''de bölünme kararı alınmış, İsrail ise 1948''de kurulmuştur. Ayrıca **On İki Ada**, Trablusgarp''ta İtalya''ya geçici bırakılmıştı; Türkiye''nin itirazlarına rağmen **1947 Paris Antlaşması** ile Yunanistan''a devredilmiştir. Bu gelişme, II. Dünya Savaşı sonrası Ege Denizi''ndeki güç dengesini doğrudan etkilemiştir."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Fransa''nın II. Dünya Savaşı öncesinde Almanya sınırına kurduğu savunma hattı hangisidir ve Fransa kıyılarına yapılan çıkarma hangisidir?\" Savunma hattı **Maginot Hattı**, Fransa kıyılarına yapılan büyük amfibi harekat ise **6 Haziran 1944 Normandiya Çıkarması (Overlord Harekatı)**dır. Normandiya''nın başarısı Avrupa''nın kurtuluşunu ve Almanya''nın teslimini hızlandırmıştır."
  },
  {
    "type": "key_points",
    "items": [
      "Savaş 1 Eylül 1939''da Polonya işgaliyle başladı; de Gaulle Vichy''ye karşı direnişi yönetti.",
      "Doğu''da dönüm noktası Stalingrad, Pasifik''te ABD''yi sokan Pearl Harbor, Batı''yı açan Normandiya (Overlord)''dır.",
      "BM San Francisco''da kuruldu; Yalta''da Türkiye''nin BM kuruculuğu için savaş ilanı şartı kondu; On İki Ada 1947''de Yunanistan''a verildi.",
      "Türkiye''de 1940 Milli Korunma Kanunu ve 1942 Varlık Vergisi (Aşkale) uygulandı; İnönü-Churchill Adana''da görüştü."
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
  'tarih.cagdas_turk_ve_dunya_tarihi.03',
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  3,
  'Bölüm 3: Soğuk Savaş Dönemi ve Bloklaşma (1945-1960)',
  'II.  Dünya Savaşı sonrasında ABD önderliğindeki Batı (Kapitalist) Bloku ile SSCB önderliğindeki Doğu (Sosyalist) Bloku arasında sıcak çatışmaya dönüşmeyen ancak ideolojik, ekonomik, askeri ve teknolojik rekabete dayalı Soğuk Savaş başladı.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "II. Dünya Savaşı sonrasında ABD önderliğindeki Batı (Kapitalist) Bloku ile SSCB önderliğindeki Doğu (Sosyalist) Bloku arasında sıcak çatışmaya dönüşmeyen ancak ideolojik, ekonomik, askeri ve teknolojik rekabete dayalı **Soğuk Savaş** başladı. SSCB''nin Boğazlar''dan üs, Kars ve Ardahan''dan toprak talep etmesi üzerine Türkiye güvenliğini sağlamak için Batı Bloku''na yaklaştı. Winston Churchill, 1946''da ABD''nin Fulton kentinde yaptığı konuşmada Sovyet etkisindeki Doğu Avrupa''yı tanımlamak için **\"Demir Perde\"** kavramını kullandı (**Berlin Duvarı** ise çok sonra, 1961''de inşa edilmiştir!)."
  },
  {
    "type": "heading",
    "text": "Batı Bloku, NATO ve 1953 Balkan Paktı"
  },
  {
    "type": "bullets",
    "items": [
      "**Truman Doktrini (12 Mart 1947):** ABD''nin Sovyet yayılmasını durdurmak (**Çevreleme Politikası**) amacıyla doğrudan **Türkiye ve Yunanistan**''a 400 milyon dolarlık askeri ve mali yardım sağladığı ilk belgedir; bu adımla ABD yalnızcılık politikasını (Monroe Doktrini) tamamen terk ederek Avrupa güvenliğinde başrolü üstlendi.",
      "**Marshall Planı (Haziran 1947):** Truman''dan farklı olarak tüm savaş mağduru Avrupa ülkelerine yönelik ekonomik kalkınma paketidir; Türkiye bu yardımla özellikle tarım, madencilik ve karayolu ulaşımında yatırımlar yaptı.",
      "**NATO (1949) ve Kore Savaşı:** Türkiye, Sovyet tehdidine karşı NATO''ya girmek istediyse de İngiltere ve İskandinav ülkeleri önce karşı çıktı. Bunun üzerine Türkiye 1950''de **Kore Savaşı**''na asker gönderdi; Türk Tugayı''nın **Kunuri Muharebeleri**ndeki başarısı ve fedakarlığı sonrasında Türkiye ve **Yunanistan** **18 Şubat 1952**''de eş zamanlı olarak NATO''ya kabul edildi. Böylece Türkiye Batı güvenlik şemsiyesi altına girmiş oldu.",
      "**1953 Balkan Paktı (Ankara Antlaşması):** Sovyet baskısına karşı **Türkiye, Yunanistan ve Yugoslavya** arasında imzalandı; 1954''te Bled İttifakı ile askeri ittifaka dönüştü ancak Kıbrıs sorununun çıkması ve Yugoslavya''nın SSCB ile ilişkilerini yumuşatmasıyla işlevini yitirdi (Atatürk dönemindeki 1934 **Balkan Antantı** ile karıştırma!)."
    ]
  },
  {
    "type": "heading",
    "text": "Doğu Bloku Kurumları, Uzay Yarışı ve Bağdat Paktı"
  },
  {
    "type": "paragraph",
    "text": "Doğu Bloku kurumlarının işlevlerini birbirine karıştırmamalısın: **Kominform** komünist partiler arasındaki **ideolojik** birliktir, **Komekon** Marshall Planı''na karşı kurulan **ekonomik** yardımlaşma örgütüdür, **Varşova Paktı (1955)** ise NATO''ya karşı kurulan **askeri** savunma ittifakıdır. Bu üç kurum aracılığıyla Sovyetler Birliği Doğu Avrupa ülkelerini hem siyaseten hem iktisaden hem de askeri olarak sıkı denetim altında tuttu. Yugoslavya lideri **Mareşal Tito** ise Sovyet uydusu olmayı reddedince 1948''de Kominform''dan ihraç edildi ve Doğu Bloku''ndan kopan ilk ülke oldu; ardından Türkiye ve Yunanistan ile 1953 Balkan Paktı''na yöneldi."
  },
  {
    "type": "paragraph",
    "text": "Uzay yarışında ilk büyük adımı ABD değil, **SSCB** attı: 3 Kasım **1957**''de fırlatılan **Sputnik 2** uydusuyla uzaya gönderilen ilk canlı, Sovyet sokak köpeği **Laika** oldu (maymun veya ABD yapımı değildir!). Ardından 1961''de Yuri Gagarin uzaya çıkan ilk insan oldu; ABD ise 1969''da Apollo 11 ile Ay''a ayak basarak yarışı dengeledi. Ortadoğu''da ise 1955''te Demokrat Parti döneminde Sovyetlerin güneye inmesini önlemek için Türkiye ve Irak öncülüğünde **Bağdat Paktı** kuruldu (İngiltere, İran ve Pakistan da katıldı); 1958 darbesiyle Irak pakttan ayrılınca örgütün merkezi Ankara''ya taşındı ve adı **CENTO** oldu (**1937 Sadabad Paktı** Atatürk dönemindedir, karıştırma!). Bu ittifakların tamamı Türkiye''nin Soğuk Savaş''ın ilk döneminde Batı güvenlik mimarisi içinde aktif rol aldığını gösterir."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM Soğuk Savaş''ta üç eşleştirmeyi sürekli ters sorar: 1. İlk **askeri** yardım belgesi **Truman Doktrini**, genel Avrupa **ekonomik** yardımı **Marshall Planı**dır. 2. **Kominform** ideolojik, **Komekon** ekonomik, **Varşova Paktı** askeri örgüttür. 3. Türkiye NATO''ya tek başına değil, **Yunanistan ile birlikte 1952''de** girmiştir; **1953 Balkan Paktı** ise 1934 Balkan Antantı''ndan farklı olarak Türkiye, Yunanistan ve Yugoslavya arasında kurulmuştur."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Doğu Bloku''ndan Kominform''dan ihraç edilerek ilk kopan ülke hangisidir?\" Cevap: Mareşal Tito liderliğindeki **Yugoslavya**dır; Tito aynı zamanda 1953 Balkan Paktı''nda da yer almıştır ve Bağlantısızlar Hareketi''nin kurucu önderlerinden biri olmuştur."
  },
  {
    "type": "key_points",
    "items": [
      "Churchill 1946''da \"Demir Perde\" dedi (Berlin Duvarı 1961''dedir); Truman askeri/mali, Marshall ekonomik yardımdır.",
      "Türkiye Kore''deki Kunuri başarısı sonrası 1952''de Yunanistan''la birlikte NATO''ya girdi; 1953 Balkan Paktı Türkiye-Yunanistan-Yugoslavya arasında kuruldu.",
      "Kominform ideolojik, Komekon ekonomik, Varşova Paktı askeridir; Sputnik 2 ile uzaya giden ilk canlı Sovyet köpeği Laika''dır.",
      "1955 Bağdat Paktı DP dönemindedir; Irak çıkınca merkezi Ankara''ya taşındı ve CENTO adını aldı."
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
  'tarih.cagdas_turk_ve_dunya_tarihi.04',
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  4,
  'Bölüm 4: Demokrat Parti Dönemi ve Çok Partili Siyaset (1945-1960)',
  'II.  Dünya Savaşı sonrası dünyada yükselen demokratikleşme rüzgarı, Birleşmiş Milletler Sözleşmesi''nin getirdiği çok partili yaşam beklentisi ve Türkiye''nin Batı Bloku ile bütünleşme arzusu, tek parti döneminden çok partili hayata geçişi hızlandırdı.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "II. Dünya Savaşı sonrası dünyada yükselen demokratikleşme rüzgarı, Birleşmiş Milletler Sözleşmesi''nin getirdiği çok partili yaşam beklentisi ve Türkiye''nin Batı Bloku ile bütünleşme arzusu, tek parti döneminden çok partili hayata geçişi hızlandırdı. 1945''te Nuri Demirağ öncülüğünde Milli Kalkınma Partisi''nin kurulmasının ardından asıl büyük siyasi kırılma CHP içinden doğdu. Çiftçiyi Topraklandırma Kanunu görüşmeleri sırasında parti içi muhalefet belirginleşti ve CHP içindeki dört milletvekilinin (**C-A-F-R**: **C**elal Bayar, **A**dnan Menderes, **F**uat Köprülü, **R**efik Koraltan) parti içi demokrasi, anayasaya aykırı yasaların kaldırılması ve serbest seçim talep ederek verdiği **Dörtlü Takrir** önergesi reddedilince bu isimler partiden ayrılıp **7 Ocak 1946**''da **Demokrat Parti (DP)**yi kurdular (**Takrir-i Sükun** 1925 kanunudur, karıştırma!)."
  },
  {
    "type": "paragraph",
    "text": "1946 seçimleri iktidar kaygısıyla öne çekilip açık oy-gizli sayım usulüyle yapıldığı için muhalefetin tepkisini çekti ve **\"sopalı seçimler\"** olarak anıldı. Bu dönemde CHP içindeki yenilikçi kanat da seçim güvenliğinin artırılmasını savundu. Bu eleştiriler üzerine 1950 seçimleri öncesinde gizli oy-açık sayım, tek dereceli seçim ve Yüksek Seçim Kurulu aracılığıyla yargı denetimi ilkeleri kabul edilerek demokratik yarışın önü açıldı."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM \"Dörtlü Takrir''i veren ve DP''yi kuran dört kurucu\" arasına mutlaka **Mareşal Fevzi Çakmak**ı çeldirici olarak koyar. Fevzi Çakmak 1946''da DP listesinden bağımsız milletvekili seçilmiş, ancak **Dörtlü Takrir imzacıları ve DP''nin kurucu dörtlüsü arasında yer almamıştır** (daha sonra 1948''de kurulan Millet Partisi''nin kurucu onursal başkanı olmuştur)."
  },
  {
    "type": "heading",
    "text": "1950 Beyaz İhtilali ve DP İktidarı"
  },
  {
    "type": "paragraph",
    "text": "**14 Mayıs 1950** genel seçimlerinde iktidarın kansız, barışçıl ve demokratik bir sandık değişimiyle CHP''den Demokrat Parti''ye geçmesi Türk siyasi tarihinde **\"Beyaz İhtilal\"** olarak adlandırıldı (**Kadife Devrim** ise 1989''da Çekoslovakya''daki barışçıl rejim değişimidir!). Cumhurbaşkanlığına **Celal Bayar**, Başbakanlığa ise **Adnan Menderes** getirildi. Böylece 27 yıllık kesintisiz CHP iktidarı demokratik seçimlerle devredilmiş ve Türkiye''de ilk kez barışçıl bir iktidar değişimi yaşanmış oldu. Bu değişim, çok partili demokratik düzenin sandık yoluyla işleyebildiğini göstermesi açısından Cumhuriyet tarihinde bir dönüm noktasıdır."
  },
  {
    "type": "paragraph",
    "text": "DP iktidarının ilk yıllarında Marshall yardımları, Kore Savaşı''nın yarattığı tarım talebi ve tarımda makineleşmenin etkisiyle hızlı bir ekonomik büyüme yaşandı; demiryolu ağırlıklı politikadan karayolu yapımına ve özel sektör teşvikine geçildi. DP hükümetinin mecliste gerçekleştirdiği **1 numaralı ilk icraat**, 1932''den beri yalnızca Türkçe okunan **ezanın Arapça aslıyla okunmasını serbest bırakan** kanunu (CHP''nin de oylarıyla) çıkarmak oldu. Ayrıca 1951''de **Atatürk Aleyhine İşlenen Suçlar Hakkında Kanun** çıkarıldı, Köy Enstitüleri öğretmen okullarına dönüştürüldü, Halkevleri kapatıldı ve Atatürk''ün naaşı 10 Kasım 1953''te Anıtkabir''e nakledildi. Aynı dönemde dış politikada NATO üyeliği, Balkan Paktı ve Bağdat Paktı gibi Batı yanlısı ittifaklara aktif katılım sağlandı; ayrıca 1954''te Türkiye Petrolleri Anonim Ortaklığı (TPAO) ve Vakıflar Bankası gibi önemli ekonomik kurumlar kuruldu. Dönemin en ağır iç bunalımlarından biri ise Kıbrıs meselesinin tırmandığı ortamda yaşanan ve İstanbul''daki gayrimüslim işyerlerinin tahrip edildiği **6-7 Eylül 1955 Olayları**dır. 1950''lerin sonuna doğru döviz darlığı, enflasyon, Tahkikat Komisyonu tartışmaları ve iktidar-muhalefet gerilimi arttı; bu süreç 27 Mayıs 1960 askeri müdahalesine giden yolu açtı ve 1961 Anayasası ile yeni bir döneme geçildi; bu anayasa ile temel haklar genişletilirken çift meclisli yapıya ve Anayasa Mahkemesi''ne geçildi."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"1950 seçimlerinde iktidarın demokratik yolla el değiştirmesine ne ad verilir ve DP''nin ilk icraatı nedir?\" Cevap: **Beyaz İhtilal** ve **ezanın Arapça okunma yasağının kaldırılması**dır. 1950 seçimleri aynı zamanda gizli oy-açık sayım ilkesinin uygulandığı ilk genel seçim olması bakımından da dönüm noktasıdır; 1946 seçimleri ise açık oy-gizli sayım tartışmaları nedeniyle sopalı seçim olarak anılmıştır. Bu dönüşüm Türk demokrasisinin çok partili işleyişini kalıcılaştırmıştır."
  },
  {
    "type": "key_points",
    "items": [
      "DP''nin kurucuları Dörtlü Takrir''i veren Celal Bayar, Adnan Menderes, Fuat Köprülü ve Refik Koraltan''dır (Fevzi Çakmak kurucu dörtlüde yok).",
      "1950 iktidar değişimi \"Beyaz İhtilal\"dir (Kadife Devrim Çekoslovakya''dadır); ilk kez gizli oy-açık sayım ve yargı denetimi uygulandı.",
      "DP''nin ilk icraatı ezanın Arapça aslıyla okunmasını serbest bırakmaktır; 6-7 Eylül 1955 Olayları Kıbrıs geriliminde yaşandı ve dönemin iç siyasetini sarstı."
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
  'tarih.cagdas_turk_ve_dunya_tarihi.05',
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  5,
  'Bölüm 5: Yumuşama (Detant) Dönemi ve Kıbrıs Sorunu',
  '1960''lardan itibaren süper güçler arasındaki nükleer dehşet dengesi, doğrudan çatışma yerine sınırlı işbirliği ve diyalog dönemini (Yumuşama / Detant) başlattı.  Sömürgeciliğe karşı iki bloktan da bağımsız üçüncü bir yol arayan Asya ve Afrika ülkeleri 1955 Bandung Konferansında barış içinde bir arada yaşama ilkelerini (Pancasila) belirledi ve 1961 Belgrad Zirvesiyle Bağlantısızlar Hareketi resmen kuruldu (Tito, Nasır, Nehru).',
  4,
  '[
  {
    "type": "paragraph",
    "text": "1960''lardan itibaren süper güçler arasındaki nükleer dehşet dengesi, doğrudan çatışma yerine sınırlı işbirliği ve diyalog dönemini (**Yumuşama / Detant**) başlattı. Sömürgeciliğe karşı iki bloktan da bağımsız üçüncü bir yol arayan Asya ve Afrika ülkeleri **1955 Bandung Konferansı**nda barış içinde bir arada yaşama ilkelerini (**Pancasila**) belirledi ve **1961 Belgrad Zirvesi**yle **Bağlantısızlar Hareketi** resmen kuruldu (Tito, Nasır, Nehru)."
  },
  {
    "type": "paragraph",
    "text": "1962 **Küba Füze Krizi**nde dünya nükleer savaşın eşiğine geldi; ABD ile SSCB arasındaki gizli pazarlık sonucunda SSCB Küba''daki füzeleri sökerken ABD de Türkiye''de (İzmir Çiğli) konuşlu **Jüpiter Füzeleri**ni söktü. Bu olay Türkiye''nin dış politikada tek taraflı ABD bağımlılığını sorgulamasına ve çok yönlü diplomasi arayışına yönelmesine neden oldu. **1973 Petrol Krizi** ise Arap-İsrail (Yom Kippur) Savaşı sırasında OAPEC''in petrolü siyasi silah olarak kullanmasıyla ortaya çıktı ve dünya ekonomisinde durgunluğa yol açtı (1979 krizi İran Devrimi kaynaklıdır). Bloklar arası güvenlik ve insan hakları alanında **1975 Helsinki Nihai Senedi** imzalanarak **AGİK** (1994 Budapeşte Zirvesi''nde **AGİT**) kuruldu. Ortadoğu''da ise Mısır lideri **Enver Sedat** ile İsrail Başbakanı Begin''in imzaladığı **1978 Camp David Sözleşmesi** sonucunda **İsrail''i tanıyan ilk Arap devleti Mısır** oldu (ikincisi 1994''te Ürdün''dür)."
  },
  {
    "type": "heading",
    "text": "Kıbrıs Davası, Johnson Mektubu ve Barış Harekatı"
  },
  {
    "type": "paragraph",
    "text": "Kıbrıs''ta Rumların adayı Yunanistan''a bağlama (Enosis) çabalarına karşı Türk toplumunun varoluş mücadelesinde ilk toplum lideri **Dr. Fazıl Küçük**, Türk Mukavemet Teşkilatı''nın (TMT) **\"Toros\"** kod adlı lideri ise **Rauf Denktaş**tı. 1959 Zürih ve Londra Antlaşmaları ile kurulan ortak Kıbrıs Cumhuriyeti, Rumların 1963 \"Kanlı Noel\" saldırılarıyla fiilen çöktü. 1964''te Türkiye müdahale kararı alınca ABD Başkanı Lyndon Johnson, **Haziran 1964 Johnson Mektubu**nu göndererek Amerikan silahlarının kullanılmasına izin vermedi. Başbakan **İsmet İnönü** bu şantaja **\"Yeni bir dünya kurulur, Türkiye de orada yerini alır\"** sözleriyle yanıt verdi. Aynı yıl **Yüzbaşı Cengiz Topel** Kıbrıs semalarında düşerek ilk hava şehidimiz oldu."
  },
  {
    "type": "paragraph",
    "text": "**20 Temmuz 1974 Kıbrıs Barış Harekatı** ise adada Yunanistan destekli Nikos Sampson darbesinin gerçekleşmesi üzerine **CHP-MSP koalisyonu** döneminde Başbakan **Bülent Ecevit** ve Başbakan Yardımcısı **Necmettin Erbakan** hükümeti tarafından gerçekleştirildi (**1959-1960 Zürih-Londra Antlaşmaları** Adnan Menderes dönemindedir!). Türkiye, Zürih ve Londra antlaşmalarının kendisine verdiği garantörlük hakkını kullanarak adaya müdahale etti; Cenevre görüşmeleri tıkanınca Dışişleri Bakanı **Turan Güneş**''in kızı Ayşe''ye atıfla çektiği **\"Ayşe tatile çıksın\"** parolasıyla II. Harekat başlatıldı. Harekat sonrası uygulanan ABD silah ambargosu ise Türkiye''de **ASELSAN** gibi milli savunma sanayii kuruluşlarının temellerinin atılmasını hızlandırdı. **1983**''te kurulan **Kuzey Kıbrıs Türk Cumhuriyeti (KKTC)**nin kurucu ilk Cumhurbaşkanı **Rauf Denktaş** oldu."
  },
  {
    "type": "paragraph",
    "text": "Aynı yıllarda yurtdışında 40''a yakın Türk diplomatını şehit eden Ermeni terör örgütü **ASALA**ya karşı mücadele verildi (**EOKA** ise Kıbrıs''taki Rum terör örgütüdür). 1980''lerde güvenlik güçlerinin kararlı operasyonları sayesinde ASALA''nın eylem kapasitesi tamamen kırıldı ve Türkiye uluslararası terörle mücadelede kararlı bir duruş sergiledi."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM Kıbrıs tarihinde üç ismi ve dönemi ters eşleştirir: - Zürih ve Londra Antlaşmaları (1959-1960) **Menderes**, Johnson Mektubu (1964) **İnönü**, Barış Harekatı (1974) **Ecevit-Erbakan** dönemindedir. - İlk toplum lideri **Dr. Fazıl Küçük**, 1983 KKTC''nin ilk Cumhurbaşkanı **Rauf Denktaş**tır. - Türk diplomatlarını hedef alan Ermeni örgütü **ASALA**, Kıbrıs''taki Rum örgütü **EOKA**dır."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Küba Füze Krizi''nde Türkiye''den sökülen füze hangisidir ve İsrail''i tanıyan ilk Arap devleti kimdir?\" Türkiye''den sökülen füze **Jüpiter**, İsrail''i Camp David ile tanıyan ilk Arap devleti **Mısır**dır. Aynı dönemde ABD-SSCB arasında stratejik silahların sınırlandırılması için imzalanan SALT antlaşmaları da Yumuşama döneminin önemli diplomatik adımlarıdır."
  },
  {
    "type": "key_points",
    "items": [
      "Bağlantısızların fikri 1955 Bandung''da doğdu, 1961 Belgrad''da kuruldu; Küba kriziyle Türkiye''den Jüpiter füzeleri söküldü.",
      "1975 Helsinki Senedi ile AGİK (AGİT) kuruldu; Camp David (1978) ile İsrail''i tanıyan ilk Arap devleti Mısır oldu.",
      "1964 Johnson Mektubu''na İnönü yanıt verdi; ilk hava şehidi Cengiz Topel''dir; 1974 Barış Harekatı Ecevit-Erbakan döneminde \"Ayşe tatile çıksın\" parolasıyla yapıldı.",
      "1983 KKTC ilk Cumhurbaşkanı Rauf Denktaş''tır; diplomatlarımızı hedef alan örgüt ASALA''dır."
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
  'tarih.cagdas_turk_ve_dunya_tarihi.06',
  'Tarih',
  'Çağdaş Türk ve Dünya Tarihi',
  6,
  'Bölüm 6: Küreselleşen Dünya, SSCB''nin Dağılması ve Türk Dünyası',
  '1980''lerin sonunda Sovyetler Birliği''ni içinde bulunduğu ağır ekonomik durgunluktan, Afganistan yenilgisinin yarattığı yıpranmadan, Çernobil felaketinin sarsıntısından ve siyasi kr',
  4,
  '[
  {
    "type": "paragraph",
    "text": "1980''lerin sonunda Sovyetler Birliği''ni içinde bulunduğu ağır ekonomik durgunluktan, Afganistan yenilgisinin yarattığı yıpranmadan, Çernobil felaketinin sarsıntısından ve siyasi krizden kurtarmak isteyen **Mihail Gorbaçov**, iki temel reform başlattı:"
  },
  {
    "type": "bullets",
    "items": [
      "**Glasnost:** Siyasi ve toplumsal yaşamda **açıklık ve şeffaflık** (basın ve ifade özgürlüğü üzerindeki sansürün gevşetilmesi).",
      "**Perestroyka:** Ekonomik ve kurumsal **yeniden yapılanma** (merkezi planlamanın esnetilmesi)."
    ]
  },
  {
    "type": "paragraph",
    "text": "Ancak bu reformlar Sovyet sisteminin çözülmesini durdurmak yerine hızlandırdı; Doğu Avrupa''daki uydu devletlerde tek parti yönetimleri birer birer çöktü, 1989''da Berlin Duvarı yıkıldı, Varşova Paktı dağıldı ve **1991**''de SSCB resmen dağılarak iki kutuplu Soğuk Savaş düzeni sona erdi. Bu dağılma, Kafkasya ve Orta Asya''daki Türk cumhuriyetlerinin (Azerbaycan, Kazakistan, Kırgızistan, Özbekistan, Türkmenistan) bağımsızlıklarını kazanmasını sağladı ve Türkiye için Balkanlardan Orta Asya''ya uzanan yeni bir dış politika ufku açtı. Aynı dönemde Avrupa''da 1992 Maastricht Antlaşması ile Avrupa Birliği kurularak ekonomik ve siyasi bütünleşme yeni bir aşamaya taşındı; eski Doğu Bloku ülkelerinin bir kısmı da NATO ve AB''ye yöneldi."
  },
  {
    "type": "heading",
    "text": "Bosna-Hersek, Azerbaycan ve Türk Dünyası Kurumları"
  },
  {
    "type": "paragraph",
    "text": "Soğuk Savaş sonrası dönemde Balkanlar ve Kafkasya''da yaşanan çatışmalar bölgesel istikrarı derinden etkiledi. Yugoslavya''nın kanlı biçimde parçalanması sürecinde Sırp saldırılarına ve etnik temizliğe karşı Bosna-Hersek halkının bağımsızlık mücadelesine önderlik eden, *Doğu ve Batı Arasında İslam* eserinin yazarı ve bağımsız Bosna-Hersek''in ilk Cumhurbaşkanı **\"Bilge Kral\" Aliya İzzetbegoviç**tir. 1995 Dayton Antlaşması ile Bosna-Hersek''in bağımsızlığı uluslararası alanda tanındı; ancak bölgedeki etnik gerilimlerin sürmesi üzerine NATO ve uluslararası barış güçleri istikrarı korumak için görev aldı."
  },
  {
    "type": "paragraph",
    "text": "Kafkasya''da **Azerbaycan** 1991''de bağımsızlığını ilan ettiğinde ilk cumhurbaşkanı Ayaz Muttalibov oldu; hemen ardından **1992**''de demokratik seçimle başa geçen Azerbaycan Halk Cephesi lideri ve Rus ordusunu Azerbaycan''dan çıkaran milli önder ise **Ebulfez Elçibey**dir (sonrasında Haydar Aliyev cumhurbaşkanı olmuştur). Bu süreçte yaşanan Karabağ işgali ve Hocalı Katliamı ise Kafkasya''daki en ağır insani trajedi olarak tarihe geçti. Türkiye, bağımsızlığını kazanan tüm Türk cumhuriyetlerini tanıyan ilk ülke olarak bölgede eğitim, kültür, medya ve ekonomik işbirliği kurumları oluşturdu; bu işbirliği enerji ve ulaşım koridorlarıyla (Bakü-Tiflis-Ceyhan gibi) stratejik ortaklığa dönüştü. Ayrıca Avrupa ile bütünleşme sürecinde Türkiye 1996''da Gümrük Birliği''ne girdi ve 1999 Helsinki Zirvesi''nde Avrupa Birliği''ne aday ülke statüsü kazandı."
  },
  {
    "type": "callout",
    "kind": "mnemonic",
    "text": "Soğuk Savaş sonrası Türk dünyası kurumlarını işlevlerine göre ayırt et: - **TİKA (1992):** Türk İşbirliği ve Koordinasyon Ajansı — Okul, hastane, restorasyon ve **kalkınma/teknik yardım** projeleri yürütür. - **TÜRKSOY (1993):** Uluslararası Türk Kültürü Teşkilatı — Ortak **kültür ve sanat** işbirliği örgütüdür. - **Türk Devletleri Teşkilatı:** Eski adı Türk Dili Konuşan Ülkeler İşbirliği Konseyi (**Türk Konseyi**) olan siyasi-ekonomik entegrasyon örgütüdür."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "ÖSYM iki eşleştirmeyi çok sever: **Glasnost** (açıklık) ile **Perestroyka** (yeniden yapılanma) kavramlarının anlamlarını ters verir; ayrıca **1918** ilk Azerbaycan Cumhuriyeti lideri **Mehmet Emin Resulzade** ile **1992** bağımsız Azerbaycan''ın seçilmiş milli lideri **Ebulfez Elçibey**i aynı şıklarda karşılaştırır. Ayrıca Bosna-Hersek lideri Aliya İzzetbegoviç''i Sırp veya Hırvat liderlerle karıştırmamalısın; oysa Dayton Antlaşması sürecinde Bosna''nın bağımsızlığını savunan lider odur. Aynı şekilde 1990 sonrası süreçte Orta Asya''da Kazakistan (Nursultan Nazarbayev) ve diğer Türk cumhuriyetleri de bağımsız devletler olarak uluslararası sisteme katılmıştır."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "Soru mantığı: \"Türk cumhuriyetlerinde okul, hastane ve teknik kalkınma projeleri yürüten kuruluş hangisidir?\" Kültür-sanat örgütü olan TÜRKSOY değil, teknik ve kalkınma ajansı **TİKA (1992)**dır. Ortak alfabe, kültürel miras ve sanat etkinlikleri ise TÜRKSOY''un görev alanına girer. Küreselleşme sürecinde bu kurumlar Türkiye''nin yumuşak güç kapasitesini artırmıştır; TİKA''nın günümüzde pek çok kıtada kalkınma ve insani yardım projeleri yürütmesi de bunun en somut göstergesidir."
  },
  {
    "type": "key_points",
    "items": [
      "Gorbaçov''un Glasnost''u açıklık/şeffaflık, Perestroyka''sı ise ekonomik-kurumsal yeniden yapılanmadır; 1991''de SSCB dağıldı.",
      "\"Bilge Kral\" Aliya İzzetbegoviç Bosna-Hersek''in ilk Cumhurbaşkanıdır; Ebulfez Elçibey 1992''de seçilen Azerbaycan lideridir.",
      "TİKA (1992) teknik ve kalkınma yardımı, TÜRKSOY (1993) kültür-sanat, Türk Devletleri Teşkilatı (eski Türk Konseyi) ise bölgesel entegrasyon kurumudur.",
      "SSCB''nin dağılmasının ardından Türkiye, Türk dünyasıyla hem enerji-ulaşım koridorları hem de ortak kurumlar aracılığıyla çok boyutlu işbirliği kurmuştur; ayrıca 1996''da Avrupa Birliği ile Gümrük Birliği''ne girmiştir."
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
