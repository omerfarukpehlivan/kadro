-- ==========================================================================
-- KADRO SORU HAVUZU · KPSS GY Türkçe · PARAGRAF PARTİSİ 2 (30 soru, zorluk 2-3) · SUPABASE SQL
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
  'Unutmak çoğu zaman belleğin bir arızası olarak görülür. Oysa beyin, her ayrıntıyı saklamak yerine gelecekte işe yarayacak örüntüleri ayıklar; önemsiz görünen binlerce ayrıntı bu süreçte silinir. Hiçbir şeyi unutamayan bir zihin, ayrıntıların içinde boğulur ve genelleme yapamaz hâle gelir.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Beyin, ayrıntıları saklamakta yetersizdir.","Hiçbir şeyi unutamayan insanlar daha başarılıdır.","Unutma, belleğin işlevsel çalışmasının gerekli bir parçasıdır.","Önemsiz ayrıntılar, genellemeyi güçleştirdiği için öğrenilmemelidir.","Bellek, yaşla birlikte işlevini yitirir."],"correctIndex":2}'::jsonb,
  'Yazar, unutmayı bir arıza değil, örüntüleri ayıklayan beynin doğal bir işlevi olarak sunar. Hiçbir şeyi unutamayan zihin genelleme yapamaz.',
  'İlk cümlede "arıza" sözcüğü geçtiği için aday beynin yetersizliğine ilişkin şıkka yönelebilir. Oysa yazar bu görüşü "Oysa" ile reddeder.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Göç eden kuşlar, binlerce kilometreyi çoğu zaman aynı rotayla ve neredeyse aynı tarihlerde aşar. Bilim insanları, bu yönelimde manyetik alanın, güneşin ve yıldızların birlikte rol oynadığını düşünüyor. ....... Çünkü yalnızca tek bir ipucuna dayanan bir kuş, bulutlu bir gecede ya da manyetik bir sapma karşısında yolunu kaybedebilir.

Bu parçada boş bırakılan yere düşüncenin akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["Kuşlar, yön bulmada birden çok ipucunu birbirini destekleyecek biçimde kullanıyor olabilir.","Göç eden kuşların hepsi aynı rotayı izler.","Kuşlar, yön bulmada yalnızca manyetik alana güvenir.","Bulutlu havalarda göç hiç gerçekleşmez.","Yıldızlar, kuşların yön bulmasında hiçbir rol oynamaz."],"correctIndex":0}'::jsonb,
  'Boşluktan sonraki "Çünkü" cümlesi, tek bir ipuca dayanmanın riskini söyler. Bu gerekçeyi yalnızca, birden çok ipucunun birlikte kullanıldığını belirten cümle açıklar.',
  '"Yalnızca manyetik alana güvenir" şıkkı, parçada geçen manyetik alan sözünü tekrar ettiği için çeldiricidir. Oysa "Çünkü" cümlesi tek ipucuna dayanmanın sakıncasını anlatır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Nüfusun yaşlanması, yalnızca emeklilik sistemini değil, kentlerin tasarımını da etkiler. Yaya geçitlerinin süresi, kaldırım yükseklikleri, toplu taşıma duraklarındaki oturma yerleri yaşlı bir kullanıcının gözünden yeniden düşünülmek zorundadır. Ne var ki bu düzenlemeler yalnızca yaşlılara değil, çocuklara, hastalara ve yük taşıyanlara da kolaylık sağlar.

Bu parçadan aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Nüfusun yaşlanması, kent tasarımını etkileyen etkenlerden biridir.","Kent tasarımındaki düzenlemeler yalnızca yaşlılara yarar sağlar.","Yaya geçitleri, yaşlıların ihtiyaçlarına göre yeniden düşünülebilir.","Yaşlılar için yapılan düzenlemeler diğer gruplara da yarar sağlayabilir.","Nüfusun yaşlanmasının etkileri emeklilik sistemiyle sınırlı değildir."],"correctIndex":1}'::jsonb,
  'Parçanın son cümlesi, düzenlemelerin çocuklara, hastalara ve yük taşıyanlara da kolaylık sağladığını söyler. Bu nedenle düzenlemelerin yalnızca yaşlılara yarar sağladığı yargısı çıkarılamaz.',
  'Parça yaşlıların ihtiyaçlarını çok vurguladığı için aday faydanın yalnızca onlara ait olduğunu düşünebilir. Ancak "Ne var ki" ile başlayan son cümle bunu açıkça genişletir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Gece boyunca açık kalan sokak lambaları, kentleri güvenli kılarken gökyüzünü de görünmez hâle getiriyor. Yapay ışığın fazlası, yalnızca yıldızları silmekle kalmıyor; göçmen kuşların yönünü şaşırtıyor, yarasa ve böcek gibi gece canlılarının yaşam döngüsünü bozuyor.

Bu parçaya en uygun başlık aşağıdakilerden hangisidir?',
  '{"options":["Sokak Aydınlatmasının Tarihçesi","Gökyüzü Gözlemciliğinin Yaygınlaşması","Kentlerde Güvenlik Önlemleri","Işık Kirliliğinin Doğal Yaşama Etkileri","Göçmen Kuşların Beslenme Alışkanlıkları"],"correctIndex":3}'::jsonb,
  'Parça, yapay ışığın fazlasının yıldızları görünmez kıldığını ve gece canlılarını etkilediğini anlatır. En uygun başlık ışık kirliliğinin doğal yaşam üzerindeki etkileridir.',
  'Parçada "güvenli", "göçmen kuşlar" gibi ifadeler geçtiği için aday kısmi başlıklara yönelebilir. Oysa bunlar ışık kirliliğinin yan ayrıntılarıdır; ana konu fazla ışığın doğal yaşama zararıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'I. Bu nedenle bilimsel okuryazarlık, olgularla yetinmeyi değil, olguların nasıl elde edildiğini anlamayı gerektirir.
II. Bilimsel bilgi, çoğu zaman kesin sonuçlar bütünü sanılır.
III. Oysa bilim, sürekli sınanan ve gerektiğinde değiştirilen geçici açıklamalardan oluşur.
IV. Bu açıklamalar, yeni kanıtlar geldikçe ya daha güvenilir hâle gelir ya da yerini başka açıklamalara bırakır.
V. Bilimi inançtan ayıran şey, kesinlik iddiası değil, değişmeye açık olmasıdır.

Bu cümlelerle anlamlı bir paragraf oluşturulduğunda baştan dördüncü cümle hangisi olur?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":4}'::jsonb,
  'Doğru sıra II - III - IV - V - I''dir. II yaygın kanıyı verir, III ("Oysa") karşı çıkar, IV ("Bu açıklamalar") III''ü açar, V bilimi inançtan ayırır, I ("Bu nedenle") sonuçtur. Baştan dördüncü cümle V.''tir.',
  'IV. cümledeki "Bu açıklamalar" ifadesi III''ten hemen sonra gelmesi gerektiğini gösterir. Aday dördüncü sırayı IV sanabilir; oysa IV üçüncü, V dördüncü sıradadır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Çoğumuz risk dediğimizde ani ve görünür tehlikeleri düşünürüz: uçak kazası, deprem, yangın. Oysa gündelik hayatta bizi asıl zorlayan, yavaş birikip fark edilmeyen risklerdir: hareketsizlik, yetersiz uyku, gürültü. Korkularımızın ölçüsü, çoğu zaman tehlikenin gerçek büyüklüğünden çok görünürlüğüyle orantılıdır.

Bu parçada yazarın asıl amacı aşağıdakilerden hangisidir?',
  '{"options":["Uçak kazası ve depremlerin tehlikesini küçümsemek","Gürültünün insan sağlığına etkilerini açıklamak","Yavaş riskleri ortadan kaldırmanın yollarını sıralamak","Gündelik hayatın risk dolu olduğunu savunarak okuru korkutmak","Risk algımızın, tehlikenin gerçek boyutundan çok görünürlüğüyle şekillendiğini göstermek"],"correctIndex":4}'::jsonb,
  'Yazar, görünür tehlikeleri korkularımızın merkezine koyduğumuzu, yavaş riskleri ise gözden kaçırdığımızı anlatır ve son cümlede bunu "görünürlük" ölçütüne bağlar.',
  'Parçada gürültü, uyku gibi örnekler geçtiği için aday bunların açıklandığını sanabilir. Oysa bunlar yalnızca yavaş risklere örnek olarak verilir; yazarın amacı algıdaki çarpıklığı göstermektir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Yerel yiyecekleri tercih etmek, yalnızca taze ürün almak anlamına gelmez. Ürün üreticisine yakın olduğu için taşıma mesafesi kısalır, bu da hem karbon salımını hem de gıdanın bozulma riskini azaltır. Üstelik yerel üreticilerin geliri, bölge ekonomisinde kalır.

Bu parçada aşağıdakilerden hangisine değinilmemiştir?',
  '{"options":["Taşıma mesafesinin kısalmasının çevresel etkisine","Gıdanın bozulma riskinin azalmasına","Yerel ürünlerin ihracatının ülke ekonomisine katkısına","Üretici gelirinin bölgede kalmasına","Yerel ürün tercihinin yalnızca tazelikle ilgili olmadığına"],"correctIndex":2}'::jsonb,
  'Parça, kısa taşımanın karbon salımını ve bozulmayı azalttığını, yerel gelirin bölgede kaldığını ve tercihin yalnızca tazeliğe bağlı olmadığını söyler. İhracata değinilmez.',
  'Parçada "ekonomi" sözcüğü geçtiği için aday ihracata ilişkin bir bilginin de yer aldığını sanabilir. Oysa söz yalnızca bölge ekonomisi içindir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  '(I) Kütüphaneler, yalnızca kitap ödünç verilen yerler olarak anılır. (II) Oysa birçok kütüphane, ücretsiz internet erişimi, dil kursları ve çocuk atölyeleri sunarak mahallenin ortak yaşam alanına dönüşmüştür. (III) Bu dönüşüm, kütüphanenin geleceğinin kitap sayısıyla değil sunduğu kamusal hizmetle ölçüleceğini gösteriyor.

Bu parçadaki III. cümlenin işlevi aşağıdakilerden hangisidir?',
  '{"options":["Önceki cümlede anlatılan durumdan bir çıkarım yapmak","Konuya karşıt bir görüş getirmek","Konuyla ilgili bir örnek vermek","Yeni bir konuya geçmek","Önceki cümledeki bilgiyi aynen yinelemek"],"correctIndex":0}'::jsonb,
  'III. cümle "Bu dönüşüm" ifadesiyle II. cümledeki durumu alır ve ondan, kütüphanenin geleceğiyle ilgili bir sonuç çıkarır.',
  'III. cümlede "gösteriyor" fiili kanıt çağrışımı yapar; aday bunu örnek sanabilir. Oysa cümle örnek vermez, önceki bilgiden bir yargıya varır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  '....... Çünkü bir gözlemi tekrarlayabilen herkes aynı sonuca ulaşabilir; böylece bilgi, bir kişinin otoritesine değil herkesin sınayabileceği kanıta dayanır.

Bu parçanın başındaki boşluğa düşüncenin akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["Bilim insanları, otoritelerin görüşlerini sorgulamadan kabul etmelidir.","Bilimsel yöntemin en güçlü yanı, bilgiyi kişilerden bağımsız kılmasıdır.","Gözlem, bilimsel yöntemin yalnızca başlangıç aşamasıdır.","Bilimsel bilgi, zamanla kesinliğini yitirir.","Her gözlem, her koşulda aynı sonucu vermek zorundadır."],"correctIndex":1}'::jsonb,
  '"Çünkü" cümlesi, bilginin kişinin otoritesine değil herkesin sınayabileceği kanıta dayandığını söyler. Bu gerekçeyi, bilginin kişilerden bağımsız olduğunu belirten cümle taşır.',
  '"Her gözlem aynı sonucu vermelidir" şıkkı, parçadaki tekrarlanabilirlik fikrine yakın göründüğü için çeldiricidir. Ancak parça gözlem sonucunu değil, bilginin kişilerden bağımsızlığını gerekçelendirir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Gönüllülük çoğu zaman karşılıksız bir fedakârlık olarak anlatılır. Oysa gönüllüler de emeklerinin karşılığını alır: yeni beceriler, geniş bir çevre ve işe yaradıklarını bilmenin verdiği doyum. Bu karşılıklılık, gönüllülüğün değerini azaltmaz; tersine, onu sürdürülebilir kılar.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Gönüllüler, emekleri karşılığında maddi kazanç beklemelidir.","Gönüllülük, yalnızca fedakârlık duygusuyla sürdürülebilir.","Karşılık beklentisi, gönüllülüğün değerini düşürür.","Gönüllülük, tek yönlü bir fedakârlık değil, karşılıklı bir kazanç ilişkisidir ve bu durum onun sürekliliğini sağlar.","Gönüllü olmak için özel beceriler gerekir."],"correctIndex":3}'::jsonb,
  'Yazar, gönüllülüğün karşılıksız olduğu düşüncesini reddeder; becerilerin, çevrenin ve doyumun karşılık olduğunu, bunun gönüllülüğü sürdürülebilir kıldığını söyler.',
  '"Karşılık beklentisi değeri düşürür" şıkkı yaygın bir yargıdır; aday bunu kabul edebilir. Oysa yazar tam tersini söyler: karşılıklılık gönüllülüğü azaltmaz.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Ekran süresiyle ilgili tartışmalar çoğunlukla süreye odaklanır; oysa içeriğin niteliği ve ekranın kiminle birlikte izlendiği de en az süre kadar belirleyicidir. Bir ebeveynle konuşularak izlenen kısa bir belgesel, tek başına geçirilen uzun bir oyun seansından çok farklı sonuçlar doğurabilir.

Bu parçadan aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Ekranın etkisinde içeriğin niteliği de önemlidir.","İzleme biçimi, ekranın etkisini değiştirebilir.","Ekran tartışmaları çoğunlukla süreye odaklanır.","Ebeveynle birlikte izlemek, farklı bir deneyim yaratabilir.","Süre sınırlaması, ekranın çocuk üzerindeki etkisini belirleyen tek etkendir."],"correctIndex":4}'::jsonb,
  'Parça, süre kadar içeriğin ve birlikte izlemenin de belirleyici olduğunu söyler. Bu nedenle sürenin tek etken olduğu yargısı çıkarılamaz.',
  'Tartışmaların süreye odaklandığı söylendiği için aday süreyi asıl etken sanabilir. Oysa "oysa" ile başlayan yarım cümle, içerik ve izleme biçimini de en az süre kadar önemli sayar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  '(I) Yağmur suyu hasadı, çatılardan akan suyun depolanıp bahçe sulamada ya da temizlikte kullanılmasıdır. (II) Basit bir depolama sistemiyle bile bir evin şebeke suyu kullanımı belirgin ölçüde azalabilir. (III) Ayrıca bu yöntem, ani sağanaklarda kent altyapısına binen yükü hafifleterek sel riskini azaltır. (IV) Yine de bu yöntem her bölgede aynı verimi sağlamaz. (V) Bu nedenle uygulamadan önce bölgenin yağış düzeni dikkatle incelenmelidir.

Bu parça iki paragrafa bölünmek istense ikinci paragraf hangi cümleyle başlamalıdır?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":3}'::jsonb,
  'İlk üç cümle yöntemin tanımını ve yararlarını anlatır. IV. cümle "Yine de" ile yöntemin sınırlarına geçer; yeni bir düşünce başladığı için ikinci paragraf IV. cümleyle başlamalıdır.',
  'III. cümle "Ayrıca" ile yeni bir bilgi eklediği için paragraf başı gibi görünebilir. Ancak o hâlâ yöntemin yararını sayar; asıl dönüm noktası karşıtlık bildiren IV. cümledir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Kentlerde park erişimi, insanların hareket alışkanlığını doğrudan etkiliyor. Bir araştırmada, evine yürüyerek beş dakika uzaklıkta park bulunan 2 bin kişinin yüzde 62''sinin haftada en az üç gün yürüyüş yaptığı saptanmıştır.

Bu parçada yazar, düşüncesini geliştirirken aşağıdakilerden hangisinden yararlanmıştır?',
  '{"options":["Örnekleme","Karşılaştırma","Sayısal verilerden yararlanma","Tanımlama","Tanık gösterme"],"correctIndex":2}'::jsonb,
  'Yazar, görüşünü bir araştırmanın sayısal sonuçlarıyla (2 bin kişi, yüzde 62) destekler.',
  '"Bir araştırmada" ifadesi örnek vermeyi çağrıştırdığı için aday örneklemeyi seçebilir. Ancak ağır basan, sayılara dayalı kanıttır; kişi ya da durum anlatılmaz.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Bir ülkenin turizm geliri arttıkça yerel halkın da kazancının artacağı varsayılır. Oysa gelirin büyük bölümü, büyük otel zincirleri ve yabancı tur şirketleri aracılığıyla bölgeden dışarı çıkabilir. Turizmin yerel kalkınmaya katkısı, kazancın nerede kaldığına bağlıdır; ziyaretçi sayısı bunu tek başına göstermez.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Turizmin yerel kalkınmaya katkısını belirleyen, ziyaretçi sayısından çok gelirin bölgede kalıp kalmamasıdır.","Turizm, yerel halkın gelirini hiçbir zaman artırmaz.","Yabancı tur şirketleri turizme zarar verir.","Ziyaretçi sayısı arttıkça yerel kalkınma da kesinlikle artar.","Büyük otel zincirleri, bölge ekonomisi için gereksizdir."],"correctIndex":0}'::jsonb,
  'Yazar, gelirin bölgeden dışarı çıkabileceğini belirterek asıl ölçütün kazancın nerede kaldığı olduğunu söyler.',
  'Parçanın ilk cümlesi, gelir arttıkça halkın kazancının arttığını varsayar. Aday bu varsayımı doğru sanabilir; oysa yazar onu "Oysa" ile sorgular.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Ünlü bir yazar, her sabah aynı saatte masaya oturarak yazdığını söylediğinde bunu bir ilham eksikliği olarak değil, disiplin olarak anlarız. Aynı davranışı sıradan bir çalışanda ise "monotonluk" diye eleştiririz. Davranışa verdiğimiz anlam, onu yapan kişinin statüsüne göre değişiyor.

Bu parçada yazar aşağıdakilerden hangisini eleştirmektedir?',
  '{"options":["Yazarların düzenli çalışmasını","Aynı davranışı kişinin statüsüne göre farklı değerlendirmeyi","Sıradan çalışanların tekdüze işler yapmasını","İlham beklemeden çalışmayı","Her sabah aynı saatte çalışmanın verimsizliğini"],"correctIndex":1}'::jsonb,
  'Yazar, aynı davranışın yazarda disiplin, sıradan çalışanda monotonluk olarak yorumlandığını söyleyerek statüye göre değişen değerlendirmeyi eleştirir.',
  '"Her sabah aynı saatte çalışmak" parçada vurgulandığı için aday bunu eleştirilen davranış sanabilir. Oysa yazar davranışı değil, ona verilen anlamın değişmesini eleştirir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Haritalar, dünyanın olduğu gibi bir kopyası değil, seçilmiş bir anlatımıdır. Hangi yolun, hangi sınırın, hangi adın gösterileceğine haritayı yapan karar verir. Bu nedenle iki farklı harita, aynı yeri birbirinden oldukça farklı gösterebilir ve hiçbiri yanlış sayılmayabilir.

Bu parçadan aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Haritalar, seçim yapılarak hazırlanır.","Farklı haritalar aynı yeri farklı gösterebilir.","Haritayı yapanın tercihleri, haritanın içeriğini belirler.","Bir haritanın doğruluğu, içerdiği ayrıntı miktarıyla ölçülür.","Haritalar, dünyanın birebir kopyası değildir."],"correctIndex":3}'::jsonb,
  'Parça, haritaların seçilmiş anlatımlar olduğunu söyler ve doğruluğu ayrıntı miktarına bağlamaz. Doğruluğun ayrıntı miktarıyla ölçüldüğü yargısı parçadan çıkarılamaz.',
  'Parçada "farklı gösterebilir" denmesi, ayrıntının da değişeceği izlenimi verir. Ancak parça doğruluğu hiçbir yerde ayrıntı miktarına bağlamaz.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'I. Böylece okuma sırasında ve sonrasında vereceğiniz kararlar daha isabetli olur.
II. Metne başlamadan önce başlığa, ara başlıklara ve görsellere göz atmak iyi bir ön hazırlıktır.
III. Bu gezinti, metnin hangi sorulara yanıt aradığını sezmenizi sağlar.
IV. Ardından okuma sırasında bu sorulara yanıt arayarak ilerlemek dikkati canlı tutar.
V. Okumaya hazırlanmak, okumanın kendisi kadar önemlidir.

Bu cümlelerle anlamlı bir paragraf oluşturulduğunda son cümle hangisi olur?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":0}'::jsonb,
  'Doğru sıra V - II - III - IV - I''dir. V genel yargıyı verir, II hazırlığı, III gezintinin yararını, IV okuma sürecini anlatır; I ("Böylece") sonucu bildirdiği için paragrafı kapatır.',
  'V. cümle genel bir yargı olduğu için sonuç gibi görünebilir. Ancak "Böylece" ile başlayan I. cümle, önceki adımların toplam sonucunu verir; bu nedenle son cümledir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Tarım ilaçları, ürünü zararlılardan koruyarak verimi artırır. ....... Bu yüzden ilaçlamanın zamanı ve dozu, yalnızca üreticinin deneyimine değil, bilimsel ölçümlere dayanmalıdır.

Bu parçada boş bırakılan yere düşüncenin akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["İlaç kullanmayan üreticilerin ürünleri daha pahalıya satılır.","Zararlılar, ilaçlara karşı hiçbir direnç geliştirmez.","Bütün ilaçlar aynı etkiye sahiptir.","Verim artışı yalnızca ilaçlamaya bağlıdır.","Ancak fazla ve zamansız kullanım, faydalı böceklerin ölmesine ve toprağın zarar görmesine yol açabilir."],"correctIndex":4}'::jsonb,
  'Boşluktan sonraki "Bu yüzden" cümlesi, ilaçlamanın bilimsel ölçümlere dayanması gerektiğini söyler. Bu sonucun gerekçesi, kontrolsüz kullanımın zararlarıdır.',
  '"Verim yalnızca ilaçlamaya bağlıdır" şıkkı, ilk cümledeki "verimi artırır" ifadesini genişlettiği için çeldiricidir. Ancak boşluktan sonra gelen sonuç, bir kısıt ve risk gerektirir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  '(I) Yürüyüş, özel bir ekipman gerektirmeyen ve herkesin yapabileceği bir hareket biçimidir. (II) Düzenli yürüyüş, kalp ve damar sağlığına olumlu katkı yapar. (III) Hafif tempoda bile yapılsa kas ve eklem esnekliğini korur. (IV) Yürüyüşte kullanılan ekipmanlar, farklı fiyat aralıklarında satılmaktadır. (V) Bu nedenle günde otuz dakikalık yürüyüş, birçok uzman tarafından önerilmektedir.

Bu parçadaki numaralanmış cümlelerden hangisi düşüncenin akışını bozmaktadır?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":3}'::jsonb,
  'Parça, yürüyüşün herkese uygun ve sağlığa yararlı bir hareket olduğunu anlatır. IV. cümle ise ekipman fiyatlarına geçerek yararlar bütünlüğünü bozar.',
  'IV. cümle I. cümledeki "ekipman" sözcüğünü andırdığı için konu içinde gibi görünür. Ancak I ekipmana gerek olmadığını söyler; IV ise ekipman satışına geçerek konuyu ticarete taşır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Mitokondri, hücrenin enerji üretiminden sorumlu organelidir. Çift katlı bir zarla çevrilidir ve kendi DNA''sını taşır. Enerji ihtiyacı yüksek hücrelerde, örneğin kas hücrelerinde, sayıları binleri bulabilir.

Bu parçada kullanılan dil için aşağıdakilerden hangisi söylenebilir?',
  '{"options":["Yazarın kişisel duyguları ön plandadır.","Okuru etkilemeye yönelik abartılı ifadeler kullanılmıştır.","Bilgi verme amacı ağır bastığı için nesnel bir dil kullanılmıştır.","Karşıt görüşler tartışılmıştır.","Olay örgüsüne dayalı bir anlatım vardır."],"correctIndex":2}'::jsonb,
  'Parça, mitokondriyi kişisel yorum katmadan tanıtır ve ölçülebilir bilgiler verir; bu nedenle dil nesneldir.',
  '"Binleri bulabilir" ifadesi abartı sanılabilir. Oysa bu, sayısal bir bilgidir ve yazar duygularını katmaz.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Rekabeti bütün başarıların itici gücü sayanlar, işbirliğinin ürettiği değeri hafife alıyor. Bilimsel keşiflerin çoğu, birbirinden habersiz yarışan kişilerin değil, bulgularını paylaşan ekiplerin ürünü. Rekabet motivasyon verebilir; ama kalıcı üretimin zemini genellikle paylaşımdır.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Rekabet motive edici olsa da kalıcı başarının temelinde çoğunlukla işbirliği yatar.","Rekabet, başarı için gereksiz ve zararlıdır.","Bilimsel keşifler yalnızca bireysel çabalarla ortaya çıkar.","İşbirliği, bireyleri motive etmez.","Rekabet ve işbirliği birbirinden ayrılamaz."],"correctIndex":0}'::jsonb,
  'Yazar, rekabetin motivasyon verdiğini kabul eder ama kalıcı üretimin zemininin paylaşım olduğunu söyler.',
  '"Rekabet gereksiz ve zararlıdır" şıkkı, yazarın rekabeti eleştirmesinin uç hâlidir. Oysa yazar "motivasyon verebilir" diyerek rekabeti yadsımaz.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'I. Bu yüzden iyi bir soru, yanıtı kadar öğreticidir.
II. Çocuklar, daha okula başlamadan "neden?" diye sormaya başlar.
III. Soru sormak, bilmediğini kabul etme cesaretini de gerektirir.
IV. Ne var ki okulda geçen yıllar, bu merakı çoğu zaman yanıt vermeye odaklı bir alışkanlığa dönüştürür.
V. Oysa asıl öğrenme, soruların doğduğu yerde başlar.

Bu cümlelerle anlamlı bir paragraf oluşturulduğunda baştan üçüncü cümle hangisi olur?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":4}'::jsonb,
  'Doğru sıra II - IV - V - III - I''dir. II çocuğun merakını anlatır, IV ("Ne var ki") buna karşıt okul etkisini verir, V ("Oysa") asıl öğrenmenin sorularda başladığını söyler, III soru sormanın gerektirdiği cesareti, I ("Bu yüzden") sonucu bildirir. Baştan üçüncü cümle V.''tir.',
  'III. cümle "soru sormak" konusunu sürdürdüğü için II''nin hemen ardından gelebilir gibi görünür. Ancak IV''teki "Ne var ki" bağı II ile doğrudan karşıtlık kurar; bu nedenle üçüncü sırada V yer alır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Kış uykusuna yatan hayvanlar, vücut sıcaklıklarını ve kalp atışlarını belirgin biçimde düşürerek enerji harcamalarını en aza indirir. Böylece besinin kıt olduğu aylarda, sonbaharda biriktirdikleri yağ rezervleriyle hayatta kalırlar.

Bu parçaya en uygun başlık aşağıdakilerden hangisidir?',
  '{"options":["Hayvanların Göç Yolları","Kış Uykusunun Hayatta Kalmadaki Rolü","Sonbaharda Beslenme Alışkanlıkları","Soğuk Havalarda İnsan Sağlığı","Yağ Dokusunun Yapısı"],"correctIndex":1}'::jsonb,
  'Parça, kış uykusunun enerji tasarrufu sağlayarak hayvanların kıt aylarda hayatta kalmasını sağladığını anlatır.',
  'Parçada "yağ rezervleri" ve "sonbahar" geçtiği için aday beslenme ya da yağ dokusuyla ilgili başlıklara yönelebilir. Oysa bunlar kış uykusunun destekleyici ayrıntılarıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Dikkatimiz sınırlı bir kaynak olduğu hâlde onu sınırsızmış gibi harcıyoruz. Her bildirim, bir düşünceyi yarıda keser; yarıda kalan düşünceyi yeniden toparlamak ise başladığı noktadan daha çok emek ister. Dikkatin bu sessiz kaybı, verimsizlikten çok bir tür düşünsel yorgunluk olarak birikir.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Bildirimler, düşünceyi toparlamayı kolaylaştırır.","Dikkat, sınırsız bir kaynaktır.","Verimsizlik, bildirimlerin tek sonucudur.","Sürekli kesintiye uğrayan dikkat, zamanla düşünsel bir yorgunluk yaratır.","Düşünceler yarıda kesilince kaybolur."],"correctIndex":3}'::jsonb,
  'Yazar, bildirimlerin düşünceyi böldüğünü, toparlamanın ek emek gerektirdiğini ve bu kaybın düşünsel yorgunluk olarak biriktiğini söyler.',
  '"Verimsizlik" sözcüğü parçada geçtiği için aday bunu tek sonuç sanabilir. Oysa yazar kaybın "verimsizlikten çok" yorgunluk olarak biriktiğini belirtir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Bir yemeğin tadı yalnızca dilde algılanmaz; koku, doku, hatta tabağın rengi ve yemeğin yendiği ortam da deneyimi biçimlendirir. Burnu tıkalı biri, en sevdiği yemeğin tadını bile zor ayırt eder. Bu nedenle tat, tek bir duyunun değil, birçok duyunun bileşiminden doğan bir algıdır.

Bu parçaya göre aşağıdakilerden hangisi söylenemez?',
  '{"options":["Koku, tat deneyimini etkiler.","Yemeğin yendiği ortam, tat algısını etkileyebilir.","Tat, birden çok duyunun birlikte çalışmasıyla oluşur.","Burnu tıkalı kişide tat algısı zayıflayabilir.","Tat algısı yalnızca dildeki tat alıcılarıyla oluşur."],"correctIndex":4}'::jsonb,
  'Parça, tadın yalnızca dilde algılanmadığını söyler; koku, doku ve ortam da etkilidir. Bu nedenle yalnızca dil yargısı parçayla çelişir.',
  'Dilin tat algısında temel rolü olduğu bilgisi yaygın olduğu için aday bu şıkkı doğru sanabilir. Ancak parça "yalnızca" ifadesini açıkça reddeder.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  '(I) Kooperatifler, üyelerinin ortaklaşa sahip olduğu ve yönettiği kuruluşlardır. (II) Bu yapıda karar hakkı, sermaye payına göre değil, üye başına birer oy esasına göre kullanılır. (III) Dolayısıyla küçük üreticiler, büyük aktörler karşısında pazarlık güçlerini artırabilir. (IV) Ancak bu avantaj, üyelerin yönetime etkin biçimde katılması hâlinde gerçekleşir.

Bu parçadaki IV. cümle, parçanın bütünü içinde aşağıdakilerden hangisini yapmaktadır?',
  '{"options":["Daha önce sayılan yararın gerçekleşmesi için bir koşul belirtir.","Konuyu başka bir alana taşır.","Önceki cümlelerdeki bilgiyi yineler.","Kooperatiflerin tanımını yapar.","Önceki yargıya tamamen karşı çıkar."],"correctIndex":0}'::jsonb,
  'IV. cümle, III''te sözü edilen pazarlık gücü avantajının hangi koşulla gerçekleşeceğini belirtir.',
  '"Ancak" bağlacı karşıtlık çağrışımı yapar; aday cümlenin önceki yargıya tamamen karşı çıktığını sanabilir. Oysa cümle yargıyı reddetmez, ona koşul getirir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Bir toplumun ne kadar adil olduğunu anlamak için en zengin ya da en güçlü kesimin yaşamına bakmak yetmez. Asıl ölçüt, o toplumda en savunmasız olanın nasıl yaşadığıdır. Çünkü güçlü olanın hakkı, korumasız kalma riskini taşımaz; ancak zayıf olanın hakkı, korunmadığında ilk yitirilendir. Bu nedenle .......

Bu parçanın sonuna düşüncenin akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["zengin kesimlerin yaşam standardı, adaletin tek göstergesidir.","bir toplumun adaletini, zayıf kesimlerine tanıdığı güvence ve haklarla değerlendirmek daha doğrudur.","güçlü olanlar, kendi haklarını korumak zorunda değildir.","adalet, her toplumda aynı biçimde tanımlanır.","savunmasız kesimler, haklarını kendileri korumalıdır."],"correctIndex":1}'::jsonb,
  'Parça, adaletin ölçütünü en savunmasız kesimin yaşamına bağlar. "Bu nedenle" ile başlayan son cümle de bu görüşün sonucunu, yani zayıfların haklarıyla değerlendirmeyi bildirmelidir.',
  '"Güçlü olanlar haklarını korumak zorunda değildir" şıkkı, parçadaki "güçlünün hakkı risk taşımaz" ifadesine yakın görünür. Ancak bu bir sonuç değil, gerekçenin bir parçasıdır ve parçanın önerisiyle örtüşmez.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Termometre, sıcaklığı ölçerken aslında sıvının hacmindeki değişimi gösterir. Cıva ya da boyalı alkol gibi sıvılar ısındıkça genleşir ve ince borudaki seviyesi yükselir. Bu seviye, derecelendirilmiş bir ölçekle karşılaştırılarak sıcaklığa çevrilir.

Bu parçanın konusu aşağıdakilerden hangisidir?',
  '{"options":["Cıvanın insan sağlığına etkileri","Sıcaklık ölçeklerinin tarihsel gelişimi","Termometrenin sıcaklığı nasıl ölçtüğü","Sıvıların kaynama noktaları","Hava durumu tahmininde kullanılan araçlar"],"correctIndex":2}'::jsonb,
  'Parça, sıvı genleşmesi ve ölçek yardımıyla termometrenin çalışma ilkesini anlatır; konusu termometrenin sıcaklığı ölçme biçimidir.',
  'Parçada "cıva" ve "ölçek" sözleri geçtiği için aday bunlarla ilgili geniş başlıklara yönelebilir. Oysa bunlar termometrenin çalışma ilkesini açıklayan ayrıntılardır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Şehir efsaneleri, gerçekmiş gibi anlatılan ama kaynağı belirsiz hikâyelerdir. İnsanlar bu hikâyeleri, doğruluğundan çok ilginçliği ve duygusal etkisi nedeniyle aktarır. Hikâye ne kadar şaşırtıcı ya da korkutucuysa, kontrol edilmeden yayılma ihtimali o kadar artar.

Bu parçadan aşağıdakilerden hangisine ulaşılabilir?',
  '{"options":["Şehir efsaneleri yalnızca korkutucu hikâyelerden oluşur.","İnsanlar, hikâyelerin kaynağını mutlaka araştırır.","Bir hikâyenin yayılmasında, doğruluğundan çok duygusal etkisi belirleyici olabilir.","Şaşırtıcı hikâyeler her zaman doğrudur.","Şehir efsaneleri, yazılı kaynaklarda yer almadığı için unutulur."],"correctIndex":2}'::jsonb,
  'Parça, hikâyelerin doğruluğundan çok ilginçliği ve duygusal etkisi nedeniyle aktarıldığını söyler. Bu da yayılmada duygusal etkinin belirleyici olabileceği sonucunu verir.',
  '"Yalnızca korkutucu hikâyelerden oluşur" şıkkı, parçadaki "korkutucu" sözcüğünü genellemeye çevirir. Oysa parça şaşırtıcı ya da korkutucu hikâyeleri örnek verir; efsanelerin hepsinin korkutucu olduğunu söylemez.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'I. Bu da yetmedi; sonraki yıllarda şehir surlarının dışına doğru yeni mahalleler kuruldu.
II. Nüfus arttıkça kent, eski sınırlarına sığamaz hâle geldi.
III. Önce boş kalan bahçeler ve açık alanlar yapılaşmaya açıldı.
IV. Böylece bir zamanlar yalnızca bir pazar yeri olan yerleşim, birkaç kuşak içinde bambaşka bir kente dönüştü.
V. Bir kasabanın büyümesi çoğu zaman sessiz ve yavaş bir süreçtir.

Bu cümlelerle anlamlı bir paragraf oluşturulduğunda baştan ikinci cümle hangisi olur?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":1}'::jsonb,
  'Doğru sıra V - II - III - I - IV''tür. V genel yargıyı verir, II nüfus artışını, III önce açık alanların yapılaşmasını anlatır; I ("Bu da yetmedi") sonraki aşamayı, IV ("Böylece") sonucu bildirir. Baştan ikinci cümle II.''dir.',
  'III. cümledeki "Önce" sözü paragrafı başlatıyor gibi görünür. Ancak "Önce" bir nedene bağlıdır; kentin sığamaması (II) olmadan bahçelerin yapılaşması anlaşılmaz. Bu yüzden II ikinci sıradadır.',
  array['lisans_gygk']::text[],
  'lisans'
);
