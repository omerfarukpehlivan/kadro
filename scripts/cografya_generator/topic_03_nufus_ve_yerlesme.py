# -*- coding: utf-8 -*-
"""
KPSS Coğrafya — Konu 3: Türkiye'de Nüfus ve Yerleşme (40 Özgün Soru)
Pedagojik standart:
- 10 Soru: Zorluk 1 (Isınma / Temel Seviye)
- 20 Soru: Zorluk 2 (Standart Sınav Ayarı)
- 10 Soru: Zorluk 3 (Net Sıçratan / Kurtlar Sofrası)
Tüm sorular 'explanation' ve 'distractor_trap' içerir.
"""

questions = [
    # -------------------------------------------------------------
    # TEST 1: ISINMA & TEMEL KAVRAMLAR (Zorluk: 1) - Sorular 1-10
    # -------------------------------------------------------------
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'de Nüfus ve Yerleşme",
        "difficulty": 1,
        "prompt_text": "Cumhuriyet döneminde Türkiye'de ilk genel nüfus sayımı hangi yılda yapılmıştır?",
        "options": [
            "1923",
            "1927",
            "1935",
            "1940",
            "1950"
        ],
        "correctIndex": 1,
        "explanation": "Cumhuriyet tarihinin ilk resmi genel nüfus sayımı 28 Ekim 1927 tarihinde gerçekleştirilmiş ve Türkiye nüfusu 13.6 milyon olarak tespit edilmiştir. İkinci sayım 1935'te yapılmış ve bundan sonra 1990'a kadar her 5 yılda bir tekrarlanmıştır.",
        "distractor_trap": "Cumhuriyet 1923'te ilan edilse de ilk nüfus sayımı savaştan yeni çıkmış ülkenin toparlanması beklenerek 1927 yılında yapılabilmiştir."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'de Nüfus ve Yerleşme",
        "difficulty": 1,
        "prompt_text": "Türkiye'nin nüfus artış hızı grafiği incelendiğinde, nüfus artış hızının Cumhuriyet tarihinin en düşük seviyesine (yaklaşık binde 10,5) gerilediği dönem aşağıdakilerden hangisidir?",
        "options": [
            "1927 - 1935 Dönemi",
            "1940 - 1945 Dönemi",
            "1955 - 1960 Dönemi",
            "1970 - 1975 Dönemi",
            "1995 - 2000 Dönemi"
        ],
        "correctIndex": 1,
        "explanation": "1940-1945 yılları arasında II. Dünya Savaşı tehlikesi nedeniyle Türkiye savaşa fiilen girmese de genel seferberlik ilan etmiş, genç erkek nüfus uzun süre silah altına alınmıştır. Bu durum evlilik ve doğum oranlarını düşürmüş, nüfus artış hızını tarihi dip seviyeye çekmiştir.",
        "distractor_trap": "Nüfus artış hızı düşmüştür ancak toplam nüfus miktarı azalmamıştır! Artış hızı binde 10 bile olsa nüfus büyümeye devam etmiştir."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'de Nüfus ve Yerleşme",
        "difficulty": 1,
        "prompt_text": "Toplam nüfusun ülkenin veya bir bölgenin yüz ölçümüne bölünmesiyle elde edilen nüfus yoğunluğuna ne ad verilir?",
        "options": [
            "Fizyolojik Nüfus Yoğunluğu",
            "Tarımsal Nüfus Yoğunluğu",
            "Aritmetik Nüfus Yoğunluğu",
            "Ekonomik Nüfus Yoğunluğu",
            "Kentsel Nüfus Yoğunluğu"
        ],
        "correctIndex": 2,
        "explanation": "Toplam Nüfus / Toplam Yüzölçümü formülüyle hesaplanan ve km²'ye düşen kişi sayısını ifade eden kavrama 'Aritmetik Nüfus Yoğunluğu' denir.",
        "distractor_trap": "Fizyolojik yoğunluk toplam nüfusun 'tarım alanlarına' bölünmesiyle; tarımsal yoğunluk ise sadece 'tarımla uğraşan nüfusun' tarım alanlarına bölünmesiyle bulunur."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'de Nüfus ve Yerleşme",
        "difficulty": 1,
        "prompt_text": "Türkiye'de aritmetik nüfus yoğunluğunun en fazla olduğu coğrafi bölge aşağıdakilerden hangisidir?",
        "options": [
            "Ege Bölgesi",
            "Akdeniz Bölgesi",
            "Marmara Bölgesi",
            "İç Anadolu Bölgesi",
            "Güneydoğu Anadolu Bölgesi"
        ],
        "correctIndex": 2,
        "explanation": "Marmara Bölgesi, yüz ölçümü bakımından Türkiye'nin en küçük ikinci bölgesi olmasına rağmen İstanbul, Kocaeli, Bursa gibi dev metropol ve sanayi kentlerini barındırdığı için km²'ye düşen kişi sayısının (aritmetik nüfus yoğunluğunun) en yüksek olduğu bölgedir.",
        "distractor_trap": "İç Anadolu ve Doğu Anadolu yüz ölçümü çok geniş olduğu için nüfus yoğunlukları düşüktür; Doğu Anadolu aritmetik yoğunluğun en düşük olduğu bölgedir."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'de Nüfus ve Yerleşme",
        "difficulty": 1,
        "prompt_text": "Türkiye'de kırsal yerleşmelerde konut yapımında kullanılan doğal malzemeler iklim ve jeolojik yapıya göre şekillenir.\n\nKaradeniz Bölgesi'nin kırsal kesimlerinde ahşap, İç ve Güneydoğu Anadolu'da kerpiç kullanılırken, Akdeniz ve Doğu Anadolu kırsalında konut yapımında en yaygın kullanılan geleneksel doğal malzeme aşağıdakilerden hangisidir?",
        "options": [
            "Tuğla",
            "Betonarme",
            "Taş",
            "Çelik",
            "Kamış ve Saz"
        ],
        "correctIndex": 2,
        "explanation": "Akdeniz'de kireç taşının (kalker), Doğu ve İç Anadolu'nun volkanik yörelerinde (Nevşehir, Kars vb.) ise volkanik tüf ve bazalt taşının bol olması nedeniyle geleneksel kırsal konutlarda temel malzeme 'taş'tır.",
        "distractor_trap": "Karadeniz = Ahşap (orman bol), İç ve Güneydoğu Anadolu = Kerpiç (kurak, yağış az), Akdeniz ve volkanik platolar = Taş (kalker ve volkanik kayaçlar)."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'de Nüfus ve Yerleşme",
        "difficulty": 1,
        "prompt_text": "Ege kıyılarında Akdeniz iklimi görülmesine ve deniz kıyısında yer almasına rağmen Menteşe Yöresi'nin (Muğla ve çevresi) seyrek nüfuslu olmasının temel nedeni aşağıdakilerden hangisidir?",
        "options": [
            "Yıllık yağış miktarının yetersiz olması",
            "Arazinin çok dağlık ve engebeli olması, ana ulaşım hatlarına sapa kalması",
            "Yaz aylarında turizm faaliyetlerinin durması",
            "Bölgede deprem riskinin hiç bulunmaması",
            "Kış sıcaklıklarının sıfırın altına inmesi"
        ],
        "correctIndex": 1,
        "explanation": "Menteşe Yöresi bol yağış almasına ve kıyıda olmasına rağmen çok engebeli ve kırıklı dağlık bir topoğrafyaya sahiptir. Tarım alanları dar ve parçalıdır, ayrıca ana ulaşım akslarının kenarında kaldığı için nüfusu seyrektir.",
        "distractor_trap": "Menteşe bol yağış alır (Türkiye'nin en çok yağış alan yerlerindendir); az nüfuslanmanın nedeni iklim değil, yer şekillerinin engebeli olmasıdır."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'de Nüfus ve Yerleşme",
        "difficulty": 1,
        "prompt_text": "Kırsal alanda evlerin birbirinden kilometrelerce uzakta, dağınık bir şekilde kurulduğu 'dağınık yerleşme dokusu' Türkiye'de en belirgin olarak hangi bölgede görülür?",
        "options": [
            "İç Anadolu Bölgesi",
            "Doğu Karadeniz Bölümü",
            "Güneydoğu Anadolu Bölgesi",
            "Ergene Havzası",
            "Konya Kapalı Havzası"
        ],
        "correctIndex": 1,
        "explanation": "Dağınık yerleşmenin görülebilmesi için iki temel şart gerekir: 1) Su kaynaklarının her yerde bol olması, 2) Yer şekillerinin çok engebeli ve tarım arazilerinin küçük parçalar halinde dağılmış olması. Bu şartların en kusursuz örneği Doğu Karadeniz'dir.",
        "distractor_trap": "Toplu yerleşme düzlük ve kurak alanlarda (İç Anadolu); dağınık yerleşme ise dağlık ve bol sulu alanlarda (Karadeniz) görülür."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'de Nüfus ve Yerleşme",
        "difficulty": 1,
        "prompt_text": "Aşağıdakilerden hangisi köyden kente yapılan iç göçlerin 'itici' faktörleri arasında yer almaz?",
        "options": [
            "Tarımsal arazilerin miras yoluyla küçülüp aileleri geçindiremez hale gelmesi",
            "Tarımda makineleşmeyle birlikte kırsalda insan gücüne duyulan ihtiyacın azalması",
            "Kentlerde sanayi, ticaret ve hizmet sektörlerinde iş imkanlarının fazla olması",
            "Kırsal kesimde eğitim ve sağlık hizmetlerinin yetersiz kalması",
            "Kırsalda kuraklık ve erozyon nedeniyle toprak veriminin düşmesi"
        ],
        "correctIndex": 2,
        "explanation": "Kentlerdeki geniş iş imkanları, zengin eğitim ve sağlık olanakları göçün 'çekici' (kente çeken) faktörleridir. Kırsaldaki işsizlik, miras bölünmesi, makineleşme ve altyapı yetersizliği ise 'itici' faktörlerdir.",
        "distractor_trap": "ÖSYM 'itici' (kırsalın olumsuzlukları) ve 'çekici' (kentin cazip olanakları) faktörleri eşleştirme sorularında sıkça karşı karşıya getirir."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'de Nüfus ve Yerleşme",
        "difficulty": 1,
        "prompt_text": "Köy altı yerleşmeleri yerleşme süresine göre sürekli (kalıcı) ve geçici yerleşmeler olarak ikiye ayrılır.\n\nAşağıdakilerden hangisi idari veya ekonomik yapısı itibarıyla 'sürekli (kalıcı)' köy altı yerleşmeleri arasında yer alır?",
        "options": [
            "Yayla",
            "Ağıl",
            "Kom",
            "Mahalle",
            "Oba"
        ],
        "correctIndex": 3,
        "explanation": "Mahalle, Divan, Mezra ve Çiftlik sürekli (kalıcı) köy altı yerleşmeleridir. Yayla, kom, ağıl, oba, dam ve dalyan ise genellikle hayvancılık veya mevsimlik amaçla kullanılan 'geçici' köy altı yerleşmeleridir.",
        "distractor_trap": "Kalıcı olanlar 4 tanedir: Mahalle, Divan, Mezra, Çiftlik. Diğer hayvancılık barınakları (ağıl, kom, oba, yayla) geçicidir."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'de Nüfus ve Yerleşme",
        "difficulty": 1,
        "prompt_text": "Batı Karadeniz Bölümü'nde (Bolu, Karabük, Kastamonu, Sinop) birbirine uzak birkaç mahallenin birleşmesiyle oluşan ve tahıl-orman ekonomisine dayanan geleneksel kalıcı köy altı yerleşmesine ne ad verilir?",
        "options": [
            "Divan",
            "Dalyan",
            "Mezra",
            "Ağıl",
            "Oba"
        ],
        "correctIndex": 0,
        "explanation": "Divan; özellikle Batı Karadeniz'de (Kastamonu, Sinop, Bolu, Düzce yörelerinde) birkaç mahallenin ortak idari ve ekonomik bağlarla bir araya gelmesiyle oluşan sürekli köy altı yerleşmesidir.",
        "distractor_trap": "Batı Karadeniz = Divan, Doğu/Güneydoğu Anadolu = Mezra, Ege/Akdeniz balıkçılık = Dalyan, Toroslar göçebe = Oba."
    },

    # -------------------------------------------------------------
    # TEST 2: STANDART ÖSYM AYARI (Zorluk: 2) - Sorular 11-20
    # -------------------------------------------------------------
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'de Nüfus ve Yerleşme",
        "difficulty": 2,
        "prompt_text": "Aşağıdaki harita yörelerinden hangisinde nüfusun seyrek olması 'karstik arazi yapısı ve yer altı sularının derine sızması' faktörüyle doğrudan ilişkilidir?",
        "options": [
            "Yıldız Dağları Yöresi",
            "Teke ve Taşeli Platoları",
            "Biga Yarımadası",
            "Ergene Havzası",
            "Tuz Gölü Çevresi"
        ],
        "correctIndex": 1,
        "explanation": "Akdeniz'deki Teke ve Taşeli Platoları kalkerli (kireç taşı) karstik yapılıdır. Yağan yağmur suları yüzeyde akışa geçmeyip derin çatlaklardan yer altına sızar. Bu yüzden yüzey suyu fakirliği, terra rossa topraklarının zayıflığı ve engebe nedeniyle nüfus seyrektir.",
        "distractor_trap": "Tuz Gölü çevresi kuraklıktan seyrektir; Yıldız Dağları ana yollara uzak ve engebeli olduğu için seyrektir; Teke-Taşeli ise karstik kireç taşı yapısı yüzünden seyrektir."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'de Nüfus ve Yerleşme",
        "difficulty": 2,
        "prompt_text": "Fizyolojik nüfus yoğunluğu; bir ülkedeki toplam nüfusun, o ülkedeki mevcut toplam işlenen tarım alanına bölünmesiyle elde edilir.\n\nBuna göre aşağıdaki yörelerin hangisinde fizyolojik nüfus yoğunluğunun diğerlerine göre çok daha yüksek olması beklenir?",
        "options": [
            "Konya Ovası",
            "Şanlıurfa Platosu",
            "Doğu Karadeniz Kıyı Kuşağı (Rize - Trabzon)",
            "Ergene Havzası",
            "Cihanbeyli Platosu"
        ],
        "correctIndex": 2,
        "explanation": "Doğu Karadeniz kıyı kuşağında nüfus çok kalabalıktır ancak arazi son derece dik ve dağlık olduğu için işlenebilir tarım arazisi yok denecek kadar dar bir şerittir. Pay (nüfus) çok büyük, payda (tarım alanı) çok küçük olunca fizyolojik nüfus yoğunluğu olağanüstü yüksek çıkar.",
        "distractor_trap": "Konya ve Şanlıurfa'da nüfus çok olsa da tarım arazisi uçsuz bucaksız olduğu için fizyolojik nüfus yoğunluğu düşüktür!"
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'de Nüfus ve Yerleşme",
        "difficulty": 2,
        "prompt_text": "Türkiye'de tarımsal nüfus yoğunluğunun fazla olduğu yerlerde tarım arazileri dar, engebeli ve tarımda makine kullanımı kısıtlıdır.\n\nAşağıdaki illerden hangisinde tarımsal nüfus yoğunluğunun Konya iline göre daha yüksek olması beklenir?",
        "options": [
            "Edirne",
            "Artvin",
            "Tekirdağ",
            "Aksaray",
            "Kırşehir"
        ],
        "correctIndex": 1,
        "explanation": "Artvin son derece engebeli ve dağlık bir araziye sahiptir. Tarım alanları çok dardır ve engebeden dolayı makineli tarım yapılamaz; tarlada insan gücüne bağımlılık yüksektir. Bu sebeple Artvin'de tarımsal nüfus yoğunluğu düz Konya veya Edirne'den çok daha yüksektir.",
        "distractor_trap": "Tarımsal nüfus yoğunluğunun yüksek olması o ilin çok gelişmiş bir tarım devi olduğu anlamına gelmez; aksine arazinin engebeli, makineli tarımın imkansız ve tarım arazisinin dar olduğunu gösterir."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'de Nüfus ve Yerleşme",
        "difficulty": 2,
        "prompt_text": "Türkiye'de mevsimlik (geçici) iç göçler, yılın belirli dönemlerinde tarım, turizm, inşaat veya yaylacılık amacıyla gerçekleşir.\n\nAşağıdaki şehirlerden hangisi yaz aylarında hem tarımsal hasat hem de turizm amacıyla yoğun mevsimlik iç göç almaktadır?",
        "options": [
            "Rize",
            "Antalya",
            "Nevşehir",
            "Ordu",
            "Sinop"
        ],
        "correctIndex": 1,
        "explanation": "Antalya, yaz mevsiminde milyonlarca yerli-yabancı turisti ağırlamak için otel ve turizm personeli göçü alırken; aynı zamanda geniş sera alanları, narenciye ve pamuk hasadı için yoğun tarım işçisi göçü çeken nadir merkezlerdendir.",
        "distractor_trap": "Rize ve Ordu sadece tarım (çay ve fındık); Antalya ise hem dev turizm sektörü hem de narenciye/sera tarımıyla çifte mevsimlik göç mıknatısıdır."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'de Nüfus ve Yerleşme",
        "difficulty": 2,
        "prompt_text": "I. Karadeniz Bölgesi kırsalı\nII. İç Anadolu Bölgesi kırsalı\nIII. Güneydoğu Anadolu Bölgesi kırsalı\n\nYukarıda verilen bölgelerden hangilerinde 'toplu yerleşme dokusu'nun hakim olmasında yer şekillerinin düz ve su kaynaklarının yetersiz olması belirleyici olmuştur?",
        "options": [
            "Yalnız I",
            "Yalnız II",
            "I ve II",
            "II ve III",
            "I, II ve III"
        ],
        "correctIndex": 3,
        "explanation": "İç Anadolu ve Güneydoğu Anadolu bölgelerinde yarı kurak iklim nedeniyle su kaynakları kısıtlıdır. İnsanlar kuyu, çeşme veya tek bir akarsu kenarında birbirine bitişik evler inşa etmişlerdir; arazinin düzlüğü de toplu yerleşmeyi desteklemiştir.",
        "distractor_trap": "Karadeniz dağlık ve suyun bol olduğu yerdir (dağınık yerleşme); İç Anadolu ve Güneydoğu ise düz ve suyun kıt olduğu yerdir (toplu yerleşme)."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'de Nüfus ve Yerleşme",
        "difficulty": 2,
        "prompt_text": "Türkiye'nin son yıllardaki nüfus piramidi incelendiğinde tabanın giderek daraldığı, yaşlı nüfus oranının ise %10 eşiğini aşarak arttığı görülmektedir.\n\nBu demografik değişim Türkiye ile ilgili aşağıdakilerden hangisinin kesin bir göstergesidir?",
        "options": [
            "Doğum oranlarının hızla azaldığının ve ortalama yaşam süresinin uzadığının",
            "Ölüm oranlarının doğum oranlarını geçtiğinin",
            "Ülke nüfusunun mutlak olarak azalmaya başladığının",
            "Kırsal nüfus oranının kent nüfus oranını aştığının",
            "Dış göç alımının tamamen durduğunun"
        ],
        "correctIndex": 0,
        "explanation": "Nüfus piramidinin tabanının daralması doğum oranlarının ve çocuk nüfusun azaldığını; tepesinin genişlemesi ve yaşlı oranının artması ise sağlık şartlarının iyileşmesi ve ortalama ömrün uzadığını gösterir.",
        "distractor_trap": "Piramit tabanının daralması nüfusun azaldığını değil, nüfus artış HIZININ azaldığını gösterir. Toplam nüfus halen artmaktadır."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'de Nüfus ve Yerleşme",
        "difficulty": 2,
        "prompt_text": "Göçebe yörüklerin Toros dağlarının yüksek yaylalarında çadırlarda kalarak keçi otlattığı, hayvancılığa dayalı geçici köy altı yerleşmesine ne ad verilir?",
        "options": [
            "Kom",
            "Oba",
            "Divan",
            "Mezra",
            "Dalyan"
        ],
        "correctIndex": 1,
        "explanation": "Oba; özellikle Akdeniz Torosları'nda yörük aşiretlerinin kıl çadırlarda konaklayarak küçükbaş hayvancılık yaptığı geçici köy altı yerleşmesidir.",
        "distractor_trap": "Doğu Anadolu'daki taş-çit hayvancılık barınağı 'Kom'; Toroslar'daki çadırlı göçebe hayvancılık ise 'Oba'dır."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'de Nüfus ve Yerleşme",
        "difficulty": 2,
        "prompt_text": "Doğu Anadolu Bölgesi'nde özellikle Erzurum, Kars ve Muş yörelerinde bir ya da birkaç aileye ait, etrafı taş duvar veya çitlerle çevrili büyükbaş hayvancılık odaklı geçici yerleşmeye ne ad verilir?",
        "options": [
            "Kom",
            "Dam",
            "Dalyan",
            "Divan",
            "Mahalle"
        ],
        "correctIndex": 0,
        "explanation": "Kom; Doğu Anadolu'da mera hayvancılığı (büyükbaş) yapan ailelerin yazın hayvanlarını barındırmak için taş ve ahşaptan kurduğu geçici köy altı yerleşmesidir.",
        "distractor_trap": "Ağıl İç Anadolu ve Güneydoğu'da küçükbaş için kullanılırken, Kom Doğu Anadolu'da genellikle büyükbaş hayvancılık barınağıdır."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'de Nüfus ve Yerleşme",
        "difficulty": 2,
        "prompt_text": "Türkiye'de kentlerin fonksiyonel özellikleri değerlendirildiğinde aşağıdakilerden hangisi yanlıştır?",
        "options": [
            "İskenderun, Ereğli ve Karabük ağır sanayi fonksiyonuyla büyümüş kentlerdir.",
            "Batman, ham petrol bulunması ve rafineri kurulmasıyla hızlı kentleşen maden kentidir.",
            "Konya, Şanlıurfa ve Rize tarım ve tarıma dayalı sanayi fonksiyonu belirgin kentlerdir.",
            "Sinop, hinterlandı geniş ve ticaret hacmi devasa bir liman kenti olarak gelişmiştir.",
            "Eskişehir, eğitim ve üniversite fonksiyonu ile genç nüfusu çeken bir kültür kentidir."
        ],
        "correctIndex": 3,
        "explanation": "Sinop doğal bir limana sahip olmasına karşın, gerisindeki Küre Dağları yüzünden iç kesimlerle ulaşım bağlantısı çok zayıftır (hinterlandı dardır). Bu nedenle gelişememiş, liman ve ticaret kenti fonksiyonu kazanamamıştır.",
        "distractor_trap": "Sinop Karadeniz'in tek doğal limanıdır ancak hinterlandı dar olduğu için gelişememiştir. Samsun ise yapay limandır ama Canik dağları basık olduğu için hinterlandı geniştir ve büyümüştür."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'de Nüfus ve Yerleşme",
        "difficulty": 2,
        "prompt_text": "Türkiye'de nüfusun yaş gruplarına dağılımında 'ortanca yaş' (medyan yaş), nüfusu tam ortadan ikiye bölen yaştır.\n\nTürkiye'de 2000 yılında 24,8 olan ortanca yaşın günümüzde 34'ün üzerine çıkması aşağıdakilerden hangisinin doğrudan bir sonucudur?",
        "options": [
            "Bebek ölüm hızının olağanüstü artış göstermesinin",
            "Doğurganlık hızının düşmesi ve yaşlı nüfus oranının artmasının",
            "Dış ülkelere genç beyin göçünün tamamen sona ermesinin",
            "Tarım sektöründe çalışan nüfus oranının artmasının",
            "Köyden kente göçün tersine dönerek köylere akının başlamasının"
        ],
        "correctIndex": 1,
        "explanation": "Ortanca yaşın yükselmesi bir toplumun yaşlandığını ifade eder. Türkiye'de kadın başına düşen çocuk sayısının (doğurganlık hızı) 1.5 seviyelerine inmesi ve yaşam kalitesiyle ortalama ömrün uzaması ortanca yaşı hızla yukarı taşımıştır.",
        "distractor_trap": "Ortanca yaşın yükselmesi gençleşme değil, tam tersine nüfusun yaşlanması (demografik yaşlanma) anlamına gelir."
    },

    # -------------------------------------------------------------
    # TEST 3: STANDART ÖSYM AYARI (Zorluk: 2) - Sorular 21-30
    # -------------------------------------------------------------
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'de Nüfus ve Yerleşme",
        "difficulty": 2,
        "prompt_text": "I. Çanakkale Boğazı çevresi (Gelibolu Yarımadası)\nII. Çatalca - Kocaeli Bölümü\nIII. Sinop Yöresi\nIV. Çukurova Yöresi\n\nYukarıda verilen alanlardan hangileri uygun iklim şartlarına sahip olmalarına rağmen ana ulaşım akslarına sapa kalmaları ve engebeli arazi yapıları nedeniyle seyrek nüfuslanmıştır?",
        "options": [
            "I ve III",
            "II ve IV",
            "I ve II",
            "III ve IV",
            "II ve III"
        ],
        "correctIndex": 0,
        "explanation": "Gelibolu Yarımadası (tarihi sit alanı ve sapa kalması) ile Sinop yöresi (Küre Dağları'nın arkasında sapa kalması), ılıman denizel iklime sahip olmalarına karşın ana ticaret ve transit yollarının dışında kaldıkları için seyrek nüfusludur. Çatalca-Kocaeli ve Çukurova ise aşırı yoğun nüfusludur.",
        "distractor_trap": "Adaylar deniz kenarındaki her yerin yoğun nüfuslu olduğunu sanır. Gelibolu ve Sinop bunun en meşhur iki istisnasıdır."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'de Nüfus ve Yerleşme",
        "difficulty": 2,
        "prompt_text": "Türkiye'de iç göç hareketlerine katılan nüfusun demografik yapısı incelendiğinde;\n\nI. Göç edenlerin çoğunluğunu genç dinamik erkek nüfus oluşturur.\nII. Göç veren kırsal yörelerde kadın nüfus oranı erkek nüfus oranından fazla çıkar.\nIII. Göç alan büyük sanayi kentlerinde erkek nüfus oranı kadın nüfustan belirgin fazladır.\n\nyargılarından hangileri doğrudur?",
        "options": [
            "Yalnız I",
            "Yalnız II",
            "I ve II",
            "II ve III",
            "I, II ve III"
        ],
        "correctIndex": 4,
        "explanation": "Türkiye'de iç göçün lokomotifi iş arayan genç erkeklerdir. Bu sebeple göç veren Doğu Anadolu ve Karadeniz köylerinde kadın nüfus oranı yüksek çıkarken, sanayi ve inşaat kenti olan Kocaeli, Tekirdağ gibi yoğun göç alan yerlerde erkek nüfus oranı yüksektir.",
        "distractor_trap": "Tüm öncüller birbirini tamamlayan demografik gerçeklerdir. Göç cinsiyet dengesini bölgesel olarak bozar."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'de Nüfus ve Yerleşme",
        "difficulty": 2,
        "prompt_text": "Aşağıdaki göç türlerinden hangisi 'uluslararası bir anlaşma ve zorunlu nüfus takası' esasına dayanan siyasi bir dış göçtür?",
        "options": [
            "1961 Türkiye - Almanya İş Gücü Göçü",
            "1923 Lozan Barış Antlaşması ile gerçekleşen Türk - Yunan Nüfus Mübadelesi",
            "1989 Bulgaristan'dan Türkiye'ye yapılan zorunlu sığınmacı göçü",
            "Suriye iç savaşından kaçan sığınmacıların gelişi",
            "Üniversite mezunlarının yurt dışına gitmesiyle oluşan beyin göçü"
        ],
        "correctIndex": 1,
        "explanation": "1923 Lozan Antlaşması'na eklenen protokol uyarınca Türkiye'deki Rumlar ile Yunanistan'daki Müslüman Türkler karşılıklı olarak zorunlu yer değiştirmiştir. Bu olaya 'Mübadele Göçü' denir.",
        "distractor_trap": "Mübadele iki devletin anlaşmasıyla yapılan yasal ve zorunlu takastır. Almanya göçü iş gücü göçüdür, mübadele değildir."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'de Nüfus ve Yerleşme",
        "difficulty": 2,
        "prompt_text": "Ege Bölgesi'nde kıyılarda kurulan ve deniz ürünleri avcılığı ile kültür balıkçılığı yapılan geçici veya daimi köy altı yerleşmelerine ne ad verilir?",
        "options": [
            "Dalyan",
            "Mezra",
            "Kom",
            "Ağıl",
            "Yayla"
        ],
        "correctIndex": 0,
        "explanation": "Dalyan; kıyılarda, lagün ve nehir ağızlarında balık üretimi ve avcılığı amacıyla kurulan balıkçı yerleşmeleridir (Muğla-Dalyan, İzmir kıyıları).",
        "distractor_trap": "Dalyan kelimesi balık kapanı ve balıkçı yerleşmesi demektir. Diğer şıkların tamamı hayvancılık veya tarım yerleşmesidir."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'de Nüfus ve Yerleşme",
        "difficulty": 2,
        "prompt_text": "Türkiye'de nüfusun kır-kent oranları tarihsel süreçte büyük bir değişim göstermiştir.\n\nCumhuriyetin ilk yıllarında nüfusun yaklaşık %75'i kırsalda yaşarken, günümüzde kent nüfus oranının %93'ün üzerine çıkmasında aşağıdakilerden hangisi doğrudan etkili OLMAMIŞTIR?",
        "options": [
            "Tarımsal arazilerin erozyon ve mirasla parçalanması",
            "Sanayileşme ile birlikte kentlerde cazip iş alanlarının doğması",
            "2012 yılında çıkarılan 6360 sayılı Büyükşehir Yasası ile belde ve köylerin mahalleye dönüştürülmesi",
            "Kırsal kesimde ölüm oranlarının doğum oranlarını geçerek nüfusun tükenmesi",
            "Eğitim ve sağlık imkanlarının kentlerde yoğunlaşması"
        ],
        "correctIndex": 3,
        "explanation": "Kırsal kesimde ölüm oranları doğumları geçmemiştir; kırsalda doğal nüfus artışı halen pozitiftir. Ancak yoğun göç ve özellikle 2012'de 30 büyükşehirdeki tüm köylerin yasa ile 'mahalle' statüsüne geçirilmesi istatistiksel olarak kent nüfusunu bir gecede zıplatmıştır.",
        "distractor_trap": "Büyükşehir yasası (idari faktör) kent nüfus oranının kağıt üstünde %75'lerden %93'e sıçramasının en büyük gizli nedenidir; köyde ölüm patlaması gibi bir durum söz konusu değildir."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'de Nüfus ve Yerleşme",
        "difficulty": 2,
        "prompt_text": "Doğu Anadolu ve Güneydoğu Anadolu bölgelerinde geniş otlakların bulunduğu alanlarda kurulan, tarım ve hayvancılığın bir arada yapıldığı, zamanla kalıcı köye dönüşebilen en yaygın köy altı yerleşmesi hangisidir?",
        "options": [
            "Mezra",
            "Ağıl",
            "Dalyan",
            "Dam",
            "Oba"
        ],
        "correctIndex": 0,
        "explanation": "Mezra; Doğu ve Güneydoğu Anadolu'da tarım ve hayvancılık yapılan, kalıcı (sürekli) nitelikteki en karakteristik köy altı yerleşmesidir. Çoğu mezra sonradan muhtarlık alarak bağımsız köye dönüşür.",
        "distractor_trap": "Divan Batı Karadeniz'e özgüyken, Mezra Doğu ve Güneydoğu Anadolu'ya özgü kalıcı yerleşmedir."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'de Nüfus ve Yerleşme",
        "difficulty": 2,
        "prompt_text": "Karadeniz Bölgesi'nde yaylacılık faaliyetleri geleneksel olarak hayvancılık amacıyla yapılırken, son yıllarda fonksiyon değiştirmiştir.\n\nGünümüzde özellikle Doğu Karadeniz yaylalarında (Ayder, Uzungöl, Bektaş vb.) yaylacılığın temel ekonomik itici gücü aşağıdakilerden hangisine evrilmiştir?",
        "options": [
            "Maden arama ve sondaj faaliyetlerine",
            "Turizm ve dinlenme faaliyetlerine",
            "Sanayi tesisleri kurulumuna",
            "Büyükbaş süt çiftliklerinin sanayileşmesine",
            "Seracılık faaliyetlerine"
        ],
        "correctIndex": 1,
        "explanation": "Doğu Karadeniz yaylaları günümüzde yeşil doğası, serin havası ve festivalleriyle eko-turizm, dağ turizmi ve yayla turizminin merkezine dönüşmüş; hayvancılığın önüne turizm geçmiştir.",
        "distractor_trap": "Akdeniz'de yaylacılık sıcaktan kaçıp dinlenme (sayfiye), Doğu Karadeniz'de ise hayvancılıktan turizme evrilen bir yapı gösterir."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'de Nüfus ve Yerleşme",
        "difficulty": 2,
        "prompt_text": "Türkiye'de çalışan nüfusun (faal nüfus) sektörel dağılımı ekonomik kalkınmışlığın en kritik göstergesidir.\n\nCumhuriyetin ilk yıllarından günümüze çalışan nüfusun sektörlere göre dağılımındaki değişim değerlendirildiğinde aşağıdakilerden hangisi doğrudur?",
        "options": [
            "Tarımdaki çalışan oranı sürekli artış göstererek zirve yapmıştır.",
            "Hizmet ve sanayi sektöründe çalışanların payı sürekli artarken, tarım sektörünün payı hızla azalmıştır.",
            "Sanayi sektöründe çalışanların payı hizmet sektörünün çok önüne geçmiştir.",
            "Madencilik sektöründe çalışanların payı tüm sektörleri geride bırakmıştır.",
            "Hizmet sektöründe çalışanların oranı sürekli gerilemiştir."
        ],
        "correctIndex": 1,
        "explanation": "1927'de çalışan nüfusun %80'den fazlası tarım sektöründeyken, günümüzde tarımın payı %15-16 bandına inmiş; hizmet sektörü %55-60 ile birinci, sanayi sektörü ise %25-27 ile ikinci sıraya yerleşmiştir.",
        "distractor_trap": "En çok çalışan sanayide değil 'hizmet' (ticaret, ulaşım, bankacılık, eğitim vb.) sektöründedir! İkinci sanayi, üçüncü tarımdır."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'de Nüfus ve Yerleşme",
        "difficulty": 2,
        "prompt_text": "Tarihi İpek Yolu üzerinde bulunan, zengin kervansaray ve ticaret mirasına sahip, günümüzde ise kavşak noktası olması ve modern organize sanayi bölgeleriyle büyüyen İç Anadolu kenti aşağıdakilerden hangisidir?",
        "options": [
            "Kayseri",
            "Karaman",
            "Yozgat",
            "Çankırı",
            "Niğde"
        ],
        "correctIndex": 0,
        "explanation": "Kayseri; tarihsel ticaret kenti kimliğini (Kültepe Kaniş Karumu'ndan bu yana) korumuş, günümüzde zengin sanayisi, mobilya üretimi ve kavşak konumuyla İç Anadolu'nun en güçlü ticaret-sanayi metropollerinden biri olmuştur.",
        "distractor_trap": "Yozgat ve Çankırı göç veren küçük merkezlerken; Kayseri sanayi, ticaret ve kavşak özelliğiyle sürekli göç çeken bir ildir."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'de Nüfus ve Yerleşme",
        "difficulty": 2,
        "prompt_text": "Gökçeada ve Bozcaada ile Ege kıyılarında küçükbaş hayvancılık ve bağcılık yapan ailelerin geçici barınaklarına verilen ad hangisidir?",
        "options": [
            "Dam",
            "Kom",
            "Divan",
            "Mahalle",
            "Dalyan"
        ],
        "correctIndex": 0,
        "explanation": "Dam; Ege kıyılarında, Gökçeada ve Bozcaada'da hayvan barınağı ve kısmen tarım aletlerinin saklandığı geçici köy altı yerleşmesidir.",
        "distractor_trap": "Dam Ege bölgesine özgü bir geçici yerleşmedir. Doğu Anadolu'daki karşılığı Kom'dur."
    },

    # -------------------------------------------------------------
    # TEST 4: NET SIÇRATAN / KURTLAR SOFRASI (Zorluk: 3) - Sorular 31-40
    # -------------------------------------------------------------
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'de Nüfus ve Yerleşme",
        "difficulty": 3,
        "prompt_text": "Bir bölgede tarımsal nüfus yoğunluğu çok yüksek çıkıyorsa bu durum hakkında aşağıdakilerden hangisi kesin olarak söylenemez?",
        "options": [
            "Tarım arazilerinin dar ve parçalı olduğu",
            "Yer şekillerinin engebeli ve dağlık olduğu",
            "Tarımda makine kullanımının topoğrafya nedeniyle zor olduğu",
            "Birim alandan alınan tarımsal verim ve gelir düzeyinin olağanüstü yüksek olduğu",
            "Tarımsal üretimde insan ve hayvan gücüne yüksek oranda ihtiyaç duyulduğu"
        ],
        "correctIndex": 3,
        "explanation": "Tarımsal nüfus yoğunluğu (Tarımla uğraşan nüfus / Tarım alanı) formülünde sonucun yüksek çıkması; arazinin dağlık, tarım alanının dar ve makineleşmenin yetersiz olduğunu gösterir (örneğin Rize, Hakkari). Bu alanlarda modern entansif tarım yapılmadığından tarımsal gelir olağanüstü yüksek DEĞİL, aksine kırsal fakirlik fazladır.",
        "distractor_trap": "Adaylar 'tarımsal yoğunluk fazlaysa tarımsal üretim ve zenginlik de fazladır' yanılgısına düşer. Tarımsal yoğunluk coğrafi engebe ve makinesizlik göstergesidir, zenginlik göstergesi değildir."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'de Nüfus ve Yerleşme",
        "difficulty": 3,
        "prompt_text": "I. Hakkari Yöresi\nII. Erzurum - Kars Platosu\nIII. Yıldız Dağları Yöresi\nIV. Taşeli Platosu\n\nYukarıda verilen seyrek nüfuslu yörelerden hangilerinde nüfusun seyrek olmasında 'olumsuz iklim şartları (kış soğukları ve don olayları)' birincil faktör konumundadır?",
        "options": [
            "I ve II",
            "II ve IV",
            "I ve III",
            "III ve IV",
            "II ve III"
        ],
        "correctIndex": 0,
        "explanation": "Hakkari ve Erzurum-Kars yüksek rakım ve sert karasal iklim nedeniyle kışların aşırı soğuk, uzun ve karlı geçtiği yerlerdir; iklim nüfusu kısıtlayan ana etkendir. Yıldız Dağları'nda iklim ılımandır (ulaşıma sapa kalması etkilidir); Taşeli Platosu'nda ise karstik kireç taşı yapısı etkilidir.",
        "distractor_trap": "Taşeli Platosu Akdeniz'dedir, iklimi ılımandır; nüfusun az olma sebebi iklim değil karstik topoğrafyadır."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'de Nüfus ve Yerleşme",
        "difficulty": 3,
        "prompt_text": "Türkiye'de 1960-1965 döneminden itibaren devlet eliyle yürütülen nüfus politikalarında radikal bir eksen kayması yaşanmıştır.\n\n1923-1960 arasında 'pronatalist' (nüfus artışını teşvik edici) politikalar uygulanırken, 1965 sonrasında 'antinatalist' (nüfus planlaması ve artış hızını düşürücü) politikalara geçilmesinin temel ekonomik nedeni aşağıdakilerden hangisidir?",
        "options": [
            "Ülke yüz ölçümünün yeni nüfusu barındıramayacak kadar daralması",
            "Hızlı nüfus artışının kişi başına düşen milli geliri eritmesi ve kalkınma hızının üzerinde kalarak işsizlik yaratması",
            "Kırsal kesimde tarımsal üretimin tamamen durması",
            "Tüm komşu ülkelerle savaş tehlikesinin tamamen ortadan kalkması",
            "Türkiye'nin Avrupa Birliği'ne tam üye kabul edilmesi"
        ],
        "correctIndex": 1,
        "explanation": "1950'lerden sonra sağlık ve beslenmenin iyileşmesiyle nüfus patlaması (%2.85) yaşanmış; devlet yatırımları okullar, hastaneler ve yollar gibi demografik yatırımlara aktarılmak zorunda kalmıştır. Kalkınma hızının düşmesi ve artan işsizlik üzerine 1965'te Nüfus Planlaması Kanunu çıkarılarak doğum kontrolü serbest bırakılmıştır.",
        "distractor_trap": "1923-1960 arası savaştan çıkan ülkeyi asker ve tarım işçisiyle güçlendirmek için teşvik; 1965 sonrası ise ekonomik kalkınmayı korumak için planlama uygulanmıştır."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'de Nüfus ve Yerleşme",
        "difficulty": 3,
        "prompt_text": "Türkiye'de nüfusun kıyılarda yoğunlaşıp iç kesimlerde seyrekleşmesi genel bir kuraldır. Ancak bu kurala uymayan iç kesimlerdeki bazı 'vaha' kentler çevresine göre olağanüstü yoğun nüfus çekmiştir.\n\nAşağıdaki iç bölge kentlerinden hangisinin yoğun nüfuslanmasında 'demiryolu kavşağı olması, havacılık ve raylı sistem sanayisi ile üniversite kenti' kimliği doğrudan etkili olmuştur?",
        "options": [
            "Eskişehir",
            "Kırşehir",
            "Amasya",
            "Yozgat",
            "Karaman"
        ],
        "correctIndex": 0,
        "explanation": "Eskişehir, Cumhuriyet'in ilk yıllarından itibaren demiryollarının kilit kavşağı (TÜLOMSAŞ), ilk yerli lokomotif Karakurt ve Devrim otomobilinin üretildiği sanayi merkezi, havacılık sanayii (TUSAŞ/TEI) ve iki köklü üniversitesiyle İç Anadolu'nun en gelişmiş ve göç alan metropollerindendir.",
        "distractor_trap": "Kırşehir ve Yozgat tarım ağırlıklı ve göç veren kentlerdir. Eskişehir sanayi, ulaşım ve eğitim fonksiyonuyla pozitif ayrışır."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'de Nüfus ve Yerleşme",
        "difficulty": 3,
        "prompt_text": "Doğu Karadeniz kıyı şeridinde (Trabzon, Rize, Giresun) nüfus yoğunluğunun kilometre kareye 300 kişinin üzerine çıkmasında;\n\nI. Arazinin iç kesimlerinin çok dağlık ve sarp olması nedeniyle halkın dar kıyı şeridine sıkışması,\nII. Fındık ve çay tarımının yoğun insan emeğine dayalı olması,\nIII. Kıyıda devasa otomotiv ve demir-çelik ağır sanayi tesislerinin bulunması\n\nfaktörlerinden hangileri etkilidir?",
        "options": [
            "Yalnız I",
            "I ve II",
            "II ve III",
            "I ve III",
            "I, II ve III"
        ],
        "correctIndex": 1,
        "explanation": "Doğu Karadeniz kıyısında arazinin dikliği yerleşmeyi zorunlu olarak sahil bandına ve vadi tabanlarına hapsetmiştir. Ayrıca çay ve fındık tarımı yoğun iş gücü ister. Ancak Doğu Karadeniz'de ağır demir-çelik veya otomotiv sanayii kesinlikle YOKTUR (Karabük ve Ereğli Batı Karadeniz'dedir).",
        "distractor_trap": "Doğu Karadeniz'de ağır sanayi yoktur! Nüfus yoğunluğu tamamen topografik sıkışma ve monokültür tarımdan (çay-fındık) kaynaklanır."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'de Nüfus ve Yerleşme",
        "difficulty": 3,
        "prompt_text": "Türkiye'de kırsal alanlardan şehirlere yapılan kontrolsüz ve hızlı göçlerin kentlerde yarattığı sorunlar arasında aşağıdakilerden hangisi yer almaz?",
        "options": [
            "Gecekondulaşma ve çarpık kentleşmenin artması",
            "Trafik sıkışıklığı ve toplu taşıma yetersizlikleri",
            "Belediye altyapı hizmetlerinin (su, kanalizasyon, atık) yetersiz kalması",
            "Demografik yatırımların (okul, hastane) yükünün artması",
            "Kentlerde sanayi yatırımlarının iş gücü bulamayarak durma noktasına gelmesi"
        ],
        "correctIndex": 4,
        "explanation": "Hızlı iç göç kentlerde iş gücü kıtlığı değil, tam aksine aşırı ucuz ve niteliksiz iş gücü fazlasına, yani kentsel gizli ve açık işsizliğe yol açar.",
        "distractor_trap": "Göç alan kentte iş gücü açığı oluşmaz; iş gücü arzı patlar ve işsizlik ile düşük ücret sorunu doğar."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'de Nüfus ve Yerleşme",
        "difficulty": 3,
        "prompt_text": "Türkiye'de nüfusun cinsiyet yapısı incelendiğinde ülke genelinde kadın ve erkek oranları birbirine çok yakın olmakla birlikte (%50.1 erkek, %49.9 kadın), bazı şehirlerde bu oran erkekler veya kadınlar lehine belirgin biçimde bozulur.\n\nAşağıdaki şehir çiftlerinin hangisinde erkek nüfus oranının kadın nüfus oranından belirgin derecede yüksek olması beklenir?",
        "options": [
            "Kastamonu — Sinop",
            "Rize — Giresun",
            "Tekirdağ — Kocaeli",
            "Artvin — Bayburt",
            "Gümüşhane — Kars"
        ],
        "correctIndex": 2,
        "explanation": "Tekirdağ (Çorlu/Çerkezköy) ve Kocaeli (Gebze/İzmit) Türkiye'nin en büyük sanayi merkezleridir ve fabrikalarda çalışmak üzere Türkiye'nin her yerinden yoğun genç erkek göçü çekerler. Diğer şıklardaki iller ise erkeklerini dışarıya göç veren illerdir.",
        "distractor_trap": "Sanayi ve asker kışlası olan şehirlerde erkek oranı; göç veren kırsal illerde (Sinop, Kastamonu, Giresun) ise kadın oranı daha yüksek çıkar."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'de Nüfus ve Yerleşme",
        "difficulty": 3,
        "prompt_text": "Türkiye'de geçici köy altı yerleşmelerinin zamanla sürekli yerleşmeye (kalıcı köye) dönüşmesinde temel belirleyici faktör aşağıdakilerden hangisidir?",
        "options": [
            "Bölgede heyelan riskinin artması",
            "Ekonomik faaliyetin sadece dönemsel hayvancılıktan çıkıp tarım ve daimi ziraat üretimine dönüşmesi",
            "Yerleşmenin deniz seviyesinden 2000 metre yukarıya taşınması",
            "Bölgede kerpiç yerine ahşap evlerin inşa edilmeye başlanması",
            "Yöre halkının dış ülkelere işçi olarak gitmesi"
        ],
        "correctIndex": 1,
        "explanation": "Bir köy altı yerleşmesinin geçicilikten kalıcılığa geçmesini sağlayan ana etken; geçim kaynağının mevsime bağlı yaylacılık veya otlatmacılıktan çıkıp toprağa bağlı sürekli tarım ve ziraat faaliyetine dönüşmesidir. Tarım insanı yıl boyu tarlaya bağlar.",
        "distractor_trap": "Hayvancılık mevsimlik göçü gerektirirken; tarım ve bağ-bahçe faaliyeti yıl boyu orada kalmayı (kalıcı yerleşmeyi) zorunlu kılar."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'de Nüfus ve Yerleşme",
        "difficulty": 3,
        "prompt_text": "I. Yaz aylarında Çukurova ve Amik ovalarına pamuk çapalamak ve toplamak için gidilmesi\nII. Sonbaharda Ordu ve Giresun'a fındık hasadı için binlerce mevsimlik işçinin gitmesi\nIII. İlkbahar ve yaz aylarında Şanlıurfa ve Diyarbakır'dan İç Anadolu'ya şeker pancarı çapası için ailelerin göç etmesi\n\nYukarıda verilen mevsimlik göç hareketlerinin ortak özelliği aşağıdakilerden hangisidir?",
        "options": [
            "Gittikleri yerlerde aritmetik nüfus yoğunluğunu kalıcı olarak artırmaları",
            "Tarımsal ürünlerin hasat ve bakım dönemlerine bağlı geçici iş gücü hareketleri olmaları",
            "Tamamının kış mevsiminde yoğunlaşması",
            "Maden ocaklarında istihdam edilmek üzere yapılmaları",
            "Gittikleri illerde kentsel nüfus sayımına dahil edilmeleri"
        ],
        "correctIndex": 1,
        "explanation": "Verilen üç örnek de Türkiye'de tarımsal hasat ve bakım takvimine göre hareket eden gezici mevsimlik tarım işçiliği hareketidir. İş bitiminde bu işçiler kendi memleketlerine geri dönerler.",
        "distractor_trap": "Mevsimlik tarım göçü geçicidir, kalıcı nüfusu artırmaz; sadece yaz ve sonbahar aylarında o illerin fiili nüfusunu geçici olarak şişirir."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'de Nüfus ve Yerleşme",
        "difficulty": 3,
        "prompt_text": "Türkiye'de demografik göstergeler değerlendirildiğinde aşağıdakilerden hangisi bir ilin 'net göç hızının pozitif' (göç alan il) olduğunu en güçlü şekilde kanıtlar?",
        "options": [
            "İldeki fizyolojik nüfus yoğunluğunun aşırı yüksek olması",
            "İlin toplam nüfus artış hızının, ildeki doğal nüfus artış hızından (doğumlar - ölümler) belirgin derecede yüksek çıkması",
            "İldeki tarımsal üretimin tamamen geleneksel yöntemlerle yapılması",
            "İlde kadın nüfusunun erkek nüfusundan fazla olması",
            "İldeki yaşlı nüfus oranının Türkiye ortalamasının iki katı olması"
        ],
        "correctIndex": 1,
        "explanation": "Doğal nüfus artışı (doğum eksi ölüm) bir ilin kendi içindeki üreme artışıdır. Eğer bir ilin gerçek nüfus artış hızı doğal artış hızından çok daha büyük çıkıyorsa; aradaki bu devasa fark kesinlikle dışarıdan gelen net göçün (pozitif göç hızı) göstergesidir.",
        "distractor_trap": "ÖSYM 'Doğal artış hızı' ile 'Gerçek nüfus artış hızı' arasındaki makası sorar: Gerçek artış > Doğal artış = Göç alıyor; Gerçek artış < Doğal artış = Göç veriyor!"
    }
]
