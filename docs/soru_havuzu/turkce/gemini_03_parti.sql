-- ==========================================================================
-- KADRO SORU HAVUZU · KPSS GY Türkçe · GEMİNİ PARTİ 3 (30 soru: 10 Paragraf, 8 Yazım, 7 Noktalama, 5 Anlatım Bozukluğu) · SUPABASE SQL
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
  'Mühendislikte "metal yorgunluğu" adı verilen olgu, bir parçanın tek seferde kaldırabileceği sınırın çok altındaki küçük kuvvetlere binlerce kez maruz kalmasıyla ortaya çıkar. Örneğin bir uçak gövdesi her kalkış ve inişte basınç değişimiyle hafifçe esner. İlk bakışta önemsiz görünen bu mikro esnemeler, perçin delikleri çevresinde gözle görülmeyen çatlaklar başlatır; çatlak belirli bir eşiği aştığında ise metal, normal çalışma yükü altında bile aniden kırılabilir.

Bu parçada asıl vurgulanmak istenen aşağıdakilerden hangisidir?',
  '{"options":["Uçak gövdelerinde perçin kullanımı yerine yalnızca tek parça alaşımlar tercih edilmelidir.","Tek başına zararsız görünen küçük yüklerin tekrarlanması, zamanla metal yapılarda ani kırılmalara yol açabilecek gizli hasarlar biriktirir.","Metal parçalar yalnızca tasarım sınırlarını aşan ani ve büyük darbeler altında kırılır.","Basınç değişimleri yalnızca yüksek irtifaya çıkan uçak gövdelerinde görülür.","Gözle görülmeyen çatlaklar, metalin dayanıklılığını hiçbir biçimde etkilemez."],"correctIndex":1}'::jsonb,
  'Parça, tek seferde tehlikeli olmayan küçük yüklerin binlerce kez tekrarlanmasının mikro çatlaklar biriktirdiğini ve sonunda normal yük altında bile ani kırılmaya yol açabildiğini vurgulamaktadır.',
  'Günlük deneyimde metalin yalnızca büyük bir darbeyle kırılacağı düşünülür; bu nedenle sınırları aşan ani darbe vurgusu çekici gelebilir. Oysa metin, küçük tekrarların birikimli tahribatına dikkat çeker.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Bir ormanda devrilip çürümeye başlayan yaşlı bir ağaç gövdesi, dışarıdan bakıldığında ömrünü tamamlamış bir atık gibi görünebilir. Oysa ekolojistler bu gövdelere "bakıcı kütük" adını verir; çünkü süngerleşen odun dokusu yağmur suyunu tutar, yüzlerce böcek ve mantar türüne yuva olur ve kurak yaz aylarında bile nemli kalarak üzerine düşen genç fidanların kök salmasını sağlar. Böylece bir ağacın ölümü, ormandaki yeni bir kuşağın başlangıç zeminine dönüşür.

Bu parçadan aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Çürümekte olan ağaç gövdeleri, orman ekosisteminde su tutma görevi görebilir.","Ormandaki ekolojik döngü, ölen ağaçların tamamen ormandan çıkarılmasıyla hızlanır.","Böcek ve mantar türleri, çürüyen ağaç dokusunu yaşam alanı olarak kullanabilir.","Devrilmiş yaşlı ağaçlar, yeni fidanların tutunması için elverişli bir ortam oluşturabilir.","Çürümüş gövdeler kurak dönemlerde nemi koruyarak çevreye katkı sağlayabilir."],"correctIndex":1}'::jsonb,
  'Parça, çürüyen ağaç gövdelerinin suyu tutarak canlılara yuva olduğunu ve genç fidanları beslediğini anlatır. Bu gövdelerin ormandan çıkarılmasının ekolojik döngüyü hızlandıracağı yargısı parçanın ana fikriyle çelişir.',
  '"Ömrünü tamamlamış bir atık gibi görünebilir" ifadesi, devrilmiş gövdelerin temizlenmesi gerektiği düşüncesini çağrıştırabilir. Oysa yazar bu ilk bakışı "Oysa" diyerek reddeder ve kütüğün yaşamsal işlevini açıklar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Market raflarında "yağsız" ya da "düşük yağlı" etiketi taşıyan pek çok ürün, sağlıklı bir seçenek gibi algılanır. ....... Bu nedenle beslenme uzmanları, ön yüzdeki tek bir iddiaya güvenmek yerine ürünün arkasındaki besin değerleri ve içindekiler listesinin birlikte incelenmesini önerir.

Bu parçada boş bırakılan yere düşüncenin akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["Yağ çıkarıldığında ürünün tadını ve kıvamını korumak için çoğu zaman fazladan şeker ya da nişasta eklenir.","Düşük yağlı ürünlerin tamamı, işlenmemiş doğal ürünlerden daha yüksek besin değerine sahiptir.","Ambalajların ön yüzündeki etiketler, ürünün bütün besin içeriğini eksiksiz özetler.","Yağ oranı düşürülen gıdalar, her koşulda daha az kalori içerir.","Tüketiciler genellikle ürünlerin arka yüzündeki içerik listesini ön yüzdeki slogandan daha önce okur."],"correctIndex":0}'::jsonb,
  'Boşluktan önce "yağsız" etiketinin sağlıklı algılandığı söylenir; ardından "Bu nedenle ... tek bir iddiaya güvenmek yerine içindekiler listesinin incelenmesi" önerilir. Araya bu öneriyi gerekçelendiren durum, yani yağ çıkarılınca tat için şeker ya da nişasta eklenebilmesi gelmelidir.',
  '"Düşük yağlı ürünlerin daha az kalori içerdiği" yaygın bir inanış olduğu için kulağa doğru gelebilir. Ancak boşluktan sonraki uyarı, ön yüzdeki iddianın yanıltıcı olabileceğini açıkça göstermektedir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'I. Bu nedenle bazı deniz fenerleri, sanıldığı gibi yalnızca karanlık çöktükten sonra işe yarayan gece yapıları değildir.
II. Antik Çağ''dan itibaren tehlikeli kayalıkların bulunduğu kıyılarda gemicilere yön göstermek için yüksek kuleler inşa edildi.
III. Gece boyunca tepelerinde yakılan odun ve reçine ateşleri, kilometrelerce öteden sığlıkların yerini haber verirdi.
IV. Bazı kulelerde gündüz saatlerinde ise aynı ateşin üzerine nemli otlar atılarak gökyüzüne yükselen yoğun bir duman sütunu oluşturulurdu.
V. Rüzgârlı ve puslu havalarda bile görülebilen bu sütun, kaptanlara liman girişini ve tehlikeli burunları seçme imkânı tanırdı.

Bu cümlelerle anlamlı bir paragraf oluşturulduğunda baştan üçüncü cümle hangisi olur?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":3}'::jsonb,
  'Doğru sıralama II - III - IV - V - I biçimindedir. II. cümle deniz fenerlerinin kuruluş amacını tanıtır; III. cümle gece yakılan ateşlerin işlevini anlatır; IV. cümle ("Gündüz saatlerinde ise aynı ateşin...") gece kullanımının ardından gündüz işlevine geçer; V. cümle ("bu sütun") IV.''teki duman sütununun yararını açıklar; I. cümle ("Bu nedenle ... yalnızca karanlık çöktükten sonra") gündüz kullanımını da içeren sonucu bağlar. Baştan üçüncü cümle IV.''tür.',
  'I. cümle "Bu nedenle" bağlacıyla başladığı için III.''ün hemen arkasına konulmak istenebilir; ancak "yalnızca gece yapıları değildir" hükmü ancak gündüz duman işaretini anlatan IV. ve V. cümlelerden sonra söylenebilir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Çoğumuz sesli okumayı yalnızca ilkokul sıralarında harfleri sökmeye çalışan çocuklara özgü bir alıştırma sayarız. Oysa yazdığı bir raporu ya da konuşma metnini kendine sesli okuyan bir yetişkin, gözle okurken fark etmediği soluk kesen uzun cümleleri, yinelenen sözcükleri ve aksayan ritmi kulağıyla hemen yakalar. Sesli okuma, metne dışarıdan bakan bir dinleyicinin kulağını ödünç alarak yazıyı düzeltmenin en yalın yoludur.

Bu parçada yazarın sesli okumaya yönelik yaklaşımı aşağıdakilerden hangisidir?',
  '{"options":["Sesli okumanın yalnızca okuma hızını düşürdüğü için yetişkinlerce bırakılması gerektiğini düşünmektedir.","İlkokul döneminden sonra sesli okumanın dil gelişimine hiçbir katkı sağlamadığını savunmaktadır.","Gözle okumanın yazım ve anlatım hatalarını bulmada sesli okumadan her zaman daha üstün olduğunu belirtmektedir.","Sesli okumanın yalnızca dinleyiciler önünde yapılan sunumlarda yararlı olduğunu ileri sürmektedir.","Yetişkinlerin de kendi metinlerindeki anlatım aksaklıklarını fark etmesinde sesli okumayı etkili bir araç olarak görmektedir."],"correctIndex":4}'::jsonb,
  'Yazar, sesli okumanın çocuklara özgü bir alışkanlık sayıldığını ancak yetişkinlerin de kendi metinlerindeki uzun cümle, tekrar ve ritim bozukluklarını kulağıyla yakalamak için bu yöntemden yararlanabileceğini savunur.',
  'İlk cümlede sesli okumanın ilkokula özgü sayıldığı belirtildiği için aday yazarın da bunu çocuklara özgü gördüğünü sanabilir. Oysa "Oysa" bağlacı yazarın bu yaygın görüşe katılmadığını gösterir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Bazı ilaçların prospektüsünde "aç karnına", bazılarında ise "tok karnına" alınması gerektiği yazar; bu uyarı rastgele değildir. Mide boşken alınan bazı ilaçlar doğrudan bağırsağa geçip hızla kana karışırken, yemekle birlikte alındığında besinlerdeki yağ ya da kalsiyumla birleşerek etkisini yitirebilir. Buna karşılık mide zarını tahriş edebilen ilaçların yemek sonrasında alınması, hem mideyi korur hem de emilimin dengeli gerçekleşmesini sağlar.

Bu parçada aşağıdakilerden hangisine değinilmemiştir?',
  '{"options":["İlaçların aç veya tok alınması uyarısının neden rastgele olmadığına","Besinlerdeki bazı maddelerin ilaç etkisini nasıl değiştirebildiğine","Yemek sonrasında alınan ilaçların mideyi koruma yönüne","Mide boşken alınan bazı ilaçların kana karışma hızına","İlaçların son kullanma tarihi geçtikten sonra nasıl saklanması gerektiğine"],"correctIndex":4}'::jsonb,
  'Parçada aç/tok uyarısının nedeni, besinlerdeki yağ ve kalsiyumun emilimi azaltabilmesi, tok alınan ilaçların mideyi koruması ve boş midede hızlı kana karışma anlatılır; son kullanma tarihi ve saklama koşullarına değinilmez.',
  'İlaç prospektüsünden söz edildiği için aday prospektüste bulunan saklama ve tarih bilgilerinin de metinde yer aldığını düşünebilir. Oysa metin yalnızca ilaçların yemekle etkileşimine odaklanır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  '(I) Banliyö yerleşimlerinde sıkça görülen çıkmaz sokaklar, yalnızca o sokakta oturanların araçlarını içeri aldığı için trafiği yavaşlatır. (II) Araç geçişinin azalması, çocukların kapı önünde güvenle oyun oynayabileceği sakin bir çevre yaratır. (III) Ancak bu kapalı tasarım, mahalleyi birbirine bağlayan yaya yollarını keserek en yakın durağa ya da bakkala yürümeyi bile uzun bir dolaşmaya dönüştürür. (IV) Yürüme mesafesi uzadığında sakinler kısa mesafeler için bile otomobile yönelir ve ana caddelerdeki trafik yoğunluğu artar. (V) Bu yüzden güncel kent planlaması, araç trafiğini keserken yaya ve bisiklet geçişine izin veren geçitli sokak modellerini öne çıkarmaktadır.

Bu parça iki paragrafa bölünmek istense ikinci paragraf hangi cümleyle başlamalıdır?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":2}'::jsonb,
  'İlk iki cümle çıkmaz sokakların trafiği yavaşlatan ve çocuklara sakin alan sunan olumlu yönünü anlatır. III. cümle ("Ancak") çıkmaz sokakların yaya bağlantısını keserek yarattığı olumsuz sonuca ve çözüm arayışına geçer; bu nedenle ikinci paragraf III. cümleyle başlamalıdır.',
  'V. cümle çözüm önerisi getirdiği için bölünme noktası gibi görünebilir. Ancak V. cümledeki "Bu yüzden" ifadesi, III. ve IV. cümlelerde anlatılan yaya kopukluğu ve otomobil bağımlılığı sorununun doğrudan sonucudur.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  '(I) Çoğu madde soğuyup katılaştığında hacmi küçülür ve sıvı hâlinin dibine batar; ancak su bu genel kuralın şaşırtıcı bir istisnasıdır. (II) Su sıfır derecede donarken molekülleri arasında geniş boşluklu altıgen bir yapı oluştuğu için buzun yoğunluğu sıvı sudan küçük kalır ve buz yüzeyde yüzer. (III) Kışın göl ve akarsuların üstünde oluşan bu buz tabakası, altındaki suyun soğuk havayla temasını kesen bir yalıtkan görevi görerek su altı canlılarının donmadan kışı geçirmesini sağlar.

Bu parçadaki II. cümlenin işlevi aşağıdakilerden hangisidir?',
  '{"options":["I. cümlede belirtilen istisnai durumun fiziksel nedenini açıklamak","Buzun yalıtım özelliğinin hangi bölgelerde geçerli olmadığını belirtmek","Katı maddelerin neden her zaman sıvıların dibine battığını örneklemek","Su altı canlılarının kış uykusuna yatma biçimlerini sıralamak","I. cümledeki yargının bilimsel açıdan geçersiz olduğunu kanıtlamak"],"correctIndex":0}'::jsonb,
  'I. cümle suyun katılaşınca batmayarak genel kurala istisna oluşturduğunu söyler; II. cümle moleküller arasındaki boşluklu altıgen yapıyı anlatarak buzun neden daha az yoğun kalıp yüzeyde yüzdüğünü fiziksel olarak açıklar.',
  'III. cümle göllerdeki yalıtım sonucunu verdiği için aday II. cümleyi sonuç cümlesiyle karıştırabilir. Oysa II. cümle I. cümlede tanıtılan istisnanın bilimsel gerekçesini sunmaktadır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Dijital arama kutuları, tam olarak ne aradığımızı bildiğimiz anlarda bize büyük bir hız kazandırır; adını hatırladığımız bir kitaba ya da makaleye saniyeler içinde ulaşırız. Ne var ki bir kütüphane rafının ya da sahaf tezgâhının önünde durduğumuzda durum farklıdır: Aradığımız eserin hemen yanındaki hiç bilmediğimiz bir başlık gözümüze çarpar ve merakımız bambaşka bir yöne açılır. Dijital erişimin kusursuz hedef odaklılığı, insan düşüncesini sık sık besleyen bu verimli tesadüflere daha az yer bırakır.

Bu parçada asıl vurgulanan aşağıdakilerden hangisidir?',
  '{"options":["Fiziksel kütüphaneler, aranan kaynağa ulaşma hızı bakımından arama motorlarından üstündür.","Hedef odaklı dijital arama kolaylığı, fiziksel mekânların sunduğu tesadüfi keşif imkânını azaltabilmektedir.","Arama motorlarını kullanan okurlar, hiçbir zaman yeni konulara ilgi duymaz.","Fiziksel kitap rafları yalnızca belirli bir eseri önceden bilen okurlar için yararlıdır.","Dijital arşivler, eski basılı kitapların tamamını bünyesinde barındıramadığı için yetersizdir."],"correctIndex":1}'::jsonb,
  'Parça, dijital aramanın bilinen şeye hızla ulaştırdığını ancak kütüphane rafındaki gibi yan yana duran eserler aracılığıyla gerçekleşen tesadüfi keşiflere pek fırsat bırakmadığını vurgular.',
  'İlk cümledeki hız vurgusu, dijital aramanın her açıdan üstün ya da yetersiz olduğu yönünde uç seçeneklere çekebilir. Oysa yazar dijital aramayı hız açısından över ama "tesadüfi keşif" kaybını öne çıkarır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  '(I) Geniş tek tip tarım tarlalarının kenarına ekilen yabani çiçek şeritleri, yalnızca görsel bir süs değildir. (II) Bu çiçekler, ekinlere zarar veren yaprak bitleriyle beslenen uğur böcekleri ve yabani arılar için nektar ile barınak sağlar. (III) Böylece tarlada doğal avcıların sayısı artar ve kimyasal böcek ilacı kullanma ihtiyacı belirgin ölçüde azalır. (IV) Çiftçilerin hasat sonrası kullandığı traktörlerin yakıt tüketimi, motor bakım sıklığına göre değişmektedir. (V) Üstelik çiçekli şeritler, yağmur sularının tarla toprağını sürüklemesini engelleyerek kenar erozyonunu da hafifletir.

Bu parçadaki numaralanmış cümlelerden hangisi düşüncenin akışını bozmaktadır?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":3}'::jsonb,
  'Parça, tarla kenarlarına ekilen yabani çiçek şeritlerinin doğal avcı böcekleri çekme ve toprağı koruma yararlarını anlatır. IV. cümle ise traktörlerin yakıt tüketimine geçerek ekolojik tarım ekseninden kopar.',
  'IV. cümlede "çiftçiler" ve "tarla/hasat" bağlamı geçtiği için parçayla ilgiliymiş gibi görünür. Ancak diğer bütün cümleler yabani çiçek şeritlerinin işlevlerini sıralarken IV. cümle makine bakımına atlar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Yazım Kuralları',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde bir yazım yanlışı vardır?',
  '{"options":["Hiçbir zaman pes etmedi.","Birkaç gün içinde yanıt verecekler.","Her şeyi baştan düşündü.","Herhangi bir sorun çıkmadı.","Pazartesi yada salı günü size uğrayacağım."],"correctIndex":4}'::jsonb,
  '"Ya da" bağlacı iki ayrı sözcük olarak yazılır. "Yada" yazımı yanlıştır. Diğer cümlelerde "hiçbir", "birkaç", "her şey" ve "herhangi" doğru yazılmıştır.',
  '"Hiçbir", "birkaç" ve "herhangi" bitişik yazıldığı için "ya da" da bitişik yazılabilirmiş gibi düşünülür. Oysa "ya da" iki ayrı sözcüktür ve her zaman ayrı yazılır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Yazım Kuralları',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerin hangisinde büyük harflerin kullanımıyla ilgili bir yanlışlık vardır?',
  '{"options":["Doğu Anadolu Bölgesi''nde kış mevsimi diğer bölgelere göre daha uzun sürer.","Bu sabah Van Gölü''nün kıyısında yürürken göçmen kuşları gözlemledik.","Toplantı, Türk Dil Kurumunun yeni konferans salonunda düzenlendi.","Ay ve Dünya, Güneş''in çevresindeki hareketlerini belirli bir düzende sürdürür.","Gelecek yıl Haziran ayının ortasında taşınıp yeni düzenimizi kuracağız."],"correctIndex":4}'::jsonb,
  'Ay ve gün adları özel ad sayılmaz, küçük harfle başlar. "Gelecek yıl Haziran ayının" ifadesinde "haziran" küçük harfle yazılmalıdır.',
  '"Türk Dil Kurumunun" ifadesinde kesme işareti kullanılmaması veya gök bilimi terimi olarak "Ay, Dünya, Güneş''in" büyük yazılması adayı yanıltabilir. Kurum adlarına gelen ekler kesmeyle ayrılmaz; gök cismi adları ise terim olarak büyük başlar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Yazım Kuralları',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerin hangisinde kısaltmaların ya da sayıların yazımıyla ilgili bir yanlışlık vardır?',
  '{"options":["Yazarın son araştırması, TÜBİTAK''ın desteklediği bir projede yayımlandı.","Yeni yasal düzenleme, TBMM''de yapılan oylamanın ardından kabul edildi.","Öğrenciler, TDK''nın güncel yazım kılavuzunu temel kaynak olarak kullandı.","Kargo paketi tartıldığında tam 2 kg''dan biraz daha hafif çıktı.","Toplantı, binanın 3''üncü katındaki büyük salonda gerçekleştirildi."],"correctIndex":2}'::jsonb,
  'Büyük harfli kısaltmalara getirilen ekler, kısaltmanın son harfinin okunuşuna göre yazılır. TDK''ya göre "K" harfi "ka" değil "ke" diye okunduğu için kısaltmanın okunuşu "Te-De-Ke"dir; bu nedenle ek "TDK''nın" değil "TDK''nin" biçiminde yazılmalıdır.',
  'Günlük konuşmada "Te-De-Ka" telaffuzu yaygın olduğu için "TDK''nın" yazımı kulağa doğal gelir. Aday bunun yerine "2 kg''dan" (kilogramdan) veya "3''üncü" (üçüncü) yazımlarından kuşkulanabilir; oysa onlar TDK kuralına uygundur.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Yazım Kuralları',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerin hangisinde yazım yanlışı yoktur?',
  '{"options":["Bu durumun ileride sorun yaratacağını ne yazık ki çok geç farketti.","Söylenenlere kırıldığı için hiçbir şey açıklamadan odayı terketti.","Arşivdeki bütün belgeleri tek tek inceleyip eksikleri kısa sürede tespit etti.","Yolcu, tren penceresinden karlı dağları saatlerce hayranlıkla seyir etti.","Başlangıçta söylediklerini yanlış anlayıp gerçeği gizlediğini zan etti."],"correctIndex":2}'::jsonb,
  'Yardımcı fiillerle kurulan birleşik fiillerde herhangi bir ses düşmesi veya ünsüz türemesi yoksa fiil ayrı yazılır: "tespit etti", "fark etti", "terk etti" ayrı yazılmalıdır. Ünlü düşmesi olan "seyretti" ve ünsüz türemesi olan "zannetti" ise bitişik yazılmalıdır.',
  '"Farketti" ve "terketti" günlük yazışmalarda sıkça bitişik yazıldığı için aday bunları doğru sanabilir. Ses olayı bulunmayan birleşik fiiller ayrı, ses olayı bulunan "seyretti" ve "zannetti" ise bitişik yazılır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Yazım Kuralları',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde bağlaç ya da eklerin yazımıyla ilgili bir yanlışlık vardır?',
  '{"options":["Sen ki bu konuda herkesten daha fazla emek verdin, söz hakkın elbette var.","Masadaki dosyaların arasında aradığın belgeyi de kolayca bulabilirsin.","Öyle yorgun görünüyordu ki sorulan sorulara bile yanıt veremedi.","Yarınki toplantıya katılacak mısınız diye sekreterlikten bilgi aldık.","Söylediklerimi dikkate almadığın gibi birde bana sitem ediyorsun."],"correctIndex":4}'::jsonb,
  '"Bir de" ifadesindeki "de" bağlaçtır ve ayrı yazılır ("birde" değil "bir de"). Diğer cümlelerde bağlaç olan "ki", bağlaç olan "de", sıfat yapan "-ki" ("masadaki", "yarınki") ve soru eki "mısınız" doğru yazılmıştır.',
  '"Sen ki" ve "yarınki" kullanımları birlikte yer aldığı için aday "ki" yazımlarından birinde hata arayabilir. Oysa "Sen ki" bağlaç olduğundan ayrı, "yarınki" ise yapım eki olduğundan bitişik yazılır; hata "birde" yazımındadır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Yazım Kuralları',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde sayıların yazımıyla ilgili bir yanlışlık vardır?',
  '{"options":["Salon 120 kişilik bir kapasiteye sahiptir.","Kitabın 45inci sayfasında kaldı.","1980''li yıllarda doğan kuşak bugün orta yaştadır.","Maçı 5''e 2 kazandık.","Dördüncü kata çıkıp odayı aradılar."],"correctIndex":1}'::jsonb,
  'Rakamla yazılan sayılara getirilen ekler kesme işaretiyle ayrılır: "45''inci". "45inci" yazımı yanlıştır. Diğer cümlelerde sayılar doğru yazılmıştır.',
  '"120 kişilik" gibi eklerin kesmesiz yazıldığı yapılar aday için kuralı bulanıklaştırır. Oysa "kişilik" yapım eki aldığı için "120 kişilik" doğrudur; sıra bildiren "-inci" ise kesmeyle ayrılır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Yazım Kuralları',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerin hangisinde yazım yanlışı yoktur?',
  '{"options":["Kentin Doğu''sunda yeni kurulan mahalleler son yıllarda hızla gelişiyor.","Geçen yaz Çanakkale boğazından geçen büyük gemileri hayranlıkla izledik.","Mimar sinan Caddesi''ndeki eski kitapçı hafta sonları da açıkmış.","Doktor Hasan bey, muayene saatlerini gelecek hafta yeniden düzenleyecek.","Türkçenin söz varlığını inceleyen kapsamlı bir sözlük yayımlandı."],"correctIndex":4}'::jsonb,
  'Özel adlara gelen yapım ekleri ve bunlardan sonra gelen çekim ekleri kesme işaretiyle ayrılmaz; bu nedenle "Türkçenin" yazımı doğrudur. Diğer cümlelerde yön adının özel addan sonra büyük yazılması ("Doğu''sunda" değil "doğusunda"), "Boğaz''ından", "Sinan" ve "Bey" sözcüklerinin küçük yazılması hatalıdır.',
  'Özel ad olan "Türkçe" sözcüğüne gelen ekin kesme işaretiyle ayrılmaması, aday tarafından sıkça hata sanılır. Oysa TDK kuralına göre yapım eki alan özel adlar ("Türkçe", "İstanbullu") kesmeyle ayrılmaz ve devamındaki çekim ekleri de bitişik yazılır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Yazım Kuralları',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde bir sözcüğün yazımı yanlıştır?',
  '{"options":["Orijinal fikirleriyle toplantıda herkesin dikkatini çekmeyi başardı.","Ekibin her bir üyesi kendi görevini büyük bir titizlikle yerine getirdi.","Programdaki aksaklıklar nedeniyle misafirlere mahçup olduklarını belirttiler.","Sporcuların düzenli antrenman yapması, sakatlık riskini önemli ölçüde azaltır.","Kütüphanedeki bazı nadir el yazmaları özel dolaplarda korunuyor."],"correctIndex":2}'::jsonb,
  'TDK Güncel Türkçe Sözlük''e göre sözcüğün doğru yazımı "mahcup"tur ("mahçup" yanlıştır). "Orijinal", "her bir", "antrenman" ve "el yazmaları" doğru yazılmıştır.',
  '"Orijinal" ve "antrenman" sözcükleri günlük konuşmada sıkça "orjinal" veya "antreman" diye telaffuz edildiği için aday hatayı bu kelimelerde arayabilir. Oysa bu ikisi doğru yazılmıştır; hata "mahçup" yazımındadır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Noktalama İşaretleri',
  'multiple_choice',
  3,
  'Yıllardır aynı soruyu soruyoruz(I) Kendimizi mi dinlemiyoruz(II) yoksa birbirimizi mi(III) Oysa cevap çok açık(IV) Sabırla dinlemeden kimseyi anlayamayız(V)

Bu parçada numaralanmış yerlere sırasıyla aşağıdaki noktalama işaretlerinden hangileri getirilmelidir?',
  '{"options":["(:) (,) (?) (:) (.)","(;) (,) (?) (;) (.)","(:) (?) (?) (:) (.)","(.) (;) (.) (:) (!)","(:) (,) (.) (;) (...)"],"correctIndex":0}'::jsonb,
  '(I) ve (IV) numaralı yerlerden sonra açıklama yapılacağı ve sonraki cümleler büyük harfle başladığı için iki nokta (:) gelir. (II) numaralı yer iki sıralı soru cümlesini bağladığı ve "yoksa" küçük harfle başladığı için virgül (,), soru anlamı cümlenin sonunda tamamlandığından (III) numaralı yere soru işareti (?) konur. (V) numaralı yer tamamlanmış cümle sonu olduğu için nokta (.) ile biter.',
  'Sıralı soru cümlelerinde ilk soru öbeğinden sonra hemen soru işareti koyma eğilimi güçlüdür. Ancak "yoksa" küçük harfle başladığı için araya virgül konur ve soru işareti cümlenin en sonuna yerleştirilir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Noktalama İşaretleri',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerin hangisinde noktalı virgül (;) yerinde kullanılmıştır?',
  '{"options":["Hava soğuk olduğu için; kalın giyindik.","Başarılı olmak için; düzenli çalışmalı ve planlı hareket etmelisiniz.","Bu konuda tek bir eksiğimiz var; zaman.","Türkiye''den elma, armut, kiraz; İtalya''dan ise zeytin, peynir, makarna ithal edildi.","Kardeşim; sabah erkenden evden çıkmış ve akşam dönmüş."],"correctIndex":3}'::jsonb,
  'TDK''ya göre ögeleri arasında virgül bulunan sıralı cümleleri ya da cümle içinde virgüllerle ayrılmış tür/takımları birbirinden ayırmak için noktalı virgül kullanılır. Türkiye ve İtalya ürün gruplarının kendi içinde virgüller bulunduğu için iki grubu ayırmada noktalı virgül kullanımı doğrudur.',
  'Noktalı virgül, virgülün yetmediği durumlarda kullanılır; yan cümlecik ile ana cümle arasına konması ("Hava soğuk olduğu için; ...") yaygın bir hatadır. Aday, her noktalı virgülün cümleyi ayırdığını sanabilir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Noktalama İşaretleri',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde virgül yanlış kullanılmıştır?',
  '{"options":["Kitabı okudum, ama pek beğenmedim.","Ayşe, Mehmet''in kız kardeşi, bugün gelecek.","Yarın, hava güzel olursa, yürüyüşe çıkarız.","Masanın üzerinde kalem, defter ve, kitap vardı.","Sabah erkenden kalktı, yüzünü yıkadı, kahvaltı etti."],"correctIndex":3}'::jsonb,
  'Sıralanan öğelerin son ikisi "ve" bağlacıyla bağlandığında bağlaçtan sonra virgül konmaz. Doğru şıktaki "ve," yanlıştır. Diğer cümlelerde virgül bağlama, ara söz, koşul yan cümleciği ve sıralama için doğru kullanılmıştır.',
  'Her cümlede birden çok virgül bulunduğu için hatanın yeri gözden kaçabilir. Sıralamada virgül, öğeler arasına konur; "ve" bağlacının önüne de arkasına da konmaz.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Noktalama İşaretleri',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerin hangisinde kesme işareti yanlış kullanılmıştır?',
  '{"options":["Türk Tarih Kurumu''nun düzenlediği uluslararası sempozyum üç gün sürdü.","19 Mayıs 1919''da Samsun''a çıkarak yeni bir dönem başlattı.","Ankara''daki tarihî müzeler bu yıl rekor sayıda ziyaretçi ağırladı.","Yunus Emre''nin şiirleri sade Türkçesiyle bugün de sevilerek okunur.","Kâzım Karabekir Caddesi''nde yürütülen altyapı çalışmaları tamamlandı."],"correctIndex":0}'::jsonb,
  'TDK Yazım Kılavuzu''na göre kurum, kuruluş, kurul, birleşim, oturum ve iş yeri adlarına gelen ekler kesme işaretiyle ayrılmaz; doğrusu "Türk Tarih Kurumunun" biçimindedir. Tarih, kişi, il ve cadde adlarına gelen çekim ekleri ise kesmeyle ayrılır.',
  '"Ankara''daki" sözcüğünde "-da" hâl ekinden sonra "-ki" yapım eki geldiği için kesme işareti kullanımı sorgulanabilir; ancak burada çekim ekinden hemen sonra kesme konduğu ve sonrasında yapım eki kesmesiz yazıldığı için doğrudur. Kurum adlarında ise hiçbir ek kesmeyle ayrılmaz.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Noktalama İşaretleri',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde noktalama yanlışı yoktur?',
  '{"options":["Bilim insanı: \"Veriler doğrulanmadan kesin hüküm verilemez.\" dedi.","Doktor: İlaçları aksatmadan kullanın, dedi.","Toplantı 29. Ekim 2026 tarihinde Ankara''da yapılacakmış.","Bu soruyu neden çözemediğimi bir türlü anlamadım?","Atatürk''ün doğumunun 100. yılı kutlamaları Ankara''lı öğrencileri heyecanlandırdı."],"correctIndex":0}'::jsonb,
  'TDK''ya göre tırnak içine alınan alıntı cümlenin sonundaki nokta, soru işareti veya ünlem işareti tırnak içinde kalır ve dışındaki cümle küçük harfle devam eder ("...verilemez." dedi.). Diğer şıklarda sırasıyla tırnaksız alıntıda iki nokta ve virgül, tarihte gün sayısına nokta, soru anlamı olmayan cümlede soru işareti ve özel ada gelen yapım ekinde kesme işareti hataları vardır.',
  'Alıntı cümlelerinde tırnak ve bitiş işaretinin yeri karıştırılabilir. Doğrudan aktarma tırnak içinde verilmeli ve alıntının kendi bitiş işareti tırnak içinde yer almalıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Noktalama İşaretleri',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerin hangisinde virgül, diğerlerinden farklı bir görevde kullanılmıştır?',
  '{"options":["Kitapları, defterleri, kalemleri masanın üzerine özenle yerleştirdi.","Kışın soğuk, rüzgârlı, kasvetli günleri sonunda geride kalmıştı.","Annem pazardan taze domates, salatalık, biber alıp geldi.","Kardeşim, yani evin en küçüğü, bu yıl üniversiteye başlayacak.","Çalışkan, dürüst, sorumluluk sahibi insanlarla çalışmayı tercih ederdi."],"correctIndex":3}'::jsonb,
  '"Kardeşim, yani evin en küçüğü, bu yıl üniversiteye başlayacak." cümlesinde virgüller ara sözü ayırmak için kullanılmıştır. Diğer dört cümlede ise virgül eş görevli sözcükleri (adları ya da sıfatları) sıralama görevindedir.',
  'Diğer şıklarda sıfatların ve adların sıralanması aynı işlevdedir (eş görevli sözcükler). Ara söz virgülü ise iki taraflı olarak cümleye eklenen açıklayıcı bir bölümü ayırır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Noktalama İşaretleri',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde noktalama yanlışı vardır?',
  '{"options":["Eyvah, evden çıkarken anahtarları içeride unutmuşum!","Bahçede elma, armut, kiraz gibi pek çok meyve ağacı vardı...","Kurtuluş Savaşı (1919-1922), milletimizin bağımsızlık mücadelesidir.","Sokakta yürürken birden durdu, etrafına bakındı, gülümsedi.","Dün akşamki konserde klasik dönemin seçkin eserleri seslendirildi."],"correctIndex":1}'::jsonb,
  '"Bahçede elma, armut, kiraz gibi pek çok meyve ağacı vardı..." cümlesinde yüklem ("vardı") bulunduğu ve örnekler "gibi pek çok meyve ağacı" ile toparlandığı için cümle tamamlanmıştır; sonuna üç nokta (...) değil nokta (.) konmalıdır.',
  'Cümle içinde "elma, armut, kiraz" gibi örnekler sıralandığı için örneklerin devam ettiğini düşünerek üç nokta koyma eğilimi oluşur. Oysa "gibi pek çok ... vardı" yargıyı tamamladığı için üç nokta kullanılamaz.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Anlatım Bozuklukları',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerin hangisinde anlatım bozukluğu vardır?',
  '{"options":["Bütün evraklar imzalandıktan sonra dosya arşive kaldırıldı.","Sorular dikkatlice okuyup en kısa sürede çözülmelidir.","Öğrenciler ödevlerini tamamladıktan sonra sessizce sınıftan çıktı.","Rapor hazırlanıp yönetim kurulunun onayına sunuldu.","Yolcular biletlerini göstererek perona giriş yaptı."],"correctIndex":1}'::jsonb,
  '"Sorular dikkatlice okuyup en kısa sürede çözülmelidir." cümlesinde çatı uyuşmazlığı vardır: "okuyup" zarf-fiili etken, "çözülmelidir" yüklemi ise edilgen çatılıdır. Cümlenin "Sorular dikkatlice okunup en kısa sürede çözülmelidir." biçiminde her iki fiilde de edilgen kurulması gerekir.',
  'Cümle hızlı okunduğunda "dikkatlice okuyup çözmek" anlamı zihinde tamamlandığı için hata fark edilmeyebilir. Yan cümlecik ile temel cümle fiilinin etkenlik-edilgenlik bakımından uyumlu olması zorunludur.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Anlatım Bozuklukları',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerin hangisinde öge eksikliğinden kaynaklanan bir anlatım bozukluğu vardır?',
  '{"options":["Yollar kar nedeniyle kapanınca ulaşım bir süre aksadı.","Sınav sonuçları açıklandığında bütün adaylar büyük heyecan yaşadı.","Hastanın durumu ağırlaşınca hemen yoğun bakıma alındı.","Yağmur dinince çocuklar yeniden bahçeye koştu.","Toplantı beklenenden uzun sürünce sunum yarına ertelendi."],"correctIndex":2}'::jsonb,
  '"Hastanın durumu ağırlaşınca hemen yoğun bakıma alındı." cümlesinin ilk bölümünde özne "hastanın durumu"dur; ikinci bölümde ("yoğun bakıma alındı") ise alınan şey "durum" değil "hasta"dır. "Hastanın durumu ağırlaşınca hasta hemen yoğun bakıma alındı." şeklinde özne eklenmelidir.',
  'İlk bölümde "hastanın" sözcüğü geçtiği için ikinci bölümdeki edilgen yüklemin de hastaya bağlandığı düşünülür. Ancak tamlayan konumundaki "hastanın" sözcüğü doğrudan ikinci yüklemin öznesi yerine geçemez.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Anlatım Bozuklukları',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde özne ile yüklemin kişisi arasında uyumsuzluk vardır?',
  '{"options":["Kitabı okuyup arkadaşıma ödünç verdi.","Gazeteyi alıp eve döndü.","Sınıfa girince öğretmen herkesi selamladı.","Bütün gün çalıştıktan sonra yorgunluktan uyuyakaldı ve akşam yemeğini unuttum.","Yağmur yağdığı için maç ertelendi."],"correctIndex":3}'::jsonb,
  '"Uyuyakaldı" üçüncü tekil kişiyle, "unuttum" ise birinci tekil kişiyle çekimlenmiştir; aynı özneye bağlı iki yüklemin kişisi uyuşmamaktadır. Diğer cümlelerde yüklemlerin öznesi aynıdır.',
  'İki yüklemin "ve" ile bağlanması, aynı öznenin sürdüğü izlenimini verir; aday kişi eklerini karşılaştırmayı atlayabilir. Her yüklemin kişi ekine ayrı ayrı bakmak gerekir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Anlatım Bozuklukları',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerin hangisinde anlatım bozukluğu vardır?',
  '{"options":["Genç yazarı çok takdir ediyoruz, eserlerini ilgiyle okuyoruz.","Yeni mahallemize hemen alıştık, sokaklarını çok sevdik.","Kardeşimi sık sık arıyor, her zaman destek oluyorum.","Öğretmenimiz konuyu ayrıntılı biçimde anlattı ve örnekler verdi.","Komşularımızla iyi geçinir, zor zamanlarda birbirimize yardım ederiz."],"correctIndex":2}'::jsonb,
  '"Kardeşimi sık sık arıyor, her zaman destek oluyorum." cümlesinde "aramak" fiili belirtili nesne ("kardeşimi") alırken "destek olmak" fiili dolaylı tümleç ("ona") ister. Ortak nesne bağlanamadığı için ikinci cümleye "ona" dolaylı tümleci eklenmelidir.',
  '"Genç yazarı ... eserlerini" cümlesi de iki yüklemli olduğu için aynı hata varmış gibi görünebilir; ancak "eserlerini" sözcüğündeki iyelik eki zaten "genç yazar"a gönderme yaptığından cümle düzgündür. Eksiklik "ona destek oluyorum" bölümündedir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Anlatım Bozuklukları',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde anlamca çelişen sözcüklerin birlikte kullanılmasından kaynaklanan bir anlatım bozukluğu vardır?',
  '{"options":["Hava tahminlerine göre yarın mutlaka yağmur yağabilir.","Sabahki toplantıda alınan kararlar bütün birimlere duyuruldu.","Projenin ikinci aşaması önümüzdeki ay başlayacak.","Kütüphanedeki sessizlik, çalışmaya odaklanmamı kolaylaştırıyor.","Yolculuk boyunca pencereden akıp giden manzarayı izledi."],"correctIndex":0}'::jsonb,
  '"Mutlaka" sözcüğü kesinlik bildirirken yüklemdeki "-ebilir" eki olasılık bildirir; kesinlik ile olasılık aynı yargıda çelişir. Cümle ya "mutlaka yağacak" ya da "yağabilir" biçiminde kurulmalıdır.',
  '"Hava tahminlerine göre" ifadesi cümleye olasılık havası verdiği için "mutlaka" sözcüğünün çelişkisi ilk okuyuşta gözden kaçabilir. Kesinlik zarfı ile yeterlilik/olasılık kipinin bir arada kullanılması bozukluğa yol açar.',
  array['lisans_gygk']::text[],
  'lisans'
);
