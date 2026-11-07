# -*- coding: utf-8 -*-
import json
import os
import sys

# TASK-B2: Osmanlı Dağılma Dönemi için +20 Rafine Soru (Test 9, Test 10 / Sorular 81-100)
# Kapsam:
# Test 9 (81-90): Sırp İsyanları (Kara Yorgi, Bükreş Antlaşması), Mora İsyanı ve Navarin Baskını (1827), Kuleli Vakası, Çırağan Baskını, Şıpka Geçidi Kahramanı Süleyman Paşa, Ermeni Olayları (Sasun, Kumkapı, Osmanlı Bankası Baskını)
# Test 10 (91-100): Dömeke Meydan Muharebesi (1897), Girit Meselesi ve Halepa Fermanı, Trablusgarp'ta Uçak Kullanımı ve İlk Hava Şehitleri (Fethi-Sadık-Nuri Beyler), Balkan Savaşları (Midye-Enez hattı, Rauf Orbay ve Hamidiye Kahramanı, Londra ve Bükreş Antlaşmaları)

questions = [
    # --- TEST 9 (81-90): İsyanlar, Saray Darbeleri & 93 Harbi Detayları ---
    {
        "difficulty": 2,
        "prompt_text": "Osmanlı Devleti'nde 19. yüzyıl başında milliyetçilik akımının etkisiyle 1804 yılında ilk isyanı başlatan lider ile Sırplara ilk kez ayrıcalık (imtiyaz) tanıyan 1812 antlaşması aşağıdakilerden hangisinde doğru eşleştirilmiştir?",
        "options": [
            "Kara Yorgi - Bükreş Antlaşması",
            "Miloş Obrenoviç - Edirne Antlaşması",
            "Aleksandr İpsilanti - Yaş Antlaşması",
            "Tepedelenli Ali Paşa - Kütahya Antlaşması",
            "Dimitri Kantemir - Pasarofça Antlaşması"
        ],
        "correctIndex": 0,
        "explanation": "Sırp isyanını 1804'te Kara Yorgi başlatmıştır. 1812 Bükreş Antlaşması ile Sırplara ilk imtiyaz verilmiş, 1829 Edirne ile özerklik, 1878 Berlin ile bağımsızlık verilmiştir.",
        "distractor_trap": "İlk isyan eden Sırplardır ve lideri Kara Yorgi'dir. İlk ayrıcalık 1812 Bükreş Antlaşması'dır."
    },
    {
        "difficulty": 2,
        "prompt_text": "1821 yılında başlayan Rum (Yunan) İsyanı'nı kışkırtan, Fener Rum Patrikhanesi ve Rus çarlığı tarafından desteklenen gizli bağımsızlık cemiyeti aşağıdakilerden hangisidir?",
        "options": ["Etnik-i Eterya (Filiki Eterya)", "Hınçak Cemiyeti", "Taşnaksutyun", "Mavri Mira", "Kordos Cemiyeti"],
        "correctIndex": 0,
        "explanation": "Filiki Eterya (Dostluk Cemiyeti), 1814'te Odessa'da kurulmuş ve Yunan bağımsızlık isyanını organize etmiştir.",
        "distractor_trap": "Mavri Mira I. Dünya Savaşı dönemi cemiyetidir; 1821 isyanını başlatan ise Etnik-i Eterya'dır."
    },
    {
        "difficulty": 2,
        "prompt_text": "Yunan isyanını bastırmak amacıyla Osmanlı ve Mısır donanmalarının Mora kıyılarında bulunduğu sırada, 1827 yılında İngiliz, Fransız ve Rus birleşik donanmasının hiçbir savaş ilanı yapmadan Osmanlı donanmasını yaktığı liman baskını hangisidir?",
        "options": ["Navarin Baskını", "Sinop Baskını", "Çeşme Baskını", "İnebahtı Baskını", "Preveze Baskını"],
        "correctIndex": 0,
        "explanation": "1827 Navarin Baskını ile Osmanlı ve Mısır filosu tamamen yakılmış ve bu olay üzerine çıkan 1828-1829 Osmanlı-Rus Savaşı Yunanistan'ın bağımsızlığıyla sonuçlanmıştır.",
        "distractor_trap": "Osmanlı donanmasının yakıldığı 4 yer kronolojisi: İnebahtı (1571), Çeşme (1770), Navarin (1827), Sinop (1853)."
    },
    {
        "difficulty": 3,
        "prompt_text": "1859 yılında Sultan Abdülmecit'i tahttan indirerek yerine Şehzade Abdülaziz'i geçirmeyi hedefleyen ve Türk siyasi tarihindeki 'ilk başarısız darbe girişimi' kabul edilen gizli örgütlenme olayı nedir?",
        "options": ["Kuleli Vakası", "Çırağan Baskını", "Bab-ı Ali Baskını", "Edirne Vakası", "Patrona Halil İsyanı"],
        "correctIndex": 0,
        "explanation": "Kuleli Vakası (1859), Fedailer Cemiyeti tarafından Abdülmecit'e karşı planlanan ancak önceden haber alınarak bastırılan ilk askeri darbe teşebbüsüdür.",
        "distractor_trap": "Çırağan Baskını II. Abdülhamit'e karşı yapılmıştır; Kuleli Vakası ise Abdülmecit dönemindedir."
    },
    {
        "difficulty": 3,
        "prompt_text": "1878 yılında Ali Suavi önderliğindeki bir grubun, II. Abdülhamit'i devirerek akıl sağlığı bozuk olduğu gerekçesiyle tahttan indirilen V. Murat'ı yeniden tahta çıkarmak amacıyla gerçekleştirdiği kanlı saray baskını hangisidir?",
        "options": ["Çırağan Sarayı Baskını", "Kuleli Vakası", "Bab-ı Ali Baskını", "31 Mart Vakası", "Beylerbeyi Hadisesi"],
        "correctIndex": 0,
        "explanation": "Ali Suavi'nin Çırağan Sarayı Baskını, Beşiktaş Muhafızı Yedi Sekiz Hasan Paşa'nın Ali Suavi'yi başına sopayla vurarak öldürmesiyle bastırılmıştır.",
        "distractor_trap": "Çırağan Baskını Ali Suavi tarafından V. Murat'ı tahta geçirmek için yapılmıştır."
    },
    {
        "difficulty": 2,
        "prompt_text": "1877-1878 Osmanlı-Rus Savaşı'nda (93 Harbi) Balkanlar'da Şıpka Geçidi'ni Rus kuvvetlerine ve Bulgar çetelerine karşı dondurucu kış şartlarında aylarca kahramanca savunan ve 'Şıpka Kahramanı' unvanını alan Osmanlı generali kimdir?",
        "options": ["Süleyman Hüsnü Paşa", "Gazi Osman Paşa", "Ahmet Muhtar Paşa", "Hasan Tahsin Paşa", "Ethem Paşa"],
        "correctIndex": 0,
        "explanation": "Süleyman Hüsnü Paşa Şıpka Geçidi savunması ile tarihe geçmiştir. Plevne Kahramanı Gazi Osman Paşa; Kafkas Kahramanı ise Ahmet Muhtar Paşa'dır.",
        "distractor_trap": "Plevne = Gazi Osman Paşa; Şıpka Geçidi = Süleyman Hüsnü Paşa'dır."
    },
    {
        "difficulty": 2,
        "prompt_text": "II. Abdülhamit döneminde Ermeni çetelerinin Doğu Anadolu'daki köylere ve Türk yerleşimlerine yönelik terör eylemlerini engellemek ve sınır güvenliğini sağlamak amacıyla Doğu'daki aşiretlerden kurulan süvari alaylarına ne ad verilmiştir?",
        "options": ["Hamidiye Alayları", "Asakir-i Mansure", "Kuvayımilliye", "Sekban-ı Cedit", "Başıbozuklar"],
        "correctIndex": 0,
        "explanation": "Hamidiye Süvari Alayları, II. Abdülhamit tarafından doğudaki Kürt ve Türkmen aşiretlerinden teşkil edilmiş, Rus ve Ermeni çetelerine karşı sınır güvenliğinde çok etkili olmuştur.",
        "distractor_trap": "Hamidiye Alayları II. Abdülhamit'in adını taşır ve düzenli süvari birlikleridir."
    },
    {
        "difficulty": 2,
        "prompt_text": "1896 yılında Ermeni Taşnak komitacılarının Avrupa'nın dikkatini çekmek amacıyla başkent İstanbul'da bastıkları ve rehineler aldıkları uluslararası finans kurumu aşağıdakilerden hangisidir?",
        "options": ["Osmanlı Bankası (Bank-ı Osmani-i Şahane)", "Ziraat Bankası", "Düyun-ı Umumiye", "Dersaadet Bankası", "Reji İdaresi"],
        "correctIndex": 0,
        "explanation": "Osmanlı Bankası Baskını (1896), Ermeni teröristlerin Galata'daki bankayı dinamitlerle işgal ederek Avrupa devletlerinin müdahalesini sağlamaya çalıştığı uluslararası krizdir.",
        "distractor_trap": "Ermeni komitacılar Osmanlı Bankası'nı işgal etmiştir. Rus elçisinin araya girmesiyle teröristler Fransa'ya kaçırılmıştır."
    },
    {
        "difficulty": 2,
        "prompt_text": "21 Temmuz 1905 tarihinde Ermeni Taşnak komitacılarının II. Abdülhamit'e yönelik Cuma Namazı çıkışında Yıldız Camii önünde gerçekleştirdikleri bombalı suikast girişimi tarihe ne adla geçmiştir?",
        "options": ["Yıldız Suikastı", "Çırağan Olayı", "Kuleli Vakası", "Bab-ı Ali Baskını", "Selamlık Hadisesi"],
        "correctIndex": 0,
        "explanation": "Yıldız Suikastı'nda saatli bomba yüklü araba patlatılmış, Şeyhülislam ile birkaç dakika ayaküstü sohbet eden II. Abdülhamit ölümden kıl payı kurtulmuştur. Tevfik Fikret bu suikast için 'Bir Lahza-i Teahhur' (Bir Anlık Gecikme) şiirini yazmıştır.",
        "distractor_trap": "Yıldız Suikastı II. Abdülhamit'e yöneliktir ve Tevfik Fikret'in 'Şanlı Avcı' dediği olaydır."
    },
    {
        "difficulty": 2,
        "prompt_text": "Osmanlı Devleti'nde Tanzimat döneminde Ahmet Cevdet Paşa öncülüğünde kurulan, Osmanlı'nın ilk fen ve bilim akademisi niteliğinde olan, üniversite ders kitaplarını hazırlayan kurum hangisidir?",
        "options": ["Encümen-i Daniş", "Darülfünun", "Cemiyet-i İlmiye-i Osmaniye", "Tercüme Odası", "Mekteb-i Maarif"],
        "correctIndex": 0,
        "explanation": "Encümen-i Daniş (1851), Fransız Bilimler Akademisi örnek alınarak kurulan ilk Türk bilim akademisidir. Ahmet Cevdet Paşa ünlü 'Tarih-i Cevdet' eserini bu kuruma sunmuştur.",
        "distractor_trap": "Encümen-i Daniş bilim akademisi ve ders kitabı telif heyetidir."
    },

    # --- TEST 10 (91-100): Dömeke Savaşı, Girit & Balkan Harpleri ---
    {
        "difficulty": 2,
        "prompt_text": "1897 Osmanlı-Yunan Savaşı'nda Ethem Paşa komutasındaki Türk ordusunun Yunan ordusunu kesin bir hezimete uğrattığı, Mustafa Kemal'in Manastır Askeri İdadisi'nde öğrenci iken savaşa katılmak için okuldan kaçtığı tarihi meydan savaşı hangisidir?",
        "options": ["Dömeke Meydan Muharebesi", "Tesalya Savaşı", "Preveze Muharebesi", "Yanya Savaşı", "Kırkkilise Savaşı"],
        "correctIndex": 0,
        "explanation": "1897 Dömeke Meydan Savaşı, Osmanlı'nın meydanda kazandığı son büyük zaferdir. Mustafa Kemal 16 yaşındayken bu savaşa katılmak için arkadaşıyla okuldan kaçmış fakat yakalanarak geri getirilmiştir.",
        "distractor_trap": "Mustafa Kemal'in gençliğinde 'Gidip savaşmak için can attım' dediği savaş 1897 Dömeke Savaşı'dır."
    },
    {
        "difficulty": 2,
        "prompt_text": "1878 yılında Osmanlı Devleti'nin Girit'teki Rum isyanlarını yatıştırmak amacıyla Rumlara vergi muafiyeti, Hristiyan vali atanması ve Rumcanın resmi dil olmasını tanıdığı özerklik fermanı aşağıdakilerden hangisidir?",
        "options": ["Halepa Fermanı", "Tanzimat Fermanı", "Islahat Fermanı", "Vilayet Nizamnamesi", "Kanun-i Esasi"],
        "correctIndex": 0,
        "explanation": "Halepa Fermanı (1878), Girit'in adım adım Osmanlı'dan kopup Yunanistan'a bağlanmasına zemin hazırlayan özerklik belgesidir.",
        "distractor_trap": "Girit ile özdeşleşen ferman Halepa Fermanı'dır. 1908'de Girit Yunanistan'a katıldığını ilan etmiştir."
    },
    {
        "difficulty": 2,
        "prompt_text": "Dünya harp tarihinde 'askeri uçak ve hava saldırısının' ilk kez bir devlete karşı kullanıldığı savaş hangisidir ve hangi devlet tarafından kullanılmıştır?",
        "options": [
            "1911 Trablusgarp Savaşı - İtalya",
            "1914 I. Dünya Savaşı - Almanya",
            "1912 Balkan Savaşı - Bulgaristan",
            "1897 Osmanlı-Yunan Savaşı - Yunanistan",
            "1919 Kurtuluş Savaşı - İngiltere"
        ],
        "correctIndex": 0,
        "explanation": "İtalya, 1911 Trablusgarp Savaşı'nda Türk mevzilerine karşı tarihte ilk kez askeri uçak kullanmış ve havadan bomba atmıştır. Türk askerleri ise tüfek ateşiyle tarihte ilk kez uçak düşürmeyi başarmıştır.",
        "distractor_trap": "Dünyada askeri uçağın ilk kullanıldığı savaş Trablusgarp Savaşı'dır (İtalya tarafından)."
    },
    {
        "difficulty": 2,
        "prompt_text": "1914 yılında İstanbul'dan Kahire'ye uzanan tarihi hava seferi sırasında Şam yakınlarında uçakları düşerek şehit olan ve Türk havacılık tarihinin 'ilk hava şehitleri' kabul edilen pilotlarımız kimlerdir?",
        "options": [
            "Fethi Bey - Sadık Bey - Nuri Bey",
            "Cengiz Topel - Vecihi Hürkuş",
            "Ahmet Ali Çelikten - Vecihi Hürkuş",
            "Sabiha Gökçen - Vecihi Hürkuş",
            "Mehmet Ali Bey - Mazlum Keyüsk"
        ],
        "correctIndex": 0,
        "explanation": "Yüzbaşı Fethi Bey ve Üsteğmen Sadık Bey Taberiye Gölü civarında şehit düşmüşlerdir. Muğla'nın Meğri kasabasına Fethi Bey'in anısına 'Fethiye' adı verilmiştir.",
        "distractor_trap": "Fethiye ilçesinin adı ilk hava şehidimiz Fethi Bey'den gelmektedir."
    },
    {
        "difficulty": 2,
        "prompt_text": "I. Balkan Savaşı'nda Osmanlı ordusunun hezimete uğraması üzerine 30 Mayıs 1913'te imzalanan Londra Antlaşması'na göre Osmanlı Devleti'nin batı sınırı hangi hat olarak belirlenmiştir?",
        "options": ["Midye - Enez Hattı", "Meriç Nehri", "Çatalca Hattı", "Karasu Hattı", "Tuna Hattı"],
        "correctIndex": 0,
        "explanation": "Londra Antlaşması ile Osmanlı Midye-Enez hattının batısındaki tüm topraklarını (Edirne, Kırklareli dahil tüm Doğu ve Batı Trakya ile Makedonya) kaybetmiştir.",
        "distractor_trap": "I. Balkan sonu sınırı Midye-Enez'dir. II. Balkan'da Edirne geri alınınca sınır Meriç Nehri olmuştur."
    },
    {
        "difficulty": 2,
        "prompt_text": "I. Balkan Savaşı sırasında Yunan donanmasının Çanakkale Boğazı ablukasını kırarak Ege ve Akdeniz'de tek başına aylarca korsan savaşı yürüten, Yunan gemilerini batıran ve 'Hamidiye Kahramanı' unvanını alan ünlü Türk denizcisi ve devlet adamı kimdir?",
        "options": ["Rauf Orbay", "Ali Çetinkaya", "Hasan Saka", "Fahrettin Altay", "Kazım Özalp"],
        "correctIndex": 0,
        "explanation": "Rauf Orbay, Hamidiye Kruvazörü ile dünya denizcilik tarihine geçen bir harekat icra etmiş ve halkın sevgilisi olarak 'Hamidiye Kahramanı' unvanını almıştır.",
        "distractor_trap": "Hamidiye Kahramanı Rauf Orbay'dır; Mondros'u imzalayan ve Terakkiperver kurucusu olan liderdir."
    },
    {
        "difficulty": 2,
        "prompt_text": "II. Balkan Savaşı'nın çıkış sebebi aşağıdakilerden hangisidir?",
        "options": [
            "I. Balkan Savaşı'nda Bulgaristan'ın en büyük payı (Ege kıyıları dahil) alması üzerine diğer Balkan devletlerinin (Yunanistan, Sırbistan, Karadağ ve Romanya) Bulgaristan'a saldırması",
            "Osmanlı'nın Atina'ya saldırması",
            "Rusya'nın Boğazları işgal etmesi",
            "Arnavutluk'un Sırbistan'ı işgal etmesi",
            "Avusturya'nın Bosna'yı ilhak etmesi"
        ],
        "correctIndex": 0,
        "explanation": "Bulgaristan I. Balkan Savaşı'nda aslan payını alınca diğer müttefikleri Bulgaristan'a savaş açmıştır. Osmanlı da bu kargaşadan yararlanıp Edirne'yi savaşmadan geri almıştır.",
        "distractor_trap": "II. Balkan Savaşı Osmanlı'ya karşı değil; Bulgaristan'a karşı Balkan devletlerinin savaşıdır. Osmanlı fırsattan istifade Edirne'yi kurtarmıştır."
    },
    {
        "difficulty": 2,
        "prompt_text": "II. Balkan Savaşı sırasında Osmanlı ordusunun başında Edirne ve Kırklareli'yi Bulgar işgalinden kurtararak 'Edirne Fatihi' unvanını alan Osmanlı komutanı kimdir?",
        "options": ["Enver Paşa", "Mahmut Şevket Paşa", "Talat Paşa", "Cemal Paşa", "Mustafa Kemal Paşa"],
        "correctIndex": 0,
        "explanation": "Enver Paşa, II. Balkan Savaşı'nda Edirne'yi geri alarak büyük bir halk kahramanı olmuş, 'Edirne Fatihi' unvanını almış ve ardından Harbiye Nazırı olmuştur.",
        "distractor_trap": "Edirne Fatihi unvanı Enver Paşa'ya aittir."
    },
    {
        "difficulty": 2,
        "prompt_text": "II. Balkan Savaşı sonunda Balkan devletlerinin kendi aralarında sınırları yeniden çizmek amacıyla imzaladıkları ve Bulgaristan'ın mağlup olduğu antlaşma hangisidir?",
        "options": ["Bükreş Antlaşması (1913)", "İstanbul Antlaşması", "Atina Antlaşması", "Londra Antlaşması", "Belgrad Antlaşması"],
        "correctIndex": 0,
        "explanation": "Balkan devletleri kendi aralarında 1913 Bükreş Antlaşması'nı imzalamışlardır. Osmanlı bu antlaşmada yer almamış; ikili antlaşmalar yapmıştır.",
        "distractor_trap": "Balkan devletlerinin kendi aralarındaki antlaşma Bükreş'tir; Osmanlı'nın Bulgaristan'la yaptığı 1913 İstanbul, Yunanistan'la yaptığı 1913 Atina'dır."
    },
    {
        "difficulty": 2,
        "prompt_text": "Balkan Savaşları'nın Osmanlı Devleti ve Türk toplumu üzerindeki en acı ve kalıcı sosyal sonucu aşağıdakilerden hangisidir?",
        "options": [
            "Balkanlar'dan Anadolu'ya yüz binlerce Türk ve Müslümanın göç etmek zorunda kalması ve 'Balkan Muhacirleri' sorununun doğması",
            "Anadolu'da tarımsal üretimin tamamen durması",
            "Gayrimüslimlerin askere alınmaya başlanması",
            "İstanbul'un başkentlikten çıkarılması",
            "Kapitülasyonların kendiliğinden kalkması"
        ],
        "correctIndex": 0,
        "explanation": "Balkan Savaşları ile yüz binlerce soydaşımız katliamlardan kaçarak İstanbul ve Anadolu'ya sığınmış, bu göç Anadolu'da Türk nüfus oranını ciddi biçimde artırmış ve Türk milliyetçiliğini güçlendirmiştir.",
        "distractor_trap": "Balkan Savaşları Anadolu'daki Türk nüfus yoğunluğunu artırmış ve Türkçülük akımını devletin tek politikası haline getirmiştir."
    }
]

def generate_sql():
    sql_path = os.path.join("docs", "soru_havuzu", "tarih", "04_osmanli_dagilma_donemi_ek2.sql")
    os.makedirs(os.path.dirname(sql_path), exist_ok=True)
    
    with open(sql_path, "w", encoding="utf-8") as f:
        f.write("-- =====================================================================\n")
        f.write("-- ÜNİTE 4: Osmanlı Dağılma Dönemi (EK 20 RAFİNE SORU: Test 9, Test 10)\n")
        f.write("-- Toplam Soru: 20 Soru (Mevcut 80 + Bu Ek 20 = 100 Soru / 10 Test)\n")
        f.write("-- Şema: public.questions (lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap)\n")
        f.write("-- =====================================================================\n\n")
        
        for idx, q in enumerate(questions, 81):
            lesson = "Tarih"
            topic = "Osmanlı Dağılma Dönemi"
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
            
    print(f"Başarıyla 20 ek soru oluşturuldu: {sql_path}")

if __name__ == "__main__":
    generate_sql()
