-- =============================================================
-- KPSS GÜNCEL BİLGİLER — KONU 4: SPOR VE OLIMPIYATLAR
-- Toplam Soru: 40 (Zorluk: 10 Kolay, 20 Orta, 10 Zor)
-- Standart: Özgün İçerik + Açıklama + ÖSYM Çeldirici Tuzağı
-- =============================================================
BEGIN;

-- Soru #01 (Zorluk: 1)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Güncel Bilgiler',
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  1,
  '2024 Paris Yaz Olimpiyat Oyunları''nda 10 metre havalı tabanca karma takım kategorisinde Şevval İlayda Tarhan ile birlikte GÜMÜŞ MADALYA kazanarak Türkiye''ye atıcılık tarihindeki ilk olimpiyat madalyasını getiren ve ekipmansız doğal atış tarzıyla dünyada viral olan milli atıcımız kimdir?',
  '{"options": ["Yusuf Dikeç", "İsmail Keleş", "Mete Gazoz", "Ömer Faruk Planat", "Taha Akgül"], "correctIndex": 0}'::jsonb,
  '2024 Paris Olimpiyatları''nda özel lens veya kulaklık kullanmadan, eli cebinde rahat atış tarzıyla tüm dünyanın hayranlığını kazanan ve gümüş madalya alan atıcımız YUSUF DİKEÇ''tir.',
  'Yusuf Dikeç bu madalyayı Şevval İlayda Tarhan ile birlikte ''karma takım'' kategorisinde kazanmıştır.'
);

-- Soru #02 (Zorluk: 1)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Güncel Bilgiler',
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  1,
  'Almanya''da düzenlenen 2024 Avrupa Futbol Şampiyonası''nda (EURO 2024) finalde İngiltere''yi mağlup ederek şampiyonluğa ulaşan ve kupayı 4. kez müzesine götüren ülke hangisidir?',
  '{"options": ["İspanya", "Almanya", "Fransa", "İtalya", "Portekiz"], "correctIndex": 0}'::jsonb,
  'EURO 2024 finalinde İngiltere''yi 2-1 yenen İSPANYA, turnuvayı namağlup tamamlayarak 4. Avrupa şampiyonluğunu kazanmış ve turnuva tarihinin en çok kazanan takımı olmuştur.',
  'İngiltere üst üste ikinci kez finalde kaybetmiştir; şampiyon İSPANYA''dır.'
);

-- Soru #03 (Zorluk: 1)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Güncel Bilgiler',
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  1,
  'UEFA tarafından resmi olarak açıklanan karara göre, 2032 Avrupa Futbol Şampiyonası (EURO 2032) hangi iki ülkenin ortak ev sahipliğinde düzenlenecektir?',
  '{"options": ["Türkiye ve İtalya", "İspanya ve Portekiz", "İngiltere ve İrlanda", "Almanya ve Avusturya", "Fransa ve Belçika"], "correctIndex": 0}'::jsonb,
  'UEFA İcra Komitesi, EURO 2032''nin TÜRKİYE ve İTALYA ortaklığıyla düzenleneceğini resmen duyurmuştur. (EURO 2028 ise Birleşik Krallık ve İrlanda''da yapılacaktır).',
  '2028 = İngiltere & İrlanda; 2032 = TÜRKİYE ve İTALYA''dır.'
);

-- Soru #04 (Zorluk: 1)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Güncel Bilgiler',
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  1,
  '2023 yılında FIVB Milletler Ligi (VNL) ve CEV Avrupa Voleybol Şampiyonası''nda altın madalya kazanarak dünya 1 numarası olan ''Filenin Sultanları'' Türkiye Kadın Voleybol Milli Takımı''nın başantrenörü kimdir?',
  '{"options": ["Daniele Santarelli", "Giovanni Guidetti", "Ferhat Akbaş", "Massimo Barbolini", "Vital Heynen"], "correctIndex": 0}'::jsonb,
  '2023 yılında göreve gelerek Türk kadın voleybol tarihine altın çağını yaşatan İtalyan başantrenör DANIELE SANTARELLI''dir.',
  'Guidetti VakıfBank ve eski milli takım hocasıydı; 2023 şampiyonluklarını getiren antrenör SANTARELLI''dir.'
);

-- Soru #05 (Zorluk: 1)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Güncel Bilgiler',
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  1,
  '2020 Tokyo Olimpiyatları''nda bireysel klasik yayda altın madalya alarak Türk okçuluk tarihinin ilk olimpiyat şampiyonu olan ve 2024 Paris''te erkek takımında bronz madalya kazanan okçumuz kimdir?',
  '{"options": ["Mete Gazoz", "Ulaş Berkim Tümer", "Abdullah Yıldırmış", "Göksel Taşçı", "Demir Elmaağaçlı"], "correctIndex": 0}'::jsonb,
  'Tokyo 2020 Olimpiyat Şampiyonu ve 2023 Berlin Dünya Şampiyonu olan milli okçumuz METE GAZOZ''dur.',
  'Ulaş Berkim Tümer ve Abdullah Yıldırmış Paris 2024''te Mete Gazoz ile birlikte takım bronz madalyası alan milli okçulardır; ilk altın Mete Gazoz''undur.'
);

-- Soru #06 (Zorluk: 1)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Güncel Bilgiler',
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  1,
  'Güreş kariyerinde 1 kez Olimpiyat Şampiyonluğu, 3 kez Dünya Şampiyonluğu ve 11 kez Avrupa Şampiyonluğu elde eden ve 2024 Paris Olimpiyatları''nda bronz madalya kazanarak aktif sporculuk hayatını noktalayan serbest stil efsane güreşçimiz kimdir?',
  '{"options": ["Taha Akgül", "Rıza Kayaalp", "Hamza Yerlikaya", "Yaşar Doğu", "Ali Cengiz"], "correctIndex": 0}'::jsonb,
  '125 kg serbest stilde dünyanın en başarılı güreşçilerinden biri olan TAHA AKGÜL, 2024 Paris Olimpiyatları''nda kürsüye çıkarak mindere veda etmiştir.',
  'Rıza Kayaalp grekoromen stildedir; serbest stilde 11 Avrupa şampiyonu olan ve 2024''te jübile yapan isim TAHA AKGÜL''dür.'
);

-- Soru #07 (Zorluk: 1)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Güncel Bilgiler',
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  1,
  'Grekoromen güreşte 12. kez Avrupa Şampiyonu olarak efsanevi Rus güreşçi Aleksandr Karelin''in rekorunu egale eden Türk güreşçi kimdir?',
  '{"options": ["Rıza Kayaalp", "Taha Akgül", "Burhan Akbudak", "Cebi Selçuk", "Kerem Kamal"], "correctIndex": 0}'::jsonb,
  'Grekoromen 130 kiloda 12 Avrupa ve 5 Dünya şampiyonluğu bulunan milli güreşçimiz RIZA KAYAALP''tir.',
  'Karelin''in rekorunu kıran/egale eden grekoromen ağır sıklet Rıza Kayaalp''tir.'
);

-- Soru #08 (Zorluk: 1)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Güncel Bilgiler',
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  1,
  '2024 Paris Paralimpik Oyunları''nda yüzmede hem 50 metre serbest hem de 200 metre serbestte 2 ALTIN MADALYA birden kazanarak aynı olimpiyatta iki altın kazanan ilk Türk sporcu unvanını alan paralimpik yüzücümüz kimdir?',
  '{"options": ["Umut Ünlü", "Koral Berkin Kutlu", "Sevilay Öztürk", "Sümeyye Boyacı", "Turgut Aslanyar"], "correctIndex": 0}'::jsonb,
  'Paris 2024''te S3 kategorisinde iki altın madalya birden alarak tarihe geçen yüzücümüz UMUT ÜNLÜ''dür.',
  'Sümeyye Boyacı ve Sevilay Öztürk de başarılı yüzücülerimizdir; Paris 2024''te 2 altın birden kazanan isim UMUT ÜNLÜ''dür.'
);

-- Soru #09 (Zorluk: 1)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Güncel Bilgiler',
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  1,
  'Paralimpik Oyunları tarihinde Rio 2016, Tokyo 2020 ve Paris 2024''te üst üste ÜÇ KEZ PARALİMPİK ŞAMPİYONU olarak kırılması güç bir rekora imza atan milli takımımız hangisidir?',
  '{"options": ["Kadın Golbol (Goalball) Milli Takımı", "Tekerlekli Sandalye Basketbol Takımı", "Ampute Futbol Milli Takımı", "Kadın Voleybol Takımı", "Para Masa Tenisi Takımı"], "correctIndex": 0}'::jsonb,
  'Sevda Altunoluk liderliğindeki KADIN GOLBOL MİLLİ TAKIMIMIZ, üst üste 3 olimpiyatta (2016, 2020, 2024) altın madalya kazanarak dünya tarihine geçmiştir.',
  'Ampute futbol paralimpik branş değildir (Dünya ve Avrupa şampiyonumuzdur); Paralimpikte 3 kez üst üste şampiyon olan KADIN GOLBOL TAKIMIDIR.'
);

-- Soru #10 (Zorluk: 1)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Güncel Bilgiler',
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  1,
  'Halter sporunda kendi vücut ağırlığının üç katından fazlasını kaldırabilen dünyadaki tek sporculardan olan, 1988 Seul, 1992 Barselona ve 1996 Atlanta''da üst üste 3 kez Olimpiyat Şampiyonu olan ''Cep Herkülü'' lakaplı efsane kimdir?',
  '{"options": ["Naim Süleymanoğlu", "Halil Mutlu", "Taner Sağır", "Sedat Artuç", "Daniyar İsmayilov"], "correctIndex": 0}'::jsonb,
  'Kırdığı 46 dünya rekoru ve Time dergisine kapak olan başarılarıyla ''Cep Herkülü'' NAİM SÜLEYMANOĞLU''dur.',
  'Halil Mutlu da 3 kez olimpiyat şampiyonudur (''Dinamit''); ''Cep Herkülü'' ise NAİM SÜLEYMANOĞLU''dur.'
);

-- Soru #11 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Güncel Bilgiler',
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  2,
  '2024 Paris Yaz Olimpiyat Oyunları''nda Türkiye''ye kadınlar boksta gümüş madalya kazandıran iki milli boksörümüz hangi seçenekte doğru verilmiştir?',
  '{"options": ["Buse Naz Çakıroğlu ve Hatice Akbaş", "Busenaz Sürmeneli ve Esra Yıldız", "Hatice Akbaş ve Şennur Demir", "Buse Naz Çakıroğlu ve Gizem Özer", "Elif Güneri ve Sema Çalışkan"], "correctIndex": 0}'::jsonb,
  'Paris 2024''te kadınlar boksta 50 kg''da BUSE NAZ ÇAKIROĞLU ve 54 kg''da HATİCE AKBAŞ gümüş madalya kazanarak kürsüye çıkmışlardır.',
  'Busenaz Sürmeneli Tokyo 2020 şampiyonudur; Paris 2024''te gümüş madalya alan ikili Buse Naz Çakıroğlu ve Hatice Akbaş''tır.'
);

-- Soru #12 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Güncel Bilgiler',
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  2,
  '2026 FIFA Dünya Kupası, tarihte ilk kez 48 takımın katılımıyla hangi üç ülkenin ortak ev sahipliğinde düzenlenecektir?',
  '{"options": ["ABD — Kanada — Meksika", "İspanya — Portekiz — Fas", "Brezilya — Arjantin — Uruguay", "Almanya — İtalya — Fransa", "Suudi Arabistan — Katar — BAE"], "correctIndex": 0}'::jsonb,
  '2026 Dünya Kupası Kuzey Amerika kıtasında ABD, KANADA ve MEKSİKA ortaklığında gerçekleştirilecektir. (Meksika 3. kez ev sahipliği yapan ilk ülke olacaktır).',
  '2030 Dünya Kupası İspanya-Portekiz-Fas; 2034 Suudi Arabistan; 2026 ise ABD-Kanada-Meksika''dır.'
);

-- Soru #13 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Güncel Bilgiler',
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  2,
  '2028 Yaz Olimpiyat Oyunları hangi şehir ve ülkede düzenlenecektir?',
  '{"options": ["Los Angeles (ABD)", "Brisbane (Avustralya)", "Madrid (İspanya)", "Roma (İtalya)", "Tokyo (Japonya)"], "correctIndex": 0}'::jsonb,
  '2024 Paris''in ardından 2028 Yaz Olimpiyatları ABD''nin LOS ANGELES şehrinde düzenlenecektir. 2032 ise Avustralya''nın Brisbane kentindedir.',
  '2028 = Los Angeles; 2032 = Brisbane. Bu iki olimpiyat kenti sıklıkla seçeneklerde yer değiştirir.'
);

-- Soru #14 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Güncel Bilgiler',
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  2,
  'Modern Olimpiyat Oyunları''nda Türkiye adına güreş dışındaki bir branşta İLK ALTIN MADALYAYI kazandıran kadın sporcumuz kimdir?',
  '{"options": ["Nurcan Taylan (Halter)", "Nur Tatar (Tekvando)", "Busenaz Sürmeneli (Boks)", "Yasemin Adar (Güreş)", "Süreyya Ayhan (Atletizm)"], "correctIndex": 0}'::jsonb,
  '2004 Atina Olimpiyatları''nda 48 kiloda altın madalya kazanan halterci NURCAN TAYLAN, olimpiyatlarda altın madalya kazanan İLK TÜRK KADIN SPORCUDUR.',
  'İlk kadın olimpiyat şampiyonumuz NURCAN TAYLAN''dır (2004 Atina Halter). Boksör Busenaz Sürmeneli 2020 Tokyo''da şampiyon olmuştur.'
);

-- Soru #15 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Güncel Bilgiler',
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  2,
  'Türk spor tarihinde hem A Milli Futbol Takımı''nda hem de A Milli Basketbol Takımı''nda forma giyen, Fenerbahçe ve Fiorentina efsanesi olan ''Sinyor'' lakaplı sporcu kimdir?',
  '{"options": ["Can Bartu", "Lefter Küçükandonyadis", "Metin Oktay", "Hakkı Yeten", "Süleyman Seba"], "correctIndex": 0}'::jsonb,
  'Hem futbolda hem basketbolda milli formayı giyen, İtalya''da Fiorentina ile Avrupa Kupa Galipleri Kupası finalinde oynayan tek sporcumuz CAN BARTU''dur.',
  'Ordinaryüs Lefter Küçükandonyadis; Taçsız Kral Metin Oktay; ''Sinyor'' ve iki branşta milli olan isim ise CAN BARTU''dur.'
);

-- Soru #16 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Güncel Bilgiler',
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  2,
  'Avrupa kupalarında (UEFA Kupası ve UEFA Süper Kupa) şampiyonluk kazanan İLK VE TEK TÜRK FUTBOL TAKIMI hangisidir?',
  '{"options": ["Galatasaray", "Fenerbahçe", "Beşiktaş", "Trabzonspor", "Başakşehir"], "correctIndex": 0}'::jsonb,
  '17 Mayıs 2000''de Arsenal''i yenerek UEFA Kupası''nı, ardından Real Madrid''i yenerek UEFA Süper Kupa''yı kazanan takım GALATASARAY''dır.',
  'Avrupa''da kupa kaldıran tek Türk takımı Galatasaray''dır.'
);

-- Soru #17 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Güncel Bilgiler',
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  2,
  'Türkiye''de 1905 yılında kurulan İLK TÜRK FUTBOL KULÜBÜ hangisidir?',
  '{"options": ["Galatasaray", "Beşiktaş Jimnastik Kulübü", "Fenerbahçe", "Altay", "Karşıyaka"], "correctIndex": 0}'::jsonb,
  'Ali Sami Yen ve arkadaşları tarafından Mekteb-i Sultani''de 1905''te kurulan GALATASARAY ilk Türk futbol kulübüdür. (1903''te kurulan Beşiktaş ilk spor/jimnastik kulübüdür; futbol şubesi daha sonra açılmıştır).',
  'İlk jimnastik kulübü Beşiktaş (1903); İlk FUTBOL KULÜBÜ ise Galatasaray''dır (1905).'
);

-- Soru #18 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Güncel Bilgiler',
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  2,
  '2024 Paris Paralimpik Oyunları''nda Para Okçuluk Makaralı Yay Karma Takım kategorisinde Sadık Savaş ile birlikte altın madalya kazanan dünya rekortmeni kadın okçumuz kimdir?',
  '{"options": ["Öznur Cüre Girdi", "Gizem Girişmen", "Yağmur Şengül", "Merve Nur Eroğlu", "Büşra Ün"], "correctIndex": 0}'::jsonb,
  'Paris 2024''te dünya rekoru kırarak altın madalyaya uzanan para okçumuz ÖZNUR CÜRE GİRDİ''dir.',
  'Gizem Girişmen 2008 Pekin şampiyonudur; Paris 2024 altın madalyası Öznur Cüre Girdi''ye aittir.'
);

-- Soru #19 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Güncel Bilgiler',
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  2,
  'Tekvando branşında 2012 Londra Olimpiyatları''nda altın madalya kazanarak Türk tekvando tarihinin ilk erkek olimpiyat şampiyonu olan sporcumuz kimdir?',
  '{"options": ["Servet Tazegül", "Bahri Tanrıkulu", "Hakan Reçber", "Rıza Doğangün", "Emre Kutalmış Ateşli"], "correctIndex": 0}'::jsonb,
  '2012 Londra''da fırtına gibi eserek altın madalya kazanan ve adına tekvando salonları açılan sporcumuz SERVET TAZEGÜL''dür.',
  'Hakan Reçber Tokyo 2020 bronz madalyalıdır; ilk altın madalyalı tekvandocumuz SERVET TAZEGÜL''dür.'
);

-- Soru #20 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Güncel Bilgiler',
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  2,
  'Kadın güreşinde Türkiye''ye TARİHİN İLK DÜNYA ŞAMPİYONLUĞUNU ve ilk olimpiyat madalyasını (Tokyo 2020 bronz) kazandıran, 7 kez Avrupa Şampiyonu olan efsane kadın güreşçimiz kimdir?',
  '{"options": ["Yasemin Adar Yiğit", "Buse Tosun Çavuşoğlu", "Evin Demirhan", "Zeynep Yetgil", "Elif Jale Yeşilırmak"], "correctIndex": 0}'::jsonb,
  'Türk kadın güreşinin öncüsü olan ve 2017''de Paris''te ilk dünya şampiyonluğunu kazanan sporcumuz YASEMİN ADAR YİĞİT''tir.',
  'Buse Tosun Çavuşoğlu 2023 Dünya Şampiyonu ve 2024 Paris bronz madalyalıdır; kadın güreşinde İLK yolu açan ve ilk dünya şampiyonu olan YASEMİN ADAR''dır.'
);

-- Soru #21 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Güncel Bilgiler',
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  2,
  '2024 Paris Olimpiyatları''nda kadınlar güreş 68 kiloda mindere çıkarak bronz madalya kazanan ve 2023 Dünya Şampiyonu olan milli güreşçimiz kimdir?',
  '{"options": ["Buse Tosun Çavuşoğlu", "Yasemin Adar Yiğit", "Evin Demirhan", "Nesrin Baş", "Zeynep Yetgil"], "correctIndex": 0}'::jsonb,
  'Kadınlar 68 kg''da Paris 2024''te bronz madalya kazanan güreşçimiz BUSE TOSUN ÇAVUŞOĞLU''dur.',
  '76 kg Yasemin Adar; 68 kg Buse Tosun Çavuşoğlu''dur.'
);

-- Soru #22 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Güncel Bilgiler',
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  2,
  '2024 Paris Olimpiyatları''nda erkekler klasik yay takımında bronz madalya alarak Türkiye''ye takım okçuluk tarihindeki ilk olimpiyat madalyasını kazandıran üçlü milli kadro hangi seçenektir?',
  '{"options": ["Mete Gazoz — Ulaş Berkim Tümer — Abdullah Yıldırmış", "Mete Gazoz — Samet Ak — Efe Çırış", "Mete Gazoz — Bilal Gürkaynak — Ali Aydın", "Ulaş Berkim Tümer — Göksel Taşçı — Demir Elmaağaçlı", "Mete Gazoz — Muhammed Abdullah — Kerem Özmen"], "correctIndex": 0}'::jsonb,
  'Tarihi bronz madalyayı kazanan Klasik Yay Erkek Takımımız METE GAZOZ, ULAŞ BERKİM TÜMER ve ABDULLAH YILDIRMIŞ''tan oluşmuştur.',
  'Mete Gazoz''un yanındaki genç takım arkadaşları Ulaş Berkim Tümer ve Abdullah Yıldırmış''tır.'
);

-- Soru #23 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Güncel Bilgiler',
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  2,
  'Türkiye Ampute Futbol Milli Takımı; 2022 yılında İstanbul''da düzenlenen Dünya Kupası finalinde hangi ülkeyi yenerek DÜNYA ŞAMPİYONU olmuştur?',
  '{"options": ["Angola", "İspanya", "Polonya", "Brezilya", "İngiltere"], "correctIndex": 0}'::jsonb,
  'Nef Stadyumu''nda oynanan tarihi finalde Türkiye, Angola''yı 4-1 mağlup ederek Ampute Futbol Dünya Kupası''nı kazanmıştır.',
  '2018''de Angola''ya penaltılarla kaybedilmişti; 2022''de rövanş alınarak ANGOLA mağlup edilmiş ve şampiyon olunmuştur.'
);

-- Soru #24 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Güncel Bilgiler',
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  2,
  '2024 Paris Olimpiyatları''nda 10 metre havalı tabanca karma takımında Yusuf Dikeç ile birlikte gümüş madalya alarak kürsüye çıkan kadın milli atıcımız kimdir?',
  '{"options": ["Şevval İlayda Tarhan", "Damla Köse", "Elif Beyza Malkoç", "Rüveyda Gülsüm", "Yasemin Ecem Anagöz"], "correctIndex": 0}'::jsonb,
  'Kulaklıklı ve saçındaki Türk bayraklı bandanasıyla kararlı atışlar yapan ve Yusuf Dikeç''in partneri olan genç milli atıcımız ŞEVVAL İLAYDA TARHAN''dır.',
  'Yusuf Dikeç tek başına yarışmamıştır; karma takımda ŞEVVAL İLAYDA TARHAN ile birlikte gümüş madalya kazanmıştır.'
);

-- Soru #25 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Güncel Bilgiler',
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  2,
  'Basketbolda 2024-2025 sezonu itibarıyla NBA''de Houston Rockets formasıyla gösterdiği ''Triple-Double'' performanslarıyla adından söz ettiren ve All-Star seçilme başarısı gösteren Türk pivot kimdir?',
  '{"options": ["Alperen Şengün", "Cedi Osman", "Furkan Korkmaz", "Ömer Faruk Yurtseven", "Ersan İlyasova"], "correctIndex": 0}'::jsonb,
  'Houston Rockets formasıyla olağanüstü pas yeteneği ve pota altı dominasyonuyla NBA''in en parlak genç yıldızları arasına giren ALPEREN ŞENGÜN''dür.',
  'Hidayet Türkoğlu ve Mehmet Okur eski nesildir; günümüzün NBA süperstarı ALPEREN ŞENGÜN''dür.'
);

-- Soru #26 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Güncel Bilgiler',
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  2,
  'Dünya serbest dalış rekortmeni olan, tek nefeste paletsiz ve değişken ağırlıklı kategorilerde kırdığı rekorlarla tanınan ''Sualtı Perisi'' lakaplı kadın milli sporcumuz kimdir?',
  '{"options": ["Şahika Ercümen", "Derya Can", "Fatma Uruk", "Merve Çoban", "İlke Özyüksel"], "correctIndex": 0}'::jsonb,
  'Antarktika''da dalış yapan ilk Türk kadın sporcu olan ve 100 metreyi aşan dalış rekorlarına imza atan sporcumuz ŞAHİKA ERCÜMEN''dir.',
  'Derya Can da başarılı bir dalgıçtır; ancak Antarktika dalışı ve 100+ metre rekorlarıyla tanınan isim ŞAHİKA ERCÜMEN''dir.'
);

-- Soru #27 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Güncel Bilgiler',
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  2,
  '2024 Paris Olimpiyat Oyunları''nın açılış töreni olimpiyatlar tarihinde bir ilk olarak bir stadyumda değil, şehrin hangi ünlü nehrinde tekneler üzerinde yapılmıştır?',
  '{"options": ["Sen (Seine) Nehri", "Ren Nehri", "Tuna Nehri", "Thames Nehri", "Tiber Nehri"], "correctIndex": 0}'::jsonb,
  'Paris 2024 Olimpiyatları''nın açılış töreni stadyum dışında, SEN NEHRİ üzerinde 85 teknelik geçit töreniyle açık havada yapılmıştır.',
  'Paris''in içinden geçen nehir SEN (Seine) nehridir.'
);

-- Soru #28 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Güncel Bilgiler',
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  2,
  'Türkiye Milli Olimpiyat Komitesi''nin (TMOK) kurucusu olan ve Türkiye''nin ilk spor dergisini (İdman) çıkaran, ''Beden Terbiyesi'' dersinin okullara girmesini sağlayan spor adamı kimdir?',
  '{"options": ["Selim Sırrı Tarcan", "Ali Sami Yen", "Şeref Bey", "Burhan Felek", "Sinan Erdem"], "correctIndex": 0}'::jsonb,
  'Türkiye Milli Olimpiyat Komitesi''nin kurucusu ve Türk sporunun babası SELİM SIRRI TARCAN''dır.',
  'Ali Sami Yen GS kurucusudur; Türkiye Milli Olimpiyat Komitesi''nin kurucusu SELİM SIRRI TARCAN''dır.'
);

-- Soru #29 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Güncel Bilgiler',
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  2,
  'Modern Pentatlon branşında Türkiye''yi olimpiyatlarda temsil eden İLK TÜRK SPORCU olan ve Tokyo 2020''de olimpiyat 5.si olan kadın sporcumuz kimdir?',
  '{"options": ["İlke Özyüksel", "Büşra Ün", "Busenaz Sürmeneli", "Yasemin Can", "Meryem Akdağ"], "correctIndex": 0}'::jsonb,
  'Yüzme, eskrim, binicilik, koşu ve atıcılıktan oluşan modern pentatlonda dünya rekorları kıran öncü sporcumuz İLKE ÖZYÜKSEL''dir.',
  'Modern Pentatlon denince tek bir isim akla gelir: İLKE ÖZYÜKSEL.'
);

-- Soru #30 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Güncel Bilgiler',
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  2,
  '2024 Paris Paralimpik Oyunları''nda Para Tekvando kadınlar 47 kiloda ALTIN MADALYA kazanan milli sporcumuz kimdir?',
  '{"options": ["Mahmut Bozteke", "Gamze Gürdal", "Meryem Betül Çavdar", "Feryal Özel", "Şeyma Nur Emeksiz"], "correctIndex": 0}'::jsonb,
  'Para tekvandoda Mahmut Bozteke erkeklerde altın madalya kazanırken, kadınlar K44 57 kg''da Feryal/Gamze mücadele etmiş; MAHMUT BOZTEKE tarihi altın madalyayı boynuna takmıştır.',
  'Para tekvandoda Türkiye ilk kez olimpiyat altını kazanmıştır; erkeklerde Mahmut Bozteke şampiyon olmuştur.'
);

-- Soru #31 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Güncel Bilgiler',
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  3,
  'Türkiye''nin olimpiyat tarihindeki İLK MADALYASINI (Bronz) 1936 Berlin Olimpiyatları''nda kazanan güreşçimiz kimdir?',
  '{"options": ["Ahmet Kireççi (Mersinli Ahmet)", "Yaşar Erkan", "Gazanfer Bilge", "Celal Atik", "Nasuh Akar"], "correctIndex": 0}'::jsonb,
  'Türkiye''nin olimpiyatlardaki İLK MADALYASINI (Bronz) Mersinli AHMET KİREÇÇİ kazanmıştır. (Aynı olimpiyatta birkaç gün sonra Yaşar Erkan İLK ALTIN madalyayı kazanmıştır).',
  'ÖSYM''nin en meşhur tuzağı: İlk MADALYA (Bronz) = Ahmet Kireççi; İlk ALTIN MADALYA = Yaşar Erkan''dır!'
);

-- Soru #32 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Güncel Bilgiler',
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  3,
  'Türkiye''nin olimpiyat tarihindeki İLK ALTIN MADALYASINI 1936 Berlin Olimpiyatları''nda grekoromen güreşte kazanan efsane sporcumuz kimdir?',
  '{"options": ["Yaşar Erkan", "Ahmet Kireççi", "Yaşar Doğu", "Hamza Yerlikaya", "Mehmet Oktav"], "correctIndex": 0}'::jsonb,
  '1936 Berlin''de Türk bayrağını göndere çektirip İstiklal Marşı''mızı ilk kez çaldıran İLK ALTIN MADALYALI olimpiyat şampiyonumuz YAŞAR ERKAN''dır.',
  'İlk madalya = Ahmet Kireççi; İlk ALTIN = YAŞAR ERKAN''dır.'
);

-- Soru #33 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Güncel Bilgiler',
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  3,
  '17 yaşında 1993 yılında Büyükler Dünya Güreş Şampiyonu olarak FILA tarafından ''Asrın Güreşçisi'' unvanı verilen ve 1996 Atlanta ile 2000 Sidney''de iki altın olimpiyat madalyası kazanan güreşçimiz kimdir?',
  '{"options": ["Hamza Yerlikaya", "Mahmut Demir", "Harun Doğan", "Nazmi Avluca", "Şeref Eroğlu"], "correctIndex": 0}'::jsonb,
  'FILA (Dünya Güreş Birliği) tarafından ''Asrın Güreşçisi'' ilan edilen isim HAMZA YERLİKAYA''dır.',
  'Yüzyılın Haltercisi Naim Süleymanoğlu; Asrın Güreşçisi HAMZA YERLİKAYA''dır.'
);

-- Soru #34 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Güncel Bilgiler',
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  3,
  'Avrupa Voleybol Konfederasyonu (CEV) Şampiyonlar Ligi''ni kadınlarda EN ÇOK KAZANAN (6 kez) ve aynı zamanda FIVB Kadınlar Kulüpler Dünya Şampiyonası''nı en çok kazanan Türk voleybol kulübü hangisidir?',
  '{"options": ["VakıfBank", "Eczacıbaşı", "Fenerbahçe", "Galatasaray", "Türk Hava Yolları"], "correctIndex": 0}'::jsonb,
  'Guinness Rekorlar Kitabı''na giren üst üste galibiyet serisi ve 6 CEV Şampiyonlar Ligi zaferiyle kadın voleybolunun zirvesi VAKIFBANK''tır.',
  'Eczacıbaşı ilk şampiyon kulüptür; en çok kazanan ve rekorlar kıran kulüp VAKIFBANK''tır.'
);

-- Soru #35 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Güncel Bilgiler',
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  3,
  '2024 Paris Olimpiyatları''nda 57 kg boks kategorisinde mücadele ederek bronz madalya kazanan kadın milli boksörümüz kimdir?',
  '{"options": ["Esra Yıldız Kahraman", "Buse Naz Çakıroğlu", "Hatice Akbaş", "Busenaz Sürmeneli", "Gizem Özer"], "correctIndex": 0}'::jsonb,
  'Paris 2024''te kadınlar 57 kiloda yarı finale yükselerek bronz madalya kazanan boksörümüz ESRA YILDIZ KAHRAMAN''dır.',
  'Gümüşler: Buse Naz Çakıroğlu ve Hatice Akbaş; Bronz: Esra Yıldız Kahraman''dır.'
);

-- Soru #36 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Güncel Bilgiler',
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  3,
  'Türkiye Futbol Federasyonu (TFF) resmi olarak kaç yılında kurulmuş ve FIFA''ya hangi yıl üye olmuştur?',
  '{"options": ["1923 yılında kuruldu — 1923 yılında FIFA''ya üye oldu", "1905 yılında kuruldu — 1920''de üye oldu", "1938 yılında kuruldu — 1954''te üye oldu", "1924 yılında kuruldu — 1928''de üye oldu", "1914 yılında kuruldu — 1930''da üye oldu"], "correctIndex": 0}'::jsonb,
  'TFF, 1923 yılında ''Futbol Heyet-i Müttehidesi'' adıyla kurulmuş ve aynı yıl 21 Mayıs 1923''te FIFA''nın 26. üyesi olmuştur.',
  'TFF Cumhuriyet ile yaşıttır: 1923''te kurulmuş ve aynı yıl FIFA''ya girmiştir.'
);

-- Soru #37 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Güncel Bilgiler',
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  3,
  'Türkiye A Milli Futbol Takımı, tarihinde İLK RESMİ MAÇINI 26 Ekim 1923''te İstanbul Taksim Stadı''nda hangi ülkeye karşı oynamış ve 2-2 berabere kalmıştır?',
  '{"options": ["Romanya", "Yunanistan", "Bulgaristan", "Macaristan", "Rusya"], "correctIndex": 0}'::jsonb,
  'Türkiye milli futbol takımı ilk resmi karşılaşmasını 26 Ekim 1923''te ROMANYA ile oynamış ve milli takımın tarihteki ilk golünü Zeki Rıza Sporel atmıştır.',
  'İlk milli maç Romanya ile yapılmıştır ve ilk golü Zeki Rıza Sporel atmıştır.'
);

-- Soru #38 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Güncel Bilgiler',
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  3,
  'Olimpiyat Oyunları bayrağında yer alan 5 iç içe geçmiş halkanın renkleri ve temsil ettiği 5 kıta değerlendirildiğinde aşağıdakilerden hangisi bu renklerden biri DEĞİLDİR?',
  '{"options": ["Turuncu", "Mavi", "Sarı", "Siyah", "Yeşil"], "correctIndex": 0}'::jsonb,
  'Olimpiyat halkalarının 5 rengi vardır: Mavi (Avrupa), Sarı (Asya), Siyah (Afrika), Yeşil (Okyanusya) ve Kırmızı (Amerika). Turuncu renk olimpiyat halkalarında YOKTUR.',
  'Olimpiyat halkalarında TURUNCU veya MOR yoktur; Mavi, Sarı, Siyah, Yeşil, Kırmızı vardır.'
);

-- Soru #39 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Güncel Bilgiler',
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  3,
  '2024 Paris Olimpiyatları''nda madalya sıralamasında 40 altın madalyayla zirveyi paylaşan iki süper güç ülke hangileridir?',
  '{"options": ["Amerika Birleşik Devletleri (ABD) ve Çin", "ABD ve Fransa", "Çin ve Japonya", "Büyük Britanya ve Avustralya", "ABD ve Almanya"], "correctIndex": 0}'::jsonb,
  'Paris 2024''te hem ABD hem Çin 40''ar altın madalya kazanmış; toplam madalya sayısı daha fazla olan ABD (126 madalya) olimpiyat lideri olmuştur.',
  'Altın sayısı eşittir (40-40); toplam madalya sayısı ile ABD birinci olmuştur.'
);

-- Soru #40 (Zorluk: 3)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  'Güncel Bilgiler',
  'Spor ve Olimpiyatlar',
  'multiple_choice',
  3,
  'Dünya güreş tarihinde ''Yenilmeyen Türk'' olarak tanınan, Amerika ve Avrupa turnelerinde tüm rakiplerini tuş eden ve 1898''de La Bourgogne gemisinin batması sonucu Atlas Okyanusu''nda boğularak vefat eden efsanevi Türk pehlivanı kimdir?',
  '{"options": ["Koca Yusuf", "Adalı Halil", "Kel Aliço", "Filiz Nurullah", "Kurtdereli Mehmet Pehlivan"], "correctIndex": 0}'::jsonb,
  'Dünyada ''Terrible Turk'' (Korkunç Türk) lakabıyla tanınan ve mindere çıkan en güçlü pehlivan sayılan KOCA YUSUF, Amerika dönüşü batan gemide hayatını kaybetmiştir.',
  '''Güreşirken arkamda Türk milletinin bulunduğunu düşünürüm'' diyen Kurtdereli''dir; Atlas Okyanusu''nda vefat eden ''Yenilmeyen Türk'' ise KOCA YUSUF''tur.'
);

COMMIT;
