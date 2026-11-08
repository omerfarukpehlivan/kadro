# -*- coding: utf-8 -*-
"""
KPSS Coğrafya — Konu 2: Türkiye'nin Yer Şekilleri ve İklimi (40 Özgün Soru)
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
        "topic": "Türkiye'nin Yer Şekilleri ve İklimi",
        "difficulty": 1,
        "prompt_text": "Türkiye arazisinin büyük bir bölümü III. ve IV. jeolojik zamanlarda (Tersiyer ve Kuaterner) meydana gelen orojenik ve epirojenik hareketlerle şekillenmiş genç oluşumlu bir ülkedir.\n\nAşağıdakilerden hangisi Türkiye'nin genç oluşumlu bir arazi yapısına sahip olduğunun doğrudan bir göstergesi değildir?",
        "options": [
            "Linyit, bor, tuz ve petrol yataklarının yaygın olması",
            "Deprem riskinin ve fay hatlarının geniş alan kaplaması",
            "Akarsuların denge profiline henüz ulaşmamış olması",
            "Jeotermal enerji potansiyeli ve sıcak su kaynaklarının zenginliği",
            "Taş kömürü yataklarının Zonguldak ve çevresinde bulunması"
        ],
        "correctIndex": 4,
        "explanation": "Taş kömürü I. Jeolojik Zaman'da (Paleozoyik) oluşmuş yaşlı bir karbon yatağıdır. Dolayısıyla taş kömürünün varlığı genç oluşumlu olmanın değil, arazide eski (masif/paleozoyik) arazilerin de bulunduğunun kanıtıdır. Linyit, petrol, bor, kaplıcalar ve denge profiline ulaşmamış dik vadiler ise III. ve IV. zamanın (genç oluşumun) kanıtlarıdır.",
        "distractor_trap": "ÖSYM linyit ile taş kömürünü sınavlarda sıkça karşılaştırır. Linyit III. Zaman (genç), taş kömürü I. Zaman (yaşlı) arazisidir."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'nin Yer Şekilleri ve İklimi",
        "difficulty": 1,
        "prompt_text": "Türkiye'de dağların uzanış doğrultusu iklim, ulaşım ve yerleşme üzerinde derin etkiler bırakmıştır.\n\nKaradeniz ve Akdeniz kıyılarında dağların kıyı çizgisine paralel uzanması sonucunda aşağıdakilerden hangisinin gerçekleştiği söylenemez?",
        "options": [
            "Kıyı ile iç kesimler arasında iklim farklılığının belirginleşmesi",
            "Kıta sahanlığının (şelf alanının) genel olarak dar olması",
            "Falez (yalıyar) oluşumlarının yaygın olarak görülmesi",
            "Kıyı ile iç kesimler arasındaki kara yolu ulaşımının doğal geçitlerle sağlanması",
            "Kıyılarda koy, körfez, doğal liman ve adacık sayısının çok fazla olması"
        ],
        "correctIndex": 4,
        "explanation": "Dağların kıyıya paralel uzandığı boyuna kıyılarda kıyı oldukça düz ve sadedir; koy, körfez, ada ve doğal liman sayısı çok azdır. Koy, körfez ve ada sayısının en fazla olduğu bölge dağların kıyıya dik uzandığı Ege kıyılarıdır (enine kıyı tipi).",
        "distractor_trap": "Adaylar Karadeniz ve Akdeniz'in kıyı uzunluğunu düşünüp koy ve körfezlerin buralarda da çok olduğunu zannedebilir. Oysa boyuna kıyıda doğal liman kıtlığı vardır (Sinop hariç)."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'nin Yer Şekilleri ve İklimi",
        "difficulty": 1,
        "prompt_text": "Akarsuların taşıdığı alüvyonları denize döküldükleri kıyılarda biriktirmesiyle delta ovaları oluşur.\n\nAşağıdaki akarsu ve oluşturduğu delta ovası eşleştirmelerinden hangisi yanlıştır?",
        "options": [
            "Kızılırmak — Bafra Ovası",
            "Yeşilırmak — Çarşamba Ovası",
            "Seyhan ve Ceyhan — Çukurova",
            "Göksu — Silifke Ovası",
            "Gediz — Balat Ovası"
        ],
        "correctIndex": 4,
        "explanation": "Gediz Nehri 'Menemen Deltası'nı oluşturur. 'Balat Deltası' ise Büyük Menderes Nehri tarafından oluşturulmuştur (Küçük Menderes ise Selçuk Deltasını oluşturur).",
        "distractor_trap": "Ege'deki delta eşleşmeleri ÖSYM'nin klasik yoklama noktasıdır: Bakırçay -> Dikili, Gediz -> Menemen, Küçük Menderes -> Selçuk, Büyük Menderes -> Balat."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'nin Yer Şekilleri ve İklimi",
        "difficulty": 1,
        "prompt_text": "Kalker, jips ve kaya tuzu gibi suda kolay çözünebilen kayaçların bulunduğu sahalarda kimyasal çözünme sonucu karstik yer şekilleri meydana gelir.\n\nTürkiye'de karstik şekillerin (lapya, dolin, uvala, polye, obruk, mağara) en yaygın olarak görüldüğü coğrafi bölge aşağıdakilerden hangisidir?",
        "options": [
            "Güneydoğu Anadolu Bölgesi",
            "Akdeniz Bölgesi (Toroslar Kuşağı)",
            "Doğu Anadolu Bölgesi",
            "İç Anadolu Bölgesi",
            "Doğu Karadeniz Bölümü"
        ],
        "correctIndex": 1,
        "explanation": "Türkiye'de kireç taşı (kalker) arazisinin ve dolayısıyla karstik aşınım-birikim şekillerinin en tipik ve yaygın görüldüğü saha Akdeniz Bölgesi'nde Batı ve Orta Toroslar (Teke ve Taşeli platoları çevresi) kuşağıdır.",
        "distractor_trap": "Sivas çevresinde jips (alçı taşı), Çankırı'da kaya tuzu yaygın olsa da, Türkiye'de karst topoğrafyası denince akla gelen ana ve en geniş kuşak Akdeniz kireç taşı platosudur."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'nin Yer Şekilleri ve İklimi",
        "difficulty": 1,
        "prompt_text": "Türkiye'de heyelan olaylarının yaklaşık %65'i ilkbahar aylarında ve en çok Karadeniz Bölgesi'nde meydana gelmektedir.\n\nHeyelanların özellikle ilkbahar aylarında yoğunlaşmasının temel nedeni aşağıdakilerden hangisidir?",
        "options": [
            "Rüzgar hızının ve fırtınaların bu mevsimde artması",
            "Kar erimeleri ile toprağın suya aşırı doyması ve killi tabakanın kayganlaşması",
            "İlkbaharda tarımsal faaliyetlerin ve toprak sürümünün başlaması",
            "Bitki örtüsünün ilkbaharda yaprak dökmesi",
            "Deprem sıklığının ilkbaharda artış göstermesi"
        ],
        "correctIndex": 1,
        "explanation": "Karadeniz en çok yağışı sonbaharda almasına rağmen, heyelanların ilkbaharda zirve yapmasının nedeni; kış boyu biriken karların ilkbaharda erimesi, toprağın aşırı derecede suya doygun hale gelmesi ve killi tabakaların kayganlaşarak tabaka eğimi yönünde kaymasıdır.",
        "distractor_trap": "ÖSYM 'Karadeniz en çok yağışı sonbaharda alır, o halde heyelan da sonbaharda çoktur' yanılgısını sınar. Cevap eriyen kar sularından ötürü ilkbahardır."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'nin Yer Şekilleri ve İklimi",
        "difficulty": 1,
        "prompt_text": "Türkiye'yi kış mevsiminde kuzeydoğudan etkileyen, Sibirya üzerinden gelerek aşırı soğuk ve ayaz getiren termik kökenli yüksek basınç merkezi aşağıdakilerden hangisidir?",
        "options": [
            "İzlanda Dinamik Alçak Basıncı",
            "Asor Dinamik Yüksek Basıncı",
            "Sibirya Termik Yüksek Basıncı",
            "Basra Termik Alçak Basıncı",
            "Güneydoğu Alçak Basıncı"
        ],
        "correctIndex": 2,
        "explanation": "Sibirya Termik Yüksek Basıncı (TYB), kış aylarında karasal soğumaya bağlı olarak güçlenir ve Türkiye'ye kuzeydoğudan sokularak kışların kuru, dondurucu soğuk ve ayaz geçmesine neden olur.",
        "distractor_trap": "İzlanda Dinamik Alçak Basıncı kışın ılık ve yağışlı hava getirirken; Sibirya Termik Yüksek Basıncı açık, ayaz ve dondurucu kuru soğuk getirir."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'nin Yer Şekilleri ve İklimi",
        "difficulty": 1,
        "prompt_text": "İç Anadolu Bölgesi'nde ilkbahar aylarında öğleden sonraları ısınan havanın yükselerek soğuması sonucu meydana gelen ve halk arasında 'kırkikindi' olarak adlandırılan yağışlar hangi oluşum türüne aittir?",
        "options": [
            "Orografik (Yamaç) Yağışları",
            "Konveksiyonel (Yükselim) Yağışları",
            "Cephesel (Frontal) Yağışlar",
            "Siklonik Kasırga Yağışları",
            "Muson Yağışları"
        ],
        "correctIndex": 1,
        "explanation": "Güneş ışınlarıyla ısınan havanın dikey doğrultuda yükselmesi ve soğuyarak yoğuşması sonucu oluşan yağışlara konveksiyonel (yükselim) yağış denir. İç Anadolu'da ilkbaharda görülen 'kırkikindi' yağışları bunun en belirgin örneğidir.",
        "distractor_trap": "Karadeniz kıyılarında dağlara çarparak yükselen yağışlar orografik (yamaç); Türkiye geneli kış yağışları ise cephesel (frontal) karakterlidir."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'nin Yer Şekilleri ve İklimi",
        "difficulty": 1,
        "prompt_text": "Akdeniz iklim bölgesinde kızılçam ormanlarının tahrip edilmesiyle oluşan kısa boylu, sert yapraklı ve kuraklığa dayanıklı bodur ağaççıklardan oluşan bitki topluluğuna ne ad verilir?",
        "options": [
            "Bozkır (Step)",
            "Maki",
            "Garig",
            "Psödömaki",
            "Alpin Çayır"
        ],
        "correctIndex": 1,
        "explanation": "Kızılçam ormanlarının tahribatıyla zeytin, defne, mersin, keçiboynuzu, kermes meşesi gibi türlerden oluşan 'maki' topluluğu ortaya çıkar. Makilerin de tahrip edilmesiyle 'garig' (frigana) oluşur.",
        "distractor_trap": "Maki kızılçamın tahribiyle; garig ise makinin tahribiyle oluşur. Karadeniz'deki orman tahribi ise 'psödömaki' (yalancı maki) oluşturur."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'nin Yer Şekilleri ve İklimi",
        "difficulty": 1,
        "prompt_text": "Türkiye'de rüzgarların yönleri ve etkileri dikkate alındığında, ülkemizi güneybatıdan etkileyen, kışın ılık ve nemli hava getirerek kar erimelerine ve soba zehirlenmelerine yol açan yerel rüzgar aşağıdakilerden hangisidir?",
        "options": [
            "Karayel",
            "Poyraz",
            "Lodos",
            "Samyeli (Keşişleme)",
            "Etezyen"
        ],
        "correctIndex": 2,
        "explanation": "KAYIP SAKAL şifresine göre: Karayel (KD), Yıldız (K), Poyraz (KD) kuzeyden eserken; Samyeli (GD), Kıble (G), Lodos (GB) güneyden eser. Güneybatıdan esen Lodos; sıcak, nemli ve denizel olup kışın kar erimelerine, deniz ulaşımında aksamalara ve baca gazı/soba zehirlenmelerine neden olur.",
        "distractor_trap": "Samyeli (Keşişleme) güneydoğudan eser ve kuraklık/buharlaşma getirir; Lodos ise güneybatıdan eser ve ılık/fırtınalı yağışlı hava getirir."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'nin Yer Şekilleri ve İklimi",
        "difficulty": 1,
        "prompt_text": "Türkiye'de göller oluşum kökenlerine göre doğal ve yapay set gölleri, tektonik, karstik, volkanik ve buzul gölleri olarak sınıflandırılır.\n\nAşağıdaki göllerden hangisi tektonik çanaklarda biriken sularla oluşmuş tektonik göllerden biri değildir?",
        "options": [
            "Tuz Gölü",
            "İznik Gölü",
            "Salda Gölü",
            "Beyşehir Gölü",
            "Sapanca Gölü"
        ],
        "correctIndex": 2,
        "explanation": "Salda Gölü karstik kökenli bir göldür (ayrıca magnezyum hidromanyezit çökelleri içerir). Tuz, İznik, Beyşehir ve Sapanca gölleri ise tektonik çöküntü alanlarında yer alır (Beyşehir gölü tektono-karstik olmakla birlikte tabanı tektonik çanaktır).",
        "distractor_trap": "Burdur havzasındaki Salda, Kestel ve Avlan gibi göller karstik çanaklarda oluşurken; Manyas, Ulubat, İznik, Sapanca Kuzey Anadolu Fay Hattı üzerindeki tektonik çöküntülerdir."
    },

    # -------------------------------------------------------------
    # TEST 2: STANDART ÖSYM AYARI (Zorluk: 2) - Sorular 11-20
    # -------------------------------------------------------------
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'nin Yer Şekilleri ve İklimi",
        "difficulty": 2,
        "prompt_text": "Türkiye'deki masif araziler I. Jeolojik Zaman'da (Paleozoyik) başkalaşıma uğramış sert ve oturmuş kütlelerdir. Bu alanlarda faylanma ve deprem riski genç arazilere oranla düşüktür.\n\nAşağıda verilen yörelerden hangisi Türkiye'deki masif alanlar arasında yer almaz?",
        "options": [
            "Yıldız Dağları (Istranca) Masifi",
            "Saruhan - Menteşe Masifi",
            "Kırşehir Masifi",
            "Gediz - Büyük Menderes Grabeni",
            "Bitlis ve Mardin Masifleri"
        ],
        "correctIndex": 3,
        "explanation": "Gediz ve Büyük Menderes grabenleri, Batı Anadolu Fay Sistemi (BAFS) üzerinde yer alan son derece genç, kırıklı ve I. derece deprem bölgesidir. Masif araziler ise Yıldız, Menteşe, Kırşehir, Bitlis, Mardin-Derik, Daday-Devrekani, Alanya-Anamur gibi oturmuş sert bloklardır.",
        "distractor_trap": "Menteşe yöresi bir masiftir ancak hemen yanı başındaki horst-graben olukları (Gediz, Menderes) aktif fayı temsil eder; adaylar Ege'deki kütleler ile graben düzlüklerini birbirine karıştırabilir."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'nin Yer Şekilleri ve İklimi",
        "difficulty": 2,
        "prompt_text": "I. Kaz Dağı — Edremit Grabeni\nII. Madra Dağı — Bakırçay Grabeni\nIII. Yunt Dağı — Gediz Grabeni\nIV. Bozdağlar — Küçük Menderes Grabeni\nV. Erciyes Dağı — Develi Ovası\n\nYukarıdaki dağ-çöküntü alanı eşleştirmelerinden hangisi horst-graben sistemiyle açıklanamaz?",
        "options": [
            "I",
            "II",
            "III",
            "IV",
            "V"
        ],
        "correctIndex": 4,
        "explanation": "Kaz, Madra, Yunt, Bozdağlar ve Aydın dağları sert tabakaların kırılmasıyla yükselen horstlar, aralarındaki Bakırçay, Gediz, Küçük ve Büyük Menderes olukları ise grabenlerdir. Erciyes Dağı ise kırılma ile değil, volkanik püskürmeler sonucu oluşan stratovolkanik bir volkan konisidir.",
        "distractor_trap": "Erciyes'in eteğindeki Develi ovası tektonik kökenli bir çöküntü havzası olsa da Erciyes Dağı bir horst değil, sönmüş bir volkan dağıdır."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'nin Yer Şekilleri ve İklimi",
        "difficulty": 2,
        "prompt_text": "Türkiye'de platolar farklı jeolojik ve jeomorfolojik süreçlerle oluşmuştur.\n\nBuna göre;\n• Lav akıntılarının kalın tabakalar oluşturmasıyla meydana gelen bazalt platoları,\n• Kolay çözünebilen kireç taşı arazisinin yüzey sularını alta geçirmesiyle kurak kalan platolar\nörnekleri sırasıyla aşağıdakilerden hangisinde doğru eşleştirilmiştir?",
        "options": [
            "Haymana — Cihanbeyli",
            "Erzurum-Kars — Teke ve Taşeli",
            "Çatalca-Kocaeli — Bozok",
            "Taşeli — Erzurum-Kars",
            "Obruk — Gaziantep"
        ],
        "correctIndex": 1,
        "explanation": "Lav örtüleriyle kaplı volkanik platolar Erzurum-Kars ve Ardahan platolarıdır. Yüzeyinde çatlak ve obruklar barındıran, suyu tabana sızdırdığı için yüzey suları fakir olan karstik kireç taşı platoları ise Teke ve Taşeli platolarıdır.",
        "distractor_trap": "Çatalca-Kocaeli aşınım platosudur; Haymana, Cihanbeyli, Bozok ve Obruk ise tabaka düzlüğü (yatay duruşlu) platolardır."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'nin Yer Şekilleri ve İklimi",
        "difficulty": 2,
        "prompt_text": "Karadeniz kıyısında yer almasına rağmen Samsun ve çevresinde dağların geride ve basık (Canik Dağları) olması aşağıdakilerden hangisine yol açmamıştır?",
        "options": [
            "İç kesimlerle kara yolu ve demir yolu ulaşımının daha kolay sağlanmasına",
            "Kıta sahanlığının Doğu Karadeniz'e göre daha geniş olmasına",
            "Kızılırmak ve Yeşilırmak'ın Bafra ve Çarşamba deltalarını oluşturabilmesine",
            "Samsun il merkezinin Doğu ve Batı Karadeniz kıyılarına göre daha fazla yıllık yağış almasına",
            "İklimin iç kesimlere doğru daha rahat sokulabilmesine"
        ],
        "correctIndex": 3,
        "explanation": "Canik Dağları kıyıdan uzakta ve yükseltisi az olduğu için denizden gelen nemli hava kütleleri dik bir engele çarpamaz. Bu nedenle Samsun'un yıllık yağış miktarı (yaklaşık 700 mm), arkasında yüksek dağlar bulunan Rize (2300 mm) veya Zonguldak'a (1200 mm) göre çok daha düşüktür.",
        "distractor_trap": "Adaylar Samsun'un Karadeniz'in büyük kenti olması sebebiyle çok yağış aldığını varsayar. Canik dağlarının alçaklığı yağış miktarını ciddi şekilde düşürür."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'nin Yer Şekilleri ve İklimi",
        "difficulty": 2,
        "prompt_text": "Bir akarsuyun aşındırma ve taşıma gücü akış hızı ve debisiyle doğrudan orantılıdır.\n\nTürkiye akarsularının genel özellikleri düşünüldüğünde aşağıdakilerden hangisi söylenemez?",
        "options": [
            "Yatak eğimleri ve akış hızları fazladır.",
            "Hidroelektrik enerji potansiyelleri yüksektir.",
            "Taşımacılık ve ulaşıma elverişli akarsu sayısı oldukça fazladır.",
            "Genellikle dar ve derin vadi profillerine (çentik/boğaz) sahiptirler.",
            "Akımları (debileri) mevsimden mevsime belirgin dalgalanmalar gösterir."
        ],
        "correctIndex": 2,
        "explanation": "Türkiye yüksek ve engebeli bir ülke olduğu için akarsular denge profiline ulaşmamıştır; rejimleri düzensiz, akış hızları yüksek ve debileri değişkendir. Bu nedenle (Bartın Çayı'nın küçük bir kısmı hariç) Türkiye akarsularında su yolu taşımacılığı yapılamaz.",
        "distractor_trap": "Türkiye'de sadece Bartın Çayı'nın ağız kısmında ufak tonajlı tekneler işler; akarsular genel olarak ulaşıma tamamen elverişsizdir."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'nin Yer Şekilleri ve İklimi",
        "difficulty": 2,
        "prompt_text": "Heyelan set gölleri, vadilerin önünün heyelan sonucu kayan kütlelerle kapanmasıyla meydana gelir.\n\nAşağıdaki göllerden hangisi heyelan set gölüne örnek gösterilemez?",
        "options": [
            "Tortum Gölü",
            "Sera Gölü",
            "Abant Gölü",
            "Yedigöller",
            "Çıldır Gölü"
        ],
        "correctIndex": 4,
        "explanation": "Çıldır Gölü (Ardahan-Kars) lav akıntılarının vadi önünü kapatmasıyla oluşan bir 'lav/volkanik set gölü'dür. Tortum (Erzurum), Sera (Trabzon), Abant ve Yedigöller (Bolu) ise tipik heyelan set gölleridir.",
        "distractor_trap": "Doğu Anadolu'daki Van, Erçek, Nazik, Çıldır, Balık ve Haçlı gölleri lav (volkanik) set gölüdür; Karadeniz'dekiler (Tortum, Sera, Abant, Boraboy, Zinav) ise heyelan set gölüdür."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'nin Yer Şekilleri ve İklimi",
        "difficulty": 2,
        "prompt_text": "Türkiye'de iklim çeşitliliğinin fazla olması toprak türlerinin de zenginleşmesini sağlamıştır.\n\nErzurum-Kars platosunda yaz yağışlarıyla yeşeren gür çayır örtüsü altında gelişen, organik madde (humus) bakımından Türkiye'nin en verimli yerli (zonal) toprağı aşağıdakilerden hangisidir?",
        "options": [
            "Terra Rossa (Kırmızı Akdeniz Toprağı)",
            "Çernezyom (Kara Toprak)",
            "Podzol",
            "Kahverengi Bozkır Toprağı",
            "Rendzina"
        ],
        "correctIndex": 1,
        "explanation": "Çernezyom (kara toprak), yaz yağışlarıyla boy atan alpin çayırların sonbaharda çürümesiyle humusça son derece zenginleşen topraktır. Erzurum-Kars-Ardahan yöresinde görülür. Ancak iklim koşulları aşırı soğuk olduğu için bu verimli toprak tarımdan ziyade büyükbaş hayvancılıkta değerlendirilir.",
        "distractor_trap": "ÖSYM Çernezyom'un en verimli toprak olduğunu ancak iklim sertliğinden dolayı tarımda yeterince kullanılamadığını sıkça sorar."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'nin Yer Şekilleri ve İklimi",
        "difficulty": 2,
        "prompt_text": "Doğu Anadolu'da dağların zirvelerinde buzul şekilleri (sirk, hörgüçkaya, buzul vadisi) görülürken, Karadeniz ve Akdeniz'in de yüksek dağlarında buzul izlerine rastlanır.\n\nBuna karşılık Uludağ (2543 m) üzerinde buzul şekilleri ve sirk çanakları bulunmasına rağmen, günümüzde aktif buzul kütlesinin bulunmamasının nedeni aşağıdakilerden hangisidir?",
        "options": [
            "Batı rüzgarlarına kapalı bir yamaçta yer alması",
            "Yükseltisinin güncel kalıcı kar (toktağan kar) sınırına ulaşamaması",
            "Volkanik kökenli bir dağ olması sebebiyle yüzey sıcaklığının yüksek olması",
            "Karstik kayaçlardan oluştuğu için suları emmesi",
            "Yaz mevsiminde kuraklığın etkili olması"
        ],
        "correctIndex": 1,
        "explanation": "Uludağ'ın yükseltisi (2543 m) IV. Zaman'daki buzul döneminde buzul oluşumuna yetmiştir ve o döneme ait sirk gölleri (Aynalı, Kilimli, Karagöl) mevcuttur. Ancak günümüz iklim koşullarında Batı Anadolu'da kalıcı kar sınırı 3000 metrenin üzerinde olduğundan Uludağ'da güncel (aktif) buzul yoktur.",
        "distractor_trap": "Uludağ'da buzul şekli/izi vardır fakat GÜNCEL BUZUL yoktur! Güncel buzul Kaçkar, Bolkar, Aladağlar, Erciyes, Ağrı, Süphan ve özellikle Cilo (Reşko) dağlarında bulunur."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'nin Yer Şekilleri ve İklimi",
        "difficulty": 2,
        "prompt_text": "Dağların bir yamacını aşıp diğer yamacından aşağıya doğru alçalan hava kütlesi her 100 metrede yaklaşık 1°C ısınarak fön (foehn) etkisi oluşturur.\n\nTürkiye'de fön rüzgarlarının kış aylarında Rize ve çevresinde turunçgil, Iğdır ovasında ise pamuk yetiştirilebilmesini sağlayan temel katkısı aşağıdakilerden hangisidir?",
        "options": [
            "Nem açığını azaltarak bağıl nemi yükseltmesi",
            "Yerel bir mikroklima alanı oluşturarak kış donlarını ve soğuklarını engellemesi",
            "Yamaç yağışlarının miktarını olağanüstü artırması",
            "Rüzgar erozyonunu minimum seviyeye indirmesi",
            "Toprağın taban suyu seviyesini yükseltmesi"
        ],
        "correctIndex": 1,
        "explanation": "Fön rüzgarı sürtünmeyle her 100 metrede 1°C ısınır, havayı kurutur ve sıcaklığı belirgin biçimde artırır. Bu durum Rize kıyısında turunçgil ve çay, Iğdır havzasında ise pamuk yetiştirilmesini mümkün kılan mikroklima ortamını sağlar.",
        "distractor_trap": "Fön rüzgarı yağış getirmez, aksine havayı kurutur ve nem açığını artırır! Şıklarda 'yağışı artırır' çeldiricisine düşmemek gerekir."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'nin Yer Şekilleri ve İklimi",
        "difficulty": 2,
        "prompt_text": "Türkiye'de kıyı tipleri incelendiğinde aşağıdakilerden hangisi yanlıştır?",
        "options": [
            "Karadeniz ve Akdeniz kıyılarında dağların kıyıya paralel uzandığı 'Boyuna Kıyı Tipi' yaygındır.",
            "Ege kıyılarında dağların kıyıya dik uzandığı 'Enine Kıyı Tipi' görülür.",
            "İstanbul ve Çanakkale Boğazları ile Haliç eski akarsu vadilerinin sular altında kalmasıyla oluşan 'Ria Tipi' kıyılardır.",
            "Antalya-Kaş kıyılarında denize paralel uzanan adacıkların oluşturduğu 'Dalmaçya Tipi' kıyılar görülür.",
            "İzmir ve Mersin kıyılarında gel-git genliğinin yüksek olmasına bağlı olarak 'Haliç ve Watt Tipi' kıyılar gelişmiştir."
        ],
        "correctIndex": 4,
        "explanation": "Türkiye okyanusa kıyısı olmayan bir iç deniz ülkesidir. İç denizlerde gel-git genliği çok az (20-40 cm) olduğundan Türkiye kıyılarında Haliç ve Watt tipi kıyılar OLUŞAMAZ. İstanbul'daki Haliç bir kıyı tipi haliç değil, Ria tipi vadi boğulmasıdır.",
        "distractor_trap": "İstanbul'daki 'Haliç' (Altın Boynuz) isim benzerliğinden dolayı tuzaktır. Okyanus kenarı haliç (estuary) jeomorfolojik olarak Türkiye'de hiç yoktur."
    },

    # -------------------------------------------------------------
    # TEST 3: STANDART ÖSYM AYARI (Zorluk: 2) - Sorular 21-30
    # -------------------------------------------------------------
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'nin Yer Şekilleri ve İklimi",
        "difficulty": 2,
        "prompt_text": "I. Göksu Nehri — Taşeli Platosu'nu derin kanyonlarla yarması\nII. Çoruh Nehri — Dünyanın en hızlı akan ve aşındırma gücü yüksek nehirlerinden olması\nIII. Fırat ve Dicle — Doğu Anadolu'dan doğup Basra Körfezi'ne dökülmesi\nIV. Meriç Nehri — Kaynağını Bulgaristan'dan alıp Ege Denizi'ne dökülmesi\n\nYukarıda verilen akarsulardan hangileri açık havza özelliği gösterir?",
        "options": [
            "Yalnız I",
            "I ve II",
            "II ve III",
            "I, II ve III",
            "I, II, III ve IV"
        ],
        "correctIndex": 4,
        "explanation": "Sularını deniz veya okyanuslara ulaştırabilen tüm akarsular açık havzalıdır. Göksu (Akdeniz), Çoruh (Karadeniz), Fırat-Dicle (Basra Körfezi/Hint Okyanusu) ve Meriç (Ege Denizi) sularını açık denizlere ulaştırdıkları için hepsi açık havzadır.",
        "distractor_trap": "Kapalı havzalar sularını denize ulaştıramayan göl veya bataklık havzalarıdır (Tuz Gölü, Van Gölü, Aras-Kura Hazar havzası, Göller Yöresi). Fırat ve Dicle sınır dışına çıksa da açık havzadır."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'nin Yer Şekilleri ve İklimi",
        "difficulty": 2,
        "prompt_text": "Türkiye'de rüzgar aşındırma ve biriktirme şekillerine (mantarkaya, tafoni, kumul) en çok İç Anadolu (özellikle Konya-Karapınar) ve Güneydoğu Anadolu bölgelerinde rastlanır.\n\nBu durum üzerinde aşağıdakilerden hangisinin etkisi bulunmaz?",
        "options": [
            "Bitki örtüsünün cılız ve seyrek (bozkır) olması",
            "Fiziksel (mekanik) ufalanmanın şiddetli olması",
            "Toprağın nem oranının düşük ve gevşek yapılı olması",
            "Karstik kireç taşlarının suda hızla çözünerek mağaralar açması",
            "Yıllık yağış miktarının az ve buharlaşmanın fazla olması"
        ],
        "correctIndex": 3,
        "explanation": "Karstik kireç taşlarının suda çözünmesi yer altı ve yer üstü sularının kimyasal sürecidir (karstlaşma). Rüzgar erozyonu ve rüzgar şekilleri ise kurak/yarı kurak iklim, gevşek taneli örtü, cılız bitki örtüsü ve fiziksel çözünme sonucunda meydana gelir.",
        "distractor_trap": "Rüzgar aşınımı mekanik ve kurak alan olayıdır; karstik çözünme ise Akdeniz'e özgü nem/su ve kalker etkileşimidir."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'nin Yer Şekilleri ve İklimi",
        "difficulty": 2,
        "prompt_text": "Türkiye'de kıyıdan iç kesimlere gidildikçe sıcaklık farkları artar, kış sıcaklıkları düşer ve don olaylı gün sayısı fazlalaşır.\n\nAşağıdaki şehir çiftlerinden hangisinin ocak ayı sıcaklık ortalamaları arasındaki fark temelde 'karasallık ve yükselti' faktörleriyle açıklanır?",
        "options": [
            "İzmir — Van",
            "Antalya — Sinop",
            "Mersin — Samsun",
            "Muğla — Çanakkale",
            "Trabzon — Rize"
        ],
        "correctIndex": 0,
        "explanation": "İzmir ile Van yaklaşık aynı enlem derecelerinde (yaklaşık 38° K) yer almalarına rağmen; İzmir'de ocak ayı ortalaması +8°C iken Van'da -4°C civarındadır. Enlemleri aynı olduğundan bu farkın tek ve kesin nedeni Van'ın denizden uzak (karasal) ve yaklaşık 1750 metre daha yüksek olmasıdır.",
        "distractor_trap": "Antalya-Sinop veya Mersin-Samsun kıyaslamasında enlem farkı belirleyicidir. İzmir-Van ise aynı enlemde oldukları için karasallık ve yükseltiyi net kanıtlar."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'nin Yer Şekilleri ve İklimi",
        "difficulty": 2,
        "prompt_text": "Akdeniz kıyılarında yaygın olarak görülen Terra Rossa (kırmızı renkli Akdeniz) topraklarının renginin karakteristik olarak kırmızı olmasının nedeni aşağıdakilerden hangisidir?",
        "options": [
            "Bünyesinde bol miktarda kireç ve kalsiyum karbonat bulunması",
            "İçerdiği demir minerallerinin sıcak ve nemli koşullarda oksitlenmesi (paslanması)",
            "Organik madde ve humus oranının çok yüksek olması",
            "Volkanik bazalt küllerinden beslenmiş olması",
            "Aşırı tuz ve jips birikimi yaşaması"
        ],
        "correctIndex": 1,
        "explanation": "Terra Rossa toprakları kalker (kireç taşı) üzerinde oluşur; ancak kırmızı rengini kireçten değil, bünyesindeki demir (Fe) bileşiklerinin sıcak ve oksijenli ortamda oksitlenerek pas rengini almasından kazanır. Humusça fakirdir.",
        "distractor_trap": "Adaylar kireç taşında oluştuğu için rengi kireçten alıyor sanabilir. Kireç beyazdır; kırmızı renk demir oksitten (Fe2O3) gelir."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'nin Yer Şekilleri ve İklimi",
        "difficulty": 2,
        "prompt_text": "Aşağıdaki göllerden hangisi bir koy ya da körfez önünün dalga ve akıntıların taşıdığı kumullarla (kıyı kordonu) kapatılması sonucu oluşan 'kıyı set gölü' (lagün) niteliğindedir?",
        "options": [
            "Büyükçekmece ve Terkos (Durusu)",
            "Mogan ve Eymir",
            "Bafa (Çamiçi) ve Köyceğiz",
            "Ulubat ve Manyas",
            "Hazar ve Nemrut"
        ],
        "correctIndex": 0,
        "explanation": "Marmara kıyılarındaki Büyükçekmece, Küçükçekmece ve Terkos (Durusu) gölleri koyların önünün kıyı kordonuyla kapanmasıyla oluşan tipik kıyı set (lagün) gölleridir. Mogan, Eymir ve Bafa alüvyal settir; Manyas tektoniktir.",
        "distractor_trap": "Mogan-Eymir akarsuların kendi getirdiği alüvyonlarla oluşur (alüvyal set). Kıyı set göllerinde ise set dalga ve kıyı kordonudur."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'nin Yer Şekilleri ve İklimi",
        "difficulty": 2,
        "prompt_text": "I. Çarşamba Ovası\nII. Elmalı Ovası\nIII. Tefenni Ovası\nIV. Erbaa Ovası\n\nYukarıda verilen ovalardan hangileri karstik erime sonucu oluşmuş 'polye' (karstik ova) niteliğindedir?",
        "options": [
            "I ve IV",
            "II ve III",
            "I ve III",
            "II ve IV",
            "III ve IV"
        ],
        "correctIndex": 1,
        "explanation": "Polye ovaları (karstik ovalar) TAKKE şifresiyle hatırlanır: Tefenni, Acıpayam, Korkuteli, Kestel, Elmalı, Muğla ovaları. Dolayısıyla II (Elmalı) ve III (Tefenni) polyedir. Çarşamba deltadır; Erbaa ise Kuzey Anadolu Fay Hattı üzerindeki tektonik çöküntü ovasıdır.",
        "distractor_trap": "ÖSYM TAKKE formülündeki polye ovalarını tektonik ovalarla karıştırmanızı bekler. Tefenni ve Elmalı kesinlikle karstik polyedir."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'nin Yer Şekilleri ve İklimi",
        "difficulty": 2,
        "prompt_text": "Türkiye'de ormanların deniz seviyesinden başlayabildiği tek kıyı bölgesi Karadeniz Bölgesi'dir.\n\nKaradeniz Bölgesi'nde orman alt sınırının deniz seviyesinden (0 metre) başlayabilmesini sağlayan temel etken aşağıdakilerden hangisidir?",
        "options": [
            "Güneşlenme süresinin fazla olması",
            "Yıllık yağış miktarının fazla ve her mevsimin yağışlı (bağıl nemin yüksek) olması",
            "Karasallık şiddetinin yüksek olması",
            "Kuzey rüzgarlarına tamamen kapalı bulunması",
            "Kalkerli arazinin yaygın yer tutması"
        ],
        "correctIndex": 1,
        "explanation": "Orman ALT sınırını belirleyen temel faktör nem ve yağıştır. Karadeniz'de her mevsim yağışlı geçtiği ve bağıl nem yüksek olduğu için ağaçlar sıfır metreden itibaren yetişir. Akdeniz'de ise yaz kuraklığı yüzünden orman alt sınırı deniz seviyesinden değil, makilerden sonra (yaklaşık 600-800 m) başlar.",
        "distractor_trap": "Orman ÜST sınırını sıcaklık (enlem/yükselti) belirlerken; orman ALT sınırını nem ve yağış belirler! Bu ayrım ÖSYM'nin en sevdiği sorular arasındadır."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'nin Yer Şekilleri ve İklimi",
        "difficulty": 2,
        "prompt_text": "Türkiye'de dağların zirvelerinde veya kıyılarında dalga aşındırmasıyla oluşan yeryüzü şekilleri bulunmaktadır.\n\nBuna göre kıyı kordonunun bir adayı karaya bağlamasıyla oluşan 'saplı ada' (tombolo) oluşumunun Türkiye'deki en tipik iki örneği aşağıdakilerden hangisinde birlikte verilmiştir?",
        "options": [
            "Kapıdağ Yarımadası — Sinop İnceburun",
            "Gelibolu Yarımadası — Datça Yarımadası",
            "Bozburun — Çeşme Yarımadası",
            "Biga Yarımadası — Bodrum Yarımadası",
            "Dilek Yarımadası — Karaburun"
        ],
        "correctIndex": 0,
        "explanation": "Dalgaların kıyı boyunca taşıdığı kumulların kıyıya yakın bir adayı anakaraya bağlamasıyla oluşan şekle 'tombolo' (saplı ada) denir. Türkiye'deki en belirgin tombolo örnekleri Marmara Denizi'ndeki Kapıdağ Yarımadası ve Sinop Boztepe/İnceburun Yarımadası'dır.",
        "distractor_trap": "Kapıdağ ve Sinop yarımadaları aslında eskiden birer ada iken dalga biriktirmesi (tombolo) ile karaya bağlanmıştır."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'nin Yer Şekilleri ve İklimi",
        "difficulty": 2,
        "prompt_text": "Türkiye'de akarsuların hidroelektrik enerji potansiyeli bölgelere göre büyük farklılıklar gösterir.\n\nAşağıdaki akarsulardan hangisinin üzerinde hidroelektrik enerji üretimi amacıyla büyük barajlar kurulması topoğrafik şartlar nedeniyle diğerlerine göre daha az uygundur?",
        "options": [
            "Fırat Nehri",
            "Çoruh Nehri",
            "Ergene Nehri",
            "Dicle Nehri",
            "Manavgat Çayı"
        ],
        "correctIndex": 2,
        "explanation": "Ergene Nehri Marmara Bölgesi'nde (Trakya) yükseltisi 100 metreyi bile bulmayan çok düz bir tabanda, menderesler çizerek yavaş akar. Yatak eğimi ve akış hızı çok düşük olduğundan hidroelektrik enerji potansiyeli neredeyse sıfırdır.",
        "distractor_trap": "Fırat, Çoruh ve Dicle yüksek debili ve dik vadili nehirlerdir. Ergene ise Türkiye'de akış hızı ve eğimi en az olan nehirlerdendir."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'nin Yer Şekilleri ve İklimi",
        "difficulty": 2,
        "prompt_text": "Türkiye'de kurak ve yarı kurak bölgelerde ilkbaharda yeşerip yaz kuraklığıyla sararan ot topluluklarına bozkır (step) adı verilir. Bozkır alanlarında yer yer antropojen bozkırlara da rastlanır.\n\n'Antropojen bozkır' kavramı aşağıdakilerden hangisini ifade eder?",
        "options": [
            "Yüksek dağ zirvelerinde soğuktan ötürü ağaç yetişmeyen alanları",
            "Ormanların insanlar tarafından tahrip edilmesi sonucu ağaçsız kalan yerlerde oluşan otsu örtüyü",
            "Tuzlu bataklık çevrelerinde yetişen kurakçıl bitkileri",
            "Akdeniz'de kızılçamların yanmasıyla çıkan bodur çalıları",
            "Volkanik arazilerde lav akıntılarının soğumasıyla oluşan bitki örtüsünü"
        ],
        "correctIndex": 1,
        "explanation": "İç Anadolu, Doğu Anadolu ve Ergene gibi karasal bölgelerde geçmişte var olan ormanların aşırı otlatma, yakılma ve tarla açma amacıyla insanlar (antropo) tarafından tahrip edilmesi sonucu yerini alan bozkırlara 'antropojen bozkır' denir.",
        "distractor_trap": "Maki Akdeniz ormanlarının tahribiyle; psödömaki Karadeniz ormanlarının tahribiyle; antropojen bozkır ise karasal iç kesim ormanlarının insan tahribiyle oluşur."
    },

    # -------------------------------------------------------------
    # TEST 4: NET SIÇRATAN / KURTLAR SOFRASI (Zorluk: 3) - Sorular 31-40
    # -------------------------------------------------------------
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'nin Yer Şekilleri ve İklimi",
        "difficulty": 3,
        "prompt_text": "Türkiye'de akarsuların denge profiline ulaşmadığının en somut kanıtlarından biri vadilerinde görülen aşındırma basamakları ve mendereslerin içerisindeki gömük vadilerdir.\n\nEge Bölgesi'ndeki Büyük Menderes akarsuyu geniş tabanlı bir vadide kıvrımlar yaparak akarken, bazı kısımlarında yatağını derine doğru kazarak 'gömük menderes' (epijenik vadi) profili kazanmıştır.\n\nBir akarsuyun menderes çizerken yeniden derine aşındırma yapmaya başlaması aşağıdakilerden hangisinin gerçekleştiğinin kesin kanıtıdır?",
        "options": [
            "Bölgede ani bir iklim değişikliğiyle yağışların kuraklaşmasının",
            "Akarsu havzasının epirojenik hareketlerle toptan yükselmesinin (taban seviyesinin düşmesinin)",
            "Havzada rüzgar erozyonunun şiddetlenmesinin",
            "Akarsuyun kapalı bir göle dökülmeye başlamasının",
            "Kıta sahanlığının genişleyerek denizin sığlaşmasının"
        ],
        "correctIndex": 1,
        "explanation": "Menderes çizen bir akarsu taban seviyesine yaklaşmış demektir. Eğer menderes büklümleri korunarak vadi derine doğru yarılmaya başlıyorsa (gömük menderes / yarma vadi), arazi epirojenik olarak toptan yükselmiş (veya deniz seviyesi alçalmış), böylece akarsuyun aşındırma enerjisi yeniden canlanmıştır.",
        "distractor_trap": "Menderes görünce adaylar arazinin sadece düz olduğunu düşünür. Gömük menderes ise arazinin toptan yükseldiğinin (epirojenez) en güçlü jeomorfolojik delilidir."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'nin Yer Şekilleri ve İklimi",
        "difficulty": 3,
        "prompt_text": "Karadeniz kıyı kuşağında yer almalarına rağmen Rize ile Sinop arasında yıllık yağış miktarı bakımından yaklaşık 3 kat fark (Rize ~2300 mm, Sinop ~700 mm) bulunmaktadır.\n\nSinop'un Rize'ye göre belirgin şekilde daha az yağış almasının temel morfolojik nedeni aşağıdakilerden hangisidir?",
        "options": [
            "Sinop'un mutlak konum olarak daha batıda yer alması",
            "Sinop gerisindeki Küre Dağları'nın kıyıya dik uzanması",
            "Sinop gerisindeki İsfendiyar (Küre) Dağları'nın yükseltisinin Rize'deki Kaçkar Dağları'na göre çok daha basık olması ve nemli rüzgarları tutamaması",
            "Sinop'ta hakim rüzgar yönünün yalnızca güney sektörlü olması",
            "Sinop'ta bitki örtüsünün bozkır özelliği göstermesi"
        ],
        "correctIndex": 2,
        "explanation": "Rize'nin arkasındaki Kaçkar Dağları hemen kıyıdan dimdik yükselir ve 4000 metreye yaklaşan heybetiyle denizden gelen tüm nemi yamaç yağışına dönüştürür. Sinop gerisindeki Küre Dağları ise kıyıdan daha içeride başlar ve yükseltisi Kaçkarların yarısı kadardır; bu yüzden hava kütleleri yükselip yoğunlaşamadan iç kesimlere süzülür.",
        "distractor_trap": "Küre Dağları kıyıya dik uzanmaz (paraleldir). Az yağışın nedeni dağların uzanış yönü değil; basık olması ve kıyı gerisindeki yükseltinin Kaçkarlar kadar olmamasıdır."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'nin Yer Şekilleri ve İklimi",
        "difficulty": 3,
        "prompt_text": "Aşağıdaki göllerden hangisi hem tektonik hareketlerle çöken bir graben tabanında yer almakta hem de göl tabanından çıkan ve göle karışan karstik düden ve kaynaklarla beslenip boşalan 'tektono-karstik' karma yapılı bir göldür?",
        "options": [
            "Meke Gölü",
            "Nemrut Gölü",
            "Eğirdir ve Beyşehir Gölleri",
            "Terkos Gölü",
            "Tortum Gölü"
        ],
        "correctIndex": 2,
        "explanation": "Göller Yöresi'nde bulunan Beyşehir ve Eğirdir gölleri, tektonik çöküntü havzaları üzerinde oluşmuş olmalarına karşın kalker arazideki düdenler, yer altı kaynakları ve karstik erimelerle şekillenmiş karma yapılı (tektono-karstik) göllerdir.",
        "distractor_trap": "Göller Yöresi gölleri sadece tektonik veya sadece karstik olarak etiketlenemez; ÖSYM bunların karma (tektono-karstik) oluşumlu olduğunu sınar."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'nin Yer Şekilleri ve İklimi",
        "difficulty": 3,
        "prompt_text": "Türkiye'de kış mevsiminde kar örtüsünün yerde kalma süresi ve kar kalınlığı bölgeler arasında büyük tezatlar oluşturur.\n\nAşağıdaki merkezlerden hangisinde kışın kar örtüsünün yerde kalma süresinin en uzun olması beklenir?",
        "options": [
            "Bolu (1000 m)",
            "Kastamonu (800 m)",
            "Ardahan (1800 m)",
            "Konya (1020 m)",
            "Kayseri (1050 m)",
        ],
        "correctIndex": 2,
        "explanation": "Ardahan, Kuzeydoğu Anadolu'da yaklaşık 1800 metre rakımda yer alan sert karasal iklim merkezidir. Sibirya Yüksek Basıncı'nın doğrudan etkisi altında kaldığı için kış sıcaklıkları -30°C'lere iner ve kar örtüsü yılda 120-150 gün yerde kalır.",
        "distractor_trap": "Konya ve Bolu soğuk olsa da Ardahan ve Kars'ın sert karasal yüksek platosu Türkiye'de karın yerde en uzun süre kaldığı sahadır."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'nin Yer Şekilleri ve İklimi",
        "difficulty": 3,
        "prompt_text": "Güneydoğu Anadolu Bölgesi'nin yıllık yağış miktarı (yaklaşık 500-600 mm), İç Anadolu Bölgesi'nin yıllık yağış miktarından (yaklaşık 350-400 mm) belirgin şekilde daha fazladır.\n\nBuna rağmen Güneydoğu Anadolu Bölgesi'nde kuraklığın ve tarımsal sulama ihtiyacının İç Anadolu'dan çok daha şiddetli hissedilmesinin temel nedeni aşağıdakilerden hangisidir?",
        "options": [
            "Güneydoğu'da tarım alanlarının daha geniş yer kaplaması",
            "Güneydoğu'nun yazın Basra Termik Alçak Basıncı ve Samyeli etkisiyle aşırı sıcak olması ve potansiyel buharlaşmanın yağışın katbekat üzerine çıkması",
            "İç Anadolu'da yer altı su seviyesinin yüzeye çok yakın olması",
            "Güneydoğu Anadolu'da akarsu bulunmaması",
            "Güneydoğu'da kış aylarında kar yağışının hiç görülmemesi"
        ],
        "correctIndex": 1,
        "explanation": "Güneydoğu Anadolu İç Anadolu'dan daha çok yağış almasına rağmen, yazın güneyden gelen Samyeli (Keşişleme) rüzgarı ve Basra Termik Alçak Basıncı'nın etkisiyle Türkiye'nin en yüksek yaz sıcaklıklarına ve en şiddetli buharlaşma oranına (şiddetli kuraklığa) maruz kalır.",
        "distractor_trap": "En az yağış alan yer İç Anadolu (Konya/Tuz Gölü çevresi) olmasına rağmen, en şiddetli buharlaşma ve kuraklık Güneydoğu Anadolu'dadır."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'nin Yer Şekilleri ve İklimi",
        "difficulty": 3,
        "prompt_text": "I. Çukurova Deltası'nda kış ılıklığı sayesinde yılda birden fazla ürün alınabilmesi\nII. Ergene Havzası'nda kışların don olaylı ve sisli geçmesi\nIII. Doğu Karadeniz Dağları'nın kuzey yamaçlarının güney yamaçlarına göre daha yoğun orman örtüsüne sahip olması\n\nYukarıdaki durumlardan hangileri 'bakı' faktörünün iklim ve bitki örtüsü üzerindeki genel kuralıyla ÇELİŞKİLİ bir durum ortaya koyar?",
        "options": [
            "Yalnız I",
            "Yalnız III",
            "I ve II",
            "II ve III",
            "I, II ve III"
        ],
        "correctIndex": 1,
        "explanation": "Normal bakı kuralına göre Kuzey Yarım Küre'de dağların güney yamaçları daha çok güneş alır, daha sıcaktır ve ağaç üst sınırı daha yüksektir. Ancak Karadeniz'de kuzey yamaçlar denize baktığı için nem ve yağış alır ve ormanlar kuzey yamaçta güneye göre çok daha gürdür. Bu durum bakı kuralına ters düşen denizellik-nemlilik istisnasıdır.",
        "distractor_trap": "ÖSYM Karadeniz dağlarının kuzey yamacının daha gür ormanla kaplı olmasını 'bakı kuralı ile açıklanamayan denizellik istisnası' olarak sıkça sorar."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'nin Yer Şekilleri ve İklimi",
        "difficulty": 3,
        "prompt_text": "Türkiye'de relikt (kalıntı) ve endemik bitki türleri zengin bir çeşitlilik sunar. Jeolojik geçmişteki iklim koşullarından günümüze ulaşan kalıntı türlere 'relikt bitki' denir.\n\nAşağıdakilerden hangisi Türkiye'de buzul ve buzul arası dönemlerin iklim koşullarından günümüze kadar ulaşmış relikt bir bitki örneğidir?",
        "options": [
            "Köknar ve ladin ormanlarının Karadeniz dışındaki Amanos ve Toros vadilerinde kalıntı olarak yaşaması",
            "İç Anadolu'daki geven ve sığırkuyruğu otları",
            "Ege kıyılarındaki zeytinlikler",
            "Güneydoğu Anadolu'daki fıstık ağaçları",
            "Trakya'daki ayçiçeği tarlaları"
        ],
        "correctIndex": 0,
        "explanation": "Buzul çağlarında Anadolu'nun güneyine kadar inen soğuk ve nemli iklim bitkileri (kayın, ıhlamur, göknar), iklim ısındıktan sonra Toroslar ve Amanos dağlarının serin ve nemli derin kanyonlarında varlıklarını sürdürerek 'relikt' (kalıntı) olarak kalmıştır.",
        "distractor_trap": "Endemik bitki dünyada sadece tek bir dar alanda yetişen türdür (Köyceğiz'de Sığla ağacı, Göller Yöresinde Kasnak meşesi). Relikt ise geçmiş iklimlerin kalıntısıdır."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'nin Yer Şekilleri ve İklimi",
        "difficulty": 3,
        "prompt_text": "Türkiye arazisinde yer alan plato ve ova yüzeylerinde görülen toprak tipleri değerlendirildiğinde;\n\n• Eski göl tabanlarında veya killi arazilerde kurak dönemde yarılan, yağışlı dönemde şişerek içindeki taşları yüzeye fırlatan 'dönen toprak' (vertisol / karakepir),\n• Genellikle volkanik tüf ve kumlu depolar üzerinde gelişen, tarımsal olarak patates ve yumrulu bitki yetiştiriciliğine çok uygun olan 'regosol'\ntopraklar en karakteristik olarak sırasıyla hangi yörelerimizde yaygındır?",
        "options": [
            "Ergene Havzası — Nevşehir-Kapadokya Yöresi",
            "Taşeli Platosu — Çukurova",
            "Bafra Deltası — Sivas Havzası",
            "Konya Ovası — Rize Kıyıları",
            "Menteşe Yöresi — Erzurum Platosu"
        ],
        "correctIndex": 0,
        "explanation": "Vertisoller (dönen toprak / kepir / taş doğuran), killi depoların bulunduğu Trakya (Ergene Havzası), Muş Ovası ve Konya kapalı havzasında yaygındır. Volkanik tüf ve kum üzerinde gelişen aşırı geçirgen regosoller ise Nevşehir, Niğde ve Ürgüp yöresinde yaygın olup patates tarımı için çok elverişlidir.",
        "distractor_trap": "Vertisol = Ergene ve kepir; Regosol = Nevşehir volkanik tüfleri ve patates! Bu iki toprak ÖSYM'nin zor soru bankasının vazgeçilmezidir."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'nin Yer Şekilleri ve İklimi",
        "difficulty": 3,
        "prompt_text": "Türkiye'de karstik arazilerde yer altı su seviyesinin tabana inmesiyle mağara tavanlarının aniden çökmesi sonucu devasa derinlikte çukurlar (obruk) meydana gelir.\n\nSon yıllarda Konya-Karapınar ve Obruk Platosu çevresinde obruk oluşumlarının olağanüstü hızlanmasının temel beşeri ve hidrolojik sebebi aşağıdakilerden hangisidir?",
        "options": [
            "Bölgede orman varlığının aşırı derecede artması",
            "Aşırı ve kaçak yer altı suyu çekimiyle taban suyunun hızla boşalması ve mağara tavanlarının dayanıksızlaşması",
            "Tuz Gölü'nün taşarak bölgeyi sular altında bırakması",
            "Bölgede sık sık volkanik magma patlamaları yaşanması",
            "Karasal iklimin yerini tropikal muson iklimine bırakması"
        ],
        "correctIndex": 1,
        "explanation": "Konya kapalı havzasında yoğun su tüketen sanayi bitkilerinin (şeker pancarı, mısır, yonca) ekiminin artması sebebiyle yüz binlerce kaçak kuyuyla yer altı suları aşırı çekilmiştir. Boşalan karstik mağara tavanları üstündeki toprağı taşıyamayarak çökmekte ve tarım arazilerinde tehlikeli obruklar açılmaktadır.",
        "distractor_trap": "Doğal obruklar binlerce yılda oluşurken, günümüzdeki patlama tamamen bilinçsiz tarımsal sulama ve taban suyunun tüketilmesi kaynaklıdır."
    },
    {
        "lesson": "Coğrafya",
        "topic": "Türkiye'nin Yer Şekilleri ve İklimi",
        "difficulty": 3,
        "prompt_text": "I. Çoruh Nehri\nII. Zap Suyu\nIII. Asi Nehri\nIV. Meriç Nehri\n\nYukarıdaki akarsulardan hangileri Türkiye sınırları içinde doğup ülke sınırlarını aşarak yabancı bir devletin denizine veya körfezine dökülen nehirler grubundadır?",
        "options": [
            "I ve II",
            "III ve IV",
            "I ve III",
            "II ve IV",
            "I, II ve III"
        ],
        "correctIndex": 0,
        "explanation": "Çoruh Nehri Türkiye'den doğar ve Gürcistan'dan Karadeniz'e dökülür. Zap Suyu Hakkari'den doğar ve Irak'a geçerek Dicle'ye karışır (Fırat, Dicle, Aras, Kura da böyledir). Buna karşılık Asi (Lübnan/Suriye'den doğar) ve Meriç (Bulgaristan'dan doğar) sınır dışından Türkiye'ye giren nehirlerdir.",
        "distractor_trap": "ÖSYM sınır aşan akarsularda yönü sınar: 'Bizden doğup dışarı gidenler' (Fırat, Dicle, Çoruh, Aras, Kura, Zap) vs 'Dışarıdan doğup bize gelenler' (Asi, Meriç)."
    }
]
