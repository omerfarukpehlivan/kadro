# -*- coding: utf-8 -*-
"""
KPSS Coğrafya — Konu 5: Madenler ve Enerji Kaynakları (40 Özgün Soru)
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
        "topic": "Madenler ve Enerji Kaynakları",
        "difficulty": 1,
        "prompt_text": "Türkiye'de jeolojik zamanlar boyunca yoğun volkanik faaliyetler, kırılmalar ve başkalaşım (metamorfizma) süreçleri yaşanmıştır.\n\nTürkiye'de maden çeşitliliği ve rezerv zenginliği bakımından ilk sırada yer alan coğrafi bölüm ve ilimiz aşağıdakilerden hangisinde doğru verilmiştir?",
        "options": [
            "Yukarı Fırat Bölümü — Elazığ",
            "Çatalca - Kocaeli Bölümü — İstanbul",
            "Kıyı Ege Bölümü — İzmir",
            "Antalya Bölümü — Antalya",
            "Konya Bölümü — Konya"
        ],
        "correctIndex": 0,
        "explanation": "Türkiye'de maden çeşitliliğinin en fazla olduğu coğrafi bölge Doğu Anadolu, bölüm Yukarı Fırat Bölümü, il ise Elazığ'dır (Maden ilçesinde bakır, Guleman'da krom, Keban'da kurşun-çinko, Alacakaya'da mermer).",
        "distractor_trap": "Sanayi devi Marmara olsa da yer altı maden çeşitliliği birincisi Yukarı Fırat Bölümü ve Elazığ'dır."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Madenler ve Enerji Kaynakları",
        "difficulty": 1,
        "prompt_text": "Dünya toplam rezervinin yaklaşık %72'sine Türkiye'nin sahip olduğu; roket yakıtı, cam, seramik, deterjan ve nükleer sanayide kullanılan stratejik maden aşağıdakilerden hangisidir?",
        "options": [
            "Boksit",
            "Krom",
            "Bor Mineralleri",
            "Barit",
            "Asbest"
        ],
        "correctIndex": 2,
        "explanation": "Türkiye dünyadaki bor rezervlerinin yaklaşık %72-73'ünü elinde bulundurarak dünya tekeli konumundadır. Balıkesir (Bigadiç, Susurluk), Bursa (Mustafakemalpaşa), Kütahya (Emet) ve Eskişehir (Seyitgazi/Kırka) başlıca çıkarım sahalarıdır.",
        "distractor_trap": "Dünya rezervinin dörtte üçüne sahip olduğumuz ve her sınavda potansiyel soru olan milli madenimiz Bordur."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Madenler ve Enerji Kaynakları",
        "difficulty": 1,
        "prompt_text": "Demirin çeliğe dönüştürülmesinde sertleştirici ve paslanmazlık sağlayıcı olarak kullanılan, Türkiye'nin önemli ihraç madenlerinden biri olan kromun en önemli çıkarım ve işleme merkezi aşağıdakilerden hangisidir?",
        "options": [
            "Elazığ (Guleman)",
            "Zonguldak (Ereğli)",
            "Artvin (Murgul)",
            "Konya (Seydişehir)",
            "Balıkesir (Bandırma)"
        ],
        "correctIndex": 0,
        "explanation": "Kromun Türkiye'deki en zengin yatakları Elazığ-Guleman ve Muğla-Fethiye-Köyceğiz yörelerindedir. Elazığ'da çıkarılan krom yine Elazığ Ferrokrom Tesisleri'nde işlenir.",
        "distractor_trap": "Krom denince akla gelen iki ferrokrom tesisi Elazığ (hammaddeye yakın) ve Antalya'dır (limana/ihracata yakın)."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Madenler ve Enerji Kaynakları",
        "difficulty": 1,
        "prompt_text": "Alüminyumun hammaddesi olan boksit madeni Türkiye'de çıkarıldığı yerde işlenerek alüminyuma dönüştürülmektedir.\n\nTürkiye'nin tek entegre boksit ve alüminyum tesisleri hangi ilçemizde yer almaktadır?",
        "options": [
            "Konya — Seydişehir",
            "İzmir — Aliağa",
            "Sivas — Divriği",
            "Manisa — Soma",
            "Mardin — Mazıdağı"
        ],
        "correctIndex": 0,
        "explanation": "Boksit (alüminyum) yatakları Konya-Seydişehir ve Antalya-Akseki'de bulunur. Türkiye'nin tek alüminyum fabrikası Konya-Seydişehir'de kurulmuştur.",
        "distractor_trap": "Boksit = Alüminyum = Seydişehir! Bu eşleştirme ÖSYM sınavlarının demirbaş bilgisidir."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Madenler ve Enerji Kaynakları",
        "difficulty": 1,
        "prompt_text": "Türkiye'de maden ihracatı gelirleri incelendiğinde, tek başına maden ihracatımızın yaklaşık yarısını oluşturan ve en yüksek döviz girdisi sağlayan maden türü aşağıdakilerden hangisidir?",
        "options": [
            "Krom",
            "Mermer (Doğal Taş)",
            "Bakır",
            "Linyit",
            "Fosfat"
        ],
        "correctIndex": 1,
        "explanation": "Kalkerin yüksek sıcaklık ve basınç altında metamorfizmaya uğramasıyla oluşan mermer (özellikle Afyonkarahisar, Marmara Adası, Bilecik, Muğla ve Elazığ vişne mermeri), Türkiye'nin maden ihracat gelirlerinde açık ara birinci sıradadır.",
        "distractor_trap": "Adaylar bor veya kromun ihracatta birinci olduğunu düşünebilir; parasal getiri ve hacimde açık ara 1 numara işlenmiş ve blok mermerdir."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Madenler ve Enerji Kaynakları",
        "difficulty": 1,
        "prompt_text": "Türkiye'de elektrik enerjisi üretiminde kullanılan kaynaklar arasında yer alan taş kömürü ile linyit arasındaki en temel jeolojik ve kimyasal fark aşağıdakilerden hangisidir?",
        "options": [
            "Taş kömürünün III. Zaman'da, linyitin I. Zaman'da oluşması",
            "Taş kömürünün I. Zaman'da (Paleozoyik) oluşmuş yüksek kalorili bir kömür olması; linyitin ise III. Zaman'da oluşmuş düşük kalorili genç bir kömür olması",
            "Linyitin sadece Karadeniz'de, taş kömürünün tüm bölgelerde bulunması",
            "Taş kömürünün evlerin ısıtılmasında, linyitin sadece demir-çelik sanayisinde kullanılması",
            "Linyitin çevreye hiç karbon salınımı yapmaması"
        ],
        "correctIndex": 1,
        "explanation": "Taş kömürü I. Jeolojik Zaman'da (Paleozoyik) oluşmuş, karbon oranı ve kalorisi çok yüksek yaşlı bir kömürdür (Zonguldak). Linyit ise III. Jeolojik Zaman'da oluşmuş, kalorisi düşük, kükürt oranı yüksek genç bir kömürdür ve Türkiye'nin her yerine yayılmıştır.",
        "distractor_trap": "Demir-çelik fabrikalarında yüksek ısı sağladığı için taş kömürü (kok kömürü) kullanılır; linyitin kalorisi demiri eritmeye yetmez, sadece termik santrallerde yakılır."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Madenler ve Enerji Kaynakları",
        "difficulty": 1,
        "prompt_text": "Türkiye'nin en büyük linyit rezervine sahip olan ve üzerinde devasa termik elektrik üretim santralleri kurulan yöresi aşağıdakilerden hangisidir?",
        "options": [
            "Kahramanmaraş — Afşin-Elbistan",
            "Manisa — Soma",
            "Kütahya — Tavşanlı",
            "Muğla — Yatağan",
            "Bursa — Orhaneli"
        ],
        "correctIndex": 0,
        "explanation": "Türkiye'deki toplam linyit rezervinin yaklaşık yarısı tek başına Kahramanmaraş'taki Afşin-Elbistan linyit havzasında bulunmaktadır. Buradaki A ve B santralleri Türkiye'nin en büyük termik santrallerindendir.",
        "distractor_trap": "Soma ve Yatağan da linyitle çalışır ancak en büyük linyit rezervi tartışmasız Kahramanmaraş Afşin-Elbistan'dadır."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Madenler ve Enerji Kaynakları",
        "difficulty": 1,
        "prompt_text": "Türkiye'de petrol ilk kez 1940 yılında hangi dağımızda açılarak üretime başlayan kuyudan çıkarılmıştır?",
        "options": [
            "Nemrut Dağı",
            "Raman Dağı (Batman)",
            "Cudi Dağı",
            "Gabar Dağı",
            "Tendürek Dağı"
        ],
        "correctIndex": 1,
        "explanation": "Türkiye'de ilk ticari petrol keşfi 1940 yılında Batman sınırları içindeki Raman Dağı'nda (Raman-8 kuyusu) yapılmış ve burada Türkiye'nin ilk rafinerisi kurulmuştur.",
        "distractor_trap": "Son yıllarda Şırnak Gabar Dağı'nda büyük rezervler bulunsa da Türkiye'nin ilk petrol dağı tarihi olarak Raman Dağı'dır."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Madenler ve Enerji Kaynakları",
        "difficulty": 1,
        "prompt_text": "Türkiye'de yer altındaki sıcak su ve su buharından elektrik üretilen jeotermal enerji santralleri (JES) en çok hangi coğrafi bölgemizde yoğunlaşmıştır?",
        "options": [
            "İç Anadolu Bölgesi",
            "Ege Bölgesi",
            "Karadeniz Bölgesi",
            "Doğu Anadolu Bölgesi",
            "Güneydoğu Anadolu Bölgesi"
        ],
        "correctIndex": 1,
        "explanation": "Jeotermal enerji kırıklı fay hatlarına ve genç tektonik çöküntülere bağlıdır. Batı Anadolu Fay Sistemi'nin horst-graben oluklarında yer alan Ege Bölgesi (Denizli-Sarayköy, Aydın-Germencik, Manisa-Alaşehir) Türkiye'nin jeotermal enerji merkezidir.",
        "distractor_trap": "İlk jeotermal santral Denizli-Sarayköy'dedir; ardından Aydın-Germencik kurulmuştur. Lider bölge Ege'dir."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Madenler ve Enerji Kaynakları",
        "difficulty": 1,
        "prompt_text": "Suni gübre sanayisinin temel girdisi olan fosfat kayası Türkiye'de en çok hangi ilimizin ilçesinde çıkarılmaktadır?",
        "options": [
            "Mardin — Mazıdağı",
            "Elazığ — Maden",
            "Kastamonu — Küre",
            "Sivas — Kangal",
            "Konya — Seydişehir"
        ],
        "correctIndex": 0,
        "explanation": "Türkiye'deki en önemli fosfat yatakları ve fosfat işleme entegre tesisi Mardin'in Mazıdağı ilçesinde yer almaktadır. Ancak bu rezervler ülke gübre tüketimini karşılamaya yetmediğinden Fas ve Tunus'tan fosfat ithal edilir.",
        "distractor_trap": "Fosfat = Gübre = Mardin Mazıdağı. Çıkarıldığı halde tüketimimiz çok olduğu için fosfatta dışa bağımlıyız."
    },

    # -------------------------------------------------------------
    # TEST 2: STANDART ÖSYM AYARI (Zorluk: 2) - Sorular 11-20
    # -------------------------------------------------------------
    {
        "lesson": "Coğrafya",
        "topic": "Madenler ve Enerji Kaynakları",
        "difficulty": 2,
        "prompt_text": "Karabük ve Ereğli Demir-Çelik Fabrikaları'nın (KARDEMİR ve ERDEMİR) kuruluş yeri belirlenirken hammadde olan demir cevherinin bölgede bulunmamasına rağmen buranın tercih edilmesinin temel sebebi aşağıdakilerden hangisidir?",
        "options": [
            "Bölgede iş gücü maliyetlerinin çok düşük olması",
            "Demiri eritecek yüksek kalorili taş kömürü yataklarına (enerji kaynağına) yakınlık",
            "Karadeniz'in balıkçılık potansiyeli",
            "Bölgede deprem riskinin sıfır olması",
            "Geniş tarım arazilerinin varlığı"
        ],
        "correctIndex": 1,
        "explanation": "Demir cevheri Sivas-Divriği ve Malatya'dan getirilmektedir. Karabük ve Ereğli'nin seçilme nedeni demir değil, demiri eritecek olan 2000°C ısıyı sağlayan taş kömürü yataklarının (Zonguldak havzası) hemen yanı başında olmasıdır (enerji kaynağına yakınlık).",
        "distractor_trap": "İskenderun liman/ulaşım için; Karabük-Ereğli ise enerji kaynağı (taş kömürü) için kurulmuştur!"
    },
    {
        "lesson": "Coğrafya",
        "topic": "Madenler ve Enerji Kaynakları",
        "difficulty": 2,
        "prompt_text": "İskenderun Demir-Çelik Fabrikası'nın (İSDEMİR) kuruluş yerinin belirlenmesinde ne demir madeni yatakları ne de taş kömürü yatakları bulunmaktadır.\n\nBuna rağmen İskenderun'un Türkiye'nin en büyük entegre yassı çelik üretim tesisi olarak seçilmesinin temel coğrafi gerekçesi aşağıdakilerden hangisidir?",
        "options": [
            "Akdeniz ikliminin ılıman olması",
            "Geniş ve korunaklı bir limana sahip olması, ithalat ve ihracat kolaylığı (ulaşım faktörü)",
            "Bölgede hidroelektrik santrallerinin çokluğu",
            "Çukurova'daki pamuk tarımına destek olmak",
            "Toros Dağları'ndan gelen kaynak sularının bolluğu"
        ],
        "correctIndex": 1,
        "explanation": "İskenderun ne hammaddeye (demir) ne de enerjiye (kömür) yakındır. Seçilme sebebi; ithal kömür ve cevherin dev gemilerle doğrudan yanaşabileceği derin ve korunaklı bir limanının bulunması ve Akdeniz üzerinden dünyaya ihracat kolaylığıdır (ulaşım/liman avantajı).",
        "distractor_trap": "Karabük/Ereğli = Enerji kaynağına yakınlık; İskenderun = Ulaşım ve liman kolaylığı."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Madenler ve Enerji Kaynakları",
        "difficulty": 2,
        "prompt_text": "Kastamonu-Küre'den çıkarılan bakır madeni işlenmek üzere Samsun'daki bakır işletmelerine taşınmaktadır.\n\nBakır izabe tesislerinin Küre yerine Samsun'da kurulmasının temel sebebi aşağıdakilerden hangisidir?",
        "options": [
            "Samsun'da bakır madeni rezervlerinin daha zengin olması",
            "Samsun'un gelişmiş bir limana ve iç kesimlerle kolay demir yolu bağlantısına (hinterlanda) sahip olması",
            "Samsun'da doğal gaz santralinin bulunması",
            "Kastamonu'da işçi bulunamaması",
            "Küre'de hava sıcaklığının bakırı eritmeye elverişsiz olması"
        ],
        "correctIndex": 1,
        "explanation": "Küre dağlık ve limansızdır. Samsun ise Canik Dağları basık olduğu için iç kesimlerle demiryolu bağlantısı olan, geniş hinterlandlı bir liman kentidir. Madenin deniz yoluyla sevkiyatı ve pazarlanması için tesis Samsun Limanı'nda kurulmuştur (ulaşım faktörü).",
        "distractor_trap": "Samsun'da bakır madeni ÇIKMAZ; hammadde Kastamonu Küre ve Murgul'dan gelir. Samsun sadece liman/ulaşım avantajıyla işleme tesisidir."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Madenler ve Enerji Kaynakları",
        "difficulty": 2,
        "prompt_text": "Petrol rafinerileri ham petrolü işleyerek benzin, motorin, LPG, gaz yağı ve zift gibi yan ürünlere ayrıştırır.\n\nTürkiye'deki petrol rafinerileri ve kuruluş gerekçeleri eşleştirmelerinden hangisi yanlıştır?",
        "options": [
            "Batman Rafinerisi — Hammaddeye (petrol kuyularına) yakınlık",
            "İzmit (Tüpraş) Rafinerisi — Büyük tüketim pazarına ve sanayiye yakınlık",
            "İzmir (Aliağa) Rafinerisi — Liman ve deniz yolu ulaşımı kolaylığı",
            "Kırıkkale (Orta Anadolu) Rafinerisi — Stratejik iç güvenlik ve tüketim merkezlerine dağıtım",
            "Mersin (ATAŞ) Rafinerisi — Taş kömürü yataklarına yakınlık"
        ],
        "correctIndex": 4,
        "explanation": "Mersin ATAŞ Rafinerisi deniz yoluyla ham petrol ithalatı (liman) için kurulmuştur (günümüzde depolama tesisi olarak kullanılır); taş kömürü ile hiçbir ilişkisi yoktur.",
        "distractor_trap": "Türkiye'de tek hammaddeye yakın rafineri Batman'dır. Diğerleri (İzmit, İzmir, Mersin, Kırıkkale) pazar, liman ve stratejik konum nedeniyle kurulmuştur."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Madenler ve Enerji Kaynakları",
        "difficulty": 2,
        "prompt_text": "Türkiye'de çıkarılan süs taşları ve çıkarıldıkları iller eşleştirmelerinden hangisi doğrudur?",
        "options": [
            "Oltu Taşı (Siyah kehribar) — Erzurum",
            "Lületaşı — Diyarbakır",
            "Krom Taşı — Sinop",
            "Oltu Taşı — Eskişehir",
            "Lületaşı — Trabzon"
        ],
        "correctIndex": 0,
        "explanation": "Oltu taşı Erzurum'un Oltu ilçesinde çıkarılır (tespih ve süs eşyası). Lületaşı ise Eskişehir'de çıkarılır (pipo ve biblo).",
        "distractor_trap": "Oltu = Erzurum; Lületaşı = Eskişehir! Bu ikisinin illerini birbirine çaprazlayıp şıklara koymak ÖSYM'nin en klasik tuzağıdır."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Madenler ve Enerji Kaynakları",
        "difficulty": 2,
        "prompt_text": "Doğal gaz elektrik üretiminde yüksek verimli ve nispeten temiz bir fosil yakıttır. Ancak Türkiye doğal gaz tüketiminin %98'ini Rusya, Azerbaycan ve İran gibi ülkelerden boru hatları ve LNG ile ithal etmektedir.\n\nAşağıdaki termik santrallerden hangisi elektrik üretirken yakıt olarak 'ithal doğal gaz' kullanmaktadır?",
        "options": [
            "Afşin - Elbistan Termik Santrali",
            "Çatalağzı Termik Santrali",
            "Hamitabat (Kırklareli) ve Ambarlı (İstanbul) Santralleri",
            "Soma Termik Santrali",
            "Yatağan Termik Santrali"
        ],
        "correctIndex": 2,
        "explanation": "Hamitabat (Kırklareli), Ambarlı (İstanbul) ve Ovaakça (Bursa) termik santralleri doğal gaz ile elektrik üretir. Afşin-Elbistan, Soma ve Yatağan linyitle; Çatalağzı ise taş kömürüyle çalışır.",
        "distractor_trap": "Çatalağzı = Taş Kömürü; Soma/Yatağan = Linyit; Hamitabat/Ambarlı/Ovaakça = Doğal Gaz."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Madenler ve Enerji Kaynakları",
        "difficulty": 2,
        "prompt_text": "Türkiye'nin hidroelektrik enerji potansiyeli bölgeler arasında büyük tezat gösterir. Doğu Anadolu ve Doğu Karadeniz'de potansiyel zirvede iken, Marmara ve Ege'de potansiyel son derece düşüktür.\n\nBu durum hidroelektrik potansiyelin doğrudan aşağıdakilerden hangisine bağlı olmasının bir sonucudur?",
        "options": [
            "Bölgedeki maden rezervlerinin zenginliğine",
            "Yatak eğimi, akarsu akış hızı ve ortalama yükselti basamaklarına",
            "Akarsuların boylarının uzunluğuna",
            "Bölgedeki nüfus yoğunluğuna",
            "Akarsuların açık ya da kapalı havza olmasına"
        ],
        "correctIndex": 1,
        "explanation": "Hidroelektrik potansiyel; suyun düştüğü yükseklik (kot farkı), vadinin dikliği ve akış hızıyla doğru orantılıdır. Yüksek ve eğimli Doğu Anadolu ile Karadeniz'de hidroelektrik enerji tavan yaparken, düz ova ve tabanlardan oluşan Marmara'da (Ergene vb.) eğim sıfıra yakın olduğu için potansiyel dip seviyededir.",
        "distractor_trap": "Akarsuyun uzun olması hidroelektrik üretmez! Belirleyici olan debi ve yatak eğimidir (yükselti farkı)."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Madenler ve Enerji Kaynakları",
        "difficulty": 2,
        "prompt_text": "Rüzgar enerjisi santralleri (RES), yıl boyu düzenli ve şiddetli hava akımlarının olduğu kıyı ve boğaz koridorlarında kurulur.\n\nTürkiye'de rüzgar enerjisinden elektrik üreten santrallerin en yoğun kümelendiği bölge ve ilk kurulan rüzgar santralinin bulunduğu yöre aşağıdakilerden hangisidir?",
        "options": [
            "Ege Bölgesi — İzmir (Alaçatı / Çeşme)",
            "Doğu Anadolu Bölgesi — Erzurum",
            "İç Anadolu Bölgesi — Konya",
            "Karadeniz Bölgesi — Trabzon",
            "Akdeniz Bölgesi — Antalya"
        ],
        "correctIndex": 0,
        "explanation": "Türkiye'de rüzgar enerjisi kurulu gücünün en yüksek olduğu bölge Ege ve Marmara'dır (İzmir, Balıkesir, Çanakkale, Manisa). Türkiye'nin ilk rüzgar enerji santrali 1998 yılında İzmir Çeşme Alaçatı'da faaliyete geçmiştir.",
        "distractor_trap": "İlk rüzgar santrali İzmir Alaçatı'dır; lider bölgeler ise Ege ve Güney Marmara'dır."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Madenler ve Enerji Kaynakları",
        "difficulty": 2,
        "prompt_text": "I. Balıkesir (Bandırma)\nII. Eskişehir (Kırka)\nIII. Kütahya (Emet)\nIV. Zonguldak (Ereğli)\n\nYukarıda verilen yerlerden hangilerinde bor tuzlarını işleyen bor türevleri ve borik asit fabrikaları yer almaktadır?",
        "options": [
            "I, II ve III",
            "II, III ve IV",
            "I ve IV",
            "Yalnız I",
            "I, II, III ve IV"
        ],
        "correctIndex": 0,
        "explanation": "Bandırma'da Borik Asit Fabrikası (limana yakınlık); Eskişehir Kırka'da Sodyum Borat Fabrikası ve Kütahya Emet'te Borik Asit Tesisleri (hammaddeye yakınlık) bulunmaktadır. Ereğli'de ise demir-çelik fabrikası vardır, bor tesisi yoktur.",
        "distractor_trap": "Bandırma, Kırka ve Emet Eti Maden'in üç ana bor entegre tesisidir."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Madenler ve Enerji Kaynakları",
        "difficulty": 2,
        "prompt_text": "Türkiye'de petrol ve doğal gaz arama kuyularında sondaj çamurunun yoğunluğunu artırarak basınç kontrolü sağlamak amacıyla kullanılan ve en çok Antalya (Alanya-Gazipaşa) ile Maraş-Elbistan'da çıkarılan ağır mineral hangisidir?",
        "options": [
            "Barit",
            "Asbest",
            "Feldspat",
            "Zımpara Taşı",
            "Kükürt"
        ],
        "correctIndex": 0,
        "explanation": "Barit yüksek özgül ağırlığı olan baryum sülfat mineralidir. Petrol ve gaz sondajlarında kuyu püskürmelerini önleyen sondaj çamurunun temel maddesidir. Alanya ve Gazipaşa en bilinen yataklarıdır.",
        "distractor_trap": "Sondaj çamuru ve petrol kuyusu denince coğrafyada tek cevap Barittir."
    },

    # -------------------------------------------------------------
    # TEST 3: STANDART ÖSYM AYARI (Zorluk: 2) - Sorular 21-30
    # -------------------------------------------------------------
    {
        "lesson": "Coğrafya",
        "topic": "Madenler ve Enerji Kaynakları",
        "difficulty": 2,
        "prompt_text": "Türkiye'nin güneş enerjisi potansiyeli incelendiğinde Güneydoğu Anadolu ve Akdeniz bölgeleri yıllık güneşlenme süresi bakımından en yüksek potansiyele sahiptir.\n\nBuna karşılık Karadeniz Bölgesi'nin güneş enerjisi potansiyelinin Türkiye'nin en düşük seviyesinde kalmasının temel nedeni aşağıdakilerden hangisidir?",
        "options": [
            "Yıllık ortalama bulutluluk oranının çok yüksek ve yağışlı gün sayısının fazla olması",
            "Enleminin Ekvator'a çok yakın olması",
            "Güneş ışınlarının yere düşme açısının kutup kuşağıyla aynı olması",
            "Bölgede dağların kıyıya dik uzanması",
            "Toprağın aşırı kireçli olması"
        ],
        "correctIndex": 0,
        "explanation": "Güneş enerjisi üretimi açık ve güneşli gün sayısına bağlıdır. Karadeniz kıyı kuşağı her mevsim nemli ve yağışlı geçtiği için bulutluluk oranı Türkiye'nin en yükseğidir; dolayısıyla yıllık güneşlenme süresi (yaklaşık 1700 saat) en düşüktür.",
        "distractor_trap": "Güneş enerjisinde potansiyel: En fazla Güneydoğu ve Akdeniz; en az Karadeniz (bulutluluk yüzünden)."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Madenler ve Enerji Kaynakları",
        "difficulty": 2,
        "prompt_text": "Türkiye'nin ilk nükleer enerji santrali olan Akkuyu Nükleer Güç Santrali Mersin ilinde inşa edilmektedir.\n\nSantral yeri olarak Mersin-Gülnar/Akkuyu sahasının seçilmesinde aşağıdakilerden hangisi birincil faktör olmuştur?",
        "options": [
            "Bölgenin I. derece aktif deprem fay hatlarından uzak olması ve reaktör soğutması için Akdeniz suyunun kullanılabilmesi",
            "Bölgede zengin uranyum ve toryum madenlerinin bulunması",
            "Güneydoğu Anadolu'daki pamuk tarımına elektrik sağlamak istenmesi",
            "Bölgede rüzgar hızının çok düşük olması",
            "Bölgenin nüfus yoğunluğunun Türkiye'nin en yükseği olması"
        ],
        "correctIndex": 0,
        "explanation": "Nükleer santraller için en kritik güvenlik kriteri sismik stabilitedir. Mersin (ve Sinop) Türkiye'de deprem riski en az olan masif/kararlı alanlardandır. Ayrıca reaktörlerin nükleer soğutma çevrimi için devasa miktarda deniz suyuna (Akdeniz kıyısına) ihtiyaç duyulur.",
        "distractor_trap": "Akkuyu'da uranyum çıktığı için DEĞİL; deprem riski düşük olduğu ve deniz suyu soğutması yapılabileceği için kurulmuştur!"
    },
    {
        "lesson": "Coğrafya",
        "topic": "Madenler ve Enerji Kaynakları",
        "difficulty": 2,
        "prompt_text": "I. Sivas — Divriği\nII. Malatya — Hekimhan ve Hasançelebi\nIII. Sakarya — Çamdağı\nIV. Elazığ — Guleman\n\nYukarıda verilen maden yataklarından hangileri Türkiye'nin en önemli 'demir' madeni sahaları arasında yer alır?",
        "options": [
            "I, II ve III",
            "II, III ve IV",
            "I ve IV",
            "Yalnız I",
            "I, II, III ve IV"
        ],
        "correctIndex": 0,
        "explanation": "Divriği (Sivas), Hasançelebi ve Hekimhan (Malatya) ile Çamdağı (Sakarya) Türkiye'nin başlıca demir cevheri yataklarıdır. Guleman (Elazığ) ise demir değil krom yatağıdır.",
        "distractor_trap": "Guleman kromdur; Divriği ve Hekimhan demirdir. Bu ikisi madencilik coğrafyasının en temel ayrımıdır."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Madenler ve Enerji Kaynakları",
        "difficulty": 2,
        "prompt_text": "Seramik, porselen, cam ve kaynak elektrotları sanayisinin temel hammaddesi olan ve Ege Bölgesi'nde (Manisa, Aydın, Muğla) çıkarılarak Güllük Limanı'ndan dünyaya ihraç edilen maden aşağıdakilerden hangisidir?",
        "options": [
            "Feldspat",
            "Linyit",
            "Kükürt",
            "Asbest",
            "Cıva"
        ],
        "correctIndex": 0,
        "explanation": "Feldspat, Türkiye'nin son yıllarda dünya ihracatında liderliğe oynadığı, seramik ve cam sektörünün vazgeçilmez mineralidir. Yatakları Batı Anadolu'da (Demirci, Milas, Çine) kümelenmiştir.",
        "distractor_trap": "Cam ve seramik sanayisi dendiğinde bor ile birlikte en kritik mineral feldspattır."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Madenler ve Enerji Kaynakları",
        "difficulty": 2,
        "prompt_text": "Çoruh Nehri üzerinde inşa edilen ve 275 metre gövde yüksekliği ile Türkiye'nin en yüksek, dünyanın ise kendi sınıfında beşinci en yüksek kemer barajı olan dev hidroelektrik santrali aşağıdakilerden hangisidir?",
        "options": [
            "Yusufeli Barajı",
            "Atatürk Barajı",
            "Keban Barajı",
            "Karakaya Barajı",
            "Hirfanlı Barajı"
        ],
        "correctIndex": 0,
        "explanation": "Artvin'de Çoruh Nehri üzerinde inşa edilen Yusufeli Barajı ve HES, 275 metrelik gövde yüksekliğiyle Türkiye'nin en yüksek barajı unvanını Deriner Barajı'ndan devralmıştır.",
        "distractor_trap": "Su tutma hacminde ve kurulu güçte en büyük barajımız Atatürk Barajı'dır; gövde yüksekliğinde (en yüksek duvar) ise Yusufeli Barajı'dır."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Madenler ve Enerji Kaynakları",
        "difficulty": 2,
        "prompt_text": "Oda sıcaklığında sıvı halde bulunan tek metal maden cıvadır. Geçmişte termometre, ayna ve tarım ilaçlarında kullanılmış, ancak insan ve çevre sağlığına aşırı toksik (zehirli) etkileri nedeniyle Türkiye'deki tüm cıva maden ocakları kapatılmıştır.\n\nKapatılmadan önce Türkiye'nin en önemli cıva yatakları hangi ilimizin ilçelerinde (Ödemiş, Karaburun) bulunmaktaydı?",
        "options": [
            "İzmir",
            "Antalya",
            "Trabzon",
            "Sivas",
            "Adana"
        ],
        "correctIndex": 0,
        "explanation": "Türkiye'nin en ünlü cıva sahaları İzmir (Ödemiş ve Karaburun) ile Konya (Sarayönü) havzalarındaydı. Ağır cıva zehirlenmesi ve Minamata Sözleşmesi kapsamında bu ocaklar kapatılmıştır.",
        "distractor_trap": "Cıva sıvı metaldir; İzmir Ödemiş ve Konya Sarayönü yatakları artık çevre mevzuatı gereği kapalıdır."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Madenler ve Enerji Kaynakları",
        "difficulty": 2,
        "prompt_text": "Toryum geleceğin nükleer enerji yakıtı olarak kabul edilmektedir. Türkiye, dünyanın en zengin ikinci toryum rezervine sahip ülkesidir.\n\nTürkiye'de toryum rezervlerinin en zengin olduğu tespit edilen il ve yöremiz aşağıdakilerden hangisidir?",
        "options": [
            "Eskişehir — Sivrihisar (Beylikova)",
            "Zonguldak — Ereğli",
            "Artvin — Murgul",
            "Muğla — Fethiye",
            "Tekirdağ — Çorlu"
        ],
        "correctIndex": 0,
        "explanation": "Eskişehir Sivrihisar-Beylikova yöresi kompleks cevher yatağı olup dünyanın en büyük toryum ve nadir toprak elementleri (NTE) rezervlerinden birini barındırır.",
        "distractor_trap": "Geleceğin nükleer madeni Toryum = Eskişehir Sivrihisar Beylikova!"
    },
    {
        "lesson": "Coğrafya",
        "topic": "Madenler ve Enerji Kaynakları",
        "difficulty": 2,
        "prompt_text": "Türkiye'de taş kömürü yakılarak elektrik enerjisi üretilen Türkiye'nin ilk ve en eski termik santrali aşağıdakilerden hangisidir?",
        "options": [
            "Çatalağzı Termik Santrali (Zonguldak)",
            "Soma Termik Santrali (Manisa)",
            "Yatağan Termik Santrali (Muğla)",
            "Hamitabat Termik Santrali (Kırklareli)",
            "Kangal Termik Santrali (Sivas)"
        ],
        "correctIndex": 0,
        "explanation": "Zonguldak'ta kurulu olan Çatalağzı Termik Santrali, yerli taş kömürü tozlarını yakarak elektrik üreten Türkiye'nin taş kömürüne dayalı tek köklü devlet termik santralidir.",
        "distractor_trap": "Çatalağzı = Taş Kömürü. Diğer tüm kömürlü yerli santraller linyit kullanır."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Madenler ve Enerji Kaynakları",
        "difficulty": 2,
        "prompt_text": "Elektrik ve elektronik sanayisinde iletkenliği nedeniyle en çok aranan maden bakırdır.\n\nAşağıdakilerden hangisi Türkiye'nin aktif veya tarihi bakır madeni çıkarım sahalarından biri değildir?",
        "options": [
            "Artvin — Murgul",
            "Kastamonu — Küre",
            "Rize — Çayeli",
            "Elazığ — Maden",
            "Eskişehir — Seyitgazi"
        ],
        "correctIndex": 4,
        "explanation": "Murgul, Küre, Çayeli ve Maden (Elazığ) Türkiye'nin dört büyük bakır merkezidir (şifresi: 'KADER' - Kastamonu, Artvin, Diyarbakır, Elazığ, Rize). Eskişehir Seyitgazi ise bor madeni sahasıdır.",
        "distractor_trap": "Bakırın şifresi KADER'dir (Küre, Artvin/Murgul, Diyarbakır/Ergani, Elazığ/Maden, Rize/Çayeli). Eskişehir'de bakır değil bor çıkar."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Madenler ve Enerji Kaynakları",
        "difficulty": 2,
        "prompt_text": "I. Jeotermal enerji\nII. Taş kömürü\nIII. Doğal gaz\nIV. Rüzgar enerjisi\n\nYukarıda verilen enerji kaynaklarından hangileri 'tükenmeyen / yenilenebilir ve temiz' enerji kaynakları grubundadır?",
        "options": [
            "I ve IV",
            "II ve III",
            "I ve III",
            "II ve IV",
            "I, II ve IV"
        ],
        "correctIndex": 0,
        "explanation": "Jeotermal ve rüzgar enerjisi doğanın sürekliliğinden faydalanan yenilenebilir (temiz) kaynaklardır. Taş kömürü ve doğal gaz ise yakıldıkça tükenen ve atmosfere karbon salan fosil yakıtlardır.",
        "distractor_trap": "Fosil yakıtlar (kömür, petrol, gaz) yenilenemez; su, rüzgar, güneş ve jeotermal ise yenilenebilir enerjidir."
    },

    # -------------------------------------------------------------
    # TEST 4: NET SIÇRATAN / KURTLAR SOFRASI (Zorluk: 3) - Sorular 31-40
    # -------------------------------------------------------------
    {
        "lesson": "Coğrafya",
        "topic": "Madenler ve Enerji Kaynakları",
        "difficulty": 3,
        "prompt_text": "Türkiye'de sanayi tesislerinin kuruluş yeri belirlenirken 'hammaddeye yakınlık', 'enerji kaynağına yakınlık' ve 'ulaşım/pazara yakınlık' temel belirleyicilerdir.\n\nBuna göre aşağıdaki sanayi tesisi ve kuruluş yeri tercihi eşleştirmelerinden hangisi diğerlerinden farklı bir kritere dayanmaktadır?",
        "options": [
            "Seydişehir Alüminyum Tesisleri — Hammaddeye yakınlık",
            "Elazığ Ferrokrom Tesisleri — Hammaddeye yakınlık",
            "Murgul Bakır İşletmeleri — Hammaddeye yakınlık",
            "Samsun Bakır İzabe Tesisleri — Ulaşım ve liman kolaylığı",
            "Afyonkarahisar Mermer Fabrikaları — Hammaddeye yakınlık"
        ],
        "correctIndex": 3,
        "explanation": "Seydişehir (boksit), Elazığ (krom), Murgul (bakır) ve Afyonkarahisar (mermer) fabrikaları madenin çıkarıldığı yerin hemen yanına kurulmuştur (hammaddeye yakınlık). Oysa Samsun'da bakır madeni çıkmaz; Kastamonu Küre'den kamyon ve gemilerle gelen cevher Samsun Limanı ve demiryolu sayesinde burada işlenir (ulaşım/pazar kriteri).",
        "distractor_trap": "Samsun Bakır Fabrikası ÖSYM'nin en meşhur 'ulaşım faktörü' örneğidir; hammaddeye yakınlık değildir."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Madenler ve Enerji Kaynakları",
        "difficulty": 3,
        "prompt_text": "Doğu Karadeniz Bölümü'nde zengin maden yatakları (Artvin Murgul bakırı, Rize Çayeli bakır ve çinkosu) ve dev hidroelektrik enerji potansiyeli bulunmasına rağmen, bölgede ağır demir-çelik sanayisinin kurulamamış olmasının temel nedeni aşağıdakilerden hangisidir?",
        "options": [
            "Bölgede taş kömürü bulunmaması ve arazinin çok engebeli olması sebebiyle geniş fabrika kuracak düz alan ile demiryolu ulaşım ağının bulunmaması",
            "Bölge halkının sanayiye izin vermemesi",
            "Bölgede tatlı su kaynaklarının yetersiz olması",
            "Karadeniz'in fırtınalı olması",
            "Bölgenin askeri yasak bölge olması"
        ],
        "correctIndex": 0,
        "explanation": "Ağır sanayi binlerce dönüm düz arazi, yüksek kalorili taş kömürü ve en önemlisi ağır tonajlı tren yolu ağı ister. Doğu Karadeniz'de demiryolu hattı hiç yoktur; kıyı dik dağlarla çevrilidir ve taş kömürü yatakları Batı Karadeniz'dedir (Zonguldak).",
        "distractor_trap": "Doğu Karadeniz'de demiryolu ulaşımının olmaması ve topografik engebe sanayileşmenin önündeki en büyük coğrafi settir."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Madenler ve Enerji Kaynakları",
        "difficulty": 3,
        "prompt_text": "Türkiye'de elektrik enerjisi üretiminde kurak geçen yıllarda hidroelektrik barajların su seviyesi düşmekte ve üretim payı gerilemektedir.\n\nBöyle kurak dönemlerde oluşan enerji açığını kapatmak amacıyla payı en hızlı ve maliyetli şekilde artırılan elektrik kaynağı aşağıdakilerden hangisidir?",
        "options": [
            "Doğal Gaz Santralleri",
            "Rüzgar Santralleri",
            "Güneş Panelleri",
            "Jeotermal Santraller",
            "Taş Kömürü Santralleri"
        ],
        "correctIndex": 0,
        "explanation": "Doğal gaz çevrim santralleri aç-kapa esnekliği en yüksek, anında devreye sokulabilen santrallerdir. Barajlarda su bitince enerji krizi yaşamamak için devlet doğal gaz santrallerine yüklenir; bu durum doğal gaz ithalat faturasını ve cari açığı aniden zıplatır.",
        "distractor_trap": "Barajlardaki su azaldığında açığı kapatan ilk kaynak doğal gazdır; bu yüzden kurak yıllarda enerji ithalat faturamız katlanır."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Madenler ve Enerji Kaynakları",
        "difficulty": 3,
        "prompt_text": "Kırıkkale Orta Anadolu Petrol Rafinerisi deniz kenarında olmadığı halde Ankara'nın hemen yanı başında kurulmuştur.\n\nKırıkkale Rafinerisi'nin işlediği ham petrol rafineriye hangi yöntemle ulaştırılmaktadır?",
        "options": [
            "İskenderun ve Ceyhan Deniz Terminali'nden Kırıkkale'ye döşenen ham petrol boru hattı ile",
            "Sadece tanker kamyon filolarıyla",
            "Demiryolu sarnıçlı vagonlarıyla",
            "Karadeniz'den tanker gemilerle",
            "Kırıkkale'de petrol kuyusu açılarak"
        ],
        "correctIndex": 0,
        "explanation": "Kırıkkale Rafinerisi deniz kıyısında değildir; petrol ihtiyacı Ceyhan (Adana/Yumurtalık) terminalinden Kırıkkale'ye çekilen Ceyhan-Kırıkkale Ham Petrol Boru Hattı vasıtasıyla pompalanarak karşılanır.",
        "distractor_trap": "Kırıkkale'de petrol çıkmaz! Petrol boru hattıyla Adana/Ceyhan'dan pompalanır."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Madenler ve Enerji Kaynakları",
        "difficulty": 3,
        "prompt_text": "Güneydoğu Anadolu Projesi (GAP) kapsamında inşa edilen Atatürk Barajı ve Hidroelektrik Santrali Türkiye'nin elektrik üretiminde bir anıttır.\n\nAtatürk Barajı ile ilgili aşağıdaki bilgilerden hangisi yanlıştır?",
        "options": [
            "Fırat Nehri üzerinde kurulmuş olup Türkiye'nin kurulu güç bakımından en büyük hidroelektrik santralidir.",
            "Gövde dolgu hacmi bakımından dünyanın en büyük barajları arasında yer alır.",
            "Göl aynasından Şanlıurfa Harran Ovası'na su aktarmak için dev Şanlıurfa Sulama Tünelleri inşa edilmiştir.",
            "Türkiye'nin gövde yüksekliği en yüksek (en derin) barajıdır.",
            "Gölünde tatlı su balıkçılığı ve su sporları yapılmaktadır."
        ],
        "correctIndex": 3,
        "explanation": "Atatürk Barajı kurulu güç ve rezervuar alanı bakımından en büyüktür; ancak gövde yüksekliği bakımından Türkiye'nin en yüksek barajı Çoruh üzerindeki 275 metrelik Yusufeli Barajı'dır (ikinci Deriner'dir). Atatürk Barajı dolgu tipi yayvan bir barajdır.",
        "distractor_trap": "Atatürk Barajı en çok elektrik üreten ve en geniş alana yayılan barajdır; ancak EN YÜKSEK (en derin duvar) Yusufeli Barajı'dır!"
    },
    {
        "lesson": "Coğrafya",
        "topic": "Madenler ve Enerji Kaynakları",
        "difficulty": 3,
        "prompt_text": "Türkiye'de son yıllarda Karadeniz açıklarında keşfedilen 'Sakarya Gaz Sahası'ndan (Filyos Limanı üzerinden sisteme bağlanan) çıkarılan yerli doğal gazın ekonomiye en temel katkısı aşağıdakilerden hangisidir?",
        "options": [
            "Türkiye'nin enerji ithalatı faturasını ve cari açığını azaltması",
            "Türkiye'deki tüm termik santrallerin kapatılmasını sağlaması",
            "Türkiye'nin petrol ihtiyacının tamamını karşılaması",
            "Nükleer santral ihtiyacını tamamen ortadan kaldırması",
            "Güneş enerjisi yatırımlarını durdurması"
        ],
        "correctIndex": 0,
        "explanation": "Türkiye doğal gazda %98 oranında dışa bağımlıydı. Sakarya Gaz Sahası'ndan Filyos'a taşınan yerli Karadeniz gazı hane halkı tüketiminin önemli kısmını karşılayarak ülkenin en büyük kamburu olan enerji ithalatı kaynaklı cari açığı hafifletmektedir.",
        "distractor_trap": "Doğal gaz petrolün değil, kendi ithalat faturamızın yerini alır; nükleer veya güneşi durdurmaz, enerji sepetini çeşitlendirir."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Madenler ve Enerji Kaynakları",
        "difficulty": 3,
        "prompt_text": "I. Taşkömürü — Zonguldak havzası\nII. Linyit — Afşin-Elbistan havzası\nIII. Ham Petrol — Batman ve Şırnak havzası\nIV. Doğal Gaz — Kırklareli Hamitabat ve Düzce Akçakoca\n\nYukarıdaki fosil enerji kaynaklarından hangilerinde Türkiye'nin yerli üretimi ülke tüketiminin %50'sinden fazlasını karşılayabilmektedir?",
        "options": [
            "Yalnız II",
            "I ve II",
            "II ve III",
            "I, III ve IV",
            "Hiçbiri"
        ],
        "correctIndex": 0,
        "explanation": "Taş kömüründe tüketimimizin %90'ından fazlası ithaldir. Petrolde tüketimimizin %85-90'ı ithaldir. Doğal gazda %90'dan fazlası ithaldir. Ancak linyitte Türkiye'nin yerli rezervleri o kadar yaygındır ki termik santrallerde yakılan linyitin neredeyse tamamı yerli madenlerimizden temin edilir.",
        "distractor_trap": "Linyit yerli rezerv olarak en zengin olduğumuz fosil kaynaktır; petrol, taş kömürü ve gazda ise dışa bağımlıyız."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Madenler ve Enerji Kaynakları",
        "difficulty": 3,
        "prompt_text": "Türkiye'de 'maden zenginliği' (rezerv ve çeşitlilik) ile 'sanayi gelişmişliği' coğrafi olarak örtüşmez.\n\nBu tezat durumu kanıtlayan en somut bölgesel karşılaştırma aşağıdakilerden hangisidir?",
        "options": [
            "Doğu Anadolu Bölgesi'nin maden çeşitliliğinde birinci, sanayi üretiminde sonuncu olması; Marmara Bölgesi'nin ise maden fakiri olmasına rağmen sanayide açık ara birinci olması",
            "İç Anadolu'nun tarımda lider olması",
            "Karadeniz'in çayda lider olması",
            "Akdeniz'in seracılıkta birinci olması",
            "Ege'nin zeytinyağında birinci olması"
        ],
        "correctIndex": 0,
        "explanation": "Maden çeşitliliğinin şampiyonu Doğu Anadolu (özellikle Elazığ) olmasına karşın sermaye, pazar ve ulaşım kısıtları nedeniyle sanayisi en geri kalmış bölgedir. Tersine Marmara maden bakımından çok fakir olmasına karşın sermaye, liman ve pazar gücüyle Türkiye sanayisinin kalbidir.",
        "distractor_trap": "ÖSYM hammadde coğrafyası ile sanayi coğrafyası arasındaki mekânsal ayrışmayı çok sık soru konusu yapar."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Madenler ve Enerji Kaynakları",
        "difficulty": 3,
        "prompt_text": "Türkiye'de jeotermal elektrik üretim tesislerinden çıkan sıcak suyun reenjeksiyon (tekrar yer altına basılma) yöntemiyle kuyuya geri gönderilmemesi durumunda ortaya çıkacak en büyük çevresel tehlike aşağıdakilerden hangisidir?",
        "options": [
            "İçerdiği yoğun kükürt, bor ve ağır metallerin tarım arazilerini ve içme sularını zehirleyerek çoraklaştırması",
            "Bölgede aniden buzulların oluşması",
            "Bölgedeki rüzgarların yön değiştirmesi",
            "Toprağın aşırı verimli hale gelip ormanları kurutması",
            "Denizlerin tuzluluk oranının sıfıra inmesi"
        ],
        "correctIndex": 0,
        "explanation": "Jeotermal sular yer altından bor, arsenik ve kükürt gibi zehirli minerallerle çıkar. Eğer soğuduktan sonra yer altına geri basılmazsa Büyük Menderes ve Gediz nehirlerine karışarak Ege'nin incir ve zeytin bahçelerini tuzlayıp zehirler (çevre felaketi).",
        "distractor_trap": "Jeotermal temiz enerjidir ancak atık suyunun nehre bırakılması ağır kimyasal kirlilik (bor kirliliği) yaratır."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Madenler ve Enerji Kaynakları",
        "difficulty": 3,
        "prompt_text": "Dünya bor rezervlerinin %72'sini kontrol eden Türkiye'nin bor madenciliğinde dünya pazarlarındaki en büyük eksikliği ve katma değer yaratma hedefi aşağıdakilerden hangisidir?",
        "options": [
            "Bor madenini ham (tüvenan) cevher olarak satmak yerine lityum-iyon batarya, nükleer zırh ve savunma sanayi nihai yüksek teknolojili ürünlerine dönüştürerek ihraç etmek",
            "Bor rezervlerini tamamen yabancı şirketlere devretmek",
            "Bor maden ocaklarını kapatarak kömüre yönelmek",
            "Bor madenini sadece evlerde deterjan olarak tüketmek",
            "Bor madenini deniz yolu yerine sadece karayoluyla taşımak"
        ],
        "correctIndex": 0,
        "explanation": "Türkiye boru tonu 200-300 dolara ham mineral olarak ihraç ettiğinde düşük gelir elde eder. Eğer bu bor Balıkesir Bandırma Bor Karbür tesisinde olduğu gibi işlenip zırh ve yüksek teknoloji parçasına dönüştürülürse tonu 40.000 dolara kadar satılabilir (katma değer artışı).",
        "distractor_trap": "Türkiye'nin madencilikteki genel sorunu cevheri ham satmasıdır; hedef katma değerli nihai teknolojik ürün üretmektir."
    }
]
