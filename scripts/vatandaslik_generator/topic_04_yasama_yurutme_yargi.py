# -*- coding: utf-8 -*-
"""
KPSS Vatandaşlık — Konu 4: Yasama, Yürütme ve Yargı (40 Özgün Soru)
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
        "topic": "Yasama, Yürütme ve Yargı",
        "difficulty": 1,
        "prompt_text": "1982 Anayasası'na göre Türkiye Büyük Millet Meclisi (TBMM) kaç milletvekilinden oluşur?",
        "options": [
            "450",
            "500",
            "550",
            "600",
            "650"
        ],
        "correctIndex": 3,
        "explanation": "2017 Anayasa değişikliği ile Anayasa m. 75 uyarınca TBMM üye tamsayısı 550'den 600 milletvekiline yükseltilmiştir.",
        "distractor_trap": "Eski 550 sayısı 2017 referandumuyla 600 yapılmıştır; tüm meclis karar ve toplantı nisapları 600 üzerinden hesaplanır."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Yasama, Yürütme ve Yargı",
        "difficulty": 1,
        "prompt_text": "1982 Anayasası'na göre Cumhurbaşkanı seçilme yaşı ve görev süresi aşağıdakilerden hangisinde doğru olarak verilmiştir?",
        "options": [
            "30 yaşını doldurmuş olmak — 4 yıl",
            "35 yaşını doldurmuş olmak — 5 yıl",
            "40 yaşını doldurmuş olmak — 5 yıl",
            "40 yaşını doldurmuş olmak — 7 yıl",
            "18 yaşını doldurmuş olmak — 5 yıl"
        ],
        "correctIndex": 2,
        "explanation": "Anayasa m. 101 uyarınca Cumhurbaşkanı; 40 yaşını doldurmuş, yükseköğrenim yapmış, milletvekili seçilme yeterliliğine sahip Türk vatandaşları arasından, halk tarafından 5 yıllık süre için seçilir.",
        "distractor_trap": "Milletvekili seçilme yaşı 18'e inmiş olsa da Cumhurbaşkanı seçilme yaşı 40'tır ve görev süresi 5 yıldır."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Yasama, Yürütme ve Yargı",
        "difficulty": 1,
        "prompt_text": "2017 Anayasa değişiklikleri ile Türk anayasa düzeninden tamamen kaldırılan denetim yolları aşağıdakilerden hangisinde birlikte verilmiştir?",
        "options": [
            "Meclis Araştırması ve Genel Görüşme",
            "Yazılı Soru ve Meclis Soruşturması",
            "Gensoru ve Sözlü Soru",
            "Yüce Divan ve Bütçe Denetimi",
            "Dilekçe ve Bilgi Edinme"
        ],
        "correctIndex": 2,
        "explanation": "Cumhurbaşkanlığı Hükümet Sistemi'ne geçişle birlikte parlamenter sisteme özgü olan 'Gensoru' (hükümeti düşürme) ve 'Sözlü Soru' denetim yolları anayasadan tamamen kaldırılmıştır. Yazılı soru, meclis araştırması, genel görüşme ve meclis soruşturması ise devam etmektedir.",
        "distractor_trap": "Sözlü soru kaldırılmıştır, sadece YAZILI SORU vardır; gensoru ise tamamen kaldırılmıştır."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Yasama, Yürütme ve Yargı",
        "difficulty": 1,
        "prompt_text": "1982 Anayasası'nda günümüzde geçerli olan 'Yüksek Mahkemeler' arasında aşağıdakilerden hangisi yer almaz?",
        "options": [
            "Anayasa Mahkemesi",
            "Yargıtay",
            "Danıştay",
            "Uyuşmazlık Mahkemesi",
            "Sayıştay"
        ],
        "correctIndex": 4,
        "explanation": "Anayasa'nın Yargı bölümünde düzenlenen Yüksek Mahkemeler yalnızca 4 tanedir: Anayasa Mahkemesi, Yargıtay, Danıştay ve Uyuşmazlık Mahkemesi. Sayıştay ve HSK birer yüksek denetim/idari kuruldur, yüksek mahkeme değildirler. Askeri Yargıtay ve AYİM ise 2017'de kaldırılmıştır.",
        "distractor_trap": "Sayıştay ve Hakimler ve Savcılar Kurulu (HSK) yüksek mahkeme DEĞİLDİR! Dört yüksek mahkeme vardır."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Yasama, Yürütme ve Yargı",
        "difficulty": 1,
        "prompt_text": "Milletvekillerinin meclis çalışmalarındaki oy, söz ve düşüncelerinden ötürü ömür boyu hukuki ve cezai takibata uğramamalarını sağlayan ve kaldırılamayan mutlak güvenceye ne ad verilir?",
        "options": [
            "Yasama Dokunulmazlığı",
            "Yasama Sorumsuzluğu (Kürsü Dokunulmazlığı)",
            "Yasama Yetkisinin Devredilmezliği",
            "Milletvekili Ödeneği",
            "Gıyap Güvencesi"
        ],
        "correctIndex": 1,
        "explanation": "Yasama sorumsuzluğu (kürsü dokunulmazlığı); vekillerin meclisteki konuşmalarından ötürü hiçbir zaman yargılanamamasıdır. Mutlaktır, TBMM kararıyla dahi kaldırılamaz ve milletvekilliği bittikten sonra da korur. Yasama dokunulmazlığı ise meclis dışındaki suçlar içindir ve meclis kararıyla kaldırılabilir.",
        "distractor_trap": "Dokunulmazlık kaldırılabilir (nisbidir); Sorumsuzluk ise asla kaldırılamaz (mutlaktır)."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Yasama, Yürütme ve Yargı",
        "difficulty": 1,
        "prompt_text": "TBMM Genel Kurulu'nda bir kanun teklifinin oylanabilmesi için toplantı yeter sayısı (meclisin toplanabilmesi için gereken en az üye sayısı) ne kadardır?",
        "options": [
            "Üye tamsayısının üçte biri (200 milletvekili)",
            "Üye tamsayısının salt çoğunluğu (301 milletvekili)",
            "Üye tamsayısının beşte biri (120 milletvekili)",
            "184 milletvekili",
            "Üye tamsayısının beşte üçü (360 milletvekili)"
        ],
        "correctIndex": 0,
        "explanation": "Anayasa m. 96 uyarınca TBMM, yapacağı seçimler dahil bütün işlerinde üye tamsayısının en az üçte biri (1/3 = 200 milletvekili) ile toplanır (Toplantı yeter sayısı = 200).",
        "distractor_trap": "Toplantı yeter sayısı 200'dür (1/3). Karar yeter sayısı ise toplantıya katılanların salt çoğunluğudur; ancak bu sayı üye tamsayısının 1/4'ünün bir fazlasından (151'den) az olamaz."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Yasama, Yürütme ve Yargı",
        "difficulty": 1,
        "prompt_text": "Bütçe ve Kesinhesap Kanun Tekliflerini hazırlayarak TBMM'ye sunma yetkisi münhasıran kime aittir?",
        "options": [
            "Hazine ve Maliye Bakanı",
            "Cumhurbaşkanı",
            "TBMM Plan ve Bütçe Komisyonu Başkanı",
            "Sayıştay Başkanı",
            "Merkez Bankası Başkanı"
        ],
        "correctIndex": 1,
        "explanation": "Anayasa m. 161 uyarınca Bütçe Kanun Teklifi yürütmenin başı olan Cumhurbaşkanı tarafından hazırlanır ve mali yılbaşından en az 75 gün önce TBMM'ye sunulur. Kanun teklif etme yetkisi vekillerde olmasına rağmen Bütçe Teklifi sadece Cumhurbaşkanı tarafından sunulan tek kanundur.",
        "distractor_trap": "Normal kanunları sadece milletvekilleri teklif edebilir; Cumhurbaşkanı'nın teklif edebildiği YEGÂNE kanun Bütçe Kanunu'dur."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Yasama, Yürütme ve Yargı",
        "difficulty": 1,
        "prompt_text": "Anayasa Mahkemesi toplam kaç üyeden oluşur ve üyelerin görev süresi kaç yıldır?",
        "options": [
            "11 üye — 6 yıl",
            "15 üye — 12 yıl",
            "17 üye — 10 yıl",
            "13 üye — 4 yıl",
            "15 üye — Ömür boyu"
        ],
        "correctIndex": 1,
        "explanation": "2017 anayasa değişikliği ile Askeri Yargıtay ve AYİM'den gelen 2 üyelik kaldırılmış, AYM üye sayısı 17'den 15'e düşürülmüştür. AYM üyeleri 12 yıl için seçilirler ve bir kimse iki defa AYM üyesi seçilemez (Yaş haddi 65'tir).",
        "distractor_trap": "AYM üye sayısı 15'tir; görev süreleri 12 yıldır. 12 üyeyi Cumhurbaşkanı, 3 üyeyi TBMM seçer."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Yasama, Yürütme ve Yargı",
        "difficulty": 1,
        "prompt_text": "Hakimler ve Savcılar Kurulu'nun (HSK) başkanı kimdir?",
        "options": [
            "Yargıtay Birinci Başkanı",
            "Danıştay Başkanı",
            "Adalet Bakanı",
            "Anayasa Mahkemesi Başkanı",
            "Cumhurbaşkanı"
        ],
        "correctIndex": 2,
        "explanation": "Anayasa m. 159 açık hükmüdür: 'Hâkimler ve Savcılar Kurulunun Başkanı Adalet Bakanıdır. Adalet Bakanlığı Müsteşarı (Bakan Yardımcısı) Kurulun tabii üyesidir.'",
        "distractor_trap": "HSK başkanı Adalet Bakanı'dır. Kurul toplam 13 üyeden oluşur."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Yasama, Yürütme ve Yargı",
        "difficulty": 1,
        "prompt_text": "Adli yargı kolunun (hukuk ve ceza mahkemelerinin) en üst temyiz inceleme mercii aşağıdakilerden hangisidir?",
        "options": [
            "Danıştay",
            "Yargıtay",
            "Uyuşmazlık Mahkemesi",
            "Sayıştay",
            "Bölge Adliye Mahkemesi"
        ],
        "correctIndex": 1,
        "explanation": "Adli yargının temyiz organı Yargıtay'dır. İdari yargının (idare ve vergi mahkemelerinin) en üst temyiz organı ise Danıştay'dır.",
        "distractor_trap": "Adli yargı = Yargıtay; İdari yargı = Danıştay."
    },

    # -------------------------------------------------------------
    # TEST 2: STANDART ÖSYM AYARI (Zorluk: 2) - Sorular 11-20
    # -------------------------------------------------------------
    {
        "lesson": "Vatandaşlık",
        "topic": "Yasama, Yürütme ve Yargı",
        "difficulty": 2,
        "prompt_text": "1982 Anayasası'na göre milletvekilliği adaylığı için görevinden istifa eden ancak seçilemeyen kişilerden hangileri mesleklerine KESİNLİKLE GERİ DÖNEMEZLER?",
        "options": [
            "Devlet memurları",
            "Üniversite öğretim elemanları",
            "Hâkimler ve savcılar ile Türk Silahlı Kuvvetleri mensupları",
            "Kamu iktisadi teşebbüsü çalışanları",
            "Belediye personeli"
        ],
        "correctIndex": 2,
        "explanation": "Yargı bağımsızlığı ve ordunun siyasete bulaşmaması ilkeleri gereğince; milletvekili adayı olmak için istifa eden hâkim ve savcılar ile TSK mensupları (subay/astsubay) seçilemeseler dahi mesleklerine kesinlikle geri dönemezler. Memurlar ve akademisyenler ise geri dönebilir.",
        "distractor_trap": "Geri dönemeyen iki zümre vardır: Hakim/Savcılar ve Askerler! Memurlar ise geri dönebilir."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Yasama, Yürütme ve Yargı",
        "difficulty": 2,
        "prompt_text": "Aşağıdaki hallerin hangisinde milletvekilliğinin düşmesi için 'TBMM Genel Kurulu kararı' GEREKMEZ (milletvekilliği kendiliğinden veya bildirimin yapılmasıyla doğrudan düşer)?",
        "options": [
            "Milletvekilinin istifa etmesi",
            "Milletvekilliği ile bağdaşmayan bir görevi ısrarla sürdürmesi",
            "Meclis çalışmalarına mazeretsiz ve izinsiz olarak 1 ayda toplam 5 birleşim günü katılmaması",
            "Milletvekilinin Cumhurbaşkanı yardımcısı veya Bakan olarak atanması",
            "Milletvekilinin partisinden istifa etmesi"
        ],
        "correctIndex": 3,
        "explanation": "Milletvekili olan biri Cumhurbaşkanı yardımcısı veya Bakan olarak atandığı anda milletvekilliği KENDİLİĞİNDEN (meclis oylamasına gerek olmaksızın) doğrudan düşer (aynı şekilde ölüm, gaiplik veya kesin hüküm giyme bildirimle düşürür). İstifa, bağdaşmayan görev ve devamsızlıkta ise TBMM Genel Kurul oylaması şarttır.",
        "distractor_trap": "Partiden istifa vekilliği düşürmez (bağımsız kalır). Bakan veya CB yardımcısı atanma ise oylamasız kendiliğinden vekilliği bitirir."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Yasama, Yürütme ve Yargı",
        "difficulty": 2,
        "prompt_text": "TBMM Genel Kurulu kararıyla dokunulmazlığı kaldırılan veya milletvekilliği düşürülen (istifa veya devamsızlık sebebiyle) bir milletvekili, bu karara karşı kaç gün içinde nereye başvurabilir?",
        "options": [
            "7 gün içinde — Anayasa Mahkemesi'ne",
            "15 gün içinde — Danıştay'a",
            "30 gün içinde — Yargıtay Ceza Genel Kurulu'na",
            "10 gün içinde — Yüksek Seçim Kurulu'na",
            "3 gün içinde — TBMM Başkanlık Divanı'na"
        ],
        "correctIndex": 0,
        "explanation": "Anayasa m. 85 uyarınca dokunulmazlığı kaldırılan veya vekilliği düşürülen milletvekili veya bir başka vekil, kararın alındığı tarihten itibaren 7 GÜN içinde Anayasa Mahkemesi'ne iptal başvurusu yapabilir. Anayasa Mahkemesi 15 GÜN içinde kesin karara bağlar.",
        "distractor_trap": "Başvuru süresi 7 gün; AYM'nin inceleyip karar verme süresi 15 gündür (7-15 kuralı)."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Yasama, Yürütme ve Yargı",
        "difficulty": 2,
        "prompt_text": "1982 Anayasası'na göre kanun teklif etmeye yetkili olan merci aşağıdakilerden hangisidir?",
        "options": [
            "Cumhurbaşkanı",
            "Yalnızca Milletvekilleri",
            "Bakanlar",
            "Danıştay ve Yargıtay",
            "Siyasi parti genel başkanları"
        ],
        "correctIndex": 1,
        "explanation": "2017 anayasa değişikliği ile kanun tasarısı (hükümetin kanun teklifi) kurumu kaldırılmıştır. Bütçe Kanunu hariç kanun teklif etmeye YALNIZCA MİLLETVEKİLLERİ yetkilidir (tek bir milletvekili dahi kanun teklifi verebilir).",
        "distractor_trap": "Bakanlar veya Cumhurbaşkanı normal kanun teklif edemez; kanun teklif etme tekeli milletvekillerindedir."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Yasama, Yürütme ve Yargı",
        "difficulty": 2,
        "prompt_text": "TBMM Genel Kurulu tarafından kabul edilen bir kanunu Cumhurbaşkanı kaç gün içinde yayımlamak veya tekrar görüşülmek üzere TBMM'ye geri göndermek zorundadır?",
        "options": [
            "7 gün",
            "10 gün",
            "15 gün",
            "30 gün",
            "48 saat"
        ],
        "correctIndex": 2,
        "explanation": "Anayasa m. 89 uyarınca Cumhurbaşkanı, TBMM'ce kabul edilen kanunları 15 GÜN içinde Resmî Gazete'de yayımlar veya veto ederek (tekrar görüşülmek üzere) gerekçesiyle birlikte meclise geri gönderir.",
        "distractor_trap": "Cumhurbaşkanının veto veya onay inceleme süresi 15 gündür. Cumhurbaşkanı Bütçe Kanunu'nu veto edemez!"
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Yasama, Yürütme ve Yargı",
        "difficulty": 2,
        "prompt_text": "Cumhurbaşkanı'nın veto ederek TBMM'ye geri gönderdiği bir kanunu, TBMM'nin hiçbir değişiklik yapmadan aynen kabul edebilmesi için en az kaç milletvekilinin kabul oyu gerekir?",
        "options": [
            "Toplantıya katılanların basit çoğunluğu",
            "Üye tamsayısının salt çoğunluğu (en az 301 milletvekili)",
            "Üye tamsayısının beşte üçü (360 milletvekili)",
            "Üye tamsayısının üçte ikisi (400 milletvekili)",
            "200 milletvekili"
        ],
        "correctIndex": 1,
        "explanation": "2017 değişikliği öncesinde meclis basit çoğunlukla vetoyu aşabiliyordu. 2017 değişikliği ile Cumhurbaşkanı'nın vetosunu aşmak zorlaştırılmış ve 'TBMM üye tamsayısının salt çoğunluğu' (en az 301 kabul oyu) şartı getirilmiştir. 301 ile aynen kabul edilirse Cumhurbaşkanı artık yayımlamak zorundadır.",
        "distractor_trap": "Veto edilen kanunu aynen kabul etmek için basit çoğunluk yetmez; en az 301 (üye tamsayısının salt çoğunluğu) şarttır!"
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Yasama, Yürütme ve Yargı",
        "difficulty": 2,
        "prompt_text": "1982 Anayasası'na göre genel ve özel af ilan edebilmek için TBMM Genel Kurulu'nda aranan asgari karar yeter sayısı aşağıdakilerden hangisidir?",
        "options": [
            "Toplantıya katılanların salt çoğunluğu",
            "Üye tamsayısının salt çoğunluğu (301)",
            "Üye tamsayısının beşte üçü (360 milletvekili)",
            "Üye tamsayısının üçte ikisi (400 milletvekili)",
            "Üye tamsayısının dörtte üçü (450 milletvekili)"
        ],
        "correctIndex": 2,
        "explanation": "Anayasa m. 87 uyarınca genel ve özel af ilanı için TBMM üye tamsayısının en az beşte üçünün (3/5 = 360 milletvekili) kabul oyu şarttır. Ayrıca orman suçları için hiçbir şekilde af çıkarılamaz.",
        "distractor_trap": "Af ilanı için 3/5 (360) çoğunluk gerekir. Orman suçları için af kanunu çıkarılması anayasa m. 169 ile yasaklanmıştır."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Yasama, Yürütme ve Yargı",
        "difficulty": 2,
        "prompt_text": "Cumhurbaşkanı yardımcıları ve bakanların görevleriyle ilgili suçlarından dolayı Meclis Soruşturması ile 'Yüce Divan'a sevk edilebilmeleri için' TBMM Genel Kurulu'nda aranan nihai gizli oy karar yeter sayısı ne kadardır?",
        "options": [
            "Üye tamsayısının salt çoğunluğu (301)",
            "Üye tamsayısının beşte üçü (360)",
            "Üye tamsayısının üçte ikisi (400 milletvekili)",
            "Toplantıya katılanların 2/3'ü",
            "Oy birliği"
        ],
        "correctIndex": 2,
        "explanation": "Meclis soruşturması aşamaları: 1) Teklif: 301 vekil, 2) Soruşturma açılması kararı: 360 vekil (3/5), 3) Yüce Divan'a sevk kararı: 400 vekildir (2/3 gizli oy). Yüce Divan yargılamasını Anayasa Mahkemesi yapar.",
        "distractor_trap": "Yüce Divan'a sevk için 400 milletvekili (2/3) şarttır. Soruşturma açılması için ise 360 vekil yeterlidir."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Yasama, Yürütme ve Yargı",
        "difficulty": 2,
        "prompt_text": "Olağan dönem Cumhurbaşkanlığı Kararnameleri (CBK) ile ilgili olarak aşağıda verilen kurallardan hangisi yanlıştır?",
        "options": [
            "Yürütme yetkisine ilişkin konularda çıkarılabilir.",
            "Anayasa'da münhasıran kanunla düzenlenmesi öngörülen konularda CBK çıkarılamaz.",
            "Kanunda açıkça düzenlenen konularda CBK çıkarılamaz.",
            "Kanun ile CBK aynı konuda farklı hükümler içerirse CBK hükümleri uygulanır.",
            "Temel hak ve ödevlerden sadece Sosyal ve Ekonomik Haklar olağan CBK ile düzenlenebilir."
        ],
        "correctIndex": 3,
        "explanation": "Anayasa m. 104 açıktır: Kanun ile Cumhurbaşkanlığı kararnamesinde farklı hükümler bulunması halinde KANUN hükümleri uygulanır. TBMM'nin aynı konuda kanun çıkarması durumunda CBK hükümsüz hale gelir.",
        "distractor_trap": "Kanun kararnameden üstündür; çatışma anında kanun geçerli olur."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Yasama, Yürütme ve Yargı",
        "difficulty": 2,
        "prompt_text": "Yargıtay Cumhuriyet Başsavcısı ve Başsavcıvekilini Yargıtay Genel Kurulu'nun belirlediği adaylar arasından seçen makam aşağıdakilerden hangisidir?",
        "options": [
            "TBMM",
            "Cumhurbaşkanı",
            "Hakimler ve Savcılar Kurulu (HSK)",
            "Adalet Bakanı",
            "Anayasa Mahkemesi"
        ],
        "correctIndex": 1,
        "explanation": "Yargıtay Büyük Genel Kurulu'nun her kadro için göstereceği beşer aday arasından Cumhurbaşkanı tarafından 4 yıl için seçilirler. Süresi biten yeniden seçilebilir.",
        "distractor_trap": "Yargıtay Başsavcısını Yargıtay değil, adaylar arasından doğrudan CUMHURBAŞKANI seçer!"
    },

    # -------------------------------------------------------------
    # TEST 3: STANDART ÖSYM AYARI (Zorluk: 2) - Sorular 21-30
    # -------------------------------------------------------------
    {
        "lesson": "Vatandaşlık",
        "topic": "Yasama, Yürütme ve Yargı",
        "difficulty": 2,
        "prompt_text": "Uyuşmazlık Mahkemesi'nin görev alanı ve başkanı ile ilgili aşağıdakilerden hangisi doğrudur?",
        "options": [
            "Adli ve idari yargı mercileri arasındaki görev ve hüküm uyuşmazlıklarını kesin olarak çözer; Başkanı Anayasa Mahkemesi üyeleri arasından Anayasa Mahkemesi tarafından seçilir.",
            "Ceza davalarını temyiz eder; Başkanı TBMM tarafından seçilir.",
            "Vergi uyuşmazlıklarını çözer; Başkanı Sayıştay'dır.",
            "Anayasa değişikliklerini inceler; Başkanı Adalet Bakanıdır.",
            "Seçim uyuşmazlıklarını kesin karara bağlar."
        ],
        "correctIndex": 0,
        "explanation": "Uyuşmazlık Mahkemesi, adli ve idari yargı kolları arasındaki uyuşmazlıkları kesin çözer. Uyuşmazlık Mahkemesi Başkanını kendi üyeleri değil; Anayasa Mahkemesi kendi üyeleri arasından seçip görevlendirir.",
        "distractor_trap": "Uyuşmazlık Mahkemesi Başkanı AYM üyesidir ve AYM Genel Kurulu tarafından seçilir."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Yasama, Yürütme ve Yargı",
        "difficulty": 2,
        "prompt_text": "Danıştay üyelerinin seçimi değerlendirildiğinde üyelerin dörtte birini (1/4) ve dörtte üçünü (3/4) sırasıyla hangi makamlar seçer?",
        "options": [
            "1/4'ünü TBMM — 3/4'ünü Cumhurbaşkanı",
            "1/4'ünü Cumhurbaşkanı — 3/4'ünü Hâkimler ve Savcılar Kurulu (HSK)",
            "Tamamını HSK",
            "Yarısını Yargıtay — Yarısını Danıştay",
            "1/4'ünü Danıştay — 3/4'ünü Adalet Bakanı"
        ],
        "correctIndex": 1,
        "explanation": "Anayasa m. 155 uyarınca Danıştay üyelerinin dörtte birini (1/4) Cumhurbaşkanı; dörtte üçünü (3/4) ise Hâkimler ve Savcılar Kurulu (HSK) seçer.",
        "distractor_trap": "Danıştay'da üye seçicileri: 1/4 Cumhurbaşkanı, 3/4 HSK! Yargıtay üyelerinin tamamını ise HSK seçer."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Yasama, Yürütme ve Yargı",
        "difficulty": 2,
        "prompt_text": "1982 Anayasası'na göre Olağanüstü Hal (OHAL) ilan etme yetkisi kime aittir ve en fazla kaç ay süreyle ilan edilebilir?",
        "options": [
            "TBMM — En çok 1 yıl",
            "Cumhurbaşkanı — En çok 6 ay",
            "İçişleri Bakanı — En çok 3 ay",
            "Milli Güvenlik Kurulu — En çok 1 ay",
            "Genelkurmay Başkanı — En çok 2 yıl"
        ],
        "correctIndex": 1,
        "explanation": "Anayasa m. 119 uyarınca tabii afet, tehlikeli salgın hastalık, ağır ekonomik bunalım veya kamu düzenini bozan şiddet olaylarında Cumhurbaşkanı yurdun tamamında veya bir bölgesinde süresi 6 AYI GEÇMEMEK ÜZERE OHAL ilan edebilir. Karar aynı gün Resmî Gazete'de yayımlanır ve TBMM onayına sunulur.",
        "distractor_trap": "OHAL ilanını Cumhurbaşkanı en çok 6 aylığına yapar; ilan edilen OHAL'i uzatma yetkisi ise TBMM'dedir (her defasında en çok 4 ay uzatabilir)."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Yasama, Yürütme ve Yargı",
        "difficulty": 2,
        "prompt_text": "Cumhurbaşkanı tarafından ilan edilen Olağanüstü Hal (OHAL) süresini, Cumhurbaşkanı'nın talebi üzerine her defasında en çok kaç ay süreyle uzatmaya TBMM yetkilidir?",
        "options": [
            "1 ay",
            "2 ay",
            "3 ay",
            "4 ay",
            "6 ay"
        ],
        "correctIndex": 3,
        "explanation": "TBMM, OHAL süresini değiştirebilir, kaldırabilir veya Cumhurbaşkanı'nın istemiyle her defasında 4 AYI GEÇMEMEK üzere uzatabilir (Savaş halinde 4 aylık sınır aranmaz).",
        "distractor_trap": "İlan süresi = En çok 6 ay (Cumhurbaşkanı); Uzatma süresi = Her defasında en çok 4 ay (TBMM)!"
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Yasama, Yürütme ve Yargı",
        "difficulty": 2,
        "prompt_text": "Milli Güvenlik Kurulu'nun (MGK) gündemini kim belirler ve toplantılarına kim başkanlık eder?",
        "options": [
            "Gündemi Genelkurmay Başkanı belirler, toplantıya Cumhurbaşkanı başkanlık eder.",
            "Gündemi Cumhurbaşkanı yardımcıları ve Genelkurmay Başkanı'nın önerilerini dikkate alarak Cumhurbaşkanı belirler ve toplantıya Cumhurbaşkanı başkanlık eder.",
            "Gündemi İçişleri Bakanı belirler, TBMM Başkanı yönetir.",
            "Gündemi Savunma Bakanı belirler, MGK Genel Sekreteri yönetir.",
            "Gündemi MİT Başkanı belirler, Cumhurbaşkanı yardımcısı yönetir."
        ],
        "correctIndex": 1,
        "explanation": "Anayasa m. 118 uyarınca MGK gündemi; Cumhurbaşkanı yardımcıları ve Genelkurmay Başkanının önerileri dikkate alınarak Cumhurbaşkanınca düzenlenir. MGK'ya Cumhurbaşkanı başkanlık eder (katılamazsa Cumhurbaşkanı Yardımcısı vekalet eder).",
        "distractor_trap": "MGK iki ayda bir toplanır, kararları tavsiye niteliğindedir. Cumhurbaşkanı yoksa yardımcısı başkanlık eder."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Yasama, Yürütme ve Yargı",
        "difficulty": 2,
        "prompt_text": "Aşağıdakilerden hangisi Milli Güvenlik Kurulu'nun (MGK) anayasal üyeleri arasında YER ALMAZ?",
        "options": [
            "Adalet Bakanı",
            "Milli Savunma Bakanı",
            "İçişleri Bakanı",
            "Dışişleri Bakanı",
            "TBMM Başkanı"
        ],
        "correctIndex": 4,
        "explanation": "TBMM Başkanı yasama organının başıdır; yürütmenin danışma organı olan MGK'nın üyesi DEĞİLDİR! MGK üyeleri: Cumhurbaşkanı, CB Yardımcıları, Adalet, İçişleri, Dışişleri ve Milli Savunma Bakanları ile Genelkurmay Başkanı, Kara, Deniz ve Hava Kuvvetleri Komutanlarıdır (Jandarma 2016'da çıkarıldı!).",
        "distractor_trap": "TBMM Başkanı ve Jandarma Genel Komutanı MGK ÜYESİ DEĞİLDİR!"
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Yasama, Yürütme ve Yargı",
        "difficulty": 2,
        "prompt_text": "TBMM Genel Kurulu'nda bir kanun veya kararın kabul edilebilmesi için geçerli olan 'Karar Yeter Sayısı' kuralı aşağıdakilerden hangisidir?",
        "options": [
            "Her zaman üye tamsayısının salt çoğunluğu (301)",
            "Toplantıya katılanların salt çoğunluğudur; ancak bu sayı hiçbir şekilde üye tamsayısının dörtte birinin bir fazlasından (151 milletvekilinden) az olamaz",
            "Toplantıya katılanların üçte ikisi",
            "Her zaman en az 200 milletvekili",
            "Meclis Başkanı'nın tek oyu"
        ],
        "correctIndex": 1,
        "explanation": "Anayasa m. 96: 'TBMM, yapacağı seçimler dahil bütün işlerinde üye tamsayısının en az üçte biri ile toplanır. Anayasada başkaca bir hüküm yoksa toplantıya katılanların salt çoğunluğu ile karar verir; ancak karar yeter sayısı hiçbir şekilde üye tamsayısının dörtte birinin bir fazlasından (151) az olamaz.'",
        "distractor_trap": "En düşük meclis karar yeter sayısı 151'dir! Örneğin 200 kişiyle toplanmış mecliste 101 ile karar alınamaz, en az 151 kabul gerekir."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Yasama, Yürütme ve Yargı",
        "difficulty": 2,
        "prompt_text": "Milletlerarası andlaşmaların Türk hukukundaki yeri düşünüldüğünde, usulüne göre yürürlüğe konulmuş temel hak ve özgürlüklere ilişkin milletlerarası andlaşmalar ile kanunların aynı konuda farklı hükümler içermesi halinde ortaya çıkan uyuşmazlıkta hangisi esas alınır?",
        "options": [
            "TBMM tarafından çıkarılan kanun hükümleri",
            "Milletlerarası andlaşma hükümleri",
            "Cumhurbaşkanlığı Kararnamesi",
            "Danıştay içtihadı",
            "Uyuşmazlık Mahkemesi kararı"
        ],
        "correctIndex": 1,
        "explanation": "Anayasa m. 90 son fıkrası gereğince: Usulüne göre yürürlüğe konulmuş temel hak ve özgürlüklere ilişkin milletlerarası andlaşmalarla kanunların aynı konuda farklı hükümler içermesi nedeniyle çıkabilecek uyuşmazlıklarda MİLLETLERARASI ANDLAŞMA hükümleri esas alınır.",
        "distractor_trap": "Temel haklara ilişkin uluslararası sözleşmeler ile kanun çatışırsa sözleşme üstün tutulur; ayrıca usulüne göre yürürlüğe konulmuş andlaşmalar aleyhine AYM'ye iptal davası açılamaz!"
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Yasama, Yürütme ve Yargı",
        "difficulty": 2,
        "prompt_text": "TBMM Başkanlık Divanı kimlerden oluşur ve Meclis Başkanı seçimi en fazla kaç turda tamamlanır?",
        "options": [
            "Meclis Başkanı, Başkanvekilleri, Katip Üyeler ve İdare Amirlerinden oluşur — En çok 4 turda tamamlanır",
            "Yalnızca Meclis Başkanı ve Bakanlardan oluşur — 2 turda tamamlanır",
            "Meclis Başkanı ve Komisyon Başkanlarından oluşur — 3 turda tamamlanır",
            "Cumhurbaşkanı ve Meclis Başkanından oluşur — Tek turda biter",
            "Sadece siyasi parti grup başkanlarından oluşur — 5 turda tamamlanır"
        ],
        "correctIndex": 0,
        "explanation": "Başkanlık Divanı; Meclis Başkanı, Başkanvekilleri, Kâtip Üyeler ve İdare Amirlerinden oluşur. Meclis Başkanı seçimi gizli oyla en çok 4 turda tamamlanır (1. ve 2. turda 400 oy; 3. turda 301 oy; 4. turda en çok oyu alan 2 adaydan en çok oyu alan seçilir).",
        "distractor_trap": "TBMM Başkanı 4 turlu gizli oylamayla seçilir. İlk iki turda 400 (2/3), üçüncü turda 301 (salt çoğunluk) aranır."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Yasama, Yürütme ve Yargı",
        "difficulty": 2,
        "prompt_text": "Anayasa Mahkemesi'nin 'Somut Norm Denetimi' (İtiraz Yolu) ile önüne gelen bir kanun maddesini inceleyebilmesi için aşağıdakilerden hangisi zorunlu bir şarttır?",
        "options": [
            "En az 120 milletvekilinin AYM'ye dilekçe vermesi",
            "Görülmekte olan bir davanın bulunması, itiraz konusu kuralın o davada uygulanacak norm olması ve mahkemenin anayasaya aykırılık iddiasını ciddi bulması",
            "Cumhurbaşkanı'nın onay vermesi",
            "Davanın doğrudan Yargıtay Ceza Genel Kurulu'nda olması",
            "Kanunun yürürlüğe girmesinden itibaren 60 günün geçmemiş olması"
        ],
        "correctIndex": 1,
        "explanation": "Somut norm denetimi (m. 152); bakılmakta olan somut bir davada hakimin uygulayacağı kanun maddesini anayasaya aykırı görmesi veya tarafların iddiasını ciddi bulmasıyla AYM'ye başvurmasıdır. Dava yoksa itiraz yolu işletilemez.",
        "distractor_trap": "Soyut norm denetimi (İptal davası) 60 gün içinde açılır; Somut norm denetiminde (İtiraz) ise herhangi bir süre sınırı yoktur, dava sürdüğü sürece her zaman başvurulabilir."
    },

    # -------------------------------------------------------------
    # TEST 4: NET SIÇRATAN / KURTLAR SOFRASI (Zorluk: 3) - Sorular 31-40
    # -------------------------------------------------------------
    {
        "lesson": "Vatandaşlık",
        "topic": "Yasama, Yürütme ve Yargı",
        "difficulty": 3,
        "prompt_text": "Somut norm denetimi (itiraz yolu) ile önüne gelen bir kanun maddesini esastan inceleyen Anayasa Mahkemesi, kanunun anayasaya aykırı olmadığına karar verip iptal istemini reddederse, aynı kanun hükmünün anayasaya aykırılığı iddiasıyla kaç yıl geçmedikçe yeniden itiraz başvurusu yapılamaz?",
        "options": [
            "1 yıl",
            "3 yıl",
            "5 yıl",
            "10 yıl",
            "Ömür boyu"
        ],
        "correctIndex": 3,
        "explanation": "Anayasa m. 152 son fıkrası: 'Anayasa Mahkemesinin işin esasına girerek verdiği red kararının Resmî Gazetede yayımlanmasından sonra on yıl geçmedikçe aynı kanun hükmünün Anayasaya aykırılığı iddiasıyla tekrar başvuruda bulunulamaz.'",
        "distractor_trap": "Red kararından sonra ON YIL (10 yıl) geçmedikçe hiçbir mahkeme aynı maddeyi itiraz yoluyla AYM'ye taşıyamaz!"
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Yasama, Yürütme ve Yargı",
        "difficulty": 3,
        "prompt_text": "Sayıştay ile Danıştay kararları arasındaki ilişki düşünüldüğünde anayasal kural aşağıdakilerden hangisidir?",
        "options": [
            "Sayıştay kararları her durumda Danıştay kararlarından üstündür.",
            "Vergi, benzeri mali yükümlülükler ve ödevler hakkında Danıştay ile Sayıştay kararları arasındaki uyuşmazlıklarda Danıştay kararları esas alınır.",
            "Aralarındaki uyuşmazlığı çözmek üzere dosya Uyuşmazlık Mahkemesi'ne gider.",
            "Sayıştay kararları Danıştay tarafından bozulabilir.",
            "İki kurum arasında hiçbir zaman görüş ayrılığı çıkamaz."
        ],
        "correctIndex": 1,
        "explanation": "Anayasa m. 160 açık hükmüdür: 'Vergi, benzeri mali yükümlülükler ve ödevler hakkında Danıştay ile Sayıştay kararları arasındaki uyuşmazlıklarda Danıştay kararları esas alınır.'",
        "distractor_trap": "Vergi uyuşmazlığında Sayıştay değil, DANIŞTAY kararı üstün tutulur; dosya Uyuşmazlık Mahkemesi'ne gitmez, anayasa doğrudan Danıştay'ı üstün kılmıştır."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Yasama, Yürütme ve Yargı",
        "difficulty": 3,
        "prompt_text": "1982 Anayasası'na göre bir Cumhurbaşkanı en fazla iki defa seçilebilir. Ancak bu kuralın tek bir anayasal istisnası bulunmaktadır.\n\nCumhurbaşkanının ikinci döneminde görev yaparken üçüncü kez aday olabilmesinin tek anayasal şartı aşağıdakilerden hangisidir?",
        "options": [
            "Cumhurbaşkanının kendisinin erken seçim kararı alması",
            "TBMM'nin üye tamsayısının beşte üç (3/5 = 360) çoğunluğuyla seçimlerin yenilenmesine karar vermesi",
            "Yüksek Seçim Kurulu'nun oy birliğiyle onay vermesi",
            "Anayasa Mahkemesi'nin izin vermesi",
            "Ülkede nüfus sayımının yapılması"
        ],
        "correctIndex": 1,
        "explanation": "Anayasa m. 116/3: 'Cumhurbaşkanının ikinci döneminde Meclis tarafından seçimlerin yenilenmesine karar verilmesi halinde (en az 360 oyla), Cumhurbaşkanı bir defa daha aday olabilir.' Cumhurbaşkanı kendi kararıyla meclisi feshederse 3. kez aday OLAMAZ; kararı Meclis vermelidir.",
        "distractor_trap": "Cumhurbaşkanı kendisi seçim kararı alırsa 3. kez aday olamaz! Mutlaka TBMM'nin 360 vekille seçim yenileme kararı alması gerekir."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Yasama, Yürütme ve Yargı",
        "difficulty": 3,
        "prompt_text": "Anayasa Mahkemesi kararlarının nitelikleri ile ilgili aşağıdaki ifadelerden hangisi yanlıştır?",
        "options": [
            "Anayasa Mahkemesi kararları kesindir.",
            "İptal kararları gerekçesi yazılmadan açıklanamaz.",
            "Anayasa Mahkemesi bir kanun hükmünü iptal ederken, kanun koyucu gibi hareketle yeni bir uygulamaya yol açacak biçimde hüküm tesis edemez.",
            "Anayasa Mahkemesi'nin iptal kararları kural olarak geriye yürür ve geçmişe etkili sonuç doğurur.",
            "İptal kararları Resmî Gazete'de yayımlandığı anda yürürlüğe girer (yürürlük tarihi en çok 1 yıla kadar ertelenebilir)."
        ],
        "correctIndex": 3,
        "explanation": "Anayasa m. 153'ün en temel kuralı: 'İptal kararları GERİYE YÜRÜMEZ.' İptal edilen kanuna dayanılarak geçmişte yapılmış işlemler geçerliliğini korur; iptal kararı kural olarak geleceğe etkilidir.",
        "distractor_trap": "İdari yargıdaki (Danıştay) iptal kararları geçmişe yürür; ancak Anayasa Mahkemesi'nin kanun iptal kararları KESİNLİKLE GERİYE YÜRÜMEZ!"
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Yasama, Yürütme ve Yargı",
        "difficulty": 3,
        "prompt_text": "Hakimler ve Savcılar Kurulu'nun (HSK) 13 üyesinin seçim dağılımı aşağıdakilerin hangisinde eksiksiz ve doğru verilmiştir?",
        "options": [
            "Adalet Bakanı (Başkan), Adalet Bakanlığı Müsteşarı (Bakan Yrd.), 4 üyeyi Cumhurbaşkanı, 7 üyeyi TBMM seçer",
            "13 üyenin tamamını TBMM seçer",
            "13 üyenin tamamını Cumhurbaşkanı seçer",
            "7 üyeyi Cumhurbaşkanı, 4 üyeyi TBMM seçer",
            "Yarısını Yargıtay, yarısını Danıştay seçer"
        ],
        "correctIndex": 0,
        "explanation": "HSK 13 üyeden oluşur: 1 Adalet Bakanı (Başkan), 1 Bakan Yardımcısı (tabii üye). Kalan 11 üyenin 4'ünü doğrudan Cumhurbaşkanı, 7'sini ise TBMM Genel Kurulu (nitelikli çoğunlukla) seçer.",
        "distractor_trap": "HSK'da Cumhurbaşkanı 4 üye, TBMM ise 7 üye seçer (4+7=11 + 2 tabii üye = 13)."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Yasama, Yürütme ve Yargı",
        "difficulty": 3,
        "prompt_text": "Kanunların ve TBMM İçtüzüğü'nün Anayasa'ya aykırılığı iddiasıyla doğrudan doğruya Anayasa Mahkemesi'nde 'İptal Davası' (Soyut Norm Denetimi) açabilecek yetkililer kimlerdir?",
        "options": [
            "Sadece Adalet Bakanı ve Danıştay Başkanı",
            "Cumhurbaşkanı, TBMM'de en fazla üyeye sahip iki siyasi parti grubu ve TBMM üye tamsayısının en az beşte biri (120 milletvekili)",
            "Herhangi bir vatandaş veya baro başkanı",
            "TBMM Başkanı ve Başsavcı",
            "Yalnızca ana muhalefet partisi genel başkanı"
        ],
        "correctIndex": 1,
        "explanation": "Anayasa m. 150 uyarınca doğrudan iptal davası açma hakkı: Cumhurbaşkanına, Meclis'te en fazla üyeye sahip iki siyasi parti grubuna (iktidar ve ana muhalefet) ve TBMM üye tamsayısının en az beşte birine (120 milletvekili) aittir.",
        "distractor_trap": "İptal davası açma yetkisi sadece bu üç mercidedir; başka hiçbir kurum veya kişi kanun iptali için AYM'ye doğrudan dava açamaz."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Yasama, Yürütme ve Yargı",
        "difficulty": 3,
        "prompt_text": "TBMM seçimleri devam ederken Cumhurbaşkanlığı makamının herhangi bir nedenle (ölüm, istifa vb.) boşalması halinde genel seçimlere 1 yıldan FAZLA süre kalmışsa ne yapılır?",
        "options": [
            "TBMM Başkanı derhal yeni Cumhurbaşkanı atanır.",
            "Cumhurbaşkanlığı makamının boşaldığı günden başlayarak 45 gün içindeki son pazar günü sadece Cumhurbaşkanı seçimi yapılır.",
            "Seçimler 1 yıl sonraya ertelenir.",
            "Bakanlar Kurulu kendi arasından bir başkan seçer.",
            "Genelkurmay Başkanı görevi devralır."
        ],
        "correctIndex": 1,
        "explanation": "Genel seçime 1 yıldan FAZLA süre varken makam boşalırsa 45 gün içinde SADECE Cumhurbaşkanı seçimi yapılır ve seçilen kişi TBMM'nin görev süresini tamamlar. Eğer genel seçime 1 yıldan AZ süre kalmışsa 60 gün içinde TBMM ve Cumhurbaşkanı seçimi BİRLİKTE yenilenir.",
        "distractor_trap": "1 yıldan çok varsa = 45 günde sadece CB seçimi; 1 yıldan az varsa = 60 günde TBMM + CB seçimi birlikte!"
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Yasama, Yürütme ve Yargı",
        "difficulty": 3,
        "prompt_text": "Anayasa Mahkemesi'nin 'Yüce Divan' sıfatıyla yargılayabileceği anayasal kişiler arasında aşağıdakilerden hangisi yer almaz?",
        "options": [
            "Cumhurbaşkanı ve Cumhurbaşkanı Yardımcıları",
            "Bakanlar",
            "TBMM Başkanı",
            "Milletvekilleri",
            "Genelkurmay Başkanı, Kara, Deniz ve Hava Kuvvetleri Komutanları"
        ],
        "correctIndex": 3,
        "explanation": "Anayasa m. 148'de Yüce Divan'da yargılanacaklar tek tek sayılmıştır: Cumhurbaşkanı, yardımcıları, bakanlar, AYM, Yargıtay, Danıştay üyeleri ve başsavcıları, HSK ve Sayıştay üyeleri, TBMM Başkanı ve Kuvvet Komutanları. MİLLETVEKİLLERİ Yüce Divan'da yargılanmaz; dokunulmazlıkları kaldırılırsa genel ceza mahkemelerinde yargılanırlar.",
        "distractor_trap": "Milletvekilleri Yüce Divan'a gitmez! Normal adliye ceza mahkemelerinde (Ağır Ceza) yargılanırlar."
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Yasama, Yürütme ve Yargı",
        "difficulty": 3,
        "prompt_text": "Cumhurbaşkanlığı kararnamesi ile kanun arasındaki hiyerarşi düşünüldüğünde aşağıdakilerden hangisi doğrudan Cumhurbaşkanlığı Kararnamesi ile kurulabilir ve düzenlenebilir?",
        "options": [
            "Bakanlıkların kurulması, kaldırılması, görevleri, yetkileri ve teşkilat yapısı",
            "Vergilerin konulması ve kaldırılması",
            "Suç ve cezaların ihdası",
            "Siyasi partilerin kuruluş ve işleyişi",
            "Vatandaşlık kanunu"
        ],
        "correctIndex": 0,
        "explanation": "Anayasa m. 106 açıkça 'Bakanlıkların kurulması, kaldırılması, görevleri ve yetkileri ile teşkilat yapısı Cumhurbaşkanlığı kararnamesi ile düzenlenir' demektedir. Vergi, suç-ceza, siyasi partiler ve vatandaşlık ise yalnızca KANUNLA düzenlenebilir.",
        "distractor_trap": "Bakanlıklar artık kanunla değil; doğrudan CUMHURBAŞKANLIĞI KARARNAMESİ ile kurulur ve kaldırılır!"
    },
    {
        "lesson": "Vatandaşlık",
        "topic": "Yasama, Yürütme ve Yargı",
        "difficulty": 3,
        "prompt_text": "Hakimler ve Savcılar Kurulu'nun (HSK) kararlarına karşı yargı yolu kural olarak kapalıdır. Ancak hukuk devleti ilkesi gereğince bu kurala tek bir istisna getirilmiştir.\n\nHSK'nın aşağıdaki kararlarından hangisine karşı Danıştay'a yargı yolu açıktır?",
        "options": [
            "Hakimlerin görev yerlerinin değiştirilmesi (atama kararları)",
            "Meslekten çıkarma cezasına ilişkin nihai kararlar",
            "Uyarma ve kınama disiplin cezaları",
            "Derece yükselmesi kararları",
            "Kurul müfettişlerinin teftiş raporları"
        ],
        "correctIndex": 1,
        "explanation": "Anayasa m. 159 son fıkrası gereğince HSK'nın 'meslekten çıkarma cezasına ilişkin olanlar dışındaki' kararlarına karşı yargı mercilerine başvurulamaz. Yani MESLEKTEN ÇIKARMA kararlarına karşı Danıştay'a iptal davası açılabilir.",
        "distractor_trap": "HSK'nın sadece ve sadece 'meslekten çıkarma' kararı yargı denetimine açıktır; atama, terfi veya kınama cezalarına karşı yargı yolu kesinlikle kapalıdır."
    }
]
