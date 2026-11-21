-- ==========================================================================
-- KADRO SORU HAVUZU · KPSS GY Türkçe · GEMİNİ PARTİ 6 (30 soru: 1 Ses Bilgisi, 6 Sözcükte Yapı, 9 Sözcük Türleri, 7 Cümlenin Ögeleri, 7 Sözel Mantık) · SUPABASE SQL
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
);
