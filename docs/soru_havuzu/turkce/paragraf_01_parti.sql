-- ==========================================================================
-- KADRO SORU HAVUZU · KPSS GY Türkçe · PARAGRAF PARTİSİ 1 (30 soru, zorluk 2-3) · SUPABASE SQL
-- exam_scopes: lisans_gygk · education_level: lisans · Özgün üretim (TASK-140)
-- Kullanıcı onayladı (2026-11-21); henüz Supabase'e yüklenmedi. Yeniden çalıştırılırsa sorular çoğalır.
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
  'Su, gündelik yaşamda o kadar kolay ulaştığımız bir kaynak ki değerini ancak kesintiyle karşılaşınca anlıyoruz. Oysa dünyadaki tatlı su rezervlerinin yalnızca küçük bir bölümü insanların kullanımına uygun durumda. Üstelik bu küçük payın büyük kısmı tarımda ve sanayide harcanıyor. Bu nedenle suyu korumak, yalnızca musluğu kapatmak değil, üretim ve tüketim alışkanlıklarını bütünüyle gözden geçirmektir.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Tatlı su rezervleri her geçen yıl hızla artmaktadır.","Musluğu kapatmak, su sorununu çözmek için yeterlidir.","Tarım ve sanayi, suyun çok az kullanıldığı alanlardır.","Su kaynaklarının korunması, bireysel tasarrufun ötesinde üretim ve tüketim biçimlerinin değişmesini gerektirir.","Su kesintileri yalnızca kırsal bölgeleri etkiler."],"correctIndex":3}'::jsonb,
  'Yazar, kullanılabilir suyun az olduğunu ve büyük kısmının tarım ve sanayide harcandığını belirttikten sonra korumanın yalnızca bireysel tasarrufla sınırlı olmadığını söyler.',
  '"Musluğu kapatmak" ifadesi bireysel tasarrufu öne çıkardığı için aday ilk bakışta bu şıkka yönelebilir. Oysa yazar tam tersini söyler: musluğu kapatmak yetmez, alışkanlıklar bütünüyle gözden geçirilmelidir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Çocukluk döneminde edinilen dil, yalnızca iletişim aracı olarak değil, dünyayı algılama biçimi olarak da yerleşir. Farklı dilleri konuşan kişiler, renkleri, zamanı ve yönü farklı biçimlerde sınıflandırabilir. Ancak bu durum, bir dilin düşünceyi tümüyle belirlediği anlamına gelmez; insan, dilin sunduğu kalıpların dışına da çıkabilir.

Bu parçaya göre aşağıdakilerden hangisi söylenemez?',
  '{"options":["Dil, bireyin düşünme biçimini tek başına ve tamamen belirler.","Dil, dünyayı algılama biçimini etkileyen bir unsurdur.","Farklı dilleri konuşanlar aynı kavramları farklı biçimlerde gruplayabilir.","İnsan düşüncesi, dilin kalıplarıyla sınırlı kalmak zorunda değildir.","Dil, yalnızca iletişim işlevi görmez."],"correctIndex":0}'::jsonb,
  'Parça, dilin algıyı etkilediğini ama düşünceyi tümüyle belirlemediğini söyler. Bu nedenle dilin düşünceyi tek başına belirlediği yargısı parçayla çelişir.',
  'Parçanın ilk yarısı dilin etkisini vurguladığı için aday uç bir yargıya, yani dilin düşünceyi belirlediğine kayabilir. Ancak "Ancak" ile başlayan cümle bu görüşü açıkça sınırlar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Teknolojinin her yeniliği, başlangıçta bir kolaylık vaadiyle girer hayatımıza. ....... Örneğin yazı, belleğe duyulan ihtiyacı azalttı; hesap makinesi zihinden işlem yapma becerisini; harita uygulamaları ise yön bulma duyumuzu zayıflattı.

Bu parçada boş bırakılan yere düşüncenin akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["Bu nedenle teknolojik yeniliklerden olabildiğince uzak durulmalıdır.","Teknolojik yenilikleri yalnızca genç kuşaklar benimser.","Her yeni araç, bir öncekinden daha pahalıya mal olur.","Yazının icadı, insanlığın en önemli buluşudur.","Ne var ki bu kolaylıkların bedeli, çoğu zaman o işi yapmaya yarayan insan becerilerinin körelmesidir."],"correctIndex":4}'::jsonb,
  'Boşluktan sonra gelen "Örneğin" cümlesi, bellek, hesap ve yön bulma becerilerinin zayıfladığını sıralar. Bu örnekler yalnızca kolaylığın beceri kaybı getirdiği yargısını destekler.',
  'İlk cümledeki "kolaylık" vurgusu aday için teknoloji karşıtı bir sonuç çıkarmaya (uzak durmak) yol açabilir. Ancak parça yeniliği reddetmez; yalnızca bedelini gösterir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'I. Bu yüzden müzeler, yalnızca eser sergileyen yapılar değil, toplumsal hafızayı canlı tutan kurumlardır.
II. Müzeye gelen ziyaretçi, geçmişin izlerini nesneler aracılığıyla görür.
III. Nesnelerin yanındaki açıklamalar ise bu izleri anlamlı bir bütüne dönüştürür.
IV. Müzeler, geçmişle bugün arasında köprü kurar.
V. Böylece ziyaretçi, kendi kimliğini de daha iyi tanır.

Bu cümlelerle anlamlı bir paragraf oluşturulduğunda baştan üçüncü cümle hangisi olur?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":2}'::jsonb,
  'Doğru sıra IV - II - III - V - I''dir. IV genel yargıyı verir, II ziyaretçinin gördüklerini, III ("ise") açıklamaların katkısını anlatır; V ("Böylece") sonucu, I ("Bu yüzden") genel hükmü bildirir. Baştan üçüncü cümle III.''tür.',
  'II. cümle ziyaretçiyi anlattığı için üçüncü sıraya yakışır gibi görünür. Ancak III. cümledeki "ise" ve "bu izleri" ifadeleri, hemen II''nin ardından geldiğini kanıtlar; II ikinci, III üçüncü sıradadır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  '(I) Bir kentin trafik sorunu, çoğu zaman yol sayısının azlığıyla açıklanır. (II) Oysa araştırmalar, yeni yollar açıldıkça araç sayısının da artarak tıkanıklığı eski düzeyine çektiğini gösteriyor. (III) Bu nedenle çözümü, yolları çoğaltmakta değil, toplu taşımayı güçlendirmekte aramak gerekir.

Bu parçadaki II. cümlenin işlevi aşağıdakilerden hangisidir?',
  '{"options":["Önceki cümledeki görüşü örnekle desteklemek","Önceki cümledeki yaygın görüşü çürütecek bir kanıt sunmak","Parçanın sonucunu bildirmek","Konuyla ilgili bir tanım vermek","Yeni bir sorunun ortaya çıktığını belirtmek"],"correctIndex":1}'::jsonb,
  'II. cümle "Oysa" ile başlar ve I. cümledeki yaygın görüşe (yol azlığı) karşı araştırma bulgusunu getirir. Böylece görüşü çürütür.',
  'II. cümle "araştırmalar" dediği için örnek ya da kanıt gibi görünür. Ancak kanıtın yönü önceki cümleyi desteklemek değil, ona karşı çıkmaktır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  '(I) Mevsimlerin değişmesi, yalnızca doğanın ritmini değil insan davranışlarını da etkiler. (II) Kış aylarında gün ışığının kısalması, birçok kişide enerji düşüklüğüne yol açar. (III) Bu durum, uyku düzeninin ve iştahın değişmesiyle de ilişkilidir. (IV) Gün ışığının kısalması, güneş ışınlarının yeryüzüne geliş açısının değişmesinden kaynaklanır. (V) Yaz aylarında ise uzayan gün ışığı, sosyal etkinliklere katılımı artırır.

Bu parçadaki numaralanmış cümlelerden hangisi düşüncenin akışını bozmaktadır?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":3}'::jsonb,
  'Parça, mevsimlerin insan davranışlarına etkisini anlatır. IV. cümle ise olayın fiziksel nedenini açıkladığı için konunun dışına çıkar ve akışı bozar.',
  'IV. cümle "gün ışığının kısalması" ifadesini tekrarladığı için konu içinde gibi görünür. Ancak parçanın ekseni insan davranışıdır; olayın astronomik nedeni bu bütünlüğü bozar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Takım sporlarında bireysel yetenek, ancak ortak bir amaca bağlandığında anlam kazanır. En parlak oyuncu bile, takım arkadaşlarıyla uyum içinde hareket edemezse sahada etkisiz kalır. Başarılı takımlar, yıldızlardan çok birbirini tamamlayan oyunculardan oluşur.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Bireysel yetenek, takım sporlarında hiçbir zaman önem taşımaz.","Başarılı takımlar yalnızca yıldız oyunculardan oluşur.","Takım sporlarında başarı, bireysel yetenekten çok oyuncular arasındaki uyuma bağlıdır.","Takım arkadaşlarıyla uyum, bireysel sporlarda da aynı derecede önemlidir.","Sahada etkili olmak için en parlak oyuncu olmak gerekir."],"correctIndex":2}'::jsonb,
  'Parça, yeteneğin ortak amaca bağlanması ve takım uyumu gerektiğini vurgular; başarıyı yıldız oyunculardan çok birbirini tamamlayan oyunculara bağlar.',
  '"Bireysel yetenek hiçbir zaman önem taşımaz" şıkkı parçadaki vurguyu uç noktaya taşır. Oysa yazar yeteneği yadsımaz; onu ortak amaca bağlı kıldığını söyler.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Antibiyotikler, bakteriyel enfeksiyonların tedavisinde çığır açmış ilaçlardır. Ne var ki gereksiz ve yarım bırakılan kullanım, bakterilerin bu ilaçlara direnç geliştirmesine yol açar. Direnç kazanan bakteriler, daha önce kolayca tedavi edilen hastalıkları yeniden tehlikeli hâle getirir. Bu nedenle ilaçların yalnızca hekim önerisiyle ve eksiksiz kullanılması gerekir.

Bu parçada aşağıdakilerden hangisine değinilmemiştir?',
  '{"options":["Antibiyotiklerin tedavideki önemine","Bilinçsiz kullanımın doğurduğu sonuca","Direnç kazanan bakterilerin yarattığı soruna","Virüslerin neden antibiyotiklere yanıt vermediğine","Doğru kullanım için gereken koşula"],"correctIndex":3}'::jsonb,
  'Parçada antibiyotiklerin önemi, bilinçsiz kullanımın direnç doğurması, direncin yarattığı risk ve doğru kullanım koşulu anlatılır. Virüslerin ilaca yanıt vermemesine değinilmez.',
  'Parça bakteri ve enfeksiyonlardan söz ettiği için aday virüslerle ilgili bir bilginin de yer aldığını sanabilir. Oysa metinde virüslerden hiç söz edilmez.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Bir toplum, çocuklarına bırakacağı mirası çoğu zaman maddi varlıklarla ölçer. ....... Oysa asıl miras, onlara kazandırılan merak, sorgulama ve birlikte yaşama becerileridir; çünkü bunlar, maddi varlıklar yitirilse bile yeniden kazanılabilmesini sağlar.

Bu parçada boş bırakılan yere düşüncenin akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["Bu yaklaşım, mirasın daha kalıcı ve görünmez boyutlarını gözden kaçırır.","Maddi varlıklar, çocukların geleceği için hiçbir güvence sağlamaz.","Merak ve sorgulama, yalnızca okullarda kazanılabilir.","Çocuklar, mirastan çok kendi çabalarına güvenmelidir.","Her toplum, mirası aynı biçimde tanımlar."],"correctIndex":0}'::jsonb,
  'Boşluktan sonraki "Oysa" cümlesi, mirasın asıl boyutunun maddi olmayan beceriler olduğunu söyler. Bu karşıtlığı kuran cümle, maddi ölçütün eksik kaldığını belirtmelidir.',
  '"Maddi varlıklar hiçbir güvence sağlamaz" şıkkı, parçanın karşıt vurgusunu uca taşır. Oysa yazar maddi mirası değersiz saymaz; yalnızca yetersiz bulur.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Bir bitkinin yaprağındaki küçük gözenekler, havadaki karbondioksiti alırken su buharını da dışarı verir. Sıcak ve kurak günlerde bitki, su kaybını azaltmak için bu gözenekleri kısmen kapatır. Böylece hem su tasarrufu sağlar hem de gaz alışverişini sürdürebilecek dengeyi korur.

Bu parçaya en uygun başlık aşağıdakilerden hangisidir?',
  '{"options":["Karbondioksitin Atmosferdeki Oranı","Kurak İklimlerde Tarım Yöntemleri","Yaprakların Renk Değiştirmesi","Fotosentezin Keşfi","Bitkilerin Su Dengesini Koruma Yolları"],"correctIndex":4}'::jsonb,
  'Parça, bitkilerin gözeneklerini kontrol ederek su kaybını azalttığını anlatır; bu nedenle en uygun başlık su dengesinin korunmasıdır.',
  'Parçada karbondioksit ve kurak günlerden söz edildiği için aday "kurak iklimlerde tarım" gibi bir başlığı seçebilir. Oysa parça tarım yöntemlerinden değil, bitkinin kendi savunma mekanizmasından söz eder.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Bir haberin doğruluğunu sınamak, kaynağını sorgulamakla başlar. Aynı haberi birden çok bağımsız kaynakta görmek güven verir; ancak bu tek başına yeterli değildir, çünkü kaynaklar birbirinden alıntı yapıyor olabilir. Bu yüzden haberin ilk çıkış noktasına ulaşmak, güvenilirliği değerlendirmenin en sağlam yoludur.

Bu parçadan aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Haberin kaynağı sorgulanmalıdır.","Bir haberin birçok yerde yayımlanması, doğru olduğunu kesinleştirir.","Kaynaklar birbirinden alıntı yapmış olabilir.","Haberin ilk çıkış noktasına ulaşmak, güvenilirlik değerlendirmesinde önemlidir.","Birden çok kaynakta görülmek güven verici bir ölçüttür ama yeterli değildir."],"correctIndex":1}'::jsonb,
  'Parça, birden çok kaynakta görülmenin güven verdiğini ama yeterli olmadığını söyler. Bu nedenle çok yerde yayımlanmanın doğruluğu kesinleştirdiği yargısı parçadan çıkarılamaz.',
  '"Birden çok kaynak güven verir" ifadesi, aday için doğrulama anlamına gelebilir. Oysa yazar hemen ardından bunun yeterli olmadığını, kaynakların birbirinden alıntı yapabileceğini belirtir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  '(I) Yeni nesil okul binalarında geniş pencereler, esnek sınıf düzenleri ve ortak çalışma alanları öne çıkıyor. (II) Bu tasarımların ortak noktası, öğrenciyi pasif bir dinleyici değil, etkin bir katılımcı olarak görmesidir. (III) Ancak mekânın değişmesi tek başına yetmez. (IV) Öğretmenin sınıftaki rolü ve ölçme yaklaşımı da bu anlayışa göre yeniden düşünülmelidir. (V) Aksi hâlde en modern bina bile eski alışkanlıkların taşıyıcısı olur.

Bu parça iki paragrafa bölünmek istense ikinci paragraf hangi cümleyle başlamalıdır?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":2}'::jsonb,
  'İlk iki cümle yeni okul binalarını ve tasarım anlayışını anlatır. III. cümle "Ancak" ile konuyu mekânın yetersizliğine çevirir; yeni bir düşünce başladığı için ikinci paragraf III. cümleyle başlamalıdır.',
  'IV. cümle de öğretmenin rolünden söz ettiği için yeni bir bölümün başlangıcı gibi görünür. Ancak IV, III''te açılan "yetmez" düşüncesini açıklar; asıl dönüm noktası "Ancak" bağlacını taşıyan III''tür.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Ödevlerin kaldırılması gerektiğini savunanlar, çocuğun dinlenme hakkını öne sürüyor. Ama düzenli ödev, çalışma disiplini kazandırmanın en doğal yoludur. Elbette ödevin niteliği ve miktarı özenle belirlenmeli; fakat tümüyle kaldırılması, öğrenmeyi okul duvarlarına hapsetmek olur.

Bu parçada ağır basan anlatım biçimi aşağıdakilerden hangisidir?',
  '{"options":["Açıklayıcı anlatım","Öyküleyici anlatım","Tartışmacı anlatım","Betimleyici anlatım","Hem öyküleyici hem betimleyici anlatım"],"correctIndex":2}'::jsonb,
  'Yazar, karşıt bir görüşü (ödev kaldırılsın) anıp ona karşı kendi düşüncesini savunur; bu, tartışmacı anlatımdır.',
  'Parça bilgi verir gibi göründüğü için aday açıklayıcı anlatıma yönelebilir. Oysa açıklayıcı anlatımda karşıt görüş bulunmaz; burada ise açıkça bir karşı görüş çürütülür.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Yeni bir teknolojiyi ilk gün benimseyenlere "öncü", temkinli davrananlara "tutucu" diyoruz. Oysa temkin, çoğu zaman yeniliğe karşı bir direnç değil, bedelini ölçme çabasıdır. Hızla benimsenen her şeyin kalıcı olmadığını da tarih bize defalarca gösterdi.

Bu parçada yazarın temkinli davrananlara yönelik tutumu aşağıdakilerden hangisidir?',
  '{"options":["Onları yeniliğe engel olmakla suçlamaktadır.","Onların davranışını tutuculuk olarak nitelemektedir.","Onların yeni teknolojilerden hiç yararlanmadığını düşünmektedir.","Onların davranışını gerekçeli bir sağduyu olarak görmektedir.","Öncülerin davranışını hatalı bulduğu için temkinlileri üstün tutmaktadır."],"correctIndex":3}'::jsonb,
  'Yazar, temkinin direnç değil bedeli ölçme çabası olduğunu söyler ve tarihten örnek getirerek bu tutumu haklı gösterir.',
  'Parçanın başında "tutucu" etiketi geçtiği için aday yazarın bu görüşü paylaştığını sanabilir. Oysa yazar bu etiketi "Oysa" ile reddeder.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Tasarruf, yalnızca para biriktirmek değildir; gerçek ihtiyaçla anlık isteği ayırt edebilme alışkanlığıdır. Gelirini düzenli biçimde bölen ve her harcamanın bir amacı olduğunu bilen kişi, daha az kazanıyor olsa bile maddi huzura daha kolay ulaşır.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Maddi huzur, çoğunlukla gelirin miktarından çok harcamaları bilinçli yönetebilmeye bağlıdır.","Daha çok kazanan kişi, her zaman daha rahat yaşar.","Tasarruf, gelirin tamamını biriktirmek demektir.","İhtiyaç ile istek arasındaki fark önemsiz bir ayrıntıdır.","Anlık isteklere göre harcama yapmak huzur getirir."],"correctIndex":0}'::jsonb,
  'Yazar, tasarrufu ihtiyaç ile isteği ayırt edebilmek olarak tanımlar ve daha az kazanan birinin bile bilinçli harcamayla huzura ulaşabileceğini söyler.',
  '"Daha çok kazanan daha rahat yaşar" şıkkı yaygın bir inanıştır; aday bunu doğru sanabilir. Oysa parça gelir miktarını değil harcamayı yönetme becerisini öne çıkarır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'I. Hâlbuki bu kaynak, bir kez harcandı mı geri alınamayan tek kaynaktır.
II. Oysa çoğumuz zamanı, sonsuzmuş gibi harcanabilen bir kaynak sayarız.
III. Bu yüzden öncelikleri belirlemek, aslında zamanı nasıl paylaştırdığımızı belirlemektir.
IV. Para, enerji ve dikkat gibi kaynakları dikkatle yönetiriz.
V. Bunların hiçbiri, zamanın yerini tutamaz.

Bu cümlelerle anlamlı bir paragraf oluşturulduğunda baştan üçüncü cümle hangisi olur?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":1}'::jsonb,
  'Doğru sıra IV - V - II - I - III''tür. IV kaynakların yönetildiğini söyler, V ("Bunların") zamanın bunlarla ikame edilemeyeceğini ekler, II ("Oysa") zamanın sonsuz sayıldığını belirtir, I ("bu kaynak") zamanın geri alınamazlığını vurgular, III ("Bu yüzden") sonucu verir. Baştan üçüncü cümle II.''dir.',
  '"Oysa" bağlacı II. cümleyi başa yakın gösterir; ancak V. cümledeki "Bunların" sözü kendisinden önce kaynakların sayıldığı IV''ü gerektirir. Bu iki bağ doğru sırayı belirler.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Mercan kayalıkları, okyanus tabanının yüzde birinden azını kaplamasına karşın deniz canlılarının dörtte birine ev sahipliği yapar. Deniz suyunun ısınması, mercanların renk veren mikroskobik alglerini kaybetmesine ve beyazlaşmasına yol açar. Bu süreç uzarsa mercanlar ölür ve onlara bağımlı canlıların yaşam alanı da yok olur.

Bu parçada aşağıdakilerden hangisine değinilmemiştir?',
  '{"options":["Mercanların beyazlaşma nedenine","Mercan kayalıklarının yaşam alanı olarak önemine","Deniz suyu ısınmasının mercanlara etkisine","Mercanların ölmesinin diğer canlılara yansımasına","Mercan kayalıklarını koruyan uluslararası düzenlemelere"],"correctIndex":4}'::jsonb,
  'Parçada mercanların yaşam alanı olarak önemi, ısınmanın beyazlaşmaya yol açması ve ölümün bağımlı canlılara etkisi anlatılır. Uluslararası düzenlemelerden söz edilmez.',
  'Parça mercanların korunması gerektiğini ima ettiği için aday koruma önlemlerine de değinildiğini sanabilir. Oysa metinde hiçbir düzenleme ya da önlem anılmaz.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Oyun, çocuğun dünyayı anlama çabasıdır; kuralları deneyerek, sınırları yoklayarak ve yenilgiyi göze alarak öğrenir. ....... Bu yüzden oyunu yalnızca zaman geçirme etkinliği saymak, öğrenmenin en doğal yolunu küçümsemektir.

Bu parçada boş bırakılan yere düşüncenin akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["Çocukların çoğu, oyun oynamak yerine ders çalışmayı tercih eder.","Yetişkinlerin ciddi saydığı pek çok beceri, aslında oyunun içinde ilk kez denenir.","Oyunun kuralları, yaşa göre değişiklik göstermez.","Kazanmak, oyunun en önemli amacıdır.","Oyun oynayan çocuklar daha az yorulur."],"correctIndex":1}'::jsonb,
  'Boşluktan sonraki "Bu yüzden" cümlesi, oyunun öğrenmedeki doğal rolünü küçümsememeyi savunur. Bu sonuca götüren gerekçe, ciddi becerilerin oyunda ilk kez denendiğini belirten cümledir.',
  '"Kazanmak oyunun amacıdır" şıkkı oyun konusuna yakın olduğu için çeldiricidir. Oysa ilk cümle yenilgiyi göze almaktan söz eder; vurgu kazanmak değil, öğrenmektir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Güvenin kurulması yıllar alır, yitirilmesi ise bir an. Bu asimetri yüzünden insanlar, ilişkilerinde küçük tutarlılıkları büyük jestlerden daha değerli bulur. Her gün aynı biçimde davranan kişi, yılda bir kez olağanüstü bir fedakârlık yapandan daha güvenilir sayılır.

Bu parçada asıl anlatılmak istenen aşağıdakilerden hangisidir?',
  '{"options":["Güven bir kez yitirildi mi yeniden kazanılamaz.","Büyük fedakârlıklar, ilişkilerde güvenin tek koşuludur.","Güven, nadir büyük davranışlardan çok sürekli ve tutarlı davranışlarla kazanılır.","İnsanlar, güvenilir kişileri her zaman kolayca tanır.","İlişkilerde jestlerin hiçbir önemi yoktur."],"correctIndex":2}'::jsonb,
  'Parça, güvenin tutarlı davranışlarla kazanıldığını ve yılda bir yapılan büyük fedakârlıktan daha değerli sayıldığını söyler.',
  'İlk cümledeki "yitirilmesi bir an" ifadesi, güvenin geri kazanılamayacağı izlenimi verir. Oysa yazar bu bilgiyi yalnızca tutarlılığın değerini göstermek için kullanır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  '(I) Her yıl milyonlarca ton gıda, tüketilmeden çöpe gidiyor. (II) Bunun büyük bölümü, marketlerde son kullanma tarihine yaklaşan ürünlerin satılmaması ve evlerde gereğinden fazla alışveriş yapılması nedeniyle ortaya çıkıyor. (III) Oysa aynı gıdalar, doğru planlamayla hem ekonomik hem de çevresel bir kazanca dönüştürülebilir.

Bu parçadaki II. cümlenin işlevi aşağıdakilerden hangisidir?',
  '{"options":["Önceki cümledeki durumu sayısal verilerle desteklemek","Parçanın sonuç bölümünü oluşturmak","Önceki cümleye karşıt bir görüş getirmek","Önceki cümlede belirtilen durumun nedenlerini açıklamak","Yeni bir çözüm önerisi sunmak"],"correctIndex":3}'::jsonb,
  'II. cümle, I. cümledeki gıda israfının nedenlerini (satılmayan ürünler, aşırı alışveriş) sıralar.',
  'II. cümlede "büyük bölümü" ifadesi oran çağrışımı yaptığı için aday bunu sayısal veri sanabilir. Oysa cümlede sayı yoktur; işlevi neden göstermektir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  '(I) Müzik dinlemek, beyinde birçok bölgeyi aynı anda harekete geçirir. (II) Özellikle tanıdık bir parça, anıları ve duyguları canlandırarak duygusal tepkiyi güçlendirir. (III) Ritmin hızı, kalp atışını ve nefes düzenini bile etkileyebilir. (IV) Bu etki, müziğin tedavi edici amaçla kullanılmasının dayanaklarından biridir. (V) Notaların yazılı hâle getirilmesi, müziğin yaygınlaşmasında önemli bir dönüm noktası olmuştur.

Bu parçadaki numaralanmış cümlelerden hangisi düşüncenin akışını bozmaktadır?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":4}'::jsonb,
  'Parça, müziğin beyin ve beden üzerindeki etkilerini anlatır. V. cümle ise notanın tarihsel gelişimine geçerek konu bütünlüğünü bozar.',
  'IV. cümledeki "tedavi edici" ifadesi konudan sapma gibi görünebilir. Ancak o cümle, anlatılan etkilerin bir sonucunu verir; asıl sapma müziğin tarihçesine geçen V. cümledir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Hızlı okuyucu ile derin okuyucu arasındaki fark, okunan sayfa sayısından çok metinle kurulan ilişkide ortaya çıkar. Birincisi bilgiyi tarar ve toplar; ikincisi metnin içindeki gerilimleri, boşlukları ve çelişkileri fark eder. İkisinin de yeri vardır: Bir rapor taramak için hız, bir felsefe metni içinse derinlik gerekir.

Bu parçadan aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Hızlı okuma, her tür metin için en doğru yöntemdir.","Okuma biçimi, okunacak metnin türüne göre değişebilir.","Derin okuma, metindeki çelişkileri fark etmeyi sağlar.","Hız ile derinlik, farklı amaçlara hizmet eder.","Okuyucular arasındaki fark yalnızca okunan sayfa sayısıyla açıklanamaz."],"correctIndex":0}'::jsonb,
  'Parça, iki okuma biçiminin de yeri olduğunu ve metin türüne göre değiştiğini söyler. Hızlı okumanın her metin için en doğru yöntem olduğu yargısı parçayla çelişir.',
  '"İkisinin de yeri vardır" ifadesi okuma hızının da geçerli olduğunu çağrıştırır. Ancak parça hızı yalnızca rapor gibi tarama gerektiren metinlerde uygun bulur.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Kentlerde bisiklet yollarının artması, yalnızca trafiği rahatlatmakla kalmıyor; hava kirliliğini azaltıyor, insanların hareketli yaşamasını teşvik ediyor ve sokakları daha insani ölçekte bir yaşam alanına dönüştürüyor.

Bu parçanın konusu aşağıdakilerden hangisidir?',
  '{"options":["Kentlerde trafik sorununun tarihçesi","Bisikletin icadı ve gelişimi","Hava kirliliğinin sağlığa zararları","Sokakların yeniden düzenlenmesinin maliyeti","Bisiklet yollarının kentlere sağladığı yararlar"],"correctIndex":4}'::jsonb,
  'Parça, bisiklet yollarının trafiğe, hava kalitesine ve yaşam alanına katkılarını sıralar; konusu bu yararlardır.',
  'Parçada hava kirliliği ve trafik anıldığı için aday bu başlıklara yönelebilir. Ancak bunlar bisiklet yollarının yararı olarak geçer; asıl konu bisiklet yollarıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Yaratıcılık çoğu zaman bir ilham anı olarak düşünülür. ....... Oysa araştırmalar, yaratıcı üretimin büyük ölçüde sabırlı gözlem, deneme ve eleme gibi sıradan çalışma süreçlerine dayandığını gösteriyor.

Bu parçada boş bırakılan yere düşüncenin akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["Yaratıcı insanlar, diğer insanlardan çok daha az çalışır.","Bu anlayışa göre yaratıcı fikirler, birdenbire ve çabasız biçimde ortaya çıkar.","İlham, hiçbir koşulda yaratıcılığı etkilemez.","Her insan aynı düzeyde yaratıcıdır.","Yaratıcılık, yalnızca sanatçılara özgü bir özelliktir."],"correctIndex":1}'::jsonb,
  'Boşluktan sonra "Oysa" ile gelen cümle, yaratıcılığın çalışma süreçlerine dayandığını söyler. Buna karşıt olan, ilham anlayışına göre fikirlerin çabasız ortaya çıktığını belirten cümledir.',
  '"İlham hiçbir koşulda etkilemez" şıkkı konuya yakın olduğu için çeldiricidir. Ancak boşluktan sonraki "Oysa" yalnızca birdenbire ortaya çıkan fikir anlayışına karşı çıkar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Sınav puanı, öğrencinin belirli bir günde belirli sorulara verdiği yanıtların özetidir. Bu özet, ne öğrencinin merakını ne yaratıcılığını ne de zaman içinde gösterdiği gelişimi yansıtır. Puanı tek ölçüt alan bir sistem, ölçülemeyeni değersiz sanma tehlikesine düşer.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Sınavlar, öğrencilerin başarısını ölçmek için gereksizdir.","Yaratıcılık ölçülemediği için eğitimde yeri yoktur.","Yalnızca sınav puanına dayanan değerlendirme, öğrencinin niteliklerinin önemli bir bölümünü göz ardı eder.","Öğrencilerin gelişimi yalnızca sınav sonuçlarıyla izlenebilir.","Sınav puanı, her gün değişen bir değerdir."],"correctIndex":2}'::jsonb,
  'Yazar, puanın merak, yaratıcılık ve gelişimi yansıtmadığını söyler ve puanı tek ölçüt almanın ölçülemeyeni değersiz sanma tehlikesi taşıdığını belirtir.',
  '"Sınavlar gereksizdir" şıkkı parçadaki eleştirinin uç hâlidir. Oysa yazar sınavı reddetmez; yalnızca tek ölçüt hâline getirilmesini eleştirir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'I. Bu süreçte toprak, üzerindeki bitki örtüsüyle birlikte yerinde kalır.
II. Eğimli arazilerde teraslama, erozyonu önlemenin en eski yollarından biridir.
III. Yağmur suyu basamaklar arasında yavaşlar ve toprağı sürüklemeden sızar.
IV. Bu sayede tarıma elverişli alan hem korunur hem de verimli kalır.
V. Toprağın korunması, yalnızca bugünkü üretim için değil gelecek kuşaklar için de önemlidir.

Bu cümlelerle anlamlı bir paragraf oluşturulduğunda baştan dördüncü cümle hangisi olur?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":0}'::jsonb,
  'Doğru sıra V - II - III - I - IV''tür. V genel yargıyı verir, II teraslamayı tanıtır, III suyun nasıl yavaşladığını anlatır, I ("Bu süreçte") toprağın yerinde kalmasını, IV ("Bu sayede") sonucu bildirir. Baştan dördüncü cümle I.''dir.',
  '"Bu sayede" ifadesi IV''ü sona iter; ancak "Bu süreçte" ile başlayan I. cümle, hemen III''ün anlattığı sürece bağlıdır. Bu nedenle I. cümle IV''ten önce, dördüncü sırada yer alır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'İnsanlar, başkalarının kararlarında rastlantıyı, kendi kararlarında ise bilinçli tercihi görme eğilimindedir. Başarılı biri için "şansı yaver gitti" deriz; kendi başarımız içinse emeğimizi anarız. Bu çifte ölçü, hem başkalarına haksızlık etmemize hem de kendi hatalarımızdan ders çıkarmamıza engel olur.

Bu parçada yazar aşağıdakilerden hangisini eleştirmektedir?',
  '{"options":["Başarılı insanların şansa güvenmesini","Bireylerin emeğine değer vermesini","Hatalardan ders çıkarmayı","Kendimizi ve başkalarını değerlendirirken farklı ölçütler kullanmayı","Başkalarının kararlarını sorgulamayı"],"correctIndex":3}'::jsonb,
  'Yazar, kendimiz için emeği, başkaları için şansı öne çıkarmamızı "çifte ölçü" olarak adlandırır ve bunun zararlarını sıralar.',
  '"Şansa güvenmek" ve "emeğe değer vermek" ifadeleri parçada geçtiği için aday bunları eleştirilen davranış sanabilir. Oysa eleştirilen, ikisinin farklı kişiler için farklı kullanılmasıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Kar yağdığında sesin neden daha az duyulduğunu hiç düşündünüz mü? Taze kar, içindeki hava boşlukları sayesinde ses dalgalarını emer ve yansımalarını azaltır. Bu yüzden karlı bir sabah, şehir olağan gürültüsüne rağmen adeta sessizleşir.

Bu parçaya en uygun başlık aşağıdakilerden hangisidir?',
  '{"options":["Karın Sesi Emme Özelliği","Karın Oluşum Süreci","Şehirlerde Gürültü Kirliliği","Kış Aylarında Ulaşım Sorunları","Ses Dalgalarının Yayılma Hızı"],"correctIndex":0}'::jsonb,
  'Parça, taze karın hava boşlukları sayesinde sesi emdiğini anlatır; en uygun başlık karın ses emme özelliğidir.',
  'Parçada şehir gürültüsü ve ses dalgaları anıldığı için aday "gürültü kirliliği" ya da "yayılma hızı" gibi başlıklara yönelebilir. Oysa asıl konu karın sesi nasıl emdiğidir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Kamuya açık veriler, yurttaşın denetim gücünü artırır; ancak yalnızca veriyi açmak yetmez. Veri, anlaşılır biçimde sunulmadığında bir bilgi yığınına dönüşür ve denetimi kolaylaştırmak yerine zorlaştırır. Bu nedenle şeffaflığın ölçütü, verinin ne kadar açıldığı değil, ne kadar anlaşılabildiğidir.

Bu parçaya göre aşağıdakilerden hangisi söylenemez?',
  '{"options":["Açık veri, yurttaşın denetim gücünü artırabilir.","Anlaşılmaz biçimde sunulan veri, denetimi güçleştirebilir.","Şeffaflığın ölçütü, verinin anlaşılabilirliğidir.","Veriyi açmak, şeffaflık için tek başına yeterli değildir.","Verinin miktarı arttıkça şeffaflık da kendiliğinden artar."],"correctIndex":4}'::jsonb,
  'Parça, verinin yalnızca açılmasının yetmediğini, anlaşılır olması gerektiğini söyler. Bu nedenle miktar arttıkça şeffaflığın kendiliğinden arttığı yargısı parçayla çelişir.',
  'İlk cümlede "açık veri denetimi artırır" dendiği için aday miktarın da şeffaflığı artırdığını düşünebilir. Ancak parça anlaşılabilirliği ölçüt olarak belirler.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Bir dil, yalnızca konuşanlarının sayısıyla yaşamaz; o dilde üretilen bilim, sanat ve gündelik düşünceyle yaşar. Konuşuru milyonlarca olan bir dil bile bilgi üretiminin dışında kalırsa zamanla kendi kavramlarını başka dillerden ödünç almak zorunda kalır. Bu yüzden bir dili korumak, onu yalnızca konuşmak değil, onunla düşünmeyi ve üretmeyi sürdürmektir.

Bu parçadaki son cümlenin işlevi aşağıdakilerden hangisidir?',
  '{"options":["Konuya ilişkin bir tanım vermek","Önceki yargılardan hareketle bir sonuç ve öneri ortaya koymak","Önceki cümledeki görüşe karşı çıkmak","Konuyu örnekle somutlaştırmak","Konuyu başka bir alana taşımak"],"correctIndex":1}'::jsonb,
  'Son cümle "Bu yüzden" ile başlar ve önceki yargılardan bir sonuç çıkarır: dili korumak, onunla düşünmeyi ve üretmeyi sürdürmektir.',
  'Son cümlede "dili korumak" ifadesi tanım gibi okunabilir. Ancak cümle "Bu yüzden" ile gerekçeye dayandığı için işlevi tanım değil, sonuç ve öneridir.',
  array['lisans_gygk']::text[],
  'lisans'
);
