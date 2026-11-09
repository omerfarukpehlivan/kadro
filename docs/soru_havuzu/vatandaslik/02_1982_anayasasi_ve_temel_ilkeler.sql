-- =============================================================
-- KPSS VATANDAŞLIK — KONU 2: 1982 ANAYASASI VE TEMEL İLKELER
-- Toplam Soru: 50
-- Standart: Özgün İçerik + Açıklama + ÖSYM Çeldirici Tuzağı + order_index
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
  distractor_trap,
  order_index
) values (
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  'multiple_choice',
  1,
  '1982 Anayasası''nın 4. maddesi uyarınca değiştirilemez ve değiştirilmesi teklif dahi edilemez olan hükümler arasında aşağıdakilerden hangisi yer almaz?',
  '{"options": ["Türkiye Devleti''nin bir Cumhuriyet olduğu (1. Madde)", "Cumhuriyetin nitelikleri (2. Madde)", "Devletin bütünlüğü, resmi dili, bayrağı, milli marşı ve başkenti (3. Madde)", "Milletvekili seçimlerinin beş yılda bir yapılması kuralı", "Başkentin Ankara olduğu kuralı"], "correctIndex": 3}'::jsonb,
  '1982 Anayasası''nın 4. maddesi ile korunan değiştirilemez hükümler sadece ilk 3 maddedir (Devletin şekli cumhuriyettir; demokratik, laik, sosyal hukuk devletidir; dili Türkçe, başkenti Ankara, marşı İstiklal Marşı, bayrağı ay yıldızlı al bayraktır). Seçim dönemleri (m. 77) değiştirilemez maddeler arasında değildir.',
  'İlk 3 madde değiştirilemez; 4. madde ise bunların değiştirilemeyeceğini emreden koruyucu maddedir.',
  1
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
  distractor_trap,
  order_index
) values (
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  'multiple_choice',
  1,
  'Türk anayasa tarihinde yürürlüğe girmiş olan ilk yazılı anayasa aşağıdakilerden hangisidir?',
  '{"options": ["Sened-i İttifak (1808)", "Tanzimat Fermanı (1839)", "Kanun-i Esasi (1876)", "Teşkilat-ı Esasiye Kanunu (1921)", "1924 Anayasası"], "correctIndex": 2}'::jsonb,
  'Türk tarihinin ilk yazılı anayasası II. Abdülhamit döneminde 1876 yılında ilan edilen Kanun-i Esasi''dir. Sened-i İttifak bir sözleşme, Tanzimat Fermanı ise padişahın tek taraflı irade beyanıdır; anayasa değildirler.',
  'Sened-i İttifak ilk anayasal belge olsa da ilk ANAYASA 1876 Kanun-i Esasi''dir.',
  2
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
  distractor_trap,
  order_index
) values (
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  'multiple_choice',
  1,
  'Türk anayasa tarihinde ''tek yumuşak'' ve ''tek çerçeve'' anayasa olma özelliğine sahip olan anayasa aşağıdakilerden hangisidir?',
  '{"options": ["1876 Kanun-i Esasi", "1921 Teşkilat-ı Esasiye Kanunu", "1924 Anayasası", "1961 Anayasası", "1982 Anayasası"], "correctIndex": 1}'::jsonb,
  '1921 Anayasası sadece 23 madde ve 1 ek maddeden oluşan kısa ve öz bir metindir (çerçeve anayasa). Değiştirilmesi için nitelikli bir çoğunluk öngörülmediği ve adi kanunlar gibi değiştirilebildiği için Türk anayasa tarihinin TEK YUMUŞAK anayasasıdır.',
  'Diğer tüm anayasalarımız (1876, 1924, 1961, 1982) hem SERT (katı) hem de KAZUİSTİK (ayrıntıcı) anayasalardır.',
  3
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
  distractor_trap,
  order_index
) values (
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  'multiple_choice',
  1,
  'Türkiye''de kadınlara seçme ve seçilme haklarının tanınma süreci değerlendirildiğinde, kadınlara ''milletvekili seçme ve seçilme hakkı'' hangi yılda verilmiştir?',
  '{"options": ["1926", "1930", "1933", "1934", "1937"], "correctIndex": 3}'::jsonb,
  'Kadınlara siyasi haklar ''034 BMW'' şifresiyle sırasıyla verilmiştir: 1930''da Belediye seçimleri, 1933''te Muhtarlık seçimleri, 1934''te ise Milletvekili seçme ve seçilme hakkı tanınmıştır.',
  '1930 Belediye, 1933 Muhtar, 1934 Milletvekilidir. 1926''da kabul edilen Medeni Kanun ile siyasi haklar DEĞİL, sadece medeni (sosyal/ekonomik) haklar verilmiştir.',
  4
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
  distractor_trap,
  order_index
) values (
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  'multiple_choice',
  1,
  'Atatürk ilkeleri (Cumhuriyetçilik, Milliyetçilik, Halkçılık, Devletçilik, Laiklik, İnkılapçılık) hangi yılda anayasaya dahil edilmiştir?',
  '{"options": ["1924", "1928", "1934", "1937", "1961"], "correctIndex": 3}'::jsonb,
  'Atatürk''ün altı temel ilkesi 5 Şubat 1937 tarihinde 1924 Anayasası''nda yapılan bir anayasa değişikliği ile anayasa metnine girmiştir.',
  '1928''de ''Devletin dini İslam''dır'' ibaresi anayasadan çıkarılmış; 1937''de ise 6 Atatürk ilkesi anayasaya eklenmiştir.',
  5
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
  distractor_trap,
  order_index
) values (
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  'multiple_choice',
  1,
  'Türkiye''de seçimlerin yargısal denetimini sağlayan, seçimlerin başlamasından bitimine kadar dürüstlükle yönetimini yürüten ve seçim uyuşmazlıkları hakkında kesin karar veren yüksek kurul hangisidir?',
  '{"options": ["Anayasa Mahkemesi (AYM)", "Yüksek Seçim Kurulu (YSK)", "Danıştay", "Hakimler ve Savcılar Kurulu (HSK)", "Sayıştay"], "correctIndex": 1}'::jsonb,
  'Anayasa m. 79 uyarınca seçimlerin genel yönetim ve denetimi Yüksek Seçim Kurulu (YSK) tarafından yürütülür. YSK kararları kesindir; aleyhine Anayasa Mahkemesi dahil başka hiçbir yargı merciine başvurulamaz.',
  'YSK kararları aleyhine Anayasa Mahkemesi''ne dahi bireysel başvuru veya itiraz yapılamaz!',
  6
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
  distractor_trap,
  order_index
) values (
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  'multiple_choice',
  1,
  'Türkiye''de çok partili hayata geçildikten sonra ''gizli oy, açık sayım ve döküm'' esasına göre yapılan ilk demokratik genel seçim hangi yılda gerçekleştirilmiştir?',
  '{"options": ["1923", "1946", "1950", "1961", "1982"], "correctIndex": 2}'::jsonb,
  '1946 seçimleri ilk çok partili seçimdir ancak ''açık oy, gizli tasnif'' şaibesiyle yapılmıştır. Gerçek anlamda demokratik olan ''gizli oy, açık tasnif'' ilkesi ilk kez 1950 seçimlerinde uygulanmış ve ''Beyaz İhtilal'' olarak anılmıştır.',
  '1946 ilk çok partili seçimdir (açık oy - gizli sayım); 1950 ise ilk gizli oy - açık sayım uygulanan demokratik seçimdir.',
  7
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
  distractor_trap,
  order_index
) values (
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  'multiple_choice',
  1,
  'Türkiye Cumhuriyeti''nin hükümet sistemi 2017 Anayasa Değişikliği ile hangi sisteme evrilmiştir?',
  '{"options": ["Meclis Hükümeti Sistemi", "Klasik Parlamenter Sistem", "Yarı Başkanlık Sistemi", "Cumhurbaşkanlığı Hükümet Sistemi", "Mutlak Monarşi"], "correctIndex": 3}'::jsonb,
  '2017 anayasa değişikliği ile Başbakanlık ve Bakanlar Kurulu kaldırılmış; yürütme yetkisi tek başına halk tarafından seçilen Cumhurbaşkanına verilerek ''Cumhurbaşkanlığı Hükümet Sistemi''ne geçilmiştir.',
  'Başbakanlık makamı 2017 referandumuyla kaldırılmış, 2018 seçimleriyle fiilen sona ermiştir.',
  8
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
  distractor_trap,
  order_index
) values (
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  'multiple_choice',
  1,
  'Devletin tek bir merkezden yönetildiği, tek bir anayasanın, tek bir yasama meclisinin ve tek bir yargı düzeninin bulunduğu devlet şekline ne ad verilir?',
  '{"options": ["Federal Devlet", "Konfederasyon", "Üniter Devlet", "Bölgeli Devlet", "Feodal Devlet"], "correctIndex": 2}'::jsonb,
  'Üniter devlet; ülke sınırları içinde tek bir egemenliğin, tek bir parlamentonun, tek bir hükümetin ve tek bir hukuk sisteminin geçerli olduğu devlettir (Türkiye Cumhuriyeti tipik bir üniter devlettir).',
  'Federal devlette federe devletlerin kendi anayasası ve meclisi vardır; üniter devlette ise tek merkez ve tek anayasa vardır.',
  9
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
  distractor_trap,
  order_index
) values (
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  'multiple_choice',
  1,
  'Anayasa Mahkemesi (AYM) ve Devlet Planlama Teşkilatı (DPT) ilk kez hangi anayasamız ile Türk hukuk sistemine girmiştir?',
  '{"options": ["1876 Kanun-i Esasi", "1921 Teşkilat-ı Esasiye", "1924 Anayasası", "1961 Anayasası", "1982 Anayasası"], "correctIndex": 3}'::jsonb,
  'Kanunların anayasaya uygunluğunu denetlemek üzere Anayasa Mahkemesi ve sosyal-ekonomik kalkınmayı planlamak üzere DPT ilk kez 1961 Anayasası ile kurulmuştur.',
  'AYM 1982''de değil, 1961 Anayasası ile kurulmuştur.',
  10
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
  distractor_trap,
  order_index
) values (
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  'multiple_choice',
  2,
  '1982 Anayasası''na göre anayasa değişikliklerinin Türkiye Büyük Millet Meclisi Genel Kurulu''nda kabul edilebilmesi için en az kaç milletvekilinin kabul oyu gereklidir?',
  '{"options": ["Üye tamsayısının salt çoğunluğu (301)", "Üye tamsayısının beşte biri (120)", "Üye tamsayısının üçte biri (200)", "Üye tamsayısının beşte üçü (360)", "Üye tamsayısının üçte ikisi (400)"], "correctIndex": 3}'::jsonb,
  'Anayasa m. 175 uyarınca bir anayasa değişikliği teklifinin kabul edilebilmesi için en az üye tamsayısının beşte üçünün (3/5 = 360 milletvekili) gizli oyu şarttır. 360''ın altındaki oylarda teklif doğrudan reddedilmiş sayılır.',
  'Teklif için 1/3 (200 vekil) gerekir; KABUL için en az 3/5 (360 vekil) şarttır!',
  11
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
  distractor_trap,
  order_index
) values (
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  'multiple_choice',
  2,
  'TBMM Genel Kurulu''nda kabul edilen bir Anayasa değişikliği kanunu 360 ile 399 arasında (üye tamsayısının 3/5''i ile 2/3''ü arasında) bir oyla kabul edilmişse, Cumhurbaşkanı''nın bu kanun karşısındaki tutumu nasıl olmalıdır?',
  '{"options": ["Kanunu Resmî Gazete''de yayımlayarak doğrudan yürürlüğe koyabilir.", "Kanunu ya TBMM''ye geri göndermek ya da halkoyuna (zorunlu referanduma) sunmak zorundadır; doğrudan onaylayamaz.", "Kanunu doğrudan Anayasa Mahkemesi''ne iptal davası açarak iptal ettirir.", "Kanunu tamamen çöpe atar, hükümsüz sayar.", "Kanunu Danıştay''ın onayına sunar."], "correctIndex": 1}'::jsonb,
  'Anayasa değişikliği 3/5 ile 2/3 arasında (360-399 arası) kalırsa Cumhurbaşkanı kanunu DOĞRUDAN ONAYLAYIP yürürlüğe sokamaz. Ya Meclis''e geri gönderir, ya da ZORUNLU olarak halkoylamasına (referanduma) götürür.',
  'Cumhurbaşkanı 400 ve üzeri (2/3) oyla gelen değişikliği doğrudan onaylayabilir; ancak 360-399 arasındaki değişikliği referanduma götürmeden onaylayamaz!',
  12
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
  distractor_trap,
  order_index
) values (
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  'multiple_choice',
  2,
  'TBMM''de anayasa değişikliklerinin görüşülmesi sürecinde, meclis komisyonu ve genel kurulunda aceleye getirmeyi önlemek amacıyla uygulanan ''iki görüşme arasındaki asgari bekleme süresi'' (serinleme süresi) ne kadardır?',
  '{"options": ["24 saat", "48 saat", "7 gün", "15 gün", "30 gün"], "correctIndex": 1}'::jsonb,
  'Anayasa değişiklik teklifleri Genel Kurul''da iki defa görüşülür. İki görüşme arasında en az 48 saatlik bir sürenin geçmesi zorunludur. Bu süreye doktrinde ''serinleme süresi'' denir.',
  'Anayasa değişikliği ivedilikle görüşülemez ve iki görüşme arasında en az 48 saat beklenmesi anayasal zorunluluktur.',
  13
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
  distractor_trap,
  order_index
) values (
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  'multiple_choice',
  2,
  '1982 Anayasası''nda yer alan ''Sosyal Devlet'' ilkesi aşağıdakilerden hangisini amaçlar?',
  '{"options": ["Bütün özel mülkiyeti kamulaştırarak komünist bir düzen kurmayı", "Toplumdaki gelir dağılımı adaletsizliklerini azaltmayı, ekonomik olarak güçsüzleri ve dezavantajlı grupları koruyarak herkese insan onuruna yaraşır asgari bir yaşam standardı sağlamayı", "Yalnızca varlıklı sermaye sahiplerine vergi muafiyeti tanımayı", "Mahkemelerin bağımsızlığını kaldırıp yürütmeye bağlamayı", "Seçimlerde sadece belirli bir zümrenin oy kullanabilmesini sağlamayı"], "correctIndex": 1}'::jsonb,
  'Sosyal devlet; vatandaşlarına sosyal güvenlik sağlayan, fırsat eşitliği yaratan, gelirin adil dağıtılması için kamusal eğitim, sağlık ve sosyal yardımları üstlenen, zayıfı güçlüye ezdirmeyen çağdaş devlet anlayışıdır.',
  'Sosyal devlet özel mülkiyeti yok etmez; serbest piyasa içinde sosyal adaleti ve asgari refahı sağlar.',
  14
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
  distractor_trap,
  order_index
) values (
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  'multiple_choice',
  2,
  'Aşağıdakilerden hangisi bir devletin ''Hukuk Devleti'' olduğunun kanıtı olan temel göstergelerden biri değildir?',
  '{"options": ["Yasaların ve anayasanın üstünlüğü ilkesi", "Yargı bağımsızlığı ve yargıç güvencesi", "İdarenin her türlü eylem ve işlemine karşı yargı yolunun açık olması", "Devlet başkanının veya yürütme organının yargı kararlarını dilediği gibi iptal edebilme yetkisi", "Temel hak ve hürriyetlerin anayasal güvence altına alınması"], "correctIndex": 3}'::jsonb,
  'Hukuk devletinde hiçbir organ veya makam mahkeme kararlarını değiştiremez, iptal edemez veya uygulanmasını geciktiremez (Anayasa m. 138). Yasama ve yürütme yargı kararlarına uymak zorundadır.',
  'Yürütmenin yargı kararını iptal etmesi otoriterliktir; hukuk devletinde yargı kararı yürütmeyi bağlar.',
  15
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
  distractor_trap,
  order_index
) values (
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  'multiple_choice',
  2,
  'Yüksek Seçim Kurulu''nun (YSK) üye yapısı ve çalışma esasları değerlendirildiğinde aşağıdakilerden hangisi yanlıştır?',
  '{"options": ["YSK toplam 11 üyeden (7 asıl, 4 yedek) oluşur.", "Üyelerinin bir kısmı Yargıtay Genel Kurulu, bir kısmı Danıştay Genel Kurulu tarafından kendi üyeleri arasından gizli oyla seçilir.", "YSK üyelerinin görev süresi 6 yıldır.", "YSK kararlarına karşı Anayasa Mahkemesi''ne bireysel başvuru yapılabilir.", "YSK seçim sonuçlarını kesin olarak ilan eden ve mazbata düzenleyen en üst seçim organıdır."], "correctIndex": 3}'::jsonb,
  'Anayasa m. 79 uyarınca YSK''nın verdiği kararlar kesindir ve bu kararlar aleyhine hiçbir yargı merciine (Anayasa Mahkemesi dahil) başvurulamaz.',
  'YSK kararları Anayasa Mahkemesi denetimine ve bireysel başvuruya tamamen kapalıdır.',
  16
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
  distractor_trap,
  order_index
) values (
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  'multiple_choice',
  2,
  'Aşağıdakilerden hangisi Türk anayasa tarihinde ''çift meclisli'' (iki kamaralı parlamento) yapıya sahip olan anayasalardır?',
  '{"options": ["Yalnızca 1876 Kanun-i Esasi", "1876 Kanun-i Esasi ve 1961 Anayasası", "1921 Teşkilat-ı Esasiye ve 1924 Anayasası", "1961 ve 1982 Anayasaları", "Yalnızca 1982 Anayasası"], "correctIndex": 1}'::jsonb,
  'Tarihimizde yalnızca iki anayasada çift meclis uygulanmıştır: 1) 1876 Kanun-i Esasi (Heyet-i Ayan ve Heyet-i Mebusan), 2) 1961 Anayasası (Millet Meclisi ve Cumhuriyet Senatosu). 1921, 1924 ve 1982 anayasaları tek meclislidir.',
  '1982 Anayasası ile Cumhuriyet Senatosu kaldırılmış ve tek meclise (TBMM) geri dönülmüştür.',
  17
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
  distractor_trap,
  order_index
) values (
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  'multiple_choice',
  2,
  'Halkın belirli aralıklarla seçtiği temsilciler aracılığıyla devlet yönetiminde söz sahibi olduğu, ancak halkoylaması (referandum) gibi araçlarla halkın doğrudan karar alma sürecine de katılabildiği demokrasi tipi hangisidir?',
  '{"options": ["Doğrudan Demokrasi", "Temsili Demokrasi", "Yarı Doğrudan Demokrasi", "Otokratik Demokrasi", "Plütokratik Demokrasi"], "correctIndex": 2}'::jsonb,
  'Yarı doğrudan demokrasi; temsilcilerin seçildiği ancak halkın referandum, halk vetosu, halk girişimi ve temsilcileri geri çağırma gibi araçlarla kararlara doğrudan müdahale edebildiği sistemdir. Türkiye''de temsili demokrasi esastır ancak referandum kurumuyla yarı doğrudan ögeler taşır.',
  'Yarı doğrudan demokrasinin araçları: Referandum, Halk Girişimi, Halk Vetosu ve Temsilcilerin Geri Çağrılmasıdır.',
  18
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
  distractor_trap,
  order_index
) values (
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  'multiple_choice',
  2,
  '1982 Anayasası''nın ilk halinde yer alan ve 2017 anayasa değişikliği ile kaldırılan kurum ve kavramlar arasında aşağıdakilerden hangisi yer almaz?',
  '{"options": ["Başbakanlık ve Bakanlar Kurulu", "Askeri Yargıtay ve Askeri Yüksek İdare Mahkemesi (AYİM)", "Sıkıyönetim rejimi", "Devlet Güvenlik Mahkemeleri (DGM)", "Yüksek Seçim Kurulu (YSK)"], "correctIndex": 4}'::jsonb,
  'Başbakanlık, Bakanlar Kurulu, Askeri Yargı (disiplin mahkemeleri hariç) ve Sıkıyönetim 2017 anayasa değişikliği ile tamamen kaldırılmıştır (DGM ise 2004''te kaldırılmıştı). Ancak Yüksek Seçim Kurulu (YSK) dimdik ayaktadır ve anayasal görevini sürdürmektedir.',
  'Sıkıyönetim 2017''de kaldırılmıştır, artık sadece OHAL (Olağanüstü Hal) vardır. YSK ise hiçbir zaman kaldırılmamıştır.',
  19
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
  distractor_trap,
  order_index
) values (
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  'multiple_choice',
  2,
  '1982 Anayasası''na göre genel seçimler kaç yılda bir ve hangi meclis/makam için birlikte yapılır?',
  '{"options": ["4 yılda bir sadece TBMM için", "5 yılda bir TBMM ve Cumhurbaşkanlığı seçimleri aynı gün birlikte yapılır", "5 yılda bir TBMM ve yerel yönetimler birlikte", "6 yılda bir Cumhurbaşkanı, 4 yılda bir TBMM", "3 yılda bir güvenoyu ile"], "correctIndex": 1}'::jsonb,
  'Anayasa m. 77 uyarınca TBMM ve Cumhurbaşkanlığı seçimleri 5 yılda bir aynı gün birlikte yapılır.',
  'Seçimler 5 yılda birdir ve TBMM ile Cumhurbaşkanlığı seçimi ayrılmaz bir ikili olarak aynı gün sandığa gider.',
  20
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
  distractor_trap,
  order_index
) values (
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  'multiple_choice',
  2,
  '1982 Anayasası''nda yer alan laiklik ilkesinin gerekleri değerlendirildiğinde aşağıdakilerden hangisi laiklik anlayışıyla bağdaşmaz?',
  '{"options": ["Devletin resmi bir dininin bulunmaması", "Devletin bütün din ve inanç mensuplarına karşı eşit ve tarafsız mesafede durması", "Din ve vicdan hürriyetinin anayasal koruma altında olması", "Kanunların din kurallarına uygunluğunun dini otoritelerce onaylanması zorunluluğu", "Dini inanç ve ibadetlerin kamu düzenini bozacak şekilde kötüye kullanılmasının önlenmesi"], "correctIndex": 3}'::jsonb,
  'Laik devlette yasama organı kanun yaparken din kurallarına değil, aklın ve bilimin rehberliğine ve anayasaya bakar. Kanunların dini kurallara uygunluğunun denetlenmesi teokratik devletlerin özelliğidir.',
  'Laiklikte din devletten, devlet de dinden bağımsızdır; kanunlar din bilginlerine onaylatılamaz.',
  21
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
  distractor_trap,
  order_index
) values (
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  'multiple_choice',
  2,
  'Türkiye''de seçim ilkelerinden ''Eşit Oy'' ilkesi aşağıdakilerden hangisini zorunlu kılar?',
  '{"options": ["Kadın ve erkeklerin aynı sandıkta oy kullanmasını", "Toplumsal statüsü, cinsiyeti, eğitimi veya serveti ne olursa olsun her seçmenin yalnızca tek bir oy hakkına sahip olmasını", "Herkesin sandığa gitmesinin zorunlu olmasını", "Tüm siyasi partilerin eşit hazine yardımı almasını", "Milletvekili maaşlarının eşit olmasını"], "correctIndex": 1}'::jsonb,
  'Eşit oy; her seçmenin oyunun değerinin eşit olması ve bir seçmenin birden fazla oy kullanamaması (1 kişi = 1 oy) prensibidir.',
  'Genel oy herkesin oy kullanabilmesini ifade eder; Eşit oy ise herkesin oyunun sadece bir tane ve eşit ağırlıkta olmasını ifade eder.',
  22
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
  distractor_trap,
  order_index
) values (
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  'multiple_choice',
  2,
  '1982 Anayasası''nda yapılan 2017 anayasa değişikliği ile TBMM üye tamsayısı kaç milletvekiline çıkarılmıştır?',
  '{"options": ["450", "500", "550", "600", "650"], "correctIndex": 3}'::jsonb,
  '2017 anayasa değişikliğiyle Anayasa m. 75 değiştirilmiş ve TBMM üye tamsayısı 550''den 600 milletvekiline yükseltilmiştir.',
  'Eski sayı 550 idi; güncel sayı 600''dür! Salt çoğunluk (301), 3/5 çoğunluk (360) ve 2/3 çoğunluk (400) bu 600 vekil üzerinden hesaplanır.',
  23
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
  distractor_trap,
  order_index
) values (
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  'multiple_choice',
  2,
  '1924 Anayasası ile 1982 Anayasası arasındaki benzerlik ve farklar düşünüldüğünde aşağıdakilerden hangisi her iki anayasanın ortak özelliğidir?',
  '{"options": ["İkisinin de çift meclisli olması", "İkisinin de sert (katı) ve kazuistik olması", "İkisinde de Anayasa Mahkemesi''nin bulunması", "İkisinde de Meclis Hükümeti sisteminin uygulanması", "İkisinde de Başbakanlık makamının bulunmaması"], "correctIndex": 1}'::jsonb,
  '1924 ve 1982 anayasaları sert (değiştirilmesi zor, değiştirilemez maddeler içeren) ve kazuistik (ayrıntılı) anayasalardır. 1924''te AYM yoktu; 1982 tek meclislidir.',
  '1924 Anayasası''nda AYM yoktur! Kanunların anayasaya uygunluğunu meclisin kendisi denetlerdi.',
  24
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
  distractor_trap,
  order_index
) values (
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  'multiple_choice',
  2,
  '1982 Anayasası''na göre aşağıdakilerden hangisi siyasi partilerin kapatılması davasında nihai kararı veren yargı organıdır?',
  '{"options": ["Yargıtay Cumhuriyet Başsavcılığı", "Danıştay", "Anayasa Mahkemesi", "Uyuşmazlık Mahkemesi", "Yüksek Seçim Kurulu"], "correctIndex": 2}'::jsonb,
  'Siyasi partilerin kapatılması davası Yargıtay Cumhuriyet Başsavcısı tarafından açılır; ancak davayı inceleyip nihai kapatma veya hazine yardımından kısmen/tamamen yoksun bırakma kararını Anayasa Mahkemesi verir.',
  'Davayı açan = Yargıtay Cumhuriyet Başsavcısı; Kararı veren = Anayasa Mahkemesi!',
  25
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
  distractor_trap,
  order_index
) values (
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  'multiple_choice',
  2,
  'Anayasa Mahkemesi''nin bir siyasi partiyi temelli kapatabilmesi veya devlet yardımından yoksun bırakabilmesine karar verebilmesi için toplantıya katılan üyelerin en az ne kadarlık oy çokluğu şarttır?',
  '{"options": ["Salt çoğunluğu", "Üçte ikisi (2/3)", "Beşte üçü (3/5)", "Dörtte üçü (3/4)", "Oy birliği"], "correctIndex": 1}'::jsonb,
  'Anayasa m. 149 uyarınca Anayasa Mahkemesi''nce siyasi partilerin kapatılmasına veya devlet yardımından kısmen ya da tamamen yoksun bırakılmasına karar verilebilmesi için toplantıya katılan üyelerin üçte iki (2/3) oy çokluğu şarttır.',
  'Normal kararlarda salt çoğunluk yeterliyken, parti kapatma ve anayasa değişikliği iptalinde 2/3 nitelikli çoğunluk aranır.',
  26
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
  distractor_trap,
  order_index
) values (
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  'multiple_choice',
  2,
  '1982 Anayasası''na göre milletvekili seçilebilme yaşı yapılan anayasa değişikliği ile kaça indirilmiştir?',
  '{"options": ["18", "20", "21", "25", "30"], "correctIndex": 0}'::jsonb,
  'Milletvekili seçilme yaşı 1982''nin ilk halinde 30 idi; 2006''da 25''e indirildi; son olarak 2017 anayasa değişikliği ile 18 yaşını dolduran her Türk vatandaşına milletvekili seçilme hakkı tanındı.',
  'Milletvekili seçilme yaşı 18''dir. Cumhurbaşkanı seçilme yaşı ise 40''tır.',
  27
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
  distractor_trap,
  order_index
) values (
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  'multiple_choice',
  2,
  'Parlamenter sistem ile Başkanlık sistemi arasındaki temel farklar dikkate alındığında aşağıdakilerden hangisi yalnızca ''Başkanlık Sistemi''ne özgü bir kuraldır?',
  '{"options": ["Yürütmenin başı olan başkanın doğrudan halk tarafından seçilmesi ve yasama meclisine karşı siyasi sorumluluğunun (gensoru ile düşürülme) bulunmaması", "Bakanların milletvekilleri arasından seçilmesi zorunluluğu", "Devlet başkanının sembolik yetkilere sahip olması", "Hükümetin meclisten güvenoyu alma zorunluluğu", "Yasama ile yürütmenin iç içe geçmiş olması"], "correctIndex": 0}'::jsonb,
  'Başkanlık sisteminde sert kuvvetler ayrılığı vardır; başkan sabit bir süre için halk tarafından seçilir, kabinesini dışarıdan kurar, meclis başkanı güvensizlik oyuyla düşüremez, başkan da meclisi feshedemez.',
  'Güvenoyu ve gensoru parlamenter sisteme özgüdür; başkanlık sisteminde güvenoyu yoktur.',
  28
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
  distractor_trap,
  order_index
) values (
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  'multiple_choice',
  2,
  '1982 Anayasası''nda yer alan ''Atatürk Milliyetçiliği'' ilkesi etnik, ırki veya dini ayrımları reddeden birleştirici bir anlayışı benimser.

Buna göre Atatürk milliyetçiliğinin bu niteliği aşağıdakilerden hangisi ile adlandırılır?',
  '{"options": ["Sübjektif (Öznel) Milliyetçilik anlayışı", "Objektif (Irkçı) Milliyetçilik anlayışı", "Pan-Türkist Milliyetçilik", "Dinsel Milliyetçilik", "Totaliter Milliyetçilik"], "correctIndex": 0}'::jsonb,
  'Atatürk milliyetçiliği kafatası veya kan bağına (objektif ırka) değil; ortak kader, kültür ve birlikte yaşama arzusuna dayanan öznel (sübjektif) milliyetçiliktir (''Ne mutlu Türk''üm diyene'' sözü bunun ifadesidir).',
  'Atatürk milliyetçiliği ırkçı (objektif) değil; birleştirici, barışçı ve öznel (sübjektif) milliyetçiliktir.',
  29
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
  distractor_trap,
  order_index
) values (
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  'multiple_choice',
  2,
  'Aşağıdakilerden hangisi 1982 Anayasası''nın başlangıç ilkeleri ve genel esasları arasında güvence altına alınan ''İdarenin Kanuniliği'' ilkesinin bir sonucudur?',
  '{"options": ["İdarenin hiçbir kurala bağlı olmadan keyfi karar alabilmesi", "İdarenin görev ve yetkilerinin ancak kanunla düzenlenebilmesi ve idarenin kanuna dayanarak hareket etme zorunluluğu", "İdari işlemlerin mahkemelerce denetlenememesi", "Memurların kanunları değiştirebilme yetkisi", "Bakanlıkların yalnızca tüzüklerle kurulabilmesi"], "correctIndex": 1}'::jsonb,
  'İdarenin kanuniliği (m. 123); idarenin kuruluş ve görevleriyle bir bütün olduğunu ve kanunla düzenleneceğini, idari makamların kanunda açıkça yetki verilmedikçe hiçbir işlem yapamayacağını ifade eder.',
  'İdare kendi başına yetki üretemez; yetkisini mutlaka bir anayasa veya kanun normundan almak zorundadır.',
  30
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
  distractor_trap,
  order_index
) values (
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  'multiple_choice',
  3,
  'Anayasa Mahkemesi bir Anayasa Değişikliği kanununu denetlerken aşağıdaki hususlardan hangisini KESİNLİKLE denetleyemez?',
  '{"options": ["Teklif çoğunluğuna (en az 200 milletvekili) uyulup uyulmadığını", "Görüşme sürecinde iki görüşme arasındaki 48 saatlik serinleme süresine uyulup uyulmadığını", "Oylamanın gizli yapılıp yapılmadığını ve karar yeter sayısına (en az 360) ulaşılıp ulaşılmadığını", "Anayasa değişikliğinin içeriğini ve esasa uygunluğunu", "Davanın kanunun yayımlanmasından itibaren 10 gün içinde açılıp açılmadığını"], "correctIndex": 3}'::jsonb,
  'Anayasa m. 148 uyarınca Anayasa Mahkemesi anayasa değişikliklerini YALNIZCA ŞEKİL bakımından denetleyebilir (teklif sayısı, oylama gizliliği, karar yeter sayısı vb.). Anayasa değişikliklerinin İÇERİĞİ (ESAS DENETİMİ) AYM''nin denetim yetkisi dışındadır; AYM esasa girerse yetki aşımı yapmış olur.',
  'Normal kanunlar hem şekil hem esas bakımından denetlenir; ANAYASA DEĞİŞİKLİKLERİ İSE SADECE ŞEKİL BAKIMINDAN DENETLENİR, ESAS DENETİMİ KESİNLİKLE YAPILAMAZ!',
  31
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
  distractor_trap,
  order_index
) values (
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  'multiple_choice',
  3,
  'Anayasa değişikliklerinin şekil bozukluğu gerekçesiyle iptali için Anayasa Mahkemesi''nde dava açma hakkı sadece kimlere tanınmıştır ve dava açma süresi ne kadardır?',
  '{"options": ["TBMM Başkanı veya 100 milletvekili — 30 gün", "Cumhurbaşkanı veya TBMM üye tamsayısının en az beşte biri (120 milletvekili) — Resmî Gazete''de yayımlandığı tarihten itibaren 10 gün", "Yalnızca ana muhalefet partisi — 60 gün", "Herhangi bir siyasi parti grubu — 15 gün", "Adalet Bakanı — 7 gün"], "correctIndex": 1}'::jsonb,
  'Anayasa m. 148 uyarınca anayasa değişikliklerinin şekil yönünden iptali davası sadece Cumhurbaşkanı veya TBMM üye tamsayısının 1/5''i (120 vekil) tarafından açılabilir. Dava açma süresi yayımdan itibaren yalnızca 10 GÜNDÜR.',
  'Normal kanunlarda dava süresi 60 gündür; Anayasa değişikliklerinde şekil davası süresi İSE YALNIZCA 10 GÜNDÜR!',
  32
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
  distractor_trap,
  order_index
) values (
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  'multiple_choice',
  3,
  '1982 Anayasası''nda yer alan ''Tabii Hakim (Kanuni Hakim) Güvencesi'' ilkesi aşağıdakilerden hangisini mutlak surette yasaklar?',
  '{"options": ["Hâkimlerin meslekten ihraç edilmesini", "Bir kimsenin suç oluşturan fiilinden sonra, sırf o fiili veya o kişiyi yargılamak üzere sonradan özel bir mahkeme kurulmasını (olağanüstü yargı mercileri oluşturulmasını)", "Hâkimlerin karar verirken anayasaya uymasını", "Duruşmaların halka açık yapılmasını", "Yargıtay üyelerinin seçimini"], "correctIndex": 1}'::jsonb,
  'Tabii hâkim ilkesi (Anayasa m. 37); bir kimsenin kanunen tabi olduğu mahkemeden başka bir merci önüne çıkarılamayacağını, olaydan sonra kişiye veya olaya özel mahkeme kurulamayacağını ifade eder (örn. İstiklal Mahkemeleri ve Yassıada Mahkemesi gibi olağanüstü mahkemeler yasaktır).',
  'Tabii hakim = Suçun işlendiği anda o suça bakmakla görevli ve yetkili mahkemenin kanunla önceden belli olmasıdır.',
  33
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
  distractor_trap,
  order_index
) values (
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  'multiple_choice',
  3,
  'Aşağıdakilerden hangisi 1982 Anayasası''na göre seçimlerde oy kullanma hakkına sahip olanlar (oy kullanabilenler) arasında yer alır?',
  '{"options": ["Silah altında bulunan er ve erbaşlar", "Askeri öğrenciler", "Ceza infaz kurumlarında bulunan taksirli suçlardan hüküm giyenler", "Ceza infaz kurumlarında bulunan kasıtlı suçlardan hüküm giyenler", "18 yaşını doldurmamış ergin olmayanlar"], "correctIndex": 2}'::jsonb,
  'Anayasa m. 67''ye göre: Er ve erbaşlar, askeri öğrenciler ve cezaevinde bulunan kasıtlı suç hükümlüleri oy kullanamaz. Ancak cezaevinde bulunan TUTUKLULAR ve TAKSİRLİ (dikkatsizlik/tedbirsizlik sonucu) suçlardan hüküm giyenler OY KULLANABİLİR.',
  'Kasıtlı suçtan hükümlü oy kullanamaz; ama TAKSİRLİ suçtan hükümlü cezaevinde olsa bile oy kullanabilir! Bu ayrım ÖSYM''nin tuzak noktasıdır.',
  34
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
  distractor_trap,
  order_index
) values (
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  'multiple_choice',
  3,
  '1982 Anayasası''nın kabul edildiği orijinal hali ile 1961 Anayasası karşılaştırıldığında, 1982 Anayasası''nın ''rasyonelleştirilmiş parlamentarizm'' anlayışıyla getirdiği temel eğilim aşağıdakilerden hangisidir?',
  '{"options": ["Yasama organını güçlendirip yürütmeyi zayıflatmak", "Cumhurbaşkanının yetkilerini kısıtlamak", "Hükümet istikrarsızlıklarını önlemek amacıyla yürütme organını (özellikle Cumhurbaşkanını) güçlendirip meclis içi tıkanıklıkları aşacak mekanizmalar kurmak", "Yargı organını meclisin doğrudan denetimine sokmak", "Seçim barajını tamamen sıfıra indirmek"], "correctIndex": 2}'::jsonb,
  '1982 Anayasası 1970''lerdeki koalisyon krizlerini, cumhurbaşkanının aylarca seçilemeyişini ve hükümet tıkanıklıklarını aşmak için ''rasyonelleştirilmiş parlamentarizm'' adıyla yürütmeyi güçlendirmiş, Cumhurbaşkanına meclisi fesih yetkisi ve geniş icrai yetkiler tanımıştır.',
  '1961 Anayasası temel hak ve meclis ağırlıklıdır; 1982 Anayasası ise yürütmeyi ve devlet otoritesini tahkim etmiştir.',
  35
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
  distractor_trap,
  order_index
) values (
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  'multiple_choice',
  3,
  'Anayasa''nın 2. maddesinde yer alan ''İnsan haklarına saygılı devlet'' ifadesi ile ilgili olarak aşağıdakilerden hangisi doğrudur?',
  '{"options": ["1961 Anayasası''nda da birebir ''insan haklarına saygılı'' ibaresi kullanılmıştır.", "1961 Anayasası''nda ''insan haklarına DAYANAN devlet'' ifadesi yer alırken, 1982 Anayasası bunu ''insan haklarına SAYGILI devlet'' olarak değiştirip felsefi vurguyu yumuşatmıştır.", "Bu ibare 2017 anayasa değişikliği ile anayasadan tamamen çıkarılmıştır.", "Bu ilke sadece Türk vatandaşları için geçerlidir, yabancıları kapsamaz.", "1924 Anayasası''nın ilk halinde de yer almıştır."], "correctIndex": 1}'::jsonb,
  '1961 Anayasası ''insan haklarına dayanan'' (insan haklarını devletin kurucu temeli sayan) kavramını kullanmıştı. 1982 Anayasası''nı hazırlayan Milli Güvenlik Konseyi devleti önceleyerek bu ifadeyi ''insan haklarına saygılı'' olarak değiştirmiştir.',
  '1961 = Dayanan; 1982 = Saygılı! Bu kelime farkı anayasa hukuku sınavlarının en meşhur ince ayrıntısıdır.',
  36
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
  distractor_trap,
  order_index
) values (
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  'multiple_choice',
  3,
  'Siyasi partilere devlet tarafından yapılacak mali yardımın (Hazine Yardımı) anayasal kuralı değerlendirildiğinde aşağıdakilerden hangisi doğrudur?',
  '{"options": ["Her kurulan siyasi parti üye sayısına bakılmaksızın eşit hazine yardımı alır.", "Yalnızca iktidarda bulunan parti hazine yardımı alabilir.", "En son yapılan genel seçimlerde geçerli oyların en az yüzde üçünü (%3) alan siyasi partilere devletçe hazine yardımı yapılır.", "Hazine yardımı alabilmek için TBMM''de en az 100 milletvekiline sahip olmak şarttır.", "Hazine yardımı sadece yerel seçim dönemlerinde verilir."], "correctIndex": 2}'::jsonb,
  'Siyasi Partiler Kanunu uyarınca genel seçimlerde barajı geçemese dahi geçerli oyların en az %3''ünü alan siyasi partilere aldıkları oy oranına göre devlet bütçesinden Hazine Yardımı ödenir.',
  'Seçim barajı (parlamentoya girme barajı) %7''ye indirilmiştir; ancak Hazine yardımı alma barajı %3''tür!',
  37
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
  distractor_trap,
  order_index
) values (
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  'multiple_choice',
  3,
  'Aşağıdakilerden hangisi 1982 Anayasası''na göre ''Seçimlerin Geriye Bırakılması'' (Ertelenmesi) hususunda doğru bir bilgidir?',
  '{"options": ["Ağır ekonomik kriz veya deprem gibi doğal afetler sebebiyle Cumhurbaşkanı kararıyla 1 yıl ertelenebilir.", "Yalnızca SAVAŞ sebebiyle ve yalnızca TBMM kararıyla seçimler 1 yıl süreyle geriye bırakılabilir.", "Seçimlerin ertelenmesine sadece Anayasa Mahkemesi karar verebilir.", "Seçimler salgın hastalık sebebiyle YSK tarafından 2 yıl ertelenebilir.", "Seçimler hiçbir koşulda asla ertelenemez."], "correctIndex": 1}'::jsonb,
  'Anayasa m. 78''e göre: Seçimlerin ertelenmesinin TEK BİR SEBEBİ vardır, o da SAVAŞTIR. Deprem, salgın veya kriz sebebiyle seçim ertelenemez. Kararı YALNIZCA TBMM verebilir ve erteleme süresi 1 yıldır (savaş devam ederse tekrar uzatılabilir).',
  'Deprem veya afet seçim erteleme sebebi DEĞİLDİR! Tek anayasal erteleme sebebi SAVAŞ''tır ve kararı sadece TBMM verir.',
  38
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
  distractor_trap,
  order_index
) values (
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  'multiple_choice',
  3,
  'TBMM ara seçimleri ile ilgili anayasal hükümler değerlendirildiğinde aşağıdakilerden hangisi yanlıştır?',
  '{"options": ["Bir yasama döneminde kural olarak yalnızca bir defa ara seçim yapılabilir.", "Genel seçimden 30 ay geçmedikçe ara seçime gidilemez.", "Genel seçimlere 1 yıl kala hiçbir şekilde ara seçim yapılamaz.", "TBMM üye tamsayısının yüzde beşlik (%5 = 30 milletvekili) kısmı boşalırsa ara seçim yapılmasına 3 ay içinde karar verilmesi zorunludur.", "Bir ilin veya seçim çevresinin TBMM''de hiç üyesinin kalmaması halinde dahi genel seçime 1 yıl kala ara seçim yapılamaz."], "correctIndex": 4}'::jsonb,
  'Normalde genel seçime 1 yıl kala ara seçim yapılamaz. Ancak istisnası vardır: Bir ilin veya seçim çevresinin mecliste hiç milletvekili kalmazsa (Siirt örneği), genel seçime 1 yıl kalmış olsa bile boşalmayı takip eden 90 günden sonraki ilk pazar günü zorunlu olarak ara seçim yapılır.',
  'Bir ilin hiç vekili kalmaması ''1 yıl kala seçim yapılamaz'' yasağını delen tek istisnadır.',
  39
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
  distractor_trap,
  order_index
) values (
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  'multiple_choice',
  3,
  'Anayasa Mahkemesi''nin denetim yetkisi düşünüldüğünde, aşağıdakilerden hangisi Anayasa Mahkemesi tarafından anayasaya uygunluk denetimine tabi TUTULAMAZ?',
  '{"options": ["Olağan dönem Cumhurbaşkanlığı Kararnameleri", "Olağanüstü Hal (OHAL) Cumhurbaşkanlığı Kararnameleri", "TBMM İçtüzüğü", "Kanunlar", "Anayasa değişiklikleri (şekil bakımından)"], "correctIndex": 1}'::jsonb,
  'Anayasa m. 148 açık hükmüdür: ''Olağanüstü hallerde çıkarılan Cumhurbaşkanlığı kararnamelerinin şekil ve esas bakımından Anayasaya aykırılığı iddiasıyla, Anayasa Mahkemesinde dava açılamaz.'' Olağan CBK''lar ise AYM denetimine tabidir.',
  'Olağan CBK yargı denetimine açıktır; OHAL CBK ise Anayasa Mahkemesi denetimine KESİNLİKLE KAPALIDIR.',
  40
);

-- Soru #41 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  'multiple_choice',
  2,
  'Türk anayasa tarihinde yürürlüğe girmiş anayasalar içinde değiştirilme usulü olağan kanunlarla aynı olan TEK YUMUŞAK ve maddeleri en kısa olan TEK ÇERÇEVE ANAYASA aşağıdakilerden hangisidir?',
  '{"options": ["1876 Kanun-i Esasi", "1921 Anayasası (Teşkilat-ı Esasiye)", "1924 Anayasası", "1961 Anayasası", "1982 Anayasası"], "correctIndex": 1}'::jsonb,
  '1921 Teşkilat-ı Esasiye Kanunu 23 ana maddeden oluşur; olağanüstü savaş koşullarında hazırlandığı için anayasa değiştirme usulüne ayrı bir zorluk getirmemiş (yumuşak anayasa) ve ayrıntılı düzenlemeler yerine temel ilkelere yer vermiştir (çerçeve anayasa). Diğer tüm anayasalarımız sert ve kazuistiktir.',
  'Türk anayasa tarihindeki TEK yumuşak ve TEK çerçeve anayasa 1921 Anayasası''dır!',
  41
);

-- Soru #42 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  'multiple_choice',
  2,
  '1876 Kanun-i Esasi''de yasama organı ''Meclis-i Umumi'' (Genel Meclis) adını taşımış ve iki kanatlı olarak kurulmuştur.

Bu mecliste üyeleri doğrudan padişah tarafından ömür boyu (kayd-ı hayat şartıyla) atanan meclis kanadı aşağıdakilerden hangisidir?',
  '{"options": ["Heyet-i Mebusan", "Heyet-i Ayan", "Meclis-i Vükela", "Şura-yı Devlet", "Encümen-i Daniş"], "correctIndex": 1}'::jsonb,
  'Kanun-i Esasi''de Heyet-i Mebusan üyeleri halk tarafından (çift dereceli seçimle) 4 yıllığına seçilir; HEYET-İ AYAN üyeleri ise 40 yaşını doldurmuş devlet adamları arasından bizzat Padişah tarafından ömür boyu görev yapmak üzere atanırdı.',
  'Halkın seçtiği = Heyet-i Mebusan; Padişahın ömür boyu atadığı = HEYET-İ AYAN''dır.',
  42
);

-- Soru #43 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  'multiple_choice',
  2,
  '1924 Teşkilat-ı Esasiye Kanunu''nda laikleşme ve demokratikleşme sürecinde yapılan anayasa değişikliklerinin kronolojik sırası aşağıdakilerden hangisinde doğru verilmiştir?',
  '{"options": ["''Devletin dini İslam''dır'' ibaresinin çıkarılması (1928) — Kadınlara milletvekili seçme-seçilme hakkı (1934) — Atatürk İlkeleri ve Laikliğin anayasaya girmesi (1937)", "Laikliğin girmesi (1928) — Kadınlara haklar (1930) — Devletin dini ibaresinin kalkması (1937)", "Kadınlara haklar (1934) — Devletin dini ibaresinin kalkması (1928) — Laiklik (1938)", "Devletin dini ibaresinin kalkması (1924) — Laiklik (1928) — Kadınlara haklar (1934)", "Laiklik (1937) — Devletin dini ibaresinin kalkması (1934) — Kadınlara haklar (1930)"], "correctIndex": 0}'::jsonb,
  '1924 Anayasası kronolojisi: 1) 1928''de ''Devletin dini İslam''dır'' maddesi ve yemin metnindeki dini ifadeler çıkarıldı. 2) 1934''te kadınlara milletvekili seçme-seçilme hakkı tanındı. 3) 1937''de 6 Atatürk ilkesi (ve Laiklik) anayasaya eklendi.',
  'ÖSYM bu üç tarihi sıkça sorar: Dini hükümlerin kalkması 1928, vekillik hakkı 1934, Laiklik ilkesinin anayasaya girmesi 1937''dir.',
  43
);

-- Soru #44 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  'multiple_choice',
  2,
  'Türk anayasa tarihinde İLK KEZ Anayasa Mahkemesi''nin kurulması, kanunların anayasaya uygunluğunun yargısal denetime tabi tutulması ve Yüksek Seçim Kurulu''nun anayasal bir organ olarak düzenlenmesi hangi anayasa ile gerçekleşmiştir?',
  '{"options": ["1921 Anayasası", "1924 Anayasası", "1961 Anayasası", "1982 Anayasası", "1876 Kanun-i Esasi"], "correctIndex": 2}'::jsonb,
  'Anayasa Mahkemesi (AYM), Milli Güvenlik Kurulu (MGK), Devlet Planlama Teşkilatı (DPT) ve Yüksek Seçim Kurulu (YSK) ilk kez 1961 ANAYASASI ile anayasal statüye kavuşmuştur.',
  'Anayasa Mahkemesi ve çoğulcu kurumlar 1982''de değil, 1961 Anayasası ile kurulmuştur.',
  44
);

-- Soru #45 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  'multiple_choice',
  2,
  '2022 yılında Milletvekili Seçimi Kanunu''nda yapılan değişiklikle, TBMM genel seçimlerinde bir siyasi partinin milletvekili çıkarabilmesi için ülke genelinde alması gereken SEÇİM BARAJI yüzde kaç olarak belirlenmiştir?',
  '{"options": ["%10", "%8", "%7", "%5", "%3"], "correctIndex": 2}'::jsonb,
  '1983''ten bu yana uygulanan yüzde 10''luk genel seçim barajı, 2022 yılında yapılan kanun değişikliği ile YÜZDE 7''ye (%7) indirilmiştir.',
  'Eski baraj %10 idi; güncel kanuni seçim barajı YÜZDE 7''dir (%7)!',
  45
);

-- Soru #46 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  'multiple_choice',
  2,
  'Seçimlerin genel yönetim ve yargısal denetimini yürüten Yüksek Seçim Kurulu''nun (YSK) üye yapısı ve kararlarının hukuki niteliği hakkında aşağıdakilerden hangisi doğrudur?',
  '{"options": ["YSK üyelerinin tamamını Cumhurbaşkanı atar.", "YSK kararlarına karşı Anayasa Mahkemesi''ne bireysel başvuru yapılabilir.", "YSK, 7 asıl ve 4 yedek (toplam 11) üyeden oluşur; 6 üyesi Yargıtay, 5 üyesi Danıştay tarafından seçilir ve kararları KESİNDİR, hiçbir yargı mercine başvurulamaz.", "YSK kararlarına karşı Danıştay''da iptal davası açılabilir.", "YSK üyeleri TBMM tarafından nitelikli çoğunlukla seçilir."], "correctIndex": 2}'::jsonb,
  'Anayasa m. 79 uyarınca YSK 7 asıl, 4 yedek üyeden oluşur (6 üye Yargıtay, 5 üye Danıştay Genel Kurulunca gizli oyla seçilir). YSK kararları kesindir; Anayasa Mahkemesi dahil hiçbir yargı yerine itiraz edilemez.',
  'YSK kararlarına karşı Anayasa Mahkemesi''ne veya Danıştay''a gidilemez; YSK kararları kesindir!',
  46
);

-- Soru #47 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  'multiple_choice',
  2,
  '1982 Anayasası''na göre Anayasa Değişikliği teklifinin TBMM Genel Kurulu''nda kabul edilebilmesi için EN AZ kaç milletvekilinin kabul oyu vermesi şarttır?',
  '{"options": ["200 (Üye tamsayısının 1/3''ü)", "301 (Üye tamsayısının salt çoğunluğu)", "360 (Üye tamsayısının 3/5''i)", "400 (Üye tamsayısının 2/3''ü)", "450 (Üye tamsayısının 3/4''ü)"], "correctIndex": 2}'::jsonb,
  'Anayasa m. 175''e göre teklif için en az 200 milletvekili (1/3); kabul için ise en az 360 MİLLETVEKİLİ (3/5 çoğunluk) şarttır. 360''ın altında kalan anayasa değişikliği teklifi reddedilmiş sayılır.',
  'Teklif için 200 (1/3); KABUL İÇİN ASGARİ ÇOĞUNLUK 360''tır (3/5)!',
  47
);

-- Soru #48 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  'multiple_choice',
  2,
  '1982 Anayasası''nın 176. maddesine göre Anayasa''nın ''Başlangıç'' kısmının ve madde kenar başlıklarının hukuki değeri hakkında aşağıdakilerden hangisi doğrudur?',
  '{"options": ["Başlangıç kısmı anayasa metnine dahil değildir, madde başlıkları dahildir.", "Başlangıç kısmı Anayasa metnine DAHİLDİR; madde kenar başlıkları ise sadece konuyu gösterir ve anayasa metninden SAYILMAZ.", "Hem başlangıç hem madde başlıkları anayasa metnine dahildir.", "Ne başlangıç ne de madde başlıkları anayasa metnine dahil değildir.", "Başlangıç kısmı sadece cumhurbaşkanı andında geçerlidir."], "correctIndex": 1}'::jsonb,
  'Anayasa m. 176: ''Anayasanın dayandığı temel görüş ve ilkeleri belirten başlangıç kısmı, Anayasa metnine dahildir. Madde kenar başlıkları, sadece ilgili oldukları maddelerin konusunu ve sırasını gösterir; Anayasa metninden sayılmaz.''',
  'Başlangıç = Metne DAHİL; Madde kenar başlıkları = Metne DAHİL DEĞİLDİR!',
  48
);

-- Soru #49 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  'multiple_choice',
  2,
  'Anayasa Mahkemesi bir Anayasa Değişikliği kanununu hangi açıdan ve hangi gerekçelerle denetleyebilir?',
  '{"options": ["Hem şekil hem esas bakımından sınırsız denetler.", "Yalnızca ŞEKİL bakımından denetler; teklif ve oylama çoğunluğu ile ivedilikle görüşülememe şartına uyulup uyulmadığını inceler; ESAS (içerik) incelemesi yapamaz.", "Yalnızca esas bakımından inceler, şekle bakamaz.", "Anayasa değişiklikleri hiçbir şekilde Anayasa Mahkemesi denetimine tabi tutulamaz.", "Sadece Cumhurbaşkanının talebi üzerine esas yönünden inceler."], "correctIndex": 1}'::jsonb,
  'Anayasa m. 148 açık kuralıdır: ''Anayasa değişiklikleri ise sadece teklif ve oylama çoğunluğu ve ivedilikle görüşülemeyeceği şartına uyulup uyulmadığı hususları ile sınırlı olarak (yani sadece ŞEKİL yönünden) denetlenebilir.'' AYM anayasa değişikliğinin içeriğine (esasına) ASLA giremez.',
  'Kanunlar hem şekil hem esas denetlenir; Anayasa değişiklikleri ise YALNIZCA ŞEKİL yönünden denetlenebilir, esasına bakılamaz!',
  49
);

-- Soru #50 (Zorluk: 2)
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  'Vatandaşlık',
  '1982 Anayasası ve Temel İlkeler',
  'multiple_choice',
  2,
  '2017 Anayasa Değişiklikleri ile Türk anayasa ve parlamento sisteminden tamamen KALDIRILAN kurum ve usuller arasında aşağıdakilerden hangisi YER ALMAZ?',
  '{"options": ["Bakanlar Kurulu ve Başbakanlık makamı", "Tüzükler ve Kanun Hükmünde Kararnameler (KHK)", "Gensoru ve Hükümet Güvenoyu denetim mekanizmaları", "Askeri Yargıtay ve Askeri Yüksek İdare Mahkemesi (AYİM)", "Milletvekillerinin kanun teklifi verme yetkisi"], "correctIndex": 4}'::jsonb,
  '2017 anayasa reformuyla Bakanlar Kurulu, Başbakanlık, Tasarı, Tüzük, KHK, Gensoru, Güvenoyu, Askeri Yargıtay ve AYİM kaldırılmıştır. Kanun TEKLİFİ verme yetkisi ise kaldırılmamış, tam aksine münhasıran yalnızca MİLLETVEKİLLERİNE bırakılmıştır (Cumhurbaşkanı sadece Bütçe kanun teklifi sunabilir).',
  'Hükümet tasarısı kalktı ama milletvekillerinin kanun teklifi verme hakkı devam ediyor; yürütme artık yasa teklif edemez.',
  50
);

COMMIT;
