# -*- coding: utf-8 -*-
"""
KPSS Vatandaşlık — Konu 3: Temel Hak ve Ödevler (40 Özgün Soru)
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
        "lesson": "Vatandaşlık",
        "topic": "Temel Hak ve Ödevler",
        "difficulty": 1,
        "prompt_text": "1982 Anayasası'nın 13. maddesine göre temel hak ve hürriyetler ancak aşağıdakilerden hangisi ile sınırlandırılabilir?",
        "options": [
            "Cumhurbaşkanlığı Kararnamesi",
            "Kanun",
            "Yönetmelik",
            "Genelge",
            "Valilik Kararı"
        ],
        "correctIndex": 1,
        "explanation": "Anayasa m. 13'ün amir hükmü gereğince temel hak ve hürriyetler; özlerine dokunulmaksızın yalnızca Anayasa'nın ilgili maddelerinde belirtilen sebeplere bağlı olarak ve ancak KANUNLA sınırlanabilir. Cumhurbaşkanlığı kararnamesi veya yönetmelikle temel haklar sınırlanamaz.",
        "distractor_trap": "ÖSYM temel hakların sınırlandırılma aracını sıkça sorar: Tek ve mutlak araç TBMM tarafından çıkarılan KANUN'dur."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Temel Hak ve Ödevler",
        "difficulty": 1,
        "prompt_text": "Georg Jellinek'in kamu hakları sınıflandırmasına göre bireyi devlete ve topluma karşı koruyan, devletin kişinin özel alanına müdahale etmesini engelleyen haklara 'Negatif Statü (Koruyucu) Hakları' denir.\n\nAşağıdakilerden hangisi bir negatif statü (kişisel) hakkıdır?",
        "options": [
            "Sağlık hakkı",
            "Konut edinme hakkı",
            "Özel hayatın gizliliği ve korunması hakkı",
            "Sosyal güvenlik hakkı",
            "Sendika kurma hakkı"
        ],
        "correctIndex": 2,
        "explanation": "Özel hayatın gizliliği, konut dokunulmazlığı, kişi hürriyeti, mülkiyet ve yaşam hakkı gibi haklar devletin karışmaması gereken kişisel (koruyucu/negatif statü) haklarıdır. Sağlık, konut, sosyal güvenlik ve sendika ise devletten hizmet istenen 'Sosyal ve Ekonomik (İsteme)' haklardır.",
        "distractor_trap": "Kişisel haklar = Karışma (Negatif); Sosyal haklar = Hizmet ver (Pozitif/İsteme); Siyasi haklar = Yönetime kat (Aktif)."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Temel Hak ve Ödevler",
        "difficulty": 1,
        "prompt_text": "1982 Anayasası'na göre dernek kurma, sendika kurma veya toplantı ve gösteri yürüyüşü düzenleme hakkı ile ilgili ortak anayasal kural aşağıdakilerden hangisidir?",
        "options": [
            "İçişleri Bakanlığı'ndan önceden yazılı izin alma zorunluluğu vardır.",
            "Valilik veya kaymakamlıktan izin alındıktan sonra faaliyet gösterilebilir.",
            "Önceden izin almaksızın kurulabilir veya düzenlenebilirler.",
            "Sadece 30 yaşını doldurmuş vatandaşlar tarafından kurulabilirler.",
            "Kurulabilmeleri için mutlaka TBMM onayından geçmeleri gerekir."
        ],
        "correctIndex": 2,
        "explanation": "Anayasa m. 33 (Dernek), m. 34 (Toplantı ve Gösteri Yürüyüşü) ve m. 51 (Sendika) açıkça hükme bağlamıştır: Herkes 'ÖNCEDEN İZİN ALMAKSIZIN' dernek kurma, sendika kurma, silahsız ve saldırısız toplantı ve gösteri yürüyüşü yapma hakkına sahiptir.",
        "distractor_trap": "Halk arasında izin alınması gerektiği sanılır; anayasal olarak izin şartı KESİNLİKLE YOKTUR, sadece bildirim esastır."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Temel Hak ve Ödevler",
        "difficulty": 1,
        "prompt_text": "1982 Anayasası'na göre bir derneğin kurulabilmesi için fiil ehliyetine sahip en az kaç gerçek veya tüzel kişinin bir araya gelmesi kanunen şarttır?",
        "options": [
            "3",
            "5",
            "7",
            "10",
            "30"
        ],
        "correctIndex": 2,
        "explanation": "Dernekler Kanunu uyarınca en az 7 gerçek veya tüzel kişi bir araya gelerek dernek kurabilir. Siyasi parti kurmak için ise en az 30 Türk vatandaşı gerekir.",
        "distractor_trap": "Dernek = En az 7 kişi; Siyasi Parti = En az 30 kişi. Sayıları birbirine karıştırmayınız."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Temel Hak ve Ödevler",
        "difficulty": 1,
        "prompt_text": "Aşağıdakilerden hangisi 1982 Anayasası'nda düzenlenen 'Siyasi Haklar ve Ödevler' (Aktif Statü Hakları) grubunda yer almaz?",
        "options": [
            "Seçme, seçilme ve siyasi faaliyette bulunma hakkı",
            "Kamu hizmetlerine girme hakkı",
            "Dilekçe, bilgi edinme ve kamu denetçisine başvurma hakkı",
            "Vergi ödevi",
            "Toplu iş sözleşmesi ve grev hakkı"
        ],
        "correctIndex": 4,
        "explanation": "Grev ve lokavt ile toplu iş sözleşmesi hakkı (m. 53-54) işçi-işveren ilişkilerini düzenleyen bir 'Sosyal ve Ekonomik (Pozitif Statü) Hak'tır. Seçme-seçilme, kamu hizmetine girme, dilekçe ve vergi ise 'Siyasi Hak ve Ödevler'dendir.",
        "distractor_trap": "Grev hakkı siyasi değil, sosyal ve ekonomik haktır! Memurların grev hakkı anayasada yasaktır."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Temel Hak ve Ödevler",
        "difficulty": 1,
        "prompt_text": "1982 Anayasası'nın 15. maddesinde yer alan ve savaş, seferberlik veya olağanüstü hal (OHAL) dönemlerinde dahi KESİNLİKLE DOKUNULAMAYACAK olan 'Sert Çekirdek Haklar' arasında aşağıdakilerden hangisi yer almaz?",
        "options": [
            "Kişinin yaşama hakkı, maddi ve manevi varlığının bütünlüğü (savaş hukukuna uygun ölümler hariç)",
            "Kimsenin din, vicdan, düşünce ve kanaatlerini açıklamaya zorlanamaması ve bunlardan dolayı suçlanamaması",
            "Suç ve cezaların geçmişe yürütülememesi ilkesi",
            "Suçluluğu mahkeme kararı ile saptanıncaya kadar kimsenin suçlu sayılamaması (Masumiyet karinesi)",
            "Mülkiyet hakkı ve miras hakkı"
        ],
        "correctIndex": 4,
        "explanation": "Sert çekirdek haklar dörttür: 1) Yaşama hakkı ve vücut bütünlüğü, 2) Din ve vicdanını açıklamaya zorlanmama, 3) Masumiyet karinesi, 4) Suç ve cezaların geçmişe yürümemesi. Mülkiyet hakkı sert çekirdek hak değildir; OHAL ve savaşta sınırlandırılabilir ve el konulabilir.",
        "distractor_trap": "Savaşta dahi dokunulamayan haklar dörttür; mülkiyet ve seyahat hürriyeti bu grupta yer almaz."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Temel Hak ve Ödevler",
        "difficulty": 1,
        "prompt_text": "1982 Anayasası'na göre ilköğretim eğitimi ile ilgili aşağıdaki ifadelerden hangisi anayasal bir kuraldır?",
        "options": [
            "Yalnızca erkek çocuklar için zorunludur.",
            "Kız ve erkek bütün vatandaşlar için zorunludur ve Devlet okullarında parasızdır.",
            "Ücreti velinin gelir durumuna göre okul aile birliğince belirlenir.",
            "Sadece 12 yaşından sonra başlar.",
            "Özel okullarda parasız olmak zorundadır."
        ],
        "correctIndex": 1,
        "explanation": "Anayasa m. 42 açık hükmüdür: 'İlköğretim, kız ve erkek bütün vatandaşlar için zorunludur ve Devlet okullarında parasızdır.'",
        "distractor_trap": "İlköğretim devlet okullarında parasız ve tüm kız-erkek vatandaşlar için zorunlu olan anayasal temel haktır."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Temel Hak ve Ödevler",
        "difficulty": 1,
        "prompt_text": "1982 Anayasası'na göre Türkiye Büyük Millet Meclisi Başkanlığı'na bağlı olarak kurulan ve idarenin işleyişiyle ilgili şikayetleri inceleyen 'Kamu Denetçiliği Kurumu'nun (Ombudsmanlık) başındaki Kamu Başdenetçisi kim tarafından seçilir?",
        "options": [
            "Cumhurbaşkanı",
            "Türkiye Büyük Millet Meclisi (TBMM)",
            "Anayasa Mahkemesi",
            "Danıştay Genel Kurulu",
            "Hakimler ve Savcılar Kurulu"
        ],
        "correctIndex": 1,
        "explanation": "Kamu Denetçiliği Kurumu TBMM Başkanlığı'na bağlıdır ve Kamu Başdenetçisi TBMM Genel Kurulu tarafından gizli oyla dört turlu oylama usulüyle 4 yıl için seçilir.",
        "distractor_trap": "Kamu Başdenetçisini Cumhurbaşkanı DEĞİL, doğrudan TBMM seçer!"
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Temel Hak ve Ödevler",
        "difficulty": 1,
        "prompt_text": "1982 Anayasası'nın 73. maddesinde düzenlenen vergi ödevi ile ilgili olarak 'Herkes, kamu giderlerini karşılamak üzere ......... göre vergi ödemekle yükümlüdür.' ifadesindeki boşluğa aşağıdakilerden hangisi getirilmelidir?",
        "options": [
            "Eğitim düzeyine",
            "Yaşına",
            "Mali gücüne",
            "Mesleki kıdemine",
            "Medeni durumuna"
        ],
        "correctIndex": 2,
        "explanation": "Anayasa m. 73: 'Herkes, kamu giderlerini karşılamak üzere, mali gücüne göre, vergi ödemekle yükümlüdür.' Bu ilkeye verginin mali güce göre alınması (ödeme gücü) ilkesi denir.",
        "distractor_trap": "Vergide eşitlik herkesin aynı TL tutarını ödemesi demek değildir; herkesin mali gücüne göre (artan oranlı) ödemesidir."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Temel Hak ve Ödevler",
        "difficulty": 1,
        "prompt_text": "1982 Anayasası'na göre Türk vatandaşlığı ile ilgili aşağıdaki hükümlerden hangisi yanlıştır?",
        "options": [
            "Türk Devletine vatandaşlık bağı ile bağlı olan herkes Türktür.",
            "Türk babanın veya Türk ananın çocuğu Türktür.",
            "Vatandaşlık, kanunun gösterdiği şartlarla kazanılır ve ancak kanunda belirtilen hallerde kaybedilir.",
            "Hiçbir Türk, vatana bağlılıkla bağdaşmayan bir eylemde bulunmadıkça vatandaşlıktan çıkarılamaz.",
            "Vatandaşlıktan çıkarma ile ilgili karar ve işlemlere karşı yargı yolu kesin olarak kapalıdır."
        ],
        "correctIndex": 4,
        "explanation": "Anayasa m. 66 son fıkrası açıktır: 'Vatandaşlıktan çıkarma ile ilgili karar ve işlemlere karşı yargı yolu kapatılamaz.' İptal davası Danıştay'da açılır.",
        "distractor_trap": "Vatandaşlıktan çıkarma işlemlerine karşı yargı yolu açıktır; yargı denetimi asla engellenemez."
    },

    # -------------------------------------------------------------
    # TEST 2: STANDART ÖSYM AYARI (Zorluk: 2) - Sorular 11-20
    # -------------------------------------------------------------
    {
        "lesson": "Vatandaşlık",
        "topic": "Temel Hak ve Ödevler",
        "difficulty": 2,
        "prompt_text": "1982 Anayasası'na göre bir kimseye 'yurt dışına çıkma yasağı' hangi makam tarafından ve hangi gerekçeyle konulabilir?",
        "options": [
            "Vergi dairesi müdürü tarafından vergi borcundan ötürü",
            "Yalnızca suç soruşturması veya kovuşturması sebebiyle HÂKİM KARARIYLA",
            "İçişleri Bakanı'nın idari genelgesiyle",
            "Emniyet Genel Müdürlüğü'nün güvenlik gerekçesiyle",
            "Valilik kararıyla il sınırları içinde"
        ],
        "correctIndex": 1,
        "explanation": "2010 anayasa değişikliği ile Anayasa m. 23 değiştirilmiştir: Vatandaşın yurt dışına çıkma hürriyeti, ANCAK suç soruşturması veya kovuşturması sebebiyle HÂKİM KARARINA bağlı olarak sınırlanabilir. İdarenin vergi borcu sebebiyle yurtdışı yasağı koyma yetkisi tamamen kaldırılmıştır.",
        "distractor_trap": "Vergi borcu sebebiyle yurtdışı çıkış yasağı konulamaz! Yasak sadece hakim kararıyla ve ceza soruşturması/kovuşturması için verilebilir."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Temel Hak ve Ödevler",
        "difficulty": 2,
        "prompt_text": "1982 Anayasası'na göre siyasi partilere üye olabilecek ve üye olamayacak kişiler dikkate alındığında aşağıdakilerden hangisi siyasi partilere ÜYE OLABİLİR?",
        "options": [
            "Yargıtay ve Danıştay daire başkanları ve üyeleri",
            "Devlet memurları",
            "Silahlı Kuvvetler mensupları (subay, astsubay, uzman erbaş)",
            "Yükseköğretim elemanları (üniversite profesör ve doçentleri) ve yükseköğretim öğrencileri",
            "Askeri öğrenciler ve lise öğrencileri"
        ],
        "correctIndex": 3,
        "explanation": "Anayasa m. 68 uyarınca hakimler-savcılar, memurlar, askerler ve lise öğrencileri partilere üye olamaz. Ancak Yükseköğretim elemanları (öğretim üyeleri) sadece merkez organlarında görev almak şartıyla ve Yükseköğretim öğrencileri (üniversite öğrencileri) siyasi partilere ÜYE OLABİLİRLER.",
        "distractor_trap": "Üniversite hocaları ve üniversite öğrencileri siyasi partilere üye olabilir; memurlar ve lise öğrencileri ise üye olamaz!"
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Temel Hak ve Ödevler",
        "difficulty": 2,
        "prompt_text": "1982 Anayasası'nda yer alan 'Suçluluğu hükmen sabit oluncaya kadar, kimse suçlu sayılamaz.' hükmü ceza muhakemesinin hangi evrensel ilkesinin ifadesidir?",
        "options": [
            "Kanunilik ilkesi",
            "Masumiyet (Suçsuzluk) Karinesi",
            "Cezaların şahsiliği",
            "Adil yargılanma hakkı",
            "Aleniyet ilkesi"
        ],
        "correctIndex": 1,
        "explanation": "Hakkında kesinleşmiş mahkumiyet kararı verilinceye kadar herkes hukuken masumdur. Buna 'masumiyet karinesi' denir ve Anayasa m. 15 uyarınca savaş halinde bile dokunulamayan sert çekirdek haktır.",
        "distractor_trap": "Kişi gözaltına alınsa veya tutuklansa bile masumiyet karinesi devam eder; suçlu sayılması için kararın kesinleşmesi şarttır."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Temel Hak ve Ödevler",
        "difficulty": 2,
        "prompt_text": "Özel hayatın gizliliği ve konut dokunulmazlığı anayasal güvence altındadır.\n\nBir kimsenin üstü, özel kağıtları ve eşyası aranamaz ve bunlara el konulamaz kuralının istisnası olarak arama ve el koyma işlemi kural olarak kimin kararıyla yapılabilir?",
        "options": [
            "Valilik genelgesiyle",
            "Hâkim kararıyla (gecikmesinde sakınca bulunan hallerde kanunla yetkili kılınan merciin yazılı emriyle)",
            "Kolluk amirinin sözlü talimatıyla",
            "Muhtarın izniyle",
            "Apartman yöneticisinin rızasıyla"
        ],
        "correctIndex": 1,
        "explanation": "Anayasa m. 20 ve 21'e göre üst araması, konut araması ve el koyma kural olarak HÂKİM KARARI ile yapılır. Gecikmesinde sakınca bulunan hallerde yetkili merciin yazılı emri gerekir ve bu emir 24 saat içinde görevli hakimin onayına sunulmalıdır.",
        "distractor_trap": "Sözlü emirle arama yapılamaz; hakim kararı veya gecikmesinde sakınca olan hallerde yetkili merciin YAZILI emri şarttır."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Temel Hak ve Ödevler",
        "difficulty": 2,
        "prompt_text": "1982 Anayasası'nda 2001 yılında yapılan değişiklikle temel hak ve hürriyetlerin sınırlandırılması rejiminden aşağıdakilerden hangisi tamamen çıkarılmıştır?",
        "options": [
            "Kanunla sınırlama kuralı",
            "Ölçülülük ilkesi",
            "Genel sınırlama sebepleri",
            "Hakkın özüne dokunma yasağı",
            "Demokratik toplum düzeninin gerekleri"
        ],
        "correctIndex": 2,
        "explanation": "2001 anayasa değişikliğine kadar anayasada tüm haklar için geçerli 'kamu düzeni, milli güvenlik' gibi torba genel sınırlama sebepleri vardı. 2001'de bu genel sınırlama sebepleri kaldırılmış; her hak için sadece kendi maddesinde yazan ÖZEL SEBEPLERLE sınırlama esası getirilmiştir.",
        "distractor_trap": "Genel sınırlama sebepleri artık yoktur! Sınırlama sadece o hakkın maddesindeki ÖZEL sınırlama sebebine dayanabilir."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Temel Hak ve Ödevler",
        "difficulty": 2,
        "prompt_text": "Kişi hürriyeti ve güvenliği kapsamında yakalanan veya tutuklanan bir kimse, tutulma yerine en yakın mahkemeye gönderilmesi için gerekli süre hariç en geç kaç saat içinde hâkim önüne çıkarılmalıdır?",
        "options": [
            "12 saat",
            "24 saat",
            "48 saat (Toplu işlenen suçlarda en çok 4 gün)",
            "72 saat",
            "7 gün"
        ],
        "correctIndex": 2,
        "explanation": "Anayasa m. 19 uyarınca yakalanan veya tutuklanan kişi bireysel suçlarda en geç 48 SAAT; toplu olarak işlenen suçlarda ise en çok 4 GÜN içinde hâkim önüne çıkarılmak zorundadır.",
        "distractor_trap": "Bireysel suçlarda 48 saat, toplu suçlarda 4 gündür. Süreler yol süresi hariç tutularak hesaplanır."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Temel Hak ve Ödevler",
        "difficulty": 2,
        "prompt_text": "Kamulaştırma (istimlak), devlet veya kamu tüzel kişilerinin kamu yararının gerektirdiği hallerde özel mülkiyetteki bir taşınmazın mülkiyetini zorla devralmasıdır.\n\nKamulaştırma bedeli kural olarak nasıl ödenir?",
        "options": [
            "Hisse senedi ile",
            "Devlet tahvili ile",
            "Nakit ve peşin olarak",
            "5 eşit taksitle",
            "Gayrimenkul takası ile"
        ],
        "correctIndex": 2,
        "explanation": "Anayasa m. 46 uyarınca kamulaştırma bedeli kural olarak NAKİT VE PEŞİN ödenir. İstisnai olarak büyük enerji, sulama, tarım ve orman projelerinde taksitle (en çok 5 yılda ve kamu alacaklarına uygulanan en yüksek faizle) ödenebilir.",
        "distractor_trap": "Kural nakit ve peşindir! Taksitlendirme sadece anayasada sayılan istisnai büyük projeler için en fazla 5 yıl geçerlidir."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Temel Hak ve Ödevler",
        "difficulty": 2,
        "prompt_text": "Devlet memurlarının ve kamu görevlilerinin kanunen 'Mal Bildiriminde Bulunma' zorunluluğu bulunmaktadır.\n\nDevlet memurları genel mal bildirimlerini sonu hangi rakamlarla biten yıllarda ve en geç hangi ayın sonuna kadar yenilemek zorundadır?",
        "options": [
            "Sonu 0 ve 5 ile biten yıllarda — Şubat ayı sonuna kadar",
            "Sonu 1 ve 6 ile biten yıllarda — Ocak ayı sonuna kadar",
            "Sonu çift rakamla biten yıllarda — Aralık ayı sonuna kadar",
            "Her yılın başında — Ocak ayı sonuna kadar",
            "Sonu 3 ve 8 ile biten yıllarda — Mart ayı sonuna kadar"
        ],
        "correctIndex": 0,
        "explanation": "3628 sayılı Mal Bildiriminde Bulunulması Kanunu uyarınca memurlar sonu 0 ve 5 ile biten yıllarda (örn. 2020, 2025, 2030) en geç Şubat ayı sonuna kadar mal bildirimlerini yenilemek zorundadırlar.",
        "distractor_trap": "Sonu 0 ve 5 ile biten yıllar ve Şubat ayı sonu! Bu süre ve kural KPSS'de doğrudan bilgi sorusu olarak sorulur."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Temel Hak ve Ödevler",
        "difficulty": 2,
        "prompt_text": "1982 Anayasası'na göre 'Dilekçe Hakkı'nın kullanılması ve yabancıların bu haktan yararlanabilmesi ile ilgili şart aşağıdakilerden hangisidir?",
        "options": [
            "Yabancının en az 10 yıldır Türkiye'de ikamet etmesi",
            "Yabancının Türkçe bilmesi ve Türk vatandaşıyla evli olması",
            "Karşılıklılık (mütekabiliyet) esası gözetilmek ve dilekçenin Türkçe yazılması kaydıyla Türkiye'de oturan yabancılar da yararlanabilir",
            "Yabancılar dilekçe hakkından hiçbir şekilde yararlanamaz",
            "Yabancıların yalnızca kendi elçiliklerine dilekçe verebilmesi"
        ],
        "correctIndex": 2,
        "explanation": "Anayasa m. 74 uyarınca Türkiye'de ikamet eden yabancılar; dilekçelerini Türkçe yazmak ve kendi ülkelerinde de Türk vatandaşlarına bu hakkın tanınmış olması (karşılıklılık/mütekabiliyet) şartıyla dilekçe hakkından faydalanabilirler.",
        "distractor_trap": "Yabancıların dilekçe verebilmesi için iki şart vardır: Karşılıklılık (mütekabiliyet) ve dilekçenin Türkçe yazılmış olması."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Temel Hak ve Ödevler",
        "difficulty": 2,
        "prompt_text": "I. Hak arama hürriyeti\nII. Mülkiyet hakkı\nIII. İspat hakkı\nIV. Basın hürriyeti\n\nYukarıda verilen haklar Jellinek sınıflandırmasına göre hangi hak kategorisinde yer alır?",
        "options": [
            "Sosyal ve Ekonomik Haklar (Pozitif Statü)",
            "Kişisel Haklar ve Ödevler (Negatif Statü)",
            "Siyasi Haklar ve Ödevler (Aktif Statü)",
            "Kollektif Dayanışma Hakları",
            "Çevre ve Barış Hakları"
        ],
        "correctIndex": 1,
        "explanation": "Hak arama hürriyeti (m. 36), ispat hakkı (m. 39), mülkiyet hakkı (m. 35) ve basın hürriyeti (m. 28) Anayasa'nın İkinci Bölümünde 'Kişinin Hakları ve Ödevleri' (Negatif Statü Hakları) başlığı altında düzenlenmiştir.",
        "distractor_trap": "Mülkiyet hakkı adında 'ekonomik' çağrışım yapsa da anayasada Sosyal-Ekonomik haklarda DEĞİL, Kişisel Haklar (Negatif Statü) bölümündedir!"
    },

    # -------------------------------------------------------------
    # TEST 3: STANDART ÖSYM AYARI (Zorluk: 2) - Sorular 21-30
    # -------------------------------------------------------------
    {
        "lesson": "Vatandaşlık",
        "topic": "Temel Hak ve Ödevler",
        "difficulty": 2,
        "prompt_text": "1982 Anayasası'na göre basımevi (matbaa) kurma hürriyeti ile ilgili aşağıdaki anayasal güvencelerden hangisi doğrudur?",
        "options": [
            "Basımevi kurmak için önceden izin alma ve mali teminat yatırma şartı konulamaz.",
            "Basımevi ancak İletişim Başkanlığı'nın izniyle kurulabilir.",
            "Basımevleri sadece anonim şirket şeklinde kurulabilir.",
            "Basımevi açabilmek için en az 10 yıl gazetecilik yapmış olmak şarttır.",
            "Basımevi kurmak yalnızca kamu tüzel kişilerine tanınmış bir imtiyazdır."
        ],
        "correctIndex": 0,
        "explanation": "Anayasa m. 29 uyarınca basımevi kurmak, izin alma ve mali teminat yatırma şartına bağlanamaz. Ayrıca kanuna uygun kurulmuş bir basımevi ve eklentileri suç aleti olduğu gerekçesiyle zapt ve müsadere edilemez.",
        "distractor_trap": "Basımevi kurmak için izin alma şartı da mali teminat yatırma şartı da anayasa ile kesin olarak yasaklanmıştır."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Temel Hak ve Ödevler",
        "difficulty": 2,
        "prompt_text": "Din ve ahlak eğitimi ile ilgili 1982 Anayasası'nda yer alan kural aşağıdakilerden hangisidir?",
        "options": [
            "Din eğitimi tamamen yasaklanmıştır.",
            "Din ve ahlak eğitim ve öğretimi Devletin gözetim ve denetimi altında yapılır; din kültürü ve ahlak öğretimi ilk ve ortaöğretim kurumlarında okutulan zorunlu dersler arasındadır.",
            "Din eğitimi sadece vakıf ve dernekler tarafından verilebilir.",
            "Din dersleri sadece üniversitelerde seçmeli ders olarak verilir.",
            "Din dersi almayan öğrencilere mezuniyet belgesi verilemez."
        ],
        "correctIndex": 1,
        "explanation": "Anayasa m. 24/4 gereğince din ve ahlak eğitim ve öğretimi devletin gözetim ve denetimi altında yapılır. Din kültürü ve ahlak öğretimi ilk ve ortaöğretim kurumlarında okutulan zorunlu derslerdendir.",
        "distractor_trap": "Din kültürü ve ahlak öğretimi anayasal olarak ilk ve ortaöğretimde ZORUNLU derstir; bunun dışındaki özel dini eğitim ise kişinin kendi, küçüklerin ise kanuni temsilcisinin isteğine bağlıdır."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Temel Hak ve Ödevler",
        "difficulty": 2,
        "prompt_text": "1982 Anayasası'nın 51. maddesinde düzenlenen 'Sendika Kurma Hakkı' ile ilgili aşağıdaki hükümlerden hangisi doğrudur?",
        "options": [
            "Sendika kurabilmek için Çalışma ve Sosyal Güvenlik Bakanlığı'ndan önceden ruhsat alınmalıdır.",
            "Çalışanlar ve işverenler, önceden izin almaksızın sendikalar ve üst kuruluşlar kurma, bunlara serbestçe üye olma ve üyelikten çekilme hakkına sahiptir.",
            "Bir kimse aynı zamanda ve aynı işkolunda birden çok sendikaya kesinlikle üye olamaz.",
            "Sendika kurucularının en az 50 yaşında olması şarttır.",
            "Sendikaların grev kararı alması kanunen yasaktır."
        ],
        "correctIndex": 1,
        "explanation": "Sendika kurma hakkı önceden izin almaksızın serbestçe kullanılır. Ayrıca 2010 anayasa değişikliği ile 'aynı zamanda ve aynı işkolunda birden çok sendikaya üye olunamaz' yasağı kaldırılmıştır.",
        "distractor_trap": "Sendika kurmak için izin gerekmez; ayrıca 2010'dan beri aynı işkolunda birden çok sendikaya üye olma yasağı kaldırılmıştır."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Temel Hak ve Ödevler",
        "difficulty": 2,
        "prompt_text": "1982 Anayasası'na göre toplu iş sözleşmesi yapılması sırasında uyuşmazlık çıkması halinde işçilerin sahip olduğu anayasal hak aşağıdakilerden hangisidir?",
        "options": [
            "Grev hakkı",
            "Lokavt hakkı",
            "İstifa hakkı",
            "İşyerini işgal hakkı",
            "Genel grev hakkı"
        ],
        "correctIndex": 0,
        "explanation": "Anayasa m. 54 uyarınca toplu iş sözleşmesinin yapılması sırasında uyuşmazlık çıkması halinde işçiler grev hakkına sahiptirler. İşverenler ise lokavt hakkına sahiptir.",
        "distractor_trap": "İşçinin hakkı Grev; işverenin karşı hakkı ise Lokavttır."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Temel Hak ve Ödevler",
        "difficulty": 2,
        "prompt_text": "Devlet memurları ve kamu görevlilerinin grev yapma hakkı anayasal olarak nasıl düzenlenmiştir?",
        "options": [
            "Memurlar da işçiler gibi serbestçe grev yapabilirler.",
            "Anayasa m. 54 uyarınca memurların grev yapması kesin olarak yasaklanmıştır; memurlara sadece toplu sözleşme hakkı tanınmıştır.",
            "Sadece amirlerinin izin verdiği günlerde grev yapabilirler.",
            "Yılda en fazla 3 gün grev yapabilirler.",
            "Grev hakkı yalnızca sağlık memurlarına tanınmıştır."
        ],
        "correctIndex": 1,
        "explanation": "Memurlara 2010 anayasa değişikliği ile 'toplu sözleşme' yapma hakkı verilmiştir; uyuşmazlık durumunda Kamu Görevlileri Hakem Kurulu'na gidilir. Ancak memurların GREV YAPMA HAKKI KESİNLİKLE YOKTUR.",
        "distractor_trap": "Memurların toplu sözleşme hakkı vardır ama GREV HAKLARI KESİNLİKLE YOKTUR!"
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Temel Hak ve Ödevler",
        "difficulty": 2,
        "prompt_text": "1982 Anayasası'nın 56. maddesinde yer alan 'Çevre Hakkı' ile ilgili aşağıdaki ifadelerden hangisi anayasal bir gerçektir?",
        "options": [
            "Çevreyi geliştirmek ve çevre sağlığını korumak yalnızca Devletin ödevidir.",
            "Çevreyi geliştirmek, çevre sağlığını korumak ve çevre kirlenmesini önlemek hem Devletin hem de vatandaşların ortak ödevidir.",
            "Çevre hakkı sadece orman köylülerine tanınmış bir haktır.",
            "Sanayi tesislerine çevre kirliliği sebebiyle ceza verilemez.",
            "Çevre hakkı bir siyasi haktır."
        ],
        "correctIndex": 1,
        "explanation": "Anayasa m. 56: 'Herkes, sağlıklı ve dengeli bir çevrede yaşama hakkına sahiptir. Çevreyi geliştirmek, çevre sağlığını korumak ve çevre kirlenmesini önlemek Devletin ve vatandaşların ödevidir.' Hem hak hem ödev niteliğindedir.",
        "distractor_trap": "Çevreyi korumak sadece devletin değil; hem devletin hem de vatandaşın anayasal görevidir."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Temel Hak ve Ödevler",
        "difficulty": 2,
        "prompt_text": "Kişinin kamu makamları ve üçüncü kişiler tarafından izlenmeden, mektup, telefon, internet ve e-posta gibi iletişim araçlarıyla serbestçe haberleşebilmesini güvence altına alan hak hangisidir?",
        "options": [
            "Haberleşme hürriyeti",
            "Basın hürriyeti",
            "Hak arama hürriyeti",
            "İfade hürriyeti",
            "Düşünce hürriyeti"
        ],
        "correctIndex": 0,
        "explanation": "Anayasa m. 22 uyarınca herkes haberleşme hürriyetine sahiptir. Haberleşmenin gizliliği esastır. Hakim kararı olmadıkça haberleşme engellenemez ve gizliliğine dokunulamaz.",
        "distractor_trap": "Haberleşme hürriyeti bir kişisel (negatif statü) haktır."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Temel Hak ve Ödevler",
        "difficulty": 2,
        "prompt_text": "1982 Anayasası'na göre 'Düzeltme ve Cevap Hakkı' (Tekzip Hakkı) hangi durumda ve nasıl doğar?",
        "options": [
            "Sadece siyasi partilerin talebiyle doğar.",
            "Ancak kişilerin haysiyet ve şereflerine dokunulması veya kendileriyle ilgili gerçeğe aykırı yayınlar yapılması hallerinde tanınır ve kanunla düzenlenir.",
            "Her gazete haberine karşı doğrudan para cezası kesilmesini sağlar.",
            "Yalnızca devlet televizyonu yayınları için geçerlidir.",
            "Sadece internet sitelerindeki yorumlar için geçerlidir."
        ],
        "correctIndex": 1,
        "explanation": "Anayasa m. 32 uyarınca düzeltme ve cevap hakkı, ancak kişilerin şeref ve haysiyetine dokunulması veya gerçeğe aykırı yayın yapılması halinde doğar. Düzeltme yayımlanmazsa hakim kararıyla yayımlatılır.",
        "distractor_trap": "Tekzip (düzeltme ve cevap hakkı) basın hürriyetine karşı bireyin şeref ve haysiyetini koruyan anayasal dengedir."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Temel Hak ve Ödevler",
        "difficulty": 2,
        "prompt_text": "1982 Anayasası'nda yer alan 'Sosyal Güvenlik Hakkı' (m. 60) ile ilgili kural aşağıdakilerden hangisidir?",
        "options": [
            "Sosyal güvenlik sadece memurlar için geçerlidir.",
            "Herkes, sosyal güvenlik hakkına sahiptir. Devlet, bu güvenliği sağlayacak gerekli tedbirleri alır ve teşkilatı kurar.",
            "Sosyal güvenlik primlerini yalnızca devlet öder.",
            "Sosyal güvenlik hakkından yabancılar hiçbir şekilde faydalanamaz.",
            "Sosyal güvenlik sistemi sadece 65 yaşından sonra devreye girer."
        ],
        "correctIndex": 1,
        "explanation": "Anayasa m. 60 amir hükmüdür: 'Herkes, sosyal güvenlik hakkına sahiptir. Devlet, bu güvenliği sağlayacak gerekli tedbirleri alır ve teşkilatı kurar.' SGK bu anayasal emrin sonucudur.",
        "distractor_trap": "Sosyal güvenlik hakkı devletten hizmet talep edilen bir sosyal ve ekonomik haktır."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Temel Hak ve Ödevler",
        "difficulty": 2,
        "prompt_text": "Anayasa m. 72'de düzenlenen 'Vatan Hizmeti' (askerlik ödevi) ile ilgili aşağıdaki anayasal hüküm hangisidir?",
        "options": [
            "Yalnızca erkekler için zorunlu ve sadece kışlada silah altında yapılır.",
            "Vatan hizmeti, her Türkün hakkı ve ödevidir. Bu hizmetin Silahlı Kuvvetlerde veya kamu hizmetlerinde ne şekilde yerine getirileceği veya getirilmiş sayılacağı kanunla düzenlenir.",
            "Vatan hizmeti sadece gönüllülük esasına dayanır.",
            "Vatan hizmeti sadece savaş zamanında geçerlidir.",
            "Bedelli askerlik anayasada açıkça yasaklanmıştır."
        ],
        "correctIndex": 1,
        "explanation": "Anayasa m. 72 uyarınca vatan hizmeti her Türkün hem hakkı hem ödevidir; askerlik hizmetinin ordu bünyesinde veya kamu hizmetinde ne şekilde ifa edileceği kanuna bırakılmıştır.",
        "distractor_trap": "Vatan hizmeti anayasada hem 'hak' hem de 'ödev' olarak nitelenen tek hizmettir ve kamu hizmeti şeklinde ifası da anayasal olarak mümkündür."
    },

    # -------------------------------------------------------------
    # TEST 4: NET SIÇRATAN / KURTLAR SOFRASI (Zorluk: 3) - Sorular 31-40
    # -------------------------------------------------------------
    {
        "lesson": "Vatandaşlık",
        "topic": "Temel Hak ve Ödevler",
        "difficulty": 3,
        "prompt_text": "Temel hak ve hürriyetlerin sınırlandırılmasında uygulanan 'Ölçülülük İlkesi' kendi içinde üç alt ilkeden oluşur.\n\nAşağıdakilerden hangisi ölçülülük ilkesinin bu üç alt unsurundan biri DEĞİLDİR?",
        "options": [
            "Elverişlilik (Sınırlama aracının ulaşılmak istenen amaca uygun olması)",
            "Gereklilik / Zorunluluk (Amaca ulaşmak için hakka daha az müdahale eden başka bir aracın bulunmaması)",
            "Orantılılık (Araç ile amaç arasında makul ve hakkaniyete uygun bir dengenin bulunması)",
            "Geriye Yürümezlik (Sınırlamanın sadece geçmiş olaylara uygulanması)",
            "Hakkın özünü zedelemeyecek asgari düzeyde kalınması"
        ],
        "correctIndex": 3,
        "explanation": "Ölçülülük ilkesi üç alt ilkeden oluşur: 1) Elverişlilik, 2) Gereklilik (zorunluluk) ve 3) Orantılılık. 'Geriye yürümezlik' ölçülülüğün bir unsuru değil, ceza hukukunun ayrı bir güvence ilkesidir.",
        "distractor_trap": "Ölçülülüğün üç sacayağı: Elverişlilik, Gereklilik ve Orantılılıktır. Bu üçlü Anayasa Mahkemesi kararlarının ana denetim kriteridir."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Temel Hak ve Ödevler",
        "difficulty": 3,
        "prompt_text": "Anayasa m. 38 uyarınca 'Kanuna aykırı olarak elde edilmiş bulgular, delil olarak kabul edilemez.' hükmü ceza muhakemesinde hangi ilkeyi mutlak kılmıştır?",
        "options": [
            "Hukuka aykırı delillerin ceza yargılamasında hükme esas alınması yasağı (Zehirli ağacın meyvesi de zehirlidir)",
            "Hâkimin delilleri serbestçe takdir etme yetkisi",
            "Sanığın susma hakkını kullanmasının suç ikrarı sayılması",
            "İtirafın tek başına kesin delil teşkil etmesi",
            "Polisin mahkeme kararı olmadan dilediği gibi dinleme yapabilmesi"
        ],
        "correctIndex": 0,
        "explanation": "Hukuka aykırı yollarla (işkence, izinsiz ses kaydı, yasa dışı ortam dinlemesi vb.) elde edilen bulgular mahkemede delil olarak kullanılamaz; sanık bu delillere dayanılarak cezalandırılamaz.",
        "distractor_trap": "Delil doğru bile olsa (örneğin cinayet silahı bulunsa bile) elde edilişi hukuka aykırıysa dosyadan çıkarılır ve hükme esas alınamaz."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Temel Hak ve Ödevler",
        "difficulty": 3,
        "prompt_text": "1982 Anayasası'na göre 'Siyasi Partilerin Uyacakları Esaslar ve Yasaklar' düşünüldüğünde aşağıdakilerden hangisi yanlıştır?",
        "options": [
            "Siyasi partiler ticari faaliyetlere girişemezler.",
            "Siyasi partiler yabancı devletlerden, uluslararası kuruluşlardan ve yabancı uyruklu kişilerden maddi yardım alamazlar.",
            "Yabancı devletlerden yardım alan siyasi partiler Anayasa Mahkemesi tarafından temelli kapatılır.",
            "Siyasi partilerin gelir ve giderlerinin denetimi Danıştay tarafından yapılır.",
            "Siyasi partiler demokratik devlet ilkelerine aykırı faaliyette bulunamazlar."
        ],
        "correctIndex": 3,
        "explanation": "Anayasa m. 69 uyarınca siyasi partilerin mali denetimini (gelir-gider hesaplarını) Danıştay değil, doğrudan ANAYASA MAHKEMESİ yapar. Anayasa Mahkemesi bu denetimi yaparken Sayıştay'dan yardım alır.",
        "distractor_trap": "Siyasi partilerin mali denetimini yapan organ ANAYASA MAHKEMESİ'dir (Sayıştay yardım eder, rapor hazırlar ama karar AYM'nindir; Danıştay'ın ilgisi yoktur)."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Temel Hak ve Ödevler",
        "difficulty": 3,
        "prompt_text": "Anayasa Mahkemesi'ne 'Bireysel Başvuru' hakkı Türk hukukuna hangi yıl yapılan anayasa değişikliği ile girmiştir ve bu başvurunun temel ön şartı nedir?",
        "options": [
            "1982'de girmiştir — Doğrudan başvuru esastır",
            "2001'de girmiştir — TBMM Başkanı'nın onayı şarttır",
            "2010'da girmiştir — Olağan kanun yollarının (istinaf, temyiz) tamamının tüketilmiş olması şarttır",
            "2017'de girmiştir — Adalet Bakanlığı'nın izni gerekir",
            "1961'de girmiştir — Sadece milletvekilleri başvurabilir"
        ],
        "correctIndex": 2,
        "explanation": "Bireysel başvuru hakkı 2010 anayasa referandumu ile kabul edilmiştir. Temel hak ve özgürlükleri ihlal edilen herkes, olağan kanun yollarını (ilk derece, istinaf, Yargıtay/Danıştay) tamamen tükettikten sonra 30 gün içinde Anayasa Mahkemesi'ne bireysel başvuruda bulunabilir.",
        "distractor_trap": "Bireysel başvuru 2010 yılında gelmiştir ve 'tüm iç hukuk yollarının tüketilmesi' zorunlu dava şartıdır."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Temel Hak ve Ödevler",
        "difficulty": 3,
        "prompt_text": "Anayasa Mahkemesi'ne yapılan bireysel başvurularda hangi hak ihlalleri incelenebilir?",
        "options": [
            "Anayasada yer alan haklardan herhangi birinin ihlal edilmesi yeterlidir.",
            "Yalnızca Anayasa'da güvence altına alınmış VE AYNI ZAMANDA Avrupa İnsan Hakları Sözleşmesi (AİHS) ve Türkiye'nin taraf olduğu ek protokollerde yer alan ortak temel hak ve hürriyetler",
            "Sadece ticaret ve borçlar hukukundan kaynaklanan alacak davaları",
            "Sadece vergi uyuşmazlıkları",
            "Yalnızca memurların disiplin cezaları"
        ],
        "correctIndex": 1,
        "explanation": "Anayasa m. 148 uyarınca her hak için AYM'ye gidilemez. Başvurunun kabul edilebilmesi için ihlal edildiği iddia edilen hakkın HEM Anayasamızda HEM DE Avrupa İnsan Hakları Sözleşmesi'nde (AİHS) ortaklaşa korunan haklardan biri olması şarttır.",
        "distractor_trap": "Örn. Anayasa'da olup AİHS'te olmayan bir hak (veya tersi) için AYM'ye bireysel başvuru yapılamaz; ÇİFTE KORUMA (ortak alan) şarttır."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Temel Hak ve Ödevler",
        "difficulty": 3,
        "prompt_text": "1982 Anayasası'na göre temelli kapatılan bir siyasi partinin kapatılmasına beyan veya eylemleriyle sebep olan kurucuları ve üyeleri için uygulanan 'siyaset yasağı' süresi ne kadardır?",
        "options": [
            "1 yıl",
            "3 yıl",
            "5 yıl",
            "10 yıl",
            "Ömür boyu"
        ],
        "correctIndex": 2,
        "explanation": "Anayasa m. 69 uyarınca temelli kapatılan bir partinin kapatılmasına sebep olan kişiler, Anayasa Mahkemesi'nin gerekçeli kararının Resmî Gazete'de yayımlanmasından başlayarak 5 YIL süreyle bir başka partinin kurucusu, üyesi, yöneticisi veya deneticisi olamazlar (bağımsız milletvekili olabilirler).",
        "distractor_trap": "Siyaset yasağı 5 yıldır; bu kişiler parti üyesi veya yöneticisi olamazlar ancak BAĞIMSIZ aday olarak seçime girebilirler!"
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Temel Hak ve Ödevler",
        "difficulty": 3,
        "prompt_text": "1982 Anayasası'nda yer alan 'Devletleştirme' ile 'Kamulaştırma' arasındaki temel hukuki fark aşağıdakilerden hangisidir?",
        "options": [
            "Kamulaştırmada taşınır mallar, devletleştirmede taşınmaz mallar alınır.",
            "Kamulaştırmada kamu yararı amacıyla özel bir taşınmaz mülkiyeti alınırken; devletleştirmede kamu hizmeti niteliği taşıyan özel bir 'teşebbüs / işletme' kamu yararı zorunlu kıldığında kanunla devlete mal edilir.",
            "Kamulaştırma bedeli ödenmez, devletleştirme bedeli ödenir.",
            "Kamulaştırma kanunla yapılır, devletleştirme yönetmelikle yapılır.",
            "İkisi arasında hiçbir fark yoktur."
        ],
        "correctIndex": 1,
        "explanation": "Kamulaştırma (istimlak - m. 46) arsa, bina, tarla gibi özel taşınmaz malların kamu mülkiyetine geçirilmesidir. Devletleştirme (m. 47) ise elektrik dağıtım şirketi, fabrika, liman işletmesi gibi kamu hizmeti gören özel bir ticari işletmenin/şirketin kanunla devlete geçirilmesidir.",
        "distractor_trap": "Taşınmaz mal = Kamulaştırma; Özel teşebbüs ve şirket = Devletleştirme!"
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Temel Hak ve Ödevler",
        "difficulty": 3,
        "prompt_text": "Yerleşme ve seyahat hürriyetinin (m. 23) sınırlandırılması nedenleri anayasada ayrı ayrı sayılmıştır.\n\nAşağıdakilerden hangisi yalnızca 'Yerleşme Hürriyeti'nin sınırlandırılma sebepleri arasında yer alır (seyahat hürriyeti için geçerli değildir)?",
        "options": [
            "Suç soruşturması ve kovuşturması",
            "Suç işlenmesini önlemek",
            "Sosyal ve ekonomik gelişmeyi sağlamak, sağlıklı ve düzenli kentleşmeyi gerçekleştirmek ve kamu mallarını korumak",
            "Salgın hastalıkların yayılmasını engellemek",
            "Ceza infazını sağlamak"
        ],
        "correctIndex": 2,
        "explanation": "Sağlıklı ve düzenli kentleşmeyi gerçekleştirmek, kaçak yapılaşmayı önlemek ve kamu mallarını korumak YERLEŞME hürriyetinin özel sınırlandırma sebebidir. Bir kimsenin bir şehre seyahat etmesi kentleşmeyi bozmaz; oraya yerleşip gecekondu yapması yerleşme yasağını doğurur.",
        "distractor_trap": "Düzenli kentleşme ve kamu mallarını koruma yalnızca YERLEŞME hürriyetinin sınırlandırma sebebidir; seyahat hürriyetini sınırlayamaz."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Temel Hak ve Ödevler",
        "difficulty": 3,
        "prompt_text": "I. Yabancı bir devletten izin almaksızın vatandaşlık alan bir Türk vatandaşı doğrudan Türk vatandaşlığından çıkarılır.\nII. Vatandaşlıktan çıkarma kararlarına karşı Danıştay'da iptal davası açılabilir.\nIII. Vatandaşlıktan çıkarılan kişinin eş ve çocukları da kendiliğinden Türk vatandaşlığını kaybeder.\n\nYukarıdaki ifadelerden hangileri doğrudur?",
        "options": [
            "Yalnız I",
            "Yalnız II",
            "I ve III",
            "II ve III",
            "I, II ve III"
        ],
        "correctIndex": 1,
        "explanation": "I yanlıştır; Türkiye'de çifte vatandaşlık serbesttir, yabancı vatandaşlık alan doğrudan çıkarılmaz. III yanlıştır; vatandaşlıktan çıkarma şahsidir, eş ve çocukların vatandaşlığını etkilemez. II doğrudur; vatandaşlıktan çıkarmaya karşı Danıştay'da iptal davası açılabilir.",
        "distractor_trap": "Vatandaşlıktan çıkarma cezası şahsidir; babanın veya annenin çıkarılması çocukları ve eşi etkilemez!"
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Temel Hak ve Ödevler",
        "difficulty": 3,
        "prompt_text": "1982 Anayasası'nın 65. maddesinde yer alan 'Devlet, sosyal ve ekonomik alanlarda Anayasa ile belirlenen ödevlerini, bu ödevlerin amaçlarına uygun öncelikleri gözeterek ......... ölçüsünde yerine getirir.' hükmünde boş bırakılan yere aşağıdakilerden hangisi gelmelidir?",
        "options": [
            "Milletlerarası kuruluşların onayladığı",
            "Mali kaynaklarının yeterliliği",
            "Nüfus artış hızı",
            "Muhalefet partilerinin mutabakatı",
            "Askeri harcamalardan artan pay"
        ],
        "correctIndex": 1,
        "explanation": "Anayasa m. 65: 'Devlet, sosyal ve ekonomik alanlarda Anayasa ile belirlenen ödevlerini, bu ödevlerin amaçlarına uygun öncelikleri gözeterek, MALİ KAYNAKLARININ YETERLİLİĞİ ölçüsünde yerine getirir.' Devlet param yetmiyor derse vatandaşa konut veya iş vermek zorunda bırakılamaz.",
        "distractor_trap": "Devletin sosyal hakları yerine getirmesindeki anayasal fren 'mali kaynaklarının yeterliliği'dir."
    },

    # -------------------------------------------------------------
    # TEST 5: HAP BİLGİ & CHECK-UP TESTİ (Zorluk: 2) - Sorular 41-50
    # -------------------------------------------------------------
    {
        "lesson": "Vatandaşlık",
        "topic": "Temel Hak ve Ödevler",
        "difficulty": 2,
        "prompt_text": "Anayasa'da güvence altına alınan temel hak ve özgürlüklerinin kamu gücü tarafından ihlal edildiğini iddia eden bir kişinin, olağan kanun yollarını tükettikten sonra nihai kararın tebliğinden veya öğrenilmesinden itibaren Anayasa Mahkemesi'ne BİREYSEL BAŞVURU yapma süresi kaç gündür?",
        "options": [
            "15 gün",
            "30 gün",
            "45 gün",
            "60 gün",
            "90 gün"
        ],
        "correctIndex": 1,
        "explanation": "6216 sayılı Anayasa Mahkemesinin Kuruluşu ve Yargılama Usulleri Hakkında Kanun m. 47/5 uyarınca bireysel başvuru süresi, başvuru yollarının tüketildiği tarihten itibaren 30 GÜNDÜR.",
        "distractor_trap": "AYM'de norm denetimi iptal davası açma süresi 60 gündür; vatandaşın BİREYSEL BAŞVURU süresi ise 30 GÜNDÜR!"
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Temel Hak ve Ödevler",
        "difficulty": 2,
        "prompt_text": "Avrupa İnsan Hakları Sözleşmesi'ne (AİHS) ek 15 No'lu Protokol'ün yürürlüğe girmesiyle birlikte, iç hukuk yollarının tüketilmesinden sonra Avrupa İnsan Hakları Mahkemesi'ne (AİHM) bireysel başvuru yapma süresi kaç aya indirilmiştir?",
        "options": [
            "1 ay",
            "3 ay",
            "4 ay",
            "6 ay",
            "12 ay"
        ],
        "correctIndex": 2,
        "explanation": "Eski düzenlemede AİHM başvuru süresi 6 ay idi. 15 No'lu Protokol'ün yürürlüğe girmesiyle kesinleşmiş nihai iç hukuk kararından itibaren AİHM'e başvuru süresi 4 AYA indirilmiştir.",
        "distractor_trap": "Eski 6 ay kuralı güncellenmiştir; güncel AİHM başvuru süresi 4 AYDIR!"
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Temel Hak ve Ödevler",
        "difficulty": 2,
        "prompt_text": "2820 sayılı Siyasi Partiler Kanunu'na göre Türkiye'de bir siyasi partinin kurulabilmesi için önceden izin almaksızın EN AZ kaç Türk vatandaşının bir araya gelmesi zorunludur?",
        "options": [
            "10",
            "20",
            "30",
            "50",
            "100"
        ],
        "correctIndex": 2,
        "explanation": "Siyasi partiler, önceden izin almadan en az 30 TÜRK VATANDAŞI tarafından İçişleri Bakanlığı'na bildirimde bulunarak kurulur. Siyasi parti 'grubu' kurmak için ise en az 20 milletvekili gerekir.",
        "distractor_trap": "Siyasi parti kurmak için en az 30 VATANDAŞ; TBMM'de parti grubu kurmak için en az 20 MİLLETVEKİLİ gerekir. 20 ve 30 sayıları ÖSYM'nin en popüler tuzak ikilisidir."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Temel Hak ve Ödevler",
        "difficulty": 2,
        "prompt_text": "1982 Anayasası'na göre bir siyasi partinin kapatılmasına ilişkin davayı açmaya yetkili makam ve kapatma kararını vermeye yetkili yargı organı hangi seçenekte doğru verilmiştir?",
        "options": [
            "Davayı Adalet Bakanı açar — Kararı Yargıtay verir.",
            "Davayı TBMM Başkanı açar — Kararı Danıştay verir.",
            "Davayı Yargıtay Cumhuriyet Başsavcısı açar — Kararı Anayasa Mahkemesi verir.",
            "Davayı Cumhurbaşkanı açar — Kararı Uyuşmazlık Mahkemesi verir.",
            "Davayı HSK açar — Kararı Yargıtay Ceza Genel Kurulu verir."
        ],
        "correctIndex": 2,
        "explanation": "Anayasa m. 69: Siyasi partilerin kapatılması, YARGITAY CUMHURİYET BAŞSAVCISININ açacağı dava üzerine ANAYASA MAHKEMESİ tarafından karara bağlanır (kapatma kararı için 15 üyeden 10 üyenin oyu = 2/3 çoğunluk şarttır).",
        "distractor_trap": "Davayı açan = Yargıtay Cumhuriyet Başsavcısı; Kapatma kararını veren = Anayasa Mahkemesi'dir."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Temel Hak ve Ödevler",
        "difficulty": 2,
        "prompt_text": "Siyasi Partiler Kanunu'na göre genel seçimlerde ülke genel barajını (%7) aşamamış olsa bile, genel seçimlere katılan ve toplam geçerli oyların EN AZ yüzde kaçını alan siyasi partilere devlet bütçesinden orantılı olarak hazine yardımı yapılır?",
        "options": [
            "%1",
            "%2",
            "%3",
            "%5",
            "%7"
        ],
        "correctIndex": 2,
        "explanation": "Siyasi Partiler Kanunu Ek m. 1 uyarınca, genel seçimlerde geçerli oyların EN AZ YÜZDE ÜÇÜNÜ (%3) alan siyasi partilere devlet hazinesinden yardım yapılır.",
        "distractor_trap": "Meclise girmek için seçim barajı %7'dir; hazine yardımı alabilmek için asgari oy oranı ise YÜZDE 3'tür (%3)."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Temel Hak ve Ödevler",
        "difficulty": 2,
        "prompt_text": "3071 sayılı Dilekçe Hakkının Kullanılmasına Dair Kanun'a göre TBMM'ye veya yetkili idari makamlara verilen dilekçelere en geç kaç gün içinde gerekçeli olarak cevap verilmesi zorunludur?",
        "options": [
            "15 gün",
            "30 gün",
            "60 gün",
            "90 gün",
            "120 gün"
        ],
        "correctIndex": 1,
        "explanation": "Dilekçe Kanunu m. 7 uyarınca yetkili makamlar dilekçe sahiplerine en geç 30 GÜN içinde cevap vermekle yükümlüdür. TBMM Dilekçe Komisyonu'nun inceleme ve karar süresi ise 60 gündür.",
        "distractor_trap": "İdari makamların dilekçeye cevap süresi 30 gündür; Bilgi edinme başvurusunda ise bu süre 15 gündür."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Temel Hak ve Ödevler",
        "difficulty": 2,
        "prompt_text": "1982 Anayasası'nın 74. maddesinde düzenlenen, idarenin her türlü eylem, işlem, tutum ve davranışını insan haklarına ve hukuka uygunluk yönünden inceleyen Kamu Denetçiliği Kurumu (Ombudsmanlık) nereye bağlı olarak kurulmuştur?",
        "options": [
            "Cumhurbaşkanlığına",
            "TBMM Başkanlığına",
            "Adalet Bakanlığına",
            "Anayasa Mahkemesine",
            "Danıştay Başkanlığına"
        ],
        "correctIndex": 1,
        "explanation": "Anayasa m. 74 uyarınca TBMM BAŞKANLIĞINA BAĞLI olarak Kamu Denetçiliği Kurumu kurulmuştur. Kurumun başı olan Kamu Başdenetçisi TBMM tarafından gizli oyla 4 yıllığına seçilir.",
        "distractor_trap": "Devlet Denetleme Kurulu (DDK) Cumhurbaşkanlığına bağlıdır; Kamu Denetçiliği Kurumu (Ombudsmanlık) ise TBMM BAŞKANLIĞINA bağlıdır!"
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Temel Hak ve Ödevler",
        "difficulty": 2,
        "prompt_text": "1982 Anayasası'nın 30. maddesinde düzenlenen basın araçlarının korunması ilkesine göre aşağıdakilerden hangisi doğrudur?",
        "options": [
            "Kanuna uygun kurulmuş basımevi ve matbaalar suç aleti olduğu gerekçesiyle zapt ve müsadere edilemez veya işletilmekten alıkonulamaz.",
            "Basımevleri her türlü suç iddiasında savcılık kararıyla doğrudan kapatılır.",
            "Basımevlerinin basacağı her gazete önceden mülki amirin sansür onayından geçmelidir.",
            "Basın araçları yalnızca olağanüstü hal döneminde müsadere edilebilir.",
            "Yabancı dilde yayın yapan matbaalar süresiz kapatılabilir."
        ],
        "correctIndex": 0,
        "explanation": "Anayasa m. 30 açık güvencesidir: 'Kanuna uygun şekilde basın işletmesi olarak kurulan basımevi ve eklentileri ile basın araçları, suç aleti olduğu gerekçesiyle zapt ve müsadere edilemez veya işletilmekten alıkonulamaz.'",
        "distractor_trap": "Kanuna uygun basımevleri suç aleti olduğu iddiasıyla müsadere edilemez ve kapatılamaz; bu anayasal özel bir güvencedir."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Temel Hak ve Ödevler",
        "difficulty": 2,
        "prompt_text": "Anayasa'nın 38. maddesinde güvence altına alınan 'Suç ve Cezalara İlişkin Esaslar' arasında aşağıdakilerden hangisi YER ALMAZ?",
        "options": [
            "Kimse, işlendiği zaman yürürlükte bulunan kanunun suç saymadığı bir fiilden dolayı cezalandırılamaz.",
            "Suçluluğu hükmen sabit oluncaya kadar, kimse suçlu sayılamaz (Masumiyet Karinesi).",
            "Hiç kimse, yalnızca sözleşmeden doğan bir yükümlülüğü yerine getirememesinden (borcunu ödeyememekten) dolayı özgürlüğünden alıkonulamaz.",
            "Ceza sorumluluğu şahsidir; kimse başkasının fiilinden dolayı sorumlu tutulamaz.",
            "Ağır kamu zararına yol açan ekonomik suçlarda suçlunun tüm malvarlığına genel müsadere cezası uygulanabilir."
        ],
        "correctIndex": 4,
        "explanation": "Anayasa m. 38 gereğince 'Genel müsadere cezası verilemez.' 2004 anayasa değişikliği ile hem ölüm cezası hem de genel müsadere cezası kesin olarak yasaklanmıştır (yalnızca suça konu eşyanın özel müsaderesi mümkündür).",
        "distractor_trap": "Türkiye'de GENEL MÜSADERE cezası kesinlikle yasaktır; hiçbir suç tipi için genel müsadere verilemez."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Temel Hak ve Ödevler",
        "difficulty": 2,
        "prompt_text": "Anayasa'nın 51. maddesinde düzenlenen 'Sendika Kurma Hakkı' ile ilgili olarak 2010 anayasa değişikliği ile yapılan önemli yenilik aşağıdakilerden hangisidir?",
        "options": [
            "Aynı zamanda ve aynı işkolunda birden çok sendikaya üye olunamayacağı kuralı anayasadan çıkarılarak çoklu sendika üyeliği serbest bırakılmıştır.",
            "Memurlara grev hakkı tanınmıştır.",
            "Sendika kurmak için İçişleri Bakanlığı'ndan izin alma şartı getirilmiştir.",
            "Sendika kurma yaşı 25'e çıkarılmıştır.",
            "Sendika yöneticilerine milletvekili dokunulmazlığı verilmiştir."
        ],
        "correctIndex": 0,
        "explanation": "2010 anayasa değişikliğiyle 'Aynı zamanda ve aynı işkolunda birden çok sendikaya üye olunamaz' sınırlaması anayasadan çıkarılmıştır. Böylece sendikal özgürlük genişletilmiştir.",
        "distractor_trap": "Memurlara toplu sözleşme hakkı verilmiştir ancak GREV HAKKI MEMURA HALEN TANINMAMIŞTIR! Sendikada değişen kural çoklu sendika üyeliğidir."
    }
]
