-- ==========================================================================
-- KADRO SORU HAVUZU · KPSS GY Türkçe · KALAN TÜM SORULAR (566 soru) · SUPABASE SQL
-- 00_tum_turkce_sorulari_tek_dosya.sql (109 soru) ZATEN yüklüyse bunu tek seferde çalıştır. 00_ ve 01-11 dosyalarını TEKRAR çalıştırma.
-- exam_scopes: lisans_gygk · education_level: lisans · Tek INSERT: hata olursa hiçbiri eklenmez (atomik).
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
  'Cümlede Anlam',
  'multiple_choice',
  2,
  '"Başarı, çoğu zaman yeteneğin değil, vazgeçmeyenin payına düşer."

Bu cümleyle anlamca en yakın cümle aşağıdakilerden hangisidir?',
  '{"options":["Yeteneksiz insanlar hiçbir zaman başarılı olamaz.","Vazgeçen kişiler daima yetenekli kişilerdir.","Başarıya ulaşmada belirleyici olan, yetenekten çok yılmadan sürdürülen çabadır.","Yeteneği olan herkes başarıya ulaşır.","Başarı yalnızca şansa bağlıdır."],"correctIndex":2}'::jsonb,
  'Cümle, başarıda yetenekten çok vazgeçmemenin etkili olduğunu söyler. Doğru şık bu düşünceyi korur.',
  '"Yeteneğin değil" ifadesi yetenekle ilgili uç yargıları (yeteneksizler başarılı olamaz) çağrıştırır. Oysa cümle yeteneği yadsımaz, yalnızca çabayı öne çıkarır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  '"Bir şeyi anlayıp anlamadığımızı en iyi, onu başkasına açıklamaya çalıştığımızda görürüz."

Bu cümleyle anlamca en yakın cümle aşağıdakilerden hangisidir?',
  '{"options":["Bir konuyu başkasına anlatmaya çalışmak, o konuyu ne kadar kavradığımızı gösterir.","Bir konuyu anlamak için başkalarına soru sormak gerekir.","Başkasına anlatılabilen her konu doğru anlaşılmıştır.","Açıklamak, anlamaktan her zaman daha kolaydır.","Sınavlar, anlama düzeyini ölçmek için yetersizdir."],"correctIndex":0}'::jsonb,
  'Cümle, anlamanın en iyi sınavının açıklama olduğunu söyler; doğru şık bunu başka sözcüklerle tekrarlar.',
  '"Başkasına anlatılabilen her konu doğru anlaşılmıştır" şıkkı cümleye yakın görünür, ancak "her" ifadesiyle kesin bir yargı ekler. Cümle yalnızca anlamanın görülme yolunu anlatır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  '"Ormanların azalması, yalnızca ağaç sayısını değil, o ağaçlara bağlı pek çok canlının yaşam alanını da yok ediyor."

Bu cümleden aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Ormansızlaşma, canlıları olumsuz etkiler.","Ormanlar yok olsa bile canlıların yaşam alanları etkilenmez.","Ağaçlara bağlı olarak yaşayan canlılar vardır.","Ormanların azalması birden çok sonuç doğurur.","Yaşam alanlarının yitirilmesi, ormansızlaşmanın sonuçlarından biridir."],"correctIndex":1}'::jsonb,
  'Cümle, ormanların azalmasıyla canlıların yaşam alanlarının yok olduğunu söyler. Bu nedenle yaşam alanlarının etkilenmediği yargısı cümleyle çelişir.',
  'Cümlede "yalnızca ağaç sayısını değil" ifadesi geçtiği için aday ağaçla canlı arasındaki ilişkiyi tersten okuyabilir. Oysa cümle bu ilişkiyi güçlü biçimde kurar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde eylemin amacı belirtilmemiştir?',
  '{"options":["Sınava hazırlanmak için kütüphaneye gitti.","Sağlıklı kalmak amacıyla her sabah yürüyor.","Çocuk, annesine sarılarak ağlamaya başladı.","Misafirleri karşılamak üzere kapıya yöneldi.","Daha iyi görmek için öne doğru eğildi."],"correctIndex":2}'::jsonb,
  'Doğru şıkta sarılma ve ağlama eylemleri art arda anlatılır; bir hedef bildirilmez. Diğer cümlelerde eylemin amacı açıkça verilmiştir.',
  '"Sarılarak" ifadesi bir yöntem gibi görünebilir, bu yüzden aday amaç aramaya yönelebilir. Oysa burada eylemin bir hedefi değil, yapılış biçimi vardır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde bir karşılaştırma yapılmamıştır?',
  '{"options":["Bu mahallede yaşayan insanlar çok misafirperverdir.","Bu yılki hasat, geçen yıldan daha verimliydi.","Kardeşi, ağabeyi kadar çalışkandır.","Yeni telefon, eskisine göre çok daha hafif.","Bu ders, diğerlerinin en zorudur."],"correctIndex":0}'::jsonb,
  'İlk cümlede bir niteleme vardır ama iki varlık ya da durum birbiriyle kıyaslanmaz. Diğer cümlelerde "daha, kadar, göre, en" ifadeleriyle karşılaştırma yapılmıştır.',
  '"Çok" sözcüğü derece bildirdiği için karşılaştırma sanılabilir. Karşılaştırma için bir ölçüt olacak ikinci bir varlık ya da durum gerekir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde öznel bir yargı vardır?',
  '{"options":["Dünya, Güneş''in çevresinde bir yılda tam bir dönüş yapar.","Bu şehrin en huzurlu yeri, kuşkusuz sahil yolunun sonundaki küçük koydur.","Bu köprü, 1973 yılında hizmete açıldı.","Su, deniz seviyesinde yüz derecede kaynar.","Kütüphane, hafta içi dokuzda açılır."],"correctIndex":1}'::jsonb,
  '"En huzurlu yer" ifadesi kişisel bir değerlendirmedir; herkes için aynı olmayabilir. Diğer cümleler doğrulanabilir bilgi verir.',
  '"Kuşkusuz" sözcüğü yargıya kesinlik katar; aday bunu nesnel sanabilir. Ancak yargının kendisi kişisel beğeniye dayanır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerden hangisi nesnel bir yargı içerir?',
  '{"options":["Bu kentin havası, her şehirden daha temizdir.","Bu mahalle, şehrin en güzel yeridir.","Buradaki insanlar en sıcakkanlı insanlardır.","Bu kentin nüfusu son on yılda yüzde on beş arttı.","Bu konser, hayatımın en güzel gecesiydi."],"correctIndex":3}'::jsonb,
  'Nüfus artışı sayısal olarak doğrulanabilir; bu nedenle yargı nesneldir. Diğer cümleler kişisel beğeniyi yansıtır.',
  '"En temiz" gibi kesin görünen ifadeler nesnellik izlenimi verir. Oysa ölçüt belirtilmediği için bunlar da kişisel değerlendirmedir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  '"Ağaç yaşken eğilir." atasözüyle anlamca en yakın cümle aşağıdakilerden hangisidir?',
  '{"options":["Ağaçlar, ancak yaşlandıklarında verimli olur.","Çocukların eğitimi yalnızca okulda tamamlanır.","Yaşlı insanlar, genç insanlardan daha esnektir.","Eğilen ağaçlar daha sağlam büyür.","Çocukluk yıllarında kazanılan alışkanlıkların sonradan değiştirilmesi zordur."],"correctIndex":4}'::jsonb,
  'Atasözü, eğitimin ve alışkanlıkların küçük yaşta kazandırılması gerektiğini, büyüdükçe değişimin zorlaştığını söyler.',
  '"Eğilen ağaçlar daha sağlam büyür" şıkkı, atasözündeki sözcükleri kullandığı için çeldiricidir. Oysa atasözü eğilmenin sağlamlıkla ilgisini değil, yaşken eğilmenin kolaylığını anlatır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  '"Hiçbir çaba boşa gitmez."

Bu cümleyle anlamca en yakın cümle aşağıdakilerden hangisidir?',
  '{"options":["Çabasız hiçbir şey kazanılamaz.","Çabalar bazen sonuçsuz kalır.","Her çabanın bir karşılığı vardır.","Boşa giden çabalar da vardır.","Çaba harcamayan kimse kaybetmez."],"correctIndex":2}'::jsonb,
  '"Hiçbir çaba boşa gitmez" demek, her çabanın bir sonuç ya da karşılık getirdiğini söylemektir.',
  '"Çabasız hiçbir şey kazanılamaz" şıkkı çabayı öne çıkardığı için benzer görünür. Ancak bu yargı kazanmanın koşulunu söyler; kökteki cümle ise çabaların hepsinin değerli olduğunu bildirir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  3,
  '"Yeterince uyumayan biri, gün boyunca dikkatini toplamakta zorlanır."

Bu cümleden aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Yeterince uyuyan herkes gün boyu dikkatini mutlaka toplayabilir.","Uykusuzluk dikkati etkileyebilir.","Dikkat, uyku düzeniyle ilişkilidir.","Uyku, günlük performansı etkileyen etkenlerden biridir.","Dikkat sorunlarının nedenlerinden biri yetersiz uykudur."],"correctIndex":0}'::jsonb,
  'Cümle yalnızca yetersiz uykunun dikkati zorlaştırdığını söyler. Yeterince uyuyan herkesin mutlaka dikkatini toplayacağı yargısı bundan çıkarılamaz.',
  'Cümleyi tersine çevirmek kolay görünür: "uyumazsa zorlanır" ise "uyursa zorlanmaz". Ancak bu çıkarım mantıken geçerli değildir; dikkat başka nedenlerle de bozulabilir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  '"Bilen biri, bildiğini göstermek için acele etmez."

Bu cümleyle anlamca en yakın cümle aşağıdakilerden hangisidir?',
  '{"options":["Bilen kişi, bildiklerini kimseyle paylaşmaz.","Bilgili kişi, bilgisini kanıtlama telaşına kapılmaz.","Acele edenler her zaman bilgisizdir.","Bilgisini gösteren kişi daima acelecidir.","Bilgi sahibi kişiler her zaman sessiz kalır."],"correctIndex":1}'::jsonb,
  'Cümle, bilgili kişinin bilgisini göstermek için telaş etmediğini söyler. Doğru şık bu düşünceyi korur.',
  '"Acele edenler bilgisizdir" şıkkı, cümledeki "bilen" ve "acele" sözcüklerini ters yönde bağladığı için çeldiricidir. Oysa cümle bilgili kişinin telaşsızlığından söz eder.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  'Okuma alışkanlığı, bir gecede kazanılacak bir davranış değildir; .......

Bu cümlenin devamına aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["bu nedenle kitap okumaktan vazgeçilmelidir.","yalnızca çocuklukta kazanılabilir.","pahalı kitaplar almayı gerektirir.","küçük ama düzenli adımlarla zamanla yerleşen bir alışkanlıktır.","herkes için aynı sürede oluşur."],"correctIndex":3}'::jsonb,
  'Cümlenin ilk yarısı alışkanlığın bir gecede kazanılmadığını söyler. Devamı, bu alışkanlığın zamanla ve düzenli adımlarla oluştuğunu belirtmelidir.',
  '"Bu nedenle vazgeçilmelidir" şıkkı olumsuz bir sonuç sunar; ancak ilk yarı bir engeli değil, alışkanlığın doğasını anlatır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  'Bir ülkenin gelişmişlik düzeyi yalnızca ....... ölçülmez; eğitimden sağlığa, adaletten çevreye pek çok alandaki yaşam kalitesi de bu ölçüme dâhildir.

Bu cümlede boş bırakılan yere aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["nüfus yoğunluğuyla","yüzölçümüyle","coğrafi konumuyla","tarihsel mirasıyla","kişi başına düşen gelirle"],"correctIndex":4}'::jsonb,
  'Cümle, gelişmişliğin yalnızca tek bir ölçütle değerlendirilmediğini söyler; devamında eğitim, sağlık, adalet ve çevre gibi başka ölçütler sayılır. Bu bağlamda en uygun ifade gelirdir.',
  'Diğer şıklar da ülkeye ilişkin ölçütlerdir ve cümleye uyar gibi görünür. Ancak gelişmişlik tartışmalarında yaygın olarak tek ölçüt sanılan şey gelirdir ve cümle bunu genişletir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  '"Hiçbir sınav öğrencinin bütün yeteneklerini ölçemez; ancak iyi tasarlanmış bir sınav, belirli becerileri güvenilir biçimde ölçebilir."

Bu cümleden aşağıdakilerden hangisi çıkarılabilir?',
  '{"options":["Sınavlar, öğrencilerin tüm yeteneklerini ortaya koyar.","İyi tasarlanmış bir sınav her yeteneği ölçebilir.","İyi tasarlanmış sınavlar, belirli becerileri ölçmede yararlı olabilir.","Sınavların hiçbiri güvenilir değildir.","Belirli becerileri ölçmek, sınavların amacı değildir."],"correctIndex":2}'::jsonb,
  'Cümle, sınavların bütün yetenekleri ölçemediğini ama iyi tasarlanmış olanın belirli becerileri güvenilir ölçebildiğini söyler. Bu nedenle doğru şık, bu ikinci yargının sonucudur.',
  '"Hiçbir sınav..." ifadesi sınavlara karşı genel bir olumsuzluk çağrıştırdığı için aday tüm sınavların güvenilmez olduğunu sanabilir. Oysa "ancak" ile başlayan ikinci yarı bu yargıyı sınırlar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  '"Bir bitki, ihtiyaç duyduğundan fazla sulandığında kökleri çürümeye başlar; bu yüzden bahçıvanlar sulama sıklığını bitkinin türüne göre ayarlar."

Bu cümleden aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Bütün bitkiler aynı sıklıkta sulanmalıdır.","Fazla sulama bitkiye zarar verebilir.","Sulama sıklığı bitki türüne göre değişebilir.","Bahçıvanlar sulamayı bilinçli biçimde yönetir.","Aşırı su, köklerde çürümeye yol açabilir."],"correctIndex":0}'::jsonb,
  'Cümle, sulama sıklığının bitkinin türüne göre ayarlandığını söyler. Bu nedenle bütün bitkilerin aynı sıklıkta sulanması gerektiği yargısı cümleyle çelişir.',
  'Fazla sulamanın zararı vurgulandığı için aday tek bir sulama düzeninin doğru olduğunu düşünebilir. Oysa "bitkinin türüne göre" ifadesi bunu açıkça reddeder.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde sınırlama (yalnızca, ancak) anlamı vardır?',
  '{"options":["Bu işi deneyimli bir usta da başarabilir.","Bu işi ancak deneyimli bir usta başarabilir.","Bu işi başarmak için usta olmak gerekmez.","Deneyimli usta bu işi başaramaz.","Bu işi deneyimli usta mı başarır?"],"correctIndex":1}'::jsonb,
  '"Ancak" sözcüğü, işi yalnızca deneyimli ustanın başarabileceğini belirtir. Diğer cümlelerde bu sınırlama yoktur.',
  'Bütün cümleler "usta" ve "başarmak" sözcüklerini taşıdığı için aday anlam farklarını gözden kaçırabilir. Sınırlama anlamı yalnızca "ancak" ile kurulur.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde, anlatılan durumun gerçekleşmediği ima edilmektedir?',
  '{"options":["Zamanında çıktık ve treni yakaladık.","Yarın zamanında çıkarsak treni yakalarız.","Zamanında çıkmak için erkenden kalktık.","Keşke zamanında çıksaydık da treni kaçırmasaydık.","Treni kaçırmamak amacıyla acele ettik."],"correctIndex":3}'::jsonb,
  '"Keşke ... saydık" yapısı, dilenen durumun gerçekleşmediğini, trenin kaçırıldığını ima eder. Diğer cümlelerde durum gerçekleşmiş ya da henüz belli değildir.',
  '"Yarın zamanında çıkarsak" ifadesi de bir koşul bildirir, ancak henüz gerçekleşmemiş bir olasılığı anlatır. "Keşke" yapısı ise geçmişteki bir eksikliğe işaret eder.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde abartma vardır?',
  '{"options":["Çantayı iki saat taşıdığım için kollarım yoruldu.","Çanta oldukça ağırdı.","Çantayı taşırken biraz zorlandım.","Çantadaki kitapları yavaş yavaş dağıttım.","Bu çantayı taşımaktan kollarım kopacaktı."],"correctIndex":4}'::jsonb,
  'Kolların kopması gerçekte mümkün değildir; yorgunluğu büyütmek için kullanılmıştır. Diğer cümleler gerçekçi bir anlatımdır.',
  '"Oldukça ağırdı" gibi derece bildiren ifadeler abartı sanılabilir. Abartıda gerçek olamayacak ölçüde büyütme bulunur.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  '"Dürüstlük, yalnızca doğruyu söylemek değil, doğruyu söylemenin bedelini de göze almaktır."

Bu cümleyle anlamca en yakın cümle aşağıdakilerden hangisidir?',
  '{"options":["Dürüst olmak, bedeli ne olursa olsun susmaktır.","Doğruyu söylemek, dürüstlüğün tek koşuludur.","Dürüst olmak, doğruyu söylerken doğacak sonuçlara katlanmayı da gerektirir.","Bedel ödemek, dürüstlüğü anlamsız kılar.","Dürüst kişiler doğruyu söylemekten kaçınır."],"correctIndex":2}'::jsonb,
  'Cümle, dürüstlüğün yalnızca doğruyu söylemekle sınırlı olmadığını, bedelini üstlenmeyi de içerdiğini söyler. Doğru şık bu düşünceyi korur.',
  '"Doğruyu söylemek tek koşuldur" şıkkı cümledeki "yalnızca ... değil" ifadesinin tersidir. Aday cümleyi hızlı okursa iki yargıyı karıştırabilir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  3,
  '"Bu kitabın dili, öncekilere göre daha sade; ama sadeliği, düşüncenin derinliğini azaltmamış."

Bu cümleden aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Kitabın sade dili, düşüncelerin yüzeysel kalmasına yol açmıştır.","Kitap, öncekilerden daha sade bir dille yazılmıştır.","Sadelik, kitabın düşünce derinliğini azaltmamıştır.","Kitabın dili, önceki kitapların dilinden farklıdır.","Düşüncenin derinliği kitapta korunmuştur."],"correctIndex":0}'::jsonb,
  'Cümle, sadeliğin düşünce derinliğini azaltmadığını söyler. Bu nedenle düşüncelerin yüzeysel kaldığı yargısı cümleyle çelişir.',
  '"Daha sade" ifadesi sadeliğin yüzeysellikle ilişkilendirilmesini çağrıştırır. Oysa cümle "ama" ile bu ilişkiyi açıkça reddeder.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde zaman anlamı vardır?',
  '{"options":["Hava soğuk olduğu için montumu giydim.","Kapıyı açar açmaz içeri doluştular.","Başarılı olmak istiyorsan çalışmalısın.","Yorgun olduğu hâlde işi bitirdi.","Işıklar söndüğü için herkes sustu."],"correctIndex":1}'::jsonb,
  '"Açar açmaz" yapısı, iki eylemin art arda gerçekleştiğini bildirir; zaman anlamı taşır. Diğer cümlelerde neden, koşul ve karşıtlık vardır.',
  '"Işıklar söndüğü için herkes sustu" cümlesinde eylemler art arda gerçekleşir; bu nedenle zaman sanılabilir. Ancak "için" bağlacı ilişkiyi neden olarak kurar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde karşıtlık (-e rağmen) anlamı vardır?',
  '{"options":["Çok çalıştığı için istediği sonucu aldı.","Çok çalışırsan istediğin sonucu alırsın.","Çok çalışmak için erken yattı.","Çok çalıştığı hâlde istediği sonucu alamadı.","Çok çalışınca başarıyı yakaladı."],"correctIndex":3}'::jsonb,
  '"Hâlde" yapısı, çalışmaya rağmen beklenen sonucun alınamadığını bildirir; bu karşıtlıktır. Diğer cümlelerde neden, koşul, amaç ve zaman vardır.',
  'Bütün cümleler "çok çalışmak" ile başladığı için aday karşıtlığı gözden kaçırabilir. Sonucun beklenenin tersi olduğu tek cümle doğru şıktır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde önce genel bir yargı, ardından bir örnek verilmiştir?',
  '{"options":["Ayılar kışı uyuyarak geçirir, çünkü besin bulamazlar.","Kış geldiğinde hayvanların çoğu göç eder.","Ayılar, kışın bir mağarada uyuyakalır.","Hayvanların kışa hazırlanması aylar sürer.","Bazı hayvanlar kışı uyuyarak geçirir; ayılar bunun en bilinen örneğidir."],"correctIndex":4}'::jsonb,
  'Doğru şık önce genel bir yargı verir (bazı hayvanlar kışı uyuyarak geçirir), ardından ayıyı örnek gösterir.',
  '"Ayılar kışı uyuyarak geçirir, çünkü besin bulamazlar" cümlesinde de ayı geçer; aday örnek sanabilir. Ancak orada genel bir yargı yoktur, yalnızca neden bildirilir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde bir öneri ya da öğüt yoktur?',
  '{"options":["Sınava çalışırken düzenli molalar vermelisin.","Bu konuyu bir uzmana danışsan iyi olur.","Bu bölgenin iklimi yazın sıcak ve kurak geçer.","Acele etmeyip düşünerek karar ver.","Yolculuktan önce arabanı kontrol ettirmelisin."],"correctIndex":2}'::jsonb,
  'Doğru şık yalnızca bir olguyu bildirir. Diğer cümlelerde "-meli, -sa iyi olur, ver" gibi yapılarla öneri ya da öğüt verilmiştir.',
  '"Yazın sıcak ve kurak geçer" gibi bir bilgi cümlesi, bazen uyarı anlamı taşıyormuş gibi okunur. Ancak cümlede kişiye yönelik bir yönlendirme yoktur.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde kesin bir yargı yoktur, bir olasılık bildirilmiştir?',
  '{"options":["Yarın saat dokuzda toplantı başlayacak.","Yarın büyük olasılıkla yağmur yağacak.","Bu yol her zaman kapalıdır.","Güneş doğudan doğar.","Su, sıfır derecede donar."],"correctIndex":1}'::jsonb,
  '"Büyük olasılıkla" ifadesi, yağmurun yağmasının kesin olmadığını, bir tahmin olduğunu gösterir. Diğer cümlelerde kesin bilgi verilir.',
  '"Yağacak" gelecek zaman kipi taşıdığı için aday bunu kesin sanabilir. Oysa "büyük olasılıkla" ifadesi cümlenin kesinliğini azaltır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  '"Kıymeti, sahip olduğumuz sürece değil, kaybettiğimizde anlarız."

Bu cümleyle anlamca en yakın cümle aşağıdakilerden hangisidir?',
  '{"options":["Kaybettiğimiz şeylerin değeri hiçbir zaman anlaşılmaz.","Sahip olduğumuz şeylerin değeri, yitirilince azalır.","Kıymetli olan her şey kaybedilir.","Elimizdekinin değerini çoğu zaman onu yitirdikten sonra fark ederiz.","Kaybetmek, değeri artırır."],"correctIndex":3}'::jsonb,
  'Cümle, değerin kaybedildikten sonra fark edildiğini söyler. Doğru şık bu düşünceyi korur.',
  '"Kaybettiğimiz şeylerin değeri anlaşılmaz" şıkkı, cümledeki kayıp temasını ters yönde işler. Cümle tam tersine, kayıptan sonra anlaşıldığını söyler.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  3,
  '"Bir toplumun sanata verdiği önem, yalnızca müze sayısıyla değil, sanatın gündelik yaşama ne kadar karıştığıyla ölçülür."

Bu cümleden aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Sanatın önemi tek bir göstergeyle ölçülemez.","Sanatın gündelik hayata girmesi önemli bir göstergedir.","Müze sayısı, ölçütlerden yalnızca biridir.","Toplumların sanata yaklaşımı birden çok ölçütle değerlendirilebilir.","Müze sayısı arttıkça sanata verilen önem de kesinlikle artar."],"correctIndex":4}'::jsonb,
  'Cümle, müze sayısının tek ölçüt olmadığını söyler. Müze sayısı arttıkça sanata verilen önemin kesinlikle arttığı yargısı bundan çıkarılamaz.',
  '"Müze sayısı" ölçütlerden biri olarak geçtiği için aday bunun tek ve kesin bir ölçüt olduğunu sanabilir. Oysa "yalnızca ... değil" ifadesi bunu açıkça sınırlar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  '"Bir işin başarısı, ona ayrılan emeğin miktarıyla değil, o emeğin doğru yere harcanmasıyla ölçülür."

Bu cümleyle anlamca en yakın cümle aşağıdakilerden hangisidir?',
  '{"options":["Emek harcamadan başarı elde edilebilir.","Başarı, harcanan emekle doğru orantılıdır.","İşteki başarı, emeğin miktarından çok yönlendirildiği yere bağlıdır.","Emeğin yönü, başarıyla ilgisizdir.","Doğru yeri bulmak, emek harcamaktan daha kolaydır."],"correctIndex":2}'::jsonb,
  'Cümle, başarıyı emeğin miktarına değil doğru yere harcanmasına bağlar. Doğru şık bu düşünceyi korur.',
  '"Başarı harcanan emekle doğru orantılıdır" şıkkı, cümledeki "emek" ve "başarı" sözcüklerini kullanır; ancak cümle tam tersini söyler.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  '"Söz gümüşse sükût altındır."

Bu cümleyle anlamca en yakın cümle aşağıdakilerden hangisidir?',
  '{"options":["Bazı durumlarda konuşmaktan çok susmak değerlidir.","Gümüş, altından daha değerlidir.","Her zaman susmak gerekir.","Konuşmak, her durumda susmaktan iyidir.","Altın ile gümüş birbirinin yerine kullanılabilir."],"correctIndex":0}'::jsonb,
  'Atasözü, susmanın bazı durumlarda konuşmaktan daha değerli olduğunu anlatır.',
  '"Her zaman susmak gerekir" şıkkı atasözünü genelleştirdiği için çeldiricidir. Oysa atasözü yalnızca bazı durumları kapsar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  '"Sınav kaygısı, yalnızca hazırlıksız olmaktan değil, iyi hazırlanmış olup da başarısız olma korkusundan da doğabilir."

Bu cümleden aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Hazırlıksızlık, sınav kaygısına yol açabilir.","Sınav kaygısı yalnızca hazırlıksız öğrencilerde görülür.","İyi hazırlanan öğrenciler de kaygı yaşayabilir.","Başarısızlık korkusu, kaygının nedenlerinden biridir.","Sınav kaygısının birden çok nedeni olabilir."],"correctIndex":1}'::jsonb,
  'Cümle, kaygının iyi hazırlanmış kişilerde de görülebildiğini söyler. Bu nedenle yalnızca hazırlıksız öğrencilerde görüldüğü yargısı çıkarılamaz.',
  '"Yalnızca hazırlıksız olmaktan değil" ifadesi hazırlıksızlığı vurguladığı için aday uç yargıya yönelebilir. Oysa ifade, tek nedeni reddeder.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde gerçekleşmemiş bir durum anlatılmaktadır?',
  '{"options":["Yağmur yağınca pikniği ertelediler.","Yağmur yağdığı için eve döndük.","Yağmur yağarken şemsiye açtı.","Yağmur yağmasaydı pikniğe gidecektik.","Yağmurdan sonra hava serinledi."],"correctIndex":3}'::jsonb,
  '"Yağmasaydı ... gidecektik" yapısı, gerçekte yağmurun yağdığını ve pikniğe gidilmediğini ima eder; gerçekleşmemiş bir koşul bildirir.',
  'Diğer cümlelerde de yağmur geçtiği için aday hepsini aynı sanabilir. Gerçekleşmemiş koşul, "-saydı" gibi dilek-şart yapısıyla kurulur.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerden hangisi bir tanım cümlesidir?',
  '{"options":["Bu mercek çok pahalıydı.","Mercekler camdan mı yapılır?","Dün yeni bir mercek aldım.","Mercek almak için çarşıya gitti.","Mercek, ışığı kırarak odaklayan şeffaf bir cisimdir."],"correctIndex":4}'::jsonb,
  'Doğru şık, merceğin ne olduğunu açıklar; tanım cümlesidir. Diğerleri bilgi, soru ve olay bildirir.',
  'Hepsinde "mercek" sözcüğü geçtiği için aday ayrım yapmakta zorlanabilir. Tanım cümlesi, bir şeyin ne olduğunu belirtir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  '"Hiçbir öğrenci sınavdan geçemedi."

Bu cümleyle anlamca en yakın cümle aşağıdakilerden hangisidir?',
  '{"options":["Bazı öğrenciler sınavı geçti.","Her öğrenci sınavı geçti.","Sınavı geçen öğrenci olmadı.","Yalnızca birkaç öğrenci sınavı geçemedi.","Sınavı geçen öğrenci sayısı azdı."],"correctIndex":2}'::jsonb,
  '"Hiçbir öğrenci geçemedi" demek, geçen öğrenci olmadığını söylemektir.',
  '"Sınavı geçen sayısı azdı" şıkkı hiç geçen olmadığı anlamını zayıflatır. Oysa "hiçbir" sözü sayıyı sıfıra indirir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  3,
  '"Başvuru yapabilmek için yaşın 18''den büyük olması gerekir."

Bu cümleden aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["18 yaşından büyük olan herkesin başvurusu kabul edilir.","18 yaşından küçük biri başvuru yapamaz.","Başvuru için yaş koşulunun aranması gerekir.","Yaş, başvurunun koşullarından biridir.","18 yaşın altındakiler başvuru koşulunu sağlamaz."],"correctIndex":0}'::jsonb,
  'Cümle, yaşın gerekli bir koşul olduğunu söyler; yeterli olduğunu söylemez. Bu nedenle 18 yaşından büyük herkesin başvurusunun kabul edildiği yargısı çıkarılamaz.',
  'Koşulun tersini kabul sanmak yaygın hatadır. Gerekli koşul, yeterli koşul değildir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde benzetme vardır?',
  '{"options":["Çocuk hafif bir çantayı taşıdı.","Çocuk, kuş gibi hafifti.","Çocuk bahçede koştu.","Çocuk hafif bir yemek yedi.","Çocuk erkenden uyudu."],"correctIndex":1}'::jsonb,
  '"Kuş gibi hafif" ifadesinde çocuk, kuşa benzetilmiştir. Diğer cümlelerde benzetme yoktur.',
  '"Hafif" sözcüğü her cümlede bulunduğu için aday benzetme arayabilir. Benzetme, "gibi" gibi bir edatla iki varlığın birbirine yaklaştırılmasıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde hem neden hem amaç belirtilmiştir?',
  '{"options":["Hasta olduğu için izin aldı.","Dinlenmek amacıyla izin aldı.","İzin alırsa dinlenir.","İzin aldı ve dinlendi.","Hasta olduğu için dinlenmek amacıyla izin aldı."],"correctIndex":4}'::jsonb,
  'Doğru şıkta izin almanın nedeni (hasta olmak) ve amacı (dinlenmek) birlikte verilmiştir.',
  'Diğer şıklarda yalnızca neden ya da yalnızca amaç bulunur. İki ilişkinin birlikte arandığı soruda bu fark gözden kaçabilir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  3,
  '"Bir kitap herkes için aynı anlamı taşımaz; çünkü okur, kitabı kendi yaşantısıyla birlikte okur."

Bu cümleden aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Okurun yaşantısı, kitabın anlamını etkiler.","Aynı kitap farklı okurlar için farklı anlamlar taşıyabilir.","Bir kitabın anlamı yalnızca yazarın niyetiyle belirlenir.","Anlam, okuma sürecinde de oluşur.","Okur, kitabı kendi deneyimiyle yorumlar."],"correctIndex":2}'::jsonb,
  'Cümle, anlamın okurun yaşantısıyla birlikte oluştuğunu söyler. Anlamın yalnızca yazarın niyetine bağlı olduğu yargısı cümleyle çelişir.',
  'Yazarın niyeti önemli görüldüğü için aday bu şıkkı doğru sanabilir. Oysa cümle anlamın okura göre değiştiğini vurgular.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  'Bilgi sahibi olmak yetmez; .......

Bu cümlenin devamına aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["onu doğru yerde ve zamanda kullanabilmek de gerekir.","bu nedenle bilgi edinmekten vazgeçilmelidir.","bilgi yalnızca kitaplardan edinilir.","herkes aynı bilgiyi paylaşmalıdır.","bilgili olanlar hiç hata yapmaz."],"correctIndex":0}'::jsonb,
  '"Yetmez" ifadesi, bilginin tek başına yeterli olmadığını söyler. Devamı, bilginin kullanımına işaret etmelidir.',
  '"Bilgi edinmekten vazgeçilmelidir" şıkkı "yetmez" ifadesini yanlış yorumlar. Oysa cümle bilgiyi gerekli ama yetersiz sayar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  'Yağmur başlamıştı; ....... maçı ertelemediler.

Bu cümlede boş bırakılan yere aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["bu yüzden","yine de","çünkü","ayrıca","dolayısıyla"],"correctIndex":1}'::jsonb,
  'Yağmur başladığı hâlde maç ertelenmemiştir; ikisi arasında karşıtlık vardır. Bu karşıtlığı "yine de" kurar.',
  '"Bu yüzden" ve "dolayısıyla" neden-sonuç bağı kurar; aday yağmurun maçı ertelemeyi gerektirdiğini düşünerek bunlara yönelebilir. Oysa cümle karşıtlık bildirir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  '"İnsan, bildiğini sandığı konuda en çok yanılandır."

Bu cümleyle anlamca en yakın cümle aşağıdakilerden hangisidir?',
  '{"options":["İnsan bilmediği konularda hiç yanılmaz.","Bilgili insanlar hiçbir zaman yanılmaz.","Bir konuyu bilmek, yanılma olasılığını artırır.","Bir konuyu bildiğini düşünen kişi, çoğu zaman o konuda hata yapar.","Yanılmak, yalnızca bilgisiz kişilere özgüdür."],"correctIndex":3}'::jsonb,
  'Cümle, bildiğini sanmanın yanılgıya yol açtığını söyler. Doğru şık bunu korur.',
  '"Bilmek yanılmayı artırır" şıkkı bilgi ile yanılgı arasında doğrudan bir ilişki kurar. Oysa cümle, bildiğini sanmayı (yanlış bir güveni) eleştirir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde öneri vardır?',
  '{"options":["Kararını dün akşam verdi.","Karar vermek her zaman zordur.","Kararını açıklayınca herkes şaşırdı.","Karar vermek için toplantı düzenlendi.","Kararını vermeden önce biraz daha düşünsen iyi olur."],"correctIndex":4}'::jsonb,
  'Doğru şık "iyi olur" yapısıyla bir öneri bildirir. Diğer cümlelerde olay, genel yargı ve amaç vardır.',
  '"Karar vermek her zaman zordur" cümlesi genel bir yargı olduğu için uyarı sanılabilir. Oysa öneri, kişiye yönelik bir yönlendirmedir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  3,
  '"Doğru bilgiye ulaşmak kadar, o bilginin güvenilir bir kaynaktan geldiğini doğrulamak da önemlidir."

Bu cümleden aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Bilginin güvenilir bir kaynaktan gelmesi önemlidir.","Kaynağı doğrulamak, bilgiyle ilgili önemli bir adımdır.","Bilginin kaynağını doğrulamak, doğru bilgiye ulaşmaktan daha az önemlidir.","Doğru bilgiye ulaşmak önemlidir.","Kaynak doğrulaması, bilgiyi değerlendirmede rol oynar."],"correctIndex":2}'::jsonb,
  '"Kadar" ifadesi, iki durumun eşit derecede önemli olduğunu söyler. Kaynağı doğrulamanın daha az önemli olduğu yargısı cümleyle çelişir.',
  '"Doğru bilgiye ulaşmak" ifadesi başta geldiği için aday ona öncelik verildiğini sanabilir. Oysa "kadar" bağı eşitlik kurar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde olumsuz bir yargı vardır?',
  '{"options":["Bu soruyu kimse çözemedi.","Bu soruyu herkes çözdü.","Bu soruyu birkaç kişi çözdü.","Bu soru çok kolaydı.","Bu soruyu çözmek için çok çalıştı."],"correctIndex":0}'::jsonb,
  '"Kimse çözemedi", çözen kimsenin olmadığını söyler; olumsuz bir yargıdır.',
  '"Birkaç kişi çözdü" gibi cümleler az sayıyı bildirdiği için aday olumsuz sanabilir. Olumsuzluk, çözenin hiç olmamasıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  '"Kendine gülebilen insan, başkalarının gülüşünden incinmez."

Bu cümleyle anlamca en yakın cümle aşağıdakilerden hangisidir?',
  '{"options":["İnsan kendine güldüğü için başkalarını da güldürmelidir.","Kendi hatalarını mizahla karşılayabilen kişi, başkalarının alaylarından kolay etkilenmez.","Başkalarının gülüşü, kişiyi her zaman incitir.","Kendine gülmek, başkalarına gülmeyi gerektirir.","Gülmek, incinmenin tek çaresidir."],"correctIndex":1}'::jsonb,
  'Cümle, kendine gülebilmenin başkalarının gülüşünden incinmemeyi sağladığını söyler.',
  '"Başkalarını güldürmek" ifadesi cümledeki "gülmek" fiilini yeni bir bağlamda kullandığı için çeldiricidir. Oysa cümle gülen kişiyle gülünen kişi arasında ilişki kurar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde zaman anlamı vardır?',
  '{"options":["Çok yoruldukları için hemen uyudular.","Ders çalışırsan başarılı olursun.","Ders çalışmasına rağmen sınavı geçemedi.","Ders biter bitmez kapıya koştular.","Ders çalışmak için kütüphaneye gitti."],"correctIndex":3}'::jsonb,
  '"Biter bitmez", iki eylemin art arda gerçekleştiğini bildirir; zaman anlamı taşır.',
  'Diğer cümlelerde de "ders" geçtiği için aday ayrım yapmakta zorlanabilir. İlişki türü, bağlaç ve eklerle belirlenir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  3,
  '"Gürültünün yoğun olduğu bir ortamda kişi, hem dikkatini toplamakta hem de karşısındakini anlamakta güçlük çeker."

Bu cümleden aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Gürültü dikkati dağıtabilir.","Gürültülü ortamda anlamak zorlaşabilir.","Gürültü iletişimi güçleştirebilir.","Ortamın sessiz olması anlamayı kolaylaştırabilir.","Gürültü, yalnızca dikkati etkiler; anlamayı etkilemez."],"correctIndex":4}'::jsonb,
  'Cümle, gürültünün hem dikkati hem anlamayı olumsuz etkilediğini söyler. Yalnızca dikkati etkilediği yargısı çelişkilidir.',
  '"Dikkatini toplamakta" ifadesi önce geldiği için aday asıl etkinin dikkatte olduğunu düşünebilir. Oysa cümle "hem ... hem" ile iki etkiyi birlikte verir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  '"Ne ekersen onu biçersin."

Bu cümleyle anlamca en yakın cümle aşağıdakilerden hangisidir?',
  '{"options":["Ekin biçmek, tarımın tek amacıdır.","Her iş, aynı sonucu doğurur.","Yaptığımız işlerin karşılığını sonunda biz görürüz.","Çiftçiler daima ekeceklerini biçer.","Yapılan işin karşılığı alınmaz."],"correctIndex":2}'::jsonb,
  'Atasözü, yaptığımız işlerin sonuçlarıyla karşılaşacağımızı anlatır.',
  'Atasözündeki tarımsal sözcükler aday için gerçek bir tarım cümlesini çağrıştırır. Oysa atasözü mecazlı bir anlam taşır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde abartma vardır?',
  '{"options":["Bu sıcakta bir dakika bile dışarıda kalsak eriyip yok olacağız.","Bu sıcakta dışarıda uzun süre kalmak zordu.","Hava bugün oldukça sıcak.","Sıcak yüzünden geç kalktık.","Sıcaktan korunmak için gölgeye çekildik."],"correctIndex":0}'::jsonb,
  'Eriyip yok olmak gerçekte olamayacağı için sıcağın şiddetini büyütmek amacıyla kullanılmıştır; abartmadır.',
  '"Oldukça sıcak" gibi derece bildiren ifadeler abartı sanılabilir. Abartıda gerçeğin ötesinde bir büyütme vardır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  '"Fırtınaya yakalanan gemiyi kaptanın soğukkanlılığı kurtarır."

Bu cümleyle anlamca en yakın cümle aşağıdakilerden hangisidir?',
  '{"options":["Gemiler yalnızca fırtınada batar.","Tehlike anında sakin kalabilmek, çoğu zaman en önemli güvencedir.","Kaptanlar her zaman soğukkanlıdır.","Soğukkanlılık, fırtınanın şiddetini azaltır.","Tehlike anında telaş etmek gereklidir."],"correctIndex":1}'::jsonb,
  'Cümle, kaptanın soğukkanlılığının gemiyi kurtardığını söyler. Doğru şık, bu düşünceyi genel bir yargı olarak ifade eder.',
  '"Fırtınanın şiddetini azaltır" şıkkı soğukkanlılığa olağanüstü bir etki yükler. Oysa cümle yalnızca kurtuluşu sağlayan davranışı vurgular.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde koşul anlamı vardır?',
  '{"options":["Zamanında geldiği için onu da götürdük.","Zamanında gelsin diye telefon etti.","Zamanında gelmesine rağmen geç kaldı.","Zamanında gelirsen seni de götürürüz.","Zamanında geldi ve beklemeden çıktık."],"correctIndex":3}'::jsonb,
  '"Gelirsen" şart eki, götürülmenin zamanında gelmeye bağlı olduğunu bildirir.',
  'Diğer cümlelerde "zamanında gelmek" geçtiği için aday koşulu ayırt edemeyebilir. Koşul, -sa/-se ekiyle belirtilir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  3,
  '"Tarih, yalnızca geçmişte olanların anlatısı değil, bugünü anlamak için başvurulan bir kaynaktır."

Bu cümleden aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Tarih, geçmişte olanları anlatır.","Tarih, bugünü anlamada bir kaynak olabilir.","Tarihin işlevi, yalnızca geçmişi anlatmakla sınırlı değildir.","Bugünü anlamak için tarihe başvurulabilir.","Tarih, bugünle hiçbir ilişkisi olmayan bir alandır."],"correctIndex":4}'::jsonb,
  'Cümle, tarihin bugünü anlamada da başvurulan bir kaynak olduğunu söyler. Bugünle ilişkisinin olmadığı yargısı cümleyle çelişir.',
  '"Geçmişte olanların anlatısı" ifadesi tarihin yalnızca geçmişle ilgili olduğu izlenimini verir. Oysa "yalnızca ... değil" ifadesi bunu sınırlar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde karşılaştırma vardır?',
  '{"options":["Bu kitabı bir günde bitirdim.","Bu kitap çok ilgi çekici.","Bu kitap, ötekinden daha ilgi çekici.","Bu kitabı arkadaşım önerdi.","Bu kitap raflarda uzun süre kaldı."],"correctIndex":2}'::jsonb,
  '"Ötekinden daha" ifadesi iki kitabı birbiriyle kıyaslar.',
  '"Çok ilgi çekici" ifadesi dereceyi bildirdiği için karşılaştırma sanılabilir. Karşılaştırma için ikinci bir varlık gerekir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  '"Bir yanlışı düzeltmenin yolu, onu yapanı suçlamaktan değil, nasıl oluştuğunu anlamaktan geçer."

Bu cümleyle anlamca en yakın cümle aşağıdakilerden hangisidir?',
  '{"options":["Hataları düzeltmek için suçlu aramak yerine nedenlerini kavramak gerekir.","Hata yapanlar mutlaka cezalandırılmalıdır.","Yanlışlar, anlaşılmadan da düzeltilebilir.","Suçlamak, hataları önlemenin en etkili yoludur.","Hataların nedenini araştırmak zaman kaybıdır."],"correctIndex":0}'::jsonb,
  'Cümle, yanlışı düzeltmenin suçlamadan değil nedenini anlamaktan geçtiğini söyler.',
  '"Hata yapanlar cezalandırılmalıdır" şıkkı, cümlede olumsuzlanan davranışı savunur. Aday cümleyi hızlı okursa karıştırabilir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde öznel bir yargı vardır?',
  '{"options":["Bu şehir, 1923 yılında kuruldu.","Bu şehirde yaşamak, dünyanın en büyük ayrıcalığıdır.","Şehrin nüfusu yarım milyondur.","Şehir, denize kıyıdır.","Şehirde üç üniversite bulunur."],"correctIndex":1}'::jsonb,
  '"En büyük ayrıcalık" kişisel bir değerlendirmedir; kanıtlanamaz. Diğer cümleler doğrulanabilir bilgi verir.',
  'Sayı ve tarih içeren cümleler kesin göründüğü için aday hepsini nesnel sanabilir. Soru, kişisel değerlendirme içeren cümleyi arar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde amaç bildirilmiştir?',
  '{"options":["Notlarını yeniden okuyunca daha iyi anladı.","Notlarını yeniden okuduğu için daha iyi anladı.","Notlarını yeniden okusaydı daha iyi anlardı.","Daha iyi anlamak için notlarını yeniden okudu.","Notlarını yeniden okumasına rağmen anlamadı."],"correctIndex":3}'::jsonb,
  'Doğru şıkta yeniden okumanın amacı daha iyi anlamaktır. Diğer cümlelerde zaman, neden, varsayım ve karşıtlık vardır.',
  'Bütün cümlelerde okuma ve anlama sözcükleri geçtiği için aday ilişkiyi karıştırabilir. Amaç, "için" ve "-mek için" yapısıyla belirtilir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  3,
  '"Bir toplumun gelişmişliği, yalnızca ekonomik büyümeyle değil, bireylerin yaşam kalitesiyle de ölçülür."

Bu cümleden aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Ekonomik büyüme, gelişmişliğin ölçütlerinden biridir.","Yaşam kalitesi, gelişmişlik açısından önemlidir.","Gelişmişlik birden çok ölçütle değerlendirilir.","Bireylerin yaşam kalitesi toplumsal gelişmişliği yansıtabilir.","Gelişmişlik yalnızca ekonomik büyümeyle ölçülür."],"correctIndex":4}'::jsonb,
  'Cümle, gelişmişliğin yalnızca ekonomik büyümeyle ölçülmediğini söyler. Bu nedenle tek ölçütün ekonomik büyüme olduğu yargısı çıkarılamaz.',
  '"Ekonomik büyüme" ilk sırada anıldığı için aday onu tek ölçüt sanabilir. Oysa "yalnızca ... değil" ifadesi bunu açıkça reddeder.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Ses Bilgisi ve Ses Olayları',
  'multiple_choice',
  2,
  'Aşağıdaki sözcüklerden hangisinde ünsüz yumuşaması vardır?',
  '{"options":["gözü","okulu","kanadı","kalemi","evde"],"correctIndex":2}'::jsonb,
  '"Kanat" sözcüğü iyelik eki alınca sondaki "t", "d"ye dönüşür: kanadı. Bu ünsüz yumuşamasıdır. Diğer sözcüklerde bu ses olayı yoktur.',
  'Hepsi ek almış sözcükler olduğu için aday herhangi bir ses olayı olduğunu sanabilir. Yumuşama, "p, ç, t, k" ile biten sözcüklerde görülür.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Ses Bilgisi ve Ses Olayları',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde ünlü düşmesine uğramış bir sözcük yoktur?',
  '{"options":["Kalemi masanın üstüne bıraktı.","Alnına kara bir leke düşmüştü.","Omzuna hafifçe dokundu.","Ağzından tek söz çıkmadı.","Burnuna kötü bir koku geldi."],"correctIndex":0}'::jsonb,
  '"Alnı, omzu, ağzı, burnu" sözcükleri iyelik eki alırken ikinci hecenin ünlüsü düşer. "Kalemi"de ünlü düşmesi yoktur.',
  '"Kalemi" de ek almış bir sözcük olduğu için aday ses olayı arayabilir. Oysa "kalem" iyelik eki alırken hiçbir ses kaybetmez.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Yapı ve Ekler',
  'multiple_choice',
  2,
  'Aşağıdaki sözcüklerden hangisi addan türemiş bir sıfattır?',
  '{"options":["gözlük","kitapçı","başlık","sulu","yazar"],"correctIndex":3}'::jsonb,
  '"Sulu", "su" adına -lu eki getirilerek türetilmiş bir sıfattır. Diğerleri addan ad (gözlük, kitapçı, başlık) ya da fiilden ad (yazar) türemiştir.',
  '"Yazar" ve "başlık" gibi sözcükler sıfat gibi kullanılabildiği için karıştırılır. Ancak soru türemenin sonucunda oluşan sözcük türünü sorar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Yapı ve Ekler',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde fiilden türemiş bir ad kullanılmıştır?',
  '{"options":["Okula yürüyerek gitti.","Bahçede çiçekler açmıştı.","Annem çorbayı soğuttu.","Ağaçta kuşlar ötüyordu.","Çalışma masasının üzerinde dağınık kâğıtlar vardı."],"correctIndex":4}'::jsonb,
  '"Çalışma", "çalış-" fiiline -ma eki getirilerek türetilmiş bir addır. Diğer cümlelerdeki adlar (okul, bahçe, çiçek, çorba, ağaç, kuş) kök hâlindedir; fiiller ise yüklem ya da fiilimsi görevindedir.',
  '"Yürüyerek" ve "soğuttu" gibi sözcükler fiilden türemiş görünse de ad değildir; biri zarf-fiil, öteki fiildir. Soru fiilden türemiş bir adı arar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Yapı ve Ekler',
  'multiple_choice',
  1,
  'Aşağıdaki sözcüklerden hangisinde yalnızca çekim eki vardır?',
  '{"options":["kitapçı","kitaplık","kitaplar","kitapsız","kitaplı"],"correctIndex":2}'::jsonb,
  '"Kitaplar" sözcüğünde yalnızca çoğul eki (-lar) vardır; çekim ekidir. Diğerlerinde -çı, -lık, -sız, -lı yapım ekleri bulunur.',
  'Hepsi aynı kökten türediği için aday ekleri ayırt etmekte zorlanır. Yapım eki sözcüğün anlamını ya da türünü değiştirir; çekim eki değiştirmez.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Yapı ve Ekler',
  'multiple_choice',
  2,
  'Aşağıdaki fiillerden hangisi birleşik fiildir?',
  '{"options":["yardım etmek","gelmek","okumak","yazdırmak","sevinmek"],"correctIndex":0}'::jsonb,
  '"Yardım etmek", ad soylu bir sözcük ile yardımcı fiilin birleşmesiyle oluşan birleşik fiildir. "Yazdırmak" ve "sevinmek" türemiş, "gelmek" ve "okumak" basit fiildir.',
  '"Yazdırmak" ve "sevinmek" ek aldığı için bileşik sanılabilir. Birleşik fiil, ek almış değil, iki sözcüğün birleşmesiyle oluşmuş fiildir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcük Türleri (İsim, Sıfat, Zamir, Zarf, Edat, Fiil)',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde soru zamiri kullanılmıştır?',
  '{"options":["Hangi kitabı okudun?","Bu işi kim yaptı?","Kaç yaşındasın?","Nasıl bir insandı?","Ne güzel bir gün!"],"correctIndex":1}'::jsonb,
  '"Kim", bir kişinin yerini tutan soru zamiridir. Diğer cümlelerdeki "hangi, kaç, nasıl, ne" ise adı niteleyen soru sıfatlarıdır.',
  'Hepsi soru bildiren sözcüklerdir; aday türlerini karıştırabilir. Zamir, adın yerini tutar; sıfat adı niteler.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcük Türleri (İsim, Sıfat, Zamir, Zarf, Edat, Fiil)',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde "ancak" sözcüğü bağlaç görevindedir?',
  '{"options":["Bu işi ancak sen yapabilirsin.","Eve ancak akşam döndü.","Ancak iki kişi geldi.","Çok çalıştı, ancak sonuç alamadı.","Bu parayı ancak bir hafta idare eder."],"correctIndex":3}'::jsonb,
  'Doğru şıkta "ancak", iki cümleyi karşıtlık ilişkisiyle bağlar ("ama" anlamında). Diğer cümlelerde "ancak", "yalnızca, zor bela" anlamında zarf görevindedir.',
  '"Ancak" sözcüğü her cümlede yer aldığı için bağlaç sanılabilir. Bağlaç, cümleleri ya da söz öbeklerini bağlar; zarf ise anlamı sınırlar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcük Türleri (İsim, Sıfat, Zamir, Zarf, Edat, Fiil)',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde edat kullanılmıştır?',
  '{"options":["Yarın erkenden yola çıkacağız.","Çocuk bahçede oynuyor.","Annem yemek yapıyor.","Kitabı masaya koydu.","Kardeşim gibi erken kalkar."],"correctIndex":4}'::jsonb,
  '"Gibi", bir ad soylu sözcükle birlikte kullanılan edattır. Diğer cümlelerde edat bulunmaz.',
  '"Erkenden" ve "masaya" gibi ekli sözcükler edat sanılabilir. Edat, kendi başına anlamı olmayan, ad soylu sözcüğe bağlanan çekimsiz sözcüktür.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcük Türleri (İsim, Sıfat, Zamir, Zarf, Edat, Fiil)',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde sıfat tamlaması vardır?',
  '{"options":["Evin kapısı açıktı.","Fotoğrafı duvara astı.","Eski bir fotoğrafa uzun uzun baktı.","Çocuk annesine sarıldı.","Okulun bahçesinde oynadılar."],"correctIndex":2}'::jsonb,
  '"Eski bir fotoğraf" ifadesinde sıfat (eski) bir adı (fotoğraf) niteler; sıfat tamlamasıdır. "Evin kapısı" ve "okulun bahçesi" isim tamlamasıdır.',
  '"Evin kapısı" gibi iki sözcüklü yapılar tamlama olduğu için sıfat tamlaması sanılabilir. Sıfat tamlamasında ilk sözcük ek almaz ve bir adı niteler.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcük Türleri (İsim, Sıfat, Zamir, Zarf, Edat, Fiil)',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde fiil, görülen geçmiş zamanla çekimlenmiştir?',
  '{"options":["Dün akşam sinemaya gittik.","Yarın sinemaya gideceğiz.","Her cuma sinemaya gideriz.","Şu an sinemaya gidiyoruz.","Sinemaya gitmişler."],"correctIndex":0}'::jsonb,
  '"Gittik", -di eki ile çekimlenmiş görülen geçmiş zaman biçimidir. Diğerleri gelecek, geniş, şimdiki ve duyulan geçmiş zamandır.',
  '"Gitmişler" de geçmiş zaman bildirdiği için aday ayrım yapmakta zorlanabilir. Duyulan geçmişte -miş eki, görülen geçmişte -di eki vardır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcük Türleri (İsim, Sıfat, Zamir, Zarf, Edat, Fiil)',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde isim-fiil vardır?',
  '{"options":["Koşarak okula yetişti.","Çocukların oyun oynaması çok güzeldi.","Gelen misafirler yorgundu.","Eve gelince yemek yedik.","Dönerken sana uğrayacağım."],"correctIndex":1}'::jsonb,
  '"Oynaması", fiile -ma eki getirilerek oluşan ve cümlede ad gibi (özne) kullanılan isim-fiildir. Diğerlerinde zarf-fiil ve sıfat-fiil vardır.',
  '"Gelen" gibi fiilimsiler birbirine benzediği için aday türlerini karıştırır. İsim-fiil ad görevinde, sıfat-fiil sıfat, zarf-fiil zarf görevindedir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcük Türleri (İsim, Sıfat, Zamir, Zarf, Edat, Fiil)',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde zaman zarfı vardır?',
  '{"options":["Hızlı koştu.","Çok sevindi.","Buraya gel.","Şimdi geliyorum.","Nasıl yapacaksın?"],"correctIndex":3}'::jsonb,
  '"Şimdi", eylemin ne zaman yapıldığını bildirir; zaman zarfıdır. Diğerlerinde durum, miktar, yer-yön ve soru zarfı vardır.',
  '"Hızlı" gibi hız bildiren sözcükler zaman çağrışımı yapar. Oysa "hızlı koştu"da zarf, eylemin nasıl yapıldığını bildirir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcük Türleri (İsim, Sıfat, Zamir, Zarf, Edat, Fiil)',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde "ki" bağlaç görevindedir?',
  '{"options":["Dünkü toplantı verimliydi.","Seninki daha güzel.","Evdeki halı eski.","Sınıftaki öğrenciler sustu.","Biliyorum ki sen haklısın."],"correctIndex":4}'::jsonb,
  'Doğru şıkta "ki", iki cümleyi bağlayan ve ayrı yazılan bağlaçtır. Diğerlerinde "-ki", bitişik yazılan ilgi ekidir.',
  '"Seninki" gibi bitişik yazılan yapılar "ki"nin bağlaç olduğu izlenimini verir. Bağlaç olan "ki" ayrı yazılır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlenin Ögeleri ve Cümle Türleri',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde nesne yoktur?',
  '{"options":["Annem yemek yaptı.","Kapıyı açtı.","Çocuklar bahçede oynuyor.","Kitabı okudu.","Mektubu yazdı."],"correctIndex":2}'::jsonb,
  'Doğru şıktaki "bahçede" dolaylı tümleçtir; nesne yoktur. Diğer cümlelerde "yemek, kapıyı, kitabı, mektubu" nesnedir.',
  '"Yemek" sözcüğü ek almadığı için nesne olmadığı sanılabilir. Oysa "ne yaptı?" sorusuna yanıt veren bu sözcük belirtisiz nesnedir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlenin Ögeleri ve Cümle Türleri',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde belirtisiz nesne vardır?',
  '{"options":["Çocuk süt içti.","Çocuk sütü içti.","Çocuk bahçeye koştu.","Çocuk yarın gelecek.","Çocuk uyudu."],"correctIndex":0}'::jsonb,
  '"Süt" ek almadığı için belirtisiz nesnedir. "Sütü" belirtme eki aldığından belirtili nesnedir.',
  'İki cümle birbirine çok benzediği için aday belirtili-belirtisiz ayrımını gözden kaçırabilir. Belirtme eki (-i) olup olmadığına bakılmalıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlenin Ögeleri ve Cümle Türleri',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerden hangisi şartlı birleşik cümledir?',
  '{"options":["Treni yakalamak için erken çıktı.","Gelen misafir bizi sevindirdi.","Çocuk koşarak geldi.","Erken çıkarsan treni yakalarsın.","Ders bitti ve herkes çıktı."],"correctIndex":3}'::jsonb,
  'Doğru şıktaki "çıkarsan", şart eki taşıyan yan cümleciktir; cümle şartlı birleşik cümledir. Diğerleri amaç, sıfat-fiil, zarf-fiil ve bağlı cümledir.',
  'Diğer cümlelerde de birden çok yargı vardır; aday hepsini birleşik sanabilir. Şartlı birleşikte yan cümlecik -sa/-se eki taşır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlenin Ögeleri ve Cümle Türleri',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde yüklem dönüşlüdür?',
  '{"options":["Pencere rüzgârla açıldı.","Annem çamaşırları yıkadı.","Kapı hızla kapandı.","Çocuklar bahçede koştu.","Çocuk sabah erkenden yıkandı."],"correctIndex":4}'::jsonb,
  '"Yıkandı" yüklemi -n ekiyle oluşmuştur ve eylemi yapanın kendisinin etkilendiğini gösterir; dönüşlüdür. Diğerlerinde edilgen ve etken yüklemler vardır.',
  '"Açıldı" ve "kapandı" da -n/-ıl eki taşıdığı için dönüşlü sanılabilir. Bunlarda özne eylemi yapan değil, eylemden etkilenen nesnedir; edilgendir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlenin Ögeleri ve Cümle Türleri',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde hem dolaylı tümleç hem zarf tümleci vardır?',
  '{"options":["Kitabı masaya koydu.","Yarın erken kalkacağız.","Yarın arkadaşıma kitap vereceğim.","Çocuk bahçede oynuyor.","Kapıyı sessizce kapattı."],"correctIndex":2}'::jsonb,
  'Doğru şıkta "yarın" zarf tümleci, "arkadaşıma" dolaylı tümleç, "kitap" nesnedir. Diğer cümlelerde yalnızca biri vardır.',
  '"Yarın erken kalkacağız" cümlesinde iki zarf bulunur; dolaylı tümleç yoktur. Aday sayıca çok öge görmekle yetinmemeli, türlerine bakmalıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlenin Ögeleri ve Cümle Türleri',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde yüklem birleşik fiildir?',
  '{"options":["Dün akşam size yardım ettik.","Dün akşam size geldik.","Kapıyı sessizce kapattık.","Eve erken döndük.","Misafirleri karşıladık."],"correctIndex":0}'::jsonb,
  '"Yardım ettik", ad soylu sözcük ve yardımcı fiille kurulmuş birleşik fiildir. Diğerlerinde basit ya da türemiş fiiller vardır.',
  '"Karşıladık" gibi türemiş fiiller bileşik sanılabilir. Birleşik fiil, iki sözcüğün birleşmesiyle oluşur.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlenin Ögeleri ve Cümle Türleri',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde yüklem ek-fiille çekimlenmiştir?',
  '{"options":["Bu soruyu hemen çözdü.","Bu soru çok kolaydı.","Sınıf sessizce bekledi.","Ders yarın başlayacak.","Öğrenciler eve döndü."],"correctIndex":1}'::jsonb,
  '"Kolaydı" ad soylu bir sözcüğe getirilen ek-fiille (idi) çekimlenmiştir. Diğer yüklemler eylem köklüdür.',
  '"Çözdü" gibi -di ekiyle biten fiiller de aynı sesi taşıdığı için ek-fiil sanılabilir. Ek-fiil ad soylu sözcüklere gelir; eylem köküne gelen -di görülen geçmiş zaman ekidir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Anlatım Bozuklukları',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde mantık hatası vardır?',
  '{"options":["Yağmur yağınca sokaklar ıslandı.","Hava kararınca lambalar yakıldı.","Sıcaklık artınca kar eridi.","Yağmur yağınca sokaklar kurudu.","Ders başlayınca öğrenciler sustu."],"correctIndex":3}'::jsonb,
  'Yağmur sokakları ıslatır; kurumasına yol açmaz. Doğru şıkta neden-sonuç ilişkisi mantıksızdır.',
  'Diğer cümlelerde de "-ınca" ile neden-sonuç bağı kurulduğu için aday hepsini doğru sanabilir. Soru bu bağın mantıklı olup olmadığına bakar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Anlatım Bozuklukları',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde sözcük yanlış anlamda kullanılmıştır?',
  '{"options":["Kitabı bir arkadaşımdan ödünç aldım.","Kitabı bir arkadaşımdan ödünç verdim.","Arkadaşıma ödünç para verdim.","Bu kitabı kütüphaneden ödünç aldım.","Ödünç aldığı kitabı iade etti."],"correctIndex":1}'::jsonb,
  '"Ödünç vermek" başkasına verme, "ödünç almak" ise başkasından alma anlamındadır. "Arkadaşımdan ödünç verdim" ifadesi yanlıştır.',
  '"Ödünç" sözcüğü her cümlede bulunduğu için aday fiilin yönünü gözden kaçırabilir. Cümledeki kaynak ("arkadaşımdan") alma eylemini gerektirir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Orta Çağ''dan kalma pek çok katedralin pencerelerindeki camların alt kenarının üst kenarından kalın olması, yıllarca camın oda sıcaklığında bile çok yavaş akan bir sıvı olduğunun kanıtı sayıldı. Oysa fizik hesapları, camın o sıcaklıkta gözle görülür biçimde akması için evrenin yaşından katbekat uzun bir süre gerektiğini gösteriyor. Asıl neden, eski cam ustalarının üfleme ve döndürme tekniğiyle döktükleri levhaların bir ucunun kalın kalması ve ustaların ağırlığı dengelemek için kalın kenarı bilerek alta yerleştirmesidir.

Bu parçada asıl vurgulanmak istenen aşağıdakilerden hangisidir?',
  '{"options":["Orta Çağ ustalarının kullandığı camların dayanıklılık bakımından günümüz camlarından üstün olduğu","Fiziksel ölçümlerin tarihî yapıların korunmasında her zaman belirleyici rol oynadığı","Tarihî camlardaki kalınlık farkının maddenin akışından değil, bilinçli üretim ve yerleştirme tercihinden doğduğu","Camın katı hâldeyken bile yüksek basınç altında biçim değiştirebildiği","Eski yapılardaki mimari kusurların çoğunlukla yanlış malzeme seçiminden kaynaklandığı"],"correctIndex":2}'::jsonb,
  'Parça, tarihî camların altının kalın olmasının "camın akması" efsanesiyle açıklandığını ancak fizik hesaplarının bunu çürüttüğünü, gerçek nedenin eski üretim tekniği ve ustaların kalın kenarı alta koyma tercihi olduğunu anlatır.',
  'Parçanın başında "camın oda sıcaklığında bile çok yavaş akan bir sıvı olduğunun kanıtı sayıldı" ifadesi yer aldığı için aday camın akışkanlığına odaklanan şıklara yönelebilir. Oysa yazar bu yaygın inanışı "Oysa" diyerek reddeder ve gerçek nedeni üretim/yerleştirme tercihine bağlar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Uzun yıllar boyunca bataklıklar ve sazlıklar, yalnızca sivrisinek üreten ve tarıma açılması gereken verimsiz alanlar olarak görüldü. Bu anlayışla kurutulan sulak alanların ardından yalnızca göçmen kuşların uğrak yerleri kaybolmadı; aşırı yağışları sünger gibi tutan doğal taşkın tamponları da ortadan kalktı. Üstelik bu alanların yok olması, yer altı sularının beslenme hızını düşürerek çevredeki tarım arazilerini kuraklığa daha açık hâle getirdi.

Bu parçadan aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Yer altı sularının beslenmesi, bölgedeki sulak alanların varlığıyla ilişkilidir.","Bataklıklar, geçmişte işlevsiz ve verimsiz alanlar olarak değerlendirilmiştir.","Sulak alanlar, taşkın riskini azaltmada doğal bir görev üstlenmektedir.","Sulak alanların yok olması, birden fazla canlı grubunu ve su döngüsünü etkiler.","Sulak alanların kurutulması, tarımsal verimliliği her koşulda artırmıştır."],"correctIndex":4}'::jsonb,
  'Parça, sulak alanların tarıma açılmak amacıyla kurutulduğunu ancak bunun çevredeki tarım arazilerini kuraklığa daha açık hâle getirdiğini belirtir. Dolayısıyla kurutmanın tarımsal verimliliği her koşulda artırdığı yargısı parçayla çelişir.',
  '"Tarıma açılması gereken" ifadesi, kurutma işleminin tarıma kesin yarar sağladığı izlenimi yaratabilir. Ancak son cümle, bunun tam tersine tarım arazilerini kuraklık riskine açık bıraktığını vurgular.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Bir bölgenin ekonomisini tek bir tarım ürününe bağlamak, kısa vadede uzmanlaşma ve yüksek verim sağlayabilir. ....... Çünkü küresel pazardaki ani bir fiyat düşüşü ya da o ürüne özgü bir bitki hastalığı, bölgedeki bütün hanelerin gelirini aynı anda sarsar. Bu yüzden ürün çeşitliliği, kârlılığı biraz düşürse bile kırsal ekonominin sigortasıdır.

Bu parçada boş bırakılan yere düşüncenin akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["Bu nedenle tek ürünlü tarım modeli tüm bölgelerde yaygınlaştırılmalıdır.","Uzmanlaşma arttıkça ürün çeşitliliğine duyulan ihtiyaç da ortadan kalkar.","Bitki hastalıkları, yalnızca birden fazla ürün yetiştirilen alanlarda görülür.","Küresel fiyat dalgalanmaları, yerel üreticilerin gelirini hiçbir zaman etkilemez.","Ancak bu yoğunlaşma, bölgeyi dış şoklara karşı son derece kırılgan bırakır."],"correctIndex":4}'::jsonb,
  'Boşluktan sonraki "Çünkü" cümlesi, fiyat düşüşünün veya bitki hastalığının bütün hanelerin gelirini aynı anda sarstığını anlatır. Bu olumsuz sonucu gerekçelendiren ifade, tek ürüne yoğunlaşmanın bölgeyi dış şoklara karşı kırılgan bıraktığını belirten seçenektir.',
  'İlk cümlede uzmanlaşma ve yüksek verim gibi olumlu sonuçlar anıldığı için aday tek ürünlü modeli destekleyen bir devam arayabilir. Oysa boşluktan sonraki gerekçe cümlesi ve son cümle, tek ürün bağımlılığının riskini ortaya koyar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'I. Bu nedenle yapay zekâ araçlarının adil çalışması, algoritmanın karmaşıklığından çok, beslendiği verinin niteliğini denetlemeye bağlıdır.
II. Karar destek yazılımlarının insan ön yargılarından tamamen arınmış olduğu düşünülür.
III. Ne var ki bu yazılımlar, öğrenme sürecinde geçmişte insanlar tarafından üretilmiş kayıtları temel alır.
IV. Geçmiş kayıtlarda belirli gruplara yönelik eşitsiz uygulamalar varsa yazılım bu örüntüyü nesnel bir kuralmış gibi öğrenir.
V. Sonuçta tarafsız sandığımız dijital sistem, eski eşitsizlikleri daha hızlı ve görünmez biçimde yeniden üretir.

Bu cümlelerle anlamlı bir paragraf oluşturulduğunda baştan üçüncü cümle hangisi olur?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":3}'::jsonb,
  'Doğru sıralama II - III - IV - V - I biçimindedir. II. cümle yaygın kanıyı ortaya koyar; III. cümle ("Ne var ki bu yazılımlar") bu kanıya itiraz eder; IV. cümle geçmiş kayıtlardaki eşitsizliğin nasıl öğrenildiğini açıklar; V. cümle ("Sonuçta") bu öğrenmenin doğurduğu olumsuz sonucu verir; I. cümle ("Bu nedenle") genel hükmü ve çözümü bildirir. Baştan üçüncü cümle IV.''tür.',
  'I. cümle "Bu nedenle" bağlacıyla başladığı için ara cümle sanılabilir; ancak "beslendiği verinin niteliği" vurgusu önceki tüm açıklamaların toplam sonucudur. III. cümle ise "bu yazılımlar" gönderimiyle doğrudan II.''ye bağlandığından üçüncü sıraya IV. cümle yerleşir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Plasebo etkisi, genellikle hastanın "iyileştiğini sanması" olarak küçümsenir. Oysa beyin görüntüleme çalışmaları, etken madde içermeyen bir ilacı şifa beklentisiyle alan kişilerde ağrı kesici salgılayan beyin bölgelerinin gerçekten etkinleştiğini göstermektedir. Yani beklenti yalnızca zihinsel bir yanılsama değil, bedenin kendi biyokimyasını harekete geçiren somut bir etkendir.

Bu parçaya en uygun başlık aşağıdakilerden hangisidir?',
  '{"options":["İlaç Üretiminde Etken Maddelerin Rolü","Plasebo Etkisinin Biyolojik Gerçekliği","Ağrı Kesici İlaçların Yan Etkileri","Modern Tıpta Görüntüleme Yöntemleri","Hasta-Hekim İletişiminin Tarihçesi"],"correctIndex":1}'::jsonb,
  'Parça, plasebo etkisinin yalnızca bir sanrı değil, beynin biyokimyasını harekete geçiren somut ve ölçülebilir bir süreç olduğunu anlatmaktadır. Bu içeriği en kapsayıcı biçimde özetleyen başlık "Plasebo Etkisinin Biyolojik Gerçekliği"dir.',
  'Metinde beyin görüntüleme ve ağrı kesici ifadeleri geçtiği için aday görüntüleme yöntemleri ya da ağrı kesici ilaçlarla ilgili başlıklara yönelebilir. Oysa bunlar plasebonun bedensel gerçekliğini kanıtlamak için verilen araç ve örneklerdir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Zor zamanlarda yalnızca çok yakın akraba ve dostlarımızın desteğine güveniriz. Oysa sosyologlar, aynı sokakta selamlaştığımız komşular veya her gün karşılaştığımız esnaf gibi "zayıf bağların" toplumsal dayanışmada sanılandan daha büyük bir rol oynadığını ortaya koyuyor. Çünkü bu gevşek ama yaygın ağlar, dar bir yakın çevre içinde sıkışıp kalmayan bilgi, yardım ve güven akışını mümkün kılar.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Gevşek toplumsal ilişkiler, bireylerin birbirine yabancılaşmasını hızlandırır.","Yakın akraba ve dostların desteği, zor zamanlarda hiçbir işe yaramaz.","Sosyologlar, komşuluk ilişkilerinin günümüzde tamamen yok olduğunu savunmaktadır.","Güven duygusu yalnızca çok yakın ilişkilerin bulunduğu küçük çevrelerde gelişir.","Zayıf toplumsal bağlar, kriz dönemlerinde dayanışma ve bilgi akışı açısından sanılandan daha güçlü bir işlev görür."],"correctIndex":4}'::jsonb,
  'Parça, zayıf bağların dar yakın çevrenin sağlayamadığı geniş bilgi, yardım ve güven akışını mümkün kılarak toplumsal dayanışmada beklenenden büyük rol oynadığını vurgular.',
  'İlk cümlede yakın akraba ve dostlara güvenildiği söylendiği için aday ya yakın çevreyi öne çıkaran ya da yakın çevreyi tamamen değersizleştiren uç bir yargıyı seçebilir. Parça yakın çevreyi yadsımaz, yalnızca zayıf bağların ihmal edilen gücüne dikkat çeker.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Eğitim araştırmalarında "üretken başarısızlık" adı verilen yöntemde öğrencilere yeni bir kavram önce hiç anlatılmaz; onlardan kendi başlarına çözüm üretmeleri istenir. Öğrenciler çoğu zaman doğru sonuca ulaşamaz, ancak deneme sırasında problemin yapısını ve kendi eksik noktalarını fark ederler. Bundan sonra yapılan konu anlatımı, doğrudan hazır bilgi verilen gruba kıyasla çok daha kalıcı bir kavrayış sağlar.

Bu parçada aşağıdakilerden hangisine değinilmemiştir?',
  '{"options":["Üretken başarısızlık yönteminde izlenen başlangıç adımına","Öğrencilerin deneme sürecinde neleri fark ettiğine","Yöntemin hazır anlatıma kıyasla sağladığı sonuca","Öğrencilerin ilk aşamada doğru sonuca çoğu zaman ulaşamadığına","Bu yöntemin hangi yaş grubunda daha yüksek başarı verdiğine"],"correctIndex":4}'::jsonb,
  'Parçada yöntemin başlangıç adımı (önce anlatılmadan çözüm istenmesi), deneme sürecindeki farkındalık (problem yapısı ve eksikler), ilk aşamada doğruya ulaşılamaması ve sonraki anlatımın kalıcılığı belirtilir; ancak yaş gruplarına göre başarı farkından söz edilmez.',
  'Eğitim araştırmaları ve öğrenci kavramları geçtiği için aday yöntemin yaş gruplarıyla ilişkilendirildiğini varsayabilir. Oysa metinde öğrencilerin yaşına veya öğretim kademesine dair hiçbir bilgi yoktur.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  '(I) Bir ormanı uzaktan izlediğimizde ağaçları yalnızca güneş ışığı için yarışan birbirinden bağımsız canlılar sanırız. (II) Oysa toprağın altında, ağaç köklerini birbirine bağlayan mikroskobik mantar ağları üzerinden sürekli bir madde ve sinyal alışverişi yürüdüğüne dair bulgular vardır. (III) Bazı araştırmalara göre yaşlı ve gövdesi geniş ağaçlar, gölgede kalan genç fidanlara bu ağ aracılığıyla karbon aktarabilir; hatta bir böcek saldırısına uğrayan ağaç, komşularını kimyasal uyarılarla haberdar edebilir. (IV) Bu bulgular, ormanın tek tek bireylerin toplamından çok, birbirine bağlı bir yaşam ağı olduğunu düşündürmektedir.

Bu parçadaki II. cümlenin işlevi aşağıdakilerden hangisidir?',
  '{"options":["Anlatılan sürecin tarihsel gelişimini özetlemek","Konuyla ilgili sayısal bir araştırma sonucunu aktarmak","Parçada ele alınan sorunun çözüm önerisini sunmak","Önceki cümlede verilen bilimsel bilgiyi örnekle somutlaştırmak","Önceki cümlede belirtilen yaygın algının gerçeği yansıtmadığını ortaya koymak"],"correctIndex":4}'::jsonb,
  'I. cümle ağaçların yalnızca yarışan bağımsız canlılar sanıldığını söyler; II. cümle "Oysa" bağlacıyla bu görünümün tersine toprak altında bir alışveriş yürüdüğüne dair bulgular bulunduğunu belirterek ilk cümledeki yaygın algıyı düzeltir.',
  'II. cümlede mantar ağlarından söz edildiği için aday bunu somut bir örnek sanabilir. Oysa somut örnekler III. cümlede (karbon aktarımı ve kimyasal uyarı) verilmiştir; II. cümle doğrudan I. cümledeki sanıyı çürüten karşı savdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  '....... Ne var ki güneş ışığını kesen geleneksel saçak ve kepenklerden arındırılmış dev cam cepheler, yaz aylarında yapının içini dev bir seraya çevirir. İçeri dolan ısıyı dışarı atmak için çalıştırılan soğutma sistemleri, yapının gün ışığından elde ettiği enerji tasarrufunu katbekat aşan bir elektrik tüketimine yol açar.

Bu parçanın başına düşüncenin akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["Cam cepheli yüksek yapılar, kent silüetine her zaman estetik bir görünüm kazandırır.","Modern mimaride geniş cam yüzeyler, gün ışığından en üst düzeyde yararlanmak amacıyla tercih edilir.","Geleneksel yapılarda kullanılan kepenkler, günümüzde tamamen işlevini yitirmiştir.","Soğutma sistemlerinin bakımı, yüksek binaların en önemli gider kalemidir.","Cam üretimi, diğer yapı malzemelerine göre daha az enerji gerektirir."],"correctIndex":1}'::jsonb,
  'Devamındaki "Ne var ki" cümlesi ve son cümledeki "gün ışığından elde ettiği enerji tasarrufu" göndermesi, ilk cümlede geniş cam yüzeylerin gün ışığından yararlanma amacıyla seçildiğinin söylenmesini gerektirir.',
  'Estetik görünümü vurgulayan cümle de modern cam cephelerle uyumlu gibi durur. Ancak son cümledeki "gün ışığından elde ettiği enerji tasarrufu" ifadesi, başlangıç cümlesinde mutlaka gün ışığı ve enerji amacının anılmasını zorunlu kılar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Tüketiciye daha fazla seçenek sunmanın her zaman memnuniyeti artıracağı varsayılır. Oysa bir deneyde, yirmi dört çeşit reçel sunulan tezgâhta müşterilerin yalnızca küçük bir bölümü satın alma yaparken altı çeşit sunulan tezgâhta satın alma oranı belirgin biçimde yükselmiştir. Seçenek sayısı aşırı arttığında zihin olası pişmanlığı hesaplamaktan yorulur ve en kolay yolu seçerek karar vermeyi erteler.

Bu parçadan aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Seçeneklerin çokluğu, karar verme sürecini zorlaştırabilir.","Seçenek sayısı azaldığında satın alma eğilimi artabilmektedir.","İnsanlar her koşulda en geniş ürün yelpazesine sahip mağazaları tercih eder.","Aşırı seçenek karşısında birey karar vermekten kaçınabilir.","Pişmanlık yaşama kaygısı, seçim yapmayı geciktiren etkenlerden biridir."],"correctIndex":2}'::jsonb,
  'Parça, çok fazla seçeneğin karar felcine yol açtığını ve daha az çeşit sunulan tezgâhta satın almanın arttığını göstermektedir. Bu nedenle insanların her koşulda en geniş ürün yelpazesini tercih ettiği yargısı parçayla çelişir.',
  'İlk cümledeki "daha fazla seçenek sunmanın her zaman memnuniyeti artıracağı" ifadesi, yaygın bir varsayım olarak sunulur. Cümleyi hızlı okuyan aday bunu yazarın kendi yargısı sanarak bu varsayımı destekleyen şıkkı doğru kabul edebilir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  '(I) Kurak bölgelerde tarımı sürdürebilmek için yer altından çekilen sularla yoğun sulama yapılır. (II) Ancak bu sulardaki çözünmüş mineraller, su buharlaştıktan sonra toprağın üst katmanında birikir. (III) Zamanla artan tuz oranı, bitki köklerinin su almasını engelleyerek verimi hızla düşürür. (IV) Toprağı yeniden ekilebilir hâle getirmek için tuzun derinlere yıkanması ve drenaj kanallarının kurulması gerekir. (V) Üstelik bu iyileştirme çalışmaları çoğu çiftçinin karşılayamayacağı kadar yüksek bir maliyet doğurur.

Bu parça iki paragrafa bölünmek istense ikinci paragraf hangi cümleyle başlamalıdır?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":3}'::jsonb,
  'İlk üç cümle kurak bölgelerde sulamanın toprakta tuzlanmaya yol açma sürecini ve bunun verimi düşürmesini anlatır. IV. cümle ise sorunun nasıl giderileceğine (iyileştirme ve drenaj çözümüne) geçer; bu nedenle ikinci paragraf IV. cümleyle başlamalıdır.',
  'V. cümle yeni bir bilgi eklediği için yeni bir bölümün başlangıcı gibi görünebilir. Ancak "bu iyileştirme çalışmaları" ifadesi doğrudan IV. cümledeki yıkama ve drenaj işlemlerine gönderme yaptığından IV. ve V. cümle ayrılamaz.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Açık denizde bir geminin kuzey-güney konumunu (enlemini) yıldızlara bakarak hesaplamak yüzyıllar boyunca mümkündü; ancak doğu-batı konumunu (boylamını) belirlemek büyük bir sorundu. Boylam hesabı, geminin bulunduğu yerdeki öğle vaktiyle başlangıç meridyenindeki saatin karşılaştırılmasını gerektiriyordu. Ne var ki sarkaçlı saatler dalgalı denizde ve sıcaklık değişimlerinde şaştığı için gemiciler açık denizde yüzlerce kilometrelik sapmalarla yol alıyordu. Bu engel ancak 18. yüzyılda sarsıntı ve ısı farkından etkilenmeyen deniz kronometresinin geliştirilmesiyle aşılabildi.

Bu parçadan aşağıdakilerden hangisine ulaşılabilir?',
  '{"options":["Enlem hesabı da en az boylam hesabı kadar hassas saatlere ihtiyaç duyuyordu.","Sarkaçlı saatler, deniz koşullarının yarattığı etkiler yüzünden boylam ölçümünde güvenilir sonuç vermiyordu.","Deniz kronometresi icat edilmeden önce gemiler enlem konumunu da belirleyemiyordu.","Sıcaklık değişimleri yalnızca yıldız gözlemlerini olumsuz etkiliyordu.","18. yüzyıldan sonra gemiciler artık gökyüzü gözlemlerine hiç başvurmamıştır."],"correctIndex":1}'::jsonb,
  'Parça, boylam için başlangıç meridyenindeki saatin bilinmesi gerektiğini ancak sarkaçlı saatlerin dalgalı deniz ve sıcaklık değişimleri nedeniyle şaştığını belirtir; bu da onların güvenilir sonuç vermediğini gösterir.',
  'İlk cümlede hem enlem hem boylam anıldığı için aday enlem hesabının da saate dayandığını veya kronometreden önce enlemin de bilinemediğini düşünebilir. Oysa metin enlemin yıldızlarla zaten hesaplanabildiğini, saat sorununun boylama özgü olduğunu söyler.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Kurallar, bir kurumun işleyişini adil ve öngörülebilir kılmak için konulur. Ancak kurala uymak, kurumun varlık amacının önüne geçtiğinde garip bir körlük başlar: Evrakı eksiksiz doldurtmayı hastayı tedavi etmekten ya da öğrenciyi yetiştirmekten daha önemli gören bir düzen ortaya çıkar. Böyle ortamlarda kuralları harfiyen uygulayanlar kendilerini sorumlu saymaz; çünkü asıl amaç unutulmuş, araç amaca dönüşmüştür.

Bu parçada yazarın eleştirdiği durum aşağıdakilerden hangisidir?',
  '{"options":["Kuralların kurum içindeki düzeni öngörülebilir kılması","Çalışanların görev tanımlarının yazılı kurallara bağlanması","Kurallara uymanın, kurumun temel hizmet amacını gölgede bırakması","Hastane ve okullarda kayıt işlemlerinin eksiksiz yürütülmesi","Kuralların zaman içinde çalışanlar tarafından unutulması"],"correctIndex":2}'::jsonb,
  'Yazar, kuralların düzen için var olduğunu kabul etmekle birlikte kurala uymanın asıl hizmet amacının (tedavi, eğitim) önüne geçip amacı unutturmasını eleştirmektedir.',
  'Parçada "evrakı eksiksiz doldurtmak" geçtiği için aday kayıt işlemlerinin eleştirildiğini düşünebilir. Oysa yazar evrakın kendisine değil, biçimsel prosedürün temel hizmetin önüne geçmesine karşı çıkar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  '(I) Deniz seviyesinden hızla yüksek dağlara çıkan bir kişide ilk saatlerde soluk alışverişi ve kalp atışı hızlanır. (II) Bunun nedeni, yükseklerde havanın daha seyrek olması ve her nefeste vücuda daha az oksijen girmesidir. (III) Dağcılık sporunda kullanılan uyku tulumlarının dolgu malzemesi, ısı yalıtımını belirleyen temel unsurdur. (IV) Kişi yüksek irtifada birkaç hafta kalırsa böbreklerin salgıladığı bir hormon sayesinde kemik iliği daha fazla alyuvar üretir. (V) Böylece kanın oksijen taşıma kapasitesi artar ve beden yeni ortama uyum sağlar.

Bu parçadaki numaralanmış cümlelerden hangisi düşüncenin akışını bozmaktadır?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":2}'::jsonb,
  'Parça, insan bedeninin yüksek irtifadaki düşük oksijene kısa ve uzun vadede verdiği fizyolojik tepkileri anlatmaktadır. III. cümle ise uyku tulumlarının dolgu malzemesine geçerek biyolojik uyum bütünlüğünü bozar.',
  'III. cümlede "dağcılık" geçtiği için yüksek dağ konusuyla bağlantılı gibi görünür. Ancak parçanın ekseni dağcılık malzemeleri değil, insan vücudunun yüksek irtifaya fizyolojik uyumudur.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Deniz tabanını kazıyarak ilerleyen ağır trol ağları, yalnızca hedeflenen balıkları yakalamakla kalmaz; süngerler, mercanlar ve deniz çayırları gibi tabana tutunarak yaşayan canlıları da yerinden söker. Bu canlılar, yavru balıkların saklandığı ve beslendiği karmaşık bir sığınak oluşturur. Sığınak ortadan kalktığında balık stokları avlanma durdurulsa bile yıllarca eski düzeyine dönemez.

Bu parçada asıl anlatılmak istenen aşağıdakilerden hangisidir?',
  '{"options":["Ağır trol avcılığı, deniz tabanındaki yaşam alanlarını yok ederek balık stoklarının kendini yenilemesini uzun süre engeller.","Balık stoklarının azalmasının tek nedeni, yavru balıkların doğrudan avlanmasıdır.","Deniz çayırları ve süngerler, balıkların beslenmesi açısından hiçbir önem taşımaz.","Avlanma tamamen durdurulduğunda deniz tabanı birkaç ay içinde eski hâline döner.","Trol ağları yalnızca derin okyanus sularında kullanıldığında zarar verir."],"correctIndex":0}'::jsonb,
  'Parça, trol ağlarının yalnızca balıkları değil, yavru balıkların sığınağı olan taban ekosistemini yok ettiğini ve bu yüzden avlanma dursa bile stokların uzun süre toparlanamadığını vurgular.',
  '"Avlanma durdurulsa bile" ifadesi yanlış okunduğunda avlanmanın durmasının stokları hemen kurtaracağı düşünülebilir. Oysa metin, yaşam alanı tahrip edildiği için avlanma dursa dahi iyileşmenin yıllarca geciktiğini anlatır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Çoktan seçmeli sınavlar, binlerce adayın yanıtlarını kısa sürede ve nesnel biçimde puanlama imkânı verir. ....... Öğrenci doğru seçeneği şans eseri mi buldu, yoksa kavramı gerçekten özümseyip yanlış seçenekleri bilinçli olarak mı eledi, puan çizelgesine bakarak anlamak mümkün değildir. Bu nedenle ölçme yalnızca sonuca değil, gerekçelendirme sürecine de yer vermelidir.

Bu parçada boş bırakılan yere düşüncenin akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["Bu sınavlar her derste aynı ölçüde başarılı sonuç verir.","Ne var ki bu hız, öğrencinin sonuca hangi düşünme yoluyla ulaştığını gizler.","Çoktan seçmeli sorularda şans başarısı hiçbir zaman ortaya çıkmaz.","Nesnel puanlama, bütün eğitim sorunlarını tek başına çözer.","Öğrencilerin çoğu, açık uçlu sorularda daha kısa sürede yanıt verir."],"correctIndex":1}'::jsonb,
  'Boşluktan sonraki cümle, adayın doğruyu şansla mı yoksa bilinçli elemeyle mi bulduğunun anlaşılamadığını belirtir. Bu durumu özetleyen köprü cümle, hızın öğrencinin düşünme sürecini gizlediğini ifade eden seçenektir.',
  'İlk cümlede hızlı ve nesnel puanlama övüldüğü için aday çoktan seçmeli testlerin tümüyle yeterli olduğunu savunan bir ifadeye yönelebilir. Oysa sonraki iki cümle bu yöntemin düşünme sürecini göstermeme eksikliğini eleştirir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Resmî duyurular ve sözleşmeler, çoğu zaman yurttaşların anlamakta zorlandığı uzun, devrik ve eski sözcüklerle örülü cümlelerle yazılır. Oysa hukuki ya da idari bir metnin açık ve anlaşılır olması, bilimsel kesinliğinden ödün vermek değildir. İnsanların haklarını ve yükümlülüklerini başkasına ihtiyaç duymadan kavrayabilmesi, sade bir dil gerektirir.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Resmî ve hukuki metinlerin herkesçe anlaşılabilir sade bir dille yazılması, teknik kesinliği bozmaz; yurttaşların haklarını kavramasını sağlar.","Hukuki metinlerin anlaşılır kılınması, kavramların kesinliğini zorunlu olarak ortadan kaldırır.","Sözleşmelerde eski sözcüklerin kullanılması, metnin güvenirliğini artıran tek unsurdur.","Yurttaşlar resmî metinleri anlamak için mutlaka uzman desteği almalıdır.","Bilimsel kesinlik yalnızca uzun ve karmaşık cümlelerle sağlanabilir."],"correctIndex":0}'::jsonb,
  'Yazar, resmî metinlerin sade yazılmasının teknik kesinlikten ödün vermek olmadığını, yurttaşların hak ve yükümlülüklerini bağımsızca anlayabilmesi için sade dilin gerekli olduğunu savunur.',
  'Sade dilin teknik kesinliği bozacağı düşüncesi yaygın bir ön yargı olduğu için aday bunu savunan seçeneğe yönelebilir. Metin ise "ödün vermek değildir" diyerek bu ön yargıyı doğrudan çürütür.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Bilgi güvenliği uzmanları yıllarca kullanıcılardan büyük harf, rakam ve özel işaret içeren karmaşık parolalar oluşturmalarını istedi. Ancak bu katı kurallar, akılda tutması zor diziler doğurduğu için kullanıcıların çoğunu aynı basit kalıplara —örneğin baş harfi büyük bir sözcüğün sonuna yıl ve ünlem eklemeye— itti. Saldırgan yazılımlar da tam olarak bu öngörülebilir kalıpları denediğinden, kısa ama karmaşık görünümlü parolalar yerine anlamlı sözcüklerden oluşan uzun parola cümleleri çok daha yüksek güvenlik sağlamaktadır.

Bu parçadan aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Katı karmaşıklık kuralları, kullanıcıları tahmin edilebilir alışkanlıklara yöneltebilmektedir.","Büyük harf ve rakam içeren her parola, uzun bir parola cümlesinden daha güvenlidir.","Anlamlı sözcüklerden kurulan uzun parolalar, yüksek güvenlik sağlayabilir.","Saldırgan yazılımlar, kullanıcıların sık başvurduğu kalıpları hedef almaktadır.","Akılda tutulması güç kurallar, pratikte beklenmedik güvenlik açıkları doğurabilir."],"correctIndex":1}'::jsonb,
  'Parça, kısa ve karmaşık görünen parolaların öngörülebilir kalıplara dönüştüğünü, uzun parola cümlelerinin ise çok daha güvenli çıktığını belirtir. Dolayısıyla büyük harf ve rakam içeren her parolanın uzun parola cümlesinden daha güvenli olduğu yargısı çıkarılamaz.',
  'İlk cümlede uzmanların yıllarca büyük harf ve özel işaret istediği anlatıldığı için aday bunun hâlâ en güvenli yöntem olduğunu sanabilir. Oysa parça sonraki cümlelerde bu yaklaşımın neden yetersiz kaldığını açıklar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Akarsuların taşkın ovaları, yerleşim yerleri kurulduktan sonra yalnızca önlenmesi gereken bir afet alanı olarak görülür. Oysa doğal akışında bir nehrin mevsimsel taşkınları, dağlardan taşıdığı mineralce zengin alüvyonları ovaya yayarak toprağı her yıl yeniden besler. Taşkınları beton duvarlarla tamamen engelleyen yapılar, yerleşimleri korurken aşağıdaki tarım topraklarını bu doğal yenilenmeden mahrum bırakır.

Bu parçada yazarın taşkınlara bakışı aşağıdakilerden hangisidir?',
  '{"options":["Taşkınların yerleşim yerleri için yararlı bir doğa olayı olduğunu savunmaktadır.","Beton duvarların tarım topraklarının verimini artırdığını ileri sürmektedir.","Taşkınların yalnızca tehlike değil, toprağı besleyen doğal bir döngünün parçası olduğunu vurgulamaktadır.","Akarsu kenarlarına hiçbir koşulda yapı inşa edilmemesi gerektiğini söylemektedir.","Alüvyonların yalnızca dağlık bölgelerde biriktiğini belirtmektedir."],"correctIndex":2}'::jsonb,
  'Yazar, taşkınların yerleşim açısından sorun görülse de aslında toprağı mineralle besleyen doğal bir yenilenme süreci olduğunu, duvarların bu döngüyü kestiğini vurgular.',
  'Yerleşimlerin korunmasından söz edildiği için aday yazarın beton duvarları tamamen olumsuzladığını veya yerleşime tümüyle karşı çıktığını sanabilir. Oysa yazar yalnızca taşkınların ekolojik besleme işlevinin gözden kaçırılmamasını vurgular.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'I. Sonuçta ölçüm yüksek görünse de hedeflenen hizmet kalitesi belirgin biçimde düşer.
II. Bir kurum, çalışan başarısını yalnızca tek bir sayısal ölçüte bağladığında davranışlar hızla o sayıya göre şekillenir.
III. Örneğin bir çağrı merkezinde tek ölçüt görüşmeyi kısa sürede bitirmek olursa çalışanlar, sorunu çözmek yerine müşteriyi başka bir birime aktarır.
IV. Bu aktarım, görüşme süresini kâğıt üzerinde kısaltır ama müşterinin aynı sorunu defalarca anlatmasına yol açar.
V. Dolayısıyla tek bir gösterge hedef hâline getirildiğinde, o gösterge artık gerçek başarının güvenilir ölçüsü olmaktan çıkar.

Bu cümlelerle anlamlı bir paragraf oluşturulduğunda baştan dördüncü cümle hangisi olur?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":0}'::jsonb,
  'Doğru sıralama II - III - IV - I - V biçimindedir. II. cümle genel ilkeyi verir; III. cümle ("Örneğin") somut örneği sunar; IV. cümle ("Bu aktarım") örneğin ilk sonucunu açıklar; I. cümle ("Sonuçta") örneğin genel değerlendirmesini yapar; V. cümle ("Dolayısıyla") bütün parçanın ana sonucunu bağlar. Baştan dördüncü cümle I.''dir.',
  'I. cümle "Sonuçta" ile başladığı için en sonda sanılabilir; ancak "ölçüm yüksek görünse de" ifadesi hâlâ çağrı merkezi örneğindeki görüşme süresi ölçümüne bağlıdır. Tüm parçayı genel bir yasaya bağlayan V. cümle ise "Dolayısıyla" ile en sonda yer alır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'İnsan bedeni, aydınlık ve karanlık döngüsüne göre çalışan bir iç saate sahiptir; hormon salgısı, vücut sıcaklığı ve sindirim hızı bu ritme göre düzenlenir. Gece vardiyasında çalışan kişilerde dış dünyanın saati ile iç biyolojik saat sürekli çatışma hâlindedir. Uzun süre bu düzensizliğe maruz kalmak, yalnızca uyku yoksunluğuna değil, metabolizma ve bağışıklık sorunlarına da zemin hazırlar.

Bu parçada aşağıdakilerden hangisine değinilmemiştir?',
  '{"options":["İç saatin hangi temel bedensel süreçleri düzenlediğine","Gece vardiyasında hangi saatlerin çatıştığına","Uzun süreli vardiya çalışmasının yol açabileceği sorunlara","Vardiya çalışanlarının mesai sürelerinin kaç saat olması gerektiğine","İç biyolojik saatin hangi dış döngüye göre çalıştığına"],"correctIndex":3}'::jsonb,
  'Parçada iç saatin aydınlık-karanlık döngüsüne göre çalıştığı, hormon/sıcaklık/sindirimi düzenlediği, gece vardiyasında iç ve dış saatin çatıştığı ve bunun uyku, metabolizma, bağışıklık sorunları doğurabileceği anlatılır; mesai süresinin uzunluğuna değinilmez.',
  'Gece vardiyası ve uyku yoksunluğu geçtiği için aday çalışma saatleriyle ilgili bir sınırın da verildiğini varsayabilir. Oysa metinde kaç saat çalışılması gerektiğine dair hiçbir ifade yoktur.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Klasik dört yönlü sinyalize kavşaklarda araçlar yüksek hızla kesişme noktasına gelir ve dik açılı çarpışma riski taşır. Buna karşılık ortasında dairesel bir ada bulunan döner kavşaklarda bütün sürücüler hızını düşürüp aynı yönde dönmek zorunda kalır. Bu sayede araçların birbirine dik açıyla çarpma ihtimali büyük ölçüde ortadan kalkar ve kavşaktan geçen trafik akışı daha güvenli hâle gelir.

Bu parçada yazar, düşüncesini geliştirirken ağırlıklı olarak aşağıdakilerden hangisinden yararlanmıştır?',
  '{"options":["Tanık gösterme","Sayısal verilerden yararlanma","Örnekleme","Tanımlama","Karşılaştırma"],"correctIndex":4}'::jsonb,
  'Parça, klasik dört yönlü sinyalize kavşaklar ile döner kavşakları hız, çarpışma açısı ve güvenlik bakımından karşı karşıya koyarak karşılaştırma yoluna gitmektedir.',
  '"Döner kavşak" kavramının biçimi tarif edildiği için aday tanımlama seçeneğine yönelebilir. Oysa metnin omurgası "Buna karşılık" bağlacıyla kurulan iki kavşak türünün güvenlik karşılaştırmasıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Geçmiş uygarlıklara dair bilgimizi uzun süre yalnızca tapınaklar, saraylar ve hükümdar mezarları biçimlendirdi. Oysa bu görkemli yapılar, toplumun yalnızca dar bir yönetici kesiminin yaşamını yansıtıyordu. Günümüzde arkeologlar, sıradan insanların ne yediğini, hangi hastalıklarla boğuştuğunu ve gündelik eşyalarını nasıl onardığını anlamak için eski yerleşimlerin çöplük katmanlarını ve mutfak ocaklarını incelemeye daha fazla ağırlık veriyor.

Bu parçadan aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Anıtsal yapılar, geçmiş toplumların tüm kesimlerini aynı ölçüde temsil etmez.","Eski yerleşimlerdeki çöplük katmanları, gündelik yaşam hakkında önemli ipuçları sunabilir.","Arkeolojik araştırmalarda halkın sıradan yaşamına duyulan ilgi artmıştır.","Saray ve tapınak kalıntıları, arkeoloji bilimi için artık hiçbir değer taşımamaktadır.","Mutfak kalıntıları, geçmiş dönemlerin beslenme alışkanlıklarını aydınlatabilir."],"correctIndex":3}'::jsonb,
  'Parça, eskiden anıtsal yapılara odaklanıldığını, günümüzde ise sıradan halkı anlamak için çöplük ve mutfak kalıntılarına daha fazla ağırlık verildiğini söyler. Bu durum, saray ve tapınakların artık hiçbir değer taşımadığı anlamına gelmez.',
  'Metin sıradan yaşam izlerinin önemini öne çıkardığı için aday eski anıtsal yapıların tamamen önemsizleştiği sonucunu çıkarabilir. Oysa "daha fazla ağırlık veriyor" ifadesi sarayların değersizleştiğini değil, bakış açısının genişlediğini gösterir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Dijital dosyaların boyutunu küçültmek için iki temel yöntem kullanılır: kayıpsız ve kayıplı sıkıştırma. ....... Kayıpsız sıkıştırma, dosyadaki örüntüleri kısaltarak yer kazanır ve açıldığında veriyi tek bir bit bile eksiltmeden geri verir; kayıplı yöntem ise insan gözünün ya da kulağının kolayca fark edemediği ayrıntıları kalıcı olarak atar.

Bu parçada boş bırakılan yere düşüncenin akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["Kayıplı sıkıştırma, metin belgelerinin arşivlenmesinde her zaman ilk tercihtir.","Bu iki yöntem arasındaki temel fark, sıkıştırılan dosya açıldığında özgün verinin bütünüyle geri kazanılıp kazanılamadığıdır.","İnternet hızı arttığı için günümüzde veri sıkıştırmaya artık gerek kalmamıştır.","Kayıpsız sıkıştırma yalnızca ses dosyaları üzerinde uygulanabilir.","İnsan kulağı ses dosyalarındaki bütün frekans farklarını eksiksiz algılar."],"correctIndex":1}'::jsonb,
  'Boşluktan sonraki cümle, kayıpsız yöntemin veriyi eksiksiz geri verdiğini, kayıplı yöntemin ise bazı ayrıntıları kalıcı olarak attığını açıklar. Dolayısıyla araya bu iki yöntemi verinin geri kazanılması ölçütüne göre ayıran cümle gelmelidir.',
  'Kayıpsız ve kayıplı ifadeleri geçtiği için aday kayıplı yöntemin arşivlerde kullanıldığını söyleyen seçeneğe yönelebilir. Oysa kalıcı veri kaybı arşivleme için uygun değildir ve sonraki cümle doğrudan geri kazanım farkını açar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Çevrimiçi platformlar, kullanıcının ekranda daha uzun süre kalması için ona yalnızca ilgilendiği ve onayladığı içerikleri göstermeye yatkındır. İlk bakışta kişiselleştirilmiş bu akış rahatlatıcı gelir; çünkü kişi kendi görüşünü doğrulayan yorumlarla karşılaşır. Ancak zamanla farklı bakış açıları ekrandan silinince birey, herkesin kendisi gibi düşündüğü yapay bir yankı odasının içine hapsolur.

Bu parçada asıl vurgulanan düşünce aşağıdakilerden hangisidir?',
  '{"options":["Kullanıcının yalnızca kendi görüşüne yakın içeriklerle karşılaşması, zamanla farklı düşüncelerden yalıtılmış dar bir algı ortamı yaratır.","Çevrimiçi platformlar, kullanıcıların her konuda karşıt görüşleri eşit oranda görmesini sağlar.","Kişiselleştirilmiş içerik akışı, bireyin eleştirel düşünme gücünü her zaman geliştirir.","İnternette farklı görüşlerle karşılaşan kullanıcılar platformlarda daha uzun süre kalır.","Yankı odası etkisi, yalnızca haber sitelerini düzenli izlemeyen kişilerde ortaya çıkar."],"correctIndex":0}'::jsonb,
  'Parça, platformların kullanıcıya kendi görüşünü doğrulayan içerikleri sunmasının başta rahatlatıcı gelse de farklı görüşleri görünmez kılarak bireyi tek sesli bir yankı odasına hapsettiğini vurgular.',
  '"Rahatlatıcı gelir" ifadesi kişiselleştirmenin olumlu olduğu izlenimini verebilir. Ancak yazar "Ancak" ile bu durumun gerçek sonucunun farklı düşüncelerden yalıtılmak olduğunu belirtir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  '(I) Bitkilerin büyük çoğunluğu ihtiyaç duyduğu azotu topraktan kökleriyle alır. (II) Ancak bataklık gibi aşırı nemli ve asidik topraklarda bakteriler organik maddeleri yeterince ayrıştıramadığı için toprak azot bakımından çok fakir kalır. (III) Bu koşullarda yetişen etçil bitkiler, yapraklarını kapan veya kaygan huni biçiminde özelleştirerek böcekleri yakalar. (IV) Bataklık alanların korunması için uluslararası sözleşmeler imzalanmaktadır. (V) Sindirim enzimleriyle parçaladıkları böceklerden elde ettikleri azot sayesinde, başka bitkilerin yaşayamadığı bu ortamlarda tutunmayı başarırlar.

Bu parçadaki numaralanmış cümlelerden hangisi düşüncenin akışını bozmaktadır?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":3}'::jsonb,
  'Parça, azotça fakir bataklık topraklarında yetişen etçil bitkilerin böcek yakalayarak azot eksiğini nasıl kapattığını anlatmaktadır. IV. cümle ise bataklıkların korunmasına yönelik uluslararası sözleşmelere geçerek biyolojik uyum ekseninden sapar.',
  'IV. cümlede "bataklık alanlar" ifadesi geçtiği için önceki cümlelerle konu bağı varmış gibi görünür. Ancak III. ve V. cümleler etçil bitkilerin böceklerden azot elde etmesini birbirine bağlarken IV. cümle hukuki/çevresel bir konuya atlar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  '(I) Bir mahallede on evin her birinin garajında yılda yalnızca birkaç saat kullanılan birer matkap durur. (II) Ortak bir alet kütüphanesi kurulduğunda ise aynı mahallenin ihtiyacı iki ya da üç nitelikli matkapla kolayca karşılanır. (III) Bu paylaşım modeli, yalnızca hanelerin gereksiz harcamasını azaltmakla kalmaz; üretimde harcanan ham madde ve enerji yükünü de aşağı çeker. (IV) Ne var ki bu düzenin işlemesi, kullanıcıların ödünç aldıkları eşyayı temiz ve sağlam biçimde geri getirme sorumluluğunu benimsemesine bağlıdır.

Bu parçadaki IV. cümlenin işlevi aşağıdakilerden hangisidir?',
  '{"options":["Önceki cümlelerde anlatılan modelin başarısı için gereken temel koşulu belirtmek","Paylaşım ekonomisinin neden hiçbir zaman uygulanamayacağını kanıtlamak","Mahalledeki alet kütüphanesinin kuruluş tarihini aktarmak","Önceki cümlede verilen ekolojik yararı sayısal verilerle desteklemek","Mülkiyet kavramının tarihsel kökenini tanımlamak"],"correctIndex":0}'::jsonb,
  'İlk üç cümle ortak kullanım modelinin ekonomik ve çevresel yararlarını anlatır; IV. cümle ("Ne var ki bu düzenin işlemesi...") bu olumlu modelin sürdürülebilmesi için gereken kullanıcı sorumluluğu koşulunu bildirir.',
  '"Ne var ki" bağlacı olumsuz bir itiraz çağrışımı yaptığı için aday IV. cümlenin modeli tamamen reddettiğini sanabilir. Oysa cümle modeli reddetmez, işlemesi için gereken ön şartı ortaya koyar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Bir uzmanın karmaşık bir problemi adım adım çözmesini izlerken her basamak bize son derece açık ve kolay görünür. Uzmanın akıcı anlatımı zihnimizde "Ben de bunu anladım, kendim de yapabilirim." izlenimi uyandırır. Oysa gerçek sınav ya da uygulama anında, izlerken gözümüzden kaçan ara adımlarda takılırız; çünkü başkasının çözümünü izlemek, zihni kendi çözüm yolunu kurmaya zorlamadığı için sahte bir yeterlik duygusu yaratır.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Başkasının yaptığı çözümü akıcı biçimde izlemek, kişide konuyu gerçekten öğrendiğine dair yanıltıcı bir güven oluşturabilir.","Karmaşık problemler yalnızca uzmanların anlatımını izleyerek tam anlamıyla öğrenilebilir.","Bir konuyu anlamak için kişinin kendi başına deneme yapmasına gerek yoktur.","Uzmanların konuyu akıcı biçimde anlatması, öğrencinin öğrenme hızını her zaman düşürür.","Uygulama sırasında takılmanın tek nedeni, anlatımın yeterince açık olmamasıdır."],"correctIndex":0}'::jsonb,
  'Parça, uzmanı izlerken her adımın kolay görünmesinin "öğrendim" yanılsaması yarattığını, kişi kendi çözmeye çalıştığında ise zihinsel üretim yapmadığı için takıldığını vurgular.',
  'İkinci cümlede "Ben de bunu anladım" duygusu anlatıldığı için aday akıcı anlatımın öğrenmeyi kolaylaştırdığını savunan bir şıkka yönelebilir. Oysa yazar bunu "sahte bir yeterlik duygusu" diyerek eleştirir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  '(I) Günlük beslenmede meyve suyu içmek ile meyvenin kendisini yemek, şeker miktarı aynı görünse bile vücutta farklı tepkiler doğurur. (II) Meyvenin bütününde bulunan posa, sindirim sürecini yavaşlatarak şekerin kana azar azar karışmasını sağlar. (III) Posasından ayrılmış meyve suyundaki şeker ise hızla emilir ve kan şekerinde ani bir yükselişin ardından çabuk gelen bir açlık hissi yaratır. (IV) Beslenme önerileri ise meyvenin hiç tüketilmemesini değil, işlenmemiş tam besinlerin tercih edilmesini kapsar. (V) Özellikle sabah öğününde tam meyve ve sebzeye yer vermek, gün içindeki enerji dengesini daha istikrarlı tutar.

Bu parça iki paragrafa bölünmek istense ikinci paragraf hangi cümleyle başlamalıdır?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":3}'::jsonb,
  'İlk üç cümle tam meyve ile meyve suyunun sindirim ve kan şekeri üzerindeki fizyolojik farkını açıklar. IV. cümle ise bu bilgiden günlük beslenme tercihine ve öneriye geçiş yapar; bu yüzden ikinci paragraf IV. cümleyle başlamalıdır.',
  'III. cümle meyve suyunu anlattığı için II. cümleden ayrılabilir gibi görünür. Ancak II. ve III. cümleler posalı tam meyve ile posasız meyve suyu arasındaki karşılaştırmayı birlikte tamamladığı için bölünme noktası IV. cümledir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Dışarıda lapa lapa yağan karın altında, peronun ıslak taşları boyunca yürüyerek istasyonun saat kulesine baktı. Biraz sonra rayların titrediğini hissedince elindeki yıpranmış bileti sıktı ve ceketinin yakasını kaldırdı. Tren sisin içinden çıkıp perona yanaştığında bekleyen kalabalık hareketlendi; yaşlı adam da çantasını kavrayıp vagon kapısına doğru yürüdü.

Bu parçada ağır basan anlatım biçimi aşağıdakilerden hangisidir?',
  '{"options":["Tartışmacı anlatım","Açıklayıcı anlatım","Öyküleyici anlatım","Betimleyici anlatım","Hem açıklayıcı hem tartışmacı anlatım"],"correctIndex":2}'::jsonb,
  'Parçada bir kişinin peronda yürümesi, rayların titreşmesiyle biletini sıkıp yakasını kaldırması ve tren gelince kalabalıkla birlikte vagon kapısına yönelmesi zaman akışı içinde bir olay örgüsü olarak anlatılmaktadır; bu nedenle ağır basan anlatım biçimi öyküleyici anlatımdır.',
  'Parçada "lapa lapa yağan kar", "ıslak taşlar" ve "sisin içinden" gibi görsel ayrıntılar yer aldığı için betimleyici anlatım güçlü bir çeldiricidir. Ancak betimlemede durağan bir görünüm öne çıkarken bu parçada eylemler art arda gelişir ve belirgin bir olay akışı kurulur.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Uzun açıklıklı asma köprüler tasarlanırken mühendisler yalnızca köprünün kendi ağırlığını ve üzerinden geçecek taşıt yükünü hesaplamaz. Rüzgârın köprü tabliyesinin altından ve üstünden geçerken oluşturduğu basınç farkı, yapıda ritmik bir salınım başlatabilir. Bu nedenle modern asma köprülerin gövdeleri, tıpkı bir uçak kanadı gibi rüzgârı kesintisiz biçimde yönlendiren aerodinamik bir kesitle biçimlendirilir.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Asma köprülerin taşıma kapasitesi yalnızca kullanılan çeliğin kalınlığına bağlıdır.","Uzun asma köprülerin tasarımında yalnızca statik yükler değil, rüzgârın yol açabileceği salınımları önleyecek aerodinamik yapı da gözetilir.","Rüzgâr hızının yüksek olduğu bölgelerde asma köprü inşa edilmemelidir.","Taşıt yükü, asma köprülerde rüzgâr etkisinden her zaman daha büyük bir risk oluşturur.","Uçak kanatlarının tasarım ilkeleri doğrudan köprü mühendisliğinden alınmıştır."],"correctIndex":1}'::jsonb,
  'Parça, asma köprü tasarımında ağırlık ve taşıt yükünün yanında rüzgâr kaynaklı salınım riskinin de hesaplandığını ve bunun için aerodinamik kesit kullanıldığını vurgular.',
  'İlk cümlede kendi ağırlığı ve taşıt yükünden söz edildiği için aday yüklerin tek ya da baskın ölçüt olduğunu sanabilir. Oysa parça "yalnızca ... hesaplamaz" diyerek rüzgâr salınımını ve aerodinamik çözümü öne çıkarır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Doğal çayırlarda büyük otçulların tamamen ortadan kalkması, ilk bakışta bitki örtüsü için bir rahatlama gibi görünebilir. Oysa otlama baskısı kalktığında birkaç hızlı büyüyen uzun ot türü güneş ışığını tekeline alır ve zemine yakın yaşayan onlarca küçük çiçekli bitkiyi gölgede bırakarak yok eder. Kontrollü otlama ise baskın türleri budayarak toprağa ışık inmesini sağlar ve çayırın tür çeşitliliğini canlı tutar.

Bu parçadan aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Büyük otçulların yokluğu, bazı hızlı büyüyen bitkilerin diğer türleri bastırmasına yol açabilir.","Kontrollü otlama, çayır ekosistemindeki bitki çeşitliliğinin korunmasına katkı sağlar.","Otçul hayvanların tamamen uzaklaştırılması, çayırdaki bütün bitki türlerinin sayısını artırır.","Zemine yakın yetişen küçük bitkiler, güneş ışığına erişemediklerinde varlıklarını sürdürmekte zorlanır.","Otlama, baskın ot türlerinin aşırı büyümesini dengeleyen bir etken olabilir."],"correctIndex":2}'::jsonb,
  'Parça, otçulların tamamen ortadan kalkmasının yalnızca hızlı büyüyen birkaç uzun otu avantajlı kıldığını, zemindeki onlarca küçük çiçekli bitkiyi ise yok ettiğini söyler. Bu nedenle bütün bitki türlerinin sayısının arttığı yargısı çıkarılamaz.',
  'İlk cümledeki "bitki örtüsü için bir rahatlama gibi görünebilir" ifadesi, otlamanın bitkiler için her zaman zararlı olduğu izlenimi verebilir. Ancak "Oysa" ile başlayan ikinci cümle bu ilk izlenimi açıkça tersine çevirir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'İnsanlar, büyük zaman, para ya da emek harcadıkları bir işin artık sonuç vermeyeceğini görseler bile o işten vazgeçmekte zorlanır. ....... Oysa geçmişte yapılan harcama hangi karar verilirse verilsin geri gelmeyecektir; akılcı olan, geride kalanı değil bundan sonra doğacak yarar ve zararı tartmaktır.

Bu parçada boş bırakılan yere düşüncenin akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["Bu nedenle bir projeye ne kadar çok bütçe ayrılırsa o projenin başarı olasılığı o ölçüde yükselir.","Çünkü işi bırakmak, o ana dek harcanan emeğin boşa gittiğini kabullenmek anlamına gelir ve zihin bu kaybı kabullenmek istemez.","Zaman içinde yapılan ek harcamalar, başarısız bir girişimi mutlaka kârlı hâle getirir.","Akılcı karar vericiler, yeni bir girişime başlarken hiçbir zaman maliyet hesabı yapmaz.","Geçmişteki yatırımları dikkate almak, gelecekteki zararları bütünüyle ortadan kaldırır."],"correctIndex":1}'::jsonb,
  'Boşluktan önce insanların sonuçsuz bir işten vazgeçmekte zorlandığı söylenir; boşluktan sonraki "Oysa" cümlesi ise geçmiş harcamanın geri gelmeyeceğini belirtir. Dolayısıyla araya vazgeçememenin psikolojik nedenini (harcanan emeğin boşa gittiğini kabullenememe) açıklayan cümle gelmelidir.',
  'Parçada bütçe ve harcama kavramları geçtiği için aday ek harcamanın ya da yüksek bütçenin başarıyı getireceğini savunan seçeneklere yönelebilir. Oysa metin zararlı bir işe sırf geçmiş emek yüzünden devam etme yanılgısını eleştirir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'I. Bu nedenle matbaanın asıl etkisi, kitap sayısını artırmanın ötesinde, bilginin sınanma ve eleştirilme hızını değiştirmesinde görülür.
II. El yazması döneminde bir kitabın çoğaltılması aylar sürer ve her kopyada yeni yazım farklılıkları ortaya çıkardı.
III. Matbaanın icadıyla aynı metnin yüzlerce özdeş kopyası kısa sürede farklı kentlerdeki okurlara ulaşmaya başladı.
IV. Aynı metni aynı anda inceleyen farklı bilginler, metindeki hataları ve çelişkileri birbirleriyle tartışma olanağı buldu.
V. Böylece bireysel düzeltme notları ve yeni gözlemler, sonraki baskılarda hızla ortak bilgi birikimine eklendi.

Bu cümlelerle anlamlı bir paragraf oluşturulduğunda baştan dördüncü cümle hangisi olur?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":4}'::jsonb,
  'Doğru sıralama II - III - IV - V - I biçimindedir. II. cümle matbaa öncesi el yazması dönemini tanıtır; III. cümle matbaayla aynı metnin özdeş kopyalarının yayılmasını anlatır; IV. cümle ("Aynı metni") bu durumun bilginler arasında tartışma başlatmasını verir; V. cümle ("Böylece") bu tartışmaların sonraki baskılara eklenmesini açıklar; I. cümle ("Bu nedenle") matbaanın asıl etkisini özetleyen sonuç cümlesidir. Baştan dördüncü cümle V.''tir.',
  'I. cümle matbaanın genel etkisini söylediği için ara basamak sanılabilir; ancak "Bu nedenle matbaanın asıl etkisi..." ifadesi önceki dört cümlenin anlattığı sürecin nihai sonucunu bağlamaktadır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Tarım arazilerinde kullanılan fazla azot ve fosforlu gübreler, yağmur sularıyla akarsulara ve kıyı denizlerine taşınır. Suya karışan bu besin fazlalığı, yüzeydeki alglerin hızla çoğalmasına yol açar. Ölen algler dibe çöküp bakteriler tarafından parçalanırken sudaki çözünmüş oksijeni tüketir ve balıkların yaşayamadığı "ölü bölgeler" oluşur.

Bu parçaya en uygun başlık aşağıdakilerden hangisidir?',
  '{"options":["Akarsularda Balıkçılık Yöntemleri","Tarımsal Gübrelemenin Denizlerde Ölü Bölgelere Etkisi","Alglerin Endüstriyel Kullanım Alanları","Deniz Suyunun Tuzluluk Oranındaki Değişim","Modern Tarımda Sulama Sistemleri"],"correctIndex":1}'::jsonb,
  'Parça, tarımda kullanılan fazla gübrelerin denizlere taşınarak alg patlaması ve oksijen tükenmesi yoluyla ölü bölgeler oluşturmasını anlatmaktadır; bu zinciri en doğru özetleyen başlık gübrelemenin ölü bölgelere etkisidir.',
  'Metinde algler ve balıklar anıldığı için aday yalnızca alglerin ya da balıkçılığın öne çıktığı bir başlığa yönelebilir. Oysa parçanın temel ekseni tarımsal gübre atıklarının başlattığı ekolojik zincirdir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'İnternette pek çok arama motorunun, video platformunun ya da harita uygulamasının bizden ücret talep etmemesi, bu hizmetlerin maliyetsiz olduğu anlamına gelmez. Sunucuların elektrik giderinden yazılım mühendislerinin maaşına kadar dev bir altyapı, reklam verenlerin ödediği bedellerle ayakta durur. Reklamların etkili olması ise kullanıcının ekranda geçirdiği süreyi ve dijital izlerini sürekli izlemeye dayanır.

Bu parçada asıl anlatılmak istenen aşağıdakilerden hangisidir?',
  '{"options":["İnternet platformlarının sunucu ve yazılım giderleri sanılandan çok daha düşüktür.","Ücretsiz sunulan dijital hizmetler aslında kullanıcı dikkati ve verisi üzerinden finanse edilmektedir.","Ücretli yazılımlar her zaman ücretsiz platformlardan daha kaliteli hizmet sunar.","Reklam verenler, dijital platformların teknik altyapısını doğrudan yönetmektedir.","Kullanıcıların internette geçirdiği süre arttıkça platformların giderleri azalır."],"correctIndex":1}'::jsonb,
  'Parça, ücretsiz görünen dijital hizmetlerin arkasında büyük bir maliyet bulunduğunu ve bu maliyetin kullanıcıların dikkati ile dijital izleri üzerinden işleyen reklam modeliyle karşılandığını vurgular.',
  '"Ücret talep etmemesi" ifadesi platformların tamamen kamusal ya da maliyetsiz işlediği algısı uyandırabilir. Oysa metin, görünen ücretsizliğin ardındaki veri ve dikkat ekonomisini ortaya koyar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'İnsan derisi, güneşten gelen morötesi B ışınlarıyla temas ettiğinde D vitamini sentezleyebilir. Ancak bu ışınların atmosferden geçerek yeryüzüne ulaşabilmesi, güneş ışınlarının geliş açısına bağlıdır. Yüksek enlemlerdeki ülkelerde kış aylarında güneş ufka yakın kaldığı için kişi dışarıda uzun süre dursa bile yeterli D vitamini üretilemez; ayrıca koyu cilt rengi ve güneş koruyucu kremler de sentezi yavaşlatabilir.

Bu parçada aşağıdakilerden hangisine değinilmemiştir?',
  '{"options":["D vitamini sentezini başlatan güneş ışını türüne","Güneş ışınlarının geliş açısının önemine","Kış aylarında yüksek enlemlerde neden üretim yapılamadığına","Cilt renginin ve koruyucu kremlerin etkisine","D vitamini eksikliğinde ortaya çıkan kemik hastalıklarına"],"correctIndex":4}'::jsonb,
  'Parçada morötesi B ışınları, ışınların geliş açısı, kışın yüksek enlemlerde üretimin yetersiz kalması, cilt rengi ve güneş koruyucu kremlerin etkisi anlatılır; eksiklikte görülen kemik hastalıklarına değinilmez.',
  'D vitamini denince akla ilk olarak kemik sağlığı geldiği için aday bu bilginin parçada da yer aldığını sanabilir. Ancak parça yalnızca üretimi etkileyen fiziksel ve biyolojik etkenlere odaklanır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  '(I) Sınavlara hazırlanan pek çok öğrenci, ders notlarındaki tanımları alt alta sıralayıp defalarca okuyarak kalıcı bir öğrenme sağlayacağını düşünür. (II) Oysa tek tek ezberlenen tanımlar arasında anlamlı bir bağ kurulmadığında zihin bu bilgileri dağınık parçalar olarak tutar ve soru biçimi biraz değiştiğinde kullanamaz. (III) Kavram haritaları oluşturarak "hangi kavram hangisinin nedeni, hangisi hangisinin alt başlığı?" sorularını yanıtlamak ise bilgiyi bir ağa dönüştürür. (IV) Böylece yeni bir bilgi geldiğinde zihin onu boşlukta bırakmak yerine mevcut ağın uygun noktasına bağlar.

Bu parçadaki II. cümlenin işlevi aşağıdakilerden hangisidir?',
  '{"options":["Kavram haritalarının hangi derslerde kullanılamayacağını belirtmek","Önceki cümlede anlatılan çalışma alışkanlığının neden yetersiz kaldığını açıklamak","Ezber yönteminin soru çözme hızını nasıl artırdığını örneklemek","Parçanın sonunda önerilen yöntemin uygulanma aşamalarını sıralamak","Öğrencilerin sınav kaygısını azaltan etkenleri ortaya koymak"],"correctIndex":1}'::jsonb,
  'I. cümle öğrencilerin tanımları alt alta okuyarak öğrenmeye çalışma alışkanlığını belirtir; II. cümle ("Oysa") bu yöntemle bağ kurulamadığı için bilginin soru biçimi değiştiğinde kullanılamadığını söyleyerek yöntemin yetersizliğini açıklar.',
  'Parçanın bütünü kavram haritalarını önerdiği için aday II. cümlenin de doğrudan kavram haritasını tanıttığını düşünebilir. Oysa kavram haritası III. cümlede başlar; II. cümle yalnızca ilk cümledeki yöntemin eksikliğini gösterir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  '....... Bu nedenle uluslararası havalimanlarında, metro istasyonlarında ve hastanelerde yalnızca yerel dildeki yazılarla yetinilmez; bavul, merdiven, ilk yardım ya da çıkış yönü gibi kavramlar herkesin ilk bakışta tanıyabileceği sade simgelerle gösterilir. Doğru tasarlanmış bir simge, okumaya gerek bırakmadan saniyeler içinde yön gösterir.

Bu parçanın başına düşüncenin akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["Farklı dilleri konuşan binlerce insanın aynı kamusal alanı paylaştığı mekânlarda yazılı uyarılar çoğu zaman yetersiz kalır.","Günümüzde bütün yolcular, seyahat öncesinde gidecekleri ülkenin dilini öğrenmektedir.","Havalimanı ve metro yapılarında görsel işaretler, yalnızca estetik kaygılarla yerleştirilir.","Basit simgelerin anlamı, toplumdan topluma tamamen farklılaştığı için ortak bir işaret dili kurulamaz.","Karmaşık metinlerle yazılmış tabelalar, acil durumlarda simgelerden daha hızlı okunur."],"correctIndex":0}'::jsonb,
  'Devamındaki "Bu nedenle ... yalnızca yerel dildeki yazılarla yetinilmez" cümlesi, öncesinde farklı dilleri konuşan insanların bulunduğu kamusal alanlarda yazılı uyarıların yetersiz kaldığının söylenmesini gerektirir.',
  'Ortak işaret dilinin kurulamadığını veya simgelerin estetik amaçlı kullanıldığını belirten seçenekler konuya yakın sözcükler içerir. Ancak "Bu nedenle" bağlacı, simgelerin pratik zorunluluğuna yol açan bir dil sorununu gerektirir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Yaz aylarında büyük kentlerin merkezleri, çevrelerindeki kırsal alanlara göre birkaç derece daha sıcak olur. Asfalt yollar, koyu renkli çatılar ve yoğun beton kütleler gün boyu güneş enerjisini emer ve güneş battıktan sonra da bu ısıyı yavaş yavaş havaya salar. Ağaç ve toprak yüzeylerin azlığı buharlaşma yoluyla serinlemeyi kısıtladığından kent geceleri bile yeterince soğuyamaz.

Bu parçadan aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Kent merkezlerindeki sıcaklık, çevredeki kırsal alanlardan daha yüksek ölçülebilmektedir.","Beton ve asfalt yüzeyler, gün içinde soğurdukları ısıyı gece de çevreye yayar.","Güneş battıktan sonra kent merkezlerindeki sıcaklık kırsal alanların altına düşer.","Bitki örtüsünün ve toprak alanların yetersizliği, kentlerin serinlemesini zorlaştırır.","Yüzey malzemelerinin niteliği, bir bölgenin gece sıcaklık düzenini etkileyebilir."],"correctIndex":2}'::jsonb,
  'Parça, gün boyu ısı emen asfalt ve betonun gece ısıyı yavaşça saldığını ve bu yüzden kentlerin geceleri bile yeterince soğuyamadığını anlatır. Kent merkezinin gece sıcaklığının kırsalın altına düştüğü yargısı metinle çelişir.',
  '"Güneş battıktan sonra" ifadesi soğuma beklentisi uyandırdığı için aday geceleri kentlerin kırsaldan daha serin hâle geldiğini sanabilir. Oysa metin geceleri de serinlemenin gerçekleşemediğini vurgular.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  '(I) Kışın göç etmeyip soğuk bölgelerde kalan bazı kuş türleri, sonbahar boyunca binlerce tohumu farklı yerlere saklar. (II) Kış geldiğinde karla örtülü ormanda bu gizli depoları tek tek bularak hayatta kalırlar. (III) Araştırmalar, bu kuşların beyinlerindeki mekânsal bellekten sorumlu bölgenin sonbaharda belirgin biçimde büyüdüğünü göstermektedir. (IV) Buna karşın göçmen kuşların yön bulma becerisi, yerin manyetik alanını ve yıldız konumlarını algılamaya dayanır. (V) Uzun göç rotaları boyunca enerji tasarrufu sağlamak için V biçiminde uçan sürüler, rüzgâr direncini paylaşır.

Bu parça iki paragrafa bölünmek istense ikinci paragraf hangi cümleyle başlamalıdır?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":3}'::jsonb,
  'İlk üç cümle göç etmeyen kuşların tohum saklama davranışını ve bunun mekânsal bellekle ilişkisini anlatır. IV. cümle ("Buna karşın") göçmen kuşların yön bulma ve uçuş düzenine geçer; bu nedenle ikinci paragraf IV. cümleyle başlamalıdır.',
  'III. cümle beyin araştırmasından söz ettiği için yeni bir paragraf başı gibi görünebilir. Ancak o cümle hâlâ tohum saklayan yerli kuşların belleğini açıklamaktadır; asıl konu ve özne değişimi IV. cümlededir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Deniz suyunda sürekli tuzlu nemle temas eden çelik gemi gövdeleri ve iskele ayakları, kısa sürede paslanarak zayıflar. Mühendisler bu aşınmayı yalnızca boyayla durduramayacaklarını bildikleri için gemi gövdesine çinko ya da magnezyum bloklar bağlarlar. Kimyasal olarak demirden daha etkin olan bu metaller, elektrik akımında kendi elektronlarını feda ederek demirin yerine kendileri aşınır; bu yüzden bunlara "kurban anot" adı verilir.

Bu parçadan aşağıdakilerden hangisine ulaşılabilir?',
  '{"options":["Boya kullanımı, tuzlu deniz suyundaki çelik yapıların paslanmasını tek başına ve kesin biçimde önler.","Çelik gemi gövdelerini korumak için kendinden daha az tepkimeye giren metaller gövdeye bağlanır.","Kurban anot yöntemi, çelik yerine daha etkin bir metalin aşınmasını sağlayarak ana yapıyı korur.","Magnezyum ve çinko bloklar, paslanmayı yalnızca tatlı su göllerinde engelleyebilir.","Gemi gövdelerine bağlanan koruyucu metaller hiç aşınmadan ömür boyu kullanılabilir."],"correctIndex":2}'::jsonb,
  'Parça, boyanın tek başına yetmediğini ve demirden daha etkin olan çinko/magnezyum blokların demirin yerine aşınarak gemi gövdesini koruduğunu açıkça anlatmaktadır.',
  'Kurban anotların gövdeye bağlanması, bu blokların paslanmaya karşı dirençli olduğu ve hiç aşınmadığı izlenimini doğurabilir. Oysa metin, bu metallerin bilerek kendi kendilerini aşındırarak çeliği koruduğunu vurgular.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Bilim ve teknoloji alanlarında uzmanlaşma derinleştikçe her çalışma alanı kendi kavramlarını, kısaltmalarını ve yöntem dilini üretiyor. Bu derinleşme kendi alanı içinde büyük bir hız ve incelik sağlıyor; ancak bir iklim bilimciyle bir kent plancısının ya da bir hekimle bir veri mühendisinin aynı masa etrafında birbirini anlamasını güçleştiriyor. Karmaşık sorunların hiçbiri tek bir uzmanlığın sınırları içine sığmadığı için artık uzmanlık kadar disiplinler arası ortak bir dil kurabilmek de değer kazanıyor.

Bu parçada yazarın savunduğu temel görüş aşağıdakilerden hangisidir?',
  '{"options":["Uzmanlaşma, bilimsel ilerlemeyi yavaşlattığı için tümüyle terk edilmelidir.","Karmaşık sorunların çözümü için derin uzmanlığın yanında farklı alanlar arasında anlaşmayı sağlayacak ortak bir dil de gereklidir.","Farklı alanlardaki uzmanların kendi teknik kavramlarını kullanması yasaklanmalıdır.","Hekimlik ve mühendislik gibi alanların sorunları yalnızca kendi içinde çözülebilir.","Disiplinler arası çalışma, her zaman derin uzmanlığın yerini almalıdır."],"correctIndex":1}'::jsonb,
  'Yazar, uzmanlaşmanın hız ve incelik sağladığını kabul etmekle birlikte sorunların tek alana sığmadığını belirterek farklı uzmanlıklar arasında ortak bir dil kurabilmenin önemini savunur.',
  'Uzmanlaşmanın iletişim engeli yarattığı vurgulandığı için aday yazarın uzmanlaşmaya tamamen karşı olduğunu düşünebilir. Oysa ikinci cümle uzmanlaşmanın hız ve incelik sağladığını açıkça kabul eder.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  '(I) Deniz kıyılarındaki kumullar, ilk bakışta rüzgârın savurduğu cansız kum tepeleri gibi görünür. (II) Aslında bu tepeler, fırtınalı günlerde yükselen dalgaların iç kesimlere ulaşmasını engelleyen doğal bir kıyı setidir. (III) Kumul üzerinde kök salabilen dayanıklı kıyı bitkileri, kök ağlarıyla kumu tutarak tepelerin rüzgârla dağılmasını önler. (IV) Yaz turizminde deniz kıyısındaki otellerin doluluk oranı mevsimlere göre değişir. (V) Bitki örtüsü tahrip edilen kumullar ise hızla hareket ederek ardındaki tarım alanlarını ve yolları kum altında bırakabilir.

Bu parçadaki numaralanmış cümlelerden hangisi düşüncenin akışını bozmaktadır?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":3}'::jsonb,
  'Parça, kıyı kumullarının doğal kıyı seti işlevini ve kıyı bitkilerinin kumulları nasıl sabitlediğini anlatır. IV. cümle ise otel doluluk oranlarına geçerek ekolojik ve jeolojik bütünlüğü bozar.',
  'IV. cümlede "deniz kıyısı" ifadesi geçtiği için parçayla ortak bir mekân paylaşıyormuş gibi görünür. Ancak parçanın konusu turizm işletmeciliği değil, kıyı kumullarının doğal koruma işlevidir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Bir semtin yenilenmesiyle artan kiralar, ilk aşamada yalnızca binaların değerlendiğini gösterir gibi durur. Ne var ki kira artışını karşılayamayan eski terzi, fırıncı ve kitapçı dükkânı kapattığında mahallenin yalnızca ticari bileşimi değişmez. Yıllar içinde oluşan komşuluk hafızası, güven ağı ve mahallenin kendine özgü gündelik ritmi de yerini her yerde birbirinin aynısı olan zincir mağazalara bırakır.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Kira artışları nedeniyle eski esnafın çekilmesi, bir mahallenin yalnızca ekonomik yapısını değil toplumsal dokusunu ve kimliğini de değiştirir.","Binaların değerlenmesi, her zaman mahalledeki yaşam kalitesini aynı ölçüde yükseltir.","Zincir mağazalar, eski esnafa kıyasla komşuluk ilişkilerini daha hızlı güçlendirir.","Bir mahallenin kimliği, yalnızca binaların dış cephe görünümüyle belirlenir.","Eski dükkânların kapanması, semt sakinlerinin günlük yaşamını hiçbir biçimde etkilemez."],"correctIndex":0}'::jsonb,
  'Parça, kira artışıyla eski esnafın ayrılmasının sadece ticari bir değişim olmadığını; komşuluk hafızası, güven ağı ve özgün kent ritmini de silip mahalleyi tekdüzeleştirdiğini vurgular.',
  'İlk cümlede "binaların değerlendiğini gösterir" denmesi olumlu bir gelişme algısı yaratabilir. Ancak devamındaki cümleler bu değerlenmenin mahallenin ruhu açısından doğurduğu kaybı anlatır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Güneş ve rüzgâr santralleri temiz elektrik üretir; ancak üretim miktarları hava durumuna ve günün saatine göre sürekli değişir. ....... Bu nedenle enerji dönüşümü yalnızca yeni santraller kurmaktan ibaret değildir; üretilen fazla elektriği saklayabilen batarya ve pompaj sistemleri kurmayı, tüketimi de üretimin bol olduğu saatlere kaydırabilmeyi gerektirir.

Bu parçada boş bırakılan yere düşüncenin akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["Oysa elektrik şebekesi, her saniye üretilen enerji ile tüketilen enerji arasında tam bir denge kurulmasını zorunlu kılar.","Bu yüzden güneş santralleri yalnızca geceleri elektrik üretimi yapabilir.","Yenilenebilir kaynakların payı arttıkça elektrik şebekesinde hiçbir denge sorunu yaşanmaz.","Rüzgâr santralleri, bütün mevsimlerde aynı sabit güçte elektrik üretir.","Tüketim alışkanlıkları, enerji santrallerinin çalışma biçiminden tamamen bağımsızdır."],"correctIndex":0}'::jsonb,
  'İlk cümle üretimin sürekli değiştiğini söyler; boşluktan sonraki cümle ise depolama ve tüketimi kaydırma gerekliliğini belirtir. Bu iki düşünceyi birbirine bağlayan ara halka, elektrik şebekesinin üretim ile tüketim arasında anlık denge gerektirdiğini söyleyen cümledir.',
  'Temiz elektrik vurgusuna kapılan aday şebekede sorun yaşanmadığını söyleyen seçeneğe yönelebilir. Oysa sonraki "Bu nedenle ... yalnızca yeni santraller kurmaktan ibaret değildir" cümlesi bir kısıt ve denge ihtiyacını zorunlu kılar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Karmaşık toplumsal meseleler, çoğu zaman üç beş kelimelik sloganlara ve iki zıt kutba sıkıştırılarak tartışılır. Hızlı paylaşılan bu keskin yargılar dikkat çekmekte etkilidir; fakat nüansları, yerel koşulları ve ara çözümleri görünmez kılar. Oysa gerçek sorunların çözümü, taraflardan birinin diğerini tamamen susturmasından değil, farklı boyutları aynı anda görebilmekten geçer.

Bu parçada asıl vurgulanmak istenen aşağıdakilerden hangisidir?',
  '{"options":["Toplumsal sorunları kısa sloganlara ve ikili karşıtlıklara indirgemek, çözüm için gerekli ayrıntıları gözden kaçırır.","Kısa ve keskin sloganlar, karmaşık meselelerin tüm yönlerini eksiksiz anlatır.","Toplumsal tartışmalarda karşıt görüşlerden yalnızca birinin öne çıkması yeterlidir.","Yerel koşullar, toplumsal sorunların çözümünde dikkate alınması gerekmeyen ayrıntılardır.","Hızlı paylaşılan yargılar, ara çözümlerin herkesçe benimsenmesini kolaylaştırır."],"correctIndex":0}'::jsonb,
  'Yazar, karmaşık meselelerin sloganlara ve iki kutba sıkıştırılmasının dikkat çekse bile nüansları ve ara çözümleri yok ettiğini, çözümün ise çok boyutlu bakışta yattığını vurgular.',
  '"Dikkat çekmekte etkilidir" ifadesi, keskin yargıların tartışma için yararlı sayıldığı izlenimini verebilir. Ancak yazar "fakat" ve "Oysa" bağlaçlarıyla bu yaklaşımın çözüme engel olduğunu ortaya koyar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Çocuklara hiç sınır koymamak kadar bütün kararları onlar adına vermek de sorumluluk gelişimini zedeler. Bunun yerine çocuğa "Mavi kazağı mı yoksa yeşil kazağı mı giymek istersin?" gibi çerçevesi belirlenmiş iki seçenek sunmak, hem sınırları korur hem de çocuğa kendi kararının sonucunu deneyimleme fırsatı verir. Küçük yaşta bu tür seçimler yapan çocuk, ileride daha büyük kararlar alırken de öz güven kazanır.

Bu parçadan aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Sınırsız özgürlük kadar her kararı yetişkinin vermesi de çocuk gelişimi açısından sakıncalıdır.","Çocuğa sınırlı seçenekler sunmak, karar alma becerisinin gelişmesine yardımcı olabilir.","Çerçeveli seçimler, çocuğun kuralları ve sınırları öğrenmesini tamamen engeller.","Küçük kararların sorumluluğunu almak, ileriki yaşlardaki öz güveni destekleyebilir.","Seçeneklerin yetişkin tarafından sınırlandırılması, çocuğun seçim yapmasını ortadan kaldırmaz."],"correctIndex":2}'::jsonb,
  'Parça, çocuğa çerçevesi belirlenmiş iki seçenek sunmanın hem sınırları koruduğunu hem de karar deneyimi kazandırdığını açıkça söyler. Bu nedenle sınırları öğrenmeyi tamamen engellediği yargısı parçayla çelişir.',
  'Sınır koymamakla ilgili eleştiri nedeniyle aday çocuğa seçenek sunmanın da sınırları bozacağını düşünebilir. Oysa metin "hem sınırları korur" diyerek iki yararın birlikte sağlandığını belirtir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Ay''ın kütle çekimi, Dünya''nın ona bakan ve ters yöndeki okyanus sularını kendine doğru çekerek günlük gelgitleri oluşturur. Gelgit sularının okyanus tabanıyla ve kıyı şeridiyle sürtünmesi, Dünya''nın kendi ekseni etrafındaki dönüşünü her yüzyılda saniyenin küçük bir kesri kadar yavaşlatır. Bu nedenle milyonlarca yıl önce Dünya''da bir gün şimdikinden daha kısaydı ve Ay da Dünya''ya bugünkünden biraz daha yakındı.

Bu parçada aşağıdakilerden hangisine değinilmemiştir?',
  '{"options":["Gelgit olayının temel fiziksel nedenine","Gelgit sürtünmesinin Dünya''nın dönüş hızına etkisine","Geçmiş jeolojik dönemlerde günlerin daha kısa olduğuna","Ay''ın yörünge uzaklığının geçmişte daha yakın olduğuna","Ay yüzeyindeki kraterlerin nasıl oluştuğuna"],"correctIndex":4}'::jsonb,
  'Parçada Ay''ın kütle çekiminin gelgit oluşturması, sürtünmenin Dünya''nın dönüşünü yavaşlatması, geçmişte günlerin daha kısa ve Ay''ın daha yakın olması anlatılır; Ay yüzeyindeki kraterlere değinilmez.',
  'Parça Ay''ın fiziksel etkilerini ve milyonlarca yıl öncesini anlattığı için aday Ay yüzeyinin özelliklerine de değinildiğini sanabilir. Oysa metin yalnızca Ay-Dünya kütle çekimi ve gelgit ilişkisiyle sınırlıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'I. Bu yüzden tuz yataklarına sahip yerleşimler ve tuz kervanlarının geçtiği yollar, yüzyıllar boyunca devletlerin en çok koruduğu stratejik noktalar oldu.
II. Soğutma teknolojilerinin bulunmadığı çağlarda avlanan balıkların ve etlerin bozulmadan saklanabilmesi hayati bir sorundu.
III. Tuz, besindeki suyu çekerek mikroorganizmaların çoğalmasını durdurduğu için gıdayı aylarca koruyabilen tek yaygın maddeydi.
IV. Bu koruma özelliği, tuzu yalnızca bir yemek lezzetlendiricisi olmaktan çıkarıp orduların ve uzun deniz yolculuklarının vazgeçilmez erzağına dönüştürdü.
V. Talebin böylesine yüksek olması, tuzun tarih boyunca bazı dönemlerde ödeme aracı ve ağır bir vergi konusu hâline gelmesine yol açtı.

Bu cümlelerle anlamlı bir paragraf oluşturulduğunda baştan üçüncü cümle hangisi olur?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":3}'::jsonb,
  'Doğru sıralama II - III - IV - V - I biçimindedir. II. cümle soğutma öncesi dönemin gıda saklama sorununu verir; III. cümle tuzun bunu nasıl çözdüğünü anlatır; IV. cümle ("Bu koruma özelliği") tuzun stratejik erzağa dönüşmesini belirtir; V. cümle ("Talebin böylesine yüksek olması") bu önemin ekonomik sonucunu açıklar; I. cümle ("Bu yüzden") devletlerin tuz yollarını korumasını genel sonuç olarak bağlar. Baştan üçüncü cümle IV.''tür.',
  'I. cümle devletlerin korumasından söz ettiği için IV.''ün ardından hemen gelebilir gibi görünür; ancak V. cümledeki "Talebin böylesine yüksek olması" ifadesi tuzun vazgeçilmez erzak sayıldığı IV. cümleye doğrudan yaslanır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Ağırlık antrenmanı yapan pek çok kişi, kasların tam olarak ağırlığı kaldırırken büyüdüğünü sanır. Oysa egzersiz sırasında kas liflerinde yalnızca mikroskobik düzeyde küçük yırtıklar oluşur. Asıl büyüme ve güçlenme, antrenmandan sonraki dinlenme ve uyku saatlerinde bedenin bu lifleri eskisinden daha sağlam biçimde onarmasıyla gerçekleşir; bu nedenle ara vermeden aynı kası çalıştırmak gelişimi hızlandırmak yerine aksatır.

Bu parçada aşağıdakilerden hangisine değinilmemiştir?',
  '{"options":["Egzersiz sırasında kas liflerinde meydana gelen duruma","Kas onarımının ve büyümesinin hangi süreçte gerçekleştiğine","Aynı kası dinlendirmeden çalıştırmanın sonucuna","Antrenmanla ilgili yaygın bir yanlış inanışa","Antrenman sırasında uyulması gereken nefes tekniklerine"],"correctIndex":4}'::jsonb,
  'Parçada egzersizle ilgili yaygın yanılgı, kas liflerindeki mikroskobik yırtıklar, büyümenin dinlenme ve uykuda gerçekleşmesi ve aralıksız çalışmanın gelişimi aksatması anlatılır; nefes tekniklerine değinilmez.',
  'Ağırlık antrenmanı konusu geçtiği için aday egzersiz tekniğine dair nefes bilgisi de verildiğini düşünebilir. Oysa metin tamamen yüklenme ve dinlenme arasındaki biyolojik döngüyü açıklar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Kendi doğal ortamında böcekler, mantarlar ve rakip bitkiler tarafından dengede tutulan bir bitki türü, başka bir kıtaya taşındığında bu doğal düşmanlarından kurtulmuş olur. Karşısında onu sınırlayan bir etken kalmadığı için hızla yayılır ve yerli bitkilerin suyunu, ışığını ve toprağını elinden alır. Örneğin Kuzey Amerika''dan Avrupa kıyılarına taşınan bazı su bitkileri, göl yüzeyini kısa sürede halı gibi kaplayarak yerli su canlılarının oksijensiz kalmasına yol açabilmektedir.

Bu parçada yazar, düşüncesini geliştirirken aşağıdakilerden hangilerine başvurmuştur?',
  '{"options":["Tanık gösterme ve sayısal verilerden yararlanma","Tanımlama ve benzetme","Örnekleme ve benzetme","Sayısal verilerden yararlanma ve karşılaştırma","Tanımlama ve tanık gösterme"],"correctIndex":2}'::jsonb,
  'Yazar, "Örneğin Kuzey Amerika''dan Avrupa kıyılarına taşınan..." cümlesiyle örnekleme yapmış; aynı cümlede göl yüzeyinin kaplanmasını "halı gibi" ifadesiyle somutlaştırarak benzetmeden yararlanmıştır.',
  'Parçada iki kıta adı geçtiği için aday karşılaştırma aramaya yönelebilir; ancak burada kıtalar kıyaslanmaz, istilacı türlerin etkisine somut bir örnek verilir ve "halı gibi" benzetmesi kullanılır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Bir yörede kullanılan yerel sözcükler ve deyimler, yalnızca konuşmaya renk katan eski söyleyişler değildir. Deniz kıyısında yaşayan bir topluluğun rüzgâr yönleri için onlarca ayrı ad türetmesi ya da dağlık bir köyde kar türlerinin her aşamasına farklı bir sözcük verilmesi, dilin coğrafyayla ve geçim biçimiyle nasıl örüldüğünü gösterir. Bu yerel söz varlığı kaybolduğunda yalnızca kelimeler değil, doğayı okuma bilgisi de silinir.

Bu parçadan aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Yerel sözcükler, bir toplumun yaşadığı coğrafyayla kurduğu ilişkiyi yansıtabilir.","Farklı geçim biçimleri, dilde belirli kavramların ayrıntılanmasına yol açabilir.","Yerel söz varlığının yitirilmesi, doğayla ilgili birikimin de kaybolmasına neden olabilir.","Deniz ve dağ yaşamı gibi koşullar, günlük dilin kelime çeşitliliğini etkileyebilir.","Standart dil geliştikçe yerel ağızlardaki bütün sözcüklerin unutulması doğaldır ve kayıp sayılmaz."],"correctIndex":4}'::jsonb,
  'Parça, yerel söz varlığı kaybolduğunda yalnızca kelimelerin değil doğayı okuma bilgisinin de silindiğini vurgular. Bu nedenle unutulmasının kayıp sayılmadığı yargısı parçayla taban tabana zıttır.',
  'Yerel sözcüklerin yalnızca konuşmaya renk katmadığı belirtildiğinde aday standart dilin bunların yerini doldurabileceği sonucuna kayabilir. Oysa son cümle bu kaybın bilgi kaybı olduğunu açıkça vurgular.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Çelik demir yolu rayları, yaz sıcağında uzar, kış soğuğunda ise kısalır. Geçmişte mühendisler, rayların sıcak havalarda birbirini iterek bükülmesini önlemek amacıyla ray parçaları arasında küçük genleşme boşlukları bırakırdı. Ancak bu boşluklar tren tekerlekleri geçerken gürültüye ve aşınmaya yol açtığı için modern hızlı tren hatlarında raylar özel tekniklerle gerilerek birbirine kaynaklanır; böylece .......

Bu parçanın sonuna düşüncenin akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["rayların arasındaki boşluklar daha da genişletilerek gürültü artırılmış olur.","rayların sıcaklıkla uzama özelliği bütünüyle ortadan kaldırılmış olur.","hatlar yalnızca kış aylarında kullanılabilecek biçimde sınırlandırılır.","demir yolu yapımında çelik yerine tamamen ahşap malzemeye geçilir.","boşlukların yarattığı sarsıntı ve aşınma olmadan yüksek hızda güvenli yolculuk sağlanır."],"correctIndex":4}'::jsonb,
  'Parça, eski ray boşluklarının bükülmeyi önlese de gürültü ve aşınmaya yol açtığını, modern hatlarda ise rayların özel tekniklerle gerilip kaynaklandığını anlatır. "Böylece" ile gelen sonuç, boşlukların yol açtığı sarsıntı ve aşınma ortadan kalkarak yüksek hızda güvenli yolculuğun sağlandığını bildirmelidir.',
  'Rayların kaynaklanması, çeliğin sıcaklıkla genleşme yasasının yok edildiği gibi yanlış bir sonuca götürebilir. Oysa fizik yasası ortadan kalkmaz; yalnızca kaynak ve gerdirme tekniğiyle boşluksuz ve pürüzsüz bir hat elde edilir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Enflasyon çoğu zaman yalnızca market rafındaki etiketlerin yükselmesi olarak hissedilir. Oysa fiyatların sürekli ve öngörülemez biçimde artması, bireylerin ve işletmelerin gelecek yılki maliyetleri hesaplamasını imkânsız kılar. Yarının fiyatını kestiremeyen bir üretici uzun vadeli yatırıma cesaret edemez, hane halkı da birikim yapmak yerine parasının değerini kaybetmeden hemen tüketime yönelir.

Bu parçada asıl anlatılmak istenen aşağıdakilerden hangisidir?',
  '{"options":["Enflasyon, yalnızca alım gücünü düşürmekle kalmaz; öngörülebilirliği yok ederek yatırım ve tasarruf kararlarını da bozar.","Fiyat artışları, tüketicilerin uzun vadeli birikim yapmasını her zaman kolaylaştırır.","Üreticiler, enflasyon dönemlerinde gelecek yılki maliyetleri daha kesin biçimde hesaplar.","Market etiketlerindeki artışlar, enflasyonun ekonomi üzerindeki tek etkisidir.","Enflasyon ortamında hemen tüketime yönelmek, uzun vadeli yatırımları hızlandırır."],"correctIndex":0}'::jsonb,
  'Parça, enflasyonun yalnızca etiket artışı olarak görülmemesi gerektiğini, öngörülemezlik yüzünden üreticinin yatırımdan kaçtığını ve hanelerin tasarruf yerine erken tüketime yöneldiğini anlatır.',
  'İlk cümlede market etiketleri anıldığı için aday enflasyonun yalnızca günlük fiyat artışı boyutuna odaklanabilir. Oysa "Oysa" ile başlayan devam cümleleri, asıl tahribatın öngörülebilirlik ve planlama üzerinde olduğunu gösterir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  '(I) Okuryazarlık denince çoğu kişinin aklına yalnızca basılı ya da dijital metinleri okuyup anlayabilmek gelir. (II) Oysa güncel ekonomi, sağlık ve çevre tartışmalarının neredeyse tamamı tablolar, haritalar ve grafiklerle sunulmaktadır. (III) Eksen başlıkları, ölçek aralıkları veya başlangıç noktası incelenmeden bakılan bir grafik, küçük bir artışı dev bir sıçrama gibi gösterebilir. (IV) Özellikle seçim dönemlerinde seçmen eğilimlerini gösteren renkli haritalar medya kuruluşlarınca sıkça paylaşılır. (V) Yüzölçümü büyük ama nüfusu seyrek bölgelerin haritada geniş yer kaplaması, gerçek seçmen dağılımını olduğundan farklı algılamamıza yol açabilir.

Bu parça iki paragrafa bölünmek istense ikinci paragraf hangi cümleyle başlamalıdır?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":3}'::jsonb,
  'İlk üç cümle genel okuryazarlık kavramını grafik ve ölçek yorumlama üzerinden ele alır. IV. cümle ise seçim dönemlerindeki haritalar ve nüfus/yüzölçümü algısı gibi özel bir alana geçer; bu yüzden ikinci paragraf IV. cümleyle başlamalıdır.',
  'II. cümlede "haritalar" sözü geçtiği için IV. cümleyle tek blokmuş gibi görünebilir. Ancak II. ve III. cümleler grafik eksenleri ve ölçek okuma sorununu sürdürürken IV. cümle seçim haritaları ve medya paylaşımı örneğine geçerek yeni bir alt başlık açar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  '(I) Evde yankıyı azaltmak için duvarlara yapıştırılan sünger panellerle komşu daireden gelen sesi engellemek için yapılan duvar dolgusu aynı işlevi görmez. (II) Gözenekli ve hafif süngerler oda içindeki ses dalgalarının sert yüzeylerden sekmesini azaltarak akustiği iyileştirir; ancak sesin duvarı aşmasını durduracak kütleye sahip değildir. (III) Ses yalıtımı ise ağır, yoğun ve hava sızdırmaz katmanlar kullanarak ses enerjisinin bir mekândan diğerine geçmesini engellemeye dayanır. (IV) Bu ayrımı bilmeyen pek çok kişi, yanlış malzeme seçtiği için masraf yaptığı hâlde gürültü sorununu çözemez.

Bu parçadaki IV. cümlenin işlevi aşağıdakilerden hangisidir?',
  '{"options":["Önceki cümlelerde açıklanan teknik farkın gündelik yaşamdaki sonucunu belirtmek","Ses yalıtımında kullanılan malzemelerin üretim maliyetini karşılaştırmak","Sünger panellerin oda içindeki akustiği nasıl bozduğunu örneklemek","I. cümlede ortaya konulan yargıya tamamen karşı çıkmak","Hava sızdırmaz katmanların fiziksel tanımını yapmak"],"correctIndex":0}'::jsonb,
  'İlk üç cümle ses emilimi (akustik düzenleme) ile ses yalıtımı arasındaki teknik farkı açıklar; IV. cümle ("Bu ayrımı bilmeyen pek çok kişi...") bu teknik ayrımın bilinmemesinin pratikte yol açtığı olumsuz sonucu bildirir.',
  'IV. cümlede "masraf yaptığı hâlde" ifadesi geçtiği için aday bunu maliyet karşılaştırması sanabilir. Oysa cümle fiyatları kıyaslamaz, yanlış malzeme seçiminin doğurduğu pratik sonucu özetler.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'I. Bu sayede bilim insanları, yüzyıllar önce yaşanmış kuraklıkların tam olarak hangi yıllarda başladığını ağaçları kesmeden çıkarabilmektedir.
II. Ağaç gövdelerindeki büyüme halkaları yalnızca ağacın yaşını söylemekle kalmaz.
III. Yağışın bol olduğu yıllarda ağaç hızla büyüdüğü için geniş bir halka, kurak yıllarda ise çok dar bir halka oluşur.
IV. Aynı bölgedeki farklı ağaçların halka örüntüleri birleştirildiğinde geçmişe uzanan kesintisiz bir iklim takvimi elde edilir.
V. Üstelik bu halkalar, kalem kalınlığında ince bir burguyla alınan küçük örnekler üzerinden de incelenebilir.

Bu cümlelerle anlamlı bir paragraf oluşturulduğunda baştan ikinci cümle hangisi olur?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":2}'::jsonb,
  'Doğru sıralama II - III - IV - V - I biçimindedir. II. cümle büyüme halkalarının yaştan fazlasını anlattığını söyler; III. cümle yağışlı ve kurak yıllarda halka kalınlığının nasıl değiştiğini açıklar; IV. cümle bu halka örüntülerinin iklim takvimi oluşturduğunu belirtir; V. cümle ("Üstelik bu halkalar") inceleme yöntemini ekler; I. cümle ("Bu sayede... ağaçları kesmeden") V.''teki yöntemin sonucunu bağlar. Baştan ikinci cümle III.''tür.',
  'IV. cümle halka örüntülerinden söz ettiği için II.''nin hemen ardından gelebilirmiş gibi görünür. Ancak "halka örüntüleri" ifadesi, geniş ve dar halkaların nasıl oluştuğunu açıklayan III. cümleden sonra anlam kazanır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  '(I) Anadolu''nun pek çok bölgesinde yüzyıllar boyunca kullanılan kerpiç ve taş yapılar, yerel iklime kendiliğinden uyum gösteren özellikler taşır. (II) Kalın kerpiç duvarlar yaz sıcağını gün boyu dışarıda tutarken kışın içerideki ısının hızla kaçmasını yavaşlatır. (III) Yapımında çevreden çıkarılan toprak ve saman kullanıldığı için doğaya yabancı atık bırakmaz. (IV) Geleneksel halı dokumacılığında kullanılan yün iplikler, kök boyalarla renklendirildikten sonra güneşte kurutulur. (V) Günümüzde sürdürülebilir mimari akımları, bu eski yapı bilgisini modern mühendislik ilkeleriyle yeniden yorumlamaktadır.

Bu parçadaki numaralanmış cümlelerden hangisi düşüncenin akışını bozmaktadır?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":3}'::jsonb,
  'Parça, Anadolu''daki geleneksel kerpiç ve taş yapıların iklim uyumu, ısı yalıtımı ve çevre dostu yönlerini anlatmaktadır. IV. cümle ise geleneksel halı dokumacılığına geçerek konu bütünlüğünü bozar.',
  'IV. cümlede "geleneksel" bir zanaattan söz edildiği için V. cümledeki "eski yapı bilgisi" ile bağlantılıymış izlenimi verebilir. Ancak parçanın konusu el sanatları değil, yerel yapı malzemeleri ve mimaridir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Taş duvarlı loş atölyenin ortasında duran ahşap tezgâh, yılların bıraktığı kil lekeleriyle kaplıydı. Yüksek pencereden süzülen ikindi ışığı, raflarda yan yana dizilmiş henüz pişmemiş testilerin nemli yüzeylerinde mat bir parıltı bırakıyordu. Köşedeki eski sobanın üzerinde kaynayan çaydanlığın ince buharı, odadaki ıslak toprak kokusuna karışıp tavan kirişlerine doğru yükseliyordu.

Bu parçada ağır basan anlatım biçimi aşağıdakilerden hangisidir?',
  '{"options":["Öyküleyici anlatım","Açıklayıcı anlatım","Tartışmacı anlatım","Betimleyici anlatım","Hem açıklayıcı hem tartışmacı anlatım"],"correctIndex":3}'::jsonb,
  'Parçada bir olay örgüsü ya da zaman içinde gelişen bir eylem zinciri yoktur; yalnızca bir çömlekçi atölyesinin görsel, dokunsal ve kokusal ayrıntıları (loş atölye, kil lekeleri, ikindi ışığı, nemli yüzey, ıslak toprak kokusu) durağan bir tablo gibi gözler önüne serilmektedir. Bu nedenle ağır basan anlatım biçimi betimleyici anlatımdır.',
  'Parçada "süzülen", "yükseliyordu" gibi fiiller geçtiği için aday hareket çağrışımıyla öyküleyici anlatıma yönelebilir. Oysa burada bir karakterin başından geçen olaylar değil, yalnızca bir mekânın görünümü ve atmosferi anlatılmaktadır.',
  array['lisans_gygk']::text[],
  'lisans'
),
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
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  'Beş katlı bir apartmanın 1''den 5''e kadar numaralandırılmış katlarının her birinde Ali, Burcu, Can, Deniz ve Elif''ten biri oturmaktadır. Bu kişilerin meslekleri doktor, öğretmen, mühendis, avukat ve mimardır. Kişilerin katları ve meslekleriyle ilgili şunlar bilinmektedir:
- Burcu 2. kattadır ve mühendis değildir.
- Avukat 5. kattadır; mühendis ise avukatın iki kat altındadır.
- Doktor, öğretmenin hemen üstündeki kattadır.
- Can, Ali''nin hemen altındaki kattadır ve Ali 5. katta değildir.
- Deniz 1. katta değildir ve mimar değildir.

Buna göre 4. katta oturan kişi ve mesleği aşağıdakilerden hangisidir?',
  '{"options":["Burcu - Doktor","Can - Mühendis","Deniz - Avukat","Ali - Mimar","Elif - Öğretmen"],"correctIndex":3}'::jsonb,
  'Avukat 5. katta, mühendis 3. kattadır. Doktor öğretmenin hemen üstünde olduğu için boş kalan ardışık katlar yalnızca 1 ve 2''dir; bu nedenle 1. kat öğretmen, 2. kat doktor (Burcu) olur ve 4. kata mimar kalır. Can, Ali''nin hemen altında olup Ali 5. katta olmadığından Can 3. katta (mühendis), Ali 4. katta (mimar) oturur. Deniz 1. katta olmadığına göre 5. katta (avukat), Elif ise 1. katta (öğretmen) oturur.',
  'Can ile Ali''nin 4 ve 5. katlara yerleştirilmesi olası görünse de "Ali 5. katta değildir" ve "Deniz mimar değildir" koşulları birlikte değerlendirildiğinde 4. katta yalnızca Ali (mimar) yer alabilir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  'Bir üniversitede pazartesiden cumaya kadar beş gün boyunca her gün yalnızca bir kişi (Aylin, Barış, Cemil, Derya ve Emre) tarih, coğrafya, ekonomi, hukuk ve sosyoloji konularından birinde seminer verecektir. Programla ilgili şunlar bilinmektedir:
- Ekonomi semineri çarşamba günüdür.
- Sosyoloji semineri, coğrafya seminerinden hemen önceki gündür.
- Aylin hukuk semineri verecektir ve sunumu cuma günü değildir.
- Barış, tarih seminerini pazartesi değil ama Emre''den önceki bir günde verecektir.
- Derya, Cemil''den hemen sonraki gün sunum yapacaktır ve konusu coğrafya değildir.
- Cemil''in konusu coğrafya değildir.

Buna göre perşembe günü hangi kişi hangi konuda seminer verecektir?',
  '{"options":["Cemil - Sosyoloji","Emre - Coğrafya","Barış - Tarih","Derya - Sosyoloji","Aylin - Hukuk"],"correctIndex":3}'::jsonb,
  'Çarşamba ekonomi olduğuna göre ardışık sosyoloji-coğrafya ikilisi yalnızca perşembe-cuma olabilir (pazartesi-salıda Barış salı günü tarih verecektir; çünkü pazartesi değil ve çarşamba ekonomi). Böylece salı Barış (tarih), pazartesi Aylin (hukuk) olur. Kalan günlerden çarşamba için Derya Cemil''den hemen sonra olduğundan Cemil-Derya ikilisi çarşamba-perşembe yerleşir ve cuma Emre (coğrafya) kalır. Perşembe günü Derya sosyoloji semineri verir.',
  'Cemil ve Derya''nın perşembe-cuma günlerine yerleşebileceği düşünülebilir; ancak "Derya''nın konusu coğrafya değildir" koşulu bu olasılığı eler ve perşembe gününe Derya''yı (sosyoloji) sabitler.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  'Arda, Begüm, Cihan, Damla ve Erdem adlı beş araştırmacı; Ankara, İzmir ve Trabzon''daki konferanslara gidecektir. Her kente en az bir, en fazla iki kişi gidecek biçimde yapılan görevlendirmede şunlar bilinmektedir:
- Ankara''ya yalnızca bir kişi gidecektir.
- Arda ile Damla aynı kente gidecektir.
- Begüm İzmir''e gitmeyecektir ve Cihan ile aynı kente gidecektir.
- Erdem Trabzon''a gitmeyecektir.

Buna göre aşağıdakilerden hangisi kesinlikle doğrudur?',
  '{"options":["Erdem İzmir''e gidecektir.","Cihan Ankara''ya gidecektir.","Arda Trabzon''a gidecektir.","Damla İzmir''e gidecektir.","Begüm Ankara''ya gidecektir."],"correctIndex":3}'::jsonb,
  'Ankara''ya yalnızca 1 kişi gidebildiğinden ikişer kişilik iki grup olan Arda-Damla ve Begüm-Cihan Ankara''ya gidemez; dolayısıyla Ankara''ya tek kalan Erdem gider. Begüm İzmir''e gitmediğine göre Begüm ve Cihan Trabzon''a, Arda ve Damla ise İzmir''e gider. Bu nedenle Damla''nın İzmir''e gideceği kesindir.',
  'Erdem''in Trabzon''a gitmeyeceği söylendiği için aday doğrudan Erdem''i İzmir''e yerleştirebilir. Ancak ikişer kişilik iki çift Ankara''ya sığamadığından Ankara''ya mutlaka tek kalan Erdem gitmelidir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  'Bir rafa soldan sağa 1''den 6''ya kadar numaralandırılmış yerlere 2 kırmızı, 2 mavi, 1 sarı ve 1 yeşil dosya aşağıdaki kurallara göre dizilecektir:
- Aynı renkteki iki dosya yan yana olmayacaktır.
- Yeşil dosya, sarı dosyanın hemen solunda olacaktır.
- Sarı dosya 1. sırada, yeşil dosya da 1. sırada olmayacaktır.
- 1. ve 6. sıradaki dosyalar farklı renklerde olacaktır.
- 2. sıradaki dosya mavi olmayacaktır.

Buna göre 2. sıradaki dosya için aşağıdakilerden hangisi kesinlikle doğrudur?',
  '{"options":["Kesinlikle kırmızı renktedir.","1. sıradaki dosya ile aynı renktedir.","Kesinlikle yeşil renktedir.","Sarı renktedir.","Kırmızı veya yeşil renktedir."],"correctIndex":4}'::jsonb,
  '2. sıradaki dosya mavi olamaz. Eğer 2. sıradaki dosya sarı olsaydı hemen solundaki 1. sıraya yeşil dosya gelirdi; ancak yeşil dosyanın 1. sırada olmadığı verilmiştir. Dolayısıyla 2. sıradaki dosya sarı da olamaz. Tüm kuralları sağlayan beş farklı dizilimde 2. sırada yalnızca kırmızı ya da yeşil dosya bulunabilmektedir.',
  'Yeşil-sarı ikilisi blok hâlinde hareket ettiği için aday 2. sıranın sarı olabileceğini düşünebilir. Oysa yeşil dosyanın 1. sırada bulunamaması, sarı dosyanın da 2. sırada yer almasını engeller.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  'Ece, Fatih, Gökhan ve Hale adlı dört sporcu bir koşu yarışmasında ilk dört dereceyi (1., 2., 3., 4.) paylaşmıştır. Her biri Bursa, Eskişehir, Konya ve Samsun''dan birini temsil etmektedir. Yarışmayla ilgili şunlar bilinmektedir:
- Eskişehir temsilcisi 1. olmuştur.
- Ece, Fatih''in hemen arkasındaki dereceyi almıştır.
- Bursa temsilcisi, Gökhan''dan daha iyi bir derece elde etmiştir.
- Hale 4. olmamıştır ve Samsun temsilcisi değildir.
- Gökhan 2. olmamıştır ve Konya temsilcisi değildir.
- Fatih Konya temsilcisidir.

Buna göre 3. olan sporcu ve temsil ettiği şehir aşağıdakilerden hangisidir?',
  '{"options":["Hale - Eskişehir","Fatih - Konya","Ece - Samsun","Gökhan - Samsun","Ece - Bursa"],"correctIndex":4}'::jsonb,
  'Fatih (Konya) 1. olamaz (1. Eskişehir). Fatih 3. olsaydı Ece 4. olurdu, bu durumda Gökhan 2. olamayacağı için 2. sıraya Hale kalır ve Eskişehir temsilcisi 1. olamazdı (Gökhan 1. olursa Bursa ondan iyi olamaz). Bu yüzden Fatih 2., Ece 3. olmalıdır. Gökhan 2. olamadığı ve Bursa temsilcisinden geride kaldığı için 4.dür; 1. ise Hale (Eskişehir) olur. Ece''ye Bursa, Gökhan''a Samsun kalır.',
  'Fatih ve Ece ardışık olduğu için aday ikisini 3. ve 4. sıralara yerleştirmeyi deneyebilir. Ancak Gökhan''ın 1. olması "Bursa temsilcisi Gökhan''dan iyi derece almıştır" koşuluyla çeliştiğinden tek çözüm Fatih''in 2., Ece''nin 3. olmasıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  'Bir kafede oturan Defne, Emre, Furkan ve Gizem; kahve, çay ve limonatadan birer içecek, börek ve poğaçadan birer yiyecek sipariş etmiştir. Siparişlerle ilgili şunlar bilinmektedir:
- Üç içeceğin her birinden en az bir kişi sipariş vermiştir.
- Yalnızca bir kişi poğaça seçmiştir.
- Defne çay içmiştir ve Furkan ile aynı yiyeceği seçmiştir.
- Emre kahve içmemiştir ve poğaça seçmemiştir.
- Limonata içen kişi börek seçmemiştir.

Buna göre aşağıdakilerden hangisi kesinlikle doğrudur?',
  '{"options":["Furkan limonata içmiştir.","Emre limonata içmiştir.","Gizem kahve içmiştir.","Defne poğaça seçmiştir.","Gizem limonata içmiş ve poğaça seçmiştir."],"correctIndex":4}'::jsonb,
  'Yalnızca 1 kişi poğaça seçtiğinden aynı yiyeceği seçen Defne ve Furkan börek seçmiştir. Emre de poğaça seçmediğine göre poğaça seçen tek kişi Gizem''dir. Limonata içen kişi börek seçmediğine (yani poğaça seçtiğine) göre limonata içen tek kişi de Gizem''dir. Emre kahve içmediği için çay içmiş, üç içeceğin de seçilebilmesi için Furkan kahve içmiştir.',
  'Emre kahve içmediği için limonata içmiş olabileceği düşünülebilir. Ancak limonata içen kişinin börek seçememesi ve poğaça seçen tek kişinin Gizem olması, limonatayı da yalnızca Gizem''e bağlar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  2,
  'Altı vagondan oluşan bir trende A, B, C, D, E ve F vagonları lokomotifin arkasından 1''den 6''ya kadar numaralandırılarak sıralanmıştır. Vagonların sırasıyla ilgili şunlar bilinmektedir:
- E vagonu 6. sıradadır.
- D vagonu 1. sırada değildir.
- B vagonu, A vagonunun hemen arkasındadır.
- C vagonu, A vagonundan daha önde bir sıradadır.
- C vagonu ile F vagonu arasında tam iki vagon vardır ve F vagonu B vagonundan daha arkadadır.

Buna göre 4. sırada hangi vagon bulunmaktadır?',
  '{"options":["D","A","B","C","F"],"correctIndex":4}'::jsonb,
  'C ile F arasında tam 2 vagon olduğuna ve 6. sırada E bulunduğuna göre (C, F) çifti yalnızca (1, 4) ya da (2, 5) olabilir. Eğer C 2., F 5. sırada olsaydı C''den arkada ve F''den önde olan (A, B) ikilisi 3 ve 4. sıraya yerleşir, böylece 1. sıraya tek kalan D geçerdi; ancak D 1. sırada değildir. Bu nedenle C 1., F 4., A 2., B 3., D 5. ve E 6. sıradadır.',
  'C ve F arasındaki iki vagonun A ile B olduğu varsayıldığında (2, 5) yerleşimi doğru gibi görünür. Ancak bu durumda 1. sırada kalacak tek vagonun D olması koşulla çelişir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  'İrem, Kaan, Lale ve Mert; salı, çarşamba, perşembe ve cuma günlerinde birer gün kütüphaneden tarih, roman, biyografi ve deneme türlerinden farklı birer kitap ödünç almıştır. Konuyla ilgili şunlar bilinmektedir:
- Tarih kitabı salı günü ödünç alınmıştır.
- Deneme kitabı, roman türündeki kitaptan hemen önceki gün alınmıştır.
- Mert, İrem''den iki gün sonra kitap almıştır.
- Kaan cuma günü kitap almamıştır ve biyografi türünü seçmemiştir.
- Lale roman ve tarih türlerini almamıştır.
- İrem biyografi türünü almamıştır.

Buna göre perşembe günü kim hangi tür kitabı almıştır?',
  '{"options":["Kaan - Deneme","Mert - Roman","İrem - Tarih","Lale - Biyografi","Mert - Deneme"],"correctIndex":1}'::jsonb,
  'Mert İrem''den iki gün sonra aldığı için (İrem, Mert) ikilisi ya (Salı, Perşembe) ya da (Çarşamba, Cuma) olur. Eğer (Çarşamba, Cuma) olsaydı ardışık Deneme-Roman günleri ya çarşamba-perşembe (bu durumda Lale perşembe günü roman almış olur ve kural bozulur) ya da perşembe-cuma (bu durumda İrem çarşamba biyografi almış olur ve kural bozulur) olurdu. Bu nedenle İrem salı (tarih), Mert perşembe olur; Deneme-Roman çarşamba-perşembe yerleşir; cuma Lale biyografi, çarşamba Kaan deneme alır.',
  'İrem''i çarşamba gününe yerleştirmek ilk adımda mümkün görünür; ancak "İrem biyografi almamıştır" ve "Lale roman ile tarih almamıştır" koşulları birlikte işletildiğinde İrem''in salı, Mert''in perşembe olduğu tek çözüm kalır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  2,
  'Tek kişilik sıra hâlindeki 1''den 5''e kadar numaralı beş koltukta Ozan, Pınar, Rıza, Seda ve Tarık oturmaktadır. Yolculardan yalnızca Pınar ve Seda kadındır. Oturma düzeniyle ilgili şunlar bilinmektedir:
- Kadın yolcular yan yana koltuklarda oturmamaktadır.
- Ozan ile Tarık arasında tam bir yolcu oturmaktadır.
- Rıza 1. veya 5. koltukta değildir ve Seda''nın hemen solundadır.
- Pınar 1. koltukta değildir ve Tarık''ın hemen sağındadır.

Buna göre 3. koltukta oturan yolcu kimdir?',
  '{"options":["Tarık","Pınar","Rıza","Seda","Ozan"],"correctIndex":4}'::jsonb,
  'Rıza Seda''nın hemen solunda ve 1. ya da 5. koltukta değilse (Rıza, Seda) ikilisi (2, 3), (3, 4) veya (4, 5) olabilir. Pınar Tarık''ın hemen sağında ve Ozan ile Tarık arasında 1 kişi varsa diziliş (Tarık, Pınar, Ozan) ya da (Ozan, ..., Tarık, Pınar) şeklindedir. Kadınlar yan yana olamayacağından tek geçerli yerleşim: 1. Tarık, 2. Pınar, 3. Ozan, 4. Rıza, 5. Seda olur. 3. koltukta Ozan oturmaktadır.',
  'Ozan ile Tarık''ın yerlerini değiştirerek (Ozan 1., Tarık 3., Pınar 4.) kurmaya çalışmak kadınlar olan Pınar ve Seda''nın veya Rıza ile Seda''nın yerlerini çakıştırır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  2,
  'Bir yarışmada yalnızca bir kişi birinci olmuştur ve birinci olan kişi Alp, Bilge, Cem ya da Duru''dan biridir. Dördünün söyledikleri aşağıdadır:
- Alp: "Birinci olan ben değilim."
- Bilge: "Birinci olan Cem ya da Duru''dur."
- Cem: "Birinci olan Duru değildir."
- Duru: "Birinci olan Bilge''dir."

Bu dört kişiden yalnızca ikisi doğru söylediğine göre birinci olan kimdir?',
  '{"options":["Alp","Bilge","Cem","Duru","Belirlenemez"],"correctIndex":3}'::jsonb,
  'Her aday tek tek sınandığında: Alp birinciyse Bilge ve Duru yanlış, Alp yanlış, yalnızca Cem doğru söyler (1 doğru). Bilge birinciyse Alp, Cem ve Duru doğru söyler (3 doğru). Cem birinciyse Alp, Bilge ve Cem doğru söyler (3 doğru). Duru birinciyse yalnızca Alp ve Bilge doğru söyler (2 doğru). Koşulu yalnızca Duru''nun birinci olduğu durum sağlar.',
  'Cem ve Duru''nun ifadelerinin ikisi de doğrudan bir kişiyi işaret ettiği için aday doğru sayısını hesaplarken Alp''in "ben değilim" sözünü atlayabilir. Tüm ifadelerin doğruluk değeri dört senaryo için ayrı ayrı sayılmalıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  '"Bir eğitim programına katılan herkes sertifika almıştır. Sertifika alan hiç kimse sınava yeniden girmemiştir. Sınava yeniden giren bazı kişiler yüksek lisans öğrencisidir."

Selin''in sınava yeniden girdiği bilindiğine göre aşağıdakilerden hangisi kesinlikle doğrudur?',
  '{"options":["Selin yüksek lisans öğrencisidir.","Selin sertifika almış ama programı tamamlamamıştır.","Eğitim programına katılmayan herkes sınava yeniden girmiştir.","Selin bu eğitim programına katılmamıştır.","Yüksek lisans öğrencilerinin hiçbiri sertifika almamıştır."],"correctIndex":3}'::jsonb,
  'Sertifika alan hiç kimse sınava yeniden girmediğine göre sınava yeniden giren Selin sertifika almamıştır. Eğitim programına katılan herkes sertifika aldığı için Selin''in bu eğitim programına katılmadığı kesinleşir (aksi hâlde sertifika almış olurdu).',
  '"Sınava yeniden giren bazı kişiler yüksek lisans öğrencisidir" önermesi, Selin''in de yüksek lisans öğrencisi olduğu izlenimini verebilir. Ancak "bazı" ifadesi sınava yeniden giren herkesi kapsamaz.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  'Bir kurumdaki K, L, M, N, O ve P adlı altı uzmandan dört kişilik bir komisyon seçilecektir. Seçimle ilgili kurallar şunlardır:
- K seçilirse L de seçilir.
- M ile N birlikte seçilemez.
- O seçilmezse P de seçilmez.
- L ve P aynı anda seçilemez.

K''nin komisyona seçildiği bilindiğine göre aşağıdakilerden hangisi kesinlikle doğrudur?',
  '{"options":["M komisyona seçilir.","N komisyona seçilir.","P komisyona seçilir.","O komisyona seçilir.","L komisyona seçilmez."],"correctIndex":3}'::jsonb,
  'K seçildiğine göre L de seçilir. L seçildiği için L ile birlikte seçilemeyen P komisyona giremez. Kalan dört kişiden (M, N, O ve kalan seçim hakkı) M ile N aynı anda seçilemeyeceğinden bu ikisinden en fazla biri komisyona alınabilir; böylece dört kişiyi tamamlamak için O mutlaka komisyona seçilir (komisyon K-L-M-O ya da K-L-N-O olur).',
  '"O seçilmezse P de seçilmez" kuralı yüzünden P elenince O''nun da elenebileceği sanılabilir. Oysa P''nin elenmesi L yüzündendir ve M ile N aynı anda seçilemediği için 4. koltuğu doldurmak adına O''nun seçilmesi zorunludur.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  3,
  '(I) Tarih boyunca şehirler, çoğunlukla verimli tarım ovalarının kıyısına ya da akarsu kavşaklarına kurulmuştur.
(II) Bu yerleşim tercihi, hem günlük içme suyuna erişimi hem de ticaret yollarının kontrolünü kolaylaştırmıştır.

Bu iki cümlede ifade edilenlerin anlamca doğru bir biçimde birleştirilmiş hâli aşağıdakilerden hangisidir?',
  '{"options":["Tarih boyunca yalnızca akarsu kavşaklarına kurulan şehirler, ticaret yollarını kontrol ettikleri için verimli tarım ovalarına dönüşmüştür.","Verimli tarım ovalarının kıyısında ya da akarsu kavşaklarında kurulan şehirler, tarih boyunca içme suyuna erişimi sağlasa da ticaret yollarını koruyamamıştır.","Tarih boyunca şehirlerin çoğunlukla verimli tarım ovalarının kıyısına ya da akarsu kavşaklarına kurulması, hem günlük içme suyuna erişimi hem de ticaret yollarının denetimini kolaylaştırmıştır.","Günlük içme suyuna erişmek isteyen bütün şehirler, tarih boyunca verimli ovalardan uzaklaşıp akarsu kavşaklarına taşınmıştır.","Tarih boyunca şehirler ticaret yollarını kontrol etmek için kurulmuş, daha sonra çevrelerinde verimli tarım ovaları oluşmuştur."],"correctIndex":2}'::jsonb,
  'Doğru birleştirme, birinci cümledeki zaman ve yer kapsamını ("tarih boyunca", "çoğunlukla", "verimli tarım ovalarının kıyısına ya da akarsu kavşaklarına") koruyarak ikinci cümledeki her iki sonucu ("günlük içme suyuna erişim" ve "ticaret yollarının denetimi/kontrolü") neden-sonuç ilişkisi içinde eksiksiz aktarır.',
  'Diğer şıklarda "yalnızca", "bütün" gibi kapsayıcı abartılar ya da "kontrol edememiştir" gibi ters yargılar eklenmiştir. İki cümle birleştirilirken hiçbir bilgi eklenip çıkarılmamalıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  3,
  '"Bir toplumun gelişmişliği, ürettiği bilginin miktarından çok, o bilgiyi eleştirel süzgeçten geçirip gündelik yaşamda ne ölçüde uygulayabildiğiyle ölçülür."

Bu cümleyle anlamca en yakın cümle aşağıdakilerden hangisidir?',
  '{"options":["Çok bilgi üreten toplumlar, o bilgiyi sorgulamadan da yüksek gelişmişlik düzeyine ulaşır.","Toplumsal gelişmişlikte asıl belirleyici olan, bilginin yığınından ziyade sorgulanarak hayata geçirilebilmesidir.","Gündelik yaşamda uygulanan bilgilerin hiçbiri eleştirel süzgeçten geçirilmek zorunda değildir.","Bilgi üretimi arttıkça toplumların eleştirel düşünme alışkanlığı kendiliğinden azalır.","Gelişmiş toplumlarda bilgi yalnızca kuramsal çalışmalar için üretilir."],"correctIndex":1}'::jsonb,
  'Kökteki cümle, bilginin miktarından çok onu eleştirel biçimde süzüp yaşama uygulayabilmenin gelişmişlik ölçütü olduğunu söyler; doğru seçenek aynı yargıyı "bilginin yığını" ve "sorgulanarak hayata geçirilmesi" ifadeleriyle karşılar.',
  'Bilgi üretimi vurgusunu gören aday "çok bilgi üreten toplumlar" yargısına yönelebilir; ancak cümle "miktarından çok" diyerek salt nicelik birikimini ikinci plana iter.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  3,
  '"Deneyimli bir zanaatkâr, kullandığı aleti kusursuz olduğu için değil, onun sınırlarını ve tepkilerini yıllar içinde ezberlediği için hatasız iş çıkarır."

Bu cümleden aşağıdaki yargılardan hangisine ulaşılamaz?',
  '{"options":["Ustalık, kullanılan aracın sınırlarını tanımayı gerektirir.","Kusursuz araçlara sahip olmadan da nitelikli iş üretilebilir.","Bir işi hatasız yapabilmek için mutlaka en gelişmiş ve kusursuz araçlara sahip olmak gerekir.","Uzun süreli deneyim, aracın tepkilerini öngörmeyi kolaylaştırır.","Zanaatkârın başarısı, aracından çok aracıyla kurduğu deneyime bağlıdır."],"correctIndex":2}'::jsonb,
  'Cümle, zanaatkârın başarısını aracın kusursuzluğuna değil, yıllar içinde kazanılan tanıma ve deneyime bağlar. Bu nedenle mutlaka kusursuz araçlara sahip olunması gerektiği yargısına ulaşılamaz.',
  '"Kullandığı aleti kusursuz olduğu için değil" ifadesi hızlı okunduğunda kusursuz aletin gerekliliği gibi yanlış bir algı yaratabilir. Oysa cümle, kusursuzluk şartını açıkça reddeder.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde aşamalı bir durum (dereceli değişim) anlatılmaktadır?',
  '{"options":["Yağmur şiddetini artırdığı için açık hava konseri ertelendi.","Köyün nüfusu, gençlerin büyük kentlere göç etmesiyle yıl geçtikçe azalıyordu.","Kitabın son sayfasını okuduktan sonra derin bir nefes aldı.","Yarınki toplantıya bütün birim yöneticilerinin katılması bekleniyor.","Eski ahşap köprü, geçen kış yapılan onarımın ardından yeniden açıldı."],"correctIndex":1}'::jsonb,
  '"Yıl geçtikçe azalıyordu" ifadesinde olayın birdenbire değil, zaman içinde aşama aşama değiştiği bildirilmektedir. Diğer cümlelerde anlık neden-sonuç, ardışıklık, beklenti ve tamamlanmış bir eylem vardır.',
  '"Yağmur şiddetini artırdığı için" ifadesindeki "artırmak" fiili artış çağrışımı yaptığı için aşamalı durum sanılabilir; ancak burada yağmurun artışı bir olayın gerekçesi olarak tek bir anı anlatır, "yıl geçtikçe" gibi sürece yayılan bir değişimi vurgulamaz.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerin hangisinde varsayım anlamı vardır?',
  '{"options":["Keşke geçen yaz o eski sahil kasabasına birkaç gün daha kalsaydık.","Zamanında yola çıkarsak güneş batmadan yaylaya ulaşabiliriz.","Diyelim ki bütün hazırlıklarına rağmen sınav günü beklenmedik bir aksilik yaşadın, nasıl davranırsın?","Hava çok soğuk olduğundan çocuklar bahçede uzun süre kalamadı.","Babam eve gelir gelmez gününün nasıl geçtiğini sordu."],"correctIndex":2}'::jsonb,
  'Varsayım cümleleri, gerçekleşmemiş bir durumun geçici olarak gerçekleşmiş gibi kabul edilmesini ("diyelim ki, tut ki, farz edelim ki") içerir. "Diyelim ki ... aksilik yaşadın" cümlesi varsayım anlamı taşır.',
  '"Keşke ... kalsaydık" pişmanlık/gerçekleşmemiş dilek, "çıkarsak" ise gelecek için koşul bildirir. İkisi de gerçek olmayan durumlara gönderme yaptığı için varsayımla karıştırılabilir; varsayım zihinsel bir senaryoyu kabulle kurar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  'Araştırmacının elindeki veriler öne sürdüğü varsayımı güçlü biçimde destekliyordu; ....... örneklem yalnızca tek bir kentle sınırlı olduğundan kesin bir genelleme yapmaktan kaçındı.

Bu cümlede boş bırakılan yere anlam akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["nitekim","ne var ki","bu yüzden","örneğin","ayrıca"],"correctIndex":1}'::jsonb,
  'Cümlenin ilk yarısı verilerin varsayımı desteklediğini (olumlu yön), ikinci yarısı ise araştırmacının genellemeden kaçındığını (sınırlama/karşıt yön) bildirir. Bu iki yargı arasındaki karşıtlığı yalnızca "ne var ki" bağlacı kurar.',
  'İkinci bölümün içinde "sınırlı olduğundan" ifadesi geçtiği için aday "bu yüzden" seçeneğine yönelebilir. Oysa boşluk, "sınırlı olduğundan" gerekçesiyle birlikte bütününde ilk yarıya ("güçlü biçimde destekliyordu") karşıtlık kuran bir köprü ister.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde kanıksama (alışıp doğal görme) anlamı vardır?',
  '{"options":["Yıllardır sokağımızdaki bitmek bilmeyen gürültüyü o kadar olağan karşılıyoruz ki artık kimse bu duruma tepki bile vermiyor.","O kadar uyarmama rağmen yine aynı dikkatsizliği yapmana bir anlam veremiyorum.","Kendi hatalarını görmezden gelip sürekli başkalarını suçlaması beni çok kırdı.","Bu küçük kasabada insanların birbirine bu denli yardım etmesine doğrusu çok şaşırdım.","Yıllar önce çekilmiş o sararmış fotoğrafı görünce eski günler aklıma geldi."],"correctIndex":0}'::jsonb,
  'Kanıksama, olumsuz ya da yadırgatıcı bir durumun tekrar tekrar yaşanması sonucu artık olağan karşılanması ve tepki verilmemesi anlamındadır; inşaat gürültüsüne alışıp şikâyet etmemek bunu ifade eder. Diğer cümlelerde sitem, kırgınlık, şaşırma ve özlem vardır.',
  '"Yıllar önce... eski günler aklıma geldi" ya da "yine aynı dikkatsizlik" gibi tekrar bildiren cümleler alışma çağrışımı yapabilir; ancak kanıksama, tepki göstermemeyi ve durumu kanıksayıp kabullenmeyi içerir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerden hangisi anlamca diğerlerinden farklıdır?',
  '{"options":["Belirsizliği göze alamayan kişi, yeni bir yol açmayı başaramaz.","Bütün riskler tamamen ortadan kalkmadan yeni bir girişime başlamak doğru değildir.","Yenilik üretmek isteyen herkes, bilinmeyene doğru adım atma cesaretini göstermelidir.","Başarısızlık ihtimalinden bütünüyle kaçınanlar, özgün bir sonuca ulaşamaz.","Önünü sonunu eksiksiz hesaplamayı beklemek, çoğu zaman yaratıcı atılımları engeller."],"correctIndex":1}'::jsonb,
  'Dört cümle belirsizliği ve riski göze almadan yenilik/başarı üretilemeyeceğini savunur. "Bütün riskler tamamen ortadan kalkmadan yeni bir girişime başlamak doğru değildir." cümlesi ise tam tersine riskler bitmeden adım atılmaması gerektiğini söyler.',
  'Beş cümlede de risk, belirsizlik ve yeni girişim kavramları geçtiği için aday yüzeysel sözcük benzerliğine kapılabilir. Yargıların olumlu mu olumsuz mu yönlendirdiğine bakıldığında yalnızca riskin sıfırlanmasını şart koşan cümle ayrılır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Ses Bilgisi ve Ses Olayları',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde ünsüz benzeşmesine (ünsüz sertleşmesine) uğramış bir sözcük vardır?',
  '{"options":["Dün akşamki yağmurdan sonra bahçedeki çiçekler yeniden canlandı.","Küçük kardeşim okuldan dönünce hemen ödevine başladı.","Sınıftaki öğrenciler sessizce öğretmenin açıklamasını dinledi.","Balkondaki saksıları güneş gören pencerenin önüne taşıdı.","Akşam serinliğinde sahil boyunca yürüyüp eve döndüler."],"correctIndex":2}'::jsonb,
  '"Sınıftaki" sözcüğünde sert ünsüzle ("f") biten "sınıf" sözcüğüne gelen "-da" bulunma hâl ekinin başındaki "d" ünsüzü sertleşerek "t"ye dönüşmüştür (sınıf-da-ki → sınıftaki). Diğer cümlelerde sert ünsüzden sonra yumuşak ünsüzün sertleştiği bir örnek yoktur.',
  '"Akşamki" ve "bahçedeki" sözcükleri de "-ki" eki aldığı için aday bu sözcüklerde ses olayı arayabilir. Ayrıca "serinliğinde" sözcüğünde ünsüz yumuşaması vardır, benzeşme değildir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Ses Bilgisi ve Ses Olayları',
  'multiple_choice',
  3,
  'Aşağıdaki sözcüklerin hangisinde hem ünlü düşmesi hem de ünsüz yumuşaması birlikte görülmektedir?',
  '{"options":["kaybı","alnı","kitabı","küçücük","hissetti"],"correctIndex":0}'::jsonb,
  '"Kayıp" sözcüğüne ünlüyle başlayan "-ı" eki geldiğinde hem ikinci hecedeki "ı" ünlüsü düşer (ünlü düşmesi) hem de sözcüğün sonundaki "p" sert ünsüzü "b"ye dönüşür (ünsüz yumuşaması): kayıp + ı → kaybı. "Alnı"da yalnızca ünlü düşmesi, "kitabı"da yalnızca ünsüz yumuşaması, "küçücük"te ünsüz düşmesi, "hissetti"de ise ünsüz türemesi ve benzeşme vardır.',
  '"Alnı" ve "kitabı" sözcüklerinin her biri sorulan iki ses olayından birini içerdiği için aday tek bir ses olayını görüp acele karar verebilir. Soruda iki ses olayının aynı sözcükte birleştiği örnek istenmektedir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Ses Bilgisi ve Ses Olayları',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerin hangisinde ünlü daralmasına uğramış bir sözcük vardır?',
  '{"options":["Çocuklar bahçede büyük bir neşeyle koşuyor.","Yeni gelen komşumuz herkesi her sabah güler yüzle karşılıyor.","Yaşlı adam her sabah gazetesini balkonda dikkatle okuyor.","Kardeşim kitaplarını renklerine göre rafa sırayla diziyor.","Öğrenciler sınav öncesinde kütüphanede sessizce çalışıyor."],"correctIndex":1}'::jsonb,
  '"Karşılıyor" sözcüğünün kökü/gövdesi "karşıla-" fiilidir; "-yor" eki geldiğinde fiil sonundaki geniş "a" ünlüsü daralarak "ı"ya dönüşmüştür (karşıla-yor → karşılıyor). "Koşuyor", "diziyor" ve "çalışıyor" ünsüzle biten fiillere yardımcı ünlü gelmesiyle oluşmuştur; "okuyor" fiilinin sonundaki "u" ise zaten dardır.',
  '"Okuyor" fiili de ünlüyle bittiği ve "-yor" aldığı için daralma geçirmiş sanılabilir. Ancak ünlü daralması yalnızca geniş ünlülerin ("a, e") daralmasıyla gerçekleşir; "oku-" zaten dar "u" ile biter.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcük Türleri (İsim, Sıfat, Zamir, Zarf, Edat, Fiil)',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerin hangisinde "yalnız" sözcüğü diğerlerinden farklı bir türde kullanılmıştır?',
  '{"options":["Bu zorlu yolculuğa yalnız çıkmayı bir türlü göze alamadı.","Koca evde günlerce yalnız yaşamak ona oldukça zor geliyordu.","Seninle görüşmeyi çok isterim, yalnız bugün hiç vaktim yok.","Sınav salonunun kapısında yalnız bekleyen çocuk oldukça heyecanlıydı.","Akşamları kıyı boyunca sessizce, yalnız yürümeyi çok severdi."],"correctIndex":2}'::jsonb,
  '"Seninle görüşmeyi çok isterim, yalnız bugün hiç vaktim yok." cümlesinde "yalnız" sözcüğü "ama, fakat" anlamıyla iki cümleyi birbirine bağlayan bağlaç görevindedir. Diğer dört cümlede ise fiilleri ya da fiilimsileri ("çıkmayı", "yaşamak", "bekleyen", "yürümeyi") durum yönünden niteleyen zarf görevindedir.',
  '"Yalnız" sözcüğü "sadece" anlamında edat, "tek başına" anlamında zarf/sıfat ve "ama" anlamında bağlaç olabilir. "Bekleyen" sıfat-fiilinin önünde gelmesi onu sıfat gibi gösterebilir; ancak sözcük "nasıl bekleyen?" sorusuna yanıt verdiği için durum zarfıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcük Türleri (İsim, Sıfat, Zamir, Zarf, Edat, Fiil)',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerin hangisinde "-ecek / -acak" eki diğerlerinden farklı bir görevde kullanılmıştır?',
  '{"options":["Yarın sabah erkenden trenle Ankara''ya gidecek.","Görünmez kazalar için mutlaka gerekli önlemler alınacak.","Bu akşam misafirlere özel bir yemek hazırlayacak.","Böyle harcamaya devam ederse bütün birikimini kısa sürede tüketecek.","Okunacak kitapları masanın sağ köşesine düzenli biçimde dizdi."],"correctIndex":4}'::jsonb,
  '"Okunacak kitapları" tamlamasında "-acak" eki fiili sıfata dönüştüren sıfat-fiil (ortaç) ekidir ve "kitaplar" adını nitelemektedir. Diğer dört cümlede ise "-ecek/-acak" eki yüklemin zamanını bildiren gelecek zaman kip ekidir.',
  'Her cümlede gelecekte yapılacak bir iş anlamı sezildiği için aday eklerin görevini ayırt etmekte zorlanabilir. Yüklemde kip bildiren çekim eki ile bir adın önünde sıfat kuran sıfat-fiil eki ayırt edilmelidir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcük Türleri (İsim, Sıfat, Zamir, Zarf, Edat, Fiil)',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerin hangisinde "ne" sözcüğü soru zamiri olarak kullanılmıştır?',
  '{"options":["Akşamki toplantıda ne konuşulduğunu bana da anlatır mısın?","Bu soğuk havada ne bakıp duruyorsun pencereden dışarı?","Yıllardır görmediğin arkadaşına ne gün uğramayı düşünüyorsun?","Ne güzel bir akşamüstüydü o gün sahilde yaşadığımız!","Bu yarışmaya katılmak için ne kadar çalıştığını herkes biliyor."],"correctIndex":0}'::jsonb,
  '"Akşamki toplantıda ne konuşulduğunu..." cümlesinde "ne" sözcüğü bir adın (konuşulan şeyin/konunun) yerini tuttuğu için soru zamiridir. Diğer cümlelerde "ne" sırasıyla "niçin" anlamında soru zarfı, adı belirten soru sıfatı ("ne gün"), ünlem/derece zarfı ("ne güzel") ve miktar zarfı ("ne kadar") görevindedir.',
  '"Ne gün" ve "ne bakıp duruyorsun" kullanımları da soru cümlesi içinde yer aldığı için zamir sanılabilir. Ancak bir adı niteleyen "ne" sıfat, "niçin" anlamına gelen "ne" zarftır; yalnızca bir adın yerini tutan "ne" zamirdir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlenin Ögeleri ve Cümle Türleri',
  'multiple_choice',
  3,
  '"Yıllardır beklenen serginin açılışını büyük bir heyecanla izleyen sanatseverler, salonun çıkışında duygularını gazetecilere uzun uzun anlattı."

Bu cümlenin öge sıralanışı aşağıdakilerden hangisinde doğru verilmiştir?',
  '{"options":["Özne - Dolaylı tümleç - Belirtili nesne - Dolaylı tümleç - Zarf tümleci - Yüklem","Belirtili nesne - Zarf tümleci - Özne - Dolaylı tümleç - Zarf tümleci - Yüklem","Özne - Zarf tümleci - Belirtisiz nesne - Dolaylı tümleç - Zarf tümleci - Yüklem","Zarf tümleci - Özne - Belirtili nesne - Dolaylı tümleç - Zarf tümleci - Yüklem","Özne - Dolaylı tümleç - Belirtisiz nesne - Zarf tümleci - Dolaylı tümleç - Yüklem"],"correctIndex":0}'::jsonb,
  'Yüklem: "anlattı". Anlatan kim?: "Yıllardır beklenen serginin açılışını büyük bir heyecanla izleyen sanatseverler" (Özne). Nerede anlattı?: "salonun çıkışında" (Dolaylı tümleç). Neyi anlattı?: "duygularını" (Belirtili nesne). Kime anlattı?: "gazetecilere" (Dolaylı tümleç). Nasıl anlattı?: "uzun uzun" (Zarf tümleci).',
  'Özne öbeğinin içinde "açılışını" (belirtili nesne gibi görünen kısım) ve "büyük bir heyecanla" (zarf tümleci gibi görünen kısım) yer aldığı için aday özneyi bölme hatasına düşebilir. Fiilimsiyle kurulu tamlama bütünüyle özne olduğundan parçalanamaz.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlenin Ögeleri ve Cümle Türleri',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerin hangisinde ara söz, belirtili nesnenin açıklayıcısı olarak kullanılmıştır?',
  '{"options":["Çocukluğumun geçtiği o küçük sahil kasabasını, yani Ayvalık''ı, yıllar sonra yeniden gördüm.","En yakın arkadaşım, liseden beri görüştüğüm Deniz, gelecek ay İzmir''e taşınıyor.","Tatilin büyük bölümünü memleketimizde, dedemin taş evinde, huzur içinde geçirdik.","Geçen hafta, havanın birdenbire soğuduğu o salı günü, bütün planlarımızı erteledik.","Bu konuyu, sen de iyi bilirsin ya, kimseyle açıkça konuşmak istemezdi."],"correctIndex":0}'::jsonb,
  '"O küçük sahil kasabasını, yani Ayvalık''ı" bölümünde "neyi gördüm?" sorusuna yanıt veren belirtili nesne, kendisi de belirtme hâl eki (-ı) alan "yani Ayvalık''ı" ara sözüyle açıklanmıştır. Diğer cümlelerde ara sözler sırasıyla öznenin, dolaylı tümlecin, zarf tümlecinin açıklayıcısı ve cümle dışı unsur (ara cümle) görevindedir.',
  '"Memleketimizde, dedemin taş evinde" ara sözü de yer bildirdiği için nesne açıklayıcısı sanılabilir; ancak bulunma hâl eki (-de) aldığı için dolaylı tümleci açıklamaktadır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlenin Ögeleri ve Cümle Türleri',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerin hangisi yapısına göre bağlı, yükleminin türüne göre isim cümlesidir?',
  '{"options":["Salon oldukça genişti ancak içerideki aydınlatma yetersizdi.","Yağmur dinince dışarı çıktık, sahil boyunca uzun süre yürüdük.","Sabahki toplantı oldukça verimli geçti çünkü herkes hazırlıklı gelmişti.","Kentin eski sokakları dar olmasına karşın oldukça sessizdi.","Güneş batmış, gökyüzü kızıla boyanmış, şehir uykuya hazırlanıyordu."],"correctIndex":0}'::jsonb,
  '"Salon oldukça genişti ancak içerideki aydınlatma yetersizdi." cümlesi iki yargıyı ("genişti" ve "yetersizdi") "ancak" bağlacıyla bağladığı için yapısına göre bağlı cümledir; ayrıca her iki yüklemi de ad soylu sözcüklere ek-fiil getirilerek kurulduğu için yükleminin türüne göre isim cümlesidir.',
  '"Kentin eski sokakları dar olmasına karşın oldukça sessizdi." cümlesi de isim cümlesidir ama bağlaçla iki yüklemi bağlamaz; içinde "-ma" isim-fiili barındırdığı için yapısına göre girişik birleşik cümledir.',
  array['lisans_gygk']::text[],
  'lisans'
),
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
),
(
  'Türkçe',
  'Ses Bilgisi ve Ses Olayları',
  'multiple_choice',
  3,
  'Aşağıdaki sözcüklerin hangisinde hem ünsüz benzeşmesi (sertleşmesi) hem de ünsüz yumuşaması birlikte görülmektedir?',
  '{"options":["çiçekçi","yurdumuz","ağacı","seçtiği","çalıştı"],"correctIndex":3}'::jsonb,
  '"Seçtiği" sözcüğünde sert ünsüzle ("ç") biten fiile gelen "-dik" sıfat-fiil ekinin başındaki "d" sertleşerek "t"ye dönüşmüş (ünsüz benzeşmesi), ardından ünlüyle başlayan "-i" eki gelince ekin sonundaki "k" yumuşayarak "ğ"ye dönüşmüştür (ünsüz yumuşaması). Diğer sözcüklerde ise yalnızca tek bir ses olayı vardır.',
  '"Yurdumuz" ve "ağacı" sözcüklerinde ünsüz yumuşaması, "çiçekçi" ve "çalıştı" sözcüklerinde ise ünsüz benzeşmesi vardır; soruda istenen ise iki ses olayının aynı sözcükte bir arada bulunmasıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Yapı ve Ekler',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerin hangisinde "-im / -üm" eki diğerlerinden farklı bir görevde kullanılmıştır?',
  '{"options":["Masadaki kalemim dün akşamdan beri yerinde yoktu.","Yeni aldığım gözlüğüm çantanın içindeki kılıfta çizilmiş.","Sorunun çözümünü öğretmenimiz tahtaya adım adım yazdı.","Kardeşim bu yıl üniversiteden büyük bir başarıyla mezun oldu.","Yaşlı ağacın gölgesindeki evim bana her zaman huzur verir."],"correctIndex":2}'::jsonb,
  '"Çözümünü" sözcüğündeki "-üm" eki "çöz-" fiilinden "çözüm" adını türeten yapım ekidir (fiilden ad yapım eki); sondaki "-ü" iyelik, "-n-ü" ise belirtme hâl ekidir. Diğer cümlelerdeki "kalemim, gözlüğüm, kardeşim, evim" sözcüklerindeki ekler ise 1. tekil kişi iyelik ekidir.',
  '"Çözümünü" sözcüğü de ad soylu göründüğü ve ek almış olduğu için sondaki eklerle iyelik eki varmış gibi algılanabilir; oysa ilk ek olan "-üm", sözcüğün anlamını ve türünü değiştiren yapım ekidir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Yapı ve Ekler',
  'multiple_choice',
  3,
  'Aşağıdaki sözcüklerden hangisi hem yapım eki hem de çekim eki almıştır?',
  '{"options":["evlerden","gözlükçü","kitapların","yazıcılar","kapılarda"],"correctIndex":3}'::jsonb,
  '"Yazıcılar" sözcüğü "yaz-" fiil köküne "-ıcı" yapım ekinin ve ardından "-lar" çoğul (çekim) ekinin gelmesiyle oluşmuştur. "Evlerden, kitapların, kapılarda" yalnızca çekim eki, "gözlükçü" ise yalnızca yapım ekleri almıştır.',
  '"Gözlükçü" birden fazla ek aldığı için hem yapım hem çekim eki almış gibi düşünülebilir; ancak "-lük" ve "-çü" eklerinin ikisi de yapım ekidir, sözcükte çekim eki yoktur.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Yapı ve Ekler',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerin hangisinde birleşik sözcük, oluşum yolu bakımından diğerlerinden farklıdır?',
  '{"options":["Bahçedeki hanımeli akşamları sokak boyunca mis gibi kokuyor.","Küçük kızın gözyaşları annesinin şefkatli sözleriyle dindi.","Bu eski bilgisayar hâlâ ofisteki işlerimizin çoğunu görüyor.","Ormanın kıyısında tek katlı bir kuşburnu çalısı dikkat çekiyordu.","Yol kenarında açan aslanağzı çiçekleri oldukça canlı görünüyordu."],"correctIndex":2}'::jsonb,
  '"Bilgisayar" sözcüğü bir ad ("bilgi") ile bir sıfat-fiilin ("sayar") birleşmesiyle oluşmuştur. Diğer cümlelerdeki "hanımeli, gözyaşı, kuşburnu, aslanağzı" birleşik sözcükleri ise iki adın belirtisiz ad tamlaması biçiminde kalıplaşmasıyla kurulmuştur.',
  'Beş birleşik sözcük de tür bakımından ad olduğu için oluşum yolları aynı sanılabilir; yapı incelendiğinde yalnızca "bilgisayar" sözcüğünün ikinci ögesinde fiilimsi eki bulunduğu görülür.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Yapı ve Ekler',
  'multiple_choice',
  2,
  'Aşağıdaki sözcüklerden hangisinin kökü, sözcük türü bakımından diğerlerinden farklıdır?',
  '{"options":["sulu","gözlük","evcil","bilgili","kitaplık"],"correctIndex":3}'::jsonb,
  '"Bilgili" sözcüğünün kökü "bil-" fiil köküdür (bil-gi-li). "Gözlük" (göz), "evcil" (ev), "sulu" (su) ve "kitaplık" (kitap) sözcüklerinin kökleri ise ad köküdür.',
  '"Bilgi" bugün tek başına ad olarak kullanıldığı için aday sözcüğün kökünü "bilgi" sanabilir; oysa türemiş sözcüğün en küçük anlamlı kökü "bil-" eylemidir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Yapı ve Ekler',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde kurallı birleşik fiil kullanılmıştır?',
  '{"options":["Toplantıda alınan kararları kısa süre içinde kabul etti.","Uzun bir aradan sonra eski dostunu çarşıda tekrar gördü.","Görevliler salona gelen konuklara güler yüzle yardım etti.","Yağmur şiddetlenince çocuklar koşarak okulun içine girdi.","Bu ağır koliyi tek başına üst kata kolayca taşıyabildi."],"correctIndex":4}'::jsonb,
  '"Taşıyabildi" yüklemi "taşı-" fiiline "-ebilmek" yeterlilik fiilinin birleşmesiyle oluşmuş kurallı birleşik fiildir. "Yardım etti" ve "kabul etti" yardımcı fiille kurulan birleşik fiil, "gördü" ve "girdi" ise basit fiildir.',
  '"Yardım etti" ve "kabul etti" birleşik fiil olduğu için kurallı birleşik fiille karıştırılabilir; ancak ad + yardımcı fiil yapıları kurallı birleşik fiil grubuna girmez.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Yapı ve Ekler',
  'multiple_choice',
  3,
  'Aşağıdaki sözcüklerden hangisi yapısına göre türemiş değildir?',
  '{"options":["bilinçsiz","sevinçli","çalışkanlık","yorgun","kitaplarımızdan"],"correctIndex":4}'::jsonb,
  '"Kitaplarımızdan" sözcüğü "kitap" köküne yalnızca çoğul (-lar), iyelik (-ımız) ve ayrılma hâl (-dan) çekim eklerinin gelmesiyle oluştuğu için yapısı bakımından basittir. Diğer sözcükler ise yapım eki aldıkları için türemiştir (sev-inç-li, çalış-kan-lık, yor-gun, bil-inç-siz).',
  'Çok sayıda ek almış uzun sözcükler çoğu zaman türemiş sanılır; oysa sözcüğün türemiş sayılması için aldığı eklerin sayısı değil, içinde en az bir yapım eki bulunup bulunmadığı belirleyicidir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcük Türleri (İsim, Sıfat, Zamir, Zarf, Edat, Fiil)',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerin hangisinde "-ki" eki eklendiği sözcüğü sıfat yapmıştır?',
  '{"options":["Seninki her zaman olduğu gibi ödün vermeden erken bitmiş.","Duydum ki haftaya başka bir şehre taşınmayı planlıyormuşsunuz.","Biliyorum ki bu karmaşık konuyu tek başına kolayca çözersin.","Bizimki yine sabahtan akşama kadar durmadan çalışıyor.","Masadaki kitapların hepsini özenle büyük rafa yerleştirdi."],"correctIndex":4}'::jsonb,
  '"Masadaki kitapların" tamlamasında "-ki" eki "masada" sözcüğüne gelerek "hangi kitaplar?" sorusuna yanıt veren bir sıfat oluşturmuştur (sıfat yapan "-ki"). "Seninki" ve "bizimki" ilgi zamiri, "biliyorum ki" ve "duydum ki" cümlelerindeki "ki" ise bağlaçtır.',
  '"Seninki" sözcüğünün yer aldığı cümlede "zamanki" ifadesi dikkat çekmeyip ana sözcük olan "seninki"ye odaklanılsa da "seninki" bir adın yerini tuttuğu için zamirdir; doğrudan bir adı niteleyen sıfat görevi "masadaki kitaplar"dadır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcük Türleri (İsim, Sıfat, Zamir, Zarf, Edat, Fiil)',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerin hangisinde sıfat-fiil adlaşarak ad görevinde kullanılmıştır?',
  '{"options":["Koşan çocuklar okul bahçesinin kapısında birdenbire durdu.","Gelecek hafta yapılacak toplantıya ilgili birimler katılacak.","Çalışanlar, mesai bitiminde günlük raporları masaya bıraktı.","Okunmuş kitapları ayrı bir karton kutuya özenle yerleştirdi.","Gülümseyen yüzüyle salondaki konukların hepsini selamladı."],"correctIndex":2}'::jsonb,
  '"Çalışanlar" sözcüğü "çalışan (insanlar/kişiler)" tamlamasındaki adın düşmesi ve çoğul ekini almasıyla adlaşmış sıfat-fiil olmuştur. Diğer cümlelerdeki "koşan, yapılacak, okunmuş, gülümseyen" sıfat-fiilleri ise önlerindeki adları niteleyen sıfat görevindedir.',
  'Diğer şıklardaki fiilimsilerin hepsi sıfat-fiil eki taşıdığı için yalnızca eki aramak yetmez; sıfat-fiilin önündeki adın düşüp düşmediğine bakılmalıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcük Türleri (İsim, Sıfat, Zamir, Zarf, Edat, Fiil)',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerin hangisinde "kadar" edatı cümleye diğerlerinden farklı bir anlam katmıştır?',
  '{"options":["Onun kadar sabırlı ve titiz bir araştırmacıyla uzun zamandır karşılaşmadım.","Kardeşin de en az senin kadar düzenli bir çalışma yürütüyor.","Bu yeni kütüphane de şehrin merkezindeki eskisi kadar genişmiş.","Sabahın erken saatlerinde deniz, bir ayna kadar durgun görünüyordu.","Sabaha kadar oturup yarınki sunumun ayrıntılarını gözden geçirdi."],"correctIndex":4}'::jsonb,
  '"Sabaha kadar" ifadesinde "kadar" edatı eylemin süreceği zaman sınırını ("ne zamana dek?") bildirmektedir. Diğer dört cümlede ise "kadar" edatı iki varlık ya da durum arasında ölçü, eşitlik ve karşılaştırma ilişkisi kurmuştur.',
  '"Sabaha kadar" ile "eskisi kadar" yapıları sözcük türü bakımından aynı edatla kurulduğu için aday anlam farkını gözden kaçırabilir; biri zaman sınırı, diğerleri kıyaslama bildirir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcük Türleri (İsim, Sıfat, Zamir, Zarf, Edat, Fiil)',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerin hangisinde belgisiz zamir kullanılmıştır?',
  '{"options":["Bazı öğrenciler sınav öncesinde kütüphanede çalışmayı tercih eder.","Birkaç gün içinde projeyle ilgili hazırlıklar eksiksiz tamamlanacak.","Bu zorlu soruyu sınıftaki kimse doğru biçimde yanıtlayamadı.","Her sabah sahildeki parkta yarım saat tempolu yürüyüş yapar.","Hiçbir kitap bu konuyu bu kadar açık bir dille anlatmamıştı."],"correctIndex":2}'::jsonb,
  '"Kimse" sözcüğü cümlede belirli bir adı işaret etmeden kişilerin yerini tutan belgisiz zamirdir. Diğer cümlelerdeki "bazı, birkaç, her, hiçbir" sözcükleri ise birer adın önünde yer alarak onları belirttiği için belgisiz sıfattır.',
  '"Bazı, birkaç, her, hiçbir" sözcükleri belgisizlik anlamı taşıdığından zamirle karıştırılır; ancak bir adın önünde gelip onu belirten sözcükler zamir değil belgisiz sıfat olur.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcük Türleri (İsim, Sıfat, Zamir, Zarf, Edat, Fiil)',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerin hangisinde yer-yön zarfı kullanılmıştır?',
  '{"options":["İçeriye girer girmez pencereyi açıp odayı iyice havalandırdı.","Yukarıda seni bekleyen birkaç misafir olduğunu görevli söyledi.","Aşağı kattan gelen gürültü bütün apartman sakinlerini rahatsız etti.","Yağmur aniden bastırınca bahçedeki çocuklar hızla içeri koştu.","Dışarının soğuk havası yüzünden kalın paltosunu giymek zorunda kaldı."],"correctIndex":3}'::jsonb,
  'Yer-yön zarfları çekim eki almadan yalın hâlde kullanılıp bir fiili yön bakımından belirtir: "içeri koştu" ifadesindeki "içeri" sözcüğü yer-yön zarfıdır. "İçeriye, yukarıda, dışarının" sözcükleri ad çekim eki aldığı için adlaşmış, "aşağı kat" ifadesindeki "aşağı" ise bir adı belirttiği için sıfat olmuştur.',
  '"İçeriye" ve "yukarıda" sözcükleri yön bildirdiği için zarf sanılabilir; ancak hâl eki aldıkları anda yer-yön zarfı özelliklerini yitirip ad görevine geçerler.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcük Türleri (İsim, Sıfat, Zamir, Zarf, Edat, Fiil)',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde soru anlamı bir zarfla sağlanmıştır?',
  '{"options":["Bu akşam düzenlenecek değerlendirme yemeğine kimler katılacak?","Yaz tatiliniz için hangi sahil kasabasını seçmeye karar verdiniz?","Gelecek ay yapılacak yarışmaya kulübünüzden kaç sporcu başvurdu?","Bu kadar kapsamlı bir projeyi bu kısa sürede nasıl tamamladınız?","Masadaki renkli not defterlerinin hangisi senin çantandan çıktı?"],"correctIndex":3}'::jsonb,
  '"Nasıl tamamladınız?" cümlesinde "nasıl" sözcüğü eylemin yapılış biçimini sorduğu için soru zarfıdır. Diğer cümlelerde soru anlamı sırasıyla soru zamiri ("kimler"), soru sıfatı ("hangi kasaba", "kaç sporcu") ve soru zamiri ("hangisi") ile sağlanmıştır.',
  '"Hangi" ve "hangisi" sözcükleri yakın göründüğü için türleri karışabilir; "nasıl" ise burada bir adı değil doğrudan fiili ("tamamladınız") sorduğundan soru zarfıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcük Türleri (İsim, Sıfat, Zamir, Zarf, Edat, Fiil)',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde birleşik zamanlı (birleşik çekimli) bir fiil vardır?',
  '{"options":["Boş zamanlarında düzenli olarak gezi günlüğü tutuyor.","Yarın sabah erkenden ilk uçakla Ankara''ya hareket edeceğiz.","Öğrenciler kütüphaneye gelen yeni kitapları merakla inceledi.","Toplantının gelecek haftaya ertelenmesine ekip arkadaşları sevinmiş.","Çocukluğumuzda her yaz bu şirin sahil kasabasına gelirdik."],"correctIndex":4}'::jsonb,
  '"Gelirdik" yüklemi "gel-" fiiline geniş zaman kipi (-ir) üzerine ek-fiilin hikâye biçimi (-di) getirilerek kurulmuş birleşik zamanlı bir fiildir. Diğer cümlelerdeki yüklemler ise tek kip eki taşıyan basit zamanlı fiillerdir.',
  '"Hareket edeceğiz" yardımcı fiille kurulmuş birleşik yapılı bir fiildir; ancak yalnızca bir kip eki (-ecek) aldığı için çekimi bakımından basit zamanlıdır. Yapı bakımından birleşiklikle çekim bakımından birleşik zaman karıştırılmamalıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcük Türleri (İsim, Sıfat, Zamir, Zarf, Edat, Fiil)',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde isim tamlaması yoktur?',
  '{"options":["Evin eski ahşap kapısı rüzgârın şiddetiyle birdenbire kapandı.","Masa örtüsünün açık rengi odanın duvarlarıyla çok uyumluydu.","Okulun bahçesindeki yaşlı ağaçların yaprakları sonbaharda sararmıştı.","Kardeşim kırtasiyeden kırmızı kapaklı kalın bir defter satın aldı.","Yaz akşamlarının serinliği sokaktaki yürüyüşleri keyifli kılıyordu."],"correctIndex":3}'::jsonb,
  '"Kardeşim kırtasiyeden kırmızı kapaklı kalın bir defter satın aldı." cümlesinde yalnızca sıfat tamlaması ("kırmızı kapaklı kalın bir defter") bulunmaktadır; isim tamlaması yoktur. Diğer cümlelerde "evin kapısı, masa örtüsünün rengi, okulun bahçesi, yaz akşamlarının serinliği" gibi isim tamlamaları vardır.',
  '"Kırmızı kapaklı kalın bir defter" gibi uzun bir söz öbeği tamlama yapısıyla isim tamlaması sanılabilir; ancak burada adın önüne gelen sözcükler sıfattır ve tamlayan-tamlanan ilişkisi sıfat tamlaması kurar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcük Türleri (İsim, Sıfat, Zamir, Zarf, Edat, Fiil)',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerin hangisinde üç fiilimsi türü de (isim-fiil, sıfat-fiil, zarf-fiil) bir arada kullanılmıştır?',
  '{"options":["Gelen konukları kapıda büyük bir sevinçle karşılayıp salona aldı.","Kitabı okuyup özetini çıkardıktan sonra arkadaşına geri verdi.","Sınavı başarıyla kazanan öğrencilerin sevinmesi herkesi mutlu etti.","Ders çalışırken kısa notlar almanın yararını kısa sürede gördü.","Sabah erkenden uyanıp yürüyüş yapmayı alışkanlık edinenler dinç kalır."],"correctIndex":4}'::jsonb,
  '"Sabah erkenden uyanıp yürüyüş yapmayı alışkanlık edinenler dinç kalır." cümlesinde "uyanıp" (-ıp) zarf-fiil, "yapmayı" (-ma) isim-fiil ve "edinenler" (-en) sıfat-fiil olmak üzere üç fiilimsi türü de yer almaktadır. Diğer cümlelerde ise en fazla iki fiilimsi türü bulunur.',
  'Diğer cümlelerde birden çok fiilimsi geçtiği için hepsi varmış gibi görünebilir; örneğin "okuyup çıkardıktan" ikisi de zarf-fiildir. Üç farklı türün her birinin ayrı ayrı saptanması gerekir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlenin Ögeleri ve Cümle Türleri',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerin hangisinde yüklem, bir söz öbeğinden oluştuğu için bölünemez?',
  '{"options":["Bu eski mahallenin dar sokakları çocukluğumun en güzel anısıydı.","Yıllardır beklenen uzaktaki misafirler akşamüstü köye ulaştı.","Öğrenciler kütüphanedeki yeni kitapları sırayla dikkatlice inceledi.","Sabahki kısa yağmurdan sonra bahçedeki hava biraz serinledi.","Kardeşim yeni aldığı dolma kalemi masanın üzerine bıraktı."],"correctIndex":0}'::jsonb,
  '"Bu eski mahallenin dar sokakları çocukluğumun en güzel anısıydı." cümlesinin yüklemi, belirtili ad tamlaması ve sıfat tamlamasının iç içe geçmesiyle oluşmuş "çocukluğumun en güzel anısıydı" söz öbeğidir; tamlama bölünemediği için bütünüyle yüklem sayılır. Diğer cümlelerde yüklemler tek bir fiildir.',
  '"Çocukluğumun" ya da "en güzel" ifadeleri ayrı bir öge gibi düşünülerek yalnızca "anısıydı" sözcüğü yüklem sanılabilir; ancak tamlamalar cümlenin ögeleri bulunurken parçalanamaz.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlenin Ögeleri ve Cümle Türleri',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerin hangisinde soru, özneyi buldurmaya yöneliktir?',
  '{"options":["Dünkü toplantıda hangi konuyu bu kadar ayrıntılı tartıştınız?","Bu zorlu projeyi bu kadar kısa sürede kim tamamladı?","Yaz tatilinde ailenizle birlikte nereye gitmeyi düşünüyorsunuz?","Kütüphaneden ödünç aldığın kitapları ne zaman geri vereceksin?","Sabahki törende konuşma yapacağını ilk olarak kime söylemiştin?"],"correctIndex":1}'::jsonb,
  '"Bu zorlu projeyi bu kadar kısa sürede kim tamamladı?" sorusuna "Ahmet tamamladı" gibi özne olan bir yanıt verilir; dolayısıyla "kim" soru sözcüğü özneyi buldurmaya yöneliktir. Diğer sorularda ise sırasıyla belirtili nesne ("hangi konuyu", "nereye gitmeyi"), zarf tümleci ("ne zaman") ve dolaylı tümleç ("kime") sorulmaktadır.',
  '"Nereye gitmeyi" ifadesindeki "nereye" dolaylı tümleç gibi görünse de "gitmeyi" isim-fiiliyle birleştiği için belirtili nesnenin içindedir; özneyi soran ise işi yapanı soran "kim" sözcüğüdür.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlenin Ögeleri ve Cümle Türleri',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerin hangisi ögelerinin dizilişi bakımından "Zarf tümleci - Özne - Belirtili nesne - Yüklem" sıralamasındadır?',
  '{"options":["Dün akşam bütün mahalleli gökyüzündeki dolunayı izledi.","Öğrenciler sınavdan sonra sonuçları büyük bir heyecanla bekledi.","Sabahleyin parktaki yaşlı çınarın altında uzun süre oturduk.","Deneyimli yazar yeni romanını geçen ay okurlarla buluşturdu.","Akşamüstü bahçedeki solgun çiçekleri özenle tek tek suladık."],"correctIndex":0}'::jsonb,
  '"Dün akşam (Zarf tümleci) bütün mahalleli (Özne) gökyüzündeki dolunayı (Belirtili nesne) izledi (Yüklem)." cümlesi istenen sıralamaya tam olarak uymaktadır. Diğer cümlelerde özne gizli ya da başta olup sıralamayı değiştirmektedir.',
  '"Akşamüstü bahçedeki solgun çiçekleri..." cümlesi zaman zarfıyla başladığı için doğru sanılabilir; ancak o cümlede özne ("biz") gizlidir ve sonda ek zarf tümleci ("özenle tek tek") yer alır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlenin Ögeleri ve Cümle Türleri',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerin hangisinde cümle dışı unsur kullanılmıştır?',
  '{"options":["Genç, doktorun söylediklerini başını sallayarak dikkatle dinledi.","Çocuklar, yarın sabah saat dokuzda okul bahçesinde toplanıyoruz.","Dün akşam eski arkadaşlarımla sahil yolunda uzun uzun yürüdük.","Masadaki kalın kitabı alıp kendi odasındaki rafa düzenli koydu.","Annem bahçeden topladığı taze meyveleri yıkayıp tabağa dizdi."],"correctIndex":1}'::jsonb,
  '"Çocuklar, yarın sabah saat dokuzda okul bahçesinde toplanıyoruz." cümlesinde "Çocuklar" sözcüğü bir seslenme (hitap) sözüdür ve cümlenin herhangi bir ögesine (özne "biz"dir) dâhil olmadığı için cümle dışı unsurdur. Diğer cümlelerdeki bütün sözcükler özne, tümleç ya da nesne görevindedir.',
  '"Genç, doktorun söylediklerini..." cümlesinde de başta virgülle ayrılan bir sözcük yer aldığı için seslenme sanılabilir; ancak orada "Genç", "dinledi" yükleminin öznesidir, cümle dışı unsur değildir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlenin Ögeleri ve Cümle Türleri',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerin hangisi öznesine göre edilgen çatılıdır?',
  '{"options":["Bayram öncesinde okulun bütün koridorları özenle süslendi.","Yaşlı adam aynanın karşısında saatlerce özenle tarandı.","İki eski okul arkadaşı yıllar sonra meydanda karşılaştı.","Kardeşim sabah erkenden kalkıp okul giysilerini giyindi.","Genç sporcu büyük yarışmadan önce sahada tek başına hazırlandı."],"correctIndex":0}'::jsonb,
  '"Bayram öncesinde okulun bütün koridorları özenle süslendi." cümlesinde süsleme işini kimin yaptığı belli değildir ve "okulun bütün koridorları" eylemden etkilenen sözde öznedir; yüklem edilgendir. Diğer cümlelerdeki "tarandı, giyindi, hazırlandı" fiilleri öznenin işi kendi üzerinde yaptığı dönüşlü fiiller, "karşılaştı" ise işteş fiildir.',
  '"Tarandı" ve "giyindi" fiilleri de "-n" ekini aldığı için edilgen sanılabilir; ancak edilgenlikte işi yapan belli değildir, dönüşlülükte ise özne işi hem yapar hem de ondan etkilenir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlenin Ögeleri ve Cümle Türleri',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerden hangisi yapısına göre girişik birleşik cümledir?',
  '{"options":["Sınav sonuçları açıklandı ve bütün öğrenciler büyük bir sevinç yaşadı.","Güneş ufukta batmış, sokak lambaları birer birer yanmıştı.","Gecikmeden yola çıkan ekip, gün batımından önce köye ulaştı.","Bu tarihî taş konak, şehrin en sakin ve eski sokağındadır.","Akşamki uzun toplantıda önümüzdeki yıl için önemli kararlar alındı."],"correctIndex":2}'::jsonb,
  '"Gecikmeden yola çıkan ekip, gün batımından önce köye ulaştı." cümlesinde tek yüklem ("ulaştı") ve fiilimsi ("gecikmeden", "çıkan") bulunduğu için cümle girişik birleşiktir. Diğer cümleler sırasıyla bağlı, sıralı ve basit cümledir.',
  '"Sınav sonuçları açıklandı ve..." ya da "Güneş ufukta batmış,..." cümleleri birden çok yargı içerdiği için birleşik cümleyle karıştırılabilir; ancak onlar fiilimsiyle değil bağlaç ve virgülle kurulduğundan bağlı ve sıralı cümledir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlenin Ögeleri ve Cümle Türleri',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerden hangisi biçimce olumsuz, anlamca olumlu bir cümledir?',
  '{"options":["Bu konuda senin de haklı olduğun yanlar yok değil.","Dün akşam ne sinemaya gitti ne de tiyatro bileti aldı.","Toplantıya davet edilen eski üyelerin hiçbiri salona gelmedi.","Böyle güzel ve güneşli bir havada evde oturulur mu hiç?","Geçen ay açılan kütüphane her gün oldukça kalabalıktı."],"correctIndex":0}'::jsonb,
  '"Bu konuda senin de haklı olduğun yanlar yok değil." cümlesi "yok" ve "değil" olumsuzluk ögelerini taşıdığı için biçimce olumsuz, ancak iki olumsuzun birbirini kaldırmasıyla "haklı olduğun yanlar var" anlamını verdiği için anlamca olumludur. "Ne ... ne" ve sözde soru cümleleri ise biçimce olumlu, anlamca olumsuzdur.',
  '"Ne sinemaya gitti..." ve "oturulur mu hiç?" cümleleri de biçim ve anlam yönünden ters düştüğü için adayı yanıltabilir; ancak onlarda biçim olumlu, anlam olumsuzdur. Soruda istenen bunun tam tersidir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  2,
  'Bir havalimanından Ankara, Antalya, Bodrum, İzmir ve Trabzon''a gidecek beş uçak sırayla 1''den 5''e kadar kalkacaktır. Kalkış sırasıyla ilgili şunlar bilinmektedir:
- Ankara uçağı 4. sırada kalkacaktır.
- İzmir uçağı, Ankara uçağından hemen sonraki sırada kalkacaktır.
- Antalya uçağı Trabzon''dan önce, Bodrum uçağı ise Trabzon''dan sonraki bir sırada kalkacaktır.
- Bodrum uçağı en son sırada kalkmayacaktır.

Buna göre 2. sırada hangi uçak kalkacaktır?',
  '{"options":["Antalya","Trabzon","Bodrum","Ankara","İzmir"],"correctIndex":1}'::jsonb,
  'Ankara 4. sırada, İzmir hemen arkasında 5. sıradadır. Antalya, Trabzon ve Bodrum ilk üç sıraya yerleşir; Antalya < Trabzon < Bodrum koşulu nedeniyle 1. Antalya, 2. Trabzon, 3. Bodrum olur. 2. sırada Trabzon uçağı kalkacaktır.',
  'Bodrum''un en son sırada kalkmayacağı bilgisi önemsiz bir ayrıntı gibi görünebilir; oysa Ankara-İzmir çifti 4 ve 5. sıraları doldurduğu için ilk üç sıranın Antalya-Trabzon-Bodrum biçiminde tekil dizilmesini sağlar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  'Bir sanatsever; ebru, fotoğraf, heykel, resim ve seramik sergilerini cuma, cumartesi ve pazar günlerinde gezecektir. Her gün en az bir, en fazla iki sergi gezilecektir. Programla ilgili şunlar bilinmektedir:
- Cumartesi günü yalnızca bir sergi gezilecektir.
- Ebru ve seramik sergileri aynı gün gezilecektir.
- Fotoğraf sergisi pazar günü gezilmeyecektir ve heykel sergisiyle aynı gün gezilecektir.
- Resim sergisi cuma günü gezilmeyecektir.

Buna göre pazar günü gezilecek sergiler aşağıdakilerin hangisinde doğru verilmiştir?',
  '{"options":["Fotoğraf ve heykel","Ebru ve seramik","Resim ve seramik","Ebru ve resim","Fotoğraf ve resim"],"correctIndex":1}'::jsonb,
  'Üç güne en az 1, en fazla 2 sergi dağılımı ve cumartesinin 1 sergi olması nedeniyle cuma 2, cumartesi 1, pazar 2 sergi gezilir. Fotoğraf-heykel ikilisi pazar gezilemediğine ve cumartesiye sığmadığına göre cuma günü gezilir. Resim cuma gezilemeyeceğinden ve ikişerli gruplara yer kalmadığından cumartesi gezilir. Geriye kalan ebru ve seramik sergileri pazar günü gezilir.',
  'Resim sergisinin pazara da kalabileceği düşünülebilir; ancak aynı gün gezilen iki ayrı çift (fotoğraf-heykel ve ebru-seramik) ikişer kişilik cuma ile pazar günlerini doldurduğu için tek kalan resim mutlaka cumartesiye yerleşir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  'Emre, Figen, Güneş ve Hakan adlı dört yarışmacı bir bilgi yarışmasında ilk dört dereceyi (1., 2., 3., 4.) paylaşmıştır. Her biri Adana, Bursa, Edirne ve Kayseri illerinden birini temsil etmektedir. Yarışmayla ilgili şunlar bilinmektedir:
- Edirne temsilcisi 2. olmuştur.
- Figen, Bursa temsilcisinden hemen sonraki dereceyi almıştır.
- Emre Adanalıdır ve Figen''den daha iyi bir derece elde etmiştir.
- Hakan 1. olmamıştır ve Adanalı değildir.
- Güneş 4. olmamıştır, Kayserili değildir ve Bursalı değildir.

Buna göre 3. olan yarışmacı ve ili aşağıdakilerden hangisidir?',
  '{"options":["Güneş - Edirne","Hakan - Bursa","Emre - Adana","Figen - Kayseri","Güneş - Bursa"],"correctIndex":1}'::jsonb,
  'Emre (Adana) 2. olamaz (2. Edirne); Figen''den önde olduğu için 4. de olamaz; Figen Bursa temsilcisinin hemen arkasında olduğu için 3. olursa Figen 4. kalır ve Bursa 2. olurdu (2. Edirne olduğu için imkânsız). Bu nedenle Emre 1.dir. Bursa temsilcisi Figen''in hemen önünde olduğu için yalnızca 3. olabilir ve Figen 4. olur. Güneş Bursalı olmadığından 2. (Edirne), Hakan ise 3. (Bursa) olur; Figen Kayseri''yi temsil eder.',
  'Güneş ile Hakan''ın 2 ve 3. sıralarda yer değiştirebileceği sanılabilir; ancak "Güneş Bursalı değildir" bilgisi Bursa temsilcisinin mutlaka 3. sıradaki Hakan olmasını zorunlu kılar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  'Üst, orta ve alt olmak üzere üç raftan ve sol ile sağ olmak üzere iki sütundan oluşan altı gözlü bir dolaba K, L, M, N, O ve P dosyaları birer göze yerleştirilmiştir. Yerleşimle ilgili şunlar bilinmektedir:
- K dosyası orta raftadır ve O dosyası ile aynı sütundadır.
- L dosyası, K dosyasının hemen üstündeki gözdedir (aynı sütun, üst raf).
- M dosyası alt raftadır ancak K ile aynı sütunda değildir.
- N dosyası sağ sütundadır ve P dosyasının hemen altındaki gözdedir.
- P dosyası orta rafta değildir.

Buna göre sağ sütundaki gözlerde üstten alta doğru hangi dosyalar yer almaktadır?',
  '{"options":["P - N - M","L - K - O","P - M - N","O - K - L","N - P - M"],"correctIndex":0}'::jsonb,
  'N sağ sütunda ve P''nin hemen altında olup P orta rafta olmadığına göre P yalnızca üst-sağda, N ise orta-sağda bulunabilir. Bu durumda sol sütun K, L ve O''ya kalır: L üst-solda, K orta-solda, O ise alt-solda yer alır. Alt rafta kalan tek boş göz olan alt-sağa ise M dosyası yerleşir. Sağ sütunda üstten alta doğru P - N - M dosyaları vardır.',
  'P''nin orta rafta olmaması N''yi alt rafa yerleştirmeyi de düşündürebilir; ancak alt rafta P üstte kalacağından P''nin orta rafta yer alması gerekirdi ve bu da koşulla çelişir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  2,
  '"Bir kütüphanedeki tüm sözlükler başvuru bölümündedir. Başvuru bölümündeki hiçbir kitap ödünç verilmez. Bazı tarih kitapları da başvuru bölümündedir."

Bu bilgilere göre aşağıdakilerden hangisi kesinlikle yanlıştır?',
  '{"options":["Bazı tarih kitapları ödünç verilmemektedir.","Başvuru bölümünde tarih kitapları bulunmaktadır.","Bazı sözlükler dışarıya ödünç verilebilir.","Ödünç verilebilen kitapların hiçbiri sözlük değildir.","Ödünç verilebilen bazı tarih kitapları olabilir."],"correctIndex":2}'::jsonb,
  'Tüm sözlükler başvuru bölümündedir ve başvuru bölümündeki hiçbir kitap ödünç verilmez; dolayısıyla hiçbir sözlük ödünç verilemez. Bu nedenle "Bazı sözlükler dışarıya ödünç verilebilir." yargısı kesinlikle yanlıştır.',
  '"Bazı tarih kitapları da başvuru bölümündedir" önermesi yüzünden bütün tarih kitaplarının ödünç verilemediği düşünülebilir; oysa başvuru bölümünde olmayan tarih kitapları ödünç verilebilir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  'Alp, Banu, Cem, Duru, Efe ve Fulya bir gişe önünde 1''den 6''ya kadar sıralanmıştır. Sıralanmayla ilgili şunlar bilinmektedir:
- Banu ile Efe arasında tam üç kişi vardır.
- Alp, Banu''nun hemen arkasındadır.
- Fulya, Cem''in önündedir ve 1. sırada değildir.
- Efe 1. sırada değildir ve Duru''nun önündedir.

Buna göre baştan 4. sırada kim vardır?',
  '{"options":["Fulya","Cem","Efe","Alp","Duru"],"correctIndex":1}'::jsonb,
  'Banu ile Efe arasında 3 kişi olduğu ve Efe 1. sırada bulunmadığı için (Banu, Efe) ikilisi ya (1, 5) ya da (2, 6) olur. Efe Duru''nun önünde olduğundan 6. sırada olamaz; bu nedenle Banu 1., Efe 5. ve Duru 6. sıradadır. Alp Banu''nun hemen arkasında 2. sıradadır. Kalan 3 ve 4. sıralara Fulya Cem''in önünde olacak biçimde 3. Fulya, 4. Cem yerleşir.',
  'Efe''nin 2. ya da 6. sıraya konulabileceği düşünülürse "Banu ile Efe arasında tam üç kişi vardır" ve "Efe Duru''nun önündedir" koşulları birlikte sağlanamaz; yalnızca Banu 1. ve Efe 5. sıradaki dizilim tüm koşulları karşılar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  'Bir sınıfın kapısını Ahmet, Burcu, Can ya da Deniz''den biri kilitlemiştir. Dördünün söyledikleri aşağıdadır:
- Ahmet: "Kapıyı ben kilitlemedim."
- Burcu: "Kapıyı Can kilitledi."
- Can: "Kapıyı Deniz kilitledi."
- Deniz: "Can yalan söylüyor."

Bu dört kişiden yalnızca biri doğru söylediğine göre kapıyı kim kilitlemiştir?',
  '{"options":["Ahmet","Burcu","Can","Deniz","Belirlenemez"],"correctIndex":0}'::jsonb,
  'Can ile Deniz''in sözleri birbirinin tam karşıtı olduğundan ikisinden biri mutlaka doğrudur; tek doğru söyleyen kişi bu ikisinden biri olacağı için Ahmet ve Burcu yalan söylemektedir. Ahmet "Kapıyı ben kilitlemedim" derken yalan söylediğine göre kapıyı Ahmet kilitlemiştir (bu durumda yalnızca Deniz doğru söylemiş olur).',
  'Ahmet''in yalan söylediğini görmeden dört adayı tek tek denemek zaman kaybettirir. Oysa Can ile Deniz''in çelişen sözlerinden tek doğrunun bu ikisinden birinde olduğu hemen çıkarılır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Yazım Kuralları',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde birleşik fiil yanlış yazılmıştır?',
  '{"options":["Maçı kaybettik.","Teklifi red etti.","Önerimi reddetti.","Bu durumu hissediyorum.","Hatamı affetti."],"correctIndex":1}'::jsonb,
  'Ses olayına uğrayan birleşik fiiller bitişik yazılır: "reddetti". "Red etti" yanlıştır.',
  '"Kabul etmek" ve "yardım etmek" ayrı yazıldığı için "red etmek" de ayrı sanılabilir. Oysa "reddetmek" ünsüz ikizleşmesi nedeniyle bitişik yazılır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Noktalama İşaretleri',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde hitap sözünden sonra yanlış noktalama kullanılmıştır?',
  '{"options":["Sevgili Ayşe, seni çok özledim.","Ahmet, buraya gel.","Sevgili Ayşe: Seni çok özledim.","Sayın Müdürüm, size bir şey soracağım.","Çocuklar, sessiz olun."],"correctIndex":2}'::jsonb,
  'Hitap sözünden sonra virgül konur. Doğru şıkta iki nokta kullanılması yanlıştır.',
  'İki nokta bir açıklama bekleyen yapılardan sonra kullanıldığı için hitap sonrası kullanılabilirmiş sanılır. Kurala göre hitap sözünden sonra virgül gelir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Noktalama İşaretleri',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde virgül, hitap için kullanılmıştır?',
  '{"options":["Elma, armut, muz aldım.","Evet, haklısın.","Yarın, hava güzelse, gideriz.","Ahmet, buraya gel.","Geldi, gördü, gitti."],"correctIndex":3}'::jsonb,
  '"Ahmet" seslenilen kişidir; hitap sözünden sonra virgül konur. Diğer cümlelerde sıralama, cevap sözü, ara söz ve sıralı cümle virgülü vardır.',
  'Her cümlede virgül bulunduğu için işlevi ayırt etmek zordur. Hitap virgülü, seslenilen kişiyi cümleden ayırır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Noktalama İşaretleri',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde iki nokta yerinde kullanılmıştır?',
  '{"options":["Dün: sinemaya gittim.","Kitap: okumak güzeldir.","Annem: yemek yaptı.","Yarın: hava güzel olacak.","Sepetimde şunlar vardı: elma, armut, muz."],"correctIndex":4}'::jsonb,
  'İki nokta, açıklama yapılacağını bildirir; "şunlar vardı" ifadesinden sonra gelen sıralama için doğru kullanılmıştır.',
  'Zaman bildiren sözcüklerden sonra iki nokta konabileceği sanılır. Oysa iki nokta açıklama, sıralama ya da aktarma öncesinde kullanılır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde "dil" sözcüğü bir iletişim sistemi anlamında kullanılmıştır?',
  '{"options":["Bir dili öğrenmek, yeni bir dünyanın kapısını açar.","Çocuk dilini çıkarıp kardeşine yüz yaptı.","Dilini ısırıp sustu.","Yemeğin tadını dilinde hissetti.","Doktor hastadan dilini göstermesini istedi."],"correctIndex":0}'::jsonb,
  'İlk cümlede "dil", insanların anlaşmasını sağlayan sistem anlamındadır. Diğer cümlelerde sözcük vücut organını bildirir.',
  '"Dil" sözcüğü organ anlamıyla çok kullanıldığı için aday ilk anlamı seçebilir. Soru, iletişim sistemi anlamını arar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  2,
  'Aşağıdakilerden hangisi "önemsemek" sözcüğü ile yakın anlamlıdır?',
  '{"options":["hafife almak","ciddiye almak","göz ardı etmek","unutmak","reddetmek"],"correctIndex":1}'::jsonb,
  '"Önemsemek" ve "ciddiye almak", bir şeye değer vermek anlamında yakındır. Diğer sözcükler karşıt ya da ilgisiz anlamlar taşır.',
  '"Hafife almak" ve "göz ardı etmek" "önemsemek" sözcüğünün karşıt anlamlılarıdır; aday karşıtlıkla yakınlığı karıştırabilir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki sözcüklerden hangisinin karşıtı "gerçek"tir?',
  '{"options":["doğru","sahici","somut","hayal","kesin"],"correctIndex":3}'::jsonb,
  '"Gerçek" sözcüğünün karşıtı "hayal"dir. "Doğru, sahici, somut, kesin" gerçeklikle ilişkili ya da yakın anlamlı sözcüklerdir.',
  '"Doğru" sözcüğü bazen "gerçek"in karşıtı sanılan "yanlış"la ilişkilendirilir. Oysa "gerçek"in karşıtı gerçekdışı olan hayaldir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  2,
  '"Ateş olmayan yerden duman çıkmaz." atasözüyle anlamca en yakın cümle aşağıdakilerden hangisidir?',
  '{"options":["Duman çıkan yerde ateş yoktur.","Ateşi yakan, dumanı da söndürür.","Dumansız yerde ateş yanmaz.","Ateş kullanırken dikkatli olunmalıdır.","Söylentilerin çoğu zaman bir dayanağı vardır."],"correctIndex":4}'::jsonb,
  'Atasözü, bir söylentinin ya da dedikodunun çoğu zaman gerçek bir nedene dayandığını anlatır.',
  'Atasözündeki ateş-duman sözcükleri doğrudan ateşle ilgili şıklara yönlendirir. Oysa atasözü mecazlı bir anlam taşır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  2,
  '"Üzüm üzüme baka baka kararır." atasözüyle anlamca en yakın cümle aşağıdakilerden hangisidir?',
  '{"options":["Üzüm, güneşte çabuk kararır.","Her insan kendi yolunu seçer.","İnsanlar, çevrelerindekilerden etkilenerek onlara benzer.","Aynı bağdaki üzümler birbirinden farklıdır.","Çok bakmak, görmeyi azaltır."],"correctIndex":2}'::jsonb,
  'Atasözü, bir arada bulunanların birbirinden etkilendiğini söyler.',
  '"Üzümün kararması" gerçek bir olay gibi okunduğundan aday bunu tarımla ilgili sanabilir. Atasözü insanlar arasındaki etkileşimi anlatır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  1,
  'Aşağıdaki sözcüklerden hangisi soyut anlamlıdır?',
  '{"options":["adalet","kapı","masa","elma","bulut"],"correctIndex":0}'::jsonb,
  '"Adalet" duyularla algılanamayan bir kavramdır; soyuttur. Diğerleri somut varlıklardır.',
  '"Bulut" elle tutulamadığı için soyut sanılabilir. Oysa bulut gözle görüldüğü için somuttur.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  2,
  '"Güneş çıkınca yola koyuldular." cümlesindeki "çıkmak" sözcüğü aşağıdakilerin hangisinde aynı anlamda kullanılmıştır?',
  '{"options":["Merdivenlerden hızla çıktı.","Dağın ardından ay çıktı.","Yeni kitabı bu yıl çıkacak.","Evden erkenden çıktı.","Tüm sınavlardan başarıyla çıktı."],"correctIndex":1}'::jsonb,
  'Soru kökünde "çıkmak", belirmek, ortaya görünmek anlamındadır. Aynı anlam "ay çıktı" ifadesinde de vardır.',
  '"Çıkmak" sözcüğü çok sık hareketle ilişkilendirildiği için aday yer değiştirme anlamlı şıklara yönelebilir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  2,
  'Alp, Bilge, Cansu, Derya, Eren adlı 5 kişi bir sırada beklemektedir. Bilge, Alp''tan öndedir. Eren, Derya''dan öndedir. Alp, Eren''in hemen arkasındadır. Derya en arkada değildir.

Buna göre baştan 1. sırada kim vardır?',
  '{"options":["Alp","Cansu","Derya","Bilge","Eren"],"correctIndex":3}'::jsonb,
  'Verilen koşullar birlikte değerlendirildiğinde tek bir sıralama kalır: Bilge - Eren - Alp - Derya - Cansu. Baştan 1. sırada Bilge vardır.',
  '"Hemen arkasında" ve "önde" gibi ifadelerin yönü sıklıkla karıştırılır. Yönü ters okuyan aday, komşu sıradaki kişiyi (örneğin Eren) seçebilir; koşulların tamamı birlikte kullanılmalıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  'Furkan, Gökçe, Hülya, İsmail, Jale, Kerem adlı 6 kişi bir sırada beklemektedir. Furkan en önde değildir. Hülya 6. sıradadır. Kerem, Gökçe''nin hemen arkasındadır. Furkan, İsmail''den öndedir. Gökçe, Jale''nin hemen arkasındadır.

Buna göre baştan 1. sırada kim vardır?',
  '{"options":["Furkan","Gökçe","İsmail","Jale","Hülya"],"correctIndex":3}'::jsonb,
  'Verilen koşullar birlikte değerlendirildiğinde tek bir sıralama kalır: Jale - Gökçe - Kerem - Furkan - İsmail - Hülya. Baştan 1. sırada Jale vardır.',
  '"Hemen arkasında" ve "önde" gibi ifadelerin yönü sıklıkla karıştırılır. Yönü ters okuyan aday, komşu sıradaki kişiyi (örneğin Gökçe) seçebilir; koşulların tamamı birlikte kullanılmalıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  2,
  'Mine, Nehir, Onur adlı üç arkadaşın her biri kırmızı, mavi ve yeşil renklerinden yalnızca birini sever ve kedi, köpek ya da kuştan yalnızca birini besler. Üçünün sevdiği renk de beslediği hayvan da birbirinden farklıdır.

Onur, kedi beslemez. Onur kırmızıyı sevmez. Maviyi seven kişi kuş beslemez. Mine yeşili sever. Kırmızıyı seven kişi kedi beslemez.

Buna göre Nehir hangi hayvanı besler?',
  '{"options":["kedi","köpek","kuş","Belirlenemez","Hiçbir hayvan beslemez"],"correctIndex":2}'::jsonb,
  'Koşullar birlikte kullanıldığında tek eşleşme kalır: Mine yeşili sever ve kedi besler; Nehir kırmızıyı sever ve kuş besler; Onur maviyi sever ve köpek besler. Nehir kuş besler.',
  '"Seven kişi ... besler/beslemez" biçimindeki koşullar iki özelliği birbirine bağladığı için tek tek kişiye bakıldığında atlanır. Aday yalnızca kişi koşullarına bakarsa birden çok seçenek arasında kalır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  'Pınar, Rüya, Sarp adlı üç arkadaşın her biri kırmızı, mavi ve yeşil renklerinden yalnızca birini sever ve kedi, köpek ya da kuştan yalnızca birini besler. Üçünün sevdiği renk de beslediği hayvan da birbirinden farklıdır.

Sarp yeşili sevmez. Yeşili seven kişi köpek beslemez. Pınar yeşili sevmez. Rüya, kuş beslemez. Kırmızıyı seven kişi kuş beslemez. Sarp kırmızıyı sevmez.

Buna göre Sarp hangi hayvanı besler?',
  '{"options":["kuş","kedi","köpek","Belirlenemez","Hiçbir hayvan beslemez"],"correctIndex":0}'::jsonb,
  'Koşullar birlikte kullanıldığında tek eşleşme kalır: Pınar kırmızıyı sever ve köpek besler; Rüya yeşili sever ve kedi besler; Sarp maviyi sever ve kuş besler. Sarp kuş besler.',
  '"Seven kişi ... besler/beslemez" biçimindeki koşullar iki özelliği birbirine bağladığı için tek tek kişiye bakıldığında atlanır. Aday yalnızca kişi koşullarına bakarsa birden çok seçenek arasında kalır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  '"Çalışırsam sınavı geçerim. Sınavı geçersem tatile çıkarım." Tatile çıkmadım.

Buna göre aşağıdakilerden hangisi kesinlikle doğrudur?',
  '{"options":["Sınavı geçtim ama tatile çıkmadım.","Sınavı geçmedim ve çalışmadım.","Çalıştım ama sınavı geçemedim.","Sınavı geçtim ve çalıştım.","Tatile çıkmadığım için çalışmadım."],"correctIndex":1}'::jsonb,
  'Tatile çıkmadığıma göre sınavı geçmemişimdir. Çalışsaydım sınavı geçecektim; bu nedenle çalışmamışımdır.',
  'Önermeler zincir hâlinde olduğu için aday tek adımda duran şıkları (yalnızca sınavı geçmedim) seçebilir. Zincir iki adım geriye izlenmelidir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  '"Hiçbir kedi köpek değildir. Her köpek hayvandır." Pamuk adlı hayvan bir kedidir.

Buna göre aşağıdakilerden hangisi kesinlikle doğrudur?',
  '{"options":["Pamuk hayvan değildir.","Pamuk bir köpek olabilir.","Her hayvan kedidir.","Hiçbir hayvan köpek değildir.","Pamuk köpek değildir."],"correctIndex":4}'::jsonb,
  'Hiçbir kedi köpek olmadığına göre kedi olan Pamuk köpek değildir.',
  '"Her köpek hayvandır" bilgisi, kedinin hayvan olup olmadığı hakkında bilgi vermez. Aday bunu "Pamuk hayvan değildir" sonucuyla karıştırabilir.',
  array['lisans_gygk']::text[],
  'lisans'
),
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
),
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
),
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
),
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
),
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
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Aile akşam yemeği, yalnızca karın doyurmak için bir araya gelmek değildir; gün içinde yaşananların paylaşıldığı, çocukların dinlendiğini hissettiği bir buluşmadır. Telefon ve televizyonun masaya girdiği evlerde bu paylaşım yerini sessiz bir birlikteliğe bırakır. Oysa birlikte yemek yemenin değeri, aynı masada oturmaktan çok birbirini duymaktan gelir.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Aile yemeklerinde telefon kullanımı serbest olmalıdır.","Çocuklar yemeği ayrı yemelidir.","Ailede birlikte yemek yemenin değeri, aynı mekânda bulunmaktan çok karşılıklı dinleyip paylaşmaktan gelir.","Birlikte yemek yemek, yalnızca beslenme amacı taşır.","Televizyon, aile bağlarını güçlendirir."],"correctIndex":2}'::jsonb,
  'Yazar, yemeğin yalnızca doyurmakla kalmayıp paylaşım ve dinleme anı olduğunu söyler; telefon ve televizyonun bunu engellediğini belirtir.',
  '"Sessiz bir birliktelik" ifadesi aynı masada oturmayı yeterli sayma izlenimi verebilir. Oysa yazar asıl değerin birbirini duymak olduğunu vurgular.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Radyo, görsel gerektirmediği için insanlara başka işlerle uğraşırken eşlik edebilir. Araç kullanan, yemek yapan ya da çalışan biri, gözlerini ayırmadan dinleyebilir. Bu özelliği, radyoyu televizyonun yaygınlaştığı dönemde bile varlığını sürdüren bir araç yapmıştır.

Bu parçadan aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Radyo dinlemek için ekrana bakmak gerekir.","Radyo, başka işlerle birlikte dinlenebilir.","Araç kullanırken radyo dinlenebilir.","Radyo, televizyon döneminde de varlığını sürdürmüştür.","Radyonun görsel gerektirmemesi bir avantajdır."],"correctIndex":0}'::jsonb,
  'Parça, radyonun görsel gerektirmediğini söyler. Bu nedenle radyo dinlemek için ekrana bakmak gerektiği yargısı çıkarılamaz.',
  '"Televizyon" sözcüğü geçtiği için aday radyonun da ekranla ilişkili olduğunu sanabilir. Oysa parça radyonun görsel gerektirmediğini vurgular.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Yer altı suyu, yağmurla beslendiği için yenilenebilir bir kaynak sayılır. ....... Çünkü bir kaynaktan, yenilenme hızından fazlasını çekmek, uzun vadede o kaynağı tüketir; kuyuların derinleşmesi bunun ilk işaretidir.

Bu parçada boş bırakılan yere düşüncenin akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["Bu nedenle yer altı suyu her miktarda çekilebilir.","Ne var ki bu yenilenme sınırsız değildir; kullanım hızı yenilenme hızını aştığında kaynak azalır.","Yağmur yağdıkça kuyular kendiliğinden derinleşir.","Yer altı suyu yalnızca tarımda kullanılabilir.","Kaynakların tükenmesi yalnızca yüzey sularında görülür."],"correctIndex":1}'::jsonb,
  'Boşluktan sonraki "Çünkü" cümlesi, yenilenme hızından fazla çekmenin kaynağı tükettiğini söyler. Bu gerekçeyi, yenilenmenin sınırsız olmadığını belirten cümle taşır.',
  'İlk cümledeki "yenilenebilir" sözcüğü sınırsızlık çağrışımı yaptığı için aday "her miktarda çekilebilir" şıkkına yönelebilir. Oysa "Çünkü" cümlesi bunun tersini söyler.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'I. Bu nedenle devletler, para basma yetkisini kendi denetimlerine almıştır.
II. Ticaret geliştikçe takas, taşıması ve değer biçmesi zor bir yöntem hâline geldi.
III. İnsanlar zamanla herkesçe kabul gören bir değişim aracına ihtiyaç duydu.
IV. Madenden basılan ilk paralar bu ihtiyaca yanıt verdi.
V. Ancak paranın değeri, ona duyulan güvene bağlı olduğundan sahte para önemli bir tehdit sayıldı.

Bu cümlelerle anlamlı bir paragraf oluşturulduğunda baştan ikinci cümle hangisi olur?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":2}'::jsonb,
  'Doğru sıra II - III - IV - V - I''dir. II takasın zorluğunu verir, III ortak bir araç ihtiyacını, IV paranın ortaya çıkışını, V ("Ancak") güven sorununu anlatır; I ("Bu nedenle") devletlerin yetkisini sonuç olarak bildirir. Baştan ikinci cümle III.''tür.',
  'IV. cümle paranın ortaya çıkışını anlattığı için ikinci sıraya uygun görünür. Ancak "bu ihtiyaca" ifadesi, ihtiyacı anlatan III''ün hemen öncesinde gelmesi gerektiğini gösterir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Gökkuşağı, güneş ışığı yağmur damlalarından geçerken kırılıp renklerine ayrıldığında oluşur. Gözlemcinin güneşi arkasında, yağmuru ise karşısında bulması gerekir; bu yüzden gökkuşağı çoğunlukla yağmurdan hemen sonra, güneş açtığında görülür.

Bu parçaya en uygun başlık aşağıdakilerden hangisidir?',
  '{"options":["Işığın Hızı","Yağmur Bulutlarının Çeşitleri","Renklerin Psikolojik Etkileri","Gökkuşağının Oluşumu","Mevsimlerin Oluşumu"],"correctIndex":3}'::jsonb,
  'Parça, gökkuşağının ışığın kırılmasıyla nasıl oluştuğunu ve ne zaman görüldüğünü anlatır.',
  'Parçada yağmur ve ışık geçtiği için aday bunlarla ilgili geniş başlıklara yönelebilir. Oysa bunlar gökkuşağının oluşumunu açıklayan ayrıntılardır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Yaşlandıkça yeni bir şey öğrenmenin zorlaştığına dair yaygın bir inanç vardır. Oysa öğrenmeyi zorlaştıran, çoğu zaman yaş değil, "artık geç" diyerek denemeyi bırakmaktır. Yeni bir dil ya da enstrüman öğrenmeye başlayan yaşlılar, beyinlerinin bu çabaya yeniden bağlantılar kurarak yanıt verdiğini gösteriyor.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Yaşlılar yeni bir şey öğrenemez.","Genç beyin, yaşlı beyinden her zaman daha esnektir.","Yeni bir enstrüman öğrenmek yalnızca çocuklara uygundur.","Beyin bağlantıları yaşlandıkça yenilenmez.","Öğrenme becerisini sınırlayan, yaştan çok denemekten vazgeçmektir."],"correctIndex":4}'::jsonb,
  'Yazar, öğrenmeyi zorlaştıranın yaş değil "artık geç" diyerek denemeyi bırakmak olduğunu ve yaşlı beyinlerin de yeni bağlantılar kurduğunu söyler.',
  'İlk cümledeki yaygın inanç, yaşlıların öğrenemeyeceği yargısını çağrıştırır. Oysa yazar bu inancı "Oysa" ile reddeder.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Semt pazarları, üreticinin ürününü doğrudan tüketiciye sattığı yerlerdir. Ürünler genellikle mevsimine uygun ve tazedir; fiyatlar ise pazarlıkla değişebilir. Pazarlar ayrıca insanların birbirini tanıdığı, esnafla müşterinin sohbet ettiği toplumsal buluşma noktalarıdır.

Bu parçada aşağıdakilerden hangisine değinilmemiştir?',
  '{"options":["Ürünlerin tazeliğine","Fiyatların pazarlıkla değişebilmesine","Pazar yerlerinin kuruluş tarihine","Pazarların toplumsal işlevine","Üreticinin tüketiciyle doğrudan buluşmasına"],"correctIndex":2}'::jsonb,
  'Parçada üretici-tüketici ilişkisi, tazelik, pazarlık ve toplumsal işlev anlatılır. Kuruluş tarihine değinilmez.',
  'Parça pazarın özelliklerini sıraladığı için aday tarihsel bir bilginin de bulunduğunu sanabilir. Oysa metinde tarih ya da kuruluş bilgisi yoktur.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  '(I) Bazı bakteriler, bağırsaklarda sindirime yardımcı olur. (II) Hatta bu bakterilerin dengesi bozulduğunda bağışıklık bile etkilenebilir. (III) Bu nedenle bakterilerin tamamını düşman saymak, vücudun kendi dengesini bozmaya yol açabilir.

Bu parçadaki II. cümlenin işlevi aşağıdakilerden hangisidir?',
  '{"options":["Önceki cümledeki bilgiyi güçlendiren ek bir bilgi vermek","Önceki bilgiye karşı çıkmak","Konunun tanımını yapmak","Parçanın sonucunu bildirmek","Konuyu başka bir alana taşımak"],"correctIndex":0}'::jsonb,
  'II. cümle, "Hatta" ile I. cümledeki yarar bilgisini genişletir ve bağışıklıkla ilişkisini ekler.',
  '"Hatta" bağlacı vurguyu artırdığı için aday cümleyi karşıtlık sanabilir. Oysa "hatta" önceki bilgiyi güçlendiren bir ek bilgi sunar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Ses kayıtları, bir konuşmanın sözcüklerini saklar; ancak konuşmacının vurgusunu, bakışını ve ortamın havasını aynı ölçüde aktaramaz. Bu yüzden aynı kayıt, farklı dinleyiciler tarafından farklı biçimlerde yorumlanabilir.

Bu parçadan aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Ses kayıtları sözcükleri saklar.","Ses kayıtları, bir konuşmanın bütün unsurlarını eksiksiz biçimde saklar.","Vurgu ve bakış kayıtta aynı ölçüde aktarılamaz.","Aynı kayıt farklı biçimlerde yorumlanabilir.","Ortamın havası, ses kaydına tam olarak yansımaz."],"correctIndex":1}'::jsonb,
  'Parça, ses kayıtlarının vurguyu, bakışı ve ortamı aynı ölçüde aktaramadığını söyler. Bu nedenle her unsuru eksiksiz sakladığı yargısı parçayla çelişir.',
  '"Sözcüklerini saklar" ifadesi kayıtların her şeyi sakladığı izlenimini verebilir. Oysa "ancak" ile başlayan ifade bunu sınırlar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Elektrikli araçlar egzoz gazı çıkarmadığı için hava kirliliğini azaltan bir çözüm olarak görülür. ....... Çünkü araçların kullandığı elektrik kömür gibi kaynaklardan üretiliyorsa kirlilik yalnızca santrale taşınmış olur.

Bu parçada boş bırakılan yere düşüncenin akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["Bu nedenle elektrikli araçlar her koşulda çevre dostudur.","Elektrik üretimi hiç kirlilik yaratmaz.","Benzinli araçlar çevreye daha az zarar verir.","Ne var ki bu araçların çevreye katkısı, kullandıkları elektriğin nasıl üretildiğine de bağlıdır.","Elektrikli araçlar yalnızca şehir içinde kullanılabilir."],"correctIndex":3}'::jsonb,
  'Boşluktan sonraki "Çünkü" cümlesi, elektriğin kömürden üretilmesi hâlinde kirliliğin santrale taşındığını söyler. Bu gerekçe, çevresel katkının elektriğin üretim biçimine bağlı olduğunu belirten cümleyle uyumludur.',
  'İlk cümledeki olumlu ifade aday için olumlu bir sonuç cümlesi çağrıştırır ("her koşulda çevre dostu"). Oysa "Çünkü" cümlesi bir sınırlama getirir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Organik tarım, ürünün yalnızca kimyasalsız yetiştirilmesi değildir; toprağın uzun vadede verimini koruyan bir üretim anlayışını da içerir. Nöbetleşe ekim, doğal gübre ve zararlılarla biyolojik mücadele bu anlayışın araçlarıdır.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Organik tarım, her ürün için daha ucuz bir yöntemdir.","Nöbetleşe ekim, toprağın verimini düşürür.","Kimyasalsız her ürün organik sayılır.","Doğal gübre yalnızca bahçelerde kullanılır.","Organik tarım, kimyasaldan kaçınmanın ötesinde toprağın sürekliliğini gözeten bütüncül bir üretim biçimidir."],"correctIndex":4}'::jsonb,
  'Yazar, organik tarımın yalnızca kimyasalsız üretim olmadığını, toprağın verimini koruyan bütüncül bir anlayış olduğunu söyler.',
  '"Kimyasalsız yetiştirilmesi" ifadesi vurgulandığı için aday "kimyasalsız her ürün organiktir" yargısına yönelebilir. Oysa yazar "yalnızca ... değildir" diyerek bunu sınırlar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Stresli anlarda nefesimiz sığ ve hızlı hâle gelir. ....... Çünkü yavaş ve derin nefes, vücuda tehlikede olmadığımız mesajını göndererek kalp atışını sakinleştirir.

Bu parçada boş bırakılan yere düşüncenin akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["Nefes alıp vermek stresi artırır.","Derin nefes yalnızca spor sırasında alınmalıdır.","Bu nedenle nefesi bilinçli olarak yavaşlatmak, gerginliği azaltmanın basit bir yoludur.","Hızlı nefes kalp atışını yavaşlatır.","Stres, nefesle hiçbir ilişkisi olmayan bir durumdur."],"correctIndex":2}'::jsonb,
  'Boşluktan sonraki "Çünkü" cümlesi, yavaş ve derin nefesin kalbi sakinleştirdiğini söyler. Bu gerekçeyi, nefesi bilinçli yavaşlatmanın gerginliği azaltacağını belirten cümle taşır.',
  '"Hızlı nefes kalp atışını yavaşlatır" şıkkı parçadaki sözcükleri ters yönde kullanır. Oysa parça yavaş nefesin sakinleştirdiğini söyler.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'I. Bu nedenle mühendisler, köprü tasarlarken yükü eşit dağıtan biçimleri tercih eder.
II. Bir köprü, yalnızca kendi ağırlığını değil, üzerinden geçen araçların yükünü de taşımak zorundadır.
III. Yük, taşıyıcı elemanlar arasında dengeli dağılmazsa bir noktada aşırı gerilim birikir.
IV. Kemer biçimi, yükü yanlara yayarak bu gerilimi azaltan klasik çözümlerden biridir.
V. Bu gerilim, uzun süre göz ardı edilirse yapıda çatlaklara yol açar.

Bu cümlelerle anlamlı bir paragraf oluşturulduğunda baştan üçüncü cümle hangisi olur?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":4}'::jsonb,
  'Doğru sıra II - III - V - I - IV''tür. II yükü, III dengesiz dağılımı ve gerilimi, V ("Bu gerilim") sonucunu anlatır; I ("Bu nedenle") mühendislerin tercihini, IV kemer çözümünü bildirir. Baştan üçüncü cümle V.''tir.',
  'IV. cümle "bu gerilimi azaltan" dediği için III''ün hemen ardına konulabilir gibi görünür. Ancak V''teki "Bu gerilim" ifadesi de III''e bağlıdır; I''in ardından gelen IV ise çözümü verir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Ders çalışırken müzik dinlemek çoğu kişiye verimli gelir; oysa sözlü müzik, okunan metinle aynı dil alanını kullandığı için dikkati böler. Müziğin keyif verdiği doğrudur; ama keyif, öğrenmenin verimiyle aynı şey değildir.

Bu parçada yazarın amacı aşağıdakilerden hangisidir?',
  '{"options":["Ders çalışırken müzik dinlemenin verimli olduğu inancını sorgulamak","Müziğin insana keyif vermediğini savunmak","Ders çalışmanın gereksiz olduğunu göstermek","Müzik dinlemenin tamamen yasaklanmasını önermek","Sözlü müziğin dil öğrenimini kolaylaştırdığını kanıtlamak"],"correctIndex":0}'::jsonb,
  'Yazar, müzik dinleyerek çalışmanın verimli gelmesine karşın dikkati böldüğünü söyler; amacı bu inancı sorgulamaktır.',
  '"Müziğin keyif verdiği doğrudur" ifadesi yazarın müziği olumladığı izlenimini verebilir. Oysa yazar keyfi verimden ayırır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Işık, yıldızlardan bize ulaşana kadar yıllar, hatta binlerce yıl yol alır. Bu yüzden gece gökyüzünde gördüğümüz bir yıldızın görüntüsü, o yıldızın şu anki hâlini değil geçmişteki hâlini yansıtır.

Bu parçadan aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Yıldızların ışığı bize ulaşmak için zamana ihtiyaç duyar.","Gökyüzünde gördüğümüz yıldızlar, şu anki hâlleriyle görünür.","Gördüğümüz yıldız görüntüsü geçmişe ait olabilir.","Bazı yıldızların ışığı binlerce yıl yol alır.","Işığın yolculuğu anlık değildir."],"correctIndex":1}'::jsonb,
  'Parça, görülen yıldız görüntüsünün şu anki değil geçmişteki hâli yansıttığını söyler. Bu nedenle yıldızların şu anki hâliyle göründüğü yargısı çıkarılamaz.',
  '"Gece gökyüzünde gördüğümüz" ifadesi görüntünün şu an olduğunu düşündürür. Oysa parça bunu açıkça reddeder.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  '(I) Bitkisel boyalar, kök, yaprak ve kabuk gibi doğal kaynaklardan elde edilir. (II) Kökboya bitkisi, kırmızı tonların ustalıkla elde edildiği geleneksel kaynaklardan biridir. (III) Bu boyalar, sentetik boyalara göre çevreye daha az zarar verir. (IV) Dokuma tezgâhlarının tarihi, Mezopotamya''ya kadar uzanır. (V) Bu nedenle geleneksel el sanatlarında doğal boya yeniden ilgi görmektedir.

Bu parçadaki numaralanmış cümlelerden hangisi düşüncenin akışını bozmaktadır?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":3}'::jsonb,
  'Parça, bitkisel boyaların kaynaklarını ve çevresel üstünlüğünü anlatır. IV. cümle ise dokuma tezgâhlarının tarihine geçerek konunun dışına çıkar.',
  'IV. cümle de el sanatlarıyla ilgili olduğu için konu içinde gibi görünür. Ancak parçanın ekseni boyaların kaynağı ve etkisidir; tezgâh tarihi bu bütünlüğü bozar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Bir hediyenin değeri, çoğu zaman fiyatıyla ölçülür. Oysa hediye, alanın ihtiyacını ve zevkini ne kadar düşündüğümüzü gösterdiğinde anlam kazanır. Pahalı ama düşünülmeden alınmış bir hediye, ucuz ama kişiye özel bir hediyenin yanında soğuk kalır.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Pahalı hediyeler her zaman daha anlamlıdır.","Hediye almak, ihtiyaç düşünülmeden yapılmalıdır.","Ucuz hediyeler değersizdir.","Bir hediyeyi değerli kılan, fiyatından çok alıcıyı ne kadar düşünerek seçildiğidir.","Hediyenin anlamı yalnızca ambalajına bağlıdır."],"correctIndex":3}'::jsonb,
  'Yazar, hediyenin değerini fiyatla değil, alıcıyı düşünerek seçilmesiyle ilişkilendirir.',
  'İlk cümledeki "fiyatla ölçülür" ifadesi pahalı hediyenin değerli olduğu izlenimini verir. Oysa yazar bunu "Oysa" ile reddeder.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Mektubun yerini hızlı mesajlaşma aldığında kaybolan şey, yalnızca yazı biçimi değil, beklemenin verdiği heyecandır. Bir cevabın günler sonra geleceğini bilmek, yazarken sözcükleri daha özenle seçtirirdi. Hızın getirdiği kolaylık elbette değerli; ama yavaşlığın öğrettiklerini de unutmamak gerekir.

Bu parçada yazarın mektup ve mesajlaşmaya yönelik yaklaşımı aşağıdakilerden hangisidir?',
  '{"options":["Mesajlaşmanın hiçbir yararı olmadığını düşünmektedir.","Mektubun yeniden yaygınlaşması gerektiğini savunmaktadır.","Hızın her zaman kaliteyi artırdığını ileri sürmektedir.","Mektup yazmanın zaman kaybı olduğunu söylemektedir.","Hızlı iletişimin yararını kabul etmekle birlikte yavaş iletişimin kattıklarını da değerli bulmaktadır."],"correctIndex":4}'::jsonb,
  'Yazar, hızlı iletişimin değerini kabul eder ama yavaşlığın kattığı özen ve heyecanı da değerli bulur.',
  '"Kaybolan şey" ifadesi mesajlaşmanın tümüyle olumsuz görüldüğü izlenimini verebilir. Oysa yazar "elbette değerli" diyerek hızı da kabul eder.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Yetişkinler yeni bir dili öğrenirken çocuklardan daha yavaş ilerliyor gibi görünür. ....... Çünkü yetişkinler, kuralları bilinçli olarak çözümleyebilir ve öğrenme stratejilerini kendileri seçebilir.

Bu parçada boş bırakılan yere düşüncenin akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["Bu nedenle yetişkinler yeni bir dili hiçbir zaman öğrenemez.","Çocuklar kuralları bilinçli olarak çözümler.","Oysa bu yavaşlık, öğrenme kapasitesinden çok kullanılan yöntemin farkından kaynaklanıyor olabilir.","Dil öğrenmek yalnızca çocukluk çağında mümkündür.","Yetişkinlerin öğrenme stratejileri yoktur."],"correctIndex":2}'::jsonb,
  'Boşluktan sonraki "Çünkü" cümlesi, yetişkinlerin bilinçli çözümleme ve strateji seçme gücünü sayar. Bu gerekçe, yavaşlığın kapasiteden değil yöntemden kaynaklanabileceğini belirten cümleyi destekler.',
  'İlk cümledeki "daha yavaş" ifadesi yetişkinlerin öğrenemeyeceği sonucunu çağrıştırır. Oysa "Çünkü" cümlesi yetişkinlerin güçlü yönlerini anlatır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Kutup ayıları, kalın yağ tabakası ve iki katmanlı kürkleri sayesinde aşırı soğukta hayatta kalır. Besinlerini büyük ölçüde deniz buzu üzerinde avlanarak sağlarlar; buzların erimesi, avlanma alanlarını daraltır.

Bu parçada aşağıdakilerden hangisine değinilmemiştir?',
  '{"options":["Kutup ayılarının yavrularını nasıl büyüttüğüne","Yağ tabakasının koruyucu işlevine","Kürk yapısına","Avlanma biçimine","Buzların erimesinin etkisine"],"correctIndex":0}'::jsonb,
  'Parçada yağ tabakası, kürk, avlanma biçimi ve buzların erimesinin etkisi anlatılır. Yavruların büyütülmesine değinilmez.',
  'Kutup ayıları denince yavru bakımı çağrışımı yapıldığı için aday bu bilginin de bulunduğunu sanabilir. Oysa metinde yavrulardan söz edilmez.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'I. Dijital arşivler, bu koleksiyonları dünyanın her yerinden erişilebilir kılar.
II. Müzeler, sergileyebildiklerinden çok daha fazla esere sahiptir.
III. Deponun karanlığında kalan eserler, ziyaretçilerle hiç buluşamaz.
IV. Bu eserlerin tarandığı ve çevrimiçi yayımlandığı projeler, bu duruma çözüm getirmektedir.
V. Üstelik dijital kopya, kırılgan eserin gereksiz yere elle temas görmesini de önler.

Bu cümlelerle anlamlı bir paragraf oluşturulduğunda baştan dördüncü cümle hangisi olur?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":0}'::jsonb,
  'Doğru sıra II - III - IV - I - V''tir. II müzelerin çok sayıda eseri olduğunu, III depodaki eserlerin görülmediğini, IV çözümü (dijital projeler), I ("bu koleksiyonları") erişimi, V ("Üstelik") ek yararı anlatır. Baştan dördüncü cümle I.''dir.',
  'V. cümle de dijital kopyadan söz ettiği için dördüncü sırada olabilir gibi görünür. Ancak "Üstelik" ifadesi bir ek yarar bildirdiği için en sonda gelir; dördüncü sırada I yer alır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  '(I) Bir toplantının verimli geçmesi, katılımcıların gündemi önceden bilmesine bağlıdır. (II) Gündemi önceden paylaşılan toplantılarda kişiler hazırlıklı gelir ve konuşma dağılmaz. (III) Toplantı odasının renk seçimi, çalışanların yorgunluk düzeyini etkileyebilir. (IV) Gündem belirsizse tartışma, asıl konunun dışına kolayca kayar. (V) Bu nedenle toplantı çağrısıyla birlikte konu başlıklarının da gönderilmesi önerilir.

Bu parçadaki numaralanmış cümlelerden hangisi düşüncenin akışını bozmaktadır?',
  '{"options":["I.","II.","III.","IV.","V."],"correctIndex":2}'::jsonb,
  'Parça, gündemin toplantı verimine etkisini anlatır. III. cümle ise oda rengine geçerek gündem konusundan uzaklaşır ve akışı bozar.',
  'III. cümle de toplantıyla ilgili olduğu için konu içinde gibi görünür. Ancak parçanın ekseni gündemin paylaşılmasıdır; oda rengi bu bütünlüğün dışında kalır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Cesaret, korkunun yokluğu değil, korkuya rağmen harekete geçebilmektir. Hiç korkmayan biri, aslında tehlikeyi görmeyen biridir; korkusunu bilen ve yine de adım atan ise cesur sayılır.

Bu parçadan aşağıdakilerden hangisi çıkarılamaz?',
  '{"options":["Cesaret, korkuya rağmen harekete geçmektir.","Cesur kişiler hiçbir zaman korku duymaz.","Hiç korkmayan kişi tehlikeyi görmüyor olabilir.","Korkusunu bilen kişi de cesur olabilir.","Korku, cesaretin yokluğu anlamına gelmez."],"correctIndex":1}'::jsonb,
  'Parça, cesaretin korkunun yokluğu olmadığını söyler. Cesur kişilerin hiç korku duymadığı yargısı parçayla çelişir.',
  '"Hiç korkmayan biri" ifadesi cesur kişiyi çağrıştırır; aday bunu cesaretin tanımı sanabilir. Oysa yazar bu kişiyi tehlikeyi görmeyen biri olarak tanımlar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  '(I) Birçok kişi, sağlıklı beslenmenin pahalı olduğunu düşünür. (II) Oysa mevsiminde alınan sebze ve baklagiller, işlenmiş gıdalardan çoğu zaman daha ucuzdur. (III) Dolayısıyla sağlıklı beslenmenin önündeki asıl engel, para değil bilgi ve alışkanlıktır.

Bu parçadaki III. cümlenin işlevi aşağıdakilerden hangisidir?',
  '{"options":["Konunun tanımını yapmak","Önceki cümledeki görüşü örnekle desteklemek","Yeni bir konuya geçiş yapmak","Önceki cümlelerden bir sonuç çıkarmak","Önceki cümledeki bilgiyi aynen yinelemek"],"correctIndex":3}'::jsonb,
  'III. cümle "Dolayısıyla" ile başlar ve önceki cümlelerdeki bilgiden (sebze ve baklagiller ucuzdur) bir sonuç çıkarır.',
  'III. cümle de yeni bir yargı içerdiği için aday yeni bir konuya geçildiğini sanabilir. Oysa "Dolayısıyla" bağı bu yargının öncekilerden çıktığını gösterir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Ambalajlı gıdaların etiketinde içindekiler listesi, miktara göre azalan sırayla yazılır. İlk sırada yer alan bileşen, üründe en çok bulunandır. Bu yüzden etiketi okuyan bir tüketici, bir ürünün gerçekte neyle yapıldığını reklamlardan daha güvenilir biçimde anlayabilir.

Bu parçaya en uygun başlık aşağıdakilerden hangisidir?',
  '{"options":["Ambalaj Malzemelerinin Geri Dönüşümü","Reklamların Tüketiciyi Etkileme Yöntemleri","Gıda Güvenliğinde Soğuk Zincir","Beslenme Alışkanlıklarının Tarihi","Gıda Etiketlerinin Okunması ve Önemi"],"correctIndex":4}'::jsonb,
  'Parça, gıda etiketindeki içindekiler listesinin nasıl okunacağını ve neden önemli olduğunu anlatır.',
  'Parçada "reklamlar" geçtiği için aday reklamlarla ilgili bir başlığa yönelebilir. Oysa reklam yalnızca etiketle karşılaştırılan bir ayrıntıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Yürüyen merdivenler, sürekli dönen bir zincir üzerine yerleştirilmiş basamaklarla çalışır. Basamaklar üst düzeyde düzleşerek yolcunun rahatça inmesini sağlar. Motor, zinciri sabit hızda çeker; bu yüzden yolcular ayakta durarak bile yukarı çıkabilir.

Bu parçanın konusu aşağıdakilerden hangisidir?',
  '{"options":["Yürüyen merdivenlerin çalışma düzeni","Yüksek binalarda güvenlik önlemleri","Motorların enerji tüketimi","Kentlerde ulaşım sorunları","Asansörlerin tarihçesi"],"correctIndex":0}'::jsonb,
  'Parça, yürüyen merdivenin zincir, basamak ve motorla nasıl çalıştığını anlatır.',
  'Parçada "motor" geçtiği için aday enerji tüketimiyle ilgili bir konu seçebilir. Oysa motor yalnızca çalışma düzeninin bir parçasıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Çocukların ebeveynlerine benzemesi yalnızca genlerle açıklanamaz; birlikte yaşanan ortam, alışkanlıklar ve örnek alınan davranışlar da benzerliği artırır. Bu yüzden bir özelliğin ailede görülmesi, tek başına kalıtsal olduğunu göstermez.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Çocuklar ebeveynlerine yalnızca genler yoluyla benzer.","Ailedeki benzerlikler, yalnızca kalıtımla değil ortak çevre ve alışkanlıklarla da açıklanabilir.","Ortam, davranış benzerliğini etkilemez.","Ailede görülen her özellik kalıtsaldır.","Alışkanlıklar kalıtımla belirlenir."],"correctIndex":1}'::jsonb,
  'Yazar, benzerliğin genlerin yanı sıra ortam ve alışkanlıklarla da açıklandığını, ailede görülmenin tek başına kalıtsallık anlamına gelmediğini söyler.',
  '"Ebeveynlerine benzemesi" ifadesi kalıtımı çağrıştırdığı için aday "yalnızca genler" şıkkına yönelebilir. Oysa yazar bunu açıkça sınırlar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Bazı insanlar bir kararın doğruluğunu, çok kişinin onu benimsemesine bakarak ölçer. Oysa kalabalığın bir şeyi onaylaması, onun doğru olduğunu garanti etmez; tarih, çoğunluğun yanıldığı pek çok örnekle doludur. Bu, çoğunluğu dinlememeyi değil, onu da sorgulayarak dinlemeyi gerektirir.

Bu parçada yazarın amacı aşağıdakilerden hangisidir?',
  '{"options":["Çoğunluğun görüşünün hiçbir zaman dikkate alınmaması gerektiğini savunmak","Tarihte çoğunluğun hiç yanılmadığını kanıtlamak","Kalabalıkların her zaman haklı olduğunu açıklamak","Çoğunluğun görüşünü doğruluk ölçütü saymanın sakıncasını göstermek","Karar almanın gereksiz olduğunu ileri sürmek"],"correctIndex":3}'::jsonb,
  'Yazar, çoğunluğun onayının doğruluğu garanti etmediğini söyler ve çoğunluğu sorgulayarak dinlemeyi önerir.',
  '"Çoğunluğu dinlememeyi değil" ifadesi yazarın çoğunluğa karşı olmadığını gösterir. "Hiç dikkate alınmamalı" şıkkı bu ifadeyi gözden kaçırır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  2,
  'Limanda sabahın ilk ışıklarıyla birlikte tekneler birer birer kıyıya yanaşıyordu. Balıkçıların elleri, nemli ağların arasında hızla çalışıyor; martılar, tezgâhların üzerinde dönüp duruyordu. Havada tuz ve taze balık kokusu vardı.

Bu parçada ağır basan anlatım biçimi aşağıdakilerden hangisidir?',
  '{"options":["Açıklayıcı anlatım","Tartışmacı anlatım","Öyküleyici anlatım","Anlatım biçimlerinden hiçbiri ağır basmamaktadır.","Betimleyici anlatım"],"correctIndex":4}'::jsonb,
  'Parçada bir ortamın görüntü ve kokularıyla canlandırılması vardır; bu, betimleyici anlatımdır.',
  '"Yanaşıyordu", "çalışıyor" gibi fiiller hareket çağrışımı yaptığı için aday öyküleme sanabilir. Oysa parçada olay örgüsü değil, bir sahne anlatılır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Paragrafta Anlam ve Yapı',
  'multiple_choice',
  3,
  'Başarı, çoğu zaman ödülle ölçülür; oysa ödül, çabanın tek göstergesi değildir. Bazı çabalar sonuç getirmez, ama kişiyi yeni bir bilgiye, yeni bir bakışa götürür. Çabayı yalnızca sonuca bağlamak, öğrenmeyi gözden kaçırmak demektir.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?',
  '{"options":["Ödül, çabanın tek göstergesidir.","Çabanın değeri, yalnızca ödüle ulaşmasıyla değil, kişiye kazandırdıklarıyla da ölçülmelidir.","Sonuç getirmeyen çabalar boşa gider.","Başarı yalnızca şansa bağlıdır.","Öğrenme, her zaman sonuca endekslenmelidir."],"correctIndex":1}'::jsonb,
  'Yazar, ödülün çabanın tek göstergesi olmadığını, sonuç getirmeyen çabanın da öğrenme sağlayabileceğini söyler.',
  'İlk cümlede "başarı ödülle ölçülür" ifadesi genel bir kanıyı yansıtır; aday bunu yazarın görüşü sanabilir. Oysa yazar bunu "oysa" ile sınırlar.',
  array['lisans_gygk']::text[],
  'lisans'
),
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
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde "baş" sözcüğü gerçek anlamıyla kullanılmıştır?',
  '{"options":["Köyün başında büyük bir çınar var.","Bu işin başında ben varım.","Başını yastığa koyar koymaz uyudu.","Yeni yılın başında yeniden buluştuk.","Dağın başına kar yağmış."],"correctIndex":2}'::jsonb,
  'Doğru şıkta "baş", vücudun bir bölümünü, yani temel anlamını bildirir. Diğer cümlelerde "uç, yönetici, başlangıç, tepe" gibi yan ve mecaz anlamlar vardır.',
  '"Başında, başına" gibi ek almış biçimler aday için yan anlamı çağrıştırır. Oysa doğru şıkta söz konusu olan, insanın başı, yani sözcüğün ilk ve temel anlamıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  3,
  '"Garsondan hesabı getirmesini istedik." cümlesindeki "hesap" sözcüğü aşağıdakilerin hangisinde aynı anlamda kullanılmıştır?',
  '{"options":["Restoranda hesabı ödemek için kartımı çıkardım.","Matematikte dört işlem hesabı yapmayı öğrendi.","Yaptıklarının hesabını vermek zorunda kalacak.","Bankadaki hesabından para çekti.","Bu işin hesabını iyi yapmadan karar verme."],"correctIndex":0}'::jsonb,
  'Soru kökünde "hesap", ödenecek tutarı (fatura) bildirir. Aynı anlam, "hesabı ödemek" ifadesinde de vardır. Diğerlerinde işlem, sorumluluk, banka hesabı ve planlama anlamları vardır.',
  '"Bankadaki hesabından para çekti" cümlesi de para ile ilgili olduğu için yakın görünür. Oysa orada "hesap", bankadaki hesabı (hesap numarası) anlatır; ödenecek tutar değildir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde "soğuk" sözcüğü mecaz anlamda kullanılmıştır?',
  '{"options":["Soğuk sudan dişleri sızladı.","Toplantıda herkes ona soğuk davrandı.","Soğuk havada dışarı çıkmadık.","Bu çorbayı soğuk içmem.","Soğuk kış günlerini hep özlüyorum."],"correctIndex":1}'::jsonb,
  '"Soğuk davranmak", sıcaklık bildirmez; ilgisiz ve mesafeli davranmayı anlatır. Bu nedenle mecazdır. Diğerlerinde sözcük gerçek anlamıyla (düşük sıcaklık) kullanılmıştır.',
  '"Soğuk kış günlerini özlüyorum" cümlesi duygusal bir söz içerdiği için mecaz sanılabilir. Oysa "soğuk" burada yine hava sıcaklığını bildirir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde "alan" sözcüğü terim anlamında kullanılmıştır?',
  '{"options":["Bu alanda uzman bir hekimdir.","Çocuklar oyun alanında koşturuyordu.","Yeni alanlar keşfetmek istiyordu.","Dikdörtgenin alanı, kenar uzunluklarının çarpımına eşittir.","Kapıdan çıkınca geniş bir açıklığa ulaştık."],"correctIndex":3}'::jsonb,
  'Geometrideki "alan", belirli bir bilim dalına özgü kavramdır; terim anlamındadır. Diğer cümlelerde sözcük günlük yaşamdaki yer, konu ve açıklık anlamlarında kullanılmıştır.',
  '"Bu alanda uzman" ifadesi bir bilim dalına gönderme yaptığı için terim sanılabilir. Oysa bu kullanımda "alan", genel anlamıyla "konu, sahası" demektir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde "çay" sözcüğü, "Yaz boyunca çay kıyısında çadır kurduk." cümlesindeki anlamıyla kullanılmıştır?',
  '{"options":["Sabah çayını balkonda içti.","Misafirlere taze çay ikram etti.","Çay molasında herkes dinlendi.","Demli çayın üzerine limon sıktı.","Köyün altındaki çayın suyu çok berraktı."],"correctIndex":4}'::jsonb,
  'Soru kökündeki "çay", akarsu (dere) anlamındadır. Aynı anlam, "çayın suyu" ifadesinde de vardır. Diğer cümlelerde "çay" içecek olarak kullanılmıştır. Bu iki sözcük sesteştir.',
  'Dört şıkta da "çay" içecek anlamıyla geçtiği için aday kalabalığa uyabilir. Soru kökündeki "kıyısında" sözü, akarsu anlamını belirler.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  1,
  'Aşağıdaki sözcüklerden hangisi sesteş (eş sesli) değildir?',
  '{"options":["yaz","kır","masa","ben","kara"],"correctIndex":2}'::jsonb,
  '"Yaz" (mevsim/fiil), "kır" (ova/kırmak), "ben" (zamir/leke) ve "kara" (siyah/toprak) farklı anlamlarla kullanılan sesteş sözcüklerdir. "Masa" tek anlamlıdır.',
  '"Masa" günlük yaşamda çok kullanıldığı için aday birden çok anlam arayabilir. Ancak sesteşlikte aynı yazılan ve okunan sözcüğün birbirinden bağımsız anlamları bulunmalıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  1,
  'Aşağıdaki sözcük çiftlerinden hangisi eş anlamlıdır?',
  '{"options":["hekim - doktor","yoksul - cimri","kitap - dergi","tarla - bahçe","dağ - yamaç"],"correctIndex":0}'::jsonb,
  'Hekim ve doktor, aynı mesleği bildiren eş anlamlı sözcüklerdir. Diğer çiftlerde sözcükler birbirinden farklı anlamlar taşır.',
  '"Dağ - yamaç" gibi birbiriyle ilişkili sözcükler eş anlamlı sanılabilir. Eş anlamlıda iki sözcük birbirinin yerine kullanılabilmelidir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde "güçlü" sözcüğü yerine "sağlam" sözcüğü anlam bozulmadan getirilebilir?',
  '{"options":["Güçlü bir sesle konuştu.","Güçlü bir temel üzerine ev inşa etti.","Güçlü bir kahve içmek istiyorum.","Güçlü bir rüzgâr esmeye başladı.","Güçlü bir akımla sürüklendik."],"correctIndex":1}'::jsonb,
  '"Güçlü temel" yerine "sağlam temel" denebilir; anlam korunur. Diğer cümlelerde "sağlam" sözcüğü bu anlamı vermez.',
  '"Güçlü" ve "sağlam" yakın anlamlı olduğu için her cümlede değiştirilebileceği sanılır. Ancak "güçlü ses, güçlü kahve, güçlü rüzgâr" gibi tamlamalar yalnızca "güçlü" sözcüğüyle kurulur.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki sözcük çiftlerinden hangisi karşıt anlamlı değildir?',
  '{"options":["genç - yaşlı","kısa - uzun","zengin - yoksul","cömert - eli açık","alçak - yüksek"],"correctIndex":3}'::jsonb,
  '"Cömert" ve "eli açık" aynı anlamı taşır (eş anlam). Diğer çiftlerde karşıtlık vardır.',
  '"Eli açık" ifadesi mecazlı bir söz olduğu için karşıt anlamlı gibi görünebilir. Oysa deyim, cömertliği anlatır ve "cömert" ile aynı anlamdadır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde "açık" sözcüğünün karşıtı "koyu"dur?',
  '{"options":["Hava açık olduğu için yola çıktık.","Mağazanın kapısı hâlâ açıktı.","Konuyu açık bir dille anlattı.","Açık bir cevap vermesini bekliyorduk.","Açık mavi bir gömlek giymişti."],"correctIndex":4}'::jsonb,
  '"Açık mavi" ifadesinde "açık", renk tonunu bildirir; karşıtı "koyu"dur. Diğer cümlelerde karşıtı sırasıyla "kapalı/bulutlu", "kapalı", "karışık" ve "belirsiz" olur.',
  '"Açık" sözcüğünün birden çok karşıtı olduğu için aday, her cümlede "kapalı" karşıtını arar. Oysa soru yalnızca "koyu" karşıtını sorar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde soyut anlamlı bir sözcük kullanılmıştır?',
  '{"options":["Masanın üzerinde bir vazo duruyordu.","Çocuk, bahçedeki ağaca tırmandı.","Onun cesareti herkesi etkiledi.","Kapıyı açıp içeri girdi.","Sokaktan geçen arabanın sesi duyuldu."],"correctIndex":2}'::jsonb,
  'Cesaret, beş duyuyla algılanamayan, soyut bir kavramdır. Diğer cümlelerdeki vazo, ağaç, kapı ve ses somut (duyularla algılanabilir) varlıklardır.',
  '"Ses" sözcüğü gözle görülemediği için soyut sanılabilir. Oysa ses kulakla algılandığı için somuttur; soyut olanlar duyularla algılanamayan kavramlardır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  1,
  'Aşağıdaki sözcüklerden hangisi, diğerlerini kapsayan genel anlamlı bir sözcüktür?',
  '{"options":["meyve","elma","armut","kiraz","şeftali"],"correctIndex":0}'::jsonb,
  '"Meyve", elma, armut, kiraz ve şeftaliyi içine alan genel bir kavramdır. Diğerleri bu genel kavramın özel örnekleridir.',
  'Hepsi yiyecek adı olduğu için aday özel-genel ilişkisini gözden kaçırabilir. Genel anlamlı sözcük, diğerlerini kapsayan sözcüktür.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde deyim, anlamına uygun kullanılmamıştır?',
  '{"options":["Önerimize burun kıvırdı; hiç beğenmedi.","Yemeği beğenmeyince ağzı kulaklarına vardı.","Yaptığı hataya göz yumdu.","Haberi duyunca tüyleri diken diken oldu.","Sorunu çözmek için hemen işe el attı."],"correctIndex":1}'::jsonb,
  '"Ağzı kulaklarına varmak", çok sevinmek anlamındadır. Yemeği beğenmemekle ilgili cümlede yanlış kullanılmıştır. Diğer deyimler (burun kıvırmak, göz yummak, tüyleri diken diken olmak, el atmak) anlamına uygundur.',
  'Deyimin içindeki "ağız" sözcüğü, yemek konusuyla ilişkili göründüğü için cümle uyumluymuş gibi okunabilir. Oysa deyim yemekle değil, sevinçle ilgilidir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki deyimlerden hangisi "çok sevinmek" anlamındadır?',
  '{"options":["burnundan kıl aldırmamak","dut yemiş bülbüle dönmek","ipe un sermek","ağzı kulaklarına varmak","kulak asmamak"],"correctIndex":3}'::jsonb,
  '"Ağzı kulaklarına varmak", yüzü gülerek çok sevindiğini gösterir. "Burnundan kıl aldırmamak" kibirli olmak, "dut yemiş bülbüle dönmek" susmak, "ipe un sermek" bahane bulmak, "kulak asmamak" aldırmamak anlamındadır.',
  '"Bülbül" sözcüğü şarkı ve neşe çağrışımı yaptığı için "dut yemiş bülbüle dönmek" deyimi sevinç sanılabilir. Oysa deyim konuşmayı kesmeyi anlatır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki deyim-anlam eşleştirmelerinden hangisi yanlıştır?',
  '{"options":["gözden düşmek - itibar kaybetmek","yüzü gülmek - mutlu olmak","eli açık - cömert","kulak kabartmak - dikkatle dinlemek","ayak uydurmak - karşı koymak"],"correctIndex":4}'::jsonb,
  '"Ayak uydurmak", çevreye ya da duruma uyum sağlamak anlamındadır; karşı koymak anlamı taşımaz. Diğer eşleştirmeler doğrudur.',
  '"Ayak" sözcüğü direnmeyi çağrıştırabilir (ayak diremek). Aday bu çağrışımla "ayak uydurmak"ı karşı koymak sanabilir; ancak deyim uyum sağlamayı anlatır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  2,
  '"Bir elin nesi var, iki elin sesi var." atasözüyle anlamca en yakın cümle aşağıdakilerden hangisidir?',
  '{"options":["Eller çok olursa gürültü artar.","Bir kişi iki kişinin işini yapabilir.","Birlikte çalışmak, tek başına çalışmaktan daha verimlidir.","İki el, bir elden daha az hata yapar.","Yardım istemek zayıflıktır."],"correctIndex":2}'::jsonb,
  'Atasözü, iş birliğinin tek başına çabadan daha güçlü sonuç verdiğini anlatır.',
  '"Eller çok olursa gürültü artar" şıkkı, atasözündeki "ses" sözcüğünü gürültü olarak yorumlar. Oysa "ses" burada birlikte çalışmanın etkisini anlatır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  2,
  '"Her yiğidin bir yoğurt yiyişi vardır." atasözüyle anlamca en yakın cümle aşağıdakilerden hangisidir?',
  '{"options":["Herkesin bir işi yapış biçimi kendine özgüdür.","Yiğitler yoğurdu çok sever.","Yoğurt yiyen yiğit olur.","Herkes aynı yöntemle başarı sağlar.","Güçlü olanlar kurallara uymak zorunda değildir."],"correctIndex":0}'::jsonb,
  'Atasözü, her insanın bir işi kendine özgü bir tarzda yaptığını söyler.',
  '"Yiğit" sözcüğü güç çağrışımı yaptığı için aday atasözünü güçlülükle ilişkilendirebilir. Oysa atasözü farklı yöntemlere saygıyı anlatır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  1,
  '"Ak akçe kara gün içindir." atasözüyle anlamca en yakın cümle aşağıdakilerden hangisidir?',
  '{"options":["Beyaz paralar siyah günlerde harcanır.","Biriktirilen para, zor günlerde işe yarar.","Kara günler, para biriktirmeyi öğretir.","Para çoğaldıkça günler karanlık olur.","Parayı harcamadan önce iyice düşünmek gerekir."],"correctIndex":1}'::jsonb,
  'Atasözü, birikimin zor zamanlar için saklanması gerektiğini anlatır.',
  '"Beyaz paralar siyah günlerde harcanır" şıkkı, atasözünün sözcüklerini yinelediği için çeldiricidir. Oysa anlamın özü, birikimin zor günlerde yararlı olmasıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  1,
  'Doktor : Hastane ilişkisi ile aşağıdakilerden hangisi aynı ilişkiyi taşır?',
  '{"options":["Öğretmen : Öğrenci","Öğretmen : Ders","Öğretmen : Defter","Öğretmen : Okul","Öğretmen : Sınav"],"correctIndex":3}'::jsonb,
  'Doktor, hastanede çalışır; öğretmen de okulda çalışır. Çalışan kişi ile çalıştığı yer ilişkisi aynıdır.',
  'Öğretmen ile ilişkili birçok sözcük olduğu için aday öğrenci ya da ders gibi şıklara yönelebilir. Ancak soruda doktorun çalıştığı yer ilişkisi aranır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  1,
  'Cesur : Korkak ilişkisi ile aşağıdakilerden hangisi aynı ilişkiyi taşır?',
  '{"options":["Dürüst : Çalışkan","Zeki : Akıllı","Güzel : Hoş","Çalışkan : Başarılı","Cömert : Cimri"],"correctIndex":4}'::jsonb,
  'Cesur ve korkak karşıt anlamlı iki kişilik özelliğidir. Cömert ve cimri de karşıt anlamlı bir çifttir. Diğer çiftlerde sözcükler eş anlamlı ya da birbirinden bağımsızdır.',
  '"Zeki : Akıllı" ve "Güzel : Hoş" gibi birbirine yakın çiftler, ilişki aranırken karşıtlıkla karıştırılabilir. Oysa bunlar eş ya da yakın anlamlıdır; soru karşıtlık ilişkisini ister.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde "yol" sözcüğü, "Bu sorunu çözmenin tek yolu sabırla beklemektir." cümlesindeki anlamıyla kullanılmıştır?',
  '{"options":["Köye giden yol kar yüzünden kapandı.","Yolun karşısındaki dükkâna girdi.","Başarıya giden yol, düzenli çalışmaktan geçer.","Bu yoldan yürürsek eve daha çabuk ulaşırız.","Kentin merkezinden geçen yol yenilendi."],"correctIndex":2}'::jsonb,
  'Soru kökündeki "yol", yöntem anlamındadır. Aynı anlam, "başarıya giden yol" ifadesinde de vardır. Diğer cümlelerde "yol", gidilen güzergâh anlamındadır.',
  '"Yol" sözcüğü en çok geçidi çağrıştırdığı için aday somut anlamlı cümlelere yönelebilir. Oysa soru kökünde sözcük soyut bir anlam (yöntem) taşır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  2,
  '"Bu sözcük, birden çok anlam taşır." cümlesindeki "taşımak" sözcüğü aşağıdakilerin hangisinde aynı anlamda kullanılmıştır?',
  '{"options":["Bu haber, gizli bir uyarı taşıyor.","Valizleri üst kata taşıdı.","Çocuğu sırtında taşıdı.","Kamyon, kumu şantiyeye taşıyor.","Su borularla köye taşınıyor."],"correctIndex":0}'::jsonb,
  'Soru kökünde "taşımak", içermek anlamındadır. Aynı anlam "uyarı taşımak" ifadesinde vardır. Diğerlerinde bir nesnenin bir yerden başka yere götürülmesi anlatılır.',
  '"Taşımak" sözcüğü çoğunlukla fiziksel bir hareketi çağrıştırır; aday bu çağrışımla somut anlamlı cümlelere yönelebilir. Oysa soru kökü soyut bir anlam taşır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde "tatlı" sözcüğü mecaz anlamda kullanılmıştır?',
  '{"options":["Tatlı bir şeyler yemek istiyordu.","Torunuyla tatlı tatlı konuşuyordu.","Bu şerbet çok tatlı olmuş.","Elmanın tatlı olanı daha pahalı.","Pastayı tatlı hâle getirmek için şeker ekledi."],"correctIndex":1}'::jsonb,
  '"Tatlı tatlı konuşmak", tat bildirmez; sevecen ve yumuşak bir konuşmayı anlatır. Bu nedenle mecazdır. Diğer cümlelerde "tatlı" tat anlamındadır.',
  'Dört şıkta da yiyecek bulunduğu için aday "tatlı" sözcüğünü hep gerçek anlamlı sanabilir. Oysa mecaz, tat dışındaki bir anlam taşıyan doğru şıktadır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  2,
  '"Masanın ayağı kırılmış." cümlesindeki "ayak" sözcüğü aşağıdakilerin hangisinde aynı anlamda kullanılmıştır?',
  '{"options":["Dağın ayağında küçük bir köy var.","Çocuk ayağını suya soktu.","Ayağıma bir taş çarptı.","Sandalyenin ayağı gıcırdıyor.","Yürümekten ayakları şişti."],"correctIndex":3}'::jsonb,
  'Soru kökünde "ayak", bir eşyayı taşıyan destek parçasıdır. Aynı anlam "sandalyenin ayağı" ifadesinde vardır. Diğerlerinde vücut organı ya da dağın alt bölümü anlamları vardır.',
  '"Dağın ayağı" ifadesi de eşyaların ayağı gibi alt kısmı gösterdiği için yakın görünür. Ancak orada "ayak", dağın eteğini anlatır; destek parçası değildir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde ikileme vardır?',
  '{"options":["Eski giysilerini bir kenara koydu.","Püsküllü bir atkı taktı.","Giysileri eskitip attı.","Giyecek eksiği yoktu.","Eski püskü giysilerle çıkıp geldi."],"correctIndex":4}'::jsonb,
  '"Eski püskü", anlamca birbirine yakın iki sözcüğün art arda kullanılmasıyla oluşan bir ikilemedir.',
  '"Eski" ve "püsküllü" sözcükleri farklı cümlelerde geçtiği için aday ikileme sanabilir. İkilemede iki sözcük birlikte ve art arda yer alır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  2,
  '"Ağrım bir saatte geçti." cümlesindeki "geçmek" sözcüğü aşağıdakilerin hangisinde aynı anlamda kullanılmıştır?',
  '{"options":["Karşıdan karşıya geçti.","Sınavı yüksek notla geçti.","Sıkıntılı günler sonunda geçti.","Yanından hızla geçti.","Zaman geçtikçe her şeyi unuttu."],"correctIndex":2}'::jsonb,
  'Soru kökündeki "geçmek", sona ermek anlamındadır. Aynı anlam "günler geçti" ifadesinde de bulunur. Diğerlerinde yer değiştirme, başarma ve zamanın akışı anlamları vardır.',
  '"Zaman geçtikçe" ifadesi süre bildirdiği için "sona erme" ile karıştırılabilir. Oysa orada zaman ilerlemektedir; bir şey sona ermez.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  1,
  '"Yüzündeki ben, onu tanımamı kolaylaştırdı." cümlesindeki "ben" sözcüğü aşağıdakilerin hangisinde aynı anlamda kullanılmıştır?',
  '{"options":["Boynundaki ben, doğuştan olmalı.","Ben bu işi yapabilirim.","Ben her zaman geç kalırım.","Ben de seninle geleyim.","Bunu ben yaptım."],"correctIndex":0}'::jsonb,
  'Soru kökündeki "ben", ciltteki küçük leke anlamındadır. Aynı anlam "boynundaki ben" ifadesinde vardır. Diğerlerinde "ben" kişi zamiridir. İki sözcük sesteştir.',
  '"Ben" sözcüğü sık kullanılan bir zamir olduğu için aday ilk anlamını (zamir) düşünebilir. Soru kökündeki "yüzündeki" sözü leke anlamını belirler.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde "sıcak" sözcüğü gerçek anlamda kullanılmıştır?',
  '{"options":["Bize çok sıcak davrandılar.","Bu çorba çok sıcak, biraz bekle.","Evimizin sıcak ortamını özlüyorum.","Sıcak bir karşılama yaptılar.","Haberi sıcağı sıcağına duyurdu."],"correctIndex":1}'::jsonb,
  'Doğru şıkta "sıcak", çorbanın ısısını bildirir; gerçek anlamdır. Diğer cümlelerde "samimi, huzurlu, içten, hemen" gibi mecaz anlamlar vardır.',
  '"Sıcak ortam" ifadesi ısıyı çağrıştırdığı için gerçek anlam sanılabilir. Oysa burada ev ortamının samimiyeti anlatılır; mecazdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  2,
  '"Şişenin ağzını sıkıca kapattı." cümlesindeki "ağız" sözcüğü aşağıdakilerin hangisinde aynı anlamda kullanılmıştır?',
  '{"options":["Ağzına bir lokma bile koymadı.","Ağzının tadı kaçmıştı.","Doktor ağzını açmasını istedi.","Mağaranın ağzı çalılarla örtülmüştü.","Ağzından çıkan her söze dikkat etti."],"correctIndex":3}'::jsonb,
  'Soru kökündeki "ağız", bir şeyin giriş-çıkış açıklığı anlamındadır. Aynı anlam "mağaranın ağzı" ifadesinde vardır. Diğerlerinde vücut organı ya da konuşma anlamları vardır.',
  '"Ağız" sözcüğü çoğunlukla insan organını çağrıştırdığı için aday organ anlamlı cümleleri seçebilir. Oysa soru kökü bir nesnenin açıklığını anlatır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcükte Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde "perde" sözcüğü terim anlamıyla kullanılmıştır?',
  '{"options":["Pencereye yeni bir perde taktı.","Perdeleri açıp odayı aydınlattı.","Çocuk perdenin arkasına saklandı.","Gözüne perde indi, hiçbir şey göremedi.","Oyun üç perdeden oluşuyordu."],"correctIndex":4}'::jsonb,
  'Tiyatroda oyunun bölümlerine "perde" denir; bu, bir sanat dalına özgü terim anlamıdır. Diğer cümlelerde sözcük pencere perdesi ya da mecaz anlamıyla kullanılmıştır.',
  '"Gözüne perde indi" ifadesi mecaz anlamlı olduğu için aday terimle karıştırabilir. Oysa terim anlamı, bir alana özgü özel bir kavramı bildirir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  2,
  'Ece, Fikret, Gül, Hakan, İlkay adlı 5 kişi bir sırada beklemektedir. İlkay, Fikret''in hemen arkasındadır. Ece, Gül''den öndedir. Hakan, İlkay''dan öndedir. İlkay, Ece''den öndedir.

Buna göre baştan 3. sırada kim vardır?',
  '{"options":["Ece","Fikret","İlkay","Gül","Hakan"],"correctIndex":2}'::jsonb,
  'Verilen koşullar birlikte değerlendirildiğinde tek bir sıralama kalır: Hakan - Fikret - İlkay - Ece - Gül. Baştan 3. sırada İlkay vardır.',
  '"Hemen arkasında" ve "önde" gibi ifadelerin yönü sıklıkla karıştırılır. Yönü ters okuyan aday, komşu sıradaki kişiyi (örneğin Ece) seçebilir; koşulların tamamı birlikte kullanılmalıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  2,
  'Ali, Banu, Cem, Deniz, Elif adlı 5 kişi bir sırada beklemektedir. Ali, Deniz''den öndedir. Ali, Cem''in hemen arkasındadır. Cem en önde değildir. Banu, Elif''ten öndedir. Deniz en arkada değildir.

Buna göre baştan 3. sırada kim vardır?',
  '{"options":["Ali","Banu","Cem","Deniz","Elif"],"correctIndex":0}'::jsonb,
  'Verilen koşullar birlikte değerlendirildiğinde tek bir sıralama kalır: Banu - Cem - Ali - Deniz - Elif. Baştan 3. sırada Ali vardır.',
  '"Hemen arkasında" ve "önde" gibi ifadelerin yönü sıklıkla karıştırılır. Yönü ters okuyan aday, komşu sıradaki kişiyi (örneğin Deniz) seçebilir; koşulların tamamı birlikte kullanılmalıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  'Kaan, Leyla, Mert, Nil, Oya, Pelin adlı 6 kişi bir sırada beklemektedir. Kaan, Leyla''nın hemen arkasındadır. Pelin, Kaan''dan öndedir. Mert, Kaan''ın hemen arkasındadır. Nil, Pelin''den öndedir. Nil en önde değildir.

Buna göre baştan 2. sırada kim vardır?',
  '{"options":["Kaan","Nil","Leyla","Mert","Oya"],"correctIndex":1}'::jsonb,
  'Verilen koşullar birlikte değerlendirildiğinde tek bir sıralama kalır: Oya - Nil - Pelin - Leyla - Kaan - Mert. Baştan 2. sırada Nil vardır.',
  '"Hemen arkasında" ve "önde" gibi ifadelerin yönü sıklıkla karıştırılır. Yönü ters okuyan aday, komşu sıradaki kişiyi (örneğin Pelin) seçebilir; koşulların tamamı birlikte kullanılmalıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  2,
  'Arda, Berk, Ceren, Duru, Emre adlı 5 kişi bir sırada beklemektedir. Emre, Duru''nun hemen arkasındadır. Ceren, Emre''den öndedir. Berk, Emre''nin hemen arkasındadır. Emre, Arda''dan öndedir.

Buna göre baştan 5. sırada kim vardır?',
  '{"options":["Berk","Ceren","Duru","Arda","Emre"],"correctIndex":3}'::jsonb,
  'Verilen koşullar birlikte değerlendirildiğinde tek bir sıralama kalır: Ceren - Duru - Emre - Berk - Arda. Baştan 5. sırada Arda vardır.',
  '"Hemen arkasında" ve "önde" gibi ifadelerin yönü sıklıkla karıştırılır. Yönü ters okuyan aday, komşu sıradaki kişiyi (örneğin Ceren) seçebilir; koşulların tamamı birlikte kullanılmalıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  'Selim, Tuna, Umut, Yasemin, Zeynep adlı 5 kişi bir sırada beklemektedir. Selim 1. sıradadır. Umut 5. sıradadır. Umut, Zeynep''in hemen arkasındadır. Tuna, Yasemin''den öndedir.

Buna göre baştan 2. sırada kim vardır?',
  '{"options":["Tuna","Umut","Yasemin","Zeynep","Selim"],"correctIndex":0}'::jsonb,
  'Verilen koşullar birlikte değerlendirildiğinde tek bir sıralama kalır: Selim - Tuna - Yasemin - Zeynep - Umut. Baştan 2. sırada Tuna vardır.',
  '"Hemen arkasında" ve "önde" gibi ifadelerin yönü sıklıkla karıştırılır. Yönü ters okuyan aday, komşu sıradaki kişiyi (örneğin Yasemin) seçebilir; koşulların tamamı birlikte kullanılmalıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  2,
  'Barış, Dilara, Erkan, Funda, Gökhan adlı 5 kişi bir sırada beklemektedir. Funda, Gökhan''ın hemen arkasındadır. Funda, Erkan''dan öndedir. Dilara 5. sıradadır. Erkan, Barış''tan öndedir.

Buna göre baştan 1. sırada kim vardır?',
  '{"options":["Barış","Erkan","Dilara","Funda","Gökhan"],"correctIndex":4}'::jsonb,
  'Verilen koşullar birlikte değerlendirildiğinde tek bir sıralama kalır: Gökhan - Funda - Erkan - Barış - Dilara. Baştan 1. sırada Gökhan vardır.',
  '"Hemen arkasında" ve "önde" gibi ifadelerin yönü sıklıkla karıştırılır. Yönü ters okuyan aday, komşu sıradaki kişiyi (örneğin Funda) seçebilir; koşulların tamamı birlikte kullanılmalıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  'Hande, İrem, Kerem, Lale, Murat, Naz adlı 6 kişi bir sırada beklemektedir. Murat, Lale''den öndedir. İrem, Hande''nin hemen arkasındadır. Naz, Murat''ın hemen arkasındadır. Kerem 6. sıradadır. İrem, Naz''dan öndedir.

Buna göre baştan 5. sırada kim vardır?',
  '{"options":["Lale","Hande","İrem","Kerem","Murat"],"correctIndex":0}'::jsonb,
  'Verilen koşullar birlikte değerlendirildiğinde tek bir sıralama kalır: Hande - İrem - Murat - Naz - Lale - Kerem. Baştan 5. sırada Lale vardır.',
  '"Hemen arkasında" ve "önde" gibi ifadelerin yönü sıklıkla karıştırılır. Yönü ters okuyan aday, komşu sıradaki kişiyi (örneğin Kerem) seçebilir; koşulların tamamı birlikte kullanılmalıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  2,
  'Ada, Burcu, Cem adlı üç arkadaşın her biri kırmızı, mavi ve yeşil renklerinden yalnızca birini sever ve kedi, köpek ya da kuştan yalnızca birini besler. Üçünün sevdiği renk de beslediği hayvan da birbirinden farklıdır.

Burcu yeşili sevmez. Cem yeşili sevmez. Ada, köpek beslemez. Burcu, kedi beslemez. Kırmızıyı seven kişi kedi besler.

Buna göre Burcu hangi hayvanı besler?',
  '{"options":["kedi","köpek","kuş","Belirlenemez","Hiçbir hayvan beslemez"],"correctIndex":1}'::jsonb,
  'Koşullar birlikte kullanıldığında tek eşleşme kalır: Ada yeşili sever ve kuş besler; Burcu maviyi sever ve köpek besler; Cem kırmızıyı sever ve kedi besler. Burcu köpek besler.',
  '"Seven kişi ... besler/beslemez" biçimindeki koşullar iki özelliği birbirine bağladığı için tek tek kişiye bakıldığında atlanır. Aday yalnızca kişi koşullarına bakarsa birden çok seçenek arasında kalır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  2,
  'Deniz, Ece, Fatih adlı üç arkadaşın her biri kırmızı, mavi ve yeşil renklerinden yalnızca birini sever ve kedi, köpek ya da kuştan yalnızca birini besler. Üçünün sevdiği renk de beslediği hayvan da birbirinden farklıdır.

Fatih maviyi sever. Deniz kırmızıyı sever. Maviyi seven kişi kuş besler. Kırmızıyı seven kişi köpek beslemez.

Buna göre Fatih hangi hayvanı besler?',
  '{"options":["kedi","köpek","Belirlenemez","kuş","Hiçbir hayvan beslemez"],"correctIndex":3}'::jsonb,
  'Koşullar birlikte kullanıldığında tek eşleşme kalır: Deniz kırmızıyı sever ve kedi besler; Ece yeşili sever ve köpek besler; Fatih maviyi sever ve kuş besler. Fatih kuş besler.',
  '"Seven kişi ... besler/beslemez" biçimindeki koşullar iki özelliği birbirine bağladığı için tek tek kişiye bakıldığında atlanır. Aday yalnızca kişi koşullarına bakarsa birden çok seçenek arasında kalır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  'Gizem, Halil, İpek adlı üç arkadaşın her biri kırmızı, mavi ve yeşil renklerinden yalnızca birini sever ve kedi, köpek ya da kuştan yalnızca birini besler. Üçünün sevdiği renk de beslediği hayvan da birbirinden farklıdır.

Yeşili seven kişi köpek beslemez. Gizem, kedi beslemez. İpek yeşili sevmez. Gizem yeşili sevmez. Kırmızıyı seven kişi kedi besler.

Buna göre Halil hangi hayvanı besler?',
  '{"options":["kedi","köpek","Belirlenemez","Hiçbir hayvan beslemez","kuş"],"correctIndex":4}'::jsonb,
  'Koşullar birlikte kullanıldığında tek eşleşme kalır: Gizem maviyi sever ve köpek besler; Halil yeşili sever ve kuş besler; İpek kırmızıyı sever ve kedi besler. Halil kuş besler.',
  '"Seven kişi ... besler/beslemez" biçimindeki koşullar iki özelliği birbirine bağladığı için tek tek kişiye bakıldığında atlanır. Aday yalnızca kişi koşullarına bakarsa birden çok seçenek arasında kalır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  2,
  '"Kar yağarsa okul tatil edilir. Okul tatil edilirse servis çalışmaz." Servis çalışmaktadır.

Buna göre aşağıdakilerden hangisi kesinlikle doğrudur?',
  '{"options":["Okul tatil edilmiştir.","Kar yağmış, ama okul tatil edilmemiştir.","Kar yağmamıştır.","Kar yağmışsa servis de çalışmıştır.","Okul tatil edilmediği hâlde kar yağmıştır."],"correctIndex":2}'::jsonb,
  'Servis çalıştığına göre okul tatil edilmemiştir. Kar yağsaydı okul tatil edilecekti; bu nedenle kar yağmamıştır.',
  '"Servis çalışıyor" bilgisinden doğrudan kar durumuna geçmek zordur; aday zinciri tersten izlemelidir. Kar yağıp okulun tatil edilmemesi, ilk koşulla çelişir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  '"Tüm yöneticiler toplantıya katılır. Toplantıya katılan hiç kimse izinli değildir."

Buna göre aşağıdakilerden hangisi kesinlikle doğrudur?',
  '{"options":["Hiçbir yönetici izinli değildir.","İzinli olmayan herkes yöneticidir.","Toplantıya katılmayan herkes izinlidir.","Bazı yöneticiler izinlidir.","Yönetici olmayan herkes toplantıya katılmaz."],"correctIndex":0}'::jsonb,
  'Her yönetici toplantıya katılır; toplantıya katılan hiç kimse izinli değildir. Bu nedenle hiçbir yönetici izinli olamaz.',
  'İzinli olmayan herkesin yönetici olduğu sanılabilir. Oysa yalnızca yöneticilerin izinli olmadığı bilinir; yönetici olmayanların durumu hakkında bilgi verilmemiştir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  'Toplantıya Ali ile Berk''ten en az biri gelecek, ancak ikisi birlikte gelmeyecektir. Berk gelirse Can da gelecektir. Can gelmeyecektir.

Buna göre aşağıdakilerden hangisi kesinlikle doğrudur?',
  '{"options":["Berk gelecektir.","Ali gelecektir.","Ali ile Berk birlikte gelecektir.","Ali gelmeyecektir.","Can, Ali geldiği için gelmeyecektir."],"correctIndex":1}'::jsonb,
  'Can gelmeyeceğine göre Berk gelemez (Berk gelirse Can da gelirdi). Ali ile Berk''ten en az biri geleceğine göre Ali gelecektir.',
  'İki kişiden "en az biri" ifadesi, Berk''in de gelebileceğini düşündürür. Ancak Berk''in gelmesi Can''ı gerektirdiği için Berk elenir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  '"Hiçbir kuş sürüngen değildir. Bazı sürüngenler zehirlidir."

Buna göre aşağıdakilerden hangisi kesinlikle doğrudur?',
  '{"options":["Bazı kuşlar zehirlidir.","Zehirli olan her hayvan sürüngendir.","Hiçbir zehirli hayvan kuş değildir.","Zehirli olan bazı hayvanlar kuş değildir.","Her sürüngen zehirlidir."],"correctIndex":3}'::jsonb,
  'Zehirli olan bazı sürüngenler vardır ve hiçbir sürüngen kuş değildir. Bu nedenle zehirli olan bazı hayvanlar kuş değildir.',
  '"Zehirli" özelliğini taşıyan başka hayvanlar da olabileceği için aday, zehirli her hayvanın sürüngen olduğunu sanabilir. Oysa yalnızca bazı sürüngenlerin zehirli olduğu bilinir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  2,
  '"Bütün öğrenciler çalışkandır." önermesinin olumsuzu aşağıdakilerden hangisidir?',
  '{"options":["Hiçbir öğrenci çalışkan değildir.","Bütün öğrenciler çalışkan değildir.","Çalışkan olan bazı öğrenciler vardır.","Bazı çalışkanlar öğrenci değildir.","Çalışkan olmayan en az bir öğrenci vardır."],"correctIndex":4}'::jsonb,
  '"Hepsi ...dır" önermesinin olumsuzu, en az bir istisnanın bulunduğunu söyleyen "çalışkan olmayan en az bir öğrenci vardır" önermesidir.',
  '"Hiçbir öğrenci çalışkan değildir" sözü olumsuza en yakın gibi görünür; oysa bu, önermeye zıt değil uç bir karşıt yargıdır. Olumsuzlama için tek bir örnek yeterlidir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  2,
  '"Bir sayı 6''ya tam bölünüyorsa 3''e de tam bölünür." Bir sayı 3''e tam bölünmemektedir.

Buna göre aşağıdakilerden hangisi kesinlikle doğrudur?',
  '{"options":["Sayı 2''ye tam bölünmez.","Sayı 9''a tam bölünür.","Sayı 6''ya tam bölünmez.","Sayı 6''ya tam bölünür.","Sayı tek sayıdır."],"correctIndex":2}'::jsonb,
  '6''ya bölünen her sayı 3''e bölünür. Sayı 3''e bölünmediğine göre 6''ya da bölünemez.',
  'Sayının tek ya da çift olduğu hakkında bilgi yoktur. Aday 3''e bölünmeme bilgisini 2''ye bölünme durumuyla karıştırabilir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  'Ali, Berk ve Cem''in söyledikleri aşağıda verilmiştir. Her biri ya her zaman doğru ya da her zaman yalan söylemektedir.

Ali: "Berk yalan söylüyor."
Berk: "Cem yalan söylüyor."
Cem: "Ali ile Berk yalan söylüyor."

Buna göre doğru söyleyen kimdir?',
  '{"options":["Berk","Ali","Cem","Ali ile Cem","Hiçbiri"],"correctIndex":0}'::jsonb,
  'Ali doğru söylüyorsa Berk yalancıdır; Berk''in "Cem yalan söylüyor" sözü yalan olduğundan Cem doğrucudur. Ancak Cem "Ali yalan söylüyor" dediği için Ali ile çelişir. Ali yalancıysa Berk doğru söyler, Cem yalancı olur ve Cem''in sözü de yalan çıkar; bu durum tutarlıdır. Doğru söyleyen Berk''tir.',
  'Üç kişinin sözleri birbirine bağlı olduğu için aday rastgele bir kişiyi doğru sayıp devam edebilir. Doğru yol, her seçeneği deneyip çelişkiyi bulmaktır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  'Üç kutudan birinde ödül vardır. Kutuların üzerindeki yazılar şöyledir:

1. kutu: "Ödül bu kutudadır."
2. kutu: "Ödül bu kutuda değildir."
3. kutu: "Ödül 1. kutuda değildir."

Yazılardan yalnızca biri doğru olduğuna göre ödül hangi kutudadır?',
  '{"options":["1. kutuda","2. kutuda","3. kutuda","Belirlenemez","Hiçbir kutuda"],"correctIndex":1}'::jsonb,
  'Ödül 1. kutudaysa 1. ve 2. yazı doğru olur (iki doğru). Ödül 3. kutudaysa 2. ve 3. yazı doğru olur (iki doğru). Ödül 2. kutudaysa yalnızca 3. yazı doğrudur; koşul sağlanır.',
  '"Belirlenemez" şıkkı, üç yazının birbirine bağlı olduğu bu tür sorularda çekici görünür. Oysa her seçeneği doğru yazı sayısıyla sınadığınızda tek çözüm bulunur.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  'Dört kişi aşağıdaki gibi konuşmaktadır:

Ayşe: "Aramızda tam 1 kişi yalan söylüyor."
Burak: "Aramızda tam 2 kişi yalan söylüyor."
Can: "Aramızda tam 3 kişi yalan söylüyor."
Defne: "Aramızda tam 4 kişi yalan söylüyor."

Buna göre doğru söyleyen kimdir?',
  '{"options":["Ayşe","Burak","Defne","Can","Hiçbiri"],"correctIndex":3}'::jsonb,
  'Sözler birbirini dışladığı için en fazla biri doğru olabilir. Yalnızca biri doğruysa üç kişi yalan söylüyordur; bu durumda "tam 3 kişi" diyen Can doğrudur.',
  '"Hiçbiri doğru söylemiyor" ihtimali, dört yalanın hepsinin tutarlı olabileceği izlenimi verir. Oysa hepsi yalansa tam dört yalancı vardır ve Defne doğru söylemiş olur; bu bir çelişkidir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  'Bir camı Ayşe, Berk, Ceren ya da Deniz''den biri kırmıştır. Dördünün söyledikleri şöyledir:

Ayşe: "Camı ben kırmadım."
Berk: "Camı Ceren kırdı."
Ceren: "Camı Deniz kırdı."
Deniz: "Camı ben kırmadım."

Dört kişiden yalnızca biri doğru söylediğine göre camı kim kırmıştır?',
  '{"options":["Berk","Ceren","Deniz","Belirlenemez","Ayşe"],"correctIndex":4}'::jsonb,
  'Camı Ayşe kırdıysa yalnızca Deniz doğru söyler (üç yalan, bir doğru). Camı Berk ya da Deniz kırdıysa iki kişi, Ceren kırdıysa üç kişi doğru söyler; yalnızca biri doğru söylediğine göre cam kıran Ayşe''dir.',
  'Ayşe ile Deniz aynı sözü söylediği için sözlerin birbirini desteklediği sanılır. Oysa tek doğru söyleyenin Deniz olması, camı Ayşe''nin kırdığı durumda gerçekleşir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  'Bir okulda her futbolcu öğrencidir. Bazı müzisyenler öğrencidir. Hiçbir müzisyen futbolcu değildir.

Buna göre aşağıdakilerden hangisi kesinlikle doğrudur?',
  '{"options":["Bazı futbolcular müzisyendir.","Her öğrenci müzisyendir.","Bazı öğrenciler futbolcu değildir.","Her müzisyen öğrencidir.","Hiçbir öğrenci müzisyen değildir."],"correctIndex":2}'::jsonb,
  'Öğrenci olan bazı müzisyenler vardır ve hiçbir müzisyen futbolcu değildir. Bu nedenle öğrenci olup futbolcu olmayanlar vardır.',
  '"Her futbolcu öğrencidir" bilgisi, her öğrencinin futbolcu olduğu şeklinde tersine çevrilebilir. Oysa bu mantıksal bir hatadır; öğrencilerin hepsi futbolcu değildir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  '"Bazı mühendisler yazardır. Hiçbir yazar sporcu değildir."

Buna göre aşağıdakilerden hangisi kesinlikle yanlıştır?',
  '{"options":["Bazı mühendisler sporcudur.","Hem sporcu hem yazar olan bazı mühendisler vardır.","Bazı yazarlar mühendis değildir.","Bazı sporcular mühendistir.","Bazı mühendisler sporcu değildir."],"correctIndex":1}'::jsonb,
  'Hiçbir yazar sporcu olmadığına göre hem yazar hem sporcu olan kimse yoktur; bu nedenle ilk yargı kesinlikle yanlıştır. Diğerleri doğru ya da olasıdır.',
  '"Bazı mühendisler sporcudur" yargısı da aday için yanlış gibi görünebilir. Oysa mühendisler yazar olmayan sporcular da olabilir; bu yargı olasıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  1,
  '"Hiçbir doktor sigara içmez." Selin sigara içmektedir.

Buna göre aşağıdakilerden hangisi kesinlikle doğrudur?',
  '{"options":["Selin hemşiredir.","Sigara içen herkes doktordur.","Selin sigarayı bırakırsa doktor olur.","Selin doktor değildir.","Doktor olmayan herkes sigara içer."],"correctIndex":3}'::jsonb,
  'Hiçbir doktor sigara içmediğine göre sigara içen Selin doktor olamaz.',
  'Selin''in mesleği hakkında başka bir bilgi verilmediği için "hemşire" gibi bir meslek çıkarımı yapılamaz.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  2,
  'Bir ayın 3''ü Salı olduğuna ve bu ay 30 gün çektiğine göre ayın son günü hangi gündür?',
  '{"options":["Pazartesi","Salı","Pazar","Cumartesi","Perşembe"],"correctIndex":0}'::jsonb,
  '3, 10, 17 ve 24 Salı''dır. 24''ten 30''a 6 gün vardır; Salı''dan 6 gün sonrası Pazartesi''dir.',
  'Ay sonu için 31''i baz almak ya da haftanın günlerini ardışık saymak hata yaptırır. 24 Salı ise 30 Pazartesi olur.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  2,
  'Naz, Oğuz, Pelin, Rıza, Sevgi adlı 5 kişi bir sırada beklemektedir. Oğuz, Naz''dan öndedir. Sevgi, Rıza''dan öndedir. Naz, Sevgi''nin hemen arkasındadır. Rıza en arkada değildir.

Buna göre baştan 1. sırada kim vardır?',
  '{"options":["Oğuz","Naz","Pelin","Rıza","Sevgi"],"correctIndex":0}'::jsonb,
  'Verilen koşullar birlikte değerlendirildiğinde tek bir sıralama kalır: Oğuz - Sevgi - Naz - Rıza - Pelin. Baştan 1. sırada Oğuz vardır.',
  '"Hemen arkasında" ve "önde" gibi ifadelerin yönü sıklıkla karıştırılır. Yönü ters okuyan aday, komşu sıradaki kişiyi (örneğin Sevgi) seçebilir; koşulların tamamı birlikte kullanılmalıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  2,
  'Tolga, Ufuk, Vildan, Yaren, Zeki adlı 5 kişi bir sırada beklemektedir. Ufuk, Vildan''ın hemen arkasındadır. Zeki en arkada değildir. Yaren 1. sıradadır. Vildan, Tolga''nın hemen arkasındadır.

Buna göre baştan 3. sırada kim vardır?',
  '{"options":["Tolga","Ufuk","Vildan","Yaren","Zeki"],"correctIndex":0}'::jsonb,
  'Verilen koşullar birlikte değerlendirildiğinde tek bir sıralama kalır: Yaren - Zeki - Tolga - Vildan - Ufuk. Baştan 3. sırada Tolga vardır.',
  '"Hemen arkasında" ve "önde" gibi ifadelerin yönü sıklıkla karıştırılır. Yönü ters okuyan aday, komşu sıradaki kişiyi (örneğin Vildan) seçebilir; koşulların tamamı birlikte kullanılmalıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  2,
  'Ahmet, Belgin, Caner, Demet, Emin, Funda adlı 6 kişi bir sırada beklemektedir. Funda, Caner''den öndedir. Emin en arkada değildir. Emin, Belgin''in hemen arkasındadır. Caner, Belgin''den öndedir. Caner, Ahmet''in hemen arkasındadır.

Buna göre baştan 3. sırada kim vardır?',
  '{"options":["Caner","Ahmet","Belgin","Demet","Emin"],"correctIndex":0}'::jsonb,
  'Verilen koşullar birlikte değerlendirildiğinde tek bir sıralama kalır: Funda - Ahmet - Caner - Belgin - Emin - Demet. Baştan 3. sırada Caner vardır.',
  '"Hemen arkasında" ve "önde" gibi ifadelerin yönü sıklıkla karıştırılır. Yönü ters okuyan aday, komşu sıradaki kişiyi (örneğin Belgin) seçebilir; koşulların tamamı birlikte kullanılmalıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  2,
  'Gamze, Hasan, Işık, Jülide, Kadir, Lütfi adlı 6 kişi bir sırada beklemektedir. Jülide, Lütfi''nin hemen arkasındadır. Işık en arkada değildir. Jülide, Kadir''den öndedir. Kadir, Işık''tan öndedir. Hasan 1. sıradadır.

Buna göre baştan 3. sırada kim vardır?',
  '{"options":["Jülide","Gamze","Hasan","Işık","Kadir"],"correctIndex":0}'::jsonb,
  'Verilen koşullar birlikte değerlendirildiğinde tek bir sıralama kalır: Hasan - Lütfi - Jülide - Kadir - Işık - Gamze. Baştan 3. sırada Jülide vardır.',
  '"Hemen arkasında" ve "önde" gibi ifadelerin yönü sıklıkla karıştırılır. Yönü ters okuyan aday, komşu sıradaki kişiyi (örneğin Kadir) seçebilir; koşulların tamamı birlikte kullanılmalıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  2,
  'Mehmet, Nalan, Okan, Pınar, Rabia adlı 5 kişi bir sırada beklemektedir. Rabia, Mehmet''ten öndedir. Rabia, Okan''ın hemen arkasındadır. Nalan 1. sıradadır. Pınar, Rabia''nın hemen arkasındadır.

Buna göre baştan 4. sırada kim vardır?',
  '{"options":["Pınar","Mehmet","Nalan","Okan","Rabia"],"correctIndex":0}'::jsonb,
  'Verilen koşullar birlikte değerlendirildiğinde tek bir sıralama kalır: Nalan - Okan - Rabia - Pınar - Mehmet. Baştan 4. sırada Pınar vardır.',
  '"Hemen arkasında" ve "önde" gibi ifadelerin yönü sıklıkla karıştırılır. Yönü ters okuyan aday, komşu sıradaki kişiyi (örneğin Mehmet) seçebilir; koşulların tamamı birlikte kullanılmalıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  '"Proje onaylanırsa bütçe artırılır. Bütçe artırılırsa yeni personel alınır." Yeni personel alınmamıştır.

Buna göre aşağıdakilerden hangisi kesinlikle doğrudur?',
  '{"options":["Proje onaylanmamıştır.","Bütçe artırılmıştır.","Proje onaylanmış, bütçe de artırılmıştır.","Proje onaylanmış ama bütçe artırılmamıştır.","Bütçe artırılmış ama yeni personel alınmamıştır."],"correctIndex":0}'::jsonb,
  'Yeni personel alınmadığına göre bütçe artırılmamıştır. Proje onaylansaydı bütçe artırılacaktı; bu nedenle proje onaylanmamıştır.',
  'Zincirin ilk halkası olan proje bilgisi doğrudan verilmediği için aday, projenin onaylanıp onaylanmadığını yanlış çıkarabilir. Zincir, son halkadan başa doğru izlenmelidir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  'Mert, sinemaya ya da tiyatroya gidecektir; ancak ikisine birden gitmeyecektir. Mert tiyatroya giderse Selin de tiyatroya gidecektir. Selin tiyatroya gitmeyecektir.

Buna göre aşağıdakilerden hangisi kesinlikle doğrudur?',
  '{"options":["Mert sinemaya gidecektir.","Mert tiyatroya gidecektir.","Mert hem sinemaya hem tiyatroya gidecektir.","Mert hiçbir yere gitmeyecektir.","Selin sinemaya gidecektir."],"correctIndex":0}'::jsonb,
  'Selin tiyatroya gitmediğine göre Mert de tiyatroya gitmez (gitseydi Selin de giderdi). Mert''in sinemaya ya da tiyatroya gideceği bilindiğine göre sinemaya gidecektir.',
  '"Selin gitmeyecek" bilgisi Mert''in hiçbir yere gitmeyeceği izlenimi verebilir. Oysa Mert''in iki seçenekten birine gideceği baştan verilmiştir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  'Bir camı Ali, Berk ya da Cem''den biri kırmıştır. Üçünün söyledikleri şöyledir:

Ali: "Camı ben kırmadım."
Berk: "Camı Ali kırdı."
Cem: "Berk yalan söylüyor."

Üçünden yalnızca biri doğru söylediğine göre camı kim kırmıştır?',
  '{"options":["Ali","Berk","Cem","Berk ile Cem","Belirlenemez"],"correctIndex":0}'::jsonb,
  'Camı Ali kırdıysa yalnızca Berk doğru söyler (Ali yalan söyler, Cem''in "Berk yalan söylüyor" sözü de yalan olur): tek doğru vardır. Camı Berk ya da Cem kırdıysa iki kişi doğru söyler. Bu nedenle camı Ali kırmıştır.',
  'Cem''in sözü Berk''e bağlı olduğu için aday zinciri yanlış kurabilir. Her olasılık için doğru söyleyenlerin sayısını sayarak tek çözüm bulunur.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  2,
  '"Bütün kuşlar hayvandır. Bazı hayvanlar uçar. Hiçbir balık kuş değildir."

Buna göre aşağıdakilerden hangisi kesinlikle doğrudur?',
  '{"options":["Hiçbir kuş balık değildir.","Bazı hayvanlar balıktır.","Her hayvan kuştur.","Bazı kuşlar uçmaz.","Uçan her hayvan kuştur."],"correctIndex":0}'::jsonb,
  '"Hiçbir balık kuş değildir" önermesinin tersi de doğrudur: hiçbir kuş balık değildir. Diğer yargılar önermelerden çıkarılamaz.',
  '"Bazı hayvanlar uçar" bilgisi uçan hayvanların kuş olduğu izlenimini verebilir. Oysa uçan hayvanların hangi gruba ait olduğu bilinmez.',
  array['lisans_gygk']::text[],
  'lisans'
),
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
