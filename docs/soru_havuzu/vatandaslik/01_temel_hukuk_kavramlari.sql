-- =============================================================
-- KPSS VATANDAŞLIK — KONU 1: TEMEL HUKUK KAVRAMLARI
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
  'Temel Hukuk Kavramları',
  'multiple_choice',
  1,
  'Toplumsal düzeni sağlayan din kuralları, ahlak kuralları ve görgü kuralları gibi sosyal kurallardan hukuk kurallarını ayıran en temel özellik aşağıdakilerden hangisidir?',
  '{"options": ["Yazılı olma zorunluluğunun bulunması", "Maddi (kamu/devlet gücüne dayalı) bir yaptırıma (müeyyideye) sahip olması", "Sadece ceza alanında geçerli olması", "Kişilerin iç dünyasını ve niyetlerini düzenlemesi", "Zaman içinde hiçbir değişime uğramaması"], "correctIndex": 1}'::jsonb,
  'Din, ahlak ve görgü kurallarının yaptırımı manevidir (günahkar sayılma, vicdan azabı, kınanma, ayıplanma). Hukuk kurallarını diğer tüm toplumsal düzen kurallarından ayıran yegane ve belirleyici özellik; arkasında devletin zorlama ve yaptırım gücünün (maddi yaptırım) bulunmasıdır.',
  'ÖSYM ''yazılı olma'' çeldiricisini sıkça kullanır. Oysa örf ve adet hukuku yazısız bir hukuk kaynağı olmasına rağmen devlet yaptırımıyla desteklendiği için maddi yaptırımlıdır.',
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
  'Temel Hukuk Kavramları',
  'multiple_choice',
  1,
  'Hukuka aykırı olarak gerçekleştirilen bir idari işlemin, yetkili idari yargı mercii (İdare Mahkemesi veya Danıştay) tarafından geçmişe etkili olarak ortadan kaldırılmasına ne ad verilir?',
  '{"options": ["Cebri İcra", "Tazminat", "İptal", "Müsadere", "Hükümsüzlük"], "correctIndex": 2}'::jsonb,
  'İdarenin hukuka aykırı eylem ve işlemlerinin idari yargı kararıyla baştan itibaren geçersiz sayılarak hukuk aleminden silinmesi yaptırımına ''iptal'' denir (örneğin haksız bir memuriyetten çıkarma işleminin iptali).',
  'Tazminat zararın parayla karşılanmasıdır; iptal ise doğrudan işlemin kendisinin ortadan kaldırılmasıdır.',
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
  'Temel Hukuk Kavramları',
  'multiple_choice',
  1,
  'Borcunu kendi rızasıyla yerine getirmeyen bir borçlunun, alacaklının talebi üzerine devletin icra organları aracılığıyla borcunu zorla ödemeye mecbur bırakılması yaptırımı aşağıdakilerden hangisidir?',
  '{"options": ["Tazminat", "Cebri İcra", "Ceza", "Yokluk", "Fesih"], "correctIndex": 1}'::jsonb,
  'Cebri icra; yerine getirilmeyen bir hukuki edimin devlet gücü (icra ve iflas daireleri) kullanılarak zorla yerine getirilmesini sağlayan maddi yaptırım türüdür.',
  'Cebri icra ceza hukuku yaptırımı değildir; özel hukuk borç ilişkilerinde devletin zorlama yetkisidir.',
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
  'Temel Hukuk Kavramları',
  'multiple_choice',
  1,
  'Bir hukuki işlemin kanunun öngördüğü zorunlu ''kurucu unsurlarından'' birinin hiç bulunmaması sebebiyle işlemin hukuk aleminde hiç doğmamış sayılması durumuna ne ad verilir?',
  '{"options": ["Mutlak Butlan", "Nisbi Butlan", "Yokluk", "Askıda Hükümsüzlük", "Tazminat"], "correctIndex": 2}'::jsonb,
  'Kurucu unsuru eksik olan işlem ''yokluk''la maluldür. Örneğin resmi evlendirme memuru önünde yapılmayan imam nikahı ile evlilik hukuken hiç doğmamıştır (yoktur).',
  'Yoklukta işlem hiç doğmamıştır; butlanda ise işlem doğmuştur ancak sakattır. Bu ayrım hükümsüzlük konusunun temelidir.',
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
  'Temel Hukuk Kavramları',
  'multiple_choice',
  1,
  'Hak ehliyeti ile fiil ehliyeti arasındaki temel farklar dikkate alındığında, Türk Medeni Kanunu''na göre ''Hak Ehliyeti'' ne zaman başlar?',
  '{"options": ["18 yaşın doldurulmasıyla", "Ayırt etme gücünün kazanılmasıyla", "Çocuğun sağ ve tam doğmak şartıyla, ana rahmine düştüğü andan itibaren", "Ergenlik çağına girilmesiyle", "Mahkeme kararıyla reşit kılınmayla"], "correctIndex": 2}'::jsonb,
  'Türk Medeni Kanunu m. 28''e göre hak ehliyeti, çocuğun sağ ve tam doğması koşuluyla ana rahmine düştüğü (cenin) andan itibaren başlar. Fiil ehliyeti ise ayırt etme gücü, erginlik ve kısıtlı olmama şartlarına bağlıdır.',
  'Sağ doğum tek başına yetmez, tam doğum da şarttır; ayrıca geriye etkili olarak ana rahmine düşülen andan itibaren hak ehliyeti kazanılır.',
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
  'Temel Hukuk Kavramları',
  'multiple_choice',
  1,
  'Türk Medeni Kanunu''na göre olağan erginlik (reşit olma) yaşı aşağıdakilerden hangisidir?',
  '{"options": ["15 yaşın doldurulması", "16 yaşın doldurulması", "17 yaşın doldurulması", "18 yaşın doldurulması", "21 yaşın doldurulması"], "correctIndex": 3}'::jsonb,
  'TMK m. 11 uyarınca erginlik 18 yaşın doldurulmasıyla başlar. Evlenme kişiyi ergin kılar (olağan evlenme yaşı 17, olağanüstü 16''dır).',
  '18 yaşına ''basmak'' değil; 18 yaşını ''doldurmak'' (19''dan gün almak) şarttır.',
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
  'Temel Hukuk Kavramları',
  'multiple_choice',
  1,
  'Hakların kazanılmasında geçerli olan temel ilke ''iyiniyet'' (subjektif iyiniyet) iken; hakların kullanılmasında ve borçların yerine getirilmesinde (ifasında) geçerli olan temel ilke aşağıdakilerden hangisidir?',
  '{"options": ["Dürüstlük kuralı (Objektif iyiniyet)", "Kuvvet kullanma hakkı", "Hakkın kötüye kullanılması serbestisi", "Zamanaşımı ilkesi", "Kusursuz sorumluluk"], "correctIndex": 0}'::jsonb,
  'TMK m. 2''ye göre ''Herkes, haklarını kullanırken ve borçlarını yerine getirirken dürüstlük kurallarına uymak zorundadır.'' Hakların KAZANILMASINDA iyiniyet (TMK m. 3); KULLANILMASINDA dürüstlük kuralı geçerlidir.',
  'ÖSYM ''kazanılma'' ile ''kullanılma'' kelimelerini yer değiştirerek sorar: Hak kazanılırken İyiniyet; hak kullanılırken Dürüstlük aranır.',
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
  'Temel Hukuk Kavramları',
  'multiple_choice',
  1,
  'Kişinin kendisinin veya bir başkasının hayatına, vücut bütünlüğüne veya malına yönelik gerçekleşen haksız ve devam eden bir saldırıyı orantılı güç kullanarak savuşturmasına ne ad verilir?',
  '{"options": ["Zaruret Hali (Iztırar)", "Meşru Müdafaa (Haklı Savunma)", "Kuvvet Kullanma", "İhkak-ı Hak", "Gasp"], "correctIndex": 1}'::jsonb,
  'Meşru müdafaa; haksız bir saldırıyı o anda hal ve koşullara göre orantılı bir şekilde defetmektir. Bu durumda fail hakkında ceza verilmez ve tazminat sorumluluğu doğmaz.',
  'Meşru müdafaada saldırganın haksız eylemine karşı savunma yapılır; zaruret halinde ise tehlikeden kurtulmak için masum üçüncü bir kişinin malına zarar verilir.',
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
  'Temel Hukuk Kavramları',
  'multiple_choice',
  1,
  'Normlar hiyerarşisinde (hukuk normlarının kademelendirilmesinde) en üstte yer alan ve diğer hiçbir normun kendisine aykırı olamayacağı temel norm aşağıdakilerden hangisidir?',
  '{"options": ["Kanun", "Anayasa", "Cumhurbaşkanlığı Kararnamesi", "Yönetmelik", "Genelge"], "correctIndex": 1}'::jsonb,
  'Hans Kelsen''in Normlar Hiyerarşisi piramidinin tepesinde Anayasa yer alır (Anayasanın Üstünlüğü ilkesi - Anayasa m. 11). Kanunlar, kararnameler ve yönetmelikler Anayasaya aykırı olamaz.',
  'Hiyerarşi sırası: Anayasa > Kanun & Milletlerarası Andlaşmalar > Cumhurbaşkanlığı Kararnamesi > Yönetmelik > Genelge.',
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
  'Temel Hukuk Kavramları',
  'multiple_choice',
  1,
  'Kanun koyucunun bilerek ve isteyerek bıraktığı, kanunun uygulanmasını hâkimin somut olayın özelliklerine göre takdir etmesine imkan tanıyan boşluk türü aşağıdakilerden hangisidir?',
  '{"options": ["Açık Boşluk", "Örtülü Boşluk", "Kural İçi Boşluk", "Hukuk Boşluğu", "Fiili Boşluk"], "correctIndex": 2}'::jsonb,
  'Kanun koyucu her durumu tek tek sayamaz; bilerek ve isteyerek ''uygun bir miktar tazminat'', ''haklı sebepler'' gibi ifadelerle boşluk bırakır. Buna ''kural içi boşluk'' denir ve hâkim burada ''takdir yetkisini'' kullanır (TMK m. 4).',
  'Kural içi boşlukta hâkim hukuk yaratmaz; kanunun kendisine verdiği ''takdir yetkisini'' kullanır.',
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
  'Temel Hukuk Kavramları',
  'multiple_choice',
  2,
  'Akıl zayıflığı veya yaş küçüklüğü nedeniyle ayırt etme gücü bulunmayan (gayrimümeyyiz) bir kişinin yaptığı satış sözleşmesi veya hukuki işlem hangi yaptırıma tabidir?',
  '{"options": ["Yokluk", "Mutlak Butlan (Kesin Hükümsüzlük)", "Nisbi Butlan", "Askıda Hükümsüzlük", "Cebri İcra"], "correctIndex": 1}'::jsonb,
  'Fiil ehliyetinin vazgeçilmez şartı ayırt etme gücüdür. Ayırt etme gücü bulunmayan tam ehliyetsizlerin yaptıkları hukuki işlemler kamu düzenini ilgilendirdiği için ''mutlak butlan'' (kesin hükümsüzlük) ile geçersizdir. Veli veya vasileri onay verse bile işlem geçerlilik kazanamaz.',
  'Adaylar ayırt etme gücü olmayanın işlemini yokluk sanabilir. İşlem şeklen kurulmuştur ancak ehliyetsizlik nedeniyle mutlak butlanla baştan itibaren batıldır.',
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
  'Temel Hukuk Kavramları',
  'multiple_choice',
  2,
  'Bir sözleşme yapılırken taraflardan birinin hile (aldatma), korkutma (tehdit/ikrah) veya esaslı yanılma (hata) sonucu iradesinin sakatlanması durumunda ortaya çıkan hükümsüzlük türü aşağıdakilerden hangisidir?',
  '{"options": ["Yokluk", "Mutlak Butlan", "Nisbi Butlan (İptal Edilebilirlik)", "Maddi Tazminat", "Askıda Hükümsüzlük"], "correctIndex": 2}'::jsonb,
  'İrade sakatlıklarında (hata, hile, korkutma) sözleşme başlangıçta geçerli olarak doğar; ancak iradesi sakatlanan taraf kanunda belirtilen 1 yıllık hak düşürücü süre içinde sözleşmeyi iptal ettirebilir. Bu duruma ''nisbi butlan'' (iptal edilebilirlik) denir.',
  'Mutlak butlanda işlem kendiliğinden geçersizdir ve hakim re''sen dikkate alır. Nisbi butlanda ise mağdur taraf iptal hakkını kullanmadığı sürece işlem geçerli kalmaya devam eder.',
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
  'Temel Hukuk Kavramları',
  'multiple_choice',
  2,
  '17 yaşındaki lise öğrencisi Ahmet, yasal temsilcisi olan anne ve babasının haberi ve izni olmaksızın bir mağazadan vadeli taksitle son model bir motosiklet satın almıştır.

Ahmet''in yaptığı bu sözleşmenin hukuki durumu aşağıdakilerden hangisidir?',
  '{"options": ["Sözleşme yoklukla maluldür.", "Sözleşme mutlak butlanla kesin olarak hükümsüzdür.", "Sözleşme askıda hükümsüzdür; velisinin onay vermesiyle baştan itibaren geçerli hale gelir, onay vermezse geçersiz kalır.", "Ahmet ayırt etme gücüne sahip olduğu için sözleşme veli onayı aranmaksızın baştan itibaren tamamen geçerlidir.", "Ahmet derhal hapis cezası ile cezalandırılır."], "correctIndex": 2}'::jsonb,
  'Ahmet ayırt etme gücüne sahip küçük olduğundan ''sınırlı ehliyetsiz''dir. Sınırlı ehliyetlilerin kendilerini borç altına sokan işlemleri ''askıda hükümsüz'' (tek taraflı bağlamazlık) niteliğindedir. Yasal temsilci icazet (onay) verirse sözleşme geçerli olur, vermezse geçersiz kalır.',
  'Sınırlı ehliyetsizler kendi başlarına borç altına giremezler; ancak bu işlem batıl veya yok değil, askıda hükümsüzdür.',
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
  'Temel Hukuk Kavramları',
  'multiple_choice',
  2,
  'Sınırlı ehliyetsizler (ayırt etme gücü olan küçükler ve kısıtlılar), yasal temsilcilerinin (veli veya vasi) rızası ve onayı olsa dahi kanunen bazı işlemleri kesinlikle yapamazlar.

Aşağıdakilerden hangisi veli veya vasinin onayı olsa bile sınırlı ehliyetsizin kesinlikle yapamayacağı yasak işlemlerden biridir?',
  '{"options": ["Karşılıksız bir bağışı kabul etmek", "Miras sözleşmesi yapmak", "Kefil olmak, vakıf kurmak veya önemli bağışta bulunmak", "Ayırt etme gücüne dayanarak vasiyetname düzenlemek (15 yaşını doldurmuşsa)", "Kişiye sıkı sıkıya bağlı hakları kullanmak"], "correctIndex": 2}'::jsonb,
  'TMK uyarınca sınırlı ehliyetsizler; yasal temsilcileri izin veya onay verse dahi başkasına KEFİL OLAMAZ, VAKIF KURAMAZ ve ÖNEMLİ BAĞIŞTA BULUNAMAZLAR. Bu yasak işlemler malvarlıklarını koruma amacı güder.',
  'Veli izin verse dahi kefalet ve vakıf kurma işlemi geçerlilik kazanamaz! Bu ÖSYM''nin en popüler ehliyet tuzağıdır.',
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
  'Temel Hukuk Kavramları',
  'multiple_choice',
  2,
  'Bir kimsenin mahkeme kararıyla ergin kılınabilmesi (yargısal erginlik / kazai rüşt) için aşağıdaki şartlardan hangisinin varlığı zorunlu DEĞİLDİR?',
  '{"options": ["Küçüğün 15 yaşını doldurmuş olması", "Küçüğün kendi menfaatinin bulunması", "Küçüğün kendi talebinin ve velisinin rızasının bulunması", "Görevli Asliye Hukuk Mahkemesi''nin karar vermesi", "Küçüğün bir iş yeri açmış veya evlenmiş olması"], "correctIndex": 4}'::jsonb,
  'Kazai rüşt (TMK m. 12) için şartlar: 15 yaşın doldurulması, küçüğün istemi, velinin muvafakati (vesayet altındaysa vesayet makamının izni), küçüğün menfaati ve Asliye Hukuk Mahkemesi kararıdır. İş yeri açmış olma zorunluluğu yoktur; evlenme ise zaten başlı başına doğrudan ergin kılar.',
  'Kazai rüşt yaşı 15''tir; evlenme yoluyla erginlikte ise olağan yaş 17, olağanüstü yaş 16''dır. Yaşları karıştırmayınız.',
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
  'Temel Hukuk Kavramları',
  'multiple_choice',
  2,
  'Örf ve âdet kurallarının birer ''örf ve âdet hukuku'' kuralı (asli yazısız hukuk kaynağı) olarak kabul edilebilmesi için bazı unsurların birlikte bulunması gerekir.

Aşağıdakilerden hangisi örf ve âdetin hukuki bir kural sayılabilmesi için aranan unsurlardan biri değildir?',
  '{"options": ["Maddi unsur (Kuralın eskiden beri uzun süredir tekrarlanıyor olması)", "Manevi unsur (Toplumda kurala uyulmasının zorunlu olduğuna dair genel bir inancın bulunması)", "Hukuki unsur (Kuralın devlet gücü ve maddi yaptırımla desteklenmesi)", "Şekli unsur (Resmî Gazete''de yayımlanarak yürürlüğe girmiş olması)", "Kamu düzenine ve ahlaka aykırı olmaması"], "correctIndex": 3}'::jsonb,
  'Örf ve adet hukuku yazısız kaynaktır; Resmi Gazete''de yayımlanma şartı yalnızca yazılı normlar (kanun, CBK, yönetmelik vb.) için geçerlidir. Örf ve âdetin unsurları: Maddi unsur (süreklilik), Manevi unsur (genel inanç) ve Hukuki unsurdur (devlet yaptırımı).',
  'Örf ve adet yazısızdır, Resmi Gazete''de yayımlanmaz; yayımlanırsa zaten kanun olur.',
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
  'Temel Hukuk Kavramları',
  'multiple_choice',
  2,
  'Somut bir hukuki uyuşmazlıkta olaya uygulanabilecek ne yazılı (kanun, yönetmelik vb.) ne de yazısız (örf ve âdet hukuku) hiçbir bağlayıcı kuralın bulunmaması durumuna ne ad verilir?',
  '{"options": ["Kural İçi Boşluk", "Açık Kanun Boşluğu", "Örtülü Kanun Boşluğu", "Hukuk Boşluğu", "Takdir Yetkisi"], "correctIndex": 3}'::jsonb,
  'Kanunda hüküm yoksa ''kanun boşluğu'' vardır. Eğer hem yazılı kaynaklarda hem de yazısız kaynakta (örf ve adette) hiçbir kural yoksa buna ''HUKUK BOŞLUĞU'' denir. Bu durumda hâkim Medeni Kanun m. 1 uyarınca ''kendisi kanun koyucu olsaydı nasıl bir kural koyacak idiyse ona göre'' karar verir (Hukuk Yaratır).',
  'Kanun boşluğunda hâkim örf ve âdete gider; Hukuk boşluğunda ise örf ve âdette de kural olmadığı için hâkim doğrudan HUKUK YARATIR.',
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
  'Temel Hukuk Kavramları',
  'multiple_choice',
  2,
  'Kişinin kullandığı zaman yeni bir hukuki durum meydana getiren, mevcut bir hukuki durumu değiştiren veya tamamen ortadan kaldıran haklara ''yenilik doğuran (inşai) haklar'' denir.

Aşağıdakilerden hangisi ''bozucu yenilik doğuran hak'' niteliğindedir?',
  '{"options": ["Alıcının sözleşmeden dönme veya işçinin istifa (fesih) hakkını kullanması", "Satılan malın ayıplı çıkması sebebiyle satış bedelinden indirim talep edilmesi", "Ön alım (şufa) hakkının kullanılması ile mülkiyetin devralınması", "Alacaklının borçluya borcunu ödemesi için ihtarda bulunması", "Velayetin anne ve baba tarafından birlikte kullanılması"], "correctIndex": 0}'::jsonb,
  'Yenilik doğuran haklar üçe ayrılır: 1) Kurucu (ön alım, alım hakkı - yeni hak doğurur), 2) Değiştirici (ayıp sebebiyle indirim, malın değiştirilmesi), 3) Bozucu (fesih, istifa, azil, sözleşmeden dönme - var olan hukuki ilişkiyi sona erdirir/bozar).',
  'Bedel indirimi ''değiştirici''; fesih ve istifa ise ''bozucu'' yenilik doğuran haktır.',
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
  'Temel Hukuk Kavramları',
  'multiple_choice',
  2,
  'Ali ile amcasının oğlu (kuzeni) Mehmet arasındaki kan hısımlığının türü ve derecesi aşağıdakilerden hangisinde doğru olarak verilmiştir?',
  '{"options": ["3. derece altsoy kan hısımlığı", "3. derece yansoy kan hısımlığı", "4. derece yansoy kan hısımlığı", "2. derece yansoy kan hısımlığı", "4. derece kayın hısımlığı"], "correctIndex": 2}'::jsonb,
  'Hısımlık derecesi doğum sayısı ile hesaplanır. Ali -> Babası (1) -> Dedesi (2) -> Amcası (3) -> Kuzeni Mehmet (4 doğum). Biri diğerinden üremediği için yansoydur. Dolayısıyla Ali ile kuzeni Mehmet 4. derece yansoy kan hısımıdır.',
  'Kardeşler 2. derece yansoy; amca/dayı/hala/teyze ile yeğen 3. derece yansoy; kuzenler (amca çocukları) ise 4. DERECE yansoydur.',
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
  'Temel Hukuk Kavramları',
  'multiple_choice',
  2,
  'Ölüm tehlikesi içinde kaybolan veya kendisinden çok uzun zamandır haber alınamayan bir kimsenin kişiliği mahkeme kararıyla sona erdirilebilir (Gaiplik).

Ölüm tehlikesi içinde kaybolma durumunda gaiplik kararı istenebilmesi için olay tarihinden itibaren en az kaç yıl geçmiş olmalıdır?',
  '{"options": ["6 ay", "1 yıl", "3 yıl", "5 yıl", "10 yıl"], "correctIndex": 1}'::jsonb,
  'Ölüm tehlikesi içinde kaybolmada mahkemeden gaiplik istenebilmesi için en az 1 YIL geçmelidir. Kendisinden uzun süre haber alınamama durumunda ise son haber tarihinden itibaren en az 5 YIL geçmelidir.',
  'Ölüm tehlikesi = 1 yıl; Uzun süre haber alınamama = 5 yıl. Bu süreler ÖSYM''nin en klasik soru kalıbıdır.',
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
  'Temel Hukuk Kavramları',
  'multiple_choice',
  2,
  'Hukuk kurallarının yer bakımından uygulanmasında ''mülkilik (ülkesellik)'' ilkesi esastır.

Ceza hukukunda mülkilik ilkesi aşağıdakilerden hangisini ifade eder?',
  '{"options": ["Türk vatandaşlarının dünyanın neresinde olursa olsun Türk kanunlarına tabi olmasını", "Türkiye sınırları içinde işlenen suçlarda, failin veya mağdurun vatandaşlığına bakılmaksızın Türk Ceza Kanunu''nun uygulanmasını", "Yabancıların Türkiye''de hiçbir şekilde yargılanamayacağını", "Mülkiyet hakkının kutsal ve dokunulmaz olduğunu", "Her ilin kendi yerel ceza kurallarını belirlemesini"], "correctIndex": 1}'::jsonb,
  'Mülkilik ilkesi; devletin egemenlik sınırları dahilinde işlenen tüm suçlara, suçu işleyen veya mağdur olan kim olursa olsun (Türk, yabancı, vatansız) o ülkenin (Türkiye''nin) kanunlarının uygulanması kuralıdır.',
  'Şahsilik vatandaşlığa bakar; mülkilik ise suçun işlendiği coğrafi sınırlara (ülkeye) bakar.',
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
  'Temel Hukuk Kavramları',
  'multiple_choice',
  2,
  'Aşağıdakilerden hangisi hakların mahkeme kararı olmaksızın bizzat hak sahibi tarafından korunabileceği istisnai meşru hallerden biridir?',
  '{"options": ["İhkak-ı Hak", "Kan davası gütme", "Zaruret Hali (Iztırar)", "Gözaltına alma", "Müsadere uygulama"], "correctIndex": 2}'::jsonb,
  'Hukukumuzda kişinin kendi hakkını kendi gücüyle alması (ihkak-ı hak) kural olarak yasaktır. İstisnaları: 1) Meşru müdafaa, 2) Zaruret hali (ıztırar), 3) Kuvvet kullanmadır (gecikmesinde sakınca bulunan ve kolluğa ulaşılamayan durumlar).',
  'İhkak-ı hak yasak olandır; meşru müdafaa ve zaruret hali ise hukuka uygunluk sebebidir.',
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
  'Temel Hukuk Kavramları',
  'multiple_choice',
  2,
  'Zaruret (Iztırar) hali ile ilgili olarak aşağıda verilen hükümlerden hangisi doğrudur?',
  '{"options": ["Kişi haksız saldırıda bulunan saldırgana karşı koyar.", "Kişi kendisini veya yakınını ağır bir tehlikeden korumak için tehlikeyle ilgisi olmayan masum üçüncü bir kişinin malına zarar verir ve bu zararı hakkaniyet gereği tazmin eder.", "Zaruret halinde işlenen fiiller için fail hakkında ağırlaştırılmış müebbet hapis cezası uygulanır.", "Zaruret hali sadece kamu görevlileri tarafından uygulanabilir.", "Zaruret halinde verilen zarar hiçbir şekilde tazmin edilemez."], "correctIndex": 1}'::jsonb,
  'Zaruret halinde kişi bir tehlikeden kaçarken üçüncü masum bir kişinin malına zarar verir (örn. kuduz köpekten kaçarken komşunun kapısını kırmak). Eylem hukuka uygundur, ceza verilmez; ancak komşunun kırılan kapısının bedeli tazminat olarak ödenir.',
  'Meşru müdafaada tazminat ÖDENMEZ (çünkü saldırgana karşı yapılmıştır); zaruret halinde ise masum üçüncü kişinin zararı TAZMİN EDİLİR.',
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
  'Temel Hukuk Kavramları',
  'multiple_choice',
  2,
  'I. Akıl hastalığı veya akıl zayıflığı
II. Savurganlık, alkol veya uyuşturucu madde bağımlılığı
III. Kötü yaşam tarzı veya malvarlığını kötü yönetme
IV. Bir yıl veya daha uzun süreli kesinleşmiş hapis cezasına mahkum olma

Yukarıdakilerden hangileri Türk Medeni Kanunu''na göre bir erginin mahkemece kısıtlanmasını (vesayet altına alınmasını) gerektiren sebepler arasında yer alır?',
  '{"options": ["I ve IV", "II ve III", "I, II ve IV", "I, III ve IV", "I, II, III ve IV"], "correctIndex": 4}'::jsonb,
  'TMK m. 405-408 uyarınca sayılanların tamamı kısıtlanma sebebidir: Akıl hastalığı/zayıflığı, savurganlık, alkol/uyuşturucu bağımlılığı, kötü yönetim/yaşam tarzı, 1 yıl veya üzeri özgürlüğü bağlayıcı hapis cezası ve kişinin yaşlılık/sakatlık nedeniyle kendi isteği.',
  '1 yıl veya üzeri hapis cezası alan kişi zorunlu olarak kısıtlanır ve kendisine vasi atanır.',
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
  'Temel Hukuk Kavramları',
  'multiple_choice',
  2,
  'Bir kimsenin ölümüne kesin gözle bakılmayı gerektiren bir durum içinde kaybolması (örneğin düşen bir uçakta veya batan bir denizaltıda bulunup cesedine ulaşılamaması) halinde işletilen hukuki müessese hangisidir?',
  '{"options": ["Gaiplik kararı", "Ölüm karinesi", "Birlikte ölüm karinesi", "Cebri tescil", "Mirasın reddi"], "correctIndex": 1}'::jsonb,
  'Ölümüne kesin gözle bakılacak bir durumda cesedi bulunamayan kişi için mahkeme kararına gerek kalmaksızın o yerin en büyük mülki amirinin (kaymakam/vali) emriyle nüfus kütüğüne doğrudan ''ölü'' kaydı düşülür. Buna ''ölüm karinesi'' denir.',
  'Ölüm TEHLİKESİ varsa mahkemeden ''Gaiplik'' istenir; ÖLÜME KESİN GÖZLE bakılıyorsa mahkemesiz mülki amirce ''Ölüm Karinesi'' uygulanır.',
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
  'Temel Hukuk Kavramları',
  'multiple_choice',
  2,
  'Evlatlık ilişkisi ile kurulan hısımlık türü aşağıdakilerden hangisidir?',
  '{"options": ["Doğal kan hısımlığı", "Sözleşmeden doğan kayın hısımlığı", "Yapay (akdi) soybağı hısımlığı", "Yansoy hısımlığı", "Yarım kan hısımlığı"], "correctIndex": 2}'::jsonb,
  'Evlat edinme mahkeme kararıyla kurulan yapay (akdi/hukuki) bir hısımlıktır. Evlatlık ile evlat edinen ve altsoyu arasında birinci derece altsoy-üstsoy ilişkisi gibi haklar ve mirasçılık doğar.',
  'Evlatlık ilişkisi sadece evlat edinen ile evlatlık arasında kurulur; evlat edinenin diğer akrabalarıyla evlatlık arasında hısımlık kurulmaz.',
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
  'Temel Hukuk Kavramları',
  'multiple_choice',
  2,
  'Ceza hukukunun temel ilkeleri değerlendirildiğinde aşağıdakilerden hangisi yanlıştır?',
  '{"options": ["Kanunsuz suç ve ceza olmaz (Kanunilik ilkesi).", "Ceza sorumluluğu şahsidir; kimse başkasının fiilinden dolayı cezalandırılamaz.", "Suçluluğu mahkeme kararıyla kesinleşinceye kadar kimse suçlu sayılamaz (Masumiyet karinesi).", "Ceza kanunlarını ihdas ederken örf ve adet kurallarına dayanılarak yeni suçlar oluşturulabilir.", "Aleyhe olan ceza kanunları geçmişe yürütülemez."], "correctIndex": 3}'::jsonb,
  'Ceza hukukunda kıyas yasaktır ve örf-âdet kurallarına dayanılarak suç ve ceza ihdas edilemez. Suç ve cezalar yalnızca TBMM tarafından çıkarılan KANUN ile konulabilir (Kanunilik ilkesi).',
  'Örf ve âdet hukuku medeni hukukta tamamlayıcı kaynaktır; ancak ceza hukukunda asla doğrudan kaynak olamaz!',
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
  'Temel Hukuk Kavramları',
  'multiple_choice',
  2,
  'Mevcut olan bir hakkın, kanunda belirlenen belirli bir sürenin geçmesi ve borçlunun ''itiraz/defi'' hakkını ileri sürmesi neticesinde dava yoluyla talep edilebilme gücünü kaybetmesine ne ad verilir?',
  '{"options": ["Hak düşürücü süre", "Zamanaşımı", "Takas", "İbra", "Kusursuz sorumluluk"], "correctIndex": 1}'::jsonb,
  'Zamanaşımı hakkı sona erdirmez; hakkı ''eksik borç'' haline getirir. Borçlu zamanaşımı def''ini ileri sürerse alacaklı artık mahkeme kanalıyla tahsilat yapamaz. Borçlu borcunu kendi rızasıyla öderse geri isteyemez.',
  'Hak düşürücü süre hakkı tamamen öldürür ve hakim re''sen dikkate alır. Zamanaşımı ise hakkı öldürmez, eksik borç yapar ve borçlunun ileri sürmesi şarttır.',
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
  'Temel Hukuk Kavramları',
  'multiple_choice',
  2,
  'Eşlerden birinin ölümü veya boşanma ile evlilik birliği sona erdiğinde, hayatta kalan eş ile diğer eşin kan hısımları arasındaki ''kayın hısımlığı'' ilişkisi ne olur?',
  '{"options": ["Evlilik bittiği anda kayın hısımlığı kendiliğinden tamamen ortadan kalkar.", "Evlilik sona erse bile kayın hısımlığı devam eder ve üstsoy-altsoy ile evlenme yasağı süresiz kalır.", "Mahkemeden talep edilirse sona erer.", "Kayın hısımlığı kan hısımlığına dönüşür.", "Sadece 5 yıl süreyle devam eder, sonra kalkar."], "correctIndex": 1}'::jsonb,
  'TMK m. 18 uyarınca ''Evliliğin sona ermesi, kayın hısımlığını ortadan kaldırmaz.'' Boşanan kişi eski eşinin annesi, babası, torunları gibi üstsoy ve altsoyuyla ömür boyu evlenemez (kesin evlenme engeli).',
  'Adayların en büyük yanılgısı boşanmayla kayın hısımlığının bittiğini sanmaktır. Kayın hısımlığı evlilik bitse de bitmez!',
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
  'Temel Hukuk Kavramları',
  'multiple_choice',
  2,
  'Türkiye''de 2004 yılında yapılan Anayasa değişiklikleri ile ceza hukuku alanında aşağıdakilerden hangisi tamamen kaldırılmıştır?',
  '{"options": ["Adli Para Cezası", "Süreli Hapis Cezası", "Ölüm (İdam) Cezası ve Genel Müsadere", "Hükmün Açıklanmasının Geri Bırakılması", "Ağırlaştırılmış Müebbet Hapis"], "correctIndex": 2}'::jsonb,
  '2004 Anayasa değişikliği ile Ölüm (İdam) cezası her türlü durum için anayasadan tamamen çıkarılmıştır. Ayrıca suçlunun tüm malvarlığına toptan el konulması anlamına gelen ''Genel Müsadere'' cezası da yasaklanmıştır (sadece suça konu eşya veya kazanç müsadere edilebilir).',
  'Genel müsadere yasaktır; ancak suçta kullanılan silah veya suçtan elde edilen kara paranın müsaderesi (özel müsadere) serbesttir.',
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
  'Temel Hukuk Kavramları',
  'multiple_choice',
  3,
  'Gaiplik kararının alınması durumunda gaipliğine karar verilen kişinin mirası mirasçılarına doğrudan ve şartsız olarak intikal etmez.

Ölüm tehlikesi içinde kaybolma nedeniyle hakkında gaiplik kararı verilen kimsenin mirasçıları mirası teslim alabilmek için kaç yıl süreyle güvence (teminat) göstermek zorundadır?',
  '{"options": ["1 yıl", "3 yıl", "5 yıl", "10 yıl", "15 yıl"], "correctIndex": 2}'::jsonb,
  'Ölüm tehlikesi içinde kaybolmada mirasçılar malları teslim alırken 5 YIL süreyle teminat göstermek zorundadır. Uzun zamandır haber alınamama durumunda ise teminat süresi en son haberden itibaren 15 YIL (veya gaip 100 yaşına basana kadar) sürer.',
  'Ölüm tehlikesinde gaiplik isteme süresi 1 yıl, teminat süresi 5 yıldır! Haber alınamamada ise isteme süresi 5 yıl, teminat süresi 15 yıldır! Bu çapraz eşleştirme çok düşürür.',
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
  'Temel Hukuk Kavramları',
  'multiple_choice',
  3,
  'Ayırt etme gücüne sahip 16 yaşındaki Melis ile amcası Hasan arasında yapılan resmi evlilik sözleşmesinin hukuki durumu hakkında aşağıdakilerden hangisi doğrudur?',
  '{"options": ["İşlem kurucu unsuru eksik olduğu için yoklukla maluldür.", "Amca ile yeğen arasında kanunen evlenme yasağı bulunduğundan evlilik mutlak butlanla sakattır; mahkemece iptal edilene kadar geçerli bir evliliğin tüm hüküm ve sonuçlarını doğurur.", "Sözleşme tek taraflı bağlamazlık hükmündedir.", "Melis 16 yaşında olduğundan evlilik kendiliğinden tamamen geçerlidir.", "Evlilik nisbi butlanla maluldür, 1 yıl içinde iptal davası açılmazsa düzelir."], "correctIndex": 1}'::jsonb,
  'Amca ile yeğen 3. derece yansoy kan hısımı olup evlenmeleri kesin yasaktır. Ancak resmi memur önünde yapılmışsa işlem yok değildir; ''mutlak butlan'' ile sakattır. Fakat evlilik mutlak butlan olsa bile hakim kararıyla iptal edilene kadar geçerli evliliğin hükümlerini doğurur (çocuklar sahih nesepli doğar).',
  'Mutlak butlan olan işlemler kural olarak baştan hükümsüzdür; ancak ''EVLİLİK'' istisnadır! Butlanla sakat bir evlilik mahkeme kararı verilene kadar geçerli evlilik gibi hüküm doğurur.',
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
  'Temel Hukuk Kavramları',
  'multiple_choice',
  3,
  'Hukuk kurallarının nitelikleri açısından yapılan ayrımda;
• Aksine bir hukuki işlem yapılması mümkün olmayan, kamu düzenini ve zayıfları koruyan kurallara ''emredici kurallar'',
• Tarafların aksini kararlaştırabildikleri, ancak sözleşmede boşluk bırakmaları durumunda devreye giren kurallara ise ''yedek kurallar'' denir.

Buna göre yedek hukuk kuralları kendi içinde hangi iki alt gruba ayrılır?',
  '{"options": ["Maddi kurallar — Manevi kurallar", "Tamamlayıcı kurallar — Yorumlayıcı kurallar", "Yazılı kurallar — Yazısız kurallar", "Soyut kurallar — Somut kurallar", "Genel kurallar — Özel kurallar"], "correctIndex": 1}'::jsonb,
  'Yedek hukuk kuralları ikiye ayrılır: 1) Tamamlayıcı kurallar (tarafların sözleşmede değinmediği boşlukları doldurur, örn. faiz oranı kararlaştırılmamışsa yasal faizin uygulanması), 2) Yorumlayıcı kurallar (tarafların sözleşmede kullandığı belirsiz bir ifadenin anlamını açıklar, örn. ayın başı veya ortası tabirinin ayın 1''i veya 15''i sayılması).',
  'Yedek kurallar = Tamamlayıcı ve Yorumlayıcı kurallardır. Tanımlayıcı kurallar ise doğrudan hukuki kavramı tanımlar.',
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
  'Temel Hukuk Kavramları',
  'multiple_choice',
  3,
  'I. Kendilerine yasal danışman (müşavir) atanmış olanlar
II. Evli kişiler (kefalet ve aile konutu işlemlerinde)
III. Ayırt etme gücüne sahip 17 yaşındaki lise öğrencisi
IV. Akıl hastalığı sebebiyle vesayet altına alınmış ergin kişi

Yukarıdakilerden hangileri Türk Medeni Hukuku''nda ''Sınırlı Ehliyetliler'' grubunda yer alır?',
  '{"options": ["I ve II", "III ve IV", "I, II ve III", "Yalnız I", "I, III ve IV"], "correctIndex": 0}'::jsonb,
  'Tam ehliyetin üç şartına sahip olmasına rağmen kanunun bazı işlemler için kısıtlama getirdiği kişiler ''Sınırlı Ehliyetli''dir: Yasal danışman atananlar ve evliler. III numara (17 yaşındaki küçük) ''Sınırlı Ehliyetsiz''dir; IV numara (akıl hastası) ise ''Tam Ehliyetsiz''dir.',
  'ÖSYM ''Sınırlı Ehliyetli'' (yasal danışman atananlar) ile ''Sınırlı Ehliyetsiz'' (küçükler ve kısıtlılar) kavramlarını sürekli karşılaştırır. Bu ayrıma dikkat edilmelidir.',
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
  'Temel Hukuk Kavramları',
  'multiple_choice',
  3,
  'Bir kimsenin başkasına ait taşınmaz bir malı tapu kütüğünde kendi adına tescil ettirebilmesi için dürüstlük ve iyiniyet kuralları çerçevesinde aranan ''olağan zamanaşımı ile gayrimenkul iktisabı'' süresi kaç yıldır?',
  '{"options": ["5 yıl", "10 yıl", "15 yıl", "20 yıl", "30 yıl"], "correctIndex": 1}'::jsonb,
  'TMK m. 712''ye göre geçerli bir hukuki sebep olmaksızın tapu kütüğüne malik olarak yazılan kişi, taşınmazı davasız ve aralıksız 10 YIL süreyle ve iyiniyetle zilyetliğinde bulundurursa mülkiyet hakkını kazanır (Olağan zamanaşımı = 10 yıl; Tapusuz taşınmazlarda olağanüstü zamanaşımı = 20 yıldır).',
  'Taşınır mallarda zamanaşımı ile mülkiyet kazanma süresi 5 yıldır; tapulu taşınmazda olağan zamanaşımı 10 yıl, tapusuz taşınmazda ise 20 yıldır.',
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
  'Temel Hukuk Kavramları',
  'multiple_choice',
  3,
  'Anayasa m. 38''de yer alan ''Hiç kimse, yalnızca sözleşmeden doğan bir yükümlülüğü yerine getirememesinden dolayı özgürlüğünden alıkonulamaz.'' hükmü ceza hukuku ile borçlar hukuku arasındaki hangi temel ilkeyi güvence altına almıştır?',
  '{"options": ["Sözleşme borçları sebebiyle hapis cezası (borç için hapis) yasağı", "Masumiyet karinesinin mutlaklığı", "Suçta ve cezada kanunilik", "Cezaların şahsiliği", "Zaman bakımından geçmişe yürümeme"], "correctIndex": 0}'::jsonb,
  'Borçlar hukukuna dayalı özel bir borcun (kredi kartı borcu, senet, kira bedeli) ödenememesi hapisle cezalandırılamaz; yaptırımı yalnızca cebri icradır. Kimse sırf borcunu ödeyemedi diye hapse atılamaz (Borç için hapis yasağı).',
  'Borcun ödenmemesi suç değil edim ihlalidir; hapis sadece taahhüdü ihlal veya nafaka ödememe gibi disiplin hapsi istisnalarında uygulanabilir.',
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
  'Temel Hukuk Kavramları',
  'multiple_choice',
  3,
  'Kişilik hakları kişinin doğumundan ölümüne kadar sahip olduğu; devredilemeyen, mirasçılara geçmeyen, feragat edilemeyen ve parayla ölçülemeyen mutlak haklardır.

Aşağıdakilerden hangisi doğrudan kişilik hakkı kapsamında değerlendirilemez?',
  '{"options": ["Kişinin adı ve şerefi üzerindeki hakkı", "Kişinin resmi ve sesi üzerindeki hakkı", "Kişinin vücut bütünlüğü ve yaşam hakkı", "Kişinin mülkiyetinde bulunan otomobil üzerindeki ayni hakkı", "Kişinin özel hayatının gizliliği hakkı"], "correctIndex": 3}'::jsonb,
  'Otomobil üzerindeki mülkiyet hakkı bir ''malvarlığı hakkı'' (ayni hak) olup devredilebilir, satılabilir ve mirasçılara geçer. Kişilik hakları ise şahsa sıkı sıkıya bağlı olup parayla satılamaz ve devredilemez.',
  'Mülkiyet hakkı ayni/maddi bir haktır; kişilik hakkı değildir.',
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
  'Temel Hukuk Kavramları',
  'multiple_choice',
  3,
  'Bir kimsenin gaipliğine karar verilmesi durumunda evlilik birliğinin akıbeti hakkında aşağıdakilerden hangisi doğrudur?',
  '{"options": ["Evlilik gaiplik kararının kesinleşmesiyle kendiliğinden derhal son bulur.", "Gaiplik kararı evliliği kendiliğinden sona erdirmez; hayatta kalan eşin ayrıca evliliğin feshini mahkemeden talep etmesi gerekir.", "Gaiplik kararı verilse bile hayatta kalan eş ömür boyu yeniden evlenemez.", "Evlilik sadece eşlerden birinin 100 yaşına basmasıyla düşer.", "Evlilik 10 yıl sonra kaymakamlık kararıyla sonlandırılır."], "correctIndex": 1}'::jsonb,
  'Ölüm ve ölüm karinesinde evlilik kendiliğinden sona erer. Ancak GAİPLİK kararında evlilik kendiliğinden SONA ERMEZ! Hayatta kalan eş yeniden evlenmek istiyorsa mahkemeden ayrıca evliliğin feshini istemek zorundadır (gaiplik davasıyla birlikte veya ayrı dava olarak açılabilir).',
  'Ölüm karinesinde evlilik kendiliğinden biter; gaiplikte ise kendiliğinden bitmez, mahkemeden fesih talep edilmesi şarttır!',
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
  'Temel Hukuk Kavramları',
  'multiple_choice',
  3,
  'Hâkimin bir davada kanun boşluğunu doldurmak üzere ''Hukuk Yaratma'' yetkisini kullanması ile ilgili aşağıdakilerden hangisi söylenemez?',
  '{"options": ["Hâkim hukuk yaratırken kendisi kanun koyucu olsaydı nasıl kural koyacak idiyse ona göre hareket eder.", "Hâkim hukuk yaratırken bilimsel görüşlerden (doktrin) ve yargı kararlarından (içtihat) yararlanabilir.", "Hâkimin yarattığı hukuk kuralı tüm ülkedeki mahkemeler için genel ve bağlayıcı bir kanun niteliği kazanır.", "Hâkimin yarattığı kural sadece baktığı somut uyuşmazlığı bağlar ve üst mahkeme (Yargıtay/Danıştay) denetimine tabidir.", "Hâkim anayasaya ve hukukun genel ilkelerine aykırı kural ihdas edemez."], "correctIndex": 2}'::jsonb,
  'Hâkimin yarattığı hukuk kuralı bir TBMM kanunu değildir; genel ve soyut bir norm olarak diğer mahkemeleri BAĞLAMAZ. Sadece o somut davayı çözer ve tarafları bağlar.',
  'Hâkimin hukuk yaratması yeni bir kanun yapmak demek değildir; emsal olabilir ama diğer mahkemeler için bağlayıcı değildir.',
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
  'Temel Hukuk Kavramları',
  'multiple_choice',
  3,
  'Murat ile eşi Zeynep''in erkek kardeşi Burak arasındaki hısımlık ilişkisi aşağıdakilerden hangisinde doğru olarak tanımlanmıştır?',
  '{"options": ["2. derece yansoy kan hısımlığı", "2. derece yansoy kayın hısımlığı", "1. derece üstsoy kayın hısımlığı", "3. derece yansoy kayın hısımlığı", "4. derece sıhri hısımlık"], "correctIndex": 1}'::jsonb,
  'Zeynep ile kardeşi Burak 2. derece yansoy kan hısımıdır. Eşlerden biri için kan hısımı olan kişi, diğer eş için aynı tür ve dereceden kayın (sıhri) hısımı olur. Dolayısıyla Murat ile kayınbiraderi Burak ''2. derece yansoy kayın hısımı''dır.',
  'Eşin kardeşi (kayınbirader/baldız/görümce) eş için 2. derece yansoy kan hısımıdır; diğer eş için ise 2. DERECE YANSOY KAYIN HISIMIDIR.',
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
  'Temel Hukuk Kavramları',
  'multiple_choice',
  2,
  'Borçlar Hukukunda borcun zamanaşımına (müruruzaman) uğraması durumunda borç ilişkisinin ve alacak hakkının hukuki akıbeti aşağıdakilerden hangisidir?',
  '{"options": ["Borç kendiliğinden tamamen sona erer ve hukuk düzeninde yok sayılır.", "Borç sona ermez; yalnızca dava edilebilirlik niteliğini kaybederek ''Eksik Borç'' haline gelir ve borçlu zamanaşımı def''i ileri sürebilir.", "Borçlu hakkında zorunlu cebri icra takibi başlatılır.", "Borç devlet hazinesine intikal eder.", "Alacaklı hakimden borcun yenilenmesini (tecdit) talep edebilir."], "correctIndex": 1}'::jsonb,
  'Zamanaşımı borcu ortadan kaldıran bir sebep DEĞİLDİR; borcu ''eksik borç'' (tabii borç) haline getirir. Borçlu ödemek zorunda değildir, mahkemede ''zamanaşımı def''i'' ileri sürebilir. Ancak borçlu kendi rızasıyla öderse yaptığı ödeme geçerlidir, geri isteyemez.',
  'ÖSYM''nin en temel tuzağı: İfa, ibra, tecdit ve kusursuz imkansızlık borcu BİTİRİR; Zamanaşımı ise borcu BİTİRMEZ, sadece EKSİK BORÇ haline getirir!',
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
  'Temel Hukuk Kavramları',
  'multiple_choice',
  2,
  'Ayırt etme gücüne sahip 17 yaşındaki lise öğrencisi Can''ın, yasal temsilcisi olan anne ve babasının izni veya onayı olmaksızın bir mağazadan vadeli bilgisayar satın alması durumunda bu hukuki işlemin geçerlilik durumu nedir?',
  '{"options": ["İşlem kurucu unsuru eksik olduğu için yoklukla maluldür.", "İşlem baştan itibaren mutlak butlanla kesin olarak geçersizdir.", "İşlem ''Tek Taraflı Bağlamazlık'' (Askıda Hükümsüzlük) durumundadır; yasal temsilci onay verirse geçerli hale gelir, vermezse baştan itibaren geçersiz olur.", "İşlem tamamen geçerlidir, velinin onayına gerek yoktur.", "İşlem nisbi butlanla geçerlidir, ancak Can 18 yaşına girince iptal davası açabilir."], "correctIndex": 2}'::jsonb,
  'Ayırt etme gücü olan ergin olmayanlar (sınırlı ehliyetsizler), kendilerini borç altına sokan işlemleri yasal temsilcilerinin izni olmadan tek başlarına yapamazlar. Bu işlem ''Tek Taraflı Bağlamazlık'' hükmündedir; veli onay verirse sözleşme baştan itibaren geçerli olur.',
  'Sınırlı ehliyetsizin borçlandırıcı işlemleri yokluk veya mutlak butlan DEĞİLDİR; askıda hükümsüzdür (tek taraflı bağlamazlık).',
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
  'Temel Hukuk Kavramları',
  'multiple_choice',
  2,
  'Borçlar Kanunu''na göre aşağıdakilerden hangisi bir ''Haksız Fiil''in varlığı ve bundan dolayı tazminat sorumluluğunun doğması için aranan kurucu unsurlardan biri DEĞİLDİR?',
  '{"options": ["Hukuka aykırı bir fiil", "Maddi veya manevi bir zararın doğması", "Fiil ile zarar arasında illiyet (nedensellik) bağının bulunması", "Failin kusurlu (kast veya ihmal) olması", "Taraflar arasında önceden yapılmış yazılı bir sözleşmenin bulunması"], "correctIndex": 4}'::jsonb,
  'Haksız fiilin dört temel unsuru vardır: Hukuka aykırı fiil, zarar, illiyet bağı ve kusur. Taraflar arasında önceden sözleşme olması haksız fiil için şart değildir; tam tersine sözleşme ihlali ''sözleşmeye aykırılık'' sorumluluğunu doğurur.',
  'Haksız fiil sözleşme dışı sorumluluktur; önceden sözleşme bulunması şartı kesinlikle aranmaz.',
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
  'Temel Hukuk Kavramları',
  'multiple_choice',
  2,
  'Borçlar Hukukunda mevcut bir borcun tarafların anlaşmasıyla sona erdirilip yerine yepyeni bir borcun ikame edilmesine (borcun yenilenmesine) ne ad verilir?',
  '{"options": ["İbra", "Tecdit (Yenileme)", "Takas", "Kusursuz İmkânsızlık", "Alacaklı ve borçlu sıfatının birleşmesi"], "correctIndex": 1}'::jsonb,
  'Mevcut eski borcun sona erdirilerek yerine yeni bir borç ilişkisinin kurulmasına ''Tecdit'' (Yenileme) denir. İbra ise alacaklının borçluyu borcundan tamamen ibra edip alacağını bağışlamasıdır.',
  'Alacaktan vazgeçme = İbra; Eski borcu yeni borçla değiştirme = Tecdit (Yenileme).',
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
  'Temel Hukuk Kavramları',
  'multiple_choice',
  2,
  'Hakkın bizzat sahibi tarafından korunması yolları değerlendirildiğinde; bir kişinin kendisinin veya başkasının hayatını veya malını derhal gerçekleşecek haksız bir saldırıdan korumak için saldırgana karşı ölçülü güç kullanmasına ne ad verilir?',
  '{"options": ["Zaruret Hali (Iztırar)", "Meşru Müdafaa (Haklı Savunma)", "Kuvvet Kullanma", "İhkak-ı Hak", "Hakkın Kötüye Kullanılması"], "correctIndex": 1}'::jsonb,
  'Haksız ve devam eden bir saldırıyı defetmek için saldırgana karşı orantılı güç kullanmaya ''Meşru Müdafaa'' denir. Meşru müdafaa hukuka uygunluk sebebidir; kişi ceza almaz ve tazminat ödemez.',
  'Saldırgana zarar verilirse = Meşru Müdafaa (tazminat yok); Tehlikeden kaçmak için masum üçüncü kişinin malına zarar verilirse = Zaruret Hali (ıztırar - hakkaniyet tazminatı ödenir).',
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
  'Temel Hukuk Kavramları',
  'multiple_choice',
  2,
  'Dağda yürüyüş yaparken aniden ortaya çıkan ayı saldırısından canını kurtarmak için dağcı Mehmet''in, yol kenarında gördüğü Ali''ye ait kulübenin kapısını kırıp içeri sığınması ve kapıyı parçalaması hangi hukuki durumdur?',
  '{"options": ["Meşru Müdafaa", "Zaruret (Iztırar) Hali", "Kuvvet Kullanma", "Kasıtlı Mala Zarar Verme Suçu", "İyiniyet Kuralı"], "correctIndex": 1}'::jsonb,
  'Kişinin kendisini veya yakınını ağır ve derhal gerçekleşecek bir tehlikeden korumak için üçüncü bir kişinin malına zarar vermesine ''Zaruret (Iztırar) Hali'' denir. Mehmet ceza almaz ancak kırdığı kapının zararını hakkaniyet gereği Ali''ye tazmin etmek zorundadır.',
  'Saldırı ayıdan veya doğadan gelip üçüncü kişinin malına zarar verilmişse bu Meşru Müdafaa değil, ZARURET (IZTIRAR) HALİ''dir.',
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
  'Temel Hukuk Kavramları',
  'multiple_choice',
  2,
  'Türk Hukukunda tüzel kişilerin ''Fiil Ehliyeti''ni (bizzat işlem yapabilme ve borçlanabilme yetkisini) kazandıkları an aşağıdakilerden hangisidir?',
  '{"options": ["Kuruldukları ve tescil edildikleri anda", "Kanuna ve kuruluş belgelerine göre gerekli ZORUNLU ORGANLARA sahip oldukları anda", "En az 50 üyeye ulaştıkları anda", "İlk genel kurul toplantısını yaptıkları anda", "Valilikten faaliyet izin belgesi aldıkları anda"], "correctIndex": 1}'::jsonb,
  'Medeni Kanun m. 49 uyarınca tüzel kişiler ''Hak Ehliyetini'' kuruldukları anda; ''Fiil Ehliyetini'' ise kanuna ve kuruluş belgelerine göre gerekli organlara (yönetim kurulu vb.) sahip oldukları anda kazanırlar.',
  'Tüzel kişiler kurulunca Hak ehliyetini; ZORUNLU ORGANLARINI tamamlayınca Fiil ehliyetini kazanır!',
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
  'Temel Hukuk Kavramları',
  'multiple_choice',
  2,
  'Ölümüne kesin gözle bakılacak bir halde kaybolan (örneğin infilak eden bir uçakta yolcu olan ancak cesedine ulaşılamayan) bir kişinin hukuki durumu hakkında ''Ölüm Karinesi'' gereğince kimin emriyle kütüğe ölü kaydı düşülür?',
  '{"options": ["Sulh Hukuk Mahkemesi Hakiminin kararıyla", "Asliye Hukuk Mahkemesi Hakiminin kararıyla", "O yerin en büyük mülki amirinin (Vali veya Kaymakam) emriyle", "Cumhuriyet Başsavcısının kararıyla", "Nüfus Müdürünün re''sen tespitiyle"], "correctIndex": 2}'::jsonb,
  'Ölüm karinesinde mahkeme kararı ARANMAZ! O yerin en büyük mülki amirinin (Vali veya Kaymakam) emriyle nüfus kütüğüne ölü kaydı düşülür. Evlilik kendiliğinden son bulur ve miras teminatsız intikal eder.',
  'Gaiplikte mahkeme kararı şarttır; Ölüm karinesinde ise MAHKEME KARARI YOKTUR, doğrudan mülki amir emriyle ölü kaydı işlenir!',
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
  'Temel Hukuk Kavramları',
  'multiple_choice',
  2,
  'Hukuk kurallarının tarafların sözleşmede kullandıkları ancak ne anlama geldiğini açıkça belirtmedikleri terimleri veya süreleri açıklamaya yarayan türüne ne ad verilir?',
  '{"options": ["Tamamlayıcı Hukuk Kuralları", "Yorumlayıcı Hukuk Kuralları", "Emredici Hukuk Kuralları", "Tanımlayıcı Hukuk Kuralları", "İstisnai Hukuk Kuralları"], "correctIndex": 1}'::jsonb,
  'Tarafların sözleşmede yer verdikleri ama anlamını netleştirmedikleri hususları (örneğin ''ayın başı'' ifadesinin ayın 1''i, ''ayın ortası'' ifadesinin ayın 15''i sayılması gibi) aydınlatan kurallara ''YORUMLAYICI HUKUK KURALLARI'' denir.',
  'Boşluk dolduran = Tamamlayıcı; Belirsiz ifadeyi açıklayan = Yorumlayıcı; Kavramın ne olduğunu belirten = Tanımlayıcı kuraldır.',
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
  'Temel Hukuk Kavramları',
  'multiple_choice',
  2,
  'Türk Medeni Kanunu''nda düzenlenen ehliyet sistemine göre ''Ayırt etme gücü bulunmayan'' (örneğin ağır akıl hastası) bir kişinin hukuki durumu ve ehliyet grubu hangisidir?',
  '{"options": ["Tam Ehliyetli", "Sınırlı Ehliyetli", "Sınırlı Ehliyetsiz", "Tam Ehliyetsiz", "Yarı Ehliyetli"], "correctIndex": 3}'::jsonb,
  'Ayırt etme gücü bulunmayan kişiler ''TAM EHLİYETSİZ'' grubundadır. Bu kişilerin yaptıkları tüm hukuki işlemler kural olarak kesin hükümsüzdür (mutlak butlan / yokluk hükmündedir); veli veya vasileri dahi bu işlemleri sonradan geçerli kılamaz.',
  'Ayırt etme gücü olmayan = Tam Ehliyetsiz; Ayırt etme gücü olan ergin olmayan/kısıtlı = Sınırlı Ehliyetsiz.',
  50
);

COMMIT;
