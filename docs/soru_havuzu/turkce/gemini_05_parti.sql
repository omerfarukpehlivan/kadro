-- ==========================================================================
-- KADRO SORU HAVUZU · KPSS GY Türkçe · GEMİNİ PARTİ 5 (30 soru: 6 Paragraf, 7 Cümlede Anlam, 4 Yazım, 5 Noktalama, 6 Anlatım Bozukluğu, 2 Ses Bilgisi) · SUPABASE SQL
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
  'Modern yolcu uçaklarında otopilot sistemleri, uçuşun büyük bölümünde rotayı, yüksekliği ve hızı pilotlardan daha hassas biçimde yönetir. Bu gelişme, rutin uçuş güvenliğini belirgin biçimde yükseltmiştir. Ancak sistemlerin devrede olduğu uzun saatler boyunca pilotlar uçağı doğrudan kontrol etmediği için olağan dışı bir arıza anında hızlı ve soğukkanlı müdahale etme refleksleri zayıflayabilmektedir. Bu nedenle havacılık eğitimlerinde, düzenli simülatör uçuşlarıyla manuel pilotaj becerisinin canlı tutulması zorunlu görülmektedir.

Bu parçada asıl vurgulanmak istenen aşağıdakilerden hangisidir?',
  '{"options":["Otopilot sistemleri devre dışı kaldığında uçakların güvenli biçimde piste indirilmesi teknik açıdan olanaksızlaşmaktadır.","Otomasyon uçuş güvenliğini artırsa da elle kumandanın körelmemesi için düzenli eğitim gerekir.","Havacılık sektöründe bütün rutin uçuşların gelecekte insan müdahalesi olmadan yönetilmesi hedeflenmektedir.","Simülatör eğitimleri, gerçek uçuş deneyimi kadar gerçekçi koşullar sunamadığı için pilotlarca yetersiz görülür.","Otomatik sistemlerin yaygınlaşması, yolcu uçaklarındaki görevli personel sayısının azaltılmasını zorunlu kılmıştır."],"correctIndex":1}'::jsonb,
  'Parça, otopilot sistemlerinin güvenliği artırdığını ancak elle kontrolü azalttığı için pilotların acil durum reflekslerini zayıflatabildiğini ve bu yüzden simülatörle manuel becerilerin korunması gerektiğini vurgular.',
  'İlk cümledeki güvenlik artışı nedeniyle aday otomasyonun pilotaj eğitimini gereksiz kıldığı yönünde bir yargıya kayabilir; oysa son cümle manuel becerinin eğitimle canlı tutulması gerektiğini öne çıkarır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Tarihî tekstil ürünlerinde ve el yazmalarında kullanılan doğal bitki boyaları, ışık enerjisine karşı sentetik pigmentlere göre çok daha hassastır. Müze salonlarındaki güçlü aydınlatma, kumaş liflerindeki boya moleküllerini parçalayarak canlı kırmızıları ve çivit mavilerini yıllar içinde soluk bir tona dönüştürür. Bu bozulma geri döndürülemediği için pek çok müze, nadir dokumaları sürekli sergilemek yerine loş ışık altında ve dönüşümlü takvimlerle ziyarete açar.

Bu parçadan aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Doğal bitki boyaları, yapay pigmentlere kıyasla ışık enerjisinin yol açtığı solmaya karşı daha duyarlıdır.","Müze salonlarındaki güçlü aydınlatma, tarihî dokumaların renk moleküllerini zamanla bozabilmektedir.","Nadir eserlerin loş ışıkta ve dönüşümlü sergilenmesi, renk kaybını yavaşlatmaya yönelik bir koruma önlemidir.","Işığın etkisiyle solan doğal renkler, koruma yöntemleriyle eski canlılığına döndürülebilir.","Sürekli aydınlatmaya maruz bırakılan tarihî el yazmaları ve dokumalar renk değişimi riskiyle karşı karşıyadır."],"correctIndex":3}'::jsonb,
  'Parça, ışık nedeniyle oluşan renk bozulmasının geri döndürülemediğini açıkça belirtir. Bu nedenle solan renklerin koruma yöntemleriyle eski canlılığına döndürülebildiği yargısı metinle çelişir.',
  'Müzelerin loş ışık ve dönüşümlü takvim uygulaması, koruma yöntemleriyle eski rengin geri getirilebildiği izlenimini uyandırabilir; oysa bu önlemler yalnızca geri döndürülemez bozulmayı önlemeye yöneliktir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Su moleküllerinin birbirine güçlü biçimde tutunması, suyun yüzeyinde görünmez ve esnek bir zar varmış gibi davranmasına yol açar. ....... Bu sayede gölet yüzeyinde hızla kayan su örümcekleri, suyu delmeden yüzeydeki gerginlik üzerinde ilerleyebilir.

Bu parçada boş bırakılan yere düşüncenin akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["Gölet sularının sıcaklığı düştükçe yüzeydeki moleküller birbirinden uzaklaşıp bu direnci zayıflatır.","Yüzey gerilimi adı verilen bu etki, küçük canlıları taşıyabilecek bir direnç oluşturur.","Su örümcekleri avlarını yakalamak için göletin dibindeki çamurlu katmanlara doğru hızlı dalışlar yapar.","Suyun yüzeyindeki bu esnek tabaka, akıntı hızının yüksek olduğu derin nehir yataklarında daha belirgindir.","Moleküller arasındaki çekim kuvveti, suyun içindeki çözünmüş oksijen miktarını doğrudan belirlemektedir."],"correctIndex":1}'::jsonb,
  'İlk cümlede su yüzeyinin esnek bir zar gibi davrandığı anlatılır; "Bu sayede" ile başlayan son cümle ise su örümceklerinin suya batmadan ilerlemesini açıklar. Araya bu gerginliğin küçük canlıları taşıyacak direnç oluşturduğunu söyleyen cümle gelmelidir.',
  'Su örümceklerinin özelliklerinden söz eden seçenek konuya yakın görünse de "Bu sayede" bağlacı kendinden önce suyun taşıyıcı direncini açıklayan bir cümle gerektirir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'I. Bu nedenle her sınıflandırma sistemi, bilgiyi düzenlerken aynı zamanda okurun neyi bir arada göreceğini de sessizce belirler.
II. Kütüphanelerde kitapların konu başlıklarına göre raflara yerleştirilmesi, aranan esere ulaşmayı kolaylaştıran temel bir düzendir.
III. Oysa pek çok çalışma, tarihle ekonomiyi ya da biyolojiyle sosyolojiyi iç içe işlediği için tek bir başlığa sığmaz.
IV. Böyle bir kitap tek bir rafa konulduğunda, diğer disiplinlerle uğraşan okurların gözünden kolayca kaçabilir.
V. Dolayısıyla kitap raflarının sınırları, çoğu zaman araştırmacının disiplinler arası bağlar kurma şansını da etkiler.

Bu cümlelerle anlamlı bir paragraf oluşturulduğunda baştan üçüncü cümle hangisi olur?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":3}'::jsonb,
  'Doğru sıralama II - III - IV - V - I biçimindedir. II. cümle konu başlığına göre raf düzenini tanıtır; III. cümle ("Oysa") tek başlığa sığmayan eserlerin bulunduğunu söyleyerek itiraz eder; IV. cümle ("Böyle bir kitap") bu tür kitapların tek rafa konmasının yol açtığı sonucu verir; V. cümle ("Dolayısıyla") bunun araştırmacının disiplinler arası bağına etkisini bildirir; I. cümle ("Bu nedenle her sınıflandırma sistemi...") genel ilkeyi bağlar. Baştan üçüncü cümle IV.''tür.',
  'I. ve V. cümlelerin ikisi de sonuç bağlacı taşıdığı için sırası karıştırılabilir. V. cümle doğrudan "kitap raflarının sınırları"na odaklanıp IV.''ü tamamlarken I. cümle "her sınıflandırma sistemi" diyerek tüm parçayı genel bir hükümle kapatır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  '(I) Kentlerdeki içme suyu boruları, elektrik kabloları ve atık su hatları toprağın altında kaldığı için günlük yaşamda neredeyse hiç fark edilmez. (II) Sorunsuz işledikleri sürece bu görünmez ağlar, kent bütçelerinde yeni park ya da meydan düzenlemeleri kadar ilgi çekmez. (III) Oysa eskiyen şebekelerde meydana gelen sızıntılar, arıtılmış suyun önemli bir bölümünün daha musluklara ulaşmadan kaybolmasına yol açmaktadır. (IV) Yenilenen enerji hatlarıysa özellikle fırtınalı günlerde yaşanan geniş çaplı kesintileri önlemenin temel koşuludur. (V) Son yıllarda pek çok belediye, su ve enerji ağlarını sensörlerle izleyerek arızaları büyümeden tespit etmeye başlamıştır.

Bu parça iki paragrafa bölünmek istense ikinci paragraf hangi cümleyle başlamalıdır?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":2}'::jsonb,
  'İlk iki cümle yerin altındaki altyapının görünmezliğini ve bütçelerde geri planda kalışını genel olarak ele alır. III. cümle ("Oysa") ise altyapının eskimesinden kaynaklanan somut sızıntı ve kesinti sorunları ile izleme çözümlerine geçer; bu nedenle ikinci paragraf III. cümleyle başlamalıdır.',
  'V. cümle belediyelerin sensör uygulamasına değindiği için bölünme noktası gibi görünebilir; ancak o cümle III. ve IV. cümlelerde ortaya konulan sızıntı ve kesinti riskine karşı geliştirilen tekil önlemi anlatmaktadır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Kulağımıza bir deniz kabuğu yaklaştırdığımızda duyduğumuz uğultunun, kabuğun içine hapsolmuş okyanus sesi olduğu söylenir. Gerçekte ise kabuğun kıvrımlı iç yüzeyi, odadaki konuşmalardan rüzgâr uğultusuna kadar çevredeki zayıf sesleri toplayıp belirli frekansları güçlendirir. Tıpkı boş bir cam şişenin ağzına üflendiğinde sesin yankılanması gibi, kabuk da bulunduğu ortamın gürültüsünü rezonans yoluyla belirginleştirir.

Bu parçada yazar, düşüncesini geliştirirken aşağıdakilerden hangisinden yararlanmıştır?',
  '{"options":["Tanık gösterme","Sayısal verilerden yararlanma","Tanımlama","Benzetme","Öyküleme"],"correctIndex":3}'::jsonb,
  'Yazar, deniz kabuğunun çevredeki sesleri güçlendirmesini "Tıpkı boş bir cam şişenin ağzına üflendiğinde sesin yankılanması gibi" ifadesiyle cam şişe örneğine benzeterek somutlaştırmıştır.',
  'Boş cam şişe ifadesi bir örnek gibi okunabileceği için aday örnekleme arayabilir; ancak seçeneklerde benzetme yer almakta ve "Tıpkı ... gibi" yapısı doğrudan benzetme ilişkisi kurmaktadır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  3,
  '(I) Uzaktan çalışma modeli, çalışanlara ulaşım süresinden tasarruf etme ve çalışma saatlerini esnetme olanağı tanımaktadır.
(II) Ancak aynı çalışma düzeni, ekip içi yüz yüze iletişimi azalttığı için kurum aidiyetinin zayıflamasına yol açabilmektedir.

Bu iki cümlede ifade edilenlerin anlamca doğru bir biçimde birleştirilmiş hâli aşağıdakilerden hangisidir?',
  '{"options":["Ulaşım süresinden tasarruf sağlayan uzaktan çalışma modeli, ekip içi yüz yüze iletişimi artırmasına karşın kurum aidiyetini zayıflatmaktadır.","Uzaktan çalışma ulaşım süresinden tasarruf ve esnek saatler sağlarken yüz yüze iletişimi azaltıp aidiyeti zayıflatabilir.","Ekip içi iletişimi azaltarak kurum aidiyetini zayıflatan uzaktan çalışma modeli, çalışanların ulaşım giderlerini artırıp saatlerini kısıtlamaktadır.","Çalışma saatlerini esnetmek için uygulanan uzaktan çalışma modeli, yüz yüze iletişimi azalttığından ulaşım süresinden sağlanan tasarrufu ortadan kaldırmaktadır.","Kurum aidiyetini güçlendirmek amacıyla tercih edilen uzaktan çalışma modeli, çalışanların esnek saatlere uyum sağlamasını önemli ölçüde zorlaştırmaktadır."],"correctIndex":1}'::jsonb,
  'Doğru birleştirme, birinci cümledeki her iki olumlu yönü (ulaşım süresinden tasarruf ve esnek saatler) ile ikinci cümledeki olumsuz olasılığı (yüz yüze iletişimin azalmasına bağlı aidiyet zayıflaması) anlam eklemeden ya da değiştirmeden bir araya getirir.',
  'Diğer seçeneklerde "aidiyeti güçlendirmek", "iletişimi artırmak" veya "tasarrufu ortadan kaldırmak" gibi metinde bulunmayan ya da ters anlamlı yargılar yer almaktadır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  3,
  '"Bir alanda gerçekten yetkinleşen kişiler, basit soruları karmaşık terimlerle süslemek yerine karmaşık meseleleri yalın biçimde açıklayabilenlerdir."

Bu cümleyle anlamca en yakın cümle aşağıdakilerden hangisidir?',
  '{"options":["Karmaşık meseleleri anlamak için okuyucunun çok sayıda teknik terim öğrenip sözlüklere başvurması gerekir.","Uzmanlığın ölçüsü, kolay konuları ağırlaştırmak değil güç konuları anlaşılır kılmaktır.","Basit konular yalın bir dille anlatıldığında bilimsel değerini ve okuyucu üzerindeki etkisini hızla yitirir.","Teknik terimler kullanmadan karmaşık bir konuyu açıklamak çoğu zaman yanıltıcı ve eksik sonuçlar doğurur.","Bir konuyu ne kadar süslü ve karmaşık bir dille aktarırsanız uzmanlığınız da o ölçüde kabul görür."],"correctIndex":1}'::jsonb,
  'Kökteki cümle, gerçek yetkinliği basit olanı terimle ağırlaştırmakta değil, karmaşık olanı yalın anlatmakta görür; doğru seçenek bu karşıtlığı "kolay konuları ağır dille anlatmak değil, güç konuları anlaşılır kılmak" biçiminde karşılar.',
  'Süslü ve teknik terimli anlatımın uzmanlık göstergesi sayılması yaygın bir önyargı olduğundan aday terim öğrenmeyi ya da süslü anlatımı öne çıkaran şıklara yönelebilir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  3,
  '"Bir romanı ikinci kez okuduğumuzda değişen şey sayfalardaki sözcükler değil, o sayfalarla karşılaşan kendi yaşam birikimimizdir."

Bu cümleden aşağıdaki yargılardan hangisine ulaşılamaz?',
  '{"options":["Okurun yaşantısı değiştikçe aynı metinden çıkardığı anlam da belirgin biçimde farklılaşabilir.","Metindeki sözcükler aynı kalsa da okuma deneyimi okurun geçirdiği değişime bağlı olarak yenilenebilir.","Bir yapıtı yeniden okumak, okurun önceki ve sonraki bakışı arasındaki farkı açıkça görünür kılar.","İkinci kez okunan romanın bıraktığı etki, yazarın sonraki baskılarda yaptığı değişikliklerden doğar.","Okuma eylemi, basılı metin ile okurun kendi yaşam birikimi arasındaki etkileşimden sürekli beslenir."],"correctIndex":3}'::jsonb,
  'Cümle, ikinci okumada değişen şeyin sayfalardaki sözcükler değil okurun kendi birikimi olduğunu açıkça söyler. Bu nedenle etkinin yazarın sonraki baskılarda yaptığı değişikliklerden doğduğu yargısı cümleyle çelişir.',
  'Okumada "değişen şey" ifadesi fiziksel bir değişiklik beklentisi uyandırabilir; ancak cümle sayfalardaki sözcüklerin değişmediğini belirterek değişimi okurun birikimine bağlar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  3,
  '"Yeni kurulan kent içi raylı sistem, günlük yolcu sayısını hızla artırdığı hâlde aynı güzergâhtaki özel araç trafiğini beklenen ölçüde azaltmadı."

Bu cümleden aşağıdakilerden hangisi kesin olarak çıkarılabilir?',
  '{"options":["Raylı sistemin bilet ücretleri, özel araç kullanım giderlerinden daha yüksek düzeyde kalmıştır.","Özel araç sürücülerinin çoğu yeni açılan raylı sistem güzergâhından henüz haberdar değildir.","Yolcu sayısı artsa da özel araç kullanımındaki azalma umulan düzeyde olmamıştır.","Raylı sistem hattı açıldıktan sonra kentteki özel araç sayısı önceki yıla göre iki katına çıkmıştır.","Özel araç trafiğini azaltmanın en etkili yolu toplu taşıma seferlerini geçici olarak durdurmaktır."],"correctIndex":2}'::jsonb,
  'Cümlede yolcu sayısının arttığı ama özel araç trafiğinin "beklenen ölçüde" azalmadığı verilmektedir. Bu bilgiden kesin olarak yalnızca yolcu artışına karşın özel araç azalmasının umulan düzeyde kalmadığı çıkarılabilir; ücret, farkındalık ya da iki kat artış gibi ek nedenler metinde yoktur.',
  'Aday gerçek hayattan hareketle bilet ücretlerinin yüksekliği ya da sürücülerin habersizliği gibi akla yatkın nedenleri cümleden çıkıyormuş gibi görebilir; oysa kesin çıkarım sorularında yalnızca cümlede verilenle sınırlı kalınır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde yargı gerekçesiyle birlikte verilmemiştir?',
  '{"options":["Yollar yoğun kar yağışı nedeniyle kapandığı için sabahki seferler iptal edildi.","Yeni yayımlanan roman, akıcı dili ve sürükleyici kurgusuyla kısa sürede çok satıldı.","Hafta sonu yapılacak geziye katılmak üzere öğrenciler okul bahçesinde toplandı.","Elektrik kesintisi yüzünden bilgisayarındaki çalışmayı zamanında kaydedemedi.","Doğal kaynaklar hızla tükendiğinden geri dönüşüm uygulamalarına ağırlık veriliyor."],"correctIndex":2}'::jsonb,
  '"Hafta sonu yapılacak geziye katılmak üzere öğrenciler okul bahçesinde toplandı." cümlesinde toplanmanın nedeni değil, henüz gerçekleşmemiş bir hedef olan amacı ("katılmak üzere") bildirilmiştir. Diğer dört cümlede ise gerçekleşmiş bir gerekçe ("kapandığı için, kurgusuyla, kesintisi yüzünden, tükendiğinden") yer almaktadır.',
  'Amaç bildiren "-mek üzere" yapısı neden-sonuç ilişkisiyle sıkça karıştırılır. "Ne amaçla?" sorusuna yanıt veren cümlede henüz gerçekleşmiş bir gerekçe değil, gelecekteki bir hedef söz konusudur.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerin hangisinde gerçekleşmemiş bir beklenti söz konusudur?',
  '{"options":["Yıllardır görmediği arkadaşını karşı kaldırımda görünce büyük bir heyecanla el salladı.","Toplantının sonunda söz alıp uzun süredir üzerinde çalıştığı ayrıntılı raporu sundu.","Bu özenli hazırlıktan sonra projenin ilk aşamada onaylanacağını sanıyordum; ne var ki öyle olmadı.","Dün akşamki yağmurdan sonra bahçedeki rengârenk çiçeklerin tamamı yeniden canlandı.","Yarın hava açık olursa sahil boyunca arkadaşlarla uzun süre bisiklet sürmeyi planlıyoruz."],"correctIndex":2}'::jsonb,
  '"Bu kadar özenli bir hazırlıktan sonra projenin ilk aşamada onaylanacağını sanıyordum; ne var ki öyle olmadı." cümlesinde konuşmacı, geçmişte böyle bir beklenti içinde olduğunu ve umduğu onaylamanın gerçekleşmediğini açıkça belirtmektedir. Diğer cümlelerde sırasıyla gerçekleşmiş olaylar ve geleceğe dönük bir plan vardır.',
  'Geleceğe yönelik plan bildiren "planlıyoruz" cümlesi de henüz gerçekleşmemiş bir durumu anlattığı için beklenti gibi görünebilir; ancak "gerçekleşmemiş beklenti" geçmişte umulan fakat sonuçsuz kalan bir durumu ifade eder.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerden hangisi anlamca diğerlerinden farklıdır?',
  '{"options":["Zorluklarla karşılaşmadan elde edilen başarı, kişiye uzun vadede gerçek bir deneyim kazandırmaz.","İnsanı olgunlaştıran asıl şey, sorunsuz bir yol yürümek değil, engelleri aşmayı öğrenmektir.","Çaba ve mücadele içermeyen bir kazanç, kişisel gelişim açısından kalıcı bir iz bırakmaz.","Bireyin güçlenmesi, yaşamı boyunca karşısına çıkan güçlüklerle baş edebilme sürecinde gerçekleşir.","İnsan, yalnızca engelsiz ve elverişli koşullarda gerçek potansiyelini ortaya koyar."],"correctIndex":4}'::jsonb,
  'Dört cümle zorlukların ve engellerin insanı olgunlaştırıp geliştirdiğini savunmaktadır. "İnsan, yalnızca hiçbir engelle karşılaşmadığı elverişli koşullarda gerçek potansiyelini ortaya koyar." cümlesi ise gelişimi tam tersine engelsiz ve sorunsuz ortama bağlamaktadır.',
  'Seçeneklerin hepsi "başarı, gelişim, engel, zorluk" sözcüklerini barındırdığı için ilk bakışta aynı doğrultuda görünebilir; cümlelerin engellere olumlu mu olumsuz mu baktığına dikkat edilmelidir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Yazım Kuralları',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerin hangisinde yazım yanlışı yoktur?',
  '{"options":["Toplantı öncesinde gerekli herşey eksiksiz biçimde masaya yerleştirildi.","Bu konuda hiç bir somut kanıt bulunamadığı için inceleme kapatıldı.","Sürücü, yolun sağındaki uyarı levhasını ne yazık ki çok geç farketti.","Herhangi bir aksilik çıkmazsa yarın sabah erkenden yola çıkacağız.","Ne kadar anlatmaya çalışsam da yinede aynı hatayı tekrarlıyorsun."],"correctIndex":3}'::jsonb,
  '"Herhangi", "bir" ve "yarın sabah" sözcüklerinin yazımı doğrudur; "Herhangi bir aksilik çıkmazsa yarın sabah erkenden yola çıkacağız." cümlesinde yazım yanlışı yoktur. Diğer cümlelerde "her şey" ayrı, "hiçbir" bitişik, "fark etti" ayrı ve "yine de" ayrı yazılmalıdır.',
  '"Herhangi" sözcüğünün bitişik yazılması bazen "her şey" gibi ayrı sanılabilmektedir; oysa "herhangi" bitişik, "her şey" ise daima ayrı yazılır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Yazım Kuralları',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerin hangisinde bir yazım yanlışı vardır?',
  '{"options":["Toplantı tutanakları, TDK''nin güncel yazım kuralları esas alınarak düzenlendi.","Araştırma raporu, TÜBİTAK''ın desteğiyle yürütülen proje kapsamında hazırlandı.","Yeni kanun teklifi, TBMM''de yapılan görüşmelerin ardından kabul edildi.","Geçen yaz İstanbul''dan İzmir''e giderken pek çok tarihî yeri gezdik.","Cumhuriyet, 29 Ekim 1923''de ilan edilerek yeni bir dönemi başlattı."],"correctIndex":4}'::jsonb,
  '"1923" sayısı sert ünsüz ("ç" — üç) ile bittiği için getirilen bulunma hâl eki ünsüz benzeşmesine uyarak "-te" biçiminde yazılmalıdır: "1923''te" ("1923''de" yanlıştır). Diğer cümlelerde "TÜBİTAK''ın", "TBMM''de", "TDK''nin", "İstanbul''dan" ve "pek çok" kullanımlarının tamamı doğrudur.',
  '"TDK''nin" yazımı günlük dilde yaygın olan "Te-De-Ka" telaffuzu yüzünden yanlış sanılabilir; oysa "K" harfi "ke" okunduğu için "TDK''nin" doğrudur. Hata ise sayı sonundaki sert ünsüze uymayan "1923''de" ekindedir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Yazım Kuralları',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde "de" ya da "ki"nin yazımıyla ilgili bir yanlışlık vardır?',
  '{"options":["Masadaki dosyaların arasında aradığın belgeyi de kolayca bulabilirsin.","Seninki kadar düzenli tutulan bir not defterini uzun zamandır görmemiştim.","Madem ki bu kadar yolu geldin, oturup biraz dinlenmeden gitme.","Sanki bütün konuşulanları önceden biliyormuş gibi sessizce gülümsedi.","Duydum ki gelecek ay yapılacak sempozyumda sen de bildiri sunacakmışsın."],"correctIndex":2}'::jsonb,
  'Kalıplaşarak bitişik yazılan bağlaçlardan biri olan "mademki" sözcüğü bitişik yazılır; "Madem ki" biçiminde ayrı yazılması yanlıştır. Diğer cümlelerde sıfat yapan "-ki" ("masadaki"), ilgi zamiri "-ki" ("seninki"), kalıplaşmış "sanki" ve ayrı yazılan bağlaçlar ("duydum ki", "sen de") doğrudur.',
  '"Duydum ki" cümlesindeki bağlaç olan "ki" ile kalıplaşmış "mademki" bağlacı aynı kurala tabi sanılabilir; ancak "sanki, oysaki, mademki, halbuki, çünkü" gibi kalıplaşmış örnekler daima bitişik yazılır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Yazım Kuralları',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerin hangisinde birleşik fiillerin yazımıyla ilgili bir yanlışlık yoktur?',
  '{"options":["Yeni öneriyi en ince ayrıntısına kadar incelemeden hemen red etti.","Söylediklerime hiç kulak asmadan eşyalarını toplayıp evi terketti.","Yolcular, yüksek dağların arasından süzülen akarsuyu hayranlıkla seyir etti.","Bu kadar küçük bir gecikmenin önemli bir soruna yol açacağını zan etti.","Uzun süren tartışmaların ardından herkesin ortak kararını kabul etti."],"correctIndex":4}'::jsonb,
  'Yardımcı fiille kurulan birleşik fiillerde ünlü düşmesi veya ünsüz türemesi yoksa ayrı yazılır: "kabul etti" ve "terk etti" ayrı yazılmalıdır ("terketti" yanlıştır). Ses olayı bulunan "seyretti", "zannetti" ve "reddetti" ise bitişik yazılmalıdır.',
  '"Kabul etti" ile "terketti" benzer yapıda görünse de ikisinde de ses olayı bulunmadığından ayrı yazılması gerekir; buna karşılık ünsüz türemesi ve ünlü düşmesi görülen "reddetti, zannetti, seyretti" mutlaka bitişik yazılır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Noktalama İşaretleri',
  'multiple_choice',
  3,
  'Başarılı bir sunum için üç temel unsur gerekir(I) Açık bir amaç(II) dinleyiciyi tanıyan bir dil ve düzenli bir akış(III) Peki, bütün bunları bir araya getirmek neden bu kadar zor görünür(IV) Çünkü çoğu konuşmacı, içeriği hazırlamaya ayırdığı özeni sunumun düzenine ayırmaz(V)

Bu parçada numaralanmış yerlere sırasıyla aşağıdaki noktalama işaretlerinden hangileri getirilmelidir?',
  '{"options":["(.) (,) (.) (!) (.)","(;) (,) (.) (?) (.)","(:) (;) (.) (?) (...)","(:) (,) (...) (.) (.)","(:) (,) (.) (?) (.)"],"correctIndex":4}'::jsonb,
  '(I) numaralı yerden sonra "üç temel unsur" sayılacağı ve "Açık" büyük harfle başladığı için iki nokta (:) gelir. (II) numaralı yer eş görevli unsurları sıraladığı için virgül (,), üç unsur da eksiksiz sayıldığından (III) numaralı yer nokta (.) ile biter. (IV) numaralı yer soru cümlesi sonu olduğu için soru işareti (?), (V) numaralı yer ise tamamlanmış cümle sonu olduğu için nokta (.) alır.',
  '"Üç temel unsur" ifadesinin ardından sayılan maddeler tamamlanmamış gibi düşünülerek (III) numaralı yere üç nokta konulabilir; ancak sayının baştan "üç" olarak verilip üçünün de yazılması cümleyi nokta ile bitirmeyi gerektirir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Noktalama İşaretleri',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerin hangisinde noktalı virgül (;) yerinde kullanılmıştır?',
  '{"options":["Bu zorlu görevi başarmak için tek bir koşul var; her gün düzenli çalışmak.","Dün akşam; yoğun işlerimi bitirdikten sonra evde erkenden dinlendim.","Masadaki kitapları; sırayla büyük raflara yerleştirip odayı güzelce topladı.","Yarın hava beklenenden güzel olursa; sahile inip uzun bir yürüyüş yaparız.","Pazardan elma, armut; manavdan ise ıspanak, marul aldık."],"correctIndex":4}'::jsonb,
  'Ögeleri arasında virgül bulunan grupları ya da sıralı cümleleri birbirinden ayırmak için noktalı virgül kullanılır ("Pazardan elma, armut; manavdan ise ıspanak, marul aldık."). Diğer cümlelerde özneden veya belirtili nesneden sonra, şart kipinden sonra ya da açıklama öncesinde (iki nokta gerekirken) noktalı virgül yanlış kullanılmıştır.',
  '"Bu zorlu görevi başarmak için tek bir koşul var..." cümlesinde açıklama yapılacağı için noktalı virgül konabileceği sanılabilir; oysa açıklama ve örnek bildiren cümlelerden önce iki nokta kullanılır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Noktalama İşaretleri',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerin hangisinde kesme işareti yanlış kullanılmıştır?',
  '{"options":["Van Gölü''nün çevresindeki tarihî yapılar her mevsim çok sayıda ziyaretçi çekiyor.","Ankara''dan kalkan hızlı tren, öğle saatlerinde kalabalık Eskişehir Garı''na ulaştı.","Ahmet''in masanın üzerine bıraktığı kalın not defteri hâlâ aynı yerde duruyordu.","Cumhuriyet''in ilk yıllarında eğitim ve kültür alanında oldukça köklü adımlar atıldı.","Türk Dil Kurumu''nun sözlüğü her yıl yeni sözcüklerle güncellenir."],"correctIndex":4}'::jsonb,
  'Kurum, kuruluş, kurul, birleşim, oturum ve iş yeri adlarına gelen ekler kesme işaretiyle ayrılmaz; bu nedenle "Türk Dil Kurumu''nun" yazımı yanlıştır, doğrusu "Türk Dil Kurumunun" olmalıdır. Özel kişi, il, göl ve dönem/olay adlarına gelen çekim ekleri ise kesmeyle ayrılır.',
  '"Van Gölü''nün" ve "Cumhuriyet''in" gibi büyük harfli özel adlarda kesme işareti kullanıldığı için kurum adlarında da kullanılacağı sanılır; ancak kurum ve kuruluş adlarına getirilen ekler kesmeyle ayrılmaz.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Noktalama İşaretleri',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde iki nokta (:) yanlış kullanılmıştır?',
  '{"options":["Sabah erkenden: evden çıkıp köşedeki durağa doğru hızlıca yürüdü.","Başarılı bir ekip çalışması için şunlar gerekir: açık iletişim, güven ve sorumluluk.","Öğretmen tahtaya şu cümleyi yazdı: \"Bilgi paylaşıldıkça çoğalır.\"","Çantamda üç şey eksikti: defter, kalem ve su şişesi.","Kütüphaneden çıkarken görevli sordu: \"Kitapların süresini uzatacak mısınız?\""],"correctIndex":0}'::jsonb,
  '"Sabah erkenden: evden çıkıp..." cümlesinde zaman zarfından sonra herhangi bir açıklama, örnek ya da aktarma yapılmamaktadır; cümle akışı içine iki nokta konması yanlıştır. Diğer cümlelerde iki nokta sıralama ve aktarma öncesinde doğru kullanılmıştır.',
  'Cümle içinde virgüle benzer bir duraklama verilmek istendiğinde iki nokta kullanabileceği yanılgısına düşülebilir; ancak iki nokta yalnızca açıklama, örnek verme veya alıntı yapma öncesinde kullanılır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Noktalama İşaretleri',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde virgül, diğerlerinden farklı bir görevde kullanılmıştır?',
  '{"options":["Masada yeni alınmış kalemler, renkli defterler ve kalın klasörler yan yana duruyordu.","Bahçedeki yaşlı, görkemli, gölgeli çınar ağacının altında uzun süre keyifle oturduk.","Babam pazardan taze elma, sulu armut ve tatlı üzüm seçerek eve getirdi.","Mahallemizin yaşlı çınarı, tam otuz yıllık komşumuz, geçen kış kurudu.","Genç araştırmacı düzenli, sabırlı, titiz çalışmalarıyla kurumda herkesin dikkatini çekti."],"correctIndex":3}'::jsonb,
  '"Mahallemizin yaşlı çınarı, tam otuz yıllık komşumuz, geçen kış kurudu." cümlesinde virgüller ara sözü ("tam otuz yıllık komşumuz") cümleden ayırmak için kullanılmıştır. Diğer dört cümlede ise virgül eş görevli sözcük ve sözcük gruplarını sıralamaktadır.',
  '"Bu eski mahalleyi, doğup büyüdüğüm sokakları..." ifadesi art arda sıralanmış iki nesne gibi görünebilir; ancak ikinci ifade ayrı bir nesne değil, ilk nesneyi açıklayan ara sözdür.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Anlatım Bozuklukları',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerin hangisinde çatı uyuşmazlığından kaynaklanan bir anlatım bozukluğu vardır?',
  '{"options":["Toplantı tutanakları özenle hazırlayıp müdürün onayına sunuldu.","Bütün belgeler imzalandıktan sonra dosya arşive kaldırıldı.","Öğrenciler sınavı tamamladıktan sonra bahçeye çıkarak dinlendi.","Yeni alınan kitaplar kategorilere ayrılıp raflara yerleştirildi.","Yazar, son romanını tamamladıktan sonra yeni bir öykü kitabına başladı."],"correctIndex":0}'::jsonb,
  '"Toplantı tutanakları özenle hazırlayıp müdürün onayına sunuldu." cümlesinde "hazırlayıp" zarf-fiili etken çatılı iken "sunuldu" yüklemi edilgen çatılıdır. Her iki fiilin de edilgen olması için "hazırlanıp ... sunuldu" biçiminde düzeltilmelidir.',
  'Diğer cümlelerde de birden fazla fiil veya fiilimsi bulunmaktadır ("ayrılıp yerleştirildi", "tamamladıktan sonra başladı"); ancak onlarda etken-etken ya da edilgen-edilgen uyumu korunmuştur.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Anlatım Bozuklukları',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde özne-yüklem uyumsuzluğu vardır?',
  '{"options":["Sen ve kardeşin, hafta sonu düzenlenecek doğa gezisine katılmalısınız.","Arkadaşlarımla ben, gelecek ayki serginin afişlerini hazırladılar.","Bütün öğrenciler, öğretmenin verdiği dönem projesini zamanında teslim etti.","Kuşlar bahar gelince yeniden gökyüzünde neşeyle uçuşmaya başladı.","Siz ve ekibiniz, bu zorlu çalışmayı büyük bir başarıyla tamamladınız."],"correctIndex":1}'::jsonb,
  '"Arkadaşlarımla ben" öznesi "biz" (1. çoğul kişi) anlamına gelir; bu nedenle yüklemin "hazırladık" olması gerekirken 3. çoğul kişi ekiyle "hazırladılar" biçiminde çekimlenmesi özne-yüklem kişi uyumsuzluğu yaratmıştır.',
  '"Sen ve kardeşin" ya da "Siz ve ekibiniz" özneleri birden çok kişi içerdiği için yüklemin 2. çoğul kişiye göre çekimlenmesi doğrudur; hata "ben"in bulunduğu öznede 1. çoğul yerine 3. çoğul kullanılmasındadır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Anlatım Bozuklukları',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerin hangisinde öge eksikliğinden kaynaklanan bir anlatım bozukluğu vardır?',
  '{"options":["Yeni yayımlanan romanı çok beğendim ama henüz arkadaşlarıma söz etmedim.","Sabahki ders çok verimli geçtiği için bütün öğrenciler konuyu iyice kavradı.","Çocuklar parkta uzun süre oynadıktan sonra eve dönüp yemeklerini yedi.","Yönetici, çalışanların önerilerini tek tek dinleyip toplantı notlarına ekledi.","Eski mahallemize gittiğimizde çocukluk arkadaşlarımızla uzun uzun sohbet ettik."],"correctIndex":0}'::jsonb,
  '"Yeni yayımlanan romanı çok beğendim ama henüz arkadaşlarıma söz etmedim." cümlesinde "beğendim" fiili belirtili nesne ("romanı") alırken "söz etmedim" fiili dolaylı tümleç ("ondan") ister. İkinci cümleye "ondan" dolaylı tümleci eklenmelidir.',
  '"Dinleyip toplantı notlarına ekledi" cümlesinde de iki yüklem aynı tümlece ("önerilerini") bağlandığı için hata aranabilir; ancak hem "dinlemek" hem "eklemek" belirtili nesne alabildiği için o cümle doğrudur.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Anlatım Bozuklukları',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde gereksiz sözcük kullanımından kaynaklanan bir anlatım bozukluğu vardır?',
  '{"options":["Uzak şehirlerdeki iki dost, yıllarca birbirleriyle karşılıklı mektuplaştı.","Sabah saatlerinde başlayan şiddetli yağış akşamüstü yerini serin bir rüzgâra bıraktı.","Kütüphanedeki görevliler, yeni gelen kaynakları kısa sürede kayda geçirdi.","Toplantıda alınan kararların önümüzdeki hafta uygulamaya konulacağı duyuruldu.","Sınav öncesinde bütün konuları düzenli biçimde tekrar ederek eksiklerini kapattı."],"correctIndex":0}'::jsonb,
  '"Mektuplaşmak" fiili "-ş" işteşlik ekiyle zaten karşılıklı yapılan bir eylemi bildirir; bu nedenle cümlede ayrıca "karşılıklı" sözcüğünün kullanılması gereksiz sözcük tekrarıdır.',
  '"Birbirleriyle" sözcüğü de işteşlik çağrışımı taşısa da "karşılıklı" sözcüğü doğrudan "mektuplaşmak" fiilinin anlamını yinelediği için gereksiz kullanımı oluşturmaktadır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Anlatım Bozuklukları',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerin hangisinde sözcüğün yanlış anlamda kullanılmasından kaynaklanan bir anlatım bozukluğu vardır?',
  '{"options":["Mağazadaki ürünlerin fiyatları bu yıl oldukça pahalı olduğu için satışlar azaldı.","Yoğun trafik yüzünden toplantıya katılacak konukların bir kısmı salona geç ulaştı.","Uzun süren kuraklık nedeniyle bölgedeki tarımsal verim geçen yıla göre düştü.","Araştırmacılar, elde edilen bulguları yeni bir rapor hâlinde kamuoyuyla paylaştı.","Deneyimli mimar, eski konağın özgün dokusunu koruyarak onarım planı hazırladı."],"correctIndex":0}'::jsonb,
  '"Fiyat" kavramı pahalı ya da ucuz olmaz; "yüksek" ya da "düşük" olur (pahalı ya da ucuz olan ürünün kendisidir). Bu nedenle "fiyatları ... pahalı" ifadesinde sözcük yanlış anlamda kullanılmıştır; doğrusu "fiyatları ... yüksek" olmalıdır.',
  'Günlük konuşmada "fiyatlar pahalı" ifadesi yaygın olarak kullanıldığı için kulağa doğal gelir; bu durum sözcük anlamı hatasının gözden kaçmasına yol açar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Anlatım Bozuklukları',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerin hangisinde özne eksikliğinden kaynaklanan bir anlatım bozukluğu vardır?',
  '{"options":["Romanın dili akıcıydı ama son bölümlere doğru gereksiz yere uzatılmıştı.","Kış mevsimi erken bastırınca dağ köylerine giden yollar ulaşıma kapandı.","Hafta sonu düzenlenen büyük kitap fuarına binlerce okur yoğun ilgi gösterdi.","Yeni kurulan laboratuvarda öğrenciler haftada iki gün deney yapabiliyor.","Konferans salonundaki ses sistemi yenilenince konuşmacılar daha net duyuldu."],"correctIndex":0}'::jsonb,
  'İlk cümlenin öznesi "Romanın dili"dir; ikinci cümlede ise gereksiz yere uzatılan şey "roman"dır ("roman son bölümlere doğru gereksiz yere uzatılmıştı"). İkinci cümlede özne ("roman") eksik bırakıldığı için bozukluk doğmuştur.',
  '"Romanın dili" tamlamasının içinde "roman" sözcüğü geçtiği için zihin ikinci cümlenin öznesini kendiliğinden tamamlar; ancak tamlayan konumundaki sözcük doğrudan ikinci yüklemin öznesi olamaz.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Ses Bilgisi ve Ses Olayları',
  'multiple_choice',
  3,
  'Aşağıdaki sözcüklerden hangisi ünlüyle başlayan bir ek aldığında ünsüz yumuşamasına uğramaz?',
  '{"options":["kitap","ağaç","hukuk","kanat","renk"],"correctIndex":2}'::jsonb,
  'Türkçede sonu "p, ç, t, k" sert ünsüzleriyle biten sözcüklerin çoğu ünlüyle başlayan ek aldığında yumuşar ("kitabı", "ağacı", "kanadı", "rengi"). Ancak bazı tek heceli ve Arapça kökenli sözcüklerde ünsüz yumuşamasına aykırılık görülür: "hukuk" sözcüğü ünlüyle başlayan ek aldığında "hukuku" biçiminde kalır, yumuşamaz.',
  '"Renk" sözcüğünde sondaki "k" harfi "g"ye ("rengi") dönüştüğü için aday bunun "ğ" olmaması nedeniyle yumuşamadığını sanabilir; oysa "nk" kümesindeki "k → g" değişimi ünsüz yumuşamasıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Ses Bilgisi ve Ses Olayları',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerin hangisinde ünlü düşmesine uğramış birden fazla sözcük vardır?',
  '{"options":["Sabahleyin erkenden kalkıp şehrin geniş meydanına doğru yürüdü.","Küçük çocuğun omzuna hafifçe dokunup alnından sevgiyle öptü.","Eski dostunun adını duyunca gönlü bir anda ferahlayıp rahatladı.","Karanlık koridorda yürürken soğuktan birdenbire burnu sızladı.","Bu yılki sınavda aklı karışan aday soruyu boş bırakmayı tercih etti."],"correctIndex":1}'::jsonb,
  '"Küçük çocuğun omzuna hafifçe dokunup alnından sevgiyle öptü." cümlesinde hem "omuz → omzuna" hem de "alın → alnından" sözcüklerinde ikinci hece ünlüsü düşmüştür (iki sözcük). Diğer cümlelerde ise sırasıyla yalnızca birer sözcükte ("şehrin", "gönlü", "burnu", "aklı") ünlü düşmesi vardır.',
  'Diğer şıkların tamamında en az bir ünlü düşmesi bulunduğu için aday ilk gördüğü ses olayını işaretleyebilir. Soru, aynı cümlede birden fazla ünlü düşmesi örneğini istemektedir.',
  array['lisans_gygk']::text[],
  'lisans'
);
