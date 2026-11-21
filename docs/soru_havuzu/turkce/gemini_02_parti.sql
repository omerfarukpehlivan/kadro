-- ==========================================================================
-- KADRO SORU HAVUZU · KPSS GY Türkçe · GEMİNİ PARTİ 2 (30 soru, Paragrafta Anlam ve Yapı) · SUPABASE SQL
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
  'Uzun açıklıklı asma köprüler tasarlanırken mühendisler yalnızca köprünün kendi ağırlığını ve üzerinden geçecek taşıt yükünü hesaplamaz. Rüzgârın köprü tabliyesinin altından ve üstünden geçerken oluşturduğu basınç farkı, yapıda ritmik bir salınım başlatabilir. Bu nedenle modern asma köprülerin gövdeleri, tıpkı bir uçak kanadı gibi rüzgârı kesintisiz biçimde yönlendiren aerodinamik bir kesitle biçimlendirilir.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Asma köprülerin taşıma kapasitesi yalnızca kullanılan çeliğin kalınlığına bağlıdır.","Uzun asma köprülerin tasarımında yalnızca statik yükler değil, rüzgârın yol açabileceği salınımları önleyecek aerodinamik yapı da gözetilir.","Rüzgâr hızının yüksek olduğu bölgelerde asma köprü inşa edilmemelidir.","Taşıt yükü, asma köprülerde rüzgâr etkisinden her zaman daha büyük bir risk oluşturur.","Uçak kanatlarının tasarım ilkeleri doğrudan köprü mühendisliğinden alınmıştır."],"correctIndex":1}'::jsonb,
  'Parça, asma köprü tasarımında ağırlık ve taşıt yükünün yanında rüzgâr kaynaklı salınım riskinin de hesaplandığını ve bunun için aerodinamik kesit kullanıldığını vurgular.',
  'İlk cümlede kendi ağırlığı ve taşıt yükünden söz edildiği için aday yüklerin tek ya da baskın ölçüt olduğunu sanabilir. Oysa parça "yalnızca ... hesaplamaz" diyerek rüzgâr salınımını ve aerodinamik çözümü öne çıkarır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Doğal çayırlarda büyük otçulların tamamen ortadan kalkması, ilk bakışta bitki örtüsü için bir rahatlama gibi görünebilir. Oysa otlama baskısı kalktığında birkaç hızlı büyüyen uzun ot türü güneş ışığını tekeline alır ve zemine yakın yaşayan onlarca küçük çiçekli bitkiyi gölgede bırakarak yok eder. Kontrollü otlama ise baskın türleri budayarak toprağa ışık inmesini sağlar ve çayırın tür çeşitliliğini canlı tutar.

Bu parçadan aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Büyük otçulların yokluğu, bazı hızlı büyüyen bitkilerin diğer türleri bastırmasına yol açabilir.","Kontrollü otlama, çayır ekosistemindeki bitki çeşitliliğinin korunmasına katkı sağlar.","Otçul hayvanların tamamen uzaklaştırılması, çayırdaki bütün bitki türlerinin sayısını artırır.","Zemine yakın yetişen küçük bitkiler, güneş ışığına erişemediklerinde varlıklarını sürdürmekte zorlanır.","Otlama, baskın ot türlerinin aşırı büyümesini dengeleyen bir etken olabilir."],"correctIndex":2}'::jsonb,
  'Parça, otçulların tamamen ortadan kalkmasının yalnızca hızlı büyüyen birkaç uzun otu avantajlı kıldığını, zemindeki onlarca küçük çiçekli bitkiyi ise yok ettiğini söyler. Bu nedenle bütün bitki türlerinin sayısının arttığı yargısı çıkarılamaz.',
  'İlk cümledeki "bitki örtüsü için bir rahatlama gibi görünebilir" ifadesi, otlamanın bitkiler için her zaman zararlı olduğu izlenimi verebilir. Ancak "Oysa" ile başlayan ikinci cümle bu ilk izlenimi açıkça tersine çevirir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'İnsanlar, büyük zaman, para ya da emek harcadıkları bir işin artık sonuç vermeyeceğini görseler bile o işten vazgeçmekte zorlanır. ....... Oysa geçmişte yapılan harcama hangi karar verilirse verilsin geri gelmeyecektir; akılcı olan, geride kalanı değil bundan sonra doğacak yarar ve zararı tartmaktır.

Bu parçada boş bırakılan yere düşüncenin akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["Bu nedenle bir projeye ne kadar çok bütçe ayrılırsa o projenin başarı olasılığı o ölçüde yükselir.","Çünkü işi bırakmak, o ana dek harcanan emeğin boşa gittiğini kabullenmek anlamına gelir ve zihin bu kaybı kabullenmek istemez.","Zaman içinde yapılan ek harcamalar, başarısız bir girişimi mutlaka kârlı hâle getirir.","Akılcı karar vericiler, yeni bir girişime başlarken hiçbir zaman maliyet hesabı yapmaz.","Geçmişteki yatırımları dikkate almak, gelecekteki zararları bütünüyle ortadan kaldırır."],"correctIndex":1}'::jsonb,
  'Boşluktan önce insanların sonuçsuz bir işten vazgeçmekte zorlandığı söylenir; boşluktan sonraki "Oysa" cümlesi ise geçmiş harcamanın geri gelmeyeceğini belirtir. Dolayısıyla araya vazgeçememenin psikolojik nedenini (harcanan emeğin boşa gittiğini kabullenememe) açıklayan cümle gelmelidir.',
  'Parçada bütçe ve harcama kavramları geçtiği için aday ek harcamanın ya da yüksek bütçenin başarıyı getireceğini savunan seçeneklere yönelebilir. Oysa metin zararlı bir işe sırf geçmiş emek yüzünden devam etme yanılgısını eleştirir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'I. Bu nedenle matbaanın asıl etkisi, kitap sayısını artırmanın ötesinde, bilginin sınanma ve eleştirilme hızını değiştirmesinde görülür.
II. El yazması döneminde bir kitabın çoğaltılması aylar sürer ve her kopyada yeni yazım farklılıkları ortaya çıkardı.
III. Matbaanın icadıyla aynı metnin yüzlerce özdeş kopyası kısa sürede farklı kentlerdeki okurlara ulaşmaya başladı.
IV. Aynı metni aynı anda inceleyen farklı bilginler, metindeki hataları ve çelişkileri birbirleriyle tartışma olanağı buldu.
V. Böylece bireysel düzeltme notları ve yeni gözlemler, sonraki baskılarda hızla ortak bilgi birikimine eklendi.

Bu cümlelerle anlamlı bir paragraf oluşturulduğunda baştan dördüncü cümle hangisi olur?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":4}'::jsonb,
  'Doğru sıralama II - III - IV - V - I biçimindedir. II. cümle matbaa öncesi el yazması dönemini tanıtır; III. cümle matbaayla aynı metnin özdeş kopyalarının yayılmasını anlatır; IV. cümle ("Aynı metni") bu durumun bilginler arasında tartışma başlatmasını verir; V. cümle ("Böylece") bu tartışmaların sonraki baskılara eklenmesini açıklar; I. cümle ("Bu nedenle") matbaanın asıl etkisini özetleyen sonuç cümlesidir. Baştan dördüncü cümle V.''tir.',
  'I. cümle matbaanın genel etkisini söylediği için ara basamak sanılabilir; ancak "Bu nedenle matbaanın asıl etkisi..." ifadesi önceki dört cümlenin anlattığı sürecin nihai sonucunu bağlamaktadır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Tarım arazilerinde kullanılan fazla azot ve fosforlu gübreler, yağmur sularıyla akarsulara ve kıyı denizlerine taşınır. Suya karışan bu besin fazlalığı, yüzeydeki alglerin hızla çoğalmasına yol açar. Ölen algler dibe çöküp bakteriler tarafından parçalanırken sudaki çözünmüş oksijeni tüketir ve balıkların yaşayamadığı "ölü bölgeler" oluşur.

Bu parçaya en uygun başlık aşağıdakilerden hangisidir?',
  '{"options":["Akarsularda Balıkçılık Yöntemleri","Tarımsal Gübrelemenin Denizlerde Ölü Bölgelere Etkisi","Alglerin Endüstriyel Kullanım Alanları","Deniz Suyunun Tuzluluk Oranındaki Değişim","Modern Tarımda Sulama Sistemleri"],"correctIndex":1}'::jsonb,
  'Parça, tarımda kullanılan fazla gübrelerin denizlere taşınarak alg patlaması ve oksijen tükenmesi yoluyla ölü bölgeler oluşturmasını anlatmaktadır; bu zinciri en doğru özetleyen başlık gübrelemenin ölü bölgelere etkisidir.',
  'Metinde algler ve balıklar anıldığı için aday yalnızca alglerin ya da balıkçılığın öne çıktığı bir başlığa yönelebilir. Oysa parçanın temel ekseni tarımsal gübre atıklarının başlattığı ekolojik zincirdir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'İnternette pek çok arama motorunun, video platformunun ya da harita uygulamasının bizden ücret talep etmemesi, bu hizmetlerin maliyetsiz olduğu anlamına gelmez. Sunucuların elektrik giderinden yazılım mühendislerinin maaşına kadar dev bir altyapı, reklam verenlerin ödediği bedellerle ayakta durur. Reklamların etkili olması ise kullanıcının ekranda geçirdiği süreyi ve dijital izlerini sürekli izlemeye dayanır.

Bu parçada asıl anlatılmak istenen aşağıdakilerden hangisidir?',
  '{"options":["İnternet platformlarının sunucu ve yazılım giderleri sanılandan çok daha düşüktür.","Ücretsiz sunulan dijital hizmetler aslında kullanıcı dikkati ve verisi üzerinden finanse edilmektedir.","Ücretli yazılımlar her zaman ücretsiz platformlardan daha kaliteli hizmet sunar.","Reklam verenler, dijital platformların teknik altyapısını doğrudan yönetmektedir.","Kullanıcıların internette geçirdiği süre arttıkça platformların giderleri azalır."],"correctIndex":1}'::jsonb,
  'Parça, ücretsiz görünen dijital hizmetlerin arkasında büyük bir maliyet bulunduğunu ve bu maliyetin kullanıcıların dikkati ile dijital izleri üzerinden işleyen reklam modeliyle karşılandığını vurgular.',
  '"Ücret talep etmemesi" ifadesi platformların tamamen kamusal ya da maliyetsiz işlediği algısı uyandırabilir. Oysa metin, görünen ücretsizliğin ardındaki veri ve dikkat ekonomisini ortaya koyar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'İnsan derisi, güneşten gelen morötesi B ışınlarıyla temas ettiğinde D vitamini sentezleyebilir. Ancak bu ışınların atmosferden geçerek yeryüzüne ulaşabilmesi, güneş ışınlarının geliş açısına bağlıdır. Yüksek enlemlerdeki ülkelerde kış aylarında güneş ufka yakın kaldığı için kişi dışarıda uzun süre dursa bile yeterli D vitamini üretilemez; ayrıca koyu cilt rengi ve güneş koruyucu kremler de sentezi yavaşlatabilir.

Bu parçada aşağıdakilerden hangisine değinilmemiştir?',
  '{"options":["D vitamini sentezini başlatan güneş ışını türüne","Güneş ışınlarının geliş açısının önemine","Kış aylarında yüksek enlemlerde neden üretim yapılamadığına","Cilt renginin ve koruyucu kremlerin etkisine","D vitamini eksikliğinde ortaya çıkan kemik hastalıklarına"],"correctIndex":4}'::jsonb,
  'Parçada morötesi B ışınları, ışınların geliş açısı, kışın yüksek enlemlerde üretimin yetersiz kalması, cilt rengi ve güneş koruyucu kremlerin etkisi anlatılır; eksiklikte görülen kemik hastalıklarına değinilmez.',
  'D vitamini denince akla ilk olarak kemik sağlığı geldiği için aday bu bilginin parçada da yer aldığını sanabilir. Ancak parça yalnızca üretimi etkileyen fiziksel ve biyolojik etkenlere odaklanır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  '(I) Sınavlara hazırlanan pek çok öğrenci, ders notlarındaki tanımları alt alta sıralayıp defalarca okuyarak kalıcı bir öğrenme sağlayacağını düşünür. (II) Oysa tek tek ezberlenen tanımlar arasında anlamlı bir bağ kurulmadığında zihin bu bilgileri dağınık parçalar olarak tutar ve soru biçimi biraz değiştiğinde kullanamaz. (III) Kavram haritaları oluşturarak "hangi kavram hangisinin nedeni, hangisi hangisinin alt başlığı?" sorularını yanıtlamak ise bilgiyi bir ağa dönüştürür. (IV) Böylece yeni bir bilgi geldiğinde zihin onu boşlukta bırakmak yerine mevcut ağın uygun noktasına bağlar.

Bu parçadaki II. cümlenin işlevi aşağıdakilerden hangisidir?',
  '{"options":["Kavram haritalarının hangi derslerde kullanılamayacağını belirtmek","Önceki cümlede anlatılan çalışma alışkanlığının neden yetersiz kaldığını açıklamak","Ezber yönteminin soru çözme hızını nasıl artırdığını örneklemek","Parçanın sonunda önerilen yöntemin uygulanma aşamalarını sıralamak","Öğrencilerin sınav kaygısını azaltan etkenleri ortaya koymak"],"correctIndex":1}'::jsonb,
  'I. cümle öğrencilerin tanımları alt alta okuyarak öğrenmeye çalışma alışkanlığını belirtir; II. cümle ("Oysa") bu yöntemle bağ kurulamadığı için bilginin soru biçimi değiştiğinde kullanılamadığını söyleyerek yöntemin yetersizliğini açıklar.',
  'Parçanın bütünü kavram haritalarını önerdiği için aday II. cümlenin de doğrudan kavram haritasını tanıttığını düşünebilir. Oysa kavram haritası III. cümlede başlar; II. cümle yalnızca ilk cümledeki yöntemin eksikliğini gösterir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  '....... Bu nedenle uluslararası havalimanlarında, metro istasyonlarında ve hastanelerde yalnızca yerel dildeki yazılarla yetinilmez; bavul, merdiven, ilk yardım ya da çıkış yönü gibi kavramlar herkesin ilk bakışta tanıyabileceği sade simgelerle gösterilir. Doğru tasarlanmış bir simge, okumaya gerek bırakmadan saniyeler içinde yön gösterir.

Bu parçanın başına düşüncenin akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["Farklı dilleri konuşan binlerce insanın aynı kamusal alanı paylaştığı mekânlarda yazılı uyarılar çoğu zaman yetersiz kalır.","Günümüzde bütün yolcular, seyahat öncesinde gidecekleri ülkenin dilini öğrenmektedir.","Havalimanı ve metro yapılarında görsel işaretler, yalnızca estetik kaygılarla yerleştirilir.","Basit simgelerin anlamı, toplumdan topluma tamamen farklılaştığı için ortak bir işaret dili kurulamaz.","Karmaşık metinlerle yazılmış tabelalar, acil durumlarda simgelerden daha hızlı okunur."],"correctIndex":0}'::jsonb,
  'Devamındaki "Bu nedenle ... yalnızca yerel dildeki yazılarla yetinilmez" cümlesi, öncesinde farklı dilleri konuşan insanların bulunduğu kamusal alanlarda yazılı uyarıların yetersiz kaldığının söylenmesini gerektirir.',
  'Ortak işaret dilinin kurulamadığını veya simgelerin estetik amaçlı kullanıldığını belirten seçenekler konuya yakın sözcükler içerir. Ancak "Bu nedenle" bağlacı, simgelerin pratik zorunluluğuna yol açan bir dil sorununu gerektirir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Yaz aylarında büyük kentlerin merkezleri, çevrelerindeki kırsal alanlara göre birkaç derece daha sıcak olur. Asfalt yollar, koyu renkli çatılar ve yoğun beton kütleler gün boyu güneş enerjisini emer ve güneş battıktan sonra da bu ısıyı yavaş yavaş havaya salar. Ağaç ve toprak yüzeylerin azlığı buharlaşma yoluyla serinlemeyi kısıtladığından kent geceleri bile yeterince soğuyamaz.

Bu parçadan aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Kent merkezlerindeki sıcaklık, çevredeki kırsal alanlardan daha yüksek ölçülebilmektedir.","Beton ve asfalt yüzeyler, gün içinde soğurdukları ısıyı gece de çevreye yayar.","Güneş battıktan sonra kent merkezlerindeki sıcaklık kırsal alanların altına düşer.","Bitki örtüsünün ve toprak alanların yetersizliği, kentlerin serinlemesini zorlaştırır.","Yüzey malzemelerinin niteliği, bir bölgenin gece sıcaklık düzenini etkileyebilir."],"correctIndex":2}'::jsonb,
  'Parça, gün boyu ısı emen asfalt ve betonun gece ısıyı yavaşça saldığını ve bu yüzden kentlerin geceleri bile yeterince soğuyamadığını anlatır. Kent merkezinin gece sıcaklığının kırsalın altına düştüğü yargısı metinle çelişir.',
  '"Güneş battıktan sonra" ifadesi soğuma beklentisi uyandırdığı için aday geceleri kentlerin kırsaldan daha serin hâle geldiğini sanabilir. Oysa metin geceleri de serinlemenin gerçekleşemediğini vurgular.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  '(I) Kışın göç etmeyip soğuk bölgelerde kalan bazı kuş türleri, sonbahar boyunca binlerce tohumu farklı yerlere saklar. (II) Kış geldiğinde karla örtülü ormanda bu gizli depoları tek tek bularak hayatta kalırlar. (III) Araştırmalar, bu kuşların beyinlerindeki mekânsal bellekten sorumlu bölgenin sonbaharda belirgin biçimde büyüdüğünü göstermektedir. (IV) Buna karşın göçmen kuşların yön bulma becerisi, yerin manyetik alanını ve yıldız konumlarını algılamaya dayanır. (V) Uzun göç rotaları boyunca enerji tasarrufu sağlamak için V biçiminde uçan sürüler, rüzgâr direncini paylaşır.

Bu parça iki paragrafa bölünmek istense ikinci paragraf hangi cümleyle başlamalıdır?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":3}'::jsonb,
  'İlk üç cümle göç etmeyen kuşların tohum saklama davranışını ve bunun mekânsal bellekle ilişkisini anlatır. IV. cümle ("Buna karşın") göçmen kuşların yön bulma ve uçuş düzenine geçer; bu nedenle ikinci paragraf IV. cümleyle başlamalıdır.',
  'III. cümle beyin araştırmasından söz ettiği için yeni bir paragraf başı gibi görünebilir. Ancak o cümle hâlâ tohum saklayan yerli kuşların belleğini açıklamaktadır; asıl konu ve özne değişimi IV. cümlededir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Deniz suyunda sürekli tuzlu nemle temas eden çelik gemi gövdeleri ve iskele ayakları, kısa sürede paslanarak zayıflar. Mühendisler bu aşınmayı yalnızca boyayla durduramayacaklarını bildikleri için gemi gövdesine çinko ya da magnezyum bloklar bağlarlar. Kimyasal olarak demirden daha etkin olan bu metaller, elektrik akımında kendi elektronlarını feda ederek demirin yerine kendileri aşınır; bu yüzden bunlara "kurban anot" adı verilir.

Bu parçadan aşağıdakilerden hangisine ulaşılabilir?',
  '{"options":["Boya kullanımı, tuzlu deniz suyundaki çelik yapıların paslanmasını tek başına ve kesin biçimde önler.","Çelik gemi gövdelerini korumak için kendinden daha az tepkimeye giren metaller gövdeye bağlanır.","Kurban anot yöntemi, çelik yerine daha etkin bir metalin aşınmasını sağlayarak ana yapıyı korur.","Magnezyum ve çinko bloklar, paslanmayı yalnızca tatlı su göllerinde engelleyebilir.","Gemi gövdelerine bağlanan koruyucu metaller hiç aşınmadan ömür boyu kullanılabilir."],"correctIndex":2}'::jsonb,
  'Parça, boyanın tek başına yetmediğini ve demirden daha etkin olan çinko/magnezyum blokların demirin yerine aşınarak gemi gövdesini koruduğunu açıkça anlatmaktadır.',
  'Kurban anotların gövdeye bağlanması, bu blokların paslanmaya karşı dirençli olduğu ve hiç aşınmadığı izlenimini doğurabilir. Oysa metin, bu metallerin bilerek kendi kendilerini aşındırarak çeliği koruduğunu vurgular.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Bilim ve teknoloji alanlarında uzmanlaşma derinleştikçe her çalışma alanı kendi kavramlarını, kısaltmalarını ve yöntem dilini üretiyor. Bu derinleşme kendi alanı içinde büyük bir hız ve incelik sağlıyor; ancak bir iklim bilimciyle bir kent plancısının ya da bir hekimle bir veri mühendisinin aynı masa etrafında birbirini anlamasını güçleştiriyor. Karmaşık sorunların hiçbiri tek bir uzmanlığın sınırları içine sığmadığı için artık uzmanlık kadar disiplinler arası ortak bir dil kurabilmek de değer kazanıyor.

Bu parçada yazarın savunduğu temel görüş aşağıdakilerden hangisidir?',
  '{"options":["Uzmanlaşma, bilimsel ilerlemeyi yavaşlattığı için tümüyle terk edilmelidir.","Karmaşık sorunların çözümü için derin uzmanlığın yanında farklı alanlar arasında anlaşmayı sağlayacak ortak bir dil de gereklidir.","Farklı alanlardaki uzmanların kendi teknik kavramlarını kullanması yasaklanmalıdır.","Hekimlik ve mühendislik gibi alanların sorunları yalnızca kendi içinde çözülebilir.","Disiplinler arası çalışma, her zaman derin uzmanlığın yerini almalıdır."],"correctIndex":1}'::jsonb,
  'Yazar, uzmanlaşmanın hız ve incelik sağladığını kabul etmekle birlikte sorunların tek alana sığmadığını belirterek farklı uzmanlıklar arasında ortak bir dil kurabilmenin önemini savunur.',
  'Uzmanlaşmanın iletişim engeli yarattığı vurgulandığı için aday yazarın uzmanlaşmaya tamamen karşı olduğunu düşünebilir. Oysa ikinci cümle uzmanlaşmanın hız ve incelik sağladığını açıkça kabul eder.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  '(I) Deniz kıyılarındaki kumullar, ilk bakışta rüzgârın savurduğu cansız kum tepeleri gibi görünür. (II) Aslında bu tepeler, fırtınalı günlerde yükselen dalgaların iç kesimlere ulaşmasını engelleyen doğal bir kıyı setidir. (III) Kumul üzerinde kök salabilen dayanıklı kıyı bitkileri, kök ağlarıyla kumu tutarak tepelerin rüzgârla dağılmasını önler. (IV) Yaz turizminde deniz kıyısındaki otellerin doluluk oranı mevsimlere göre değişir. (V) Bitki örtüsü tahrip edilen kumullar ise hızla hareket ederek ardındaki tarım alanlarını ve yolları kum altında bırakabilir.

Bu parçadaki numaralanmış cümlelerden hangisi düşüncenin akışını bozmaktadır?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":3}'::jsonb,
  'Parça, kıyı kumullarının doğal kıyı seti işlevini ve kıyı bitkilerinin kumulları nasıl sabitlediğini anlatır. IV. cümle ise otel doluluk oranlarına geçerek ekolojik ve jeolojik bütünlüğü bozar.',
  'IV. cümlede "deniz kıyısı" ifadesi geçtiği için parçayla ortak bir mekân paylaşıyormuş gibi görünür. Ancak parçanın konusu turizm işletmeciliği değil, kıyı kumullarının doğal koruma işlevidir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Bir semtin yenilenmesiyle artan kiralar, ilk aşamada yalnızca binaların değerlendiğini gösterir gibi durur. Ne var ki kira artışını karşılayamayan eski terzi, fırıncı ve kitapçı dükkânı kapattığında mahallenin yalnızca ticari bileşimi değişmez. Yıllar içinde oluşan komşuluk hafızası, güven ağı ve mahallenin kendine özgü gündelik ritmi de yerini her yerde birbirinin aynısı olan zincir mağazalara bırakır.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Kira artışları nedeniyle eski esnafın çekilmesi, bir mahallenin yalnızca ekonomik yapısını değil toplumsal dokusunu ve kimliğini de değiştirir.","Binaların değerlenmesi, her zaman mahalledeki yaşam kalitesini aynı ölçüde yükseltir.","Zincir mağazalar, eski esnafa kıyasla komşuluk ilişkilerini daha hızlı güçlendirir.","Bir mahallenin kimliği, yalnızca binaların dış cephe görünümüyle belirlenir.","Eski dükkânların kapanması, semt sakinlerinin günlük yaşamını hiçbir biçimde etkilemez."],"correctIndex":0}'::jsonb,
  'Parça, kira artışıyla eski esnafın ayrılmasının sadece ticari bir değişim olmadığını; komşuluk hafızası, güven ağı ve özgün kent ritmini de silip mahalleyi tekdüzeleştirdiğini vurgular.',
  'İlk cümlede "binaların değerlendiğini gösterir" denmesi olumlu bir gelişme algısı yaratabilir. Ancak devamındaki cümleler bu değerlenmenin mahallenin ruhu açısından doğurduğu kaybı anlatır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Güneş ve rüzgâr santralleri temiz elektrik üretir; ancak üretim miktarları hava durumuna ve günün saatine göre sürekli değişir. ....... Bu nedenle enerji dönüşümü yalnızca yeni santraller kurmaktan ibaret değildir; üretilen fazla elektriği saklayabilen batarya ve pompaj sistemleri kurmayı, tüketimi de üretimin bol olduğu saatlere kaydırabilmeyi gerektirir.

Bu parçada boş bırakılan yere düşüncenin akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["Oysa elektrik şebekesi, her saniye üretilen enerji ile tüketilen enerji arasında tam bir denge kurulmasını zorunlu kılar.","Bu yüzden güneş santralleri yalnızca geceleri elektrik üretimi yapabilir.","Yenilenebilir kaynakların payı arttıkça elektrik şebekesinde hiçbir denge sorunu yaşanmaz.","Rüzgâr santralleri, bütün mevsimlerde aynı sabit güçte elektrik üretir.","Tüketim alışkanlıkları, enerji santrallerinin çalışma biçiminden tamamen bağımsızdır."],"correctIndex":0}'::jsonb,
  'İlk cümle üretimin sürekli değiştiğini söyler; boşluktan sonraki cümle ise depolama ve tüketimi kaydırma gerekliliğini belirtir. Bu iki düşünceyi birbirine bağlayan ara halka, elektrik şebekesinin üretim ile tüketim arasında anlık denge gerektirdiğini söyleyen cümledir.',
  'Temiz elektrik vurgusuna kapılan aday şebekede sorun yaşanmadığını söyleyen seçeneğe yönelebilir. Oysa sonraki "Bu nedenle ... yalnızca yeni santraller kurmaktan ibaret değildir" cümlesi bir kısıt ve denge ihtiyacını zorunlu kılar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Karmaşık toplumsal meseleler, çoğu zaman üç beş kelimelik sloganlara ve iki zıt kutba sıkıştırılarak tartışılır. Hızlı paylaşılan bu keskin yargılar dikkat çekmekte etkilidir; fakat nüansları, yerel koşulları ve ara çözümleri görünmez kılar. Oysa gerçek sorunların çözümü, taraflardan birinin diğerini tamamen susturmasından değil, farklı boyutları aynı anda görebilmekten geçer.

Bu parçada asıl vurgulanmak istenen aşağıdakilerden hangisidir?',
  '{"options":["Toplumsal sorunları kısa sloganlara ve ikili karşıtlıklara indirgemek, çözüm için gerekli ayrıntıları gözden kaçırır.","Kısa ve keskin sloganlar, karmaşık meselelerin tüm yönlerini eksiksiz anlatır.","Toplumsal tartışmalarda karşıt görüşlerden yalnızca birinin öne çıkması yeterlidir.","Yerel koşullar, toplumsal sorunların çözümünde dikkate alınması gerekmeyen ayrıntılardır.","Hızlı paylaşılan yargılar, ara çözümlerin herkesçe benimsenmesini kolaylaştırır."],"correctIndex":0}'::jsonb,
  'Yazar, karmaşık meselelerin sloganlara ve iki kutba sıkıştırılmasının dikkat çekse bile nüansları ve ara çözümleri yok ettiğini, çözümün ise çok boyutlu bakışta yattığını vurgular.',
  '"Dikkat çekmekte etkilidir" ifadesi, keskin yargıların tartışma için yararlı sayıldığı izlenimini verebilir. Ancak yazar "fakat" ve "Oysa" bağlaçlarıyla bu yaklaşımın çözüme engel olduğunu ortaya koyar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Çocuklara hiç sınır koymamak kadar bütün kararları onlar adına vermek de sorumluluk gelişimini zedeler. Bunun yerine çocuğa "Mavi kazağı mı yoksa yeşil kazağı mı giymek istersin?" gibi çerçevesi belirlenmiş iki seçenek sunmak, hem sınırları korur hem de çocuğa kendi kararının sonucunu deneyimleme fırsatı verir. Küçük yaşta bu tür seçimler yapan çocuk, ileride daha büyük kararlar alırken de öz güven kazanır.

Bu parçadan aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Sınırsız özgürlük kadar her kararı yetişkinin vermesi de çocuk gelişimi açısından sakıncalıdır.","Çocuğa sınırlı seçenekler sunmak, karar alma becerisinin gelişmesine yardımcı olabilir.","Çerçeveli seçimler, çocuğun kuralları ve sınırları öğrenmesini tamamen engeller.","Küçük kararların sorumluluğunu almak, ileriki yaşlardaki öz güveni destekleyebilir.","Seçeneklerin yetişkin tarafından sınırlandırılması, çocuğun seçim yapmasını ortadan kaldırmaz."],"correctIndex":2}'::jsonb,
  'Parça, çocuğa çerçevesi belirlenmiş iki seçenek sunmanın hem sınırları koruduğunu hem de karar deneyimi kazandırdığını açıkça söyler. Bu nedenle sınırları öğrenmeyi tamamen engellediği yargısı parçayla çelişir.',
  'Sınır koymamakla ilgili eleştiri nedeniyle aday çocuğa seçenek sunmanın da sınırları bozacağını düşünebilir. Oysa metin "hem sınırları korur" diyerek iki yararın birlikte sağlandığını belirtir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Ay''ın kütle çekimi, Dünya''nın ona bakan ve ters yöndeki okyanus sularını kendine doğru çekerek günlük gelgitleri oluşturur. Gelgit sularının okyanus tabanıyla ve kıyı şeridiyle sürtünmesi, Dünya''nın kendi ekseni etrafındaki dönüşünü her yüzyılda saniyenin küçük bir kesri kadar yavaşlatır. Bu nedenle milyonlarca yıl önce Dünya''da bir gün şimdikinden daha kısaydı ve Ay da Dünya''ya bugünkünden biraz daha yakındı.

Bu parçada aşağıdakilerden hangisine değinilmemiştir?',
  '{"options":["Gelgit olayının temel fiziksel nedenine","Gelgit sürtünmesinin Dünya''nın dönüş hızına etkisine","Geçmiş jeolojik dönemlerde günlerin daha kısa olduğuna","Ay''ın yörünge uzaklığının geçmişte daha yakın olduğuna","Ay yüzeyindeki kraterlerin nasıl oluştuğuna"],"correctIndex":4}'::jsonb,
  'Parçada Ay''ın kütle çekiminin gelgit oluşturması, sürtünmenin Dünya''nın dönüşünü yavaşlatması, geçmişte günlerin daha kısa ve Ay''ın daha yakın olması anlatılır; Ay yüzeyindeki kraterlere değinilmez.',
  'Parça Ay''ın fiziksel etkilerini ve milyonlarca yıl öncesini anlattığı için aday Ay yüzeyinin özelliklerine de değinildiğini sanabilir. Oysa metin yalnızca Ay-Dünya kütle çekimi ve gelgit ilişkisiyle sınırlıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'I. Bu yüzden tuz yataklarına sahip yerleşimler ve tuz kervanlarının geçtiği yollar, yüzyıllar boyunca devletlerin en çok koruduğu stratejik noktalar oldu.
II. Soğutma teknolojilerinin bulunmadığı çağlarda avlanan balıkların ve etlerin bozulmadan saklanabilmesi hayati bir sorundu.
III. Tuz, besindeki suyu çekerek mikroorganizmaların çoğalmasını durdurduğu için gıdayı aylarca koruyabilen tek yaygın maddeydi.
IV. Bu koruma özelliği, tuzu yalnızca bir yemek lezzetlendiricisi olmaktan çıkarıp orduların ve uzun deniz yolculuklarının vazgeçilmez erzağına dönüştürdü.
V. Talebin böylesine yüksek olması, tuzun tarih boyunca bazı dönemlerde ödeme aracı ve ağır bir vergi konusu hâline gelmesine yol açtı.

Bu cümlelerle anlamlı bir paragraf oluşturulduğunda baştan üçüncü cümle hangisi olur?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":3}'::jsonb,
  'Doğru sıralama II - III - IV - V - I biçimindedir. II. cümle soğutma öncesi dönemin gıda saklama sorununu verir; III. cümle tuzun bunu nasıl çözdüğünü anlatır; IV. cümle ("Bu koruma özelliği") tuzun stratejik erzağa dönüşmesini belirtir; V. cümle ("Talebin böylesine yüksek olması") bu önemin ekonomik sonucunu açıklar; I. cümle ("Bu yüzden") devletlerin tuz yollarını korumasını genel sonuç olarak bağlar. Baştan üçüncü cümle IV.''tür.',
  'I. cümle devletlerin korumasından söz ettiği için IV.''ün ardından hemen gelebilir gibi görünür; ancak V. cümledeki "Talebin böylesine yüksek olması" ifadesi tuzun vazgeçilmez erzak sayıldığı IV. cümleye doğrudan yaslanır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Ağırlık antrenmanı yapan pek çok kişi, kasların tam olarak ağırlığı kaldırırken büyüdüğünü sanır. Oysa egzersiz sırasında kas liflerinde yalnızca mikroskobik düzeyde küçük yırtıklar oluşur. Asıl büyüme ve güçlenme, antrenmandan sonraki dinlenme ve uyku saatlerinde bedenin bu lifleri eskisinden daha sağlam biçimde onarmasıyla gerçekleşir; bu nedenle ara vermeden aynı kası çalıştırmak gelişimi hızlandırmak yerine aksatır.

Bu parçada aşağıdakilerden hangisine değinilmemiştir?',
  '{"options":["Egzersiz sırasında kas liflerinde meydana gelen duruma","Kas onarımının ve büyümesinin hangi süreçte gerçekleştiğine","Aynı kası dinlendirmeden çalıştırmanın sonucuna","Antrenmanla ilgili yaygın bir yanlış inanışa","Antrenman sırasında uyulması gereken nefes tekniklerine"],"correctIndex":4}'::jsonb,
  'Parçada egzersizle ilgili yaygın yanılgı, kas liflerindeki mikroskobik yırtıklar, büyümenin dinlenme ve uykuda gerçekleşmesi ve aralıksız çalışmanın gelişimi aksatması anlatılır; nefes tekniklerine değinilmez.',
  'Ağırlık antrenmanı konusu geçtiği için aday egzersiz tekniğine dair nefes bilgisi de verildiğini düşünebilir. Oysa metin tamamen yüklenme ve dinlenme arasındaki biyolojik döngüyü açıklar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Kendi doğal ortamında böcekler, mantarlar ve rakip bitkiler tarafından dengede tutulan bir bitki türü, başka bir kıtaya taşındığında bu doğal düşmanlarından kurtulmuş olur. Karşısında onu sınırlayan bir etken kalmadığı için hızla yayılır ve yerli bitkilerin suyunu, ışığını ve toprağını elinden alır. Örneğin Kuzey Amerika''dan Avrupa kıyılarına taşınan bazı su bitkileri, göl yüzeyini kısa sürede halı gibi kaplayarak yerli su canlılarının oksijensiz kalmasına yol açabilmektedir.

Bu parçada yazar, düşüncesini geliştirirken aşağıdakilerden hangilerine başvurmuştur?',
  '{"options":["Tanık gösterme ve sayısal verilerden yararlanma","Tanımlama ve benzetme","Örnekleme ve benzetme","Sayısal verilerden yararlanma ve karşılaştırma","Tanımlama ve tanık gösterme"],"correctIndex":2}'::jsonb,
  'Yazar, "Örneğin Kuzey Amerika''dan Avrupa kıyılarına taşınan..." cümlesiyle örnekleme yapmış; aynı cümlede göl yüzeyinin kaplanmasını "halı gibi" ifadesiyle somutlaştırarak benzetmeden yararlanmıştır.',
  'Parçada iki kıta adı geçtiği için aday karşılaştırma aramaya yönelebilir; ancak burada kıtalar kıyaslanmaz, istilacı türlerin etkisine somut bir örnek verilir ve "halı gibi" benzetmesi kullanılır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Bir yörede kullanılan yerel sözcükler ve deyimler, yalnızca konuşmaya renk katan eski söyleyişler değildir. Deniz kıyısında yaşayan bir topluluğun rüzgâr yönleri için onlarca ayrı ad türetmesi ya da dağlık bir köyde kar türlerinin her aşamasına farklı bir sözcük verilmesi, dilin coğrafyayla ve geçim biçimiyle nasıl örüldüğünü gösterir. Bu yerel söz varlığı kaybolduğunda yalnızca kelimeler değil, doğayı okuma bilgisi de silinir.

Bu parçadan aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Yerel sözcükler, bir toplumun yaşadığı coğrafyayla kurduğu ilişkiyi yansıtabilir.","Farklı geçim biçimleri, dilde belirli kavramların ayrıntılanmasına yol açabilir.","Yerel söz varlığının yitirilmesi, doğayla ilgili birikimin de kaybolmasına neden olabilir.","Deniz ve dağ yaşamı gibi koşullar, günlük dilin kelime çeşitliliğini etkileyebilir.","Standart dil geliştikçe yerel ağızlardaki bütün sözcüklerin unutulması doğaldır ve kayıp sayılmaz."],"correctIndex":4}'::jsonb,
  'Parça, yerel söz varlığı kaybolduğunda yalnızca kelimelerin değil doğayı okuma bilgisinin de silindiğini vurgular. Bu nedenle unutulmasının kayıp sayılmadığı yargısı parçayla taban tabana zıttır.',
  'Yerel sözcüklerin yalnızca konuşmaya renk katmadığı belirtildiğinde aday standart dilin bunların yerini doldurabileceği sonucuna kayabilir. Oysa son cümle bu kaybın bilgi kaybı olduğunu açıkça vurgular.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Çelik demir yolu rayları, yaz sıcağında uzar, kış soğuğunda ise kısalır. Geçmişte mühendisler, rayların sıcak havalarda birbirini iterek bükülmesini önlemek amacıyla ray parçaları arasında küçük genleşme boşlukları bırakırdı. Ancak bu boşluklar tren tekerlekleri geçerken gürültüye ve aşınmaya yol açtığı için modern hızlı tren hatlarında raylar özel tekniklerle gerilerek birbirine kaynaklanır; böylece .......

Bu parçanın sonuna düşüncenin akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["rayların arasındaki boşluklar daha da genişletilerek gürültü artırılmış olur.","rayların sıcaklıkla uzama özelliği bütünüyle ortadan kaldırılmış olur.","hatlar yalnızca kış aylarında kullanılabilecek biçimde sınırlandırılır.","demir yolu yapımında çelik yerine tamamen ahşap malzemeye geçilir.","boşlukların yarattığı sarsıntı ve aşınma olmadan yüksek hızda güvenli yolculuk sağlanır."],"correctIndex":4}'::jsonb,
  'Parça, eski ray boşluklarının bükülmeyi önlese de gürültü ve aşınmaya yol açtığını, modern hatlarda ise rayların özel tekniklerle gerilip kaynaklandığını anlatır. "Böylece" ile gelen sonuç, boşlukların yol açtığı sarsıntı ve aşınma ortadan kalkarak yüksek hızda güvenli yolculuğun sağlandığını bildirmelidir.',
  'Rayların kaynaklanması, çeliğin sıcaklıkla genleşme yasasının yok edildiği gibi yanlış bir sonuca götürebilir. Oysa fizik yasası ortadan kalkmaz; yalnızca kaynak ve gerdirme tekniğiyle boşluksuz ve pürüzsüz bir hat elde edilir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Enflasyon çoğu zaman yalnızca market rafındaki etiketlerin yükselmesi olarak hissedilir. Oysa fiyatların sürekli ve öngörülemez biçimde artması, bireylerin ve işletmelerin gelecek yılki maliyetleri hesaplamasını imkânsız kılar. Yarının fiyatını kestiremeyen bir üretici uzun vadeli yatırıma cesaret edemez, hane halkı da birikim yapmak yerine parasının değerini kaybetmeden hemen tüketime yönelir.

Bu parçada asıl anlatılmak istenen aşağıdakilerden hangisidir?',
  '{"options":["Enflasyon, yalnızca alım gücünü düşürmekle kalmaz; öngörülebilirliği yok ederek yatırım ve tasarruf kararlarını da bozar.","Fiyat artışları, tüketicilerin uzun vadeli birikim yapmasını her zaman kolaylaştırır.","Üreticiler, enflasyon dönemlerinde gelecek yılki maliyetleri daha kesin biçimde hesaplar.","Market etiketlerindeki artışlar, enflasyonun ekonomi üzerindeki tek etkisidir.","Enflasyon ortamında hemen tüketime yönelmek, uzun vadeli yatırımları hızlandırır."],"correctIndex":0}'::jsonb,
  'Parça, enflasyonun yalnızca etiket artışı olarak görülmemesi gerektiğini, öngörülemezlik yüzünden üreticinin yatırımdan kaçtığını ve hanelerin tasarruf yerine erken tüketime yöneldiğini anlatır.',
  'İlk cümlede market etiketleri anıldığı için aday enflasyonun yalnızca günlük fiyat artışı boyutuna odaklanabilir. Oysa "Oysa" ile başlayan devam cümleleri, asıl tahribatın öngörülebilirlik ve planlama üzerinde olduğunu gösterir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  '(I) Okuryazarlık denince çoğu kişinin aklına yalnızca basılı ya da dijital metinleri okuyup anlayabilmek gelir. (II) Oysa güncel ekonomi, sağlık ve çevre tartışmalarının neredeyse tamamı tablolar, haritalar ve grafiklerle sunulmaktadır. (III) Eksen başlıkları, ölçek aralıkları veya başlangıç noktası incelenmeden bakılan bir grafik, küçük bir artışı dev bir sıçrama gibi gösterebilir. (IV) Özellikle seçim dönemlerinde seçmen eğilimlerini gösteren renkli haritalar medya kuruluşlarınca sıkça paylaşılır. (V) Yüzölçümü büyük ama nüfusu seyrek bölgelerin haritada geniş yer kaplaması, gerçek seçmen dağılımını olduğundan farklı algılamamıza yol açabilir.

Bu parça iki paragrafa bölünmek istense ikinci paragraf hangi cümleyle başlamalıdır?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":3}'::jsonb,
  'İlk üç cümle genel okuryazarlık kavramını grafik ve ölçek yorumlama üzerinden ele alır. IV. cümle ise seçim dönemlerindeki haritalar ve nüfus/yüzölçümü algısı gibi özel bir alana geçer; bu yüzden ikinci paragraf IV. cümleyle başlamalıdır.',
  'II. cümlede "haritalar" sözü geçtiği için IV. cümleyle tek blokmuş gibi görünebilir. Ancak II. ve III. cümleler grafik eksenleri ve ölçek okuma sorununu sürdürürken IV. cümle seçim haritaları ve medya paylaşımı örneğine geçerek yeni bir alt başlık açar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  '(I) Evde yankıyı azaltmak için duvarlara yapıştırılan sünger panellerle komşu daireden gelen sesi engellemek için yapılan duvar dolgusu aynı işlevi görmez. (II) Gözenekli ve hafif süngerler oda içindeki ses dalgalarının sert yüzeylerden sekmesini azaltarak akustiği iyileştirir; ancak sesin duvarı aşmasını durduracak kütleye sahip değildir. (III) Ses yalıtımı ise ağır, yoğun ve hava sızdırmaz katmanlar kullanarak ses enerjisinin bir mekândan diğerine geçmesini engellemeye dayanır. (IV) Bu ayrımı bilmeyen pek çok kişi, yanlış malzeme seçtiği için masraf yaptığı hâlde gürültü sorununu çözemez.

Bu parçadaki IV. cümlenin işlevi aşağıdakilerden hangisidir?',
  '{"options":["Önceki cümlelerde açıklanan teknik farkın gündelik yaşamdaki sonucunu belirtmek","Ses yalıtımında kullanılan malzemelerin üretim maliyetini karşılaştırmak","Sünger panellerin oda içindeki akustiği nasıl bozduğunu örneklemek","I. cümlede ortaya konulan yargıya tamamen karşı çıkmak","Hava sızdırmaz katmanların fiziksel tanımını yapmak"],"correctIndex":0}'::jsonb,
  'İlk üç cümle ses emilimi (akustik düzenleme) ile ses yalıtımı arasındaki teknik farkı açıklar; IV. cümle ("Bu ayrımı bilmeyen pek çok kişi...") bu teknik ayrımın bilinmemesinin pratikte yol açtığı olumsuz sonucu bildirir.',
  'IV. cümlede "masraf yaptığı hâlde" ifadesi geçtiği için aday bunu maliyet karşılaştırması sanabilir. Oysa cümle fiyatları kıyaslamaz, yanlış malzeme seçiminin doğurduğu pratik sonucu özetler.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'I. Bu sayede bilim insanları, yüzyıllar önce yaşanmış kuraklıkların tam olarak hangi yıllarda başladığını ağaçları kesmeden çıkarabilmektedir.
II. Ağaç gövdelerindeki büyüme halkaları yalnızca ağacın yaşını söylemekle kalmaz.
III. Yağışın bol olduğu yıllarda ağaç hızla büyüdüğü için geniş bir halka, kurak yıllarda ise çok dar bir halka oluşur.
IV. Aynı bölgedeki farklı ağaçların halka örüntüleri birleştirildiğinde geçmişe uzanan kesintisiz bir iklim takvimi elde edilir.
V. Üstelik bu halkalar, kalem kalınlığında ince bir burguyla alınan küçük örnekler üzerinden de incelenebilir.

Bu cümlelerle anlamlı bir paragraf oluşturulduğunda baştan ikinci cümle hangisi olur?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":2}'::jsonb,
  'Doğru sıralama II - III - IV - V - I biçimindedir. II. cümle büyüme halkalarının yaştan fazlasını anlattığını söyler; III. cümle yağışlı ve kurak yıllarda halka kalınlığının nasıl değiştiğini açıklar; IV. cümle bu halka örüntülerinin iklim takvimi oluşturduğunu belirtir; V. cümle ("Üstelik bu halkalar") inceleme yöntemini ekler; I. cümle ("Bu sayede... ağaçları kesmeden") V.''teki yöntemin sonucunu bağlar. Baştan ikinci cümle III.''tür.',
  'IV. cümle halka örüntülerinden söz ettiği için II.''nin hemen ardından gelebilirmiş gibi görünür. Ancak "halka örüntüleri" ifadesi, geniş ve dar halkaların nasıl oluştuğunu açıklayan III. cümleden sonra anlam kazanır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  '(I) Anadolu''nun pek çok bölgesinde yüzyıllar boyunca kullanılan kerpiç ve taş yapılar, yerel iklime kendiliğinden uyum gösteren özellikler taşır. (II) Kalın kerpiç duvarlar yaz sıcağını gün boyu dışarıda tutarken kışın içerideki ısının hızla kaçmasını yavaşlatır. (III) Yapımında çevreden çıkarılan toprak ve saman kullanıldığı için doğaya yabancı atık bırakmaz. (IV) Geleneksel halı dokumacılığında kullanılan yün iplikler, kök boyalarla renklendirildikten sonra güneşte kurutulur. (V) Günümüzde sürdürülebilir mimari akımları, bu eski yapı bilgisini modern mühendislik ilkeleriyle yeniden yorumlamaktadır.

Bu parçadaki numaralanmış cümlelerden hangisi düşüncenin akışını bozmaktadır?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":3}'::jsonb,
  'Parça, Anadolu''daki geleneksel kerpiç ve taş yapıların iklim uyumu, ısı yalıtımı ve çevre dostu yönlerini anlatmaktadır. IV. cümle ise geleneksel halı dokumacılığına geçerek konu bütünlüğünü bozar.',
  'IV. cümlede "geleneksel" bir zanaattan söz edildiği için V. cümledeki "eski yapı bilgisi" ile bağlantılıymış izlenimi verebilir. Ancak parçanın konusu el sanatları değil, yerel yapı malzemeleri ve mimaridir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Taş duvarlı loş atölyenin ortasında duran ahşap tezgâh, yılların bıraktığı kil lekeleriyle kaplıydı. Yüksek pencereden süzülen ikindi ışığı, raflarda yan yana dizilmiş henüz pişmemiş testilerin nemli yüzeylerinde mat bir parıltı bırakıyordu. Köşedeki eski sobanın üzerinde kaynayan çaydanlığın ince buharı, odadaki ıslak toprak kokusuna karışıp tavan kirişlerine doğru yükseliyordu.

Bu parçada ağır basan anlatım biçimi aşağıdakilerden hangisidir?',
  '{"options":["Öyküleyici anlatım","Açıklayıcı anlatım","Tartışmacı anlatım","Betimleyici anlatım","Hem açıklayıcı hem tartışmacı anlatım"],"correctIndex":3}'::jsonb,
  'Parçada bir olay örgüsü ya da zaman içinde gelişen bir eylem zinciri yoktur; yalnızca bir çömlekçi atölyesinin görsel, dokunsal ve kokusal ayrıntıları (loş atölye, kil lekeleri, ikindi ışığı, nemli yüzey, ıslak toprak kokusu) durağan bir tablo gibi gözler önüne serilmektedir. Bu nedenle ağır basan anlatım biçimi betimleyici anlatımdır.',
  'Parçada "süzülen", "yükseliyordu" gibi fiiller geçtiği için aday hareket çağrışımıyla öyküleyici anlatıma yönelebilir. Oysa burada bir karakterin başından geçen olaylar değil, yalnızca bir mekânın görünümü ve atmosferi anlatılmaktadır.',
  array['lisans_gygk']::text[],
  'lisans'
);
