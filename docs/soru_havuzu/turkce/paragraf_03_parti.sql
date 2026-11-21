-- ==========================================================================
-- KADRO SORU HAVUZU · KPSS GY Türkçe · PARAGRAF PARTİSİ 3 (30 soru, zorluk 2-3) · SUPABASE SQL
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
  'Geri dönüşüm çoğu zaman çöp sorununa getirilmiş bir çözüm gibi sunulur. Oysa dönüştürülen her malzeme için önce üretilmiş, taşınmış ve toplanmış bir enerji vardır; dönüşüm bu zinciri kısaltır ama ortadan kaldırmaz. Bu nedenle en etkili çözüm, geri dönüştürmekten önce gereksiz tüketimi azaltmaktır.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Geri dönüşüm, atık sorununu tek başına çözer.","Dönüştürülen malzemeler hiçbir enerji gerektirmez.","Atık sorununun çözümünde asıl öncelik, tüketimin kendisini azaltmak olmalıdır.","Çöp toplama sistemleri yetersizdir.","Geri dönüşümden vazgeçilmelidir."],"correctIndex":2}'::jsonb,
  'Yazar, geri dönüşümün zinciri yalnızca kısalttığını söyler ve son cümlede asıl çözümün gereksiz tüketimi azaltmak olduğunu belirtir.',
  'İlk cümlede geri dönüşümün çözüm olarak sunulduğu belirtildiği için aday bu görüşü yazarın görüşü sanabilir. Oysa yazar "Oysa" ile bu anlayışı sınırlar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Satranç ustaları, hamle seçerken tüm olasılıkları hesaplamaz; yıllarca oynayarak edindikleri örüntü tanıma becerisiyle tahtadaki dizilişlerin hangilerinin umut verici olduğunu hemen sezerler. Bu nedenle uzmanlıkla sıradan oyunculuk arasındaki fark, daha çok hesap gücünden değil, neye bakılacağını bilmekten kaynaklanır.

Bu parçadan aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Satranç ustaları, her hamlede mümkün olan tüm olasılıkları hesaplar.","Uzmanlık, örüntü tanıma becerisiyle ilişkilidir.","Deneyim, hamle seçimini kolaylaştırabilir.","Uzman ile sıradan oyuncu arasındaki fark yalnızca hesap gücüyle açıklanamaz.","Usta oyuncular, tahtadaki dizilişleri hızla değerlendirebilir."],"correctIndex":0}'::jsonb,
  'Parça, ustaların tüm olasılıkları hesaplamadığını açıkça söyler. Bu nedenle her olasılığı hesapladıkları yargısı çıkarılamaz.',
  'Satranç denince hesap yapmak akla geldiği için aday bu şıkkı doğru sanabilir. Oysa parça ustalığın hesaptan çok örüntü tanımadan kaynaklandığını vurgular.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'İyi bir lider, her sorunun yanıtını bilen kişi olarak düşünülür. ....... Çünkü ekibinin bilgisinden yararlanamayan lider, kendi bilgisinin sınırlarına mahkûm kalır; ekibini dinleyen lider ise bu sınırları aşar.

Bu parçada boş bırakılan yere düşüncenin akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["Bu nedenle liderler, ekip üyelerinden daha az bilgili olmalıdır.","Oysa etkili liderlik, ekibin bilgisini ortaya çıkarabilmeyi de gerektirir.","Ekip üyeleri, liderin kararlarını sorgulamamalıdır.","Liderin görevi, yalnızca kararları uygulamaktır.","Bilgili liderler, ekiplerine ihtiyaç duymaz."],"correctIndex":1}'::jsonb,
  'Boşluktan sonraki "Çünkü" cümlesi, ekibin bilgisinden yararlanmanın liderin sınırlarını aştığını söyler. Bu gerekçe, liderliğin ekibin bilgisini ortaya çıkarmayı gerektirdiğini belirten cümleyle uyumludur.',
  'İlk cümledeki "her sorunun yanıtını bilen lider" çağrışımı, bilgili liderin ekibe ihtiyaç duymadığı yönündeki şıkkı çekici kılar. Oysa boşluktan sonraki cümle bunun tersini söyler.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'I. Sonuçta ortaya çıkan kâğıt, yazının yayılmasını hızlandıran en önemli buluşlardan biri oldu.
II. Çin''de kâğıdın bulunuşundan önce yazı, bambu çubuklara ve ipek bezlere kaydediliyordu.
III. Bu malzemeler ya ağırdı ya da çok pahalıydı.
IV. Bu sorunu aşmak için eski bez, ağ ve ağaç kabuğu liflerinden yeni bir yazı yüzeyi üretildi.
V. Kâğıdın bu üretim yöntemi zamanla başka toplumlara da yayıldı.

Bu cümlelerle anlamlı bir paragraf oluşturulduğunda baştan dördüncü cümle hangisi olur?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":0}'::jsonb,
  'Doğru sıra II - III - IV - I - V''tir. II önceki yazı malzemelerini verir, III bunların sorununu belirtir, IV ("Bu sorunu") çözümü anlatır, I ("Sonuçta") ortaya çıkan kâğıdı değerlendirir, V yayılmayı bildirir. Baştan dördüncü cümle I.''dir.',
  'I. cümledeki "Sonuçta" ifadesi cümleyi sona yaklaştırır; ancak V. cümle bu sonucun ardından gelen yayılmayı anlatır. Aday son iki sırayı yer değiştirirse dördüncü cümleyi V sanabilir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Volkanik patlamalar, çevreye yalnızca yıkım getirmez. Püsküren kül ve lav, zamanla ayrışarak mineralce zengin, verimli topraklar oluşturur. Bu nedenle tarih boyunca birçok topluluk, patlama riskini bile bile yanardağ yamaçlarında tarım yapmayı sürdürmüştür.

Bu parçaya en uygun başlık aşağıdakilerden hangisidir?',
  '{"options":["Volkanik Patlamaların Tarihçesi","Lavın Sıcaklığını Ölçme Yöntemleri","Tarımda Modern Sulama Teknikleri","Yanardağların Toprağa Katkısı","Doğal Afetlere Karşı Alınan Önlemler"],"correctIndex":3}'::jsonb,
  'Parça, yanardağ külünün ve lavının verimli toprak oluşturduğunu anlatır; en uygun başlık yanardağların toprağa katkısıdır.',
  'Parçada "patlama" ve "risk" sözleri geçtiği için aday afetlerle ilgili bir başlığa yönelebilir. Oysa parçanın vurgusu yıkım değil, patlamaların verimli toprak sağlamasıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Empatiyi, karşımızdakinin yerine geçip onunla aynı şeyi hissetmek sanırız. Oysa bu, çoğu zaman kendi duygularımızı başkasına yüklemekten öteye gitmez. Gerçek empati, karşımızdakinin deneyiminin bizimkinden farklı olabileceğini kabul edip onu anlamaya çalışmaktır.

Bu parçada asıl vurgulanan düşünce aşağıdakilerden hangisidir?',
  '{"options":["Empati kurabilmek için karşımızdakiyle aynı şeyleri yaşamış olmak gerekir.","İnsanlar birbirinin duygularını hiçbir zaman anlayamaz.","Empati, başkalarının duygularını paylaşmakla sınırlıdır.","Kendi duygularımız, başkalarını anlamamızı kolaylaştırır.","Empati, başkasını kendi duygularımıza göre değil, kendi deneyimi içinde anlamaya çalışmaktır."],"correctIndex":4}'::jsonb,
  'Yazar, empatiyi "aynı şeyi hissetmek" olarak anlamayı eleştirir ve gerçek empatiyi başkasının farklı deneyimini kabul etmek olarak tanımlar.',
  'İlk cümledeki "aynı şeyi hissetmek" ifadesi yaygın bir anlayış olduğu için aday bunu doğru sanabilir. Oysa yazar bunu "Oysa" ile reddeder.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Aşılar, bağışıklık sistemini gerçek hastalıkla karşılaşmadan önce eğiterek koruma sağlar. Toplumda yeterli oranda kişi aşılandığında hastalığın yayılma zinciri kırılır ve aşı olamayan bebekler ya da bağışıklığı zayıf kişiler de dolaylı olarak korunur. Bu nedenle aşılama, yalnızca bireysel değil toplumsal bir sorumluluktur.

Bu parçada aşağıdakilerden hangisine değinilmemiştir?',
  '{"options":["Aşıların bağışıklık sistemine etkisine","Yeterli oranda aşılanmanın hastalık zincirine etkisine","Aşıların geliştirilme sürecinin hangi aşamalardan geçtiğine","Aşı olamayanların dolaylı olarak korunmasına","Aşılamanın toplumsal yönüne"],"correctIndex":2}'::jsonb,
  'Parçada aşının işleyişi, yaygın aşılamanın yayılmayı kırması, korunmasız kişilerin dolaylı korunması ve toplumsal sorumluluk anlatılır. Geliştirme sürecine değinilmez.',
  'Parça aşıdan söz ettiği için aday üretim aşamalarına da değinildiğini sanabilir. Oysa metin yalnızca aşının etkisini ve toplumsal yönünü anlatır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  '(I) Çoğu insan, bir şeyi ne kadar çok isterse onu o kadar iyi öğreneceğini düşünür. (II) Oysa araştırmalar, öğrenmenin istekten çok doğru yöntemle, yani aralıklı tekrar ve kendini sınama gibi stratejilerle ilişkili olduğunu gösteriyor. (III) Bu yüzden istek, yöntemin yerini tutmaz; ancak onu sürdürmeyi kolaylaştırır.

Bu parçadaki I. cümlenin işlevi aşağıdakilerden hangisidir?',
  '{"options":["Daha sonra sorgulanacak yaygın bir kanıyı ortaya koymak","Parçanın sonucunu bildirmek","Düşünceyi örnekle desteklemek","Konunun tanımını yapmak","Karşıt bir görüşü çürütmek"],"correctIndex":0}'::jsonb,
  'I. cümle yaygın bir inancı (çok istemek iyi öğrenmeyi getirir) belirtir; II. cümle "Oysa" ile bu inancı sorgular.',
  'I. cümle bir yargı bildirdiği için aday onu parçanın ana düşüncesi sanabilir. Ancak parçanın ilerleyişi bu yargıyı çürütme yönündedir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'İnsanlar çoğu zaman bir kararın sonucuna bakarak kararın kalitesini yargılar. Kötü sonuçlanan her karar yanlış, iyi sonuçlanan her karar doğru sanılır. Oysa şans, sonucu en az karar kadar etkileyebilir. Bu yüzden .......

Bu parçanın sonuna düşüncenin akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["sonuçlar, kararın kalitesinin tek ölçütüdür.","bir kararı değerlendirirken yalnızca sonuca değil, karar anındaki bilgi ve gerekçelere de bakmak gerekir.","şans eseri başarılı olanlar daima örnek alınmalıdır.","kötü sonuçlanan kararlar mutlaka yeniden verilmelidir.","kararlar yalnızca deneyimli kişilerce verilmelidir."],"correctIndex":1}'::jsonb,
  'Parça, sonuçların şansa da bağlı olduğunu söyler. "Bu yüzden" ile gelen son cümle, kararın kalitesini sonuçla birlikte karar anındaki bilgi ve gerekçeyle değerlendirmeyi önermelidir.',
  '"Sonuçlar tek ölçüttür" şıkkı, parçanın ilk cümlesindeki yaygın anlayışı tekrar ettiği için çeldiricidir. Oysa yazar bu anlayışı eleştirir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'El yazısı, klavyeyle yazmaya göre daha yavaş olduğu için kişiyi bilgiyi özetlemeye ve seçmeye zorlar. Bu seçme süreci, öğrenilenlerin daha iyi anlaşılmasına katkı sağlayabilir. Ancak bu, klavyenin öğrenmeye zarar verdiği anlamına gelmez; yalnızca farklı bilişsel süreçlerin işe koşulduğunu gösterir.

Bu parçadan aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["El yazısı, bilgiyi seçmeye zorlayabilir.","Yazma biçimi, bilişsel süreçleri etkileyebilir.","El yazısı, klavyeye göre daha yavaş bir yöntemdir.","Klavyeyle yazmak, öğrenmeyi her koşulda olumsuz etkiler.","Seçme süreci, anlamaya katkı sağlayabilir."],"correctIndex":3}'::jsonb,
  'Parça, klavyenin öğrenmeye zarar verdiği anlamına gelmediğini açıkça söyler. Bu nedenle klavyenin öğrenmeyi her koşulda olumsuz etkilediği yargısı parçayla çelişir.',
  'Parçanın ilk yarısı el yazısının üstün yanını anlattığı için aday klavyeyi olumsuz bir araç sanabilir. Ancak "Ancak" ile başlayan cümle bu yargıyı açıkça reddeder.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Çöller, canlıların yaşayamayacağı boş alanlar olarak düşünülür. Oysa çöl bitkileri ve hayvanları, suyu depolamak, gündüz sıcağından kaçıp geceleri etkinleşmek gibi yöntemlerle bu koşullara uyum sağlamıştır. Çölün yaşamdan yoksun olduğu düşüncesi, uyumun ne kadar çeşitli olabileceğini görmezden gelir.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Çöl bitkileri suya hiç ihtiyaç duymaz.","Çöl hayvanları yalnızca geceleri yaşayabilir.","Çöller, yaşam için en elverişli ortamlardır.","Uyum, yalnızca bitkilere özgü bir özelliktir.","Çöller, yaşamdan yoksun değil, özgün uyum biçimlerine sahne olan ortamlardır."],"correctIndex":4}'::jsonb,
  'Yazar, çölün boş sanıldığını ama canlıların çeşitli uyum yöntemleri geliştirdiğini söyler.',
  'Parçada "gece etkinleşmek" ifadesi geçtiği için aday hayvanların yalnızca geceleri yaşadığını sanabilir. Oysa bu bir uyum yöntemidir, tek yaşam biçimi değildir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'I. Bu nedenle ilk yardımda en önemli ilke, önce kendi güvenliğinden emin olmaktır.
II. Kazazedeye koşan kişi, tehlikeli bölgede kendisi de yaralanabilir.
III. Yaralı sayısı bire ikiye çıktığında ise yardım etme imkânı daha da azalır.
IV. İlk yardım, çoğu zaman heyecanla başlayan bir müdahale olarak düşünülür.
V. Oysa heyecan, doğru değerlendirme yapmayı güçleştirir.

Bu cümlelerle anlamlı bir paragraf oluşturulduğunda baştan ikinci cümle hangisi olur?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":4}'::jsonb,
  'Doğru sıra IV - V - II - III - I''dir. IV konuyu açar, V ("Oysa") buna karşı heyecanın zararını söyler, II sonuçlarını örnekler, III ("ise") durumu ağırlaştırır, I ("Bu nedenle") sonuçtur. Baştan ikinci cümle V.''tir.',
  'II. cümle ilk yardımın riskini anlattığı için başlangıç gibi görünebilir. Ancak V''teki "Oysa" ile IV arasında doğrudan bir karşıtlık vardır; ikinci sırada V yer alır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Güneş ışınları yere dik geldiğinde gölgeler kısalır; eğik geldiğinde uzar. Bu yüzden öğle vakti gölgeler en kısa, sabah ve akşam en uzun olur. Eski toplumlar, bu değişimden yararlanarak güneş saatleri yapmış ve zamanı gölgenin uzunluğuna göre ölçmüştür.

Bu parçaya en uygun başlık aşağıdakilerden hangisidir?',
  '{"options":["Güneş Işınlarının Atmosferdeki Yolculuğu","Eski Toplumlarda Mimari Gelişmeler","Gölgenin Zamanı Ölçmedeki Rolü","Mevsimlerin Oluşum Nedenleri","Saat Mekanizmalarının Tarihi"],"correctIndex":2}'::jsonb,
  'Parça, gölgenin gün içinde değişen uzunluğundan yararlanılarak zamanın ölçüldüğünü anlatır; en uygun başlık gölgenin zamanı ölçmedeki rolüdür.',
  'Parçada "güneş ışınları" ve "eski toplumlar" geçtiği için aday geniş başlıklara yönelebilir. Oysa parçanın ana konusu gölgenin zaman ölçümünde kullanılmasıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Birine bir kitabı "mutlaka okumalısın" diye önermek, aslında kendi okuma deneyimimizi başkasına dayatmaktır. Bir kitap, okuyanın yaşamıyla birlikte anlam kazanır; aynı sayfalar iki kişide ayrı etkiler bırakır. Bu yüzden iyi bir öneri, "bunu sevdim, belki sen de ilginç bulursun" diyecek kadar mütevazı olmalıdır.

Bu parçada yazar aşağıdakilerden hangisini savunmaktadır?',
  '{"options":["Okuma deneyiminin kişiye özgü olduğu bilinciyle, önerilerde kesin hüküm vermekten kaçınılmasını","Kitapların hiçbir zaman tavsiye edilmemesini","Herkesin aynı kitaplardan benzer biçimde etkilendiğini","Okuyucunun yalnızca kendi seçtiği kitapları okumasını","Kitap önermenin gereksiz olduğunu"],"correctIndex":0}'::jsonb,
  'Yazar, kitapların kişiden kişiye farklı etki bıraktığını söyleyerek önerinin kesin bir buyruk değil, mütevazı bir paylaşım olması gerektiğini savunur.',
  'Parçada "dayatmak" ifadesi geçtiği için aday yazarın öneriyi tümüyle reddettiğini sanabilir. Oysa yazar iyi bir önerinin nasıl olması gerektiğini de anlatır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Kentlerde çatı bahçeleri, binanın ısı yalıtımına katkı sağlar; yazın iç mekânı serinletir, kışın ısı kaybını azaltır. Yağmur suyunun bir bölümünü tutarak taşkın riskini hafifletir, ayrıca kuş ve böcekler için küçük yaşam alanları oluşturur.

Bu parçada aşağıdakilerden hangisine değinilmemiştir?',
  '{"options":["Isı yalıtımına katkısına","Çatı bahçesi kurulumunun maliyetine","Yağmur suyunu tutma özelliğine","Canlılara yaşam alanı oluşturmasına","Mevsimlere göre sağladığı etkiye"],"correctIndex":1}'::jsonb,
  'Parça, çatı bahçelerinin ısı yalıtımı, yağmur suyunu tutma ve canlılara yaşam alanı sağlama yönlerini anlatır. Maliyete değinilmez.',
  'Parça yalnızca yararları sıraladığı için aday maliyetin de karşılaştırıldığını sanabilir. Oysa metinde herhangi bir maliyet bilgisi yoktur.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  '....... Çünkü bir toplumun bildiği yalnızca bugün yaşayanların bildiği değildir; yazıya geçirilen deneyimler, sonraki kuşakların aynı hataları yinelemeden yoluna devam etmesini sağlar.

Bu parçanın başındaki boşluğa düşüncenin akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["Sözlü anlatım, yazıdan her zaman daha güvenilirdir.","Yazının icadı, toplumları birbirine benzetmiştir.","Bilgi, yalnızca bireysel deneyimle edinilebilir.","Yazı, bilginin kuşaktan kuşağa aktarılmasını sağlayan en önemli araçlardan biridir.","Yazıya geçirilen her bilgi doğrudur."],"correctIndex":3}'::jsonb,
  '"Çünkü" cümlesi, yazıya geçirilen deneyimlerin sonraki kuşaklara aktarılmasını anlatır. Bu gerekçe yazının bilgiyi aktaran bir araç olduğunu belirten cümleyi destekler.',
  '"Yazıya geçirilen her bilgi doğrudur" şıkkı, parçadaki yazı vurgusunu genelleyerek çeldirici olur. Oysa parça doğruluk değil, aktarım üzerinedir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Sabır, çoğu zaman beklemek olarak anlaşılır; oysa gerçek sabır, beklerken çalışmaya devam edebilmektir. Tohumu eken çiftçi, filizi görmek için toprağı kazmaz; ama sulamayı, otlarını temizlemeyi ihmal etmez. Sabır pasif bir bekleyişten çok, sonucu zamana bırakırken sürece katkıyı sürdürmektir.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Çiftçiler, sabırlı oldukları için başarılı olur.","Sabır, çabayı gereksiz kılar.","Beklemek, her durumda en doğru davranıştır.","Filizi görmek için toprağı kazmak gerekir.","Sabır, hareketsiz beklemek değil, sonucu beklerken sürece katkı vermeyi sürdürmektir."],"correctIndex":4}'::jsonb,
  'Yazar, sabrı pasif bekleyiş olarak değil, beklerken emeği sürdürmek olarak tanımlar ve çiftçi örneğiyle destekler.',
  'Çiftçi örneği ayrıntılı olduğu için aday ana düşünceyi çiftçiliğe ilişkin bir yargıya (başarı) bağlayabilir. Oysa örnek yalnızca sabrın tanımını somutlaştırır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Takas ekonomisinde iki tarafın birbirinin ihtiyacını aynı anda karşılaması gerekir; bir çiftçinin buğdayını bir marangozun masasıyla değiştirmesi, ancak marangozun da buğdaya ihtiyacı olursa mümkündür. Para, bu eşzamanlılık zorunluluğunu ortadan kaldırarak değişimi kolaylaştırdı. Böylece insanlar, bugünkü emeğini yarınki ihtiyaçlarına dönüştürebilecek bir araç kazandı.

Bu parçadan aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Takasta iki tarafın ihtiyaçlarının örtüşmesi gerekir.","Para, değişimdeki eşzamanlılık zorunluluğunu azaltmıştır.","Takas ekonomisinde değişim, para kullanılan sistemlere göre daha hızlı gerçekleşir.","Para, emeğin zaman içinde saklanmasına imkân tanır.","Takasta marangozun buğdaya ihtiyacı olmaması, değişimi engelleyebilir."],"correctIndex":2}'::jsonb,
  'Parça, paranın değişimi kolaylaştırdığını söyler; takasın daha hızlı olduğunu ima etmez. Bu yargı parçayla çelişir.',
  'Takasın doğrudan olması nedeniyle hızlı sanılması mümkündür. Ancak parça takasın eşzamanlılık şartı yüzünden zor olduğunu anlatır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'I. Bu nedenle buzulların erimesi, yalnızca kutuplardaki bir sorun değil, tüm kıyı kentlerini ilgilendiren bir sorundur.
II. Buzullar, yeryüzündeki tatlı suyun büyük bölümünü depolar.
III. Küresel ısınmayla birlikte bu buzulların erimesi hızlanmaktadır.
IV. Eriyen buz, okyanuslara karışarak deniz seviyesinin yükselmesine yol açar.
V. Yükselen deniz seviyesi ise kıyı yerleşimlerini sel ve tuzlanma riskiyle karşı karşıya bırakır.

Bu cümlelerle anlamlı bir paragraf oluşturulduğunda baştan üçüncü cümle hangisi olur?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":3}'::jsonb,
  'Doğru sıra II - III - IV - V - I''dir. II buzulların önemini verir, III ("bu buzulların") erimeyi anlatır, IV sonucunu (deniz seviyesi) söyler, V kıyı risklerini, I ("Bu nedenle") genel sonucu verir. Baştan üçüncü cümle IV.''tür.',
  'III. cümle erimeyi anlattığı için üçüncü sıraya uygun görünür; ancak "bu buzulların" ifadesi onun hemen II''den sonra, yani ikinci sırada gelmesini gerektirir. Üçüncü cümle IV''tür.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  '(I) Bazı ürünler, yeni sürümü çıkar çıkmaz eskisinin değerini düşürecek biçimde tasarlanır. (II) Bu yöntem, tüketicinin henüz çalışan bir ürünü bırakıp yenisine yönelmesini hedefler. (III) Ne var ki uzun vadede bu durum hem kullanıcının güvenini sarsar hem de atık miktarını artırır.

Bu parçadaki III. cümlenin işlevi aşağıdakilerden hangisidir?',
  '{"options":["Önceki cümlelerde anlatılan uygulamanın olumsuz sonuçlarını belirtmek","Uygulamanın nedenini açıklamak","Konuyla ilgili bir tanım vermek","Önceki cümleyi örnekle somutlaştırmak","Uygulamanın yararlarını sıralamak"],"correctIndex":0}'::jsonb,
  'III. cümle "Ne var ki" ile başlar ve anlatılan uygulamanın güven kaybı ve atık artışı gibi olumsuz sonuçlarını bildirir.',
  '"Ne var ki" ifadesi karşıtlık bildirdiği için aday cümlenin önceki yargıya tamamen karşı çıktığını sanabilir. Oysa cümle uygulamanın zararlarını gösteren bir sonuç bildirir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Mizah, yalnızca güldürmek için değil, ağır gerçeklerle yaşamayı mümkün kılmak için de vardır. İnsanlar, doğrudan konuşamadıkları korkuları ve haksızlıkları şaka yoluyla dile getirir. Gülmek, sorunu çözmese de ona bakmayı katlanılır hâle getirir.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Mizah, sorunları kesin olarak çözer.","Mizah, insanların zor gerçeklerle başa çıkmasına yardım eden bir anlatım yoludur.","Güldürmek, mizahın tek amacıdır.","İnsanlar korkularını yalnızca şakayla anlatır.","Ağır gerçekler, şaka konusu yapılmamalıdır."],"correctIndex":1}'::jsonb,
  'Yazar, mizahın güldürmenin ötesinde zor gerçeklere bakmayı katlanılır kıldığını söyler.',
  '"Güldürmek mizahın tek amacıdır" şıkkı, ilk cümledeki "yalnızca güldürmek için değil" ifadesinin tersidir. Aday cümleyi hızlı okursa karıştırabilir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Hava tahminleri, yarının kesin resmini çizmekten çok olasılıkları bildirir. ....... Çünkü atmosferdeki küçük bir değişim, günler sonra büyük farklara yol açabilir; bu yüzden tahminler uzadıkça belirsizlik artar.

Bu parçada boş bırakılan yere düşüncenin akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["Hava durumu, hiçbir zaman önceden bilinemez.","Tahminler yalnızca kısa süreler için yapılır.","Atmosferdeki değişimler hep aynı sonuçları doğurur.","Bu nedenle tahmin süresi uzadıkça güvenilirlik azalır.","Hava olaylarının tümü rastlantıya bağlıdır."],"correctIndex":3}'::jsonb,
  '"Çünkü" cümlesi, küçük değişimlerin zamanla büyük farklar yarattığını ve belirsizliğin arttığını söyler. Bu gerekçe, tahmin süresi uzadıkça güvenilirliğin azaldığı sonucunu destekler.',
  '"Hava durumu hiçbir zaman önceden bilinemez" şıkkı, parçadaki belirsizlik vurgusunu uca taşır. Oysa parça tahminlerin olasılık bildirdiğini söyler, tümünü reddetmez.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Eski eşyaları atmakta zorlanırız; çünkü onlar yalnızca bir nesne değil, bir dönemin hatırasıdır. Ne var ki hatıraların nesnelerde saklı olduğunu sanmak, onları taşıdığımız zihni görmezden gelmektir. Anı, çoğu zaman eşyanın kendisinden çok onu hatırlama biçimimizde yaşar.

Bu parçada yazarın eski eşyalara yönelik yaklaşımı aşağıdakilerden hangisidir?',
  '{"options":["Eski eşyaların mutlaka saklanması gerektiğini savunmaktadır.","Hatıraların nesnelerden bağımsız olamayacağını ileri sürmektedir.","Eski eşyalara bağlanmayı bir zayıflık saymaktadır.","Eşyaların zihni hiç etkilemediğini düşünmektedir.","Anıların asıl olarak eşyada değil, hatırlama biçimimizde yaşadığını düşünmektedir."],"correctIndex":4}'::jsonb,
  'Yazar, hatıraların nesnelerde saklı olduğu düşüncesini sorgular ve anının hatırlama biçiminde yaşadığını söyler.',
  'İlk cümlede eşyaların hatıra olduğu belirtildiği için aday yazarın eşyaları saklamayı savunduğunu sanabilir. Oysa yazar bu görüşü "Ne var ki" ile sınırlar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Mevsimlik meyve ve sebzeler, doğal olgunlaşma süresinde toplandığı için hem daha lezzetli hem de çoğu zaman daha ucuzdur. Mevsimi dışında üretilen ürünler ise seralarda yetiştirilir ya da uzak bölgelerden getirilir; bu da maliyeti ve çevresel etkiyi artırır.

Bu parçaya göre aşağıdakilerden hangisi söylenemez?',
  '{"options":["Mevsimlik ürünler, doğal olgunlaşma süresinde toplanır.","Sera üretimi ek maliyet doğurabilir.","Mevsimi dışında üretilen ürünlerin maliyeti daha düşüktür.","Uzak bölgelerden getirilen ürünler çevresel yük oluşturabilir.","Mevsimlik ürünler çoğu zaman daha ucuzdur."],"correctIndex":2}'::jsonb,
  'Parça, mevsimi dışında üretilen ürünlerin maliyeti ve çevresel etkiyi artırdığını söyler. Bu nedenle maliyetin daha düşük olduğu yargısı söylenemez.',
  '"Çoğu zaman daha ucuzdur" ifadesi mevsimlik ürünler için kullanıldığı için aday bunu mevsim dışı ürünlerle karıştırabilir. Oysa maliyeti artırdığı belirtilen mevsim dışı ürünlerdir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Yaşlandıkça zamanın hızlandığını söyleriz. Bunun bir nedeni, yeni deneyimlerin azalmasıdır: Beyin, tekrarlanan günleri tek bir kalıp olarak saklar ve geriye bakıldığında zaman kısalmış gibi görünür. Çocukluk yazlarının uzun gelmesi, her şeyin ilk kez yaşanmasındandır.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Zamanın hızlı geçtiği duygusu, yeni deneyimlerin azalmasıyla ilişkilidir.","Yaşlandıkça zaman gerçekten daha hızlı akar.","Çocukluk yılları, yetişkinlik yıllarından daha uzun sürer.","Beyin, tekrarlanan günleri hiç saklamaz.","Zaman duygusu, yaşa bağlı olarak hiç değişmez."],"correctIndex":0}'::jsonb,
  'Yazar, zamanın hızlandığı duygusunu yeni deneyimlerin azalmasına bağlar; çocukluktaki uzunluğu da her şeyin ilk kez yaşanmasına bağlar.',
  '"Zaman gerçekten hızlı akar" şıkkı, parçanın ilk cümlesindeki söylemi ("hızlandığını söyleriz") gerçek sanmaya yol açar. Oysa yazar bunu bir algı olarak açıklar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  '(I) Mutfakta kullanılan baharatlar, yalnızca yemeğe tat vermek için değil, geçmişte gıdayı korumak için de tercih edilirdi. (II) Sarımsak, karabiber ve kimyon gibi bazı baharatların bakteri üremesini yavaşlattığı biliniyor. (III) Bu özellik, soğutma teknolojisi yaygınlaşmadan önce önemli bir avantajdı. (IV) Bugün ise baharatlar, daha çok kültürel kimliğin ve damak zevkinin bir parçası olarak anılıyor. (V) Mutfak gelenekleri, bu eski işlevi unutsa da kullanım alışkanlıklarını sürdürmektedir.

Bu parça iki paragrafa bölünmek istense ikinci paragraf hangi cümleyle başlamalıdır?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":3}'::jsonb,
  'İlk üç cümle baharatların geçmişteki koruyucu işlevini anlatır. IV. cümle "Bugün ise" ile bugüne geçer; konu zaman bakımından değiştiği için ikinci paragraf IV. cümleyle başlamalıdır.',
  'V. cümle de eski işlevden söz ettiği için bölünme noktası gibi görünebilir. Ancak V, IV''te başlayan bugünkü durumu tamamlar; dönüm noktası "Bugün ise" ifadesini taşıyan IV''tür.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  '(I) Sessizlik, yoğun bir kentte bile kısa bir dinlenme alanı yaratabilir. (II) Ofis mobilyalarının renk seçimi, çalışma ortamının görünümünü değiştirir. (III) Birkaç dakikalık sessizlik, zihnin dağınık düşüncelerini toparlamasına yardım eder. (IV) Bu yüzden bazı ofisler, çalışanlar için sessiz odalar tasarlamaktadır. (V) Sessiz odalarda verilen kısa molaların dikkat süresini uzattığı bildirilmiştir.

Bu parçadaki numaralanmış cümlelerden hangisi düşüncenin akışını bozmaktadır?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":1}'::jsonb,
  'Parça, sessizliğin zihin ve ofis düzeni açısından yararını anlatır. II. cümle ise mobilya renklerine geçerek konu bütünlüğünü bozar.',
  'II. cümlede "ofis" sözcüğü geçtiği için IV ve V ile ilişkili görünür. Ancak parçanın ekseni sessizliktir; mobilya rengi bu bütünlüğün dışında kalır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Merak, bilgiye giden yolun başlangıcı sayılır; ama bilgiye sahip olmak merakı beslemek yerine çoğu zaman söndürür. Çünkü bildiğini sanan kişi soru sormayı bırakır. Bu nedenle öğrenmenin en büyük engeli, bilmemek değil, bildiğini sanmaktır.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Bilgi sahibi olmak, merakı her zaman artırır.","Öğrenmenin önündeki asıl engel, bilgisizlikten çok bilgiye dair aşırı güvendir.","Merak, bilgiye ulaşmanın tek yoludur.","Soru sormak, öğrenmeyi engeller.","Bilmemek, öğrenme için en büyük engeldir."],"correctIndex":1}'::jsonb,
  'Yazar, öğrenmenin en büyük engelinin bilmemek değil, bildiğini sanmak olduğunu söyler.',
  '"Bilmemek en büyük engeldir" şıkkı yaygın bir inanıştır ve aday bunu doğru sanabilir. Oysa yazar bunu açıkça reddeder.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Yüzme havuzlarındaki su, belirli aralıklarla klor ya da benzeri bileşiklerle arıtılır. Klor, suda çoğalan mikroorganizmaları öldürerek yüzenlerin hastalık kapmasını önler. Dozun fazla kaçması ise gözleri ve solunum yollarını tahriş edebileceğinden düzenli ölçüm yapılır.

Bu parçanın konusu aşağıdakilerden hangisidir?',
  '{"options":["Yüzmenin sağlığa yararları","Havuz inşaatında kullanılan malzemeler","Havuz sularının arıtılmasında klorun rolü","Mikroorganizmaların çoğalma biçimleri","Gözün yapısı ve görevleri"],"correctIndex":2}'::jsonb,
  'Parça, havuz suyunun klorla arıtılmasını, yararını ve doz sınırını anlatır; konusu klorun rolüdür.',
  'Parçada mikroorganizma ve göz sözleri geçtiği için aday bu konulara yönelebilir. Oysa bunlar klorun işlevini açıklayan ayrıntılardır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Nostalji, geçmişe duyulan tatlı bir özlemdir; yaşanmış bir dönemin sevinçleri, kokuları ve sesleri bugünden bakıldığında olduğundan daha parlak görünür. Bu özlem çoğu zaman, o günlerin zorluklarını silip yalnızca güzel yanlarını hatırlamaktan beslenir.

Bu parçada yazar, düşüncesini geliştirirken aşağıdakilerden hangisinden yararlanmıştır?',
  '{"options":["Karşılaştırma","Örnekleme","Sayısal verilerden yararlanma","Tanık gösterme","Tanımlama"],"correctIndex":4}'::jsonb,
  'Yazar, "Nostalji, ... özlemdir" diyerek kavramı tanımlar ve tanımın özelliklerini açıklar.',
  '"Bugünden bakıldığında olduğundan daha parlak görünür" ifadesi geçmişle bugünü kıyaslıyor gibi görünür. Ancak asıl yöntem, kavramın tanımını yapıp özelliklerini sıralamaktır.',
  array['lisans_gygk']::text[],
  'lisans'
);
