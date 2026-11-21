-- ==========================================================================
-- KADRO SORU HAVUZU · KPSS GY Türkçe · PARAGRAF PARTİSİ 7 (30 soru, zorluk 2-3) · SUPABASE SQL
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
  'Kelebekler, yumurtadan çıktıktan sonra önce tırtıl, sonra koza, en sonunda da kanatlı birey olarak yaşam döngüsünü tamamlar. Her evre, farklı bir beslenme biçimini ve farklı bir yaşam alanını gerektirir. Bu dönüşüm, aynı canlının yaşamı boyunca birbirinden çok farklı iki ayrı yaşam sürmesine olanak tanır.

Bu parçaya en uygun başlık aşağıdakilerden hangisidir?',
  '{"options":["Tırtılların Beslenme Alışkanlıkları","Böceklerin Göç Yolları","Kelebeklerin Yaşam Döngüsü","Kanatlı Canlıların Uçuş Teknikleri","Kozaların Doğadaki Rolü"],"correctIndex":2}'::jsonb,
  'Parça, kelebeğin yumurtadan kanatlı bireye kadar geçirdiği evreleri anlatır; en uygun başlık yaşam döngüsüdür.',
  'Parçada tırtıl ve koza ayrı ayrı anıldığı için aday bunlardan biriyle ilgili bir başlığı seçebilir. Oysa hepsi döngünün evreleridir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Yağmur ormanları, yeryüzünün küçük bir bölümünü kaplamasına karşın bilinen canlı türlerinin büyük bir kısmına ev sahipliği yapar. Ağaçlar, yağışı yapraklarıyla tutup yavaşça toprağa bırakır; toprak ise çürüyen yaprakların besinini hızla geri dönüştürür. Bu denge bozulup ağaçlar kesildiğinde, topraktaki besin kısa sürede yağmurla yıkanır ve orman kendini yenileyemez.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Yağmur ormanlarının sürekliliği, ağaçlar ile toprağın birbirine bağlı dengesine dayanır.","Yağmur ormanları yalnızca yağmurun bol olduğu yerlerde yaşar.","Ormanlar kesildikten sonra toprak daha verimli hâle gelir.","Canlı türleri, ağaç sayısından bağımsız olarak çoğalır.","Çürüyen yapraklar toprağa zarar verir."],"correctIndex":0}'::jsonb,
  'Yazar, ormanın ağaçların yağışı tutması ve toprağın besini geri dönüştürmesiyle ayakta kaldığını, bu denge bozulunca ormanın yenilenemediğini söyler.',
  'İlk cümlede canlı çeşitliliği öne çıktığı için aday bunu ana düşünce sanabilir. Oysa yazar asıl konuyu ağaç-toprak dengesi olarak ele alır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Buhar makinesinin icadından önce taşımacılık ve üretim, insan ve hayvan gücüne dayanıyordu. Kömürle ısıtılan suyun buharı, bir pistonu iterek makineleri çalıştırdığında fabrikalar nehir kıyılarından bağımsız kurulabilir hâle geldi. Bu gelişme, yalnızca üretimi hızlandırmakla kalmadı; kentlerin büyümesini de tetikledi.

Bu parçadan aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Buhar makinesi, fabrikaların konumunu değiştirmiştir.","Buhar makinesinden önce üretim büyük ölçüde makinelere dayanıyordu.","Buharın gücü, bir pistonu hareket ettirerek kullanılmıştır.","Buhar makinesi kentlerin büyümesini tetiklemiştir.","Buhar makinesinden önce insan ve hayvan gücü kullanılıyordu."],"correctIndex":1}'::jsonb,
  'Parça, buhar makinesinden önce üretimin insan ve hayvan gücüne dayandığını söyler. Makinelere dayandığı yargısı parçayla çelişir.',
  '"Makineleri çalıştırdığında" ifadesi, öncesinde de makinelerin varlığını düşündürebilir. Oysa parça öncesini insan ve hayvan gücüyle sınırlar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Vitaminler, vücudun az miktarda ihtiyaç duyduğu ama kendisinin üretemediği maddelerdir. ....... Çünkü yetersiz alındıklarında yorgunluk, bağışıklık zayıflığı ve gelişim sorunları ortaya çıkabilir.

Bu parçada boş bırakılan yere düşüncenin akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["Vitaminler, vücutta kendiliğinden üretilebilir.","Fazla vitamin almak her zaman yararlıdır.","Yorgunluk yalnızca vitamin eksikliğinden kaynaklanır.","Bu nedenle dengeli bir beslenme, vitaminlerin düzenli alınmasını sağlamanın temel yoludur.","Bağışıklık sisteminin vitaminlerle ilgisi yoktur."],"correctIndex":3}'::jsonb,
  'Boşluktan sonraki "Çünkü" cümlesi, vitamin eksikliğinin yol açtığı sorunları sayar. Bu gerekçeyi, vitaminlerin düzenli alınmasını sağlayan dengeli beslenmenin önemini belirten cümle taşır.',
  '"Az miktarda ihtiyaç duyulur" ifadesi, fazlasının yararlı olacağı gibi yanlış bir çıkarıma yol açabilir. Oysa parça düzenli ve yeterli alım üzerinedir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'I. Bu nedenle hava durumunu izlemek, çiftçiler için ekim zamanını belirlemenin temel adımıdır.
II. Tohumlar, belirli bir toprak sıcaklığına ulaşılmadan filizlenmez.
III. Toprak ısınmadan atılan tohumlar çürüyebilir ya da hiç çıkmayabilir.
IV. Don riski geçmeden ekilen fidelerse bir gecede zarar görebilir.
V. Çiftçiler bu yüzden ekimi, toprağın ve havanın uygun hâle geldiği döneme bırakır.

Bu cümlelerle anlamlı bir paragraf oluşturulduğunda baştan üçüncü cümle hangisi olur?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":2}'::jsonb,
  'Doğru sıra II - III - IV - V - I''dir. II tohumun koşulunu, III bu koşul sağlanmazsa olacakları, IV don riskini, V ("bu yüzden") çiftçilerin tutumunu anlatır; I ("Bu nedenle") sonucu verir. Baştan üçüncü cümle III.''tür.',
  'IV. cümle de sonuç bildirdiği için üçüncü sıraya uygun görünür. Ancak III''teki "Toprak ısınmadan" ifadesi II''ye doğrudan bağlıdır; IV ise yeni bir risk (don) ekler.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Kum fırtınaları, kuru ve bitki örtüsünün seyrek olduğu bölgelerde, güçlü rüzgârların toprağın üst katmanını kaldırmasıyla oluşur. Havaya karışan toz bulutları, yüzlerce kilometre öteye taşınabilir. Bu bulutlar, yayıldığı bölgelerde görüş mesafesini azaltır ve solunum yollarını tahriş eder.

Bu parçanın konusu aşağıdakilerden hangisidir?',
  '{"options":["Çöllerde yaşayan canlıların uyumu","Rüzgâr türbinlerinin çalışma ilkesi","Toprak erozyonunu önleme yöntemleri","Solunum hastalıklarının tedavisi","Kum fırtınalarının oluşumu ve etkileri"],"correctIndex":4}'::jsonb,
  'Parça, kum fırtınalarının nasıl oluştuğunu ve yayıldığı bölgelere etkisini anlatır.',
  'Parçada "solunum yolları" ve "toprak" geçtiği için aday erozyon ya da sağlık konularına yönelebilir. Oysa bunlar fırtınanın etkilerini anlatan ayrıntılardır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Özgüven, çoğu zaman başarıdan sonra gelen bir ödül gibi düşünülür. Oysa özgüven, küçük ama tekrarlanan denemelerin biriktirdiği bir güvendir: İnsan, bir işi yapabildiğini gördükçe ona dair inancı büyür. Bu yüzden özgüveni bekleyip sonra harekete geçmek yerine, küçük adımlarla harekete geçip özgüvenin ardından gelmesini beklemek daha gerçekçidir.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Özgüven, başarının tek ön koşuludur.","Özgüvensiz insanlar hiç denemez.","Özgüven, başarıdan önce değil, küçük denemelerin birikimiyle zamanla oluşur.","Küçük adımlar özgüveni azaltır.","Özgüven, doğuştan gelen bir özelliktir."],"correctIndex":2}'::jsonb,
  'Yazar, özgüvenin başarının ödülü sanıldığını ama küçük denemelerin birikimiyle oluştuğunu söyler.',
  'İlk cümlede özgüven başarıdan sonra gelir gibi gösterilir; aday bunu yazarın görüşü sanabilir. Oysa yazar "Oysa" ile bu anlayışı sorgular.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Ödül, bir davranışı pekiştirebilir; ancak her ödül aynı etkiyi doğurmaz. Çocuğa ödevini bitirdiği için verilen bir hediye, ödevin kendisinden alınan hazzın yerini alabilir ve hediye kalkınca çalışma isteği de kaybolabilir. Bu nedenle ödül, çabayı takdir eden bir geri bildirim olduğunda yararlı, çabanın yerine geçen bir pazarlık olduğunda zararlıdır.

Bu parçadaki son cümlenin işlevi aşağıdakilerden hangisidir?',
  '{"options":["Önceki yargılardan bir sonuç çıkarmak","Konunun tanımını yapmak","Önceki görüşü örnekle desteklemek","Önceki görüşe karşı çıkmak","Yeni bir konuya geçmek"],"correctIndex":0}'::jsonb,
  'Son cümle "Bu nedenle" ile başlar ve ödülün hangi durumda yararlı, hangisinde zararlı olduğuna dair sonuç çıkarır.',
  'Son cümlede iki durum karşılaştırıldığı için aday karşıtlık işlevi sanabilir. Oysa cümlenin ilişkisi önceki bilgiden çıkan bir sonuçtur.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Resmî yazışmalarda e-postanın konu satırı, alıcının mesajı açmadan önce içeriği tahmin etmesini sağlar. Açık ve kısa bir konu başlığı, mesajın doğru kişiye ulaşmasını ve doğru zamanda yanıtlanmasını kolaylaştırır. Mesajın sonunda ise gerekli eklerin belirtilmesi, alıcının eksik belgeyle zaman kaybetmesini önler.

Bu parçada aşağıdakilerden hangisine değinilmemiştir?',
  '{"options":["Konu satırının işlevine","Mesajın gönderim saatinin yanıt süresine etkisine","Kısa başlığın yanıt hızına katkısına","Eklerin belirtilmesinin yararına","Alıcının mesajı açmadan önce içeriği tahmin edebilmesine"],"correctIndex":1}'::jsonb,
  'Parçada konu satırı, kısa başlık ve eklerin belirtilmesi anlatılır. Gönderim saatine değinilmez.',
  'Yanıt süresinden söz edildiği için aday gönderim saatinin de ele alındığını sanabilir. Oysa metin yalnızca başlık ve eklerle ilgilidir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Bir ekonomik krizde insanlar harcamalarını kısar, işletmeler yatırımı durdurur ve bankalar kredi vermekte temkinli davranır. Bu davranışların her biri bireysel olarak akılcıdır; ancak hepsi birlikte yapıldığında talep düşer, işletmeler daha da zorlanır ve kriz derinleşir. Bu yüzden krizde herkesin doğru bildiği davranış, toplamda sorunu büyütebilir.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Kriz zamanlarında harcama yapmak her zaman zararlıdır.","Bankalar, krizlerin tek nedenidir.","İşletmelerin yatırımı durdurması krizi hafifletir.","Krizde bireysel olarak akılcı olan davranışlar, birlikte uygulandığında sorunu derinleştirebilir.","Talep düştüğünde işletmeler zorlanmaz."],"correctIndex":3}'::jsonb,
  'Yazar, krizde herkesin bireysel olarak akılcı davrandığını ama bunun toplamda talebi düşürüp krizi büyüttüğünü söyler.',
  '"Bireysel olarak akılcıdır" ifadesi, bu davranışların yararlı olduğu izlenimini verebilir. Oysa yazar toplam etkinin olumsuz olduğunu vurgular.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Ölçü birimleri, ilk çağlarda insan vücuduna dayanıyordu: karış, adım ve arşın gibi. Bu birimler pratikti; ancak kişiden kişiye değiştiği için ticarette anlaşmazlığa yol açıyordu. Bu nedenle toplumlar zamanla herkes için aynı olan standart birimlere yöneldi.

Bu parçadan aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["İlk ölçü birimleri insan vücuduna dayanıyordu.","Vücuda dayalı birimler kişiden kişiye değişebiliyordu.","Ölçü farkları ticarette anlaşmazlık doğurabiliyordu.","Zamanla standart birimlere yönelinmiştir.","İlk çağlarda kullanılan ölçü birimleri herkes için aynı değerdeydi."],"correctIndex":4}'::jsonb,
  'Parça, vücuda dayalı birimlerin kişiden kişiye değiştiğini söyler. Bu nedenle herkes için aynı değerde olduğu yargısı çıkarılamaz.',
  '"Pratikti" ifadesi bu birimlerin güvenilir olduğunu düşündürebilir. Oysa parça hemen ardından "ancak" ile bunun sakıncasını belirtir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  '(I) Sismograflar, yer sarsıntılarını kaydeden aygıtlardır. (II) İçlerindeki ağır bir kütle, sarsıntı sırasında sabit kalmaya çalışırken zemin hareket eder. (III) Bu hareket farkı, bir kâğıt ya da ekran üzerinde çizgi olarak görülür. (IV) Bir kütlenin atalet özelliği, Newton''un hareket yasalarından biriyle açıklanır. (V) Çizginin genliğine bakılarak sarsıntının şiddeti hakkında fikir edinilir.

Bu parçadaki numaralanmış cümlelerden hangisi düşüncenin akışını bozmaktadır?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":3}'::jsonb,
  'Parça, sismografın nasıl çalıştığını anlatır. IV. cümle ise ataletin Newton yasalarıyla açıklanmasına geçerek anlatım bütünlüğünü bozar.',
  'IV. cümle kütleden söz ettiği için II''yle ilişkili görünür. Ancak parçanın ekseni aygıtın işleyişidir; Newton yasaları bu bütünlüğün dışına çıkar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Geleneksel el sanatları, makine üretiminin yaygınlaştığı bir dünyada yok olmaya mahkûm görülür. Oysa el emeği, ürüne aynı şekilde yinelenemeyen bir özgünlük katar ve bu özgünlük, seri üretimin sunamadığı bir değer olarak talep görür. Asıl tehlike, el sanatlarının yok olması değil, onların yalnızca hatıralık bir ürüne indirgenmesidir.

Bu parçada yazarın el sanatlarına yönelik yaklaşımı aşağıdakilerden hangisidir?',
  '{"options":["El sanatlarının makine üretimi yüzünden kaçınılmaz olarak yok olacağını düşünmektedir.","Seri üretimin her yönüyle el sanatlarından üstün olduğunu savunmaktadır.","El sanatlarının değerini özgünlüğünde görmekte ve yalnızca hatıralığa indirgenmesinden kaygı duymaktadır.","El sanatlarının hatıralık ürün olarak satılmasını yeterli bulmaktadır.","El emeğinin ürüne bir değer katmadığını ileri sürmektedir."],"correctIndex":2}'::jsonb,
  'Yazar, el sanatlarının yok olacağı düşüncesini reddeder, özgünlüğünü değerli bulur ve hatıralığa indirgenmesinden kaygı duyar.',
  'İlk cümledeki "yok olmaya mahkûm görülür" ifadesi yazarın bu görüşü paylaştığı izlenimini verebilir. Oysa yazar bunu "Oysa" ile reddeder.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Mutluluğun paranın artmasıyla doğru orantılı arttığı düşünülür. Araştırmalar, temel ihtiyaçlar karşılandıktan sonra gelirin mutluluk üzerindeki etkisinin azaldığını gösteriyor. Bu noktadan sonra ilişkiler, anlamlı bir uğraş ve boş zaman, mutluluğu belirleyen etkenler hâline gelir.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Temel ihtiyaçlar karşılandıktan sonra mutluluğu belirleyen, gelirden çok ilişkiler ve anlamlı uğraşlardır.","Gelir arttıkça mutluluk her zaman artar.","Para, hiçbir koşulda mutluluğu etkilemez.","Boş zaman, mutluluğu azaltır.","İnsanlar yalnızca temel ihtiyaçlarıyla mutlu olur."],"correctIndex":0}'::jsonb,
  'Yazar, gelirin etkisinin belirli bir noktadan sonra azaldığını ve ilişkiler ile anlamlı uğraşın öne çıktığını söyler.',
  '"Para hiçbir koşulda etkilemez" şıkkı parçadaki "azalır" ifadesini uca taşır. Oysa yazar temel ihtiyaçlar için gelirin gerekli olduğunu kabul eder.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Dinlenmek, çoğu kişiye çalışmaktan çalınan zaman gibi görünür. ....... Çünkü zihin, yoğun bir çalışmanın ardından bilgiyi düzenlemek ve pekiştirmek için dinlenmeye ihtiyaç duyar; dinlenmeyen zihin, aynı sürede daha az iş çıkarır.

Bu parçada boş bırakılan yere düşüncenin akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["Bu nedenle dinlenmek, çalışmaktan daha önemlidir.","Oysa dinlenme, verimli çalışmanın bir parçası ve ön koşuludur.","Zihin, dinlenmeden de aynı verimle çalışabilir.","Çalışmak, dinlenmeye zaman bırakmamalıdır.","Yoğun çalışma zihnin pekiştirme ihtiyacını ortadan kaldırır."],"correctIndex":1}'::jsonb,
  'Boşluktan sonraki "Çünkü" cümlesi, zihnin dinlenmeyle bilgiyi pekiştirdiğini ve dinlenmeyenin verimsiz kaldığını söyler. Bu gerekçeyi, dinlenmenin çalışmanın bir parçası olduğunu belirten cümle taşır.',
  '"Dinlenmek çalışmaktan daha önemlidir" şıkkı vurguyu uca taşır. Oysa parça dinlenmeyi çalışmanın bir parçası olarak sunar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Bir dilde düşünmek, yalnızca o dilin sözcüklerini bilmekten ibaret değildir; o dilin sezgisel kalıplarına yerleşmeyi de gerektirir. Yeni bir dilde konuşurken sürekli ana dile çeviri yapan biri, akıcılığa ulaşamaz. Akıcılık, çeviriyi bırakıp doğrudan o dilin kalıplarıyla düşünebilme eşiğinin aşılmasıyla başlar.

Bu parçadan aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Bir dilde düşünmek, sözcük bilmenin ötesinde bir beceridir.","Sürekli çeviri yapan kişi akıcılığa ulaşamaz.","Akıcılık, doğrudan o dilin kalıplarıyla düşünmekle başlar.","Yabancı dilde akıcılık, ana dile çeviri yapıldıkça artar.","Dil kalıplarına yerleşmek akıcılık için gereklidir."],"correctIndex":3}'::jsonb,
  'Parça, sürekli çeviri yapan kişinin akıcılığa ulaşamadığını söyler. Bu nedenle çeviri arttıkça akıcılığın arttığı yargısı çıkarılamaz.',
  'Ana dile çeviri, yeni bir dili öğrenmede doğal görüldüğü için aday bunun akıcılığı artırdığını sanabilir. Oysa parça tam tersini söyler.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Okyanus akıntıları, rüzgârların ve suyun yoğunluk farklarının etkisiyle oluşur. Sıcak akıntılar, ekvator çevresindeki suyu kutuplara doğru taşıyarak kıyı bölgelerinin iklimini yumuşatır. Soğuk akıntılar ise tersine, kutuplardan gelen suyla kıyıları serinletir.

Bu parçada aşağıdakilerden hangisine değinilmemiştir?',
  '{"options":["Akıntıların oluşum nedenlerine","Sıcak akıntıların iklime etkisine","Soğuk akıntıların kıyıları serinletmesine","Rüzgârın akıntı oluşumundaki rolüne","Akıntıların balıkçılık faaliyetlerine etkisine"],"correctIndex":4}'::jsonb,
  'Parçada akıntıların oluşumu, sıcak ve soğuk akıntıların iklime etkisi anlatılır. Balıkçılığa değinilmez.',
  'Akıntılar denizcilikle ilişkilendirildiği için aday balıkçılıkla ilgili bir bilgi beklemiş olabilir. Oysa metinde balıkçılık geçmez.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'I. Bu nedenle yetişkin eğitimi programları, bu işi destekleyecek biçimde katılımcıların deneyimlerini ders içeriğine bağlar.
II. Yetişkinler, öğrenme sürecine yıllarca biriken bir birikimle gelir.
III. Bu birikim, yeni bilgilerin anlamlandırılmasında bir çıpa görevi görür.
IV. Ancak aynı birikim, yeni bir fikre karşı önyargı da oluşturabilir.
V. Bu yüzden eğitmenin işi, birikimi hem değerlendirmek hem de gerektiğinde sorgulatmaktır.

Bu cümlelerle anlamlı bir paragraf oluşturulduğunda baştan dördüncü cümle hangisi olur?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":4}'::jsonb,
  'Doğru sıra II - III - IV - V - I''dir. II yetişkinlerin birikimini, III bu birikimin yararını, IV ("Ancak") sakıncasını, V ("Bu yüzden") eğitmenin işini anlatır; I ("Bu nedenle") programların tutumunu bildirir. Baştan dördüncü cümle V.''tir.',
  'I. cümledeki "Bu nedenle" ifadesi cümleyi sona iter; ancak V''teki "Bu yüzden" bağı IV''ün ardından gelir. Aday dördüncü sırayı IV sanabilir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Hataları utanılacak şeyler olarak görmek, insanı yeni denemelerden uzaklaştırır. Oysa hata, öğrenmenin hammaddesidir: Neyin işe yaramadığını bilmeden neyin işe yarayacağını bulmak zordur. Bu nedenle bir hatayı örtmeye çalışmak, ondan öğrenme fırsatını da örtmek demektir.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Hata yapmamak, öğrenmenin tek yoludur.","Hatalar utanç verici olduğu için gizlenmelidir.","Hatalar, öğrenmenin doğal bir parçasıdır ve örtülmek yerine ondan ders alınmalıdır.","Hata yapan kişi yeni denemelerden kaçınmalıdır.","Neyin işe yaramadığını bilmek öğrenmeye engeldir."],"correctIndex":2}'::jsonb,
  'Yazar, hatayı öğrenmenin hammaddesi olarak görür ve örtmenin öğrenme fırsatını da yok ettiğini söyler.',
  'İlk cümledeki "utanılacak şeyler" ifadesi, hatanın gizlenmesini savunmak gibi okunabilir. Oysa yazar bunu "Oysa" ile reddeder.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Mekanik saatlerden önce zaman, Güneş''in gökyüzündeki yerine ya da su ve kum gibi akışkanların hızına göre ölçülüyordu. Bu yöntemler, bulutlu havada ya da gece kullanılamıyordu. Dişlilerle çalışan ilk mekanik saatler, zamanı hava durumundan bağımsız ölçmenin kapısını açtı.

Bu parçadaki son cümlenin işlevi aşağıdakilerden hangisidir?',
  '{"options":["Önceki yöntemlerin sınırlarına karşı yeni bir gelişmeyi belirtmek","Konunun tanımını yapmak","Önceki cümlelerdeki bilgiyi örnekle somutlaştırmak","Konuya karşıt bir görüş getirmek","Parçanın başka bir alana geçişini sağlamak"],"correctIndex":0}'::jsonb,
  'Son cümle, önceki yöntemlerin sınırlarını (bulutlu hava, gece) aşan mekanik saatleri tanıtır.',
  'Son cümle yeni bir bilgi içerdiği için aday konunun başka bir alana geçtiğini sanabilir. Oysa cümle aynı konuyu, yani zaman ölçümünü sürdürür.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Ekrana uzun süre bakan gözler, normalden daha az göz kırpar. Göz kırpma azaldığında gözyaşı tabakası kurur ve göz yorgunluğu başlar. Bu nedenle belirli aralıklarla uzağa bakmak ve bilinçli olarak göz kırpmak, yorgunluğu azaltmanın basit bir yoludur.

Bu parçanın konusu aşağıdakilerden hangisidir?',
  '{"options":["Gözün anatomik yapısı","Ekran kaynaklı göz yorgunluğunun nedeni ve önlenmesi","Gözlük kullanımının tarihi","Ekranların ışık şiddeti ayarları","Uyku düzeninin göz sağlığına etkisi"],"correctIndex":1}'::jsonb,
  'Parça, ekrana bakarken azalan göz kırpmanın yorgunluğa yol açtığını ve bunun önlenmesi için yapılabilecekleri anlatır.',
  'Parçada "gözyaşı tabakası" geçtiği için aday göz yapısıyla ilgili bir konu seçebilir. Oysa bu, yorgunluğun nedenini açıklayan bir ayrıntıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Kaldırımlar, yayaların kente eşit biçimde erişmesini sağlayan en temel kamusal yapılardan biridir. Ancak engelli yurttaşlar, yaşlılar ve bebek arabası taşıyanlar için kaldırımın bir basamakla kesilmesi, o yolun fiilen kapanması demektir. Bu nedenle bir kentin erişilebilirliği, ortalama kullanıcıya göre değil, en çok zorlanan kullanıcıya göre ölçülmelidir.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Kaldırımlar yalnızca sağlıklı yayalar için yapılmalıdır.","Basamaklar, kaldırımın erişilebilirliğini artırır.","Kentler yalnızca ortalama kullanıcıya göre tasarlanmalıdır.","Kentlerde erişilebilirlik, en çok zorlanan kullanıcı gözetilerek değerlendirilmelidir.","Engelli yurttaşların kente erişimi önemli değildir."],"correctIndex":3}'::jsonb,
  'Yazar, kaldırımdaki küçük bir engelin bazı kullanıcılar için yolu kapatabildiğini söyler ve erişilebilirliğin en çok zorlanana göre ölçülmesini önerir.',
  'İlk cümlede kaldırımın "eşit erişim" sağladığı söylendiği için aday bunun yeterli olduğunu sanabilir. Oysa yazar "Ancak" ile bunun herkes için geçerli olmadığını belirtir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Uzun mesafe koşucuları, bitiş çizgisine ulaşmak için yarışın tamamını düşünmez; çoğu zaman bir sonraki kilometreyi, hatta bir sonraki direği hedef alır. Büyük hedefi küçük parçalara bölmek, zihni yorgunluğa ve vazgeçme isteğine karşı korur. Aynı yöntem, uzun süreli projelerde çalışan herkes için de geçerlidir.

Bu parçada yazarın amacı aşağıdakilerden hangisidir?',
  '{"options":["Koşucuların yarış stratejisini tek tek anlatmak","Uzun mesafe koşusunu bırakmak gerektiğini savunmak","Büyük hedeflerin gerçekleştirilemeyeceğini ileri sürmek","Yorgunluğun her durumda önlenebileceğini kanıtlamak","Büyük hedeflere ulaşmada küçük parçalara bölerek ilerlemenin yararını göstermek"],"correctIndex":4}'::jsonb,
  'Yazar, koşucuların hedefi küçük parçalara böldüğünü anlatır ve bu yöntemin uzun projeler için de geçerli olduğunu söyler; amacı bu yöntemin yararını göstermektir.',
  'Parça koşuculara odaklandığı için aday amacın koşu stratejisi olduğunu sanabilir. Oysa son cümle yöntemi genel bir ilkeye taşır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Sınava hazırlanırken her gün birkaç saat çalışmak, hafta sonunda uzun ve aralıksız çalışmaktan daha etkilidir. Çünkü beyin, bilgiyi dağıtılmış tekrarlarla daha iyi saklar. Bu nedenle çalışma planı, konuları günlere bölen ve tekrar için zaman bırakan bir yapıda kurulmalıdır.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Sınav hazırlığında yalnızca hafta sonu çalışılmalıdır.","Tekrar yapmak bilgiyi kalıcı kılmaz.","Sınav hazırlığında bilgiyi kalıcı kılmak için çalışmayı günlere yaymak ve tekrar etmek gerekir.","Uzun ve aralıksız çalışma her zaman daha etkilidir.","Çalışma planı hazırlamak gereksizdir."],"correctIndex":2}'::jsonb,
  'Yazar, günlere yayılan çalışmanın uzun ve aralıksız çalışmaktan etkili olduğunu ve planın tekrar için zaman bırakması gerektiğini söyler.',
  '"Uzun ve aralıksız çalışma" ifadesi çok çalışmanın daha etkili olduğu izlenimini verebilir. Oysa yazar tam tersini söyler.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Şehir parkları, yalnızca yeşil bir dinlenme alanı değil, kentin sıcaklığını düşüren ve yağmur suyunu emen doğal bir altyapıdır. Çevresindeki yapıların yoğun olduğu bölgelerde bir parkın bile sıcaklık farkını belirgin biçimde azalttığı ölçülmüştür. Parkların küçük ve dağınık olması bile, kent bütününe yayılan bir serinlik sağlar.

Bu parçadan aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Parklar yalnızca dinlenme alanı olarak işlev görür.","Parklar, kentin sıcaklığını düşürebilir.","Parklar, yağmur suyunu emebilir.","Küçük parklar bile serinlik etkisi yaratabilir.","Yoğun yapılaşmış bölgelerde park sıcaklığı azaltabilir."],"correctIndex":0}'::jsonb,
  'Parça, parkların yalnızca dinlenme alanı olmadığını, sıcaklığı düşürdüğünü ve suyu emdiğini söyler. Bu nedenle yalnızca dinlenme alanı olduğu yargısı çıkarılamaz.',
  '"Yeşil bir dinlenme alanı" ifadesi parkın tek işlevi gibi okunabilir. Oysa "yalnızca ... değil" ifadesi bunu açıkça reddeder.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Karıncalar, yiyecek bulduklarında yuvaya dönerken yere kokulu bir iz bırakır. Diğer karıncalar bu izi takip eder ve izi daha da güçlendirir; böylece yiyeceğe giden yol kısa sürede belirginleşir. Hiçbir karıncanın bütünü görmediği bu sistem, bireysel bir yönetici olmaksızın, toplu bir zekâ gibi çalışır.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Karıncaların her biri yolun tamamını görür.","Karıncalar, iz bırakma yoluyla merkezî bir yönetim olmadan eşgüdümlü hareket eder.","Koku izi, karıncaların birbirinden kaçmasına yol açar.","Karınca kolonileri bir yönetici tarafından yönlendirilir.","Yiyecek bulan karınca iz bırakmaz."],"correctIndex":1}'::jsonb,
  'Yazar, karıncaların bıraktığı koku izinin yolu belirginleştirdiğini ve sistemin bir yönetici olmadan toplu bir zekâ gibi çalıştığını söyler.',
  '"Toplu zekâ" ifadesi merkezî bir yönetici çağrışımı yaptığı için aday yönetim şıkkını seçebilir. Oysa yazar yönetici olmadığını açıkça belirtir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Bir ders kitabının yazarı, konuyu anlatırken yalnızca doğru bilgiyi vermekle kalmaz; hangi sırayla, hangi örneklerle ve hangi dille anlatacağını da seçer. Aynı konu, farklı bir sırayla ya da farklı örneklerle anlatıldığında okurda farklı bir kavrayış bırakabilir. Bu yüzden iyi bir ders kitabı, bilgiyle birlikte öğrenmenin yolunu da tasarlar.

Bu parçaya en uygun başlık aşağıdakilerden hangisidir?',
  '{"options":["Ders Kitaplarının Basım Tarihi","Öğrencilerin Okuma Alışkanlıkları","Yazarların Yaşam Öyküleri","İyi Bir Ders Kitabının Öğrenmeyi Biçimlendirmedeki Rolü","Ders Kitabı Seçiminde Fiyatın Önemi"],"correctIndex":3}'::jsonb,
  'Parça, ders kitabının yalnızca bilgi vermekle kalmayıp anlatım sırası ve örnekleriyle öğrenmeyi de biçimlendirdiğini anlatır.',
  'Parçada okur ve yazar geçtiği için aday okuma alışkanlıkları ya da yazar yaşamıyla ilgili bir başlığa yönelebilir. Oysa asıl konu kitabın öğrenmeye etkisidir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  '(I) Bazı insanlar, başkalarının sözünü kesmeyi tartışmada ilgi göstermenin bir işareti sayar. (II) Oysa söz kesmek, karşıdakine dinlenmediği izlenimi verir ve düşüncesini tamamlamasını engeller. (III) Gerçek ilgi, karşıdakinin cümlesini bitirmesine izin verip sonra yanıt vermektir.

Bu parçadaki II. cümlenin işlevi aşağıdakilerden hangisidir?',
  '{"options":["Önceki cümleyi örnekle somutlaştırmak","Parçanın sonucunu bildirmek","Konunun tanımını yapmak","Konuyu başka bir alana taşımak","Önceki cümledeki yaygın düşünceye karşı bir görüş ortaya koymak"],"correctIndex":4}'::jsonb,
  'II. cümle, "Oysa" ile başlar ve I. cümledeki düşünceye (söz kesmek ilgi göstergesidir) karşı bir görüş getirir.',
  'II. cümle bir olumsuzlama içerdiği için aday sonuç sanabilir. Oysa sonuç, son cümlede ("Gerçek ilgi...") verilir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Bir ülkenin su kaynaklarını yönetirken yalnızca bugünkü ihtiyaç değil, gelecekteki talep de hesaba katılmalıdır. ....... Çünkü bugün yeterli görünen bir rezerv, nüfus ve sanayi büyüdükçe birkaç on yıl içinde yetersiz kalabilir.

Bu parçada boş bırakılan yere düşüncenin akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["Bu nedenle su yönetimi, kısa vadeli bir tüketim planından çok uzun vadeli bir koruma stratejisi olarak ele alınmalıdır.","Su kaynakları her zaman yeterli olacaktır.","Gelecekteki talebin hesaba katılması gereksizdir.","Nüfus artışı su ihtiyacını azaltır.","Sanayi büyümesi su talebini etkilemez."],"correctIndex":0}'::jsonb,
  'Boşluktan sonraki "Çünkü" cümlesi, bugünkü rezervin gelecekte yetersiz kalabileceğini söyler. Bu gerekçeyi, su yönetiminin uzun vadeli bir koruma stratejisi olması gerektiğini belirten cümle taşır.',
  'İlk cümlede "bugünkü ihtiyaç" vurgusu olduğu için aday kısa vadeli çözümleri savunan şıkka yönelebilir. Oysa "Çünkü" cümlesi gelecekteki yetersizliği anlatır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Sabahın erken saatinde bahçeye çıktı. Kovayı çeşmenin altına tutup suyu doldurduktan sonra fidanları tek tek sulamaya başladı. Son fidanı da suladığında güneş yeni yeni doğuyordu.

Bu parçada ağır basan anlatım biçimi aşağıdakilerden hangisidir?',
  '{"options":["Betimleyici anlatım","Öyküleyici anlatım","Açıklayıcı anlatım","Tartışmacı anlatım","Anlatım biçimlerinden hiçbiri ağır basmamaktadır."],"correctIndex":1}'::jsonb,
  'Parçada olaylar zaman sırasıyla anlatılır (bahçeye çıkmak, kovayı doldurmak, fidanları sulamak); bu, öyküleyici anlatımdır.',
  '"Güneş yeni yeni doğuyordu" ifadesi görsel bir ayrıntı olduğu için aday betimleme sanabilir. Oysa parçanın ağırlığı olayların art arda gelişidir.',
  array['lisans_gygk']::text[],
  'lisans'
);
