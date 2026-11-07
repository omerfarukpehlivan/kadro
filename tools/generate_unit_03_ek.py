# -*- coding: utf-8 -*-
import json
import os
import sys

# TASK-T3: Osmanlı Kültür ve Uygarlığı için 60 Yeni Özgün Soru (Test 5, 6, 7, 8, 9, 10)
# Bu ünite KPSS'de en çok sorunun (ortalama 3-4 soru) geldiği omurga ünitedir.
# Dağılım:
# Test 5 (Sorular 41-50): Devlet Yönetimi, Veraset Sistemi, Hükümdarlık Alametleri & Saray Teşkilatı
# Test 6 (Sorular 51-60): Divan-ı Hümayun Üyeleri, Bürokrasi Kalemleri ve Seyfiye-İlmiye-Kalemiye
# Test 7 (Sorular 61-70): Taşra Teşkilatı, Eyaletler (Salyaneli, Salyanesiz, İmtiyazlı) ve Görevliler
# Test 8 (Sorular 71-80): Toprak Sistemi (Dirlik/Has-Zeamet-Tımar, Mülk, Vakıf) ve Vergi Türleri
# Test 9 (Sorular 81-90): Osmanlı Ordusu (Kapıkulu Ocağı, Tımarlı Sipahiler, Yardımcı Kuvvetler & Donanma)
# Test 10 (Sorular 91-100): Hukuk Sistemi, Eğitim (Medreseler), Lonca/İktisat ve Sanat/Bilim Adamları

questions = [
    # --- TEST 5 (41-50): Devlet Yönetimi, Veraset & Saray Teşkilatı ---
    {
        "difficulty": 2,
        "prompt_text": "Osmanlı Devleti'nde merkezi otoriteyi güçlendirmek ve taht kavgalarını önlemek amacıyla veraset sisteminde dönem dönem köklü değişiklikler yapılmıştır.\n\nBuna göre, 'Ülke hükümdar ve oğullarının malıdır' kuralını getirerek hanedanın diğer üyelerinin (amca, kardeş çocukları vb.) tahta ortak olmasını ilk kez engelleyen Osmanlı padişahı aşağıdakilerden hangisidir?",
        "options": ["Osman Bey", "I. Murat", "Fatih Sultan Mehmet", "I. Ahmet", "II. Mahmut"],
        "correctIndex": 1,
        "explanation": "Osman Gazi döneminde 'Ülke hanedanın ortak malıdır' kuralı geçerli iken; I. Murat taht kavgalarını azaltmak ve merkezi otoriteyi pekiştirmek için 'Ülke hükümdar ve oğullarınındır' anlayışını getirmiştir.",
        "distractor_trap": "Fatih Sultan Mehmet 'Ülke padişahın malıdır' ve Kardeş Katli kanununu getirmiştir; I. Ahmet ise 'Ekber ve Erşed' sistemini getirmiştir. 'Hükümdar ve oğulları' kuralı I. Murat'a aittir."
    },
    {
        "difficulty": 2,
        "prompt_text": "I. Ahmet döneminde getirilen ve hanedanın en yaşlı ve en olgun üyesinin tahta geçmesini öngören 'Ekber ve Erşed' sisteminin Osmanlı devlet idaresindeki en olumsuz sonucu aşağıdakilerden hangisidir?",
        "options": [
            "Taht kavgalarını tamamen artırması",
            "Şehzadelerin sancağa çıkma usulünün kaldırılarak 'Kafes Usulü'ne geçilmesi ve yönetim tecrübesinden yoksun padişahların tahta çıkması",
            "Divan-ı Hümayun'un yetkilerinin sınırlandırılması",
            "Yeniçeri Ocağı'nın kaldırılması",
            "Veraset sisteminin belirsiz hale gelmesi"
        ],
        "correctIndex": 1,
        "explanation": "Ekber ve Erşed sistemi taht kavgalarını hukuken sona erdirmiş ancak şehzadelerin sancağa gönderilmeyip sarayda kafes hayatı yaşamasına yol açmıştır. Bu durum halkı ve orduyu tanımayan, psikolojisi bozuk ve tecrübesiz hükümdarların tahta çıkmasına sebep olmuştur.",
        "distractor_trap": "Ekber ve Erşed taht kavgalarını artırmamış, aksine tahta kimin geçeceğini kesinleştirerek taht kavgalarını BİTİRMİŞTİR. Olumsuz yönü şehzadelerin tecrübesiz kalmasıdır."
    },
    {
        "difficulty": 2,
        "prompt_text": "Osmanlı Devleti'nde şehzadelerin sancaklara yönetici olarak gönderildiği dönemde, onları devlet yönetimi, askerlik ve teşkilat konularında yetiştiren tecrübeli devlet adamlarına ne ad verilirdi?",
        "options": ["Lala", "Atabey", "İnal", "Subaşı", "Kadı"],
        "correctIndex": 0,
        "explanation": "Osmanlı'da şehzade eğitmenine 'Lala' denirdi. Şehzade tahta çıktığında lalası da genellikle vezir veya danışman olarak yüksek makamlara getirilirdi.",
        "distractor_trap": "Selçuklu'da Atabey, İslam öncesinde İnal/Ataman, Osmanlı'da ise Lala'dır."
    },
    {
        "difficulty": 2,
        "prompt_text": "Aşağıdaki şehirlerden hangisi Osmanlı Devleti'nde şehzadelerin sancak eğitimi aldığı 'Şehzade Sancakları' arasında yer almaz?",
        "options": ["Amasya", "Manisa", "Trabzon", "Kütahya", "Diyarbakır"],
        "correctIndex": 4,
        "explanation": "Diyarbakır bir eyalet merkezidir ancak şehzade sancağı olmamıştır. Amasya, Manisa (Darü's-Saltana), Trabzon, Kütahya, Balıkesir, Kastamonu, Kefe önemli şehzade sancaklarındandır.",
        "distractor_trap": "Amasya ve Manisa en bilinenleridir; Kefe ise Anadolu dışındaki tek şehzade sancağıdır (Kırım'da). Diyarbakır şehzade sancağı değildir."
    },
    {
        "difficulty": 3,
        "prompt_text": "Osmanlı Devleti'nde şehzadelerin sancağa çıktığı merkezler genellikle Anadolu'da yer almıştır.\n\nAnadolu dışında yer alan ve Kanuni Sultan Süleyman'ın da bir dönem sancak beyliği yaptığı tek Rumeli/Kırım şehzade sancağı aşağıdakilerden hangisidir?",
        "options": ["Kefe", "Belgrad", "Selanik", "Manastır", "Üsküp"],
        "correctIndex": 0,
        "explanation": "Kırım yarımadasında bulunan 'Kefe', Anadolu dışındaki yegane şehzade sancağıdır. Kanuni Sultan Süleyman babası Yavuz'un taht mücadelesi sırasında Kefe sancak beyliği yapmıştır.",
        "distractor_trap": "ÖSYM'nin en popüler tuzak bilgisidir: 'Anadolu dışındaki tek şehzade sancağı Kefe'dir.'"
    },
    {
        "difficulty": 2,
        "prompt_text": "Fatih Sultan Mehmet'in İstanbul'un fethinden sonra inşa ettirdiği ve yaklaşık 400 yıl boyunca Osmanlı Devleti'nin idare merkezi ve padişahların ikametgahı olan Topkapı Sarayı'nın bölümleri arasında aşağıdakilerden hangisi yer almaz?",
        "options": ["Birun (Dış Saray)", "Enderun (İç Saray)", "Harem", "Bab-ı Ali (Hükümet Konağı)", "Kubbealtı"],
        "correctIndex": 3,
        "explanation": "Topkapı Sarayı üç ana bölümden oluşur: Birun (dış saray), Enderun (iç saray ve mektep) ve Harem (padişahın özel aile hayatı). Bab-ı Ali ise 18. yüzyıldan itibaren sadrazam konağı (hükümet binası) olarak sarayın dışında ayrı bir binadır.",
        "distractor_trap": "Bab-ı Ali sarayın bir parçası değildir; Sadrazamın makamı ve Osmanlı hükümet merkezidir."
    },
    {
        "difficulty": 2,
        "prompt_text": "Topkapı Sarayı'nda devşirme kökenli yetenekli Hristiyan çocukların üstün bir eğitimden geçirilerek sadrazam, vezir, beylerbeyi ve ordu komutanı olarak yetiştirildiği saray mektebi aşağıdakilerden hangisidir?",
        "options": ["Enderun Mektebi", "Mekteb-i Maarif-i Adliye", "Darülfünun", "Mülkiye Mektebi", "Medrese"],
        "correctIndex": 0,
        "explanation": "II. Murat döneminde temelleri atılan ve Fatih Sultan Mehmet tarafından kurumsallaştırılan Enderun Mektebi, Osmanlı bürokrasisinin ve yönetici elitinin yetiştirildiği saray üniversitesidir.",
        "distractor_trap": "Medreselerde sadece Müslüman doğumlu öğrenciler eğitim görür ve ilmiye sınıfı (kadı, müderris) yetişir; devlet adamı ve paşa yetiştiren saray okulu ise devşirmelerin alındığı Enderun'dur."
    },
    {
        "difficulty": 2,
        "prompt_text": "Osmanlı Devleti'nde padişahın mutlak otoritesini ve yasama yetkisini kullandığını gösteren belgeler arasında aşağıdakilerden hangisi yer almaz?",
        "options": ["Ferman", "Berat", "Hatt-ı Hümayun", "Kanunname", "Fetva"],
        "correctIndex": 4,
        "explanation": "Fetva padişaha ait bir yetki belgesi değildir; Şeyhülislam veya müftüler tarafından verilen, bir işin veya kanunun İslam dinine uygun olup olmadığını belirten dini görüştür (İlmiye yetkisidir). Ferman, berat, adaletname, hatt-ı hümayun ve kanunname ise padişahın bizzat çıkardığı ferman ve yasalardır.",
        "distractor_trap": "Padişah dini fetva VEREMEZ. Şeyhülislam fetva verir, padişah ise ferman çıkarır."
    },
    {
        "difficulty": 2,
        "prompt_text": "Osmanlı Devleti'nde padişahların göreve başladıklarında Eyüp Sultan Türbesi'nde şeyhülislam veya nakibüleşraf tarafından gerçekleştirilen, hükümdarın beline kılıç kuşanarak meşruiyetini tescil ettirdiği geleneksel merasime ne ad verilirdi?",
        "options": ["Kılıç Alayı", "Cülus Töreni", "Hırka-i Şerif Ziyareti", "Surre Alayı", "Cuma Selamlığı"],
        "correctIndex": 0,
        "explanation": "Osmanlı padişahları tahta çıktıklarında Eyüp Sultan Türbesi'ne gider ve burada 'Kılıç Alayı' (Kılıç Kuşanma Merasimi) icra edilirdi. Bu tören Batı krallarının taç giyme töreninin Osmanlı'daki karşılığıdır.",
        "distractor_trap": "Cülus tahta çıkış anı ve bahşişin dağıtıldığı törendir; kılıcın kuşanıldığı geleneksel merasim ise Kılıç Alayı'dır."
    },
    {
        "difficulty": 2,
        "prompt_text": "Osmanlı Devleti'nde hükümdarın değişmesiyle birlikte yeniçerilere, kapıkulu sipahilerine ve saray görevlilerine tahta çıkış şerefine ödenen bir defalık nakit bahşişe ne ad verilirdi?",
        "options": ["Ulufe", "Cülus Bahşişi", "Hilat", "Avarız", "İane-i Cihadiye"],
        "correctIndex": 1,
        "explanation": "Cülus bahşişi padişah her tahta çıktığında askerlere ödenen bahşiştir. Yıldırım Bayezid döneminde gelenekleşmiş, Fatih Kanunnamesi ile yasal hale gelmiş, I. Abdülhamit döneminde ise kaldırılmıştır.",
        "distractor_trap": "Ulufe yeniçerilerin her 3 ayda bir aldıkları düzenli maaştır; Cülus ise sadece taht değiştiğinde bir defa ödenen bahşiştir."
    },

    # --- TEST 6 (51-60): Divan-ı Hümayun & Yönetici Sınıflar ---
    {
        "difficulty": 2,
        "prompt_text": "Orhan Bey döneminde kurulan, Fatih dönemine kadar padişahın başkanlık ettiği, Fatih'ten itibaren ise sadrazamların başkanlığında toplanan en üst devlet idare ve yargı organı aşağıdakilerden hangisidir?",
        "options": ["Divan-ı Hümayun", "Bab-ı Ali", "Encümen-i Daniş", "Heyet-i Ayan", "Darü'ş-Şura-yı Askeri"],
        "correctIndex": 0,
        "explanation": "Divan-ı Hümayun, Osmanlı'da devlet işlerinin görüşüldüğü, aynı zamanda halkın şikayetlerinin dinlendiği en yüksek karar ve temyiz organıdır.",
        "distractor_trap": "Bab-ı Ali 18. yüzyıldan itibaren hükümet konağıdır; Divan-ı Hümayun ise kurucu divandır."
    },
    {
        "difficulty": 2,
        "prompt_text": "Fatih Sultan Mehmet'in Divan-ı Hümayun toplantılarına bizzat başkanlık etmeyi bırakarak divan başkanlığını Sadrazama devretmesi ve görüşmeleri pencere arkasından (Kasr-ı Adil) izlemesinin temel gerekçesi aşağıdakilerden hangisidir?",
        "options": [
            "Devlet işlerinden tamamen el çekmek istemesi",
            "Divan üyelerinin padişahın huzurunda çekinmeden fikirlerini serbestçe ifade edebilmelerini sağlamak ve sadrazamın yürütme yetkisini artırmak",
            "Yeniçerilerin baskısına boyun eğmesi",
            "Şeyhülislamın divana katılmasını engellemek",
            "Sadrazamlık makamını tamamen sembolik hale getirmek"
        ],
        "correctIndex": 1,
        "explanation": "Fatih, üyelerin padişahın heybeti ve otoritesinden çekinmeden gerçek düşüncelerini tartışabilmeleri amacıyla divan başkanlığını sadrazama bırakmıştır. Padişah kubbealtındaki 'Kasr-ı Adil' adı verilen kafesli parmaklık arkasından divanı gizlice dinlemiştir.",
        "distractor_trap": "Bu durum padişahın yetkilerini devrettiği anlamına gelmez; divan bir karar organından çok danışma kuruluna dönüşmüş, son onay yine padişahta kalmıştır."
    },
    {
        "difficulty": 2,
        "prompt_text": "Padişahın mutlak vekili olan, padişahın mührünü (Mühr-i Hümayun) taşıyan ve ordu başında sefere çıktığında 'Serdar-ı Ekrem' unvanını alan Divan-ı Hümayun üyesi kimdir?",
        "options": ["Sadrazam (Veziriazam)", "Şeyhülislam", "Kaptanıderya", "Kazasker", "Nişancı"],
        "correctIndex": 0,
        "explanation": "Sadrazam padişahtan sonraki en yetkili kişidir. Padişah sefere çıkmadığında orduyu 'Serdar-ı Ekrem' unvanıyla komuta eder.",
        "distractor_trap": "Vezirler sadrazamın yardımcılarıdır; mutlak vekil olan tek kişi Sadrazamdır."
    },
    {
        "difficulty": 2,
        "prompt_text": "Divan-ı Hümayun'da adalet ve eğitim işlerinden sorumlu olan, kadıların ve müderrislerin atama ve görevden alma işlemlerini yürüten, divandaki büyük davaları karara bağlayan görevli kimdir?",
        "options": ["Kazasker (Kadıasker)", "Şeyhülislam", "Nişancı", "Defterdar", "Reisülküttap"],
        "correctIndex": 0,
        "explanation": "Kazasker (Kadıasker), adalet bakanı ve milli eğitim bakanı niteliğindedir. Rumeli ve Anadolu Kazaskeri olmak üzere iki tanedir. Kıdemli olan Rumeli Kazaskeri'dir.",
        "distractor_trap": "Şeyhülislam kadı atamaz! Kadı ve müderrisleri Kazasker atar. Şeyhülislam sadece kanunların dine uygunluğu hakkında 'fetva' verir."
    },
    {
        "difficulty": 2,
        "prompt_text": "Divan-ı Hümayun'da padişah fermanlarına hükümdarın tuğrasını çeken, fethedilen toprakların tahrir (kayıt) defterlerini tutarak tımar arazilerinin dağıtımını kaydeden görevli aşağıdakilerden hangisidir?",
        "options": ["Nişancı (Tevkii)", "Defterdar", "Reisülküttap", "Kazasker", "Yeniçeri Ağası"],
        "correctIndex": 0,
        "explanation": "Nişancı, belgelere padişahın tuğrasını çeker, tahrir defterlerini tutar ve örfi hukukun uzmanıdır. Dış işlerini yürüten Reisülküttap da 17. yüzyıl sonuna kadar Nişancı'ya bağlı bir katipti.",
        "distractor_trap": "Defterdar maliye ve bütçe defterlerine bakar; Tahrir ve tapu-kadastro defterlerini tutan ve tuğra çeken ise Nişancı'dır."
    },
    {
        "difficulty": 2,
        "prompt_text": "Osmanlı Devleti'nde 17. yüzyıl sonlarına kadar Nişancı'ya bağlı olarak çalışan, ancak devletin diplomasiye ve dış ilişkilere daha çok önem vermesiyle birlikte Divan'ın daimi üyesi ve günümüzün 'Dışişleri Bakanı' konumuna yükselen görevli kimdir?",
        "options": ["Reisülküttap", "Defterdar", "Kaptanıderya", "Çavuşbaşı", "Vekayi-nüvis"],
        "correctIndex": 0,
        "explanation": "Reisülküttaplık makamı, özellikle 1699 Karlofça Antlaşması sonrasında diplomasinin önem kazanmasıyla dışişleri bakanlığına dönüşmüş ve 19. yüzyılda Hariciye Nezareti adını almıştır.",
        "distractor_trap": "Reisülküttap önceleri Nişancı'nın katibiydi; diplomasinin öne çıkmasıyla bağımsız bir makam haline gelmiştir."
    },
    {
        "difficulty": 2,
        "prompt_text": "Osmanlı Devleti'nde yönetici zümre; Seyfiye (Kılıç Ehli / Askeri ve İdari), İlmiye (Din, Hukuk ve Eğitim) ve Kalemiye (Bürokrasi ve Maliye) olmak üzere üç sınıfa ayrılmıştır.\n\nBuna göre aşağıdaki eşleştirmelerden hangisi 'İlmiye' sınıfına mensuptur?",
        "options": [
            "Sadrazam - Beylerbeyi - Sancakbeyi",
            "Şeyhülislam - Kazasker - Kadı - Müderris",
            "Defterdar - Nişancı - Reisülküttap",
            "Yeniçeri Ağası - Subaşı - Kaptanıderya",
            "Tımarlı Sipahi - Silahtar - Sipahi"
        ],
        "correctIndex": 1,
        "explanation": "İlmiye sınıfı üyeleri medrese çıkışlı ve Müslüman Türk kökenli olmak zorundadır. Şeyhülislam, Kazasker, Kadı, Müderris, Kassam, İmam ve Müftüler ilmiye sınıfındadır.",
        "distractor_trap": "Kazasker isminde 'asker' geçmesine rağmen kesinlikle Seyfiye DEĞİLDİR; adalet ve eğitim işlerine baktığı için en yetkili İLMİYE sınıfı üyesidir."
    },
    {
        "difficulty": 2,
        "prompt_text": "Osmanlı yönetici sınıflarından 'Seyfiye' (Ehli Seyf) sınıfına mensup olan görevliler ile ilgili aşağıdaki ifadelerden hangisi yanlıştır?",
        "options": [
            "Yönetim ve askerlik işlerinden sorumludurlar.",
            "Sadrazam, vezirler, beylerbeyleri, sancakbeyleri ve yeniçeri ağası bu sınıftadır.",
            "Taşrada güvenliği sağlayan subaşılar seyfiye sınıfı içerisindedir.",
            "Bu sınıfa mensup olan görevlilerin tamamı medrese mezunu olmak zorundadır.",
            "Genellikle Enderun ve devşirme kökenli devlet adamlarından teşekkül etmiştir."
        ],
        "correctIndex": 3,
        "explanation": "Medrese mezunu olma şartı İlmiye sınıfı için geçerlidir. Seyfiye sınıfı ise genellikle devşirme kökenli olup Acemi Ocağı ve Enderun Mektebi'nde yetişirdi.",
        "distractor_trap": "Devşirmeler Seyfiye ve Kalemiye olabilir; fakat İlmiye (kadı, şeyhülislam, müderris) asla devşirme olamaz, mutlaka doğuştan Müslüman olmak zorundadır."
    },
    {
        "difficulty": 2,
        "prompt_text": "Divan-ı Hümayun'da alınan kararların kaydedildiği ve kanun maddelerinin gerekçeleriyle birlikte yazıldığı resmi divan tutanak defterlerine ne ad verilirdi?",
        "options": ["Mühimme Defterleri", "Tahrir Defterleri", "Şeriyye Sicilleri", "Tereke Defterleri", "Salname"],
        "correctIndex": 0,
        "explanation": "Divan-ı Hümayun'da görüşülen siyasi, askeri, idari ve hukuki tüm kararlar 'Mühimme Defterleri'ne kaydedilirdi. Bu defterler günümüzde Osmanlı arşivlerinin en kıymetli belgeleridir.",
        "distractor_trap": "Şeriyye Sicilleri kadıların mahkeme kararlarıdır; Tahrir nüfus ve toprak kaydıdır; Divan kararları ise Mühimme Defteri'ne yazılır."
    },
    {
        "difficulty": 2,
        "prompt_text": "Osmanlı Devleti'nde sadrazam sefere çıktığında başkentin asayişini ve yönetimini sağlamak üzere İstanbul'da kalan ve sadrazama vekalet eden görevliye ne ad verilirdi?",
        "options": ["Sadaret Kaymakamı", "Kethüda", "Mimarbaşı", "Şehremini", "Bostancıbaşı"],
        "correctIndex": 0,
        "explanation": "Sadrazam ordu başında sefere gittiğinde yerine başkentte 'Sadaret Kaymakamı' vekalet eder, hükümet ve başkent işlerini yürütürdü.",
        "distractor_trap": "Şehremini belediye başkanıdır; sadrazam vekili ise Sadaret Kaymakamı'dır."
    },

    # --- TEST 7 (61-70): Taşra Teşkilatı & Eyalet İdaresi ---
    {
        "difficulty": 2,
        "prompt_text": "Klasik Dönem Osmanlı taşra teşkilatının idari birimleri büyükten küçüğe doğru hiyerarşik olarak nasıl sıralanmıştır?",
        "options": [
            "Eyalet - Sancak - Kaza - Köy",
            "Eyalet - Kaza - Sancak - Köy",
            "Vilayet - Liva - Nahiye - Mahalle",
            "Sancak - Eyalet - Kaza - Köy",
            "Kaza - Eyalet - Sancak - Köy"
        ],
        "correctIndex": 0,
        "explanation": "Klasik dönemde Osmanlı taşra teşkilatı hiyerarşisi: Eyalet (Beylerbeyi yönetir) -> Sancak (Sancakbeyi yönetir) -> Kaza (Kadı yönetir) -> Köy (Köy Kethüdası yönetir).",
        "distractor_trap": "Kaza sancaktan küçük, köyden büyüktür. Kazanın yöneticisi doğrudan Kadı'dır."
    },
    {
        "difficulty": 2,
        "prompt_text": "Klasik dönem Osmanlı taşra teşkilatında 'Kaza' biriminin hem adli ve hukuki yargıcı hem de en üst düzey idari mülki amiri olan görevli kimdir?",
        "options": ["Kadı", "Subaşı", "Sancakbeyi", "Müderris", "Muhtesip"],
        "correctIndex": 0,
        "explanation": "Kazaları doğrudan 'Kadı' yönetirdi. Kadı kazada sadece hakim değil, aynı zamanda belediye başkanı, noter ve en üst mülki idareciydi.",
        "distractor_trap": "Subaşı kazanın güvenlik komutanıdır; idari ve hukuki amiri ise bizzat Kadı'dır."
    },
    {
        "difficulty": 3,
        "prompt_text": "Osmanlı Devleti'nde eyaletler mali yapılarına göre 'Salyaneli' (yıllıklı) ve 'Salyanesiz' (yıllıksız) olmak üzere ikiye ayrılmıştır.\n\nBuna göre Tımar sisteminin UYGULANMADIĞI, vergilerin 'İltizam Sistemi' (açık artırma yoluyla mültezimlere verilmesi) ile peşin toplandığı ve genellikle merkeze uzak Kuzey Afrika ve Arap coğrafyasındaki eyaletlere ne ad verilir?",
        "options": ["Salyaneli (Yıllıklı) Eyaletler", "Salyanesiz (Yıllıksız) Eyaletler", "Yurtluk-Ocaklık Eyaletleri", "İmtiyazlı Eyaletler", "Mukataa Eyaletleri"],
        "correctIndex": 0,
        "explanation": "Salyaneli (yıllıklı) eyaletler merkeze uzak olan Mısır, Trablusgarp, Tunus, Cezayir, Yemen ve Bağdat gibi eyaletlerdir. Buralarda tımar uygulanmaz; iltizam sistemiyle vergi toplanır ve yöneticilere maaş (salyane) ödenir.",
        "distractor_trap": "Tımar sisteminin uygulandığı eyaletler Salyanesiz'dir. İltizamın uygulandığı merkeze uzak eyaletler ise Salyaneli'dir."
    },
    {
        "difficulty": 2,
        "prompt_text": "Aşağıdaki eyaletlerden hangisi Tımar sisteminin eksiksiz uygulandığı 'Salyanesiz' (yıllıksız) eyaletlerden biri değildir?",
        "options": ["Rumeli Eyaleti", "Anadolu Eyaleti", "Karaman Eyaleti", "Sivas Eyaleti", "Mısır Eyaleti"],
        "correctIndex": 4,
        "explanation": "Mısır, merkeze uzak olduğu için Salyaneli (yıllıklı / iltizamlı) bir eyalettir. Rumeli, Anadolu, Karaman ve Sivas ise merkeze yakın olup Tımar sisteminin uygulandığı Salyanesiz eyaletlerdir.",
        "distractor_trap": "Mısır Salyaneli eyaletlerin en klasik sınav örneğidir."
    },
    {
        "difficulty": 2,
        "prompt_text": "Osmanlı Devleti'ne iç işlerinde serbest, dış işlerinde bağımlı olan, yöneticileri padişah fermanıyla onaylanan, ayrıcalıklı statüye sahip eyaletlere 'İmtiyazlı Eyaletler' denirdi.\n\nAşağıdaki imtiyazlı eyaletlerden hangisi ne devlete vergi öder ne de asker gönderirdi (tam muafiyet)?",
        "options": ["Hicaz Eyaleti", "Kırım Hanlığı", "Eflak Beyliği", "Boğdan Beyliği", "Erdel Prensliği"],
        "correctIndex": 0,
        "explanation": "Mekke ve Medine'yi kapsayan Hicaz bölgesi kutsal topraklar olduğu için Osmanlı Devleti Hicaz'dan ne asker almış ne de vergi toplamıştır; aksine her yıl Surre Alayları ile oraya para ve hediye göndermiştir.",
        "distractor_trap": "Kırım asker gönderir vergi vermezdi; Eflak ve Boğdan vergi verir asker vermezdi. Hicaz ise ne asker ne de vergi verirdi."
    },
    {
        "difficulty": 2,
        "prompt_text": "İmtiyazlı eyaletler içerisinde yer alan, Osmanlı ordusuna her savaşta yüz bine yakın mükemmel atlı süvari birliği gönderen ancak devlete yıllık nakit vergi ödemeyen hanlık aşağıdakilerden hangisidir?",
        "options": ["Kırım Hanlığı", "Hicaz Emirliği", "Eflak Beyliği", "Boğdan Beyliği", "Ramazanoğulları"],
        "correctIndex": 0,
        "explanation": "Kırım Hanlığı yöneticisi olan Giraylar, Cengiz Han soyundan geldikleri için Osmanlı protokolünde padişah ve sadrazamdan sonra gelirdi. Kırım orduya muazzam atlı süvari desteği sağlar, ancak nakit vergi ödemezdi.",
        "distractor_trap": "Kırım Hanlığı'nın askeri desteği Osmanlı'nın Doğu Avrupa fetihlerinde hayati önem taşımıştır."
    },
    {
        "difficulty": 2,
        "prompt_text": "Osmanlı taşra teşkilatında çarşı ve pazar yerlerini denetleyen, esnafın ürettiği malların kalitesini ve belirlenen azami satış fiyatı olan 'Narh' sistemine uyup uymadığını teftiş eden görevliye ne ad verilirdi?",
        "options": ["Muhtesip", "Subaşı", "Kadı", "Kapan Emini", "Beytülmal Emini"],
        "correctIndex": 0,
        "explanation": "Muhtesip, günümüzdeki belediye zabıtası ve maliye denetmeni yetkilerine sahip esnaf teftiş görevlisidir. Eksik tartan, hileli mal satan veya narh fiyatını aşan esnafa ceza keserdi.",
        "distractor_trap": "Kapan Emini şehre gelen tek cins malın (un, yağ, pamuk) toptancı halindeki dağıtımını yapar; pazarı denetleyen ise Muhtesip'tir."
    },
    {
        "difficulty": 2,
        "prompt_text": "Taşrada ve sınırlarda yer alan, gelirleri kale muhafızlarına ve tersane giderlerine tahsis edilen 'Miri' arazi türü aşağıdakilerden hangisidir?",
        "options": ["Ocaklık", "Yurtluk", "Mukataa", "Paşmaklık", "Malikane"],
        "correctIndex": 0,
        "explanation": "Geliri kale muhafızlarına ve tersane giderlerine ayrılan topraklara 'Ocaklık' denir. Geliri sınır boylarını koruyan akıncılara verilen topraklara ise 'Yurtluk' adı verilir.",
        "distractor_trap": "Ocaklık kale/tersane için, Yurtluk sınır güvenliği içindir. Birbirinin çeldiricisi olarak çok sık kullanılır."
    },
    {
        "difficulty": 2,
        "prompt_text": "Gelirleri doğrudan devlet hazinesine (Hazine-i Amire) aktarılan, genellikle iltizam yoluyla mültezimlere kiralanan devlete ait verimli topraklara ne ad verilir?",
        "options": ["Mukataa", "Paşmaklık", "Dirlik", "Vakıf", "Haraci"],
        "correctIndex": 0,
        "explanation": "Mukataa, geliri hiçbir aracı kuruma veya memura maaş olarak bırakılmadan doğrudan nakit para olarak merkezi hazineye giren araziler ve işletmelerdir (tuzlalar, madenler, gümrükler vb.).",
        "distractor_trap": "Paşmaklık padişahın hanımları ve kızlarına ayrılan arazidir; doğrudan hazineye giren ise Mukataa'dır."
    },
    {
        "difficulty": 2,
        "prompt_text": "Osmanlı Devleti'nde gelirleri padişahın annesi, eşleri ve kızlarına ayrılan miri arazi çeşidi aşağıdakilerden hangisidir?",
        "options": ["Paşmaklık", "Malikane", "Yurtluk", "Ocaklık", "Metruk"],
        "correctIndex": 0,
        "explanation": "Paşmaklık arazilerin gelirleri saray kadınlarının (valide sultan, hasekiler ve hanım sultanlar) şahsi masraflarına tahsis edilirdi.",
        "distractor_trap": "Malikane devlete üstün hizmet gösterenlere mülk olarak verilen topraktır; saray hanımlarına ayrılan Paşmaklık'tır."
    },

    # --- TEST 8 (71-80): Toprak Sistemi & Vergiler ---
    {
        "difficulty": 2,
        "prompt_text": "Osmanlı Devleti'nde tarım arazilerinin büyük çoğunluğunu oluşturan ve mülkiyeti devlete ait olan arazilere 'Miri Arazi' denirdi.\n\nMiri arazi içerisinde yer alan ve gelirlerine göre 'Has', 'Zeamet' ve 'Tımar' olmak üzere üç sınıfa ayrılan arazi türü aşağıdakilerden hangisidir?",
        "options": ["Dirlik Topraklar", "Vakıf Topraklar", "Mevat Topraklar", "Metruk Topraklar", "Mülk Topraklar"],
        "correctIndex": 0,
        "explanation": "Dirlik, devlet görevlilerine hizmet ve maaş karşılığı tahsis edilen arazidir. Yıllık geliri 100 bin akçeden fazla olanlar Has, 20 bin - 100 bin arası Zeamet, 20 bin akçeden az olanlar ise Tımar arazisidir.",
        "distractor_trap": "Dirlik ve Tımar kavramları bazen eş anlamlı gibi kullanılır; oysa Tımar, Dirlik sisteminin en küçük basamağıdır."
    },
    {
        "difficulty": 2,
        "prompt_text": "Dirlik topraklarının yıllık gelirlerine göre ayrımı konusunda;\nI. Has: Yıllık geliri 100.000 akçenin üzerinde olan, padişah, şehzadeler, sadrazam ve beylerbeylerine verilen arazilerdir.\nII. Zeamet: Yıllık geliri 20.000 ile 100.000 akçe arasında olan, kadı, subaşı gibi orta kademe yöneticilere verilen arazilerdir.\nIII. Tımar: Yıllık geliri 20.000 akçeye kadar olan ve savaşlarda yararlılık gösteren sipahilere verilen arazilerdir.\n\nYukarıda verilen eşleştirmelerden hangileri doğrudur?",
        "options": ["Yalnız I", "I ve II", "II ve III", "I ve III", "I, II ve III"],
        "correctIndex": 4,
        "explanation": "Verilen üç basamak ve gelir sınırları Klasik Dönem Osmanlı Dirlik sisteminin kesin ölçütleridir.",
        "distractor_trap": "Soru şıklarında Has ile Zeamet gelir sınırları yer değiştirilerek çeldirici üretilir; sıralama Has > Zeamet > Tımar şeklindedir."
    },
    {
        "difficulty": 2,
        "prompt_text": "Osmanlı Tımar Sistemi'nin devlete ve ekonomiye sağladığı faydalar arasında aşağıdakilerden hangisi yer almaz?",
        "options": [
            "Devlet hazinesinden tek kuruş çıkmadan yüz binlerce kişilik daimi atlı bir ordunun (Cebelü) savaşa hazır tutulması",
            "Tarımsal üretimin denetlenmesi ve toprakların peş peşe boş bırakılmasının önlenmesi",
            "Taşrada jandarma görevi görerek asayiş ve güvenliğin tesis edilmesi",
            "Vergilerin yerinde toplanarak nakliye ve tahsilat masraflarından tasarruf edilmesi",
            "Tımar sahiplerinin zamanla kendi özel ordularını kurarak toprağın özel mülkiyetini elde etmesi"
        ],
        "correctIndex": 4,
        "explanation": "Tımar sisteminde toprak asla sipahinin özel mülkü olamaz. Mülkiyet devlete aittir; sipahi sadece vergi toplar. Toprağın özel mülk haline gelmesi feodalleşmedir ve Osmanlı merkezi otoritesi bunu kesinlikle yasaklamıştır.",
        "distractor_trap": "Tımar sisteminde Avrupa'daki gibi derebeylik (feodalite) YOKTUR. Toprak alınıp satılamaz, devredilemez."
    },
    {
        "difficulty": 2,
        "prompt_text": "Osmanlı Devleti'nde Müslüman çiftçilerden ürettikleri tarım ürünleri üzerinden alınan yüzde on (%10) oranındaki ayni şeri vergiye ne ad verilirdi?",
        "options": ["Öşür (Aşar)", "Haraç", "Cizye", "Ağnam", "Çiftbozan"],
        "correctIndex": 0,
        "explanation": "Öşür (Aşar), Müslüman reayadan alınan 1/10 oranındaki ürün vergisidir. Gayrimüslimlerden ise ürün vergisi olarak 'Haraç' alınırdı.",
        "distractor_trap": "Müslümandan Öşür, Gayrimüslimden Haraç alınır. İkisi de ürün vergisidir."
    },
    {
        "difficulty": 2,
        "prompt_text": "Osmanlı Devleti'nde askerlik çağına gelmiş sağlıklı gayrimüslim erkeklerden, askerlik yapmamaları ve can-mal güvenliklerinin devlet tarafından korunması karşılığında alınan şeri baş vergisi aşağıdakilerden hangisidir?",
        "options": ["Cizye", "Haraç", "Öşür", "Avarız", "Bennak"],
        "correctIndex": 0,
        "explanation": "Cizye, askere gitmeyen sağlıklı gayrimüslim erkeklerden alınan baş vergisidir. Kadınlar, çocuklar, din adamları, yaşlılar ve sakatlardan cizye alınmazdı.",
        "distractor_trap": "Haraç toprak/ürün vergisidir; Cizye ise askerlikten muafiyet karşılığı alınan kafa/şahıs vergisidir."
    },
    {
        "difficulty": 2,
        "prompt_text": "Tımar arazisini sebepsiz yere üst üste üç yıl boyunca ekmeyip boş bırakan çiftçiden alınan ve üretimin sürekliliğini sağlamayı amaçlayan ceza niteliğindeki vergi aşağıdakilerden hangisidir?",
        "options": ["Çiftbozan Vergisi", "Ağnam Vergisi", "İmdadiye-i Seferiye", "Mücerred", "Resm-i Çift"],
        "correctIndex": 0,
        "explanation": "Çiftbozan vergisi, üretimin aksamasını önlemek için toprağını terk eden veya üç yıl işlemeyen çiftçiden alınan caydırıcı bir tazminat vergisidir.",
        "distractor_trap": "Çiftbozan mali gelir kazanmaktan ziyade tarımsal üretimin sürekliliğini teminat altına almayı hedefler."
    },
    {
        "difficulty": 2,
        "prompt_text": "Osmanlı Devleti'nde küçükbaş hayvan (koyun ve keçi) sahiplerinden hayvan başına alınan ve Osmanlı'nın bütçesinde önemli bir yer tutan vergi aşağıdakilerden hangisidir?",
        "options": ["Ağnam Vergisi", "Avarız Vergisi", "Baç Vergisi", "Derbent Vergisi", "İhtisap"],
        "correctIndex": 0,
        "explanation": "Ağnam vergisi koyun ve keçi üzerinden alınırdı. TBMM 1920'de açıldığında çıkardığı 1 numaralı ilk kanun da 'Ağnam Vergisinin 4 katına çıkarılması kanunu'dur.",
        "distractor_trap": "Ağnam küçükbaş hayvan vergisidir. TBMM'nin ilk kanunu olması sebebiyle ÖSYM için çok kıymetlidir."
    },
    {
        "difficulty": 2,
        "prompt_text": "İlk kez II. Bayezid döneminde 'Küçük Kıyamet' olarak anılan 1509 Büyük İstanbul Depremi sonrasında olağanüstü hallerde toplanmak üzere ihdas edilen, ancak 17. yüzyıldan itibaren sürekli hale gelen vergi türü aşağıdakilerden hangisidir?",
        "options": ["Avarız Vergisi", "Bennak Vergisi", "Cizye", "Öşür", "İane-i Milliye"],
        "correctIndex": 0,
        "explanation": "Avarız vergisi deprem, sel ve savaş gibi olağanüstü durumlarda toplanan olağanüstü hal vergisidir; duraklama döneminde bütçe açıkları sebebiyle düzenli bir vergiye dönüştürülmüştür.",
        "distractor_trap": "Avarız vergisinin ilk çıkışı 1509 İstanbul depremidir. Olağanüstü hal vergisi olarak kodlanmalıdır."
    },
    {
        "difficulty": 2,
        "prompt_text": "Osmanlı Devleti'nde çarşı ve pazara getirilen ticari mallardan alınan ilk gümrük ve pazar vergisi niteliğindeki harç aşağıdakilerden hangisidir?",
        "options": ["Baç Vergisi (Bacıbazar)", "Ağnam", "Resm-i Arusane", "Derbent Vergisi", "İzn-i Sefine"],
        "correctIndex": 0,
        "explanation": "Baç vergisi, Osman Bey döneminde Karacahisar pazarında ilk kez toplanan ve Osmanlı tarihindeki ilk vergi kabul edilen pazar harcıdır.",
        "distractor_trap": "Osmanlı'da konulan ilk vergi Baç (Pazar) vergisidir. Osman Gazi döneminde uygulanmıştır."
    },
    {
        "difficulty": 3,
        "prompt_text": "Gelirleri cami, medrese, hastane (darüşşifa), köprü ve kervansaray gibi kamu yararına çalışan sosyal kurumların masraflarına tahsis edilen, satılması, devredilmesi veya miras bırakılması kesinlikle yasak olan toprak türü aşağıdakilerden hangisidir?",
        "options": ["Vakıf Topraklar", "Mülk Topraklar", "Yurtluk", "Paşmaklık", "Mukataa"],
        "correctIndex": 0,
        "explanation": "Vakıf arazileri hayır kurumlarının finansmanı için bağışlanan dokunulmaz arazilerdir. Vakıf şartnamesine 'Vakfiye', vakfı yöneten kişiye ise 'Mütevelli' denirdi.",
        "distractor_trap": "Vakıf malları dokunulmazdır; devlet dahi olağanüstü haller dışında vakıf arazilerini kamulaştıramazdı."
    },

    # --- TEST 9 (81-90): Osmanlı Ordusu & Donanma ---
    {
        "difficulty": 2,
        "prompt_text": "I. Murat döneminde Çandarlı Kara Halil Paşa'nın teklifiyle kurulan, savaş esirlerinin beşte birinin devlete alınması esasına dayanan ve Kapıkulu Ordusu'nun insan kaynağını oluşturan ilk sistem aşağıdakilerden hangisidir?",
        "options": ["Pençik Sistemi", "Devşirme Sistemi", "İkta Sistemi", "Millet Sistemi", "Gulam Sistemi"],
        "correctIndex": 0,
        "explanation": "Farsça 'penç' (beş) ve 'yek' (bir) kelimelerinden türeyen Pençik sistemi, savaş esiri Hristiyan gençlerin 1/5'inin orduya kazandırılması sistemidir. Ankara Savaşı'ndan sonra esir gelmeyince yerine Devşirme sistemi getirilmiştir.",
        "distractor_trap": "Devşirme sistemi Pençik'in yetersiz kalması üzerine kendi gayrimüslim tebaamızdan gençlerin toplanmasıdır; savaş esirlerinin beşte biri ise Pençik sistemidir."
    },
    {
        "difficulty": 2,
        "prompt_text": "Kapıkulu Piyadeleri (yaya askerler) arasında yer alan ve saray kapılarını, saray bahçelerini, padişahın kayıklarını korumakla görevli seçkin askeri ocak aşağıdakilerden hangisidir?",
        "options": ["Bostancılar", "Yeniçeriler", "Cebeciler", "Top Arabacıları", "Humbaracılar"],
        "correctIndex": 0,
        "explanation": "Bostancı Ocağı, sarayın ve Boğaziçi sahillerinin güvenliğini sağlayan, padişahın bindiği saltanat kayıklarını çeken özel saray muhafızlarıdır.",
        "distractor_trap": "Cebeciler silah yapan ve onaran ocaktır; saray ve kıyı emniyeti Bostancılar'a aittir."
    },
    {
        "difficulty": 2,
        "prompt_text": "Kapıkulu Ordusu'nun atlı (süvari) birlikleri olan 'Altı Bölük Halkı' arasında yer alan ve savaş sırasında ordunun ağırlıklarını, hazinesini ve ganimetleri korumakla görevli bölükler hangisinde doğru verilmiştir?",
        "options": [
            "Sağ ve Sol Garipler",
            "Sağ ve Sol Ulufeciler",
            "Sipah ve Silahtar",
            "Cebeciler ve Topçular",
            "Akıncılar ve Deliler"
        ],
        "correctIndex": 0,
        "explanation": "Altı Bölük Halkı: 1) Sipah ve Silahtarlar padişahın çadırını korur. 2) Sağ ve Sol Ulufeciler saltanat sancaklarını korur. 3) Sağ ve Sol Garipler ise devlet hazinesini ve ordunun ağırlıklarını korur.",
        "distractor_trap": "ÖSYM'nin en meşhur süvari sorusudur: Sancağı Ulufeciler, ordu hazinesini ve ganimeti Garipler korur."
    },
    {
        "difficulty": 2,
        "prompt_text": "Savaşta en ön safta giden, cesaretleri, kartal kanatlı miğferleri ve leopar kürkleriyle düşmana korku salan, Osmanlı ordusunun sınır boylarındaki en sıradışı hafif süvari birliği aşağıdakilerden hangisidir?",
        "options": ["Deliler", "Akıncılar", "Tatarlar", "Azaplar", "Yörükler"],
        "correctIndex": 0,
        "explanation": "'Deliler' (Deli Süvarileri), korkusuzlukları sebebiyle bu adı alan, öncü keşif yapan ve psikolojik üstünlük sağlayan sınır atlı birlikleridir.",
        "distractor_trap": "Azaplar bekar Türk gençlerinden oluşan piyadelerdir; Deliler ise atlı süvarilerdir."
    },
    {
        "difficulty": 2,
        "prompt_text": "Osmanlı Devleti'nde ilk düzenli ordu teşkilatı olan 'Yaya ve Müsellem' birliklerini kuran ve Bursa'yı fethederek devletin ilk başkenti yapan Osmanlı padişahı kimdir?",
        "options": ["Orhan Bey", "Osman Bey", "I. Murat", "Yıldırım Bayezid", "Çelebi Mehmet"],
        "correctIndex": 0,
        "explanation": "Orhan Bey döneminde vezir Alaeddin Paşa ve Çandarlı Halil'in önerisiyle Türk gençlerinden oluşan ilk düzenli ordu 'Yaya' (piyade) ve 'Müsellem' (atlı) kurulmuştur.",
        "distractor_trap": "Osman Gazi döneminde düzenli ordu yoktur, alpler ve aşiret kuvvetleri vardı. Düzenli ordu Orhan Gazi ile başlar."
    },
    {
        "difficulty": 2,
        "prompt_text": "Osmanlı Devleti'nin denizcilik faaliyetleri ve donanması ile ilgili aşağıdaki ifadelerden hangisi yanlıştır?",
        "options": [
            "Osmanlı'nın denizcilikle tanışması Orhan Bey döneminde Karesioğulları Beyliği'nin fethiyle başlamıştır.",
            "İlk Osmanlı tersanesi Yıldırım Bayezid döneminde Gelibolu'da inşa edilmiştir.",
            "28 Eylül 1538 Preveze Deniz Zaferi Türk Deniz Kuvvetleri Günü olarak kutlanır.",
            "Osmanlı donanması tarihte ilk kez Çeşme'de Ruslar tarafından yakılmıştır.",
            "Osmanlı donanmasının en üst amiraline ve yöneticisine 'Kaptanıderya' adı verilirdi."
        ],
        "correctIndex": 3,
        "explanation": "Osmanlı donanması tarihte İLK KEZ Çeşme'de değil; 1571 yılında İnebahtı'da (Haçlılar tarafından) yakılmıştır. Kronolojik sıralama: 1571 İnebahtı (Haçlı), 1770 Çeşme (Rus), 1827 Navarin (İngiliz-Fransız-Rus), 1853 Sinop (Rus) baskınlarıdır.",
        "distractor_trap": "Donanmanın yakıldığı İLK yer İnebahtı'dır (Sokullu'nun 'Biz Kıbrıs'ı alarak sizin kolunuzu kestik...' dediği olay)."
    },
    {
        "difficulty": 2,
        "prompt_text": "Osmanlı Devleti'nde donanma askerlerine 'Levent' adı verilirdi.\n\nBuna göre Kanuni Sultan Süleyman döneminde Osmanlı donanmasına katılarak Kaptanıderyalık makamına getirilen ve Preveze Deniz Zaferi ile Akdeniz'i bir 'Türk Gölü' haline getiren ünlü Türk denizcisi kimdir?",
        "options": ["Barbaros Hayrettin Paşa (Hızır Reis)", "Turgut Reis", "Piri Reis", "Kılıç Ali Paşa", "Seydi Ali Reis"],
        "correctIndex": 0,
        "explanation": "Barbaros Hayrettin Paşa (Hızır Reis), Cezayir hükümdarı iken Osmanlı'ya bağlanmış ve Kaptanıderya olmuştur. 1538 Preveze Deniz Zaferi ile Haçlı donanmasını bozguna uğratmıştır.",
        "distractor_trap": "Piri Reis Hint Deniz Seferleri ve Kitab-ı Bahriye haritası ile ünlüdür; Preveze fatihi Barbaros'tur."
    },
    {
        "difficulty": 2,
        "prompt_text": "İlk dünya haritasını ceylan derisi üzerine çizen ve Akdeniz'in kıyılarını, limanlarını anlatan 'Kitab-ı Bahriye' adlı muazzam coğrafya eserini Kanuni Sultan Süleyman'a sunan ünlü Osmanlı denizcisi kimdir?",
        "options": ["Piri Reis", "Seydi Ali Reis", "Murat Reis", "Ali Macar Reis", "Kemal Reis"],
        "correctIndex": 0,
        "explanation": "Piri Reis 1513 ve 1528 yıllarında iki dünya haritası çizmiş ve Kitab-ı Bahriye eserini kaleme almıştır.",
        "distractor_trap": "Seydi Ali Reis 'Mir'atü'l-Memalik' (Ülkelerin Aynası) eserinin yazarıdır; Kitab-ı Bahriye ve ilk dünya haritası Piri Reis'e aittir."
    },
    {
        "difficulty": 2,
        "prompt_text": "Portekizlilerin Basra Körfezi ve Kızıldeniz'deki ticari hegemonyasını kırmak amacıyla düzenlenen Hint Deniz Seferleri'ne katılan, fırtınaya yakalanarak Hindistan'a çıkan ve dönüş yolculuğunu 'Mir'atü'l-Memalik' (Ülkelerin Aynası) adlı seyahatnamesinde anlatan denizci kimdir?",
        "options": ["Seydi Ali Reis", "Piri Reis", "Hadım Süleyman Paşa", "Koca Murat Reis", "Salih Reis"],
        "correctIndex": 0,
        "explanation": "Seydi Ali Reis Hint Deniz Seferleri dönüşünde 'Mir'atü'l-Memalik' ve deniz astronomisi kitabı olan 'Kitabü'l-Muhit'i yazmıştır.",
        "distractor_trap": "Piri Reis Hint seferinde donanmayı Basra'da bıraktığı için idam edilmiştir; Mir'atü'l-Memalik'in yazarı ise Seydi Ali Reis'tir."
    },
    {
        "difficulty": 2,
        "prompt_text": "Osmanlı ordusunda kale kuşatmalarında surların altından gizlice tüneller kazarak patlayıcı yerleştiren ve kalelerin fethini kolaylaştıran özel istihkam birliğine ne ad verilirdi?",
        "options": ["Lağımcılar", "Humbaracılar", "Cebeciler", "Turnacılar", "Sakalar"],
        "correctIndex": 0,
        "explanation": "Lağımcılar Ocağı, yer altından tüneller kazıp surları havaya uçuran patlayıcı ve maden uzmanı askerlerdir.",
        "distractor_trap": "Humbaracılar havan topu ve el bombası atan ocaktır; tünel kazıcılar Lağımcılar'dır."
    },

    # --- TEST 10 (91-100): Hukuk, Eğitim, İktisat ve Sanat/Bilim ---
    {
        "difficulty": 3,
        "prompt_text": "Fatih Sultan Mehmet döneminde hazırlanan ve Osmanlı Devleti'nin ilk yazılı anayasal kanunnamesi kabul edilen 'Kanunname-i Ali Osman' ile ilgili aşağıdakilerden hangisi yanlıştır?",
        "options": [
            "Devletin bekası için kardeş katline cevaz verilmiştir.",
            "Müsadere (haksız kazanç sağlayan devlet adamlarının mallarına el koyma) sistemi yasallaşmıştır.",
            "Cülus bahşişi verilmesi yasal bir kural haline getirilmiştir.",
            "Sancağa çıkma zorunluluğu tamamen kaldırılarak yerine doğrudan kafes usulü getirilmiştir.",
            "Divan-ı Hümayun başkanlığı sadrazamlara bırakılmıştır."
        ],
        "correctIndex": 3,
        "explanation": "Sancağa çıkmayı kaldıran Fatih değildir; sancağa çıkma usulü III. Mehmet döneminde kaldırılmış, kafes usulü ise I. Ahmet döneminde kurumsallaşmıştır.",
        "distractor_trap": "Kanunname-i Ali Osman kardeş katlini, müsadereyi ve cülusu yasalaştıran temel kanundur."
    },
    {
        "difficulty": 2,
        "prompt_text": "Osmanlı Devleti'nde esnaf ve zanaatkarların örgütlendiği Lonca Teşkilatı ile ilgili aşağıdaki terimlerden hangisi yanlış açıklanmıştır?",
        "options": [
            "Gedik - İş yeri açma ve mesleği icra etme ruhsatı",
            "Narh - Devletin ve loncanın belirlediği azami tavan satış fiyatı",
            "Orta Sandığı (Teavün) - Esnafın yardımlaşma ve kaza sandığı",
            "Yiğitbaşı - Loncanın güvenliğini ve disiplinini sağlayan görevli",
            "Ehli Hibre - Lonca üyelerinin tamamına verilen genel unvan"
        ],
        "correctIndex": 4,
        "explanation": "Ehli Hibre loncanın genel üyeleri değil; üretilen malların kalitesini kontrol eden ve fiyatını takdir eden 'bilirkişi / uzman' heyetidir.",
        "distractor_trap": "Gedik (ruhsat) ve Ehli Hibre (bilirkişi) ÖSYM'nin lonca sorularındaki iki büyük vazgeçilmezidir."
    },
    {
        "difficulty": 2,
        "prompt_text": "Ahilik teşkilatından Lonca sistemine geçişte ortaya çıkan en belirgin fark aşağıdakilerden hangisidir?",
        "options": [
            "Ahilikte gayrimüslimler teşkilata alınmazken, Loncalarda gayrimüslim esnafın da kendi loncalarını kurabilmesi",
            "Loncalarda çıraklık eğitiminin tamamen kaldırılması",
            "Loncaların sadece askeri silah üretimi yapması",
            "Ahilikte ticaretin serbest olması, loncalarda yasaklanması",
            "Loncaların başında doğrudan Şeyhülislamın bulunması"
        ],
        "correctIndex": 0,
        "explanation": "Ahilik İslami fütüvvet temelli olduğundan sadece Müslümanlar üye olabilirdi. Osmanlı Lonca sisteminde ise gayrimüslimler de esnaf teşkilatına dahil olmuş veya kendi loncalarını kurmuşlardır.",
        "distractor_trap": "Ahilik = Sadece Müslüman esnaf; Lonca = Hem Müslüman hem Gayrimüslim esnaf."
    },
    {
        "difficulty": 2,
        "prompt_text": "Fatih Sultan Mehmet'in İstanbul'u fethettikten sonra Ayasofya ve Fatih Külliyesi çevresinde kurduğu, dönemin en yüksek seviyedeki ilahiyat ve pozitif bilimler akademisi niteliğindeki medrese aşağıdakilerden hangisidir?",
        "options": ["Sahn-ı Seman Medresesi", "Süleymaniye Medresesi", "İznik Orhaniyesi", "Gök Medrese", "Muradiye Medresesi"],
        "correctIndex": 0,
        "explanation": "Sahn-ı Seman (Sekiz Avlulu Medrese), Fatih tarafından kurulan ve müfredatını Ali Kuşçu ile hazırladığı Osmanlı'nın en seçkin yükseköğretim kurumudur.",
        "distractor_trap": "İznik Orhaniyesi Osmanlı'nın İLK medresesidir; en üst düzey akademi ise Fatih'in Sahn-ı Seman'ıdır."
    },
    {
        "difficulty": 2,
        "prompt_text": "Osmanlı Devleti'nde ilk medrese hangi padişah döneminde ve nerede açılmıştır?",
        "options": ["Orhan Bey - İznik", "Osman Bey - Söğüt", "I. Murat - Edirne", "Yıldırım Bayezid - Bursa", "Çelebi Mehmet - Amasya"],
        "correctIndex": 0,
        "explanation": "İlk Osmanlı medresesi 1331 yılında Orhan Bey tarafından İznik'te açılan 'İznik Orhaniyesi'dir (Süleyman Paşa Medresesi). İlk başmüderrisi ise Davud-ı Kayseri'dir.",
        "distractor_trap": "İlk müderris Davud-ı Kayseri, ilk medrese ise Orhan Bey döneminde İznik'tedir."
    },
    {
        "difficulty": 2,
        "prompt_text": "Akkoyunlu Devleti elçisi olarak İstanbul'a gelen, Fatih Sultan Mehmet'in hayran kalarak sarayında kalmasını rica ettiği, Ayasofya Medresesi başmüderrisi olan ve İstanbul'un enlem ve boylamını kesin olarak hesaplayan ünlü matematik ve astronomi bilgini kimdir?",
        "options": ["Ali Kuşçu", "Uluğ Bey", "Kadızade-i Rumi", "Takiyüddin Mehmet", "Matrakçı Nasuh"],
        "correctIndex": 0,
        "explanation": "Ali Kuşçu, Semerkant ekolünün büyük temsilcisidir. Fatih'in davetiyle İstanbul'a gelmiş, Ayasofya müderrisi olmuş ve 'Fethiye' adlı astronomi eserini Fatih'e sunmuştur.",
        "distractor_trap": "Takiyüddin Mehmet III. Murat döneminde ilk rasathaneyi kuran bilgindir; Fatih döneminin matematik dehası Ali Kuşçu'dur."
    },
    {
        "difficulty": 2,
        "prompt_text": "Fatih Sultan Mehmet döneminde yaşayan, tıp sahasında 'Kitabü'l-Cerrahiyyetü'l-Haniyye' adlı resimli cerrahi eserini yazan ve tıp tarihinde ilk kez hayvanlar ve kendi üzerinde deneysel farmakoloji deneyleri yapan ünlü Türk hekimi kimdir?",
        "options": ["Sabuncuoğlu Şerafeddin", "Akşemseddin", "Ahi Çelebi", "Altuncuzade", "Şanizade Ataullah"],
        "correctIndex": 0,
        "explanation": "Sabuncuoğlu Şerafeddin (Amasyalı hekim), cerrahi operasyonları minyatürlerle resmeden ilk tıp kitabının yazarıdır ve deneysel cerrahinin öncüsüdür.",
        "distractor_trap": "Akşemseddin mikrobu ilk tarif eden manevi hocadır; cerrahi çizimleri yapan Amasyalı hekim ise Sabuncuoğlu Şerafeddin'dir."
    },
    {
        "difficulty": 2,
        "prompt_text": "17. yüzyılda yaşamış, 50 yıl boyunca Osmanlı coğrafyasını ve komşu ülkeleri gezerek 'Seyahat ya Resulallah' rüyasıyla yola çıkan ve 10 ciltlik abidevi 'Seyahatname' eserini kaleme alan ünlü seyyah kimdir?",
        "options": ["Evliya Çelebi", "Katip Çelebi", "Yirmisekiz Mehmet Çelebi", "Lale Devri Nedim", "Aşıkpaşazade"],
        "correctIndex": 0,
        "explanation": "Evliya Çelebi Türk tarihinin en büyük seyyahıdır. 17. yüzyıl Osmanlı coğrafyasının kültür, dil, folklor ve şehir yapısını anlatan eşsiz bir Seyahatname bırakmıştır.",
        "distractor_trap": "Katip Çelebi 'Cihannüma' ve 'Keşfü'z-Zünun' eserlerinin yazarıdır (Hacı Kalfa); seyyah olan ise Evliya Çelebi'dir."
    },
    {
        "difficulty": 2,
        "prompt_text": "Batı dünyasında 'Hacı Kalfa' (Hacı Halife) olarak tanınan, bibliyografik eseri 'Keşfü'z-Zünun' ve dünyanın ilk Türkçe coğrafya ansiklopedisi kabul edilen 'Cihannüma'nın yazarı olan 17. yüzyıl Osmanlı alimi kimdir?",
        "options": ["Katip Çelebi", "Evliya Çelebi", "Naima", "Koçi Bey", "Hezarfen Ahmet Çelebi"],
        "correctIndex": 0,
        "explanation": "Katip Çelebi, 15 bin kitabı tanıttığı Keşfü'z-Zünun ve haritalarla donattığı Cihannüma eserleriyle Batı'da da büyük saygı görmüş bir bilgindir.",
        "distractor_trap": "Hacı Kalfa lakabı Katip Çelebi'ye aittir. ÖSYM bu lakabı doğrudan sormayı çok sever."
    },
    {
        "difficulty": 2,
        "prompt_text": "Mimar Sinan'ın mimarlık kariyerindeki gelişimini ifade etmek üzere bizzat kendi ağzından nitelendirdiği 'Çıraklık', 'Kalfalık' ve 'Ustalık' eserleri sırasıyla aşağıdakilerden hangisinde doğru verilmiştir?",
        "options": [
            "Şehzade Camii - Süleymaniye Camii - Selimiye Camii",
            "Süleymaniye Camii - Şehzade Camii - Selimiye Camii",
            "Selimiye Camii - Süleymaniye Camii - Şehzade Camii",
            "Mihrimah Sultan Camii - Rüstem Paşa Camii - Selimiye Camii",
            "Şehzade Camii - Sultanahmet Camii - Selimiye Camii"
        ],
        "correctIndex": 0,
        "explanation": "Mimar Sinan: İstanbul Şehzade Camii için 'Çıraklık eserim', İstanbul Süleymaniye Camii için 'Kalfalık eserim', Edirne Selimiye Camii için ise 'Ustalık eserim' demiştir. Edirne Selimiye Camii UNESCO Dünya Miras Listesi'ndedir.",
        "distractor_trap": "Sultanahmet Camii Mimar Sinan'ın değil, öğrencisi Sedefkar Mehmet Ağa'nın eseridir (Mavi Cami). Mimar Sinan üçlemesi: Şehzade -> Süleymaniye -> Selimiye."
    }
]

def generate_sql():
    sql_path = os.path.join("docs", "soru_havuzu", "tarih", "03_osmanli_kultur_ve_uygarligi_ek.sql")
    os.makedirs(os.path.dirname(sql_path), exist_ok=True)
    
    with open(sql_path, "w", encoding="utf-8") as f:
        f.write("-- =====================================================================\n")
        f.write("-- ÜNİTE 3: Osmanlı Kültür ve Uygarlığı (EK 60 SORU: Test 5, 6, 7, 8, 9, 10)\n")
        f.write("-- Toplam Soru: 60 Soru (Mevcut 40 + Bu Ek 60 = 100 Soru / 10 Test)\n")
        f.write("-- Şema: public.questions (lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap)\n")
        f.write("-- =====================================================================\n\n")
        
        for idx, q in enumerate(questions, 41):
            lesson = "Tarih"
            topic = "Osmanlı Kültür ve Uygarlığı"
            q_type = "multiple_choice"
            difficulty = q["difficulty"]
            
            prompt = q["prompt_text"].replace("'", "''")
            explanation = q["explanation"].replace("'", "''")
            distractor_trap = q["distractor_trap"].replace("'", "''")
            
            interaction = {
                "options": q["options"],
                "correctIndex": q["correctIndex"]
            }
            interaction_json = json.dumps(interaction, ensure_ascii=False).replace("'", "''")
            
            sql = (
                f"-- Soru {idx} (Test {((idx - 1) // 10) + 1})\n"
                f"insert into public.questions (\n"
                f"  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap\n"
                f") values (\n"
                f"  '{lesson}',\n"
                f"  '{topic}',\n"
                f"  '{q_type}',\n"
                f"  {difficulty},\n"
                f"  '{prompt}',\n"
                f"  '{interaction_json}'::jsonb,\n"
                f"  '{explanation}',\n"
                f"  '{distractor_trap}'\n"
                f");\n\n"
            )
            f.write(sql)
            
    print(f"Başarıyla 60 ek soru oluşturuldu: {sql_path}")

if __name__ == "__main__":
    generate_sql()
