-- ==========================================================================
-- KADRO SORU HAVUZU · KPSS GY Türkçe · CÜMLEDE ANLAM PARTİSİ 1 (30 soru, zorluk 2-3) · SUPABASE SQL
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
  'Aşağıdaki cümlelerin hangisinde neden-sonuç ilişkisi yoktur?',
  '{"options":["Yağmur yağdığından toplantı ertelendi.","Işıklar söndüğü için salon karanlığa gömüldü.","Aşırı yorgun olduğundan erkenden uyudu.","Okulun bahçesinde hem ağaçlar hem de çiçekler vardı.","Yolların buzlanması yüzünden seferler iptal edildi."],"correctIndex":3}'::jsonb,
  'Doğru şık iki varlığın birlikte bulunduğunu söyler; neden ya da sonuç bildirmez. Diğer cümlelerde eylemin nedeni belirtilmiştir.',
  'Bu cümle sıradan bir betimleme olduğu için aday neden-sonuç aramayabilir; ancak diğer cümleler "-dığından, için, yüzünden" gibi neden bildiren ifadeler taşır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde koşul (şart) anlamı vardır?',
  '{"options":["Belgelerini tamamladıktan sonra başvuruyu yaptı.","Başvuru yaparken belgelerini yanında getirdi.","Belgeleri eksik olduğu için başvuru kabul edilmedi.","Belgelerini hazırlamak için sabaha kadar çalıştı.","Gerekli belgeleri tamamlamazsan başvurun işleme alınmaz."],"correctIndex":4}'::jsonb,
  'Doğru şıkta başvurunun işleme alınması, belgelerin tamamlanmasına bağlıdır; bu bir koşuldur. Diğer cümlelerde zaman, birliktelik, neden ve amaç vardır.',
  '"Belgeleri eksik olduğu için başvuru kabul edilmedi" cümlesi sonuç içerdiği için koşul sanılabilir. Oysa orada eylem gerçekleşmiş ve nedeni belirtilmiştir.',
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
  'Aşağıdaki cümlelerden hangisi diğerlerinden anlamca farklıdır?',
  '{"options":["Sınavı kazanmasına rağmen üzüldü.","Sınavı kazanamadığı için üzüldü.","Üzüntüsü, sınavı kazanamamasından kaynaklanıyordu.","Sınavı kazanamayınca üzüldü.","Sınavı kazanamayışı onu üzdü."],"correctIndex":0}'::jsonb,
  'Diğer cümlelerde üzüntünün nedeni sınavı kazanamamaktır. İlk cümlede ise sınavı kazanmış olmasına rağmen üzüldüğü belirtilir; anlam farklıdır.',
  'Bütün cümlelerde sınav ve üzüntü sözcükleri geçtiği için aday farkı fark etmeyebilir. Anlamı belirleyen, kazanıp kazanmadığı bilgisidir.',
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
);
