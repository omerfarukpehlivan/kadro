# -*- coding: utf-8 -*-
"""
KPSS Vatandaşlık — Konu 5: İdare Hukuku (40 Özgün Soru)
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
        "topic": "İdare Hukuku",
        "difficulty": 1,
        "prompt_text": "Türkiye'de taşra teşkilatında merkeze danışmadan merkez adına kendiliğinden karar alabilme ve uygulayabilme yetkisi olan 'Yetki Genişliği' anayasal olarak yalnızca kime tanınmıştır?",
        "options": [
            "Kaymakam",
            "Vali",
            "İl Emniyet Müdürü",
            "Belediye Başkanı",
            "Köy Muhtarı"
        ],
        "correctIndex": 1,
        "explanation": "Anayasa m. 126 uyarınca illerin idaresi 'yetki genişliği' esasına dayanır. Türkiye'de yetki genişliğine sahip tek makam VALİ'dir. Kaymakamda veya diğer taşra amirlerinde yetki genişliği kesinlikle yoktur.",
        "distractor_trap": "ÖSYM'nin en popüler sorusudur: Yetki genişliği sadece İL'de ve sadece VALİ'dedir; Kaymakamda yetki genişliği YOKTUR!"
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "İdare Hukuku",
        "difficulty": 1,
        "prompt_text": "Aşağıdakilerden hangisi Anayasa'nın 127. maddesinde düzenlenen 'Mahalli İdareler' (Yerel Yönetimler) arasında yer almaz?",
        "options": [
            "İl Özel İdaresi",
            "Belediye İdaresi",
            "Büyükşehir Belediyesi",
            "Köy İdaresi",
            "İlçe İdaresi (Kaymakamlık)"
        ],
        "correctIndex": 4,
        "explanation": "Anayasa m. 127'de sayılan mahalli idareler üç tanedir: İl Özel İdaresi, Belediye ve Köy (Büyükşehir belediyesi de belediye statüsündedir). İlçe idaresi (Kaymakamlık) ise yerel yönetim değil, devletin merkezi taşra teşkilatıdır.",
        "distractor_trap": "İlçe idaresi mahalli idare değildir! Merkezi idarenin taşra uzantısıdır."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "İdare Hukuku",
        "difficulty": 1,
        "prompt_text": "Bir yerleşim yerinde belediye kurulabilmesi için asgari nüfusun en az kaç olması şarttır ve belediye hangi makamın kararı ile kurulur?",
        "options": [
            "Nüfusu en az 2.000 — İçişleri Bakanı kararı ile",
            "Nüfusu en az 5.000 — Cumhurbaşkanı kararı ile",
            "Nüfusu en az 10.000 — TBMM kanunu ile",
            "Nüfusu en az 50.000 — Vali onayı ile",
            "Nüfusu en az 750.000 — Cumhurbaşkanı kararı ile"
        ],
        "correctIndex": 1,
        "explanation": "5393 sayılı Belediye Kanunu uyarınca nüfusu 5.000 ve üzerinde olan yerleşim yerlerinde CUMHURBAŞKANI KARARI ile belediye kurulabilir (İl ve ilçe merkezlerinde ise nüfus şartı aranmaksızın belediye kurulması zorunludur).",
        "distractor_trap": "Normal belediye = Nüfus 5.000 (Cumhurbaşkanı kararı); Büyükşehir belediyesi = Nüfus 750.000 (KANUNLA); Köy = Nüfus 150-2.000 (İçişleri Bakanlığı)."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "İdare Hukuku",
        "difficulty": 1,
        "prompt_text": "Büyükşehir Belediyesi kurulabilmesi için toplam nüfusun en az kaç olması ve kuruluşun hangi işlemle yapılması şarttır?",
        "options": [
            "Nüfusu en az 250.000 — Cumhurbaşkanlığı Kararnamesi ile",
            "Nüfusu en az 500.000 — İçişleri Bakanlığı onayı ile",
            "Toplam il nüfusu en az 750.000 — KANUNLA",
            "Nüfusu en az 1.000.000 — Danıştay kararı ile",
            "Nüfusu en az 5.000 — Vali teklifi ile"
        ],
        "correctIndex": 2,
        "explanation": "5216 sayılı Büyükşehir Belediyesi Kanunu uyarınca toplam il nüfusu fiziki yerleşim durumuna göre en az 750.000 olan illerde YALNIZCA KANUNLA (TBMM tarafından) Büyükşehir Belediyesi kurulabilir.",
        "distractor_trap": "Büyükşehir belediyesi Cumhurbaşkanı kararıyla değil, mutlaka TBMM tarafından çıkarılan KANUNLA kurulur!"
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "İdare Hukuku",
        "difficulty": 1,
        "prompt_text": "657 sayılı Devlet Memurları Kanunu'na göre aşağıdakilerden hangisi bir 'disiplin cezası' DEĞİLDİR?",
        "options": [
            "Uyarma",
            "Kınama",
            "Aylıktan kesme",
            "Görevden uzaklaştırma",
            "Kademe ilerlemesinin durdurulması"
        ],
        "correctIndex": 3,
        "explanation": "657 sayılı DMK m. 125'te disiplin cezaları 5 tanedir: 1) Uyarma, 2) Kınama, 3) Aylıktan kesme, 4) Kademe ilerlemesinin durdurulması, 5) Devlet memurluğundan çıkarma. 'Görevden uzaklaştırma' bir disiplin cezası değil, soruşturmanın selameti için uygulanan geçici bir İDARİ TEDBİRDİR.",
        "distractor_trap": "Görevden uzaklaştırma ve sürgün/tayin disiplin cezası DEĞİLDİR! En klasik sınav tuzaklarından biridir."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "İdare Hukuku",
        "difficulty": 1,
        "prompt_text": "Vali ile Kaymakamın hukuki statüleri ve atanma usulleri karşılaştırıldığında aşağıdakilerden hangisi doğrudur?",
        "options": [
            "Vali meslek memurudur; Kaymakam istisnai memurdur.",
            "Vali Cumhurbaşkanı kararıyla atanır ve istisnai memurdur; Kaymakam ise Cumhurbaşkanı onayıyla atanır ve güvenceli bir meslek/kariyer memurudur.",
            "Her ikisi de İçişleri Bakanı tarafından atanır.",
            "Kaymakam yetki genişliğine sahiptir, vali sahip değildir.",
            "Vali olabilmek için kaymakamlık yapmış olmak zorunludur."
        ],
        "correctIndex": 1,
        "explanation": "Valiler Cumhurbaşkanı Kararı ile atanır ve 'istisnai memur' statüsündedir (Cumhurbaşkanı dilediği kişiyi vali atayabilir, görev süresi CB ile biter). Kaymakamlar ise sınavla girilen, staj yapılan kariyer/meslek memurudur ve Cumhurbaşkanı Onayı ile atanırlar.",
        "distractor_trap": "Vali = Cumhurbaşkanı KARARI (İstisnai memur); Kaymakam = Cumhurbaşkanı ONAYI (Kariyer/meslek memuru)."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "İdare Hukuku",
        "difficulty": 1,
        "prompt_text": "Merkezi idarenin aynı kamu tüzel kişiliği (devlet tüzel kişiliği) içerisindeki üst makamlarının ast makamlar üzerindeki emir, talimat, denetim ve iptal yetkisine ne ad verilir?",
        "options": [
            "İdari Vesayet",
            "Hiyerarşi Yetkisi",
            "Yetki Genişliği",
            "Yetki Devri",
            "Özerklik"
        ],
        "correctIndex": 1,
        "explanation": "Aynı tüzel kişilik içerisindeki ast-üst denetimine 'hiyerarşi' denir (örneğin Bakanın Müsteşara/Valiye, Valinin Kaymakama, Rektörün Dekana, Emniyet Müdürünün polise emretmesi).",
        "distractor_trap": "Aynı çatı altındaki ast-üst ilişkisi = Hiyerarşi; İki farklı tüzel kişilik arasındaki dış denetim (Vali - Belediye) = İdari Vesayet."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "İdare Hukuku",
        "difficulty": 1,
        "prompt_text": "Merkezi idarenin (devletin) yerinden yönetim kuruluşları (belediyeler, köyler, meslek odaları) üzerinde idarenin bütünlüğünü ve kamu hizmetlerinin uyumunu sağlamak amacıyla kanunla sınırlı olarak kullandığı dış denetim yetkisine ne ad verilir?",
        "options": [
            "Hiyerarşi",
            "İdari Vesayet",
            "İmza Devri",
            "Düzenleyici İşlem",
            "İstişari Görüş"
        ],
        "correctIndex": 1,
        "explanation": "Farklı kamu tüzel kişileri arasındaki denetime 'idari vesayet' denir. Örneğin İçişleri Bakanlığı'nın belediyeleri denetlemesi, Barolar Birliği'nin yerel baroları denetlemesi vesayet denetimidir.",
        "distractor_trap": "Vesayet makamı yerinden yönetim kuruluşuna emir ve talimat veremez, onun yerine geçip işlem yapamaz; sadece onaylar, iptal davası açabilir veya geciktirebilir."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "İdare Hukuku",
        "difficulty": 1,
        "prompt_text": "657 sayılı Devlet Memurları Kanunu'na göre göreve yeni başlayan bir aday memurun adaylık süresi en az ve en çok ne kadardır?",
        "options": [
            "En az 6 ay — En çok 1 yıl",
            "En az 1 yıl — En çok 2 yıl",
            "En az 2 yıl — En çok 3 yıl",
            "En az 3 ay — En çok 6 ay",
            "Doğrudan asaleten başlar, adaylık yoktur"
        ],
        "correctIndex": 1,
        "explanation": "657 sayılı DMK m. 54 uyarınca adaylık süresi 1 yıldan az, 2 yıldan çok olamaz. Adaylık devresi içinde göreve devamsızlık veya disiplinsizlik gösterenlerin memuriyetle ilişiği kesilir.",
        "distractor_trap": "Aday memurluk süresi: Asgari 1 yıl, azami 2 yıldır."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "İdare Hukuku",
        "difficulty": 1,
        "prompt_text": "Köy idaresinin karar organı olan ve köydeki tüm kadın-erkek seçmenlerin doğal olarak üyesi bulunduğu organ hangisidir?",
        "options": [
            "Köy İhtiyar Meclisi",
            "Köy Derneği",
            "İl Encümeni",
            "Köy Komisyonu",
            "Muhtarlık Divanı"
        ],
        "correctIndex": 1,
        "explanation": "Köy Derneği; köyde ikamet eden ve oy kullanma hakkına sahip tüm kadın ve erkek köylülerin oluşturduğu doğrudan demokrasi organıdır. Muhtarı ve İhtiyar Meclisi üyelerini seçer, köyün isteğe bağlı işlerini zorunlu hale getirebilir.",
        "distractor_trap": "Köy Derneği sivil toplum derneği değildir; köyün tüm seçmenlerinden oluşan resmi anayasal köy organıdır."
    },

    # -------------------------------------------------------------
    # TEST 2: STANDART ÖSYM AYARI (Zorluk: 2) - Sorular 11-20
    # -------------------------------------------------------------
    {
        "lesson": "Vatandaşlık",
        "topic": "İdare Hukuku",
        "difficulty": 2,
        "prompt_text": "Hakkında görevleriyle ilgili bir suç sebebiyle soruşturma veya kovuşturma açılan bir Belediye Başkanını 'geçici bir tedbir olarak' görevden uzaklaştırmaya yetkili makam hangisidir?",
        "options": [
            "Danıştay",
            "İçişleri Bakanı",
            "İl Valisi",
            "Cumhurbaşkanı",
            "Belediye Meclisi"
        ],
        "correctIndex": 1,
        "explanation": "Anayasa m. 127 uyarınca görevleri ile ilgili bir suç sebebi ile hakkında soruşturma veya kovuşturma açılan mahalli idare organlarını veya bu organların üyelerini, İÇİŞLERİ BAKANI geçici bir tedbir olarak kesin hükme kadar uzaklaştırabilir.",
        "distractor_trap": "GEÇİCİ uzaklaştırmayı İçişleri Bakanı yapar; KESİN olarak başkanlık sıfatının düşürülmesine ise sadece DANIŞTAY karar verebilir!"
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "İdare Hukuku",
        "difficulty": 2,
        "prompt_text": "Görevden uzaklaştırılan veya belediye başkanlığı sıfatı tartışmalı hale gelen bir belediye başkanının 'başkanlık sıfatını kesin olarak düşürme' yetkisi hangi yargı organına aittir?",
        "options": [
            "İçişleri Bakanlığı Yüksek Disiplin Kurulu",
            "Danıştay",
            "Yargıtay",
            "Anayasa Mahkemesi",
            "İdare Mahkemesi"
        ],
        "correctIndex": 1,
        "explanation": "Seçimle gelen bir yerel yöneticinin görevine kesin olarak son verme yetkisi yargı güvencesi altındadır. Belediye başkanlığının kesin olarak düşmesine yalnızca DANIŞTAY karar verebilir.",
        "distractor_trap": "İçişleri Bakanı sadece geçici uzaklaştırabilir; başkanlığı kesin bitiren Danıştay'dır."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "İdare Hukuku",
        "difficulty": 2,
        "prompt_text": "Kamu görevlisinin amirinden aldığı emri hukuka aykırı görmesi durumu (Kanunsuz Emir - Anayasa m. 137) ile ilgili kurallar değerlendirildiğinde aşağıdakilerden hangisi yanlıştır?",
        "options": [
            "Kamu görevlisi amirinin verdiği emri anayasa ve kanunlara aykırı görürse yerine getirmez ve aykırılığı emri verene bildirir.",
            "Amir emrinde ısrar eder ve bu emrini yazılı olarak yenilerse memur emri yerine getirir; bu durumda sorumluluk emri verene ait olur.",
            "Konusu suç teşkil eden emir hiçbir surette yerine getirilemez; yerine getiren kimse sorumluluktan kurtulamaz.",
            "Konusu suç teşkil eden emir amir tarafından yazılı olarak tekrarlanırsa memur emri yapar ve tüm cezai sorumluluktan tamamen muaf tutulur.",
            "Askeri hizmetlerin görülmesi ve acele hallerde kamu düzeniyle ilgili kanuni istisnalar saklıdır."
        ],
        "correctIndex": 3,
        "explanation": "Anayasa m. 137 son derece açıktır: 'Konusu suç teşkil eden emir, hiçbir suretle yerine getirilmez; yerine getiren kimse sorumluluktan kurtulamaz.' Amir emri yazılı olarak verse, hatta tehdit etse bile konusu suç olan emir yerine getirilemez; getiren memur hapse girer.",
        "distractor_trap": "Kanuna aykırı emir yazılı tekrarlanırsa memur yapar ve sorumluluk amire geçer; ancak SUÇ TEŞKİL EDEN emir yazılı verilse bile ASLA YAPILAMAZ!"
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "İdare Hukuku",
        "difficulty": 2,
        "prompt_text": "İl Genel İdaresi'nin organları ile İl Özel İdaresi'nin organları karşılaştırıldığında;\n\n• İl Özel İdaresi'nin başı ve yürütme organı olan,\n• Aynı zamanda merkezi idarenin İl Genel İdaresi'ndeki en üst amiri olan\nçift şapkalı makam aşağıdakilerden hangisidir?",
        "options": [
            "İl Genel Meclisi Başkanı",
            "Vali",
            "Büyükşehir Belediye Başkanı",
            "İl İdare Kurulu Başkanı",
            "Garnizon Komutanı"
        ],
        "correctIndex": 1,
        "explanation": "Vali çift şapkalıdır: Hem merkezi idarenin ildeki temsilcisi (İl Genel İdaresi başı) hem de yerel yönetim olan İl Özel İdaresi'nin başı ve yürütme organıdır.",
        "distractor_trap": "İl Özel İdaresi'nin başı Vali'dir; karar organı ise halkın seçtiği İl Genel Meclisi'dir."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "İdare Hukuku",
        "difficulty": 2,
        "prompt_text": "Köy İhtiyar Meclisi'nin doğal (tabii) üyeleri aşağıdakilerden hangisinde birlikte verilmiştir?",
        "options": [
            "Köy Muhtarı ve Köy Korucusu",
            "Köy İmamı ve Köy Öğretmeni",
            "Köy Ebeleri ve Ziraat Mühendisi",
            "En yaşlı köylü ve Muhtar",
            "Köy Bakkalı ve Cami Dernek Başkanı"
        ],
        "correctIndex": 1,
        "explanation": "Köy Kanunu uyarınca İhtiyar Meclisi üyelerinin bir kısmı Köy Derneği tarafından seçilir. Köyün İMAMI ve ilkokul ÖĞRETMENİ ise seçim yapılmaksızın heyetin tabii (doğal) üyeleridir.",
        "distractor_trap": "Köyün imamı ve öğretmeni İhtiyar Meclisi'nin kanuni tabii üyeleridir."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "İdare Hukuku",
        "difficulty": 2,
        "prompt_text": "657 sayılı Devlet Memurları Kanunu'na göre memurlara verilen disiplin cezalarından hangileri doğrudan 'Disiplin Amiri' (Birim Amiri/Müdür) tarafından tek başına verilebilir?",
        "options": [
            "Yalnızca Devlet memurluğundan çıkarma",
            "Uyarma, Kınama ve Aylıktan Kesme cezaları",
            "Kademe ilerlemesinin durdurulması ve İhraç",
            "Tüm disiplin cezaları sadece mahkemelerce verilir",
            "Disiplin amirleri hiçbir ceza veremez"
        ],
        "correctIndex": 1,
        "explanation": "Uyarma, kınama ve aylıktan kesme cezaları soruşturma sonrası doğrudan disiplin amirleri tarafından verilir. Kademe ilerlemesinin durdurulmasını İl Disiplin Kurulu kararıyla Vali (veya bakanlık disiplin kurulu); Memurluktan çıkarmayı ise Yüksek Disiplin Kurulu verir.",
        "distractor_trap": "Memurluktan çıkarma cezasını disiplin amiri değil, sadece YÜKSEK DİSİPLİN KURULU verebilir."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "İdare Hukuku",
        "difficulty": 2,
        "prompt_text": "Kamu tüzel kişiliği (KTK) anayasa veya kanunla ya da Cumhurbaşkanlığı kararnamesi ile kurulur.\n\nAşağıdakilerden hangisi doğrudan 'Devlet Tüzel Kişiliği' içerisinde yer alır (ayrı bir kamu tüzel kişiliği BULUNMAZ)?",
        "options": [
            "Ankara Üniversitesi",
            "Türkiye Radyo ve Televizyon Kurumu (TRT)",
            "İstanbul Barosu",
            "Milli Savunma Bakanlığı ve Emniyet Genel Müdürlüğü",
            "Kadıköy Belediyesi"
        ],
        "correctIndex": 3,
        "explanation": "Bakanlıklar, Emniyet, Valilikler ve Kaymakamlıklar genel idarenin parçasıdır; ayrı kamu tüzel kişilikleri yoktur, 'Devlet Tüzel Kişiliği'ni kullanırlar. Üniversiteler, TRT, Barolar ve Belediyeler ise ayrı kamu tüzel kişiliğine sahiptir.",
        "distractor_trap": "Bakanlıkların ayrı tüzel kişiliği YOKTUR; hepsi tek bir Devlet Tüzel Kişiliği'nin kollarıdır."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "İdare Hukuku",
        "difficulty": 2,
        "prompt_text": "Köyde imece usulü ile tüm köylülerin ortaklaşa çalışarak köy yolunu veya çeşmesini yapması kuralının yanında; köy bütçesine katkı sağlamak amacıyla hane başına toplanan yerel vergi benzeri paraya ne ad verilir?",
        "options": [
            "Salma",
            "Öşür",
            "Haraç",
            "İltizam",
            "Cizye"
        ],
        "correctIndex": 0,
        "explanation": "Köy Kanunu'na göre köyün zorunlu ortak harcamalarını karşılamak üzere İhtiyar Meclisi kararıyla hane reislerinin gelirine göre salınan yerel paraya 'Salma' denir. Bedenen çalışmaya ise 'İmece' denir.",
        "distractor_trap": "Bedenle çalışma = İmece; Parayla katkı = Salma. Köy idaresinin iki özgün aracıdır."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "İdare Hukuku",
        "difficulty": 2,
        "prompt_text": "İçişleri Bakanlığı, Cumhurbaşkanlığı Kararnameleri ve Yönetmelikler çıkarabilen idari düzenleyici işlemler tesis eder.\n\nCumhurbaşkanı, bakanlıklar ve kamu tüzel kişilerinin kendi görev alanlarını ilgilendiren kanun ve Cumhurbaşkanlığı kararnamelerinin uygulanmasını sağlamak üzere çıkardıkları düzenleyici işlem hangisidir?",
        "options": [
            "Yönetmelik",
            "Kanun Hükmünde Kararname",
            "Tüzük",
            "Yasa Gücünde Karar",
            "İçtihadı Birleştirme Kararı"
        ],
        "correctIndex": 0,
        "explanation": "Anayasa m. 124 gereğince Cumhurbaşkanı, bakanlıklar ve kamu tüzel kişileri görev alanlarını ilgilendiren kanunların uygulanmasını göstermek üzere 'Yönetmelik' çıkarabilirler. Tüzük ve KHK 2017'de yürürlükten kalkmıştır.",
        "distractor_trap": "Tüzük ve KHK artık yoktur! Güncel düzenleyici işlemler: CBK ve Yönetmeliktir."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "İdare Hukuku",
        "difficulty": 2,
        "prompt_text": "Aşağıdakilerden hangisi Cumhurbaşkanlığı teşkilatında 'idari vesayet' yetkisine bir örnektir?",
        "options": [
            "İçişleri Bakanı'nın Emniyet Genel Müdürü'nü denetlemesi",
            "Vali'nin İl Milli Eğitim Müdürü'ne talimat vermesi",
            "Çevre, Şehircilik ve İklim Değişikliği Bakanlığı'nın bir ilçe belediyesinin imar planını denetlemesi",
            "Kaymakamın İlçe Nüfus Müdürü'nün sicilini doldurması",
            "Sağlık Bakanı'nın Başhekimi görevden alması"
        ],
        "correctIndex": 2,
        "explanation": "Bakanlık devlet tüzel kişiliğidir; belediye ise ayrı bir mahalli kamu tüzel kişiliğidir. Bakanlığın belediyeyi denetlemesi iki ayrı tüzel kişilik arasında olduğu için 'idari vesayet'tir. Diğer tüm şıklar aynı çatı altındaki 'hiyerarşi'dir.",
        "distractor_trap": "Devletin belediyeyi veya üniversiteyi denetlemesi = Vesayet; Devletin kendi müdürünü denetlemesi = Hiyerarşi."
    },

    # -------------------------------------------------------------
    # TEST 3: STANDART ÖSYM DÜZEYİ (Zorluk: 2) - Sorular 21-30
    # -------------------------------------------------------------
    {
        "lesson": "Vatandaşlık",
        "topic": "İdare Hukuku",
        "difficulty": 2,
        "prompt_text": "İdarenin tek taraflı irade beyanıyla ilgililerin rızası aranmaksızın hukuki sonuç doğuran, uygulanabilir ve hukuka uygun olduğu varsayılan işlemlerine 'İdari İşlem' denir.\n\nAşağıdakilerden hangisi idari işlemlerin temel özelliklerinden biri DEĞİLDİR?",
        "options": [
            "Tek yanlı olması (karşı tarafın kabulüne bağlı olmaması)",
            "İcrai (yürütülebilir) olması",
            "Hukuka uygunluk karinesinden yararlanması (mahkemece iptal edilene kadar geçerli sayılması)",
            "Kamu gücüne dayanması",
            "İki tarafın karşılıklı rızası ve irade uyuşmasıyla doğması"
        ],
        "correctIndex": 4,
        "explanation": "İdari işlemler tek yanlıdır, kamu gücüne dayanır, doğrudan uygulanabilir (icrailik) ve mahkemece aksi ispatlanıp iptal edilene kadar hukuka uygun kabul edilir (hukuka uygunluk karinesi). İki tarafın karşılıklı rızası ve irade uyuşması idari sözleşmelerde söz konusudur; tek taraflı idari işlemlerde muhatabın rızası aranmaz.",
        "distractor_trap": "İdari işlemler tek yanlıdır; muhatabın rızası veya onayı şart değildir (örneğin kamulaştırma, vergi cezası, memur tayini)."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "İdare Hukuku",
        "difficulty": 2,
        "prompt_text": "İdare ile özel kişiler arasında kamu hizmetlerinin gördürülmesi amacıyla akdedilen 'Kamu Hizmeti İmtiyaz Sözleşmeleri' imzalanmadan önce Anayasa gereği düşüncesi alınması zorunlu olan yüksek yargı organı aşağıdakilerden hangisidir?",
        "options": [
            "Yargıtay",
            "Danıştay",
            "Sayıştay",
            "Anayasa Mahkemesi",
            "Uyuşmazlık Mahkemesi"
        ],
        "correctIndex": 1,
        "explanation": "Anayasa m. 155 uyarınca kamu hizmetleri ile ilgili imtiyaz şartlaşma ve sözleşmeleri hakkında DANIŞTAY'ın iki ay içinde düşüncesini bildirmesi zorunludur.",
        "distractor_trap": "ÖSYM bu soruda Danıştay ile Sayıştay'ı karşı karşıya getirir. Sayıştay mali denetim yapar; imtiyaz sözleşmelerinde istişari düşünce bildiren yüksek yargı mercii DANIŞTAY'dır (inceleme süresi en fazla 2 aydır)."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "İdare Hukuku",
        "difficulty": 2,
        "prompt_text": "2942 sayılı Kamulaştırma Kanunu'na göre idare ile taşınmaz sahibi arasında uzlaşma sağlanamaması halinde, kamulaştırma bedelinin tespiti ve taşınmazın idare adına tescili için açılacak dava hangi mahkemede görülür?",
        "options": [
            "İdare Mahkemesi",
            "Vergi Mahkemesi",
            "Asliye Hukuk Mahkemesi",
            "Danıştay",
            "Sulh Hukuk Mahkemesi"
        ],
        "correctIndex": 2,
        "explanation": "Kamulaştırmada 'bedel tespiti ve tescil' davası adli yargı kolunda yer alan ASLİYE HUKUK MAHKEMESİ'nde görülür. Kamulaştırma işleminin kamu yararına veya hukuka aykırılığı nedeniyle işlemin kendisine karşı açılacak iptal davası ise idari yargıda (İdare Mahkemesi) açılır.",
        "distractor_trap": "En klasik ÖSYM çeldiricisidir: Kamulaştırma idari bir işlem olsa da, BEDEL TESPİTİ ve TESCİL davası adli mahkeme olan Asliye Hukuk Mahkemesi'nde görülür!"
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "İdare Hukuku",
        "difficulty": 2,
        "prompt_text": "İdari yargılama hukukunda; hukuka aykırı bir idari işlemin geçmişe etkili olarak hukuk aleminden kaldırılmasını talep eden davaya ne ad verilir?",
        "options": [
            "Tam Yargı Davası",
            "İptal Davası",
            "Menfi Tespit Davası",
            "İstirdat Davası",
            "Tasfiye Davası"
        ],
        "correctIndex": 1,
        "explanation": "İptal davası; idari işlemlerin yetki, şekil, sebep, konu ve maksat yönlerinden hukuka aykırı olduklarından dolayı menfaatleri ihlal edilenler tarafından açılan ve işlemin iptalini (hukuk düzeninden kaldırılmasını) sağlayan davadır. Bir zararın giderilmesi veya tazminat talebi ise 'Tam Yargı Davası' ile istenir.",
        "distractor_trap": "İptal Davası = İşlemin ortadan kaldırılması (hukuka aykırılık); Tam Yargı Davası = Maddi veya manevi tazminat (zararın ödenmesi)."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "İdare Hukuku",
        "difficulty": 2,
        "prompt_text": "657 sayılı Devlet Memurları Kanunu'na göre disiplin amirleri veya kurulları tarafından memura bir disiplin cezası verilebilmesi için, memura savunmasını yapması amacıyla EN AZ kaç günlük süre tanınması zorunludur?",
        "options": [
            "3 gün",
            "7 gün",
            "10 gün",
            "15 gün",
            "30 gün"
        ],
        "correctIndex": 1,
        "explanation": "657 sayılı DMK m. 130 uyarınca devlet memuru hakkında savunması alınmadan disiplin cezası verilemez. Soruşturmayı yapan veya yetkili disiplin amiri memura savunmasını yapması için EN AZ 7 GÜN süre tanımak zorundadır. Bu süre verilmeden ceza tesis edilirse işlem şekil yönünden iptal edilir.",
        "distractor_trap": "Disiplin savunma süresi kanunda açıkça EN AZ 7 GÜN olarak belirlenmiştir. 10 veya 15 gün çeldiricilerine dikkat edilmelidir."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "İdare Hukuku",
        "difficulty": 2,
        "prompt_text": "657 sayılı Devlet Memurları Kanunu'na göre hizmet süresi 1 yıldan 10 yıla kadar (10 yıl dahil) olan bir devlet memurunun yıllık izin süresi kaç gündür?",
        "options": [
            "15 gün",
            "20 gün",
            "25 gün",
            "30 gün",
            "45 gün"
        ],
        "correctIndex": 1,
        "explanation": "657 sayılı DMK m. 102 uyarınca memurların yıllık izin süresi: Hizmeti 1 yıldan 10 yıla kadar olanlar için 20 GÜN; hizmeti 10 yıldan fazla olanlar için ise 30 GÜNDÜR.",
        "distractor_trap": "1-10 yıl arası = 20 gün; 10 yılı aşan memurlar = 30 gün izin hakkına sahiptir. 15 gün çeldiricisi iş kanunundaki işçilerle karıştırılmamalıdır."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "İdare Hukuku",
        "difficulty": 2,
        "prompt_text": "657 sayılı Devlet Memurları Kanunu'nda düzenlenen mazeret izinleri kapsamında; eşi doğum yapan erkek memura isteği üzerine kaç gün babalık izni verilir?",
        "options": [
            "3 gün",
            "5 gün",
            "7 gün",
            "10 gün",
            "15 gün"
        ],
        "correctIndex": 3,
        "explanation": "657 sayılı DMK m. 104/B uyarınca memura eşinin doğum yapması halinde isteği üzerine 10 GÜN babalık izni verilir. Evlilik, kendisinin veya çocuğunun evlenmesi, eşinin, çocuğunun, anne-babasının veya kardeşinin vefatı halinde ise 7 gün izin verilir.",
        "distractor_trap": "Babalık izni 10 gündür! Evlilik ve ölüm izinleri ise 7 gündür. Bu iki süre ÖSYM tarafından sıkça yer değiştirilerek sorulur."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "İdare Hukuku",
        "difficulty": 2,
        "prompt_text": "Türk Hukukunda Normlar Hiyerarşisi değerlendirildiğinde aşağıdakilerden hangisi idarenin düzenleyici işlemleri arasında yer alıp Cumhurbaşkanlığı Kararnameleri ve Kanunların altında, yönetmeliklerin ise altında veya yürütülmesine dair talimat niteliğinde yer alan adsız düzenleyici işlemlerden biridir?",
        "options": [
            "Genelge (Tamim)",
            "Uluslararası Andlaşma",
            "Temel Haklara İlişkin Kanun",
            "Olağanüstü Hal Cumhurbaşkanlığı Kararnamesi",
            "Anayasa Değişikliği"
        ],
        "correctIndex": 0,
        "explanation": "Normlar Hiyerarşisinde sıra: Anayasa > Kanun/Uluslararası Andlaşma/Olağanüstü Hal CBK > Olağan CBK > Yönetmelik > Adsız Düzenleyici İşlemler (Genelge, Yönerge, Sirküler, Tebliğ). Genelge (tamim), yönetmelik ve kanunların ast makamlara nasıl uygulanacağını gösteren düzenleyici idari işlemlerdir.",
        "distractor_trap": "Genelgeler (tamim/sirküler), normlar piramidinde yönetmeliklerin de altında yer alan idari düzenlemelerdir."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "İdare Hukuku",
        "difficulty": 2,
        "prompt_text": "İl idaresinde Vali ile İl İdare Şube Başkanları (örneğin İl Defterdarı, İl Milli Eğitim Müdürü, İl Sağlık Müdürü) arasındaki hukuki denetim ilişkisi aşağıdakilerden hangisidir?",
        "options": [
            "İdari Vesayet",
            "Hiyerarşi",
            "Yargısal Denetim",
            "İstişari Yetki",
            "Özerklik İlişkisi"
        ],
        "correctIndex": 1,
        "explanation": "Vali de il idare şube başkanları da aynı kamu tüzel kişiliği olan 'Devlet Tüzel Kişiliği' çatısı altındadır. Aynı kamu tüzel kişiliği içindeki ast-üst emir, talimat, sicil ve denetim ilişkisine 'HİYERARŞİ' denir.",
        "distractor_trap": "Aynı kamu tüzel kişiliği içindeysen HİYERARŞİ; iki ayrı kamu tüzel kişiliği arasındaysan (Devletin Belediyeyi veya Üniversiteyi denetlemesi gibi) İDARİ VESAYET olur."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "İdare Hukuku",
        "difficulty": 2,
        "prompt_text": "Anayasa'nın 127. maddesine göre görevleri sebebiyle haklarında soruşturma veya kovuşturma açılan mahalli idare organlarını veya bu organların üyelerini, kesin hükme kadar GEÇİCİ BİR TEDBİR olarak görevden uzaklaştırmaya yetkili makam aşağıdakilerden hangisidir?",
        "options": [
            "Danıştay",
            "Vali",
            "İçişleri Bakanı",
            "Cumhurbaşkanı",
            "İdare Mahkemesi"
        ],
        "correctIndex": 2,
        "explanation": "Anayasa m. 127/4 uyarınca görevleri ile ilgili bir suç sebebi ile hakkında soruşturma veya kovuşturma açılan mahalli idare organlarını veya bu organların üyelerini, kesin hükme kadar bir tedbir olarak, İÇİŞLERİ BAKANI görevden uzaklaştırabilir. Organlık sıfatının KESİN olarak sona erdirilmesine ise ancak DANIŞTAY karar verebilir.",
        "distractor_trap": "ÖSYM'nin efsane tuzağı: GEÇİCİ olarak görevden uzaklaştıran = İÇİŞLERİ BAKANI; Organlık sıfatına KESİN olarak son veren = DANIŞTAY'dır!"
    },

    # -------------------------------------------------------------
    # TEST 4: NET SIÇRATAN / KURTLAR SOFRASI (Zorluk: 3) - Sorular 31-40
    # -------------------------------------------------------------
    {
        "lesson": "Vatandaşlık",
        "topic": "İdare Hukuku",
        "difficulty": 3,
        "prompt_text": "Büyükşehir belediyesi bulunan bir ilde aşağıdakilerden hangisi KANUNEN MEVCUTTUR?",
        "options": [
            "İl Özel İdaresi",
            "Köy Tüzel Kişiliği",
            "Bucak Teşkilatı",
            "Yatırım İzleme ve Koordinasyon Başkanlığı (YİKOB)",
            "Köy Derneği"
        ],
        "correctIndex": 3,
        "explanation": "6360 sayılı Kanun uyarınca 30 büyükşehir olan ilde İl Özel İdareleri, köyler ve beldeler kapatılmıştır. İl Özel İdaresi'nin kapatılmasıyla doğan kamu yatırımlarını yürütmek üzere valilik bünyesinde 'Yatırım İzleme ve Koordinasyon Başkanlığı' (YİKOB) kurulmuştur.",
        "distractor_trap": "Büyükşehir olan 30 ilde İl Özel İdaresi ve Köy YOKTUR! Onların yerine valiliğe bağlı YİKOB vardır."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "İdare Hukuku",
        "difficulty": 3,
        "prompt_text": "İdari işlemlerin unsurları (Yetki, Şekil, Sebep, Konu, Amaç) değerlendirildiğinde bütün idari işlemlerin 'Amaç (Maksat)' unsuru istisnasız her zaman aşağıdakilerden hangisidir?",
        "options": [
            "Devlete gelir sağlamak",
            "Kamu Yararı",
            "Kamu görevlilerini korumak",
            "Yargı yükünü azaltmak",
            "Özel sektörü desteklemek"
        ],
        "correctIndex": 1,
        "explanation": "İdare hukukunda amaç unsuru tektir, geneldir ve değişmez: KAMU YARARI'dır. Bir idari işlem kamu yararı dışında kişisel intikam, siyasi kayırma veya zümre menfaati amacıyla yapılırsa 'yetki saptırması' sebebiyle amaç yönünden sakatlanır ve iptal edilir.",
        "distractor_trap": "Tüm idari işlemlerin değişmez ve tek meşru amacı Kamu Yararıdır; başka bir amaç güdülemez."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "İdare Hukuku",
        "difficulty": 3,
        "prompt_text": "İdarenin hukuki sorumluluğunda uygulanan 'Kusursuz Sorumluluk' halleri arasında aşağıdakilerden hangisi yer alır?",
        "options": [
            "İdarenin hizmet kusuru (hizmetin geç, kötü işlemesi veya hiç işlememesi)",
            "Risk (Tehlike) İlkesi ve Kamu Külfetleri Karşısında Eşitlik (Fedakarlığın Denkleştirilmesi) İlkesi",
            "Memurun kişisel kastı",
            "Mücbir sebep (deprem, sel gibi önüne geçilemez doğa olayları)",
            "Zarar görenin kendi ağır kusuru"
        ],
        "correctIndex": 1,
        "explanation": "Kusursuz sorumlulukta idarenin bir hatası veya kusuru olmasa dahi meydana gelen zararı ödeme yükümlülüğü vardır. Bu sorumluluk iki ilkeye dayanır: 1) Risk (tehlike) ilkesi (idarenin tehlikeli faaliyetleri: mühimmat deposu patlaması vb.), 2) Kamu külfetleri karşısında eşitlik ilkesi (toplum için yapılan köprünün tek bir dükkanın önünü kapatıp batırması).",
        "distractor_trap": "Hizmet kusuru kusurlu sorumluluktur; Risk ve Fedakarlığın Denkleştirilmesi ise KUSURSUZ sorumluluk ilkeleridir."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "İdare Hukuku",
        "difficulty": 3,
        "prompt_text": "Kamu düzenini korumakla görevli olan 'İdari Kolluk' ile suç işlendikten sonra failleri yakalayan 'Adli Kolluk' arasındaki temel fark aşağıdakilerden hangisidir?",
        "options": [
            "İdari kolluk adliye mahkemelerine bağlıdır, adli kolluk valiye bağlıdır.",
            "İdari kolluk suç işlenmesini ÖNLEYİCİ niteliktedir ve idari amirlere bağlıdır; adli kolluk ise suç işlendikten sonra delil toplayıp failleri adalete teslim eder ve CUMHURİYET SAVCISINA bağlıdır.",
            "İdari kolluk silah taşıyamaz, adli kolluk taşır.",
            "Adli kolluk sadece köylerde görev yapar.",
            "İdari kolluğun tüm işlemlerine karşı yargı yolu kapalıdır."
        ],
        "correctIndex": 1,
        "explanation": "İdari kolluk henüz suç işlenmeden kamu düzenini korumak için önleyici tedbir alır (Vali, Kaymakam, polis devriyesi). Adli kolluk ise bir suç işlendikten sonra ceza muhakemesi için devreye girer ve doğrudan Cumhuriyet Savcısı'nın emri altında çalışır.",
        "distractor_trap": "İdari kolluk = Suç öncesi / İdari amir; Adli kolluk = Suç sonrası / Cumhuriyet Savcısı!"
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "İdare Hukuku",
        "difficulty": 3,
        "prompt_text": "Türkiye'de Kamu İktisadi Teşebbüsleri (KİT); İktisadi Devlet Teşekkülleri (İDT) ve Kamu İktisadi Kuruluşları (KİK) olmak üzere ikiye ayrılır.\n\nİDT ile KİK arasındaki temel ayrım kriteri aşağıdakilerden hangisidir?",
        "options": [
            "İDT'lerin kar amacı gütmesi ve ticari esaslara göre çalışması; KİK'lerin ise kamu hizmeti ve tekel niteliğindeki imtiyazlı kamu mallarını üretmesi ve kar amacı gütmemesi",
            "İDT'lerin özel sektöre ait olması",
            "KİK'lerin sadece yabancı ortaklıkla kurulması",
            "İDT'lerin Sayıştay denetimine tabi olmaması",
            "KİK'lerin iflas edebilmesi"
        ],
        "correctIndex": 0,
        "explanation": "233 sayılı KHK uyarınca: Sermayesinin tamamı devlete ait olup iktisadi alanda ticari esaslara göre çalışan ve KAR AMACI güden KİT'lere İktisadi Devlet Teşekkülü (İDT - örn. ÇAYKUR, BOTAŞ); tekel niteliğindeki kamu hizmeti gören ve kar amacı öncelikli olmayan KİT'lere ise Kamu İktisadi Kuruluşu (KİK - örn. TCDD, DHMİ) denir.",
        "distractor_trap": "İDT = Ticari / Kar amaçlı; KİK = Tekel / Kamu hizmeti odaklı."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "İdare Hukuku",
        "difficulty": 3,
        "prompt_text": "İdari yargıda dava açma süreleri genel kural olarak İdare Mahkemelerinde ve Danıştay'da kaç gündür?",
        "options": [
            "İdare Mahkemelerinde 30 gün — Danıştay'da 30 gün",
            "İdare Mahkemelerinde 60 gün — Vergi Mahkemelerinde 30 gün (Danıştay'da ilk derece 60 gün)",
            "Her mahkemede 15 gün",
            "İdare mahkemesinde 90 gün",
            "Süre sınırı yoktur"
        ],
        "correctIndex": 1,
        "explanation": "2577 sayılı İdari Yargılama Usulü Kanunu (İYUK) m. 7 uyarınca dava açma süresi özel kanunlarda ayrı süre gösterilmemişse Danıştay'da ve İdare Mahkemelerinde 60 GÜN, Vergi Mahkemelerinde ise 30 GÜNDÜR.",
        "distractor_trap": "İdare Mahkemesi ve Danıştay = 60 gün; Vergi Mahkemesi = 30 gündür!"
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "İdare Hukuku",
        "difficulty": 3,
        "prompt_text": "İdarenin mal edinme yöntemlerinden 'Kamulaştırma' ile 'İstimval' arasındaki temel fark aşağıdakilerden hangisidir?",
        "options": [
            "Kamulaştırma taşınmazlar içindir; İstimval ise savaş veya olağanüstü hallerde idarenin kişilere ait TAŞINIR mallara veya çalışma gücüne el koymasıdır.",
            "Kamulaştırmada bedel ödenmez, istimvalde peşin ödenir.",
            "İstimval belediyeler tarafından park yapmak için uygulanır.",
            "Kamulaştırma sadece askeri dönemde yapılır.",
            "İkisi tamamen aynı kavramdır."
        ],
        "correctIndex": 0,
        "explanation": "Kamulaştırma olağan dönemde kamu yararı için taşınmaz (arsa/arazi) mülkiyetinin alınmasıdır. İstimval ise seferberlik, savaş veya olağanüstü afet hallerinde devletin özel kişilere ait kamyon, iş makinesi gibi TAŞINIR mallara el koyması veya kişileri ücretiyle çalıştırmasıdır.",
        "distractor_trap": "Taşınmaz = Kamulaştırma; Taşınır ve çalışma gücü (OHAL/Savaşta) = İstimval."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "İdare Hukuku",
        "difficulty": 3,
        "prompt_text": "Memurluk statüsünü sona erdiren haller değerlendirildiğinde aşağıdakilerden hangisi memurluğu kendiliğinden veya doğrudan sona erdiren durumlardan biri değildir?",
        "options": [
            "Ölüm",
            "Emeklilik",
            "Memurluk şartlarından birini (örneğin kasten işlenen suçtan 1 yıl hapis alarak) sonradan kaybetme",
            "Görevden uzaklaştırma tedbiri uygulanması",
            "Çekilme (İstifa) veya çekilmiş sayılma (müstafi sayılma)"
        ],
        "correctIndex": 3,
        "explanation": "Görevden uzaklaştırma memurluğu sona erdirmez; maaşının 2/3'ünü almaya devam eder ve soruşturma sonucunda suçsuz bulunursa görevine iade edilir. Ölüm, istifa, emeklilik ve şartların kaybı ise memuriyeti tamamen bitirir.",
        "distractor_trap": "Görevden uzaklaştırılan kişi halen memurdur; kadrosu ve memuriyet bağı devam eder."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "İdare Hukuku",
        "difficulty": 3,
        "prompt_text": "Cumhurbaşkanı, bakanlıklar ve kamu tüzel kişileri tarafından çıkarılan yönetmeliklerin Resmî Gazete'de yayımlanma kuralı aşağıdakilerden hangisinde doğru ifade edilmiştir?",
        "options": [
            "Bütün yönetmelikler istisnasız Resmî Gazete'de yayımlanmak zorundadır.",
            "Hiçbir yönetmelik Resmî Gazete'de yayımlanmaz.",
            "Hangi yönetmeliklerin Resmî Gazete'de yayımlanacağı kanunla belirtilir; kural olarak kamu personelini ilgilendiren ve milli çapta uygulanan yönetmelikler yayımlanır, mahalli veya dar kapsamlı olanlar yerel duyuru ile ilan edilir.",
            "Yalnızca belediye yönetmelikleri yayımlanır.",
            "Yönetmelikler sadece TRT'de okunarak yürürlüğe girer."
        ],
        "correctIndex": 2,
        "explanation": "Anayasa m. 124/2 uyarınca hangi yönetmeliklerin Resmî Gazete'de yayımlanacağı kanunda belirtilir. Ülke çapında uygulanacak ve genel düzenleme getiren yönetmelikler Resmî Gazete'de yayımlanır; yerel bir belediyenin veya üniversitenin iç yönetmeliği yerel ilan panolarıyla duyurulabilir.",
        "distractor_trap": "Bütün yönetmeliklerin Resmi Gazete'de yayımlanma zorunluluğu YOKTUR; hangilerinin yayımlanacağını kanun belirler."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "İdare Hukuku",
        "difficulty": 3,
        "prompt_text": "İl Genel İdaresi bünyesinde yer alan 'İl İdare Kurulu' kimlerden oluşur?",
        "options": [
            "Vali başkanlığında; Hukuk İşleri Müdürü, Defterdar, İl Milli Eğitim, İl Sağlık, İl Tarım ve Orman müdürleri",
            "Vali, Belediye Başkanı ve Garnizon Komutanı",
            "Kaymakamlar ve Muhtarlar",
            "Yalnızca İl Genel Meclisi üyeleri",
            "İl Emniyet Müdürü ve Cumhuriyet Başsavcısı"
        ],
        "correctIndex": 0,
        "explanation": "İl İdare Kurulu; Valinin başkanlığında Hukuk İşleri Müdürü, Defterdar, İl Milli Eğitim Müdürü, İl Sağlık Müdürü, İl Tarım ve Orman Müdürü ile Çevre ve Şehircilik Müdüründen oluşur. Belediye başkanı veya askerler bu kurulda yer almaz.",
        "distractor_trap": "İl İdare Kurulu'nda Belediye Başkanı veya Garnizon Komutanı KESİNLİKLE YOKTUR! Tamamen merkezi idarenin il müdürlerinden oluşur."
    },

    # -------------------------------------------------------------
    # TEST 5: HAP BİLGİ & CHECK-UP TESTİ (Zorluk: 2) - Sorular 41-50
    # -------------------------------------------------------------
    {
        "lesson": "Vatandaşlık",
        "topic": "İdare Hukuku",
        "difficulty": 2,
        "prompt_text": "657 sayılı Devlet Memurları Kanunu'na göre ilk defa veya naklen bir göreve atanan memurların göreve başlama süreleri değerlendirildiğinde; aynı belediye ve il sınırları içindeki bir göreve atananlar ile başka bir yerdeki göreve atananların işe başlama süreleri hangi seçenekte doğru verilmiştir?",
        "options": [
            "Aynı yerdeki göreve tebliğ gününü izleyen iş günü — Başka yerdeki göreve tebliğden itibaren 15 gün içinde",
            "Aynı yerdeki göreve 3 gün içinde — Başka yerdeki göreve 30 gün içinde",
            "Her iki göreve de derhal aynı gün",
            "Aynı yerdeki göreve 7 gün — Başka yerdeki göreve 1 ay içinde",
            "Aynı yerdeki göreve 15 gün — Başka yerdeki göreve 45 gün içinde"
        ],
        "correctIndex": 0,
        "explanation": "657 sayılı DMK m. 62 uyarınca: Aynı yerdeki göreve atananlar atama emrinin kendilerine tebliğ gününü İZLEYEN İŞ GÜNÜ içinde; başka yerdeki göreve atananlar ise tebliğ tarihinden itibaren 15 GÜN İÇERİSİNDE o yere hareket ederek işe başlamak zorundadır.",
        "distractor_trap": "ÖSYM'nin en klasik memurluk süresi sorusudur: Aynı yer = Ertesi iş günü; Başka yer = 15 GÜN!"
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "İdare Hukuku",
        "difficulty": 2,
        "prompt_text": "657 sayılı Devlet Memurları Kanunu'na göre bir devlet memuru mazeretsiz ve kesintisiz olarak EN AZ kaç gün görevini terk ederse çekilme (istifa) isteğinde bulunmuş sayılır (müstafi sayılır)?",
        "options": [
            "3 gün",
            "5 gün",
            "7 gün",
            "10 gün",
            "20 gün"
        ],
        "correctIndex": 3,
        "explanation": "657 sayılı DMK m. 94 uyarınca: Mezuniyetsiz veya kurumunca kabul edilen mazereti olmaksızın görevin terk edilmesi ve bu terkin KESİNTİSİZ 10 GÜN devam etmesi halinde, yazılı müracaat şartı aranmaksızın memur çekilmiş (müstafi) sayılır.",
        "distractor_trap": "Kesintisiz 10 gün işe gelmeyen memur müstafi sayılır ve 1 yıl süreyle memurluğa geri dönemez."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "İdare Hukuku",
        "difficulty": 2,
        "prompt_text": "657 sayılı Devlet Memurları Kanunu'na göre devlet memurluğuna yeni giren bir kişinin 'Aday Memurluk' süresi en az ve en çok kaç yıl olabilir?",
        "options": [
            "En az 6 ay — En çok 1 yıl",
            "En az 1 yıl — En çok 2 yıl",
            "En az 1 yıl — En çok 3 yıl",
            "En az 2 yıl — En çok 4 yıl",
            "Sabit 1 yıldır, uzatılamaz."
        ],
        "correctIndex": 1,
        "explanation": "657 sayılı DMK m. 54 uyarınca: Adaylık süresi EN AZ 1 YIL, EN ÇOK 2 YILDIR ve bu süre içinde aday memurun başka kurumlara nakli yapılamaz.",
        "distractor_trap": "Aday memurluk süresi EN AZ 1 YIL, EN ÇOK 2 YILDIR! 6 ay veya 3 yıl şıkları çeldiricidir."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "İdare Hukuku",
        "difficulty": 2,
        "prompt_text": "657 sayılı Devlet Memurları Kanunu'nda düzenlenen disiplin cezalarından 'Devlet Memurluğundan Çıkarma' cezasını vermeye yetkili makam aşağıdakilerden hangisidir?",
        "options": [
            "Disiplin Amiri",
            "Atamaya Yetkili Amir",
            "Yüksek Disiplin Kurulu",
            "Vali",
            "Cumhuriyet Başsavcısı"
        ],
        "correctIndex": 2,
        "explanation": "Uyarma, kınama ve aylıktan kesme cezalarını disiplin amirleri; kademe ilerlemesinin durdurulmasını il disiplin kurulu kararıyla atamaya yetkili amir; MEMURLUKTAN ÇIKARMA cezasını ise amirin teklifi üzerine amirin bağlı olduğu kurumun YÜKSEK DİSİPLİN KURULU verir.",
        "distractor_trap": "Disiplin amiri tek başına memurluktan ihraç kararı veremez; çıkarma cezasını sadece YÜKSEK DİSİPLİN KURULU verebilir."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "İdare Hukuku",
        "difficulty": 2,
        "prompt_text": "Türkiye'de bir yerleşim yerinde Köy İdaresi'nin kurulabilmesi için nüfusun hangi aralıkta olması gerekir ve köy tüzel kişiliği hangi makamın kararı ile kurulur?",
        "options": [
            "Nüfusu 150 ile 2.000 arasında olmalı — İçişleri Bakanlığı kararı ile kurulur.",
            "Nüfusu 500 ile 5.000 arasında olmalı — Çevre ve Şehircilik Bakanlığı kararı ile kurulur.",
            "Nüfusu 1.000 ile 2.000 arasında olmalı — Vali kararı ile kurulur.",
            "Nüfusu 2.000 ile 10.000 arasında olmalı — Kanunla kurulur.",
            "Nüfusu en az 5.000 olmalı — Cumhurbaşkanı kararı ile kurulur."
        ],
        "correctIndex": 0,
        "explanation": "Köy Kanunu m. 1: Nüfusu 2.000'den aşağı olan yerlere köy denir (en alt sınır teamülen 150'dir). Köy tüzel kişiliği İÇİŞLERİ BAKANLIĞI kararı ile kurulur.",
        "distractor_trap": "Belediye Cumhurbaşkanı kararıyla (en az 5.000 nüfus); Köy ise İÇİŞLERİ BAKANLIĞI kararıyla (150 - 2.000 nüfus) kurulur."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "İdare Hukuku",
        "difficulty": 2,
        "prompt_text": "Köy İdaresi'nin zorunlu organlarından olan 'Köy İhtiyar Meclisi'nin doğal (tabii) üyeleri hangi seçenekte doğru verilmiştir?",
        "options": [
            "Köy İmamı ve Köy Öğretmeni",
            "Köy Korucusu ve Ziraat Mühendisi",
            "Köy Muhtarı ve En yaşlı köylü",
            "Köy Çobanı ve Sağlık Memuru",
            "Karakol Komutanı ve Bakkal"
        ],
        "correctIndex": 0,
        "explanation": "Köy İhtiyar Meclisi seçimle gelen üyelerin yanında iki daimi ve doğal (tabii) üyeye sahiptir: KÖY İMAMI ve KÖY ÖĞRETMENİ (varsa). Bu kişiler seçime girmeden mecliste yer alır.",
        "distractor_trap": "Köy ihtiyar heyetinin doğal üyeleri İMAM ve ÖĞRETMENDİR."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "İdare Hukuku",
        "difficulty": 2,
        "prompt_text": "5393 sayılı Belediye Kanunu'na göre bir yerleşim yerinde Belediye kurulabilmesi için nüfusun EN AZ kaç olması gerekir ve belediye hangi idari işlemle kurulur?",
        "options": [
            "Nüfusu en az 5.000 olmalı — Cumhurbaşkanı Kararı ile kurulur.",
            "Nüfusu en az 2.000 olmalı — İçişleri Bakanlığı kararı ile kurulur.",
            "Nüfusu en az 10.000 olmalı — Kanunla kurulur.",
            "Nüfusu en az 50.000 olmalı — Vali onayı ile kurulur.",
            "Nüfusu en az 750.000 olmalı — Cumhurbaşkanlığı Kararnamesi ile kurulur."
        ],
        "correctIndex": 0,
        "explanation": "Belediye kurulması için nüfusun en az 5.000 olması şarttır ve belediye CUMHURBAŞKANI KARARI ile kurulur. (İl ve ilçe merkezlerinde nüfus şartı aranmaksızın belediye kurulur).",
        "distractor_trap": "Belediye CUMHURBAŞKANI KARARIYLA (en az 5 bin nüfus); Büyükşehir belediyesi ise KANUNLA (en az 750 bin nüfus) kurulur!"
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "İdare Hukuku",
        "difficulty": 2,
        "prompt_text": "5216 sayılı Büyükşehir Belediyesi Kanunu'na göre bir ilde Büyükşehir Belediyesi kurulabilmesi için toplam nüfusun en az kaç olması gerekir ve ne ile kurulur?",
        "options": [
            "Toplam il nüfusu en az 750.000 olmalı — KANUNLA kurulur.",
            "Toplam il nüfusu en az 500.000 olmalı — Cumhurbaşkanı Kararı ile kurulur.",
            "Toplam il nüfusu en az 1.000.000 olmalı — İçişleri Bakanlığı kararı ile kurulur.",
            "Toplam il nüfusu en az 250.000 olmalı — Kanunla kurulur.",
            "Nüfus şartı yoktur, TBMM kararıyla kurulur."
        ],
        "correctIndex": 0,
        "explanation": "Büyükşehir belediyesi kurulması için toplam nüfusun EN AZ 750.000 olması ve münhasıran KANUNLA kurulması anayasal ve yasal zorunluluktur. Türkiye'de 30 büyükşehir belediyesi mevcuttur.",
        "distractor_trap": "Büyükşehir belediyesi Cumhurbaşkanı kararıyla KURULAMAZ; mutlaka TBMM tarafından çıkarılan KANUNLA kurulur!"
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "İdare Hukuku",
        "difficulty": 2,
        "prompt_text": "Anayasa'nın 127. maddesine göre mahalli idare organlarından olan 'Belediye Meclisi' veya 'İl Genel Meclisi'nin görevini yapamaz hale gelmesi durumunda feshine karar vermeye yetkili organ hangisidir?",
        "options": [
            "Vali",
            "İçişleri Bakanı",
            "Danıştay",
            "Anayasa Mahkemesi",
            "Bölge İdare Mahkemesi"
        ],
        "correctIndex": 2,
        "explanation": "Yerel meclislerin (Belediye Meclisi veya İl Genel Meclisi) süresinden önce feshine ancak yüksek idare mahkemesi olan DANIŞTAY karar verebilir. İçişleri Bakanı sadece geçici olarak görevden uzaklaştırabilir.",
        "distractor_trap": "FESİH yetkisi yargısaldır ve DANIŞTAY'a aittir; İçişleri Bakanı feshedemez, sadece geçici uzaklaştırabilir."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "İdare Hukuku",
        "difficulty": 2,
        "prompt_text": "Merkezi idarenin yerel yönetimler üzerindeki denetim aracı olan 'İdari Vesayet' yetkisinin kapsamı ve sınırları değerlendirildiğinde aşağıdakilerden hangisi doğrudur?",
        "options": [
            "Vesayet makamı, vesayete tabi yerel idare organının yerine geçerek doğrudan onun adına karar alabilir.",
            "Vesayet makamı kural olarak yerel idarenin kararını yerindelik yönünden değiştiremez; kanunda açık yetki yoksa kararı ya onar, ya bozar (veya iptali için idari yargıya başvurur).",
            "Vesayet yetkisi hiyerarşik amirlik yetkisiyle tamamen aynıdır.",
            "Vesayet makamı belediye başkanına disiplin cezası olarak memurluktan çıkarma cezası verebilir.",
            "İdari vesayet Anayasa'da yer almayan teamüli bir yetkidir."
        ],
        "correctIndex": 1,
        "explanation": "İdari vesayet istisnai bir yetkidir ve kanunla sınırlıdır. Vesayet makamı hiyerarşik amir gibi emir veremez veya belediye meclisinin kararını kafasına göre DEĞİŞTİREMEZ. Ya onaylar, ya reddeder ya da iptali için İdare Mahkemesine dava açar.",
        "distractor_trap": "Hiyerarşide değiştirme ve emir yetkisi vardır; İdari vesayette değiştirme yetkisi KURAL OLARAK YOKTUR!"
    }
]
