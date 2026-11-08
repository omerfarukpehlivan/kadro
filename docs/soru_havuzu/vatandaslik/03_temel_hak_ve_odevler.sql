-- =============================================================
-- KPSS VATANDAŞLIK — KONU 3: TEMEL HAK VE ÖDEVLER
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
  'Vatandaşlık',
  'Temel Hak ve Ödevler',
  'multiple_choice',
  1,
  '1982 Anayasası''nın 13. maddesine göre temel hak ve hürriyetler ancak aşağıdakilerden hangisi ile sınırlandırılabilir?',
  '{"options": ["Cumhurbaşkanlığı Kararnamesi", "Kanun", "Yönetmelik", "Genelge", "Valilik Kararı"], "correctIndex": 1}'::jsonb,
  'Anayasa m. 13''ün amir hükmü gereğince temel hak ve hürriyetler; özlerine dokunulmaksızın yalnızca Anayasa''nın ilgili maddelerinde belirtilen sebeplere bağlı olarak ve ancak KANUNLA sınırlanabilir. Cumhurbaşkanlığı kararnamesi veya yönetmelikle temel haklar sınırlanamaz.',
  'ÖSYM temel hakların sınırlandırılma aracını sıkça sorar: Tek ve mutlak araç TBMM tarafından çıkarılan KANUN''dur.'
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
  'Vatandaşlık',
  'Temel Hak ve Ödevler',
  'multiple_choice',
  1,
  'Georg Jellinek''in kamu hakları sınıflandırmasına göre bireyi devlete ve topluma karşı koruyan, devletin kişinin özel alanına müdahale etmesini engelleyen haklara ''Negatif Statü (Koruyucu) Hakları'' denir.

Aşağıdakilerden hangisi bir negatif statü (kişisel) hakkıdır?',
  '{"options": ["Sağlık hakkı", "Konut edinme hakkı", "Özel hayatın gizliliği ve korunması hakkı", "Sosyal güvenlik hakkı", "Sendika kurma hakkı"], "correctIndex": 2}'::jsonb,
  'Özel hayatın gizliliği, konut dokunulmazlığı, kişi hürriyeti, mülkiyet ve yaşam hakkı gibi haklar devletin karışmaması gereken kişisel (koruyucu/negatif statü) haklarıdır. Sağlık, konut, sosyal güvenlik ve sendika ise devletten hizmet istenen ''Sosyal ve Ekonomik (İsteme)'' haklardır.',
  'Kişisel haklar = Karışma (Negatif); Sosyal haklar = Hizmet ver (Pozitif/İsteme); Siyasi haklar = Yönetime kat (Aktif).'
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
  'Vatandaşlık',
  'Temel Hak ve Ödevler',
  'multiple_choice',
  1,
  '1982 Anayasası''na göre dernek kurma, sendika kurma veya toplantı ve gösteri yürüyüşü düzenleme hakkı ile ilgili ortak anayasal kural aşağıdakilerden hangisidir?',
  '{"options": ["İçişleri Bakanlığı''ndan önceden yazılı izin alma zorunluluğu vardır.", "Valilik veya kaymakamlıktan izin alındıktan sonra faaliyet gösterilebilir.", "Önceden izin almaksızın kurulabilir veya düzenlenebilirler.", "Sadece 30 yaşını doldurmuş vatandaşlar tarafından kurulabilirler.", "Kurulabilmeleri için mutlaka TBMM onayından geçmeleri gerekir."], "correctIndex": 2}'::jsonb,
  'Anayasa m. 33 (Dernek), m. 34 (Toplantı ve Gösteri Yürüyüşü) ve m. 51 (Sendika) açıkça hükme bağlamıştır: Herkes ''ÖNCEDEN İZİN ALMAKSIZIN'' dernek kurma, sendika kurma, silahsız ve saldırısız toplantı ve gösteri yürüyüşü yapma hakkına sahiptir.',
  'Halk arasında izin alınması gerektiği sanılır; anayasal olarak izin şartı KESİNLİKLE YOKTUR, sadece bildirim esastır.'
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
  'Vatandaşlık',
  'Temel Hak ve Ödevler',
  'multiple_choice',
  1,
  '1982 Anayasası''na göre bir derneğin kurulabilmesi için fiil ehliyetine sahip en az kaç gerçek veya tüzel kişinin bir araya gelmesi kanunen şarttır?',
  '{"options": ["3", "5", "7", "10", "30"], "correctIndex": 2}'::jsonb,
  'Dernekler Kanunu uyarınca en az 7 gerçek veya tüzel kişi bir araya gelerek dernek kurabilir. Siyasi parti kurmak için ise en az 30 Türk vatandaşı gerekir.',
  'Dernek = En az 7 kişi; Siyasi Parti = En az 30 kişi. Sayıları birbirine karıştırmayınız.'
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
  'Vatandaşlık',
  'Temel Hak ve Ödevler',
  'multiple_choice',
  1,
  'Aşağıdakilerden hangisi 1982 Anayasası''nda düzenlenen ''Siyasi Haklar ve Ödevler'' (Aktif Statü Hakları) grubunda yer almaz?',
  '{"options": ["Seçme, seçilme ve siyasi faaliyette bulunma hakkı", "Kamu hizmetlerine girme hakkı", "Dilekçe, bilgi edinme ve kamu denetçisine başvurma hakkı", "Vergi ödevi", "Toplu iş sözleşmesi ve grev hakkı"], "correctIndex": 4}'::jsonb,
  'Grev ve lokavt ile toplu iş sözleşmesi hakkı (m. 53-54) işçi-işveren ilişkilerini düzenleyen bir ''Sosyal ve Ekonomik (Pozitif Statü) Hak''tır. Seçme-seçilme, kamu hizmetine girme, dilekçe ve vergi ise ''Siyasi Hak ve Ödevler''dendir.',
  'Grev hakkı siyasi değil, sosyal ve ekonomik haktır! Memurların grev hakkı anayasada yasaktır.'
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
  'Vatandaşlık',
  'Temel Hak ve Ödevler',
  'multiple_choice',
  1,
  '1982 Anayasası''nın 15. maddesinde yer alan ve savaş, seferberlik veya olağanüstü hal (OHAL) dönemlerinde dahi KESİNLİKLE DOKUNULAMAYACAK olan ''Sert Çekirdek Haklar'' arasında aşağıdakilerden hangisi yer almaz?',
  '{"options": ["Kişinin yaşama hakkı, maddi ve manevi varlığının bütünlüğü (savaş hukukuna uygun ölümler hariç)", "Kimsenin din, vicdan, düşünce ve kanaatlerini açıklamaya zorlanamaması ve bunlardan dolayı suçlanamaması", "Suç ve cezaların geçmişe yürütülememesi ilkesi", "Suçluluğu mahkeme kararı ile saptanıncaya kadar kimsenin suçlu sayılamaması (Masumiyet karinesi)", "Mülkiyet hakkı ve miras hakkı"], "correctIndex": 4}'::jsonb,
  'Sert çekirdek haklar dörttür: 1) Yaşama hakkı ve vücut bütünlüğü, 2) Din ve vicdanını açıklamaya zorlanmama, 3) Masumiyet karinesi, 4) Suç ve cezaların geçmişe yürümemesi. Mülkiyet hakkı sert çekirdek hak değildir; OHAL ve savaşta sınırlandırılabilir ve el konulabilir.',
  'Savaşta dahi dokunulamayan haklar dörttür; mülkiyet ve seyahat hürriyeti bu grupta yer almaz.'
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
  'Vatandaşlık',
  'Temel Hak ve Ödevler',
  'multiple_choice',
  1,
  '1982 Anayasası''na göre ilköğretim eğitimi ile ilgili aşağıdaki ifadelerden hangisi anayasal bir kuraldır?',
  '{"options": ["Yalnızca erkek çocuklar için zorunludur.", "Kız ve erkek bütün vatandaşlar için zorunludur ve Devlet okullarında parasızdır.", "Ücreti velinin gelir durumuna göre okul aile birliğince belirlenir.", "Sadece 12 yaşından sonra başlar.", "Özel okullarda parasız olmak zorundadır."], "correctIndex": 1}'::jsonb,
  'Anayasa m. 42 açık hükmüdür: ''İlköğretim, kız ve erkek bütün vatandaşlar için zorunludur ve Devlet okullarında parasızdır.''',
  'İlköğretim devlet okullarında parasız ve tüm kız-erkek vatandaşlar için zorunlu olan anayasal temel haktır.'
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
  'Vatandaşlık',
  'Temel Hak ve Ödevler',
  'multiple_choice',
  1,
  '1982 Anayasası''na göre Türkiye Büyük Millet Meclisi Başkanlığı''na bağlı olarak kurulan ve idarenin işleyişiyle ilgili şikayetleri inceleyen ''Kamu Denetçiliği Kurumu''nun (Ombudsmanlık) başındaki Kamu Başdenetçisi kim tarafından seçilir?',
  '{"options": ["Cumhurbaşkanı", "Türkiye Büyük Millet Meclisi (TBMM)", "Anayasa Mahkemesi", "Danıştay Genel Kurulu", "Hakimler ve Savcılar Kurulu"], "correctIndex": 1}'::jsonb,
  'Kamu Denetçiliği Kurumu TBMM Başkanlığı''na bağlıdır ve Kamu Başdenetçisi TBMM Genel Kurulu tarafından gizli oyla dört turlu oylama usulüyle 4 yıl için seçilir.',
  'Kamu Başdenetçisini Cumhurbaşkanı DEĞİL, doğrudan TBMM seçer!'
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
  'Vatandaşlık',
  'Temel Hak ve Ödevler',
  'multiple_choice',
  1,
  '1982 Anayasası''nın 73. maddesinde düzenlenen vergi ödevi ile ilgili olarak ''Herkes, kamu giderlerini karşılamak üzere ......... göre vergi ödemekle yükümlüdür.'' ifadesindeki boşluğa aşağıdakilerden hangisi getirilmelidir?',
  '{"options": ["Eğitim düzeyine", "Yaşına", "Mali gücüne", "Mesleki kıdemine", "Medeni durumuna"], "correctIndex": 2}'::jsonb,
  'Anayasa m. 73: ''Herkes, kamu giderlerini karşılamak üzere, mali gücüne göre, vergi ödemekle yükümlüdür.'' Bu ilkeye verginin mali güce göre alınması (ödeme gücü) ilkesi denir.',
  'Vergide eşitlik herkesin aynı TL tutarını ödemesi demek değildir; herkesin mali gücüne göre (artan oranlı) ödemesidir.'
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
  'Vatandaşlık',
  'Temel Hak ve Ödevler',
  'multiple_choice',
  1,
  '1982 Anayasası''na göre Türk vatandaşlığı ile ilgili aşağıdaki hükümlerden hangisi yanlıştır?',
  '{"options": ["Türk Devletine vatandaşlık bağı ile bağlı olan herkes Türktür.", "Türk babanın veya Türk ananın çocuğu Türktür.", "Vatandaşlık, kanunun gösterdiği şartlarla kazanılır ve ancak kanunda belirtilen hallerde kaybedilir.", "Hiçbir Türk, vatana bağlılıkla bağdaşmayan bir eylemde bulunmadıkça vatandaşlıktan çıkarılamaz.", "Vatandaşlıktan çıkarma ile ilgili karar ve işlemlere karşı yargı yolu kesin olarak kapalıdır."], "correctIndex": 4}'::jsonb,
  'Anayasa m. 66 son fıkrası açıktır: ''Vatandaşlıktan çıkarma ile ilgili karar ve işlemlere karşı yargı yolu kapatılamaz.'' İptal davası Danıştay''da açılır.',
  'Vatandaşlıktan çıkarma işlemlerine karşı yargı yolu açıktır; yargı denetimi asla engellenemez.'
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
  'Vatandaşlık',
  'Temel Hak ve Ödevler',
  'multiple_choice',
  2,
  '1982 Anayasası''na göre bir kimseye ''yurt dışına çıkma yasağı'' hangi makam tarafından ve hangi gerekçeyle konulabilir?',
  '{"options": ["Vergi dairesi müdürü tarafından vergi borcundan ötürü", "Yalnızca suç soruşturması veya kovuşturması sebebiyle HÂKİM KARARIYLA", "İçişleri Bakanı''nın idari genelgesiyle", "Emniyet Genel Müdürlüğü''nün güvenlik gerekçesiyle", "Valilik kararıyla il sınırları içinde"], "correctIndex": 1}'::jsonb,
  '2010 anayasa değişikliği ile Anayasa m. 23 değiştirilmiştir: Vatandaşın yurt dışına çıkma hürriyeti, ANCAK suç soruşturması veya kovuşturması sebebiyle HÂKİM KARARINA bağlı olarak sınırlanabilir. İdarenin vergi borcu sebebiyle yurtdışı yasağı koyma yetkisi tamamen kaldırılmıştır.',
  'Vergi borcu sebebiyle yurtdışı çıkış yasağı konulamaz! Yasak sadece hakim kararıyla ve ceza soruşturması/kovuşturması için verilebilir.'
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
  'Vatandaşlık',
  'Temel Hak ve Ödevler',
  'multiple_choice',
  2,
  '1982 Anayasası''na göre siyasi partilere üye olabilecek ve üye olamayacak kişiler dikkate alındığında aşağıdakilerden hangisi siyasi partilere ÜYE OLABİLİR?',
  '{"options": ["Yargıtay ve Danıştay daire başkanları ve üyeleri", "Devlet memurları", "Silahlı Kuvvetler mensupları (subay, astsubay, uzman erbaş)", "Yükseköğretim elemanları (üniversite profesör ve doçentleri) ve yükseköğretim öğrencileri", "Askeri öğrenciler ve lise öğrencileri"], "correctIndex": 3}'::jsonb,
  'Anayasa m. 68 uyarınca hakimler-savcılar, memurlar, askerler ve lise öğrencileri partilere üye olamaz. Ancak Yükseköğretim elemanları (öğretim üyeleri) sadece merkez organlarında görev almak şartıyla ve Yükseköğretim öğrencileri (üniversite öğrencileri) siyasi partilere ÜYE OLABİLİRLER.',
  'Üniversite hocaları ve üniversite öğrencileri siyasi partilere üye olabilir; memurlar ve lise öğrencileri ise üye olamaz!'
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
  'Vatandaşlık',
  'Temel Hak ve Ödevler',
  'multiple_choice',
  2,
  '1982 Anayasası''nda yer alan ''Suçluluğu hükmen sabit oluncaya kadar, kimse suçlu sayılamaz.'' hükmü ceza muhakemesinin hangi evrensel ilkesinin ifadesidir?',
  '{"options": ["Kanunilik ilkesi", "Masumiyet (Suçsuzluk) Karinesi", "Cezaların şahsiliği", "Adil yargılanma hakkı", "Aleniyet ilkesi"], "correctIndex": 1}'::jsonb,
  'Hakkında kesinleşmiş mahkumiyet kararı verilinceye kadar herkes hukuken masumdur. Buna ''masumiyet karinesi'' denir ve Anayasa m. 15 uyarınca savaş halinde bile dokunulamayan sert çekirdek haktır.',
  'Kişi gözaltına alınsa veya tutuklansa bile masumiyet karinesi devam eder; suçlu sayılması için kararın kesinleşmesi şarttır.'
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
  'Vatandaşlık',
  'Temel Hak ve Ödevler',
  'multiple_choice',
  2,
  'Özel hayatın gizliliği ve konut dokunulmazlığı anayasal güvence altındadır.

Bir kimsenin üstü, özel kağıtları ve eşyası aranamaz ve bunlara el konulamaz kuralının istisnası olarak arama ve el koyma işlemi kural olarak kimin kararıyla yapılabilir?',
  '{"options": ["Valilik genelgesiyle", "Hâkim kararıyla (gecikmesinde sakınca bulunan hallerde kanunla yetkili kılınan merciin yazılı emriyle)", "Kolluk amirinin sözlü talimatıyla", "Muhtarın izniyle", "Apartman yöneticisinin rızasıyla"], "correctIndex": 1}'::jsonb,
  'Anayasa m. 20 ve 21''e göre üst araması, konut araması ve el koyma kural olarak HÂKİM KARARI ile yapılır. Gecikmesinde sakınca bulunan hallerde yetkili merciin yazılı emri gerekir ve bu emir 24 saat içinde görevli hakimin onayına sunulmalıdır.',
  'Sözlü emirle arama yapılamaz; hakim kararı veya gecikmesinde sakınca olan hallerde yetkili merciin YAZILI emri şarttır.'
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
  'Vatandaşlık',
  'Temel Hak ve Ödevler',
  'multiple_choice',
  2,
  '1982 Anayasası''nda 2001 yılında yapılan değişiklikle temel hak ve hürriyetlerin sınırlandırılması rejiminden aşağıdakilerden hangisi tamamen çıkarılmıştır?',
  '{"options": ["Kanunla sınırlama kuralı", "Ölçülülük ilkesi", "Genel sınırlama sebepleri", "Hakkın özüne dokunma yasağı", "Demokratik toplum düzeninin gerekleri"], "correctIndex": 2}'::jsonb,
  '2001 anayasa değişikliğine kadar anayasada tüm haklar için geçerli ''kamu düzeni, milli güvenlik'' gibi torba genel sınırlama sebepleri vardı. 2001''de bu genel sınırlama sebepleri kaldırılmış; her hak için sadece kendi maddesinde yazan ÖZEL SEBEPLERLE sınırlama esası getirilmiştir.',
  'Genel sınırlama sebepleri artık yoktur! Sınırlama sadece o hakkın maddesindeki ÖZEL sınırlama sebebine dayanabilir.'
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
  'Vatandaşlık',
  'Temel Hak ve Ödevler',
  'multiple_choice',
  2,
  'Kişi hürriyeti ve güvenliği kapsamında yakalanan veya tutuklanan bir kimse, tutulma yerine en yakın mahkemeye gönderilmesi için gerekli süre hariç en geç kaç saat içinde hâkim önüne çıkarılmalıdır?',
  '{"options": ["12 saat", "24 saat", "48 saat (Toplu işlenen suçlarda en çok 4 gün)", "72 saat", "7 gün"], "correctIndex": 2}'::jsonb,
  'Anayasa m. 19 uyarınca yakalanan veya tutuklanan kişi bireysel suçlarda en geç 48 SAAT; toplu olarak işlenen suçlarda ise en çok 4 GÜN içinde hâkim önüne çıkarılmak zorundadır.',
  'Bireysel suçlarda 48 saat, toplu suçlarda 4 gündür. Süreler yol süresi hariç tutularak hesaplanır.'
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
  'Vatandaşlık',
  'Temel Hak ve Ödevler',
  'multiple_choice',
  2,
  'Kamulaştırma (istimlak), devlet veya kamu tüzel kişilerinin kamu yararının gerektirdiği hallerde özel mülkiyetteki bir taşınmazın mülkiyetini zorla devralmasıdır.

Kamulaştırma bedeli kural olarak nasıl ödenir?',
  '{"options": ["Hisse senedi ile", "Devlet tahvili ile", "Nakit ve peşin olarak", "5 eşit taksitle", "Gayrimenkul takası ile"], "correctIndex": 2}'::jsonb,
  'Anayasa m. 46 uyarınca kamulaştırma bedeli kural olarak NAKİT VE PEŞİN ödenir. İstisnai olarak büyük enerji, sulama, tarım ve orman projelerinde taksitle (en çok 5 yılda ve kamu alacaklarına uygulanan en yüksek faizle) ödenebilir.',
  'Kural nakit ve peşindir! Taksitlendirme sadece anayasada sayılan istisnai büyük projeler için en fazla 5 yıl geçerlidir.'
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
  'Vatandaşlık',
  'Temel Hak ve Ödevler',
  'multiple_choice',
  2,
  'Devlet memurlarının ve kamu görevlilerinin kanunen ''Mal Bildiriminde Bulunma'' zorunluluğu bulunmaktadır.

Devlet memurları genel mal bildirimlerini sonu hangi rakamlarla biten yıllarda ve en geç hangi ayın sonuna kadar yenilemek zorundadır?',
  '{"options": ["Sonu 0 ve 5 ile biten yıllarda — Şubat ayı sonuna kadar", "Sonu 1 ve 6 ile biten yıllarda — Ocak ayı sonuna kadar", "Sonu çift rakamla biten yıllarda — Aralık ayı sonuna kadar", "Her yılın başında — Ocak ayı sonuna kadar", "Sonu 3 ve 8 ile biten yıllarda — Mart ayı sonuna kadar"], "correctIndex": 0}'::jsonb,
  '3628 sayılı Mal Bildiriminde Bulunulması Kanunu uyarınca memurlar sonu 0 ve 5 ile biten yıllarda (örn. 2020, 2025, 2030) en geç Şubat ayı sonuna kadar mal bildirimlerini yenilemek zorundadırlar.',
  'Sonu 0 ve 5 ile biten yıllar ve Şubat ayı sonu! Bu süre ve kural KPSS''de doğrudan bilgi sorusu olarak sorulur.'
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
  'Vatandaşlık',
  'Temel Hak ve Ödevler',
  'multiple_choice',
  2,
  '1982 Anayasası''na göre ''Dilekçe Hakkı''nın kullanılması ve yabancıların bu haktan yararlanabilmesi ile ilgili şart aşağıdakilerden hangisidir?',
  '{"options": ["Yabancının en az 10 yıldır Türkiye''de ikamet etmesi", "Yabancının Türkçe bilmesi ve Türk vatandaşıyla evli olması", "Karşılıklılık (mütekabiliyet) esası gözetilmek ve dilekçenin Türkçe yazılması kaydıyla Türkiye''de oturan yabancılar da yararlanabilir", "Yabancılar dilekçe hakkından hiçbir şekilde yararlanamaz", "Yabancıların yalnızca kendi elçiliklerine dilekçe verebilmesi"], "correctIndex": 2}'::jsonb,
  'Anayasa m. 74 uyarınca Türkiye''de ikamet eden yabancılar; dilekçelerini Türkçe yazmak ve kendi ülkelerinde de Türk vatandaşlarına bu hakkın tanınmış olması (karşılıklılık/mütekabiliyet) şartıyla dilekçe hakkından faydalanabilirler.',
  'Yabancıların dilekçe verebilmesi için iki şart vardır: Karşılıklılık (mütekabiliyet) ve dilekçenin Türkçe yazılmış olması.'
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
  'Vatandaşlık',
  'Temel Hak ve Ödevler',
  'multiple_choice',
  2,
  'I. Hak arama hürriyeti
II. Mülkiyet hakkı
III. İspat hakkı
IV. Basın hürriyeti

Yukarıda verilen haklar Jellinek sınıflandırmasına göre hangi hak kategorisinde yer alır?',
  '{"options": ["Sosyal ve Ekonomik Haklar (Pozitif Statü)", "Kişisel Haklar ve Ödevler (Negatif Statü)", "Siyasi Haklar ve Ödevler (Aktif Statü)", "Kollektif Dayanışma Hakları", "Çevre ve Barış Hakları"], "correctIndex": 1}'::jsonb,
  'Hak arama hürriyeti (m. 36), ispat hakkı (m. 39), mülkiyet hakkı (m. 35) ve basın hürriyeti (m. 28) Anayasa''nın İkinci Bölümünde ''Kişinin Hakları ve Ödevleri'' (Negatif Statü Hakları) başlığı altında düzenlenmiştir.',
  'Mülkiyet hakkı adında ''ekonomik'' çağrışım yapsa da anayasada Sosyal-Ekonomik haklarda DEĞİL, Kişisel Haklar (Negatif Statü) bölümündedir!'
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
  'Vatandaşlık',
  'Temel Hak ve Ödevler',
  'multiple_choice',
  2,
  '1982 Anayasası''na göre basımevi (matbaa) kurma hürriyeti ile ilgili aşağıdaki anayasal güvencelerden hangisi doğrudur?',
  '{"options": ["Basımevi kurmak için önceden izin alma ve mali teminat yatırma şartı konulamaz.", "Basımevi ancak İletişim Başkanlığı''nın izniyle kurulabilir.", "Basımevleri sadece anonim şirket şeklinde kurulabilir.", "Basımevi açabilmek için en az 10 yıl gazetecilik yapmış olmak şarttır.", "Basımevi kurmak yalnızca kamu tüzel kişilerine tanınmış bir imtiyazdır."], "correctIndex": 0}'::jsonb,
  'Anayasa m. 29 uyarınca basımevi kurmak, izin alma ve mali teminat yatırma şartına bağlanamaz. Ayrıca kanuna uygun kurulmuş bir basımevi ve eklentileri suç aleti olduğu gerekçesiyle zapt ve müsadere edilemez.',
  'Basımevi kurmak için izin alma şartı da mali teminat yatırma şartı da anayasa ile kesin olarak yasaklanmıştır.'
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
  'Vatandaşlık',
  'Temel Hak ve Ödevler',
  'multiple_choice',
  2,
  'Din ve ahlak eğitimi ile ilgili 1982 Anayasası''nda yer alan kural aşağıdakilerden hangisidir?',
  '{"options": ["Din eğitimi tamamen yasaklanmıştır.", "Din ve ahlak eğitim ve öğretimi Devletin gözetim ve denetimi altında yapılır; din kültürü ve ahlak öğretimi ilk ve ortaöğretim kurumlarında okutulan zorunlu dersler arasındadır.", "Din eğitimi sadece vakıf ve dernekler tarafından verilebilir.", "Din dersleri sadece üniversitelerde seçmeli ders olarak verilir.", "Din dersi almayan öğrencilere mezuniyet belgesi verilemez."], "correctIndex": 1}'::jsonb,
  'Anayasa m. 24/4 gereğince din ve ahlak eğitim ve öğretimi devletin gözetim ve denetimi altında yapılır. Din kültürü ve ahlak öğretimi ilk ve ortaöğretim kurumlarında okutulan zorunlu derslerdendir.',
  'Din kültürü ve ahlak öğretimi anayasal olarak ilk ve ortaöğretimde ZORUNLU derstir; bunun dışındaki özel dini eğitim ise kişinin kendi, küçüklerin ise kanuni temsilcisinin isteğine bağlıdır.'
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
  'Vatandaşlık',
  'Temel Hak ve Ödevler',
  'multiple_choice',
  2,
  '1982 Anayasası''nın 51. maddesinde düzenlenen ''Sendika Kurma Hakkı'' ile ilgili aşağıdaki hükümlerden hangisi doğrudur?',
  '{"options": ["Sendika kurabilmek için Çalışma ve Sosyal Güvenlik Bakanlığı''ndan önceden ruhsat alınmalıdır.", "Çalışanlar ve işverenler, önceden izin almaksızın sendikalar ve üst kuruluşlar kurma, bunlara serbestçe üye olma ve üyelikten çekilme hakkına sahiptir.", "Bir kimse aynı zamanda ve aynı işkolunda birden çok sendikaya kesinlikle üye olamaz.", "Sendika kurucularının en az 50 yaşında olması şarttır.", "Sendikaların grev kararı alması kanunen yasaktır."], "correctIndex": 1}'::jsonb,
  'Sendika kurma hakkı önceden izin almaksızın serbestçe kullanılır. Ayrıca 2010 anayasa değişikliği ile ''aynı zamanda ve aynı işkolunda birden çok sendikaya üye olunamaz'' yasağı kaldırılmıştır.',
  'Sendika kurmak için izin gerekmez; ayrıca 2010''dan beri aynı işkolunda birden çok sendikaya üye olma yasağı kaldırılmıştır.'
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
  'Vatandaşlık',
  'Temel Hak ve Ödevler',
  'multiple_choice',
  2,
  '1982 Anayasası''na göre toplu iş sözleşmesi yapılması sırasında uyuşmazlık çıkması halinde işçilerin sahip olduğu anayasal hak aşağıdakilerden hangisidir?',
  '{"options": ["Grev hakkı", "Lokavt hakkı", "İstifa hakkı", "İşyerini işgal hakkı", "Genel grev hakkı"], "correctIndex": 0}'::jsonb,
  'Anayasa m. 54 uyarınca toplu iş sözleşmesinin yapılması sırasında uyuşmazlık çıkması halinde işçiler grev hakkına sahiptirler. İşverenler ise lokavt hakkına sahiptir.',
  'İşçinin hakkı Grev; işverenin karşı hakkı ise Lokavttır.'
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
  'Vatandaşlık',
  'Temel Hak ve Ödevler',
  'multiple_choice',
  2,
  'Devlet memurları ve kamu görevlilerinin grev yapma hakkı anayasal olarak nasıl düzenlenmiştir?',
  '{"options": ["Memurlar da işçiler gibi serbestçe grev yapabilirler.", "Anayasa m. 54 uyarınca memurların grev yapması kesin olarak yasaklanmıştır; memurlara sadece toplu sözleşme hakkı tanınmıştır.", "Sadece amirlerinin izin verdiği günlerde grev yapabilirler.", "Yılda en fazla 3 gün grev yapabilirler.", "Grev hakkı yalnızca sağlık memurlarına tanınmıştır."], "correctIndex": 1}'::jsonb,
  'Memurlara 2010 anayasa değişikliği ile ''toplu sözleşme'' yapma hakkı verilmiştir; uyuşmazlık durumunda Kamu Görevlileri Hakem Kurulu''na gidilir. Ancak memurların GREV YAPMA HAKKI KESİNLİKLE YOKTUR.',
  'Memurların toplu sözleşme hakkı vardır ama GREV HAKLARI KESİNLİKLE YOKTUR!'
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
  'Vatandaşlık',
  'Temel Hak ve Ödevler',
  'multiple_choice',
  2,
  '1982 Anayasası''nın 56. maddesinde yer alan ''Çevre Hakkı'' ile ilgili aşağıdaki ifadelerden hangisi anayasal bir gerçektir?',
  '{"options": ["Çevreyi geliştirmek ve çevre sağlığını korumak yalnızca Devletin ödevidir.", "Çevreyi geliştirmek, çevre sağlığını korumak ve çevre kirlenmesini önlemek hem Devletin hem de vatandaşların ortak ödevidir.", "Çevre hakkı sadece orman köylülerine tanınmış bir haktır.", "Sanayi tesislerine çevre kirliliği sebebiyle ceza verilemez.", "Çevre hakkı bir siyasi haktır."], "correctIndex": 1}'::jsonb,
  'Anayasa m. 56: ''Herkes, sağlıklı ve dengeli bir çevrede yaşama hakkına sahiptir. Çevreyi geliştirmek, çevre sağlığını korumak ve çevre kirlenmesini önlemek Devletin ve vatandaşların ödevidir.'' Hem hak hem ödev niteliğindedir.',
  'Çevreyi korumak sadece devletin değil; hem devletin hem de vatandaşın anayasal görevidir.'
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
  'Vatandaşlık',
  'Temel Hak ve Ödevler',
  'multiple_choice',
  2,
  'Kişinin kamu makamları ve üçüncü kişiler tarafından izlenmeden, mektup, telefon, internet ve e-posta gibi iletişim araçlarıyla serbestçe haberleşebilmesini güvence altına alan hak hangisidir?',
  '{"options": ["Haberleşme hürriyeti", "Basın hürriyeti", "Hak arama hürriyeti", "İfade hürriyeti", "Düşünce hürriyeti"], "correctIndex": 0}'::jsonb,
  'Anayasa m. 22 uyarınca herkes haberleşme hürriyetine sahiptir. Haberleşmenin gizliliği esastır. Hakim kararı olmadıkça haberleşme engellenemez ve gizliliğine dokunulamaz.',
  'Haberleşme hürriyeti bir kişisel (negatif statü) haktır.'
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
  'Vatandaşlık',
  'Temel Hak ve Ödevler',
  'multiple_choice',
  2,
  '1982 Anayasası''na göre ''Düzeltme ve Cevap Hakkı'' (Tekzip Hakkı) hangi durumda ve nasıl doğar?',
  '{"options": ["Sadece siyasi partilerin talebiyle doğar.", "Ancak kişilerin haysiyet ve şereflerine dokunulması veya kendileriyle ilgili gerçeğe aykırı yayınlar yapılması hallerinde tanınır ve kanunla düzenlenir.", "Her gazete haberine karşı doğrudan para cezası kesilmesini sağlar.", "Yalnızca devlet televizyonu yayınları için geçerlidir.", "Sadece internet sitelerindeki yorumlar için geçerlidir."], "correctIndex": 1}'::jsonb,
  'Anayasa m. 32 uyarınca düzeltme ve cevap hakkı, ancak kişilerin şeref ve haysiyetine dokunulması veya gerçeğe aykırı yayın yapılması halinde doğar. Düzeltme yayımlanmazsa hakim kararıyla yayımlatılır.',
  'Tekzip (düzeltme ve cevap hakkı) basın hürriyetine karşı bireyin şeref ve haysiyetini koruyan anayasal dengedir.'
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
  'Vatandaşlık',
  'Temel Hak ve Ödevler',
  'multiple_choice',
  2,
  '1982 Anayasası''nda yer alan ''Sosyal Güvenlik Hakkı'' (m. 60) ile ilgili kural aşağıdakilerden hangisidir?',
  '{"options": ["Sosyal güvenlik sadece memurlar için geçerlidir.", "Herkes, sosyal güvenlik hakkına sahiptir. Devlet, bu güvenliği sağlayacak gerekli tedbirleri alır ve teşkilatı kurar.", "Sosyal güvenlik primlerini yalnızca devlet öder.", "Sosyal güvenlik hakkından yabancılar hiçbir şekilde faydalanamaz.", "Sosyal güvenlik sistemi sadece 65 yaşından sonra devreye girer."], "correctIndex": 1}'::jsonb,
  'Anayasa m. 60 amir hükmüdür: ''Herkes, sosyal güvenlik hakkına sahiptir. Devlet, bu güvenliği sağlayacak gerekli tedbirleri alır ve teşkilatı kurar.'' SGK bu anayasal emrin sonucudur.',
  'Sosyal güvenlik hakkı devletten hizmet talep edilen bir sosyal ve ekonomik haktır.'
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
  'Vatandaşlık',
  'Temel Hak ve Ödevler',
  'multiple_choice',
  2,
  'Anayasa m. 72''de düzenlenen ''Vatan Hizmeti'' (askerlik ödevi) ile ilgili aşağıdaki anayasal hüküm hangisidir?',
  '{"options": ["Yalnızca erkekler için zorunlu ve sadece kışlada silah altında yapılır.", "Vatan hizmeti, her Türkün hakkı ve ödevidir. Bu hizmetin Silahlı Kuvvetlerde veya kamu hizmetlerinde ne şekilde yerine getirileceği veya getirilmiş sayılacağı kanunla düzenlenir.", "Vatan hizmeti sadece gönüllülük esasına dayanır.", "Vatan hizmeti sadece savaş zamanında geçerlidir.", "Bedelli askerlik anayasada açıkça yasaklanmıştır."], "correctIndex": 1}'::jsonb,
  'Anayasa m. 72 uyarınca vatan hizmeti her Türkün hem hakkı hem ödevidir; askerlik hizmetinin ordu bünyesinde veya kamu hizmetinde ne şekilde ifa edileceği kanuna bırakılmıştır.',
  'Vatan hizmeti anayasada hem ''hak'' hem de ''ödev'' olarak nitelenen tek hizmettir ve kamu hizmeti şeklinde ifası da anayasal olarak mümkündür.'
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
  'Vatandaşlık',
  'Temel Hak ve Ödevler',
  'multiple_choice',
  3,
  'Temel hak ve hürriyetlerin sınırlandırılmasında uygulanan ''Ölçülülük İlkesi'' kendi içinde üç alt ilkeden oluşur.

Aşağıdakilerden hangisi ölçülülük ilkesinin bu üç alt unsurundan biri DEĞİLDİR?',
  '{"options": ["Elverişlilik (Sınırlama aracının ulaşılmak istenen amaca uygun olması)", "Gereklilik / Zorunluluk (Amaca ulaşmak için hakka daha az müdahale eden başka bir aracın bulunmaması)", "Orantılılık (Araç ile amaç arasında makul ve hakkaniyete uygun bir dengenin bulunması)", "Geriye Yürümezlik (Sınırlamanın sadece geçmiş olaylara uygulanması)", "Hakkın özünü zedelemeyecek asgari düzeyde kalınması"], "correctIndex": 3}'::jsonb,
  'Ölçülülük ilkesi üç alt ilkeden oluşur: 1) Elverişlilik, 2) Gereklilik (zorunluluk) ve 3) Orantılılık. ''Geriye yürümezlik'' ölçülülüğün bir unsuru değil, ceza hukukunun ayrı bir güvence ilkesidir.',
  'Ölçülülüğün üç sacayağı: Elverişlilik, Gereklilik ve Orantılılıktır. Bu üçlü Anayasa Mahkemesi kararlarının ana denetim kriteridir.'
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
  'Vatandaşlık',
  'Temel Hak ve Ödevler',
  'multiple_choice',
  3,
  'Anayasa m. 38 uyarınca ''Kanuna aykırı olarak elde edilmiş bulgular, delil olarak kabul edilemez.'' hükmü ceza muhakemesinde hangi ilkeyi mutlak kılmıştır?',
  '{"options": ["Hukuka aykırı delillerin ceza yargılamasında hükme esas alınması yasağı (Zehirli ağacın meyvesi de zehirlidir)", "Hâkimin delilleri serbestçe takdir etme yetkisi", "Sanığın susma hakkını kullanmasının suç ikrarı sayılması", "İtirafın tek başına kesin delil teşkil etmesi", "Polisin mahkeme kararı olmadan dilediği gibi dinleme yapabilmesi"], "correctIndex": 0}'::jsonb,
  'Hukuka aykırı yollarla (işkence, izinsiz ses kaydı, yasa dışı ortam dinlemesi vb.) elde edilen bulgular mahkemede delil olarak kullanılamaz; sanık bu delillere dayanılarak cezalandırılamaz.',
  'Delil doğru bile olsa (örneğin cinayet silahı bulunsa bile) elde edilişi hukuka aykırıysa dosyadan çıkarılır ve hükme esas alınamaz.'
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
  'Vatandaşlık',
  'Temel Hak ve Ödevler',
  'multiple_choice',
  3,
  '1982 Anayasası''na göre ''Siyasi Partilerin Uyacakları Esaslar ve Yasaklar'' düşünüldüğünde aşağıdakilerden hangisi yanlıştır?',
  '{"options": ["Siyasi partiler ticari faaliyetlere girişemezler.", "Siyasi partiler yabancı devletlerden, uluslararası kuruluşlardan ve yabancı uyruklu kişilerden maddi yardım alamazlar.", "Yabancı devletlerden yardım alan siyasi partiler Anayasa Mahkemesi tarafından temelli kapatılır.", "Siyasi partilerin gelir ve giderlerinin denetimi Danıştay tarafından yapılır.", "Siyasi partiler demokratik devlet ilkelerine aykırı faaliyette bulunamazlar."], "correctIndex": 3}'::jsonb,
  'Anayasa m. 69 uyarınca siyasi partilerin mali denetimini (gelir-gider hesaplarını) Danıştay değil, doğrudan ANAYASA MAHKEMESİ yapar. Anayasa Mahkemesi bu denetimi yaparken Sayıştay''dan yardım alır.',
  'Siyasi partilerin mali denetimini yapan organ ANAYASA MAHKEMESİ''dir (Sayıştay yardım eder, rapor hazırlar ama karar AYM''nindir; Danıştay''ın ilgisi yoktur).'
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
  'Vatandaşlık',
  'Temel Hak ve Ödevler',
  'multiple_choice',
  3,
  'Anayasa Mahkemesi''ne ''Bireysel Başvuru'' hakkı Türk hukukuna hangi yıl yapılan anayasa değişikliği ile girmiştir ve bu başvurunun temel ön şartı nedir?',
  '{"options": ["1982''de girmiştir — Doğrudan başvuru esastır", "2001''de girmiştir — TBMM Başkanı''nın onayı şarttır", "2010''da girmiştir — Olağan kanun yollarının (istinaf, temyiz) tamamının tüketilmiş olması şarttır", "2017''de girmiştir — Adalet Bakanlığı''nın izni gerekir", "1961''de girmiştir — Sadece milletvekilleri başvurabilir"], "correctIndex": 2}'::jsonb,
  'Bireysel başvuru hakkı 2010 anayasa referandumu ile kabul edilmiştir. Temel hak ve özgürlükleri ihlal edilen herkes, olağan kanun yollarını (ilk derece, istinaf, Yargıtay/Danıştay) tamamen tükettikten sonra 30 gün içinde Anayasa Mahkemesi''ne bireysel başvuruda bulunabilir.',
  'Bireysel başvuru 2010 yılında gelmiştir ve ''tüm iç hukuk yollarının tüketilmesi'' zorunlu dava şartıdır.'
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
  'Vatandaşlık',
  'Temel Hak ve Ödevler',
  'multiple_choice',
  3,
  'Anayasa Mahkemesi''ne yapılan bireysel başvurularda hangi hak ihlalleri incelenebilir?',
  '{"options": ["Anayasada yer alan haklardan herhangi birinin ihlal edilmesi yeterlidir.", "Yalnızca Anayasa''da güvence altına alınmış VE AYNI ZAMANDA Avrupa İnsan Hakları Sözleşmesi (AİHS) ve Türkiye''nin taraf olduğu ek protokollerde yer alan ortak temel hak ve hürriyetler", "Sadece ticaret ve borçlar hukukundan kaynaklanan alacak davaları", "Sadece vergi uyuşmazlıkları", "Yalnızca memurların disiplin cezaları"], "correctIndex": 1}'::jsonb,
  'Anayasa m. 148 uyarınca her hak için AYM''ye gidilemez. Başvurunun kabul edilebilmesi için ihlal edildiği iddia edilen hakkın HEM Anayasamızda HEM DE Avrupa İnsan Hakları Sözleşmesi''nde (AİHS) ortaklaşa korunan haklardan biri olması şarttır.',
  'Örn. Anayasa''da olup AİHS''te olmayan bir hak (veya tersi) için AYM''ye bireysel başvuru yapılamaz; ÇİFTE KORUMA (ortak alan) şarttır.'
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
  'Vatandaşlık',
  'Temel Hak ve Ödevler',
  'multiple_choice',
  3,
  '1982 Anayasası''na göre temelli kapatılan bir siyasi partinin kapatılmasına beyan veya eylemleriyle sebep olan kurucuları ve üyeleri için uygulanan ''siyaset yasağı'' süresi ne kadardır?',
  '{"options": ["1 yıl", "3 yıl", "5 yıl", "10 yıl", "Ömür boyu"], "correctIndex": 2}'::jsonb,
  'Anayasa m. 69 uyarınca temelli kapatılan bir partinin kapatılmasına sebep olan kişiler, Anayasa Mahkemesi''nin gerekçeli kararının Resmî Gazete''de yayımlanmasından başlayarak 5 YIL süreyle bir başka partinin kurucusu, üyesi, yöneticisi veya deneticisi olamazlar (bağımsız milletvekili olabilirler).',
  'Siyaset yasağı 5 yıldır; bu kişiler parti üyesi veya yöneticisi olamazlar ancak BAĞIMSIZ aday olarak seçime girebilirler!'
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
  'Vatandaşlık',
  'Temel Hak ve Ödevler',
  'multiple_choice',
  3,
  '1982 Anayasası''nda yer alan ''Devletleştirme'' ile ''Kamulaştırma'' arasındaki temel hukuki fark aşağıdakilerden hangisidir?',
  '{"options": ["Kamulaştırmada taşınır mallar, devletleştirmede taşınmaz mallar alınır.", "Kamulaştırmada kamu yararı amacıyla özel bir taşınmaz mülkiyeti alınırken; devletleştirmede kamu hizmeti niteliği taşıyan özel bir ''teşebbüs / işletme'' kamu yararı zorunlu kıldığında kanunla devlete mal edilir.", "Kamulaştırma bedeli ödenmez, devletleştirme bedeli ödenir.", "Kamulaştırma kanunla yapılır, devletleştirme yönetmelikle yapılır.", "İkisi arasında hiçbir fark yoktur."], "correctIndex": 1}'::jsonb,
  'Kamulaştırma (istimlak - m. 46) arsa, bina, tarla gibi özel taşınmaz malların kamu mülkiyetine geçirilmesidir. Devletleştirme (m. 47) ise elektrik dağıtım şirketi, fabrika, liman işletmesi gibi kamu hizmeti gören özel bir ticari işletmenin/şirketin kanunla devlete geçirilmesidir.',
  'Taşınmaz mal = Kamulaştırma; Özel teşebbüs ve şirket = Devletleştirme!'
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
  'Vatandaşlık',
  'Temel Hak ve Ödevler',
  'multiple_choice',
  3,
  'Yerleşme ve seyahat hürriyetinin (m. 23) sınırlandırılması nedenleri anayasada ayrı ayrı sayılmıştır.

Aşağıdakilerden hangisi yalnızca ''Yerleşme Hürriyeti''nin sınırlandırılma sebepleri arasında yer alır (seyahat hürriyeti için geçerli değildir)?',
  '{"options": ["Suç soruşturması ve kovuşturması", "Suç işlenmesini önlemek", "Sosyal ve ekonomik gelişmeyi sağlamak, sağlıklı ve düzenli kentleşmeyi gerçekleştirmek ve kamu mallarını korumak", "Salgın hastalıkların yayılmasını engellemek", "Ceza infazını sağlamak"], "correctIndex": 2}'::jsonb,
  'Sağlıklı ve düzenli kentleşmeyi gerçekleştirmek, kaçak yapılaşmayı önlemek ve kamu mallarını korumak YERLEŞME hürriyetinin özel sınırlandırma sebebidir. Bir kimsenin bir şehre seyahat etmesi kentleşmeyi bozmaz; oraya yerleşip gecekondu yapması yerleşme yasağını doğurur.',
  'Düzenli kentleşme ve kamu mallarını koruma yalnızca YERLEŞME hürriyetinin sınırlandırma sebebidir; seyahat hürriyetini sınırlayamaz.'
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
  'Vatandaşlık',
  'Temel Hak ve Ödevler',
  'multiple_choice',
  3,
  'I. Yabancı bir devletten izin almaksızın vatandaşlık alan bir Türk vatandaşı doğrudan Türk vatandaşlığından çıkarılır.
II. Vatandaşlıktan çıkarma kararlarına karşı Danıştay''da iptal davası açılabilir.
III. Vatandaşlıktan çıkarılan kişinin eş ve çocukları da kendiliğinden Türk vatandaşlığını kaybeder.

Yukarıdaki ifadelerden hangileri doğrudur?',
  '{"options": ["Yalnız I", "Yalnız II", "I ve III", "II ve III", "I, II ve III"], "correctIndex": 1}'::jsonb,
  'I yanlıştır; Türkiye''de çifte vatandaşlık serbesttir, yabancı vatandaşlık alan doğrudan çıkarılmaz. III yanlıştır; vatandaşlıktan çıkarma şahsidir, eş ve çocukların vatandaşlığını etkilemez. II doğrudur; vatandaşlıktan çıkarmaya karşı Danıştay''da iptal davası açılabilir.',
  'Vatandaşlıktan çıkarma cezası şahsidir; babanın veya annenin çıkarılması çocukları ve eşi etkilemez!'
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
  'Vatandaşlık',
  'Temel Hak ve Ödevler',
  'multiple_choice',
  3,
  '1982 Anayasası''nın 65. maddesinde yer alan ''Devlet, sosyal ve ekonomik alanlarda Anayasa ile belirlenen ödevlerini, bu ödevlerin amaçlarına uygun öncelikleri gözeterek ......... ölçüsünde yerine getirir.'' hükmünde boş bırakılan yere aşağıdakilerden hangisi gelmelidir?',
  '{"options": ["Milletlerarası kuruluşların onayladığı", "Mali kaynaklarının yeterliliği", "Nüfus artış hızı", "Muhalefet partilerinin mutabakatı", "Askeri harcamalardan artan pay"], "correctIndex": 1}'::jsonb,
  'Anayasa m. 65: ''Devlet, sosyal ve ekonomik alanlarda Anayasa ile belirlenen ödevlerini, bu ödevlerin amaçlarına uygun öncelikleri gözeterek, MALİ KAYNAKLARININ YETERLİLİĞİ ölçüsünde yerine getirir.'' Devlet param yetmiyor derse vatandaşa konut veya iş vermek zorunda bırakılamaz.',
  'Devletin sosyal hakları yerine getirmesindeki anayasal fren ''mali kaynaklarının yeterliliği''dir.'
);

COMMIT;
