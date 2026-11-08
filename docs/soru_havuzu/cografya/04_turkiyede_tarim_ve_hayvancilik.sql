-- =============================================================
-- KPSS COĞRAFYA — KONU 4: TÜRKIYE'DE TARIM VE HAYVANCILIK
-- Toplam Soru: 40 (Zorluk: 10 Kolay, 20 Orta, 10 Zor)
-- Standart: Özgün İçerik + Açıklama + ÖSYM Çeldirici Tuzağı
-- =============================================================
BEGIN;

-- Soru #01 (Zorluk: 1)
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
  1,
  'Türkiye''de tarımda verimi artırmanın ve üretimi iklim dalgalanmalarından kurtarmanın en temel yolu aşağıdakilerden hangisidir?',
  '{"options": ["Tarım arazilerinin yüz ölçümünü sürekli genişletmek", "Sulama imkanlarını yaygınlaştırmak", "Tarımsal ilaç kullanımını katbekat artırmak", "Kırsalda çalışan insan sayısını çoğaltmak", "Tarlaları iki yılda bir nadasa bırakmak"], "correctIndex": 1}'::jsonb,
  'Türkiye tarımının en kronik sorunu kuraklık ve yaz mevsiminde su yetersizliğidir. Sulama imkanları çözüldüğünde; üretimdeki yıllık dalgalanmalar sona erer, nadas uygulaması biter, birim alandan alınan verim tavan yapar ve yılda birden fazla hasat alınabilir.',
  'Tarım arazisini genişletmek (ekstansif) verimi artırmaz; modern tarımın (entansif) temel kilidi sulamadır.'
);

-- Soru #02 (Zorluk: 1)
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
  1,
  'Yağışın yetersiz olduğu yarı kurak alanlarda toprağın su ve mineral depolamasını sağlamak amacıyla bir yıl ekilip bir yıl boş bırakılmasına ''nadas'' denir.

Türkiye fiziki coğrafyası göz önüne alındığında nadas alanlarının en az olduğu bölge aşağıdakilerden hangisidir?',
  '{"options": ["İç Anadolu Bölgesi", "Güneydoğu Anadolu Bölgesi", "Karadeniz Bölgesi", "Doğu Anadolu Bölgesi", "Ege Bölgesi"], "correctIndex": 2}'::jsonb,
  'Karadeniz Bölgesi her mevsim düzenli yağış aldığı ve nem oranı yüksek olduğu için toprağın dinlendirilmesine (nadasa) gerek kalmaz; bu nedenle nadas alanlarının payı Türkiye''de en az Karadeniz''dedir.',
  'Nadasın en çok olduğu yer İç Anadolu ve Güneydoğu; en az olduğu yer ise her mevsim yağışlı geçen Karadeniz kıyı kuşağıdır.'
);

-- Soru #03 (Zorluk: 1)
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
  1,
  'Türkiye''de bazı tarım ürünlerinin ekim alanları devlet tarafından özel kanunlarla sınırlandırılmıştır.

Aşağıdaki tarım ürünlerinden hangisinin ekim alanı ''sıtma hastalığına yol açan sivrisineklerin üremesini engellemek ve yerleşim alanlarını korumak'' amacıyla devlet kontrolü altındadır?',
  '{"options": ["Tütün", "Haşhaş", "Kenevir", "Çeltik (Pirinç)", "Şeker Pancarı"], "correctIndex": 3}'::jsonb,
  'Çeltik (pirinç) tarlaları sürekli su altında (bataklık şeklinde) tutulduğundan Anofel cinsi sıtma sivrisineklerinin üremesine yol açar. Bu yüzden Çeltik Ekimi Kanunu ile şehir ve kasaba merkezlerine belirli mesafeden yakın yerlerde çeltik ekimi devletçe yasaklanmıştır.',
  'Haşhaş ve kenevir uyuşturucu; tütün kalite standardı; şeker pancarı kota; çeltik ise doğrudan halk sağlığı (sıtma) sebebiyle devlet kontrolündedir.'
);

-- Soru #04 (Zorluk: 1)
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
  1,
  'Türkiye''de en çok yetiştirilen tarım ürünü buğdaydır. Buğday ilkbaharda büyüme döneminde yağış, yaz mevsiminde ise olgunlaşma ve hasat için kurak ve sıcak bir hava ister.

Buna göre aşağıdaki yörelerin hangisinde yaz mevsiminin sürekli yağışlı ve bulutlu geçmesi buğday tarımını imkansız hale getirmiştir?',
  '{"options": ["Konya Kapalı Havzası", "Doğu Karadeniz Kıyı Kuşağı", "Cihanbeyli Platosu", "Şanlıurfa Ovası", "Ergene Havzası"], "correctIndex": 1}'::jsonb,
  'Doğu Karadeniz kıyılarında her mevsim yağışlıdır ve yaz kuraklığı yaşanmaz. Buğday ve arpa gibi tahıllar olgunlaşma döneminde güneşe ve kuraklığa ihtiyaç duyduğu için Karadeniz kıyılarında doğal olarak yetiştirilemez.',
  'Karadeniz kıyısında buğdayın yetişmeme sebebi soğukluk değil, yaz kuraklığının ve güneşlenme süresinin olmamasıdır.'
);

-- Soru #05 (Zorluk: 1)
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
  1,
  'Türkiye''de üretilen fındığın yaklaşık %80''i Karadeniz Bölgesi''nde yetiştirilmekte olup Türkiye dünya fındık üretim ve ihracatında açık ara birinci sıradadır.

Fındık üretiminde Karadeniz Bölgesi içinde en yüksek paya sahip il aşağıdakilerden hangisidir?',
  '{"options": ["Rize", "Ordu", "Artvin", "Sinop", "Kastamonu"], "correctIndex": 1}'::jsonb,
  'Türkiye''de yıllık fındık rekoltesinde birinci sırada Ordu ili yer alır (Ordu ve Giresun fındığın anavatanı ve lideridir). Rize ise çay üretiminde liderdir.',
  'Rize çayda; Ordu fındıkta liderdir. Adaylar fındıkta Giresun veya Rize ile Ordu arasında tereddüt edebilir; üretim miktarında Ordu öndedir.'
);

-- Soru #06 (Zorluk: 1)
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
  1,
  'Aşağıdaki meyvelerden hangisi kış donlarına karşı son derece hassas olduğu için Akdeniz ve Ege kıyı kuşağı dışında (mikroklima alanlar hariç) iç kesimlerde kesinlikle yetiştirilemez?',
  '{"options": ["Elma", "Üzüm", "Turunçgiller (Portakal, Mandalina, Limon)", "Armut", "Ceviz"], "correctIndex": 2}'::jsonb,
  'Turunçgiller subtropikal kökenli olup kış sıcaklığının 0°C''nin altına düşmesine tahammül edemez. Bu sebeple sadece kış ılıklığının belirgin olduğu Akdeniz ve Güney Ege kıyılarında (ve fön sayesinde Rize mikroklimasında) yetişir. Elma ve üzüm ise -30°C''ye kadar dayanıklıdır.',
  'Üzüm ve elma Türkiye''nin her bölgesinde kış soğuklarına meydan okuyarak yetişir; turunçgiller ise en ufak donda kurur.'
);

-- Soru #07 (Zorluk: 1)
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
  1,
  'Türkiye''de küçükbaş hayvancılık türleri bitki örtüsüyle doğrudan paralellik gösterir.

İç Anadolu, Doğu ve Güneydoğu Anadolu''nun bozkır (step) alanlarında en yaygın beslenen küçükbaş hayvan türü aşağıdakilerden hangisidir?',
  '{"options": ["Kıl Keçisi", "Koyun", "Manda", "Tiftik Keçisi", "İpek Böceği"], "correctIndex": 1}'::jsonb,
  'Karasal iklimin cılız ilkbahar otları (bozkır) koyunların küçük ağız yapısına tam uygundur. Bu nedenle Türkiye''de sayıca en fazla beslenen çiftlik hayvanı koyundur.',
  'Koyun = Bozkır; Kıl keçisi = Maki ve Toroslar dağlık alan; Sığır = Çayır ve mera.'
);

-- Soru #08 (Zorluk: 1)
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
  1,
  'Maki florasının sürgünleriyle, çalılarla ve engebeli kayalık arazilerle beslenebilen; bu yüzden Akdeniz Bölgesi''nde Toros Dağları kuşağında en çok beslenen hayvan türü hangisidir?',
  '{"options": ["Koyun", "Kıl Keçisi", "Manda", "Merinos Koyunu", "Büyükbaş Sığır"], "correctIndex": 1}'::jsonb,
  'Kıl keçisi tırmanma yeteneği yüksek, kayalık ve engebeli arazilerde rahatça yürüyebilen ve makinin sert yapraklarıyla beslenebilen bir hayvandır. En çok Akdeniz''de (Teke ve Taşeli platolarında) beslenir.',
  'Kıl keçisi orman filizlerini kemirip ormana zarar verdiği için orman köylerinde devlet kontrolü ve kısıtlaması uygulanmaktadır.'
);

-- Soru #09 (Zorluk: 1)
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
  1,
  'Türkiye''de kümes hayvancılığı (tavuk, hindi, yumurta üretimi) tesislerinin coğrafi dağılışı incelendiğinde Marmara ve Ege bölgelerinde (Bolu, Sakarya, Manisa, Balıkesir) yoğunlaştığı görülür.

Kümes hayvancılığının bu alanlarda yoğunlaşmasının temel belirleyicisi aşağıdakilerden hangisidir?',
  '{"options": ["İklim şartlarının ve hava sıcaklığının tavuklara çok uygun olması", "Büyük tüketim merkezlerine (İstanbul, İzmir, Ankara) yakınlık ve pazar kolaylığı", "Bölgede yem bitkilerinin bedava temin edilmesi", "Geleneksel mera hayvancılığı yöntemlerinin kullanılması", "Karasallık şiddetinin yüksek olması"], "correctIndex": 1}'::jsonb,
  'Kümes hayvancılığı kapalı, klimalı ve modern çiftliklerde yapılır; bu yüzden doğal iklim ve bitki örtüsünden tamamen bağımsızdır. Tesislerin Marmara-Ege aksında kurulmasının tek sebebi dev tüketici nüfusa (büyük pazara) yakınlık ve et-yumurtanın bozulmadan hızla ulaştırılmasıdır.',
  'ÖSYM kümes hayvancılığında iklimin hiçbir etkisinin olmadığını, kuruluş yerini yalnızca ''büyük pazara yakınlığın'' belirlediğini defalarca sormuştur.'
);

-- Soru #10 (Zorluk: 1)
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
  1,
  'Türkiye''de deniz balıkçılığında avlanan toplam balık miktarının yaklaşık %70''i tek başına Karadeniz''den sağlanmaktadır.

Karadeniz''in balık üretim miktarında diğer denizlerimize açık ara fark atmasının temel nedeni aşağıdakilerden hangisidir?',
  '{"options": ["Deniz suyu sıcaklığının çok yüksek olması", "Tuzluluk oranının Akdeniz''den fazla olması", "Akarsuların bol besin maddesi taşıması, oksijen miktarının yüksekliği ve plankton zenginliği", "Karadeniz''in 200 metrenin altındaki derinliklerinin balık yuvası olması", "Bölgede kültür balıkçılığı havuzlarının çok yaygın olması"], "correctIndex": 2}'::jsonb,
  'Karadeniz''e dökülen devasa ırmaklar (Tuna, Dinyester, Dinyeper, Don, Kızılırmak) bol miktarda mineral ve besin taşır; su serin olduğu için oksijen çözünürlüğü yüksektir ve balıkların ana besini olan plankton bakımından son derece zengindir.',
  'Karadeniz''de balık MİKTARI çoktur ama balık TÜRÜ çeşidi azdır! En çok tür çeşidi sıcak Akdeniz''dedir. Ayrıca Karadeniz''in 200 m altında H2S gazı vardır, yaşam yoktur!'
);

-- Soru #11 (Zorluk: 2)
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
  'Güneydoğu Anadolu Projesi''nin (GAP) hayata geçirilmesi ve Şanlıurfa Tünelleri ile Fırat''ın suyunun Harran Ovası''na akıtılması sonucunda, daha önce Ege ve Çukurova''nın lider olduğu hangi endüstriyel tarım ürününde Şanlıurfa açık ara Türkiye lideri konumuna yükselmiştir?',
  '{"options": ["Tütün", "Zeytin", "Pamuk", "Çay", "Fındık"], "correctIndex": 2}'::jsonb,
  'GAP ile sulama gelmeden önce Türkiye pamuk üretiminin merkezi Çukurova ve Ege (Büyük Menderes) idi. Sulamayla birlikte yüksek güneşlenme süresine sahip GAP sahası atağa geçmiş ve günümüzde Türkiye pamuğunun yarısından fazlasını tek başına Şanlıurfa üretir hale gelmiştir.',
  'GAP denince akla gelen bir numaralı ürün pamuktur. Çukurova ise pamuktan ziyade mısır ve narenciyeye yönelmiştir.'
);

-- Soru #12 (Zorluk: 2)
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
  'Şeker pancarı hasat edildikten sonra çok kısa süre içerisinde işlenmek zorundadır; aksi takdirde içindeki şeker oranı hızla fermente olup buharlaşır.

Bu durum şeker fabrikalarının kuruluş yerlerinin belirlenmesinde aşağıdakilerden hangisini zorunlu kılmıştır?',
  '{"options": ["Enerji santrallerine yakınlığı", "Doğrudan tarım (hammadde) alanlarının hemen yanına kurulmasını", "Liman kentlerinde konumlanmasını", "Demiryolu ana hatları üzerinde olmasını", "Yalnızca büyükşehir tüketim merkezlerinde toplanmasını"], "correctIndex": 1}'::jsonb,
  'Şeker pancarı çabuk bozulabilen (narin) bir hammadde olduğundan fabrikalar tarlaların ve pancar ekim alanlarının hemen bitişiğine kurulmak zorundadır (hammaddeye bağımlılık). Ayrıca fabrikadan çıkan yaş pancar posası (küspe) besi sığırları için yem olduğundan fabrika çevresinde ahır hayvancılığı da gelişir.',
  'Şeker fabrikaları hammaddeye yakın kurulur; ayrıca kıyı bölgelerimizde çiftçiler daha çok kazandıran alternatif ürünlere yöneldiği için şeker pancarı iç bölgelerde kümelenmiştir.'
);

-- Soru #13 (Zorluk: 2)
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
  'Mısırın doğal yetişme alanı her mevsim düzenli yağış alan Karadeniz Bölgesi''dir. Ancak Türkiye mısır üretim istatistikleri incelendiğinde Karadeniz Bölgesi''nin ticari üretim payının Akdeniz (Çukurova) ve İç Anadolu''nun (Konya) çok gerisinde kaldığı görülmektedir.

Bu tezat durumun temel nedenleri arasında aşağıdakilerden hangisi yer almaz?',
  '{"options": ["Karadeniz''de üretilen mısırın yöre halkı tarafından yerel gıda ve ekmek yapımında tüketilip pazara sunulamaması", "Akdeniz ve Konya''da sulama ile birlikte mısırın ticari yem sanayisi için endüstriyel ölçekte üretilmesi", "Karadeniz''de arazinin çok engebeli ve parçalı olması nedeniyle modern geniş mısır tarlalarının kurulamaması", "Karadeniz iklim koşullarının mısırın dane tutmasını tamamen engellemesi", "Çukurova ve Konya''da birim alandan alınan verimin modern tarımla çok daha yüksek olması"], "correctIndex": 3}'::jsonb,
  'Karadeniz iklimi mısırın doğal ana yurdudur; dane tutmasını engellemez. Ancak Karadeniz halkı mısırı kendi beslenmesinde (mısır unu, ekmek) tüketir. Çukurova ve Konya''da ise dev düz tarlalarda sulamayla endüstriyel boyutta yem sanayisi için ekilir ve tüm Türkiye pazarına satılır.',
  'Doğal yetişme alanı Karadeniz''dir fakat en çok üretilen yer Çukurova ve Konya''dır! Karadeniz''deki ürün iç tüketime gider, ticari payı düşüktür.'
);

-- Soru #14 (Zorluk: 2)
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
  'Türkiye''de yetiştirilen zeytin ağaçlarının genel özellikleri değerlendirildiğinde aşağıdakilerden hangisi yanlıştır?',
  '{"options": ["Tipik bir Akdeniz iklimi bitkisi olup maki formasyonuna aittir.", "Kış sıcaklıklarının sıfırın altına düştüğü ve don olaylarının yaşandığı iç bölgelerde yetişemez.", "Ege Bölgesi daha çok yağlık zeytin üretiminde; Güney Marmara (Gemlik) ise sofralık siyah zeytinde uzmanlaşmıştır.", "Zeytin ağacı fizyolojisi gereği ''periyodisite'' gösterir; bir yıl bol ürün verirken ertesi yıl verim belirgin şekilde düşer.", "Zeytin üretiminde en yüksek pay Doğu Anadolu Bölgesi''ne aittir."], "correctIndex": 4}'::jsonb,
  'Zeytin kış donlarına karşı dayanıksızdır. Doğu Anadolu kışların en dondurucu geçtiği bölge olduğundan zeytin üretimi kesinlikle bulunmaz (sadece Çoruh vadisinde ufak bir mikroklima hariç genel zeytincilik yoktur). Zeytinin tartışmasız lideri Ege ve Güney Marmara''dır.',
  'Periyodisite (var yılı - yok yılı) zeytinin karakteristik özelliğidir. Zeytin kış ılıklığı istediği için iç ve doğu bölgelerde yetişemez.'
);

-- Soru #15 (Zorluk: 2)
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
  'I. Yaz yağışlarının gür alpin çayırları yeşertmesi
II. Kış mevsiminin çok sert geçmesi sebebiyle küçükbaş hayvanların telef olma riski
III. Arazinin geniş lav platolarından oluşması

Yukarıda verilen faktörler aşağıdaki bölümlerden hangisinde ''mera tipi büyükbaş hayvancılığın'' temel geçim kaynağı olmasını sağlamıştır?',
  '{"options": ["Ergene Bölümü", "Erzurum - Kars Bölümü", "Antalya Bölümü", "Kıyı Ege Bölümü", "Güney Marmara Bölümü"], "correctIndex": 1}'::jsonb,
  'Erzurum-Kars-Ardahan platolarında yaz aylarında görülen konveksiyonel yağışlar otların sararmasını engeller ve dev boylu gür alpin çayırlar oluşturur. Bu çayırlar koyunların değil sığırların beslenmesine uygundur; bu yüzden bölgede mera büyükbaş hayvancılığı hâkimdir.',
  'Mera tipi büyükbaş = Erzurum-Kars (çayır); Ahır/Besi tipi büyükbaş = Marmara ve İç Anadolu (pazara ve şeker fabrikasına yakınlık).'
);

-- Soru #16 (Zorluk: 2)
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
  'Türkiye''de arıcılık faaliyetleri doğanın sunduğu bitki çeşitliliği, ormanlar ve kır çiçekleri ile doğrudan ilişkilidir.

Buna göre;
• Çam balı üretiminde kızılçam ormanlarının varlığıyla Türkiye ve dünya lideri olan yöremiz,
• Yüksek dağ çiçek florasıyla ünlü Anzer balının üretildiği yöremiz
sırasıyla aşağıdakilerin hangisinde doğru eşleştirilmiştir?',
  '{"options": ["Muğla — Rize", "Ordu — Kars", "Antalya — Hakkari", "Edirne — Artvin", "İzmir — Trabzon"], "correctIndex": 0}'::jsonb,
  'Çam balı çam pamuklu koşnil böceğinin salgısıyla üretilir ve dünyadaki çam balının %90''ı Muğla (Menteşe Yöresi) kızılçam ormanlarında üretilir. Dünyaca ünlü şifalı Anzer balı ise Rize''nin İkizdere ilçesi Anzer Yaylası''nın zengin çiçek florasından elde edilir.',
  'Çam balı = Muğla; Çiçek balı = Ordu, Rize, Kars, Hakkari. Arıcılık arazinin dağlık olmasından olumlu etkilenen nadir ekonomik kollardandır.'
);

-- Soru #17 (Zorluk: 2)
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
  'Türkiye''de pamuk tarımı alüvyal tabanlı ovalarda, yüksek sıcaklık ve bol su ile yapılabilir. Ancak hasat mevsimi olan sonbaharda havanın kesinlikle açık, güneşli ve yağışsız olması gerekir; aksi takdirde kozalar çürür ve pamuk kirlenir.

Buna göre aşağıdaki ovalardan hangisi pamuk tarımı için kesinlikle elverişsizdir?',
  '{"options": ["Harran Ovası", "Çukurova", "Söke Ovası", "Çarşamba Ovası", "Gediz Ovası"], "correctIndex": 3}'::jsonb,
  'Çarşamba Ovası Karadeniz kıyısındadır (Samsun). Karadeniz''de sonbahar mevsimi yılın en çok yağış alan dönemidir. Sonbahar yağmurları pamuğun hasat edilmesini imkansız kılacağı için Çarşamba ve Karadeniz kıyılarında pamuk ekilemez.',
  'Harran, Çukurova, Söke ve Gediz ovaları Türkiye''nin pamuk üsleridir. Karadeniz''deki Çarşamba ise sonbahar yağışları yüzünden pamuğa tamamen kapalıdır.'
);

-- Soru #18 (Zorluk: 2)
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
  'Türkiye''de tütün üretimi Osmanlı''dan günümüze hem ihracat gelirleri hem de uluslararası pazar payı açısından kritik bir yere sahiptir.

Türkiye''de tütün ekim alanlarının devlet tarafından izne bağlanmasının ve sınırlandırılmasının temel gerekçesi aşağıdakilerden hangisidir?',
  '{"options": ["Tütün bitkisinin erozyona yol açması", "Kalitesiz tütün üretimini engellemek ve Türk tütününün dünya piyasasındaki yüksek kalite itibarını korumak", "Tütünün diğer sanayi bitkilerini yok etmesi", "Tütün tarımının sadece kış aylarında yapılabilmesi", "Ülkedeki sigara tüketimini sıfırlamak"], "correctIndex": 1}'::jsonb,
  'Türk tütünü (şark tipi tütün) dünyada aromasıyla ün yapmış kıymetli bir ihraç malıdır. Tütün eğer kontrolsüz ekilirse taban arazilerde aşırı iri yapraklı ve kalitesiz hale gelir. Devlet kaliteli tütünün yetiştiği kıraç ve yamaç arazilere izin vererek kalite standardını korumayı amaçlamıştır.',
  'Tütün kısıtlaması sigarayı bıraktırmak için değil, Türk tütününün kalitesini ve dünya ihracatındaki değerini korumak için konulmuştur.'
);

-- Soru #19 (Zorluk: 2)
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
  'Türkiye''de kültür balıkçılığı (çipura, levrek, alabalık yetiştiriciliği) son yıllarda dev bir ihracat sektörüne dönüşmüştür.

Deniz içi kafeslerde yapılan çipura ve levrek kültür balıkçılığında korunaklı koy ve körfezlerinin çokluğu sayesinde Türkiye üretiminin yaklaşık %65''ini gerçekleştiren ilimiz aşağıdakilerden hangisidir?',
  '{"options": ["Trabzon", "Mersin", "Muğla", "Zonguldak", "Sinop"], "correctIndex": 2}'::jsonb,
  'Muğla (Bodrum, Milas, Güllük körfezi kıyıları) girintili çıkıntılı koyları, dalgalara kapalı sakin suları ve uygun su sıcaklığıyla deniz kafes balıkçılığının (kültür balıkçılığının) Türkiye''deki mutlak lideridir.',
  'Açık deniz balık avcılığında lider Karadeniz (Trabzon, Samsun) iken; çiftlik/kültür kafes balıkçılığında lider Ege''dir (özellikle Muğla ve İzmir).'
);

-- Soru #20 (Zorluk: 2)
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
  'Tiftik keçisi (Ankara keçisi), ipeksi ve parlak tiftik yünüyle dünyaca ünlü endemik bir keçi ırkımızdır.

Türkiye''de tiftik keçisi yetiştiriciliğinin en yoğun yapıldığı il ve coğrafi bölge aşağıdakilerden hangisidir?',
  '{"options": ["Ankara — İç Anadolu Bölgesi", "Antalya — Akdeniz Bölgesi", "Muğla — Ege Bölgesi", "Diyarbakır — Güneydoğu Anadolu Bölgesi", "Kars — Doğu Anadolu Bölgesi"], "correctIndex": 0}'::jsonb,
  'Tiftik keçisinin anavatanı Ankara ve İç Anadolu Bölgesi''dir (Siirt ve Mardin''de de kısmen görülür). Tiftiğinden değerli dokumalar üretilir.',
  'Kıl keçisi Toroslar/Akdeniz''de; Tiftik keçisi ise Ankara/İç Anadolu''da beslenir.'
);

-- Soru #21 (Zorluk: 2)
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
  'Türkiye''de seracılık faaliyetleri kış sıcaklıklarının yüksek olduğu ve güneşli gün sayısının fazla olduğu kıyılarda yoğunlaşır. Kışın ısıtma giderlerinin az olması seracılıkta karlılığı belirler.

Buna göre seracılık faaliyetlerinin Akdeniz kıyılarında Ege kıyılarına göre daha erken hasat vermesinin ve daha karlı olmasının temel sebebi aşağıdakilerden hangisidir?',
  '{"options": ["Toprak yapısının tamamen kumlu olması", "Enlem etkisiyle kış aylarının daha ılık geçmesi ve don olayının neredeyse hiç yaşanmaması", "Sulama sularının sıcak su kaynaklarından temin edilmesi", "Akdeniz''de tarımda makine kullanımının daha fazla olması", "Yaz aylarında turistlerin gelmesi"], "correctIndex": 1}'::jsonb,
  'Akdeniz kıyı kuşağı (Antalya, Mersin) enlem olarak daha güneydedir ve gerisindeki Toroslar kuzeyden gelen soğukları kestiği için kış sıcaklıkları 10°C civarındadır. Don olayı neredeyse hiç görülmez; böylece seraları sobayla/kömürle ısıtma maliyeti sıfıra yakın kalır.',
  'Seracılıkta belirleyici olan kış ılıklığı ve sera ısıtma masrafıdır. Bu yüzden Akdeniz (Antalya) seracılıkta Türkiye''nin başkentidir.'
);

-- Soru #22 (Zorluk: 2)
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
  'Türkiye''de üretilen tarım ürünleri ve birinci sırada yer alan bölgeler eşleştirmelerinden hangisi yanlıştır?',
  '{"options": ["Ayçiçeği — Marmara Bölgesi", "İncir — Ege Bölgesi", "Çay — Karadeniz Bölgesi", "Kırmızı Mercimek — Güneydoğu Anadolu Bölgesi", "Yeşil Mercimek — Akdeniz Bölgesi"], "correctIndex": 4}'::jsonb,
  'Yeşil mercimek kurak ve serin karasal iklimi sever; üretiminde lider bölge İç Anadolu''dur (Yozgat, Konya). Kırmızı mercimek ise kuraklığa ve sıcağa en dayanıklı baklagil olarak Güneydoğu Anadolu''da (Şanlıurfa, Diyarbakır) birinci sıradadır.',
  'Kırmızı mercimek = Güneydoğu Anadolu; Yeşil mercimek = İç Anadolu! Akdeniz mercimek üretiminde ilk sırada değildir.'
);

-- Soru #23 (Zorluk: 2)
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
  'Türkiye''de tarım arazilerinin engebeli olduğu alanlarda tarımda makine kullanımı kısıtlıdır; buralarda insan ve hayvan gücüne ihtiyaç devam eder.

Aşağıdaki yörelerin hangisinde morfolojik engeller nedeniyle tarımda makineleşme oranı en düşüktür?',
  '{"options": ["Konya Ovası", "Çukurova", "Doğu Karadeniz Dağlık Kırsalı", "Harran Ovası", "Ergene Havzası"], "correctIndex": 2}'::jsonb,
  'Doğu Karadeniz''de arazinin dik, sarp ve teraslı olması traktör ve biçerdöver gibi makinelerin tarlaya girmesine izin vermez. Çay ve fındık tarımı tamamen el emeğiyle yapılır.',
  'Düz ovalarda (Konya, Harran, Çukurova, Ergene) makineleşme %100''e yakındır; Doğu Karadeniz, Hakkari ve Menteşe''de ise makineleşme topoğrafya engeline takılır.'
);

-- Soru #24 (Zorluk: 2)
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
  'İpek böcekçiliği, ipek böceği tırtılının dut yaprağı yiyerek salgıladığı liflerle koza örmesi prensibine dayanır. Son yıllarda yapay ipek ve sentetik elyaf üretiminin artması ipek böcekçiliğini geriletmiştir.

Buna rağmen geleneksel üretimin devam ettiği ve günümüzde yaş ipek kozası üretiminde ilk sırada yer alan ilimiz aşağıdakilerden hangisidir?',
  '{"options": ["Bursa", "Diyarbakır", "Balıkesir", "Yalova", "Bilecik"], "correctIndex": 1}'::jsonb,
  'Tarihsel olarak ipek böcekçiliği Bursa ile özdeşleşmiş olsa da günümüzde sanayileşme ve dutlukların azalması sebebiyle Bursa liderliğini kaybetmiştir. TÜİK verilerine göre yaş koza üretiminde Türkiye birincisi Diyarbakır''dır (Kulp ilçesi).',
  'Adayların çoğu refleks olarak ''Bursa'' şıkkına gider! Güncel TÜİK istatistiklerinde ipek böceği yaş koza üretiminde 1 numara Diyarbakır''dır.'
);

-- Soru #25 (Zorluk: 2)
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
  'Türkiye''de modern ahır ve besi hayvancılığının büyük kentlerin çevresinde yoğunlaşması aşağıdakilerden hangisiyle açıklanamaz?',
  '{"options": ["Süt ve et ürünlerinin kolay bozulan hassas gıdalar olması", "Metropol kentlerin devasa bir tüketici pazarı oluşturması", "Besi hayvancılığının kapalı mekanlarda yapılması nedeniyle doğal çayır ve meralara bağımlı olmaması", "Geniş dağ çayırlarının yalnızca büyük kentlerin çevresinde yer alması", "Şeker fabrikalarından çıkan pancar küspesinin ucuz yem olarak kullanılması"], "correctIndex": 3}'::jsonb,
  'Besi (ahır) hayvancılığı kapalı tesislerde fenni yem ve küspe ile yapılır; meraya veya doğal çayırlara kesinlikle ihtiyaç duymaz. Büyük kentlerin çevresinde çayır olduğu için değil, pazar ve tüketici yakın olduğu için kurulur.',
  'Doğal çayırlar Erzurum-Kars ve Karadeniz dağlarındadır; metropol çevresindeki besi hayvancılığı meraya değil, tamamen yapay yem ve pazara bakar.'
);

-- Soru #26 (Zorluk: 2)
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
  'Türkiye''de üretilen kuru incir ve çekirdeksiz kuru üzüm (sultani üzüm) dünya ticaretinde Türkiye''nin en prestijli ihraç ürünleridir.

Bu iki ürünün üretim ve ihracatında Türkiye lideri olan bölgemiz ve başlıca illeri aşağıdakilerden hangisinde doğru verilmiştir?',
  '{"options": ["İç Anadolu Bölgesi (Konya - Karaman)", "Ege Bölgesi (Aydın - Manisa)", "Güneydoğu Anadolu Bölgesi (Gaziantep - Kilis)", "Marmara Bölgesi (Tekirdağ - Edirne)", "Akdeniz Bölgesi (Mersin - Hatay)"], "correctIndex": 1}'::jsonb,
  'Kuru incir üretiminde Aydın, kuru üzüm üretiminde ise Manisa Ege Bölgesi''nin ve Türkiye''nin tartışmasız dünya lideri merkezleridir.',
  'İncir = Aydın/Büyük Menderes; Üzüm = Manisa/Gediz Havzası. İkisi de Ege''nin altın ürünleridir.'
);

-- Soru #27 (Zorluk: 2)
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
  'Türkiye''de sulama imkanlarının gelişmesiyle birlikte tarım ürünlerinin ekim deseninde köklü değişimler meydana gelir.

Bir yörede modern sulama kanallarının faaliyete geçmesi durumunda aşağıdaki gelişmelerden hangisinin yaşanması beklenmez?',
  '{"options": ["Nadasa bırakılan tarla alanlarının hızla daralması", "Yılda birden fazla ürün (ikinci ürün) alma imkanının doğması", "Endüstriyel sanayi bitkilerinin (mısır, pamuk, sebze) ekim alanının genişlemesi", "Tarımsal üretimde iklim koşullarına bağlı yıllık dalgalanmaların artması", "Tarımsal gelirin artmasına bağlı olarak kırsaldan kente göçün azalması"], "correctIndex": 3}'::jsonb,
  'Sulama yapıldığında çiftçi yağmura bağımlı olmaktan kurtulur; kurak yıllarda bile barajdan su verilebildiği için üretimde yıldan yıla görülen dalgalanmalar ARTMAZ, tam tersine MİNİMUMA İNER ve istikrar sağlanır.',
  'Sulamayla üretimdeki dalgalanma azalır, üretim garantiye alınır.'
);

-- Soru #28 (Zorluk: 2)
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
  'I. Haşhaş — Afyonkarahisar, Konya
II. Kenevir — Samsun
III. Çay — Rize, Trabzon
IV. Muz — Mersin, Antalya

Yukarıda verilen tarım ürünlerinden hangilerinin yetiştirilme alanlarının dar olması ''doğal iklim isteklerinin aşırı seçici olmasından'' değil, ''tamamen devletin yasal kısıtlamasından'' kaynaklanır?',
  '{"options": ["I ve II", "III ve IV", "I ve III", "II ve IV", "I, II ve III"], "correctIndex": 0}'::jsonb,
  'Haşhaş ve kenevir Türkiye''nin hemen her bölgesinde iklim olarak rahatça yetişebilir. Ancak içerdikleri uyuşturucu ve keyif verici maddeler sebebiyle devlet izin vermediği için ekim alanları çok dardır. Çay ve muz ise iklim seçiciliği (mikroklima ihtiyacı) yüzünden dardır.',
  'ÖSYM ''İklim şartı sebebiyle dar olanlar'' (Muz, Çay) ile ''Yasal/Devlet kısıtlamasıyla dar olanlar'' (Haşhaş, Kenevir) ayrımını çok sever.'
);

-- Soru #29 (Zorluk: 2)
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
  'Türkiye''de göl balıkçılığı değerlendirildiğinde aşağıdakilerden hangisi yanlıştır?',
  '{"options": ["Beyşehir ve Eğirdir göllerinde tatlı su levreği ve sazan balıkçılığı yapılır.", "Van Gölü''nün sodalı sularında yaşayan ve üremek için akarsulara göç eden endemik tür ''inci kefali''dir.", "Tuz Gölü''nde balık üretimi Türkiye''nin en karlı tatlı su balıkçılığı sektörünü oluşturur.", "İznik ve Manyas göllerinde kerevit (tatlı su ıstakozu) avcılığı yapılmaktadır.", "Keban ve Atatürk baraj göllerinde alabalık kafes balıkçılığı önemli bir gelir kaynağıdır."], "correctIndex": 2}'::jsonb,
  'Tuz Gölü aşırı tuzlu (tuzluluk oranı %33) olduğu için içerisinde hiçbir balık türü yaşayamaz; Tuz Gölü''nde balıkçılık kesinlikle yapılamaz.',
  'Tuz Gölü ve Burdur Gölü gibi aşırı tuzlu/acı göllerde balık yaşamaz. Van Gölü ise sodalıdır ve sadece inci kefali yaşar.'
);

-- Soru #30 (Zorluk: 2)
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
  'I. Baklagiller içerisinde kuraklığa en dayanıklı olan kırmızı mercimektir.
II. Ayçiçeği tohumlarının olgunlaşma evresinde bol güneş ışığı ve kuraklık gerekir.
III. Çeltik (pirinç) üretimi Türkiye''nin iç tüketimini karşılamaya yettiği için dışarıdan pirinç ithal edilmez.

Yukarıdaki ifadelerden hangileri doğrudur?',
  '{"options": ["Yalnız I", "I ve II", "II ve III", "I ve III", "I, II ve III"], "correctIndex": 1}'::jsonb,
  'I ve II doğrudur. Ancak III numaralı öncül yanlıştır: Türkiye pirinç üretimini Edirne, Balıkesir ve Samsun''da yoğunlaştırsa da yıllık üretim iç tüketimi karşılayamaz; Türkiye düzenli olarak pirinç ithal eden bir ülkedir.',
  'Türkiye çay, fındık, incir, kayısıda kendine yeter ve ihraç eder; ancak pirinç, muz, kahve ve soya fasulyesinde iç tüketimi karşılayamaz ve ithal eder.'
);

-- Soru #31 (Zorluk: 3)
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
  3,
  'Şeker pancarı tarımı Akdeniz ve Ege''nin verimli delta ovalarında (Çukurova, Gediz, Büyük Menderes) iklim ve toprak şartları açısından çok rahat yapılabileceği halde, bu kıyı ovalarında şeker pancarı ekimi neredeyse hiç yapılmamaktadır.

Bu durumun temel iktisadi ve rasyonel nedeni aşağıdakilerden hangisidir?',
  '{"options": ["Kıyı ovalarında pancarın şeker oranının sıfıra düşmesi", "Kıyı ovalarında pamuk, mısır, narenciye ve turfanda sebze gibi ekonomik getirisi pancardan çok daha yüksek alternatif ticari ürünlerin tercih edilmesi", "Kıyı kentlerinde şeker fabrikası kurmanın kanunen yasaklanmış olması", "Kıyı çiftçilerinin kooperatifleşememiş olması", "Kıyı topraklarının aşırı kireçli olması"], "correctIndex": 1}'::jsonb,
  'Şeker pancarı kıyıda çok iyi yetişir; hatta sulamayla devasa verim alınır. Ancak Akdeniz ve Ege ovaları yılda 2-3 hasat alınan altın arazilerdir. Çiftçi 1 dönümden narenciye, muz, turfanda sebze veya pamuk ile çok büyük paralar kazanırken tarlasını 1 yıl boyunca düşük taban fiyatlı pancara bağlamaz.',
  'ÖSYM ''Şeker pancarı neden kıyıda ekilmez?'' sorusunu çok sorar: İklim engeli yoktur! Tek sebep çiftçinin daha karlı alternatif ürünleri tercih etmesidir.'
);

-- Soru #32 (Zorluk: 3)
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
  3,
  'Doğu Karadeniz Bölümü''nde çay tarımı Cumhuriyet''in ilk yıllarında Zihni Derin''in öncülüğünde Gürcistan''dan (Batum) getirilen fidanlarla başlatılmış ve bugün bölgenin temel monokültür ürünü haline gelmiştir.

Türkiye''de çay tarımının yalnızca Doğu Karadeniz kıyı şeridinde tutunabilmesinin temel pedolojik ve mikroklimatik şartı aşağıdakilerden hangisidir?',
  '{"options": ["Kireçli ve alkali taban toprakları ile şiddetli yaz kuraklığı", "Aşırı yıkanmış kireçsiz asidik topraklar, her mevsim yüksek bağıl nem, bulutluluk ve kış donlarının olmaması", "Taban suyunun sıfır metrede olduğu tuzlu bataklıklar", "Volkanik tüf depoları ve sert karasal kış ayazı", "Günde 12 saat dik güneş ışığı alma zorunluluğu"], "correctIndex": 1}'::jsonb,
  'Çay bitkisi kireçli topraktan nefret eder; bol yağışla kireci tamamen yıkanmış asitli toprakları sever. Ayrıca her mevsim düzenli yağış, yüksek bulutluluk (güneşten yaprakların yanmaması) ve kış ılıklığı şarttır. Bu kombinasyon Türkiye''de yalnızca Doğu Karadeniz sahilinde vardır.',
  'Çay asidik toprak ister. Toprağın yıkanmış ve kireçsiz olması çayın olmazsa olmazıdır.'
);

-- Soru #33 (Zorluk: 3)
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
  3,
  'I. Karadeniz kıyılarında deniz suyunun 200 metreden daha derin kısımlarında balık yaşamaz.
II. Karadeniz''de avlanan balık miktarı Akdeniz''den katbekat fazladır.
III. Akdeniz''deki balık türü çeşitliliği Karadeniz''deki tür çeşitliliğinden fazladır.

Yukarıdaki yargılardan hangileri doğrudur?',
  '{"options": ["Yalnız I", "I ve II", "II ve III", "I ve III", "I, II ve III"], "correctIndex": 4}'::jsonb,
  'Her üç öncül de denizlerimizin temel biyolojik kanunlarıdır: Karadeniz''de 200 m altında kükürtlü hidrojen gazı (H2S) canlı hayatını yok eder. Plankton çokluğu yüzünden balık MİKTARI Karadeniz''de zirvedir. Ancak sıcaklık ve tuzluluk nedeniyle balık TÜR ÇEŞİTLİLİĞİ Akdeniz''de çok daha fazladır.',
  'Balık miktarı = Karadeniz; Balık tür çeşitliliği = Akdeniz! Bu ikisi birbirinin tersidir.'
);

-- Soru #34 (Zorluk: 3)
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
  3,
  'Türkiye''de tarım ürünlerinin olgunlaşma ve hasat tarihleri bölgeler arasında farklılık gösterir.

Aynı tarihte ekilen buğdayın sırasıyla;
I. Çukurova
II. Konya Ovası
III. Erzurum Ovası
bölgelerinde hasat edilme sırası (en erkenden en geçe doğru) aşağıdakilerden hangisinde doğru verilmiştir?',
  '{"options": ["I — II — III", "III — II — I", "II — I — III", "I — III — II", "II — III — I"], "correctIndex": 0}'::jsonb,
  'Tarım ürünlerinin olgunlaşma süresini sıcaklık belirler. Çukurova enlem ve denizellik sebebiyle en sıcak yerdir ve hasat ilk olarak Mayıs-Haziranda burada başlar (I). Konya karasaldır, Temmuz başında hasat edilir (II). Erzurum ise yüksek rakım ve soğuk nedeniyle en geç Ağustos sonunda hasat edilir (III).',
  'Hasat sırası: En erken Akdeniz (enlem/denizellik) -> Sonra İç Anadolu -> En geç Doğu Anadolu (yükselti/karasallık).'
);

-- Soru #35 (Zorluk: 3)
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
  3,
  'GAP''ın devreye girmesiyle Şanlıurfa ve çevresinde sulu tarıma geçilmiş, ancak çiftçilerin ''vahşi sulama'' (salma sulama) yöntemini aşırı uygulaması sonucunda topraklarda ciddi bir çevre ve verim felaketi baş göstermiştir.

Vahşi sulamanın kurak ve sıcak Harran Ovası''nda yol açtığı en büyük toprak bozunumu aşağıdakilerden hangisidir?',
  '{"options": ["Toprağın donarak taşlaşması", "Taban suyunun yükselmesi ve şiddetli buharlaşmayla yer altındaki tuz ve minerallerin toprak yüzeyinde birikerek toprağı çoraklaştırması (tuzlanma)", "Toprağın aşırı asitlenerek çöl kumuna dönüşmesi", "Toprakta humus oranının aşırı yükselmesi", "Toprakta heyelanların meydana gelmesi"], "correctIndex": 1}'::jsonb,
  'Sıcak ve buharlaşmanın şiddetli olduğu Harran Ovası''na kontrolsüzce su basıldığında taban suyu yukarı çıkar. Sıcak güneş suyu buharlaştırınca geriye yer altından çektiği kireç ve tuz kalır. Bu durum toprak yüzeyini beyaz bir tuz tabakasıyla kaplayarak arazileri çoraklaştırır.',
  'Güneydoğu''da aşırı sulamanın sonucu heyelan veya erozyon değil; ''toprakta tuzlanma ve çoraklaşma''dır.'
);

-- Soru #36 (Zorluk: 3)
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
  3,
  'Aşağıdaki meyvelerden hangisi dünya pazarında yaş meyve olarak ihraç edildiğinde raf ömrünün kısalığı nedeniyle zorluk yaşandığı için daha çok güneşte kurutularak ''kuru meyve'' halinde dünya ihracat şampiyonu olmuştur?',
  '{"options": ["Kayısı ve İncir", "Karpuz ve Kavun", "Muz ve Kivi", "Portakal ve Mandalina", "Elma ve Armut"], "correctIndex": 0}'::jsonb,
  'Malatya kayısısı ve Aydın inciri taze iken çok çabuk bozulur ve ezilir. Akdeniz ve karasal iklimin şiddetli yaz güneşi altında kükürtlenerek kurutulan bu ürünler, kuru kayısı ve kuru incir olarak Türkiye''nin dünya ihracatında tekelleştiği ana ürünlerdir.',
  'Türkiye yaş meyvede değil, özellikle ''kuru incir'', ''kuru kayısı'', ''çekirdeksiz kuru üzüm'' ve ''fındık''ta dünya ihracat lideridir.'
);

-- Soru #37 (Zorluk: 3)
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
  3,
  'Türkiye''de tarım işletmelerinin (çiftliklerin) yapısı incelendiğinde en büyük yapısal sorunun aşağıdakilerden hangisi olduğu görülür?',
  '{"options": ["Tarım arazilerinin dev şirketlerin elinde tekelleşmesi", "Miras hukuku nedeniyle tarım arazilerinin aşırı bölünerek küçük, parçalı ve birbirinden uzak parsellere dönüşmesi", "Tüm tarlalarda yalnızca tek tip tohum kullanılması", "Türkiye''de çiftçi sayısının nüfusun %50''sini oluşturması", "Gübre kullanımının yasaklanmış olması"], "correctIndex": 1}'::jsonb,
  'Geleneksel miras hukuku her kuşakta tarlaları kardeşler arasında bölmüştür. Bir çiftçinin toplam 40 dönüm arazisi 10 ayrı küçük parça halinde köyün farklı uçlarına dağılmış durumdadır. Bu durum traktör işletme maliyetini artırmakta ve verimi düşürmektedir. Çözüm ''arazi toplulaştırması''dır.',
  'Türkiye tarımının temel yapısal kangreni ''arazilerin mirasla parçalanmış ve dağınık olması''dır.'
);

-- Soru #38 (Zorluk: 3)
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
  3,
  'Sulak alanları, sazlıkları ve bataklık ortamları seven, lifli ve kaba otları süte dönüştürebilen, manda (camız) yetiştiriciliğinin Türkiye''de en yoğun yapıldığı il ve coğrafi alan aşağıdakilerden hangisidir?',
  '{"options": ["Konya — Cihanbeyli Platosu", "Samsun — Kızılırmak Deltası (Bafra Kuş Cenneti sulak alanları)", "Şanlıurfa — Harran Ovası", "Antalya — Teke Platosu", "İzmir — Bakırçay Ovası"], "correctIndex": 1}'::jsonb,
  'Manda suya bağımlı bir hayvandır; derisi kalın olduğu için terleyemez ve çamurlu göletlerde serinler. Türkiye''de manda varlığının en yoğun olduğu yer Samsun''daki Kızılırmak Deltası (Bafra sulak alanları) ve çevresidir (ayrıca Diyarbakır ve İstanbul kırsalı).',
  'Manda kurak yerde yaşayamaz. Bozkır platoları manda için uygun değildir; sulak delta ve göl kenarı (Samsun Bafra) manda merkezidir.'
);

-- Soru #39 (Zorluk: 3)
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
  3,
  'Türkiye''de tarım ürünlerinin ihracat ve ithalat dengesi düşünüldüğünde aşağıdakilerden hangisi Türkiye''nin net İTHALATÇI (dışarıdan satın alan) olduğu ürünlerden biridir?',
  '{"options": ["Fındık", "Kuru İncir", "Kahve", "Kuru Kayısı", "Kiraz"], "correctIndex": 2}'::jsonb,
  'Kahve tropikal bir bitkidir ve Türkiye''de iklim şartları nedeniyle hiçbir yerde yetiştirilemez. ''Türk kahvesi'' bir pişirme ve sunum kültürüdür; hammadde olarak kahve çekirdeğinin %100''ü Brezilya ve Kolombiya gibi ülkelerden ithal edilir.',
  'Türk kahvesi ifadesi adayları yanıltabilir; Türkiye''de kahve üretimi sıfırdır, tamamen ithal edilir.'
);

-- Soru #40 (Zorluk: 3)
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
  3,
  'Karasal iklim bölgelerinde küçükbaş hayvancılık yapan üreticilerin karşılaştığı en temel doğal risk aşağıdakilerden hangisidir?',
  '{"options": ["Aşırı yaz yağışlarıyla otların çürümesi", "İlkbahar kuraklığı yaşandığında bozkır otlarının yetersiz kalması ve yem maliyetlerinin katlanması", "Koyunların sarp kayalıklara tırmanamayıp telef olması", "Akarsu taşkınlarının tüm meraları sular altında bırakması", "Sütlerin sıcaktan dolayı yolda kaynaması"], "correctIndex": 1}'::jsonb,
  'Mera tipi koyun yetiştiriciliği tamamen ilkbahar yağışlarıyla yeşeren doğal bozkır otlarına bağımlıdır. İlkbahar kurak geçtiğinde meralar yeşeremez, hayvanlar aç kalır ve üretici yüksek maliyetli fenni yem almak zorunda kalarak zarar eder.',
  'Karasal meralarda en büyük kriz ilkbahar kuraklığı ve bozkırın yeşerememesidir.'
);

COMMIT;
