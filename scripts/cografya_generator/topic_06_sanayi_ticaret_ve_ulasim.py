# -*- coding: utf-8 -*-
"""
KPSS Coğrafya — Konu 6: Sanayi, Ticaret ve Ulaşım (40 Özgün Soru)
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
        "topic": "Sanayi, Ticaret ve Ulaşım",
        "difficulty": 1,
        "prompt_text": "Türkiye'de sanayi tesislerinin coğrafi dağılışı incelendiğinde Marmara Bölgesi'nin (özellikle Çatalca-Kocaeli ve Güney Marmara) sanayi üretiminde açık ara lider olduğu görülür.\n\nMarmara Bölgesi'nin sanayide lider konuma gelmesinde aşağıdakilerden hangisi doğrudan bir etken DEĞİLDİR?",
        "options": [
            "Zengin yer altı maden yataklarına ve kömür havzalarına sahip olması",
            "Ulaşım ağlarının (kara, deniz, hava, demiryolu) olağanüstü gelişmiş olması",
            "Sermaye birikiminin ve finans merkezlerinin bölgede toplanması",
            "Nitelikli ve kalifiye iş gücünün bölgede bulunması",
            "Geniş bir tüketici pazarına yakın olması"
        ],
        "correctIndex": 0,
        "explanation": "Marmara Bölgesi maden ve enerji kaynakları bakımından Türkiye'nin en fakir bölgelerindendir. Marmara'nın sanayi devi olmasının sebebi yer altı zenginliği değil; sermaye, dev tüketim pazarı, nitelikli iş gücü ve dünyaya açılan kavşak ulaşım ağıdır.",
        "distractor_trap": "Maden çeşitliliği Doğu Anadolu'dadır. Marmara hammadde zengini olduğu için değil, pazar ve ulaşım merkezi olduğu için sanayileşmiştir."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Sanayi, Ticaret ve Ulaşım",
        "difficulty": 1,
        "prompt_text": "Türkiye'de yurt içi yük ve yolcu taşımacılığında en yüksek paya sahip olan ulaşım sektörü aşağıdakilerden hangisidir?",
        "options": [
            "Demir yolu ulaşımı",
            "Kara yolu ulaşımı",
            "Deniz yolu ulaşımı",
            "Hava yolu ulaşımı",
            "Boru hattı taşımacılığı"
        ],
        "correctIndex": 1,
        "explanation": "Türkiye'de yurt içi yolcu taşımacılığının yaklaşık %90'ı, yurt içi yük taşımacılığının ise %85'i esnekliği ve kapıdan kapıya teslimat kolaylığı nedeniyle kara yolu ile gerçekleştirilmektedir.",
        "distractor_trap": "Dış ticarette en çok yük deniz yolu ile taşınırken; YURT İÇİNDE tartışmasız şampiyon kara yoludur."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Sanayi, Ticaret ve Ulaşım",
        "difficulty": 1,
        "prompt_text": "Uluslararası dış ticarette birim taşıma maliyeti en ucuz olan ulaşım türü aşağıdakilerden hangisidir?",
        "options": [
            "Kara yolu",
            "Demir yolu",
            "Deniz yolu",
            "Hava yolu",
            "Teleferik"
        ],
        "correctIndex": 2,
        "explanation": "Deniz yolu taşımacılığında devasa konteyner gemileriyle tek seferde binlerce ton yük taşınabilmesi, güzergâh yapım ve bakım maliyetinin sıfır olması ve sürtünmenin azlığı sebebiyle dünyada ve Türkiye'de birim maliyeti en ucuz ulaşım türüdür.",
        "distractor_trap": "Ulaşım maliyet sıralaması (ucuzdan pahalıya): Deniz yolu < Demir yolu < Kara yolu < Hava yolu."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Sanayi, Ticaret ve Ulaşım",
        "difficulty": 1,
        "prompt_text": "Türkiye'nin ihracatında (dış satımında) sektör bazında en yüksek paya sahip olan ana sektör aşağıdakilerden hangisidir?",
        "options": [
            "Tarımsal ham ürünler",
            "Madencilik ve taş ocakçılığı",
            "İmalat Sanayisi (Otomotiv, Makine, Tekstil, Kimya)",
            "Ormancılık ve balıkçılık ürünleri",
            "Canlı hayvan ticareti"
        ],
        "correctIndex": 2,
        "explanation": "Türkiye'nin toplam ihracatının yaklaşık %94-95'i imalat sanayisi ürünlerinden oluşmaktadır. Motorlu kara taşıtları (otomotiv), makine parçaları, hazır giyim/tekstil ve kimyasal maddeler en büyük paya sahiptir. Tarımın ihracattaki payı %3-4 civarındadır.",
        "distractor_trap": "Türkiye bir tarım ülkesi olarak bilinse de ihracat gelirinin neredeyse tamamı sanayi mamullerinden sağlanır."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Sanayi, Ticaret ve Ulaşım",
        "difficulty": 1,
        "prompt_text": "Türkiye'nin en çok ihracat yaptığı (en büyük dış pazarımız olan) ülke aşağıdakilerden hangisidir?",
        "options": [
            "Rusya",
            "Almanya",
            "Çin",
            "Amerika Birleşik Devletleri",
            "Irak"
        ],
        "correctIndex": 1,
        "explanation": "Türkiye'nin ihracatında uzun yıllardır açık ara birinci sırada yer alan ülke Almanya'dır (Almanya'yı ABD, İngiltere ve İtalya takip eder). İthalatta ise birinci Rusya veya Çin'dir.",
        "distractor_trap": "İhracatta (sattığımız) 1 numara = Almanya; İthalatta (aldığımız) 1 numara = Rusya / Çin!"
    },
    {
        "lesson": "Coğrafya",
        "topic": "Sanayi, Ticaret ve Ulaşım",
        "difficulty": 1,
        "prompt_text": "Karadeniz'i Doğu ve Güneydoğu Anadolu'ya bağlayan Zigana Geçidi üzerinde inşa edilen ve 14,5 kilometre uzunluğu ile Türkiye'nin ve Avrupa'nın en uzun çift tüplü kara yolu tüneli aşağıdakilerden hangisidir?",
        "options": [
            "Ovit Tüneli",
            "Yeni Zigana Tüneli",
            "Ilgaz 15 Temmuz İstiklal Tüneli",
            "Avrasya Tüneli",
            "Bolu Dağı Tüneli"
        ],
        "correctIndex": 1,
        "explanation": "Trabzon ile Gümüşhane arasında açılan Yeni Zigana Tüneli 14.5 km uzunluğuyla Türkiye'nin ve Avrupa'nın en uzun çift tüplü karayolu tünelidir. Trabzon Limanı'nı İran transit yoluna bağlayan hayati bir projedir.",
        "distractor_trap": "Ovit Tüneli Rize-İkizdere ile İspir arasındadır (14 km); Yeni Zigana Tüneli ise 14.5 km ile rekoru elinde tutmaktadır."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Sanayi, Ticaret ve Ulaşım",
        "difficulty": 1,
        "prompt_text": "Çukurova'yı ve Akdeniz kıyılarını İç Anadolu Bölgesi'ne (Niğde/Konya) bağlayan en işlek tarihi doğal Toros geçidi aşağıdakilerden hangisidir?",
        "options": [
            "Çubuk Boğazı",
            "Gülek Boğazı",
            "Sertavul Geçidi",
            "Belen Geçidi",
            "Kop Geçidi"
        ],
        "correctIndex": 1,
        "explanation": "Adana ve Çukurova'yı Pozantı üzerinden İç Anadolu'ya bağlayan kapı Gülek Boğazı'dır. Sertavul Silifke-Karaman'ı; Çubuk Antalya-Göller Yöresi'ni; Belen ise İskenderun-Hatay'ı bağlar.",
        "distractor_trap": "Akdeniz geçitleri: Çubuk (Antalya), Sertavul (Silifke), Gülek (Adana/Pozantı), Belen (İskenderun). Şifresi: Ç-S-G-B (Çok Sayıda Geçit Bulunur)."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Sanayi, Ticaret ve Ulaşım",
        "difficulty": 1,
        "prompt_text": "Denize dolgu yapılarak (deniz yüzeyi taş ve kayalarla doldurularak) inşa edilen Türkiye'nin ve Avrupa'nın ilk deniz dolgu havalimanı aşağıdakilerden hangisidir?",
        "options": [
            "Trabzon Havalimanı",
            "Ordu - Giresun Havalimanı",
            "Rize - Artvin Havalimanı",
            "Çukurova Uluslararası Havalimanı",
            "Sabiha Gökçen Havalimanı"
        ],
        "correctIndex": 1,
        "explanation": "Karadeniz'in dik ve engebeli arazisinde düz alan bulunamadığı için deniz doldurularak inşa edilen ilk havalimanı Ordu-Giresun Havalimanı'dır. Rize-Artvin Havalimanı ise Türkiye'nin ikinci deniz dolgu havalimanıdır.",
        "distractor_trap": "İlk deniz dolgu havalimanı = Ordu-Giresun; İkincisi = Rize-Artvin."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Sanayi, Ticaret ve Ulaşım",
        "difficulty": 1,
        "prompt_text": "Türkiye'de otomotiv sanayisi (otomobil, otobüs, kamyon ve traktör montaj ve üretimi) en çok hangi coğrafi bölgede yoğunlaşmıştır?",
        "options": [
            "Marmara Bölgesi",
            "İç Anadolu Bölgesi",
            "Ege Bölgesi",
            "Akdeniz Bölgesi",
            "Karadeniz Bölgesi"
        ],
        "correctIndex": 0,
        "explanation": "Bursa (TOGG, Renault, Tofaş/Fiat), Kocaeli (Ford Otosan, Hyundai), Sakarya (Toyota, Otokar) ve İstanbul ile otomotiv sanayisinin açık ara merkezi Marmara Bölgesi'dir.",
        "distractor_trap": "Otomotiv sanayisi hammaddeye değil; sermaye, yan sanayi ve liman ihracat avantajına bağlı olarak Marmara'da toplanmıştır."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Sanayi, Ticaret ve Ulaşım",
        "difficulty": 1,
        "prompt_text": "Türkiye'nin en büyük konteyner limanı olup İstanbul ve Trakya sanayisinin dünya ticaret kapısı olan liman aşağıdakilerden hangisidir?",
        "options": [
            "Sinop Limanı",
            "Ambarlı Limanı",
            "Trabzon Limanı",
            "Giresun Limanı",
            "Bandırma Limanı"
        ],
        "correctIndex": 1,
        "explanation": "İstanbul Avcılar/Beylikdüzü kıyısında yer alan Ambarlı Limanı, elleçlenen konteyner hacmi bakımından Türkiye'nin en büyük liman komplekslerindendir.",
        "distractor_trap": "Sinop doğal limandır ama en küçüğüdür; Ambarlı ise konteyner hacminde devdir."
    },

    # -------------------------------------------------------------
    # TEST 2: STANDART ÖSYM AYARI (Zorluk: 2) - Sorular 11-20
    # -------------------------------------------------------------
    {
        "lesson": "Coğrafya",
        "topic": "Sanayi, Ticaret ve Ulaşım",
        "difficulty": 2,
        "prompt_text": "Türkiye'de demiryolu hatları genellikle vadi tabanlarını ve doğal çöküntü oluklarını takip ederek uzanır. Arazinin çok engebeli olduğu veya dağların denize paralel uzandığı kıyılarda demiryolu ağı kurulması olağanüstü maliyetlidir.\n\nAşağıdaki liman kentlerinden hangisinin iç kesimlerle 'demir yolu bağlantısı BULUNMAZ'?",
        "options": [
            "Samsun",
            "İzmir",
            "Mersin",
            "Antalya",
            "İskenderun"
        ],
        "correctIndex": 3,
        "explanation": "Antalya, Türkiye'nin en büyük turizm ve ticaret limanlarından biri olmasına karşın gerisindeki dik Batı Toroslar (Beydağları) aşılamadığı için demiryolu bağlantısı kesinlikle YOKTUR. Samsun, İzmir, Mersin ve İskenderun'un ise demiryolu bağlantısı mevcuttur.",
        "distractor_trap": "ÖSYM demiryolu bağlantısı olmayan limanları sürekli yoklar: Trabzon, Rize, Giresun, Sinop, ANTALYA, Çanakkale! Antalya'da tren yoktur."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Sanayi, Ticaret ve Ulaşım",
        "difficulty": 2,
        "prompt_text": "Bir limanın ekonomik olarak büyüyebilmesi ve ticaret hacmini artırabilmesi 'hinterlandı' (art bölgesi) ile doğrudan ilişkilidir.\n\nSinop Limanı Karadeniz'in en korunaklı ve mükemmel doğal limanı olmasına rağmen ticari olarak gelişememiş ve sönük kalmıştır.\n\nSinop Limanı'nın gelişememesinin temel coğrafi sebebi aşağıdakilerden hangisidir?",
        "options": [
            "Deniz suyu sıcaklığının çok düşük olması",
            "Liman gerisinde yükselen Küre Dağları'nın iç kesimlerle kara ve demir yolu ulaşımını engellemesi (hinterlandının dar olması)",
            "Limanın fırtınalara açık olması",
            "Sinop'ta balıkçılık yapılamaması",
            "Sinop'un bir ada üzerinde yer alması"
        ],
        "correctIndex": 1,
        "explanation": "Sinop doğal limandır ancak arkasındaki Küre Dağları kıyıyı iç Anadolu'dan koparmıştır. Demiryolu yoktur, karayolu bağlantısı zayıftır; dolayısıyla hinterlandı dardır. Samsun ise arkasındaki Canik Dağları basık ve geçit verdiği için yapay olmasına rağmen Karadeniz'in en işlek limanı olmuştur.",
        "distractor_trap": "Doğal liman olmak gelişmeyi garanti etmez; limanı liman yapan şey arkasındaki ulaşım ağı ve hinterland genişliğidir."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Sanayi, Ticaret ve Ulaşım",
        "difficulty": 2,
        "prompt_text": "Türkiye'de savunma sanayisi tesisleri (ASELSAN, ROKETSAN, TUSAŞ, MKEK Fişek ve Silah Fabrikaları) ağırlıklı olarak Ankara, Kırıkkale ve Çankırı gibi iç bölge illerimizde toplanmıştır.\n\nSavunma sanayisinin kuruluş yeri olarak iç bölgelerin tercih edilmesindeki en temel stratejik faktör aşağıdakilerden hangisidir?",
        "options": [
            "Hammadde olan demirin sadece bu illerde çıkması",
            "Kıyı bölgelerden gelebilecek askeri saldırı ve bombardımanlara karşı iç güvenliğin ve savunma derinliğinin yüksek olması",
            "Bölgede deniz turizminin sanayiyi engellemesi",
            "İç Anadolu'da su kaynaklarının bol olması",
            "Karasal iklimin mühimmatların soğumasını kolaylaştırması"
        ],
        "correctIndex": 1,
        "explanation": "Cumhuriyet'in stratejik planlamasında askeri mühimmat, silah ve roket fabrikaları savaş halinde düşman donanmalarının ve hava harekatlarının menzilinden uzak kalması için 'jeopolitik ve askeri güvenlik' gerekçesiyle Anadolu'nun ortasında (Ankara, Kırıkkale) kurulmuştur.",
        "distractor_trap": "Savunma sanayiinde kuruluş faktörü pazar veya hammadde değil; tamamen 'askeri güvenlik ve stratejik derinlik'tir."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Sanayi, Ticaret ve Ulaşım",
        "difficulty": 2,
        "prompt_text": "I. Balıkesir — Bandırma\nII. Mersin\nIII. Kocaeli — İzmit\nIV. Konya\n\nYukarıda verilen merkezlerden hangilerinde 'suni gübre' fabrikalarının kurulmasında ithal edilen fosfat ve doğal gazın deniz yoluyla kolay getirilmesi (ulaşım ve liman) etkili olmuştur?",
        "options": [
            "I, II ve III",
            "II ve IV",
            "I ve IV",
            "Yalnız III",
            "I, II, III ve IV"
        ],
        "correctIndex": 0,
        "explanation": "Türkiye fosfat ve doğal gazda dışa bağımlı olduğundan gübre fabrikaları (Bandırma, Mersin, Kocaeli, İskenderun) hammaddeyi gemilerle limana indirmek için kıyılarda kurulmuştur. Konya ise iç kesimdedir.",
        "distractor_trap": "Gübre fabrikaları liman kentlerindedir (Bandırma, Mersin, Kocaeli, Samsun); tek hammaddeye yakın yer Mardin Mazıdağı'dır."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Sanayi, Ticaret ve Ulaşım",
        "difficulty": 2,
        "prompt_text": "Doğu Karadeniz Bölümü'nün kıyı şeridinde yer alan illerimiz (Trabzon, Rize, Artvin, Giresun) demiryolu haritası açısından değerlendirildiğinde aşağıdakilerden hangisi doğrudur?",
        "options": [
            "Doğu Karadeniz kıyı kuşağında demiryolu hattı ve tren ulaşımı kesinlikle YOKTUR.",
            "Trabzon ile Rize arasında yüksek hızlı tren hattı çalışmaktadır.",
            "Bölgedeki tüm madenler tren vagonlarıyla taşınır.",
            "Artvin'den Gürcistan'a uzanan tarihi bir demiryolu mevcuttur.",
            "Demiryolu yük taşımacılığında Doğu Karadeniz Türkiye lideridir."
        ],
        "correctIndex": 0,
        "explanation": "Doğu Karadeniz kıyısında (Ordu'dan Sarp Sınır Kapısı'na kadar) tek bir metre bile demiryolu hattı yoktur! Dağların hemen denizden dimdik yükselmesi ve sarp topoğrafya demiryolu inşasını engellemiştir.",
        "distractor_trap": "Adaylar Trabzon gibi büyük bir kentte tren olduğunu sanabilir. Doğu Karadeniz sahilinde demiryolu KESİNLİKLE YOKTUR!"
    },
    {
        "lesson": "Coğrafya",
        "topic": "Sanayi, Ticaret ve Ulaşım",
        "difficulty": 2,
        "prompt_text": "Türkiye'de pamuklu dokuma sanayisi hem pamuğun üretildiği hammadde yörelerinde (Adana, Aydın, Manisa, Gaziantep) hem de pamuk üretilmeyen ancak büyük pazar ve ulaşım imkanlarına sahip metropollerde kurulmuştur.\n\nAşağıdaki illerin hangisinde pamuk tarımı yapılmadığı halde devasa pamuklu dokuma ve tekstil sanayisi gelişmiştir?",
        "options": [
            "Şanlıurfa",
            "Adana",
            "İstanbul",
            "Aydın",
            "Hatay"
        ],
        "correctIndex": 2,
        "explanation": "İstanbul ve çevresinde iklim nedeniyle pamuk tarımı kesinlikle yapılamaz. Ancak İstanbul hazır giyim ve tekstil sanayisinin sermaye, pazar ve moda merkezidir; hammadde güneyden getirilerek işlenir (pazara yakınlık). Kayseri de böyledir.",
        "distractor_trap": "İstanbul ve Kayseri pamuk yetiştiremez ama dev tekstil sanayisine sahiptir (pazar ve sermaye faktörü)."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Sanayi, Ticaret ve Ulaşım",
        "difficulty": 2,
        "prompt_text": "Türkiye'de kağıt fabrikalarının (Kastamonu-Taşköprü, Zonguldak-Çaycuma, Giresun-Aksu, Balıkesir, Muğla-Dalaman) kuruluş yeri tercihlerinde birincil etken aşağıdakilerden hangisidir?",
        "options": [
            "Bölgede demir yolu ağının bulunması",
            "Kağıdın hammaddesi olan orman varlığına (odun/selüloz) yakınlık",
            "Bölgede tüketici nüfusunun fazla olması",
            "Doğal gaz boru hatlarının geçmesi",
            "İş gücünün ucuz olması"
        ],
        "correctIndex": 1,
        "explanation": "Kağıt sanayisi selüloz ve tomruk hammaddesine dayandığı için SEKA fabrikaları orman zenginliğinin bol olduğu Karadeniz, Akdeniz ve Ege kıyı kuşağında (hammaddeye yakınlık) kurulmuştur.",
        "distractor_trap": "Kağıt fabrikaları = Orman varlığına ve hammaddeye yakınlık!"
    },
    {
        "lesson": "Coğrafya",
        "topic": "Sanayi, Ticaret ve Ulaşım",
        "difficulty": 2,
        "prompt_text": "Konya Ovası Projesi (KOP) kapsamında Göksu Nehri'nin Akdeniz'e boşa akan sularını Toros Dağları'nın altından delerek Konya Kapalı Havzası'na aktaran dev sulama tüneli aşağıdakilerden hangisidir?",
        "options": [
            "Mavi Tünel",
            "Şanlıurfa Tüneli",
            "Ovit Tüneli",
            "Zigana Tüneli",
            "Avrasya Tüneli"
        ],
        "correctIndex": 0,
        "explanation": "KOP'un kalbi olan 'Mavi Tünel', Göksu Nehri ve kolları üzerindeki barajlarda toplanan suları Toroslar'ın altından 17 km uzunluğundaki tünelle Konya Ovası'na (Bağbaşı Barajı üzerinden) akıtarak yer altı sularının tükenmesini önlemeyi amaçlar.",
        "distractor_trap": "Fırat'ı Harran'a akıtan Şanlıurfa Tüneli'dir; Göksu'yu Konya'ya akıtan Mavi Tünel'dir."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Sanayi, Ticaret ve Ulaşım",
        "difficulty": 2,
        "prompt_text": "Türkiye'de Yüksek Hızlı Tren (YHT) hatlarının faaliyette olduğu güzergâhlar arasında aşağıdakilerden hangisi yer almaz?",
        "options": [
            "Ankara — Eskişehir — İstanbul",
            "Ankara — Konya",
            "Konya — Karaman",
            "Ankara — Kırıkkale — Yozgat — Sivas",
            "İzmir — Antalya"
        ],
        "correctIndex": 4,
        "explanation": "İzmir ile Antalya arasında ne hızlı tren ne de normal konvansiyonel demiryolu hattı mevcuttur. Diğer tüm hatlar ise fiilen açılmış ve çalışan YHT hatlarıdır.",
        "distractor_trap": "İzmir-Antalya arasında tren yolu yoktur; dağlık topoğrafya nedeniyle bu hat mevcut değildir."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Sanayi, Ticaret ve Ulaşım",
        "difficulty": 2,
        "prompt_text": "Zonguldak - Bartın - Karabük (ZBK) Bölgesel Gelişme Projesi'nin temel çıkış noktası ve ana hedefi aşağıdakilerden hangisidir?",
        "options": [
            "Bölgede pamuk ve narenciye tarımını yaygınlaştırmak",
            "Bölgenin taş kömürü ve demir-çeliğe bağımlı tek yönlü ekonomik yapısını Filyos Vadisi Projesi, liman ve yeni sanayi kollarıyla çeşitlendirmek ve istihdam yaratmak",
            "Bölgedeki tüm kömür madenlerini kamulaştırıp kapatmak",
            "Bölgede sera alanlarını genişletmek",
            "Bölgeyi Türkiye'nin en büyük buğday ambarı haline getirmek"
        ],
        "correctIndex": 1,
        "explanation": "ZBK projesinin amacı; Kardemir ve kömür işletmelerinin küçülmesiyle yaşanan işsizliği önlemek, Filyos Vadisi ve Mega Endüstri Bölgesi ile bölgeye yeni yatırımcılar çekerek ekonomiyi kömür tekelinden kurtarıp çeşitlendirmektir.",
        "distractor_trap": "ZBK sadece kömür çıkarmak için değil; bölge ekonomisini kömüre bağımlılıktan kurtarıp çeşitlendirmek için hazırlanmıştır."
    },

    # -------------------------------------------------------------
    # TEST 3: STANDART ÖSYM AYARI (Zorluk: 2) - Sorular 21-30
    # -------------------------------------------------------------
    {
        "lesson": "Coğrafya",
        "topic": "Sanayi, Ticaret ve Ulaşım",
        "difficulty": 2,
        "prompt_text": "Bir ülkenin ithalat giderlerinin (dış alım), ihracat gelirlerinden (dış satım) daha fazla olması durumuna 'Dış Ticaret Açığı' denir.\n\nTürkiye'nin dış ticaret açığı vermesindeki en büyük kalem aşağıdakilerden hangisidir?",
        "options": [
            "Fosil enerji kaynakları (Ham Petrol ve Doğal Gaz) ithalatı",
            "Tarım ve canlı hayvan ithalatı",
            "Tekstil ve konfeksiyon ithalatı",
            "Gıda ve un mamulleri ithalatı",
            "İnşaat malzemeleri ithalatı"
        ],
        "correctIndex": 0,
        "explanation": "Türkiye'nin dış ticaret açığının ve cari açığının yaklaşık %60-70'i yurt dışından ithal edilen ham petrol, doğal gaz ve taş kömürü gibi enerji faturalarından kaynaklanmaktadır.",
        "distractor_trap": "Cari açığın ve dış ticaret açığının tartışmasız 1 numaralı müsebbibi enerji (petrol ve doğal gaz) ithalatıdır."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Sanayi, Ticaret ve Ulaşım",
        "difficulty": 2,
        "prompt_text": "Doğu Karadeniz Projesi (DOKAP) kapsamında bölgedeki yaylaları birbirine bağlayarak yayla turizmini canlandırmayı ve turistlerin vadilere inmeden dağ sırtlarından seyahat etmesini hedefleyen büyük yol projesine ne ad verilir?",
        "options": [
            "Mavi Yol",
            "Yeşil Yol Projesi",
            "İpek Yolu",
            "Kral Yolu",
            "Karadeniz Sahil Yolu"
        ],
        "correctIndex": 1,
        "explanation": "DOKAP kapsamında Samsun'dan Artvin'e kadar olan Karadeniz yaylalarını üst kottan birbirine entegre eden turizm güzergâhı projesine 'Yeşil Yol Projesi' adı verilir.",
        "distractor_trap": "Sahil boyunca uzanan Karadeniz Sahil Yolu'dur; yaylaları bağlayan ise 'Yeşil Yol'dur."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Sanayi, Ticaret ve Ulaşım",
        "difficulty": 2,
        "prompt_text": "Türkiye'de serbest bölgeler; yabancı sermayeli yatırımları çekmek, ihracata dönük üretimi artırmak ve gümrük-vergi muafiyetleriyle ticareti hızlandırmak amacıyla kurulmuştur.\n\nTürkiye'de ilk kurulan serbest bölge aşağıdakilerden hangisidir?",
        "options": [
            "Mersin Serbest Bölgesi",
            "İstanbul Atatürk Havalimanı Serbest Bölgesi",
            "İzmir Serbest Bölgesi",
            "Trabzon Serbest Bölgesi",
            "Gaziantep Serbest Bölgesi"
        ],
        "correctIndex": 0,
        "explanation": "Türkiye'de 1985 yılında çıkarılan Serbest Bölgeler Kanunu ile faaliyete geçen ilk serbest bölge Mersin Serbest Bölgesi'dir (hemen ardından Antalya açılmıştır).",
        "distractor_trap": "İlk serbest bölge İstanbul değil, liman kolaylığı nedeniyle Mersin'dir."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Sanayi, Ticaret ve Ulaşım",
        "difficulty": 2,
        "prompt_text": "Türkiye ile komşu ülkeler arasındaki sınır kapıları ve demiryolu bağlantıları incelendiğinde aşağıdakilerden hangisi yanlıştır?",
        "options": [
            "Kapıkule Sınır Kapısı (Edirne - Bulgaristan) Türkiye'nin en işlek demir ve kara yolu sınır kapısıdır.",
            "Sarp Sınır Kapısı (Artvin - Gürcistan) üzerinden aktif demiryolu seferleri yapılmaktadır.",
            "Uzunköprü Sınır Kapısı (Edirne - Yunanistan) demiryolu bağlantısına sahiptir.",
            "Kapıköy Sınır Kapısı (Van - İran) demiryolu bağlantısına sahiptir.",
            "Nusaybin Sınır Kapısı (Mardin - Suriye) demiryolu bağlantısına sahiptir."
        ],
        "correctIndex": 1,
        "explanation": "Sarp Sınır Kapısı sadece karayolu sınır kapısıdır; Artvin kıyısında demiryolu olmadığı için Sarp'tan tren geçişi imkansızdır. Gürcistan ile demiryolu bağlantımız Ardahan üzerindeki 'Canbaz Sınır Kapısı' (Bakü-Tiflis-Kars Demiryolu) ile sağlanır.",
        "distractor_trap": "Sarp Sınır Kapısı'nda tren YOLU YOKTUR! Gürcistan'a demiryolu BTK hattı ile Canbaz'dan (Ardahan) geçer."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Sanayi, Ticaret ve Ulaşım",
        "difficulty": 2,
        "prompt_text": "I. Tekirdağ — Çorlu ve Çerkezköy\nII. Kocaeli — Gebze ve Dilovası\nIII. Manisa — Organize Sanayi Bölgesi\nIV. Sinop — Boyabat\n\nYukarıda verilen merkezlerden hangileri son 30 yılda metropollerin (İstanbul ve İzmir) aşırı sanayi yoğunluğunu dışarı kaydırmasıyla patlama yaşayan sanayi üsleridir?",
        "options": [
            "I, II ve III",
            "II, III ve IV",
            "I ve IV",
            "Yalnız II",
            "I, II, III ve IV"
        ],
        "correctIndex": 0,
        "explanation": "İstanbul sanayisi Çorlu-Çerkezköy (Tekirdağ) ve Gebze-Dilovası (Kocaeli) aksına taşmış; İzmir sanayisi ise hemen yanı başındaki Manisa OSB'ye genişlemiştir. Sinop'ta ise sanayi gelişmemiştir.",
        "distractor_trap": "Çorlu, Gebze ve Manisa Türkiye'nin en dinamik sanayi ilçeleridir."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Sanayi, Ticaret ve Ulaşım",
        "difficulty": 2,
        "prompt_text": "Antalya ile Konya arasındaki Alacabel Geçidi üzerinde inşa edilen ve kışın kar fırtınaları yüzünden günlerce kapanan İç Anadolu - Akdeniz transit trafiğini kesintisiz hale getiren tünel aşağıdakilerden hangisidir?",
        "options": [
            "Demirkapı Tüneli",
            "Zigana Tüneli",
            "Ovit Tüneli",
            "Bolu Dağı Tüneli",
            "Eraslan Tüneli"
        ],
        "correctIndex": 0,
        "explanation": "Antalya'yı Konya ve İç Anadolu'ya bağlayan Toroslar hattında açılan 5 km'lik Demirkapı Tüneli; iç kesimdeki karasal iklim ile kıyıdaki Akdeniz iklimi arasındaki geçişi dakikalara indirmiştir.",
        "distractor_trap": "Demirkapı Tüneli 'bir tüpten girince karasal kış, diğer tüpten çıkınca Akdeniz baharı' mottosuyla bilinen Toros tünelidir."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Sanayi, Ticaret ve Ulaşım",
        "difficulty": 2,
        "prompt_text": "Yeşilırmak Havzası Gelişim Projesi (YHGP); Amasya, Çorum, Samsun ve Tokat illerini kapsamaktadır.\n\nBu projenin hayata geçirilmesindeki temel çevre ve su sorunu aşağıdakilerden hangisidir?",
        "options": [
            "Yeşilırmak ve kollarında yaşanan şiddetli su kirliliği, nehir taşkınları ve aşırı toprak erozyonunu önlemek",
            "Bölgede kuraklıktan ötürü akarsuların tamamen kuruması",
            "Bölgede volkanik patlamaların engellenmesi",
            "Karadeniz'in su seviyesinin yükselmesini durdurmak",
            "Bölgedeki çeltik tarımını tamamen sonlandırmak"
        ],
        "correctIndex": 0,
        "explanation": "Yeşilırmak havzası Türkiye'de erozyonun ve nehir taşkınlarının en şiddetli yaşandığı, sanayi ve tarımsal atıklarla nehir kirliliğinin zirve yaptığı havzalardandır. YHGP'nin önceliği taşkın, erozyon ve kirlilik kontrolüdür.",
        "distractor_trap": "YHGP = Yeşilırmak = Erozyon, taşkın ve kirlilikle mücadele projesi."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Sanayi, Ticaret ve Ulaşım",
        "difficulty": 2,
        "prompt_text": "Güneydoğu Anadolu Projesi (GAP) kapsamında sulama ve enerji yatırımları ile birlikte bölgede sanayinin lokomotifi haline gelen sektör aşağıdakilerden hangisidir?",
        "options": [
            "Gemi yapım ve tersane sanayisi",
            "Tarım ve hayvancılığa dayalı sanayi (Çırçır pamuk, tekstil, un, yağ, makarna)",
            "Uçak motoru ve havacılık sanayisi",
            "Kağıt ve kereste sanayisi",
            "Taş kömürü zenginleştirme sanayisi"
        ],
        "correctIndex": 1,
        "explanation": "GAP ile sulanan tarlalarda rekor kıran pamuk, mısır, buğday ve kırmızı mercimek sayesinde Güneydoğu'da (özellikle Gaziantep ve Şanlıurfa) tarıma dayalı gıda, iplik, çırçır, dokuma ve makarna sanayisi patlama yapmıştır.",
        "distractor_trap": "GAP'ın tetiklediği sanayi kolu 'tarıma dayalı imalat sanayisi'dir."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Sanayi, Ticaret ve Ulaşım",
        "difficulty": 2,
        "prompt_text": "Türkiye'de transit ticaret taşımacılığında Trabzon Limanı'nın tarihsel ve güncel önemini korumasını sağlayan uluslararası transit ticaret koridoru hangi ülkeye bağlanmaktadır?",
        "options": [
            "İran",
            "Yunanistan",
            "İtalya",
            "Mısır",
            "Romanya"
        ],
        "correctIndex": 0,
        "explanation": "Tarihi İpek Yolu'ndan bu yana Karadeniz üzerinden Avrupa'dan gelen mallar Trabzon Limanı'na iner; buradan Zigana ve Kop geçitleri aşılarak Erzurum ve Doğubayazıt/Gürbulak kapısı üzerinden İran pazarına ulaştırılır.",
        "distractor_trap": "Trabzon Limanı = İran Transit Ticaret Yolu! Bu iki kavram birbirinden ayrılamaz."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Sanayi, Ticaret ve Ulaşım",
        "difficulty": 2,
        "prompt_text": "Türkiye'de demiryolu taşımacılığında Van Gölü üzerinde demiryolu vagonlarının gemilere bindirilerek taşındığı 'feribotlu demiryolu geçişi' hangi iki istasyon arasında gerçekleşmektedir?",
        "options": [
            "Tatvan — Van",
            "Erciş — Ahlat",
            "Gevaş — Muradiye",
            "Başkale — Özalp",
            "Doğubayazıt — Çaldıran"
        ],
        "correctIndex": 0,
        "explanation": "Elazığ-Muş üzerinden gelen demiryolu Tatvan İskelesi'nde biter. Vagonlar feribotlara yüklenerek Van Gölü'nün üzerinden Van İskelesi'ne taşınır ve oradan Kapıköy sınır kapısına (İran'a) demiryoluyla devam eder.",
        "distractor_trap": "Van Gölü üzerindeki tren feribot hattı Tatvan ile Van arasındadır."
    },

    # -------------------------------------------------------------
    # TEST 4: NET SIÇRATAN / KURTLAR SOFRASI (Zorluk: 3) - Sorular 31-40
    # -------------------------------------------------------------
    {
        "lesson": "Coğrafya",
        "topic": "Sanayi, Ticaret ve Ulaşım",
        "difficulty": 3,
        "prompt_text": "Türkiye'de bazı sanayi kolları doğrudan bozulabilir taze tarımsal hammaddeye bağımlı olduğu için hammadde alanının uzağına kesinlikle kurulamazken, bazı sanayi kolları ise hammaddesi bozulmaz olduğu için liman veya büyük tüketim pazarlarının yanına kurulabilmektedir.\n\nBuna göre aşağıdaki sanayi kollarından hangisinin kuruluş yerinin belirlenmesinde 'pazara yakınlık' veya 'ulaşım kolaylığı' belirleyici olmuştur (hammaddeye yakınlık aranmamıştır)?",
        "options": [
            "Rize'deki Çay Fabrikaları",
            "Balıkesir'deki Salça ve Konserve Fabrikaları",
            "Konya'daki Şeker Pancarı Fabrikası",
            "Kayseri ve Manisa'daki Mobilya Fabrikaları",
            "Aydın'daki Zeytinyağı Tesisleri"
        ],
        "correctIndex": 3,
        "explanation": "Çay toplandıktan birkaç saat sonra çürür; şeker pancarı beklerse şekeri buharlaşır; domates ve zeytin hızla ezilir ve asitlenir. Dolayısıyla çay, şeker, konserve ve zeytinyağı zorunlu olarak hammaddeye bitişik kurulur. Mobilya sanayisi için ise ağaç ormandan kereste olarak kolayca taşınabilir; Kayseri orman fakiridir ama dev mobilya kentidir (pazara yakınlık ve sermaye faktörü).",
        "distractor_trap": "Kayseri ve Ankara orman zengini olmamalarına rağmen Türkiye'nin mobilya devleridir; çünkü mobilya hammaddeye değil pazara yakındır."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Sanayi, Ticaret ve Ulaşım",
        "difficulty": 3,
        "prompt_text": "Doğu Anadolu Projesi (DAP) kapsamındaki illerde sanayi ve kalkınmayı hızlandırmak amacıyla yürütülen en rasyonel strateji aşağıdakilerden hangisidir?",
        "options": [
            "Otomotiv ve gemi tersaneleri inşa etmek",
            "Bölgenin geniş çayır ve meralarına dayalı modern et-süt entegre tesislerini kurmak ve yem bitkileri üretimini desteklemek",
            "Pamuklu dokuma fabrikaları açmak",
            "Muz ve narenciye tarlaları oluşturmak",
            "Zeytin işleme tesisleri kurmak"
        ],
        "correctIndex": 1,
        "explanation": "Doğu Anadolu yüksek, soğuk ve engebelidir; tarım sezonu kısadır. Ancak dev alpin çayırlar ve mera varlığı nedeniyle Türkiye'nin en büyük büyükbaş hayvan potansiyeline sahiptir. DAP'ın kalbi modern besicilik, et kombinaları, süt toz/peynir fabrikaları ve meraların ıslahıdır.",
        "distractor_trap": "DAP'ın birincil sektörel motoru hayvancılık ve hayvansal ürünler sanayisidir."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Sanayi, Ticaret ve Ulaşım",
        "difficulty": 3,
        "prompt_text": "Türkiye'de kara yolu ve demir yolu güzergâhlarının maliyetleri topoğrafyaya göre şekillenir.\n\nAşağıdaki şehir çiftleri arasında 100 kilometrelik bir demir yolu veya otoyol inşa edilmek istendiğinde km başına düşen viyadük, köprü ve tünel maliyetinin (yol yapım maliyetinin) en düşük olması beklenir?",
        "options": [
            "Trabzon — Gümüşhane",
            "Rize — Erzurum",
            "Antalya — Burdur",
            "Konya — Karaman",
            "Muğla — Fethiye"
        ],
        "correctIndex": 3,
        "explanation": "Konya ile Karaman arası uçsuz bucaksız, dümdüz ova ve tabaka düzlüğüdür (İç Anadolu platosu). Eğim neredeyse sıfırdır; tünel, viyadük veya derin yarma gerektirmez; dolayısıyla yol yapım maliyeti en ucuzdur. Karadeniz ve Toroslar'da ise kilometre başına milyonlarca dolar tünel maliyeti biner.",
        "distractor_trap": "Yol yapım maliyeti: Düz iç platolarda (Konya, Şanlıurfa, Ergene) en düşük; Karadeniz, Akdeniz ve Doğu Anadolu'da en yüksektir."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Sanayi, Ticaret ve Ulaşım",
        "difficulty": 3,
        "prompt_text": "Bakü - Tiflis - Ceyhan (BTC) Ham Petrol Boru Hattı dünya enerji jeopolitiğinde Türkiye'yi kilit bir enerji koridoru ve terminali haline getirmiştir.\n\nBTC boru hattı ile Hazar Denizi (Azerbaycan) petrolleri Türkiye üzerinden hangi limanımıza taşınarak dünya tankerlerine yüklenmektedir?",
        "options": [
            "İzmir (Aliağa)",
            "Kocaeli (Derince)",
            "Adana (Ceyhan - Haydar Aliyev Deniz Terminali)",
            "Samsun Limanı",
            "Mersin Limanı"
        ],
        "correctIndex": 2,
        "explanation": "BTC hattı Azerbaycan petrollerini Gürcistan üzerinden geçirip Adana Ceyhan'daki deniz terminaline ulaştırır. Buradan dev süpertankerlerle dünya pazarlarına sevk edilir (Ceyhan Enerji İhtisas Bölgesi).",
        "distractor_trap": "BTC'nin son durağı Adana Ceyhan Deniz Terminali'dir; Mersin veya Aliağa değildir."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Sanayi, Ticaret ve Ulaşım",
        "difficulty": 3,
        "prompt_text": "Türkiye'de transit boru hatları düşünüldüğünde Azerbaycan'ın Şahdeniz sahasından çıkarılan doğal gazı Türkiye'den geçirerek Avrupa'ya (Yunanistan ve İtalya sınırına) ulaştıran dev doğal gaz boru hattı projesi hangisidir?",
        "options": [
            "Mavi Akım",
            "TürkAkım",
            "TANAP (Trans Anadolu Doğal Gaz Boru Hattı)",
            "İran - Türkiye Boru Hattı",
            "Kerkük - Yumurtalık Boru Hattı"
        ],
        "correctIndex": 2,
        "explanation": "TANAP (Trans Anadolu Doğal Gaz Boru Hattı), Azerbaycan gazını Türkiye'nin doğusundan (Ardahan-Türkgözü) girip batısına (Edirne-İpsala) kadar 20 ilden geçerek TAP (Trans Adriyatik) hattıyla Avrupa'ya bağlayan 'Güney Gaz Koridoru'nun omurgasıdır.",
        "distractor_trap": "TANAP Azerbaycan gazını Avrupa'ya taşır; TürkAkım ve Mavi Akım ise Rusya gazını Karadeniz altından Türkiye'ye getirir."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Sanayi, Ticaret ve Ulaşım",
        "difficulty": 3,
        "prompt_text": "Bir limanın ardındaki hinterlandında yer alan demiryolu ve karayolu ağları ile dağların kıyıya dik ya da paralel uzanışı limanın büyümesini doğrudan belirler.\n\nAşağıdaki limanlardan hangisi hinterlandı en GENİŞ olan limanlarımızdan biridir?",
        "options": [
            "Sinop Limanı",
            "Giresun Limanı",
            "Mersin Uluslararası Limanı",
            "İnebolu Limanı",
            "Bartın Limanı"
        ],
        "correctIndex": 2,
        "explanation": "Mersin Limanı; arkasındaki Gülek Boğazı ve gelişmiş demiryolu-otoyol ağı ile tüm İç Anadolu, Doğu ve Güneydoğu Anadolu ile Ortadoğu transit ticaretine bağlıdır. Bu devasa coğrafi etki alanı Mersin'i Türkiye'nin hinterlandı en geniş mega limanlarından biri yapmıştır.",
        "distractor_trap": "Sinop, Giresun ve İnebolu dağlar nedeniyle dar hinterlandlıdır; Mersin ve İzmir ise dev hinterlandlıdır."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Sanayi, Ticaret ve Ulaşım",
        "difficulty": 3,
        "prompt_text": "I. Ege Bölgesi'nde dağların kıyıya dik uzanması kara ve demir yolu yapımını kıyıdan iç kesimlere doğru çok kolaylaştırmıştır.\nII. Karadeniz ve Akdeniz'de dağların kıyıya paralel uzanması kıyı ile iç kesimler arasında tünel ve geçit ihtiyacını zorunlu kılmıştır.\nIII. Doğu Anadolu'da yükseltinin batıdan doğuya artması tren ve otoyol yapım maliyetlerini tırmandırmıştır.\n\nYukarıdaki morfolojik tespitlerden hangileri Türkiye'de 'ulaşım sistemlerinin yer şekillerine bağımlı olduğunu' kanıtlar?",
        "options": [
            "Yalnız I",
            "I ve II",
            "II ve III",
            "I ve III",
            "I, II ve III"
        ],
        "correctIndex": 4,
        "explanation": "Her üç öncül de Türkiye'de dağların uzanış doğrultusunun ve engebenin ulaşım koridorlarını doğrudan dikte ettiğini gösteren temel fiziki-beşeri coğrafya gerçekleridir.",
        "distractor_trap": "Türkiye'de ana ulaşım aksları batı-doğu yönlüdür; çünkü dağlar batı-doğu doğrultusunda uzanır."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Sanayi, Ticaret ve Ulaşım",
        "difficulty": 3,
        "prompt_text": "Türkiye'de çimento fabrikalarının neredeyse her il ve coğrafi bölgeye dengeli ve yaygın olarak dağılmış olmasının temel nedeni aşağıdakilerden hangisidir?",
        "options": [
            "Çimentonun hammaddesi olan kalker ve kilin Türkiye arazisinde her yerde bolca bulunması ve inşaat sektörünün yerel talebi",
            "Çimentonun sadece kış aylarında üretilebilmesi",
            "Çimento fabrikalarının hiç elektrik tüketmemesi",
            "Devletin çimento üretimini zorunlu kılması",
            "Çimento ihracatının hava yoluyla yapılması"
        ],
        "correctIndex": 0,
        "explanation": "Çimentonun hammaddesi kireç taşı (kalker), kil ve jipstir. Bu kayaçlar Türkiye'nin hemen her ilinde bolca mevcuttur. Ayrıca çimento ağır ve nakliyesi pahalı bir malzeme olduğundan her bölge kendi fabrikasını kurarak yerel inşaat ihtiyacını karşılar.",
        "distractor_trap": "Türkiye'de dağılışı en yaygın olan sanayi kolu çimentodur; çünkü hammaddesi (taş/toprak/kil) her yerde vardır."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Sanayi, Ticaret ve Ulaşım",
        "difficulty": 3,
        "prompt_text": "Türkiye'nin dış ticaretinde önemli bir yer tutan 'sınır ticareti' (komşu ülkelerle yapılan yerel takas ve ticaret) ile ilgili aşağıdakilerden hangisi yanlıştır?",
        "options": [
            "Sınır ticareti sadece sınır illerinde yaşayan vatandaşların ve yerel tüccarların belirli kotalar dahilinde yapabildiği özel bir rejimdir.",
            "Bölgesel kalkınmayı ve sınır kentlerinde sınır güvenliği ile ekonomik refahı artırmayı hedefler.",
            "Gümrük vergilerinde özel muafiyetler ve indirimler uygulanır.",
            "Sınır ticaretinde her türlü ürünün ve silahın sınırsızca alınıp satılması serbesttir.",
            "Sınır ticareti belgesi valilikler ve ticaret bakanlığı koordinasyonunda verilir."
        ],
        "correctIndex": 3,
        "explanation": "Sınır ticareti sınırsız ve kontrolsüz bir ticaret değildir; kota sistemine tabidir ve uyuşturucu, silah, tütün, petrol gibi stratejik veya tehlikeli maddeler sınır ticareti kapsamı dışındadır.",
        "distractor_trap": "Sınır ticareti kaçakçılıkla mücadele için getirilen kontrollü ve kotalı bir yerel ticaret sistemidir."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Sanayi, Ticaret ve Ulaşım",
        "difficulty": 3,
        "prompt_text": "Türkiye'de sanayileşmiş merkezlerin hava kalitesi ve çevre dengesi incelendiğinde Dilovası (Kocaeli), Ergene Havzası (Tekirdağ) ve Aliağa (İzmir) yörelerinde en büyük ortak çevre felaketi aşağıdakilerden hangisidir?",
        "options": [
            "Bölgede kuraklığa bağlı çölleşme yaşanması",
            "Aşırı kimyasal, metalurjik ve petrokimya atıklarının akarsulara ve havaya kontrolsüz salınması sonucu ağır sanayi kirliliği",
            "Bölgede orman alanlarının aşırı genişleyip şehri yutması",
            "Bölgede obrukların oluşması",
            "Buzul erimelerinin şehri su altında bırakması"
        ],
        "correctIndex": 1,
        "explanation": "Dilovası (kimya, boya, demir sanayi), Ergene (deri, tekstil boyahaneleri) ve Aliağa (rafineri, petrokimya, demir-çelik cürufu); Türkiye'de sanayi atıklarının toprak, akarsu ve havayı ağır şekilde kirlettiği en riskli çevre kirliliği sıcak noktalarıdır.",
        "distractor_trap": "Ergene nehrinin renginin siyaha dönmesi ve Dilovası'ndaki hava kirliliği sanayinin plansız ve arıtmasız büyümesinin çevre faturasıdır."
    }
]
