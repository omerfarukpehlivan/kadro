-- =====================================================================
-- ÜNİTE 6: Atatürk İlke ve İnkılapları (40 Soru)
-- Kapsam: Atatürk'ün Hayatı, Eserleri, Siyasal/Hukuki/Eğitim/Toplumsal/Ekonomik
--         İnkılaplar, 6 İlke ve 1923-1938 Türk Dış Politikası
-- Şema: public.questions (lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap)
-- =====================================================================

-- Soru 1
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Mustafa Kemal''in askeri idadi (lise) yıllarında vatan ve hürriyet şairi Namık Kemal''in şiirleriyle tanıştığı, edebiyat öğretmeni Mehmet Asım Efendi''nin hitabetine katkı sağladığı ve tarih öğretmeni Kolağası Mehmet Tevfik Bey sayesinde tarih bilincinin geliştiği şehir aşağıdakilerden hangisidir?',
  '{"options": ["Selanik", "Manastır", "Sofya", "Şam", "İstanbul"], "correctIndex": 1}'::jsonb,
  'Mustafa Kemal, 1896-1899 yılları arasında Manastır Askeri İdadisi''nde öğrenim görmüştür. Bu dönemde tarih öğretmeni Kolağası Mehmet Tevfik Bey''den tarih sevgisi kazanmış, Namık Kemal ve Mehmet Emin Yurdakul''un eserleriyle milliyetçilik ve hürriyet duygularını pekiştirmiştir. Ayrıca bu okulda Ömer Naci vesilesiyle edebiyata ve hitabete ilgi duymuştur.',
  'Adayların birçoğu Mustafa Kemal''in doğup ilkokul ve rüştiye eğitimini aldığı ''Selanik'' şıkkına veya yükseköğrenimini tamamladığı ''İstanbul'' şıkkına yönelebilmektedir. Ancak askeri lise (idadi) eğitimi ve Kolağası Mehmet Tevfik Bey ile tanışması Manastır''dadır.'
);

-- Soru 2
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  1,
  'Mustafa Kemal, 1905 yılında Harp Akademisi''nden kurmay yüzbaşı rütbesiyle mezun olduktan sonra ilk görev yeri olan Şam''daki 5. Ordu''ya atanmıştır.

Mustafa Kemal''in Şam''da iken vatanın kurtuluşu ve hürriyet fikirlerini yaymak amacıyla kurduğu gizli cemiyet aşağıdakilerden hangisidir?',
  '{"options": ["İttihat ve Terakki Cemiyeti", "Vatan ve Hürriyet Cemiyeti", "Milli Kongre Cemiyeti", "Karakol Cemiyeti", "Hürriyet ve İtilaf Fırkası"], "correctIndex": 1}'::jsonb,
  'Mustafa Kemal, ilk görev yeri olan Şam 5. Ordu''da arkadaşlarıyla birlikte 1905 yılında ''Vatan ve Hürriyet Cemiyeti''ni kurmuştur. Daha sonra bu cemiyetin bir şubesini gizlice Selanik''te açmış, sonrasında ise İttihat ve Terakki Cemiyeti ile birleşmiştir.',
  'Mustafa Kemal daha sonra İttihat ve Terakki''ye üye olduğu için en güçlü çeldirici İttihat ve Terakki''dir. Ancak bizzat Şam''da kurduğu çekirdek teşkilat Vatan ve Hürriyet Cemiyeti''dir.'
);

-- Soru 3
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Mustafa Kemal Atatürk''ün 1919-1927 yılları arasındaki Milli Mücadele ve inkılap sürecini bizzat kaleme aldığı, ''1919 yılı Mayısının 19''uncu günü Samsun''a çıktım.'' cümlesiyle başlayıp ''Gençliğe Hitabe'' ile sona eren abidevi eseri aşağıdakilerden hangisidir?',
  '{"options": ["Medeni Bilgiler", "Nutuk (Söylev)", "Zabit ve Kumandan ile Hasbihal", "Geometri Kılavuzu", "Cumalı Ordugahı"], "correctIndex": 1}'::jsonb,
  'Nutuk, Mustafa Kemal Atatürk tarafından 1927 yılında CHP 2. Kurultayı''nda 6 gün boyunca (36,5 saat) okunmuş tarihi bir belgedir. 1919 Samsun''a çıkıştan 1927 yılına kadarki gelişmeleri kapsar ve telif hakkı Türk Hava Kurumu''na (Türk Tayyare Cemiyeti) bağışlanmıştır.',
  'Nutuk''un kapsam tarihi 1919-1927 arasıdır. Sıklıkla 1938''e kadar olan dönemi de anlattığı sanılır; oysa 1927 sonrasındaki gelişmeler (örneğin Harf İnkılabı, Menemen Olayı, Montrö, Hatay) Nutuk''ta yer almaz!'
);

-- Soru 4
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Mustafa Kemal Atatürk, askerlik ve sivil yaşamı boyunca pek çok eser kaleme almıştır.

Aşağıdakilerden hangisi Atatürk''ün yazdığı veya katkı sağladığı eserlerden biri değildir?',
  '{"options": ["Zabit ve Kumandan ile Hasbihal", "Geometri", "Medeni Bilgiler", "Cumalı Ordugahı", "Zeytindağı"], "correctIndex": 4}'::jsonb,
  '''Zeytindağı'', Falih Rıfkı Atay''ın I. Dünya Savaşı''nda Cemal Paşa''nın karargahında iken Filistin ve Suriye cephesi anılarını anlattığı ünlü edebi/tarihi eseridir; Atatürk''e ait değildir. Zabit ve Kumandan ile Hasbihal, Geometri, Medeni Bilgiler (Afet İnan adına bastırılan kısımlar) ve Cumalı Ordugahı Atatürk''ün eserleridir.',
  'Geometri kitabı veya Cumalı Ordugahı adaylarca bilinmediğinde Atatürk''e ait olmadığı sanılabilir; oysa üçgen, açı, boyut gibi Türkçe terimleri bizzat Atatürk Geometri kitabıyla literatüre kazandırmıştır.'
);

-- Soru 5
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  1,
  'İtilaf Devletleri''nin Lozan Barış Konferansı''na TBMM Hükümeti''nin yanında İstanbul Hükümeti''ni de davet ederek Türk tarafı arasında ikilik çıkarmak istemesi üzerine, TBMM tarafından 1 Kasım 1922 tarihinde alınan tarihi karar aşağıdakilerden hangisidir?',
  '{"options": ["Cumhuriyetin ilan edilmesi", "Saltanatın kaldırılması", "Halifeliğin kaldırılması", "Tekke ve zaviyelerin kapatılması", "Takrir-i Sükun Kanunu''nun kabulü"], "correctIndex": 1}'::jsonb,
  'Lozan Konferansı''na hem TBMM hem de İstanbul Hükümeti davet edilince, ikiliği önlemek ve ulusal egemenliği tek elde toplamak amacıyla 1 Kasım 1922''de saltanat kaldırılmıştır. Böylece 623 yıllık Osmanlı Devleti resmen sona ermiştir.',
  'Adaylar 1 Kasım 1922''de hem saltanatın hem de halifeliğin aynı anda kaldırıldığını zannedebilir. Oysa 1 Kasım 1922''de sadece saltanat kaldırılmış; halifelik kurumuna ise toplumsal tepkileri önlemek amacıyla 3 Mart 1924''e kadar dokunulmamıştır.'
);

-- Soru 6
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  1,
  'Milli Mücadele''nin sevk ve idare merkezi olan, jeopolitik, askeri ve coğrafi konumu itibarıyla güvenli bir noktada bulunan Ankara, İsmet İnönü ve arkadaşlarının verdiği kanun teklifinin kabul edilmesiyle hangi tarihte Türkiye Devleti''nin resmi başkenti olmuştur?',
  '{"options": ["23 Nisan 1920", "11 Ekim 1922", "13 Ekim 1923", "29 Ekim 1923", "3 Mart 1924"], "correctIndex": 2}'::jsonb,
  'Ankara, Cumhuriyetin ilanından 16 gün önce, 13 Ekim 1923 tarihinde TBMM kararıyla Türkiye Devleti''nin başkenti ilan edilmiştir.',
  'Adaylar başkentin Cumhuriyetin ilanıyla (29 Ekim 1923) aynı gün veya TBMM''nin açılışında (23 Nisan 1920) yasalaştığını düşünebilir. Başkent kanunu 13 Ekim 1923''tedir.'
);

-- Soru 7
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Cumhuriyetin ilan edilmesinde; devlet başkanlığı sorununun çözülmesi ve rejim tartışmalarına son verilmesi gereğinin yanı sıra, Ali Fethi Okyar Hükümeti''nin istifasıyla patlak veren ve Meclis Hükümeti sisteminin tıkanmasına yol açan ''Ekim Bunalımı'' (Hükümet Krizi) etkili olmuştur.

29 Ekim 1923''te Cumhuriyetin ilanı ile birlikte Meclis Hükümeti sisteminden hangi yönetim sistemine geçilmiştir?',
  '{"options": ["Kabine Sistemi", "Başkanlık Sistemi", "Mutlakiyet Sistemi", "Yarı Başkanlık Sistemi", "Doğrudan Demokrasi Sistemi"], "correctIndex": 0}'::jsonb,
  'Cumhuriyetin ilanıyla birlikte Meclis Hükümeti sistemi (bakanların meclis tarafından tek tek oylanarak seçildiği ve kriz yaratan sistem) terk edilmiş, başbakanın bakanları belirleyip cumhurbaşkanına sunduğu ''Kabine Sistemi''ne geçilmiştir. İlk Başbakan İsmet İnönü, ilk Cumhurbaşkanı Mustafa Kemal, ilk Meclis Başkanı ise Ali Fethi Okyar olmuştur.',
  'Sistem ismi konusunda Başkanlık sistemi ile karıştırılabilir. Türkiye 1923''te parlamenter kabine sistemine geçmiştir.'
);

-- Soru 8
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '29 Ekim 1923 tarihinde Cumhuriyetin ilan edilmesinin ardından Türkiye Cumhuriyeti Devleti''nin ilk kadroları teşekkül etmiştir.

Buna göre, Cumhuriyetin ilanından sonra seçilen ''ilk Cumhurbaşkanı'', ''ilk Başbakan'' ve ''ilk TBMM Başkanı'' eşleştirmesi aşağıdakilerden hangisinde doğru olarak verilmiştir?',
  '{"options": ["Mustafa Kemal Paşa - Fevzi Çakmak - Kazım Karabekir", "Mustafa Kemal Paşa - İsmet İnönü - Ali Fethi Okyar", "Mustafa Kemal Paşa - Rauf Orbay - Refet Bele", "İsmet İnönü - Mustafa Kemal Paşa - Celal Bayar", "Mustafa Kemal Paşa - Ali Fethi Okyar - İsmet İnönü"], "correctIndex": 1}'::jsonb,
  '29 Ekim 1923''te Cumhuriyet ilan edildikten sonra oy birliğiyle ilk Cumhurbaşkanı Gazi Mustafa Kemal Paşa seçilmiştir. Mustafa Kemal''in hükümeti kurmakla görevlendirdiği İsmet (İnönü) Paşa ilk Başbakan olmuş; boşalan TBMM Başkanlığına ise Ali Fethi (Okyar) Bey seçilmiştir.',
  'Cumhuriyetin ilanından önceki icra vekilleri heyeti başkanı olan Rauf Orbay veya Fethi Okyar ile ilk Başbakanlık makamı karıştırılmamalıdır. Cumhuriyetin ilk Başbakanı İsmet İnönü''dür.'
);

-- Soru 9
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '3 Mart 1924 tarihi Türk modernleşmesi ve laik hukuk devleti açısından en önemli dönüm noktalarından biridir.

Aşağıdakilerden hangisi 3 Mart 1924 tarihinde kabul edilen kanunlar veya gerçekleştirilen inkılaplardan biri değildir?',
  '{"options": ["Halifeliğin kaldırılması", "Tevhid-i Tedrisat Kanunu''nun kabul edilmesi", "Şeriye ve Evkaf Vekaleti''nin kaldırılması", "Erkan-ı Harbiye-i Umumiye Vekaleti''nin kaldırılması", "Tekke, zaviye ve türbelerin kapatılması"], "correctIndex": 4}'::jsonb,
  '3 Mart 1924 günü Mecliste kabul edilen kanunlar: 1) Halifeliğin kaldırılması ve Osmanlı Hanedanı''nın yurt dışına çıkarılması, 2) Tevhid-i Tedrisat Kanunu, 3) Şeriye ve Evkaf Vekaleti''nin kaldırılması (yerine Diyanet İşleri Başkanlığı ve Vakıflar Genel Müdürlüğü kuruldu), 4) Erkan-ı Harbiye Vekaleti''nin kaldırılması (ordunun siyasetten ayrılması, Genelkurmay Başkanlığı kurulması). Tekke, zaviye ve türbelerin kapatılması ise 30 Kasım 1925 tarihindedir.',
  '3 Mart 1924 kanunları ''devrim yasaları paketi'' olarak geçer. Tekke ve zaviyelerin kapatılması da dini alanla ilgili olduğu için sıklıkla bu tarihe dahil zannedilir; oysa Şeyh Sait İsyanı sonrasında, 1925 yılı sonundadır.'
);

-- Soru 10
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  3,
  '1924 Anayasası, Türkiye Cumhuriyeti''nin en uzun süre yürürlükte kalan kurucu anayasasıdır. Dönemin şartları gereği meclis hükümeti sistemi ile parlamenter sistem arasında karma bir yapı benimsemiştir.

1924 Anayasası''nda laikleşme yolunda atılan ilk anayasal adım aşağıdakilerden hangisidir?',
  '{"options": ["Atatürk ilkelerinin anayasaya dahil edilmesi (1937)", "''Devletin dini İslam''dır'' ibaresinin anayasa metninden çıkarılması (1928)", "Kadınlara milletvekili seçme ve seçilme hakkının verilmesi (1934)", "Milletvekili yemin metnindeki dini ifadelerin kaldırılması (1928)", "Çok partili hayata geçişin anayasada güvenceye alınması (1946)"], "correctIndex": 1}'::jsonb,
  '10 Nisan 1928''de 1924 Anayasası''nda yapılan değişiklikle ''Devletin dini İslam''dır'' maddesi anayasadan çıkarılmış ve milletvekili yeminindeki ''vallahi'' kelimesi ''namusum ve şerefim üzerine ant içerim'' şeklinde değiştirilmiştir. Bu adım anayasanın laikleşmesinde temel dönüm noktasıdır. 1937''de ise Atatürk ilkeleri anayasaya eklenmiştir.',
  'ÖSYM bu soruda sıklıkla 1937''yi (Laiklik dahil 6 ilkenin anayasaya girişi) sorar. Ancak ''Devletin dini İslam''dır'' maddesinin çıkarılması 1928 yılındadır.'
);

-- Soru 11
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Cumhuriyet döneminin ilk muhalefet partisi olan ve Kazım Karabekir, Rauf Orbay, Ali Fuat Cebesoy, Refet Bele ile Adnan Adıvar gibi Milli Mücadele''nin önde gelen komutan ve devlet adamları tarafından kurulan parti aşağıdakilerden hangisidir?',
  '{"options": ["Serbest Cumhuriyet Fırkası", "Terakkiperver Cumhuriyet Fırkası", "Demokrat Parti", "Milli Kalkınma Partisi", "Ahali Cumhuriyet Fırkası"], "correctIndex": 1}'::jsonb,
  '17 Kasım 1924''te kurulan Terakkiperver Cumhuriyet Fırkası (TCF), Türkiye Cumhuriyeti''nin ilk muhalefet partisidir. Kurucuları ''K-A-R-A-R'' (Kazım Karabekir, Adnan Adıvar, Rauf Orbay, Ali Fuat Cebesoy, Refet Bele) olarak kodlanır. Genel başkanı Kazım Karabekir''dir. Ekonomide liberalizmi savunmuş, tüzüğündeki ''Fırka, dini düşünce ve inançlara saygılıdır'' maddesi irtica yanlılarının partiye sızmasına yol açmıştır.',
  'Serbest Cumhuriyet Fırkası ikinci muhalefet partisidir (1930) ve Ali Fethi Okyar tarafından kurulmuştur. İlk muhalefet partisi Kazım Karabekir başkanlığındaki Terakkiperver Cumhuriyet Fırkası''dır.'
);

-- Soru 12
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '1925 yılında Doğu Anadolu''da saltanat ve hilafeti geri getirmek amacıyla patlak veren Şeyh Sait İsyanı''nı bastırmak amacıyla hükümet değişikliğine gidilmiş ve sert tedbirler içeren bir kanun çıkarılmıştır.

Bu bağlamda; isyan sürecinde istifa eden Ali Fethi Okyar yerine başbakanlığa getirilen devlet adamı ve 4 Mart 1925''te çıkarılan olağanüstü kanun aşağıdakilerden hangisinde doğru eşleştirilmiştir?',
  '{"options": ["İsmet İnönü - Takrir-i Sükun Kanunu", "Rauf Orbay - Hıyanet-i Vataniye Kanunu", "Kazım Karabekir - Teşkilat-ı Esasiye Kanunu", "Celal Bayar - Firariler Kanunu", "Fevzi Çakmak - Men-i Müskirat Kanunu"], "correctIndex": 0}'::jsonb,
  'Şeyh Sait İsyanı bastırılamayınca Ali Fethi Okyar istifa etmiş, yerine hükümeti kuran İsmet İnönü 4 Mart 1925''te ''Takrir-i Sükun Kanunu''nu (Huzuru Sağlama Kanunu) meclisten geçirmiştir. İstiklal Mahkemeleri yeniden kurulmuş, isyan bastırılmış ve TCF kapatılmıştır.',
  'Adaylar Şeyh Sait İsyanı sırasında başbakanın baştan beri İsmet İnönü olduğunu sanabilir veya Hıyanet-i Vataniye Kanunu ile Takrir-i Sükun''u karıştırabilir. 1920''de TBMM''ye karşı ayaklanmalarda Hıyanet-i Vataniye; 1925 rejim karşıtı isyanda Takrir-i Sükun Kanunu çıkarılmıştır.'
);

-- Soru 13
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '1926 yılında Mustafa Kemal Atatürk''e karşı planlanan ancak Giritli Şevki''nin ihbarı sayesinde açığa çıkarılan suikast girişimi sonrasında Mustafa Kemal Paşa''nın söylediği tarihi söz aşağıdakilerden hangisidir?',
  '{"options": ["Ordular! İlk hedefiniz Akdeniz''dir, ileri!", "Geldikleri gibi giderler.", "Benim naçiz vücudum bir gün elbet toprak olacaktır fakat Türkiye Cumhuriyeti ilelebet payidar kalacaktır.", "Siz orada yalnız düşmanı değil, milletin makus talihini de yendiniz.", "Yurtta sulh, cihanda sulh."], "correctIndex": 2}'::jsonb,
  '16 Haziran 1926 İzmir Suikastı teşebbüsü sonrası Mustafa Kemal Atatürk, Anadolu Ajansı''na verdiği demeçte ''Benim naçiz vücudum bir gün elbet toprak olacaktır fakat Türkiye Cumhuriyeti ilelebet payidar kalacaktır.'' demiştir.',
  'Bu ünlü sözün nerede söylendiği ÖSYM tarafından sıkça sorulur. Genellikle Cumhuriyetin ilanı veya ölüm döşeğindeki bir vasiyetle karıştırılır; oysa İzmir Suikastı girişimi sonrasındaki demecidir.'
);

-- Soru 14
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '1929 Dünya Ekonomik Bunalımı''nın olumsuz etkilerini hafifletmek, hükümeti denetlemek ve çok partili yaşama geçmek amacıyla bizzat Atatürk''ün teşvikiyle Ali Fethi Okyar tarafından kurulan Serbest Cumhuriyet Fırkası''nın kapatılma/feshedilme süreciyle ilgili aşağıdaki ifadelerden hangisi doğrudur?',
  '{"options": ["Şeyh Sait İsyanı''na destek verdiği gerekçesiyle İstiklal Mahkemesi kararıyla kapatılmıştır.", "Menemen Olayı (Kubilay Hadisesi) sonrasında hükümet tarafından resmen kapatılmıştır.", "Parti içine rejim karşıtı mürtecilerin sızdığını gören Ali Fethi Okyar tarafından bizzat feshedilmiştir.", "İzmir Suikastı davası sonucunda kapatılmıştır.", "Anayasa Mahkemesi kararıyla laikliğe aykırı eylemlerden ötürü kapatılmıştır."], "correctIndex": 2}'::jsonb,
  'Serbest Cumhuriyet Fırkası (12 Ağustos 1930), partinin rejim karşıtlarının odağı haline geldiğini gören kurucusu Ali Fethi Okyar tarafından 17 Kasım 1930''da bizzat feshedilmiştir (kendi kendini kapatmıştır). Partinin feshinden yaklaşık bir ay sonra (23 Aralık 1930) Menemen Olayı meydana gelmiştir.',
  'EN BÜYÜK ÖSYM ÇELDİRİCİSİ: Menemen Olayı yüzünden SCF''nin kapatıldığı sanılır. Oysa Menemen Olayı gerçekleştiğinde SCF zaten kendini feshetmiş durumdaydı!'
);

-- Soru 15
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '17 Şubat 1926 tarihinde kabul edilen ve İsviçre''den uyarlanan Türk Medeni Kanunu ile Türk aile yapısında ve sosyal hayatında köklü dönüşümler sağlanmıştır.

Aşağıdakilerden hangisi 1926 Türk Medeni Kanunu ile kadınlara sağlanan haklardan biri değildir?',
  '{"options": ["Miras paylaşımında kadın ve erkek eşitliğinin sağlanması", "Mahkemelerde kadın ve erkeğin şahitliğinin eşit kılınması", "Tek eşle evlilik (monogami) ve resmi nikah zorunluluğunun getirilmesi", "İstediği mesleğe serbestçe girebilme hakkı", "Belediye ve milletvekili seçimlerinde oy kullanma hakkı"], "correctIndex": 4}'::jsonb,
  '1926 Türk Medeni Kanunu yalnızca sosyal, hukuki ve ekonomik haklar düzenlemiştir. KADINLARA SİYASİ HAKLAR (seçme ve seçilme) MEDENİ KANUN İLE VERİLMEMİŞTİR! Siyasi haklar daha sonra 1930 (Belediye), 1933 (Muhtarlık) ve 1934 (Milletvekilliği) kanunlarıyla anayasal düzenlemeyle verilmiştir.',
  'ÖSYM''nin en sevdiği klasik sorudur: Medeni Kanun''da siyasi hak (seçme-seçilme) KESİNLİKLE YOKTUR. Adaylar kadın haklarının tümünün Medeni Kanun ile geldiğini zannederek yanılır.'
);

-- Soru 16
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Cumhuriyet döneminde modern ve laik bir hukuk düzeni kurmak amacıyla Avrupa''nın gelişmiş kanunları incelenerek Türk hukuk sistemine uyarlanmıştır.

Buna göre, 1926 yılında yürürlüğe giren ve ceza yargılamasında esas alınan Türk Ceza Kanunu aşağıdaki ülkelerin hangisinden iktibas edilerek (uyarlanarak) alınmıştır?',
  '{"options": ["İsviçre", "Almanya", "İtalya", "Fransa", "İsveç"], "correctIndex": 2}'::jsonb,
  'Türk Ceza Kanunu (1926) İtalya''dan; Medeni Kanun ve Borçlar Kanunu İsviçre''den; Ticaret Kanunu Almanya''dan; İdare Hukuku ve İdare Mahkemeleri teşkilatı Fransa''dan iktibas edilmiştir.',
  'Medeni Kanun İsviçre''den alındığı için tüm kanunların İsviçre''den alındığı yanılgısına düşülür. Ceza Kanunu İtalya''dan (Zanardelli Kanunu temel alınarak) uyarlanmıştır.'
);

-- Soru 17
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '3 Mart 1924 tarihinde kabul edilen Tevhid-i Tedrisat (Öğretim Birliği) Kanunu ile;
I. Türkiye sınırları içindeki tüm okullar Maarif Vekaleti''ne (Milli Eğitim Bakanlığı) bağlanmıştır.
II. Eğitimde ikiliğe yol açan medreseler kapatılmıştır.
III. Eğitim ve öğretim laik, milli ve çağdaş bir yapıya kavuşturulmuştur.

Bu inkılap doğrudan aşağıdaki Atatürk ilkelerinden hangileriyle ilişkilidir?',
  '{"options": ["Yalnızca Devletçilik", "Milliyetçilik ve Laiklik", "Yalnızca Cumhuriyetçilik", "Cumhuriyetçilik ve Devletçilik", "Yalnızca Barışçılık"], "correctIndex": 1}'::jsonb,
  'Tevhid-i Tedrisat Kanunu tüm okulları tek çatı altında toplayıp yabancı okulların denetimsizliğini önleyerek milli bir müfredat getirdiği için ''Milliyetçilik''; medreseleri kapatıp akılcı ve bilime dayalı eğitime geçtiği için ''Laiklik'' ve imtiyazsız eşit eğitim sunduğu için ''Halkçılık'' ilkeleriyle doğrudan bağlantılıdır.',
  'Tevhid-i Tedrisat bir kanun olduğu için sadece devletle ilgili görülüp devletçilik sanılabilir; oysa eğitimde birlik ''Milliyetçilik'', akıl ve bilim ekseni ise ''Laiklik''tir.'
);

-- Soru 18
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  1,
  '1 Kasım 1928 tarihinde Türk harflerinin kabul edilmesinin ardından, yeni harfleri halka öğretmek ve okuma-yazma seferberliğini yurt geneline yaymak amacıyla 24 Kasım 1928''de açılan ve Atatürk''e ''Başöğretmen'' unvanı verilen eğitim kurumları aşağıdakilerden hangisidir?',
  '{"options": ["Halkevleri", "Köy Enstitüleri", "Millet Mektepleri", "Darülfünun", "Musiki Muallim Mektebi"], "correctIndex": 2}'::jsonb,
  'Yeni Türk Harflerinin Kabulü Kanunu 1 Kasım 1928''de çıkmıştır. Harfleri yetişkin halka öğretmek amacıyla 24 Kasım 1928''de Millet Mektepleri açılmış ve Mustafa Kemal Atatürk bu kurumun ''Başöğretmeni'' ilan edilmiştir (Bu nedenle her 24 Kasım Öğretmenler Günü olarak kutlanır).',
  'Halkevleri (1932) ve Köy Enstitüleri (1940) ile karıştırılır. Harf inkılabı sonrası okuma yazma kursları niteliğinde açılan teşkilat Millet Mektepleri''dir.'
);

-- Soru 19
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Mustafa Kemal Atatürk''ün ''Türk çocuğu ecdadını tanıdıkça daha büyük işler yapmak için kendinde kuvvet bulacaktır.'' sözü doğrultusunda, Türk tarihinin sadece Osmanlı ve Selçuklu''dan ibaret olmadığını, köklerinin Orta Asya ve Anadolu''nun kadim uygarlıklarına dayandığını ortaya koymak amacıyla 1931 yılında kurulan kurum ve yayın organı aşağıdakilerden hangisidir?',
  '{"options": ["Türk Tarih Kurumu - Belleten", "Türk Dil Kurumu - Türk Dili", "Halkevleri - Ülkü", "Tarih-i Osmani Encümeni - Mecmua", "Milletlerarası Şarkiyatçılar Birliği - Varlık"], "correctIndex": 0}'::jsonb,
  '1931''de Türk Tarihi Tetkik Cemiyeti (daha sonra Türk Tarih Kurumu - TTK) kurulmuştur. İlk başkanı Tevfik Bıyıklıoğlu''dur. Kurumun çıkardığı ve bizzat Atatürk''ün vefatından önceki son günlerinde okuduğu bilimsel yayın organı ''Belleten'' dergisidir.',
  'Halkevlerinin yayın organı ''Ülkü'', Türk Tarih Kurumu''nunki ise ''Belleten'' dergisidir. ÖSYM Belleten dergisini ve ilk başkanı Tevfik Bıyıklıoğlu''nu sıklıkla sorgulamaktadır.'
);

-- Soru 20
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '1932 yılında kurulan ve ilk başkanı Samih Rıfat olan Türk Dili Tetkik Cemiyeti (Türk Dil Kurumu), Türkçenin zenginliğini ortaya çıkarmak, yabancı kelimelerin istilasından korumak ve halk dili ile aydın dili arasındaki kopukluğu gidermek amacıyla çalışmalar yapmıştır.

Atatürk döneminde Türk dilinin dünyadaki en eski kültür dillerinden biri olduğunu kanıtlamak amacıyla savunulan ve uluslararası kurultaylarda tartışılan dil teorisi aşağıdakilerden hangisidir?',
  '{"options": ["Turan Tezi", "Güneş Dil Teorisi", "Ural-Altay Kuramı", "Öztürkçe İdeali", "Sümer-Akad Dil Ekolü"], "correctIndex": 1}'::jsonb,
  'Mustafa Kemal Atatürk''ün himayesinde 1935-1936 yıllarında geliştirilen ve Viyanalı dilbilimci Hermann Kvergic''in çalışmasından esinlenilen teori ''Güneş Dil Teorisi''dir. Bu teoriyle tüm insan dillerinin Türkçeden türediği savunularak aşırı tasfiyeciliğin (Türkçeleştirme sırasında dilin kısırlaşmasının) önüne geçilmeye çalışılmıştır.',
  'Ural-Altay dil kuramı genel dilbilim teorisidir. Atatürk''ün desteklediği ve Türkçenin kökenini güneşe ve doğaya bağlayan özel teori Güneş Dil Teorisi''dir.'
);

-- Soru 21
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '1932 yılında kapatılan Türk Ocakları''nın binaları ve mal varlığı devralınarak kurulan, halkı Cumhuriyet inkılapları etrafında bilinçlendirmek, kültürel ve sanatsal faaliyetleri tabana yaymak amacıyla faaliyet gösteren kurum ve resmi yayın organı aşağıdakilerden hangisidir?',
  '{"options": ["Millet Mektepleri - İkdam", "Halkevleri - Ülkü Dergisi", "Köy Muallim Mektebi - Kadro Dergisi", "Tercüme Odası - Ceride-i Havadis", "Anadolu Kulübü - Hakimiyet-i Milliye"], "correctIndex": 1}'::jsonb,
  'Halkevleri, 19 Şubat 1932''de kurulmuş ve 9 farklı çalışma şubesiyle (dil, tarih, edebiyat, güzel sanatlar, tiyatro, spor, içtimai yardım, halk dershaneleri, köycülük, müze ve sergi) halkın aydınlanmasına katkı sağlamıştır. Yayın organı ''Ülkü'' dergisidir.',
  'Kadro dergisi (Şevket Süreyya Aydemir, Yakup Kadri vb.) devleti ve Kemalizm''i kuramsallaştıran aydınların dergisidir; Halkevleri''nin resmi yayın organı Ülkü dergisidir.'
);

-- Soru 22
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Atatürk döneminde yükseköğretimi modernleştirmek amacıyla İsviçreli pedagog Prof. Dr. Albert Malche Türkiye''ye davet edilmiş ve hazırladığı kapsamlı rapor doğrultusunda 1933 yılında bir reform gerçekleştirilmiştir.

Bu reform neticesinde Osmanlı''dan kalan Darülfünun kapatılarak yerine kurulan modern Türk üniversitesi aşağıdakilerden hangisidir?',
  '{"options": ["Ankara Üniversitesi", "İstanbul Üniversitesi", "Orta Doğu Teknik Üniversitesi", "İstanbul Teknik Üniversitesi", "Gazi Üniversitesi"], "correctIndex": 1}'::jsonb,
  '1933 Üniversite Reformu ile Osmanlı''dan kalan ve inkılaplara kayıtsız kalan Darülfünun lağvedilmiş, 1 Ağustos 1933''te Türkiye''nin ilk modern üniversitesi olan ''İstanbul Üniversitesi'' kurulmuştur. Nazi Almanyası''ndan kaçan pek çok Musevi asıllı bilim insanı da burada istihdam edilmiştir.',
  'Ankara Üniversitesi Cumhuriyetin bizzat kurduğu ilk fakültelerin (Hukuk Mektebi, Dil ve Tarih-Coğrafya Fakültesi) birleşimiyle 1946''da tüzel kişilik kazanmıştır. Darülfünun''un dönüştüğü üniversite ise İstanbul Üniversitesi''dir.'
);

-- Soru 23
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  1,
  'Mustafa Kemal Paşa, 1925 yılında gerçekleştirdiği yurt gezisinde halkın karşısına başında panama şapka ile çıkmış, ''Buna şapka derler.'' diyerek modern kılık-kıyafet inkılabının ilk işaretini vermiştir.

Mustafa Kemal''in şapka inkılabını ilk kez tanıttığı ilimiz aşağıdakilerden hangisidir?',
  '{"options": ["İzmir", "Kastamonu", "Konya", "Samsun", "Erzurum"], "correctIndex": 1}'::jsonb,
  'Mustafa Kemal, 23-31 Ağustos 1925 tarihlerinde Kastamonu ve İnebolu gezisinde şapkayı halka tanıtmış ve 25 Kasım 1925 tarihinde çıkarılan Şapka İktisası Hakkında Kanun ile fes, sarık vb. yerine şapka giyilmesi zorunlu kılınmıştır.',
  'Adaylar şapkanın batıya daha yakın olan İzmir veya İstanbul''da tanıtıldığını düşünebilir. Atatürk şapkayı bizzat Karadeniz''de, Kastamonu (İnebolu) gezisinde tanıtmıştır.'
);

-- Soru 24
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Mustafa Kemal Atatürk''ün; ''Türkiye Cumhuriyeti şeyhler, dervişler, müritler ve mensuplar memleketi olamaz. En doğru, en hakiki tarikat medeniyet tarikatıdır.'' sözü, aşağıdaki inkılaplardan hangisinin gerekçesini oluşturmaktadır?',
  '{"options": ["Saltanatın kaldırılması", "Tevhid-i Tedrisat Kanunu", "Tekke, zaviye ve türbelerin kapatılması", "Soyadı Kanunu''nun kabul edilmesi", "Şeriye ve Evkaf Vekaleti''nin kaldırılması"], "correctIndex": 2}'::jsonb,
  'Mustafa Kemal''in bu ünlü sözü 30 Kasım 1925 tarihinde çıkarılan 677 sayılı ''Tekke, Zaviye ve Türbelerin Kapatılması Hakkında Kanun''un ruhunu ve temel felsefesini yansıtmaktadır.',
  'Bu söz sıklıkla Halifeliğin kaldırılması (1924) ile ilişkilendirilir. Oysa doğrudan tekke, zaviye ve türbelerin kapatılması (1925) sürecinde söylenmiştir.'
);

-- Soru 25
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  1,
  'Türkiye Cumhuriyeti''nde Türk kadınına siyasal haklar aşamalı olarak tanınmıştır.

Buna göre Türk kadınlarına tanınan siyasi hakların kronolojik sırası aşağıdakilerden hangisinde doğru olarak verilmiştir?',
  '{"options": ["Belediye Seçimleri (1930) - Muhtarlık Seçimleri (1933) - Milletvekilliği (1934)", "Muhtarlık Seçimleri (1930) - Belediye Seçimleri (1933) - Milletvekilliği (1934)", "Milletvekilliği (1930) - Belediye Seçimleri (1933) - Muhtarlık Seçimleri (1934)", "Belediye Seçimleri (1926) - Muhtarlık Seçimleri (1930) - Milletvekilliği (1934)", "Köy İhtiyar Heyeti (1930) - Milletvekilliği (1933) - Belediye Seçimleri (1934)"], "correctIndex": 0}'::jsonb,
  'Kadınlara siyasi hakların veriliş sırası KPSS''de ''034 BMW'' (Belediye 1930, Muhtarlık 1933, Vekillik 1934) şeklinde kodlanır: 1930 Belediye, 1933 Muhtarlık (İlk kadın muhtar Gülesin Hanım), 1934 Milletvekili seçme ve seçilme hakkı (1935 seçimlerinde meclise 18 kadın milletvekili girmiştir).',
  'Adaylar 1926 Medeni Kanun ile siyasi hakların başladığını zannedebilir veya 1930 Belediye ile 1933 Muhtarlık sırasını karıştırabilir.'
);

-- Soru 26
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Cumhuriyet döneminde kadınların meslek hayatında etkin rol alması teşvik edilmiş ve birçok alanda ilk kadın öncüler yetişmiştir.

Buna göre aşağıdaki ''ilk Türk kadını'' ve ''meslek/görev'' eşleştirmelerinden hangisi yanlıştır?',
  '{"options": ["Sabiha Gökçen - İlk kadın savaş pilotu", "Gül Esin - İlk kadın muhtar", "Afife Jale - İlk tiyatro sahnesine çıkan Müslüman Türk kadını", "Sadiye Hanım - İlk kadın belediye başkanı", "Türkan Akyol - İlk kadın hekim"], "correctIndex": 4}'::jsonb,
  'İlk Türk kadın hekim Safiye Ali''dir. Türkan Akyol ise Türkiye''nin ilk kadın bakanıdır (1971 Nihat Erim Hükümeti''nde Sağlık Bakanı). Bu nedenle eşleştirme yanlıştır.',
  'Safiye Ali (ilk hekim), Türkan Akyol (ilk bakan) ve Tansu Çiller (ilk başbakan) ÖSYM''nin karıştırmayı en çok sevdiği kadın öncülerdir.'
);

-- Soru 27
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Lozan Barış görüşmelerine ara verildiği dönemde (17 Şubat - 4 Mart 1923) toplanan ve yeni Türkiye''nin ekonomi rotasını belirleyen İzmir İktisat Kongresi ile ilgili aşağıdaki ifadelerden hangisi yanlıştır?',
  '{"options": ["Kongre başkanlığını Kazım Karabekir Paşa yürütmüştür.", "Kongrede oy birliğiyle ''Misak-ı İktisadi'' (Milli Ekonomi Andı) kabul edilmiştir.", "Yabancı sermayeye, milli menfaatlere ve kanunlara saygılı olmak şartıyla kapılar tamamen kapatılmamıştır.", "Kongrede doğrudan Sovyet tipi katı kolektivist ve komünist bir ekonomi modeli benimsenmiştir.", "Kongreye tüccar, çiftçi, sanayici ve işçi temsilcileri katılarak geniş bir uzlaşı sağlanmıştır."], "correctIndex": 3}'::jsonb,
  'İzmir İktisat Kongresi''nde komünist/kolektivist model değil, milli ve bağımsız bir piyasa ekonomisi (özel sektörü destekleyen liberal eğilimli karma model) benimsenmiştir. Devletçilik ilkesine ancak 1929 Büyük Buhranı sonrasında zorunlu olarak geçilmiştir.',
  'İzmir İktisat Kongresi''nin Kazım Karabekir başkanlığında toplandığı sıklıkla unutulur ve doğrudan Devletçilik ilkesinin bu kongrede kabul edildiği sanılır; oysa 1923''te özel girişim teşvik edilmiş, devletçilik 1930''lu yıllarda öne çıkmıştır.'
);

-- Soru 28
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  1,
  '1 Temmuz 1926 tarihinde yürürlüğe giren ve Türkiye karasularında, limanlarında yük ve yolcu taşıma hakkını yalnızca Türk bayraklı gemilere ve Türk vatandaşlarına tanıyan kanun aşağıdakilerden hangisidir?',
  '{"options": ["Kabotaj Kanunu", "Teşvik-i Sanayi Kanunu", "Gümrük Tarife Kanunu", "Men-i İsrafat Kanunu", "Toprak Mahsulleri Vergisi Kanunu"], "correctIndex": 0}'::jsonb,
  '1 Temmuz 1926''da yürürlüğe giren Kabotaj Kanunu ile denizlerimizdeki yabancı ayrıcalıklarına son verilmiş, deniz ticareti millileştirilmiştir. Bu nedenle her 1 Temmuz ''Denizcilik ve Kabotaj Bayramı'' olarak kutlanır ve bu kanun doğrudan Milliyetçilik ilkesiyle ilişkilidir.',
  'Kabotaj Kanunu''nun denizcilikle ilgili olduğu bilinse de hangi ilkeye girdiği sorulduğunda ''Devletçilik'' sanılabilir; Türk karasularında hakimiyet sağladığı ve kapitülasyon kalıntısını kaldırdığı için temel olarak ''Milliyetçilik''tir.'
);

-- Soru 29
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Mustafa Kemal Atatürk''ün talimatıyla 1924 yılında kurulan, sermayesine bizzat Atatürk''ün Hindistan Müslümanları tarafından Milli Mücadele için gönderilen paradan pay ayırdığı ve ilk genel müdürlüğünü Celal Bayar''ın yaptığı Türkiye Cumhuriyeti''nin ilk özel ulusal bankası aşağıdakilerden hangisidir?',
  '{"options": ["Merkez Bankası", "Türkiye İş Bankası", "Sümerbank", "Etibank", "Halkbank"], "correctIndex": 1}'::jsonb,
  '26 Ağustos 1924''te kurulan Türkiye İş Bankası, Türkiye''nin ilk özel/ulusal bankasıdır. İlk Genel Müdürü Celal Bayar''dır. Atatürk vasiyetinde İş Bankası''ndaki hisselerinin gelirini Türk Dil Kurumu ve Türk Tarih Kurumu''na bırakmıştır.',
  'Türkiye İş Bankası özel sermayeli bir girişim olarak kurulmuştur. Türkiye Cumhuriyet Merkez Bankası ise para basma yetkisine sahip bağımsız kamu bankası olarak 1930''da kurulmuş, 1931''de faaliyete geçmiştir.'
);

-- Soru 30
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  1,
  'Devlet yönetiminde milli egemenliği, millet iradesini, seçme ve seçilme hakkını, çok partili siyasi hayatı ve yöneticilerin halk tarafından belirli sürelerle seçilmesini esas alan temel Atatürk ilkesi aşağıdakilerden hangisidir?',
  '{"options": ["Devletçilik", "Cumhuriyetçilik", "Halkçılık", "Laiklik", "İnkılapçılık"], "correctIndex": 1}'::jsonb,
  'Cumhuriyetçilik ilkesinin anahtar kavramları: Ulusal/milli egemenlik, meclis, seçim, çok partili rejim, oy kullanma hakkı ve milli iradedir. TBMM''nin açılması, saltanatın kaldırılması, cumhuriyetin ilanı, fırkaların kurulması cumhuriyetçilik doğrultusundadır.',
  'Ulusal bağımsızlık (Milliyetçilik) ile ulusal egemenlik (Cumhuriyetçilik) birbirine karıştırılmamalıdır. Dışa karşı bağımsızlık Milliyetçilik; milletin kendi kendini yönetmesi Cumhuriyetçiliktir.'
);

-- Soru 31
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Atatürk''ün benimsediği Milliyetçilik anlayışı; ırkçılığı, kafatası ölçümünü ve ümmetçiliği reddeden, kendini Türk hisseden ve Türkiye Cumhuriyeti''ne vatandaşlık bağıyla bağlı olan herkesi Türk kabul eden birleştirici ve bütünleştirici bir karaktere sahiptir.

Buna göre aşağıdakilerden hangisi doğrudan ''Milliyetçilik'' ilkesi doğrultusunda gerçekleştirilen faaliyetlerden biri değildir?',
  '{"options": ["Türk Tarih Kurumu''nun kurulması", "Kabotaj Kanunu''nun çıkarılması", "Kapitülasyonların tamamen kaldırılması", "Merkez Bankası''nın kurularak Türk parasının değerinin korunması", "Aşar vergisinin kaldırılarak köylünün rahatlatılması"], "correctIndex": 4}'::jsonb,
  'Aşar vergisinin kaldırılması, köylü üzerindeki ağır vergi yükünü hafifleterek fırsat eşitliği ve sosyal adaleti sağladığı için doğrudan ''Halkçılık'' ilkesiyle ilgilidir. TTK, Kabotaj, Kapitülasyonların kaldırılması ve Merkez Bankası milli iktisat ve kültürle ilgili olduğundan Milliyetçiliktir.',
  'Aşar vergisi köylüden alındığı için milli bir mesele gibi görülüp milliyetçilik sanılabilir. Oysa halkın refahı ve vergi adaleti ''Halkçılık'' ilkesinin en klasik örneğidir.'
);

-- Soru 32
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Halkçılık ilkesi; toplumda hiçbir sınıf, zümre veya aileye ayrıcalık tanınmamasını, kanun önünde eşitliği, sosyal dayanışmayı ve devlet imkanlarından herkesin eşit faydalanmasını savunur.

Aşağıdaki inkılaplardan hangisi doğrudan ''Halkçılık'' ilkesiyle bağdaşmaktadır?',
  '{"options": ["Ağa, paşa, hacı, hoca, bey gibi unvan ve lakapların kaldırılması", "Madencilik için Etibank''ın kurulması", "Demir yolu hatlarının yabancı şirketlerden millileştirilmesi", "Balkan Antantı''nın imzalanması", "Diyanet İşleri Başkanlığı''nın kurulması"], "correctIndex": 0}'::jsonb,
  '1934 yılında kabul edilen kanunla hacı, hoca, hafız, molla, bey, beyefendi, paşa, hanımefendi gibi ayrıcalık belirten unvan ve lakapların kaldırılması, toplumda eşitliği pekiştirdiği için doğrudan Halkçılık ilkesidir.',
  'Unvanların kaldırılması bazen Laiklik ile karıştırılır (hacı, hoca kelimelerinden ötürü). Oysa buradaki temel amaç din değil, toplumsal zümre ve sınıf ayrımını yok edip kanun önünde ''eşitlik'' sağlamaktır (Halkçılık).'
);

-- Soru 33
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Özel teşebbüsün sermaye, teknik ve bilgi yetersizliği sebebiyle gerçekleştiremediği büyük yatırımların bizzat devlet eliyle yapılması, ekonomik hayatın planlanması ve stratejik sanayi kollarının kamu tarafından işletilmesini öngören Atatürk ilkesi aşağıdakilerden hangisidir?',
  '{"options": ["Halkçılık", "Devletçilik", "İnkılapçılık", "Milliyetçilik", "Cumhuriyetçilik"], "correctIndex": 1}'::jsonb,
  'Devletçilik, özellikle 1929 Dünya Ekonomik Bunalımı sonrası benimsenen karma ekonomik kalkınma modelidir. I. Beş Yıllık Sanayi Planı, Sümerbank, Etibank, fabrikaların kamu eliyle açılması doğrudan Devletçiliktir.',
  'Devletçilik sosyalizm veya komünizm değildir; özel mülkiyeti ve bireysel teşebbüsü reddetmez, aksine özel teşebbüsü destekleyen ve onun yapamadığı ağır sanayi işlerini üstlenen Türkiye''ye özgü bir karma ekonomi modelidir.'
);

-- Soru 34
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Atatürk ilkelerinden ''Laiklik'' ve ''İnkılapçılık'' ile ilgili aşağıdaki değerlendirmelerden hangisi yanlıştır?',
  '{"options": ["Laiklik yalnızca din ve devlet işlerinin ayrılması değil, aklın ve bilimin rehber edinilmesidir.", "İnkılapçılık durağanlığı reddeder; kurumların çağın gereksinimlerine göre sürekli dinamik ve yenilikçi olmasını şart koşar.", "Miladi takvim, saat ve uluslararası ölçü-tartı birimlerinin kabulü inkılapçılık ve çağdaşlaşma ile doğrudan ilgilidir.", "Tevhid-i Tedrisat Kanunu''nun çıkarılması ve Medeni Kanun laiklik doğrultusunda atılmış adımlardır.", "İnkılapçılık ilkesi, geçmişte kurulmuş tüm kurumların kökenine bakılmaksızın koşulsuz olarak muhafaza edilmesini savunur."], "correctIndex": 4}'::jsonb,
  'İnkılapçılık ilkesi eskiyi körü körüne muhafaza etmeyi (tutuculuk/muhafazakarlık) reddeder; ömrünü tamamlamış, çağın gerisinde kalmış kurumların yerine çağdaş ve dinamik müesseselerin getirilmesini savunur.',
  'İnkılapçılık statükocu değil, köklü reform ve sürekli gelişim yanlısıdır.'
);

-- Soru 35
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Lozan Barış Antlaşması sonrasında Türkiye ile Fransa arasında en çok gerginliğe yol açan ve Türkiye''nin ''Bu konu bizim iç meselemizdir, hiçbir yabancı devletin iç işlerimize karışmasına müsaade edilemez.'' diyerek uluslararası konferanslara taşınmasını kesin bir dille reddettiği mesele aşağıdakilerden hangisidir?',
  '{"options": ["Musul Meselesi", "Yabancı Okullar Sorunu", "Boğazlar Meselesi", "Nüfus Mübadelesi", "Dış Borçlar Sorunu"], "correctIndex": 1}'::jsonb,
  'Fransa başta olmak üzere bazı devletler Türkiye''deki yabancı misyoner okullarının Türk kanunlarına ve müfredatına bağlanmasına itiraz etmiştir. Türkiye Cumhuriyeti, yabancı okulların iç mesele olduğunu vurgulayarak konuyu hiçbir devletle veya Milletler Cemiyeti ile müzakere etmemiştir.',
  'Fransa ile yaşanan diğer sorunlar Borçlar ve Adana-Mersin demiryollarıdır. Ancak ''iç mesele sayılarak uluslararası platforma taşınması kesinlikle reddedilen'' mesele Yabancı Okullar Sorunudur.'
);

-- Soru 36
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Lozan''da çözülemeyerek Türkiye ile İngiltere''nin ikili müzakerelerine bırakılan Musul Meselesi, Haliç Konferansı''nda da çözülememiş ve Milletler Cemiyeti''ne intikal etmiştir. Bu süreçte Doğu Anadolu''da çıkan Şeyh Sait İsyanı sebebiyle askeri harekat imkanı kalmayan Türkiye, 5 Haziran 1926 tarihinde İngiltere ile Ankara Antlaşması''nı imzalamıştır.

1926 Ankara Antlaşması ile ilgili aşağıdaki hükümlerden hangisi doğrudur?',
  '{"options": ["Musul ve Kerkük Türkiye''nin sınırlarına katılmıştır.", "Musul, İngiliz mandasındaki Irak''a bırakılmış; petrol gelirlerinin %10''u 25 yıllığına Türkiye''ye tahsis edilmiştir.", "Hatay özerk bir sancak haline getirilmiştir.", "Boğazlar Komisyonu lağvedilerek yönetim Türkiye''ye verilmiştir.", "Kıbrıs üzerindeki Türk hakları resmen tescil edilmiştir."], "correctIndex": 1}'::jsonb,
  '5 Haziran 1926 Ankara Antlaşması ile Musul ve Kerkük İngiliz mandası altındaki Irak yönetimine bırakılmış, Hakkari sınırı Türkiye lehine çizilmiştir. Irak petrollerinden elde edilecek gelirin %10''u 25 yıl süreyle Türkiye''ye bırakılmış, Türkiye sonradan 500 bin sterlin karşılığında bu hakkından feragat etmiştir.',
  'Musul Misak-ı Milli''den verilen tavizlerden biridir. 1926 Ankara Antlaşması ile kaybedilmiştir; 1921 Ankara Antlaşması (Fransa ile yapılan ve Sakarya sonrası imzalanan) ile karıştırılmamalıdır.'
);

-- Soru 37
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'I. Dünya Savaşı sonrasında uluslararası barışı korumak amacıyla kurulan Milletler Cemiyeti''ne (Cemiyet-i Akvam), genellikle devletler bizzat başvurarak üye olurken; Türkiye barışçı dış politikası ve saygınlığı sebebiyle özel davetle üye olmuştur.

1932 yılında Türkiye''nin Milletler Cemiyeti''ne üyeliğini teklif eden ve destekleyen iki devlet aşağıdakilerden hangisinde doğru verilmiştir?',
  '{"options": ["İngiltere - Fransa", "İspanya - Yunanistan", "İtalya - Almanya", "Sovyetler Birliği - İran", "Romanya - Yugoslavya"], "correctIndex": 1}'::jsonb,
  'Türkiye, Milletler Cemiyeti''nin Musul ve Mübadele kararlarındaki taraflı tutumunu bildiğinden üyelik için bizzat başvurmamış; İspanya''nın teklifi ve Yunanistan''ın desteği ile gelen davet üzerine 18 Temmuz 1932''de cemiyete üye olmuştur. İlk temsilcimiz Cemal Hüsnü Taray''dır.',
  'Adaylar cemiyetin baş aktörleri olan İngiltere veya Fransa''nın davet ettiğini sanır. Teklifi sunan İspanya, destekleyen Yunanistan''dır.'
);

-- Soru 38
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  '1930''lu yıllarda İtalya''nın Akdeniz''deki saldırgan politikaları ve Bulgaristan''ın sınırları değiştirme emelleri (revizyonist politika) karşısında batı sınırlarını güvenceye almak amacıyla Türkiye, Yunanistan, Yugoslavya ve Romanya arasında 9 Şubat 1934''te Balkan Antantı imzalanmıştır.

Balkanlar''da yer almasına rağmen yayılmacı emelleri sebebiyle Balkan Antantı''na katılmayan devlet aşağıdakilerden hangisidir?',
  '{"options": ["Romanya", "Yugoslavya", "Bulgaristan", "Yunanistan", "Arnavutluk"], "correctIndex": 2}'::jsonb,
  'Balkan Antantı''na üye ülkeler ''TAYYAR'' (Türkiye, Atina/Yunanistan, Yugoslavya, Romanya) şifresiyle hatırlanır. Bulgaristan I. Dünya Savaşı''nda kaybettiği Ege çıkışını ve toprakları geri almak istediği (revizyonist tutumu nedeniyle) antanta katılmamıştır. Arnavutluk ise İtalya''nın baskısı yüzünden yer alamamıştır.',
  'Bulgaristan''ın antanta katılmama sebebi revizyonist (statükoyu değiştirme yanlısı) olmasıdır. Sorularda en sık sorulan çeldiricidir.'
);

-- Soru 39
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Lozan Boğazlar Sözleşmesi ile Boğazlar''ın yönetimi başkanı Türk olan uluslararası bir komisyona bırakılmış ve her iki yakası askersizleştirilmişti. 1930''lu yıllarda İtalya''nın Habeşistan''ı işgali ve Almanya''nın Ren bölgesini silahlandırması üzerine Türkiye Boğazlar sorununu gündeme getirmiştir.

20 Temmuz 1936''da imzalanan Montrö Boğazlar Sözleşmesi ile ilgili aşağıdaki hükümlerden hangisi yanlıştır?',
  '{"options": ["Uluslararası Boğazlar Komisyonu kaldırılarak tüm yetkileri Türkiye Devleti''ne devredilmiştir.", "Türkiye''nin Boğazlar''ın her iki yakasında asker bulundurma ve tahkimat yapma hakkı tanınmıştır.", "Ticaret gemilerinin Boğazlar''dan geçişi serbest bırakılmıştır.", "Karadeniz''e kıyısı olmayan devletlerin savaş gemilerinin geçişine süre ve tonaj sınırlaması getirilmiştir.", "Boğazlar''ın kontrolü ve geçiş ücretleri Milletler Cemiyeti Genel Sekreterliği''ne bırakılmıştır."], "correctIndex": 4}'::jsonb,
  'Montrö ile Boğazlar Komisyonu tamamen feshedilmiş ve Boğazlar üzerinde mutlak Türk egemenliği tescil edilmiştir. Yönetim veya harçlar Milletler Cemiyeti''ne değil, bizzat Türkiye Cumhuriyeti''ne aittir.',
  'Lozan''daki kısıtlamalar (komisyon varlığı, askersiz alan) ile Montrö''nün kazanımları kıyaslanır. Montrö Türkiye''nin tam egemenliğini sağlayan diplomatik bir zaferdir.'
);

-- Soru 40
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text, interaction_data, explanation, distractor_trap
) values (
  'Tarih',
  'Atatürk İlke ve İnkılapları',
  'multiple_choice',
  2,
  'Atatürk''ün son yıllarındaki başarılı diplomasi hamleleri ile ilgili;
I. İtalya''nın Orta Doğu ve Doğu Akdeniz''e yönelik yayılmacı tehditlerine karşı doğu sınırlarını korumak amacıyla Türkiye, İran, Irak ve Afganistan arasında Sadabad Paktı (1937) kurulmuştur.
II. Mustafa Kemal Atatürk''ün ''Şahsi meselemdir.'' ve ''Kırk asırlık Türk yurdu düşman elinde esir kalamaz.'' dediği Hatay, bağımsız bir cumhuriyet olduktan sonra 1939''da TBMM kararıyla Türkiye''ye katılmıştır.
III. Suriye, Hatay üzerindeki iddiaları ve Irak ile olan sınır ihtilafları sebebiyle Sadabad Paktı''na katılmamıştır.

Yukarıda verilen bilgilerden hangileri doğrudur?',
  '{"options": ["Yalnız I", "I ve II", "II ve III", "I ve III", "I, II ve III"], "correctIndex": 4}'::jsonb,
  'Verilen üç öncül de tarihsel olarak tamamen doğrudur. Sadabad Paktı Tahran''da imzalanmış; Türkiye, İran, Irak ve Afganistan katılmıştır (Suriye Hatay sorunu yüzünden katılmamıştır). Hatay 1938''de bağımsız devlet olmuş (İlk Cumhurbaşkanı Tayfur Sökmen, Başbakanı Abdurrahman Melek), 23 Haziran 1939''da anavatana katılmıştır.',
  'Suriye''nin Sadabad Paktı''nda yer almadığı ve Hatay''ın 1939''da (Atatürk''ün vefatından hemen sonra) anavatana katıldığı bilgisi ÖSYM''nin en çok üzerinde durduğu detaylardandır.'
);

