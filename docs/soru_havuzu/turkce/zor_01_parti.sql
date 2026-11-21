-- ==========================================================================
-- KADRO SORU HAVUZU · KPSS GY Türkçe · ZOR PARTİ 1 (30 soru, ağırlıklı zorluk 3) · SUPABASE SQL
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
  3,
  'Bir toplumun hafızası yalnızca anıtlarda, belgelerde ya da müzelerde saklanmaz; anlatılan hikâyelerde, ninnilerde, yemek tariflerinde, hatta sokak adlarında da yaşar. Bu gündelik izler, resmî tarihin atladığı ayrıntıları taşır. Ancak bunlar yazıya geçirilmediği için kuşaklar arasında kolayca silinir. Bu yüzden belleği korumak, yalnızca kalıcı yapıları değil, kırılgan ve sıradan görünen izleri de gözetmeyi gerektirir.

Bu parçada asıl vurgulanan düşünce aşağıdakilerden hangisidir?',
  '{"options":["Resmî tarih, toplumsal belleğin tek güvenilir kaynağıdır.","Toplumsal belleğin korunması, gündelik hayattaki kırılgan izlerin de dikkate alınmasına bağlıdır.","Ninniler ve yemek tarifleri yazıya geçirilmediği için değersizdir.","Anıtların korunması, kuşaklar arası aktarımı kolaylaştırır.","Sokak adları, bir toplumun en kalıcı belleğidir."],"correctIndex":1}'::jsonb,
  'Parça, belleğin yalnızca anıt ve belgelerde değil gündelik izlerde de yaşadığını, bu izlerin kolay silindiğini söyler ve sonuç cümlesinde bunların da gözetilmesi gerektiğini bildirir.',
  'Parçanın ilk yarısı anıt ve müzelerden söz ettiği için aday, kalıcı yapıların korunmasını asıl konu sanabilir. Oysa yazar bunları yetersiz bulur; vurgu, sıradan görünen kırılgan izlerdedir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Çevirmen, iki dil arasında yalnızca sözcük aktaran biri değildir; kaynak metnin ritmini, imgelerini ve sessizliklerini hedef dilde yeniden kurmaya çalışan bir yazardır. Ne var ki bu yeniden kuruluş, yapıtı özgün metinden bağımsız kılmaz; çevirmen, özgünün sınırları içinde özgürdür.

Bu parçadan aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Çevirmen, metnin biçimsel özelliklerini de aktarmaya çalışır.","Çevirmenin özgürlüğü sınırsız değildir.","Çeviride yalnızca sözcük karşılığı bulmak yeterli değildir.","Çeviri, özgün metne bağlı kalmaksızın yapılan bağımsız bir yazarlık etkinliğidir.","Çevirmenlik, bir bakıma yaratıcı bir uğraştır."],"correctIndex":3}'::jsonb,
  'Parça, çevirmenin yazar gibi çalıştığını söyler ama bu çalışmanın özgün metnin sınırlarıyla bağlı olduğunu vurgular. Bu nedenle çevirinin özgünden bağımsız olduğu yargısı parçayla çelişir.',
  'Parçada çevirmen "yazar" olarak anıldığı için bağımsız yaratıcılık yargısı doğru gibi görünür. Ancak "özgünün sınırları içinde özgürdür" ifadesi bu bağımsızlığı açıkça reddeder.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  '(I) Mevsimlik işçilik, Anadolu''da onlarca yıldır süren bir göç biçimidir. (II) Aileler, tarım takvimine göre yer değiştirir ve çocuklar çoğu zaman bu yolculukların bir parçası olur. (III) Bu durum, çocukların okula devamını doğrudan etkiler. (IV) Öte yandan sorunun çözümü yalnızca okul sistemine bırakılamaz. (V) Çalışma koşullarının, barınma imkânlarının ve ücret düzeninin de iyileştirilmesi gerekir.

Bu parça iki paragrafa bölünmek istense ikinci paragraf hangi cümleyle başlamalıdır?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":3}'::jsonb,
  'İlk üç cümle sorunu ve çocuklara etkisini anlatır. IV. cümle "Öte yandan" ile çözüm konusuna geçer; yeni bir düşünce başladığı için ikinci paragraf bu cümleyle başlar.',
  'III. cümle "Bu durum" ile başladığı için önceki cümleye sıkıca bağlıdır; ancak ayrılma noktası olarak "Öte yandan" ile konu değiştiren IV. cümle daha uygundur. Aday III''ü seçerse sorun-sonuç bütünlüğünü böler.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Eleştiri, bir yapıtı yüceltmek ya da yerin dibine sokmak için yazılmaz. ....... Çünkü iyi bir eleştirmen, yapıtın neyi nasıl yaptığını ortaya koyarak okurun kendi yargısına zemin hazırlar.

Bu parçada boş bırakılan yere düşüncenin akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["Eleştirmen, yapıtı yazarından daha iyi anladığını kanıtlamak ister.","Yüceltici eleştiriler, okurların güvenini kazanır.","Bir yapıtın değeri, çok okunmasıyla ölçülür.","Eleştirmenler çoğu zaman yazarlarla uzlaşma içinde olmalıdır.","Eleştirinin asıl işlevi, hüküm vermekten çok okuru düşünmeye yöneltmektir."],"correctIndex":4}'::jsonb,
  'Boşluktan sonraki "Çünkü" cümlesi, eleştirmenin okurun yargısına zemin hazırladığını söyler. Bu gerekçe yalnızca eleştirinin amacını hüküm vermek değil düşündürmek olarak tanımlayan cümleyle uyumludur.',
  'İlk cümledeki "yüceltmek" sözü dikkat çektiği için aday yüceltme ve değerlendirmeyle ilgili şıklara yönelebilir. Oysa boşluktan sonraki gerekçe okurun yargısına yönelir; bu da doğru şıkkı belirler.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'İnsan, kendi alışkanlıklarını doğa yasası sanmaya yatkındır. Sabah kahvesiz geçmeyen günü, akşam haberlerini kaçırmamayı, yolculukta hep aynı koltuğu istemeyi yalnızca kişisel bir tercih olarak görürüz; oysa bunların çoğu tekrarla katılaşmış davranışlardır. Bu farkı görebilen biri, değişime karşı daha esnek bir tutum geliştirebilir.

Bu parçada asıl dikkat çekilmek istenen aşağıdakilerden hangisidir?',
  '{"options":["Bireyler, alışkanlıklarından vazgeçmekte her zaman zorlanır.","Doğa yasaları, insan davranışlarını belirler.","Alışkanlıkların tercih değil tekrarın ürünü olduğunu fark etmek, değişime açıklığı artırır.","Sabah kahvesi gibi alışkanlıklar sağlığı olumsuz etkiler.","Değişime açık olmak, kişisel tercihleri yok saymayı gerektirir."],"correctIndex":2}'::jsonb,
  'Yazar, alışkanlıkların kişisel tercih sanıldığını, aslında tekrarın sonucu olduğunu belirtir ve bu farkındalığın değişime karşı esnekliği artırabileceğini söyler.',
  '"Alışkanlıklardan vazgeçmek zordur" yargısı genel bir doğru gibi durur. Oysa parça bunu söylemez; yalnızca farkındalığın esnekliği artırabileceğini belirtir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Kentlerde ağaç sayısı arttıkça sıcaklık farkı azalır; çünkü yapraklar hem gölge sağlar hem de buharlaşma yoluyla çevreyi serinletir. Bunun yanında ağaçlar, havadaki toz parçacıklarını tutarak solunan havanın kalitesini yükseltir. Ancak kent planlamasında ağaçlandırma çoğu zaman, yol genişletme gibi acil görünen işlerin gerisinde kalır.

Bu parçada aşağıdakilerden hangisine değinilmemiştir?',
  '{"options":["Ağaçların serinletici etkisinin nedenine","Ağaçlandırmanın maliyetinin diğer kentsel yatırımlardan daha yüksek olduğuna","Ağaçların hava kalitesine katkısına","Ağaçlandırmanın planlamada geri plana itildiğine","Ağaçların gölge sağlamasına"],"correctIndex":1}'::jsonb,
  'Parçada serinletme nedeni (gölge ve buharlaşma), hava kalitesi ve planlamadaki ihmal anlatılır. Maliyet karşılaştırmasına hiç değinilmez.',
  'Son cümlede ağaçlandırmanın başka işlerin gerisinde kaldığı söylendiği için aday bunu maliyetle ilişkilendirebilir. Oysa nedenin maliyet olduğu parçada belirtilmez.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'I. Bu nedenle çoğu uzman, yeni bir beceri öğrenirken kısa ama düzenli çalışmayı önerir.
II. Beyin, öğrendiklerini uyku ve dinlenme sırasında pekiştirir.
III. Uzun ve aralıksız çalışmalar ise bu pekiştirme fırsatını azaltır.
IV. Öğrenme, yalnızca çalışılan sürenin uzunluğuna bağlı değildir.
V. Aralıklı çalışma, bilgilerin dinlenme araları boyunca yerleşmesine zaman tanır.

Bu cümlelerle anlamlı bir paragraf oluşturulduğunda baştan dördüncü cümle hangisi olur?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":2}'::jsonb,
  'Doğru sıra IV - II - V - III - I''dir. IV genel yargıyı verir, II beynin pekiştirmesini anlatır, V aralıklı çalışmayı, III ise ("ise") uzun çalışmayı karşıt olarak tanımlar, I ("Bu nedenle") sonuçtur. Baştan dördüncü cümle III.''tür.',
  '"Bu nedenle" bağlacı I. cümleyi sonuna iter; ancak III. cümledeki "ise" ve "bu pekiştirme" ifadeleri, III''ün V''ten sonra gelmesi gerektiğini gösterir. Aday dördüncü sırayı I. cümleyle karıştırabilir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Fotoğraf, bir anı olduğu gibi dondurur; resim ise anı ressamın gözünden ve belleğinden süzerek yeniden kurar. Birincisinde sahne makinenin anlık kaydıdır; ikincisinde ise zamanın ve duygunun birikimidir.

Bu parçada yazar, düşüncesini geliştirirken aşağıdakilerden hangisinden yararlanmıştır?',
  '{"options":["Karşılaştırma","Örnekleme","Tanık gösterme","Tanımlama","Sayısal verilerden yararlanma"],"correctIndex":0}'::jsonb,
  'Parça, fotoğraf ile resmi benzerlik ve ayrılık yönünden karşı karşıya koyar; bu bir karşılaştırmadır.',
  '"Fotoğraf, anı dondurur" gibi ifadeler tanım izlenimi verdiği için aday tanımlamayı seçebilir. Oysa iki kavram birbiriyle kıyaslandığı için asıl yöntem karşılaştırmadır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Sessizlik, konuşmanın yokluğu değil, çoğu zaman konuşmanın en yoğun biçimidir. Söylenmemiş bir söz, söylenmiş olandan daha çok şey taşıyabilir; çünkü dinleyen kişi boşluğu kendi yaşantısıyla doldurur. Bu yüzden iyi bir dinleyici, yalnızca sözcükleri değil, sözcükler arasındaki boşlukları da duyabilen kişidir.

Bu parçada vurgulanan düşünce aşağıdakilerden hangisidir?',
  '{"options":["Çok konuşan kişiler iyi dinleyici olamaz.","Sessizlik, anlaşmazlıkları çözmenin en etkili yoludur.","Söylenmiş sözler, söylenmeyenlerden daha çok şey taşır.","Dinleyiciler, konuşmacılardan daha yaratıcıdır.","Söylenmeyenler de iletişimin bir parçasıdır ve iyi dinleme bunları fark etmeyi gerektirir."],"correctIndex":4}'::jsonb,
  'Yazar, sessizliğin ve söylenmeyenin de iletişim taşıdığını, iyi dinleyicinin bunları duyabilen kişi olduğunu söyler.',
  '"Söylenmiş sözler daha çok şey taşır" yargısı, parçadaki karşılaştırmanın tersidir; aday cümleyi hızlı okursa iki ifadeyi birbirinin yerine koyabilir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  '(I) Bilimsel bir bulgu, ne kadar etkileyici olursa olsun, tek bir deneyle doğrulanmış sayılmaz. (II) Çünkü aynı sonucun başka laboratuvarlarda, başka araştırmacılar tarafından yeniden elde edilebilmesi gerekir. (III) Bu tekrarlanabilirlik ilkesi, bilimi inanç ve söylentiden ayıran temel ölçüttür.

Bu parçadaki II. cümlenin işlevi aşağıdakilerden hangisidir?',
  '{"options":["Konuyla ilgili somut bir örnek vermek","Önceki cümledeki düşünceye karşı çıkmak","Kendinden önceki cümledeki yargıyı gerekçelendirmek","Parçanın ana düşüncesini özetlemek","Yeni bir konuya geçiş yapmak"],"correctIndex":2}'::jsonb,
  'II. cümle "Çünkü" ile başlar ve I. cümledeki yargının (tek deney yetmez) nedenini açıklar.',
  'III. cümle de genel bir sonuç verdiği için aday II. cümleyi özet sanabilir. Ancak özet işlevi III''tedir; II ise I''in gerekçesidir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Çocuklara doğru yanıtı vermek çoğu zaman en kolay yoldur; hızlıdır, merak sorusunu keser, büyüğün otoritesini korur. Ama çocuğa yanıtı kendisinin bulması için zaman tanımak, onun öğrenmeyi bir yük değil bir keşif olarak görmesini sağlar. Bu yüzden .......

Bu parçanın sonuna düşüncenin akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["çocuklar, büyüklerin söylediklerini sorgulamamalıdır.","bir soruya hemen yanıt vermek yerine çocuğu yanıta götürecek başka bir soru sormak çoğu zaman daha öğreticidir.","hızlı yanıt vermek, öğretmenlerin en önemli becerisidir.","merak, çocukluk döneminde sona eren bir duygudur.","doğru yanıtı bilmeyen büyükler, çocuklarla konuşmaktan kaçınmalıdır."],"correctIndex":1}'::jsonb,
  'Parça, hazır yanıtın kolaylığını eleştirir ve çocuğun kendi keşfinin değerini savunur. "Bu yüzden" bağlacı bu fikrin uygulama önerisiyle tamamlanmasını gerektirir.',
  'İlk cümlelerde "hızlıdır" ve "otoriteyi korur" gibi olumlu görünen ifadeler yer aldığı için aday hızlı yanıt yönünde bir şık seçebilir. Oysa yazar bu yolu kolay olduğu için eleştirir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Günümüzde okuma, çoğu zaman bir yarışa dönüşmüş durumda: yılda kaç kitap bitirdiğimizi paylaşıyor, listeler hazırlıyor, hedefler koyuyoruz. Oysa bir kitabı sayı olarak biriktirmek, onunla gerçekten karşılaşmak değildir. Üç sayfayı düşünerek okuyan, otuz sayfayı gözden geçirenden çoğu zaman daha çok şey kazanır.

Bu parçada yazarın eleştirdiği tutum aşağıdakilerden hangisidir?',
  '{"options":["Okuduğu her kitabı derinlemesine incelemek","Okuma alışkanlığı edinmemiş olmak","Kitapları yalnızca eğlence amacıyla okumak","Okumayı, nicel hedeflerle ölçülen bir başarıya dönüştürmek","Bir kitabı birden fazla kez okumak"],"correctIndex":3}'::jsonb,
  'Yazar, okumanın yılda kaç kitap bitirildiği gibi sayılarla ölçülmesini eleştirir ve derinlemesine okumayı över.',
  '"Üç sayfayı düşünerek okumak" ifadesi yavaş okuma çağrışımı yaptığı için aday bunu eleştirilen tutum sanabilir. Oysa yazar bunu övmektedir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Bir ürünün fiyatı düştüğünde talebin artması beklenir; ancak bu her zaman böyle olmaz. Lüks sayılan bazı mallarda fiyat düşüşü, ürünün "ayrıcalıklı" imajını zedelediği için talebi azaltabilir.

Bu parçaya göre aşağıdakilerden hangisi doğrudur?',
  '{"options":["Fiyat düşüşü, bazı mallarda talebi azaltabilir.","Fiyat düşüşü, bütün lüks mallarda talebi artırır.","Talep, fiyattan bağımsız olarak değişir.","Ayrıcalıklı imajı olan ürünler her zaman pahalı satılır.","Fiyat düşüşü hiçbir mal grubunda talebi artırmaz."],"correctIndex":0}'::jsonb,
  'Parça, fiyat düşüşünün genellikle talebi artırdığını ama lüks sayılan bazı mallarda tersinin olabileceğini söyler.',
  '"Her zaman böyle olmaz" ifadesi kesin yargıları çağrıştırdığı için aday "hiçbir mal grubunda artırmaz" gibi uç şıkları seçebilir. Oysa parça yalnızca bazı malları kapsar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Sosyal medyada paylaşılan her görüntüye gerçeklik atfetme eğilimi, seçilmiş bir parçayı bütün sanma yanılgısından doğuyor. Kare, çerçevenin dışında kalanı göstermez; hangi anın seçildiği, nasıl aydınlatıldığı ve neyin kırpıldığı, anlamı baştan belirler. Bu yüzden görüntüye bakarken "Ne görüyorum?" sorusu kadar "Ne görmüyorum?" sorusu da sorulmalıdır.

Bu parçada asıl anlatılmak istenen aşağıdakilerden hangisidir?',
  '{"options":["Sosyal medya paylaşımları genellikle kasıtlı olarak yanıltıcıdır.","Fotoğraf çekerken ışığa ve çerçeveye dikkat edilmelidir.","Görüntüler, yazılı metinlerden daha güvenilirdir.","Gerçeklik, yalnızca doğrudan deneyimle kavranabilir.","Görüntülerin seçilmiş bir bakışı yansıttığı bilinerek, görünmeyenin de sorgulanması gerekir."],"correctIndex":4}'::jsonb,
  'Yazar, görüntünün seçilmiş bir parça olduğunu, anlamını çerçeve ve kırpmaların belirlediğini söyler ve son cümlede görünmeyenin de sorgulanmasını önerir.',
  '"Kırpma" ve "aydınlatma" sözleri aday için bilinçli bir yanıltma çağrışımı yapar. Oysa yazar niyetten değil, görüntünün doğası gereği seçici olmasından söz eder.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  '"Bilgi, paylaşıldıkça azalmaz; tersine çoğalır."

Bu cümleyle anlamca en yakın cümle aşağıdakilerden hangisidir?',
  '{"options":["Bilgiyi paylaşan kişi, kendi bilgisinden bir parçayı yitirir.","Bilgi, yalnızca onu saklayanlara değer katar.","Bilgiyi başkalarına aktarmak, sahibinin bir şey yitirmesine yol açmadığı gibi onu zenginleştirir.","Bilgiyi çoğaltmanın tek yolu onu saklamaktır.","Paylaşılan bilgi, zamanla değerini yitirir."],"correctIndex":2}'::jsonb,
  'Cümle, paylaşmanın bilgiyi azaltmadığını, çoğalttığını söyler. Doğru şık bu iki yargıyı (kayıp yok, zenginleşme var) birlikte verir.',
  'Diğer şıklar "bilgi" ve "paylaşma" sözcüklerini kullandığı için benzer görünür. Ancak paylaşmanın kayıp ya da değer kaybı getirdiğini söyleyerek cümleyi tersine çevirir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  '"Haklı olmak, her zaman kazanmak anlamına gelmez."

Bu cümleyle anlamca en yakın cümle aşağıdakilerden hangisidir?',
  '{"options":["Haklı olanlar, mutlaka kazanır.","Doğruyu savunan kişi, her tartışmanın sonunda üstün çıkmayabilir.","Kazananlar, her zaman haklıdır.","Haklı olmak, tartışmalarda hiçbir işe yaramaz.","Her tartışmada iki taraf da haklıdır."],"correctIndex":1}'::jsonb,
  'Cümle, haklılık ile kazanma arasında zorunlu bir bağ olmadığını söyler. Doğru şık, haklı olanın her zaman kazanmayabileceğini belirtir.',
  '"Kazananlar her zaman haklıdır" şıkkı, aynı sözcükleri ters yönde kullandığı için çeldiricidir. Oysa cümle haklılıktan kazanmaya doğru zorunlu bir ilişkiyi reddeder.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  3,
  '"Kitabı bitirmeden önce eleştirmeye kalkanlar, aslında kitabı değil kendi önyargılarını eleştirir."

Bu cümleden aşağıdaki yargılardan hangisine ulaşılamaz?',
  '{"options":["Bitirmeden eleştirmek, önyargıyla hareket etmenin göstergesi olabilir.","Eleştiri, okuma tamamlandıktan sonra yapılmalıdır.","Eleştirenin önyargıları, değerlendirmesini etkiler.","Eleştirinin geçerliliği, kitabın tamamen okunmasına bağlı değildir.","Bitirilmeden yapılan eleştiri, kitabı değil eleştireni anlatır."],"correctIndex":3}'::jsonb,
  'Cümle, bitirmeden yapılan eleştirinin önyargıyı yansıttığını söyler. Bu nedenle eleştirinin kitabı tamamen okumaya bağlı olmadığı yargısı cümleyle çelişir.',
  '"Önyargı" vurgusu nedeniyle aday, eleştirinin her durumda geçerli olabileceğini düşünebilir. Oysa cümle bitirmeden yapılan eleştiriyi kusurlu göstermektedir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde "için" sözcüğü diğerlerinden farklı olarak amaç bildirir?',
  '{"options":["Sözünü tutmak için gece gündüz çalıştı.","Yeterince çalışmadığı için sınavı geçemedi.","Hava çok soğuk olduğu için toplantı iptal edildi.","Yol kapalı olduğu için geç kaldık.","Kendine güvenmediği için teklifi reddetti."],"correctIndex":0}'::jsonb,
  'İlk cümlede çalışmanın amacı sözünü tutmaktır; "için" amaç bildirir. Diğerlerinde "için" yaptığı eylemin nedenini belirtir.',
  'Bütün cümlelerde "için" bulunduğu için aday hepsini neden-sonuç sanabilir. Eylemden önce gelen yapının bir hedefi mi yoksa gerekçeyi mi bildirdiğine bakmak gerekir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  3,
  '"Sorun, çözülemeyecek kadar büyük değil; yalnızca çözmeye çalışanların sayısı az."

Bu cümleyle anlamca en yakın cümle aşağıdakilerden hangisidir?',
  '{"options":["Sorun çok büyük olduğu için çözülememektedir.","Sorunu çözmeye çalışan çok kişi var ama sonuç alınamıyor.","Sorunun büyüklüğü, çözüm arayanların sayısına bağlıdır.","Sorun çözülemeyecek kadar büyük olduğu için kimse uğraşmıyor.","Sorunun çözülememesi, büyüklüğünden çok çözüm arayanların azlığından kaynaklanmaktadır."],"correctIndex":4}'::jsonb,
  'Cümle, sorunun büyüklüğünü değil çözümle uğraşanların azlığını asıl neden olarak gösterir. Doğru şık bu ilişkiyi korur.',
  '"Sorun büyük" ve "çözüm arayan az" bilgilerinin her ikisi de diğer şıklarda geçer. Ancak diğerlerinde neden-sonuç ilişkisi tersine çevrilir ya da değiştirilir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  2,
  '"Haberi duyunca yüzü düştü." cümlesindeki "düşmek" sözcüğü aşağıdakilerin hangisinde aynı anlamda kullanılmıştır?',
  '{"options":["Çocuk koşarken yere düştü.","Havalar soğuyunca fiyatlar düştü.","Sonucu görünce morali düştü.","Yolu bu kasabaya düştü.","Raflardan kitaplar düştü."],"correctIndex":2}'::jsonb,
  'Soru kökündeki "düşmek", sevinçten üzüntüye geçen bir ruh hâlini anlatır. Aynı anlam, "morali düştü" ifadesinde de vardır.',
  '"Fiyatlar düştü" gibi yapılar "azalmak" anlamıyla yakın görünür; ancak kökteki anlam bir yüz ifadesi ve ruh hâliyle ilgilidir, nicel bir azalma değildir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  2,
  '"Bu haber hepimizin kalbini kırdı." cümlesindeki "kırmak" sözcüğü aşağıdakilerin hangisinde aynı anlamda kullanılmıştır?',
  '{"options":["Kapıyı kırıp içeri girdiler.","Küçük sözleriyle onu kırmak istemedim.","Yeni rekoru kırdı.","Fındıkları taşla kırdı.","Yoldaki buzu kırdı."],"correctIndex":1}'::jsonb,
  'Soru kökünde "kırmak", "üzmek, incitmek" anlamındadır. Aynı anlam yalnızca "onu kırmak istemedim" cümlesindedir.',
  '"Kapıyı kırmak" ve "buzu kırmak" gibi ifadeler somut kırma eylemidir. Aday "kırmak" fiilinin gerçek anlamına yönelirse yanılır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  2,
  '"Sakınan göze çöp batar." atasözüyle anlamca en yakın cümle aşağıdakilerden hangisidir?',
  '{"options":["Gözü pek olan, her tehlikeden kurtulur.","Dikkatli davranan kişi hiçbir zarar görmez.","Küçük bir hata büyük sorunlara yol açar.","Ne kadar önlem alınırsa alınsın, beklenmedik bir kötülükle karşılaşılabilir.","Zarardan kaçan, kazancı da kaçırır."],"correctIndex":3}'::jsonb,
  'Atasözü, çok sakınan kişinin bile başına beklenmedik bir kötülük gelebileceğini anlatır.',
  '"Dikkatli davranan zarar görmez" şıkkı atasözünün tersini söyler; ancak "sakınmak" sözcüğü nedeniyle doğru sanılabilir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlenin Ögeleri ve Cümle Türleri',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerin hangisinde özne, fiilimsiyle kurulmuştur?',
  '{"options":["Okumak, insana yeni bir dünya açar.","Çocuk, okumayı çok sever.","Yarın erken kalkacağız.","Kitabı okuyarak öğrendi.","Hava soğuyunca eve girdik."],"correctIndex":0}'::jsonb,
  '"Okumak" bir isim-fiildir ve cümlede öznedir. "Okumayı" belirtili nesne, diğer cümlelerde fiilimsiler zarf tümleci görevindedir.',
  '"Okumayı" da isim-fiil olduğu için aday özne sanabilir. Ancak o, yüklemin etkilediği öğedir ve nesnedir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlenin Ögeleri ve Cümle Türleri',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerin hangisi hem birleşik hem de isim cümlesidir?',
  '{"options":["Bu yol çok uzundur.","Çocuklar okula giderken şarkı söylüyordu.","Sınavı kazanan öğrenci ödül aldı.","Yarın erkenden yola çıkacağız.","Her sabah erken kalkmak, sağlıklı bir yaşamın ilk koşuludur."],"correctIndex":4}'::jsonb,
  'Doğru şıkta "kalkmak" isim-fiil olduğu için cümle birleşiktir; yüklem "koşuludur" ad soyludur, bu yüzden isim cümlesidir.',
  '"Bu yol çok uzundur" da isim cümlesidir ama basittir. "Giderken" ve "kazanan" ise fiilimsi içerdiği için birleşiktir ama yüklemleri eylemdir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Anlatım Bozuklukları',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerin hangisinde anlatım bozukluğu vardır?',
  '{"options":["Eve dönerken yolda eski bir arkadaşıyla karşılaştı.","Kitabı okuduktan sonra duygularını yazdı.","Sınavı kazanamayınca üzüldü ve kendine kızıyor.","Yorulunca bir süre dinlenmek istedi.","Sabah erkenden kalkarak yola çıktı."],"correctIndex":2}'::jsonb,
  '"Üzüldü" geçmiş zamanlı, "kızıyor" şimdiki zamanlı çekimlenmiştir; aynı cümlede zaman uyumsuzluğu vardır. Diğer cümlelerde yüklemlerin zamanı ve özneleri uyumludur.',
  'Cümle akıcı göründüğü için fiillerin zaman ekleri gözden kaçabilir. Aynı cümledeki yüklemler aynı zaman çekimini taşımalıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Anlatım Bozuklukları',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerin hangisinde anlam belirsizliği vardır?',
  '{"options":["Ayşe, kardeşine yeni bir kitap aldı.","Genç doktora şikâyetlerini tek tek anlattı.","Dün akşam arkadaşımla sinemaya gittik.","Annem market alışverişini bitirdi.","Müdür, toplantıyı yarına erteledi."],"correctIndex":1}'::jsonb,
  '"Genç doktora" ifadesi hem "genç doktor"a hem de "genç, doktora" biçiminde okunabilir; kimin genç olduğu belirsizdir. Diğer cümlelerde belirsizlik yoktur.',
  'Cümle akıcı olduğu için belirsizlik fark edilmez. İfade iki farklı biçimde bölünebiliyorsa anlam belirsizliği vardır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  '"Hava güneşliyse piknik yapılacak. Piknik yapılırsa Selin gelecek." Selin gelmedi.

Buna göre aşağıdakilerden hangisi kesinlikle doğrudur?',
  '{"options":["Piknik yapıldı.","Hava yağmurluydu.","Selin, piknik yapılmadığı için gelmedi.","Hava güneşli değildi.","Hava güneşliydi ama piknik iptal edildi."],"correctIndex":3}'::jsonb,
  'Selin gelmediğine göre piknik yapılmamıştır. Hava güneşli olsaydı piknik yapılacaktı; bu nedenle hava güneşli değildi.',
  '"Güneşli değildi" ile "yağmurluydu" aynı şey sanılabilir. Oysa hava başka biçimlerde (bulutlu, rüzgârlı) de olabilir; yalnızca güneşli olmadığı kesindir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  'Ada, Barış, Cem, Deniz, Ece ve Fatih bir sırada soldan sağa dizilmiştir. Barış, Cem''in hemen solundadır. Ece, Fatih''in hemen sağındadır. Ada en sağdadır. Deniz, Barış''ın solundadır ve ilk sırada değildir. Fatih, Barış''ın solundadır.

Buna göre soldan ikinci sırada kim vardır?',
  '{"options":["Ece","Ada","Barış","Cem","Deniz"],"correctIndex":0}'::jsonb,
  'Ada 6. sıradadır. Barış-Cem bir blok; Ece-Fatih bir blok oluşturur. Deniz, Barış''ın solunda ve ilk sırada olmadığından sıra Fatih, Ece, Deniz, Barış, Cem, Ada olur. Soldan ikinci kişi Ece''dir.',
  'Ece-Fatih bloğunun sırası ("Ece, Fatih''in hemen sağında") sık karıştırılır. Aday Fatih''i ikinci sanabilir; oysa Fatih''in sağında Ece vardır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  'Dört kişinin söyledikleri aşağıda verilmiştir. Her biri ya her zaman doğru ya da her zaman yalan söylemektedir.

Ali: "Berk doğru söylüyor."
Berk: "Cem yalan söylüyor."
Cem: "Ali ile Deniz''in ikisi de yalan söylüyor."
Deniz: "Berk yalan söylüyor."

Buna göre doğru söyleyenler aşağıdakilerden hangileridir?',
  '{"options":["Berk ve Cem","Cem ve Deniz","Ali ve Berk","Ali ve Deniz","Yalnızca Berk"],"correctIndex":2}'::jsonb,
  'Ali doğru söylüyorsa Berk de doğru söyler; Berk doğruysa Cem yalancıdır. Deniz doğru söyleyen Berk için "yalan söylüyor" dediğinden yalancıdır. Cem''in "ikisi de yalan" sözü, Ali doğru olduğu için yanlıştır; yani Cem''in yalancı olması tutarlıdır. Ali yalancı olsaydı Berk, Cem ve Deniz arasında çelişki çıkardı. Doğru söyleyenler Ali ve Berk''tir.',
  'Deniz ve Berk''in birbirine zıt sözleri aday için iki kişiden yalnızca birinin doğru olduğu izlenimi verir. Doğru yol, tek tutarlı senaryoyu bulmaktır.',
  array['lisans_gygk']::text[],
  'lisans'
);
