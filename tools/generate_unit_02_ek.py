# -*- coding: utf-8 -*-
import json
import os
import sys

# TASK-T2: İlk Türk-İslam Devletleri için 40 Yeni Özgün Soru (Test 5, 6, 7, 8)
# Kapsam:
# Test 5 (41-50): Karahanlılar, Gazneliler, Tolunoğulları, İhşidiler, Eyyubiler, Memlükler
# Test 6 (51-60): Büyük Selçuklu Devleti (Savaşlar: Dandanakan, Pasinler, Malazgirt, Katvan, Hasan Sabbah & Batınilik)
# Test 7 (61-70): Anadolu Selçuklu Devleti & I. ve II. Dönem Türk Beylikleri (Miras, Mimari, Denizcilik)
# Test 8 (71-80): Kültür ve Medeniyet, Divanlar, Hukuk, İkta Sistemi, Ahilik ve Bilim Adamları (Farabi, İbn-i Sina, Biruni, Gazali)

questions = [
    # --- TEST 5 (41-50): Erken Türk-İslam Devletleri ---
    {
        "difficulty": 2,
        "prompt_text": "Mısır'da kurulan ilk Türk-İslam devleti olan ve Nil Nehri kıyısında 'Maristan' adı verilen hastaneler açarak din, dil ve ırk ayrımı gözetmeksizin halka ücretsiz sağlık hizmeti sunan devlet aşağıdakilerden hangisidir?",
        "options": ["İhşidiler (Akşitler)", "Tolunoğulları", "Eyyubiler", "Memlükler", "Fatımiler"],
        "correctIndex": 1,
        "explanation": "868 yılında Tolunoğlu Ahmet tarafından Mısır'da kurulan Tolunoğulları, Mısır'da kurulan ilk Türk-İslam devletidir. Açtığı 'Maristan' adlı hastaneler ve eczaneler ile sosyal devlet anlayışının en parlak örneklerinden birini sergilemiştir.",
        "distractor_trap": "İhşidiler de Mısır'da kurulmuştur ancak Tolunoğullarından sonradır (Mısır'da kurulan ikinci Türk devletidir). 'İlk Türk devleti' ve Maristanların öncüsü Tolunoğulları'dır."
    },
    {
        "difficulty": 2,
        "prompt_text": "Mısır'da kurulan ve Hicaz bölgesine (Mekke ve Medine) egemen olan 'ilk Türk devleti' aşağıdakilerden hangisidir?",
        "options": ["Tolunoğulları", "İhşidiler (Akşitler)", "Eyyubiler", "Memlükler", "Osmanlı Devleti"],
        "correctIndex": 1,
        "explanation": "Muhammed bin Toğaç tarafından 935'te kurulan İhşidiler (Akşitler), kutsal topraklar olan Hicaz bölgesine (Mekke ve Medine) hakim olan ilk Türk devletidir. Hükümdarına Abbasi halifesi tarafından 'Akşit' (Nur yüzlü / Beyaz güneş) unvanı verilmiştir.",
        "distractor_trap": "Adaylar Hicaz hakimiyetini Yavuz Sultan Selim dönemiyle Osmanlı'ya veya Selahaddin Eyyubi'ye bağlayabilir. Kutsal topraklara hükmeden 'ilk Türk devleti' İhşidiler'dir."
    },
    {
        "difficulty": 2,
        "prompt_text": "1187 yılında gerçekleştirdiği Hıttin Savaşı ile Haçlıları ağır bir hezimete uğratıp 88 yıllık Haçlı işgaline son vererek Kudüs'ü geri alan ve Mehmet Akif Ersoy tarafından 'Şark'ın en sevgili sultanı' olarak nitelendirilen hükümdar kimdir?",
        "options": ["Selahaddin Eyyubi", "Sultan Baybars", "Nureddin Zengi", "Alparslan", "Kutuz"],
        "correctIndex": 0,
        "explanation": "Eyyubiler Devleti'nin kurucusu Selahaddin Eyyubi, 1187 Hıttin Savaşı ile Kudüs Krallığı'nı yıkarak Kudüs'ü Haçlılardan kurtarmış ve III. Haçlı Seferi'nin başlamasına neden olmuştur. 'Hadimü'l-Haremeyn' unvanını kullanan ilk hükümdarlardandır.",
        "distractor_trap": "Baybars Ayn Calut zaferiyle Moğolları durduran Memlük sultanıdır; Kudüs fatihi ise Hıttin Savaşı ile Selahaddin Eyyubi'dir."
    },
    {
        "difficulty": 2,
        "prompt_text": "Tarihte Moğolların batıya doğru ilerleyişini ve yenilmezlik efsanesini 1260 Ayn Calut ve 1277 Elbistan savaşlarıyla sona erdiren Türk-İslam devleti aşağıdakilerden hangisidir?",
        "options": ["Memlükler (Devlet-i Türkiye)", "Büyük Selçuklu Devleti", "Eyyubiler", "Harzemşahlar", "Gazneliler"],
        "correctIndex": 0,
        "explanation": "Memlükler (Devlet-i Türkiye/Kölemenler), Sultan Kutuz ve Sultan Baybars komutasında İlhanlı Moğollarını 1260 Ayn Calut Savaşı'nda tarihte ilk kez mağlup ederek durdurmuştur.",
        "distractor_trap": "Harzemşahlar Moğollarla Otrar Faciası'nı yaşamış ve Moğol istilası altında ezilmiştir. Moğolları durduran ve hezimete uğratan yegane devlet Memlükler'dir."
    },
    {
        "difficulty": 2,
        "prompt_text": "Memlük Devleti'nin diğer Türk-İslam devletlerinden ayrılan ve taht kavgalarının farklı bir yöntemle cereyan etmesine yol açan en belirgin veraset özelliği aşağıdakilerden hangisidir?",
        "options": [
            "Kut inancının tamamen terk edilerek cumhuriyet rejimine geçilmesi",
            "Tahta sadece hükümdarın en büyük kız çocuğunun geçebilmesi",
            "Saltanatın babadan oğula geçme zorunluluğunun olmaması; her başarılı emir ve komutanın tahta geçme hakkına sahip olması",
            "Hükümdarın Abbasi halifesi tarafından yapılan kura çekimiyle belirlenmesi",
            "Ülkenin dört hanedan arasında federatif kantonlara bölünmesi"
        ],
        "correctIndex": 2,
        "explanation": "Memlüklerde 'kut' kan bağı ile sınırlandırılmamıştır. Ordudaki her güçlü emir (komutan) sultan olma hakkına sahipti. Bu nedenle Memlükler kısa sürede en çok hükümdar değiştiren Türk devleti olmuştur.",
        "distractor_trap": "Memlüklerde saltanat veraset sistemi yoktur; ordu komutanları sultan olabilmiştir. Bu durum onları diğer tüm Türk devletlerinden ayıran temel özelliktir."
    },
    {
        "difficulty": 2,
        "prompt_text": "Karahanlılar Devleti'nde Satuk Buğra Han İslamiyet'i kabul ettikten sonra 'Abdülkerim' adını almış ve İslamiyet resmi devlet dini haline gelmiştir.\n\nKarahanlıların Müslüman olmalarına rağmen Türkçeyi resmi dil ilan etmeleri ve hükümdarlarının Kadır Han, Buğra Han, Arslan Han gibi Türkçe unvanları kullanmaya devam etmeleri aşağıdakilerden hangisinin en somut kanıtıdır?",
        "options": [
            "Arap kültürünü tamamen benimsediklerinin",
            "Milli benliklerini ve Türk kültür kimliğini titizlikle koruduklarının",
            "İslamiyet'i zorla yaymak istediklerinin",
            "Yöneticileri ile halkı arasında derin bir uçurum oluştuğunun",
            "Gök Tanrı inancının prensiplerini İslamiyet'in üzerinde tuttuklarının"
        ],
        "correctIndex": 1,
        "explanation": "Karahanlılar halkı, yöneticileri ve coğrafyası tamamen Türk olan bir devletti. Bu sebeple İslam dinine girmelerine rağmen Türkçeyi resmi dil yapmış, Uygur alfabesini kullanmış ve Türk kültürünü yaşatmışlardır.",
        "distractor_trap": "Gazneliler veya Selçuklular gibi Farsça ve Arapçanın etkisinde kalmamışlar; Karahanlılar milli kimliklerini en saf haliyle sürdürmüşlerdir."
    },
    {
        "difficulty": 2,
        "prompt_text": "Gazneli Mahmut, Abbasi halifesini Şii Büveyhoğulları'nın baskısından kurtarması üzerine halife tarafından ödüllendirilmiştir.\n\nAbbasi Halifesi el-Kadir Billah tarafından Gazneli Mahmut'a verilen ve Türk tarihinde ilk kez bir Türk hükümdarı tarafından kullanılan unvan aşağıdakilerden hangisidir?",
        "options": ["Sultan", "Kağan", "Padişah", "Halife", "Şah"],
        "correctIndex": 0,
        "explanation": "Gazneli Mahmut, İslam dünyasına hizmetleri ve halifeyi koruması karşılığında halifeden 'Sultan' unvanını alan ilk Türk hükümdarıdır.",
        "distractor_trap": "Tuğrul Bey'e halife tarafından 'Doğunun ve Batının Sultanı' denmiştir; ancak genel anlamda 'Sultan' unvanını ilk kullanan hükümdar Gazneli Mahmut'tur."
    },
    {
        "difficulty": 2,
        "prompt_text": "Gazneli Devleti'nin en parlak hükümdarı olan Gazneli Mahmut, Hindistan üzerine 17 büyük sefer düzenleyerek İslamiyet'in Hint alt kıtasında yayılmasını sağlamış ve bölgedeki katı 'Kast Sistemi'ne büyük darbe vurmuştur.\n\nGazneli Mahmut'un Hindistan'daki ünlü Şiva Tapınağı'nı ele geçirerek putları yıktığı ve 'Put Kırıcı' unvanını aldığı en meşhur 16. seferi aşağıdakilerden hangisidir?",
        "options": ["Somnat Seferi", "Gucerat Seferi", "Pencap Seferi", "Multan Seferi", "Delhi Seferi"],
        "correctIndex": 0,
        "explanation": "Gazneli Mahmut 1025 yılında düzenlediği Somnat Seferi ile devasa Somnat Tapınağı'nı fethetmiş, putları imha etmiş ve İslam dünyasında büyük bir manevi itibar kazanarak 'Put Kırıcı' lakabıyla anılmıştır.",
        "distractor_trap": "Somnat Seferi ÖSYM'nin Gazneli Mahmut sorularında doğrudan tapınak ismi ve sefer numarasıyla sorguladığı en meşhur seferdir."
    },
    {
        "difficulty": 2,
        "prompt_text": "Karahanlılar döneminde ticaret yolları üzerinde yolcuların, tüccarların ve kervanların güvenliğini ve iaşesini sağlamak amacıyla inşa edilen, ilk dönemlerde askeri sınır karakolu iken sonradan kervansaraylara dönüşen yapılara ne ad verilirdi?",
        "options": ["Ribat", "Kümbet", "Külliye", "İmaret", "Bedesten"],
        "correctIndex": 0,
        "explanation": "Ribat, Karahanlılar tarafından geliştirilen sınır güvenliği ve ticaret konaklama merkezleridir (kervansarayların atasıdır). İçinde ahırlar, odalar, mescit ve muhafız birlikleri bulunurdu.",
        "distractor_trap": "Bedesten kapalı çarşıdır; İmaret aşevidir. Ticari ve askeri konaklama yeri Ribat'tır."
    },
    {
        "difficulty": 2,
        "prompt_text": "Büyük Selçuklu Devleti ile Gazneliler arasında 1040 yılında meydana gelen, Gaznelilerin dağılma sürecine girmesine yol açarken Selçukluların resmen kurulmasını ve bağımsız devlet haline gelmesini sağlayan tarihi meydan savaşı aşağıdakilerden hangisidir?",
        "options": ["Dandanakan Savaşı", "Pasinler Savaşı", "Malazgirt Savaşı", "Nesa Savaşı", "Serahs Savaşı"],
        "correctIndex": 0,
        "explanation": "1040 Dandanakan Savaşı'nda Tuğrul ve Çağrı Beyler, Gazneli Sultan Mesut'un fillerle takviyeli ordusunu hezimete uğratmıştır. Bu zaferle Büyük Selçuklu Devleti resmen kurulmuş, Tuğrul Bey adına hutbe okutup para bastırmıştır.",
        "distractor_trap": "Nesa ve Serahs öncü savaşlardır; kuruluşu resmileştiren ve Gaznelileri yıkan ana meydan savaşı Dandanakan'dır."
    },

    # --- TEST 6 (51-60): Büyük Selçuklu Devleti & Fetihler ---
    {
        "difficulty": 2,
        "prompt_text": "Büyük Selçuklu Devleti ile Bizans ve Gürcü kuvvetleri arasında 1048 yılında meydana gelen ve Türklerin Bizans imparatorluk ordusuna karşı kazandığı 'ilk büyük zafer' kabul edilen muharebe aşağıdakilerden hangisidir?",
        "options": ["Pasinler Savaşı", "Malazgirt Savaşı", "Miryokefalon Savaşı", "Katvan Savaşı", "Yassıçemen Savaşı"],
        "correctIndex": 0,
        "explanation": "1048 Pasinler (Hasankale) Savaşı, Büyük Selçuklu Devleti ile Bizans İmparatorluğu arasındaki ilk büyük meydan savaşıdır. Gürcü Kralı Liparit esir alınmış ve Anadolu kapıları Türklere aralanmıştır.",
        "distractor_trap": "Malazgirt kapıları tamamen açan savaştır; Bizans ile yapılan İLK savaş ise Erzurum yakınlarındaki Pasinler Savaşı'dır."
    },
    {
        "difficulty": 2,
        "prompt_text": "1055 yılında Bağdat'a girerek Şii Büveyhoğulları Devleti'ne son veren ve Abbasi halifesini esaretten kurtaran Tuğrul Bey'e halife el-Kaim bi-Emrillah tarafından takdim edilen tarihi unvan aşağıdakilerden hangisidir?",
        "options": [
            "Doğunun ve Batının Sultanı (Sultan-ı Mağrib ve Maşrık)",
            "Kudüs Fatihi",
            "Riyazü's-Saltana",
            "Hadimü'l-Haremeyn",
            "Müdafi-i İslam"
        ],
        "correctIndex": 0,
        "explanation": "Tuğrul Bey 1055 Bağdat Seferi ile hilafeti kurtarınca halife ona altın kılıçlar kuşatmış ve 'Doğunun ve Batının Hükümdarı' unvanını vermiştir. Böylece siyasi liderlik tamamen Türklere geçmiş, halife sadece dini lider olarak kalmıştır.",
        "distractor_trap": "Adaylar Alparslan'a verilen 'Ebu'l-Feth' unvanı ile karıştırabilir. Tuğrul Bey'in meşhur unvanı 'Doğunun ve Batının Sultanı'dır."
    },
    {
        "difficulty": 2,
        "prompt_text": "Sultan Alparslan, 1064 yılında Hristiyan dünyasının aşılmaz kabul ettiği muhkem Ani Kalesi'ni ve Kars'ı fethederek büyük bir askeri başarı kazanmıştır.\n\nBu fetih üzerine Abbasi halifesi tarafından Sultan Alparslan'a verilen unvan aşağıdakilerden hangisidir?",
        "options": ["Ebu'l-Feth (Fetihlerin Babası)", "Gazi", "Seyfüddin", "İskender-i Sani", "Sultan-ı Azam"],
        "correctIndex": 0,
        "explanation": "Ani Kalesi'nin fethi İslam dünyasında büyük yankı uyandırmış ve halife Sultan Alparslan'a 'Ebu'l-Feth' (Fetihlerin Babası) unvanını tevcih etmiştir.",
        "distractor_trap": "Sultan Alparslan'a Malazgirt'ten önce, Ani Kalesi'nin fethi sebebiyle 'Ebu'l-Feth' unvanı verilmiştir."
    },
    {
        "difficulty": 2,
        "prompt_text": "26 Ağustos 1071 Cuma günü Malazgirt Ovası'nda Bizans İmparatoru Romen Diyojen'i mağlup eden Sultan Alparslan, savaştan sonra komutanlarına 'Toprak fethedenin malıdır' buyruğunu vermiştir.\n\nSultan Alparslan'ın bu fermanı vermesindeki temel amaç aşağıdakilerden hangisidir?",
        "options": [
            "Merkezi otoriteyi derhal Şam'a taşımak",
            "Komutanları teşvik ederek Anadolu'nun fethini ve Türkleşmesini hızlandırmak",
            "Bizans ile yeni bir ticaret antlaşması yapmak",
            "Haçlı Seferleri'ni diplomatik yollarla engellemek",
            "İkta sistemini tamamen yürürlükten kaldırmak"
        ],
        "correctIndex": 1,
        "explanation": "'Kılıç hakkı' (fetheden fethettiği yerin yöneticisidir) anlayışıyla komutanlar Anadolu içlerine akınlar düzenlemiş, böylece Danişmentliler, Saltuklular, Mengücekliler, Artuklular ve Çaka Beyliği kurularak Anadolu hızla Türk yurdu haline gelmiştir.",
        "distractor_trap": "Merkezi otoriteyi zayıflatma riski taşısa da buradaki asıl stratejik amaç fethi hızlandırmaktır."
    },
    {
        "difficulty": 3,
        "prompt_text": "Büyük Selçuklu Devleti'nde Sultan Melikşah ve Vezir Nizamülmülk döneminde devleti içten çökertmek amacıyla Hasan Sabbah tarafından kurulan, Alamut Kalesi merkezli haşhaş ve suikast tarikatı olan yıkıcı hareket aşağıdakilerden hangisidir?",
        "options": ["Batınilik (İsmailiyye Hareketi)", "Babailer Hareketi", "Karmatiler", "Şeyh Bedreddin Hareketi", "Kızılbaşlık"],
        "correctIndex": 0,
        "explanation": "Hasan Sabbah'ın kurduğu Batınilik (Haşhaşiler), fedaileri aracılığıyla Vezir Nizamülmülk dahil pek çok Selçuklu devlet adamına suikast düzenleyerek devleti içten sarsmıştır.",
        "distractor_trap": "Babailer Türkiye Selçuklu Devleti dönemindeki isyandır; Şeyh Bedreddin ise Osmanlı dönemindedir. Selçuklu'yu yıpratan Hasan Sabbah hareketi Batınilik'tir."
    },
    {
        "difficulty": 2,
        "prompt_text": "Büyük Selçuklu Devleti'nin 1141 yılında Karahitaylar ile yaptığı ve Sultan Sencer'in mağlup olmasıyla devletin çöküş ve yıkılış sürecine girmesine yol açan muharebe aşağıdakilerden hangisidir?",
        "options": ["Katvan Savaşı", "Yassıçemen Savaşı", "Kösedağ Savaşı", "Dandanakan Savaşı", "Ayn Calut Savaşı"],
        "correctIndex": 0,
        "explanation": "1141 Katvan Savaşı'nda Moğol kökenli Karahitaylara yenilen Selçuklular Orta Asya hakimiyetini kaybetmiş, ardından çıkan Oğuz İsyanı ile Sultan Sencer esir düşmüş ve devlet 1157'de yıkılmıştır.",
        "distractor_trap": "Kösedağ Savaşı Türkiye (Anadolu) Selçuklu Devleti'ni yıkan savaştır; Büyük Selçuklu'yu yıkan ise Katvan Savaşı'dır."
    },
    {
        "difficulty": 2,
        "prompt_text": "Büyük Selçuklu Devleti'nin parçalanmasıyla ortaya çıkan 'Atabeylikler' (hanedan hocalarının kurduğu bölgesel devletler) arasında aşağıdakilerden hangisi yer almaz?",
        "options": [
            "Zengiler (Musul Atabeyliği)",
            "İldenizoğulları (Azerbaycan Atabeyliği)",
            "Salgurlular (Fars Atabeyliği)",
            "Böfiler / Tuğtekinliler (Şam Atabeyliği)",
            "Danişmentliler (Sivas Atabeyliği)"
        ],
        "correctIndex": 4,
        "explanation": "Danişmentliler bir Atabeylik değil; Malazgirt sonrası Anadolu'da kurulan I. Dönem Türk Beyliğidir. Diğerleri ise Selçuklu şehzadelerini eğiten atabeylerin kurduğu atabeyliklerdir.",
        "distractor_trap": "ÖSYM 'Atabeylikler' (Zengiler, İldenizliler, Salgurlular, Böritiginler, Erbilliler) ile 'Anadolu Beylikleri'ni (Danişment, Saltuk vb.) birbirinin çeldiricisi olarak sıkça sorar."
    },
    {
        "difficulty": 2,
        "prompt_text": "Büyük Selçuklu Devleti'nde Sultan Melikşah'ın talebi doğrultusunda matematikçi ve astronom Ömer Hayyam başkanlığındaki bir heyet tarafından sadece tarım ve mali işleri düzenlemek amacıyla güneş yılı esaslı olarak hazırlanan takvim aşağıdakilerden hangisidir?",
        "options": ["Celali Takvim", "Rumi Takvim", "Hicri Takvim", "On İki Hayvanlı Türk Takvimi", "Kıpti Takvimi"],
        "correctIndex": 0,
        "explanation": "Celali Takvim, Sultan Melikşah (Celaleddin Melikşah) adına Ömer Hayyam tarafından hazırlanmıştır. Güneş yılı esaslıdır ve yılbaşı Nevruz (21 Mart) günüdür.",
        "distractor_trap": "Rumi takvim Osmanlı Devleti'nde 19. yüzyılda mali işler için düzenlenmiştir; Selçuklu'daki mali takvim ise Celali Takvim'dir."
    },
    {
        "difficulty": 2,
        "prompt_text": "Büyük Selçuklu veziri Nizamülmülk tarafından Bağdat'ta kurulan, Şii Fatımi ve Batıni propagandalarına ilmi yoldan cevap vermek, devlet memuru yetiştirmek ve bilimi geliştirmek amacıyla açılan dönemin en büyük üniversitesi niteliğindeki medrese hangisidir?",
        "options": ["Nizamiye Medreseleri", "Yağıbasan Medresesi", "Karatay Medresesi", "Sahn-ı Seman Medresesi", "Gök Medrese"],
        "correctIndex": 0,
        "explanation": "Nizamiye Medreseleri (1067 Bağdat), dünyanın ilk planlı üniversite kampüsü kabul edilir. Başmüderrisliğini ünlü İslam bilgini İmam Gazali yürütmüştür.",
        "distractor_trap": "Yağıbasan Medresesi Anadolu'daki ilk medresedir (Danişmentliler); Nizamiye ise Bağdat merkezli Büyük Selçuklu medresesidir."
    },
    {
        "difficulty": 2,
        "prompt_text": "Vezir Nizamülmülk'ün Sultan Melikşah'a sunduğu, hükümdarlara adalet, devlet yönetimi, ordu ve teşkilat konularında öğütler veren ünlü Farsça siyasetname eseri aşağıdakilerden hangisidir?",
        "options": ["Siyasetname", "Kutadgu Bilig", "Kabusname", "Nasihatü'l-Müluk", "Tarih-i Cihangüşa"],
        "correctIndex": 0,
        "explanation": "Nizamülmülk'ün 'Siyasetname' eseri, Türk-İslam devlet idaresinin kurallarını, adalet divanını ve istihbarat sistemini anlatan başyapıttır.",
        "distractor_trap": "Kutadgu Bilig Türkçe ve Karahanlı dönemidir; Siyasetname ise Farsça olup Nizamülmülk tarafından Büyük Selçuklu'da kaleme alınmıştır."
    },

    # --- TEST 7 (61-70): Anadolu Selçuklu & Beylikler Dönemi ---
    {
        "difficulty": 2,
        "prompt_text": "1071 Malazgirt Zaferi'nden sonra Anadolu'da kurulan 'ilk Türk beyliği' olan, Erzurum merkezli kurularak Mama Hatun Türbesi ve Üç Kümbetler gibi eşsiz eserler bırakan beylik aşağıdakilerden hangisidir?",
        "options": ["Saltuklular", "Danişmentliler", "Mengücekliler", "Artuklular", "Çaka Beyliği"],
        "correctIndex": 0,
        "explanation": "Ebu'l-Kasım Saltuk Bey tarafından Erzurum ve civarında kurulan Saltuklular, Malazgirt sonrası Anadolu'da kurulan ilk Türk beyliğidir.",
        "distractor_trap": "Danişmentliler en güçlüsüdür, ancak 'ilk kurulan' beylik Saltuklular'dır."
    },
    {
        "difficulty": 2,
        "prompt_text": "Anadolu'da kurulan I. Dönem Türk beyliklerinden Danişmentliler tarafından Tokat Niksar'da inşa edilen ve Anadolu'daki 'ilk Türk medresesi' kabul edilen tarihi yapı aşağıdakilerden hangisidir?",
        "options": ["Yağıbasan Medresesi", "Karatay Medresesi", "İnce Minareli Medrese", "Çifte Minareli Medrese", "Caca Bey Medresesi"],
        "correctIndex": 0,
        "explanation": "Danişmentli Yağıbasan tarafından Tokat Niksar'da 1157 yılında yaptırılan Yağıbasan Medresesi (Çukur Medrese), Anadolu topraklarındaki ilk medrese olma özelliğine sahiptir.",
        "distractor_trap": "Caca Bey Medresesi Kırşehir'deki rasathanedir; Karatay Konya'dadır. Anadolu'daki ilk medrese Yağıbasan'dır."
    },
    {
        "difficulty": 2,
        "prompt_text": "UNESCO Dünya Miras Listesi'nde yer alan, Mengücekliler döneminde 1228 yılında inşa edilen ve taş işçiliğindeki muazzam geometrik kabartmaları sebebiyle 'Anadolu'nun Elhamrası' olarak anılan Divriği Ulu Camii ve Darüşşifası hangi ilimizde bulunmaktadır?",
        "options": ["Sivas", "Erzurum", "Erzincan", "Kayseri", "Tokat"],
        "correctIndex": 0,
        "explanation": "Divriği Ulu Camii ve Darüşşifası Sivas'ın Divriği ilçesinde Mengücekli hükümdarı Ahmet Şah ve eşi Turan Melek tarafından yaptırılmıştır.",
        "distractor_trap": "Mengücekliler Erzincan merkezli kurulduğu için şehrin Erzincan olduğu sanılabilir; Divriği ilçesi Sivas sınırları içerisindedir."
    },
    {
        "difficulty": 2,
        "prompt_text": "1081 yılında İzmir'de bir donanma kurarak ilk Türk amirali unvanını alan ve Türk Deniz Kuvvetleri'nin kuruluş yılı olarak kabul edilen tarihin sahibi Türk beyi kimdir?",
        "options": ["Çaka Bey", "Karamürsel Alp", "Umur Bey", "Barbaros Hayrettin Paşa", "Piri Reis"],
        "correctIndex": 0,
        "explanation": "Çaka Bey, 1081 yılında İzmir'de ilk Türk donanmasını inşa etmiş, Midilli, Sakız, Sisam adalarını fethetmiştir. 1081 yılı Türk Deniz Kuvvetleri'nin kuruluş yılı kabul edilir.",
        "distractor_trap": "Karamürsel Alp Osmanlı'nın ilk kaptan-ı deryasıdır; ilk Türk amirali ve denizcisi ise Çaka Bey'dir."
    },
    {
        "difficulty": 2,
        "prompt_text": "Türkiye Selçuklu Devleti ile Bizans arasında 1176 yılında meydana gelen ve II. Kılıç Arslan'ın zaferiyle sonuçlanan Miryokefalon Savaşı'nın Türk ve dünya tarihi açısından en kritik sonucu aşağıdakilerden hangisidir?",
        "options": [
            "Anadolu'nun tapusunun kesin olarak Türklerin eline geçmesi ve Bizans'ın Türkleri Anadolu'dan atma umudunun tamamen sona ermesi",
            "İstanbul'un Türkler tarafından fethedilmesi",
            "Bizans İmparatorluğu'nun resmen tarihten silinmesi",
            "Haçlı Seferleri'nin sona ermesi",
            "Anadolu Türk siyasi birliğinin kesin olarak sağlanması"
        ],
        "correctIndex": 0,
        "explanation": "Miryokefalon Zaferi ile Anadolu'nun kesin bir Türk yurdu olduğu tescillenmiş; Batılı kaynaklar bu savaştan sonra Anadolu için 'Turchia' (Türkiye) adını kullanmaya başlamıştır.",
        "distractor_trap": "Pasinler keşif, Malazgirt kapı açan, Miryokefalon ise tapuyu alan (yurt tutan) savaştır."
    },
    {
        "difficulty": 2,
        "prompt_text": "Türkiye Selçuklu Devleti'nde uluslararası ticareti geliştirmek amacıyla uygulanan tedbirler arasında aşağıdakilerden hangisi yer almaz?",
        "options": [
            "Dünyada ilk kez devlet destekli 'Mala Zarar Sigortası' sisteminin uygulanması",
            "Kervansaraylarda yerli ve yabancı tüccarların 3 gün boyunca ücretsiz konaklatılması ve tedavi edilmesi",
            "Sinop, Alanya (Alaiye) ve Antalya gibi liman şehirlerinin fethedilerek deniz ticaret üsleri yapılması",
            "Venedik ve Cenevizli tüccarlara düşük gümrük tarifesi uygulanması",
            "Tüm yabancı tüccarların mallarına el konularak zorunlu müsadere uygulanması"
        ],
        "correctIndex": 4,
        "explanation": "Selçuklular yabancı tüccarın malına el koymak bir yana, haydutların yağmaladığı malları hazineden karşılayan dünyadaki ilk 'sigortacılık' sistemini uygulamışlardır.",
        "distractor_trap": "Selçuklular ticarette son derece liberal ve teşvik edici olmuşlardır. Müsadere (mala el koyma) ticareti baltalayacağı için asla uygulanmamıştır."
    },
    {
        "difficulty": 2,
        "prompt_text": "1230 yılında Türkiye Selçuklu Sultanı I. Alâeddin Keykubad ile Harzemşahlar hükümdarı Celaleddin Harzemşah arasında meydana gelen ve Harzemşahların yıkılış sürecine girmesine yol açan Yassıçemen Savaşı'nın Türkiye Selçukluları açısından en olumsuz jeopolitik sonucu ne olmuştur?",
        "options": [
            "Anadolu ile Moğollar arasındaki tampon bölgenin ortadan kalkması ve Anadolu'nun doğrudan Moğol istilasına açık hale gelmesi",
            "Bizans'ın Konya'yı işgal etmesi",
            "Haçlıların Akdeniz kıyılarını tamamen ele geçirmesi",
            "İkta sisteminin çökmesi",
            "Karamanoğulları Beyliği'nin bağımsızlığını ilan etmesi"
        ],
        "correctIndex": 0,
        "explanation": "Harzemşahların yıkılmasıyla Selçuklu ile Moğol İlhanlılar arasındaki tampon bölge yok olmuş, nitekim 1243'te Moğollar Kösedağ Savaşı ile Anadolu'yu istila etmiştir.",
        "distractor_trap": "Yassıçemen Savaşı askeri bir zaferdir ancak jeopolitik bir felakettir; tampon bölgeyi yok etmiştir."
    },
    {
        "difficulty": 3,
        "prompt_text": "1240 yılında Türkiye Selçuklu Devleti'nde II. Gıyaseddin Keyhüsrev döneminde Adıyaman ve Güneydoğu Anadolu'da patlak veren, Türk tarihindeki ilk sosyo-dini nitelikli halk isyanı kabul edilen hareket aşağıdakilerden hangisidir?",
        "options": ["Baba İshak (Babailer) İsyanı", "Şeyh Bedreddin İsyanı", "Celali İsyanları", "Şahkulu İsyanı", "Cimri (Siyavuş) Olayı"],
        "correctIndex": 0,
        "explanation": "1240 Baba İshak İsyanı, devletin güçlükle bastırdığı ilk dini ve sosyal ayaklanmadır. Bu isyan Selçuklu'nun zaafını Moğollara göstermiş ve Kösedağ hezimetine zemin hazırlamıştır.",
        "distractor_trap": "Şeyh Bedreddin Osmanlı dönemindeki ilk dini-sosyal isyandır. Anadolu Selçuklu'daki ilk dini-sosyal isyan ise Baba İshak (Babailer) İsyanı'dır."
    },
    {
        "difficulty": 2,
        "prompt_text": "1277 yılında Konya'yı ele geçirerek 'Bugünden sonra divanda, dergahta, bargahta, mecliste ve meydanda Türkçeden başka dil kullanılmaya!' fermanını yayınlayan ve Türkçeyi resmi dil ilan eden beylik ve lideri aşağıdakilerden hangisidir?",
        "options": [
            "Karamanoğulları - Karamanoğlu Mehmet Bey",
            "Germiyanoğulları - Yakup Bey",
            "Karesioğulları - Karesi Bey",
            "Candaroğulları - İsfendiyar Bey",
            "Aydınoğulları - Umur Bey"
        ],
        "correctIndex": 0,
        "explanation": "Karamanoğlu Mehmet Bey, 13 Mayıs 1277 tarihinde yayınladığı tarihi fermanla Farsçanın yerine Türkçeyi devlet dili yapmıştır.",
        "distractor_trap": "Her yıl 13 Mayıs Türk Dil Bayramı olarak kutlanır. Bu ferman Karamanoğlu Mehmet Bey'e aittir."
    },
    {
        "difficulty": 2,
        "prompt_text": "Kırşehir'de Ahi Evran tarafından temelleri atılan, esnaf ve zanaatkarlar arasında dayanışmayı, mesleki ahlakı ve çırak-kalfa-usta hiyerarşisini kuran esnaf teşkilatına ve Ahi Evran'ın eşi Fatma Bacı tarafından kurulan dünyanın ilk kadın sivil toplum örgütüne verilen isimler hangisinde doğru verilmiştir?",
        "options": [
            "Ahilik Teşkilatı - Bacıyan-ı Rum",
            "Lonca - Gaziyan-ı Rum",
            "Fütüvvet - Abdalan-ı Rum",
            "Gedik - Ahiyan-ı Rum",
            "Kapan - Bacıyan-ı Rum"
        ],
        "correctIndex": 0,
        "explanation": "Ahilik esnaf teşkilatıdır. Ahi Evran'ın eşi Fatma Bacı (Fatma Hatun) tarafından kurulan kadın koluna ise 'Bacıyan-ı Rum' (Anadolu Bacıları) denir.",
        "distractor_trap": "Bacıyan-ı Rum dünyadaki ilk kadın teşkilatıdır. Gaziyan-ı Rum alpler, Abdalan-ı Rum ise dervişlerdir."
    },

    # --- TEST 8 (71-80): Kültür, Medeniyet, Divanlar, Hukuk & Bilim ---
    {
        "difficulty": 3,
        "prompt_text": "Büyük Selçuklu Devleti'nde ve Türkiye Selçuklularında devlet işlerinin görüşüldüğü Divan-ı Saltanat'a bağlı alt divanlar ile görevleri eşleştirmelerinden hangisi yanlıştır?",
        "options": [
            "Divan-ı İnşa (Tuğra) - Devletin iç ve dış yazışmalarını yürüten divan",
            "Divan-ı İstifa - Devletin mali işlerine ve bütçesine bakan divan (Başkanı: Müstevfi)",
            "Divan-ı İşraf - Devletin idari ve mali işlerini denetleyen teftiş divanı (Başkanı: Müşrif)",
            "Divan-ı Arz - Ordunun maaş, levazım ve teçhizat işlerine bakan divan (Başkanı: Emir-i Arz)",
            "Divan-ı Mezalim - Sadece esnaf arasındaki fiyat ve kalite ihtilaflarını çözen zabıta divanı"
        ],
        "correctIndex": 4,
        "explanation": "Divan-ı Mezalim zabıta mahkemesi değildir; bizzat sultanın başkanlık ettiği, ağır siyasi suçların, devlet memurlarının yolsuzluklarının ve adaletsizliklerin karara bağlandığı 'Yüksek Yargı / Temyiz Mahkemesi'dir.",
        "distractor_trap": "Esnaf işlerine bakan görevli 'Muhtesip'tir. Divan-ı Mezalim ise en üst düzey devlet mahkemesidir."
    },
    {
        "difficulty": 2,
        "prompt_text": "Türk-İslam devletlerinde hukuk 'Şeri Hukuk' ve 'Örfi Hukuk' olmak üzere iki ana koldan yürütülmüştür.\n\nBuna göre şeri davalara bakan hakimlerin başı olan 'Kadi'l-Kudat' ile örfi yargının başı olan görevli aşağıdakilerden hangisinde doğru eşleştirilmiştir?",
        "options": [
            "Kadi'l-Kudat - Emir-i Dad",
            "Kadi'l-Kudat - Müstevfi",
            "Emir-i Dad - Muhtesip",
            "Müşrif - Hacibü'l-Hüccab",
            "Kadi'l-Asker - Subaşı"
        ],
        "correctIndex": 0,
        "explanation": "Şeri mahkemelerin en üst yetkilisi 'Kadi'l-Kudat' (Baş Kadı); örfi hukukun başı ve adalet bakanı niteliğindeki görevli ise 'Emir-i Dad'dır.",
        "distractor_trap": "Emir-i Dad örfi adaletin başıdır; vezir veya sultan dahil herkesi tebaaya zulmettiğinde yargılama yetkisi vardır."
    },
    {
        "difficulty": 2,
        "prompt_text": "Büyük Selçuklu ve Anadolu Selçuklu devletlerinde geliri devlet memurlarına ve ordu komutanlarına hizmet karşılığı bırakılan, maaş yerine verilen ve karşılığında devlete 'Cebelü' adı verilen atlı asker yetiştirilen toprak sistemi aşağıdakilerden hangisidir?",
        "options": ["İkta Sistemi", "Mülk Toprak", "Vakıf Toprak", "Yurtluk Toprak", "Ocaklık Toprak"],
        "correctIndex": 0,
        "explanation": "İkta sistemi (Osmanlı'daki Tımar sistemi), hazineden para harcamadan daimi bir atlı ordu (cebelü) beslenmesini, üretimin denetlenmesini ve taşrada asayişin sağlanmasını temin eden mükemmel bir toprak düzenidir.",
        "distractor_trap": "İkta arazisi satılamaz, devredilemez, miras bırakılamaz; mülkiyeti devlete aittir. Memur sadece vergisini toplar."
    },
    {
        "difficulty": 3,
        "prompt_text": "Türkiye Selçuklu Devleti'nde hükümdar çocuklarına 'Melik' adı verilirdi. Melikleri eyaletlerde devlet tecrübesi kazanmaları için eğiten tecrübeli hocalara ve devlet adamlarına ne ad verilirdi?",
        "options": ["Atabey", "Lala", "İnal", "Subaşı", "Müstevfi"],
        "correctIndex": 0,
        "explanation": "Selçuklularda hükümdar çocuğuna 'Melik', hocasına 'Atabey' denirdi. (İslam öncesi İnal/Ataman, Osmanlı'da ise Lala).",
        "distractor_trap": "Osmanlı'daki Lala ile Selçuklu'daki Atabey unvanları ÖSYM tarafından birbirine alternatif olarak test edilir."
    },
    {
        "difficulty": 2,
        "prompt_text": "Avrupa'da 'Alpharabius' olarak bilinen, Aristo felsefesini İslam dünyasında yeniden canlandırdığı için 'Muallim-i Sani' (İkinci Öğretmen) unvanıyla anılan ve Birleşmiş Milletler fikrine benzeyen 'İdeal Devlet' (El-Medinetü'l-Fazıla) eserini yazan Türk-İslam filozofu kimdir?",
        "options": ["Farabi", "İbn-i Sina", "İbn-i Rüşt", "Gazali", "Harezmi"],
        "correctIndex": 0,
        "explanation": "Farabi, Aristo'dan sonra 'İkinci Öğretmen' unvanını almıştır. Kitabü'l-Musiki eseriyle müziği notaya dökmüş, kanun çalgısını geliştirmiş ve Medinetü'l-Fazıla'yı yazmıştır.",
        "distractor_trap": "İbn-i Sina 'Avicenna' ve Tıbbın Hükümdarıdır; Muallim-i Sani ise Farabi'dir."
    },
    {
        "difficulty": 2,
        "prompt_text": "Batı dünyasında 'Avicenna' olarak tanınan, yazdığı 'El-Kanun fi't-Tıbb' (Tıbbın Kanunu) adlı eseri yüzyıllarca Avrupa üniversitelerinde temel tıp ders kitabı olarak okutulan büyük hekim ve filozof kimdir?",
        "options": ["İbn-i Sina", "Farabi", "Razi", "Akşemseddin", "İbn-i Heysem"],
        "correctIndex": 0,
        "explanation": "İbn-i Sina tıp sahasındaki devasa birikimiyle 'Şeyhü'r-Reis' ve 'Avicenna' olarak bilinir. El-Kanun fi't-Tıbb eseri modern tıbbın öncüsüdür.",
        "distractor_trap": "Razi çiçek ve kızamık hastalığını ayıran hekimdir; El-Kanun'un yazarı ise İbn-i Sina'dır."
    },
    {
        "difficulty": 3,
        "prompt_text": "Gazneli Mahmut'un sarayında ağırladığı ve kendisi için 'Sarayımın en değerli hazinesidir' dediği; trigonometri, enlem-boylam hesaplamaları ve Dünya'nın yarıçapını gerçeğe çok yakın hesaplayan 'El-Asarü'l-Bakiye' eserinin sahibi bilim insanı kimdir?",
        "options": ["Biruni", "Harezmi", "Uluğ Bey", "Ali Kuşçu", "Ömer Hayyam"],
        "correctIndex": 0,
        "explanation": "Biruni (973-1048), Gazneli Mahmut'un himayesinde yaşamış, yerçekiminden enlem-boylama kadar yüzlerce keşif yapmış ve Sultan Mahmut tarafından 'Sarayımın en değerli hazinesi' olarak onurlandırılmıştır.",
        "distractor_trap": "Harezmi 'Cebir'in kurucusudur (sıfır rakamı). Gazneli Mahmut'un hazinem dediği deha ise Biruni'dir."
    },
    {
        "difficulty": 2,
        "prompt_text": "Sıfır (0) rakamını ilk kez matematiksel işlemlerde kullanan, 'El-Kitabü'l-Muhtasar fi Hisabi'l-Cebr ve'l-Mukabele' adlı eseriyle 'Cebir' biliminin kurucusu kabul edilen Türk-İslam bilgini aşağıdakilerden hangisidir?",
        "options": ["Harezmi", "Biruni", "Farabi", "Ömer Hayyam", "Ali Kuşçu"],
        "correctIndex": 0,
        "explanation": "Harezmi sıfır rakamını ve algoritma (ismini Harezmi'den alır) kavramını matematiğe kazandıran büyük cebir dâhisidir.",
        "distractor_trap": "Algoritma terimi Harezmi'nin Batı dillerindeki söylenişinden türemiştir."
    },
    {
        "difficulty": 2,
        "prompt_text": "Selçuklularda sarayın genel düzenini sağlayan, hükümdar ile halk ve hükümdar ile diğer devlet görevlileri arasındaki iletişimi düzenleyen en üst düzey saray görevlisine ne ad verilirdi?",
        "options": ["Hacibü'l-Hüccab (Ulu Hacip)", "Candar", "Silahtar", "Çaşnigir", "Abdar"],
        "correctIndex": 0,
        "explanation": "Hacip, hükümdarın özel yardımcısı ve teşrifatçısıdır. En kıdemlisine 'Hacibü'l-Hüccab' veya 'Ulu Hacip' denirdi. Kutadgu Bilig'de iyi bir hacibin nitelikleri genişçe anlatılır.",
        "distractor_trap": "Candar saray muhafızı, Çaşnigir yemek tadıcısıdır. Saray protokol şefi ise Hacip'tir."
    },
    {
        "difficulty": 3,
        "prompt_text": "Türk-İslam mimarisinde hükümdar, hanedan üyeleri veya dönemin önde gelen devlet adamları için inşa edilen, alt katı cenazelik (kripta), üst katı ise kubbe veya külahla örtülü anıt mezar yapılarına ne ad verilir?",
        "options": ["Kümbet", "Türbe", "Külliye", "Kurgan", "Zaviye"],
        "correctIndex": 0,
        "explanation": "Kümbet, Türklerin çadır mimarisini (otağ) taşa yansıtarak geliştirdikleri konik/piramidal külahlı anıt mezar tipidir. Silindirik veya sekizgen gövdelidir (Ahlat mezar taşları, Döner Kümbet vb.).",
        "distractor_trap": "Kurgan İslamiyet öncesi toprak mezardır; Kümbet ise çadırdan esinlenilmiş taştan Türk-İslam anıt mezarıdır."
    }
]

def generate_sql():
    sql_path = os.path.join("docs", "soru_havuzu", "tarih", "02_ilk_turk_islam_devletleri_ek.sql")
    os.makedirs(os.path.dirname(sql_path), exist_ok=True)
    
    with open(sql_path, "w", encoding="utf-8") as f:
        f.write("-- =====================================================================\n")
        f.write("-- ÜNİTE 2: İlk Türk-İslam Devletleri (EK 40 SORU: Test 5, 6, 7, 8)\n")
        f.write("-- Toplam Soru: 40 Soru (Mevcut 40 + Bu Ek 40 = 80 Soru / 8 Test)\n")
        f.write("-- Şema: public.questions (lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap)\n")
        f.write("-- =====================================================================\n\n")
        
        for idx, q in enumerate(questions, 41):
            lesson = "Tarih"
            topic = "İlk Türk-İslam Devletleri"
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
            
    print(f"Başarıyla 40 ek soru oluşturuldu: {sql_path}")

if __name__ == "__main__":
    generate_sql()
