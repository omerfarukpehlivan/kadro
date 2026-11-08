-- ==========================================================================
-- KADRO COĞRAFYA EK TESTLER — TEST 5 & TEST 6 (120 YENİ SORU)
-- 6 Konu x 20 Soru (Her Konu İçin Test 5 ve Test 6)
-- Toplam Coğrafya Soru Havuzu: 240 + 120 = 360 Soru
-- ÖSYM Çeldirici Tuzağı (UWorld Modeli)
-- ==========================================================================
BEGIN;

-- Soru #001 (Türkiye'nin Coğrafi Konumu)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  '21 Mart tarihinde Türkiye''de yer alan iki farklı merkezde Güneş aynı anda doğmuş ve aynı anda batmıştır.

Bu iki merkezin kesinlikle aynı olduğu özellik aşağıdakilerden hangisidir?',
  '{"options": ["Enlem dereceleri", "Boylam dereceleri", "Deniz seviyesinden yükseltileri", "Başlangıç Meridyeni''ne olan kuş uçuşu uzaklıkları", "Yıllık ortalama sıcaklık değerleri"], "correctIndex": 1}'::jsonb,
  '21 Mart ve 23 Eylül ekinoks tarihlerinde Dünya genelinde 12 saat gündüz, 12 saat gece yaşanır. Güneş sadece aynı boylam üzerindeki noktalarda aynı anda doğar ve tam 12 saat sonra aynı anda batar. Bu nedenle bu iki merkezin boylamları kesinlikle aynıdır.',
  'Adayların en büyük çeldiricisi enlemdir. Normal günlerde aynı boylamda güneş aynı anda doğmaz (aydınlanma çemberi eğik geçer). Ancak ekinokslarda aydınlanma çemberi kutup noktalarından geçtiği için aynı boylamdaki tüm noktalarda güneş aynı anda doğar ve batar.'
);

-- Soru #002 (Türkiye'nin Coğrafi Konumu)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  'Türkiye''nin ''Orta Kuşak''ta (30°-60° enlemleri arasında) yer alması, ülkede çeşitli iklimsel ve fiziksel sonuçlar doğurmuştur.

Aşağıdakilerden hangisi Türkiye''nin yalnızca Orta Kuşak''ta yer almasıyla açıklanamaz, özel konumun da devreye girdiğini gösterir?',
  '{"options": ["Akdeniz iklim kuşağında yer alması", "Batı rüzgarlarının etki alanında bulunması", "Yıl içinde dört mevsimin belirgin olarak yaşanması", "Aynı anda farklı yörelerde farklı mevsim özelliklerinin hissedilmesi", "Kış aylarında cephesel (frontral) kökenli yağışların egemen olması"], "correctIndex": 3}'::jsonb,
  'Orta Kuşak''ta bulunmanın 4 temel göstergesi (A-B-C-D kuralı): Akdeniz iklimi, Batı rüzgarları, Cephesel yağışlar ve Dört mevsimin belirgin yaşanmasıdır. Fakat ''aynı anda'' Antalya''da denize girilirken Erzurum''da kayak yapılabilmesi yükselti ve yer şekilleri çeşitliliği ile ilgili olup kesinlikle ÖZEL KONUMUN bir sonucudur.',
  'ÖSYM ''yıl içinde dört mevsimin belirgin olması'' (matematiksel konum) ile ''aynı gün/anda farklı mevsim koşullarının yaşanması'' (özel konum) ifadelerini birbirine çeldirici olarak sürekli kullanır.'
);

-- Soru #003 (Türkiye'nin Coğrafi Konumu)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  'Aynı enlem üzerinde bulunan Çanakkale, Bursa, Ankara, Sivas ve Erzurum illeri karşılaştırıldığında, batıdan doğuya doğru gidildikçe aşağıdakilerden hangisinin değişmesi beklenmez?',
  '{"options": ["Güneş''in ufukta ulaştığı maksimum yükselti açısı", "Karasallık derecesi ve yıllık sıcaklık farkı", "Tarım ürünlerinin olgunlaşma süresi", "Karların yerde kalma süresi", "Güneş''in doğuş ve batış yerel saati"], "correctIndex": 0}'::jsonb,
  'Aynı enlem üzerindeki tüm merkezlerde; Ekvator''a ve kutuplara uzaklık, çizgisel hız, yerçekimi, gece-gündüz süreleri ve Güneş ışınlarının geliş açısı YIL BOYUNCA BİREBİR AYNIDIR. Batıdan doğuya yükselti arttığı için sıcaklık, don günleri ve tarım süreleri değişirken Güneş ışınlarının geliş açısı değişmez.',
  'Adaylar Erzurum''un daha soğuk olmasından dolayı Güneş ışınlarını daha eğik açıyla aldığını varsayar. Oysa Güneş ışınlarının düşme açısı yükseltiye değil, sadece enleme ve mevsime bağlıdır.'
);

-- Soru #004 (Türkiye'nin Coğrafi Konumu)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  'Dünya''nın geoit şekline bağlı olarak Ekvator''dan kutuplara doğru gidildikçe yerçekimi artarken çizgisel hız azalır.

Buna göre Türkiye sınırları içerisinde yerçekiminin en fazla, çizgisel dönüş hızının ise en az olduğu merkez aşağıdakilerden hangisidir?',
  '{"options": ["Hatay — Yayladağı", "Sinop — İnceburun", "Iğdır — Dilucu", "Çanakkale — Avlaka Burnu", "Muğla — Datça"], "correctIndex": 1}'::jsonb,
  'Türkiye''nin en kuzey noktası Sinop İnceburun''dur (42° K). Kutuplara en yakın nokta olduğu için Dünya''nın merkezine daha yakındır ve yerçekimi en fazladır; aynı zamanda dönme eksenine yarıçapı daraldığı için çizgisel dönüş hızı en azdır.',
  'Adaylar yerçekimini çoğu zaman dağların yükseltisiyle (Erzurum/Ağrı) karıştırırlar. Coğrafyada yerçekiminin temel belirleyicisi enlem (Dünya''nın kutuplardan basık olması) derecesidir.'
);

-- Soru #005 (Türkiye'nin Coğrafi Konumu)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  'Türkiye''de yıl boyunca tek ulusal saat olarak 45° Doğu Meridyeni''nin (Iğdır) yerel saati kullanılmaktadır (+3 GMT).

Bu uygulamanın doğal bir sonucu olarak, kış mevsiminde aşağıdaki şehirlerin hangisinde yerel saat ile ulusal saat arasındaki fark en fazla olur ve sabah mesaiye başlarken havanın en karanlık olduğu hissedilir?',
  '{"options": ["Trabzon", "Gaziantep", "Sivas", "Edirne", "Van"], "correctIndex": 3}'::jsonb,
  'Ulusal saat 45° Doğu meridyenine göre ayarlandığında, 45° Doğu''dan en uzakta olan en batıdaki illerimizde yerel saat farkı en yüksek olur. Edirne (yaklaşık 26°30'' Doğu) ile Iğdır arasında yaklaşık 74 dakikalık zaman farkı oluşur ve kışın güneş çok geç doğduğu için karanlıkta güne başlanır.',
  'Adaylar ''yerel saat farkı en çok nerede hissedilir'' sorusunda Iğdır veya Van''ı işaretleme hatasına düşebilirler. Iğdır''da yerel saat zaten ulusal saatin ta kendisidir (fark sıfırdır).'
);

-- Soru #006 (Türkiye'nin Coğrafi Konumu)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  'Türkiye''nin sahip olduğu jeopolitik güç unsurlarından biri de İstanbul ve Çanakkale boğazlarıdır. 1936 Montrö Boğazlar Sözleşmesi ile Boğazlar Komisyonu kaldırılarak tam egemenlik Türkiye''ye geçmiştir.

Boğazların jeopolitik önemini artıran temel coğrafi gerekçe aşağıdakilerden hangisidir?',
  '{"options": ["Karadeniz''e kıyısı olan ülkelerin açık denizlere ve dünya ticaretine tek çıkış kapısı olması", "Ege Denizi''ndeki kıta sahanlığı sorunlarını tamamen çözüme kavuşturması", "Boğazlar çevresinin Türkiye''nin en az nüfuslanmış alanı olması", "Akdeniz ile Kızıldeniz arasındaki Süveyş Kanalı bağlantısını doğrudan sağlaması", "Boğaz tabanında derin deniz petrol sondajlarının yoğun şekilde yapılması"], "correctIndex": 0}'::jsonb,
  'İstanbul ve Çanakkale boğazları, Karadeniz Havzası''ndaki ülkelerin (Rusya, Ukrayna, Romanya, Bulgaristan, Gürcistan) Akdeniz ve Cebelitarık/Süveyş üzerinden dünya okyanuslarına çıkabileceği tek doğal su yoludur. Bu durum Türkiye''ye stratejik bir kilit rol yükler.',
  'Adaylar Süveyş Kanalı ile Boğazlar arasında doğrudan coğrafi bir bağlantı kurabilirler; oysa Süveyş Akdeniz-Kızıldeniz arasındadır, Boğazlar ise Karadeniz-Marmara-Ege bağlantısını sağlar.'
);

-- Soru #007 (Türkiye'nin Coğrafi Konumu)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  'Kuzey Yarım Küre''de yer alan Türkiye''de dağların güney yamaçları bakı etkisi nedeniyle kuzey yamaçlara göre daha fazla ısınır, karlar daha erken erir ve yerleşmeler güney yamaçta yoğunlaşır.

Aşağıdaki durumlardan hangisi Türkiye''de bakı kuralına ters düşen bir istisnadır?',
  '{"options": ["Toros Dağları''nın Akdeniz''e bakan güney yamaçlarında tarım ürünlerinin erken olgunlaşması", "İç Anadolu''da konutların kapı ve pencerelerinin çoğunlukla güneye bakacak şekilde inşa edilmesi", "Kuzey Anadolu Dağları''nın Karadeniz''e bakan kuzey yamaçlarında kış sıcaklıklarının güney yamaçtan daha yüksek olması", "Güneydoğu Toroslar''ın güneyinde meraların daha erken yeşermesi", "Uludağ''ın güney yamacında orman üst sınırının kuzey yamaca göre daha yüksekte bulunması"], "correctIndex": 2}'::jsonb,
  'Karadeniz Dağları''nda güney yamaç bakı yönüdür ancak denizellik etkisi kuzey yamaçtadır. Kışın deniz geç soğuduğu ve nemli hava kütleleri kuzey yamaçta ılımanlaştırıcı etki yaptığı için, kuzey yamaçlar iç kısımdaki karasal ve donlu güney yamaçlardan daha ılıktır. Bu durum denizelliğin bakıyı alt ettiği klasik ÖSYM istisnasıdır.',
  'ÖSYM dağ yamaçları sorularında ''denizellik ile bakının çatıştığı'' Karadeniz kıyı kuşağını çeldirici olarak mutlaka sorar.'
);

-- Soru #008 (Türkiye'nin Coğrafi Konumu)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  'Türkiye''nin komşularıyla olan sınır kapıları ve bu kapılardaki ulaşım altyapısı KPSS''de sıkça sorgulanmaktadır.

Aşağıdaki sınır kapılarından hangisi Türkiye ile komşu ülke arasında hem karayolu hem de aktif demiryolu bağlantısına sahiptir?',
  '{"options": ["Sarp Sınır Kapısı (Gürcistan)", "Gürbulak Sınır Kapısı (İran)", "Kapıkule Sınır Kapısı (Bulgaristan)", "Habur Sınır Kapısı (Irak)", "İpsala Sınır Kapısı (Yunanistan)"], "correctIndex": 2}'::jsonb,
  'Edirne''de bulunan Kapıkule Sınır Kapısı (Bulgaristan), Avrupa''ya açılan en işlek sınır kapımız olup hem karayolu hem de demiryolu hattına sahiptir. Sarp, İpsala ve Habur sınır kapılarında demiryolu bağlantısı bulunmaz.',
  'Adaylar İpsala (Yunanistan) sınır kapısını demiryolu zanneder; Yunanistan ile demiryolu kapımız ''Uzunköprü''dür. İran ile demiryolu kapımız ise Gürbulak değil ''Kapıköy''dür.'
);

-- Soru #009 (Türkiye'nin Coğrafi Konumu)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  '21 Haziran tarihinde Türkiye sınırları içinde bir araştırma gezisine çıkan coğrafyacı, gittiği merkezde gündüz süresinin hareket ettiği yere göre daha uzun olduğunu ve yerel saatin de daha ileri olduğunu gözlemlemiştir.

Bu araştırmacı hangi yöne doğru hareket etmiştir?',
  '{"options": ["Güneybatı", "Güneydoğu", "Kuzeydoğu", "Kuzeybatı", "Güney"], "correctIndex": 2}'::jsonb,
  '21 Haziran''da Kuzey Yarım Küre''de kuzeye gidildikçe gündüz süresi uzar (Sinop''ta en uzun). Yerel saatin daha ileri olması için ise doğuya gidilmesi gerekir. Dolayısıyla araştırmacı hem kuzeye hem doğuya, yani ''Kuzeydoğu'' yönüne hareket etmiştir.',
  '21 Aralık tarihiyle karıştırma tuzağı: 21 Aralık''ta güneye gidildikçe gündüz uzar; 21 Haziran''da ise tam tersine kuzeye gidildikçe gündüz uzar.'
);

-- Soru #010 (Türkiye'nin Coğrafi Konumu)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  'Türkiye, Hazar Havzası ve Orta Doğu''nun zengin enerji kaynakları ile Avrupa''nın yoğun enerji tüketen pazarları arasında bir ''Enerji Koridoru'' köprüsüdür.

Aşağıdaki boru hatlarından hangisi Azerbaycan doğalgazını Türkiye üzerinden Yunanistan sınırına ve oradan Avrupa''ya taşıyan Güney Gaz Koridoru''nun omurgasını oluşturur?',
  '{"options": ["Mavi Akım", "TürkAkım", "Bakü-Tiflis-Ceyhan (BTC)", "Trans Anadolu Doğal Gaz Boru Hattı (TANAP)", "Kerkük-Yumurtalık"], "correctIndex": 3}'::jsonb,
  'TANAP (Trans Anadolu Doğal Gaz Boru Hattı), Azerbaycan Şah Deniz sahasından çıkarılan doğalgazı Gürcistan üzerinden Türkiye''ye (Eskişehir ve Trakya çıkışları) ve oradan TAP (Trans Adriyatik) hattıyla Avrupa''ya taşıyan dev boru hattıdır. BTC ise doğalgaz değil petrol boru hattıdır.',
  'ÖSYM BTC (petrol) ile TANAP (doğalgaz) ayrımını sıkça sorar. BTC ham petrol taşır, TANAP ise doğalgaz taşır.'
);

-- Soru #011 (Türkiye'nin Coğrafi Konumu)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  'Türkiye''nin kara sınırları ve komşuları ile ilgili aşağıdaki bilgilerden hangisi yanlıştır?',
  '{"options": ["En uzun kara sınırımız Suriye iledir.", "En kısa kara sınırımız Nahçıvan (Azerbaycan) iledir.", "En eski kara sınırımız Kasr-ı Şirin Antlaşması''na dayanan İran sınırıdır.", "Demiryolu bağlantımızın bulunduğu en yeni sınır kapısı Gürcistan ile açılan Aktaş Kapısı''dır.", "Ermenistan sınırında bulunan Alican ve Akyaka sınır kapıları siyasi gerekçelerle fiilen kapalıdır."], "correctIndex": 3}'::jsonb,
  'Gürcistan ile demiryolu bağlantısı Bakü-Tiflis-Kars (BTK) hattı üzerinden ''Canbaz'' sınır kapısından sağlanmaktadır. Aktaş Sınır Kapısı yalnızca karayolu taşımacılığına açıktır.',
  'Adaylar Gürcistan ile yeni açılan Aktaş sınır kapısının demiryolu kapısı olduğunu düşünebilir; demiryolu istasyonu Canbaz İstasyonu''dur.'
);

-- Soru #012 (Türkiye'nin Coğrafi Konumu)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  'Türkiye 36°-42° Kuzey paralelleri arasında yer aldığı için Dönenceler''in (23°27'') kuzeyinde bulunur.

Bu durumun Türkiye''de ortaya çıkardığı kesin sonuç aşağıdakilerden hangisidir?',
  '{"options": ["Cisimlerin gölge boyunun hiçbir zaman sıfır olmaması ve gölgenin daima kuzeye düşmesi", "Yıl boyunca sıcaklıkların sıfırın altına hiç düşmemesi", "Sadece kış aylarında yağış alması", "Yerel saatin daima Greenwich''ten geride olması", "Güneş''in batıdan doğup doğudan batması"], "correctIndex": 0}'::jsonb,
  'Dönenceler dışındaki alanlara güneş ışınları hiçbir zaman 90° dik açıyla düşemez. Bu yüzden Türkiye''de gölge boyu hiçbir tarihte sıfır olamaz ve öğle vaktinde cisimlerin gölgesi daima kuzeye düşer.',
  'Adaylar 21 Haziran''da Türkiye''ye güneşin dik geldiğini sanabilir; güneş sadece dönenceler arasına dik düşer, Türkiye''ye en dik açıyla gelse bile (yaklaşık 77°) gölge asla sıfır olmaz.'
);

-- Soru #013 (Türkiye'nin Coğrafi Konumu)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  'Akdeniz''den Karadeniz''e doğru gidildikçe deniz suyu sıcaklığı ve tuzluluk oranı düzenli olarak azalır (Akdeniz binde 38, Karadeniz binde 18).

Bu durum üzerinde etkili olan temel faktör aşağıdakilerden hangisidir?',
  '{"options": ["Kıyılardaki sanayi tesislerinin yoğunluğu", "Enlem etkisi ve buharlaşma şiddetinin kuzeye doğru azalması", "Karadeniz''deki dalga aşındırmasının daha fazla olması", "Akdeniz''e dökülen akarsu sayısının Karadeniz''den çok daha fazla olması", "Marmara Denizi''nin derin su akıntılarını engellemesi"], "correctIndex": 1}'::jsonb,
  'Ekvator''dan kutuplara doğru gidildikçe enleme bağlı olarak güneş ışınlarının açısı küçülür, sıcaklık ve buharlaşma azalır. Akdeniz çok sıcak ve buharlaşma yüksek olduğu için en tuzlu denizimizdir; Karadeniz ise serin hava ve bol tatlı su girdisi yüzünden az tuzludur.',
  'Adaylar deniz tuzluluğunu akarsu sayısıyla ilişkilendirebilir; oysa Karadeniz''e dökülen dev nehirler (Tuna, Dinyeper, Kızılırmak) tuzu seyreltir ama ana motor güç enlem ve buharlaşmadır.'
);

-- Soru #014 (Türkiye'nin Coğrafi Konumu)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  'Doğu Anadolu Bölgesi''ni Karadeniz limanlarına bağlayan dağlık geçitlerde son yıllarda yapılan modern tüneller transit ticareti ve kış ulaşımını güvenceye almıştır.

Rize''yi Erzurum''a bağlayan ve Türkiye''nin en uzun karayolu çift tüp tünellerinden biri olan tünel aşağıdakilerden hangisidir?',
  '{"options": ["Zigana Tüneli", "Ovit Tüneli", "Ilgaz 15 Temmuz İstiklal Tüneli", "Avrasya Tüneli", "Sabuncubeli Tüneli"], "correctIndex": 1}'::jsonb,
  'Rize (İkizdere) ile Erzurum (İspir) arasındaki Ovit Dağı Geçidi''ni baypas eden ''Ovit Tüneli'' (14.3 km), kış aylarında kar nedeniyle aylarca kapanan yolu kesintisiz ulaşıma açmıştır. Yeni Zigana Tüneli ise Trabzon ile Gümüşhane arasındadır.',
  'ÖSYM Zigana (Trabzon-Gümüşhane) ile Ovit (Rize-Erzurum) tünellerini birbirine alternatif çeldirici olarak kullanır.'
);

-- Soru #015 (Türkiye'nin Coğrafi Konumu)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  'Türkiye''de bazı dar vadilerde ve çukur havzalarda çevresindeki geniş iklim kuşağından farklı, dar alanlı iklim adacıkları (mikroklima) oluşmuştur.

Aşağıdakilerden hangisi Türkiye''de görülen bir mikroklima alanı ve bu alanda yetiştirilen tarım ürünü eşleştirmesi değildir?',
  '{"options": ["Rize kıyıları — Turunçgil (Mandalina)", "Iğdır Ovası — Pamuk", "Artvin / Çoruh Vadisi — Zeytin", "Gazipaşa / Anamur kıyıları — Muz", "Konya Ovası — Şeker pancarı"], "correctIndex": 4}'::jsonb,
  'Konya Ovası''nda şeker pancarı yetiştirilmesi bir mikroklima ürünü değildir; karasal iklim ve sulama ile geniş alanda yapılan tipik bir tarımsal faaliyettir. Rize''de turunçgil, Iğdır''da pamuk, Çoruh Vadisi''nde zeytin ve Anamur''da muz mikroklimanın en belirgin KPSS örnekleridir.',
  'Adaylar şeker pancarını yaygın bir ürün olduğu için mikroklima kavramıyla karıştırmaz ama sorularda diğer 4 klasik mikroklimayı ezbere bilmek şarttır.'
);

-- Soru #016 (Türkiye'nin Coğrafi Konumu)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  '21 Aralık tarihinde Türkiye''de en uzun gece Sinop''ta yaşanırken, en uzun gündüz ise Hatay''da yaşanır.

Bu durumun ortaya çıkmasındaki temel etken aşağıdakilerden hangisidir?',
  '{"options": ["Eksen eğikliği ve Dünya''nın Güneş etrafındaki yıllık hareketi", "Dünya''nın kendi ekseni etrafında batıdan doğuya dönmesi", "Türkiye''nin Asya ile Avrupa arasında yer alması", "Türkiye''nin ortalama yükseltisinin batıdan doğuya artması", "Karasallık ve denizellik farkları"], "correctIndex": 0}'::jsonb,
  '21 Aralık''ta Güneş ışınları Oğlak Dönencesi''ne dik gelir. Güney Yarım Küre''de yaz, Kuzey Yarım Küre''de kış başlar. Kuzeye gidildikçe geceler uzar (Sinop''ta en uzun gece), güneye gidildikçe gündüzler uzar. Gece-gündüz sürelerinin yıl içinde değişmesi Eksen Eğikliği ve Yıllık Hareket''in sonucudur.',
  'Günlük hareket (kendi ekseni etrafında dönme) gece ile gündüzün ''ardalanmasını'' sağlar; gece-gündüz sürelerinin ''farklılaşmasını ve değişmesini'' ise yıllık hareket/eksen eğikliği sağlar.'
);

-- Soru #017 (Türkiye'nin Coğrafi Konumu)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  'Türkiye''nin doğusu ile batısı arasında 19 meridyen fark (26°-45° Doğu) ve 76 dakikalık zaman farkı bulunur.

Aşağıdakilerden hangisi meridyenlerin kutuplara doğru birbirine yaklaşmasının Türkiye üzerindeki bir sonucudur?',
  '{"options": ["Türkiye''de meridyenler arasındaki mesafenin Ekvator''daki 111 km''den daha az (yaklaşık 85-86 km) olması", "Türkiye''de doğuda güneşin batıdan önce doğması", "İki meridyen arasındaki zaman farkının 4 dakikadan az olması", "Türkiye''nin Greenwich''in doğusunda kalması", "Yerel saatin her yerde aynı olması"], "correctIndex": 0}'::jsonb,
  'Meridyenler Ekvator''da 111 km aralıklıyken kutuplara doğru daralır. Türkiye 36°-42° paralellerinde bulunduğu için iki meridyen arası mesafe yaklaşık 85-86 km''ye düşmüştür. Ancak iki meridyen arasındaki zaman farkı çizgisel hız azaldığı için DAİMA 4 DAKİKA kalır.',
  'Büyük çeldirici: Meridyenler daralınca iki meridyen arasındaki 4 dakikalık zaman farkının da kısaldığı sanılır. Zaman farkı asla değişmez, daima 4 dakikadır!'
);

-- Soru #018 (Türkiye'nin Coğrafi Konumu)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  'Türkiye''nin kıyı uzunlukları incelendiğinde en uzun kıyı şeridine sahip bölgemiz Ege Bölgesi''dir.

Ege kıyılarının Karadeniz ve Akdeniz kıyılarından daha uzun olmasının temel nedeni aşağıdakilerden hangisidir?',
  '{"options": ["Dağların kıyıya dik uzanması sonucu oluşan çok sayıda koy, körfez, burun ve yarımada girintisi", "Ege Denizi''nin diğer denizlerden daha derin olması", "Ege kıyılarında rüzgar erozyonunun şiddetli olması", "Gelgit genliğinin çok yüksek olması", "Kıyıda lagün göllerinin hiç bulunmaması"], "correctIndex": 0}'::jsonb,
  'Ege Bölgesi''nde dağlar (horstlar) denize dik uzandığı için enine kıyı tipi görülür. Deniz iç kısımlara kadar sokulur, binlerce koy, körfez ve burun meydana gelir. Kuş uçuşu mesafe kısa olsa da gerçek kıyı uzunluğu Türkiye''nin en uzunu haline gelir.',
  'Adaylar yüzölçümü ve kıyı uzunluğunu karıştırıp Karadeniz veya Akdeniz''in kıyısını daha uzun sanabilirler; girinti-çıkıntı fazlalığı nedeniyle en uzun kıyı Ege''dedir.'
);

-- Soru #019 (Türkiye'nin Coğrafi Konumu)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  'Aşağıdaki sınır kapısı ve eşleştiği komşu ülke ikililerinden hangisi yanlıştır?',
  '{"options": ["Dilucu Sınır Kapısı — Nahçıvan (Azerbaycan)", "Çobanbey Sınır Kapısı — Suriye", "Türkgözü Sınır Kapısı — Gürcistan", "Esendere Sınır Kapısı — Irak", "Dereköy (Aziziye) Sınır Kapısı — Bulgaristan"], "correctIndex": 3}'::jsonb,
  'Esendere Sınır Kapısı Hakkari''dedir ve İRAN sınırımızdadır. Irak sınırımızdaki ana sınır kapısı Şırnak''taki ''Habur'' ve Hakkari''deki ''Üzümlü'' sınır kapılarıdır.',
  'Esendere Hakkari''de olduğu için adaylar otomatikman Irak ile eşleştirir; oysa Esendere İran sınır kapısıdır.'
);

-- Soru #020 (Türkiye'nin Coğrafi Konumu)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''nin Coğrafi Konumu',
  'multiple_choice',
  2,
  'Türkiye''de dağların uzanış doğrultusu (genellikle doğu-batı yönlü olması) ulaşım, iklim ve bitki örtüsü dağılışını doğrudan etkilemiştir.

Bu uzanış doğrultusunun doğal bir sonucu olarak aşağıdakilerden hangisi gerçekleşmiştir?',
  '{"options": ["Kuzey ve güney kıyılarımızda iç kesimlerle ulaşımın ancak geçit ve tünellerle sağlanabilmesi", "İç kesimlerde denizel iklimin geniş alanlara yayılması", "Ege kıyılarında liman hinterlantlarının çok dar kalması", "Karadeniz kıyılarında enine kıyı tipinin yaygın olması", "Akdeniz''de falezlerin (yalıyarların) hiç görülmemesi"], "correctIndex": 0}'::jsonb,
  'Karadeniz ve Akdeniz''de dağlar kıyıya paralel uzandığı için iç kesimlerle ulaşım zorlaşmış, geçitler (Kop, Zigana, Çubuk, Gülek vb.) zorunlu hale gelmiştir. Ege''de ise dağlar dik olduğu için iç kesimlere ulaşım son derece kolaydır.',
  'Adaylar dağların uzanışını Karadeniz/Akdeniz ile Ege arasında ters eşleştirebilir; Karadeniz ve Akdeniz''de paralel (boyuna kıyı), Ege''de diktir (enine kıyı).'
);

-- Soru #021 (Türkiye'nin Yer Şekilleri ve İklimi)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Ege Bölgesi''nde kırılma (faylanma) hareketleri sonucu sert tabakalar kırılarak yükselen kısımlar horstları, çöken kısımlar ise graben ovalarını oluşturmuştur.

Aşağıdakilerden hangisi Ege Bölgesi''ndeki bu horst-graben sistemine ait bir horst (kırık dağı) değildir?',
  '{"options": ["Yunt Dağı", "Bozdağlar", "Madra Dağı", "Menteşe Dağları", "Canik Dağları"], "correctIndex": 4}'::jsonb,
  'Canik Dağları Orta Karadeniz''de (Samsun gerisinde) yer alan kıvrım dağlarıdır. Kaz, Madra, Yunt, Bozdağlar, Aydın ve Menteşe dağları ise Ege''deki kırık (horst) sistemleridir.',
  'Ege''deki dağlar ''KAZMA YUNTMIŞ BOZ AYI MELEDİ'' şifresiyle hatırlanır (Kaz, Madra, Yunt, Bozdağlar, Aydın, Menteşe). Canik ise Karadeniz kıvrım dağıdır.'
);

-- Soru #022 (Türkiye'nin Yer Şekilleri ve İklimi)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Türkiye''de karstik aşınım şekillerinin (lapya, dolin, uvala, polye) ve karstik birikim şekillerinin (traverten, sarkıt, dikit) en yaygın olduğu coğrafi alan aşağıdakilerden hangisidir?',
  '{"options": ["Teke ve Taşeli Platoları (Batı ve Orta Toroslar)", "Ergene Havzası", "Güneydoğu Anadolu Platoları", "Doğu Karadeniz Kıyı Şeridi", "Erzurum-Kars Platosu"], "correctIndex": 0}'::jsonb,
  'Kalker (kireçtaşı) arazinin en yoğun olduğu yer Toros Dağları kuşağı, özellikle Teke ve Taşeli platolarıdır. Suda kolay çözünen bu kayaçlar üzerinde devasa polyeler (Elmalı, Kestel, Acıpayam, Muğla) ve mağaralar gelişmiştir.',
  'Adaylar karstik arazinin yalnızca Pamukkale''de olduğunu düşünebilir; jeomorfolojik plato ölçeğinde en belirgin saha Teke ve Taşeli''dir.'
);

-- Soru #023 (Türkiye'nin Yer Şekilleri ve İklimi)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Kıyı tipleri bakımından Türkiye''de kıyılar ve jeolojik yapılar büyük çeşitlilik gösterir. Ancak bazı kıyı tipleri Türkiye''de mutlak (matematiksel) ya da göreceli konum koşulları nedeniyle kesinlikle görülmez.

Aşağıdaki kıyı tiplerinden hangisinin Türkiye''de görülmemesi MATEMATİKSEL KONUMUN (Enlem) bir sonucudur?',
  '{"options": ["Haliç tipi kıyılar", "Fiyort ve Skyer tipi kıyılar", "Dalmaçya tipi kıyılar", "Ria tipi kıyılar", "Kalanklı kıyılar"], "correctIndex": 1}'::jsonb,
  'Fiyort ve Skyer tipi kıyılar buzul aşındırması sonucu oluşur ve deniz seviyesine kadar inen buzullar yalnızca kutup ve kutup altı enlemlerde (İskandinavya vb.) görülür. Türkiye Orta Kuşak''ta yer aldığı için kıyılarında buzul etkisi hiç görülmemiştir (Matematiksel konum). Haliç ve vat tipi kıyıların görülmemesi ise okyanusa kıyımız olmaması ve gelgitin azlığıdır (Özel konum).',
  'ÖSYM''nin en meşhur tuzağı: Haliç''in görülmemesi ÖZEL KONUM (okyanusa kıyısı olmama/gelgit azlığı), Fiyort''un görülmemesi ise MATEMATİKSEL KONUMDUR (enlem/sıcaklık).'
);

-- Soru #024 (Türkiye'nin Yer Şekilleri ve İklimi)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Akarsuların taşıdığı alüvyonları denize döküldükleri yerde biriktirmesiyle delta ovaları oluşur. Bir kıyıda delta ovası oluşabilmesi için kıyının sığ olması, akarsuyun bol alüvyon taşıması, kıyıda güçlü akıntı ve gelgit olmaması gerekir.

Aşağıdaki akarsu ve oluşturduğu delta ovası eşleştirmelerinden hangisi yanlıştır?',
  '{"options": ["Kızılırmak — Bafra Deltası", "Yeşilırmak — Çarşamba Deltası", "Seyhan ve Ceyhan — Çukurova", "Göksu — Silifke Deltası", "Gediz — Balat Deltası"], "correctIndex": 4}'::jsonb,
  'Gediz Nehri Menemen Deltası''nı oluşturur. Balat Deltası''nı oluşturan akarsu ise Büyük Menderes''tir. Küçük Menderes Selçuk Deltası''nı, Bakırçay ise Dikili Deltası''nı oluşturur.',
  'Ege deltaları sıkça karıştırılır: Bakırçay-Dikili, Gediz-Menemen, Küçük Menderes-Selçuk, Büyük Menderes-Balat.'
);

-- Soru #025 (Türkiye'nin Yer Şekilleri ve İklimi)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Oluşumlarına göre göller incelendiğinde; lav set gölleri özellikle Doğu Anadolu''da volkanizmanın akarsu vadilerini tıkaması sonucu yaygınlaşmıştır.

Aşağıdaki göllerden hangisi bir volkanik set gölü örneği değildir?',
  '{"options": ["Nazik Gölü", "Balık Gölü", "Çıldır Gölü", "Haçlı Gölü", "Eğirdir Gölü"], "correctIndex": 4}'::jsonb,
  'Eğirdir Gölü, Isparta sınırlarında yer alan bir TEKTONİK-KARSTİK göldür. Van Gölü çevresindeki Nazik, Balık, Çıldır, Haçlı ve Erçek gölleri ise volkanik set gölleridir.',
  'Eğirdir ve Beyşehir Göller Yöresi''nin tipik tektonik-karstik gölleridir; tatlı su gölü olup gideğenleri (kovada ve çarşamba kanalları) vardır.'
);

-- Soru #026 (Türkiye'nin Yer Şekilleri ve İklimi)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Türkiye''de etkili olan yerel rüzgarlar sıcaklık ve yağış koşullarını doğrudan etkiler. Dağ yamacını aşarak diğer tarafa alçalan havanın her 100 metrede 1°C ısınmasıyla ''Föhn rüzgarları'' oluşur.

Türkiye''de kış ve ilkbahar aylarında Föhn rüzgarlarının etkili olduğu bir yörede aşağıdakilerden hangisinin gerçekleşmesi beklenmez?',
  '{"options": ["Havanın nem açığının ve buharlaşmanın artması", "Karların aniden eriyerek çığ ve heyelan riskini artırması", "Tarım ürünlerinin vaktinden önce olgunlaşması veya kuruması", "Havanın bağıl neminin yükselerek şiddetli sağanak yağışların başlaması", "Sıcaklığın kısa sürede birkaç derece birden yükselmesi"], "correctIndex": 3}'::jsonb,
  'Föhn rüzgarı alçaldıkça ısınan, kurutucu bir rüzgardır. Isınan havanın nem taşıma kapasitesi (maksimum nem) artar; bu yüzden bağıl nem düşer ve yağış ihtimali tamamen ORTADAN KALKAR. Yağış değil, kuruluk ve sıcaklık getirir.',
  'Adaylar ''Föhn rüzgarı dağdan esiyor, o halde yamaç yağışı bırakır'' yanılgısına düşerler. Föhn rüzgarı dağın arkasına ''inen'' rüzgardır, yağış bırakmaz; yağışı bırakan dağa ''tırmanan'' rüzgardır.'
);

-- Soru #027 (Türkiye'nin Yer Şekilleri ve İklimi)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Toprak oluşumunda ana kayanın kimyasal bileşimi, iklim ve bitki örtüsü belirleyicidir. Kalsimorfik topraklar grubunda yer alan ve killi kireçli kireç taşları üzerinde oluşan, kurak dönemde çatlayarak içine dökülen taşları yağışlı dönemde yüzeye fırlattığı için halk arasında ''dönen toprak'' ya da ''taş doğuran'' olarak adlandırılan toprak tipi hangisidir?',
  '{"options": ["Terra Rossa", "Vertisol", "Rendzina", "Podzol", "Çernezyom"], "correctIndex": 1}'::jsonb,
  'Vertisol topraklar (kepir veya taş doğuran topraklar), killi yapısından dolayı kurak mevsimde derin çatlaklar oluşturur. Trakya''da Ergene Havzası''nda, Güney Marmara''da ve Muş Ovası''nda yaygındır ve ayçiçeği ile buğday tarımına çok elverişlidir.',
  'Rendzina ile Vertisol karıştırılır: Rendzina yumuşak kireçtaşları üzerinde oluşur; çatlayıp taş fırlatan ''dönen toprak'' ise Vertisol''dür.'
);

-- Soru #028 (Türkiye'nin Yer Şekilleri ve İklimi)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Erzurum-Kars ve Ardahan platolarında dünyanın en verimli yerli (zonal) toprağı kabul edilen Çernezyom (kara toprak) geniş yer kaplar.

Bu platolarda toprağın son derece zengin humus ve mineral içermesine rağmen tarımsal verimin ve ürün çeşitliliğinin çok düşük kalmasının temel nedeni nedir?',
  '{"options": ["Toprağın aşırı derecede tuzlu ve çorak olması", "Yaz mevsiminin çok kısa, serin geçmesi ve don olaylarının erken başlaması", "Toprağın aşırı kireçli olması", "Sulama imkanlarının hiç bulunmaması", "Taban suyunun çok derinde olması"], "correctIndex": 1}'::jsonb,
  'Çernezyom zengin çayır örtüsü altında gelişen muazzam verimli bir topraktır. Ancak Erzurum-Kars''ta sert karasal iklim egemendir; kışlar 6-7 ay sürer, donlu gün sayısı çok fazladır ve yaz çok kısa sürer. İklim koşulları elvermediği için tarım yapılamaz, alan büyükbaş mera hayvancılığına ayrılır.',
  'ÖSYM ''Toprak verimli ise tarım neden gelişmemiştir?'' tezadını sormayı çok sever. Cevap toprağın yapısı değil, tamamen iklim yetersizliğidir.'
);

-- Soru #029 (Türkiye'nin Yer Şekilleri ve İklimi)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Karadeniz Bölgesi''nde Doğu Karadeniz (Rize-Trabzon) ile Orta Karadeniz (Samsun) bölümleri karşılaştırıldığında; Orta Karadeniz''de yağış miktarının daha az olması, denizel etkinin iç kısımlara daha kolay girmesi ve delta ovalarının daha geniş yer kaplamasının temel nedeni aşağıdakilerden hangisidir?',
  '{"options": ["Orta Karadeniz''de Canik Dağları''nın yükseltisinin daha az olması ve kıyının daha gerisinde uzanması", "Doğu Karadeniz''in Ekvator''a daha yakın olması", "Orta Karadeniz''de orman varlığının hiç bulunmaması", "Samsun''da buharlaşmanın Rize''den daha fazla olması", "Yeşilırmak''ın debisinin Çoruh''tan yüksek olması"], "correctIndex": 0}'::jsonb,
  'Doğu Karadeniz''de Kaçkar Dağları 4000 metreye yaklaşır ve hemen kıyıdan dimdik yükselir (falez çok, yağış 2400 mm, delta yok). Orta Karadeniz''de ise Canik Dağları alçaktır (1500 m) ve kıyının çok gerisindedir; bu sayede nemli hava içeri girer, yağış 700 mm''ye düşer ve devasa Bafra-Çarşamba deltaları oluşur.',
  'ÖSYM Canik Dağları''nın alçak ve geride olmasının sonuçlarını coğrafyada adeta bir klasik kural olarak sık sık sorar.'
);

-- Soru #030 (Türkiye'nin Yer Şekilleri ve İklimi)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Türkiye''de akarsuların genel özellikleri göz önüne alındığında aşağıdakilerden hangisi doğru bir genelleme değildir?',
  '{"options": ["Genç olusumlu bir ülke olduğumuz için akarsuların akış hızları ve enerji potansiyelleri yüksektir.", "Akarsularımızın boyları yarımada olmamız ve dağların uzanışı nedeniyle genellikle kısadır.", "Rejimleri genellikle düzensizdir (Karadeniz akarsuları hariç).", "Denge profiline ulaşmadıkları için üzerlerinde taşımacılık ve ulaşım yapılamaz.", "Akarsularımızın tamamı açık havzalıdır ve sularını mutlaka denizlere ulaştırırlar."], "correctIndex": 4}'::jsonb,
  'Türkiye''deki akarsuların tamamı açık havzalı değildir. İç Anadolu''da Tuz Gölü Havzası ve Konya Kapalı Havzası, Doğu Anadolu''da Van Gölü Kapalı Havzası ve Hazar Denizi''ne dökülen Aras ile Kura nehirleri birer KAPALI HAVZA örneğidir.',
  'Aras ve Kura nehirleri Hazar Denizi''ne dökülür; Hazar göl statüsünde olduğu için Aras ve Kura açık havza değil kapalı havza akarsularıdır.'
);

-- Soru #031 (Türkiye'nin Yer Şekilleri ve İklimi)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Türkiye''de görülen iklim tiplerinin en fazla yağış aldıkları mevsimler sınavda grafik ve eşleştirme olarak sıkça sorulur.

Aşağıdaki iklim tipi ve en çok yağış aldığı mevsim eşleştirmelerinden hangisi yanlıştır?',
  '{"options": ["Karadeniz İklimi — Sonbahar", "Akdeniz İklimi — Kış", "İç Anadolu Karasal İklimi (Step) — İlkbahar", "Erzurum-Kars Sert Karasal İklimi — Yaz", "Güneydoğu Anadolu Karasal İklimi — Yaz"], "correctIndex": 4}'::jsonb,
  'Güneydoğu Anadolu Bölgesi yaz aylarında son derece kurak ve sıcaktır; yağışlarının neredeyse tamamını kış ve ilkbahar aylarında alır. Yaz yağışları Türkiye''de yalnızca Doğu Anadolu''nun yüksek platolarında (Erzurum-Kars-Ardahan) ve Doğu Karadeniz yaylalarında görülür.',
  'Adaylar Güneydoğu''nun karasal olduğunu düşünüp Erzurum-Kars gibi yazın yağış aldığını sanabilir. Oysa Güneydoğu yazın Türkiye''nin en kurak yeridir (buharlaşma tavan yapar).'
);

-- Soru #032 (Türkiye'nin Yer Şekilleri ve İklimi)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Türkiye''de ilkbahar aylarında ısınan havanın yükselerek soğuması sonucu öğleden sonraları aniden başlayan gök gürültülü sağanak yağışlara halk arasında ''Kırkikindi Yağışları'' denir.

Bu yağışların klimatik kökeni aşağıdakilerden hangisidir?',
  '{"options": ["Orografik (Yamaç) Yağışları", "Cephesel (Frontal) Yağışlar", "Konveksiyonel (Yükselim) Yağışları", "Dinamik Siklon Yağışları", "Muson Yağışları"], "correctIndex": 2}'::jsonb,
  'Isınan havanın dikey doğrultuda kendiliğinden yükselmesiyle oluşan yağışlara Konveksiyonel (Yükselim) yağışlar denir. İç Anadolu''da ilkbaharda, Erzurum-Kars''ta ise yaz aylarında görülür.',
  'Yamaç yağışları bir dağ sırasına çarpan havayla oluşur (Karadeniz); Cephesel yağışlar sıcak ve soğuk havanın karşılaşmasıyla oluşur (Akdeniz); Kırkikindi ise termik yükselmedir (Konveksiyonel).'
);

-- Soru #033 (Türkiye'nin Yer Şekilleri ve İklimi)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Türkiye''de heyelan (kütle hareketleri) olaylarının yaklaşık %65''i ilkbahar mevsiminde ve özellikle Doğu Karadeniz Bölümü''nde gerçekleşmektedir.

Heyelanların ilkbahar aylarında zirve yapmasında etkili olan temel doğa olayı aşağıdakilerden hangisidir?',
  '{"options": ["Bitki örtüsünün yaprak dökmesi", "İlkbaharda karların hızla erimesi ve toprağın suya aşırı doygun hale gelmesi", "Föhn rüzgarlarının kışın toprağı dondurması", "Deniz seviyesinin ilkbaharda aniden yükselmesi", "Tarımda aşırı gübre kullanımı"], "correctIndex": 1}'::jsonb,
  'Heyelanın Doğu Karadeniz''de yoğunlaşmasının sebepleri: Eğim fazlalığı, killi tabaka ve bol yağıştır. İlkbaharda ise bu faktörlere ''hızlı kar erimeleri'' eklenir; toprak suya doyar, ağırlaşır ve killi kaygan zemin üzerinde aşağıya doğru kayar.',
  'Adaylar Karadeniz en çok yağışı sonbaharda aldığı için heyelanın da sonbaharda en çok olacağını sanırlar; oysa karlar ilkbaharda eridiği için heyelan rekoru İLKBAHARDADIR.'
);

-- Soru #034 (Türkiye'nin Yer Şekilleri ve İklimi)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Platolar akarsular tarafından derin vadilerle yarılmış geniş düzlüklerdir. Oluşum kökenlerine göre platolar farklı gruplara ayrılır.

Aşağıdaki plato ve oluşum kökeni eşleştirmelerinden hangisi yanlıştır?',
  '{"options": ["Teke ve Taşeli — Karstik plato", "Erzurum-Kars — Volkanik (Lav örtüsü) plato", "Çatalca-Kocaeli — Aşınım (Peneplen) platosu", "Haymana ve Cihanbeyli — Tabaka düzlüğü (Yatay duruşlu) plato", "Yazılıkaya (Bayat) — Karstik plato"], "correctIndex": 4}'::jsonb,
  'Yazılıkaya Platosu (Ege-İç Anadolu sınırı), yatay duruşlu (tabaka düzlüğü) bir platodur. Türkiye''de karstik platolar Akdeniz''deki Teke ve Taşeli platolarıdır.',
  'Çatalca-Kocaeli platosu aşınarak deniz seviyesine kadar inmiş Türkiye''nin en alçak aşınım platosudur ve en gelişmiş sanayi/nüfus merkezidir.'
);

-- Soru #035 (Türkiye'nin Yer Şekilleri ve İklimi)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Türkiye''de rüzgar erozyonunun ve rüzgar aşındırma/biriktirme şekillerinin (mantarkaya, kumul vb.) en etkili olduğu yer İç Anadolu''da Konya Karapınar çevresidir.

Bu yörede rüzgar erozyonunun bu denli şiddetli olmasının başlıca nedeni nedir?',
  '{"options": ["Bitki örtüsünün yok denecek kadar cılız olması, kuraklık ve arazinin düz/açık olması", "Bölgede sert kasırgaların ve tayfunların görülmesi", "Toprağın aşırı killi ve nemli olması", "Akarsu ağının çok sık olması", "Platoların ortalama yükseltisinin 3000 metreyi aşması"], "correctIndex": 0}'::jsonb,
  'Rüzgar erozyonu kurak, yarı kurak, bitki örtüsünün tahrip edildiği ve gevşek yapılı kumlu-tozlu arazilerde etkili olur. Karapınar Türkiye''nin en az yağış alan, düz ve bitkisiz sahalarından biri olduğu için rüzgar süpürmesi maksimumdur.',
  'Rüzgarın aşındırma yapabilmesi için rüzgarın çok hızlı esmesi tek başına yetmez; toprağın korumasız ve bitkisiz olması şarttır.'
);

-- Soru #036 (Türkiye'nin Yer Şekilleri ve İklimi)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Türkiye akarsularının havzaları incelendiğinde; kaynağını Türkiye sınırları içerisinden alıp komşu ülkeler üzerinden açık denizlere dökülen akarsular bulunmaktadır.

Aşağıdaki akarsulardan hangisi Türkiye''den doğup başka bir ülkenin topraklarından denize dökülen nehirlerden biri değildir?',
  '{"options": ["Fırat", "Dicle", "Çoruh", "Aras", "Asi"], "correctIndex": 4}'::jsonb,
  'Asi Nehri kaynağını Lübnan''dan alır, Suriye''den geçer ve Hatay''dan Akdeniz''e dökülür (Dışarıdan doğup Türkiye''ye dökülür). Fırat ve Dicle ise Türkiye''den doğup Basra Körfezi''ne dökülür; Çoruh Türkiye''den doğup Gürcistan''dan Karadeniz''e dökülür.',
  'ÖSYM ''Türkiye''de doğup dışarı dökülenler'' (Fırat, Dicle, Çoruh, Aras, Kura) ile ''Dışarıda doğup Türkiye''ye dökülenler'' (Meriç, Asi) ayrımını sık sık test eder.'
);

-- Soru #037 (Türkiye'nin Yer Şekilleri ve İklimi)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Görünür nem açığı ve bağıl nem coğrafyada yağış olasılığını belirler. Havanın nem taşıma kapasitesi (maksimum nem) yalnızca sıcaklığa bağlıyken; bağıl nem havadaki mutlak nemin maksimum neme oranıdır.

Buna göre Türkiye''de yaz mevsiminde ''maksimum nemin'' en yüksek olduğu bölge ile yıl boyunca ''bağıl nemin'' en yüksek olduğu bölge sırasıyla hangileridir?',
  '{"options": ["Güneydoğu Anadolu — Doğu Karadeniz", "Akdeniz — İç Anadolu", "Doğu Karadeniz — Güneydoğu Anadolu", "Ege — Marmara", "Doğu Anadolu — Akdeniz"], "correctIndex": 0}'::jsonb,
  'Maksimum nem havayı ısıttıkça büyür; yazın Türkiye''nin en sıcak yeri Güneydoğu Anadolu olduğu için maksimum nem burada zirvedir. Bağıl nem ise yağış ihtimalidir; yıl boyunca nemli ve yağışlı olan Doğu Karadeniz''de bağıl nem en yüksektir.',
  'Adaylar ''Karadeniz nemli, o zaman maksimum nem Karadeniz''dedir'' yanılgısına düşerler. Maksimum nem sıcaklıkla doğru orantılıdır, havadaki gerçek su buharı değil havanın ''kapasitesidir''.'
);

-- Soru #038 (Türkiye'nin Yer Şekilleri ve İklimi)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Türkiye''de peri bacalarının (Kapadokya Yöresi) oluşumunda jeolojik ve jeomorfolojik birçok faktör birlikte rol oynamıştır.

Peri bacalarının oluşumunda doğrudan etkili olan volkanik materyal ile aşındırmayı başlatan temel dış kuvvet hangisinde doğru verilmiştir?',
  '{"options": ["Volkanik tüf ve bazalt — Akarsu ve sel suları", "Kalker ve jips — Rüzgarlar", "Granit blokları — Buzullar", "Kil ve marn — Dalgalar", "Kuvarsit — Yer altı suları"], "correctIndex": 0}'::jsonb,
  'Peri bacaları volkanlardan püsküren tüf tabakalarının üzerini örten sert bazalt lavlarının akarsu ve sel suları tarafından aşındırılmasıyla oluşur. Temel dış kuvvet akarsudur, rüzgar ise sadece şekillendirici dolaylı kuvvettir.',
  'En popüler ÖSYM tuzağı: Peri bacalarını yapan temel kuvvet rüzgar zannedilir! Birincil ve asıl kuvvet AKARSU/SEL SULARIDIR; rüzgar ikinci plandadır.'
);

-- Soru #039 (Türkiye'nin Yer Şekilleri ve İklimi)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Türkiye''de kış mevsiminde Sibirya Termik Yüksek Basıncı etkili olduğunda ülke genelinde dondurucu kuru soğuklar, ayaz ve kar yağışları yaşanır.

Buna karşılık kış mevsiminde Türkiye''de havanın ılıklaşmasına, deniz üzerinden bol nem getirerek güney ve batı kıyılarımızda şiddetli cephesel fırtınalara ve yağışlara neden olan dinamik alçak basınç merkezi hangisidir?',
  '{"options": ["İzlanda Dinamik Alçak Basıncı", "Basra Termik Alçak Basıncı", "Asor Dinamik Yüksek Basıncı", "Muson Alçak Basıncı", "Kutup Yüksek Basıncı"], "correctIndex": 0}'::jsonb,
  'İzlanda Dinamik Alçak Basıncı kışın Türkiye''ye Balkanlar üzerinden sokulduğunda havanın ılık ve bol yağışlı geçmesini sağlar. Asor yüksek basıncı ise yazın kuraklık, kışın ayaz getirir.',
  'Basra yazın Güneydoğu''yu kavuran termik basınçtır; İzlanda ise kışın yağış ve ılıman hava getiren dinamik alçak basınç merkezidir.'
);

-- Soru #040 (Türkiye'nin Yer Şekilleri ve İklimi)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''nin Yer Şekilleri ve İklimi',
  'multiple_choice',
  2,
  'Türkiye''de epirojenik (kıta oluşumu) hareketlerin günümüzde de devam ettiğinin en somut kanıtları arasında aşağıdakilerden hangisi gösterilemez?',
  '{"options": ["Çukurova ve Ergene Havzası''nın tortulanarak her yıl çökmesi", "Akarsu vadilerinde basamaklı seki (taraça) oluşumlarının görülmesi", "Karadeniz ve Toros Dağları''nın toptan yükselmeye devam etmesi", "Eski kordon boylarının ve kıyı taraçalarının deniz seviyesinden yüksekte kalması", "Ege kıyılarında kırıklı fay hatlarında sık sık depremler meydana gelmesi"], "correctIndex": 4}'::jsonb,
  'Ege''de fay hatlarının kırılması ve depremler OROJENEZ ve SEİZMA (deprem) ile ilgilidir. Epirojeniz ise tabakaların bozulmadan toptan kubbeleşmesi ya da toptan çökmesidir (seki/taraça oluşumu, Çukurova''nın çökmesi, dağların toptan yükselmesi).',
  'ÖSYM deprem ve orojenez (dağ oluşumu) ile epirojenez (toptan yükselme/alçalma) arasındaki kavram farkını sık sık çeldirici olarak kullanır.'
);

-- Soru #041 (Türkiye'de Nüfus ve Yerleşme)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'TÜİK''in son yıllardaki Adrese Dayalı Nüfus Kayıt Sistemi (ADNKS) verileri incelendiğinde, Türkiye''nin nüfus piramidinde tabanın belirgin şekilde daraldığı gözlenmektedir.

Nüfus piramidinin tabanının daralması Türkiye nüfusu ile ilgili kesin olarak hangi göstergeyi kanıtlar?',
  '{"options": ["Doğum oranlarının ve çocuk nüfus oranının azaldığını", "Toplam nüfus miktarının gerilemeye başladığını", "Dış ülkelere verilen göçlerin arttığını", "Tarımsal nüfus yoğunluğunun yükseldiğini", "Kırsal nüfus oranının kentsel nüfusu geçtiğini"], "correctIndex": 0}'::jsonb,
  'Piramidin en alt basamağı 0-4 yaş grubunu (yeni doğanları) temsil eder. Tabanın daralması, doğurganlık hızının düştüğünü, ailelerin daha az çocuk sahibi olduğunu ve nüfus artış hızının gerilediğini doğrudan kanıtlar.',
  'Adaylar nüfus artış hızı azalınca ''toplam nüfus da azaldı'' sanırlar. Nüfus artış hızı sıfırın altına düşmedikçe toplam nüfus artmaya devam eder, sadece artış hızı yavaşlar.'
);

-- Soru #042 (Türkiye'de Nüfus ve Yerleşme)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Tarımsal nüfus yoğunluğu, tarımla uğraşan nüfusun tarım alanlarına bölünmesiyle elde edilir. Dağlık ve engebeli arazilerde tarım arazisi dar olduğu için tarımsal nüfus yoğunluğu çok yüksek çıkar.

Buna göre aşağıdaki merkezlerin hangisinde tarımsal nüfus yoğunluğunun diğerlerine göre daha yüksek olması beklenir?',
  '{"options": ["Konya Ovası", "Şanlıurfa Platosu", "Doğu Karadeniz (Rize yöresi)", "Ergene Havzası", "Gaziantep Platosu"], "correctIndex": 2}'::jsonb,
  'Rize ve Doğu Karadeniz''de arazinin büyük bölümü sarp dağ ve ormanlarla kaplıdır; tarım arazisi son derece kısıtlıdır. Kırsal nüfus bu daracık tarım alanlarına sıkıştığı için tarımsal nüfus yoğunluğu Türkiye''nin en yüksek seviyelerindedir.',
  'Konya ve Şanlıurfa''da tarım yapan insan çoktur ama tarım arazisi uçsuz bucaksız olduğu için yoğunluk düşüktür.'
);

-- Soru #043 (Türkiye'de Nüfus ve Yerleşme)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Türkiye haritasında bazı alanlar fiziki ya da beşeri olumsuz koşullar nedeniyle çok seyrek nüfuslanmıştır.

Aşağıdaki alanlardan hangisinin seyrek nüfuslu olmasında arazinin ''karstik yapıda olması ve suyun yer altına sızması'' temel faktördür?',
  '{"options": ["Yıldız Dağları Yöresi", "Teke ve Taşeli Platoları", "Hakkari Yöresi", "Tuz Gölü ve Çevresi", "Biga Yarımadası"], "correctIndex": 1}'::jsonb,
  'Teke ve Taşeli platolarında karstik kalkerli arazi yaygındır. Yüzeye düşen yağmur suları çatlaklardan hemen yer altına sızar; yüzey suyu bulunamaz, toprak kireçlidir ve tarım yapılamaz. Bu yüzden Akdeniz kıyısında olmasına rağmen çok seyrektir.',
  'Yıldız Dağları ana ulaşım yollarına sapa kaldığı için, Hakkari engebe/soğuk yüzünden, Tuz Gölü ise kuraklık yüzünden seyrektir.'
);

-- Soru #044 (Türkiye'de Nüfus ve Yerleşme)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Türkiye''de belirli dönemlerde yapılan geçici (mevsimlik) işçi göçleri yörelerin nüfusunda dönemsel büyük dalgalanmalara yol açar.

Aşağıdakilerden hangisi tarımsal amaçlı mevsimlik göç alan yörelerimize örnek gösterilemez?',
  '{"options": ["Pamuk hasadı için Çukurova ve Şanlıurfa", "Fındık toplamak için Ordu ve Giresun", "Çay hasadı için Rize ve Artvin", "Kayısı hasadı için Malatya", "Kış aylarında kayak turizmi için Uludağ ve Palandöken"], "correctIndex": 4}'::jsonb,
  'Uludağ ve Palandöken''e kışın giden nüfus tarımsal değil ''turizm amaçlı'' geçici nüfus hareketidir. Soru kökünde ''tarımsal amaçlı'' mevsimlik göç sorulmaktadır.',
  'Sorularda mevsimlik göçün ''tarım mı'', ''turizm mi'' yoksa ''inşaat mı'' amaçlı olduğuna dikkat edilmelidir.'
);

-- Soru #045 (Türkiye'de Nüfus ve Yerleşme)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Türkiye''nin Cumhuriyet tarihi boyunca uygulanan nüfus politikaları incelendiğinde; nüfus artış hızının tarihimizin en düşük seviyesine (%1,05 civarı) gerilediği dönem aşağıdakilerden hangisidir?',
  '{"options": ["1927 — 1935 Dönemi", "1940 — 1945 Dönemi", "1955 — 1960 Dönemi", "1970 — 1975 Dönemi", "1980 — 1985 Dönemi"], "correctIndex": 1}'::jsonb,
  '1940-1945 döneminde İkinci Dünya Savaşı tehlikesi nedeniyle eli silah tutan genç erkek nüfus askere alınmış (seferberlik), evlilikler ertelenmiş, ekonomik kriz ve kıtlık baş göstermiştir. Bu nedenle nüfus artış hızımız tarihin en sert düşüşünü yaşamıştır.',
  'Nüfus artış hızının ''en yüksek'' olduğu dönem 1955-1960 (binde 28); ''en düşük'' olduğu tarihi savaş dönemi ise 1940-1945''tir.'
);

-- Soru #046 (Türkiye'de Nüfus ve Yerleşme)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Köy altı yerleşmeleri yerleşme süresine göre sürekli ve geçici olarak ikiye ayrılır. Sürekli köy altı yerleşmelerinde temel ekonomik faaliyet genellikle tarımdır.

Aşağıdaki köy altı yerleşmelerinden hangisi ekonomik faaliyeti tarıma dayalı ''sürekli'' köy altı yerleşmelerinden biridir?',
  '{"options": ["Yayla", "Kom", "Mezra", "Ağıl", "Oba"], "correctIndex": 2}'::jsonb,
  'Mezra, Çiftlik, Mahalle ve Divan sürekli köy altı yerleşmeleridir. Yayla, kom, ağıl, oba ve dam ise hayvancılığa bağlı geçici yerleşmelerdir.',
  'Sürekli yerleşmeleri ''ÇİFTLİK-MAHALLE-MEZRA-DİVAN'' (ÇMMD) olarak kodlayabilirsiniz; diğerleri geçicidir.'
);

-- Soru #047 (Türkiye'de Nüfus ve Yerleşme)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Kırsal yerleşme dokuları incelendiğinde yer şekillerinin düz ve su kaynaklarının kısıtlı olduğu yerlerde evler tek bir su kuyusunun etrafında toplanarak ''toplu yerleşmeleri'' oluşturmuştur.

Buna göre aşağıdaki coğrafi bölümlerin hangisinde toplu kırsal yerleşmelerin en yaygın olması beklenir?',
  '{"options": ["Doğu Karadeniz Bölümü", "Batı Karadeniz Bölümü", "Menteşe Yöresi", "Konya Bölümü (İç Anadolu)", "Hakkari Bölümü"], "correctIndex": 3}'::jsonb,
  'Toplu yerleşmeler suyun az, yer şekillerinin düz olduğu İç Anadolu ve Güneydoğu Anadolu''da yaygındır. Karadeniz''de ise su her yerde olduğu ve yer şekilleri engebeli olduğu için ''dağınık yerleşme'' görülür.',
  'Dağınık yerleşme = Bol su + Engebeli arazi (Karadeniz); Toplu yerleşme = Az su + Düz arazi (İç Anadolu).'
);

-- Soru #048 (Türkiye'de Nüfus ve Yerleşme)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Kırsal meskenlerde kullanılan yapı malzemeleri yörenin doğal çevre koşulları ve iklimiyle doğrudan uyumludur.

İç Anadolu ve Güneydoğu Anadolu''da kırsal evlerde kerpiç malzemenin yaygın olarak kullanılmasının temel nedeni nedir?',
  '{"options": ["Bölgede orman örtüsünün az, toprağın killi ve iklimin kurak/yarı kurak olması", "Kerpiç evlerin depreme karşı en dayanıklı mesken türü olması", "Bölgede taş ocaklarının hiç bulunmaması", "Kerpiç malzemenin su geçirmeyen bir izolasyon sağlaması", "Bölge halkının sanayide çalışması"], "correctIndex": 0}'::jsonb,
  'Kerpiç saman ve killi çamurun kalıplara dökülüp güneşte kurutulmasıyla yapılır. Ağacın ve taşın az, kuraklığın ve killi toprağın bol olduğu step iklimlerinde doğal malzemedir; kışın sıcak, yazın serin tutar.',
  'Karadeniz''de ahşap, Akdeniz''de taş (kalker), Doğu Anadolu''da volkanik taş/bazalt, İç Anadolu''da kerpiç.'
);

-- Soru #049 (Türkiye'de Nüfus ve Yerleşme)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Türkiye''de iç göç hareketleri genellikle doğudan batıya, iç kesimlerden kıyılara ve kırsal alanlardan büyük metropollere doğru gerçekleşir.

Aşağıdakilerden hangisi Türkiye''de kırsal alandan kentlere yapılan iç göçleri tetikleyen ''itici faktörlerden'' biri değildir?',
  '{"options": ["Tarımsal arazilerin miras yoluyla parçalanarak aile geçimini sağlayamaz hale gelmesi", "Tarımda makineli tarıma geçilmesiyle kırsalda işgücü fazlalığı oluşması", "Kentlerde eğitim, sağlık ve sosyal yaşam olanaklarının çok daha çeşitli olması", "Kırsal alanda erozyon ve kuraklık nedeniyle verimin düşmesi", "Deprem, heyelan ve taşkın gibi doğal afetlerin geçim kaynaklarını yok etmesi"], "correctIndex": 2}'::jsonb,
  'Kentlerdeki eğitim, sağlık ve cazip iş imkanları göçü başlatan değil, insanları kente çeken ''ÇEKİCİ FAKTÖRDÜR''. Diğer şıklar kırsalın insanı oradan uzaklaştıran ''itici faktörleridir''.',
  'ÖSYM ''itici faktör'' (kırsalın olumsuzluğu) ile ''çekici faktör'' (kentin sunduğu avantajlar) ayrımını sık sık tuzak olarak kurar.'
);

-- Soru #050 (Türkiye'de Nüfus ve Yerleşme)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Türkiye''de 1980''lerden sonra sanayileşme ve kentleşmenin hızlanmasıyla kent nüfusu kırsal nüfusu geride bırakmıştır.

Türkiye''de kent nüfusunun kırsal nüfus oranını resmi olarak ilk kez geride bıraktığı genel nüfus sayımı yılı hangisidir?',
  '{"options": ["1950", "1965", "1985", "2000", "2010"], "correctIndex": 2}'::jsonb,
  '1985 nüfus sayımında kent nüfus oranı %53''e ulaşarak Türkiye tarihinde ilk kez kırsal nüfusu (%47) geride bırakmıştır. Günümüzde ise bu oran %93''ün üzerine çıkmıştır.',
  '1980 askeri darbesi sonrası 1985 sayımı kır-kent dengesinin resmen kente döndüğü dönüm noktasıdır.'
);

-- Soru #051 (Türkiye'de Nüfus ve Yerleşme)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Küreselleşmenin getirdiği tekdüze kent hayatına karşı, yerel üreticileri destekleyen, tarihi dokuyu koruyan ve nüfusu 50 binden az olan kentlere ''Sakin Şehir'' (Cittaslow) unvanı verilir.

Türkiye''nin 2009 yılında kabul edilen İLK Sakin Şehri aşağıdakilerden hangisidir?',
  '{"options": ["Halfeti (Şanlıurfa)", "Seferihisar (İzmir)", "Akyaka (Muğla)", "Taraklı (Sakarya)", "Eğirdir (Isparta)"], "correctIndex": 1}'::jsonb,
  'Türkiye''nin ilk Sakin Şehri (Cittaslow) İzmir''in Seferihisar ilçesidir (2009). Bu unvanla birlikte Türkiye''de sakin şehir ağı genişlemiş ve Halfeti, Akyaka, Perşembe, Göynük gibi birçok ilçe bu ağa katılmıştır.',
  'Adaylar batık şehir görüntüsüyle ünlü Halfeti''yi ilk sakin şehir zannedebilir; Halfeti daha sonra katılmıştır, ilki Seferihisar''dır.'
);

-- Soru #052 (Türkiye'de Nüfus ve Yerleşme)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Karadeniz Bölgesi''nde yer alan Sinop Limanı, Türkiye''nin en mükemmel doğal limanlarından biri olmasına rağmen tarih boyunca yeterince gelişememiş ve sönük kalmıştır.

Sinop Limanı''nın gelişememesindeki temel coğrafi engel aşağıdakilerden hangisidir?',
  '{"options": ["Kıyıda dalga aşındırmasının çok fazla olması", "Küre Dağları''nın kıyının hemen gerisinde uzanarak limanın art bölgesine (hinterlant) ulaşımını engellemesi", "Limanın derinliğinin büyük yük gemilerine elverişsiz olması", "Karasal iklimin kıyıda don olaylarına yol açması", "Liman çevresinde tarım arazisinin hiç olmaması"], "correctIndex": 1}'::jsonb,
  'Bir limanın büyümesi ''hinterlandının'' (art bölgesinin) genişliğine ve iç kesimlerle ulaşım kolaylığına bağlıdır. Sinop doğal bir limandır fakat Küre Dağları arkasında set çektiği için iç bölgelerle demiryolu ve kaliteli karayolu bağlantısı kurulamamış, bu yüzden gelişememiştir.',
  'ÖSYM ''Doğal liman olup gelişmeyen'' (Sinop) ile ''Yapay olup hinterlandı en geniş olan'' (İzmir, Mersin, İstanbul) liman karşılaştırmasını her sınavda sorar.'
);

-- Soru #053 (Türkiye'de Nüfus ve Yerleşme)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Şehirlerin gelişmesinde baskın olan fonksiyonlar farklıdır. Bazı şehirler yeraltı kaynağının bulunup işletilmesiyle hızla büyüyerek maden kenti kimliği kazanmıştır.

1940''lara kadar küçük bir köy iken Raman Dağı''nda petrol bulunmasıyla hızla büyüyüp il statüsü kazanan maden şehrimiz hangisidir?',
  '{"options": ["Batman", "Zonguldak", "Soma", "Seydişehir", "Yatağan"], "correctIndex": 0}'::jsonb,
  'Batman, 1940 yılında Raman Dağı''nda petrolün keşfedilmesi ve Türkiye''nin ilk rafinerisinin burada kurulmasıyla küçük bir köyden modern bir sanayi ve maden şehrine dönüşmüştür.',
  'Zonguldak taş kömürüyle, Batman petrolle büyüyen maden şehirlerimizdir.'
);

-- Soru #054 (Türkiye'de Nüfus ve Yerleşme)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Batı Karadeniz Bölümü''nde (özellikle Bolu, Sinop, Kastamonu çevrelerinde) yaygın olan; birbirinden bağımsız birkaç mahallenin birleşerek tek bir muhtarlık oluşturduğu sürekli köy altı yerleşmesi hangisidir?',
  '{"options": ["Divan", "Mezra", "Kom", "Dalyan", "Dam"], "correctIndex": 0}'::jsonb,
  'Divan yerleşmesi Batı Karadeniz''e özgüdür. Engebeli arazide mahalleler birbirinden kopuktur ve birkaç mahallenin bir idari çatı altında toplanmasıyla divan oluşur.',
  'Divan = Batı Karadeniz; Mezra = Doğu Anadolu ve Güneydoğu; Kom = Doğu Anadolu.'
);

-- Soru #055 (Türkiye'de Nüfus ve Yerleşme)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Ege ve Akdeniz kıyılarındaki koylarda ve göl kenarlarında kurulan, deniz hayvanlarının ve balıkların üretilip avlandığı geçici kırsal yerleşme türü aşağıdakilerden hangisidir?',
  '{"options": ["Dalyan", "Ağıl", "Oba", "Kışlak", "Güzle"], "correctIndex": 0}'::jsonb,
  'Dalyan su ürünleri ve balıkçılık yapılan kıyı köy altı yerleşmeleridir. Muğla Dalyan en bilinen örneğidir.',
  'Ağıl küçükbaş hayvan barınağıdır; Oba çadırlı göçebe Yörük yerleşmesidir; Dalyan ise su ürünleri yerleşmesidir.'
);

-- Soru #056 (Türkiye'de Nüfus ve Yerleşme)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Geniş tarım alanları üzerine kurulan, mülkiyeti genellikle tek bir şahsa ya da aileye ait olan, tarım ve hayvancılığın bir arada yapıldığı sürekli yerleşme türü hangisidir?',
  '{"options": ["Çiftlik", "Kom", "Yayla", "Oba", "Dam"], "correctIndex": 0}'::jsonb,
  'Çiftlik geniş ve düz arazilerde (Trakya, Ege, Akdeniz, İç Anadolu) tarım ve hayvancılık amacıyla kurulan sürekli köy altı yerleşmesidir.',
  'Çiftlik tek bir aile/şahıs mülkiyetindedir ve kalıcıdır.'
);

-- Soru #057 (Türkiye'de Nüfus ve Yerleşme)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'TÜİK''in son verilerine göre Türkiye''de nüfus miktarı en az olan ilimiz aşağıdakilerden hangisidir?',
  '{"options": ["Bayburt", "Tunceli", "Ardahan", "Gümüşhane", "Kilis"], "correctIndex": 0}'::jsonb,
  'Türkiye''nin nüfusu en az olan ili Bayburt''tur (yaklaşık 84-85 bin nüfus). Tunceli ve Ardahan da nüfusu en az iller arasındadır ancak son yıllardaki birincilik Bayburt''tadır.',
  'Adaylar en küçük yüzölçümü olan Yalova ile en az nüfusu olan Bayburt''u karıştırabilirler.'
);

-- Soru #058 (Türkiye'de Nüfus ve Yerleşme)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Yükseköğrenim görmüş, nitelikli bilim insanı, doktor ve mühendislerin daha iyi çalışma koşulları için gelişmiş ülkelere gitmesine ''Beyin Göçü'' denir.

Beyin göçünün bir ülke üzerindeki en yıkıcı sonucu aşağıdakilerden hangisidir?',
  '{"options": ["Tarımsal üretimde insan gücü açığı oluşması", "Ülkenin Ar-Ge, inovasyon ve teknolojik kalkınma hızının sekteye uğraması", "Kırsal nüfus oranının aniden artış göstermesi", "Ülkede kadın nüfusunun erkek nüfustan fazla çıkması", "Ulusal saat uygulamasının aksaması"], "correctIndex": 1}'::jsonb,
  'Beyin göçü bir ülkenin en yetenekli zihinlerini ve yetiştirdiği sermayeyi kaybetmesidir. Bu kayıp teknolojik inovasyon, tıp ve katma değerli sanayi üretiminde ülkeyi dışa bağımlı kılar.',
  'Beyin göçü fiziksel kas gücü açığı yaratmaz; zihinsel ve teknolojik kalkınma kapasitesini zayıflatır.'
);

-- Soru #059 (Türkiye'de Nüfus ve Yerleşme)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Türkiye''de nüfus artış hızının çok yüksek olduğu gelişmekte olan yörelerde devlete binen okul, hastane, altyapı ve konut gibi yatırımlara ''Demografik Yatırımlar'' denir.

Bir bölgede demografik yatırımların bütçeden çok büyük pay almasının kalkınma üzerindeki etkisi nedir?',
  '{"options": ["Tasarrufların ve doğrudan sanayiye dönük üretken yatırımların azalması nedeniyle ekonomik büyüme hızını yavaşlatması", "Bölgenin ihracat gelirlerini rekor seviyede artırması", "Nüfus artış hızını aniden sıfırlaması", "Bölgeye gelen yabancı turist sayısını katlaması", "Doğal kaynakların tamamen tükenmesini engellemesi"], "correctIndex": 0}'::jsonb,
  'Demografik yatırımlar hızlı nüfus artışının temel ihtiyaçlarını (ilave sınıflar, sağlık ocakları) karşılamak için yapılır; doğrudan gelir ve fabrika üretmez. Bu yüzden sermaye tüketime gider ve kişi başına düşen milli gelir artışı yavaşlar.',
  'Demografik yatırımların çok olması bir başarı göstergesi değil, yüksek nüfus artışının sermayeyi tüketici alanlara bağladığının göstergesidir.'
);

-- Soru #060 (Türkiye'de Nüfus ve Yerleşme)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Aşağıdaki şehirlerden hangisi gelişimini tarım ve sanayiden ziyade tamamen ''idari ve siyasi'' fonksiyonuna borçludur?',
  '{"options": ["Ankara", "Gaziantep", "Kocaeli", "Denizli", "İskenderun"], "correctIndex": 0}'::jsonb,
  'Ankara 1923 yılında başkent ilan edilene kadar İç Anadolu''da küçük bir kasaba görünümündeydi. Başkent olmasıyla birlikte bürokrasi, bakanlıklar, elçilikler ve kamu yatırımlarıyla Türkiye''nin 2. büyük metropolü haline gelmiştir.',
  'Ankara tipik bir ''idari fonksiyonlu'' şehirdir.'
);

-- Soru #061 (Türkiye'de Tarım ve Hayvancılık)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Türkiye tarımında kurak ve yarı kurak bölgelerde toprağın bir yıl ekilip bir yıl boş bırakılmasına ''nadas'' yöntemi denir.

Nadas alanlarının geniş yer kaplaması aşağıdakilerden hangisinin yetersiz olduğunu kanıtlar ve hangi çevre sorununu şiddetlendirir?',
  '{"options": ["Sulama imkanlarının yetersiz olduğunu — Rüzgar ve su erozyonunu", "Tohum ıslahının yetersiz olduğunu — Orman yangınlarını", "Makineleşmenin yetersiz olduğunu — Heyelanları", "Gübrelemenin yetersiz olduğunu — Asit yağmurlarını", "İlaçlamanın yetersiz olduğunu — Çığ felaketlerini"], "correctIndex": 0}'::jsonb,
  'Nadas tamamen su yetersizliğinden (toprağın bir yıl dinlenip nem biriktirmesi amacıyla) yapılır. Boş bırakılan toprak örtüsüz kaldığı için rüzgar ve sel suları toprağın en verimli üst katmanını süpürerek şiddetli erozyona yol açar. Sulama geliştikçe nadas biter.',
  'Nadas erozyonu tetikler. Nadası bitirmenin yolu sulama ve nöbetleşe ekimdir (münavebe).'
);

-- Soru #062 (Türkiye'de Tarım ve Hayvancılık)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Türkiye''de bazı tarım ürünleri iklim şartlarına karşı çok seçicidir ve yalnızca belirli mikroklimalarda ya da özel iklim kuşaklarında yetişebilir.

Aşağıdaki tarım ürünlerinden hangisinin yetişme alanı Türkiye''de en dardır?',
  '{"options": ["Çavdar", "Elma", "Muz", "Üzüm", "Buğday"], "correctIndex": 2}'::jsonb,
  'Muz tropikal bir üründür ve don olayına karşı aşırı hassastır. Türkiye''de yalnızca kış ılıklığının garanti olduğu Anamur, Alanya ve Gazipaşa kıyı şeridinde açıkta yetişebilir. Elma ve üzüm ise soğuğa dayanıklı olup Türkiye''nin hemen her yerinde yetişir.',
  'Muz ve çay Türkiye''de ekim alanı en dar ve en seçici ürünlerdir.'
);

-- Soru #063 (Türkiye'de Tarım ve Hayvancılık)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Türkiye''de bazı ürünlerin ekimi devlet kontrolü altındadır. Bu kontrol farklı ürünlerde halk sağlığı, uyuşturucu ile mücadele ya da kalite korunması gibi farklı gerekçelere dayanır.

Aşağıdaki ürünlerden hangisinin ekim alanlarının sınırlandırılmasında ''sıtma hastalığına yol açan sivrisineklerin yerleşim yerlerinde çoğalmasını engelleme'' gerekçesi rol oynar?',
  '{"options": ["Tütün", "Haşhaş", "Pirinç (Çeltik)", "Kenevir", "Şeker pancarı"], "correctIndex": 2}'::jsonb,
  'Pirinç (çeltik) bataklık ve sürekli su altında olan tarlalarda yetiştirilir. Durgun sular anofel cinsi sıtma sivrisineklerinin üreme alanıdır. Bu yüzden Çeltik Kanunu uyarınca şehir ve köy yerleşim yerlerinin yakınına pirinç ekilmesi yasaktır.',
  'Haşhaş ve kenevir uyuşturucu; tütün kalite kontrolü; şeker pancarı fabrika kapasitesi/kota; pirinç ise sıtma hastalığı nedeniyle devlet kontrolündedir.'
);

-- Soru #064 (Türkiye'de Tarım ve Hayvancılık)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Güneydoğu Anadolu Projesi (GAP) ile birlikte Fırat ve Dicle nehirlerinin suları Şanlıurfa ve Harran ovalarına ulaştırılmıştır.

Sulamanın başlamasıyla birlikte Güneydoğu Anadolu Bölgesi aşağıdaki tarım ürünlerinden hangisinin üretiminde Ege ve Akdeniz''i geride bırakarak Türkiye 1.si olmuştur?',
  '{"options": ["Pamuk", "Tütün", "Zeytin", "Fındık", "Çay"], "correctIndex": 0}'::jsonb,
  'GAP öncesi pamuk üretiminde Ege ve Çukurova liderdi. Şanlıurfa Tünelleri ile ovalara su verilince pamuk ekim alanı patlama yapmış ve Güneydoğu Anadolu Türkiye pamuk üretiminin yarıdan fazlasını tek başına karşılayarak 1. sıraya yerleşmiştir.',
  'ÖSYM GAP''ın tarım üzerindeki en somut sonucunu PAMUK ve MISIR üretimi üzerinden sıkça sorgular.'
);

-- Soru #065 (Türkiye'de Tarım ve Hayvancılık)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Şeker pancarı hasat edildikten sonra çok kısa sürede şeker oranını kaybettiği ve çürümeye başladığı için tarladan toplanır toplanmaz işlenmek zorundadır.

Bu durum şeker fabrikalarının yer seçiminde aşağıdakilerden hangisini zorunlu kılmıştır?',
  '{"options": ["Fabrikaların enerji santrallerinin yanına kurulmasını", "Fabrikaların doğrudan ekim alanlarının hemen yakınına kurulmasını", "Fabrikaların yalnızca liman şehirlerinde açılmasını", "Fabrikaların demiryolu kavşaklarında toplanmasını", "Fabrikaların sadece serbest bölgelerde inşa edilmesini"], "correctIndex": 1}'::jsonb,
  'Şeker pancarı çabuk bozulduğu için hammaddeye bağımlılığı en yüksek sanayi koludur; fabrikalar daima ekim alanlarının dibine kurulur. Ayrıca pancar küspesi harika bir hayvan yemidir; bu yüzden şeker fabrikalarının etrafında besi hayvancılığı gelişir.',
  'Şeker fabrikaları hammaddeye yakınlık ilkesinin Türkiye''deki 1 numaralı örneğidir.'
);

-- Soru #066 (Türkiye'de Tarım ve Hayvancılık)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Türkiye''de kıyı bölgelerimizde (Ege, Akdeniz) şeker pancarı tarımı iklimsel olarak rahatlıkla yapılabilmesine rağmen, bu kıyılarda şeker pancarı ekimi yok denecek kadar azdır.

Kıyı bölgelerimizin çiftçilerinin şeker pancarı yerine pamuk, sebze, meyve ve turunçgil ekmeyi tercih etmelerinin temel nedeni nedir?',
  '{"options": ["Kıyı topraklarının tuzlu olması", "Şeker pancarının kıyılarda hiç yetişememesi", "Alternatif ürünlerin (sebze, meyve, pamuk) ekonomik getirisinin ve kârlılığının çok daha yüksek olması", "Kıyılarda şeker fabrikası kurmanın yasak olması", "Kıyılarda hayvan yetiştiriciliğinin hiç yapılmaması"], "correctIndex": 2}'::jsonb,
  'Şeker pancarı kıyıda çok güzel yetişir; ancak Akdeniz ve Ege çiftçisi dönüm başına servet kazandıran muz, narenciye, seracılık veya pamuk varken daha düşük getirili olan şeker pancarını ekmez. Bu tamamen ekonomik rasyonelliktir.',
  'Adaylar ''iklim uygun değil'' diye düşünebilir. İklim uygundur ama ekonomik getiri düşüktür.'
);

-- Soru #067 (Türkiye'de Tarım ve Hayvancılık)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Doğal bitki örtüsü ile hayvancılık türleri arasında doğrudan bir paralellik vardır.

İlkbaharda yeşerip yaz kuraklığıyla sararan kısa boylu bozkır (step) ot topluluklarının yaygın olduğu İç Anadolu ve Doğu Anadolu platolarında en yaygın yapılan hayvancılık faaliyeti hangisidir?',
  '{"options": ["Küçükbaş (Koyun) Hayvancılığı", "Büyükbaş (Sığır) Mera Hayvancılığı", "İpek Böcekçiliği", "Kültür Balıkçılığı", "Besi ve Ahır Hayvancılığı"], "correctIndex": 0}'::jsonb,
  'Bozkırın cılız otları küçükbaş hayvanların (özellikle koyunun) beslenmesi için idealdir. Bu yüzden bozkır kuşağında milyonlarca küçükbaş hayvan yetiştirilir.',
  'Bozkır = Küçükbaş/Koyun; Dağ Çayırı = Büyükbaş Mera (Erzurum-Kars); Maki/Çalı = Kıl Keçisi (Toroslar).'
);

-- Soru #068 (Türkiye'de Tarım ve Hayvancılık)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Toros Dağları''nın engebeli ve kayalık yamaçlarında, maki ve çalı örtüsünün yaygın olduğu Akdeniz Bölgesi''nde yetiştirilen, ormanlara ve fidanlara zarar verdiği gerekçesiyle sayısı devlet tarafından kontrol altında tutulan hayvan türü hangisidir?',
  '{"options": ["Kıl Keçisi", "Tiftik Keçisi", "Merinos Koyunu", "Manda", "Kıvırcık Koyun"], "correctIndex": 0}'::jsonb,
  'Kıl keçisi kayalık ve sarp arazilere tırmanma yeteneğiyle bilinir, maki ve çalılarla beslenir. Özellikle Teke ve Taşeli platolarında Yörükler tarafından yetiştirilir. Ağaç sürgünlerini yiyip ormana zarar verdiği için orman alanlarında otlatılması kısıtlanmıştır.',
  'Tiftik keçisi İç Anadolu''da (Ankara) tiftik yünü için beslenir; Toros kayalıklarında yaşayan ise kıl keçisidir.'
);

-- Soru #069 (Türkiye'de Tarım ve Hayvancılık)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Besi ve ahır hayvancılığı modern yöntemlerle, kapalı tesislerde fenni yemlerle yapılan hayvancılıktır.

Besi hayvancılığının mera hayvancılığına göre en büyük avantajı ve yoğunlaştığı yerlerin temel özelliği aşağıdakilerden hangisinde doğru verilmiştir?',
  '{"options": ["İklim ve otlak koşullarından bağımsız olması, et-süt veriminin yüksek olması — Büyük tüketim merkezlerine (metropollere) yakınlık", "Yem maliyetinin sıfır olması — Yüksek dağ platoları", "Sadece kış aylarında yapılabilmesi — Karadeniz kıyıları", "Tamamen ihraç edilmesi — Sınır kapılarına yakınlık", "Devlet teşvikinin olmaması — Karstik sahalar"], "correctIndex": 0}'::jsonb,
  'Besi ve ahır hayvancılığında hayvan dışarı çıkmaz, suni yem yer; bu yüzden kuraklıktan etkilenmez ve verim devasadır. İstanbul, İzmir, Ankara, Bursa gibi dev nüfuslu metropollerin et-süt talebini karşılamak için Marmara ve Ege''de kurulur.',
  'Mera hayvancılığı iklime bağımlıdır (yağış azalırsa et-süt çöker); Besi hayvancılığı iklimden tamamen bağımsızdır.'
);

-- Soru #070 (Türkiye'de Tarım ve Hayvancılık)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Türkiye''de yağ bitkileri üretimi son yıllarda sanayinin gelişmesiyle büyük önem kazanmıştır.

Türkiye ayçiçeği üretiminin yaklaşık yarısını tek başına karşılayan ve ''ayçiçeği deposu'' olarak bilinen coğrafi alanımız hangisidir?',
  '{"options": ["Ergene Havzası (Trakya)", "Gediz Ovası", "Çukurova", "Iğdır Ovası", "Bafra Deltası"], "correctIndex": 0}'::jsonb,
  'Tekirdağ, Edirne ve Kırklareli illerini kapsayan Trakya / Ergene Havzası Türkiye ayçiçeği üretiminin merkezidir. Vertisol topraklar ayçiçeği için çok elverişlidir.',
  'Ayçiçeği = Trakya (Tekirdağ/Edirne); Zeytin = Ege; Mısır ve Soya = Akdeniz ve Güneydoğu.'
);

-- Soru #071 (Türkiye'de Tarım ve Hayvancılık)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Türkiye zengin bitki örtüsü ve farklı çiçeklenme dönemleri sayesinde dünya arıcılık ve bal üretiminde ilk sıralarda yer alır.

Aşağıdaki yörelerden hangisi çam ormanlarında yaşayan basra böceğinin salgısıyla üretilen dünyaca ünlü ''Çam Balı'' üretiminin Türkiye''deki merkezidir?',
  '{"options": ["Muğla — Menteşe Yöresi", "Konya — Cihanbeyli", "Edirne — Meriç Deltası", "Şanlıurfa — Harran Ovası", "Kars — Sarıkamış"], "correctIndex": 0}'::jsonb,
  'Türkiye dünya çam balı üretiminin yaklaşık %90''ını tek başına karşılar ve bu üretimin kalbi Muğla (Menteşe Yöresi) kızılçam ormanlarıdır. Çiçek balında ise Ordu, Rize (Anzer) ve Doğu Anadolu öne çıkar.',
  'Çam balı denince akla Muğla/Ege gelir; Yayla/çiçek balı denince Doğu Karadeniz ve Doğu Anadolu gelir.'
);

-- Soru #072 (Türkiye'de Tarım ve Hayvancılık)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Kümes hayvancılığı (tavuk, hindi, yumurta) üretim tesisleri incelendiğinde; tesislerin Manisa, Bolu, Balıkesir, Sakarya ve İzmir gibi illerde yoğunlaştığı görülür.

Kümes hayvancılığı tesislerinin yer seçiminde rol oynayan temel faktör nedir?',
  '{"options": ["Büyük tüketim pazarlarına (metropollere) yakınlık ve pazarlama kolaylığı", "Bölgenin doğal orman örtüsünün tavuklar için uygun olması", "İklim koşullarının ılıman geçmesi zorunluluğu", "Tesislerin sadece kıyı kesimlerde ruhsat alabilmesi", "Tavukların açık alanda yayılması gerekliliği"], "correctIndex": 0}'::jsonb,
  'Kümes hayvancılığı tamamen kapalı, klimalı ve otomatik entegre tesislerde yapılır. İklimle ve yer şekilleriyle hiçbir ilgisi yoktur; tek kriter İstanbul, İzmir, Ankara gibi dev pazarlara hızla taze bozulmadan ulaştırma (pazara yakınlık) gereğidir.',
  'Adaylar ''Bolu''da tavuk çok, o zaman Bolu''nun doğası uygundur'' diyebilir; hayır, Bolu İstanbul ile Ankara''nın tam ortasında stratejik pazar kavşağındadır.'
);

-- Soru #073 (Türkiye'de Tarım ve Hayvancılık)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Türkiye denizlerinde yapılan balıkçılık faaliyetleri incelendiğinde, toplam avlanan balık miktarının yaklaşık %70-80''i tek başına Karadeniz''den sağlanmaktadır.

Karadeniz''in balık miktarı bakımından diğer denizlerimize göre ezici bir üstünlüğe sahip olmasının temel gerekçesi nedir?',
  '{"options": ["Suyun daha soğuk olması, oksijen miktarının ve plankton (balık yemi) zenginliğinin çok yüksek olması", "Karadeniz''de dalga boyunun Akdeniz''den küçük olması", "Karadeniz''in tabanında 200 metreden sonra hidrojen sülfür gazı bulunması", "Karadeniz kıyılarında liman sayısının daha az olması", "Akdeniz''de avlanma yasağının tüm yıla yayılması"], "correctIndex": 0}'::jsonb,
  'Karadeniz''e dökülen dev nehirler bol organik madde ve tatlı su taşır, soğuk su oksijeni daha fazla tutar ve muazzam bir plankton zenginliği yaratır. Bu yüzden balık sürüleri (hamsi, istavrit) Karadeniz''de çok yoğundur.',
  'Dikkat: Karadeniz''de 200 metrenin altında zehirli gaz vardır, dipte balık yaşamaz; ama yüzeydeki oksijen ve plankton balık miktarını zirveye taşır.'
);

-- Soru #074 (Türkiye'de Tarım ve Hayvancılık)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Seracılık kış sıcaklıklarının sıfırın altına düşmediği, don olaylarının yaşanmadığı ve güneşlenme süresinin uzun olduğu kıyılarda yapılır.

Buna göre Türkiye''de jeotermal (sıcak su) kaynaklarının kullanıldığı seralar hariç tutulduğunda, geleneksel seracılığın en yaygın olduğu ve hiç yapılamadığı bölgeler hangisinde doğru eşleştirilmiştir?',
  '{"options": ["En yaygın: Akdeniz — Yapılamayan: Doğu Anadolu", "En yaygın: İç Anadolu — Yapılamayan: Ege", "En yaygın: Karadeniz — Yapılamayan: Marmara", "En yaygın: Marmara — Yapılamayan: Akdeniz", "En yaygın: Güneydoğu — Yapılamayan: Ege"], "correctIndex": 0}'::jsonb,
  'Akdeniz kıyıları (Antalya, Mersin) kış ılıklığı ve bol güneşlenme ile seracılığın başkentidir (ısıtma maliyeti çok düşüktür). Doğu Anadolu''da ise kışın sıcaklık -30°C''lere iner; serayı ısıtmak için harcanacak yakıt seranın gelirini katbekat aşacağı için ekonomik olarak yapılamaz.',
  'Jeotermal seracılık son yıllarda Afyon, İzmir, Denizli ve Şanlıurfa''da gelişmiştir ancak geleneksel seracılık Akdeniz''dedir.'
);

-- Soru #075 (Türkiye'de Tarım ve Hayvancılık)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Türkiye''nin orman varlığı incelendiğinde; orman alanlarının yaklaşık %25''i Karadeniz''de, %24''ü Akdeniz''de yer alır. Buna karşılık Güneydoğu Anadolu Bölgesi orman varlığı bakımından Türkiye''nin en fakir (%3 civarı) bölgesidir.

Güneydoğu Anadolu''nun İç Anadolu''dan daha fazla yağış almasına rağmen orman varlığının çok daha az olmasının temel nedeni nedir?',
  '{"options": ["Şiddetli yaz kuraklığı ve aşırı sıcaklıkların yol açtığı şiddetli buharlaşma", "Bölgede akarsu ağının hiç bulunmaması", "Bölge arazisinin tamamen dağlık ve sarp olması", "Bölge topraklarının tamamen çorak tuz bataklıklarından oluşması", "Bölgede sadece küçükbaş hayvancılık yapılması"], "correctIndex": 0}'::jsonb,
  'Güneydoğu Anadolu İç Anadolu''dan daha çok yağış alır (yıllık 500-600 mm). Ancak güneyden gelen Samyeli çöl rüzgarları ve aşırı sıcaklıklar nedeniyle buharlaşma o kadar korkunçtur ki düşen yağış anında uçar. Toprak nemi kalmadığı için orman yetişemez.',
  'ÖSYM''nin en meşhur çeldiricisi: ''Güneydoğu en az yağış alan yer değildir; ama kuraklığın ve buharlaşmanın en şiddetli olduğu yerdir''.'
);

-- Soru #076 (Türkiye'de Tarım ve Hayvancılık)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Soğuğa ve don olaylarına karşı en dayanıksız tarım ürünlerinden olan turunçgiller (portakal, mandalina, limon, greyfurt) en çok Akdeniz kıyılarında üretilir.

Ege Bölgesi''nde kıyıdan iç kesimlere gidildikçe turunçgil tarımının aniden ortadan kalkmasının nedeni nedir?',
  '{"options": ["Karasallığın ve kış don olaylarının başlaması", "Sulama imkanlarının iç kesimlerde bulunmaması", "İç kesimlerde fabrikaların yasaklanması", "İç kesim topraklarının verimsizleşmesi", "İç kesimlerde rüzgar erozyonunun olması"], "correctIndex": 0}'::jsonb,
  'Turunçgiller 0°C''nin altındaki sıcaklıklara dayanamaz ve meyveleri donar. Ege kıyılarında deniz etkisiyle kışlar ılıktır; ancak iç kesimlere (Uşak, Afyon) gidildikçe yükselti artar, donlu gün sayısı başlar ve turunçgil yaşayamaz.',
  'Turunçgiller eşittir ''kış ılıklığı'' şartıdır.'
);

-- Soru #077 (Türkiye'de Tarım ve Hayvancılık)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Türkiye incir ve kuru üzüm üretiminde dünya lideridir. İncir kış ılıklığı isterken, üzüm ise -30°C soğuğa kadar dayanabilir ve Türkiye''nin hemen hemen her bölgesinde yetişir.

Türkiye''de kuru incir üretiminin yaklaşık %70''ini tek başına karşılayan tarım havzamız hangisidir?',
  '{"options": ["Aydın — Büyük Menderes Havzası", "Adana — Çukurova", "Konya Ovası", "Trabzon — Değirmendere", "Edirne — Meriç Vadisi"], "correctIndex": 0}'::jsonb,
  'Aydın ve Büyük Menderes Havzası dünyanın en kaliteli incirlerinin yetiştirildiği yerdir. İncir soğuğa dayanamaz ve hasat döneminde yağış istemez.',
  'Kuru incir = Aydın; Kuru üzüm = Manisa (Gediz Havzası).'
);

-- Soru #078 (Türkiye'de Tarım ve Hayvancılık)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Mısır doğal yetişme koşulları gereği nemli ve bol su isteyen bir bitkidir. Doğal olarak en uygun yetişme ortamı Karadeniz kıyılarıdır.

Buna rağmen Türkiye mısır üretiminde Akdeniz (Çukurova) ve Güneydoğu Anadolu''nun (GAP sahası) Karadeniz''i açık ara geride bırakmasının temel nedeni nedir?',
  '{"options": ["Gelişmiş sulama sistemleri sayesinde birim alandan alınan verimin çok yüksek olması ve sanayide (yağ, yem) ticari talep görmesi", "Karadeniz''de mısır üretiminin yasaklanması", "Mısırın sadece sıcak çöl havasında tane tutabilmesi", "Güneydoğu''da işgücünün bulunmaması", "Akdeniz''de mısırın gübresiz yetişebilmesi"], "correctIndex": 0}'::jsonb,
  'Mısır Karadeniz''de halkın temel besin maddesidir ve ticari amaçla satılmaz. Akdeniz ve Güneydoğu''da ise sulama ve gübreleme ile dönüm başına rekor verim alınır, yılda iki ürün hasat edilir ve doğrudan sanayiye (mısırözü yağı ve hayvan yemi) satılır.',
  'Doğal yetişme ortamı Karadeniz''dir ama üretim şampiyonu Akdeniz ve Güneydoğu''dur.'
);

-- Soru #079 (Türkiye'de Tarım ve Hayvancılık)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Konya Ovası''nda aşırı yeraltı suyu kullanımı nedeniyle yeraltı su seviyesi onlarca metre çekilmiş ve zeminde derin çöküntüler (obruklar) oluşmaya başlamıştır.

Bu sorunu çözmek ve Konya Ovası''nı sulamak amacıyla Göksu Nehri''nin sularını Mavi Tünel ile ovaya aktaran devasa kalkınma projesi hangisidir?',
  '{"options": ["KOP (Konya Ovası Projesi)", "GAP (Güneydoğu Anadolu Projesi)", "DOKAP (Doğu Karadeniz Projesi)", "ZBK (Zonguldak-Bartın-Karabük)", "Yeşilırmak Havzası Gelişim Projesi"], "correctIndex": 0}'::jsonb,
  'KOP (Konya Ovası Projesi), Göksu Nehri''nin Akdeniz''e boşa akan sularını Mavi Tünel ile Konya Kapalı Havzası''na bağlayarak kuraklığı önlemeyi ve obruk oluşumlarını durdurmayı hedefler.',
  'Göksu Nehri + Mavi Tünel = KOP projesidir.'
);

-- Soru #080 (Türkiye'de Tarım ve Hayvancılık)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Türkiye''de Tarım ve Hayvancılık',
  'multiple_choice',
  2,
  'Türkiye''de yaş koza üretimi ve ipek böcekçiliği geleneksel olarak Bursa ile anılmasına rağmen son yıllarda yapay sentetik ipliklerin yaygınlaşmasıyla geleneksel merkezler gerilemiştir.

Günümüzde Türkiye''de yaş ipek böceği kozası üretiminde 1. sıraya yükselen ilimiz aşağıdakilerden hangisidir?',
  '{"options": ["Diyarbakır", "Bursa", "Bilecik", "Edirne", "Rize"], "correctIndex": 0}'::jsonb,
  'TÜİK verilerine göre Türkiye''de yaş ipek böceği kozası üretiminde 1. il Diyarbakır''dır (Kulp ilçesi). Antalya ve Batman da önemli üreticilerdendir. Bursa ise tarihi ününe rağmen ham koza üretiminde gerilemiştir.',
  'ÖSYM''nin en sevdiği güncel tarım tuzağı: ''İpek böcekçiliği Bursa''dadır'' algısı. Tarihi olarak Bursa''dır ama yaş koza üretim şampiyonu Diyarbakır''dır.'
);

-- Soru #081 (Madenler ve Enerji Kaynakları)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Dünya toplam bor rezervlerinin yaklaşık %73''ü Türkiye''de bulunmaktadır. Jet ve roket yakıtı, cam, seramik, deterjan ve nükleer sanayide kullanılan bu stratejik maden ülkemizin milli değeridir.

Aşağıdakilerden hangisi Türkiye''de bor madeninin çıkarıldığı havzalardan biri değildir?',
  '{"options": ["Balıkesir — Susurluk ve Bigadiç", "Bursa — Mustafakemalpaşa", "Kütahya — Emet", "Eskişehir — Seyitgazi (Kırka)", "Artvin — Murgul"], "correctIndex": 4}'::jsonb,
  'Bor madeni Güney Marmara ve İç Anadolu kuşağında (Balıkesir, Bursa, Kütahya, Eskişehir) çıkarılır ve Bandırma ile Kırka''daki bor asit fabrikalarında işlenir. Artvin Murgul ise Türkiye''nin en büyük BAKIR madeni sahalarından biridir.',
  'Bor sahaları: 4B kuralı (Balıkesir, Bursa, Kütahya, Eskişehir). Murgul ise bakırdır.'
);

-- Soru #082 (Madenler ve Enerji Kaynakları)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Türkiye''de demir madeni Sivas (Divriği) ve Malatya (Hekimhan, Hasançelebi) gibi Doğu Anadolu sahalarından çıkarılmaktadır.

Buna karşılık Türkiye''nin en büyük demir-çelik fabrikalarının Zonguldak Karabük ve Ereğli''de kurulmasının temel nedeni aşağıdakilerden hangisidir?',
  '{"options": ["Taş kömürü yataklarına (enerji kaynağına) yakınlık", "Bölgede zengin demir yataklarının bulunması", "Karadeniz''de demir tüketiminin çok yüksek olması", "Bölgenin deprem riskinin sıfır olması", "İşgücü maliyetlerinin çok düşük olması"], "correctIndex": 0}'::jsonb,
  '1 ton demiri eritmek için yüksek kalorili taş kömürüne ihtiyaç vardır. Karadeniz''de demir madeni yoktur; demir Sivas''tan vagonlarla taşınır. Buradaki kuruluş faktörü tamamen ENERJİ KAYNAĞINA (taş kömürüne) yakınlıktır.',
  'Karabük ve Ereğli = Enerji kaynağına yakınlık; İskenderun Demir-Çelik = Ulaşım ve liman kolaylığı.'
);

-- Soru #083 (Madenler ve Enerji Kaynakları)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Bakır madeni elektrik ve elektronik sanayisinin temel iletken maddesidir. Türkiye''de Artvin (Murgul), Rize (Çayeli) ve Kastamonu (Küre) çıkarım merkezleridir.

Samsun''da bakır madeni çıkarılmamasına rağmen, Türkiye''nin en büyük Karadeniz Bakır İşletmesi''nin Samsun''da kurulmasının nedeni nedir?',
  '{"options": ["Gelişmiş bir limana sahip olması ve iç bölgelerle demiryolu ulaşımının kolay olması", "Samsun''da hidroelektrik enerjinin bedava olması", "Samsun''un en az yağış alan yer olması", "Bakır tüketen fabrikaların tamamının Samsun''da olması", "Kentin serbest bölge ilan edilmesi"], "correctIndex": 0}'::jsonb,
  'Samsun limanı ve demiryolu hinterlandı sayesinde Murgul ve Küre''den getirilen bakır cevherini işleyip deniz yoluyla sevk etmek için en elverişli lojistik merkezdir. Kuruluş nedeni ULAŞIM VE LİMAN''dır.',
  'Samsun Bakır Fabrikası = Ulaşım/Liman; Küre ve Murgul = Hammadde.'
);

-- Soru #084 (Madenler ve Enerji Kaynakları)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Paslanmaz çelik yapımında, denizaltı, uçak ve zırh sanayisinde çeliğe sertlik ve dayanıklılık kazandırmak için kullanılan, Elazığ Guleman ve Muğla Fethiye''de zengin yatakları bulunan maden hangisidir?',
  '{"options": ["Krom", "Boksit", "Bor", "Linyit", "Kükürt"], "correctIndex": 0}'::jsonb,
  'Krom çeliği paslanmaz ve kırılmaz kılan en stratejik metaldir. Türkiye krom ihracatında dünyada ilk sıralardadır. İşlendiği tesisler Elazığ (hammaddeye yakın) ve Antalya (limana yakın) Ferro-Krom fabrikalarıdır.',
  'Paslanmaz çelik + Elazığ Guleman + Fethiye = KROM.'
);

-- Soru #085 (Madenler ve Enerji Kaynakları)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Hafif ve dayanıklı olması nedeniyle uçak ve otomotiv sanayisinde yaygın kullanılan alüminyumun hammaddesi olan ''Boksit'' madeni Türkiye''de çıkarıldığı yerde işlenir.

Türkiye''de boksit madeninin çıkarıldığı ve entegre Alüminyum Tesisleri''nin bulunduğu merkez neresidir?',
  '{"options": ["Konya — Seydişehir", "Batman — Kozluk", "Sivas — Divriği", "Kütahya — Emet", "Balıkesir — Susurluk"], "correctIndex": 0}'::jsonb,
  'Seydişehir (Konya) Türkiye''nin boksit ve alüminyum başkentidir; Akseki (Antalya) boksitleri de burada işlenir.',
  'Alüminyum = Boksit = Seydişehir.'
);

-- Soru #086 (Madenler ve Enerji Kaynakları)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  '1. Jeolojik zamanda (Paleozoik) oluşmuş yüksek kalorili bir kömür türü olan taş kömürü Türkiye''de sadece Zonguldak ve çevresinde dar bir alanda bulunur.

Türkiye''de taş kömürü ile çalışan ve deniz suyuyla soğutulan ilk ve en eski termik santralimiz hangisidir?',
  '{"options": ["Çatalağzı Termik Santrali", "Afşin-Elbistan Termik Santrali", "Hamitabat Termik Santrali", "Yatağan Termik Santrali", "Soma Termik Santrali"], "correctIndex": 0}'::jsonb,
  'Zonguldak''ta yer alan Çatalağzı Termik Santrali Türkiye''nin taş kömürü ile çalışan tek büyük santralidir. Soma, Yatağan ve Afşin-Elbistan ise linyitle çalışır.',
  'Taş kömürüyle çalışan = Çatalağzı; Doğalgazla çalışan = Hamitabat; Linyitle çalışan = Soma/Afşin.'
);

-- Soru #087 (Madenler ve Enerji Kaynakları)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Türkiye 3. Jeolojik zamanda (Tersiyer) toptan yükseldiği için linyit kömürü yatakları ülkenin hemen hemen her bölgesine yayılmıştır.

Türkiye''nin linyit rezervi bakımından en zengin havzası olan ve üzerinde devasa termik santrallerin kurulu olduğu linyit sahamız neresidir?',
  '{"options": ["Kahramanmaraş — Afşin-Elbistan", "Manisa — Soma", "Kütahya — Tunçbilek", "Muğla — Yatağan", "Bursa — Orhaneli"], "correctIndex": 0}'::jsonb,
  'Afşin-Elbistan Havzası (Kahramanmaraş) Türkiye linyit rezervlerinin yaklaşık yarısına sahiptir ve A-B termik santralleriyle dev bir elektrik üretim üssüdür.',
  'En büyük linyit rezervi Afşin-Elbistan''dadır.'
);

-- Soru #088 (Madenler ve Enerji Kaynakları)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Türkiye''de çıkarılan petrol ulusal ihtiyacımızın yalnızca %8-10''luk kısmını karşılamakta, kalan kısım ithal edilmektedir. İthal ve yerli petrol rafinerilerde işlenir.

Aşağıdaki petrol rafinerilerinden hangisinin kuruluş yeri doğrudan ''hammaddeye yakınlık'' ilkesine dayanır?',
  '{"options": ["Batman Rafinerisi", "Tüpraş İzmit Rafinerisi", "İzmir Aliağa Rafinerisi", "Kırıkkale Orta Anadolu Rafinerisi", "Star Rafinerisi (İzmir)"], "correctIndex": 0}'::jsonb,
  'Batman Rafinerisi Raman ve Garzan petrol kuyularının hemen yanına kurulmuştur (hammaddeye yakın). Aliağa ve İzmit liman ve pazara yakın, Kırıkkale ise stratejik iç bölge güvenliği ve tüketim merkezlerine boru hattıyla bağlıdır.',
  'Hammaddeye yakın tek rafineri Batman Rafinerisi''dir; diğerleri ithal petrole ve pazara yakındır.'
);

-- Soru #089 (Madenler ve Enerji Kaynakları)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Doğalgaz çevre kirliliği az ve verimi yüksek bir enerji kaynağıdır. Türkiye doğalgaz ihtiyacının büyük bölümünü Rusya, Azerbaycan ve İran''dan boru hatlarıyla ve LNG gemileriyle karşılar.

Türkiye sınırları içerisinde doğalgaz çıkarılan yerli sahalarımız arasında aşağıdakilerden hangisi yer almaz?',
  '{"options": ["Kırklareli — Hamitabat", "Tekirdağ — Hayrabolu", "Mardin — Çamurlu", "Karadeniz — Sakarya Gaz Sahası", "Artvin — Murgul"], "correctIndex": 4}'::jsonb,
  'Murgul''da bakır madeni vardır, doğalgaz bulunmaz. Trakya''da Hamitabat ve Hayrabolu, Güneydoğu''da Mardin Çamurlu ve Karadeniz Filyos açıklarındaki Sakarya Gaz Sahası yerli doğalgaz üretim merkezlerimizdir.',
  'Trakya (Hamitabat) + Mardin (Çamurlu) + Karadeniz (Sakarya) = Doğalgaz çıkarım alanları.'
);

-- Soru #090 (Madenler ve Enerji Kaynakları)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Yer kabuğunun kırıklı (fay) hatları boyunca yer altına sızan suların magmaya yaklaşarak ısınıp yüzeye buhar şeklinde çıkmasıyla jeotermal enerji elde edilir.

Türkiye''nin ilk jeotermal elektrik santralinin kurulduğu ve günümüzde jeotermal enerjinin elektrik, konut ve sera ısıtmasında en yoğun kullanıldığı bölgemiz hangisidir?',
  '{"options": ["Ege Bölgesi (Denizli — Sarayköy / Aydın — Germencik)", "Güneydoğu Anadolu Bölgesi", "Karadeniz Bölgesi", "Doğu Anadolu Bölgesi", "İç Anadolu Bölgesi"], "correctIndex": 0}'::jsonb,
  'Ege Bölgesi aktif graben fay hatlarıyla parçalandığı için jeotermal kaynaklar bakımından Türkiye''nin 1 numarasıdır. İlk santral Denizli Sarayköy''dedir, Aydın Germencik ise devasa jeotermal santrallere ev sahipliği yapar.',
  'Jeotermal enerji = Fay hatları = Ege (Denizli/Aydın).'
);

-- Soru #091 (Madenler ve Enerji Kaynakları)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Türkiye''de rüzgar enerjisi potansiyeli en yüksek olan coğrafi alanlarımız Ege ve Güney Marmara kıyılarıdır.

Türkiye''nin İLK rüzgar enerjisi santrali (RES) nerede faaliyete geçmiştir?',
  '{"options": ["İzmir — Çeşme (Alaçatı)", "Balıkesir — Bandırma", "Çanakkale — Bozcaada", "Manisa — Soma", "Hatay — Belen"], "correctIndex": 0}'::jsonb,
  'Türkiye''nin ilk rüzgar enerji santrali 1998 yılında İzmir Çeşme Alaçatı''da kurulmuştur. Günümüzde Balıkesir, İzmir, Çanakkale ve Manisa en çok rüzgar enerjisi üreten illerimizdir.',
  'İlk RES = İzmir Alaçatı.'
);

-- Soru #092 (Madenler ve Enerji Kaynakları)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Güneş enerjisi santralleri (GES) geniş ve düz arazilere kurulur ve yıllık güneşlenme süresinin yüksek olmasını gerektirir.

Türkiye''nin ve Avrupa''nın tek bir alanda kurulu en büyük Güneş Enerjisi Santrali (GES) projesi nerede hayata geçirilmiştir?',
  '{"options": ["Konya — Karapınar Güneş İhtisas Endüstri Bölgesi", "Şanlıurfa — Harran", "Antalya — Manavgat", "Van — Tuşba", "Mersin — Mut"], "correctIndex": 0}'::jsonb,
  'Konya Karapınar GES, çölleşmiş eski göl tabanı üzerinde 20 milyon metrekare alana kurulan dev panelleriyle Türkiye''nin açık ara en büyük güneş enerjisi santralidir.',
  'Türkiye''nin en büyük GES yatırımı Konya Karapınar''dadır.'
);

-- Soru #093 (Madenler ve Enerji Kaynakları)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Türkiye''nin akarsuları yüksek debi ve eğimleri sayesinde büyük hidroelektrik potansiyele sahiptir. Çoruh Nehri üzerinde inşa edilen ve çift eğrilikli beton kemer kategorisinde Türkiye''nin en yüksek, dünyanın 5. en yüksek barajı hangisidir?',
  '{"options": ["Yusufeli Barajı", "Deriner Barajı", "Atatürk Barajı", "Keban Barajı", "Ilısu Barajı"], "correctIndex": 0}'::jsonb,
  'Artvin''de Çoruh Nehri üzerinde tamamlanan Yusufeli Barajı 275 metre gövde yüksekliği ile Türkiye''nin en yüksek barajıdır. Deriner Barajı da Çoruh üzerindedir ama Yusufeli rekoru devralmıştır.',
  'En yüksek barajımız Yusufeli Barajı''dır (Artvin - Çoruh).'
);

-- Soru #094 (Madenler ve Enerji Kaynakları)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Türkiye''nin maden ihracat gelirleri incelendiğinde, toplam madencilik ihracatımızın yaklaşık yarısını (%45-50) tek başına karşılayan başkalaşım (metamorfik) madeni hangisidir?',
  '{"options": ["Mermer", "Krom", "Bor", "Bakır", "Demir"], "correctIndex": 0}'::jsonb,
  'Kalkerin yüksek sıcaklık ve basınç altında başkalaşmasıyla oluşan Mermer, Türkiye''nin ihracat şampiyonu madenidir. Afyon, Marmara Adası, Bilecik, Muğla ve Elazığ (vişne mermeri) dünyaca ünlüdür.',
  'Adaylar ihracat şampiyonunu bor sanırlar; bor tonaj olarak kısıtlıdır, döviz gelirinde 1 numara MERMERDİR.'
);

-- Soru #095 (Madenler ve Enerji Kaynakları)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Petrol ve doğalgaz sondaj kuyularında açılan kuyunun çökmesini engellemek ve sondaj çamuruna ağırlık kazandırmak için kullanılan, Antalya (Alanya, Gazipaşa) ve Kahramanmaraş''ta çıkarılan ağır mineral hangisidir?',
  '{"options": ["Barit", "Asbest", "Fosfat", "Kükürt", "Zımpara taşı"], "correctIndex": 0}'::jsonb,
  'Barit yoğunluğu yüksek bir mineraldir ve petrol sondaj kuyularında sondaj çamurunun basıncını dengelemek için vazgeçilmezdir. Alanya ve Gazipaşa ana merkezlerdir.',
  'Petrol sondaj çamuru = Barit = Alanya/Gazipaşa.'
);

-- Soru #096 (Madenler ve Enerji Kaynakları)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Tarımda kullanılan suni kimyasal fosfatlı gübrelerin ana hammaddesi olan ve Türkiye''de Mardin (Mazıdağı) ve Adıyaman''da çıkarılan maden hangisidir?',
  '{"options": ["Fosfat", "Kükürt", "Manganez", "Cıva", "Antimon"], "correctIndex": 0}'::jsonb,
  'Mardin Mazıdağı Türkiye''nin en büyük fosfat tesislerine ev sahipliği yapar. Gübre hammaddesidir.',
  'Suni gübre hammaddesi = Fosfat = Mardin Mazıdağı.'
);

-- Soru #097 (Madenler ve Enerji Kaynakları)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Hediyelik süs eşyası, pipo ve takı yapımında kullanılan; ateşe dayanıklı, gözenekli ve beyaz renkli ''Lületaşı'' hangi ilimizin simgesidir?',
  '{"options": ["Eskişehir", "Erzurum", "Bilecik", "Kütahya", "Afyonkarahisar"], "correctIndex": 0}'::jsonb,
  'Lületaşı Eskişehir''de çıkarılır. Erzurum''da çıkarılan ise siyah renkli kehribar benzeri ''Oltutaşı''dır.',
  'Lületaşı = Eskişehir; Oltutaşı = Erzurum.'
);

-- Soru #098 (Madenler ve Enerji Kaynakları)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Türkiye''nin ilk nükleer güç santrali olan Akkuyu Nükleer Güç Santrali Mersin''de inşa edilmektedir.

Nükleer santralin kuruluş yeri olarak Mersin Akkuyu sahilinin seçilmesinde aşağıdakilerden hangisi belirleyici olmuştur?',
  '{"options": ["Deprem riskinin (sismik aktivite) Türkiye ortalamasına göre çok düşük olması ve deniz suyu soğutma kaynağına sahip olması", "Bölgede zengin uranyum yataklarının bulunması", "Mersin''in Türkiye''nin en çok elektrik tüketen kenti olması", "Akdeniz''de fırtına riskinin hiç olmaması", "Bölgede sanayi tesislerinin yasaklanması"], "correctIndex": 0}'::jsonb,
  'Nükleer santrallerde güvenlik her şeydir. Mersin-Sinop sahaları Türkiye''nin fay hatlarından en uzak, deprem riski en düşük (1. derece deprem bölgesinden uzak) masif alanlarıdır. Ayrıca reaktörleri soğutmak için deniz suyu şarttır.',
  'Nükleer santral yeri seçiminde 1. kriter DEPREM RİSKİNİN AZLIĞIDIR.'
);

-- Soru #099 (Madenler ve Enerji Kaynakları)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Geleceğin nükleer reaktörlerinde temiz nükleer yakıt olarak kullanılması hedeflenen ve Türkiye''nin dünya rezervlerinde 2. sırada yer aldığı stratejik radyoaktif maden hangisidir?',
  '{"options": ["Toryum", "Uranyum", "Plütonyum", "Radyum", "Titanyum"], "correctIndex": 0}'::jsonb,
  'Eskişehir Sivrihisar havzası dünyanın en zengin Toryum yataklarına sahiptir. Türkiye toryum rezervinde dünya 2.sidir.',
  'Toryum = Eskişehir Sivrihisar = Dünya 2.liği.'
);

-- Soru #100 (Madenler ve Enerji Kaynakları)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Madenler ve Enerji Kaynakları',
  'multiple_choice',
  2,
  'Optik aletler, zımpara kağıdı ve aşındırıcı taşların yapımında kullanılan, Ege Bölgesi''nde (İzmir, Muğla, Aydın, Denizli) zengin yatakları bulunan maden hangisidir?',
  '{"options": ["Zımpara Taşı", "Krom", "Barit", "Linyit", "Asbest"], "correctIndex": 0}'::jsonb,
  'Zımpara taşı aşındırıcı sanayide kullanılır ve Ege Bölgesi dünya üretiminde ön saflardadır.',
  'Aşındırıcı sanayi + Ege = Zımpara Taşı.'
);

-- Soru #101 (Sanayi, Ticaret ve Ulaşım)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  2,
  'Sanayi tesislerinin kuruluşunda en önemli faktörlerden biri hammaddeye yakınlıktır. Bazı hammaddeler çabuk bozulduğu ya da taşınması maliyetli olduğu için fabrikalar doğrudan tarlanın veya madenin yanına kurulur.

Aşağıdaki sanayi tesisi ve kuruluş yeri eşleştirmelerinden hangisinde ''hammaddeye yakınlık'' temel belirleyici faktör olmamıştır?',
  '{"options": ["Rize — Çay Fabrikaları", "Konya — Şeker Fabrikası", "Balıkesir (Edremit) — Zeytinyağı Fabrikası", "Çanakkale — Balık Konservesi Fabrikası", "İstanbul — Unlu Mamuller ve Bisküvi Fabrikaları"], "correctIndex": 4}'::jsonb,
  'İstanbul''da buğday tarımı yapılmaz; un ve tahıl Anadolu''dan gelir. İstanbul''da unlu mamul fabrikalarının kurulmasının nedeni hammadde değil, 16 milyonluk devasa nüfustur (PAZARA YAKINLIK).',
  'Büyükşehirlerdeki gıda ve konfeksiyon tesisleri hammaddeye değil ''tüketim pazarına'' yakındır.'
);

-- Soru #102 (Sanayi, Ticaret ve Ulaşım)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  2,
  'Türkiye''nin ihracat şampiyonu olan otomotiv ve yan sanayisi Bursa, Kocaeli, Sakarya, İstanbul ve İzmir illerinde kümelenmiştir.

Otomotiv sanayisinin bu merkezlerde toplanmasında aşağıdakilerden hangisi etkili olmamıştır?',
  '{"options": ["Gelişmiş liman altyapısı ve Avrupa pazarına kolay ihracat", "Nitelikli teknik işgücünün ve mühendislik altyapısının bulunması", "Bölgede zengin demir cevheri madenlerinin çıkarılması", "Sermaye birikiminin ve finans kuruluşlarının bölgede yoğunlaşması", "Geniş tüketici pazarının ve yan sanayi tedarikçilerinin varlığı"], "correctIndex": 2}'::jsonb,
  'Marmara Bölgesi''nde demir madeni çıkarılmaz. Demir-çelik Karabük, Ereğli ve İskenderun''dan kütükler halinde getirilir. Otomotivin burada olma sebebi liman, işgücü, pazar ve sermayedir.',
  'Adaylar otomobil demirden yapılır, o zaman Marmara''da demir çıkarılır gibi yanlış bir çıkarım yapabilir; hammadde başka yerden taşınır.'
);

-- Soru #103 (Sanayi, Ticaret ve Ulaşım)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  2,
  'Türkiye''nin yerli ve elektrikli otomobili TOGG''un üretim ve teknoloji kampüsü hangi il ve ilçemizde inşa edilerek seri üretime başlamıştır?',
  '{"options": ["Bursa — Gemlik", "Kocaeli — Gölcük", "Sakarya — Arifiye", "İzmir — Torbalı", "Eskişehir — Tepebaşı"], "correctIndex": 0}'::jsonb,
  'TOGG Teknoloji Kampüsü Bursa''nın Gemlik ilçesinde, doğrudan liman kıyısında inşa edilmiştir. Liman bağlantısı ihracat ve batarya sevkiyatı için stratejik avantaj sağlamaktadır.',
  'TOGG = Bursa Gemlik.'
);

-- Soru #104 (Sanayi, Ticaret ve Ulaşım)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  2,
  'Geleneksel dokuma ve halıcılık merkezlerimiz yüzyıllardır kalitesini korumaktadır. El halıcılığı ve kilim dokumacılığı ile ünlü merkezler eşleştirildiğinde aşağıdakilerden hangisi yanlıştır?',
  '{"options": ["Hereke (Kocaeli) — İpekli ve Yünlü Saray Halıları", "Isparta — Gül ve Yün Halıları", "Uşak — Tarihi Türk Halıları", "Bünyan ve Develi — Kayseri Halıları", "Rize — Yünlü Halıcılık"], "correctIndex": 4}'::jsonb,
  'Rize''de halıcılık gelişmemiştir; Rize ''Feretiko'' (Rize bezi / keten dokumacılığı) ile meşhurdur. Hereke, Isparta, Uşak, Gördes, Demirci ve Bünyan Türkiye''nin önde gelen halı merkezleridir.',
  'Rize = Keten dokuma (Rize Bezi/Feretiko); Halı denince Isparta, Hereke, Uşak gelir.'
);

-- Soru #105 (Sanayi, Ticaret ve Ulaşım)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  2,
  'Kimyasal gübre fabrikaları incelendiğinde; Bandırma, Mersin, İskenderun, Kocaeli ve Samsun gibi liman kentlerinde yoğunlaştıkları görülür.

Gübre fabrikalarının kıyı kentlerimizde kurulmasının temel nedeni nedir?',
  '{"options": ["Gübre üretiminde kullanılan fosfat ve doğalgazın büyük oranda deniz yoluyla ithal edilmesi", "Gübre tüketiminin sadece kıyılarda yapılması", "Gübrenin iç kesimlerde patlama riski taşıması", "Kıyı sularının gübreyle temizlenmesi", "Kıyılarda gübre kokusunun hissedilmemesi"], "correctIndex": 0}'::jsonb,
  'Türkiye suni gübre üretiminde kullanılan doğalgaz ve ham fosfatın büyük bölümünü Kuzey Afrika ve Körfez ülkelerinden deniz yoluyla ithal eder. Hammadde gemilerle geldiği için fabrikalar limanın hemen dibine kurulmuştur.',
  'Gübre fabrikaları ithal hammaddeye (limana) bağımlıdır.'
);

-- Soru #106 (Sanayi, Ticaret ve Ulaşım)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  2,
  'Hammaddesi kil, kireçtaşı ve kum olan, inşaat sektörünün temel taşı kabul edilen ve hammadde her yerde bulunduğu için Türkiye''nin 7 coğrafi bölgesine de en dengeli dağılmış olan sanayi kolu hangisidir?',
  '{"options": ["Çimento Sanayisi", "Otomotiv Sanayisi", "Petrokimya Sanayisi", "Uçak Sanayisi", "Pamuklu Dokuma Sanayisi"], "correctIndex": 0}'::jsonb,
  'Çimentonun hammaddesi kireç ve kildir; doğada her yerde bulunur ve taşınması çok ağırdır. Bu yüzden Türkiye''nin hemen hemen her ilinde ya da bölgesinde bir çimento fabrikası mevcuttur.',
  'Türkiye''de en yaygın ve her bölgede olan sanayi dalı ÇİMENTODUR.'
);

-- Soru #107 (Sanayi, Ticaret ve Ulaşım)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  2,
  'Savunma sanayisi tesisleri (TUSAŞ, ASELSAN, ROKETSAN, HAVELSAN, MKE) Ankara ve Kırıkkale''de kümelenmiştir.

Savunma sanayisinin kıyı şeridimiz yerine İç Anadolu''da kurulmasında etkili olan en temel tarihi ve coğrafi gerekçe nedir?',
  '{"options": ["Kıyıların denizden ve havadan gelebilecek askeri saldırılara açık olması, iç kesimlerin ise stratejik ve coğrafi güvenlik sağlaması", "İç Anadolu''da elektriğin daha ucuz olması", "Kırıkkale''de çelik madenlerinin çıkması", "Ankara''da nüfusun kıyılardan az olması", "Mühendislerin sadece Ankara''da yaşamayı tercih etmesi"], "correctIndex": 0}'::jsonb,
  'Cumhuriyet''in ilk yıllarından itibaren silah, mühimmat ve savunma sanayisi askeri güvenlik gerekçesiyle düşman donanmalarının menzili dışındaki korunaklı iç bölgeye (Kırıkkale ve Ankara) kurulmuştur.',
  'Savunma sanayisi = İç bölge güvenliği ve Başkent koruması.'
);

-- Soru #108 (Sanayi, Ticaret ve Ulaşım)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  2,
  'Türkiye''de yük ve yolcu taşımacılığında karayollarının payı %85-90 seviyesindedir. Karayollarının bu derece baskın olmasının temel nedeni nedir?',
  '{"options": ["Kapıdan kapıya kesintisiz ulaşım sağlaması ve her yerleşim birimine ulaşabilen en yaygın ağ olması", "Karayolu taşımacılığının denizyolundan daha ucuz olması", "Karayolu araçlarının hiç kaza yapmaması", "Türkiye''de demiryolu ve havayolunun bulunmaması", "Karayollarının yakıt tüketiminin en düşük olması"], "correctIndex": 0}'::jsonb,
  'Karayolu en pahalı taşıma türlerinden biri olmasına rağmen ''kapıdan kapıya'' kesintisiz ulaşım sağladığı ve en ücra köye kadar yol ağı bulunduğu için yolcu ve yükte ezici paya sahiptir.',
  'En ucuz taşıma: Denizyolu > Demiryolu > Karayolu > Havayolu. Karayolunun üstünlüğü ucuzluğu değil esnekliğidir.'
);

-- Soru #109 (Sanayi, Ticaret ve Ulaşım)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  2,
  'Yüksek Hızlı Tren (YHT) hatları Türkiye''de şehirlerarası yolcu taşımacılığında devrim yaratmıştır.

Aşağıdaki şehirlerden hangisi Türkiye''nin aktif Yüksek Hızlı Tren (YHT) ağı üzerinde doğrudan yer almaz?',
  '{"options": ["Eskişehir", "Konya", "Karaman", "Sivas", "Trabzon"], "correctIndex": 4}'::jsonb,
  'Ankara merkezli YHT hatları Eskişehir, İstanbul, Konya, Karaman, Kırıkkale, Yozgat ve Sivas illerine ulaşmıştır. Trabzon''a ise şu an hiçbir demiryolu hattı bulunmamaktadır.',
  'Trabzon ve Doğu Karadeniz''de demiryolu yoktur.'
);

-- Soru #110 (Sanayi, Ticaret ve Ulaşım)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  2,
  'Kuzey Ege ve Marmara''yı birbirine bağlayan, Çanakkale Boğazı üzerinde inşa edilen ve 2023 metrelik orta açıklığıyla dünyanın en uzun asma köprüsü unvanını alan köprü hangisidir?',
  '{"options": ["1915 Çanakkale Köprüsü", "Yavuz Sultan Selim Köprüsü", "Osmangazi Köprüsü", "15 Temmuz Şehitler Köprüsü", "Fatih Sultan Mehmet Köprüsü"], "correctIndex": 0}'::jsonb,
  '1915 Çanakkale Köprüsü Gelibolu ile Lapseki arasında inşa edilmiş olup dünyanın en uzun orta açıklıklı asma köprüsüdür. Ege ve Marmara transit trafiğini İstanbul''a girmeden Avrupa''ya bağlar.',
  'Çanakkale Boğazı üzerindeki köprü 1915 Çanakkale Köprüsü''dür.'
);

-- Soru #111 (Sanayi, Ticaret ve Ulaşım)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  2,
  'Türkiye''de dağlık yer şekilleri ve kıyı gerisindeki sarp dağ sıraları nedeniyle bazı illerimize demiryolu hattı hiç ulaşamamıştır.

Aşağıdaki kıyı illerimizden hangisine demiryolu bağlantısı bulunmaktadır?',
  '{"options": ["Antalya", "Muğla", "Trabzon", "İskenderun (Hatay)", "Bursa (Merkez)"], "correctIndex": 3}'::jsonb,
  'İskenderun limanı ve demiryolu hattına sahiptir; Adana ve İç Anadolu''ya doğrudan raylı bağlantısı vardır. Antalya, Muğla, Trabzon ve Bursa merkezde ise aktif demiryolu bağlantısı yoktur.',
  'KPSS Klasiği: Antalya, Muğla ve Trabzon''a demiryolu ULAŞMAZ! İskenderun ve Mersin''e ise ulaşır.'
);

-- Soru #112 (Sanayi, Ticaret ve Ulaşım)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  2,
  'Akdeniz kıyı kuşağını İç Anadolu Bölgesi''ne bağlayan tarihi ve stratejik geçitler bulunmaktadır.

Adana ve Çukurova''yı İç Anadolu''ya (Niğde/Pozantı) bağlayan, otoyol ve demiryolunun geçtiği en kritik boğaz geçidi hangisidir?',
  '{"options": ["Gülek Boğazı / Geçidi", "Çubuk Geçidi", "Sertavul Geçidi", "Belen Geçidi", "Zigana Geçidi"], "correctIndex": 0}'::jsonb,
  'Gülek Boğazı Toroslar üzerindeki en önemli geçittir; Çukurova''yı İç Anadolu''ya bağlar. Çubuk Antalya''yı Göller Yöresi''ne, Sertavul Silifke/Mersin''i Karaman''a, Belen ise İskenderun''u Hatay ve Suriye''ye bağlar.',
  'Çukurova - İç Anadolu = Gülek Geçidi.'
);

-- Soru #113 (Sanayi, Ticaret ve Ulaşım)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  2,
  'Konteyner taşımacılığında ve transit deniz ticaretinde Türkiye''nin en büyük konteyner limanları Marmara ve Akdeniz''de toplanmıştır.

Tekirdağ''da yer alan, Türkiye''nin ilk transit konteyner limanı (hub port) unvanına sahip olan ve dev gemilere hizmet veren özel liman hangisidir?',
  '{"options": ["Asyaport", "Ambarlı", "Haydarpaşa", "Derince", "Alsancak"], "correctIndex": 0}'::jsonb,
  'Asyaport (Tekirdağ), Karadeniz ve Akdeniz transit konteyner trafiğini yöneten Türkiye''nin en büyük transit aktarma limanıdır.',
  'Transit konteyner limanı = Asyaport (Tekirdağ).'
);

-- Soru #114 (Sanayi, Ticaret ve Ulaşım)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  2,
  'Karadeniz''in sarp kıyı coğrafyasında kara alanı bulunamadığı için tamamen deniz doldurularak inşa edilen Türkiye''nin İLK deniz üzeri havalimanı hangisidir?',
  '{"options": ["Ordu — Giresun Havalimanı (OGU)", "Rize — Artvin Havalimanı", "Trabzon Havalimanı", "Samsun Çarşamba Havalimanı", "Zonguldak Çaycuma Havalimanı"], "correctIndex": 0}'::jsonb,
  'Ordu-Giresun Havalimanı (OGU) deniz dolgusuyla inşa edilen Türkiye''nin ve Avrupa''nın İLK deniz üzeri havalimanıdır. Rize-Artvin Havalimanı ise Türkiye''nin İKİNCİ deniz üzeri havalimanıdır.',
  'İlk deniz dolgusu havalimanı = Ordu-Giresun; İkincisi = Rize-Artvin.'
);

-- Soru #115 (Sanayi, Ticaret ve Ulaşım)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  2,
  'Türkiye''nin dış ticaret yapısı incelendiğinde; Türkiye''nin en çok ihracat yaptığı ülke ile en çok ithalat yaptığı ülkeler doğru olarak hangisinde verilmiştir?',
  '{"options": ["En çok ihracat: Almanya — En çok ithalat: Rusya ve Çin", "En çok ihracat: ABD — En çok ithalat: İngiltere", "En çok ihracat: Irak — En çok ithalat: Fransa", "En çok ihracat: İtalya — En çok ithalat: Japonya", "En çok ihracat: Rusya — En çok ithalat: Almanya"], "correctIndex": 0}'::jsonb,
  'Türkiye''nin geleneksel 1 numaralı ihracat pazarı Almanya''dır (otomotiv, tekstil, beyaz eşya). En çok ithalat yapılan ülkeler ise enerji (doğalgaz/petrol) nedeniyle Rusya ve sanayi ürünleri nedeniyle Çin''dir.',
  'İhracat şampiyonu pazarımız ALMANYA; İthalatta ise RUSYA ve ÇİN başı çeker.'
);

-- Soru #116 (Sanayi, Ticaret ve Ulaşım)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  2,
  'Gümrük vergisi, harç ve fonlardan muaf tutularak yabancı sermayeyi çekmek ve ihracata dönük üretimi artırmak amacıyla kurulan Serbest Bölgelerden Türkiye''de İLK kurulan serbest bölge hangisidir?',
  '{"options": ["Mersin Serbest Bölgesi", "Ege Serbest Bölgesi (İzmir)", "İstanbul İhtisas Serbest Bölgesi", "Antalya Serbest Bölgesi", "Trabzon Serbest Bölgesi"], "correctIndex": 0}'::jsonb,
  '1985 yılında kurulan Mersin Serbest Bölgesi Türkiye''nin ilk serbest bölgesidir. Ticaret hacmi en büyük olan ise İzmir Ege Serbest Bölgesi''dir (ESBAŞ).',
  'İlk serbest bölge = Mersin; En yüksek ticaret hacmi = Ege (İzmir).'
);

-- Soru #117 (Sanayi, Ticaret ve Ulaşım)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  2,
  'Şanlıurfa''da yer alan, MÖ 9600''lere tarihlenen ve üzerinde T biçimli dikilitaşların bulunduğu, insanlık tarihinin bilinen ''en eski anıtsal tapınak merkezi'' kabul edilerek UNESCO Dünya Mirası Listesi''ne giren alan hangisidir?',
  '{"options": ["Göbeklitepe", "Çatalhöyük", "Efes", "Nemrut Dağı", "Arslantepe"], "correctIndex": 0}'::jsonb,
  'Göbeklitepe Şanlıurfa''da yer alır ve yerleşik hayata geçiş ile dinler tarihini baştan yazan dünyanın en eski tapınak kompleksidir.',
  'En eski anıtsal inanç merkezi = Göbeklitepe (Şanlıurfa).'
);

-- Soru #118 (Sanayi, Ticaret ve Ulaşım)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  2,
  'Bölgesel kalkınma projelerinden biri olan Yeşilırmak Havzası Gelişim Projesi (YHGP); Amasya, Çorum, Samsun ve Tokat illerini kapsamaktadır.

Bu projenin temel çıkış noktası ve öncelikli hedefi aşağıdakilerden hangisidir?',
  '{"options": ["Yeşilırmak''ın yol açtığı taşkın, sel ve erozyon felaketlerini önlemek, akarsu kirliliğini durdurmak", "Bölgede petrol kuyuları açmak", "Samsun Limanı''nı kapatmak", "Halkı başka bölgelere göç ettirmek", "Yalnızca kayak turizmi geliştirmek"], "correctIndex": 0}'::jsonb,
  'Yeşilırmak Havzası projesi taşkın ve erozyonla mücadele odaklıdır. Yeşilırmak''ın taşıdığı devasa alüvyon toprak kaybına ve Çarşamba ovasında sellere neden oluyordu.',
  'Yeşilırmak projesi = Sel, taşkın ve erozyonla mücadele.'
);

-- Soru #119 (Sanayi, Ticaret ve Ulaşım)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  2,
  'Zonguldak-Bartın-Karabük (ZBK) Bölgesel Gelişme Projesi''nin ana eksenini demir-çelik sanayisinin modernize edilmesi ve Karadeniz''in devasa çıkış kapısı olan Filyos Vadisi Projesi oluşturur.

Bu projenin temel gerekçesi nedir?',
  '{"options": ["Bölgenin taş kömürü ve demir-çeliğe olan tek yönlü bağımlılığını azaltmak, yeni sanayi ve lojistik alanları yaratmak", "Bölgede tarımı tamamen yasaklamak", "Taş kömürü madenlerini tamamen kapatmak", "Karabük demir çelik fabrikasını Antalya''ya taşımak", "Bölge nüfusunu kırsala geri döndürmek"], "correctIndex": 0}'::jsonb,
  'ZBK bölgesi taş kömürü ve ağır sanayiye bağımlıdır. Kömür rezervlerinin derinleşmesi ve istihdam baskısı nedeniyle Filyos Limanı ve karma endüstri bölgeleriyle ekonomik çeşitlilik amaçlanır.',
  'ZBK = Taş kömürü modernizasyonu + Filyos Projesi.'
);

-- Soru #120 (Sanayi, Ticaret ve Ulaşım)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Coğrafya',
  'Sanayi, Ticaret ve Ulaşım',
  'multiple_choice',
  2,
  'Doğu Karadeniz Projesi (DOKAP) kapsamında bölgenin turizm potansiyelini canlandırmak amacıyla Samsun''dan Hopa''ya kadar yaylaları birbirine bağlayan devasa karayolu projesi hangisidir?',
  '{"options": ["Yeşil Yol Projesi", "İpek Yolu Projesi", "Kral Yolu Projesi", "Mavi Yol Projesi", "Tarihi Göç Yolu"], "correctIndex": 0}'::jsonb,
  'Yeşil Yol Projesi DOKAP bünyesinde Doğu Karadeniz yaylalarını (Ayder, Pokut, Uzungöl vb.) yüksek rakımdan birbirine bağlayarak yayla ve doğa turizmini kesintisiz hale getirmeyi hedefler.',
  'DOKAP + Yaylaların birleştirilmesi = Yeşil Yol Projesi.'
);

COMMIT;