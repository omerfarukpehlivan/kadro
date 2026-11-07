# -*- coding: utf-8 -*-
import json
import os
import sys

# TASK-T5: Kurtuluş Savaşı Hazırlık ve Cepheler için 40 Yeni Özgün Soru (Test 5, 6, 7, 8)
# Kapsam:
# Test 5 (Sorular 41-50): Mondros Mütarekesi, Cemiyetler (Zararlı ve Yararlı), Mustafa Kemal'in Samsun'a Çıkışı, Havza ve Amasya Genelgeleri
# Test 6 (Sorular 51-60): Erzurum Kongresi, Sivas Kongresi, Amasya Görüşmeleri, Son Osmanlı Mebusan Meclisi ve Misak-ı Milli
# Test 7 (Sorular 61-70): I. TBMM'nin Açılışı, Özellikleri, Çıkardığı Kanunlar, Ayaklanmalar ve İstiklal Mahkemeleri, Sevr Antlaşması
# Test 8 (Sorular 71-80): Doğu Cephesi (Gümrü), Güney Cephesi (Maraş, Antep, Urfa), Batı Cephesi Savaşları (I. ve II. İnönü, Eskişehir-Kütahya, Sakarya, Büyük Taarruz) ve Diplomatik Antlaşmalar (Moskova, Ankara, Mudanya, Lozan)

questions = [
    # --- TEST 5 (41-50): Mondros, Cemiyetler & İlk Genelgeler ---
    {
        "difficulty": 2,
        "prompt_text": "30 Ekim 1918 tarihinde imzalanan Mondros Ateşkes Anlaşması'nda İtilaf Devletleri'nin Osmanlı topraklarını hukuki dayanaktan yoksun kalmadan işgal edebilmelerine zemin hazırlayan ve 'İtilaf Devletleri güvenliklerini tehdit edecek bir durum ortaya çıkarsa herhangi bir stratejik noktayı işgal edebilecektir' hükmünü içeren en tehlikeli madde hangisidir?",
        "options": ["7. Madde", "24. Madde", "1. Madde", "10. Madde", "15. Madde"],
        "correctIndex": 0,
        "explanation": "Mondros'un 7. maddesi tüm Osmanlı vatanını işgale açık hale getiren en ucu açık ve tehlikeli maddedir. İtilaf Devletleri Anadolu'daki bütün haksız işgallerini bu 7. maddeye dayandırmışlardır.",
        "distractor_trap": "24. madde Vilayat-ı Sitte'de (6 doğu ili) karışıklık çıkarsa işgali öngörerek 'Ermeni Devleti' kurmayı hedefler; tüm vatanı işgale açan ise 7. maddedir."
    },
    {
        "difficulty": 2,
        "prompt_text": "Mondros Ateşkes Anlaşması'nın 24. maddesinde geçen 'Vilayat-ı Sitte' (Altı Doğu İli) kapsamındaki şehirler arasında aşağıdakilerden hangisi yer almaz?",
        "options": ["Van", "Erzurum", "Diyarbakır", "Trabzon", "Bitlis"],
        "correctIndex": 3,
        "explanation": "Vilayat-ı Sitte illeri 'B-E-S-E-V-D' (Bitlis, Erzurum, Sivas, Elazığ/Harput, Van, Diyarbakır) şifresiyle kodlanır. Trabzon bu 6 il arasında yoktur; Karadeniz'de Pontus Rum iddialarının merkezidir.",
        "distractor_trap": "Trabzon Doğu Karadeniz'dedir ve Pontus iddiaları altındadır; Vilayat-ı Sitte Ermeni vilayetleri olarak tasarlanan 6 ildir."
    },
    {
        "difficulty": 2,
        "prompt_text": "Mondros Ateşkesi'nden sonra başlayan haksız işgallere karşı Türk milletinin kurduğu 'Milli Varlığa Yararlı Cemiyetler' arasında yer alan, silahlı mücadeleden ziyade basın ve yayın yoluyla uluslararası kamuoyunu aydınlatmayı ilke edinen ve 'Kuvayımilliye' tabirini ilk kez kullanan cemiyet hangisidir?",
        "options": [
            "Milli Kongre Cemiyeti",
            "Trakya-Paşaeli Müdafaa-i Hukuk Cemiyeti",
            "Kilikyalılar Cemiyeti",
            "Trabzon Muhafaza-i Hukuk Cemiyeti",
            "Şark Vilayetleri Müdafaa-i Hukuk Cemiyeti"
        ],
        "correctIndex": 0,
        "explanation": "Dr. Esat Işık öncülüğünde İstanbul'da kurulan Milli Kongre Cemiyeti, propaganda ve basın-yayın yoluyla işgallerin haksızlığını dünyaya duyurmayı amaçlamış ve Kuvayımilliye terimini ilk kez raporlarında kullanmıştır.",
        "distractor_trap": "Bölgesel silahlı direniş yapan cemiyetlerin aksine, Milli Kongre Cemiyeti ulusal çapta ve basın-yayın yoluyla mücadele etmiştir."
    },
    {
        "difficulty": 2,
        "prompt_text": "Adana ve Çukurova bölgesinin Fransızlar ve Ermeniler tarafından işgal edilmesini önlemek amacıyla İstanbul'da kurulan, isminin yabancı gibi durması sebebiyle sık sık zararlı cemiyetlerle karıştırılan yararlı cemiyet aşağıdakilerden hangisidir?",
        "options": ["Kilikyalılar Cemiyeti", "Etnik-i Eterya", "Hınçak ve Taşnak", "Mavikent Cemiyeti", "Karakol Cemiyeti"],
        "correctIndex": 0,
        "explanation": "Kilikyalılar Cemiyeti, Çukurova'nın antik adı Kilikya olduğu için bu ismi almıştır. Fransız ve Ermeni işgaline karşı kurulmuş tamamen 'Milli / Yararlı' bir cemiyettir.",
        "distractor_trap": "ÖSYM'nin en klasik çeldiricisidir: Kilikyalılar ismi yabancı gibi algılandığı için adaylar tarafından zararlı cemiyet sanılır; oysa Adana Müdafaa-i Hukuk cemiyetidir."
    },
    {
        "difficulty": 2,
        "prompt_text": "Mustafa Kemal Paşa, 19 Mayıs 1919'da Samsun'a çıktıktan sonra 28 Mayıs 1919'da yayınladığı Havza Genelgesi ile Türk milletinden ilk kez neyi talep etmiştir?",
        "options": [
            "İşgallerin haksız olduğunu duyurmak için mitingler ve protestolar düzenlenmesini, ancak Hristiyan azınlığa taşkınlık yapılmamasını",
            "TBMM'nin derhal toplanmasını",
            "Düzenli ordunun derhal kurulmasını",
            "Cumhuriyet rejimine geçilmesini",
            "Saltanatın kaldırılmasını"
        ],
        "correctIndex": 0,
        "explanation": "Havza Genelgesi, Milli Mücadele'nin ilk genelgesidir ve milli bilinci uyandırmayı amaçlar. Mustafa Kemal mitinglerle halkın işgali protesto etmesini istemiş, ancak İtilaf Devletleri'nin Mondros'un 7. maddesini bahane etmemesi için azınlıklara zarar verilmemesini tembihlemiştir.",
        "distractor_trap": "Havza Genelgesi'nin temel amacı 'milli bilinci uyandırmaktır'. Meclis veya cumhuriyet fikirleri henüz telaffuz edilmemiştir."
    },
    {
        "difficulty": 2,
        "prompt_text": "22 Haziran 1919'da yayınlanan Amasya Genelgesi'nde yer alan;\n'Vatanın bütünlüğü, milletin bağımsızlığı tehlikededir.'\nhükmü, Milli Mücadele'nin hangi temel unsurunu ifade etmektedir?",
        "options": ["Gerekçesi (Nedeni)", "Amacı", "Yöntemi", "İlk Hükümeti", "Dış Politikası"],
        "correctIndex": 0,
        "explanation": "Amasya Genelgesi'nin 1. maddesi ('Vatanın bütünlüğü tehlikededir') ve 2. maddesi ('İstanbul hükümeti görevini yapamamaktadır') Milli Mücadele'nin 'GEREKÇESİ'dir (Neden savaşıyoruz?).",
        "distractor_trap": "3. madde olan 'Milletin bağımsızlığını yine milletin azim ve kararı kurtaracaktır' ise hem AMACI (bağımsızlık) hem de YÖNTEMİ (milletin azim ve kararı) ifade eder."
    },
    {
        "difficulty": 2,
        "prompt_text": "Amasya Genelgesi'nde yer alan;\n'Milletin bağımsızlığını yine milletin azim ve kararı kurtaracaktır.'\nmaddesi ilk kez aşağıdakilerden hangisinin işaretini vermiştir?",
        "options": [
            "Milli egemenliğe dayalı yeni bir rejim (Cumhuriyet) kurulacağının",
            "Manda ve himayenin kabul edileceğinin",
            "Halifeliğin güçlendirileceğinin",
            "İtilaf Devletleri ile barış yapılacağının",
            "İstanbul Hükümeti'ne tam itaat edileceğinin"
        ],
        "correctIndex": 0,
        "explanation": "'Milletin azim ve kararı' ifadesi, padişahın değil millet iradesinin belirleyici olacağını ilan ettiği için üstü kapalı olarak ilk kez 'Ulusal Egemenlik' ve gelecekteki 'Cumhuriyet' rejiminin ihtilal beyannamesidir.",
        "distractor_trap": "Bu madde hem ulusal bağımsızlığı (amaç) hem de ulusal egemenliği (yöntem) aynı anda içeren en kritik inkılap maddesidir."
    },
    {
        "difficulty": 2,
        "prompt_text": "Mustafa Kemal Paşa, Amasya Genelgesi'nden sonra İstanbul Hükümeti tarafından resmi görevinden alınınca 7/8 Temmuz 1919 gecesi çok sevdiği askerlik mesleğinden ve 9. Ordu Müfettişliği görevinden istifa etmiştir.\n\nMustafa Kemal'in askerlikten istifa ettikten sonra sivil bir vatandaş olarak katıldığı 'ilk kongre' aşağıdakilerden hangisidir?",
        "options": ["Erzurum Kongresi", "Amasya Görüşmesi", "Sivas Kongresi", "Balıkesir Kongresi", "Afyon Kongresi"],
        "correctIndex": 0,
        "explanation": "Mustafa Kemal 7/8 Temmuz gecesi istifa etmiş, böylece 'Sine-i Millete' (milletin sinesine) dönmüştür. Sivil olarak katıldığı ve başkanlığını yürüttüğü ilk kongre 23 Temmuz 1919 Erzurum Kongresi'dir.",
        "distractor_trap": "Mustafa Kemal Amasya'da henüz resmi üniformalı paşadır; Erzurum Kongresi'ne ise sivil olarak katılmıştır. Üniformasına ancak Sakarya Savaşı öncesinde Başkomutanlık ile dönecektir."
    },
    {
        "difficulty": 2,
        "prompt_text": "Mustafa Kemal Paşa'nın istifa etmesi üzerine İstanbul Hükümeti onun tutuklanmasını emretmiştir. Ancak Erzurum'daki 15. Kolordu Komutanı Mustafa Kemal'in huzuruna çıkarak askeri selam vermiş ve 'Ben ve kolordum hepimiz emrinizdeyiz paşam!' diyerek Milli Mücadele'nin kaderini değiştiren tarihi bağlılığı göstermiştir.\n\nBu büyük vatansever komutan kimdir?",
        "options": ["Kazım Karabekir Paşa", "Ali Fuat Cebesoy", "Rauf Orbay", "Refet Bele", "İsmet İnönü"],
        "correctIndex": 0,
        "explanation": "Kazım Karabekir Paşa, emrindeki dağıtılmamış 15. Kolordu ile Mustafa Kemal'e tabi olmuş ve Milli Mücadele'nin askeri omurgasını temin etmiştir.",
        "distractor_trap": "Kazım Karabekir'in bu tarihi tavrı olmasaydı Mustafa Kemal tutuklanabilir ve Milli Mücadele başlangıçta sönebilirdi."
    },
    {
        "difficulty": 2,
        "prompt_text": "Amasya Genelgesi metnini hazırlayan ve imzalayan liderler arasında aşağıdakilerden hangisi yer almaz?",
        "options": ["Mustafa Kemal Paşa", "Rauf Orbay", "Ali Fuat Cebesoy", "Refet Bele", "İsmet İnönü"],
        "correctIndex": 4,
        "explanation": "Amasya Genelgesi'ni imzalayanlar: Mustafa Kemal, Rauf Orbay, Ali Fuat Cebesoy, Refet Bele'dir. Telgrafla onaylayanlar ise Kazım Karabekir ve Cemal Paşa'dır. İsmet İnönü o sırada İstanbul'dadır ve Amasya Genelgesi'nde imzası YOKTUR.",
        "distractor_trap": "ÖSYM'nin en ünlü 'kim imzaladı/imzalamadı' sorusudur: İsmet İnönü ve Fevzi Çakmak Amasya Genelgesi sırasında henüz Anadolu'ya geçmemiştir."
    },

    # --- TEST 6 (51-60): Erzurum, Sivas & Misak-ı Milli ---
    {
        "difficulty": 2,
        "prompt_text": "Erzurum Kongresi ile ilgili olarak;\n'Toplanış şekli ve amacı bakımından bölgesel, aldığı kararlar bakımından ise tamamen ulusaldır.'\nyargısını kanıtlayan en temel karar aşağıdakilerden hangisidir?",
        "options": [
            "Milli sınırlar içinde vatan bir bütündür, bölünemez.",
            "Trabzon ve Erzurum illeri ortak savunma yapacaktır.",
            "Doğu Anadolu'daki Ermeni tehlikesi bertaraf edilecektir.",
            "Kongreye sadece doğu illerinden delege katılacaktır.",
            "Toplantı başkanlığına Mustafa Kemal seçilmiştir."
        ],
        "correctIndex": 0,
        "explanation": "'Milli sınırlar içinde vatan bir bütündür parçalanamaz' kararı tüm vatanı kapsadığı için kongrenin bölgesel toplanıp ulusal kararlar aldığının en açık delilidir.",
        "distractor_trap": "Erzurum Kongresi Doğu Karadeniz ve Doğu Anadolu için toplanmış bölgesel bir kongredir; fakat ilk kez Misak-ı Milli sınırlarından bahsettiği için kararları ulusaldır."
    },
    {
        "difficulty": 2,
        "prompt_text": "Milli Mücadele sürecinde 'Manda ve Himaye' fikri ilk kez nerede reddedilmiş, nerede ise kesin ve son kez olarak bir daha gündeme gelmemek üzere reddedilmiştir?",
        "options": [
            "İlk kez Erzurum Kongresi'nde - Kesin olarak Sivas Kongresi'nde",
            "İlk kez Havza'da - Kesin olarak Amasya'da",
            "İlk kez Sivas'ta - Kesin olarak TBMM'de",
            "İlk kez Amasya'da - Kesin olarak Erzurum'da",
            "İlk kez Misak-ı Milli'de - Kesin olarak Lozan'da"
        ],
        "correctIndex": 0,
        "explanation": "Manda ve himaye ilk kez Erzurum Kongresi'nde ('Manda ve himaye kabul olunamaz'); kesin ve son kez ise Sivas Kongresi'ndeki hararetli Amerikan mandası tartışmaları sonucunda reddedilmiştir.",
        "distractor_trap": "İlk red: Erzurum; Kesin/Son red: Sivas Kongresi. Bu ikili kronoloji ÖSYM'nin vazgeçilmez sorusudur."
    },
    {
        "difficulty": 2,
        "prompt_text": "4-11 Eylül 1919 tarihleri arasında toplanan Sivas Kongresi'nde alınan kararlar doğrultusunda, Anadolu ve Rumeli'de faaliyet gösteren tüm bölgesel direniş cemiyetleri hangi ortak çatı altında birleştirilmiştir?",
        "options": [
            "Anadolu ve Rumeli Müdafaa-i Hukuk Cemiyeti (A-RMHC)",
            "Karakol Cemiyeti",
            "Kuvayımilliye Komutanlığı",
            "Milli Savunma Bakanlığı",
            "Felâh-ı Vatan Grubu"
        ],
        "correctIndex": 0,
        "explanation": "Sivas Kongresi'nde bölgesel tüm direniş dernekleri 'Anadolu ve Rumeli Müdafaa-i Hukuk Cemiyeti' adı altında birleştirilerek Milli Mücadele tek merkezden yönetilmeye başlanmıştır.",
        "distractor_trap": "Erzurum'da sadece Doğu cemiyetleri birleştirilmiştir; tüm vatan cemiyetlerinin birleştiği yer ise Sivas Kongresi'dir."
    },
    {
        "difficulty": 2,
        "prompt_text": "Sivas Kongresi'nde Temsil Heyeti'nin Ali Fuat Paşa'yı 'Batı Cephesi Kuvayımilliye Genel Komutanlığı'na ataması, Temsil Heyeti'nin ilk kez hangi devlet yetkisini kullandığını gösterir?",
        "options": ["Yürütme Yetkisi (Hükümet Gibi Davranma)", "Yasama Yetkisi", "Yargı Yetkisi", "Diplomatik Yetki", "Temyiz Yetkisi"],
        "correctIndex": 0,
        "explanation": "Bir komutan veya memur atamak hükümetlere ait bir 'Yürütme' görevidir. Temsil Heyeti Ali Fuat Paşa'yı atayarak fiilen bir hükümet gibi yürütme yetkisini kullanmıştır.",
        "distractor_trap": "Atama yapmak yürütmedir; kanun çıkarmak yasama, mahkeme kurmak ise yargıdır."
    },
    {
        "difficulty": 2,
        "prompt_text": "Sivas Kongresi'nin engellenememesi üzerine Damat Ferit Paşa Hükümeti istifa etmek zorunda kalmış, yerine milli harekete daha ılımlı bakan Ali Rıza Paşa Hükümeti kurulmuştur.\n\nDamat Ferit Hükümeti'nin istifaya zorlanması, Temsil Heyeti'nin hangi alandaki 'ilk siyasi başarısı' kabul edilir?",
        "options": [
            "İstanbul Hükümeti'ne karşı kazandığı ilk siyasi zafer",
            "İtilaf Devletleri ile imzalanan ilk resmi barış",
            "Saltanatın fiilen kaldırılması",
            "İlk dış borcun iptal edilmesi",
            "Sevr Antlaşması'nın yırtılması"
        ],
        "correctIndex": 0,
        "explanation": "Temsil Heyeti İstanbul ile tüm telgraf ve posta haberleşmesini keserek Damat Ferit'i istifa ettirmiştir. Bu olay Temsil Heyeti'nin İstanbul'a karşı kazandığı ilk büyük siyasi ve diplomatik başarıdır.",
        "distractor_trap": "Askeri değil SİYASİ bir başarıdır ve Temsil Heyeti'nin otoritesini kanıtlamıştır."
    },
    {
        "difficulty": 2,
        "prompt_text": "İstanbul Hükümeti adına Bahriye Nazırı Salih Paşa ile Temsil Heyeti adına Mustafa Kemal Paşa arasında 20-22 Ekim 1919'da gerçekleşen Amasya Görüşmeleri'nin (Protokolü) en önemli tarihi sonucu aşağıdakilerden hangisidir?",
        "options": [
            "İstanbul Hükümeti'nin Temsil Heyeti'ni ve Milli Mücadele'yi hukuken ve resmen ilk kez tanıması",
            "İstanbul Hükümeti'nin Sevr Antlaşması'nı imzalamayı reddetmesi",
            "Mustafa Kemal'in padişah vekili ilan edilmesi",
            "Kuvayımilliye birliklerinin terhis edilmesi",
            "İtilaf Devletleri'nin Anadolu'yu tamamen terk etmesi"
        ],
        "correctIndex": 0,
        "explanation": "Amasya Görüşmeleri ile İstanbul Hükümeti Anadolu ihtilalini ve Temsil Heyeti'nin tüzel kişiliğini resmen ve hukuken tanımak zorunda kalmıştır.",
        "distractor_trap": "Amasya Genelgesi ile Amasya Görüşmeleri karıştırılmamalıdır. Genelge 1919 Haziran'ında bağımsızlık tamimidir; Görüşme ise Ekim'de Salih Paşa ile yapılan protokoldür."
    },
    {
        "difficulty": 2,
        "prompt_text": "Amasya Protokolü'nde kabul edilen maddelerden yalnızca hangisi İstanbul Hükümeti tarafından hayata geçirilebilmiştir?",
        "options": [
            "Mebusan Meclisi'nin toplanması için seçimlerin yapılması",
            "Meclisin İstanbul dışında güvenli bir Anadolu şehrinde toplanması",
            "Temsil Heyeti'nin onayı olmadan hiçbir barış antlaşması imzalanmaması",
            "Kuvayımilliye'ye bütçeden maaş ödenmesi",
            "Zararlı cemiyetlerin derhal kapatılması"
        ],
        "correctIndex": 0,
        "explanation": "İstanbul Hükümeti ve Padişah Vahdettin meclisin İstanbul dışında toplanmasını anayasaya aykırı bularak reddetmiş, sadece seçimlerin yapılıp Mebusan Meclisi'nin İstanbul'da açılmasını kabul etmiştir.",
        "distractor_trap": "Mustafa Kemal meclisin işgal altındaki İstanbul'da toplanmasının çok tehlikeli olduğunu söylemiştir; nitekim meclis basılmış ve dağıtılmıştır."
    },
    {
        "difficulty": 2,
        "prompt_text": "Temsil Heyeti'nin 27 Aralık 1919'da Ankara'ya gelerek burayı Milli Mücadele'nin merkezi ve karargahı seçmesinde Ankara'nın hangi özelliği etkili olmamıştır?",
        "options": [
            "Ali Fuat Paşa komutasındaki 20. Kolordu'nun burada bulunması",
            "Demir yolu hattının son durağı ve telgraf ağının merkezinde yer alması",
            "Batı Cephesi'ne yakın ve işgal edilmemiş güvenli bir konumda olması",
            "Şehrin resmen başkent ilan edilmiş olması",
            "Halkının Milli Mücadele yanlısı olması"
        ],
        "correctIndex": 3,
        "explanation": "Ankara o tarihte başkent değildir. Ankara'nın başkent olması çok sonra, 13 Ekim 1923 tarihindedir.",
        "distractor_trap": "Adaylar Ankara'nın Milli Mücadele başından beri başkent olduğunu zannedebilir. 1919'da resmi başkent hala İstanbul'dur."
    },
    {
        "difficulty": 2,
        "prompt_text": "Son Osmanlı Mebusan Meclisi'nde Mustafa Kemal'in isteği üzerine kurulan 'Müdafaa-i Hukuk' grubu yerine, padişahtan çekinen mebuslar tarafından kurulan ve Misak-ı Milli kararlarını kabul ettiren grubun adı nedir?",
        "options": ["Felâh-ı Vatan (Vatanın Kurtuluşu) Grubu", "Karakol Grubu", "Tesanüd Grubu", "Halk Zümresi", "İstiklal Grubu"],
        "correctIndex": 0,
        "explanation": "Milletvekilleri mecliste Mustafa Kemal'in istediği Müdafaa-i Hukuk grubu yerine Rauf Orbay başkanlığında 'Felâh-ı Vatan' grubunu kurmuşlar ve 28 Ocak 1920'de Misak-ı Milli kararlarını oy birliğiyle kabul ettirmişlerdir.",
        "distractor_trap": "I. TBMM içindeki gruplar (Tesanüd, İstiklal, Halk Zümresi vb.) ile Son Osmanlı Mebusan Meclisi'ndeki 'Felâh-ı Vatan' grubu karıştırılmamalıdır."
    },
    {
        "difficulty": 2,
        "prompt_text": "Son Osmanlı Mebusan Meclisi tarafından 28 Ocak 1920'de kabul edilen Misak-ı Milli kararları arasında aşağıdakilerden hangisi yer almaz?",
        "options": [
            "Kapitülasyonların kesinlikle kaldırılması gerektiği",
            "Arap topraklarında, Kars-Ardahan-Batum'da ve Batı Trakya'da halk oylaması (plebisit) yapılması",
            "Boğazların ticaret gemilerine açılması şartıyla güvenliğinin sağlanması",
            "Azınlık haklarının komşu ülkelerdeki Müslümanların hakları kadar olması",
            "Cumhuriyet rejimine geçilerek padişahlığın kaldırılması"
        ],
        "correctIndex": 4,
        "explanation": "Misak-ı Milli tamamen 'Ulusal Bağımsızlık ve Sınırlar' belgesidir. İçinde rejim, cumhuriyet veya padişahlıkla ilgili tek bir siyasi madde dahi YOKTUR. Padişahın meclisinde böyle bir madde olması zaten düşünülemezdi.",
        "distractor_trap": "ÖSYM'nin en büyük çeldiricisidir: Misak-ı Milli'de 'Ulusal Egemenlik' veya rejim değişikliği KESİNLİKLE YOKTUR, sadece 'Ulusal Bağımsızlık' vardır."
    },

    # --- TEST 7 (61-70): I. TBMM, İsyanlar & Sevr ---
    {
        "difficulty": 2,
        "prompt_text": "23 Nisan 1920 tarihinde Ankara'da açılan I. Türkiye Büyük Millet Meclisi'nin (TBMM) özellikleriyle ilgili aşağıdaki ifadelerden hangisi yanlıştır?",
        "options": [
            "Yasama, yürütme ve yargı yetkilerini tek elde toplayan 'Güçler Birliği' ilkesini benimsemiştir.",
            "Meclis Hükümeti sistemini uygulamış; meclis başkanı aynı zamanda hükümetin de başkanı olmuştur.",
            "Savaş şartları sebebiyle siyasi partilerin kurulmasına izin verilmemiş, gruplar halinde çalışmıştır.",
            "Kurtuluş Savaşı'nı yönettiği için 'İhtilalci' ve 'Gazi' meclistir.",
            "Tüm üyelerini sadece üniversite mezunlarından ve askerlerden oluşturan elitist bir meclistir."
        ],
        "correctIndex": 4,
        "explanation": "I. TBMM elitist değil, toplumun her kesiminden (çiftçi, din adamı, memur, subay, tüccar, aşiret reisi) temsilcilerin yer aldığı son derece 'halkçı ve çoğulcu' bir halk meclisidir.",
        "distractor_trap": "I. TBMM'de parti yoktur, gruplar vardır. Güçler birliği vardır ve kurucu bir halk meclisidir."
    },
    {
        "difficulty": 2,
        "prompt_text": "23 Nisan 1920'de açılan I. TBMM'nin çıkardığı 1 numaralı ilk kanun aşağıdakilerden hangisidir?",
        "options": [
            "Ağnam Resminin (Küçükbaş Hayvan Vergisinin) 4 Katına Çıkarılması Kanunu",
            "Hıyanet-i Vataniye Kanunu",
            "Firariler Kanunu",
            "İstiklal Marşı Kanunu",
            "Teşkilat-ı Esasiye Kanunu"
        ],
        "correctIndex": 0,
        "explanation": "Meclisin ilk icraatı bütçeye kaynak yaratmak için 24 Nisan 1920'de çıkardığı 'Ağnam Vergisinin Arttırılması Hakkında Kanun'dur.",
        "distractor_trap": "Adaylar Hıyanet-i Vataniye veya Teşkilat-ı Esasiye'yi ilk kanun sanabilir; ilk çıkarılan kanun Ağnam vergisidir."
    },
    {
        "difficulty": 2,
        "prompt_text": "I. TBMM'ye karşı çıkan iç ayaklanmaları bastırmak, asker kaçaklarını cezalandırmak ve meclisin otoritesini korumak amacıyla 29 Nisan 1920'de çıkarılan kanun ve üyeleri milletvekillerinden oluşan olağanüstü mahkemeler hangisinde doğru eşleştirilmiştir?",
        "options": [
            "Hıyanet-i Vataniye Kanunu - İstiklal Mahkemeleri",
            "Takrir-i Sükun Kanunu - Divan-ı Harp",
            "Teşvik-i Sanayi Kanunu - Yüce Divan",
            "Firariler Kanunu - Nizamiye Mahkemesi",
            "Men-i İsrafat Kanunu - Asliye Ceza"
        ],
        "correctIndex": 0,
        "explanation": "I. TBMM Hıyanet-i Vataniye Kanunu'nu çıkarmış ve üyeleri bizzat milletvekillerinden oluşan İstiklal Mahkemeleri'ni kurarak 'Yargı' yetkisini de doğrudan kullanmıştır.",
        "distractor_trap": "Takrir-i Sükun Kanunu ve İstiklal Mahkemeleri'nin ikinci dönemi 1925 Şeyh Sait İsyanı ile ilgilidir. I. TBMM'nin kurduğu ilk kanun Hıyanet-i Vataniye'dir."
    },
    {
        "difficulty": 2,
        "prompt_text": "Milli Mücadele aleyhine Şeyhülislam Dürrizade Abdullah Efendi'nin yayınladığı ölüm fetvasına karşı, 153 din adamının imzasıyla 'Milli Mücadele meşrudur ve vatan savunması farzdır' fetvasını kaleme alan ve Ankara Müftüsü olan büyük vatanperver din bilgini kimdir?",
        "options": ["Rıfat Börekçi", "Mehmet Rifat Efendi", "Mustafa Fehmi Gerçeker", "Ahmet Hamdi Akseki", "Şemsettin Günaltay"],
        "correctIndex": 0,
        "explanation": "Ankara Müftüsü Mehmet Rıfat Börekçi, Ankara Fetvası'nı yayınlayarak milli hareketi dini açıdan aklamış ve Cumhuriyetin ilk Diyanet İşleri Başkanı olmuştur.",
        "distractor_trap": "Dürrizade hain fetvayı veren Osmanlı şeyhülislamıdır; Rıfat Börekçi ise Milli Mücadele'yi destekleyen ilk Diyanet İşleri Başkanı'dır."
    },
    {
        "difficulty": 2,
        "prompt_text": "I. TBMM'ye karşı doğrudan İstanbul Hükümeti tarafından kurulan ve İngilizlerin finansmanıyla Boğazları korumak amacıyla teşkil edilen isyan/ordu hangisidir?",
        "options": ["Kuvay-ı İnzibatiye (Hilafet Ordusu)", "Kuvay-ı Seyyare", "Ahmet Anzavur İsyanı", "Demirci Mehmet Efe İsyanı", "Çerkez Ethem İsyanı"],
        "correctIndex": 0,
        "explanation": "Kuvay-ı İnzibatiye (Hilafet Ordusu) ve Ahmet Anzavur doğrudan Damat Ferit Hükümeti ve İngiltere destekli isyanlardır.",
        "distractor_trap": "Kuvay-ı Seyyare Çerkez Ethem'in birlikleridir; Hilafet Ordusu ise Kuvay-ı İnzibatiye'dir."
    },
    {
        "difficulty": 2,
        "prompt_text": "10 Ağustos 1920 tarihinde imzalanan Sevr Antlaşması'nı Osmanlı Devleti adına padişahın kurduğu 'Saltanat Şurası' onaylamıştır.\n\nSaltanat Şurası üyeleri arasında yer almasına rağmen 'Ben bu idam fermanına imza atmam!' diyerek Sevr Antlaşması'nı imzalamayı reddeden tek yurtsever general/devlet adamı kimdir?",
        "options": ["Topçu Feriki Rıza Paşa", "Hadi Paşa", "Rıza Tevfik Bölükbaşı", "Reşat Halis Bey", "Damat Ferit Paşa"],
        "correctIndex": 0,
        "explanation": "Topçu Korgenerali Rıza Paşa, Saltanat Şurası'nda Sevr'i imzalamayı reddeden tek üyedir. Diğer üyeler Sevr'i onayladığı için TBMM tarafından 'Vatan Haini' ilan edilmiştir.",
        "distractor_trap": "Rıza Tevfik, Hadi Paşa ve Reşat Halis Sevr'i imzalayan heyettir; imzalamayan tek kişi Topçu Rıza Paşa'dır."
    },
    {
        "difficulty": 2,
        "prompt_text": "Sevr Antlaşması'nın hukuken 'geçersiz ve ölü doğmuş' bir antlaşma sayılmasının anayasal gerekçesi aşağıdakilerden hangisidir?",
        "options": [
            "Kanun-i Esasi'ye göre uluslararası antlaşmaların Mebusan Meclisi tarafından onaylanması zorunluluğu varken, meclisin kapalı olması sebebiyle meclis onayından geçmemiş olması",
            "Padişahın antlaşmayı imzalamaması",
            "İtilaf Devletleri parlamentolarının antlaşmayı reddetmesi",
            "Milletler Cemiyeti'nin antlaşmayı onaylamaması",
            "Sadrazamın istifa etmesi"
        ],
        "correctIndex": 0,
        "explanation": "Kanun-i Esasi gereğince barış antlaşmaları meclis onayından geçmek zorundadır. Mebusan Meclisi 16 Mart 1920'de işgal edilip kapatıldığı için Sevr hiçbir zaman parlamentodan geçmemiş ve hukuken geçersiz kalmıştır.",
        "distractor_trap": "Ayastefanos gibi Sevr de hukuken ölü doğmuştur; sahada ise Türk ordusunun İstiklal Harbi zaferiyle tarihin çöplüğüne atılmıştır."
    },
    {
        "difficulty": 2,
        "prompt_text": "20 Ocak 1921 tarihinde kabul edilen ve Türkiye Devleti'nin ilk anayasası olan 1921 Teşkilat-ı Esasiye Kanunu'nun 1. maddesi aşağıdakilerden hangisidir?",
        "options": [
            "Egemenlik kayıtsız şartsız milletindir.",
            "Devletin dini İslam'dır.",
            "Türkiye Devleti bir Cumhuriyettir.",
            "Başkent Ankara'dır.",
            "Yürütme yetkisi Cumhurbaşkanına aittir."
        ],
        "correctIndex": 0,
        "explanation": "1921 Anayasası'nın 1. maddesi 'Hakimiyet bila kaydü şart milletindir' (Egemenlik kayıtsız şartsız milletindir). Rejim cumhuriyet olarak henüz adlandırılmamıştır.",
        "distractor_trap": "Cumhuriyetin ilanı 1923'tedir; 1921 Anayasası'nda rejim adı geçmez, ancak 1. madde doğrudan millet egemenliğini ilan eder."
    },
    {
        "difficulty": 2,
        "prompt_text": "İstiklal Marşı'mız 12 Mart 1921'de TBMM tarafından kabul edilmiştir.\n\nİstiklal Marşı yarışmasını düzenleyen bakanlık, marşın ithaf edildiği muhatap ve Meclis kürsüsünde marşı ilk kez okuyan dönemin Milli Eğitim Bakanı eşleştirmesi hangisinde doğru verilmiştir?",
        "options": [
            "Maarif Vekaleti - Kahraman Türk Ordusu - Hamdullah Suphi Tanrıöver",
            "Milli Müdafaa Vekaleti - Türk Gençliği - Rıza Nur",
            "Dahiliye Vekaleti - Mustafa Kemal Paşa - İsmet İnönü",
            "Hariciye Vekaleti - Şehit Anneleri - Yusuf Kemal Tengirşenk",
            "Adliye Vekaleti - TBMM - Kazım Karabekir"
        ],
        "correctIndex": 0,
        "explanation": "Yarışmayı Maarif Vekaleti (Milli Eğitim Bakanlığı) açmıştır. Mehmet Akif Ersoy marşı 'Kahraman Ordumuza' ithaf etmiştir. Meclis kürsüsünde ayakta alkışlarla ilk kez okuyan Maarif Vekili Hamdullah Suphi Tanrıöver'dir.",
        "distractor_trap": "Marş halka veya gençliğe değil 'Kahraman Türk Ordusu'na ithaf edilmiştir. İlk okuyan ise Hamdullah Suphi'dir."
    },
    {
        "difficulty": 2,
        "prompt_text": "İstiklal Marşı'nın ilk bestesini yapan müzisyen ile 1930'dan itibaren günümüzde çalınan son bestesini yapan bestekar eşleştirmesi hangisinde doğru verilmiştir?",
        "options": [
            "Ali Rıfat Çağatay - Osman Zeki Üngör",
            "Osman Zeki Üngör - Ali Rıfat Çağatay",
            "İsmail Dede Efendi - Itri",
            "Cemal Reşit Rey - Adnan Saygun",
            "Zati Arca - Münir Nurettin Selçuk"
        ],
        "correctIndex": 0,
        "explanation": "İstiklal Marşı'nın ilk bestesi 1924-1930 yılları arasında çalınan Ali Rıfat Çağatay'ın bestesidir (alaturka tarzda). 1930'dan itibaren günümüze kadar çalınan beste ise Cumhurbaşkanlığı Senfoni Orkestrası şefi Osman Zeki Üngör'e aittir.",
        "distractor_trap": "İlk beste Ali Rıfat Çağatay; günümüzdeki son beste Osman Zeki Üngör'dür. ÖSYM bu ayrımı sıkça test eder."
    },

    # --- TEST 8 (71-80): Cepheler, Savaşlar & Antlaşmalar ---
    {
        "difficulty": 2,
        "prompt_text": "Kurtuluş Savaşı'nda Doğu Cephesi'nde Ermenilere karşı kazanılan zafer sonrasında 3 Aralık 1920'de imzalanan Gümrü Antlaşması'nın en önemli tarihi niteliği aşağıdakilerden hangisidir?",
        "options": [
            "TBMM'nin uluslararası alanda imzaladığı ilk askeri ve siyasi antlaşma olması ve Sevr'i geçersiz sayan ilk yabancı devletin Ermenistan olması",
            "Sovyetler Birliği ile sınırların kesinleşmesi",
            "Güney sınırımızın tamamen güvenceye alınması",
            "Kapitülasyonların tüm dünyada sona ermesi",
            "İngiltere'nin Anadolu'dan çekilmesi"
        ],
        "correctIndex": 0,
        "explanation": "Gümrü Antlaşması ile TBMM uluslararası alanda ilk zaferini kazanmış, Ermenistan TBMM'yi tanıyan ve Sevr'deki toprak iddialarından vazgeçen ilk devlet olmuştur. Doğu Cephesi kapanarak birlikler Batı'ya kaydırılmıştır.",
        "distractor_trap": "Ermenistan TBMM'yi tanıyan İLK devlettir; Afganistan ilk Müslüman devlettir; Sovyet Rusya ise ilk büyük Avrupalı devlettir."
    },
    {
        "difficulty": 2,
        "prompt_text": "Güney Cephesi'nde Fransız işgaline ve Ermeni intikam alaylarına karşı kahramanca direnen şehirlere TBMM tarafından verilen unvanlar ve İstiklal Madalyası alma yılları konusunda;\nI. Maraş'a 'Kahraman' unvanı (1973)\nII. Antep'e 'Gazi' unvanı (1921)\nIII. Urfa'ya 'Şanlı' unvanı (1984)\n\nYukarıda verilen unvanlardan hangileri doğrudur?",
        "options": ["Yalnız I", "I ve II", "II ve III", "I ve III", "I, II ve III"],
        "correctIndex": 4,
        "explanation": "Kurtuluş Savaşı sırasında bizzat savaşıyorken ilk unvanı alan 1921'de Antep'tir (Gazi). Maraş 1973'te Kahraman, Urfa ise 1984'te Şanlı unvanını almıştır. Her üç eşleştirme de doğrudur.",
        "distractor_trap": "Savaş sürerken unvan alan TEK şehir Gaziantep'tir (1921). Maraş ve Urfa Cumhuriyet döneminde unvan almıştır."
    },
    {
        "difficulty": 2,
        "prompt_text": "Batı Cephesi'nde düzenli ordunun Yunan taarruzuna karşı kazandığı ilk askeri zafer olan I. İnönü Savaşı'nın (Ocak 1921) ulusal ve uluslararası sonuçları 'M-İ-L-A-T' şifresiyle hatırlanır.\n\nBuna göre aşağıdakilerden hangisi 'M-İ-L-A-T' şifresinde yer alan gelişmelerden biri değildir?",
        "options": [
            "Moskova Antlaşması'nın imzalanması",
            "İstiklal Marşı'nın kabul edilmesi",
            "Londra Konferansı'nın toplanması",
            "Afganistan ile Dostluk Antlaşması",
            "Mudanya Ateşkes Antlaşması'nın imzalanması"
        ],
        "correctIndex": 4,
        "explanation": "M-İ-L-A-T şifresi: M: Moskova Antlaşması, İ: İstiklal Marşı, L: Londra Konferansı, A: Afgan Dostluk Antlaşması, T: Teşkilat-ı Esasiye'dir. Mudanya Ateşkesi ise Büyük Taarruz sonrasındadır.",
        "distractor_trap": "M-İ-L-A-T I. İnönü'nün sonuçlarıdır. Mudanya ise Kurtuluş Savaşı'nı fiilen bitiren mütarekedir."
    },
    {
        "difficulty": 2,
        "prompt_text": "I. İnönü Zaferi sonrasında toplanan 1921 Londra Konferansı'nda İtilaf Devletleri Türk tarafı arasında ikilik çıkarmak için hem Osmanlı Hükümeti'ni hem de TBMM'yi davet etmiştir.\n\nKonferansta Osmanlı Sadrazamı ve delegesi Tevfik Paşa'nın söz sırası kendine geldiğinde 'Söz milletin asıl vekilleri olan Ankara heyetine aittir' diyerek sözü Bekir Sami Bey'e bırakmasının tarihi önemi nedir?",
        "options": [
            "İtilaf Devletleri'nin ikilik çıkarma planını çökerterek TBMM'nin milletin tek temsilcisi olduğunu tescillemesi",
            "Sevr Antlaşması'nın aynen kabul edilmesi",
            "Yunan ordusunun Anadolu'dan kaçması",
            "Saltanatın derhal ilga edilmesi",
            "İngiltere'nin savaştan çekilmesi"
        ],
        "correctIndex": 0,
        "explanation": "Osmanlı Sadrazamı Tevfik Paşa bu onurlu tutumuyla İtilaf Devletleri'nin oyununu bozmuş ve TBMM'yi milletin gerçek temsilcisi ilan etmiştir.",
        "distractor_trap": "Lozan'da da benzer ikilik planı yapılmış, ancak bu kez TBMM 1 Kasım 1922'de Saltanatı kaldırarak oyunu kökten bozmuştur."
    },
    {
        "difficulty": 2,
        "prompt_text": "Kurtuluş Savaşı Batı Cephesi'nde düzenli ordunun aldığı tek mağlubiyet olan Eskişehir-Kütahya Muharebeleri sonrasında ordunun Sakarya Nehri'nin doğusuna çekilmesi üzerine Mecliste büyük tartışmalar yaşanmıştır.\n\nBu kriz üzerine 5 Ağustos 1921'de çıkarılan kanunla Mustafa Kemal Paşa'ya meclisin tüm yetkilerini 3 ay süreyle kullanma hakkı veren makam aşağıdakilerden hangisidir?",
        "options": ["Başkomutanlık Yetkisi", "Reisicumhurluk", "Gazi Mareşallik", "Diyanet İşleri Başkanlığı", "Büyük Millet Meclisi Başkanlığı"],
        "correctIndex": 0,
        "explanation": "5 Ağustos 1921 Başkomutanlık Kanunu ile Meclis yasama ve yürütme yetkilerini üç aylığına Mustafa Kemal'e devretmiştir. Böylece Mustafa Kemal Erzurum'da istifa ettiği askerlik mesleğine Başkomutan olarak dönmüştür.",
        "distractor_trap": "Başkomutanlık süresiz değil, ilk etapta 3 aylığına verilmiş; zaferden sonra uzatılmıştır."
    },
    {
        "difficulty": 2,
        "prompt_text": "Mustafa Kemal Paşa, Başkomutanlık yetkisini kullanarak ordunun silah, cephane, giysi, taşıt ve yiyecek ihtiyacını halktan karşılamak amacıyla 7-8 Ağustos 1921'de hangi tarihi emirleri yayınlamıştır?",
        "options": ["Tekalif-i Milliye Emirleri", "Teşvik-i Sanayi Kararları", "Misak-ı İktisadi", "Kanunname-i Milliye", "Milli Korunma Kararları"],
        "correctIndex": 0,
        "explanation": "Tekalif-i Milliye (Milli Yükümlülük) Emirleri ile her haneden bir kat çamaşır, çorap, çarık, silah ve taşıt istenmiş; bedelleri zaferden sonra ödenmek üzere kayıt altına alınmıştır. Bu emirler Sakarya Savaşı ve Büyük Taarruz'un lojistik omurgasıdır.",
        "distractor_trap": "Tekalif-i Milliye Sakarya Savaşı'ndan ÖNCE, Eskişehir hezimetinden HEMEN SONRA çıkarılmıştır."
    },
    {
        "difficulty": 2,
        "prompt_text": "Mustafa Kemal Paşa'nın 22 gün 22 gece süren kanlı muharebede dünya harp literatürüne geçen;\n'Hatt-ı müdafaa yoktur, sath-ı müdafaa vardır. O satıh bütün vatandır. Vatanın her karış toprağı vatandaşın kanıyla ıslanmadıkça terk olunamaz!'\ntarihi emrini verdiği zafer aşağıdakilerden hangisidir?",
        "options": ["Sakarya Meydan Muharebesi", "Büyük Taarruz (Başkomutanlık Meydan Muharebesi)", "I. İnönü Savaşı", "II. İnönü Savaşı", "Dumlupınar Muharebesi"],
        "correctIndex": 0,
        "explanation": "23 Ağustos - 13 Eylül 1921 tarihlerindeki Sakarya Meydan Muharebesi, Türk ordusunun 1683 II. Viyana Kuşatması'ndan beri süregelen 238 yıllık geri çekilişini durduran kader savaşıdır. Mustafa Kemal bu savaştan sonra Gazi ve Mareşal unvanı almıştır.",
        "distractor_trap": "'Ordular ilk hedefiniz Akdeniz'dir ileri!' sözü Büyük Taarruz'da; 'Hatt-ı müdafaa yoktur...' sözü ise Sakarya Meydan Muharebesi'ndedir."
    },
    {
        "difficulty": 2,
        "prompt_text": "Sakarya Zaferi'nin uluslararası diplomasideki en önemli yansımaları arasında aşağıdakilerden hangisi yer almaz?",
        "options": [
            "Fransa ile 20 Ekim 1921 Ankara Antlaşması imzalanarak Güney Cephesi'nin kapanması",
            "Kafkas cumhuriyetleri (Azerbaycan, Ermenistan, Gürcistan) ile Kars Antlaşması imzalanarak doğu sınırımızın kesinleşmesi",
            "İtalya'nın Anadolu'daki işgal kuvvetlerini tamamen çekmesi",
            "İngiltere ile esir değişimi antlaşmasının yapılması",
            "Yunanistan'ın Sevr Antlaşması'nı tek taraflı olarak onaylaması"
        ],
        "correctIndex": 4,
        "explanation": "Yunanistan Sakarya'da hezimete uğramış ve taarruz gücünü kaybederek savunmaya çekilmiştir. Sevr'i onaylamak değil, aksine toprakları boşaltma telaşına düşmüştür.",
        "distractor_trap": "Sakarya sonrası Fransa ile Ankara Antlaşması yapılarak İtilaf Bloku parçalanmış ve Güney cephesi resmen kapanmıştır."
    },
    {
        "difficulty": 2,
        "prompt_text": "Büyük Taarruz'un zaferle sonuçlanması ve İzmir'in kurtarılmasından sonra 11 Ekim 1922'de imzalanan Mudanya Ateşkes Antlaşması ile tek bir kurşun dahi atılmadan (savaş yapılmadan) diplomatik yolla kurtarılan bölgelerimiz hangisinde doğru verilmiştir?",
        "options": [
            "Doğu Trakya - İstanbul - Boğazlar",
            "Batı Trakya - İzmir - Antalya",
            "Musul - Kerkük - Hatay",
            "Kars - Ardahan - Batum",
            "Adana - Urfa - Antep"
        ],
        "correctIndex": 0,
        "explanation": "Mudanya Mütarekesi ile İsmet İnönü'nün diplomasisi sayesinde Doğu Trakya (Edirne, Tekirdağ, Kırklareli), İstanbul ve Boğazlar savaş yapılmadan teslim alınmıştır. Ayrıca Osmanlı Hükümeti hukuken yok sayılmıştır.",
        "distractor_trap": "Doğu Trakya, İstanbul ve Boğazlar 'savaşsız kurtarılan' bölgelerdir. Trakya Yüksek Komiseri olarak teslim alan milli kahramanımız Refet Bele'dir."
    },
    {
        "difficulty": 2,
        "prompt_text": "24 Temmuz 1923'te imzalanan Lozan Barış Antlaşması'nda Misak-ı Milli sınırları dışında kalan ve çözümü Türkiye ile İngiltere'nin ikili müzakerelerine bırakılan tek sınır meselesi aşağıdakilerden hangisidir?",
        "options": ["Musul (Irak Sınırı)", "Hatay (Suriye Sınırı)", "Batı Trakya", "Karasu Sınırı", "On İki Ada"],
        "correctIndex": 0,
        "explanation": "Lozan'da çözülemeyip 9 ay içinde ikili müzakerelere bırakılan yegane konu Musul Sorunudur (Irak Sınırı). Hatay ise 1921 Ankara Antlaşması şartlarıyla Suriye mandasında kalmıştır.",
        "distractor_trap": "Lozan'da çözülemeyen TEK konu Musul'dur. Hatay çözülmüş fakat aleyhimize çözülmüştür."
    }
]

def generate_sql():
    sql_path = os.path.join("docs", "soru_havuzu", "tarih", "05_kurtulus_savasi_hazirlik_ve_cepheler_ek.sql")
    os.makedirs(os.path.dirname(sql_path), exist_ok=True)
    
    with open(sql_path, "w", encoding="utf-8") as f:
        f.write("-- =====================================================================\n")
        f.write("-- ÜNİTE 5: Kurtuluş Savaşı Hazırlık ve Cepheler (EK 40 SORU: Test 5, 6, 7, 8)\n")
        f.write("-- Toplam Soru: 40 Soru (Mevcut 40 + Bu Ek 40 = 80 Soru / 8 Test)\n")
        f.write("-- Şema: public.questions (lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap)\n")
        f.write("-- =====================================================================\n\n")
        
        for idx, q in enumerate(questions, 41):
            lesson = "Tarih"
            topic = "Kurtuluş Savaşı Hazırlık ve Cepheler"
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
