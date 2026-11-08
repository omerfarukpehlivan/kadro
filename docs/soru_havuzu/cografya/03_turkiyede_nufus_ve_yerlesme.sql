-- =============================================================
-- KPSS COĞRAFYA — KONU 3: TÜRKIYE'DE NÜFUS VE YERLEŞME
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  1,
  'Cumhuriyet döneminde Türkiye''de ilk genel nüfus sayımı hangi yılda yapılmıştır?',
  '{"options": ["1923", "1927", "1935", "1940", "1950"], "correctIndex": 1}'::jsonb,
  'Cumhuriyet tarihinin ilk resmi genel nüfus sayımı 28 Ekim 1927 tarihinde gerçekleştirilmiş ve Türkiye nüfusu 13.6 milyon olarak tespit edilmiştir. İkinci sayım 1935''te yapılmış ve bundan sonra 1990''a kadar her 5 yılda bir tekrarlanmıştır.',
  'Cumhuriyet 1923''te ilan edilse de ilk nüfus sayımı savaştan yeni çıkmış ülkenin toparlanması beklenerek 1927 yılında yapılabilmiştir.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  1,
  'Türkiye''nin nüfus artış hızı grafiği incelendiğinde, nüfus artış hızının Cumhuriyet tarihinin en düşük seviyesine (yaklaşık binde 10,5) gerilediği dönem aşağıdakilerden hangisidir?',
  '{"options": ["1927 - 1935 Dönemi", "1940 - 1945 Dönemi", "1955 - 1960 Dönemi", "1970 - 1975 Dönemi", "1995 - 2000 Dönemi"], "correctIndex": 1}'::jsonb,
  '1940-1945 yılları arasında II. Dünya Savaşı tehlikesi nedeniyle Türkiye savaşa fiilen girmese de genel seferberlik ilan etmiş, genç erkek nüfus uzun süre silah altına alınmıştır. Bu durum evlilik ve doğum oranlarını düşürmüş, nüfus artış hızını tarihi dip seviyeye çekmiştir.',
  'Nüfus artış hızı düşmüştür ancak toplam nüfus miktarı azalmamıştır! Artış hızı binde 10 bile olsa nüfus büyümeye devam etmiştir.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  1,
  'Toplam nüfusun ülkenin veya bir bölgenin yüz ölçümüne bölünmesiyle elde edilen nüfus yoğunluğuna ne ad verilir?',
  '{"options": ["Fizyolojik Nüfus Yoğunluğu", "Tarımsal Nüfus Yoğunluğu", "Aritmetik Nüfus Yoğunluğu", "Ekonomik Nüfus Yoğunluğu", "Kentsel Nüfus Yoğunluğu"], "correctIndex": 2}'::jsonb,
  'Toplam Nüfus / Toplam Yüzölçümü formülüyle hesaplanan ve km²''ye düşen kişi sayısını ifade eden kavrama ''Aritmetik Nüfus Yoğunluğu'' denir.',
  'Fizyolojik yoğunluk toplam nüfusun ''tarım alanlarına'' bölünmesiyle; tarımsal yoğunluk ise sadece ''tarımla uğraşan nüfusun'' tarım alanlarına bölünmesiyle bulunur.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  1,
  'Türkiye''de aritmetik nüfus yoğunluğunun en fazla olduğu coğrafi bölge aşağıdakilerden hangisidir?',
  '{"options": ["Ege Bölgesi", "Akdeniz Bölgesi", "Marmara Bölgesi", "İç Anadolu Bölgesi", "Güneydoğu Anadolu Bölgesi"], "correctIndex": 2}'::jsonb,
  'Marmara Bölgesi, yüz ölçümü bakımından Türkiye''nin en küçük ikinci bölgesi olmasına rağmen İstanbul, Kocaeli, Bursa gibi dev metropol ve sanayi kentlerini barındırdığı için km²''ye düşen kişi sayısının (aritmetik nüfus yoğunluğunun) en yüksek olduğu bölgedir.',
  'İç Anadolu ve Doğu Anadolu yüz ölçümü çok geniş olduğu için nüfus yoğunlukları düşüktür; Doğu Anadolu aritmetik yoğunluğun en düşük olduğu bölgedir.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  1,
  'Türkiye''de kırsal yerleşmelerde konut yapımında kullanılan doğal malzemeler iklim ve jeolojik yapıya göre şekillenir.

Karadeniz Bölgesi''nin kırsal kesimlerinde ahşap, İç ve Güneydoğu Anadolu''da kerpiç kullanılırken, Akdeniz ve Doğu Anadolu kırsalında konut yapımında en yaygın kullanılan geleneksel doğal malzeme aşağıdakilerden hangisidir?',
  '{"options": ["Tuğla", "Betonarme", "Taş", "Çelik", "Kamış ve Saz"], "correctIndex": 2}'::jsonb,
  'Akdeniz''de kireç taşının (kalker), Doğu ve İç Anadolu''nun volkanik yörelerinde (Nevşehir, Kars vb.) ise volkanik tüf ve bazalt taşının bol olması nedeniyle geleneksel kırsal konutlarda temel malzeme ''taş''tır.',
  'Karadeniz = Ahşap (orman bol), İç ve Güneydoğu Anadolu = Kerpiç (kurak, yağış az), Akdeniz ve volkanik platolar = Taş (kalker ve volkanik kayaçlar).'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  1,
  'Ege kıyılarında Akdeniz iklimi görülmesine ve deniz kıyısında yer almasına rağmen Menteşe Yöresi''nin (Muğla ve çevresi) seyrek nüfuslu olmasının temel nedeni aşağıdakilerden hangisidir?',
  '{"options": ["Yıllık yağış miktarının yetersiz olması", "Arazinin çok dağlık ve engebeli olması, ana ulaşım hatlarına sapa kalması", "Yaz aylarında turizm faaliyetlerinin durması", "Bölgede deprem riskinin hiç bulunmaması", "Kış sıcaklıklarının sıfırın altına inmesi"], "correctIndex": 1}'::jsonb,
  'Menteşe Yöresi bol yağış almasına ve kıyıda olmasına rağmen çok engebeli ve kırıklı dağlık bir topoğrafyaya sahiptir. Tarım alanları dar ve parçalıdır, ayrıca ana ulaşım akslarının kenarında kaldığı için nüfusu seyrektir.',
  'Menteşe bol yağış alır (Türkiye''nin en çok yağış alan yerlerindendir); az nüfuslanmanın nedeni iklim değil, yer şekillerinin engebeli olmasıdır.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  1,
  'Kırsal alanda evlerin birbirinden kilometrelerce uzakta, dağınık bir şekilde kurulduğu ''dağınık yerleşme dokusu'' Türkiye''de en belirgin olarak hangi bölgede görülür?',
  '{"options": ["İç Anadolu Bölgesi", "Doğu Karadeniz Bölümü", "Güneydoğu Anadolu Bölgesi", "Ergene Havzası", "Konya Kapalı Havzası"], "correctIndex": 1}'::jsonb,
  'Dağınık yerleşmenin görülebilmesi için iki temel şart gerekir: 1) Su kaynaklarının her yerde bol olması, 2) Yer şekillerinin çok engebeli ve tarım arazilerinin küçük parçalar halinde dağılmış olması. Bu şartların en kusursuz örneği Doğu Karadeniz''dir.',
  'Toplu yerleşme düzlük ve kurak alanlarda (İç Anadolu); dağınık yerleşme ise dağlık ve bol sulu alanlarda (Karadeniz) görülür.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  1,
  'Aşağıdakilerden hangisi köyden kente yapılan iç göçlerin ''itici'' faktörleri arasında yer almaz?',
  '{"options": ["Tarımsal arazilerin miras yoluyla küçülüp aileleri geçindiremez hale gelmesi", "Tarımda makineleşmeyle birlikte kırsalda insan gücüne duyulan ihtiyacın azalması", "Kentlerde sanayi, ticaret ve hizmet sektörlerinde iş imkanlarının fazla olması", "Kırsal kesimde eğitim ve sağlık hizmetlerinin yetersiz kalması", "Kırsalda kuraklık ve erozyon nedeniyle toprak veriminin düşmesi"], "correctIndex": 2}'::jsonb,
  'Kentlerdeki geniş iş imkanları, zengin eğitim ve sağlık olanakları göçün ''çekici'' (kente çeken) faktörleridir. Kırsaldaki işsizlik, miras bölünmesi, makineleşme ve altyapı yetersizliği ise ''itici'' faktörlerdir.',
  'ÖSYM ''itici'' (kırsalın olumsuzlukları) ve ''çekici'' (kentin cazip olanakları) faktörleri eşleştirme sorularında sıkça karşı karşıya getirir.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  1,
  'Köy altı yerleşmeleri yerleşme süresine göre sürekli (kalıcı) ve geçici yerleşmeler olarak ikiye ayrılır.

Aşağıdakilerden hangisi idari veya ekonomik yapısı itibarıyla ''sürekli (kalıcı)'' köy altı yerleşmeleri arasında yer alır?',
  '{"options": ["Yayla", "Ağıl", "Kom", "Mahalle", "Oba"], "correctIndex": 3}'::jsonb,
  'Mahalle, Divan, Mezra ve Çiftlik sürekli (kalıcı) köy altı yerleşmeleridir. Yayla, kom, ağıl, oba, dam ve dalyan ise genellikle hayvancılık veya mevsimlik amaçla kullanılan ''geçici'' köy altı yerleşmeleridir.',
  'Kalıcı olanlar 4 tanedir: Mahalle, Divan, Mezra, Çiftlik. Diğer hayvancılık barınakları (ağıl, kom, oba, yayla) geçicidir.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  1,
  'Batı Karadeniz Bölümü''nde (Bolu, Karabük, Kastamonu, Sinop) birbirine uzak birkaç mahallenin birleşmesiyle oluşan ve tahıl-orman ekonomisine dayanan geleneksel kalıcı köy altı yerleşmesine ne ad verilir?',
  '{"options": ["Divan", "Dalyan", "Mezra", "Ağıl", "Oba"], "correctIndex": 0}'::jsonb,
  'Divan; özellikle Batı Karadeniz''de (Kastamonu, Sinop, Bolu, Düzce yörelerinde) birkaç mahallenin ortak idari ve ekonomik bağlarla bir araya gelmesiyle oluşan sürekli köy altı yerleşmesidir.',
  'Batı Karadeniz = Divan, Doğu/Güneydoğu Anadolu = Mezra, Ege/Akdeniz balıkçılık = Dalyan, Toroslar göçebe = Oba.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Aşağıdaki harita yörelerinden hangisinde nüfusun seyrek olması ''karstik arazi yapısı ve yer altı sularının derine sızması'' faktörüyle doğrudan ilişkilidir?',
  '{"options": ["Yıldız Dağları Yöresi", "Teke ve Taşeli Platoları", "Biga Yarımadası", "Ergene Havzası", "Tuz Gölü Çevresi"], "correctIndex": 1}'::jsonb,
  'Akdeniz''deki Teke ve Taşeli Platoları kalkerli (kireç taşı) karstik yapılıdır. Yağan yağmur suları yüzeyde akışa geçmeyip derin çatlaklardan yer altına sızar. Bu yüzden yüzey suyu fakirliği, terra rossa topraklarının zayıflığı ve engebe nedeniyle nüfus seyrektir.',
  'Tuz Gölü çevresi kuraklıktan seyrektir; Yıldız Dağları ana yollara uzak ve engebeli olduğu için seyrektir; Teke-Taşeli ise karstik kireç taşı yapısı yüzünden seyrektir.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Fizyolojik nüfus yoğunluğu; bir ülkedeki toplam nüfusun, o ülkedeki mevcut toplam işlenen tarım alanına bölünmesiyle elde edilir.

Buna göre aşağıdaki yörelerin hangisinde fizyolojik nüfus yoğunluğunun diğerlerine göre çok daha yüksek olması beklenir?',
  '{"options": ["Konya Ovası", "Şanlıurfa Platosu", "Doğu Karadeniz Kıyı Kuşağı (Rize - Trabzon)", "Ergene Havzası", "Cihanbeyli Platosu"], "correctIndex": 2}'::jsonb,
  'Doğu Karadeniz kıyı kuşağında nüfus çok kalabalıktır ancak arazi son derece dik ve dağlık olduğu için işlenebilir tarım arazisi yok denecek kadar dar bir şerittir. Pay (nüfus) çok büyük, payda (tarım alanı) çok küçük olunca fizyolojik nüfus yoğunluğu olağanüstü yüksek çıkar.',
  'Konya ve Şanlıurfa''da nüfus çok olsa da tarım arazisi uçsuz bucaksız olduğu için fizyolojik nüfus yoğunluğu düşüktür!'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Türkiye''de tarımsal nüfus yoğunluğunun fazla olduğu yerlerde tarım arazileri dar, engebeli ve tarımda makine kullanımı kısıtlıdır.

Aşağıdaki illerden hangisinde tarımsal nüfus yoğunluğunun Konya iline göre daha yüksek olması beklenir?',
  '{"options": ["Edirne", "Artvin", "Tekirdağ", "Aksaray", "Kırşehir"], "correctIndex": 1}'::jsonb,
  'Artvin son derece engebeli ve dağlık bir araziye sahiptir. Tarım alanları çok dardır ve engebeden dolayı makineli tarım yapılamaz; tarlada insan gücüne bağımlılık yüksektir. Bu sebeple Artvin''de tarımsal nüfus yoğunluğu düz Konya veya Edirne''den çok daha yüksektir.',
  'Tarımsal nüfus yoğunluğunun yüksek olması o ilin çok gelişmiş bir tarım devi olduğu anlamına gelmez; aksine arazinin engebeli, makineli tarımın imkansız ve tarım arazisinin dar olduğunu gösterir.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Türkiye''de mevsimlik (geçici) iç göçler, yılın belirli dönemlerinde tarım, turizm, inşaat veya yaylacılık amacıyla gerçekleşir.

Aşağıdaki şehirlerden hangisi yaz aylarında hem tarımsal hasat hem de turizm amacıyla yoğun mevsimlik iç göç almaktadır?',
  '{"options": ["Rize", "Antalya", "Nevşehir", "Ordu", "Sinop"], "correctIndex": 1}'::jsonb,
  'Antalya, yaz mevsiminde milyonlarca yerli-yabancı turisti ağırlamak için otel ve turizm personeli göçü alırken; aynı zamanda geniş sera alanları, narenciye ve pamuk hasadı için yoğun tarım işçisi göçü çeken nadir merkezlerdendir.',
  'Rize ve Ordu sadece tarım (çay ve fındık); Antalya ise hem dev turizm sektörü hem de narenciye/sera tarımıyla çifte mevsimlik göç mıknatısıdır.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'I. Karadeniz Bölgesi kırsalı
II. İç Anadolu Bölgesi kırsalı
III. Güneydoğu Anadolu Bölgesi kırsalı

Yukarıda verilen bölgelerden hangilerinde ''toplu yerleşme dokusu''nun hakim olmasında yer şekillerinin düz ve su kaynaklarının yetersiz olması belirleyici olmuştur?',
  '{"options": ["Yalnız I", "Yalnız II", "I ve II", "II ve III", "I, II ve III"], "correctIndex": 3}'::jsonb,
  'İç Anadolu ve Güneydoğu Anadolu bölgelerinde yarı kurak iklim nedeniyle su kaynakları kısıtlıdır. İnsanlar kuyu, çeşme veya tek bir akarsu kenarında birbirine bitişik evler inşa etmişlerdir; arazinin düzlüğü de toplu yerleşmeyi desteklemiştir.',
  'Karadeniz dağlık ve suyun bol olduğu yerdir (dağınık yerleşme); İç Anadolu ve Güneydoğu ise düz ve suyun kıt olduğu yerdir (toplu yerleşme).'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Türkiye''nin son yıllardaki nüfus piramidi incelendiğinde tabanın giderek daraldığı, yaşlı nüfus oranının ise %10 eşiğini aşarak arttığı görülmektedir.

Bu demografik değişim Türkiye ile ilgili aşağıdakilerden hangisinin kesin bir göstergesidir?',
  '{"options": ["Doğum oranlarının hızla azaldığının ve ortalama yaşam süresinin uzadığının", "Ölüm oranlarının doğum oranlarını geçtiğinin", "Ülke nüfusunun mutlak olarak azalmaya başladığının", "Kırsal nüfus oranının kent nüfus oranını aştığının", "Dış göç alımının tamamen durduğunun"], "correctIndex": 0}'::jsonb,
  'Nüfus piramidinin tabanının daralması doğum oranlarının ve çocuk nüfusun azaldığını; tepesinin genişlemesi ve yaşlı oranının artması ise sağlık şartlarının iyileşmesi ve ortalama ömrün uzadığını gösterir.',
  'Piramit tabanının daralması nüfusun azaldığını değil, nüfus artış HIZININ azaldığını gösterir. Toplam nüfus halen artmaktadır.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Göçebe yörüklerin Toros dağlarının yüksek yaylalarında çadırlarda kalarak keçi otlattığı, hayvancılığa dayalı geçici köy altı yerleşmesine ne ad verilir?',
  '{"options": ["Kom", "Oba", "Divan", "Mezra", "Dalyan"], "correctIndex": 1}'::jsonb,
  'Oba; özellikle Akdeniz Torosları''nda yörük aşiretlerinin kıl çadırlarda konaklayarak küçükbaş hayvancılık yaptığı geçici köy altı yerleşmesidir.',
  'Doğu Anadolu''daki taş-çit hayvancılık barınağı ''Kom''; Toroslar''daki çadırlı göçebe hayvancılık ise ''Oba''dır.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Doğu Anadolu Bölgesi''nde özellikle Erzurum, Kars ve Muş yörelerinde bir ya da birkaç aileye ait, etrafı taş duvar veya çitlerle çevrili büyükbaş hayvancılık odaklı geçici yerleşmeye ne ad verilir?',
  '{"options": ["Kom", "Dam", "Dalyan", "Divan", "Mahalle"], "correctIndex": 0}'::jsonb,
  'Kom; Doğu Anadolu''da mera hayvancılığı (büyükbaş) yapan ailelerin yazın hayvanlarını barındırmak için taş ve ahşaptan kurduğu geçici köy altı yerleşmesidir.',
  'Ağıl İç Anadolu ve Güneydoğu''da küçükbaş için kullanılırken, Kom Doğu Anadolu''da genellikle büyükbaş hayvancılık barınağıdır.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Türkiye''de kentlerin fonksiyonel özellikleri değerlendirildiğinde aşağıdakilerden hangisi yanlıştır?',
  '{"options": ["İskenderun, Ereğli ve Karabük ağır sanayi fonksiyonuyla büyümüş kentlerdir.", "Batman, ham petrol bulunması ve rafineri kurulmasıyla hızlı kentleşen maden kentidir.", "Konya, Şanlıurfa ve Rize tarım ve tarıma dayalı sanayi fonksiyonu belirgin kentlerdir.", "Sinop, hinterlandı geniş ve ticaret hacmi devasa bir liman kenti olarak gelişmiştir.", "Eskişehir, eğitim ve üniversite fonksiyonu ile genç nüfusu çeken bir kültür kentidir."], "correctIndex": 3}'::jsonb,
  'Sinop doğal bir limana sahip olmasına karşın, gerisindeki Küre Dağları yüzünden iç kesimlerle ulaşım bağlantısı çok zayıftır (hinterlandı dardır). Bu nedenle gelişememiş, liman ve ticaret kenti fonksiyonu kazanamamıştır.',
  'Sinop Karadeniz''in tek doğal limanıdır ancak hinterlandı dar olduğu için gelişememiştir. Samsun ise yapay limandır ama Canik dağları basık olduğu için hinterlandı geniştir ve büyümüştür.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Türkiye''de nüfusun yaş gruplarına dağılımında ''ortanca yaş'' (medyan yaş), nüfusu tam ortadan ikiye bölen yaştır.

Türkiye''de 2000 yılında 24,8 olan ortanca yaşın günümüzde 34''ün üzerine çıkması aşağıdakilerden hangisinin doğrudan bir sonucudur?',
  '{"options": ["Bebek ölüm hızının olağanüstü artış göstermesinin", "Doğurganlık hızının düşmesi ve yaşlı nüfus oranının artmasının", "Dış ülkelere genç beyin göçünün tamamen sona ermesinin", "Tarım sektöründe çalışan nüfus oranının artmasının", "Köyden kente göçün tersine dönerek köylere akının başlamasının"], "correctIndex": 1}'::jsonb,
  'Ortanca yaşın yükselmesi bir toplumun yaşlandığını ifade eder. Türkiye''de kadın başına düşen çocuk sayısının (doğurganlık hızı) 1.5 seviyelerine inmesi ve yaşam kalitesiyle ortalama ömrün uzaması ortanca yaşı hızla yukarı taşımıştır.',
  'Ortanca yaşın yükselmesi gençleşme değil, tam tersine nüfusun yaşlanması (demografik yaşlanma) anlamına gelir.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'I. Çanakkale Boğazı çevresi (Gelibolu Yarımadası)
II. Çatalca - Kocaeli Bölümü
III. Sinop Yöresi
IV. Çukurova Yöresi

Yukarıda verilen alanlardan hangileri uygun iklim şartlarına sahip olmalarına rağmen ana ulaşım akslarına sapa kalmaları ve engebeli arazi yapıları nedeniyle seyrek nüfuslanmıştır?',
  '{"options": ["I ve III", "II ve IV", "I ve II", "III ve IV", "II ve III"], "correctIndex": 0}'::jsonb,
  'Gelibolu Yarımadası (tarihi sit alanı ve sapa kalması) ile Sinop yöresi (Küre Dağları''nın arkasında sapa kalması), ılıman denizel iklime sahip olmalarına karşın ana ticaret ve transit yollarının dışında kaldıkları için seyrek nüfusludur. Çatalca-Kocaeli ve Çukurova ise aşırı yoğun nüfusludur.',
  'Adaylar deniz kenarındaki her yerin yoğun nüfuslu olduğunu sanır. Gelibolu ve Sinop bunun en meşhur iki istisnasıdır.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Türkiye''de iç göç hareketlerine katılan nüfusun demografik yapısı incelendiğinde;

I. Göç edenlerin çoğunluğunu genç dinamik erkek nüfus oluşturur.
II. Göç veren kırsal yörelerde kadın nüfus oranı erkek nüfus oranından fazla çıkar.
III. Göç alan büyük sanayi kentlerinde erkek nüfus oranı kadın nüfustan belirgin fazladır.

yargılarından hangileri doğrudur?',
  '{"options": ["Yalnız I", "Yalnız II", "I ve II", "II ve III", "I, II ve III"], "correctIndex": 4}'::jsonb,
  'Türkiye''de iç göçün lokomotifi iş arayan genç erkeklerdir. Bu sebeple göç veren Doğu Anadolu ve Karadeniz köylerinde kadın nüfus oranı yüksek çıkarken, sanayi ve inşaat kenti olan Kocaeli, Tekirdağ gibi yoğun göç alan yerlerde erkek nüfus oranı yüksektir.',
  'Tüm öncüller birbirini tamamlayan demografik gerçeklerdir. Göç cinsiyet dengesini bölgesel olarak bozar.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Aşağıdaki göç türlerinden hangisi ''uluslararası bir anlaşma ve zorunlu nüfus takası'' esasına dayanan siyasi bir dış göçtür?',
  '{"options": ["1961 Türkiye - Almanya İş Gücü Göçü", "1923 Lozan Barış Antlaşması ile gerçekleşen Türk - Yunan Nüfus Mübadelesi", "1989 Bulgaristan''dan Türkiye''ye yapılan zorunlu sığınmacı göçü", "Suriye iç savaşından kaçan sığınmacıların gelişi", "Üniversite mezunlarının yurt dışına gitmesiyle oluşan beyin göçü"], "correctIndex": 1}'::jsonb,
  '1923 Lozan Antlaşması''na eklenen protokol uyarınca Türkiye''deki Rumlar ile Yunanistan''daki Müslüman Türkler karşılıklı olarak zorunlu yer değiştirmiştir. Bu olaya ''Mübadele Göçü'' denir.',
  'Mübadele iki devletin anlaşmasıyla yapılan yasal ve zorunlu takastır. Almanya göçü iş gücü göçüdür, mübadele değildir.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Ege Bölgesi''nde kıyılarda kurulan ve deniz ürünleri avcılığı ile kültür balıkçılığı yapılan geçici veya daimi köy altı yerleşmelerine ne ad verilir?',
  '{"options": ["Dalyan", "Mezra", "Kom", "Ağıl", "Yayla"], "correctIndex": 0}'::jsonb,
  'Dalyan; kıyılarda, lagün ve nehir ağızlarında balık üretimi ve avcılığı amacıyla kurulan balıkçı yerleşmeleridir (Muğla-Dalyan, İzmir kıyıları).',
  'Dalyan kelimesi balık kapanı ve balıkçı yerleşmesi demektir. Diğer şıkların tamamı hayvancılık veya tarım yerleşmesidir.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Türkiye''de nüfusun kır-kent oranları tarihsel süreçte büyük bir değişim göstermiştir.

Cumhuriyetin ilk yıllarında nüfusun yaklaşık %75''i kırsalda yaşarken, günümüzde kent nüfus oranının %93''ün üzerine çıkmasında aşağıdakilerden hangisi doğrudan etkili OLMAMIŞTIR?',
  '{"options": ["Tarımsal arazilerin erozyon ve mirasla parçalanması", "Sanayileşme ile birlikte kentlerde cazip iş alanlarının doğması", "2012 yılında çıkarılan 6360 sayılı Büyükşehir Yasası ile belde ve köylerin mahalleye dönüştürülmesi", "Kırsal kesimde ölüm oranlarının doğum oranlarını geçerek nüfusun tükenmesi", "Eğitim ve sağlık imkanlarının kentlerde yoğunlaşması"], "correctIndex": 3}'::jsonb,
  'Kırsal kesimde ölüm oranları doğumları geçmemiştir; kırsalda doğal nüfus artışı halen pozitiftir. Ancak yoğun göç ve özellikle 2012''de 30 büyükşehirdeki tüm köylerin yasa ile ''mahalle'' statüsüne geçirilmesi istatistiksel olarak kent nüfusunu bir gecede zıplatmıştır.',
  'Büyükşehir yasası (idari faktör) kent nüfus oranının kağıt üstünde %75''lerden %93''e sıçramasının en büyük gizli nedenidir; köyde ölüm patlaması gibi bir durum söz konusu değildir.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Doğu Anadolu ve Güneydoğu Anadolu bölgelerinde geniş otlakların bulunduğu alanlarda kurulan, tarım ve hayvancılığın bir arada yapıldığı, zamanla kalıcı köye dönüşebilen en yaygın köy altı yerleşmesi hangisidir?',
  '{"options": ["Mezra", "Ağıl", "Dalyan", "Dam", "Oba"], "correctIndex": 0}'::jsonb,
  'Mezra; Doğu ve Güneydoğu Anadolu''da tarım ve hayvancılık yapılan, kalıcı (sürekli) nitelikteki en karakteristik köy altı yerleşmesidir. Çoğu mezra sonradan muhtarlık alarak bağımsız köye dönüşür.',
  'Divan Batı Karadeniz''e özgüyken, Mezra Doğu ve Güneydoğu Anadolu''ya özgü kalıcı yerleşmedir.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Karadeniz Bölgesi''nde yaylacılık faaliyetleri geleneksel olarak hayvancılık amacıyla yapılırken, son yıllarda fonksiyon değiştirmiştir.

Günümüzde özellikle Doğu Karadeniz yaylalarında (Ayder, Uzungöl, Bektaş vb.) yaylacılığın temel ekonomik itici gücü aşağıdakilerden hangisine evrilmiştir?',
  '{"options": ["Maden arama ve sondaj faaliyetlerine", "Turizm ve dinlenme faaliyetlerine", "Sanayi tesisleri kurulumuna", "Büyükbaş süt çiftliklerinin sanayileşmesine", "Seracılık faaliyetlerine"], "correctIndex": 1}'::jsonb,
  'Doğu Karadeniz yaylaları günümüzde yeşil doğası, serin havası ve festivalleriyle eko-turizm, dağ turizmi ve yayla turizminin merkezine dönüşmüş; hayvancılığın önüne turizm geçmiştir.',
  'Akdeniz''de yaylacılık sıcaktan kaçıp dinlenme (sayfiye), Doğu Karadeniz''de ise hayvancılıktan turizme evrilen bir yapı gösterir.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Türkiye''de çalışan nüfusun (faal nüfus) sektörel dağılımı ekonomik kalkınmışlığın en kritik göstergesidir.

Cumhuriyetin ilk yıllarından günümüze çalışan nüfusun sektörlere göre dağılımındaki değişim değerlendirildiğinde aşağıdakilerden hangisi doğrudur?',
  '{"options": ["Tarımdaki çalışan oranı sürekli artış göstererek zirve yapmıştır.", "Hizmet ve sanayi sektöründe çalışanların payı sürekli artarken, tarım sektörünün payı hızla azalmıştır.", "Sanayi sektöründe çalışanların payı hizmet sektörünün çok önüne geçmiştir.", "Madencilik sektöründe çalışanların payı tüm sektörleri geride bırakmıştır.", "Hizmet sektöründe çalışanların oranı sürekli gerilemiştir."], "correctIndex": 1}'::jsonb,
  '1927''de çalışan nüfusun %80''den fazlası tarım sektöründeyken, günümüzde tarımın payı %15-16 bandına inmiş; hizmet sektörü %55-60 ile birinci, sanayi sektörü ise %25-27 ile ikinci sıraya yerleşmiştir.',
  'En çok çalışan sanayide değil ''hizmet'' (ticaret, ulaşım, bankacılık, eğitim vb.) sektöründedir! İkinci sanayi, üçüncü tarımdır.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Tarihi İpek Yolu üzerinde bulunan, zengin kervansaray ve ticaret mirasına sahip, günümüzde ise kavşak noktası olması ve modern organize sanayi bölgeleriyle büyüyen İç Anadolu kenti aşağıdakilerden hangisidir?',
  '{"options": ["Kayseri", "Karaman", "Yozgat", "Çankırı", "Niğde"], "correctIndex": 0}'::jsonb,
  'Kayseri; tarihsel ticaret kenti kimliğini (Kültepe Kaniş Karumu''ndan bu yana) korumuş, günümüzde zengin sanayisi, mobilya üretimi ve kavşak konumuyla İç Anadolu''nun en güçlü ticaret-sanayi metropollerinden biri olmuştur.',
  'Yozgat ve Çankırı göç veren küçük merkezlerken; Kayseri sanayi, ticaret ve kavşak özelliğiyle sürekli göç çeken bir ildir.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  2,
  'Gökçeada ve Bozcaada ile Ege kıyılarında küçükbaş hayvancılık ve bağcılık yapan ailelerin geçici barınaklarına verilen ad hangisidir?',
  '{"options": ["Dam", "Kom", "Divan", "Mahalle", "Dalyan"], "correctIndex": 0}'::jsonb,
  'Dam; Ege kıyılarında, Gökçeada ve Bozcaada''da hayvan barınağı ve kısmen tarım aletlerinin saklandığı geçici köy altı yerleşmesidir.',
  'Dam Ege bölgesine özgü bir geçici yerleşmedir. Doğu Anadolu''daki karşılığı Kom''dur.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  3,
  'Bir bölgede tarımsal nüfus yoğunluğu çok yüksek çıkıyorsa bu durum hakkında aşağıdakilerden hangisi kesin olarak söylenemez?',
  '{"options": ["Tarım arazilerinin dar ve parçalı olduğu", "Yer şekillerinin engebeli ve dağlık olduğu", "Tarımda makine kullanımının topoğrafya nedeniyle zor olduğu", "Birim alandan alınan tarımsal verim ve gelir düzeyinin olağanüstü yüksek olduğu", "Tarımsal üretimde insan ve hayvan gücüne yüksek oranda ihtiyaç duyulduğu"], "correctIndex": 3}'::jsonb,
  'Tarımsal nüfus yoğunluğu (Tarımla uğraşan nüfus / Tarım alanı) formülünde sonucun yüksek çıkması; arazinin dağlık, tarım alanının dar ve makineleşmenin yetersiz olduğunu gösterir (örneğin Rize, Hakkari). Bu alanlarda modern entansif tarım yapılmadığından tarımsal gelir olağanüstü yüksek DEĞİL, aksine kırsal fakirlik fazladır.',
  'Adaylar ''tarımsal yoğunluk fazlaysa tarımsal üretim ve zenginlik de fazladır'' yanılgısına düşer. Tarımsal yoğunluk coğrafi engebe ve makinesizlik göstergesidir, zenginlik göstergesi değildir.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  3,
  'I. Hakkari Yöresi
II. Erzurum - Kars Platosu
III. Yıldız Dağları Yöresi
IV. Taşeli Platosu

Yukarıda verilen seyrek nüfuslu yörelerden hangilerinde nüfusun seyrek olmasında ''olumsuz iklim şartları (kış soğukları ve don olayları)'' birincil faktör konumundadır?',
  '{"options": ["I ve II", "II ve IV", "I ve III", "III ve IV", "II ve III"], "correctIndex": 0}'::jsonb,
  'Hakkari ve Erzurum-Kars yüksek rakım ve sert karasal iklim nedeniyle kışların aşırı soğuk, uzun ve karlı geçtiği yerlerdir; iklim nüfusu kısıtlayan ana etkendir. Yıldız Dağları''nda iklim ılımandır (ulaşıma sapa kalması etkilidir); Taşeli Platosu''nda ise karstik kireç taşı yapısı etkilidir.',
  'Taşeli Platosu Akdeniz''dedir, iklimi ılımandır; nüfusun az olma sebebi iklim değil karstik topoğrafyadır.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  3,
  'Türkiye''de 1960-1965 döneminden itibaren devlet eliyle yürütülen nüfus politikalarında radikal bir eksen kayması yaşanmıştır.

1923-1960 arasında ''pronatalist'' (nüfus artışını teşvik edici) politikalar uygulanırken, 1965 sonrasında ''antinatalist'' (nüfus planlaması ve artış hızını düşürücü) politikalara geçilmesinin temel ekonomik nedeni aşağıdakilerden hangisidir?',
  '{"options": ["Ülke yüz ölçümünün yeni nüfusu barındıramayacak kadar daralması", "Hızlı nüfus artışının kişi başına düşen milli geliri eritmesi ve kalkınma hızının üzerinde kalarak işsizlik yaratması", "Kırsal kesimde tarımsal üretimin tamamen durması", "Tüm komşu ülkelerle savaş tehlikesinin tamamen ortadan kalkması", "Türkiye''nin Avrupa Birliği''ne tam üye kabul edilmesi"], "correctIndex": 1}'::jsonb,
  '1950''lerden sonra sağlık ve beslenmenin iyileşmesiyle nüfus patlaması (%2.85) yaşanmış; devlet yatırımları okullar, hastaneler ve yollar gibi demografik yatırımlara aktarılmak zorunda kalmıştır. Kalkınma hızının düşmesi ve artan işsizlik üzerine 1965''te Nüfus Planlaması Kanunu çıkarılarak doğum kontrolü serbest bırakılmıştır.',
  '1923-1960 arası savaştan çıkan ülkeyi asker ve tarım işçisiyle güçlendirmek için teşvik; 1965 sonrası ise ekonomik kalkınmayı korumak için planlama uygulanmıştır.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  3,
  'Türkiye''de nüfusun kıyılarda yoğunlaşıp iç kesimlerde seyrekleşmesi genel bir kuraldır. Ancak bu kurala uymayan iç kesimlerdeki bazı ''vaha'' kentler çevresine göre olağanüstü yoğun nüfus çekmiştir.

Aşağıdaki iç bölge kentlerinden hangisinin yoğun nüfuslanmasında ''demiryolu kavşağı olması, havacılık ve raylı sistem sanayisi ile üniversite kenti'' kimliği doğrudan etkili olmuştur?',
  '{"options": ["Eskişehir", "Kırşehir", "Amasya", "Yozgat", "Karaman"], "correctIndex": 0}'::jsonb,
  'Eskişehir, Cumhuriyet''in ilk yıllarından itibaren demiryollarının kilit kavşağı (TÜLOMSAŞ), ilk yerli lokomotif Karakurt ve Devrim otomobilinin üretildiği sanayi merkezi, havacılık sanayii (TUSAŞ/TEI) ve iki köklü üniversitesiyle İç Anadolu''nun en gelişmiş ve göç alan metropollerindendir.',
  'Kırşehir ve Yozgat tarım ağırlıklı ve göç veren kentlerdir. Eskişehir sanayi, ulaşım ve eğitim fonksiyonuyla pozitif ayrışır.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  3,
  'Doğu Karadeniz kıyı şeridinde (Trabzon, Rize, Giresun) nüfus yoğunluğunun kilometre kareye 300 kişinin üzerine çıkmasında;

I. Arazinin iç kesimlerinin çok dağlık ve sarp olması nedeniyle halkın dar kıyı şeridine sıkışması,
II. Fındık ve çay tarımının yoğun insan emeğine dayalı olması,
III. Kıyıda devasa otomotiv ve demir-çelik ağır sanayi tesislerinin bulunması

faktörlerinden hangileri etkilidir?',
  '{"options": ["Yalnız I", "I ve II", "II ve III", "I ve III", "I, II ve III"], "correctIndex": 1}'::jsonb,
  'Doğu Karadeniz kıyısında arazinin dikliği yerleşmeyi zorunlu olarak sahil bandına ve vadi tabanlarına hapsetmiştir. Ayrıca çay ve fındık tarımı yoğun iş gücü ister. Ancak Doğu Karadeniz''de ağır demir-çelik veya otomotiv sanayii kesinlikle YOKTUR (Karabük ve Ereğli Batı Karadeniz''dedir).',
  'Doğu Karadeniz''de ağır sanayi yoktur! Nüfus yoğunluğu tamamen topografik sıkışma ve monokültür tarımdan (çay-fındık) kaynaklanır.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  3,
  'Türkiye''de kırsal alanlardan şehirlere yapılan kontrolsüz ve hızlı göçlerin kentlerde yarattığı sorunlar arasında aşağıdakilerden hangisi yer almaz?',
  '{"options": ["Gecekondulaşma ve çarpık kentleşmenin artması", "Trafik sıkışıklığı ve toplu taşıma yetersizlikleri", "Belediye altyapı hizmetlerinin (su, kanalizasyon, atık) yetersiz kalması", "Demografik yatırımların (okul, hastane) yükünün artması", "Kentlerde sanayi yatırımlarının iş gücü bulamayarak durma noktasına gelmesi"], "correctIndex": 4}'::jsonb,
  'Hızlı iç göç kentlerde iş gücü kıtlığı değil, tam aksine aşırı ucuz ve niteliksiz iş gücü fazlasına, yani kentsel gizli ve açık işsizliğe yol açar.',
  'Göç alan kentte iş gücü açığı oluşmaz; iş gücü arzı patlar ve işsizlik ile düşük ücret sorunu doğar.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  3,
  'Türkiye''de nüfusun cinsiyet yapısı incelendiğinde ülke genelinde kadın ve erkek oranları birbirine çok yakın olmakla birlikte (%50.1 erkek, %49.9 kadın), bazı şehirlerde bu oran erkekler veya kadınlar lehine belirgin biçimde bozulur.

Aşağıdaki şehir çiftlerinin hangisinde erkek nüfus oranının kadın nüfus oranından belirgin derecede yüksek olması beklenir?',
  '{"options": ["Kastamonu — Sinop", "Rize — Giresun", "Tekirdağ — Kocaeli", "Artvin — Bayburt", "Gümüşhane — Kars"], "correctIndex": 2}'::jsonb,
  'Tekirdağ (Çorlu/Çerkezköy) ve Kocaeli (Gebze/İzmit) Türkiye''nin en büyük sanayi merkezleridir ve fabrikalarda çalışmak üzere Türkiye''nin her yerinden yoğun genç erkek göçü çekerler. Diğer şıklardaki iller ise erkeklerini dışarıya göç veren illerdir.',
  'Sanayi ve asker kışlası olan şehirlerde erkek oranı; göç veren kırsal illerde (Sinop, Kastamonu, Giresun) ise kadın oranı daha yüksek çıkar.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  3,
  'Türkiye''de geçici köy altı yerleşmelerinin zamanla sürekli yerleşmeye (kalıcı köye) dönüşmesinde temel belirleyici faktör aşağıdakilerden hangisidir?',
  '{"options": ["Bölgede heyelan riskinin artması", "Ekonomik faaliyetin sadece dönemsel hayvancılıktan çıkıp tarım ve daimi ziraat üretimine dönüşmesi", "Yerleşmenin deniz seviyesinden 2000 metre yukarıya taşınması", "Bölgede kerpiç yerine ahşap evlerin inşa edilmeye başlanması", "Yöre halkının dış ülkelere işçi olarak gitmesi"], "correctIndex": 1}'::jsonb,
  'Bir köy altı yerleşmesinin geçicilikten kalıcılığa geçmesini sağlayan ana etken; geçim kaynağının mevsime bağlı yaylacılık veya otlatmacılıktan çıkıp toprağa bağlı sürekli tarım ve ziraat faaliyetine dönüşmesidir. Tarım insanı yıl boyu tarlaya bağlar.',
  'Hayvancılık mevsimlik göçü gerektirirken; tarım ve bağ-bahçe faaliyeti yıl boyu orada kalmayı (kalıcı yerleşmeyi) zorunlu kılar.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  3,
  'I. Yaz aylarında Çukurova ve Amik ovalarına pamuk çapalamak ve toplamak için gidilmesi
II. Sonbaharda Ordu ve Giresun''a fındık hasadı için binlerce mevsimlik işçinin gitmesi
III. İlkbahar ve yaz aylarında Şanlıurfa ve Diyarbakır''dan İç Anadolu''ya şeker pancarı çapası için ailelerin göç etmesi

Yukarıda verilen mevsimlik göç hareketlerinin ortak özelliği aşağıdakilerden hangisidir?',
  '{"options": ["Gittikleri yerlerde aritmetik nüfus yoğunluğunu kalıcı olarak artırmaları", "Tarımsal ürünlerin hasat ve bakım dönemlerine bağlı geçici iş gücü hareketleri olmaları", "Tamamının kış mevsiminde yoğunlaşması", "Maden ocaklarında istihdam edilmek üzere yapılmaları", "Gittikleri illerde kentsel nüfus sayımına dahil edilmeleri"], "correctIndex": 1}'::jsonb,
  'Verilen üç örnek de Türkiye''de tarımsal hasat ve bakım takvimine göre hareket eden gezici mevsimlik tarım işçiliği hareketidir. İş bitiminde bu işçiler kendi memleketlerine geri dönerler.',
  'Mevsimlik tarım göçü geçicidir, kalıcı nüfusu artırmaz; sadece yaz ve sonbahar aylarında o illerin fiili nüfusunu geçici olarak şişirir.'
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
  'Türkiye''de Nüfus ve Yerleşme',
  'multiple_choice',
  3,
  'Türkiye''de demografik göstergeler değerlendirildiğinde aşağıdakilerden hangisi bir ilin ''net göç hızının pozitif'' (göç alan il) olduğunu en güçlü şekilde kanıtlar?',
  '{"options": ["İldeki fizyolojik nüfus yoğunluğunun aşırı yüksek olması", "İlin toplam nüfus artış hızının, ildeki doğal nüfus artış hızından (doğumlar - ölümler) belirgin derecede yüksek çıkması", "İldeki tarımsal üretimin tamamen geleneksel yöntemlerle yapılması", "İlde kadın nüfusunun erkek nüfusundan fazla olması", "İldeki yaşlı nüfus oranının Türkiye ortalamasının iki katı olması"], "correctIndex": 1}'::jsonb,
  'Doğal nüfus artışı (doğum eksi ölüm) bir ilin kendi içindeki üreme artışıdır. Eğer bir ilin gerçek nüfus artış hızı doğal artış hızından çok daha büyük çıkıyorsa; aradaki bu devasa fark kesinlikle dışarıdan gelen net göçün (pozitif göç hızı) göstergesidir.',
  'ÖSYM ''Doğal artış hızı'' ile ''Gerçek nüfus artış hızı'' arasındaki makası sorar: Gerçek artış > Doğal artış = Göç alıyor; Gerçek artış < Doğal artış = Göç veriyor!'
);

COMMIT;
