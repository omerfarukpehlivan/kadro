# -*- coding: utf-8 -*-
"""
KPSS Güncel Bilgiler — Konu 4: Spor ve Olimpiyatlar (40 Özgün Soru)
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
        "topic": "Spor ve Olimpiyatlar",
        "difficulty": 1,
        "prompt_text": "2024 Paris Yaz Olimpiyat Oyunları'nda 10 metre havalı tabanca karma takım kategorisinde Şevval İlayda Tarhan ile birlikte GÜMÜŞ MADALYA kazanarak Türkiye'ye atıcılık tarihindeki ilk olimpiyat madalyasını getiren ve ekipmansız doğal atış tarzıyla dünyada viral olan milli atıcımız kimdir?",
        "options": [
            "Yusuf Dikeç",
            "İsmail Keleş",
            "Mete Gazoz",
            "Ömer Faruk Planat",
            "Taha Akgül"
        ],
        "correctIndex": 0,
        "explanation": "2024 Paris Olimpiyatları'nda özel lens veya kulaklık kullanmadan, eli cebinde rahat atış tarzıyla tüm dünyanın hayranlığını kazanan ve gümüş madalya alan atıcımız YUSUF DİKEÇ'tir.",
        "distractor_trap": "Yusuf Dikeç bu madalyayı Şevval İlayda Tarhan ile birlikte 'karma takım' kategorisinde kazanmıştır."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "Spor ve Olimpiyatlar",
        "difficulty": 1,
        "prompt_text": "Almanya'da düzenlenen 2024 Avrupa Futbol Şampiyonası'nda (EURO 2024) finalde İngiltere'yi mağlup ederek şampiyonluğa ulaşan ve kupayı 4. kez müzesine götüren ülke hangisidir?",
        "options": [
            "İspanya",
            "Almanya",
            "Fransa",
            "İtalya",
            "Portekiz"
        ],
        "correctIndex": 0,
        "explanation": "EURO 2024 finalinde İngiltere'yi 2-1 yenen İSPANYA, turnuvayı namağlup tamamlayarak 4. Avrupa şampiyonluğunu kazanmış ve turnuva tarihinin en çok kazanan takımı olmuştur.",
        "distractor_trap": "İngiltere üst üste ikinci kez finalde kaybetmiştir; şampiyon İSPANYA'dır."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "Spor ve Olimpiyatlar",
        "difficulty": 1,
        "prompt_text": "UEFA tarafından resmi olarak açıklanan karara göre, 2032 Avrupa Futbol Şampiyonası (EURO 2032) hangi iki ülkenin ortak ev sahipliğinde düzenlenecektir?",
        "options": [
            "Türkiye ve İtalya",
            "İspanya ve Portekiz",
            "İngiltere ve İrlanda",
            "Almanya ve Avusturya",
            "Fransa ve Belçika"
        ],
        "correctIndex": 0,
        "explanation": "UEFA İcra Komitesi, EURO 2032'nin TÜRKİYE ve İTALYA ortaklığıyla düzenleneceğini resmen duyurmuştur. (EURO 2028 ise Birleşik Krallık ve İrlanda'da yapılacaktır).",
        "distractor_trap": "2028 = İngiltere & İrlanda; 2032 = TÜRKİYE ve İTALYA'dır."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "Spor ve Olimpiyatlar",
        "difficulty": 1,
        "prompt_text": "2023 yılında FIVB Milletler Ligi (VNL) ve CEV Avrupa Voleybol Şampiyonası'nda altın madalya kazanarak dünya 1 numarası olan 'Filenin Sultanları' Türkiye Kadın Voleybol Milli Takımı'nın başantrenörü kimdir?",
        "options": [
            "Daniele Santarelli",
            "Giovanni Guidetti",
            "Ferhat Akbaş",
            "Massimo Barbolini",
            "Vital Heynen"
        ],
        "correctIndex": 0,
        "explanation": "2023 yılında göreve gelerek Türk kadın voleybol tarihine altın çağını yaşatan İtalyan başantrenör DANIELE SANTARELLI'dir.",
        "distractor_trap": "Guidetti VakıfBank ve eski milli takım hocasıydı; 2023 şampiyonluklarını getiren antrenör SANTARELLI'dir."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "Spor ve Olimpiyatlar",
        "difficulty": 1,
        "prompt_text": "2020 Tokyo Olimpiyatları'nda bireysel klasik yayda altın madalya alarak Türk okçuluk tarihinin ilk olimpiyat şampiyonu olan ve 2024 Paris'te erkek takımında bronz madalya kazanan okçumuz kimdir?",
        "options": [
            "Mete Gazoz",
            "Ulaş Berkim Tümer",
            "Abdullah Yıldırmış",
            "Göksel Taşçı",
            "Demir Elmaağaçlı"
        ],
        "correctIndex": 0,
        "explanation": "Tokyo 2020 Olimpiyat Şampiyonu ve 2023 Berlin Dünya Şampiyonu olan milli okçumuz METE GAZOZ'dur.",
        "distractor_trap": "Ulaş Berkim Tümer ve Abdullah Yıldırmış Paris 2024'te Mete Gazoz ile birlikte takım bronz madalyası alan milli okçulardır; ilk altın Mete Gazoz'undur."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "Spor ve Olimpiyatlar",
        "difficulty": 1,
        "prompt_text": "Güreş kariyerinde 1 kez Olimpiyat Şampiyonluğu, 3 kez Dünya Şampiyonluğu ve 11 kez Avrupa Şampiyonluğu elde eden ve 2024 Paris Olimpiyatları'nda bronz madalya kazanarak aktif sporculuk hayatını noktalayan serbest stil efsane güreşçimiz kimdir?",
        "options": [
            "Taha Akgül",
            "Rıza Kayaalp",
            "Hamza Yerlikaya",
            "Yaşar Doğu",
            "Ali Cengiz"
        ],
        "correctIndex": 0,
        "explanation": "125 kg serbest stilde dünyanın en başarılı güreşçilerinden biri olan TAHA AKGÜL, 2024 Paris Olimpiyatları'nda kürsüye çıkarak mindere veda etmiştir.",
        "distractor_trap": "Rıza Kayaalp grekoromen stildedir; serbest stilde 11 Avrupa şampiyonu olan ve 2024'te jübile yapan isim TAHA AKGÜL'dür."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "Spor ve Olimpiyatlar",
        "difficulty": 1,
        "prompt_text": "Grekoromen güreşte 12. kez Avrupa Şampiyonu olarak efsanevi Rus güreşçi Aleksandr Karelin'in rekorunu egale eden Türk güreşçi kimdir?",
        "options": [
            "Rıza Kayaalp",
            "Taha Akgül",
            "Burhan Akbudak",
            "Cebi Selçuk",
            "Kerem Kamal"
        ],
        "correctIndex": 0,
        "explanation": "Grekoromen 130 kiloda 12 Avrupa ve 5 Dünya şampiyonluğu bulunan milli güreşçimiz RIZA KAYAALP'tir.",
        "distractor_trap": "Karelin'in rekorunu kıran/egale eden grekoromen ağır sıklet Rıza Kayaalp'tir."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "Spor ve Olimpiyatlar",
        "difficulty": 1,
        "prompt_text": "2024 Paris Paralimpik Oyunları'nda yüzmede hem 50 metre serbest hem de 200 metre serbestte 2 ALTIN MADALYA birden kazanarak aynı olimpiyatta iki altın kazanan ilk Türk sporcu unvanını alan paralimpik yüzücümüz kimdir?",
        "options": [
            "Umut Ünlü",
            "Koral Berkin Kutlu",
            "Sevilay Öztürk",
            "Sümeyye Boyacı",
            "Turgut Aslanyar"
        ],
        "correctIndex": 0,
        "explanation": "Paris 2024'te S3 kategorisinde iki altın madalya birden alarak tarihe geçen yüzücümüz UMUT ÜNLÜ'dür.",
        "distractor_trap": "Sümeyye Boyacı ve Sevilay Öztürk de başarılı yüzücülerimizdir; Paris 2024'te 2 altın birden kazanan isim UMUT ÜNLÜ'dür."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "Spor ve Olimpiyatlar",
        "difficulty": 1,
        "prompt_text": "Paralimpik Oyunları tarihinde Rio 2016, Tokyo 2020 ve Paris 2024'te üst üste ÜÇ KEZ PARALİMPİK ŞAMPİYONU olarak kırılması güç bir rekora imza atan milli takımımız hangisidir?",
        "options": [
            "Kadın Golbol (Goalball) Milli Takımı",
            "Tekerlekli Sandalye Basketbol Takımı",
            "Ampute Futbol Milli Takımı",
            "Kadın Voleybol Takımı",
            "Para Masa Tenisi Takımı"
        ],
        "correctIndex": 0,
        "explanation": "Sevda Altunoluk liderliğindeki KADIN GOLBOL MİLLİ TAKIMIMIZ, üst üste 3 olimpiyatta (2016, 2020, 2024) altın madalya kazanarak dünya tarihine geçmiştir.",
        "distractor_trap": "Ampute futbol paralimpik branş değildir (Dünya ve Avrupa şampiyonumuzdur); Paralimpikte 3 kez üst üste şampiyon olan KADIN GOLBOL TAKIMIDIR."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "Spor ve Olimpiyatlar",
        "difficulty": 1,
        "prompt_text": "Halter sporunda kendi vücut ağırlığının üç katından fazlasını kaldırabilen dünyadaki tek sporculardan olan, 1988 Seul, 1992 Barselona ve 1996 Atlanta'da üst üste 3 kez Olimpiyat Şampiyonu olan 'Cep Herkülü' lakaplı efsane kimdir?",
        "options": [
            "Naim Süleymanoğlu",
            "Halil Mutlu",
            "Taner Sağır",
            "Sedat Artuç",
            "Daniyar İsmayilov"
        ],
        "correctIndex": 0,
        "explanation": "Kırdığı 46 dünya rekoru ve Time dergisine kapak olan başarılarıyla 'Cep Herkülü' NAİM SÜLEYMANOĞLU'dur.",
        "distractor_trap": "Halil Mutlu da 3 kez olimpiyat şampiyonudur ('Dinamit'); 'Cep Herkülü' ise NAİM SÜLEYMANOĞLU'dur."
    },

    # -------------------------------------------------------------
    # TEST 2: STANDART ÖSYM DÜZEYİ (Zorluk: 2) - Sorular 11-20
    # -------------------------------------------------------------
    {
        "lesson": "Güncel Bilgiler",
        "topic": "Spor ve Olimpiyatlar",
        "difficulty": 2,
        "prompt_text": "2024 Paris Yaz Olimpiyat Oyunları'nda Türkiye'ye kadınlar boksta gümüş madalya kazandıran iki milli boksörümüz hangi seçenekte doğru verilmiştir?",
        "options": [
            "Buse Naz Çakıroğlu ve Hatice Akbaş",
            "Busenaz Sürmeneli ve Esra Yıldız",
            "Hatice Akbaş ve Şennur Demir",
            "Buse Naz Çakıroğlu ve Gizem Özer",
            "Elif Güneri ve Sema Çalışkan"
        ],
        "correctIndex": 0,
        "explanation": "Paris 2024'te kadınlar boksta 50 kg'da BUSE NAZ ÇAKIROĞLU ve 54 kg'da HATİCE AKBAŞ gümüş madalya kazanarak kürsüye çıkmışlardır.",
        "distractor_trap": "Busenaz Sürmeneli Tokyo 2020 şampiyonudur; Paris 2024'te gümüş madalya alan ikili Buse Naz Çakıroğlu ve Hatice Akbaş'tır."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "Spor ve Olimpiyatlar",
        "difficulty": 2,
        "prompt_text": "2026 FIFA Dünya Kupası, tarihte ilk kez 48 takımın katılımıyla hangi üç ülkenin ortak ev sahipliğinde düzenlenecektir?",
        "options": [
            "ABD — Kanada — Meksika",
            "İspanya — Portekiz — Fas",
            "Brezilya — Arjantin — Uruguay",
            "Almanya — İtalya — Fransa",
            "Suudi Arabistan — Katar — BAE"
        ],
        "correctIndex": 0,
        "explanation": "2026 Dünya Kupası Kuzey Amerika kıtasında ABD, KANADA ve MEKSİKA ortaklığında gerçekleştirilecektir. (Meksika 3. kez ev sahipliği yapan ilk ülke olacaktır).",
        "distractor_trap": "2030 Dünya Kupası İspanya-Portekiz-Fas; 2034 Suudi Arabistan; 2026 ise ABD-Kanada-Meksika'dır."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "Spor ve Olimpiyatlar",
        "difficulty": 2,
        "prompt_text": "2028 Yaz Olimpiyat Oyunları hangi şehir ve ülkede düzenlenecektir?",
        "options": [
            "Los Angeles (ABD)",
            "Brisbane (Avustralya)",
            "Madrid (İspanya)",
            "Roma (İtalya)",
            "Tokyo (Japonya)"
        ],
        "correctIndex": 0,
        "explanation": "2024 Paris'in ardından 2028 Yaz Olimpiyatları ABD'nin LOS ANGELES şehrinde düzenlenecektir. 2032 ise Avustralya'nın Brisbane kentindedir.",
        "distractor_trap": "2028 = Los Angeles; 2032 = Brisbane. Bu iki olimpiyat kenti sıklıkla seçeneklerde yer değiştirir."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "Spor ve Olimpiyatlar",
        "difficulty": 2,
        "prompt_text": "Modern Olimpiyat Oyunları'nda Türkiye adına güreş dışındaki bir branşta İLK ALTIN MADALYAYI kazandıran kadın sporcumuz kimdir?",
        "options": [
            "Nurcan Taylan (Halter)",
            "Nur Tatar (Tekvando)",
            "Busenaz Sürmeneli (Boks)",
            "Yasemin Adar (Güreş)",
            "Süreyya Ayhan (Atletizm)"
        ],
        "correctIndex": 0,
        "explanation": "2004 Atina Olimpiyatları'nda 48 kiloda altın madalya kazanan halterci NURCAN TAYLAN, olimpiyatlarda altın madalya kazanan İLK TÜRK KADIN SPORCUDUR.",
        "distractor_trap": "İlk kadın olimpiyat şampiyonumuz NURCAN TAYLAN'dır (2004 Atina Halter). Boksör Busenaz Sürmeneli 2020 Tokyo'da şampiyon olmuştur."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "Spor ve Olimpiyatlar",
        "difficulty": 2,
        "prompt_text": "Türk spor tarihinde hem A Milli Futbol Takımı'nda hem de A Milli Basketbol Takımı'nda forma giyen, Fenerbahçe ve Fiorentina efsanesi olan 'Sinyor' lakaplı sporcu kimdir?",
        "options": [
            "Can Bartu",
            "Lefter Küçükandonyadis",
            "Metin Oktay",
            "Hakkı Yeten",
            "Süleyman Seba"
        ],
        "correctIndex": 0,
        "explanation": "Hem futbolda hem basketbolda milli formayı giyen, İtalya'da Fiorentina ile Avrupa Kupa Galipleri Kupası finalinde oynayan tek sporcumuz CAN BARTU'dur.",
        "distractor_trap": "Ordinaryüs Lefter Küçükandonyadis; Taçsız Kral Metin Oktay; 'Sinyor' ve iki branşta milli olan isim ise CAN BARTU'dur."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "Spor ve Olimpiyatlar",
        "difficulty": 2,
        "prompt_text": "Avrupa kupalarında (UEFA Kupası ve UEFA Süper Kupa) şampiyonluk kazanan İLK VE TEK TÜRK FUTBOL TAKIMI hangisidir?",
        "options": [
            "Galatasaray",
            "Fenerbahçe",
            "Beşiktaş",
            "Trabzonspor",
            "Başakşehir"
        ],
        "correctIndex": 0,
        "explanation": "17 Mayıs 2000'de Arsenal'i yenerek UEFA Kupası'nı, ardından Real Madrid'i yenerek UEFA Süper Kupa'yı kazanan takım GALATASARAY'dır.",
        "distractor_trap": "Avrupa'da kupa kaldıran tek Türk takımı Galatasaray'dır."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "Spor ve Olimpiyatlar",
        "difficulty": 2,
        "prompt_text": "Türkiye'de 1905 yılında kurulan İLK TÜRK FUTBOL KULÜBÜ hangisidir?",
        "options": [
            "Galatasaray",
            "Beşiktaş Jimnastik Kulübü",
            "Fenerbahçe",
            "Altay",
            "Karşıyaka"
        ],
        "correctIndex": 0,
        "explanation": "Ali Sami Yen ve arkadaşları tarafından Mekteb-i Sultani'de 1905'te kurulan GALATASARAY ilk Türk futbol kulübüdür. (1903'te kurulan Beşiktaş ilk spor/jimnastik kulübüdür; futbol şubesi daha sonra açılmıştır).",
        "distractor_trap": "İlk jimnastik kulübü Beşiktaş (1903); İlk FUTBOL KULÜBÜ ise Galatasaray'dır (1905)."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "Spor ve Olimpiyatlar",
        "difficulty": 2,
        "prompt_text": "2024 Paris Paralimpik Oyunları'nda Para Okçuluk Makaralı Yay Karma Takım kategorisinde Sadık Savaş ile birlikte altın madalya kazanan dünya rekortmeni kadın okçumuz kimdir?",
        "options": [
            "Öznur Cüre Girdi",
            "Gizem Girişmen",
            "Yağmur Şengül",
            "Merve Nur Eroğlu",
            "Büşra Ün"
        ],
        "correctIndex": 0,
        "explanation": "Paris 2024'te dünya rekoru kırarak altın madalyaya uzanan para okçumuz ÖZNUR CÜRE GİRDİ'dir.",
        "distractor_trap": "Gizem Girişmen 2008 Pekin şampiyonudur; Paris 2024 altın madalyası Öznur Cüre Girdi'ye aittir."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "Spor ve Olimpiyatlar",
        "difficulty": 2,
        "prompt_text": "Tekvando branşında 2012 Londra Olimpiyatları'nda altın madalya kazanarak Türk tekvando tarihinin ilk erkek olimpiyat şampiyonu olan sporcumuz kimdir?",
        "options": [
            "Servet Tazegül",
            "Bahri Tanrıkulu",
            "Hakan Reçber",
            "Rıza Doğangün",
            "Emre Kutalmış Ateşli"
        ],
        "correctIndex": 0,
        "explanation": "2012 Londra'da fırtına gibi eserek altın madalya kazanan ve adına tekvando salonları açılan sporcumuz SERVET TAZEGÜL'dür.",
        "distractor_trap": "Hakan Reçber Tokyo 2020 bronz madalyalıdır; ilk altın madalyalı tekvandocumuz SERVET TAZEGÜL'dür."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "Spor ve Olimpiyatlar",
        "difficulty": 2,
        "prompt_text": "Kadın güreşinde Türkiye'ye TARİHİN İLK DÜNYA ŞAMPİYONLUĞUNU ve ilk olimpiyat madalyasını (Tokyo 2020 bronz) kazandıran, 7 kez Avrupa Şampiyonu olan efsane kadın güreşçimiz kimdir?",
        "options": [
            "Yasemin Adar Yiğit",
            "Buse Tosun Çavuşoğlu",
            "Evin Demirhan",
            "Zeynep Yetgil",
            "Elif Jale Yeşilırmak"
        ],
        "correctIndex": 0,
        "explanation": "Türk kadın güreşinin öncüsü olan ve 2017'de Paris'te ilk dünya şampiyonluğunu kazanan sporcumuz YASEMİN ADAR YİĞİT'tir.",
        "distractor_trap": "Buse Tosun Çavuşoğlu 2023 Dünya Şampiyonu ve 2024 Paris bronz madalyalıdır; kadın güreşinde İLK yolu açan ve ilk dünya şampiyonu olan YASEMİN ADAR'dır."
    },

    # -------------------------------------------------------------
    # TEST 3: STANDART ÖSYM DÜZEYİ (Zorluk: 2) - Sorular 21-30
    # -------------------------------------------------------------
    {
        "lesson": "Güncel Bilgiler",
        "topic": "Spor ve Olimpiyatlar",
        "difficulty": 2,
        "prompt_text": "2024 Paris Olimpiyatları'nda kadınlar güreş 68 kiloda mindere çıkarak bronz madalya kazanan ve 2023 Dünya Şampiyonu olan milli güreşçimiz kimdir?",
        "options": [
            "Buse Tosun Çavuşoğlu",
            "Yasemin Adar Yiğit",
            "Evin Demirhan",
            "Nesrin Baş",
            "Zeynep Yetgil"
        ],
        "correctIndex": 0,
        "explanation": "Kadınlar 68 kg'da Paris 2024'te bronz madalya kazanan güreşçimiz BUSE TOSUN ÇAVUŞOĞLU'dur.",
        "distractor_trap": "76 kg Yasemin Adar; 68 kg Buse Tosun Çavuşoğlu'dur."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "Spor ve Olimpiyatlar",
        "difficulty": 2,
        "prompt_text": "2024 Paris Olimpiyatları'nda erkekler klasik yay takımında bronz madalya alarak Türkiye'ye takım okçuluk tarihindeki ilk olimpiyat madalyasını kazandıran üçlü milli kadro hangi seçenektir?",
        "options": [
            "Mete Gazoz — Ulaş Berkim Tümer — Abdullah Yıldırmış",
            "Mete Gazoz — Samet Ak — Efe Çırış",
            "Mete Gazoz — Bilal Gürkaynak — Ali Aydın",
            "Ulaş Berkim Tümer — Göksel Taşçı — Demir Elmaağaçlı",
            "Mete Gazoz — Muhammed Abdullah — Kerem Özmen"
        ],
        "correctIndex": 0,
        "explanation": "Tarihi bronz madalyayı kazanan Klasik Yay Erkek Takımımız METE GAZOZ, ULAŞ BERKİM TÜMER ve ABDULLAH YILDIRMIŞ'tan oluşmuştur.",
        "distractor_trap": "Mete Gazoz'un yanındaki genç takım arkadaşları Ulaş Berkim Tümer ve Abdullah Yıldırmış'tır."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "Spor ve Olimpiyatlar",
        "difficulty": 2,
        "prompt_text": "Türkiye Ampute Futbol Milli Takımı; 2022 yılında İstanbul'da düzenlenen Dünya Kupası finalinde hangi ülkeyi yenerek DÜNYA ŞAMPİYONU olmuştur?",
        "options": [
            "Angola",
            "İspanya",
            "Polonya",
            "Brezilya",
            "İngiltere"
        ],
        "correctIndex": 0,
        "explanation": "Nef Stadyumu'nda oynanan tarihi finalde Türkiye, Angola'yı 4-1 mağlup ederek Ampute Futbol Dünya Kupası'nı kazanmıştır.",
        "distractor_trap": "2018'de Angola'ya penaltılarla kaybedilmişti; 2022'de rövanş alınarak ANGOLA mağlup edilmiş ve şampiyon olunmuştur."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "Spor ve Olimpiyatlar",
        "difficulty": 2,
        "prompt_text": "2024 Paris Olimpiyatları'nda 10 metre havalı tabanca karma takımında Yusuf Dikeç ile birlikte gümüş madalya alarak kürsüye çıkan kadın milli atıcımız kimdir?",
        "options": [
            "Şevval İlayda Tarhan",
            "Damla Köse",
            "Elif Beyza Malkoç",
            "Rüveyda Gülsüm",
            "Yasemin Ecem Anagöz"
        ],
        "correctIndex": 0,
        "explanation": "Kulaklıklı ve saçındaki Türk bayraklı bandanasıyla kararlı atışlar yapan ve Yusuf Dikeç'in partneri olan genç milli atıcımız ŞEVVAL İLAYDA TARHAN'dır.",
        "distractor_trap": "Yusuf Dikeç tek başına yarışmamıştır; karma takımda ŞEVVAL İLAYDA TARHAN ile birlikte gümüş madalya kazanmıştır."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "Spor ve Olimpiyatlar",
        "difficulty": 2,
        "prompt_text": "Basketbolda 2024-2025 sezonu itibarıyla NBA'de Houston Rockets formasıyla gösterdiği 'Triple-Double' performanslarıyla adından söz ettiren ve All-Star seçilme başarısı gösteren Türk pivot kimdir?",
        "options": [
            "Alperen Şengün",
            "Cedi Osman",
            "Furkan Korkmaz",
            "Ömer Faruk Yurtseven",
            "Ersan İlyasova"
        ],
        "correctIndex": 0,
        "explanation": "Houston Rockets formasıyla olağanüstü pas yeteneği ve pota altı dominasyonuyla NBA'in en parlak genç yıldızları arasına giren ALPEREN ŞENGÜN'dür.",
        "distractor_trap": "Hidayet Türkoğlu ve Mehmet Okur eski nesildir; günümüzün NBA süperstarı ALPEREN ŞENGÜN'dür."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "Spor ve Olimpiyatlar",
        "difficulty": 2,
        "prompt_text": "Dünya serbest dalış rekortmeni olan, tek nefeste paletsiz ve değişken ağırlıklı kategorilerde kırdığı rekorlarla tanınan 'Sualtı Perisi' lakaplı kadın milli sporcumuz kimdir?",
        "options": [
            "Şahika Ercümen",
            "Derya Can",
            "Fatma Uruk",
            "Merve Çoban",
            "İlke Özyüksel"
        ],
        "correctIndex": 0,
        "explanation": "Antarktika'da dalış yapan ilk Türk kadın sporcu olan ve 100 metreyi aşan dalış rekorlarına imza atan sporcumuz ŞAHİKA ERCÜMEN'dir.",
        "distractor_trap": "Derya Can da başarılı bir dalgıçtır; ancak Antarktika dalışı ve 100+ metre rekorlarıyla tanınan isim ŞAHİKA ERCÜMEN'dir."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "Spor ve Olimpiyatlar",
        "difficulty": 2,
        "prompt_text": "2024 Paris Olimpiyat Oyunları'nın açılış töreni olimpiyatlar tarihinde bir ilk olarak bir stadyumda değil, şehrin hangi ünlü nehrinde tekneler üzerinde yapılmıştır?",
        "options": [
            "Sen (Seine) Nehri",
            "Ren Nehri",
            "Tuna Nehri",
            "Thames Nehri",
            "Tiber Nehri"
        ],
        "correctIndex": 0,
        "explanation": "Paris 2024 Olimpiyatları'nın açılış töreni stadyum dışında, SEN NEHRİ üzerinde 85 teknelik geçit töreniyle açık havada yapılmıştır.",
        "distractor_trap": "Paris'in içinden geçen nehir SEN (Seine) nehridir."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "Spor ve Olimpiyatlar",
        "difficulty": 2,
        "prompt_text": "Türkiye Milli Olimpiyat Komitesi'nin (TMOK) kurucusu olan ve Türkiye'nin ilk spor dergisini (İdman) çıkaran, 'Beden Terbiyesi' dersinin okullara girmesini sağlayan spor adamı kimdir?",
        "options": [
            "Selim Sırrı Tarcan",
            "Ali Sami Yen",
            "Şeref Bey",
            "Burhan Felek",
            "Sinan Erdem"
        ],
        "correctIndex": 0,
        "explanation": "Türkiye Milli Olimpiyat Komitesi'nin kurucusu ve Türk sporunun babası SELİM SIRRI TARCAN'dır.",
        "distractor_trap": "Ali Sami Yen GS kurucusudur; Türkiye Milli Olimpiyat Komitesi'nin kurucusu SELİM SIRRI TARCAN'dır."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "Spor ve Olimpiyatlar",
        "difficulty": 2,
        "prompt_text": "Modern Pentatlon branşında Türkiye'yi olimpiyatlarda temsil eden İLK TÜRK SPORCU olan ve Tokyo 2020'de olimpiyat 5.si olan kadın sporcumuz kimdir?",
        "options": [
            "İlke Özyüksel",
            "Büşra Ün",
            "Busenaz Sürmeneli",
            "Yasemin Can",
            "Meryem Akdağ"
        ],
        "correctIndex": 0,
        "explanation": "Yüzme, eskrim, binicilik, koşu ve atıcılıktan oluşan modern pentatlonda dünya rekorları kıran öncü sporcumuz İLKE ÖZYÜKSEL'dir.",
        "distractor_trap": "Modern Pentatlon denince tek bir isim akla gelir: İLKE ÖZYÜKSEL."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "Spor ve Olimpiyatlar",
        "difficulty": 2,
        "prompt_text": "2024 Paris Paralimpik Oyunları'nda Para Tekvando kadınlar 47 kiloda ALTIN MADALYA kazanan milli sporcumuz kimdir?",
        "options": [
            "Mahmut Bozteke",
            "Gamze Gürdal",
            "Meryem Betül Çavdar",
            "Feryal Özel",
            "Şeyma Nur Emeksiz"
        ],
        "correctIndex": 0,
        "explanation": "Para tekvandoda Mahmut Bozteke erkeklerde altın madalya kazanırken, kadınlar K44 57 kg'da Feryal/Gamze mücadele etmiş; MAHMUT BOZTEKE tarihi altın madalyayı boynuna takmıştır.",
        "distractor_trap": "Para tekvandoda Türkiye ilk kez olimpiyat altını kazanmıştır; erkeklerde Mahmut Bozteke şampiyon olmuştur."
    },

    # -------------------------------------------------------------
    # TEST 4: NET SIÇRATAN / KURTLAR SOFRASI (Zorluk: 3) - Sorular 31-40
    # -------------------------------------------------------------
    {
        "lesson": "Güncel Bilgiler",
        "topic": "Spor ve Olimpiyatlar",
        "difficulty": 3,
        "prompt_text": "Türkiye'nin olimpiyat tarihindeki İLK MADALYASINI (Bronz) 1936 Berlin Olimpiyatları'nda kazanan güreşçimiz kimdir?",
        "options": [
            "Ahmet Kireççi (Mersinli Ahmet)",
            "Yaşar Erkan",
            "Gazanfer Bilge",
            "Celal Atik",
            "Nasuh Akar"
        ],
        "correctIndex": 0,
        "explanation": "Türkiye'nin olimpiyatlardaki İLK MADALYASINI (Bronz) Mersinli AHMET KİREÇÇİ kazanmıştır. (Aynı olimpiyatta birkaç gün sonra Yaşar Erkan İLK ALTIN madalyayı kazanmıştır).",
        "distractor_trap": "ÖSYM'nin en meşhur tuzağı: İlk MADALYA (Bronz) = Ahmet Kireççi; İlk ALTIN MADALYA = Yaşar Erkan'dır!"
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "Spor ve Olimpiyatlar",
        "difficulty": 3,
        "prompt_text": "Türkiye'nin olimpiyat tarihindeki İLK ALTIN MADALYASINI 1936 Berlin Olimpiyatları'nda grekoromen güreşte kazanan efsane sporcumuz kimdir?",
        "options": [
            "Yaşar Erkan",
            "Ahmet Kireççi",
            "Yaşar Doğu",
            "Hamza Yerlikaya",
            "Mehmet Oktav"
        ],
        "correctIndex": 0,
        "explanation": "1936 Berlin'de Türk bayrağını göndere çektirip İstiklal Marşı'mızı ilk kez çaldıran İLK ALTIN MADALYALI olimpiyat şampiyonumuz YAŞAR ERKAN'dır.",
        "distractor_trap": "İlk madalya = Ahmet Kireççi; İlk ALTIN = YAŞAR ERKAN'dır."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "Spor ve Olimpiyatlar",
        "difficulty": 3,
        "prompt_text": "17 yaşında 1993 yılında Büyükler Dünya Güreş Şampiyonu olarak FILA tarafından 'Asrın Güreşçisi' unvanı verilen ve 1996 Atlanta ile 2000 Sidney'de iki altın olimpiyat madalyası kazanan güreşçimiz kimdir?",
        "options": [
            "Hamza Yerlikaya",
            "Mahmut Demir",
            "Harun Doğan",
            "Nazmi Avluca",
            "Şeref Eroğlu"
        ],
        "correctIndex": 0,
        "explanation": "FILA (Dünya Güreş Birliği) tarafından 'Asrın Güreşçisi' ilan edilen isim HAMZA YERLİKAYA'dır.",
        "distractor_trap": "Yüzyılın Haltercisi Naim Süleymanoğlu; Asrın Güreşçisi HAMZA YERLİKAYA'dır."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "Spor ve Olimpiyatlar",
        "difficulty": 3,
        "prompt_text": "Avrupa Voleybol Konfederasyonu (CEV) Şampiyonlar Ligi'ni kadınlarda EN ÇOK KAZANAN (6 kez) ve aynı zamanda FIVB Kadınlar Kulüpler Dünya Şampiyonası'nı en çok kazanan Türk voleybol kulübü hangisidir?",
        "options": [
            "VakıfBank",
            "Eczacıbaşı",
            "Fenerbahçe",
            "Galatasaray",
            "Türk Hava Yolları"
        ],
        "correctIndex": 0,
        "explanation": "Guinness Rekorlar Kitabı'na giren üst üste galibiyet serisi ve 6 CEV Şampiyonlar Ligi zaferiyle kadın voleybolunun zirvesi VAKIFBANK'tır.",
        "distractor_trap": "Eczacıbaşı ilk şampiyon kulüptür; en çok kazanan ve rekorlar kıran kulüp VAKIFBANK'tır."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "Spor ve Olimpiyatlar",
        "difficulty": 3,
        "prompt_text": "2024 Paris Olimpiyatları'nda 57 kg boks kategorisinde mücadele ederek bronz madalya kazanan kadın milli boksörümüz kimdir?",
        "options": [
            "Esra Yıldız Kahraman",
            "Buse Naz Çakıroğlu",
            "Hatice Akbaş",
            "Busenaz Sürmeneli",
            "Gizem Özer"
        ],
        "correctIndex": 0,
        "explanation": "Paris 2024'te kadınlar 57 kiloda yarı finale yükselerek bronz madalya kazanan boksörümüz ESRA YILDIZ KAHRAMAN'dır.",
        "distractor_trap": "Gümüşler: Buse Naz Çakıroğlu ve Hatice Akbaş; Bronz: Esra Yıldız Kahraman'dır."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "Spor ve Olimpiyatlar",
        "difficulty": 3,
        "prompt_text": "Türkiye Futbol Federasyonu (TFF) resmi olarak kaç yılında kurulmuş ve FIFA'ya hangi yıl üye olmuştur?",
        "options": [
            "1923 yılında kuruldu — 1923 yılında FIFA'ya üye oldu",
            "1905 yılında kuruldu — 1920'de üye oldu",
            "1938 yılında kuruldu — 1954'te üye oldu",
            "1924 yılında kuruldu — 1928'de üye oldu",
            "1914 yılında kuruldu — 1930'da üye oldu"
        ],
        "correctIndex": 0,
        "explanation": "TFF, 1923 yılında 'Futbol Heyet-i Müttehidesi' adıyla kurulmuş ve aynı yıl 21 Mayıs 1923'te FIFA'nın 26. üyesi olmuştur.",
        "distractor_trap": "TFF Cumhuriyet ile yaşıttır: 1923'te kurulmuş ve aynı yıl FIFA'ya girmiştir."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "Spor ve Olimpiyatlar",
        "difficulty": 3,
        "prompt_text": "Türkiye A Milli Futbol Takımı, tarihinde İLK RESMİ MAÇINI 26 Ekim 1923'te İstanbul Taksim Stadı'nda hangi ülkeye karşı oynamış ve 2-2 berabere kalmıştır?",
        "options": [
            "Romanya",
            "Yunanistan",
            "Bulgaristan",
            "Macaristan",
            "Rusya"
        ],
        "correctIndex": 0,
        "explanation": "Türkiye milli futbol takımı ilk resmi karşılaşmasını 26 Ekim 1923'te ROMANYA ile oynamış ve milli takımın tarihteki ilk golünü Zeki Rıza Sporel atmıştır.",
        "distractor_trap": "İlk milli maç Romanya ile yapılmıştır ve ilk golü Zeki Rıza Sporel atmıştır."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "Spor ve Olimpiyatlar",
        "difficulty": 3,
        "prompt_text": "Olimpiyat Oyunları bayrağında yer alan 5 iç içe geçmiş halkanın renkleri ve temsil ettiği 5 kıta değerlendirildiğinde aşağıdakilerden hangisi bu renklerden biri DEĞİLDİR?",
        "options": [
            "Turuncu",
            "Mavi",
            "Sarı",
            "Siyah",
            "Yeşil"
        ],
        "correctIndex": 0,
        "explanation": "Olimpiyat halkalarının 5 rengi vardır: Mavi (Avrupa), Sarı (Asya), Siyah (Afrika), Yeşil (Okyanusya) ve Kırmızı (Amerika). Turuncu renk olimpiyat halkalarında YOKTUR.",
        "distractor_trap": "Olimpiyat halkalarında TURUNCU veya MOR yoktur; Mavi, Sarı, Siyah, Yeşil, Kırmızı vardır."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "Spor ve Olimpiyatlar",
        "difficulty": 3,
        "prompt_text": "2024 Paris Olimpiyatları'nda madalya sıralamasında 40 altın madalyayla zirveyi paylaşan iki süper güç ülke hangileridir?",
        "options": [
            "Amerika Birleşik Devletleri (ABD) ve Çin",
            "ABD ve Fransa",
            "Çin ve Japonya",
            "Büyük Britanya ve Avustralya",
            "ABD ve Almanya"
        ],
        "correctIndex": 0,
        "explanation": "Paris 2024'te hem ABD hem Çin 40'ar altın madalya kazanmış; toplam madalya sayısı daha fazla olan ABD (126 madalya) olimpiyat lideri olmuştur.",
        "distractor_trap": "Altın sayısı eşittir (40-40); toplam madalya sayısı ile ABD birinci olmuştur."
    },
    {
        "lesson": "Güncel Bilgiler",
        "topic": "Spor ve Olimpiyatlar",
        "difficulty": 3,
        "prompt_text": "Dünya güreş tarihinde 'Yenilmeyen Türk' olarak tanınan, Amerika ve Avrupa turnelerinde tüm rakiplerini tuş eden ve 1898'de La Bourgogne gemisinin batması sonucu Atlas Okyanusu'nda boğularak vefat eden efsanevi Türk pehlivanı kimdir?",
        "options": [
            "Koca Yusuf",
            "Adalı Halil",
            "Kel Aliço",
            "Filiz Nurullah",
            "Kurtdereli Mehmet Pehlivan"
        ],
        "correctIndex": 0,
        "explanation": "Dünyada 'Terrible Turk' (Korkunç Türk) lakabıyla tanınan ve mindere çıkan en güçlü pehlivan sayılan KOCA YUSUF, Amerika dönüşü batan gemide hayatını kaybetmiştir.",
        "distractor_trap": "'Güreşirken arkamda Türk milletinin bulunduğunu düşünürüm' diyen Kurtdereli'dir; Atlas Okyanusu'nda vefat eden 'Yenilmeyen Türk' ise KOCA YUSUF'tur."
    }
]
