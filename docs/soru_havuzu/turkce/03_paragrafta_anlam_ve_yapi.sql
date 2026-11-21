-- ==========================================================================
-- KADRO SORU HAVUZU · KPSS GY Türkçe · Paragrafta Anlam ve Yapı (10 soru) · SUPABASE SQL
-- exam_scopes: lisans_gygk · education_level: lisans · Özgün üretim (TASK-140 pilot)
-- Not: Dosya yeniden çalıştırılırsa aynı sorular çoğalır; önce silmeden tekrar çalıştırma.
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
  'Bir kentin kimliği yalnızca tarihî yapılarından ya da meydanlarından oluşmaz. Sokaklarında yankılanan sesler, pazarlarının kokusu, insanların birbirine selam verme biçimi de o kentin ruhunu oluşturur. Kenti anlamak isteyen kişi, rehberlerin gösterdiği yerlerle yetinmemeli, günlük yaşamın içinde dolaşmalıdır.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Bir kenti tanımak için günlük yaşamın içindeki ayrıntılara da bakmak gerekir.","Tarihî yapılar, bir kentin en önemli özelliğidir.","Rehberler, kenti en iyi tanıtan kişilerdir.","Pazarlar, kentlerin kimliğini belirleyen tek unsurdur.","Kentlerin ruhu zamanla değişir."],"correctIndex":0}'::jsonb,
  'Parçada kentin kimliğinin yalnızca tarihî yapılarla sınırlı olmadığı, günlük yaşamın da onu oluşturduğu vurgulanır. Son cümle bu düşünceyi öneri biçiminde toplar.',
  'İlk cümledeki "tarihî yapılar" ifadesi dikkat çektiği için aday ilk şıkka yönelebilir. Oysa parça bu ifadeyi yetersiz bulur; asıl vurgu günlük yaşamın ayrıntılarındadır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'I. Bu nedenle ikisini birlikte düşünmek gerekir.
II. Eğitimde kimileri ezberi, kimileri anlamayı öne çıkarır.
III. Ezber, bilginin kalıcı hâle gelmesine yardımcı olur.
IV. Anlama ise bilgiyi kullanabilmeyi sağlar.
V. Bu yaklaşımlardan yalnızca birine yaslanan öğrenci, eksik bir birikimle yetinmek zorunda kalır.

Numaralanmış cümlelerle anlamlı bir paragraf oluşturulduğunda baştan üçüncü cümle hangisi olur?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":3}'::jsonb,
  'Doğru sıra II - III - IV - V - I''dir. II. cümle konuyu açar, III ezberi, IV ise "anlama ise" bağlantısıyla anlamayı anlatır. V. cümle yalnızca birine yaslanmanın sonucunu verir, I. cümle ("Bu nedenle") sonuca bağlar. Baştan üçüncü cümle IV.''dür.',
  'III. cümle ezberi anlattığı için baştan üçüncü gibi durur. Ancak IV. cümledeki "ise" bağı onun hemen III.''ten sonra geldiğini gösterir; bu nedenle üçüncü sırada anlamayı anlatan IV. cümle yer alır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  1,
  'Arılar yalnızca bal üretmekle kalmaz; çiçekli bitkilerin üremesini sağlayarak doğal dengenin sürmesine de katkıda bulunur. Dünyadaki gıda ürünlerinin büyük bölümü, tozlaşma için arıların çalışmasına bağlıdır. Bu nedenle arı popülasyonundaki azalma, yalnızca arıcıları değil, bütün canlıları ilgilendiren bir sorun hâline gelmiştir.

Bu parçaya en uygun başlık aşağıdakilerden hangisidir?',
  '{"options":["Bal Üretiminin İncelikleri","Arıların Ekosistemdeki Önemi","Arıcılığın Tarihçesi","Gıda Üretiminde Yeni Teknolojiler","Çiçekli Bitkilerin Sınıflandırılması"],"correctIndex":1}'::jsonb,
  'Parça arıların bal üretiminin ötesinde tozlaşma ve doğal denge açısından taşıdığı önemi anlatır. Bu nedenle en uygun başlık "Arıların Ekosistemdeki Önemi"dir.',
  'Parçanın ilk cümlesinde "bal" geçtiği için aday bal üretimine yönelik bir başlık seçebilir. Oysa parça, balı sadece başlangıç noktası olarak kullanır ve asıl konusu arıların doğadaki rolüdür.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  1,
  'Sabahın ilk ışıkları, Boğaz''ın üzerindeki sisi usulca dağıtıyordu. Sahildeki eski yalıların camları pembeye boyanmış, uzaktan gelen vapur düdüğü suyun üstünde yankılanmıştı. Martılar, usta bir ressamın fırça darbeleri gibi gökte gelip gidiyordu.

Bu parçada ağır basan anlatım biçimi aşağıdakilerden hangisidir?',
  '{"options":["Öyküleme","Açıklama","Tartışma","Betimleme","Karşılaştırma"],"correctIndex":3}'::jsonb,
  'Parçada olay örgüsü yoktur; görsel ve işitsel ayrıntılarla bir manzara canlandırılır. Bu, betimleyici anlatımdır.',
  '"Gelip gidiyordu", "yankılanmıştı" gibi fiiller hareket çağrışımı yaptığı için aday öyküleme sanabilir. Öykülemede zaman içinde gelişen bir olay örgüsü bulunur; parçada ise yalnızca bir görünüm anlatılır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Kitap okuma alışkanlığı kazanmak çoğu zaman düşünüldüğü kadar zor değildir. Örneğin her gün yatmadan önce yalnızca on sayfa okuyan biri, bir yılda dört beş kitabı bitirebilir.

Bu parçada yazar, düşüncesini geliştirirken aşağıdakilerden hangisine başvurmuştur?',
  '{"options":["Tanık gösterme","Karşılaştırma","Örnekleme","Tanımlama","Sayısal verilerden yararlanma"],"correctIndex":2}'::jsonb,
  'Yazar "Örneğin" sözüyle somut bir durum gösterip düşüncesini destekler; bu örneklemedir. Sayılar yalnızca örneği somutlaştırır.',
  'Parçada "on sayfa", "dört beş kitap" gibi sayılar geçtiği için sayısal verilerden yararlanma çeldiricisi güçlüdür. Oysa bu sayılar araştırma verisi değil, örneği somutlaştıran ayrıntılardır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Kısa ve öz yazmak, her zaman az yazmak anlamına gelmez; asıl hüner, gereksiz sözcükleri ayıklayıp anlatılmak isteneni eksiksiz iletebilmektir. Uzun bir metin de gereksiz sözcük içermiyorsa özlü sayılabilir.

Bu parçadan aşağıdaki yargılardan hangisine ulaşılamaz?',
  '{"options":["Kısa yazılar her zaman özlüdür.","Özlü yazı, gereksiz sözcüklerden arındırılmış yazıdır.","Uzun yazılar da özlü olabilir.","Özlü yazmak, anlatılmak isteneni eksiksiz vermeyi gerektirir.","Özlülük, yazının uzunluğuyla tek başına ölçülmez."],"correctIndex":0}'::jsonb,
  'Parça, özlülüğü uzunluğa değil gereksiz sözcüğün bulunmamasına bağlar. Bu nedenle kısa her yazının özlü olduğu söylenemez.',
  'Başlangıçtaki "kısa ve öz yazmak" ifadesi, kısalık ile özlülüğü eşit tutuyormuş izlenimi verir. Oysa parça hemen ardından bu eşitliği reddeder.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Yeni teknolojiler iletişimi hızlandırdı; ancak hızın bedelini yüz yüze konuşmaların azalması olarak ödüyoruz. ....... Çünkü bir mesajın içindeki ses tonu, bakış, jest ve mimikler ekranda kaybolup gidiyor.

Bu parçada boş bırakılan yere düşüncenin akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["Teknoloji, insanlar arasındaki mesafeyi tamamen ortadan kaldırdı.","Yüz yüze görüşmeler artık tamamen gereksiz hâle geldi.","Mesajlaşma, konuşmaya göre daha masrafsız bir yöntemdir.","İletişim araçları her yaştan insan tarafından benzer biçimde kullanılıyor.","Hızlanan iletişim, çoğu zaman anlam zenginliğini yitiriyor."],"correctIndex":4}'::jsonb,
  'Boşluktan sonraki "Çünkü" cümlesi, bir önceki yargının gerekçesidir: ses tonu, bakış ve mimikler kaybolduğu için iletişimin anlam zenginliği azalır.',
  '"Mesafeyi ortadan kaldırdı" gibi teknoloji övgüsü içeren şıklar, parçanın ilk cümlesiyle uyumlu görünür. Ancak boşluktan sonra gelen "Çünkü" cümlesi olumsuz bir sonucu gerekçelendirir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  '(I) Çocukların oyun oynaması, yalnızca eğlenmelerini değil sosyal beceriler kazanmalarını da sağlar. (II) Çocuk kitaplarının kapak tasarımları son yıllarda oldukça renklenmiştir. (III) Oyun sırasında paylaşmayı, sırasını beklemeyi ve kurallara uymayı öğrenirler. (IV) Bu nedenle oyun zamanını gereksiz görmek yanlıştır. (V) Oyun, çocuğun hayal gücünü de besleyen en doğal öğrenme yoludur.

Bu parçadaki numaralanmış cümlelerden hangisi düşüncenin akışını bozmaktadır?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":1}'::jsonb,
  'Parça çocuklar için oyunun önemini anlatır. II. cümle ise kitap kapaklarından söz ederek konudan uzaklaşır ve akışı bozar.',
  'II. cümle de çocuklarla ilgili olduğu için konu içinde gibi görünür. Ancak parçanın konusu oyunun çocuk gelişimine katkısıdır; kitap kapağı tasarımı bu bütünlüğün dışında kalır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'I. Üstelik uzun süre uykusuz kalan kişilerde bağışıklık sistemi de zayıflar.
II. Yetersiz uyku, dikkat ve bellek üzerinde olumsuz etki yaratır.
III. Uyku, vücudun kendini yenilediği temel bir ihtiyaçtır.
IV. Bu nedenle uzmanlar, günde en az yedi saat uyumayı önerir.
V. Oysa pek çok kişi bu ihtiyacı küçümseyerek geç saatlere kadar uyanık kalır.

Bu cümlelerle anlamlı bir paragraf oluşturulduğunda baştan ikinci cümle hangisi olur?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":4}'::jsonb,
  'Doğru sıra III - V - II - I - IV''tür. III temel bilgiyi verir, V ("Oysa") bunun gözden kaçırıldığını söyler, II ve I olumsuz sonuçları sıralar, IV ("Bu nedenle") sonuç ve öneridir. Baştan ikinci cümle V.''dir.',
  '"Oysa" bağlacı yanlış okunduğunda II. cümle, III.''ün hemen ardından gelen açıklama gibi görünür. Ancak "Oysa" ile başlayan V. cümle III.''ün karşıtı bir durumu belirttiği için hemen onun arkasına yerleşir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Günümüzde bilgi, ulaşılması kolay bir şey olduğu için değerinin düştüğü sanılıyor. Oysa değerini yitiren bilgi değil, bilgiyle kurulan ilişkidir. Parmak ucundaki sonsuz arşiv, çoğumuza araştırma sabrını değil, hızlı yargıda bulunma alışkanlığını kazandırdı. Bilgiyi bulmak kolaylaştıkça onu sorgulayan ve birleştiren zihinlere duyulan ihtiyaç da artıyor.

Bu parçada asıl anlatılmak istenen aşağıdakilerden hangisidir?',
  '{"options":["Bilgiye erişim kolaylaştığı için bilgi artık değerini yitirmiştir.","Hızlı karar vermek, bilgi çağının en önemli gereğidir.","Bilgiye erişimin kolaylaşması, bilgiyi sorgulama ve yorumlama becerisini daha değerli kılmıştır.","Bilgi miktarı arttıkça insanların araştırma sabrı da artmıştır.","Arşivler, insanları eskisinden daha dikkatli kılmıştır."],"correctIndex":2}'::jsonb,
  'Yazar, "değerini yitiren bilgi değil, bilgiyle kurulan ilişkidir" diyerek asıl sorunu belirler ve son cümlede sorgulayan zihinlere duyulan ihtiyacın arttığını söyler.',
  'İlk cümle ("değerinin düştüğü sanılıyor") bilginin değersizleştiğini düşündürür. Ancak yazar bu görüşü "Oysa" ile hemen reddeder; aday ilk cümleye takılırsa parçanın tersini seçer.',
  array['lisans_gygk']::text[],
  'lisans'
);
