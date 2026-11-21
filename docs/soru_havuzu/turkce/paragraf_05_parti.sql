-- ==========================================================================
-- KADRO SORU HAVUZU · KPSS GY Türkçe · PARAGRAF PARTİSİ 5 (30 soru, zorluk 2-3) · SUPABASE SQL
-- exam_scopes: lisans_gygk · education_level: lisans · Özgün üretim (TASK-140)
-- Kullanıcı, partileri tek tek onaylamadan üretime devam talimatı verdi (2026-11-21); bu parti ayrıca gözden geçirilmedi. Supabase'e yüklenmedi.
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
  2,
  'Mağazalarda "yüzde elli indirim" etiketi, ürünün gerçek değerinden çok önceki fiyatla kıyaslanarak ucuzluk hissi yaratır. Alıcı, bu karşılaştırmaya odaklandığı için ihtiyacı olmayan şeyi bile fırsat sanıp satın alabilir. İndirim, ancak zaten alınacak bir ürünün fiyatını düşürdüğünde gerçek bir kazançtır.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["İndirimli ürünler her zaman daha kalitesizdir.","Mağazalar fiyatları hiçbir zaman düşürmez.","İndirim, yalnızca zaten ihtiyaç duyulan bir ürün için gerçek bir kazanç sağlar.","İndirim etiketleri tüketicinin ihtiyacını belirler.","Alıcılar fiyat karşılaştırması yapmamalıdır."],"correctIndex":2}'::jsonb,
  'Yazar, indirimin ucuzluk hissi yarattığını, ihtiyaç dışı alıma yol açabildiğini ve ancak zaten alınacak ürün için gerçek kazanç olduğunu söyler.',
  '"İndirim etiketi ucuzluk hissi yaratır" ifadesi, indirimlerin hiç gerçek olmadığı yönünde okunabilir. Oysa yazar, ihtiyaç duyulan üründe indirimin gerçek kazanç olduğunu belirtir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Rüzgâr türbinleri, rüzgâr hızı belirli bir eşiğin altına düşünce elektrik üretemez; çok güçlü rüzgârda ise zarar görmemek için durdurulur. Bu yüzden rüzgâr enerjisi sürekli değil, rüzgârın uygun olduğu aralıkta üretilir.

Bu parçadan aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Rüzgâr ne kadar güçlü olursa türbinler o kadar çok elektrik üretir.","Rüzgâr hızı çok düşükse türbin elektrik üretemez.","Çok güçlü rüzgârda türbinler durdurulabilir.","Rüzgâr enerjisi belirli koşullarda üretilir.","Türbinlerin çalışması rüzgâr hızına bağlıdır."],"correctIndex":0}'::jsonb,
  'Parça, çok güçlü rüzgârda türbinlerin durdurulduğunu söyler. Bu nedenle güç arttıkça üretimin de sürekli arttığı yargısı çıkarılamaz.',
  '"Rüzgâr hızı eşiğin altına düşünce üretemez" ifadesi, hız arttıkça üretimin arttığı izlenimi verir. Oysa üretim yalnızca uygun aralıkta gerçekleşir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Kentlerde gürültü, çoğu zaman rahatsız edici bir ayrıntı olarak görülür. ....... Çünkü sürekli gürültüye maruz kalan kişilerde kalp atış hızı ve stres hormonları artabilir; uyku kalitesi de bozulur.

Bu parçada boş bırakılan yere düşüncenin akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["Bu nedenle gürültü yalnızca gece saatlerinde sorun yaratır.","Oysa gürültü, uzun vadede sağlığı etkileyen ciddi bir çevresel risktir.","Kentlerde gürültüyü azaltmak mümkün değildir.","Gürültü yalnızca işitme duyusunu etkiler.","İnsanlar zamanla her tür gürültüye tamamen alışır."],"correctIndex":1}'::jsonb,
  'Boşluktan sonraki "Çünkü" cümlesi, gürültünün kalp, stres ve uyku üzerindeki etkilerini sayar. Bu gerekçe, gürültünün ciddi bir sağlık riski olduğunu belirten cümleyi destekler.',
  '"Yalnızca işitme duyusunu etkiler" şıkkı gürültünün doğrudan ilişkili olduğu duyuyu gösterdiği için çeldiricidir. Oysa "Çünkü" cümlesi etkilerin kalp ve uyku gibi alanlara uzandığını anlatır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'I. Bu nedenle çocuklara düzenli hikâye okumak, yalnızca eğlence değil bir gelişim yatırımıdır.
II. Hikâye dinleyen çocuk, daha önce duymadığı sözcüklerle karşılaşır.
III. Bu sözcükleri bağlamdan çıkararak anlamlandırmaya çalışır.
IV. Zamanla edindiği sözcük hazinesi, okumayı öğrenmesini de kolaylaştırır.
V. Dil gelişimi, çocuğun çevresinden aldığı uyaranlarla yakından ilişkilidir.

Bu cümlelerle anlamlı bir paragraf oluşturulduğunda baştan üçüncü cümle hangisi olur?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":2}'::jsonb,
  'Doğru sıra V - II - III - IV - I''dir. V genel yargıyı verir, II hikâye dinlemeyi, III ("Bu sözcükleri") sözcük öğrenme çabasını, IV sonucunu anlatır; I ("Bu nedenle") genel sonucu bildirir. Baştan üçüncü cümle III.''tür.',
  'IV. cümle sonuç bildirdiği için üçüncü sıraya yakışır gibi görünür. Ancak III''teki "Bu sözcükleri" ifadesi, II''nin hemen ardından gelmesi gerektiğini gösterir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Kuşlar yalnızca güzel görünmek için ötmez; ötüş, eş bulmak, bölgeyi savunmak ve sürüdeki bireylerle iletişim kurmak gibi işlevler taşır. Bazı türlerde yavrular, ötüşü ebeveynlerini dinleyerek öğrenir.

Bu parçaya en uygun başlık aşağıdakilerden hangisidir?',
  '{"options":["Kuşların Göç Yolları","Yavru Kuşların Beslenmesi","Ötücü Kuşların Evcilleştirilmesi","Kuşların Ötüşünün İşlevleri","Doğada Ses Kirliliği"],"correctIndex":3}'::jsonb,
  'Parça, kuş ötüşünün eş bulma, bölge savunma ve iletişim gibi işlevlerini anlatır; en uygun başlık ötüşün işlevleridir.',
  'Parçada yavruların öğrenmesi de geçtiği için aday eğitimle ilgili bir başlık arayabilir. Ancak bu ayrıntı ötüşün işlevlerinden biridir, asıl konu değildir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Bir bilgiyi her an ulaşılabilir bulduğumuzda onu ezberlemeye gerek duymayız; bu da hatırlama çabasını azaltır. Ancak ezber azaldıkça bilgiler arasında bağ kurma yeteneği körelmek zorunda değildir; çünkü bağ kurmak, bilgiyi ezberlemekten çok anlamayı gerektirir. Asıl risk, bilgiyi bulmaktan çok onunla düşünmeyi bırakmaktır.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Bilgiye kolay ulaşım, ezberi tamamen ortadan kaldırmıştır.","İnsanlar, bilgiyi hatırlamak zorunda olmadıkları için daha çok öğrenir.","Bağ kurma yeteneği, ezberle birlikte yok olur.","İnternet, bilgiyi anlamayı gereksiz kılar.","Bilgiye kolay ulaşımın asıl riski, ezber kaybı değil bilgiyle düşünme alışkanlığının zayıflamasıdır."],"correctIndex":4}'::jsonb,
  'Yazar, ezber azalsa da bağ kurma becerisinin anlamaya dayandığını söyler ve asıl riskin bilgiyle düşünmeyi bırakmak olduğunu belirtir.',
  'İlk cümledeki "hatırlama çabasını azaltır" ifadesi ezberin yok olduğu izlenimi verir. Oysa yazar asıl endişeyi başka bir yerde, düşünme alışkanlığında görür.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Buğday, binlerce yıldır insanın temel besin kaynaklarından biridir. Verimli topraklarda ve ılıman iklimde yetişir; hasat edildikten sonra öğütülerek un hâline getirilir. Unun ekmek, makarna ve bulgur gibi pek çok gıdaya dönüşmesi, buğdayı dünyanın her yerinde tüketilen bir ürün yapmıştır.

Bu parçada aşağıdakilerden hangisine değinilmemiştir?',
  '{"options":["Buğdayın yetiştiği koşullara","Buğdayın una dönüştürülmesine","Buğday ihracatında önde gelen ülkelere","Undan elde edilen gıdalara","Buğdayın insan beslenmesindeki yerine"],"correctIndex":2}'::jsonb,
  'Parçada buğdayın beslenmedeki yeri, yetiştiği koşullar, una dönüştürülmesi ve undan elde edilen gıdalar anlatılır. İhracata değinilmez.',
  'Parça buğdayın dünyada yaygın tüketildiğini söylediği için aday ticaretle ilgili bir bilginin de bulunduğunu sanabilir. Oysa metinde ticaret ya da ihracat yoktur.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  '(I) Pazarlıkta ilk söylenen rakam, sonraki teklifleri belirleyen bir çıpaya dönüşür. (II) Satıcı yüksek bir fiyat söylediğinde, alıcı yapacağı karşı teklifi bu rakama göre ayarlar. (III) Bu yüzden pazarlığı ilk rakamı söyleyen taraf çoğu zaman avantajlı başlar.

Bu parçadaki I. cümlenin işlevi aşağıdakilerden hangisidir?',
  '{"options":["Parçada ele alınan olguyu ortaya koymak","Parçanın sonucunu bildirmek","Önceki bir görüşü çürütmek","Konuyla ilgili bir soru yöneltmek","Bir olayı örneklemek"],"correctIndex":0}'::jsonb,
  'I. cümle, pazarlıktaki çıpa etkisini tanıtır; parçanın ele aldığı olguyu ortaya koyar. II örnekleme, III ise sonuçtur.',
  'I. cümle genel bir yargı içerdiği için aday onu sonuç sanabilir. Oysa sonuç, "Bu yüzden" ile başlayan III. cümledir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Mavi balinalar, düşük frekanslı seslerle yüzlerce kilometre öteden birbirleriyle iletişim kurabilir. Ancak insan kaynaklı deniz gürültüsü, bu seslerin ulaştığı mesafeyi kısaltıyor.

Bu parçadan aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Mavi balinalar seslerle iletişim kurar.","Deniz gürültüsü, balinaların iletişim mesafesini artırır.","Balina sesleri uzun mesafelere ulaşabilir.","İnsan kaynaklı gürültü balinaları etkiler.","Düşük frekanslı sesler uzağa yayılabilir."],"correctIndex":1}'::jsonb,
  'Parça, deniz gürültüsünün seslerin ulaştığı mesafeyi kısalttığını söyler. Bu nedenle mesafeyi artırdığı yargısı çıkarılamaz.',
  'Gürültü ve ses sözcükleri birlikte geçtiği için aday gürültünün sesi güçlendirdiğini sanabilir. Oysa parça gürültünün etkisini olumsuz anlatır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Bulutlar, havadaki su buharının soğuyarak küçük damlacıklara dönüşmesiyle oluşur. ....... Bu yüzden dağ yamaçlarında bulutlanma, çoğu zaman ovalardan daha sık görülür.

Bu parçada boş bırakılan yere düşüncenin akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["Bulutlar yalnızca kışın oluşur.","Su buharı sıcak havada hiç yoğunlaşmaz.","Dağlarda hava, ovadakinden her zaman daha nemlidir.","Hava yükseldikçe soğur ve içindeki su buharını tutma kapasitesi azalır.","Bulutların rengi, taşıdıkları su miktarını gösterir."],"correctIndex":3}'::jsonb,
  'Boşluktan sonraki "Bu yüzden" cümlesi, dağ yamaçlarında bulutlanmanın sık görüldüğünü söyler. Bunun gerekçesi, havanın yükselirken soğuması ve buharı tutamamasıdır.',
  '"Dağlarda hava daha nemlidir" şıkkı sonucu doğrudan tekrarladığı için çeldiricidir. Ancak boşluk, sonucun nedenini (soğuma) vermelidir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Ustalık, çoğu zaman yeteneğe ya da toplam çalışma saatine indirgenir. Oysa aynı işi yıllarca yapıp gelişmeyen pek çok kişi vardır; fark, tekrarın bilinçli olup olmadığındadır. Hatalarını izleyen, geri bildirim alan ve zor olanı bilerek deneyen kişi, aynı sürede çok daha ilerler.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Yetenek, ustalığın tek belirleyicisidir.","Yıllarca aynı işi yapan herkes usta olur.","Geri bildirim, gelişimi yavaşlatır.","Zor işlerden kaçınmak, ustalığı hızlandırır.","Ustalık, süreden çok bilinçli ve geri bildirime açık bir çalışmayla kazanılır."],"correctIndex":4}'::jsonb,
  'Yazar, yeteneğin ve çalışma süresinin tek başına yetmediğini, bilinçli ve geri bildirime açık çalışmanın ustalığı getirdiğini söyler.',
  'İlk cümledeki "çalışma saatine indirgenir" ifadesi süreyi öne çıkarıyor gibi görünür. Oysa yazar bu indirgemeyi "Oysa" ile reddeder.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Bir kentte herkes kendi çıkarına en uygun olanı yaparsa, ortak yaşam alanı bundan zarar görebilir. ....... Bu nedenle kamusal alanlarda kurallar koymak, bireyin özgürlüğünü kısıtlamaktan çok ortak yaşamı güvence altına almaktır.

Bu parçada boş bırakılan yere düşüncenin akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["Kuralsız bir kent, herkes için en elverişli düzendir.","Bireyler, toplumun çıkarlarını hiç gözetmemelidir.","Bireysel çıkarlar ile toplumsal yarar arasında bir denge kurmak gerekir.","Kamusal alanlar yalnızca devletin sorumluluğundadır.","Özgürlük, her durumda sınırlandırılmalıdır."],"correctIndex":2}'::jsonb,
  'Boşluktan sonraki "Bu nedenle" cümlesi, kuralların ortak yaşamı güvence altına aldığını söyler. Bu sonuca götüren ara düşünce, bireysel çıkar ile toplumsal yarar arasında denge kurma gerekliliğidir.',
  '"Özgürlük her durumda sınırlandırılmalıdır" şıkkı son cümlenin vurgusunu uca taşır. Oysa son cümle kuralların özgürlüğü kısıtlamaktan çok yaşamı güvenceye aldığını söyler.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Başkalarının başarısını görünce bunu kendi başarısızlığımızın kanıtı sanma eğilimindeyiz. Oysa her kişinin başarısı farklı koşullarda, farklı yetenek ve desteklerle gerçekleşir. Karşılaştırma, ancak aynı koşullarda yapıldığında bir anlam taşır; aksi hâlde yalnızca kendimizi yıpratmaya yarar.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Farklı koşullarda elde edilen başarıları kendi durumumuzla kıyaslamak anlamlı bir ölçüt sunmaz.","Başkalarının başarısı, bizim başarısızlığımızın nedenidir.","Herkesin başarı koşulları aynıdır.","Karşılaştırma yapmak her koşulda yararlıdır.","Başarılı insanlardan hiçbir şey öğrenilemez."],"correctIndex":0}'::jsonb,
  'Yazar, başarıların farklı koşullarda gerçekleştiğini ve karşılaştırmanın ancak aynı koşullarda anlamlı olduğunu söyler.',
  'Parçanın ilk cümlesi başarısızlık duygusuna odaklandığı için aday kişisel yetersizlik yargısına kayabilir. Oysa yazar bu çıkarımı yanlış bulur.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'I. Bu nedenle sağlık kuruluşları, sabunla el yıkamayı en basit ve etkili önlemlerden biri sayıyor.
II. Eller, günlük yaşamda pek çok yüzeyle temas eder.
III. Bu temas sırasında bulaşan mikropların bir kısmı gözle görülmez.
IV. Sabun, mikropları ve onları taşıyan yağ tabakasını yüzeyden uzaklaştırır.
V. Ağza ya da yüze dokunulduğunda bu mikroplar vücuda kolayca geçebilir.

Bu cümlelerle anlamlı bir paragraf oluşturulduğunda baştan dördüncü cümle hangisi olur?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":3}'::jsonb,
  'Doğru sıra II - III - V - IV - I''dir. II temas yüzeylerini, III görünmeyen mikropları, V ("bu mikroplar") bulaşma yolunu, IV sabunun çözümünü anlatır; I ("Bu nedenle") sonuçtur. Baştan dördüncü cümle IV.''tür.',
  'I. cümledeki "Bu nedenle" ifadesi cümleyi sona iter; ancak IV, sabunun çözüm olduğunu anlattığı için I''den önce, dördüncü sırada yer alır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Teknolojik bir ürünün satış sonrası hizmeti, çoğu zaman ürünün kendisi kadar önemlidir. Çünkü ürün bozulduğunda ya da kullanıcı sorun yaşadığında firmanın gösterdiği ilgi, müşterinin güvenini belirler.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Teknolojik ürünler hiçbir zaman bozulmaz.","Satış sonrası hizmet, müşteri güveninin oluşmasında ürün kadar belirleyicidir.","Müşteri güveni yalnızca ürün fiyatına bağlıdır.","Satış sonrası hizmet, ürünün yerini tutar.","Kullanıcılar sorun yaşamadığı sürece firmaya güvenmez."],"correctIndex":1}'::jsonb,
  'Yazar, satış sonrası hizmetin ürün kadar önemli olduğunu ve güveni belirlediğini söyler.',
  '"Ürünün yerini tutar" şıkkı vurguyu uca taşır. Oysa yazar "ürün kadar önemli" der; ürünün yerini tuttuğunu söylemez.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Tarihî bir yapıyı restore ederken amaç, onu yeniden yapmak değil, özgün dokusunu koruyarak güçlendirmektir. Bu nedenle eski malzemelerin yerine mümkün olduğunca aynı özellikte malzeme kullanılır; yeni eklenen kısımlar ise ayırt edilebilir bırakılır.

Bu parçadan aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Restorasyon, özgün dokuyu korumayı hedefler.","Eski malzemeler mümkünse aynı özellikte malzemeyle değiştirilir.","Yeni eklenen kısımlar ayırt edilebilir olmalıdır.","Restorasyonda yapının tamamı yeni malzemeyle yenilenmelidir.","Restorasyon, yapıyı güçlendirmeyi amaçlar."],"correctIndex":3}'::jsonb,
  'Parça, restorasyonun özgün dokuyu korumayı hedeflediğini söyler. Yapının tamamının yeni malzemeyle yenilenmesi bu amaçla çelişir.',
  '"Malzemelerin değiştirilmesi" ifadesi yenileme çağrışımı yapar. Oysa parça değişimi yalnızca mümkün olduğunca aynı özellikteki malzemeyle ve gerektiğinde yapılan bir işlem olarak anlatır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  '(I) Yavaş yemek yemek, doyma sinyalinin beyne ulaşması için gereken süreyi tanır. (II) Beyin, mide doldukça gönderilen bu sinyali yaklaşık yirmi dakikada algılar. (III) Hızlı yemek yiyen kişi, bu sinyal gelmeden fazla yemiş olabilir. (IV) Yemek tabaklarının tasarımı, sofra düzenini estetik açıdan etkiler. (V) Bu nedenle lokmaları iyice çiğneyip aralarda ara vermek, yeme miktarını dengeler.

Bu parçadaki numaralanmış cümlelerden hangisi düşüncenin akışını bozmaktadır?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":3}'::jsonb,
  'Parça, yavaş yemenin doyma sinyaliyle ilişkisini anlatır. IV. cümle ise tabak tasarımına geçerek konu bütünlüğünü bozar.',
  'IV. cümle sofra ve yemekle ilgili olduğu için konu içinde gibi görünür. Ancak parçanın ekseni doyma sinyali ve yeme hızıdır; tabak tasarımı bu bütünlüğün dışındadır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Hızlı moda, kıyafetleri ucuz ve hızlı üreterek tüketiciyi sık sık yeni parça almaya yöneltir. Ancak bu hızın bedeli, çok sayıda kıyafetin birkaç kullanımdan sonra çöpe gitmesi ve üretimde harcanan suyun, boyanın ve emeğin görünmez kalmasıdır. Sürdürülebilir olan, daha az ama uzun kullanılan kıyafetlerdir.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Ucuz kıyafetler daha uzun süre kullanılır.","Hızlı moda üreticileri doğal kaynakları korur.","Kıyafetler yalnızca bir kez giyilmelidir.","Tüketiciler sık sık yeni kıyafet almalıdır.","Kıyafet tüketiminde sürdürülebilirlik, ucuzluk ve hızdan çok kullanım ömrüyle sağlanır."],"correctIndex":4}'::jsonb,
  'Yazar, hızlı modanın çevresel ve emek bedelini anlatır ve sürdürülebilir olanın uzun kullanılan kıyafetler olduğunu söyler.',
  '"Ucuz ve hızlı" ifadesi parçada geçtiği için aday ucuz kıyafetlerin uzun kullanıldığını sanabilir. Oysa yazar tam tersini söyler: ucuz kıyafetler çabuk çöpe gider.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Uzaktan çalışmanın tek hedefi, ofisin maliyetini azaltmak sayılamaz. İyi kurgulanmış bir uzaktan çalışma düzeni, çalışana ulaşım süresini geri verir ve odaklanacağı sessiz bir ortam sunar. Ne var ki ekip hissi için yüz yüze buluşmaların tümüyle terk edilmesi, kısa vadede verimi artırsa da uzun vadede aidiyeti zayıflatabilir.

Bu parçada yazar, uzaktan çalışmaya nasıl yaklaşmaktadır?',
  '{"options":["Uzaktan çalışmanın yalnızca maliyet azalttığını savunmaktadır.","Yüz yüze buluşmaların tamamen kaldırılmasını önermektedir.","Yararlarını kabul etmekle birlikte ekip aidiyeti açısından dengeli bir uygulamayı gerekli görmektedir.","Uzaktan çalışmanın hiçbir yarar sağlamadığını düşünmektedir.","Ofis düzeninin her yönüyle üstün olduğunu ileri sürmektedir."],"correctIndex":2}'::jsonb,
  'Yazar, uzaktan çalışmanın ulaşım ve odaklanma gibi yararlarını sayar; ancak yüz yüze buluşmaların terk edilmesinin aidiyeti zayıflatabileceğini belirterek dengeli bir uygulamayı önerir.',
  '"Verimi artırsa da" ifadesi, yüz yüze buluşmaların kaldırılmasının tümüyle olumlu olduğu izlenimini verebilir. Oysa yazar bunun uzun vadeli bedelini vurgular.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Bir araştırmanın sonuçlarını yalnızca özet bölümünden okumak yetmeyebilir. ....... Çünkü özet, yöntemdeki sınırlılıkları ve sonuçların hangi koşullarda geçerli olduğunu çoğu zaman göstermez.

Bu parçada boş bırakılan yere düşüncenin akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["Bu nedenle bir araştırmayı değerlendirmek için yöntem ve sınırlılık bölümlerine de bakmak gerekir.","Araştırma özetleri hiçbir zaman doğru bilgi vermez.","Araştırmalar yalnızca özetle değerlendirilmelidir.","Yöntem bölümü, araştırmanın en önemsiz kısmıdır.","Okurlar araştırma sonuçlarına güvenmemelidir."],"correctIndex":0}'::jsonb,
  'Boşluktan sonraki "Çünkü" cümlesi, özetin yöntem sınırlılıklarını göstermediğini söyler. Bu gerekçe, yöntem ve sınırlılık bölümlerine bakmanın gerektiğini belirten cümleyi destekler.',
  '"Özet hiçbir zaman doğru bilgi vermez" şıkkı parçadaki eleştiriyi uca taşır. Oysa yazar özetin yetersiz kaldığını söyler; yanlış olduğunu söylemez.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Evde elektrik tasarrufunun en kolay yolu, kullanılmayan cihazları bekleme modunda bırakmak yerine fişten çekmektir. Led ampuller, geleneksel ampullere göre çok daha az enerji harcar. Enerji verimliliği yüksek cihazların başlangıçtaki fiyatı yüksek olsa da zamanla fatura üzerinde fark yaratır.

Bu parçada aşağıdakilerden hangisine değinilmemiştir?',
  '{"options":["Bekleme modunun enerji tüketimine","Güneş panelleriyle elektrik üretmenin maliyetine","Led ampullerin enerji verimliliğine","Verimli cihazların başlangıç maliyetine","Verimli cihazların fatura üzerindeki etkisine"],"correctIndex":1}'::jsonb,
  'Parçada bekleme modu, led ampuller, verimli cihazların başlangıç maliyeti ve fatura etkisi anlatılır. Güneş paneli maliyetine değinilmez.',
  'Elektrik tasarrufu konusu, güneş enerjisini çağrıştırdığı için aday panele ilişkin bir bilginin de bulunduğunu sanabilir. Oysa metinde güneş paneli geçmez.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'I. Dağlarda bağırdığımızda sesimizin yankılanması bu yüzden mümkündür.
II. Ses, bir yüzeye çarptığında bir bölümü geri yansır.
III. Yansıyan ses, kaynağından kısa bir süre sonra kulağımıza ulaşırsa yankı olarak algılanır.
IV. Bu gecikmenin en az saniyenin onda biri kadar olması gerekir.
V. Ses dalgaları, havada titreşimlerle yayılan enerjidir.

Bu cümlelerle anlamlı bir paragraf oluşturulduğunda baştan beşinci cümle hangisi olur?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":0}'::jsonb,
  'Doğru sıra V - II - III - IV - I''dir. V sesin ne olduğunu, II yansımayı, III yankı algısını, IV gecikme koşulunu anlatır; I ("bu yüzden") yankı olayının nedenini bağlar. Baştan beşinci cümle I.''dir.',
  'I. cümle yankıyı doğrudan adlandırdığı için başa yakın görünebilir. Ancak "bu yüzden" bağı, önceki cümlelerin anlattığı koşulların sonucu olduğunu gösterir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  '(I) Bahçede kompost yapmak, mutfak atıklarını toprağa kazandırmanın en doğal yoludur. (II) Meyve ve sebze kabukları, çay telvesi ve kuru yapraklar bu amaçla kullanılabilir. (III) Kompost kutusunun içeriği, düzenli aralıklarla karıştırılarak havalandırılmalıdır. (IV) Bahçe aletlerinin satış fiyatları mevsime göre değişir. (V) Birkaç ay sonra ortaya çıkan koyu renkli toprak, bitkiler için zengin bir besin kaynağıdır.

Bu parçadaki numaralanmış cümlelerden hangisi düşüncenin akışını bozmaktadır?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":3}'::jsonb,
  'Parça, kompostun yapılışını ve yararını anlatır. IV. cümle ise bahçe aletlerinin fiyatlarına geçerek konunun dışına çıkar.',
  'IV. cümle bahçeyle ilgili olduğu için konu içinde gibi görünür. Ancak parçanın ekseni kompost süreciyle ilgilidir; alet fiyatları bu bütünlüğü bozar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Bir dilde bir kavram için birden çok sözcüğün bulunması, o kavramın o toplum için ne kadar önemli olduğunu gösterebilir. Ancak bu, kavramı olmayan bir dilin onu hiç ifade edemeyeceği anlamına gelmez; yalnızca ifadenin daha uzun bir söyleyişle yapılacağını gösterir.

Bu parçadan aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Çok sayıda sözcük, kavramın önemine işaret edebilir.","Sözcüğü olmayan bir kavram daha uzun biçimde anlatılabilir.","Dillerde kavram karşılıkları farklılık gösterebilir.","Bir dilin sözcük zenginliği, toplumun ilgilerini yansıtabilir.","Bir kavram için sözcüğü olmayan dil, o kavramı hiçbir biçimde anlatamaz."],"correctIndex":4}'::jsonb,
  'Parça, sözcüğü olmayan bir dilin kavramı daha uzun söyleyişle ifade edebileceğini söyler. Bu nedenle hiçbir biçimde anlatamayacağı yargısı çıkarılamaz.',
  '"Önemini gösterebilir" ifadesi, sözcüksüzlüğün anlatamamaya yol açtığı izlenimini verir. Oysa "Ancak" ile başlayan cümle bunu açıkça reddeder.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  '(I) Pek çok kişi, bir sorunu çözmek için hemen harekete geçmeyi erdem sayar. (II) Oysa acele, sorunun nedenini anlamadan yalnızca belirtisini gideren çözümler üretebilir. (III) Dolayısıyla ilk adım, hızlı davranmak değil, sorunu doğru tanımlamaktır.

Bu parçadaki III. cümlenin işlevi aşağıdakilerden hangisidir?',
  '{"options":["Konuya ilişkin bir tanım vermek","Önceki cümledeki görüşü örnekle somutlaştırmak","Önceki cümlelerden bir sonuç ve öneri çıkarmak","Yeni bir sorun ortaya koymak","Konuyu başka bir alana taşımak"],"correctIndex":2}'::jsonb,
  'III. cümle "Dolayısıyla" ile başlar ve önceki yargılardan sorunu doğru tanımlama önerisini çıkarır.',
  'III. cümlede "tanımlamak" sözü geçtiği için aday cümleyi tanım sanabilir. Oysa cümle bir öneri ve sonuç bildirir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Zeytin ağaçları, kurak ve taşlık topraklarda bile yüzyıllarca yaşayabilir. Derinlere inen kökleri suya ulaşır, küçük ve parlak yaprakları ise buharlaşmayla su kaybını azaltır. Bu özellikleri, zeytini Akdeniz iklimine uyum sağlamış en dayanıklı ağaçlardan biri yapar.

Bu parçaya en uygun başlık aşağıdakilerden hangisidir?',
  '{"options":["Zeytin Ağacının Kurak İklime Uyumu","Zeytinyağının Sağlığa Yararları","Akdeniz Mutfağının Özellikleri","Zeytin Hasadında Kullanılan Yöntemler","Ağaçların Mevsimlere Göre Değişimi"],"correctIndex":0}'::jsonb,
  'Parça, zeytin ağacının kökleri ve yapraklarıyla kurak iklime uyumunu anlatır; en uygun başlık budur.',
  'Parçada "Akdeniz" ifadesi geçtiği için aday Akdeniz mutfağıyla ilgili bir başlık seçebilir. Oysa Akdeniz yalnızca iklim bilgisi olarak anılır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Kavşaklardaki trafik ışıkları, farklı yönlerden gelen araçların aynı anda geçişini engelleyerek çarpışma riskini azaltır. Işıkların süresi, yolun yoğunluğuna göre ayarlanır; bazı kavşaklarda sensörler bu süreyi anlık olarak değiştirir.

Bu parçanın konusu aşağıdakilerden hangisidir?',
  '{"options":["Araç sayısındaki artışın nedenleri","Trafik ışıklarının işleyişi ve amacı","Sensör teknolojilerinin tarihçesi","Yayaların güvenliği için alınan önlemler","Karayolu inşaatında kullanılan malzemeler"],"correctIndex":1}'::jsonb,
  'Parça, trafik ışıklarının çarpışmayı önleme amacını ve süre ayarını anlatır; konusu ışıkların işleyişidir.',
  'Parçada sensörler geçtiği için aday teknolojiyle ilgili bir konu seçebilir. Oysa sensörler ışıkların işleyişini açıklayan bir ayrıntıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Bir çocuğa doğru yazmayı öğretmek, ona doğru yazılmış metinleri bolca okutmaktan başlar. Yazım kurallarını ezberleyen çocuk, kuralı unuttuğunda hataya düşer; çok okuyan çocuk ise sözcüğün doğru biçimini görüp aklında tutar.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Yazım kuralları hiç öğretilmemelidir.","Okumak, yazma becerisini zayıflatır.","Çocuklar hatalarından dolayı cezalandırılmalıdır.","Kural ezberlemek, bol okumaktan daha kalıcıdır.","Doğru yazım alışkanlığı, kural ezberinden çok bol okumayla kazanılır."],"correctIndex":4}'::jsonb,
  'Yazar, kural ezberinin unutulduğunda hataya yol açtığını, bol okumanın ise doğru biçimi akılda tuttuğunu söyler.',
  '"Kuralları ezberleyen çocuk" ifadesi yazımın ezberle kazanıldığı izlenimi verebilir. Oysa yazar ezberin kalıcı olmadığını belirtir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Bir haberi başlığıyla paylaşmak kolaydır; metni okumak ise zaman ister. Bu yüzden pek çok haber, okunmadan yayılır. Oysa başlık, haberin yalnızca küçük ve çoğu zaman en çarpıcı bölümünü özetler.

Bu parçada yazarın amacı aşağıdakilerden hangisidir?',
  '{"options":["Başlıkların hiçbir zaman doğru olmadığını kanıtlamak","Haberleri yalnızca başlığa bakarak paylaşmanın yanıltıcı olabileceğini göstermek","Haber okumanın zaman kaybı olduğunu savunmak","Haberlerin hiç paylaşılmaması gerektiğini ileri sürmek","Okurların başlıkları önemsemediğini açıklamak"],"correctIndex":1}'::jsonb,
  'Yazar, haberlerin başlıkla yayıldığını ve başlığın haberin yalnızca küçük bir bölümünü özetlediğini söyler; amacı başlığa bakarak paylaşmanın yanıltıcı olabileceğini göstermektir.',
  '"Çoğu zaman en çarpıcı bölümünü" ifadesi başlıkların yanlış olduğu izlenimi verebilir. Oysa yazar başlığın eksik kaldığını söyler; yanlış olduğunu söylemez.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Rüzgâr, yüksek basınç alanından alçak basınç alanına doğru esen hava hareketidir. Güneş, yeryüzünü eşit ısıtmadığı için bazı bölgelerde hava ısınıp yükselir; boşalan yere çevreden soğuk hava dolar. Bu hava akımı, bizim rüzgâr olarak algıladığımız harekettir.

Bu parçada ağır basan anlatım biçimi aşağıdakilerden hangisidir?',
  '{"options":["Öyküleyici anlatım","Betimleyici anlatım","Tartışmacı anlatım","Anlatım biçimlerinden hiçbiri ağır basmamaktadır.","Açıklayıcı anlatım"],"correctIndex":4}'::jsonb,
  'Parça, rüzgârın nasıl oluştuğunu bilgi vererek açıklar; bu açıklayıcı anlatımdır.',
  '"Hava akımı" ve "esen" sözleri hareket çağrışımı yaptığı için aday öyküleme sanabilir. Oysa parçada olay örgüsü yoktur; yalnızca bilgi verilir.',
  array['lisans_gygk']::text[],
  'lisans'
);
