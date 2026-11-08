# -*- coding: utf-8 -*-
"""
KPSS Güncel Bilgiler — Konu 5: UNESCO Miras Listesi (40 Özgün Soru)
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
        "lesson": "Güncel Bilgiler",
        "topic": "UNESCO Miras Listesi",
        "difficulty": 1,
        "prompt_text": "UNESCO Dünya Miras Komitesi'nin 2023 yılı Eylül ayında Riyad'da düzenlenen 45. Genişletilmiş Oturumu'nda Türkiye'nin 20. DÜNYA MİRASI olarak listeye kabul edilen, Frigya Krallığı'nın başkenti ve Kral Midas'ın mezarının yer aldığı antik kent hangisidir?",
        "options": [
            "Gordion (Ankara - Polatlı)",
            "Arslantepe (Malatya)",
            "Göbeklitepe (Şanlıurfa)",
            "Afrodisias (Aydın)",
            "Aizanoi (Kütahya)"
        ],
        "correctIndex": 0,
        "explanation": "Ankara'nın Polatlı ilçesinde yer alan Frig başkenti GORDİON, 2023 yılında Türkiye'nin 20. UNESCO Dünya Miras Alanı olarak tescil edilmiştir.",
        "distractor_trap": "Arslantepe 19. mirastır; 20. miras alanı GORDİON'dur; 21. miras ise Ahşap Direkli Camilerdir."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "UNESCO Miras Listesi",
        "difficulty": 1,
        "prompt_text": "2023 yılında UNESCO Dünya Miras Listesi'ne Türkiye'nin 21. VARLIĞI olarak seri adaylık şeklinde kaydedilen 'Anadolu'nun Ortaçağ Dönemi Ahşap Hipostil Camileri' arasında aşağıdakilerden hangisi yer almaz?",
        "options": [
            "Edirne Selimiye Camii",
            "Beyşehir Eşrefoğlu Camii (Konya)",
            "Afyonkarahisar Ulu Camii",
            "Sivrihisar Ulu Camii (Eskişehir)",
            "Kasaba Köyü Mahmut Bey Camii (Kastamonu)"
        ],
        "correctIndex": 0,
        "explanation": "Ahşap Hipostil camileri seri mirasında 5 cami vardır: Konya Eşrefoğlu, Afyon Ulu Cami, Eskişehir Sivrihisar Ulu Cami, Kastamonu Mahmut Bey Cami ve Ankara Ahi Şerafettin (Arslanhane) Cami. Selimiye Camii ise Edirne'de Mimar Sinan eseridir ve 2011'de bağımsız olarak listeye girmiştir.",
        "distractor_trap": "Ahşap hipostil camileri arasında taş kubbeli Selimiye veya Sultanahmet YOKTUR; ahşap direkli 5 tarihi cami vardır."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "UNESCO Miras Listesi",
        "difficulty": 1,
        "prompt_text": "Türkiye'nin UNESCO Dünya Miras Listesi'nde yer alan varlıkları arasında hem 'DOĞAL' hem de 'KÜLTÜREL' kriterleri bir arada taşıyan 'KARMA MİRAS' statüsündeki iki yer hangileridir?",
        "options": [
            "Göreme Milli Parkı ve Kapadokya — Pamukkale-Hierapolis",
            "Nemrut Dağı — Truva",
            "Efes — Bergama",
            "Ani Arkeolojik Alanı — Safranbolu",
            "Çatalhöyük — Göbeklitepe"
        ],
        "correctIndex": 0,
        "explanation": "Türkiye'nin 21 dünya mirasından 19'u kültürel mirastır; yalnızca 2 tanesi hem doğal güzelliği hem tarihi uygarlığı barındıran 'KARMA MİRAS'tır: 1) Göreme Milli Parkı ve Kapadokya (Nevşehir), 2) Pamukkale ve Hierapolis (Denizli).",
        "distractor_trap": "Türkiye'de saf doğal miras yoktur; sadece iki adet KARMA miras vardır: Kapadokya ve Pamukkale."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "UNESCO Miras Listesi",
        "difficulty": 1,
        "prompt_text": "Türkiye'nin UNESCO Dünya Miras Listesi'ne 1985 yılında DAHİL EDİLEN İLK ÜÇ VARLIĞI hangi seçenekte eksiksiz verilmiştir?",
        "options": [
            "İstanbul'un Tarihi Alanları — Divriği Ulu Camii ve Darüşşifası — Göreme ve Kapadokya",
            "Hattuşa — Nemrut Dağı — Xanthos-Letoon",
            "Safranbolu — Troya — Selimiye",
            "Çatalhöyük — Bergama — Efes",
            "Diyarbakır Surları — Ani — Göbeklitepe"
        ],
        "correctIndex": 0,
        "explanation": "Türkiye'nin 1985 yılında listeye ilk giren üç gözdesi: 1) İstanbul'un Tarihi Alanları, 2) Sivas Divriği Ulu Camii ve Darüşşifası, 3) Göreme Milli Parkı ve Kapadokya'dır.",
        "distractor_trap": "Listeye ilk giren cami Sivas Divriği Ulu Camii'dir (Selimiye 2011'de girmiştir)."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "UNESCO Miras Listesi",
        "difficulty": 1,
        "prompt_text": "Tarihte bilinen ilk tapınak kompleksi kabul edilen, 'T' biçimli dikilitaşları ve yabani hayvan kabartmalarıyla 'Tarihin Sıfır Noktası' olarak anılan ve 2018'de UNESCO Dünya Miras Listesi'ne giren arkeolojik alan hangisidir?",
        "options": [
            "Göbeklitepe (Şanlıurfa)",
            "Çatalhöyük (Konya)",
            "Çayönü (Diyarbakır)",
            "Hacılar (Burdur)",
            "Alacahöyük (Çorum)"
        ],
        "correctIndex": 0,
        "explanation": "Şanlıurfa'da Neolitik döneme ait 12 bin yıllık anıtsal tapınakları barındıran ve Alman arkeolog Klaus Schmidt'in gün yüzüne çıkardığı alan GÖBEKLİTEPE'dir.",
        "distractor_trap": "İlk köy yerleşimi Çayönü; ilk şehir yerleşimi Çatalhöyük; ilk tapınak kompleksi GÖBEKLİTEPE'dir."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "UNESCO Miras Listesi",
        "difficulty": 1,
        "prompt_text": "2021 yılında UNESCO Dünya Miras Listesi'ne Türkiye'nin 19. varlığı olarak kaydedilen, kerpiç saray kompleksi ve dünyanın en eski kılıçlarının bulunduğu Malatya'daki höyük hangisidir?",
        "options": [
            "Arslantepe Höyüğü",
            "Gordion",
            "Kültepe Kaniş",
            "Yassıhöyük",
            "Karahantepe"
        ],
        "correctIndex": 0,
        "explanation": "Malatya Battalgazi'deki ARSLANTEPE HÖYÜĞÜ, ilk devlet bürokrasisinin ve mühür baskılarının çıktığı kerpiç sarayıyla 2021'de 19. mirasımız olmuştur.",
        "distractor_trap": "Karahantepe Taş Tepeler projesindedir; UNESCO listesine giren Malatya höyüğü ARSLANTEPE'dir."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "UNESCO Miras Listesi",
        "difficulty": 1,
        "prompt_text": "Mimar Sinan'ın 'Ustalık Eserim' dediği, 2011 yılında tekil anıt eser olarak UNESCO Dünya Miras Listesi'ne kabul edilen mimarlık şaheseri nerededir?",
        "options": [
            "Edirne (Selimiye Camii ve Külliyesi)",
            "İstanbul (Süleymaniye Camii)",
            "İstanbul (Şehzade Camii)",
            "Bursa (Ulu Cami)",
            "Manisa (Muradiye Camii)"
        ],
        "correctIndex": 0,
        "explanation": "Mimar Sinan'ın 'çıraklık' eseri Şehzade Camii, 'kalfalık' eseri Süleymaniye Camii, 'ustalık' eseri ise EDİRNE SELİMİYE CAMİİ'dir.",
        "distractor_trap": "Süleymaniye kalfalıktır; ustalık eseri ve UNESCO listesindeki cami Edirne SELİMİYE'dir."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "UNESCO Miras Listesi",
        "difficulty": 1,
        "prompt_text": "Güneşin doğuşu ve batışının devasa kral ve tanrı heykelleri arasında izlendiği, I. Antiochos'un tümülüsünün bulunduğu Kommagene Krallığı'na ait UNESCO Dünya Mirası alanı nerededir?",
        "options": [
            "Adıyaman (Nemrut Dağı)",
            "Bitlis (Nemrut Krater Gölü)",
            "Malatya",
            "Gaziantep",
            "Şanlıurfa"
        ],
        "correctIndex": 0,
        "explanation": "Dev heykelleriyle ünlü UNESCO Dünya Mirası olan Nemrut Dağı ADIYAMAN il sınırları içerisindedir. (Bitlis'teki Nemrut ise volkanik krater gölüdür).",
        "distractor_trap": "Heykellerin olduğu UNESCO miras alanı ADIYAMAN'daki Nemrut Dağı'dır; Bitlis'teki krater gölü ile karıştırılmamalıdır."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "UNESCO Miras Listesi",
        "difficulty": 1,
        "prompt_text": "Anadolu'da kurulan ilk büyük imparatorluk olan Hititlerin başkenti olan, Yazılıkaya açık hava mabedi ve Boğazkale kalıntılarını barındıran UNESCO Dünya Miras Alanı hangi ilimizdedir?",
        "options": [
            "Çorum (Hattuşa)",
            "Yozgat",
            "Amasya",
            "Kayseri",
            "Kırşehir"
        ],
        "correctIndex": 0,
        "explanation": "Hitit İmparatorluğu'nun başkenti HATTUŞA (Boğazköy), ÇORUM ili sınırlarında yer alır ve 1986'da listeye girmiştir.",
        "distractor_trap": "Hitit başkenti Hattuşa ÇORUM'dadır. Kültepe (Kayseri) Asur ticaret kolonisi merkezidir."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "UNESCO Miras Listesi",
        "difficulty": 1,
        "prompt_text": "UNESCO Yaratıcı Şehirler Ağı'na (UCCN) 'GASTRONOMİ' (Mutfak Kültürü) alanında Türkiye'den İLK KABUL EDİLEN şehir hangisidir?",
        "options": [
            "Gaziantep",
            "Hatay",
            "Afyonkarahisar",
            "Adana",
            "Şanlıurfa"
        ],
        "correctIndex": 0,
        "explanation": "2015 yılında Gastronomi dalında Yaratıcı Şehirler Ağı'na Türkiye'den giren İLK şehir GAZİANTEP olmuştur. Ardından 2017'de Hatay, 2019'da Afyonkarahisar girmiştir.",
        "distractor_trap": "İLK giren Gaziantep'tir (2015); Hatay ikinci, Afyonkarahisar üçüncüdür."
    },

    # -------------------------------------------------------------
    # TEST 2: STANDART ÖSYM DÜZEYİ (Zorluk: 2) - Sorular 11-20
    # -------------------------------------------------------------
    {
        "lesson": "Güncel Bilgiler",
        "topic": "UNESCO Miras Listesi",
        "difficulty": 2,
        "prompt_text": "UNESCO Yaratıcı Şehirler Ağı'na (UCCN) 'MÜZİK' alanında Türkiye'den kabul edilen İLK ŞEHİR aşağıdakilerden hangisidir?",
        "options": [
            "Kırşehir",
            "Şanlıurfa",
            "Diyarbakır",
            "Sivas",
            "Trabzon"
        ],
        "correctIndex": 0,
        "explanation": "Bozkırın tezenesi Neşet Ertaş ve Abdallık geleneğinin beşiği olan KIRŞEHİR, 2019 yılında Türkiye'nin Müzik alanındaki İLK Yaratıcı Şehri olmuştur. (Şanlıurfa 2023'te müzik dalında ikinci şehir olmuştur).",
        "distractor_trap": "Kırşehir İLK müzik şehridir (2019); Şanlıurfa ise ikinci müzik şehridir (2023)."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "UNESCO Miras Listesi",
        "difficulty": 2,
        "prompt_text": "2023 yılında UNESCO Yaratıcı Şehirler Ağı'na 'EDEBİYAT' alanında Türkiye'den dahil edilen ilk kentimiz hangisidir?",
        "options": [
            "Kahramanmaraş",
            "İstanbul",
            "Diyarbakır",
            "Erzurum",
            "Kastamonu"
        ],
        "correctIndex": 0,
        "explanation": "'Yedi Güzel Adam'ın şehri, şiir ve edebiyatın başkenti olarak anılan KAHRAMANMARAŞ, 2023'te Edebiyat alanında UNESCO Yaratıcı Şehir unvanını almıştır.",
        "distractor_trap": "Edebiyat alanındaki tek UNESCO yaratıcı şehrimiz KAHRAMANMARAŞ'tır."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "UNESCO Miras Listesi",
        "difficulty": 2,
        "prompt_text": "UNESCO Yaratıcı Şehirler Ağı'na 'ZANAAT VE HALK SANATLARI' alanında Türkiye'den giren ilk şehir hangisidir?",
        "options": [
            "Kütahya",
            "Bursa",
            "İznik",
            "Mardin",
            "Nevşehir"
        ],
        "correctIndex": 0,
        "explanation": "Çinisi ve porseleniyle ünlü KÜTAHYA, 2017 yılında Zanaat ve Halk Sanatları dalında ağa katılan ilk Türk şehri olmuştur. (Bursa ise 2021'de ipek ve çinisiyle bu ağa girmiştir).",
        "distractor_trap": "İlk zanaat şehri KÜTAHYA'dır; Bursa ikinci zanaat şehridir."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "UNESCO Miras Listesi",
        "difficulty": 2,
        "prompt_text": "UNESCO Yaratıcı Şehirler Ağı'na 'TASARIM' alanında Türkiye'den dahil edilen metropol şehir hangisidir?",
        "options": [
            "İstanbul",
            "Ankara",
            "İzmir",
            "Eskişehir",
            "Antalya"
        ],
        "correctIndex": 0,
        "explanation": "2017 yılında Tasarım (Design) kategorisinde Yaratıcı Şehirler Ağı'na dahil edilen şehrimiz İSTANBUL'dur.",
        "distractor_trap": "Tasarım kategorisindeki tek şehrimiz İSTANBUL'dur."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "UNESCO Miras Listesi",
        "difficulty": 2,
        "prompt_text": "2023 yılı Aralık ayında Botsvana'nın Kasane kentinde toplanan UNESCO Somut Olmayan Kültürel Miras Komitesi toplantısında Türkiye adına listeye kaydedilen unsurlar arasında aşağıdakilerden hangisi YER ALMAZ?",
        "options": [
            "Kırkpınar Yağlı Güreşleri (2010)",
            "İftar ve İlgili Sosyo-Kültürel Gelenekler (2023)",
            "Tezhip Sanatı (2023)",
            "Sedef Kakma Sanatı (2023)",
            "Balaban / Mey Zanaatı ve İcrası (2023)"
        ],
        "correctIndex": 0,
        "explanation": "2023 Kasane toplantısında İftar gelenekleri, Tezhip, Sedef Kakma ve Balaban/Mey icrası tescil edilmiştir. Kırkpınar Yağlı Güreşleri ise çok daha önce, 2010 yılında listeye alınmıştı.",
        "distractor_trap": "2023 yılında tescillenen 4 unsur: İftar, Tezhip, Sedef Kakma, Balaban/Mey'dir. Kırkpınar ise 2010 tarihlidir."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "UNESCO Miras Listesi",
        "difficulty": 2,
        "prompt_text": "Anadolu'nun fethinde Alparslan'ın fethettiği ilk şehirlerden olan, '1001 Kiliseli Şehir' olarak anılan ve 2016'da UNESCO Dünya Mirası ilan edilen Ani Arkeolojik Alanı hangi ilimizdedir?",
        "options": [
            "Kars",
            "Ardahan",
            "Erzurum",
            "Ağrı",
            "Iğdır"
        ],
        "correctIndex": 0,
        "explanation": "Türkiye-Ermenistan sınırında Arpaçay boyunda yer alan tarihi ANİ HARABELERİ ve Arkeolojik Alanı KARS ilindedir.",
        "distractor_trap": "Ani KARS'tadır. İshak Paşa ise Ağrı'dadır. Bu iki doğu eseri sıklıkla birbirine karıştırılır."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "UNESCO Miras Listesi",
        "difficulty": 2,
        "prompt_text": "Dicle Nehri kıyısında 8 bin yıldır kesintisiz tarım yapılan ve 2015 yılında UNESCO Dünya Mirası olarak tescillenen Diyarbakır Kalesi ile birlikte korunan tarımsal peyzaj alanı hangisidir?",
        "options": [
            "Hevsel Bahçeleri",
            "Botan Vadisi",
            "Zerzevan Kalesi",
            "Hasankeyf",
            "Malabadi Köprüsü"
        ],
        "correctIndex": 0,
        "explanation": "'Diyarbakır Kalesi ve Hevsel Bahçeleri Kültürel Peyzajı' adıyla 2015 yılında UNESCO Dünya Miras Listesi'ne girmiştir.",
        "distractor_trap": "Hevsel Bahçeleri Dicle kenarındaki 8000 yıllık ekolojik tarım vahasıdır ve surlarla birlikte korunur."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "UNESCO Miras Listesi",
        "difficulty": 2,
        "prompt_text": "Aşk ve güzellik tanrıçası Afrodit'e adanmış, Roma döneminin en ünlü heykelcilik okulu ve stadyumunu barındıran ve 2017'de UNESCO Miras Listesi'ne giren Afrodisias Antik Kenti nerededir?",
        "options": [
            "Aydın (Karacasu)",
            "Muğla",
            "Denizli",
            "İzmir",
            "Antalya"
        ],
        "correctIndex": 0,
        "explanation": "Ara Güler'in köyde yolunu kaybedip tesadüfen fotoğraflamasıyla dünyaya duyurulan ve Prof. Kenan Erim'in kazdığı AFRODİSİAS, AYDIN'ın Karacasu ilçesindedir.",
        "distractor_trap": "Afrodisias AYDIN'dadır; Priene ve Milet de Aydın'dadır. Efes ise İZMİR'dedir."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "UNESCO Miras Listesi",
        "difficulty": 2,
        "prompt_text": "Homeros'un İlyada Destanı'nda anlatılan ve Schliemann tarafından kazılan, 9 ayrı yerleşim katmanına sahip olan ve 1998'de UNESCO Miras Listesi'ne giren Troya (Truva) Antik Kenti nerededir?",
        "options": [
            "Çanakkale",
            "Balıkesir",
            "İzmir",
            "Manisa",
            "Bursa"
        ],
        "correctIndex": 0,
        "explanation": "Çanakkale Tevfikiye köyü yakınlarında bulunan TROYA Arkeolojik Alanı, ÇANAKKALE ilindedir.",
        "distractor_trap": "Troya ÇANAKKALE'dedir; Assos da Çanakkale'dedir; Bergama ise İzmir'dedir."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "UNESCO Miras Listesi",
        "difficulty": 2,
        "prompt_text": "Geleneksel ahşap konak mimarisini günümüze kadar bozulmadan koruyan, 'Korumanın Başkenti' unvanıyla 1994 yılında UNESCO Dünya Miras Listesi'ne alınan ilçe hangisidir?",
        "options": [
            "Safranbolu (Karabük)",
            "Beypazarı (Ankara)",
            "Göynük (Bolu)",
            "Taraklı (Sakarya)",
            "Mudurnu (Bolu)"
        ],
        "correctIndex": 0,
        "explanation": "Geleneksel Osmanlı sivil mimarisinin en güzel korunmuş örneği olan SAFRANBOLU, KARABÜK ilindedir ve 1994'te listeye girmiştir.",
        "distractor_trap": "Beypazarı ve Mudurnu aday listededir; ASIL listede yer alan yerleşim SAFRANBOLU'dur."
    },

    # -------------------------------------------------------------
    # TEST 3: STANDART ÖSYM DÜZEYİ (Zorluk: 2) - Sorular 21-30
    # -------------------------------------------------------------
    {
        "lesson": "Güncel Bilgiler",
        "topic": "UNESCO Miras Listesi",
        "difficulty": 2,
        "prompt_text": "İnsanlık tarihinin ilk toplu yerleşik hayata geçiş ve tarım toplumunun kanıtı olan, birbirine bitişik çatılardan girilen evleriyle bilinen Neolitik yerleşim Çatalhöyük hangi ilimizdedir?",
        "options": [
            "Konya (Çumra)",
            "Aksaray",
            "Karaman",
            "Niğde",
            "Kayseri"
        ],
        "correctIndex": 0,
        "explanation": "James Mellaart ve Ian Hodder tarafından kazılan ÇATALHÖYÜK, KONYA'nın Çumra ilçesinde yer alır ve 2012'de UNESCO Dünya Miras Listesi'ne girmiştir.",
        "distractor_trap": "Çatalhöyük KONYA'dadır; Aşıklı Höyük ise Aksaray'dadır."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "UNESCO Miras Listesi",
        "difficulty": 2,
        "prompt_text": "Helenistik dönemin en dik tiyatrosuna, Asklepion sağlık merkezine ve parşömen kağıdının icat edildiği kütüphaneye sahip olan ve 2014'te UNESCO Miras Listesi'ne giren antik kent hangisidir?",
        "options": [
            "Bergama (Pergamon - İzmir)",
            "Efes (İzmir)",
            "Milet (Aydın)",
            "Sardes (Manisa)",
            "Teos (İzmir)"
        ],
        "correctIndex": 0,
        "explanation": "Parşömen kağıdının ana vatanı olan ve dik tiyatrosuyla ünlü olan BERGAMA (Pergamon), İZMİR'dedir.",
        "distractor_trap": "Parşömenin icat edildiği yer Bergama'dır; Efes ile karıştırılmamalıdır."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "UNESCO Miras Listesi",
        "difficulty": 2,
        "prompt_text": "Celsus Kütüphanesi, Artemis Tapınağı, Meryem Ana Evi ve Yamaç Evleri ile 2015 yılında UNESCO Dünya Miras Listesi'ne giren büyük İyon liman kenti hangisidir?",
        "options": [
            "Efes (İzmir - Selçuk)",
            "Bergama",
            "Milet",
            "Knidos",
            "Klazomenai"
        ],
        "correctIndex": 0,
        "explanation": "İzmir'in Selçuk ilçesinde yer alan EFES Antik Kenti, Celsus Kütüphanesi ve Artemis Tapınağı kalıntılarıyla 2015'te listeye girmiştir.",
        "distractor_trap": "Efes İZMİR Selçuk'tadır; Artemis Tapınağı Dünyanın Yedi Harikası'ndan biridir."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "UNESCO Miras Listesi",
        "difficulty": 2,
        "prompt_text": "Likya Birliği'nin idari başkenti olan Xanthos ile dini merkezi olan Letoon tapınak alanı hangi iki ilimizin sınır bölgesinde yer alır?",
        "options": [
            "Antalya — Muğla",
            "İzmir — Aydın",
            "Muğla — Denizli",
            "Burdur — Isparta",
            "Mersin — Antalya"
        ],
        "correctIndex": 0,
        "explanation": "Xanthos (Kaş/Antalya) ve Letoon (Seydikemer/Muğla), Likya uygarlığının en önemli merkezleri olarak 1988'de UNESCO Miras Listesi'ne ortak tescil edilmiştir.",
        "distractor_trap": "Xanthos Antalya tarafında, Letoon Muğla tarafındadır; ortak tescillidir."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "UNESCO Miras Listesi",
        "difficulty": 2,
        "prompt_text": "UNESCO Dünya Belleği Kütüğü'nde (Memory of the World) Türkiye'den tescil edilen belgeler arasında aşağıdakilerden hangisi YER ALMAZ?",
        "options": [
            "Orhun Kitabeleri (Moğolistan tescili)",
            "Boğazköy Hitit Çivi Yazılı Tabletleri (2001)",
            "Kandilli Rasathanesi El Yazmaları (2001)",
            "Evliya Çelebi Seyahatnamesi (2013)",
            "Divanu Lugati't-Türk El Yazması (2017)"
        ],
        "correctIndex": 0,
        "explanation": "Orhun Abideleri Moğolistan'da yer alır. Türkiye'nin Dünya Belleği Kütüğü'nde Boğazköy Hitit tabletleri, Kandilli astronomi yazmaları, Evliya Çelebi Seyahatnamesi, Divanu Lugati't-Türk ve Karatepe Aslantaş yazıtları kayıtlıdır.",
        "distractor_trap": "Orhun Yazıtları Türkiye sınırlarında değildir; Dünya Belleği Kütüğümüzde Boğazköy, Kandilli, Evliya Çelebi ve Divanu Lugati't-Türk vardır."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "UNESCO Miras Listesi",
        "difficulty": 2,
        "prompt_text": "Mengücekliler döneminde Ahmet Şah ve eşi Turan Melek tarafından yaptırılan, 'Taşın Nakış Gibi İşlendiği Eser' olarak bilinen ve 1985'te Türkiye'den listeye giren ilk cami hangisidir?",
        "options": [
            "Divriği Ulu Camii ve Darüşşifası (Sivas)",
            "Eşrefoğlu Camii (Konya)",
            "Selimiye Camii (Edirne)",
            "Bursa Ulu Cami",
            "Diyarbakır Ulu Cami"
        ],
        "correctIndex": 0,
        "explanation": "Kapılarındaki gölge ve motif oyunlarıyla 'Anadolu'nun El Hamrası' sayılan DİVRİĞİ ULU CAMİİ VE DARÜŞŞİFASI, Sivas'tadır ve UNESCO listesindeki ilk mimari şaheserimizdir.",
        "distractor_trap": "Mengücek eseri Divriği Ulu Camii 1985'te İLK giren camidir; Selimiye ise 2011'de girmiştir."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "UNESCO Miras Listesi",
        "difficulty": 2,
        "prompt_text": "Osmanlı Devleti'nin ilk başkenti olan ve erken dönem Osmanlı mimarisinin doğuşunu simgeleyen Hanlar Bölgesi, Sultan Külliyeleri ve Cumalıkızık köyü hangi ilimizdedir?",
        "options": [
            "Bursa",
            "Bilecik",
            "Edirne",
            "İznik",
            "Kütahya"
        ],
        "correctIndex": 0,
        "explanation": "'Bursa ve Cumalıkızık: Osmanlı İmparatorluğunun Doğuşu' adıyla 2014 yılında UNESCO Dünya Miras Listesi'ne kaydedilmiştir.",
        "distractor_trap": "Cumalıkızık 700 yıllık yaşayan Osmanlı vakıf köyüdür ve BURSA'dadır."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "UNESCO Miras Listesi",
        "difficulty": 2,
        "prompt_text": "UNESCO Somut Olmayan Kültürel Miras Temsili Listesi'ne 2021 yılında tescil edilen ve geleneksel Türk yazı sanatının zirvesi kabul edilen sanat dalı hangisidir?",
        "options": [
            "Hüsn-i Hat (Geleneksel Türk İslam Yazı Sanatı)",
            "Ebru (Geleneksel Türk Süsleme Sanatı)",
            "Minyatür Sanatı",
            "Çini Sanatı",
            "Tezhip Sanatı"
        ],
        "correctIndex": 0,
        "explanation": "Kamış kalem ve is mürekkebiyle icra edilen HÜSN-İ HAT sanatı, 2021 yılında Türkiye'nin müstakil dosyası olarak UNESCO Somut Olmayan Miras Listesi'ne girmiştir.",
        "distractor_trap": "Ebru 2014, Minyatür 2020, Hüsn-i Hat 2021, Tezhip ise 2023 yılında tescil edilmiştir."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "UNESCO Miras Listesi",
        "difficulty": 2,
        "prompt_text": "UNESCO Somut Olmayan Kültürel Miras Listesi'nde yer alan, Manisa'da 470 yılı aşkın süredir Sultan Camii kubbe ve minarelerinden halka saçılan geleneksel festival hangisidir?",
        "options": [
            "Mesir Macunu Festivali",
            "Kırkpınar Yağlı Güreşleri",
            "Kakava Hıdırellez Şenlikleri",
            "Ahilik Haftası Kutlamaları",
            "Ceviz Festivali"
        ],
        "correctIndex": 0,
        "explanation": "Kanuni'nin annesi Hafsa Sultan'ın şifa bulması üzerine Merkez Efendi tarafından 41 çeşit baharatla hazırlanan MESİR MACUNU FESTİVALİ UNESCO listesindedir.",
        "distractor_trap": "Mesir Macunu Festivali MANİSA'dadır ve UNESCO tescillidir."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "UNESCO Miras Listesi",
        "difficulty": 2,
        "prompt_text": "UNESCO tarafından 2021 yılında vefatının 700. yılı nedeniyle tüm dünyada anma programına dahil edilen 'Yaratılanı severiz, Yaratan'dan ötürü' felsefesinin sahibi halk şairi kimdir?",
        "options": [
            "Yunus Emre",
            "Hacı Bektaş Veli",
            "Ahi Evran",
            "Aşık Veysel",
            "Mevlana Celaleddin Rumi"
        ],
        "correctIndex": 0,
        "explanation": "2021 yılı UNESCO tarafından ve Cumhurbaşkanlığı genelgesiyle 'Yunus Emre ve Türkçe Yılı' (700. vefat yılı) olarak kutlanmıştır. (Ayrıca Hacı Bektaş ve Ahi Evran da 2021 anma yılındaydı).",
        "distractor_trap": "2021 = Yunus Emre, Hacı Bektaş, Ahi Evran; 2023 = Aşık Veysel; 2024 = Ali Kuşçu ve Divanu Lugati't-Türk yılıdır."
    },

    # -------------------------------------------------------------
    # TEST 4: NET SIÇRATAN / KURTLAR SOFRASI (Zorluk: 3) - Sorular 31-40
    # -------------------------------------------------------------
    {
        "lesson": "Güncel Bilgiler",
        "topic": "UNESCO Miras Listesi",
        "difficulty": 3,
        "prompt_text": "UNESCO tarafından 2024 yılı Anma ve Kutlama Yıl Dönümleri Programı'na Türkiye'nin teklifiyle dahil edilen iki tarihi değerimiz hangi seçenekte doğru verilmiştir?",
        "options": [
            "Ali Kuşçu'nun Vefatının 550. Yılı — Divanu Lugati't-Türk'ün Yazılışının 950. Yılı",
            "Aşık Veysel'in Vefatının 50. Yılı — Mevlana'nın 750. Vuslat Yılı",
            "Fuat Sezgin Yılı — Göbeklitepe Yılı",
            "Yunus Emre Yılı — Hacı Bektaş Veli Yılı",
            "Evliya Çelebi Yılı — Piri Reis Haritası Yılı"
        ],
        "correctIndex": 0,
        "explanation": "UNESCO 42. Genel Konferansı'nda 2024 yılı için: 1) Ali Kuşçu'nun vefatının 550. yıl dönümü, 2) Kaşgarlı Mahmud'un Divanu Lugati't-Türk eserinin yazılışının 950. yıl dönümü anma programına alınmıştır.",
        "distractor_trap": "2023 Mevlana ve Aşık Veysel idi; 2024 UNESCO anma yılı ALİ KUŞÇU ve DİVANU LUGATİ'T-TÜRK'tür."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "UNESCO Miras Listesi",
        "difficulty": 3,
        "prompt_text": "UNESCO Yaratıcı Şehirler Ağı'nda Türkiye'nin toplam kaç yaratıcı şehri yer almaktadır?",
        "options": [
            "7",
            "8",
            "9",
            "10",
            "12"
        ],
        "correctIndex": 0,
        "explanation": "Türkiye'nin UNESCO Yaratıcı Şehirler Ağı'nda tescilli 7 şehri vardır: Gaziantep (Gastronomi), Hatay (Gastronomi), Afyonkarahisar (Gastronomi), Kütahya (Zanaat), Bursa (Zanaat), İstanbul (Tasarım), Kırşehir (Müzik). (Şanlıurfa ve Maraş ile ilgili genişleme süreçleri devam etmektedir).",
        "distractor_trap": "Gastronomi (3), Zanaat (2), Tasarım (1), Müzik (1) olmak üzere ana listede 7 tescilli şehir öne çıkar."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "UNESCO Miras Listesi",
        "difficulty": 3,
        "prompt_text": "Türkiye'nin UNESCO Geçici Miras Listesi'nde yer alan, Roma İmparatorluğu'nun doğu sınırındaki en iyi korunmuş askeri garnizonu ve Mithras Tapınağı'na ev sahipliği yapan kale hangisidir?",
        "options": [
            "Zerzevan Kalesi (Diyarbakır - Çınar)",
            "Hoşap Kalesi (Van)",
            "Mamure Kalesi (Mersin)",
            "Zilkale (Rize)",
            "Harput Kalesi (Elazığ)"
        ],
        "correctIndex": 0,
        "explanation": "Diyarbakır Çınar ilçesindeki ZERZEVAN KALESİ, yer altındaki gizemli Mithras Tapınağı ile dünya arkeolojisinin gözdesi olup UNESCO kalıcı listesine en güçlü adaylardandır.",
        "distractor_trap": "Mithras Tapınağı'nın bulunduğu askeri garnizon kalesi ZERZEVAN KALESİ'dir."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "UNESCO Miras Listesi",
        "difficulty": 3,
        "prompt_text": "UNESCO Dünya Miras Listesi'nde yer alan 'Gordion' antik kentinde Gordios'un oğlu efsanevi kral Midas'ın mezarı olarak bilinen yapı mimari açıdan ne tür bir mezardır?",
        "options": [
            "Tümülüs (Yığma tepe mezar)",
            "Kaya mezarı",
            "Lahit",
            "Kurgan",
            "Kubbe kümbet"
        ],
        "correctIndex": 0,
        "explanation": "Gordion'daki Midas Mezarı, dünyanın en büyük ikinci ahşap mezar odasına sahip devasa bir TÜMÜLÜS'tür (yığma toprak tepe mezar).",
        "distractor_trap": "Frig mezarları anıtsal ahşap odalı TÜMÜLÜSLERDİR. Likya'daki gibi kaya mezarı değildir."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "UNESCO Miras Listesi",
        "difficulty": 3,
        "prompt_text": "Anadolu'nun Ortaçağ Dönemi Ahşap Hipostil Camileri seri tescili kapsamında Ankara'nın Samanpazarı semtinde yer alan, devşirme sütunları ve ahşap direkleriyle ünlü Selçuklu camisi hangisidir?",
        "options": [
            "Ahi Şerafettin Camii (Arslanhane Camii)",
            "Hacı Bayram-ı Veli Camii",
            "Kocatepe Camii",
            "Melike Hatun Camii",
            "Cenabi Ahmet Paşa Camii"
        ],
        "correctIndex": 0,
        "explanation": "Ahşap hipostil seri mirasında yer alan Ankara camisi, ceviz ağacından minberi ve ahşap sütunlarıyla ünlü AHİ ŞERAFETTİN (ARSLANHANE) CAMİİ'dir.",
        "distractor_trap": "Hacı Bayram Veli değildir; UNESCO Ahşap Cami listesindeki Ankara camisi ARSLANHANE (Ahi Şerafettin) Camii'dir."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "UNESCO Miras Listesi",
        "difficulty": 3,
        "prompt_text": "Beyşehir Gölü kıyısında yer alan, ahşap direkleri, çinili mihrabı ve ortasındaki karlık (ahşapların nemini dengeleyen kar kuyusu) havuzu ile UNESCO listesindeki Ahşap Hipostil camilerinin en büyüğü ve görkemlisi hangisidir?",
        "options": [
            "Eşrefoğlu Camii (Konya - Beyşehir)",
            "Afyonkarahisar Ulu Camii",
            "Mahmut Bey Camii",
            "Sivrihisar Ulu Camii",
            "Divriği Ulu Camii"
        ],
        "correctIndex": 0,
        "explanation": "Eşrefoğulları Beyliği döneminden kalan EŞREFOĞLU CAMİİ (1296), tavanındaki karlık kuyusu ve çinili ahşap direkleriyle bu serinin şaheseridir.",
        "distractor_trap": "Beyşehir kıyısındaki karlık havuzlu ahşap cami EŞREFOĞLU CAMİİ'dir."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "UNESCO Miras Listesi",
        "difficulty": 3,
        "prompt_text": "Kastamonu'nun Kasaba köyünde bulunan, tek bir metal çivi dahi kullanılmadan 'KÜNDEKARİ' (geçme tekniği) ile inşa edilen ahşap hipostil cami hangisidir?",
        "options": [
            "Mahmut Bey Camii",
            "İsmail Bey Camii",
            "Nasrullah Camii",
            "Atabeygazi Camii",
            "Yakup Ağa Camii"
        ],
        "correctIndex": 0,
        "explanation": "Çivisiz cami olarak ünlenen ve ahşap oyma kapısı şaheser kabul edilen cami Kastamonu'daki MAHMUT BEY CAMİİ'dir (Candarogulları dönemi).",
        "distractor_trap": "Çivisiz ahşap geçme tekniğiyle ünlü UNESCO camisi KASTAMONU MAHMUT BEY CAMİİ'dir."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "UNESCO Miras Listesi",
        "difficulty": 3,
        "prompt_text": "UNESCO Dünya Biyosfer Rezervi Ağı'na Türkiye'den kabul edilen İLK VE TEK BİYOSFER REZERV ALANI neresidir?",
        "options": [
            "Artvin Camili (Macahel) Havzası",
            "Rize Kaçkar Dağları",
            "Muğla Köyceğiz-Dalyan",
            "Antalya Köprülü Kanyon",
            "Bolu Yedigöller"
        ],
        "correctIndex": 0,
        "explanation": "Kafkas arı ırkının bozulmadan yaşadığı ve zengin bitki çeşitliliğine sahip ARTVİN BORÇKA CAMİLİ (MACAHEL) BÖLGESİ, Türkiye'nin ilk biyosfer rezerv alanıdır.",
        "distractor_trap": "Kaçkar veya Yedigöller değil; Türkiye'nin ilk UNESCO Biyosfer Rezervi ARTVİN CAMİLİ (MACAHEL)'dir."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "UNESCO Miras Listesi",
        "difficulty": 3,
        "prompt_text": "UNESCO tarafından Jeopark Ağı'na (Global Geoparks Network) Türkiye'den dahil edilen İLK VE TEK AVRUPA VE UNESCO JEOPARKI hangisidir?",
        "options": [
            "Kula-Salihli Jeoparkı (Manisa)",
            "Kızılcahamam Jeoparkı (Ankara)",
            "Nemrut Jeoparkı (Bitlis)",
            "Kapadokya Jeoparkı",
            "Pamukkale Traverten Jeoparkı"
        ],
        "correctIndex": 0,
        "explanation": "Volkanik konileri ve lav akıntılarıyla Strabon'un 'Katakekaumene' (Yanık Ülke) dediği MANİSA KULA-SALİHLİ JEOPARKI, Türkiye'nin ilk ve tek UNESCO Jeoparkıdır.",
        "distractor_trap": "Türkiye'nin resmi tescilli UNESCO Jeoparkı KULA-SALİHLİ'dir (Manisa)."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "UNESCO Miras Listesi",
        "difficulty": 3,
        "prompt_text": "UNESCO Genel Merkezi hangi dünya başkentinde yer almaktadır?",
        "options": [
            "Paris (Fransa)",
            "Cenevre (İsviçre)",
            "New York (ABD)",
            "Roma (İtalya)",
            "Viyana (Avusturya)"
        ],
        "correctIndex": 0,
        "explanation": "Birleşmiş Milletler Eğitim, Bilim ve Kültür Örgütü'nün (UNESCO) ana karargahı ve genel merkezi Fransa'nın başkenti PARİS'tedir.",
        "distractor_trap": "UNESCO Paris'tedir; BM Ana Merkezi New York'ta; FAO Roma'da; DSÖ Cenevre'dedir."
    }
]
