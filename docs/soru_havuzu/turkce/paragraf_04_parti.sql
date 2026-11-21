-- ==========================================================================
-- KADRO SORU HAVUZU · KPSS GY Türkçe · PARAGRAF PARTİSİ 4 (30 soru, zorluk 2-3) · SUPABASE SQL
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
  'Güneş enerjisi paneli kurulumu, çoğu zaman yatırım maliyeti üzerinden tartışılır. Oysa paneller, ömürleri boyunca ürettikleri elektrikle bu maliyeti birkaç yılda geri öder. Asıl sorun, paranın değil sabrın gerektirdiği bir getiriyi bugünün harcama alışkanlıklarıyla ölçmektir.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Güneş enerjisi paneli kurmak her ev için zorunludur.","Paneller, kurulumdan sonraki ilk yıl içinde maliyetini çıkarır.","Güneş enerjisi yatırımlarının değeri, kısa vadeli maliyetle değil uzun vadeli getiriyle değerlendirilmelidir.","Elektrik üretiminde güneş enerjisi dışındaki kaynaklar kullanılmamalıdır.","Yatırım maliyeti, bu konuda önemsiz bir ayrıntıdır."],"correctIndex":2}'::jsonb,
  'Yazar, maliyetin yalnızca başlangıçta yüksek göründüğünü, panellerin birkaç yılda bunu geri ödediğini söyler ve sorunu kısa vadeli ölçütle değerlendirmeye bağlar.',
  '"Birkaç yılda geri öder" ifadesi, "ilk yıl içinde çıkarır" şıkkına benzediği için çeldiricidir. Oysa süre birkaç yıldır; ayrıca yazarın vurgusu süreden çok değerlendirme ölçütüdür.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Dünya yörüngesinde dolanan eski uyduların parçaları, saatte on binlerce kilometre hızla hareket eder. Bu hızda santimetre boyutundaki bir parça bile aktif bir uyduyu devre dışı bırakabilir. Bir çarpışma ise yeni parçalar üreterek riski daha da artırır.

Bu parçadan aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Küçük boyutlu parçalar, uydular için hiçbir tehlike oluşturmaz.","Yörüngedeki parçalar yüksek hızla hareket eder.","Çarpışmalar yeni parçalar üretebilir.","Küçük bir parça bile aktif bir uyduya zarar verebilir.","Yörüngedeki parça miktarı riski artırabilir."],"correctIndex":0}'::jsonb,
  'Parça, santimetre boyutundaki parçanın bile uyduyu devre dışı bırakabileceğini söyler. Bu nedenle küçük parçaların hiçbir tehlike oluşturmadığı yargısı parçayla çelişir.',
  '"Küçük" sözcüğü önemsiz çağrışımı yaptığı için aday bu şıkkı doğru sanabilir. Oysa hız, küçük parçayı da tehlikeli kılar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Açık ofisler, çalışanlar arasında iletişimi artırmak için tasarlanır. ....... Çünkü sürekli duyulan konuşma sesleri, derin bir konsantrasyon gerektiren işlerde çalışanın dikkatini sık sık böler.

Bu parçada boş bırakılan yere düşüncenin akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["Bu nedenle açık ofisler her işyerinde zorunlu hâle getirilmelidir.","Ne var ki bu düzen, bazı işlerde verimi artırmak yerine düşürebilir.","Çalışanların çoğu, açık ofislerde daha az konuşur.","İletişimin artması, her zaman verimi artırır.","Konsantrasyon gerektiren işler yalnızca evde yapılabilir."],"correctIndex":1}'::jsonb,
  'Boşluktan sonraki "Çünkü" cümlesi, ofis gürültüsünün dikkati böldüğünü söyler. Bu gerekçe, tasarımın bazı işlerde verimi düşürebileceğini belirten cümleyi destekler.',
  'İlk cümlede açık ofislerin iletişimi artırdığı söylendiği için aday olumlu bir sonuç cümlesi arayabilir. Oysa "Çünkü" cümlesi olumsuz bir yön anlatır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'I. Bu nedenle bazı ülkeler, tohum bankalarında binlerce bitki çeşidini düşük sıcaklıkta saklıyor.
II. Tarımda kullanılan bitki çeşitleri, son yüzyılda hızla azaldı.
III. Çeşit azaldıkça bir hastalığın tek seferde bütün ürünü yok etme riski artar.
IV. Eski çeşitlerin içinde, kuraklığa ya da hastalığa dayanıklı genler bulunabilir.
V. Bu genler kaybolursa gelecekte ihtiyaç duyulduğunda yerine konulamaz.

Bu cümlelerle anlamlı bir paragraf oluşturulduğunda baştan ikinci cümle hangisi olur?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":2}'::jsonb,
  'Doğru sıra II - III - IV - V - I''dir. II çeşitlerin azaldığını söyler, III ("Çeşit azaldıkça") bunun riskini verir, IV eski çeşitlerin değerini, V ("Bu genler") kaybın sonucunu anlatır; I ("Bu nedenle") sonuçtur. Baştan ikinci cümle III.''tür.',
  'IV. cümle de eski çeşitlerden söz ettiği için ikinci sıraya uygun görünür. Ancak III''teki "Çeşit azaldıkça" bağı, II ile doğrudan ilişkilidir; IV ise bunu izleyen yeni bir bilgidir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Mantarlar, bitkiler gibi görünse de ayrı bir canlı grubudur. Besinlerini fotosentezle değil, çevrelerindeki organik maddeleri ayrıştırarak elde ederler. Bu özellikleri sayesinde ormanda ölü dalları ve yaprakları toprağa dönüştüren ana canlılar arasında yer alırlar.

Bu parçaya en uygun başlık aşağıdakilerden hangisidir?',
  '{"options":["Bitkilerde Fotosentez Süreci","Zehirli Mantarların Tanınması","Orman Yangınlarının Nedenleri","Mantarların Doğadaki Ayrıştırıcı Rolü","Toprak Verimini Artıran Gübreler"],"correctIndex":3}'::jsonb,
  'Parça, mantarların organik maddeleri ayrıştırdığını ve ormanda ölü bitkileri toprağa dönüştürdüğünü anlatır; en uygun başlık mantarların ayrıştırıcı rolüdür.',
  'Parçada fotosentez ve toprak sözleri geçtiği için aday bunlarla ilgili başlıklara yönelebilir. Oysa fotosentezden yalnızca mantarın bitkiden farkını belirtmek için söz edilir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Matematik korkusu, çoğu zaman yetenek eksikliğinden değil, erken yaşta yaşanan bir başarısızlığın genelleştirilmesinden doğar. Bir çocuk, tek bir sınavda zorlanınca kendini "matematikten anlamayan biri" olarak tanımlar ve bu etiketi bir daha sınamaz. Oysa etiket, sınanmadıkça gerçek bir kanıta dönüşmez.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Matematik yeteneği doğuştan belirlenir.","Bir sınavda zorlanan çocuk matematiği hiçbir zaman öğrenemez.","Etiketler, çocukların başarısını artırır.","Matematik korkusu yalnızca yetişkinlerde görülür.","Matematik korkusu, çoğunlukla gerçek bir yetersizlikten değil, erken yaşta oluşan ve sınanmayan bir etiketten kaynaklanır."],"correctIndex":4}'::jsonb,
  'Yazar, korkunun yetenek eksikliğinden değil, tek bir başarısızlığın genelleştirilip sınanmayan bir etikete dönüşmesinden doğduğunu söyler.',
  '"Yetenek" sözcüğü parçada geçtiği için aday doğuştan yetenek yargısına yönelebilir. Oysa yazar yeteneği korkunun nedeni saymaz.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Depreme dayanıklı yapı tasarımında zemin etüdü, binanın kurulacağı toprağın taşıma gücünü belirler. Yapının taşıyıcı sistemi, depremin yatay kuvvetlerine karşı dengeli biçimde yerleştirilmelidir. Ayrıca kullanılan betonun kalitesi ve donatının doğru yerleştirilmesi, yapının ömrünü doğrudan etkiler.

Bu parçada aşağıdakilerden hangisine değinilmemiştir?',
  '{"options":["Zemin etüdünün işlevine","Taşıyıcı sistemin yerleşimine","Deprem sonrası hasar tespit yöntemlerine","Beton kalitesinin önemine","Donatının yapı ömrüne etkisine"],"correctIndex":2}'::jsonb,
  'Parçada zemin etüdü, taşıyıcı sistem, beton kalitesi ve donatı anlatılır. Deprem sonrası hasar tespitine değinilmez.',
  'Parça depremle ilgili olduğu için aday deprem sonrası uygulamalara da yer verildiğini sanabilir. Oysa metin yalnızca yapı tasarımına yöneliktir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  '(I) Çoğu kişi, bir mesleği seçerken kazancı ve saygınlığı ölçüt alır. (II) Oysa insan, günün büyük bölümünü geçireceği işe ilgi duymuyorsa kazancın sağladığı doyum kısa sürede azalır. (III) Bu yüzden meslek seçiminde ilgi ve yetenek, kazanç kadar belirleyici olmalıdır.

Bu parçadaki II. cümlenin işlevi aşağıdakilerden hangisidir?',
  '{"options":["Önceki cümledeki yaygın ölçüte karşı bir gerekçe getirmek","Önceki cümledeki düşünceyi örnekle desteklemek","Parçanın sonucunu bildirmek","Konunun tanımını yapmak","Konuyu başka bir alana taşımak"],"correctIndex":0}'::jsonb,
  'II. cümle "Oysa" ile başlar ve I. cümledeki yaygın ölçüte (kazanç ve saygınlık) karşı, kazancın tek başına yeterli olmadığını gerekçelendirir.',
  'II. cümle bir açıklama içerdiği için aday bunu örnek sanabilir. Oysa cümle önceki yargıyı desteklemez, ona karşı çıkar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Plastikler, kolay üretildiği ve ucuz olduğu için hayatımızın her alanına girdi. ....... Çünkü plastik doğada yüzlerce yıl bozunmadan kalır ve zamanla mikroskobik parçalara ayrılarak su ve toprağa karışır.

Bu parçada boş bırakılan yere düşüncenin akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["Bu nedenle plastik üretimi artırılmalıdır.","Ne var ki bu kolaylığın çevresel bedeli, bugünkü kullanım biçimimizin çok ötesinde bir süreyi kapsıyor.","Plastiklerin tamamı geri dönüştürülebilir.","Mikroskobik parçalar, canlılara zarar vermez.","Plastik, doğada kısa sürede kaybolur."],"correctIndex":1}'::jsonb,
  'Boşluktan sonraki "Çünkü" cümlesi, plastiğin doğada çok uzun süre kaldığını söyler. Bu gerekçeyi, kolaylığın çevresel bedelinin uzun sürdüğünü belirten cümle taşır.',
  'İlk cümledeki olumlu ifadeler ("kolay, ucuz") aday için olumlu bir sonuç cümlesi çağrıştırır. Oysa "Çünkü" cümlesi plastiğin çevresel yönünü eleştirir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'İlk izlenim, çoğu zaman birkaç saniye içinde oluşur ve sonraki bilgileri yorumlama biçimimizi etkiler. Ancak bu, ilk izlenimin her zaman doğru olduğu anlamına gelmez; yalnızca zihnin hızlı karar verme eğilimini gösterir.

Bu parçadan aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["İlk izlenim kısa sürede oluşur.","İlk izlenim, sonraki yorumlarımızı etkileyebilir.","Zihin hızlı karar vermeye eğilimlidir.","İlk izlenim, kişi hakkında verilen en doğru karardır.","İlk izlenim yanıltıcı olabilir."],"correctIndex":3}'::jsonb,
  'Parça, ilk izlenimin her zaman doğru olmadığını söyler. Bu nedenle en doğru karar olduğu yargısı çıkarılamaz.',
  '"Sonraki bilgileri etkiler" ifadesi ilk izlenimin güçlü olduğunu düşündürür. Ancak parça, "Ancak" ile bu gücü doğrulukla eşitlemez.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'I. Roma''nın su kemerleri, suyu kilometrelerce uzaktan kente taşıyabilecek kadar sağlamdı.
II. Bu eğim sayesinde kent halkı, her gün temiz suya ulaşabiliyordu.
III. Böyle büyük bir yapının ayakta kalması, ciddi bir mühendislik hesabı gerektirirdi.
IV. Kemerler, suyu yer çekimiyle akıtacak ince bir eğimi korumak zorundaydı.
V. Bugün hâlâ ayakta duran kemerler, bu hesabın ne kadar isabetli olduğunu gösteriyor.

Bu cümlelerle anlamlı bir paragraf oluşturulduğunda baştan ikinci cümle hangisi olur?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":2}'::jsonb,
  'Doğru sıra I - III - IV - II - V''tir. I kemerleri tanıtır, III ("Böyle büyük bir yapının") bunun mühendislik hesabını söyler, IV eğim koşulunu açıklar, II ("Bu eğim sayesinde") sonucunu verir, V bugünkü durumu bildirir. Baştan ikinci cümle III.''tür.',
  'II. cümle kemerlerin yararını anlattığı için hemen I''den sonra gelebilir gibi görünür. Ancak "Bu eğim sayesinde" ifadesi, eğim koşulunun anlatıldığı IV''ün ardından gelmesi gerektiğini gösterir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Barajlar, yağışlı mevsimde suyu biriktirip kurak mevsimde kullanmayı sağladığı için kentlerin vazgeçilmez yapıları sayılır. Ancak su tutmanın bir bedeli vardır: akarsuyun doğal akışı değişir, yatak boyunca beslenen ekosistemler zarar görebilir. Bu yüzden baraj planlaması, yalnızca su ihtiyacına değil, bölgenin ekolojik dengesine de bakmalıdır.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Barajlar, kentlerin su ihtiyacı için gereksizdir.","Akarsular, baraj yapılmadan da aynı verimle kullanılabilir.","Ekolojik denge, su ihtiyacından daha az önemlidir.","Baraj yapımı tümüyle terk edilmelidir.","Barajların yararı kadar ekolojik sonuçları da değerlendirilerek planlama yapılmalıdır."],"correctIndex":4}'::jsonb,
  'Yazar, barajların yararını kabul eder ama ekolojik bedelini de belirtir ve planlamanın ikisini birlikte gözetmesini önerir.',
  '"Vazgeçilmez" ve "zarar" gibi iki zıt vurgu olduğu için aday uç şıklardan birine (gereksiz ya da terk edilmeli) yönelebilir. Oysa yazar dengeli bir planlama ister.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Bir olayın tanığı olan kişiye, gördüklerini en iyi o bilir diye güvenilir. Oysa bellek bir kamera gibi çalışmaz; olay sonrası duyulan yorumlar, sorulan sorular ve zamanın geçmesi anıyı sessizce değiştirebilir. Bu nedenle bir tanığın içtenliği, anısının doğruluğunu garanti etmez.

Bu parçada yazarın amacı aşağıdakilerden hangisidir?',
  '{"options":["Tanıkların kasıtlı olarak yalan söylediğini kanıtlamak","Belleğin bir kamera gibi çalıştığını savunmak","Tanıklığın, içten olsa bile belleğin değişkenliği nedeniyle hatalı olabileceğini göstermek","Tanık ifadelerinin hiç dikkate alınmaması gerektiğini ileri sürmek","Zamanın anıları hiç etkilemediğini açıklamak"],"correctIndex":2}'::jsonb,
  'Yazar, belleğin kamera gibi çalışmadığını ve içten bir tanığın bile yanılabileceğini söyler; amacı tanıklığın hatalı olabileceğini göstermektir.',
  '"İçtenliği garanti etmez" ifadesi tanıkların yalan söylediği izlenimi verebilir. Oysa yazar niyetten değil, belleğin doğasından söz eder.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Dünya, kendi ekseni etrafında dönerken Güneş''in doğduğu ve battığı saat bölgeden bölgeye değişir. Bu yüzden yeryüzü, her biri yaklaşık bir saat fark gösteren saat dilimlerine ayrılmıştır. Uluslararası görüşmelerde zaman farkı, toplantı saatlerinin belirlenmesinde dikkate alınır.

Bu parçanın konusu aşağıdakilerden hangisidir?',
  '{"options":["Saat dilimlerinin oluşma nedeni ve kullanımı","Dünya''nın Güneş çevresindeki dönüşü","Takvimlerin tarihsel gelişimi","Uluslararası ticaret kuralları","Uzay yolculuklarında zaman ölçümü"],"correctIndex":0}'::jsonb,
  'Parça, Dünya''nın dönüşü nedeniyle oluşan saat dilimlerini ve bunların uluslararası görüşmelerdeki kullanımını anlatır.',
  'Parçada "Güneş" ve "uluslararası" sözleri geçtiği için aday geniş konulara yönelebilir. Oysa bunlar saat dilimlerini açıklayan ayrıntılardır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Sahte sanat eserlerini ayırt etmek, yalnızca ustalıkla yapılmış bir kopyayı fark etmeye bağlı değildir; eserin geçmişi, sahiplik belgeleri ve kullanılan malzemenin dönemi de incelenir. Bu nedenle uzmanlar, eserin yalnızca görünümüne değil, kökenine de bakar.

Bu parçadan aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Sahtecilik tespitinde kullanılan malzeme incelenir.","Bir eserin görünümü, özgün olup olmadığını tek başına gösterir.","Eserin sahiplik geçmişi önemlidir.","Uzmanlar yalnızca görünümle yetinmez.","Ustalıkla yapılan kopyaları fark etmek zor olabilir."],"correctIndex":1}'::jsonb,
  'Parça, görünümün yetmediğini söyler; geçmiş, belge ve malzeme de incelenir. Bu nedenle görünümün tek başına yeterli olduğu yargısı çıkarılamaz.',
  'Parçanın başında "ustalıkla yapılmış kopya" ifadesi geçtiği için aday görünümün belirleyici olduğunu sanabilir. Oysa yazar görünümün yetersizliğini vurgular.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Kentlerde toplu taşıma, yalnızca insanları bir yerden başka yere götüren bir hizmet değildir. ....... Çünkü herkesin araçla yolculuk ettiği bir kentte yollar, otoparklar ve park yeri aramak için harcanan zaman, kentin en pahalı kayıplarına dönüşür.

Bu parçada boş bırakılan yere düşüncenin akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["Bireysel araç kullanımı, her kent için en verimli yöntemdir.","Toplu taşıma araçları, yolların daha hızlı yıpranmasına yol açar.","Kentlerde otopark sorunu yoktur.","Aynı zamanda kentin yaşam alanını ve kaynaklarını paylaşma biçimini belirleyen bir tercihtir.","Yolculuk süresi, kent kaynakları üzerinde etkili değildir."],"correctIndex":3}'::jsonb,
  'Boşluktan sonraki "Çünkü" cümlesi, bireysel araç kullanımının kent kaynaklarını tükettiğini söyler. Bu nedenle toplu taşımanın kaynakların paylaşımıyla ilgili bir tercih olduğunu belirten cümle uygundur.',
  'Parçanın ilk cümlesi toplu taşımanın "hizmetten fazlası" olduğunu söyler; aday bu ifadeyle toplu taşımaya yönelik bir eleştiri sanabilir. Oysa boşluktan sonraki cümle bireysel aracı eleştirir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  '(I) Mutfakta çiğ et ile hazır yiyeceklerin aynı kesme tahtasında hazırlanması, çapraz bulaşma riski doğurur. (II) Bu risk, tahtaların ayrı kullanılmasıyla önemli ölçüde azalır. (III) Çiğ etle ilgili tariflerin yemek kitaplarındaki payı son yıllarda artmıştır. (IV) Ayrıca tahtaların kullanımdan sonra sıcak suyla yıkanması da bakteri üremesini sınırlar. (V) Küçük görünen bu alışkanlıklar, gıda kaynaklı hastalıkları büyük oranda önleyebilir.

Bu parçadaki numaralanmış cümlelerden hangisi düşüncenin akışını bozmaktadır?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":2}'::jsonb,
  'Parça, mutfakta çapraz bulaşmayı önleyen alışkanlıkları anlatır. III. cümle ise yemek kitaplarındaki tarif payına geçerek konunun dışına çıkar.',
  'III. cümlede "çiğ et" sözü geçtiği için konu içinde gibi görünür. Ancak parçanın ekseni hijyen alışkanlıklarıdır; kitaplardaki tarif payı bu bütünlüğü bozar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'İnsanlar "meşgulüm" sözünü, önemli oldukları anlamına gelen bir rozet gibi taşır. Oysa meşgul olmak, çoğu zaman öncelikleri belirleyememenin sonucudur: Her işe evet diyen, hiçbirine yeterince zaman ayıramaz. Gerçekten önemli işleri olan kişiler, çoğu zaman az işi iyi yapmayı tercih eder.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Önemli kişiler her işe evet demelidir.","Meşgul olmak, başarının ön koşuludur.","İş yoğunluğu, insanın değerini belirler.","Az iş yapan kişiler daha başarısızdır.","Sürekli meşgul görünmek önemli olmanın göstergesi değil, çoğu zaman öncelik belirleyememenin sonucudur."],"correctIndex":4}'::jsonb,
  'Yazar, meşguliyetin önem göstergesi sanılmasını eleştirir ve bunun çoğunlukla öncelik belirleyememekten kaynaklandığını söyler.',
  '"Rozet" sözü meşguliyeti olumlu bir sıfat gibi gösterdiği için aday ilk cümleyi yazarın görüşü sanabilir. Oysa yazar "Oysa" ile bu anlayışı reddeder.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  '(I) Bir kasabanın ekonomisi uzun yıllar yalnızca bir fabrikaya bağlı kaldı. (II) Fabrika kapanınca yüzlerce kişi işsiz kaldı ve kasaba nüfus kaybetmeye başladı. (III) Bu durum, ekonomide çeşitliliğin bir ülke için olduğu kadar küçük bir kasaba için de önemli olduğunu gösteriyor.

Bu parçadaki II. cümlenin işlevi aşağıdakilerden hangisidir?',
  '{"options":["Önceki cümlede belirtilen bağımlılığın sonucunu göstermek","Önceki cümledeki durumun nedenini açıklamak","Konuya karşıt bir görüş getirmek","Parçanın ana düşüncesini özetlemek","Konunun tanımını yapmak"],"correctIndex":0}'::jsonb,
  'II. cümle, I. cümledeki tek fabrikaya bağımlılığın doğurduğu sonucu (işsizlik, nüfus kaybı) bildirir.',
  'II. cümle bir olay anlattığı için aday bunu neden sanabilir. Oysa cümle önceki durumun nedenini değil, sonucunu bildirir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Her kuşak, bir öncekini "bizim zamanımızda böyle değildi" diyerek eleştirir. Oysa bu cümle, tarih boyunca neredeyse aynı biçimde tekrarlanmıştır. Eleştirinin yinelenmesi, değişimin her zaman kötüye gittiğini değil, insanın tanıdık olana duyduğu bağlılığı gösterir.

Bu parçada yazarın asıl vurgusu aşağıdakilerden hangisidir?',
  '{"options":["Her kuşağın bir öncekinden daha kötü olduğu","Geçmişi yüceltip bugünü eleştirme eğiliminin, değişimin kötülüğünden çok alışkanlıktan kaynaklandığı","Geçmişte hiçbir sorunun yaşanmadığı","Değişimin her zaman olumlu olduğu","Eleştirinin gereksiz olduğu"],"correctIndex":1}'::jsonb,
  'Yazar, aynı eleştirinin kuşaktan kuşağa tekrarlandığını söyler ve bunu tanıdığa bağlılığa bağlar.',
  '"Bizim zamanımızda böyle değildi" sözü değişimin kötü olduğunu ima ettiği için aday kuşakların kötüleştiği yargısına kayabilir. Oysa yazar bunu bir alışkanlık olarak yorumlar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'I. Böylece tek bir meşe palamudu, yıllar sonra koca bir ormanın başlangıcı olabilir.
II. Ormandaki sincaplar, kış için palamutları toprağa gömer.
III. Ancak gömülen palamutların bir kısmı unutulur.
IV. Unutulan palamutlar, ilkbaharda filizlenerek yeni ağaçlara dönüşür.
V. Bir ormanın yenilenmesi, çoğu zaman hayvanların farkında olmadan yaptığı işlere bağlıdır.

Bu cümlelerle anlamlı bir paragraf oluşturulduğunda baştan dördüncü cümle hangisi olur?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":3}'::jsonb,
  'Doğru sıra V - II - III - IV - I''dir. V genel yargıyı verir, II sincapların palamutları gömdüğünü, III ("Ancak") bir kısmının unutulduğunu, IV unutulanların filizlendiğini anlatır; I ("Böylece") sonuçtur. Baştan dördüncü cümle IV.''tür.',
  'I. cümledeki "Böylece" ifadesi cümleyi sona iter; ancak IV, unutulan palamutların filizlenmesini anlattığı için I''den önce gelmelidir. Aday dördüncü sırayı I sanabilir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Bir kentteki sokak hayvanları, yalnızca merhamet konusu değil, kamusal bir planlama konusudur. Kısırlaştırma, aşılama ve beslenme noktaları gibi uygulamalar, hem hayvanların sağlığını hem de insanların güvenliğini gözetir.

Bu parçaya en uygun başlık aşağıdakilerden hangisidir?',
  '{"options":["Evcil Hayvan Besleme Yöntemleri","Kentlerde Nüfus Artışının Nedenleri","Hayvan Hastalıklarının Tarihçesi","Sokak Hayvanlarına Yönelik Kamusal Planlama","Veteriner Hekimliğinde Yeni Gelişmeler"],"correctIndex":3}'::jsonb,
  'Parça, sokak hayvanlarının yalnızca merhamet değil, kısırlaştırma ve aşılama gibi uygulamalarla yürütülen kamusal bir planlama konusu olduğunu anlatır.',
  '"Beslenme noktaları" ifadesi besleme yöntemlerini çağrıştırdığı için aday evcil hayvan beslemeyle ilgili bir başlık seçebilir. Oysa parça sokak hayvanlarını ve kamusal planlamayı konu eder.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Herkesin kullanabildiği ortak bir otlağı düşünelim: Her çoban, kendi sürüsünü biraz daha büyütmenin bireysel kazancını görür; ama otlağın tükenmesinin bedelini herkes birlikte öder. Bu yüzden ortak kaynaklar, kimse sorumluluk almadığında sessizce tükenir. Çözüm, kaynağın kullanımını herkesin sorumluluğuna bağlayan kurallar koymaktır.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Ortak otlaklar her zaman tükenir.","Çobanlar kendi sürülerini büyütmemelidir.","Bireysel kazanç, ortak kaynakları korur.","Kaynakların kullanımı tümüyle serbest bırakılmalıdır.","Ortak kaynakların korunması, kullanıcıların sorumluluğunu belirleyen kurallara bağlıdır."],"correctIndex":4}'::jsonb,
  'Yazar, kaynakların kimse sorumluluk almadığında tükendiğini söyler ve çözümü sorumluluğu belirleyen kurallarda görür.',
  '"Sessizce tükenir" ifadesi, ortak kaynakların mutlaka tükeneceği yargısını çağrıştırır. Oysa yazar bunun sorumluluk alınmadığında olduğunu söyler ve çözüm önerir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Konuşurken yalnızca sözcüklerle iletişim kurmayız; duruş, bakış ve el hareketleri de mesajın bir parçasıdır. ....... Bu yüzden sözcüklerle bedenin çeliştiği durumlarda, dinleyiciler çoğunlukla bedene inanır.

Bu parçada boş bırakılan yere düşüncenin akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["Beden dili, çoğu zaman sözcüklerden daha içten bir iletişim aracı olarak algılanır.","Sözcükler, iletişimin tek aracıdır.","El hareketleri, anlatımı her zaman bozar.","Bakış, iletişimde hiçbir rol oynamaz.","Dinleyiciler, konuşmacının duruşunu dikkate almaz."],"correctIndex":0}'::jsonb,
  'Boşluktan sonra "Bu yüzden" ile gelen cümle, sözcükle beden çeliştiğinde bedene inanıldığını söyler. Bu sonucun gerekçesi, beden dilinin daha içten algılanmasıdır.',
  '"Sözcüklerle iletişim kurmayız" ifadesinin yanlış okunması, sözcüklerin iletişimde yeri olmadığı sonucuna götürebilir. Oysa yazar yalnızca bedenin de iletişimin parçası olduğunu söyler.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Ormanlarda çıkan her yangın, yıkım olarak görülmez: Bazı ekosistemlerde ateş, yaşlı bitki örtüsünü temizleyerek yeni filizlenmeye zemin hazırlar. Ancak insan kaynaklı ve kontrolsüz yangınlar bu doğal döngünün çok ötesine geçer.

Bu parçaya göre aşağıdakilerden hangisi söylenemez?',
  '{"options":["Bazı yangınlar yeni filizlenmeye zemin hazırlar.","Ormanlardaki bütün yangınlar ekosistem için yararlıdır.","Kontrolsüz yangınlar doğal döngüyü aşabilir.","İnsan kaynaklı yangınlar yıkıcı olabilir.","Ateş, bazı ekosistemlerde yenilenmeye katkı sağlar."],"correctIndex":1}'::jsonb,
  'Parça, yangınların yalnızca bazı ekosistemlerde yararlı olabileceğini söyler; insan kaynaklı yangınların döngüyü aştığını belirtir. Bu nedenle bütün yangınların yararlı olduğu yargısı söylenemez.',
  'İlk cümledeki "her yangın yıkım olarak görülmez" ifadesi yangınların hepsinin yararlı olduğu izlenimini verebilir. Oysa parça bunu bazı ekosistemlerle sınırlar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Ekmeğin kabarması, hamurdaki mayanın şekeri tüketirken karbondioksit üretmesine bağlıdır. Bu gaz, hamurun içinde kabarcıklar oluşturarak hacmi artırır. Sıcaklık yükseldikçe mayanın faaliyeti hızlanır; ancak çok yüksek ısıda maya ölür ve kabarma durur.

Bu parçada aşağıdakilerden hangisine değinilmemiştir?',
  '{"options":["Mayanın kabarmadaki rolüne","Karbondioksitin hamur üzerindeki etkisine","Sıcaklığın maya faaliyetine etkisine","Ekmeğin ilk kez hangi toplum tarafından yapıldığına","Çok yüksek ısının mayaya etkisine"],"correctIndex":3}'::jsonb,
  'Parçada mayanın rolü, karbondioksitin etkisi ve sıcaklığın etkileri anlatılır. Ekmeğin tarihçesine değinilmez.',
  'Parça ekmeğin yapımından söz ettiği için aday tarihî bir bilgiyi de beklemiş olabilir. Oysa metin yalnızca kabarma sürecini anlatır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Sıfır atık anlayışıyla çalışan marketlerde ürünler ambalajsız satılır; müşteri kendi kabıyla gelir ve ihtiyacı kadar alır. Bu yöntem, hem ambalaj atığını hem de israfı azaltır. Ancak düşük fiyat ve kolaylık alışkanlığı, bu modelin yaygınlaşmasını yavaşlatır.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Ambalajsız satış, bütün ürünler için uygundur.","Müşteriler kendi kaplarını getirmeye zorlanmalıdır.","Marketlerin çoğu sıfır atık anlayışını benimsemiştir.","Fiyat, sıfır atık modelinin tek avantajıdır.","Sıfır atık marketleri atığı azaltsa da fiyat ve alışkanlık nedeniyle yaygınlaşması zordur."],"correctIndex":4}'::jsonb,
  'Parça, modelin atığı ve israfı azalttığını söyler, ardından fiyat ve alışkanlığın yaygınlaşmayı yavaşlattığını belirtir.',
  'Parçada "düşük fiyat" ifadesi geçtiği için aday bunu modelin avantajı sanabilir. Oysa burada düşük fiyat, mevcut ürünlerin ucuzluğudur ve modelin önünde engeldir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Kendimizi geliştirmeye çalışırken sürekli bir eksiklik duygusu taşımak, motivasyonu artırmaz; çoğu zaman yıpratır. İnsan, yalnızca eksiklerine odaklandığında yaptığı doğruları görmez. Gelişim, kendine acımasız davranmak değil, hatayı ders olarak görebilmektir.

Bu parçada yazarın gelişime yönelik yaklaşımı aşağıdakilerden hangisidir?',
  '{"options":["Gelişimin, eksiklere odaklanmak yerine hatalardan ders çıkarmakla sağlandığını düşünmektedir.","Eksiklerini sürekli düşünmenin motivasyonu artırdığını savunmaktadır.","İnsanların hatalarını yok saymasını önermektedir.","Gelişimin acımasızlıkla mümkün olduğunu ileri sürmektedir.","İnsanın kendini hiç eleştirmemesi gerektiğini söylemektedir."],"correctIndex":0}'::jsonb,
  'Yazar, sürekli eksiklik duygusunun yıprattığını, gelişimin hatayı ders olarak görmekle sağlandığını söyler.',
  '"Hatayı ders olarak görmek" ifadesi hataların yok sayılması gibi okunabilir. Oysa yazar hataları göz ardı etmeyi değil, onlardan öğrenmeyi önerir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Sabah erkenden evden çıktı. Durakta bir süre bekledikten sonra gelen otobüse bindi. Biraz sonra yan koltuktaki yaşlı kadın ona bir paket uzattı; paketten çıkan fotoğrafı görünce neye uğradığını şaşırdı.

Bu parçada ağır basan anlatım biçimi aşağıdakilerden hangisidir?',
  '{"options":["Betimleyici anlatım","Öyküleyici anlatım","Açıklayıcı anlatım","Tartışmacı anlatım","Anlatım biçimlerinden hiçbiri ağır basmamaktadır."],"correctIndex":1}'::jsonb,
  'Parçada olaylar zaman sırasıyla anlatılır (çıkmak, beklemek, binmek, paket uzatılması); bu, öyküleyici anlatımdır.',
  '"Fotoğraf" ve "yaşlı kadın" gibi sözler görsel çağrışım yaptığı için aday betimleme sanabilir. Oysa parçada ağır basan, olayların art arda gelişidir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Dil, yaşayan bir varlık gibi durmadan yeni sözcükler üretir. Teknolojik bir kavram ortaya çıktığında önce yabancı sözcük kullanılır; zamanla bunun yerine kendi dilimizin kurallarına uygun türetmeler yerleşir. Bu yüzden .......

Bu parçanın sonuna düşüncenin akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["yabancı sözcük kullanmak, dilin yozlaşmasının tek nedenidir.","dil, hiçbir zaman değişmeyen bir yapıdır.","yeni kavramlar için sözcük türetmek gereksizdir.","teknolojik kavramlar yalnızca bilim insanlarınca adlandırılır.","dilin yeni kavramlara uyum sağlaması, yabancı sözcüklerin alınmasıyla birlikte kendi kaynaklarından türetme yoluyla da gerçekleşir."],"correctIndex":4}'::jsonb,
  'Parça, dilin yeni kavramlara önce yabancı sözcükle, zamanla ise kendi kurallarıyla türetilmiş sözcüklerle karşılık bulduğunu anlatır. "Bu yüzden" ile gelen sonuç bu iki yolu birleştirir.',
  '"Yabancı sözcük" vurgusu dil karşıtı bir sonuç çağrıştırdığı için aday yozlaşma görüşüne yönelebilir. Oysa parça yabancı sözcüğü geçici bir aşama olarak sunar.',
  array['lisans_gygk']::text[],
  'lisans'
);
