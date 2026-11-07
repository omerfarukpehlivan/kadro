# -*- coding: utf-8 -*-
import json
import os
import sys

questions = [
    # 1. Bolşevik İhtilali ve SSCB
    {
        "difficulty": 2,
        "prompt_text": "Çarlık Rusyası'nda I. Dünya Savaşı'nın yarattığı ekonomik buhran ve askeri mağlubiyetler sonucunda Ekim 1917'de Lenin liderliğindeki Bolşevikler iktidarı ele geçirmiştir. Yeni rejim iç savaş sürecinde tarımı canlandırmak ve üretimi artırmak amacıyla 'NEP' (Yeni Ekonomi Politikası) adını verdiği geçici serbest piyasa tedbirlerini uygulamıştır.\n\nLenin'in ölümünden sonra SSCB lideri olan ve köylülerin topraklarını zorla devletleştirerek kolhoz adı verilen kolektif çiftlikleri kuran Sovyet lideri aşağıdakilerden hangisidir?",
        "options": ["Lev Troçki", "Josef Stalin", "Nikita Kruşçev", "Leonid Brejnev", "Mihail Gorbaçov"],
        "correctIndex": 1,
        "explanation": "Lenin'in 1924'te ölümünden sonra iktidara gelen Josef Stalin, NEP politikasına son vermiş; 'Kolektifleştirme' (Kolhoz) ve I. Beş Yıllık Sanayi Planı'nı yürürlüğe koymuştur. Direnen köylüler Gulag çalışma kamplarına sürülmüş veya cezalandırılmıştır.",
        "distractor_trap": "Kızıl Ordu'nun kurucusu olan Troçki, Stalin ile giriştiği iktidar mücadelesini kaybederek sürgüne gönderilmiştir. Kolektifleştirme ve katı devletçilik politikasının mimarı Stalin'dir."
    },
    # 2. Basmacı Harekâtı ve Enver Paşa
    {
        "difficulty": 2,
        "prompt_text": "Çarlık Rusyası'nın yıkılmasının ardından Türkistan coğrafyasında Sovyet Rusya egemenliğine ve Bolşevik Kızıl Ordu'ya karşı 1918-1930'lu yıllar arasında yürütülen milli direniş hareketine 'Basmacı Harekâtı' adı verilmiştir.\n\nBu harekete katılarak Türkistan Türklerini birleştirmek için mücadele eden ve 1922 yılında Tacikistan'da Bolşeviklerle girdiği çatışmada şehit düşen Osmanlı komutanı ve devlet adamı aşağıdakilerden hangisidir?",
        "options": ["Talat Paşa", "Cemal Paşa", "Enver Paşa", "Kazım Karabekir Paşa", "Mustafa Şokay"],
        "correctIndex": 2,
        "explanation": "Enver Paşa, I. Dünya Savaşı sonrası Türkistan'a geçerek Basmacı Harekâtı'nın başına geçmiş ve Türkistan bağımsızlık mücadelesini organize etmiştir. 4 Ağustos 1922'de Belhivan yakınlarında şehit düşmüştür.",
        "distractor_trap": "Talat Paşa Berlin'de, Cemal Paşa Tiflis'te Ermeni suikastçılar tarafından şehit edilmiştir. Türkistan'da Basmacı Harekâtı sırasında şehit olan komutan Enver Paşa'dır."
    },
    # 3. İsmail Gaspıralı ve Tercüman Gazetesi
    {
        "difficulty": 1,
        "prompt_text": "Kırım Türklerinin büyük fikir adamı olan, Usul-i Cedid (Yeni Metot) okullarını açarak eğitimde modernleşmeyi savunan, çıkardığı Tercüman Gazetesi ile bütün Türk dünyasını aydınlatmayı amaçlayan ve 'Dilde, fikirde, işte birlik' şiarını ortaya koyan düşünür aşağıdakilerden hangisidir?",
        "options": [
            "Yusuf Akçura",
            "Zeki Velidi Togan",
            "İsmail Gaspıralı",
            "Mehmet Emin Resulzade",
            "Sadri Maksudi Arsal"
        ],
        "correctIndex": 2,
        "explanation": "İsmail Gaspıralı (1851-1914), Kırım Bahçesaray'da 'Tercüman' gazetesini yayımlamış ve Türk dünyasının ortak bir yazı dili ve milli şuurda birleşmesi için 'Dilde, fikirde, işte birlik' prensibini savunmuştur.",
        "distractor_trap": "Yusuf Akçura 'Üç Tarz-ı Siyaset' makalesiyle; Zeki Velidi Togan tarihçiliği ve Başkurt bağımsızlığıyla; Mehmet Emin Resulzade ise Azerbaycan Cumhuriyeti kuruculuğuyla tanınır. 'Dilde, fikirde, işte birlik' sözü Gaspıralı'ya aittir."
    },
    # 4. Azerbaycan Halk Cumhuriyeti ve Mehmet Emin Resulzade
    {
        "difficulty": 1,
        "prompt_text": "28 Mayıs 1918 tarihinde Tiflis'te kurulan, Doğu'da ve Türk-İslam dünyasında ilk demokratik cumhuriyet olma unvanını taşıyan devlet Azerbaycan Halk Cumhuriyeti'dir.\n\nAzerbaycan Halk Cumhuriyeti'nin kurucusu olan ve 'Bir kere yükselen bayrak, bir daha inmez!' tarihi sözünü söyleyen milli lider kimdir?",
        "options": [
            "Ebulfez Elçibey",
            "Haydar Aliyev",
            "Mehmet Emin Resulzade",
            "İlham Aliyev",
            "Neriman Nerimanov"
        ],
        "correctIndex": 2,
        "explanation": "Mehmet Emin Resulzade, 1918'de bağımsızlığını ilan eden Azerbaycan Halk Cumhuriyeti'nin kurucu lideri ve Milli Şura başkanıdır. 'Bir kere yükselen bayrak bir daha inmez!' vecizesi bağımsız Azerbaycan'ın sembolü olmuştur.",
        "distractor_trap": "Ebulfez Elçibey, 1991'de SSCB dağıldıktan sonraki bağımsız Azerbaycan'ın ikinci cumhurbaşkanı ve halk cephesi lideridir. 1918'deki ilk cumhuriyetin lideri ise Mehmet Emin Resulzade'dir."
    },
    # 5. Meiji Restorasyonu (Japonya)
    {
        "difficulty": 2,
        "prompt_text": "19. yüzyılın sonlarında Japonya'da feodal derebeylik (Şogunluk) düzenine ve samuray sınıfının imtiyazlarına son verilmiş, İmparator Mutsuhito tahta geçerek Batı tarzı askeri, idari, hukuki ve teknolojik reformları başlatan aydınlanma sürecini başlatmıştır.\n\nJaponya'yı Doğu Asya'nın en güçlü modern sanayi ve askeri devleti haline getiren bu tarihi dönüşüme ne ad verilir?",
        "options": [
            "Kültür Devrimi",
            "Meiji Restorasyonu",
            "Taiping İsyanı",
            "Boksör Ayaklanması",
            "Şintoizm Reformu"
        ],
        "correctIndex": 1,
        "explanation": "1868 yılında İmparator Mutsuhito'nun başlattığı modernleşme hamlesine 'Meiji Dönemi / Meiji Restorasyonu' (Aydınlanmış Yönetim) denir. Japonya bu süreçte geleneksel kültürünü korurken Batı'nın teknolojisini ve bilimini alarak küresel bir güce dönüşmüştür.",
        "distractor_trap": "Kültür Devrimi Çin'de Mao Zedong tarafından yapılmıştır. Boksör Ayaklanması ise Çin'deki yabancı karşıtı isyandır. Japonya'nın modernleşme hamlesi Meiji Restorasyonu'dur."
    },
    # 6. 1929 Kara Perşembe ve Dünya Ekonomik Bunalımı
    {
        "difficulty": 1,
        "prompt_text": "24 Ekim 1929 tarihinde New York Wall Street Borsası'nın aniden çökmesiyle başlayan ve küresel ölçekte bankaların iflasına, fabrikaların kapanmasına ve milyonlarca insanın işsiz kalmasına yol açan kriz tarihe 'Kara Perşembe' ve 'Büyük Buhran' olarak geçmiştir.\n\nABD Başkanı F. D. Roosevelt'in bu derin buhrandan çıkmak amacıyla devlet müdahalesini, kamu yatırımlarını ve sosyal yardımları artıran ekonomik kurtarma programına ne ad verilir?",
        "options": [
            "Monroe Doktrini",
            "Marshall Planı",
            "New Deal (Yeni Düzen)",
            "Truman Doktrini",
            "Eisenhower Doktrini"
        ],
        "correctIndex": 2,
        "explanation": "Franklin D. Roosevelt, 1933'te iktidara geldikten sonra Keynesyen iktisat modeline dayanan 'New Deal' (Yeni Düzen) programını uygulamış; kamu harcamaları, istihdam projeleri ve bankacılık reformlarıyla ABD ekonomisini toparlamıştır.",
        "distractor_trap": "Marshall Planı ve Truman Doktrini II. Dünya Savaşı sonrasında (1947) Soğuk Savaş bağlamında ortaya çıkmıştır. 1929 Bunalımı'na karşı ABD'nin geliştirdiği iç ekonomik program 'New Deal'dir."
    },
    # 7. 1929 Buhranı'nın Türkiye'ye Etkileri
    {
        "difficulty": 2,
        "prompt_text": "1929 Dünya Ekonomik Bunalımı Türkiye'yi de derinden etkilemiş; ihraç edilen tarım ürünlerinin fiyatları düşmüş ve dış ticaret açığı büyümüştür.\n\nTürkiye Cumhuriyeti'nin 1929 Buhranı'nın olumsuz etkilerini hafifletmek amacıyla aldığı tedbirler arasında aşağıdakilerden hangisi yer almaz?",
        "options": [
            "Devletçi ekonomi politikasına ve planlı sanayileşmeye ağırlık verilmesi",
            "Kazım Özalp başkanlığında 'Milli İktisat ve Tasarruf Cemiyeti'nin kurulması",
            "Dış ticarette 'Kliring' ve 'Takas' (malımı alanın malını alırım) sistemine geçilmesi",
            "Yerli malı kullanımının teşvik edilmesi için Yerli Malı Haftası ilan edilmesi",
            "IMF (Uluslararası Para Fonu) ile ilk stand-by anlaşmasının imzalanması"
        ],
        "correctIndex": 4,
        "explanation": "IMF (Uluslararası Para Fonu) 1944 Bretton Woods Konferansı ile kurulmuş, Türkiye 1947'de üye olmuş ve Türkiye'nin ilk IMF stand-by anlaşması 1961 yılında (Cemal Gürsel hükümeti döneminde) imzalanmıştır. 1929 yılında henüz IMF bulunmamaktadır.",
        "distractor_trap": "Kliring ve Takas sistemi 1929 buhranında Türkiye'nin uyguladığı çok önemli bir modeldir ve ÖSYM bunu sıklıkla seçeneklere koyar. IMF ise II. Dünya Savaşı sonrasının kurumudur."
    },
    # 8. İki Savaş Arası Barışı Koruma Çabaları
    {
        "difficulty": 2,
        "prompt_text": "1928 yılında Fransa Dışişleri Bakanı Aristide Briand ile ABD Dışişleri Bakanı Frank Kellogg öncülüğünde Paris'te imzalanan, 'savunmaya dayanmayan savaşı kanun dışı ilan eden' ve uluslararası anlaşmazlıkların çözümünde savaşı bir dış politika aracı olarak reddeden pakt aşağıdakilerden hangisidir?",
        "options": [
            "Locarno Antlaşması",
            "Briand-Kellogg Paktı",
            "Küçük Antant",
            "Balkan Antantı",
            "Sadabad Paktı"
        ],
        "correctIndex": 1,
        "explanation": "Briand-Kellogg Paktı (1928), savaşı ulusal politikanın bir aracı olmaktan çıkaran ve barışçıl çözümleri zorunlu kılan evrensel bir anlaşmadır. Türkiye de 1929 yılında bu pakta katılmıştır.",
        "distractor_trap": "Locarno Antlaşması (1925) Almanya'nın batı sınırlarını güvence altına alan bölgesel bir anlaşmadır. 'Savaşı kanun dışı ilan eden' küresel pakt ise Briand-Kellogg Paktı'dır."
    },
    # 9. Totaliter Rejimler: İtalya (Faşizm)
    {
        "difficulty": 2,
        "prompt_text": "I. Dünya Savaşı'ndan galip çıkmasına rağmen umduğunu bulamayan İtalya'da ekonomik ve sosyal kriz derinleşmiştir. 1922 yılında Benito Mussolini liderliğindeki faşistlerin Napoli'den başkent Roma'ya gerçekleştirdiği 'Kara Gömlekliler Yürüyüşü' sonucunda Kral Vittorio Emanuele iktidarı Mussolini'ye devretmek zorunda kalmıştır.\n\nMussolini'nin Akdeniz'i İtalyan gölü haline getirme ülküsünü ifade eden tarihi Latince doktrin aşağıdakilerden hangisidir?",
        "options": [
            "Lebensraum (Hayat Sahası)",
            "Mare Nostrum (Bizim Deniz)",
            "Drang nach Osten (Doğuya Doğru)",
            "Status Quo Ante Bellum",
            "Pax Romana"
        ],
        "correctIndex": 1,
        "explanation": "Mussolini liderliğindeki faşist İtalya, antik Roma İmparatorluğu'nu canlandırma hayaliyle Akdeniz'e 'Mare Nostrum' (Bizim Deniz) demiş ve Balkanlar ile Kuzey Afrika ve Doğu Akdeniz'de saldırgan bir yayılmacılık izlemiştir.",
        "distractor_trap": "Lebensraum (Hayat Sahası) Hitler Almanyası'nın Alman ırkı için Doğu Avrupa'da toprak kazanma doktrinidir. İtalya ve Akdeniz denildiğinde cevap 'Mare Nostrum'dur."
    },
    # 10. Totaliter Rejimler: Almanya (Nazizm)
    {
        "difficulty": 2,
        "prompt_text": "Weimar Cumhuriyeti'nin yaşadığı hiperenflasyon ve Versay Antlaşması'nın ağır şartlarını fırsat bilerek iktidara gelen Adolf Hitler liderliğindeki Nasyonal Sosyalist Alman İşçi Partisi (Nazi), 1933'te totaliter bir rejim kurmuştur.\n\nHitler'in hapishanede kaleme aldığı ve Alman ırkının yaşaması için özellikle Doğu Avrupa ve Rusya topraklarının ele geçirilmesini öngören 'Hayat Sahası' (Lebensraum) teorisini anlattığı kitabı aşağıdakilerden hangisidir?",
        "options": [
            "Devlet",
            "Kavgam (Mein Kampf)",
            "Kapital",
            "Toplum Sözleşmesi",
            "Tarihin Sonu"
        ],
        "correctIndex": 1,
        "explanation": "Hitler 1923 yılındaki başarısız Birahane Darbesi sonrası cezaevinde iken 'Kavgam' (Mein Kampf) kitabını yazmış; antisemitizm, Alman ırkının üstünlüğü ve Lebensraum (Hayat Sahası) ideolojisinin temellerini burada formüle etmiştir.",
        "distractor_trap": "Kavgam kitabı Hitler'in siyasi manifestosudur. Sorularda Lebensraum ve Nasyonal Sosyalizm ilkelerinin yer aldığı temel kaynak olarak sorulur."
    },
    # 11. Guernica Tablosu ve İspanya İç Savaşı
    {
        "difficulty": 2,
        "prompt_text": "1936-1939 yılları arasında İspanya'da Cumhuriyetçiler ile General Francisco Franco liderliğindeki Milliyetçiler arasında kanlı bir iç savaş yaşanmıştır. Nazi Almanyası'nın Kondor Lejyonu uçakları 1937'de Guernica kasabasını bombalayarak binlerce masum sivili katletmiştir.\n\nBu insanlık dramını ve savaşın vahşetini kübist tarzda ölümsüzleştiren 'Guernica' tablosunun sahibi dünyaca ünlü İspanyol ressam kimdir?",
        "options": [
            "Salvador Dali",
            "Pablo Picasso",
            "Francisco Goya",
            "Claude Monet",
            "Vincent van Gogh"
        ],
        "correctIndex": 1,
        "explanation": "Guernica tablosu, Pablo Picasso tarafından 1937 Paris Uluslararası Fuarı İspanya pavyonu için çizilmiştir. Tablo, savaşın yıkıcılığını ve faşizmin vahşetini anlatan modern sanatın en önemli başyapıtıdır.",
        "distractor_trap": "Sürrealist ressam Salvador Dali ile kübist Picasso sıkça karıştırılır. Guernica tablosu tartışmasız biçimde Pablo Picasso'ya aittir."
    },
    # 12. II. Dünya Savaşı'nın Başlaması ve Yıldırım Savaşı
    {
        "difficulty": 1,
        "prompt_text": "II. Dünya Savaşı, 1 Eylül 1939 tarihinde Nazi Almanyası'nın tank, zırhlı birlikler ve hava kuvvetlerini eş zamanlı olarak kullanarak başlattığı 'Blitzkrieg' (Yıldırım Savaşı) taktiği ile hangi ülkeyi işgal etmesi sonucunda resmen başlamıştır?",
        "options": ["Avusturya", "Çekoslovakya", "Polonya", "Fransa", "Belçika"],
        "correctIndex": 2,
        "explanation": "Almanya'nın 1 Eylül 1939 sabahı Polonya'ya saldırması üzerine İngiltere ve Fransa 3 Eylül'de Almanya'ya savaş ilan etmiş ve II. Dünya Savaşı fiilen başlamıştır.",
        "distractor_trap": "Almanya savaştan önce Avusturya'yı ilhak etmiş (Anschluss) ve Çekoslovakya'nın Südet bölgesini almıştır. Ancak II. Dünya Savaşı'nı resmen başlatan kıvılcım 'Polonya'nın işgali'dir."
    },
    # 13. Fransa'nın İşgali ve Vichy Hükümeti
    {
        "difficulty": 2,
        "prompt_text": "II. Dünya Savaşı'nda Almanya'nın Maginot Hattı'nı Ardenler Ormanları üzerinden aşarak Fransa'yı kısa sürede mağlup etmesi üzerine, Fransa topraklarının güneyinde Almanya ile iş birliği yapan kukla bir hükümet kurulmuştur.\n\nBaşkenti Vichy olan ve Mareşal Philippe Petain başkanlığında kurulan bu işbirlikçi rejim karşısında Londra'da 'Özgür Fransa Hareketi'ni başlatan Fransız lider kimdir?",
        "options": [
            "Charles de Gaulle",
            "Georges Clemenceau",
            "Francois Mitterrand",
            "Aristide Briand",
            "Edouard Daladier"
        ],
        "correctIndex": 0,
        "explanation": "Fransa'nın teslimiyetçi Vichy Hükümeti'ne karşı General Charles de Gaulle Londra'ya kaçmış, BBC radyosundan Fransız halkına direniş çağrısı yaparak Özgür Fransa Hareketi'ni (Özgür Fransız Kuvvetleri) teşkilatlandırmıştır.",
        "distractor_trap": "Vichy Hükümeti başkanı Petain'dir; buna karşı direnişi yöneten ve savaştan sonra Fransa Cumhurbaşkanı olan lider Charles de Gaulle'dür."
    },
    # 14. Barbarossa Harekâtı ve Stalingrad Muharebesi
    {
        "difficulty": 2,
        "prompt_text": "Nazi Almanyası'nın 22 Haziran 1941'de SSCB'ye karşı başlattığı devasa askeri taarruz harekâtına 'Barbarossa Harekâtı' adı verilmiştir.\n\nAlman 6. Ordusu'nun Mareşal Paulus komutasında kuşattığı, tarihin en kanlı sokak çatışmalarına sahne olan ve Almanya'nın ilk büyük kesin mağlubiyetini alarak savaştaki üstünlüğünü kaybettiği II. Dünya Savaşı'nın doğu cephesindeki dönüm noktası muharebesi aşağıdakilerden hangisidir?",
        "options": [
            "Moskova Muharebesi",
            "Stalingrad Muharebesi",
            "Kursk Tank Muharebesi",
            "Leningrad Kuşatması",
            "Kırım Harekâtı"
        ],
        "correctIndex": 1,
        "explanation": "Ağustos 1942 - Şubat 1943 arasındaki Stalingrad Muharebesi'nde Sovyet Kızıl Ordusu Mareşal Paulus komutasındaki Alman ordusunu imha etmiş veya esir almıştır. Bu muharebe II. Dünya Savaşı'nın genel gidişatını Müttefikler lehine çeviren en kritik dönüm noktasıdır.",
        "distractor_trap": "Kursk Muharebesi tarihin en büyük tank savaşıdır; ancak Almanların genel taarruz inisiyatifini tamamen kaybettiği ve psikolojik kırılmanın yaşandığı asıl dönüm noktası Stalingrad Muharebesi'dir."
    },
    # 15. Pearl Harbor Baskını
    {
        "difficulty": 1,
        "prompt_text": "7 Aralık 1941 tarihinde Japon İmparatorluk Donanması'nın Hawaii Adaları'ndaki ABD Pasifik Filosu üssüne düzenlediği ve ABD Başkanı Roosevelt'in 'Utanç Günü' (Day of Infamy) olarak nitelediği ani hava saldırısı aşağıdakilerden hangisidir?",
        "options": [
            "Midway Baskını",
            "Pearl Harbor Baskını",
            "Guadalcanal Harekâtı",
            "Okinawa Çıkarması",
            "Mercan Denizi Muharebesi"
        ],
        "correctIndex": 1,
        "explanation": "7 Aralık 1941 Pearl Harbor Baskını ile Japonya ABD'nin Pasifik filosunu vurmuştur. Bu olay üzerine tarafsızlık politikasını terk eden ABD resmen II. Dünya Savaşı'na Müttefikler safında girmiştir.",
        "distractor_trap": "Midway Muharebesi Pearl Harbor'dan 6 ay sonra (Haziran 1942) Pasifik'te ABD'nin Japon donanmasını hezimete uğrattığı deniz muharebesidir. İlk baskın ise Pearl Harbor'dır."
    },
    # 16. Normandiya Çıkarması (Overlord Harekâtı)
    {
        "difficulty": 2,
        "prompt_text": "6 Haziran 1944 tarihinde General Dwight D. Eisenhower başkomutanlığında Müttefik kuvvetlerinin Fransa kıyılarına başlattığı, tarihin en büyük amfibi (denizden karaya) askeri operasyonu olan ve Batı Avrupa'nın Nazi işgalinden kurtarılmasını sağlayan harekât aşağıdakilerden hangisidir?",
        "options": [
            "Overlord Harekâtı (Normandiya Çıkarması)",
            "Barbarossa Harekâtı",
            "Kartal Hücumu",
            "Meşale Harekâtı (Operation Torch)",
            "Merkür Harekâtı"
        ],
        "correctIndex": 0,
        "explanation": "6 Haziran 1944 Normandiya Çıkarması (kod adı Overlord Harekâtı), Müttefiklerin Batı Cephesi'ni açarak Fransa'yı ve ardından tüm Batı Avrupa'yı kurtarmasını sağlamıştır. Başkomutan General Eisenhower'dır.",
        "distractor_trap": "Meşale Harekâtı Kuzey Afrika'ya yapılan çıkarmadır. Fransa kıyılarına yapılan tarihi büyük amfibi çıkarma ise Overlord / Normandiya Çıkarması'dır."
    },
    # 17. Savaş Sırasındaki Konferanslar: Yalta ve Potsdam
    {
        "difficulty": 2,
        "prompt_text": "Şubat 1945'te toplanan Yalta Konferansı'nda 'Üç Büyükler' (Roosevelt, Churchill ve Stalin) bir araya gelerek savaş sonrası dünya düzenini görüşmüştür.\n\nAşağıdakilerden hangisi Yalta Konferansı'nda alınan kararlardan biri değildir?",
        "options": [
            "Almanya'nın dört ayrı işgal bölgesine (ABD, SSCB, İngiltere, Fransa) ayrılması",
            "Birleşmiş Milletler Güvenlik Konseyi'nde beş daimi üyeye veto hakkı tanınması",
            "1 Mart 1945'e kadar Mihver devletlere resmen savaş açan ülkelerin Birleşmiş Milletler'e kurucu üye olabilmesi",
            "SSCB'nin Almanya'nın tesliminden sonra Japonya'ya savaş açmayı kabul etmesi",
            "İsrail Devleti'nin kurulmasının oy birliğiyle onaylanması"
        ],
        "correctIndex": 4,
        "explanation": "İsrail Devleti'nin kuruluşu Yalta Konferansı'nda kararlaştırılmamıştır. İsrail, II. Dünya Savaşı sonrasında 1947 BM Taksim Planı ve 1948 yılındaki ilanıyla kurulmuştur. Diğer tüm maddeler Yalta Konferansı'nın tarihi kararlarıdır.",
        "distractor_trap": "Yalta Konferansı'nda '1 Mart 1945'e kadar Almanya'ya savaş ilan edenlerin BM kurucusu olabileceği' kararı Türkiye'nin sembolik olarak Almanya'ya savaş ilan etmesine yol açan maddedir!"
    },
    # 18. Birleşmiş Milletler ve San Francisco Konferansı
    {
        "difficulty": 1,
        "prompt_text": "Nisan-Haziran 1945 tarihleri arasında toplanan ve 50 devletin katılımıyla Birleşmiş Milletler Antlaşması'nın (BM Şartı) imzalanarak BM teşkilatının resmen kurulduğu uluslararası konferans aşağıdakilerden hangisidir?",
        "options": [
            "San Francisco Konferansı",
            "Bretton Woods Konferansı",
            "Potsdam Konferansı",
            "Kazablanka Konferansı",
            "Dumbarton Oaks Konferansı"
        ],
        "correctIndex": 0,
        "explanation": "Birleşmiş Milletler Cemiyeti, 25 Nisan - 26 Haziran 1945 tarihleri arasında toplanan San Francisco Konferansı ile resmen kurulmuştur. Türkiye de 51 kurucu devletten biri olarak antlaşmayı imzalamıştır.",
        "distractor_trap": "Bretton Woods para ve ekonomi (IMF/Dünya Bankası) konferansıdır. Potsdam ise Almanya'nın tasfiyesi konferansıdır. BM'nin bizzat kurulduğu konferans San Francisco'dur."
    },
    # 19. Atom Bombası ve Savaşın Sonu
    {
        "difficulty": 1,
        "prompt_text": "II. Dünya Savaşı'nın Pasifik Cephesi'nde Japonya'nın direncini kırmak ve kayıpları önlemek amacıyla ABD Başkanı Harry Truman'ın emriyle Ağustos 1945'te sırasıyla atom bombası atılan iki Japon şehri aşağıdakilerden hangisinde doğru verilmiştir?",
        "options": [
            "Tokyo - Osaka",
            "Hiroşima - Nagazaki",
            "Kyoto - Hiroşima",
            "Nagazaki - Yokohama",
            "Hiroşima - Kobe"
        ],
        "correctIndex": 1,
        "explanation": "ABD, 6 Ağustos 1945'te 'Enola Gay' isimli B-29 uçağıyla Hiroşima'ya uranyum bombası (Little Boy), 9 Ağustos 1945'te ise Nagazaki'ye plütonyum bombası (Fat Man) atmıştır. Japonya 2 Eylül 1945'te USS Missouri zırhlısında kayıtsız şartsız teslim belgesini imzalamıştır.",
        "distractor_trap": "Tokyo başkenttir ve geleneksel yangın bombalarıyla vurulmuştur; atom bombası ise Hiroşima ve Nagazaki şehirlerine atılmıştır."
    },
    # 20. II. Dünya Savaşı Sırasında Türkiye ve Dış Politika
    {
        "difficulty": 2,
        "prompt_text": "II. Dünya Savaşı yıllarında Cumhurbaşkanı İsmet İnönü ve Türk diplomasisi, ülkeyi fiilen savaşın yıkımından uzak tutabilmek amacıyla 'aktif tarafsızlık' ve dengeli bir dış politika izlemiştir.\n\nBu süreçte İngiltere Başbakanı Winston Churchill ile Cumhurbaşkanı İsmet İnönü'nün bir tren vagonunda bir araya geldiği ve Türkiye'nin savaşa girmesi için yoğun baskı yapıldığı görüşme aşağıdakilerden hangisidir?",
        "options": [
            "1943 Adana Görüşmesi",
            "1943 I. Kahire Konferansı",
            "1941 Moskova Zirvesi",
            "1944 Tahran Zirvesi",
            "1945 Yalta Zirvesi"
        ],
        "correctIndex": 0,
        "explanation": "30-31 Ocak 1943'te Adana Yenice tren istasyonunda (Adana Mülakatı) İsmet İnönü ile Churchill görüşmüştür. Churchill Türkiye'nin müttefikler safında savaşa girmesini istemiş; İnönü ise Türk ordusunun silah ve teçhizat yetersizliğini öne sürerek talebi ustaca ertelemiştir.",
        "distractor_trap": "Adana Görüşmesi doğrudan Türkiye topraklarında (Yenice istasyonu vagonunda) yapılmıştır. Kahire Konferansı ise Mısır'da Roosevelt, Churchill ve İnönü arasında gerçekleşmiştir."
    },
    # 21. II. Dünya Savaşı'nda Türkiye'nin İç Ekonomisi
    {
        "difficulty": 2,
        "prompt_text": "II. Dünya Savaşı sırasında Türkiye fiilen savaşa girmemesine rağmen bir milyona yakın genç erkeğin silah altına alınması üretimde büyük düşüşe yol açmış, karaborsacılık ve fahiş fiyat artışları baş göstermiştir.\n\nTürkiye'de hükümetin bu olağanüstü dönemde fiyatları denetlemek, fabrikalara el koyabilmek ve çalışma zorunluluğu getirebilmek amacıyla 1940 yılında çıkardığı kapsamlı olağanüstü yetki kanunu aşağıdakilerden hangisidir?",
        "options": [
            "Takrir-i Sükun Kanunu",
            "Milli Korunma Kanunu",
            "Teşvik-i Sanayi Kanunu",
            "Hıyanet-i Vataniye Kanunu",
            "Varlık Vergisi Kanunu"
        ],
        "correctIndex": 1,
        "explanation": "1940 yılında çıkarılan Milli Korunma Kanunu ile hükümete ekonomiyi doğrudan denetleme, ürünlere narh koyma, zorunlu çalışma mükellefiyeti getirme ve gerektiğinde işletmelere el koyma gibi olağanüstü geniş yetkiler tanınmıştır. Petrol Ofisi ve Et ve Balık Kurumu bu kanuna dayanılarak kurulmuştur.",
        "distractor_trap": "Varlık Vergisi (1942) savaş zenginlerinden ve tüccarlardan bir defaya mahsus alınan servet vergisidir; devletin ekonomiye genel müdahalesini düzenleyen temel çatı kanun ise 'Milli Korunma Kanunu'dur."
    },
    # 22. Varlık Vergisi ve Aşkale
    {
        "difficulty": 2,
        "prompt_text": "1942 yılında Şükrü Saraçoğlu Hükümeti tarafından savaş zenginlerine, karaborsacılara ve özellikle büyük tüccarlara yönelik çıkarılan ve belirlenen olağanüstü vergiyi ödeyemeyenlerin Erzurum Aşkale'ye bedeni çalışma kampına gönderildiği mali uygulama aşağıdakilerden hangisidir?",
        "options": [
            "Aşar Vergisi",
            "Toprak Mahsulleri Vergisi",
            "Varlık Vergisi",
            "Tekalif-i Milliye",
            "Ağnam Vergisi"
        ],
        "correctIndex": 2,
        "explanation": "11 Kasım 1942'de kabul edilen Varlık Vergisi Kanunu ile yüksek kazanç sahipleri ve tüccarlar vergilendirilmiş; vergisini belirlenen sürede ödemeyen mükellefler borçlarını bedenen ödemek üzere Erzurum Aşkale'deki çalışma kampına gönderilmiştir.",
        "distractor_trap": "Toprak Mahsulleri Vergisi doğrudan köylüden ayni olarak alınan tarım vergisidir. Aşkale çalışma kampı uygulaması ise 'Varlık Vergisi' mükellefleri içindir."
    },
    # 23. Soğuk Savaş Kavramı ve Demir Perde
    {
        "difficulty": 1,
        "prompt_text": "II. Dünya Savaşı sonrasında ABD öncülüğündeki Batı Bloku ile SSCB öncülüğündeki Doğu Bloku arasında 1945-1990 yılları arasında yaşanan nükleer silahlanma yarışı, casusluk ve bölgesel vekalet savaşları dönemine 'Soğuk Savaş' adı verilmiştir.\n\nİngiltere Başbakanı Winston Churchill'in 1946 yılında ABD'de yaptığı Fulton konuşmasında Doğu Bloku ülkelerini Batı dünyasından ayıran ideolojik ve askeri sınırı tanımlamak için kullandığı ünlü ifade aşağıdakilerden hangisidir?",
        "options": [
            "Demir Perde (Iron Curtain)",
            "Berlin Duvarı",
            "Yeşil Hat",
            "Hayat Sahası",
            "Sıcak Hat"
        ],
        "correctIndex": 0,
        "explanation": "Winston Churchill, 1946'da Missouri Fulton'da yaptığı konuşmada 'Baltık'taki Stettin'den Adriyatik'teki Trieste'ye kadar kıta boyunca bir Demir Perde inmiştir.' diyerek Doğu Bloku'nu nitelemiştir. Bu ifade Soğuk Savaş terminolojisinin sembolü olmuştur.",
        "distractor_trap": "Berlin Duvarı 1961'de Doğu Almanya tarafından inşa edilmiş fiziksel bir duvardır. Churchill'in 1946'daki konuşmasında zikrettiği mecazi kavram ise 'Demir Perde'dir."
    },
    # 24. Truman Doktrini ve Marshall Planı
    {
        "difficulty": 2,
        "prompt_text": "1947 yılında ABD Başkanı Harry Truman tarafından ilan edilen ve SSCB'nin Akdeniz ve Orta Doğu'ya inmesini engellemek (Çevreleme Politikası) amacıyla doğrudan Türkiye ve Yunanistan'a askeri ve mali yardım yapılmasını öngören tarihi doktrin aşağıdakilerden hangisidir?",
        "options": [
            "Monroe Doktrini",
            "Truman Doktrini",
            "Eisenhower Doktrini",
            "Carter Doktrini",
            "Reagan Doktrini"
        ],
        "correctIndex": 1,
        "explanation": "12 Mart 1947'de ilan edilen Truman Doktrini ile ABD, Sovyet tehdidi altındaki Türkiye ve Yunanistan'a 400 milyon dolar askeri ve mali yardım sağlamıştır. Bu doktrin ABD'nin geleneksel yalnızlık (Monroe) politikasını tamamen terk ettiğini gösterir.",
        "distractor_trap": "Marshall Planı (Haziran 1947) tüm savaştan çıkan Avrupa ülkelerine yönelik ekonomik kalkınma paketidir. Doğrudan Türkiye ve Yunanistan'a askeri destek sağlayan ilk doktrin ise 'Truman Doktrini'dir."
    },
    # 25. Varşova Paktı ve Kominform
    {
        "difficulty": 2,
        "prompt_text": "Doğu Bloku'nda Batı'nın kurduğu NATO'ya (1949) askeri bir karşılık vermek ve Batı Almanya'nın NATO'ya dahil edilmesine karşı 1955 yılında SSCB öncülüğünde Doğu Bloku ülkeleri arasında kurulan askeri savunma paktı aşağıdakilerden hangisidir?",
        "options": [
            "Kominform",
            "Komekon",
            "Varşova Paktı",
            "Bağdat Paktı",
            "Şanghay İşbirliği Örgütü"
        ],
        "correctIndex": 2,
        "explanation": "NATO'ya karşı Doğu Bloku'nun askeri kanadı olarak 1955'te 'Varşova Paktı' kurulmuştur. Kominform ideolojik örgütlenme, Komekon ise ekonomik işbirliği örgütlenmesidir.",
        "distractor_trap": "Doğu Bloku kurumlarının işlevleri karıştırılır: Kominform = İdeolojik (Komünist partiler arası bağ), Komekon = Ekonomik (Marshall'a karşı Molotov Planı uzantısı), Varşova Paktı = Askeri (NATO'ya karşı)."
    },
    # 26. Kore Savaşı ve Türkiye'nin NATO'ya Girişi
    {
        "difficulty": 1,
        "prompt_text": "1950 yılında Kuzey Kore'nin 38. paraleli geçerek Güney Kore'ye saldırması üzerine patlak veren Kore Savaşı'na BM Güvenlik Konseyi çağrısıyla Türkiye de Tuğgeneral Tahsin Yazıcı komutasında bir tugay göndermiştir.\n\nTürk Tugayı'nın Kunuri Muharebeleri'nde gösterdiği üstün kahramanlık ve direniş, Türkiye'nin aşağıdaki uluslararası güvenlik teşkilatlarından hangisine üye kabul edilmesinde belirleyici rol oynamıştır?",
        "options": [
            "Birleşmiş Milletler (1945)",
            "Avrupa Konseyi (1949)",
            "Kuzey Atlantik Antlaşması Örgütü - NATO (1952)",
            "Balkan Paktı (1953)",
            "Bağdat Paktı (1955)"
        ],
        "correctIndex": 2,
        "explanation": "Türkiye, Sovyet tehdidine karşı NATO'ya girmek istemiş ancak başta İngiltere ve İskandinav ülkeleri direnmiştir. TBMM kararıyla Kore'ye gönderilen Türk tugayının Kunuri'deki başarısı üzerine Türkiye, 18 Şubat 1952'de Yunanistan ile birlikte NATO'ya üye kabul edilmiştir.",
        "distractor_trap": "Türkiye BM'ye 1945'te kurucu üye olmuştur. Kore Savaşı'ndaki fedakarlık Türkiye'nin 1952'de NATO'ya kabul edilmesini sağlamıştır."
    },
    # 27. Çok Partili Hayat ve 1946 Seçimleri
    {
        "difficulty": 2,
        "prompt_text": "Türkiye'de II. Dünya Savaşı sonrasında çok partili siyasi hayata geçiş hızlanmıştır. 1945 yılında Nuri Demirağ tarafından Milli Kalkınma Partisi kurulmuş; ardından CHP içindeki muhalif milletvekilleri tarafından 'Dörtlü Takrir' verilmiştir.\n\nAşağıdaki siyasetçilerden hangisi CHP'den ayrılarak 7 Ocak 1946'da Demokrat Parti'yi (DP) kuran 'Dörtlü Takrir' imzacılarından biri değildir?",
        "options": [
            "Celal Bayar",
            "Adnan Menderes",
            "Fuat Köprülü",
            "Refik Koraltan",
            "Fevzi Çakmak"
        ],
        "correctIndex": 4,
        "explanation": "Demokrat Parti'nin kurucuları olan Dörtlü Takrir heyeti 'C-A-F-E-R' (Celal Bayar, Adnan Menderes, Fuat Köprülü, Refik Koraltan) olarak kodlanır. Mareşal Fevzi Çakmak ise 1948'de kurulan Millet Partisi'nin onursal başkanı olmuştur.",
        "distractor_trap": "Fevzi Çakmak DP listesinden bağımsız vekil seçilmiş olsa da Dörtlü Takrir'i veren ve DP'yi kuran dört isim arasında yer almaz; Millet Partisi kurucusudur."
    },
    # 28. 1950 Seçimleri ve Beyaz İhtilal
    {
        "difficulty": 1,
        "prompt_text": "14 Mayıs 1950 genel seçimlerinde, ilk kez 'gizli oy - açık tasnif' esası ve yargı denetimi uygulanmıştır. Seçimleri ezici bir çoğunlukla kazanan Demokrat Parti, 27 yıllık tek parti CHP iktidarına son vererek iktidara gelmiştir.\n\nDemokrasi tarihimizde kansız ve barışçıl yolla hükümet değişimini simgeleyen bu tarihi olaya ne ad verilir?",
        "options": [
            "Kadife Devrim",
            "Beyaz İhtilal",
            "Gül Devrimi",
            "Milli İrade Hareketi",
            "Güneş Harekâtı"
        ],
        "correctIndex": 1,
        "explanation": "14 Mayıs 1950 seçimleriyle iktidarın barışçıl ve demokratik sandık yoluyla CHP'den DP'ye geçmesi Türk siyasi tarihinde 'Beyaz İhtilal' olarak adlandırılır. Celal Bayar Cumhurbaşkanı, Adnan Menderes Başbakan olmuştur.",
        "distractor_trap": "Kadife Devrim Çekoslovakya'da komünizmin kansız çöküşüdür. Türkiye'deki 1950 barışçıl iktidar değişimi 'Beyaz İhtilal' olarak anılır."
    },
    # 29. Küba Füze Krizi (1962) ve Jüpiter Füzeleri
    {
        "difficulty": 2,
        "prompt_text": "1962 yılında SSCB'nin Küba'ya nükleer başlıklı füzeler yerleştirmesi ve ABD'nin Küba adasını deniz ablukasına almasıyla patlak veren Küba Füze Krizi, dünyayı nükleer savaşın eşiğine getirmiştir.\n\nABD Başkanı J. F. Kennedy ile Sovyet lideri Nikita Kruşçev arasındaki gizli pazarlıklar sonucunda; SSCB'nin Küba'daki füzeleri sökmesi karşılığında ABD'nin aşağıdaki hangi ülkedeki 'Jüpiter' füzelerini gizlice sökmesi kararlaştırılmıştır?",
        "options": ["Almanya", "İtalya", "Türkiye", "Yunanistan", "İran"],
        "correctIndex": 2,
        "explanation": "Küba Füze Krizi'nde Sovyetler, Küba'daki füzeleri kaldırmak için ABD'nin Türkiye'deki (İzmir Çiğli) Jüpiter nükleer füzelerini sökmesini şart koşmuş ve taraflar bu şekilde anlaşmıştır. Türkiye, kendi güvenliğini ilgilendiren bu pazarlığın dışarıdan yürütüldüğünü sonradan öğrenmiştir.",
        "distractor_trap": "ÖSYM'nin en çok sorduğu Soğuk Savaş sorularındandır: Küba'daki füzelere karşılık Türkiye'deki 'Jüpiter füzeleri' sökülmüştür."
    },
    # 30. Bağlantısızlar Hareketi ve Bandung Konferansı
    {
        "difficulty": 2,
        "prompt_text": "Soğuk Savaş döneminde ne Batı Bloku'na ne de Doğu Bloku'na dahil olmak istemeyen, çoğunluğu Asya ve Afrika'daki bağımsızlığını yeni kazanmış sömürge sonrası ülkelerden oluşan 'Üçüncü Dünya' devletleri Bağlantısızlar Hareketi'ni (Non-Aligned Movement) başlatmıştır.\n\n1955 yılında Endonezya'da toplanan ve Bağlantısızlar Hareketi'nin doğuşunu simgeleyen tarihi konferans aşağıdakilerden hangisidir?",
        "options": [
            "Bandung Konferansı",
            "Kahire Konferansı",
            "Cenevre Konferansı",
            "Belgrad Konferansı",
            "Helsinki Konferansı"
        ],
        "correctIndex": 0,
        "explanation": "1955 Bandung Konferansı ile sömürgeciliğe karşı barış içinde bir arada yaşama ilkeleri (Pancasila) belirlenmiştir. Hareketin liderliğini Yugoslavya (Tito), Mısır (Nasır) ve Hindistan (Nehru) üstlenmiştir.",
        "distractor_trap": "Bağlantısızlar'ın resmi ilk zirvesi 1961 Belgrad Zirvesi'dir; ancak hareketin fikirsel temelinin atıldığı ve doğduğu ilk toplantı 1955 'Bandung Konferansı'dır."
    },
    # 31. Helsinki Nihai Senedi (1975) ve AGİK
    {
        "difficulty": 2,
        "prompt_text": "Doğu ve Batı blokları arasında Yumuşama (Detant) sürecinin en önemli diplomatik zirvesi olan ve 1975 yılında Avrupa'da mevcut sınırların dokunulmazlığını, insan haklarına saygıyı ve egemen eşitliği teyit eden 'Helsinki Nihai Senedi' imzalanmıştır.\n\nBu nihai senet ile temelleri atılan ve daha sonra daimi bir uluslararası kuruluşa dönüşen teşkilat aşağıdakilerden hangisidir?",
        "options": [
            "Avrupa Birliği (AB)",
            "Avrupa Güvenlik ve İşbirliği Teşkilatı (AGİT / AGİK)",
            "Avrupa Konseyi",
            "Kuzey Atlantik Konseyi",
            "Milletler Cemiyeti"
        ],
        "correctIndex": 1,
        "explanation": "1975 Helsinki Nihai Senedi ile Avrupa Güvenlik ve İşbirliği Konferansı (AGİK) kurulmuş, 1994 Budapeşte Zirvesi'nde ismi AGİT (Avrupa Güvenlik ve İşbirliği Teşkilatı) olarak değiştirilmiştir.",
        "distractor_trap": "Helsinki Zirvesi doğrudan insan hakları ve bloklar arası güvenlikle ilgilidir ve AGİT'i doğurmuştur. Avrupa Birliği'nin temeli ise Roma Antlaşması'na (1957) dayanır."
    },
    # 32. 1973 Petrol Krizi ve OPEC/OAPEC
    {
        "difficulty": 2,
        "prompt_text": "1973 yılında patlak veren Yom Kippur (Dördüncü Arap-İsrail) Savaşı'nda ABD ve Batılı devletlerin İsrail'i açıkça desteklemesi üzerine, Arap Petrol İhraç Eden Ülkeler Örgütü (OAPEC) Batılı ülkelere petrol ambargosu uygulamış ve petrol üretimini kısarak fiyatları dört katına çıkarmıştır.\n\nDünya ekonomisinde 'Stagflasyon' (aynı anda durgunluk ve yüksek enflasyon) kavramının doğmasına yol açan bu tarihi kriz aşağıdakilerden hangisidir?",
        "options": [
            "1929 Kara Perşembe",
            "1973 Petrol Krizi",
            "1997 Asya Kaplanları Krizi",
            "2008 Küresel Mortgage Krizi",
            "1979 İkinci Petrol Şoku"
        ],
        "correctIndex": 1,
        "explanation": "1973 Petrol Krizi (I. Petrol Şoku), OAPEC'in petrolü siyasi bir silah olarak kullanmasıyla ortaya çıkmış ve sanayileşmiş Batı ülkelerinde derin bir ekonomik resesyon ile enflasyona (stagflasyon) yol açmıştır.",
        "distractor_trap": "1979 Petrol Krizi İran İslam Devrimi sonrası yaşanmıştır; Yom Kippur Savaşı kaynaklı Batı ambargosu ve ilk büyük kriz ise '1973 Petrol Krizi'dir."
    },
    # 33. Camp David Antlaşmaları (1978)
    {
        "difficulty": 2,
        "prompt_text": "ABD Başkanı Jimmy Carter'ın arabuluculuğunda 1978 yılında imzalanan Camp David Sözleşmesi ile İsrail'i resmen tanıyan ve İsrail ile barış antlaşması imzalayan 'ilk Arap devleti' aşağıdakilerden hangisidir?",
        "options": ["Ürdün", "Suriye", "Mısır", "Lübnan", "Irak"],
        "correctIndex": 2,
        "explanation": "Mısır Cumhurbaşkanı Enver Sedat ile İsrail Başbakanı Menahem Begin arasında imzalanan Camp David Sözleşmesi (ve 1979 Washington Barış Antlaşması) ile Mısır, İsrail'i resmen tanıyan ilk Arap ülkesi olmuş ve Sina Yarımadası'nı geri almıştır.",
        "distractor_trap": "Ürdün İsrail'i tanıyan ikinci Arap devletidir (1994 Vadi Araba Antlaşması). İlk tanıyan Arap devleti Enver Sedat dönemindeki Mısır'dır."
    },
    # 34. Kıbrıs Barış Harekâtı (1974)
    {
        "difficulty": 1,
        "prompt_text": "Kıbrıs'ta Yunan cuntasının desteklediği EOKA terör örgütünün darbe yaparak ENOSIS'i (adanın Yunanistan'a bağlanması) ilan etmesi üzerine, Türkiye Cumhuriyeti garantörlük hakkını kullanarak 20 Temmuz 1974'te adaya askeri harekât düzenlemiştir.\n\nKıbrıs Barış Harekâtı sırasında görev yapan Türkiye Cumhuriyeti Başbakanı ve Başbakan Yardımcısı ikilisi ile harekâtın ünlü şifresi aşağıdakilerden hangisinde doğru verilmiştir?",
        "options": [
            "Bülent Ecevit - Necmettin Erbakan / 'Ayşe Tatile Çıksın'",
            "Süleyman Demirel - Turhan Feyzioğlu / 'Akdeniz İleri'",
            "Nihat Erim - Ferit Melen / 'Toroslar Hazır'",
            "Turgut Özal - Kaya Erdem / 'Zafer Bizimdir'",
            "Adnan Menderes - Fatin Rüştü Zorlu / 'Ada Türkündür'"
        ],
        "correctIndex": 0,
        "explanation": "1974 Kıbrıs Barış Harekâtı CHP-MSP koalisyonu döneminde Başbakan Bülent Ecevit ve Başbakan Yardımcısı Necmettin Erbakan hükümeti tarafından icra edilmiştir. İkinci Cenevre Konferansı tıkanınca Dışişleri Bakanı Turan Güneş'in Ankara'ya çektiği tarihi şifre 'Ayşe Tatile Çıksın'dır.",
        "distractor_trap": "1959-1960 Londra-Zürih garantörlük antlaşmaları Menderes dönemindedir; ancak 1974 Barış Harekâtı Bülent Ecevit ve Necmettin Erbakan hükümetindedir."
    },
    # 35. Kuzey Kıbrıs Türk Cumhuriyeti ve Rauf Denktaş
    {
        "difficulty": 1,
        "prompt_text": "Kıbrıs Türk halkının varoluş ve özgürlük mücadelesine ömrünü adayan, Türk Mukavemet Teşkilatı'nın (TMT) liderliğini yapan ve 15 Kasım 1983 tarihinde bağımsızlığını ilan eden Kuzey Kıbrıs Türk Cumhuriyeti'nin (KKTC) kurucu cumhurbaşkanı olan tarihi lider kimdir?",
        "options": [
            "Fazıl Küçük",
            "Rauf Denktaş",
            "Mehmet Ali Talat",
            "Derviş Eroğlu",
            "Cengiz Topel"
        ],
        "correctIndex": 1,
        "explanation": "Rauf Denktaş (1924-2012), Kıbrıs davasının efsanevi lideri ve 1983'te kurulan KKTC'nin kurucu ilk Cumhurbaşkanıdır. Dr. Fazıl Küçük ise Kıbrıs Türk toplumunun ilk lideridir.",
        "distractor_trap": "Dr. Fazıl Küçük Kıbrıs Türk Federe Devleti öncesi ilk toplum lideri iken; 1983'te kurulan KKTC'nin 'kurucu cumhurbaşkanı' Rauf Denktaş'tır."
    },
    # 36. Glasnost ve Perestroyka (SSCB'nin Dağılması)
    {
        "difficulty": 2,
        "prompt_text": "1985 yılında SSCB Komünist Partisi Genel Sekreterliği'ne getirilen Mihail Gorbaçov, çökmekte olan Sovyet ekonomisini ve yozlaşan bürokratik yapıyı kurtarmak amacıyla iki temel reform paketi açıklamıştır.\n\nGorbaçov'un açıkladığı 'Glasnost' ve 'Perestroyka' kavramlarının Türkçe karşılıkları aşağıdakilerden hangisinde doğru olarak verilmiştir?",
        "options": [
            "Açıklık / Şeffaflık - Yeniden Yapılanma",
            "Sosyalizm - Kamulaştırma",
            "Yeniden Yapılanma - Barış İçinde Bir Arada Yaşama",
            "Hürriyet - Kolektifleştirme",
            "Sansürsüzlük - Sanayileşme"
        ],
        "correctIndex": 0,
        "explanation": "Mihail Gorbaçov'un Sovyet sistemini kurtarmak için getirdiği 'Glasnost' açıklık ve şeffaflık (sansürün gevşetilmesi ve ifade özgürlüğü); 'Perestroyka' ise yeniden yapılanma (ekonomik sistemin esnetilmesi) anlamına gelir. Ancak bu reformlar rejimi kurtaramamış, 1991'de birliğin dağılmasına yol açmıştır.",
        "distractor_trap": "Glasnost ve Perestroyka kelimelerinin yerleri ters verilerek sıkça çeldirici oluşturulur. Glasnost = Açıklık, Perestroyka = Yeniden Yapılanma."
    },
    # 37. Bağımsız Türk Cumhuriyetleri ve Liderleri
    {
        "difficulty": 2,
        "prompt_text": "1991 yılında Sovyet Sosyalist Cumhuriyetler Birliği'nin (SSCB) resmen dağılmasıyla birlikte Kafkaslar ve Orta Asya'daki Türk devletleri bağımsızlıklarını kazanmış ve Türkiye bu cumhuriyetleri tanıyan ilk devlet olmuştur.\n\nBuna göre aşağıdaki 'Türk Cumhuriyeti' ve 'bağımsızlık dönemindeki ilk lider' eşleştirmelerinden hangisi yanlıştır?",
        "options": [
            "Kazakistan - Nursultan Nazarbayev",
            "Özbekistan - İslam Kerimov",
            "Türkmenistan - Sapar Murat Niyazov (Türkmenbaşı)",
            "Kırgızistan - Askar Akayev",
            "Azerbaycan - Haydar Aliyev"
        ],
        "correctIndex": 4,
        "explanation": "Azerbaycan 1991'de bağımsızlığını kazandığında ilk cumhurbaşkanı Ayaz Muttalibov olmuş, ardından efsanevi milli lider Ebulfez Elçibey seçilmiştir. Haydar Aliyev ise 1993 yılında Elçibey'den sonra cumhurbaşkanı olmuştur.",
        "distractor_trap": "Haydar Aliyev Azerbaycan'ın çok etkili bir lideri olmakla birlikte bağımsızlığın ilk cumhurbaşkanı değildir; bağımsızlık mücadelesi Elçibey ve Halk Cephesi önderliğinde yürütülmüştür."
    },
    # 38. Bosna Savaşı ve Aliya İzzetbegoviç
    {
        "difficulty": 2,
        "prompt_text": "1992-1995 yılları arasında Bosna-Hersek'te Sırp güçlerinin gerçekleştirdiği ve Srebrenitsa'da binlerce masum Boşnak Müslümanın katledildiği soykırım karşısında halkının bağımsızlığını savunan, 'Bilge Kral' unvanıyla anılan ve Bosna Savaşı'nı sona erdiren Dayton Barış Antlaşması'na imza atan lider kimdir?",
        "options": [
            "Slobodan Milosevic",
            "Aliya İzzetbegoviç",
            "Radovan Karadzic",
            "Franjo Tudjman",
            "İbrahim Rugova"
        ],
        "correctIndex": 1,
        "explanation": "Aliya İzzetbegoviç (1925-2003), Bosna-Hersek'in bağımsızlık lideri, düşünürü ve ilk cumhurbaşkanıdır. 'Doğu ve Batı Arasında İslam' ve 'İslam Deklarasyonu' eserlerinin sahibidir; dünya çapında 'Bilge Kral' olarak tanınır.",
        "distractor_trap": "Slobodan Milosevic ve Karadzic Sırp savaş suçlularıdır; Tudjman Hırvat liderdir. Bilge Kral lakaplı Boşnak lider Aliya İzzetbegoviç'tir."
    },
    # 39. Türk Konseyi / Türk Devletleri Teşkilatı ve TİKA
    {
        "difficulty": 2,
        "prompt_text": "Türkiye'nin Türk cumhuriyetleri ve akraba topluluklarla kültürel, ekonomik ve teknik iş birliğini geliştirmek amacıyla kurduğu kurumlara ilişkin;\nI. TİKA (Türk İşbirliği ve Koordinasyon Ajansı Başkanlığı), 1992 yılında Dışişleri Bakanlığı'na bağlı olarak kurulmuş kalkınma ajansıdır.\nII. TÜRKSOY (Uluslararası Türk Kültürü Teşkilatı), 1993 yılında Türk dili konuşan ülkelerin kültür bakanları tarafından kurulmuştur.\nIII. 2009 Nahçıvan Anlaşması ile temelleri atılan Türk Keneşi (Konseyi), 2021 İstanbul Zirvesi'nde 'Türk Devletleri Teşkilatı' adını almıştır.\n\nYukarıda verilen bilgilerden hangileri doğrudur?",
        "options": [
            "Yalnız I",
            "I ve II",
            "II ve III",
            "I ve III",
            "I, II ve III"
        ],
        "correctIndex": 4,
        "explanation": "Verilen üç öncül de Türk dünyası entegrasyonuna ilişkin son derece güncel ve tarihsel olarak doğru bilgilerdir: 1992 TİKA, 1993 TÜRKSOY ve 2009'da kurulan Türk Konseyi'nin 2021'de Türk Devletleri Teşkilatı'na (TDT) dönüşmesi KPSS'de sıklıkla sorulur.",
        "distractor_trap": "Türk Devletleri Teşkilatı'nın eski adının Türk Dili Konuşan Ülkeler İşbirliği Konseyi (Türk Konseyi) olduğu ve kuruluş belgesinin Nahçıvan Anlaşması olduğu çok güncel bir sınav bilgisidir."
    },
    # 40. Bilim, Teknoloji ve Uzay Yarışı
    {
        "difficulty": 2,
        "prompt_text": "Soğuk Savaş döneminde ABD ve SSCB arasında askeri rekabetin yanı sıra büyük bir uzay ve teknoloji yarışı yaşanmıştır.\n\nBuna göre uzay yarışıyla ilgili aşağıdaki tarihi gelişmelerden hangisi yanlış eşleştirilmiştir?",
        "options": [
            "Sputnik 1 (1957) - SSCB tarafından uzaya fırlatılan dünyanın ilk yapay uydusu",
            "Yuri Gagarin (1961) - Vostok 1 aracıyla uzaya çıkan ve Dünya'nın yörüngesini dolaşan ilk insan",
            "Valentina Tereşkova (1963) - Uzaya giden ilk kadın kozmonot",
            "Neil Armstrong (1969) - Apollo 11 göreviyle Ay yüzeyine ilk ayak basan astronot",
            "Laika (1957) - ABD tarafından uzaya gönderilen ilk canlı maymun"
        ],
        "correctIndex": 4,
        "explanation": "Laika, ABD tarafından değil, SSCB tarafından 3 Kasım 1957'de Sputnik 2 uydusuyla uzaya gönderilen dünyaca ünlü sokak köpeğidir. Dolayısıyla eşleştirme yanlıştır.",
        "distractor_trap": "Uzaya giden ilk canlı Laika bir köpektir ve Sovyetler Birliği tarafından gönderilmiştir; ABD'ye ait olduğu veya maymun olduğu yönündeki çeldiricilere dikkat edilmelidir."
    }
]

def generate_sql():
    sql_path = os.path.join("docs", "soru_havuzu", "tarih", "07_cagdas_turk_ve_dunya_tarihi.sql")
    os.makedirs(os.path.dirname(sql_path), exist_ok=True)
    
    with open(sql_path, "w", encoding="utf-8") as f:
        f.write("-- =====================================================================\n")
        f.write("-- ÜNİTE 7: Çağdaş Türk ve Dünya Tarihi (40 Soru)\n")
        f.write("-- Kapsam: İki Savaş Arası Dönem, II. Dünya Savaşı, Soğuk Savaş Dönemi,\n")
        f.write("--         Yumuşama (Detant) Dönemi, Küreselleşen Dünya ve Çağdaş Gelişmeler\n")
        f.write("-- Şema: public.questions (lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap)\n")
        f.write("-- =====================================================================\n\n")
        
        for idx, q in enumerate(questions, 1):
            lesson = "Tarih"
            topic = "Çağdaş Türk ve Dünya Tarihi"
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
                f"-- Soru {idx}\n"
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
            
    print(f"Başarıyla {len(questions)} soru oluşturuldu: {sql_path}")

if __name__ == "__main__":
    generate_sql()
