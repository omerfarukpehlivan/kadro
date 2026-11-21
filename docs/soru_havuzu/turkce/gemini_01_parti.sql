-- ==========================================================================
-- KADRO SORU HAVUZU · KPSS GY Türkçe · GEMİNİ PARTİ 1 (30 soru, Paragrafta Anlam ve Yapı) · SUPABASE SQL
-- exam_scopes: lisans_gygk · education_level: lisans · Özgün üretim
-- Kullanıcı onayı bekliyor
-- ==========================================================================

insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  exam_scopes,
  education_level
) values
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Orta Çağ''dan kalma pek çok katedralin pencerelerindeki camların alt kenarının üst kenarından kalın olması, yıllarca camın oda sıcaklığında bile çok yavaş akan bir sıvı olduğunun kanıtı sayıldı. Oysa fizik hesapları, camın o sıcaklıkta gözle görülür biçimde akması için evrenin yaşından katbekat uzun bir süre gerektiğini gösteriyor. Asıl neden, eski cam ustalarının üfleme ve döndürme tekniğiyle döktükleri levhaların bir ucunun kalın kalması ve ustaların ağırlığı dengelemek için kalın kenarı bilerek alta yerleştirmesidir.

Bu parçada asıl vurgulanmak istenen aşağıdakilerden hangisidir?',
  '{"options":["Orta Çağ ustalarının kullandığı camların dayanıklılık bakımından günümüz camlarından üstün olduğu","Fiziksel ölçümlerin tarihî yapıların korunmasında her zaman belirleyici rol oynadığı","Tarihî camlardaki kalınlık farkının maddenin akışından değil, bilinçli üretim ve yerleştirme tercihinden doğduğu","Camın katı hâldeyken bile yüksek basınç altında biçim değiştirebildiği","Eski yapılardaki mimari kusurların çoğunlukla yanlış malzeme seçiminden kaynaklandığı"],"correctIndex":2}'::jsonb,
  'Parça, tarihî camların altının kalın olmasının "camın akması" efsanesiyle açıklandığını ancak fizik hesaplarının bunu çürüttüğünü, gerçek nedenin eski üretim tekniği ve ustaların kalın kenarı alta koyma tercihi olduğunu anlatır.',
  'Parçanın başında "camın oda sıcaklığında bile çok yavaş akan bir sıvı olduğunun kanıtı sayıldı" ifadesi yer aldığı için aday camın akışkanlığına odaklanan şıklara yönelebilir. Oysa yazar bu yaygın inanışı "Oysa" diyerek reddeder ve gerçek nedeni üretim/yerleştirme tercihine bağlar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Uzun yıllar boyunca bataklıklar ve sazlıklar, yalnızca sivrisinek üreten ve tarıma açılması gereken verimsiz alanlar olarak görüldü. Bu anlayışla kurutulan sulak alanların ardından yalnızca göçmen kuşların uğrak yerleri kaybolmadı; aşırı yağışları sünger gibi tutan doğal taşkın tamponları da ortadan kalktı. Üstelik bu alanların yok olması, yer altı sularının beslenme hızını düşürerek çevredeki tarım arazilerini kuraklığa daha açık hâle getirdi.

Bu parçadan aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Yer altı sularının beslenmesi, bölgedeki sulak alanların varlığıyla ilişkilidir.","Bataklıklar, geçmişte işlevsiz ve verimsiz alanlar olarak değerlendirilmiştir.","Sulak alanlar, taşkın riskini azaltmada doğal bir görev üstlenmektedir.","Sulak alanların yok olması, birden fazla canlı grubunu ve su döngüsünü etkiler.","Sulak alanların kurutulması, tarımsal verimliliği her koşulda artırmıştır."],"correctIndex":4}'::jsonb,
  'Parça, sulak alanların tarıma açılmak amacıyla kurutulduğunu ancak bunun çevredeki tarım arazilerini kuraklığa daha açık hâle getirdiğini belirtir. Dolayısıyla kurutmanın tarımsal verimliliği her koşulda artırdığı yargısı parçayla çelişir.',
  '"Tarıma açılması gereken" ifadesi, kurutma işleminin tarıma kesin yarar sağladığı izlenimi yaratabilir. Ancak son cümle, bunun tam tersine tarım arazilerini kuraklık riskine açık bıraktığını vurgular.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Bir bölgenin ekonomisini tek bir tarım ürününe bağlamak, kısa vadede uzmanlaşma ve yüksek verim sağlayabilir. ....... Çünkü küresel pazardaki ani bir fiyat düşüşü ya da o ürüne özgü bir bitki hastalığı, bölgedeki bütün hanelerin gelirini aynı anda sarsar. Bu yüzden ürün çeşitliliği, kârlılığı biraz düşürse bile kırsal ekonominin sigortasıdır.

Bu parçada boş bırakılan yere düşüncenin akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["Bu nedenle tek ürünlü tarım modeli tüm bölgelerde yaygınlaştırılmalıdır.","Uzmanlaşma arttıkça ürün çeşitliliğine duyulan ihtiyaç da ortadan kalkar.","Bitki hastalıkları, yalnızca birden fazla ürün yetiştirilen alanlarda görülür.","Küresel fiyat dalgalanmaları, yerel üreticilerin gelirini hiçbir zaman etkilemez.","Ancak bu yoğunlaşma, bölgeyi dış şoklara karşı son derece kırılgan bırakır."],"correctIndex":4}'::jsonb,
  'Boşluktan sonraki "Çünkü" cümlesi, fiyat düşüşünün veya bitki hastalığının bütün hanelerin gelirini aynı anda sarstığını anlatır. Bu olumsuz sonucu gerekçelendiren ifade, tek ürüne yoğunlaşmanın bölgeyi dış şoklara karşı kırılgan bıraktığını belirten seçenektir.',
  'İlk cümlede uzmanlaşma ve yüksek verim gibi olumlu sonuçlar anıldığı için aday tek ürünlü modeli destekleyen bir devam arayabilir. Oysa boşluktan sonraki gerekçe cümlesi ve son cümle, tek ürün bağımlılığının riskini ortaya koyar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'I. Bu nedenle yapay zekâ araçlarının adil çalışması, algoritmanın karmaşıklığından çok, beslendiği verinin niteliğini denetlemeye bağlıdır.
II. Karar destek yazılımlarının insan ön yargılarından tamamen arınmış olduğu düşünülür.
III. Ne var ki bu yazılımlar, öğrenme sürecinde geçmişte insanlar tarafından üretilmiş kayıtları temel alır.
IV. Geçmiş kayıtlarda belirli gruplara yönelik eşitsiz uygulamalar varsa yazılım bu örüntüyü nesnel bir kuralmış gibi öğrenir.
V. Sonuçta tarafsız sandığımız dijital sistem, eski eşitsizlikleri daha hızlı ve görünmez biçimde yeniden üretir.

Bu cümlelerle anlamlı bir paragraf oluşturulduğunda baştan üçüncü cümle hangisi olur?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":3}'::jsonb,
  'Doğru sıralama II - III - IV - V - I biçimindedir. II. cümle yaygın kanıyı ortaya koyar; III. cümle ("Ne var ki bu yazılımlar") bu kanıya itiraz eder; IV. cümle geçmiş kayıtlardaki eşitsizliğin nasıl öğrenildiğini açıklar; V. cümle ("Sonuçta") bu öğrenmenin doğurduğu olumsuz sonucu verir; I. cümle ("Bu nedenle") genel hükmü ve çözümü bildirir. Baştan üçüncü cümle IV.''tür.',
  'I. cümle "Bu nedenle" bağlacıyla başladığı için ara cümle sanılabilir; ancak "beslendiği verinin niteliği" vurgusu önceki tüm açıklamaların toplam sonucudur. III. cümle ise "bu yazılımlar" gönderimiyle doğrudan II.''ye bağlandığından üçüncü sıraya IV. cümle yerleşir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Plasebo etkisi, genellikle hastanın "iyileştiğini sanması" olarak küçümsenir. Oysa beyin görüntüleme çalışmaları, etken madde içermeyen bir ilacı şifa beklentisiyle alan kişilerde ağrı kesici salgılayan beyin bölgelerinin gerçekten etkinleştiğini göstermektedir. Yani beklenti yalnızca zihinsel bir yanılsama değil, bedenin kendi biyokimyasını harekete geçiren somut bir etkendir.

Bu parçaya en uygun başlık aşağıdakilerden hangisidir?',
  '{"options":["İlaç Üretiminde Etken Maddelerin Rolü","Plasebo Etkisinin Biyolojik Gerçekliği","Ağrı Kesici İlaçların Yan Etkileri","Modern Tıpta Görüntüleme Yöntemleri","Hasta-Hekim İletişiminin Tarihçesi"],"correctIndex":1}'::jsonb,
  'Parça, plasebo etkisinin yalnızca bir sanrı değil, beynin biyokimyasını harekete geçiren somut ve ölçülebilir bir süreç olduğunu anlatmaktadır. Bu içeriği en kapsayıcı biçimde özetleyen başlık "Plasebo Etkisinin Biyolojik Gerçekliği"dir.',
  'Metinde beyin görüntüleme ve ağrı kesici ifadeleri geçtiği için aday görüntüleme yöntemleri ya da ağrı kesici ilaçlarla ilgili başlıklara yönelebilir. Oysa bunlar plasebonun bedensel gerçekliğini kanıtlamak için verilen araç ve örneklerdir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Zor zamanlarda yalnızca çok yakın akraba ve dostlarımızın desteğine güveniriz. Oysa sosyologlar, aynı sokakta selamlaştığımız komşular veya her gün karşılaştığımız esnaf gibi "zayıf bağların" toplumsal dayanışmada sanılandan daha büyük bir rol oynadığını ortaya koyuyor. Çünkü bu gevşek ama yaygın ağlar, dar bir yakın çevre içinde sıkışıp kalmayan bilgi, yardım ve güven akışını mümkün kılar.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Gevşek toplumsal ilişkiler, bireylerin birbirine yabancılaşmasını hızlandırır.","Yakın akraba ve dostların desteği, zor zamanlarda hiçbir işe yaramaz.","Sosyologlar, komşuluk ilişkilerinin günümüzde tamamen yok olduğunu savunmaktadır.","Güven duygusu yalnızca çok yakın ilişkilerin bulunduğu küçük çevrelerde gelişir.","Zayıf toplumsal bağlar, kriz dönemlerinde dayanışma ve bilgi akışı açısından sanılandan daha güçlü bir işlev görür."],"correctIndex":4}'::jsonb,
  'Parça, zayıf bağların dar yakın çevrenin sağlayamadığı geniş bilgi, yardım ve güven akışını mümkün kılarak toplumsal dayanışmada beklenenden büyük rol oynadığını vurgular.',
  'İlk cümlede yakın akraba ve dostlara güvenildiği söylendiği için aday ya yakın çevreyi öne çıkaran ya da yakın çevreyi tamamen değersizleştiren uç bir yargıyı seçebilir. Parça yakın çevreyi yadsımaz, yalnızca zayıf bağların ihmal edilen gücüne dikkat çeker.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Eğitim araştırmalarında "üretken başarısızlık" adı verilen yöntemde öğrencilere yeni bir kavram önce hiç anlatılmaz; onlardan kendi başlarına çözüm üretmeleri istenir. Öğrenciler çoğu zaman doğru sonuca ulaşamaz, ancak deneme sırasında problemin yapısını ve kendi eksik noktalarını fark ederler. Bundan sonra yapılan konu anlatımı, doğrudan hazır bilgi verilen gruba kıyasla çok daha kalıcı bir kavrayış sağlar.

Bu parçada aşağıdakilerden hangisine değinilmemiştir?',
  '{"options":["Üretken başarısızlık yönteminde izlenen başlangıç adımına","Öğrencilerin deneme sürecinde neleri fark ettiğine","Yöntemin hazır anlatıma kıyasla sağladığı sonuca","Öğrencilerin ilk aşamada doğru sonuca çoğu zaman ulaşamadığına","Bu yöntemin hangi yaş grubunda daha yüksek başarı verdiğine"],"correctIndex":4}'::jsonb,
  'Parçada yöntemin başlangıç adımı (önce anlatılmadan çözüm istenmesi), deneme sürecindeki farkındalık (problem yapısı ve eksikler), ilk aşamada doğruya ulaşılamaması ve sonraki anlatımın kalıcılığı belirtilir; ancak yaş gruplarına göre başarı farkından söz edilmez.',
  'Eğitim araştırmaları ve öğrenci kavramları geçtiği için aday yöntemin yaş gruplarıyla ilişkilendirildiğini varsayabilir. Oysa metinde öğrencilerin yaşına veya öğretim kademesine dair hiçbir bilgi yoktur.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  '(I) Bir ormanı uzaktan izlediğimizde ağaçları yalnızca güneş ışığı için yarışan birbirinden bağımsız canlılar sanırız. (II) Oysa toprağın altında, ağaç köklerini birbirine bağlayan mikroskobik mantar ağları üzerinden sürekli bir madde ve sinyal alışverişi yürüdüğüne dair bulgular vardır. (III) Bazı araştırmalara göre yaşlı ve gövdesi geniş ağaçlar, gölgede kalan genç fidanlara bu ağ aracılığıyla karbon aktarabilir; hatta bir böcek saldırısına uğrayan ağaç, komşularını kimyasal uyarılarla haberdar edebilir. (IV) Bu bulgular, ormanın tek tek bireylerin toplamından çok, birbirine bağlı bir yaşam ağı olduğunu düşündürmektedir.

Bu parçadaki II. cümlenin işlevi aşağıdakilerden hangisidir?',
  '{"options":["Anlatılan sürecin tarihsel gelişimini özetlemek","Konuyla ilgili sayısal bir araştırma sonucunu aktarmak","Parçada ele alınan sorunun çözüm önerisini sunmak","Önceki cümlede verilen bilimsel bilgiyi örnekle somutlaştırmak","Önceki cümlede belirtilen yaygın algının gerçeği yansıtmadığını ortaya koymak"],"correctIndex":4}'::jsonb,
  'I. cümle ağaçların yalnızca yarışan bağımsız canlılar sanıldığını söyler; II. cümle "Oysa" bağlacıyla bu görünümün tersine toprak altında bir alışveriş yürüdüğüne dair bulgular bulunduğunu belirterek ilk cümledeki yaygın algıyı düzeltir.',
  'II. cümlede mantar ağlarından söz edildiği için aday bunu somut bir örnek sanabilir. Oysa somut örnekler III. cümlede (karbon aktarımı ve kimyasal uyarı) verilmiştir; II. cümle doğrudan I. cümledeki sanıyı çürüten karşı savdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  '....... Ne var ki güneş ışığını kesen geleneksel saçak ve kepenklerden arındırılmış dev cam cepheler, yaz aylarında yapının içini dev bir seraya çevirir. İçeri dolan ısıyı dışarı atmak için çalıştırılan soğutma sistemleri, yapının gün ışığından elde ettiği enerji tasarrufunu katbekat aşan bir elektrik tüketimine yol açar.

Bu parçanın başına düşüncenin akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["Cam cepheli yüksek yapılar, kent silüetine her zaman estetik bir görünüm kazandırır.","Modern mimaride geniş cam yüzeyler, gün ışığından en üst düzeyde yararlanmak amacıyla tercih edilir.","Geleneksel yapılarda kullanılan kepenkler, günümüzde tamamen işlevini yitirmiştir.","Soğutma sistemlerinin bakımı, yüksek binaların en önemli gider kalemidir.","Cam üretimi, diğer yapı malzemelerine göre daha az enerji gerektirir."],"correctIndex":1}'::jsonb,
  'Devamındaki "Ne var ki" cümlesi ve son cümledeki "gün ışığından elde ettiği enerji tasarrufu" göndermesi, ilk cümlede geniş cam yüzeylerin gün ışığından yararlanma amacıyla seçildiğinin söylenmesini gerektirir.',
  'Estetik görünümü vurgulayan cümle de modern cam cephelerle uyumlu gibi durur. Ancak son cümledeki "gün ışığından elde ettiği enerji tasarrufu" ifadesi, başlangıç cümlesinde mutlaka gün ışığı ve enerji amacının anılmasını zorunlu kılar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Tüketiciye daha fazla seçenek sunmanın her zaman memnuniyeti artıracağı varsayılır. Oysa bir deneyde, yirmi dört çeşit reçel sunulan tezgâhta müşterilerin yalnızca küçük bir bölümü satın alma yaparken altı çeşit sunulan tezgâhta satın alma oranı belirgin biçimde yükselmiştir. Seçenek sayısı aşırı arttığında zihin olası pişmanlığı hesaplamaktan yorulur ve en kolay yolu seçerek karar vermeyi erteler.

Bu parçadan aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Seçeneklerin çokluğu, karar verme sürecini zorlaştırabilir.","Seçenek sayısı azaldığında satın alma eğilimi artabilmektedir.","İnsanlar her koşulda en geniş ürün yelpazesine sahip mağazaları tercih eder.","Aşırı seçenek karşısında birey karar vermekten kaçınabilir.","Pişmanlık yaşama kaygısı, seçim yapmayı geciktiren etkenlerden biridir."],"correctIndex":2}'::jsonb,
  'Parça, çok fazla seçeneğin karar felcine yol açtığını ve daha az çeşit sunulan tezgâhta satın almanın arttığını göstermektedir. Bu nedenle insanların her koşulda en geniş ürün yelpazesini tercih ettiği yargısı parçayla çelişir.',
  'İlk cümledeki "daha fazla seçenek sunmanın her zaman memnuniyeti artıracağı" ifadesi, yaygın bir varsayım olarak sunulur. Cümleyi hızlı okuyan aday bunu yazarın kendi yargısı sanarak bu varsayımı destekleyen şıkkı doğru kabul edebilir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  '(I) Kurak bölgelerde tarımı sürdürebilmek için yer altından çekilen sularla yoğun sulama yapılır. (II) Ancak bu sulardaki çözünmüş mineraller, su buharlaştıktan sonra toprağın üst katmanında birikir. (III) Zamanla artan tuz oranı, bitki köklerinin su almasını engelleyerek verimi hızla düşürür. (IV) Toprağı yeniden ekilebilir hâle getirmek için tuzun derinlere yıkanması ve drenaj kanallarının kurulması gerekir. (V) Üstelik bu iyileştirme çalışmaları çoğu çiftçinin karşılayamayacağı kadar yüksek bir maliyet doğurur.

Bu parça iki paragrafa bölünmek istense ikinci paragraf hangi cümleyle başlamalıdır?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":3}'::jsonb,
  'İlk üç cümle kurak bölgelerde sulamanın toprakta tuzlanmaya yol açma sürecini ve bunun verimi düşürmesini anlatır. IV. cümle ise sorunun nasıl giderileceğine (iyileştirme ve drenaj çözümüne) geçer; bu nedenle ikinci paragraf IV. cümleyle başlamalıdır.',
  'V. cümle yeni bir bilgi eklediği için yeni bir bölümün başlangıcı gibi görünebilir. Ancak "bu iyileştirme çalışmaları" ifadesi doğrudan IV. cümledeki yıkama ve drenaj işlemlerine gönderme yaptığından IV. ve V. cümle ayrılamaz.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Açık denizde bir geminin kuzey-güney konumunu (enlemini) yıldızlara bakarak hesaplamak yüzyıllar boyunca mümkündü; ancak doğu-batı konumunu (boylamını) belirlemek büyük bir sorundu. Boylam hesabı, geminin bulunduğu yerdeki öğle vaktiyle başlangıç meridyenindeki saatin karşılaştırılmasını gerektiriyordu. Ne var ki sarkaçlı saatler dalgalı denizde ve sıcaklık değişimlerinde şaştığı için gemiciler açık denizde yüzlerce kilometrelik sapmalarla yol alıyordu. Bu engel ancak 18. yüzyılda sarsıntı ve ısı farkından etkilenmeyen deniz kronometresinin geliştirilmesiyle aşılabildi.

Bu parçadan aşağıdakilerden hangisine ulaşılabilir?',
  '{"options":["Enlem hesabı da en az boylam hesabı kadar hassas saatlere ihtiyaç duyuyordu.","Sarkaçlı saatler, deniz koşullarının yarattığı etkiler yüzünden boylam ölçümünde güvenilir sonuç vermiyordu.","Deniz kronometresi icat edilmeden önce gemiler enlem konumunu da belirleyemiyordu.","Sıcaklık değişimleri yalnızca yıldız gözlemlerini olumsuz etkiliyordu.","18. yüzyıldan sonra gemiciler artık gökyüzü gözlemlerine hiç başvurmamıştır."],"correctIndex":1}'::jsonb,
  'Parça, boylam için başlangıç meridyenindeki saatin bilinmesi gerektiğini ancak sarkaçlı saatlerin dalgalı deniz ve sıcaklık değişimleri nedeniyle şaştığını belirtir; bu da onların güvenilir sonuç vermediğini gösterir.',
  'İlk cümlede hem enlem hem boylam anıldığı için aday enlem hesabının da saate dayandığını veya kronometreden önce enlemin de bilinemediğini düşünebilir. Oysa metin enlemin yıldızlarla zaten hesaplanabildiğini, saat sorununun boylama özgü olduğunu söyler.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Kurallar, bir kurumun işleyişini adil ve öngörülebilir kılmak için konulur. Ancak kurala uymak, kurumun varlık amacının önüne geçtiğinde garip bir körlük başlar: Evrakı eksiksiz doldurtmayı hastayı tedavi etmekten ya da öğrenciyi yetiştirmekten daha önemli gören bir düzen ortaya çıkar. Böyle ortamlarda kuralları harfiyen uygulayanlar kendilerini sorumlu saymaz; çünkü asıl amaç unutulmuş, araç amaca dönüşmüştür.

Bu parçada yazarın eleştirdiği durum aşağıdakilerden hangisidir?',
  '{"options":["Kuralların kurum içindeki düzeni öngörülebilir kılması","Çalışanların görev tanımlarının yazılı kurallara bağlanması","Kurallara uymanın, kurumun temel hizmet amacını gölgede bırakması","Hastane ve okullarda kayıt işlemlerinin eksiksiz yürütülmesi","Kuralların zaman içinde çalışanlar tarafından unutulması"],"correctIndex":2}'::jsonb,
  'Yazar, kuralların düzen için var olduğunu kabul etmekle birlikte kurala uymanın asıl hizmet amacının (tedavi, eğitim) önüne geçip amacı unutturmasını eleştirmektedir.',
  'Parçada "evrakı eksiksiz doldurtmak" geçtiği için aday kayıt işlemlerinin eleştirildiğini düşünebilir. Oysa yazar evrakın kendisine değil, biçimsel prosedürün temel hizmetin önüne geçmesine karşı çıkar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  '(I) Deniz seviyesinden hızla yüksek dağlara çıkan bir kişide ilk saatlerde soluk alışverişi ve kalp atışı hızlanır. (II) Bunun nedeni, yükseklerde havanın daha seyrek olması ve her nefeste vücuda daha az oksijen girmesidir. (III) Dağcılık sporunda kullanılan uyku tulumlarının dolgu malzemesi, ısı yalıtımını belirleyen temel unsurdur. (IV) Kişi yüksek irtifada birkaç hafta kalırsa böbreklerin salgıladığı bir hormon sayesinde kemik iliği daha fazla alyuvar üretir. (V) Böylece kanın oksijen taşıma kapasitesi artar ve beden yeni ortama uyum sağlar.

Bu parçadaki numaralanmış cümlelerden hangisi düşüncenin akışını bozmaktadır?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":2}'::jsonb,
  'Parça, insan bedeninin yüksek irtifadaki düşük oksijene kısa ve uzun vadede verdiği fizyolojik tepkileri anlatmaktadır. III. cümle ise uyku tulumlarının dolgu malzemesine geçerek biyolojik uyum bütünlüğünü bozar.',
  'III. cümlede "dağcılık" geçtiği için yüksek dağ konusuyla bağlantılı gibi görünür. Ancak parçanın ekseni dağcılık malzemeleri değil, insan vücudunun yüksek irtifaya fizyolojik uyumudur.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Deniz tabanını kazıyarak ilerleyen ağır trol ağları, yalnızca hedeflenen balıkları yakalamakla kalmaz; süngerler, mercanlar ve deniz çayırları gibi tabana tutunarak yaşayan canlıları da yerinden söker. Bu canlılar, yavru balıkların saklandığı ve beslendiği karmaşık bir sığınak oluşturur. Sığınak ortadan kalktığında balık stokları avlanma durdurulsa bile yıllarca eski düzeyine dönemez.

Bu parçada asıl anlatılmak istenen aşağıdakilerden hangisidir?',
  '{"options":["Ağır trol avcılığı, deniz tabanındaki yaşam alanlarını yok ederek balık stoklarının kendini yenilemesini uzun süre engeller.","Balık stoklarının azalmasının tek nedeni, yavru balıkların doğrudan avlanmasıdır.","Deniz çayırları ve süngerler, balıkların beslenmesi açısından hiçbir önem taşımaz.","Avlanma tamamen durdurulduğunda deniz tabanı birkaç ay içinde eski hâline döner.","Trol ağları yalnızca derin okyanus sularında kullanıldığında zarar verir."],"correctIndex":0}'::jsonb,
  'Parça, trol ağlarının yalnızca balıkları değil, yavru balıkların sığınağı olan taban ekosistemini yok ettiğini ve bu yüzden avlanma dursa bile stokların uzun süre toparlanamadığını vurgular.',
  '"Avlanma durdurulsa bile" ifadesi yanlış okunduğunda avlanmanın durmasının stokları hemen kurtaracağı düşünülebilir. Oysa metin, yaşam alanı tahrip edildiği için avlanma dursa dahi iyileşmenin yıllarca geciktiğini anlatır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Çoktan seçmeli sınavlar, binlerce adayın yanıtlarını kısa sürede ve nesnel biçimde puanlama imkânı verir. ....... Öğrenci doğru seçeneği şans eseri mi buldu, yoksa kavramı gerçekten özümseyip yanlış seçenekleri bilinçli olarak mı eledi, puan çizelgesine bakarak anlamak mümkün değildir. Bu nedenle ölçme yalnızca sonuca değil, gerekçelendirme sürecine de yer vermelidir.

Bu parçada boş bırakılan yere düşüncenin akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["Bu sınavlar her derste aynı ölçüde başarılı sonuç verir.","Ne var ki bu hız, öğrencinin sonuca hangi düşünme yoluyla ulaştığını gizler.","Çoktan seçmeli sorularda şans başarısı hiçbir zaman ortaya çıkmaz.","Nesnel puanlama, bütün eğitim sorunlarını tek başına çözer.","Öğrencilerin çoğu, açık uçlu sorularda daha kısa sürede yanıt verir."],"correctIndex":1}'::jsonb,
  'Boşluktan sonraki cümle, adayın doğruyu şansla mı yoksa bilinçli elemeyle mi bulduğunun anlaşılamadığını belirtir. Bu durumu özetleyen köprü cümle, hızın öğrencinin düşünme sürecini gizlediğini ifade eden seçenektir.',
  'İlk cümlede hızlı ve nesnel puanlama övüldüğü için aday çoktan seçmeli testlerin tümüyle yeterli olduğunu savunan bir ifadeye yönelebilir. Oysa sonraki iki cümle bu yöntemin düşünme sürecini göstermeme eksikliğini eleştirir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Resmî duyurular ve sözleşmeler, çoğu zaman yurttaşların anlamakta zorlandığı uzun, devrik ve eski sözcüklerle örülü cümlelerle yazılır. Oysa hukuki ya da idari bir metnin açık ve anlaşılır olması, bilimsel kesinliğinden ödün vermek değildir. İnsanların haklarını ve yükümlülüklerini başkasına ihtiyaç duymadan kavrayabilmesi, sade bir dil gerektirir.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Resmî ve hukuki metinlerin herkesçe anlaşılabilir sade bir dille yazılması, teknik kesinliği bozmaz; yurttaşların haklarını kavramasını sağlar.","Hukuki metinlerin anlaşılır kılınması, kavramların kesinliğini zorunlu olarak ortadan kaldırır.","Sözleşmelerde eski sözcüklerin kullanılması, metnin güvenirliğini artıran tek unsurdur.","Yurttaşlar resmî metinleri anlamak için mutlaka uzman desteği almalıdır.","Bilimsel kesinlik yalnızca uzun ve karmaşık cümlelerle sağlanabilir."],"correctIndex":0}'::jsonb,
  'Yazar, resmî metinlerin sade yazılmasının teknik kesinlikten ödün vermek olmadığını, yurttaşların hak ve yükümlülüklerini bağımsızca anlayabilmesi için sade dilin gerekli olduğunu savunur.',
  'Sade dilin teknik kesinliği bozacağı düşüncesi yaygın bir ön yargı olduğu için aday bunu savunan seçeneğe yönelebilir. Metin ise "ödün vermek değildir" diyerek bu ön yargıyı doğrudan çürütür.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Bilgi güvenliği uzmanları yıllarca kullanıcılardan büyük harf, rakam ve özel işaret içeren karmaşık parolalar oluşturmalarını istedi. Ancak bu katı kurallar, akılda tutması zor diziler doğurduğu için kullanıcıların çoğunu aynı basit kalıplara —örneğin baş harfi büyük bir sözcüğün sonuna yıl ve ünlem eklemeye— itti. Saldırgan yazılımlar da tam olarak bu öngörülebilir kalıpları denediğinden, kısa ama karmaşık görünümlü parolalar yerine anlamlı sözcüklerden oluşan uzun parola cümleleri çok daha yüksek güvenlik sağlamaktadır.

Bu parçadan aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Katı karmaşıklık kuralları, kullanıcıları tahmin edilebilir alışkanlıklara yöneltebilmektedir.","Büyük harf ve rakam içeren her parola, uzun bir parola cümlesinden daha güvenlidir.","Anlamlı sözcüklerden kurulan uzun parolalar, yüksek güvenlik sağlayabilir.","Saldırgan yazılımlar, kullanıcıların sık başvurduğu kalıpları hedef almaktadır.","Akılda tutulması güç kurallar, pratikte beklenmedik güvenlik açıkları doğurabilir."],"correctIndex":1}'::jsonb,
  'Parça, kısa ve karmaşık görünen parolaların öngörülebilir kalıplara dönüştüğünü, uzun parola cümlelerinin ise çok daha güvenli çıktığını belirtir. Dolayısıyla büyük harf ve rakam içeren her parolanın uzun parola cümlesinden daha güvenli olduğu yargısı çıkarılamaz.',
  'İlk cümlede uzmanların yıllarca büyük harf ve özel işaret istediği anlatıldığı için aday bunun hâlâ en güvenli yöntem olduğunu sanabilir. Oysa parça sonraki cümlelerde bu yaklaşımın neden yetersiz kaldığını açıklar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Akarsuların taşkın ovaları, yerleşim yerleri kurulduktan sonra yalnızca önlenmesi gereken bir afet alanı olarak görülür. Oysa doğal akışında bir nehrin mevsimsel taşkınları, dağlardan taşıdığı mineralce zengin alüvyonları ovaya yayarak toprağı her yıl yeniden besler. Taşkınları beton duvarlarla tamamen engelleyen yapılar, yerleşimleri korurken aşağıdaki tarım topraklarını bu doğal yenilenmeden mahrum bırakır.

Bu parçada yazarın taşkınlara bakışı aşağıdakilerden hangisidir?',
  '{"options":["Taşkınların yerleşim yerleri için yararlı bir doğa olayı olduğunu savunmaktadır.","Beton duvarların tarım topraklarının verimini artırdığını ileri sürmektedir.","Taşkınların yalnızca tehlike değil, toprağı besleyen doğal bir döngünün parçası olduğunu vurgulamaktadır.","Akarsu kenarlarına hiçbir koşulda yapı inşa edilmemesi gerektiğini söylemektedir.","Alüvyonların yalnızca dağlık bölgelerde biriktiğini belirtmektedir."],"correctIndex":2}'::jsonb,
  'Yazar, taşkınların yerleşim açısından sorun görülse de aslında toprağı mineralle besleyen doğal bir yenilenme süreci olduğunu, duvarların bu döngüyü kestiğini vurgular.',
  'Yerleşimlerin korunmasından söz edildiği için aday yazarın beton duvarları tamamen olumsuzladığını veya yerleşime tümüyle karşı çıktığını sanabilir. Oysa yazar yalnızca taşkınların ekolojik besleme işlevinin gözden kaçırılmamasını vurgular.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'I. Sonuçta ölçüm yüksek görünse de hedeflenen hizmet kalitesi belirgin biçimde düşer.
II. Bir kurum, çalışan başarısını yalnızca tek bir sayısal ölçüte bağladığında davranışlar hızla o sayıya göre şekillenir.
III. Örneğin bir çağrı merkezinde tek ölçüt görüşmeyi kısa sürede bitirmek olursa çalışanlar, sorunu çözmek yerine müşteriyi başka bir birime aktarır.
IV. Bu aktarım, görüşme süresini kâğıt üzerinde kısaltır ama müşterinin aynı sorunu defalarca anlatmasına yol açar.
V. Dolayısıyla tek bir gösterge hedef hâline getirildiğinde, o gösterge artık gerçek başarının güvenilir ölçüsü olmaktan çıkar.

Bu cümlelerle anlamlı bir paragraf oluşturulduğunda baştan dördüncü cümle hangisi olur?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":0}'::jsonb,
  'Doğru sıralama II - III - IV - I - V biçimindedir. II. cümle genel ilkeyi verir; III. cümle ("Örneğin") somut örneği sunar; IV. cümle ("Bu aktarım") örneğin ilk sonucunu açıklar; I. cümle ("Sonuçta") örneğin genel değerlendirmesini yapar; V. cümle ("Dolayısıyla") bütün parçanın ana sonucunu bağlar. Baştan dördüncü cümle I.''dir.',
  'I. cümle "Sonuçta" ile başladığı için en sonda sanılabilir; ancak "ölçüm yüksek görünse de" ifadesi hâlâ çağrı merkezi örneğindeki görüşme süresi ölçümüne bağlıdır. Tüm parçayı genel bir yasaya bağlayan V. cümle ise "Dolayısıyla" ile en sonda yer alır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'İnsan bedeni, aydınlık ve karanlık döngüsüne göre çalışan bir iç saate sahiptir; hormon salgısı, vücut sıcaklığı ve sindirim hızı bu ritme göre düzenlenir. Gece vardiyasında çalışan kişilerde dış dünyanın saati ile iç biyolojik saat sürekli çatışma hâlindedir. Uzun süre bu düzensizliğe maruz kalmak, yalnızca uyku yoksunluğuna değil, metabolizma ve bağışıklık sorunlarına da zemin hazırlar.

Bu parçada aşağıdakilerden hangisine değinilmemiştir?',
  '{"options":["İç saatin hangi temel bedensel süreçleri düzenlediğine","Gece vardiyasında hangi saatlerin çatıştığına","Uzun süreli vardiya çalışmasının yol açabileceği sorunlara","Vardiya çalışanlarının mesai sürelerinin kaç saat olması gerektiğine","İç biyolojik saatin hangi dış döngüye göre çalıştığına"],"correctIndex":3}'::jsonb,
  'Parçada iç saatin aydınlık-karanlık döngüsüne göre çalıştığı, hormon/sıcaklık/sindirimi düzenlediği, gece vardiyasında iç ve dış saatin çatıştığı ve bunun uyku, metabolizma, bağışıklık sorunları doğurabileceği anlatılır; mesai süresinin uzunluğuna değinilmez.',
  'Gece vardiyası ve uyku yoksunluğu geçtiği için aday çalışma saatleriyle ilgili bir sınırın da verildiğini varsayabilir. Oysa metinde kaç saat çalışılması gerektiğine dair hiçbir ifade yoktur.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Klasik dört yönlü sinyalize kavşaklarda araçlar yüksek hızla kesişme noktasına gelir ve dik açılı çarpışma riski taşır. Buna karşılık ortasında dairesel bir ada bulunan döner kavşaklarda bütün sürücüler hızını düşürüp aynı yönde dönmek zorunda kalır. Bu sayede araçların birbirine dik açıyla çarpma ihtimali büyük ölçüde ortadan kalkar ve kavşaktan geçen trafik akışı daha güvenli hâle gelir.

Bu parçada yazar, düşüncesini geliştirirken ağırlıklı olarak aşağıdakilerden hangisinden yararlanmıştır?',
  '{"options":["Tanık gösterme","Sayısal verilerden yararlanma","Örnekleme","Tanımlama","Karşılaştırma"],"correctIndex":4}'::jsonb,
  'Parça, klasik dört yönlü sinyalize kavşaklar ile döner kavşakları hız, çarpışma açısı ve güvenlik bakımından karşı karşıya koyarak karşılaştırma yoluna gitmektedir.',
  '"Döner kavşak" kavramının biçimi tarif edildiği için aday tanımlama seçeneğine yönelebilir. Oysa metnin omurgası "Buna karşılık" bağlacıyla kurulan iki kavşak türünün güvenlik karşılaştırmasıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Geçmiş uygarlıklara dair bilgimizi uzun süre yalnızca tapınaklar, saraylar ve hükümdar mezarları biçimlendirdi. Oysa bu görkemli yapılar, toplumun yalnızca dar bir yönetici kesiminin yaşamını yansıtıyordu. Günümüzde arkeologlar, sıradan insanların ne yediğini, hangi hastalıklarla boğuştuğunu ve gündelik eşyalarını nasıl onardığını anlamak için eski yerleşimlerin çöplük katmanlarını ve mutfak ocaklarını incelemeye daha fazla ağırlık veriyor.

Bu parçadan aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Anıtsal yapılar, geçmiş toplumların tüm kesimlerini aynı ölçüde temsil etmez.","Eski yerleşimlerdeki çöplük katmanları, gündelik yaşam hakkında önemli ipuçları sunabilir.","Arkeolojik araştırmalarda halkın sıradan yaşamına duyulan ilgi artmıştır.","Saray ve tapınak kalıntıları, arkeoloji bilimi için artık hiçbir değer taşımamaktadır.","Mutfak kalıntıları, geçmiş dönemlerin beslenme alışkanlıklarını aydınlatabilir."],"correctIndex":3}'::jsonb,
  'Parça, eskiden anıtsal yapılara odaklanıldığını, günümüzde ise sıradan halkı anlamak için çöplük ve mutfak kalıntılarına daha fazla ağırlık verildiğini söyler. Bu durum, saray ve tapınakların artık hiçbir değer taşımadığı anlamına gelmez.',
  'Metin sıradan yaşam izlerinin önemini öne çıkardığı için aday eski anıtsal yapıların tamamen önemsizleştiği sonucunu çıkarabilir. Oysa "daha fazla ağırlık veriyor" ifadesi sarayların değersizleştiğini değil, bakış açısının genişlediğini gösterir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Dijital dosyaların boyutunu küçültmek için iki temel yöntem kullanılır: kayıpsız ve kayıplı sıkıştırma. ....... Kayıpsız sıkıştırma, dosyadaki örüntüleri kısaltarak yer kazanır ve açıldığında veriyi tek bir bit bile eksiltmeden geri verir; kayıplı yöntem ise insan gözünün ya da kulağının kolayca fark edemediği ayrıntıları kalıcı olarak atar.

Bu parçada boş bırakılan yere düşüncenin akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["Kayıplı sıkıştırma, metin belgelerinin arşivlenmesinde her zaman ilk tercihtir.","Bu iki yöntem arasındaki temel fark, sıkıştırılan dosya açıldığında özgün verinin bütünüyle geri kazanılıp kazanılamadığıdır.","İnternet hızı arttığı için günümüzde veri sıkıştırmaya artık gerek kalmamıştır.","Kayıpsız sıkıştırma yalnızca ses dosyaları üzerinde uygulanabilir.","İnsan kulağı ses dosyalarındaki bütün frekans farklarını eksiksiz algılar."],"correctIndex":1}'::jsonb,
  'Boşluktan sonraki cümle, kayıpsız yöntemin veriyi eksiksiz geri verdiğini, kayıplı yöntemin ise bazı ayrıntıları kalıcı olarak attığını açıklar. Dolayısıyla araya bu iki yöntemi verinin geri kazanılması ölçütüne göre ayıran cümle gelmelidir.',
  'Kayıpsız ve kayıplı ifadeleri geçtiği için aday kayıplı yöntemin arşivlerde kullanıldığını söyleyen seçeneğe yönelebilir. Oysa kalıcı veri kaybı arşivleme için uygun değildir ve sonraki cümle doğrudan geri kazanım farkını açar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Çevrimiçi platformlar, kullanıcının ekranda daha uzun süre kalması için ona yalnızca ilgilendiği ve onayladığı içerikleri göstermeye yatkındır. İlk bakışta kişiselleştirilmiş bu akış rahatlatıcı gelir; çünkü kişi kendi görüşünü doğrulayan yorumlarla karşılaşır. Ancak zamanla farklı bakış açıları ekrandan silinince birey, herkesin kendisi gibi düşündüğü yapay bir yankı odasının içine hapsolur.

Bu parçada asıl vurgulanan düşünce aşağıdakilerden hangisidir?',
  '{"options":["Kullanıcının yalnızca kendi görüşüne yakın içeriklerle karşılaşması, zamanla farklı düşüncelerden yalıtılmış dar bir algı ortamı yaratır.","Çevrimiçi platformlar, kullanıcıların her konuda karşıt görüşleri eşit oranda görmesini sağlar.","Kişiselleştirilmiş içerik akışı, bireyin eleştirel düşünme gücünü her zaman geliştirir.","İnternette farklı görüşlerle karşılaşan kullanıcılar platformlarda daha uzun süre kalır.","Yankı odası etkisi, yalnızca haber sitelerini düzenli izlemeyen kişilerde ortaya çıkar."],"correctIndex":0}'::jsonb,
  'Parça, platformların kullanıcıya kendi görüşünü doğrulayan içerikleri sunmasının başta rahatlatıcı gelse de farklı görüşleri görünmez kılarak bireyi tek sesli bir yankı odasına hapsettiğini vurgular.',
  '"Rahatlatıcı gelir" ifadesi kişiselleştirmenin olumlu olduğu izlenimini verebilir. Ancak yazar "Ancak" ile bu durumun gerçek sonucunun farklı düşüncelerden yalıtılmak olduğunu belirtir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  '(I) Bitkilerin büyük çoğunluğu ihtiyaç duyduğu azotu topraktan kökleriyle alır. (II) Ancak bataklık gibi aşırı nemli ve asidik topraklarda bakteriler organik maddeleri yeterince ayrıştıramadığı için toprak azot bakımından çok fakir kalır. (III) Bu koşullarda yetişen etçil bitkiler, yapraklarını kapan veya kaygan huni biçiminde özelleştirerek böcekleri yakalar. (IV) Bataklık alanların korunması için uluslararası sözleşmeler imzalanmaktadır. (V) Sindirim enzimleriyle parçaladıkları böceklerden elde ettikleri azot sayesinde, başka bitkilerin yaşayamadığı bu ortamlarda tutunmayı başarırlar.

Bu parçadaki numaralanmış cümlelerden hangisi düşüncenin akışını bozmaktadır?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":3}'::jsonb,
  'Parça, azotça fakir bataklık topraklarında yetişen etçil bitkilerin böcek yakalayarak azot eksiğini nasıl kapattığını anlatmaktadır. IV. cümle ise bataklıkların korunmasına yönelik uluslararası sözleşmelere geçerek biyolojik uyum ekseninden sapar.',
  'IV. cümlede "bataklık alanlar" ifadesi geçtiği için önceki cümlelerle konu bağı varmış gibi görünür. Ancak III. ve V. cümleler etçil bitkilerin böceklerden azot elde etmesini birbirine bağlarken IV. cümle hukuki/çevresel bir konuya atlar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  '(I) Bir mahallede on evin her birinin garajında yılda yalnızca birkaç saat kullanılan birer matkap durur. (II) Ortak bir alet kütüphanesi kurulduğunda ise aynı mahallenin ihtiyacı iki ya da üç nitelikli matkapla kolayca karşılanır. (III) Bu paylaşım modeli, yalnızca hanelerin gereksiz harcamasını azaltmakla kalmaz; üretimde harcanan ham madde ve enerji yükünü de aşağı çeker. (IV) Ne var ki bu düzenin işlemesi, kullanıcıların ödünç aldıkları eşyayı temiz ve sağlam biçimde geri getirme sorumluluğunu benimsemesine bağlıdır.

Bu parçadaki IV. cümlenin işlevi aşağıdakilerden hangisidir?',
  '{"options":["Önceki cümlelerde anlatılan modelin başarısı için gereken temel koşulu belirtmek","Paylaşım ekonomisinin neden hiçbir zaman uygulanamayacağını kanıtlamak","Mahalledeki alet kütüphanesinin kuruluş tarihini aktarmak","Önceki cümlede verilen ekolojik yararı sayısal verilerle desteklemek","Mülkiyet kavramının tarihsel kökenini tanımlamak"],"correctIndex":0}'::jsonb,
  'İlk üç cümle ortak kullanım modelinin ekonomik ve çevresel yararlarını anlatır; IV. cümle ("Ne var ki bu düzenin işlemesi...") bu olumlu modelin sürdürülebilmesi için gereken kullanıcı sorumluluğu koşulunu bildirir.',
  '"Ne var ki" bağlacı olumsuz bir itiraz çağrışımı yaptığı için aday IV. cümlenin modeli tamamen reddettiğini sanabilir. Oysa cümle modeli reddetmez, işlemesi için gereken ön şartı ortaya koyar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Bir uzmanın karmaşık bir problemi adım adım çözmesini izlerken her basamak bize son derece açık ve kolay görünür. Uzmanın akıcı anlatımı zihnimizde "Ben de bunu anladım, kendim de yapabilirim." izlenimi uyandırır. Oysa gerçek sınav ya da uygulama anında, izlerken gözümüzden kaçan ara adımlarda takılırız; çünkü başkasının çözümünü izlemek, zihni kendi çözüm yolunu kurmaya zorlamadığı için sahte bir yeterlik duygusu yaratır.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Başkasının yaptığı çözümü akıcı biçimde izlemek, kişide konuyu gerçekten öğrendiğine dair yanıltıcı bir güven oluşturabilir.","Karmaşık problemler yalnızca uzmanların anlatımını izleyerek tam anlamıyla öğrenilebilir.","Bir konuyu anlamak için kişinin kendi başına deneme yapmasına gerek yoktur.","Uzmanların konuyu akıcı biçimde anlatması, öğrencinin öğrenme hızını her zaman düşürür.","Uygulama sırasında takılmanın tek nedeni, anlatımın yeterince açık olmamasıdır."],"correctIndex":0}'::jsonb,
  'Parça, uzmanı izlerken her adımın kolay görünmesinin "öğrendim" yanılsaması yarattığını, kişi kendi çözmeye çalıştığında ise zihinsel üretim yapmadığı için takıldığını vurgular.',
  'İkinci cümlede "Ben de bunu anladım" duygusu anlatıldığı için aday akıcı anlatımın öğrenmeyi kolaylaştırdığını savunan bir şıkka yönelebilir. Oysa yazar bunu "sahte bir yeterlik duygusu" diyerek eleştirir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  '(I) Günlük beslenmede meyve suyu içmek ile meyvenin kendisini yemek, şeker miktarı aynı görünse bile vücutta farklı tepkiler doğurur. (II) Meyvenin bütününde bulunan posa, sindirim sürecini yavaşlatarak şekerin kana azar azar karışmasını sağlar. (III) Posasından ayrılmış meyve suyundaki şeker ise hızla emilir ve kan şekerinde ani bir yükselişin ardından çabuk gelen bir açlık hissi yaratır. (IV) Beslenme önerileri ise meyvenin hiç tüketilmemesini değil, işlenmemiş tam besinlerin tercih edilmesini kapsar. (V) Özellikle sabah öğününde tam meyve ve sebzeye yer vermek, gün içindeki enerji dengesini daha istikrarlı tutar.

Bu parça iki paragrafa bölünmek istense ikinci paragraf hangi cümleyle başlamalıdır?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":3}'::jsonb,
  'İlk üç cümle tam meyve ile meyve suyunun sindirim ve kan şekeri üzerindeki fizyolojik farkını açıklar. IV. cümle ise bu bilgiden günlük beslenme tercihine ve öneriye geçiş yapar; bu yüzden ikinci paragraf IV. cümleyle başlamalıdır.',
  'III. cümle meyve suyunu anlattığı için II. cümleden ayrılabilir gibi görünür. Ancak II. ve III. cümleler posalı tam meyve ile posasız meyve suyu arasındaki karşılaştırmayı birlikte tamamladığı için bölünme noktası IV. cümledir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Dışarıda lapa lapa yağan karın altında, peronun ıslak taşları boyunca yürüyerek istasyonun saat kulesine baktı. Biraz sonra rayların titrediğini hissedince elindeki yıpranmış bileti sıktı ve ceketinin yakasını kaldırdı. Tren sisin içinden çıkıp perona yanaştığında bekleyen kalabalık hareketlendi; yaşlı adam da çantasını kavrayıp vagon kapısına doğru yürüdü.

Bu parçada ağır basan anlatım biçimi aşağıdakilerden hangisidir?',
  '{"options":["Tartışmacı anlatım","Açıklayıcı anlatım","Öyküleyici anlatım","Betimleyici anlatım","Hem açıklayıcı hem tartışmacı anlatım"],"correctIndex":2}'::jsonb,
  'Parçada bir kişinin peronda yürümesi, rayların titreşmesiyle biletini sıkıp yakasını kaldırması ve tren gelince kalabalıkla birlikte vagon kapısına yönelmesi zaman akışı içinde bir olay örgüsü olarak anlatılmaktadır; bu nedenle ağır basan anlatım biçimi öyküleyici anlatımdır.',
  'Parçada "lapa lapa yağan kar", "ıslak taşlar" ve "sisin içinden" gibi görsel ayrıntılar yer aldığı için betimleyici anlatım güçlü bir çeldiricidir. Ancak betimlemede durağan bir görünüm öne çıkarken bu parçada eylemler art arda gelişir ve belirgin bir olay akışı kurulur.',
  array['lisans_gygk']::text[],
  'lisans'
);
