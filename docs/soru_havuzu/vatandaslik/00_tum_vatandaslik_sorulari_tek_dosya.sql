-- =============================================================
-- KADRO KPSS LİSANS GENEL KÜLTÜR — TÜM VATANDAŞLIK SORULARI (MASTER)
-- Toplam: 6 Konu x 50 Soru = 300 Özgün Soru
-- Hedef Tablo: public.questions (Supabase)
-- UWorld Modeli: prompt_text, options, correctIndex, explanation, distractor_trap, order_index
-- =============================================================
BEGIN;


-- -------------------------------------------------------------
-- KONU 1: TEMEL HUKUK KAVRAMLARI
-- -------------------------------------------------------------

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


-- -------------------------------------------------------------
-- KONU 2: 1982 ANAYASASI VE TEMEL İLKELER
-- -------------------------------------------------------------

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


-- -------------------------------------------------------------
-- KONU 3: TEMEL HAK VE ÖDEVLER
-- -------------------------------------------------------------

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
  'Temel Hak ve Ödevler',
  'multiple_choice',
  1,
  '1982 Anayasası''nın 13. maddesine göre temel hak ve hürriyetler ancak aşağıdakilerden hangisi ile sınırlandırılabilir?',
  '{"options": ["Cumhurbaşkanlığı Kararnamesi", "Kanun", "Yönetmelik", "Genelge", "Valilik Kararı"], "correctIndex": 1}'::jsonb,
  'Anayasa m. 13''ün amir hükmü gereğince temel hak ve hürriyetler; özlerine dokunulmaksızın yalnızca Anayasa''nın ilgili maddelerinde belirtilen sebeplere bağlı olarak ve ancak KANUNLA sınırlanabilir. Cumhurbaşkanlığı kararnamesi veya yönetmelikle temel haklar sınırlanamaz.',
  'ÖSYM temel hakların sınırlandırılma aracını sıkça sorar: Tek ve mutlak araç TBMM tarafından çıkarılan KANUN''dur.',
  1
);

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
  'Temel Hak ve Ödevler',
  'multiple_choice',
  1,
  'Georg Jellinek''in kamu hakları sınıflandırmasına göre bireyi devlete ve topluma karşı koruyan, devletin kişinin özel alanına müdahale etmesini engelleyen haklara ''Negatif Statü (Koruyucu) Hakları'' denir.

Aşağıdakilerden hangisi bir negatif statü (kişisel) hakkıdır?',
  '{"options": ["Sağlık hakkı", "Konut edinme hakkı", "Özel hayatın gizliliği ve korunması hakkı", "Sosyal güvenlik hakkı", "Sendika kurma hakkı"], "correctIndex": 2}'::jsonb,
  'Özel hayatın gizliliği, konut dokunulmazlığı, kişi hürriyeti, mülkiyet ve yaşam hakkı gibi haklar devletin karışmaması gereken kişisel (koruyucu/negatif statü) haklarıdır. Sağlık, konut, sosyal güvenlik ve sendika ise devletten hizmet istenen ''Sosyal ve Ekonomik (İsteme)'' haklardır.',
  'Kişisel haklar = Karışma (Negatif); Sosyal haklar = Hizmet ver (Pozitif/İsteme); Siyasi haklar = Yönetime kat (Aktif).',
  2
);

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
  'Temel Hak ve Ödevler',
  'multiple_choice',
  1,
  '1982 Anayasası''na göre dernek kurma, sendika kurma veya toplantı ve gösteri yürüyüşü düzenleme hakkı ile ilgili ortak anayasal kural aşağıdakilerden hangisidir?',
  '{"options": ["İçişleri Bakanlığı''ndan önceden yazılı izin alma zorunluluğu vardır.", "Valilik veya kaymakamlıktan izin alındıktan sonra faaliyet gösterilebilir.", "Önceden izin almaksızın kurulabilir veya düzenlenebilirler.", "Sadece 30 yaşını doldurmuş vatandaşlar tarafından kurulabilirler.", "Kurulabilmeleri için mutlaka TBMM onayından geçmeleri gerekir."], "correctIndex": 2}'::jsonb,
  'Anayasa m. 33 (Dernek), m. 34 (Toplantı ve Gösteri Yürüyüşü) ve m. 51 (Sendika) açıkça hükme bağlamıştır: Herkes ''ÖNCEDEN İZİN ALMAKSIZIN'' dernek kurma, sendika kurma, silahsız ve saldırısız toplantı ve gösteri yürüyüşü yapma hakkına sahiptir.',
  'Halk arasında izin alınması gerektiği sanılır; anayasal olarak izin şartı KESİNLİKLE YOKTUR, sadece bildirim esastır.',
  3
);

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
  'Temel Hak ve Ödevler',
  'multiple_choice',
  1,
  '1982 Anayasası''na göre bir derneğin kurulabilmesi için fiil ehliyetine sahip en az kaç gerçek veya tüzel kişinin bir araya gelmesi kanunen şarttır?',
  '{"options": ["3", "5", "7", "10", "30"], "correctIndex": 2}'::jsonb,
  'Dernekler Kanunu uyarınca en az 7 gerçek veya tüzel kişi bir araya gelerek dernek kurabilir. Siyasi parti kurmak için ise en az 30 Türk vatandaşı gerekir.',
  'Dernek = En az 7 kişi; Siyasi Parti = En az 30 kişi. Sayıları birbirine karıştırmayınız.',
  4
);

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
  'Temel Hak ve Ödevler',
  'multiple_choice',
  1,
  'Aşağıdakilerden hangisi 1982 Anayasası''nda düzenlenen ''Siyasi Haklar ve Ödevler'' (Aktif Statü Hakları) grubunda yer almaz?',
  '{"options": ["Seçme, seçilme ve siyasi faaliyette bulunma hakkı", "Kamu hizmetlerine girme hakkı", "Dilekçe, bilgi edinme ve kamu denetçisine başvurma hakkı", "Vergi ödevi", "Toplu iş sözleşmesi ve grev hakkı"], "correctIndex": 4}'::jsonb,
  'Grev ve lokavt ile toplu iş sözleşmesi hakkı (m. 53-54) işçi-işveren ilişkilerini düzenleyen bir ''Sosyal ve Ekonomik (Pozitif Statü) Hak''tır. Seçme-seçilme, kamu hizmetine girme, dilekçe ve vergi ise ''Siyasi Hak ve Ödevler''dendir.',
  'Grev hakkı siyasi değil, sosyal ve ekonomik haktır! Memurların grev hakkı anayasada yasaktır.',
  5
);

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
  'Temel Hak ve Ödevler',
  'multiple_choice',
  1,
  '1982 Anayasası''nın 15. maddesinde yer alan ve savaş, seferberlik veya olağanüstü hal (OHAL) dönemlerinde dahi KESİNLİKLE DOKUNULAMAYACAK olan ''Sert Çekirdek Haklar'' arasında aşağıdakilerden hangisi yer almaz?',
  '{"options": ["Kişinin yaşama hakkı, maddi ve manevi varlığının bütünlüğü (savaş hukukuna uygun ölümler hariç)", "Kimsenin din, vicdan, düşünce ve kanaatlerini açıklamaya zorlanamaması ve bunlardan dolayı suçlanamaması", "Suç ve cezaların geçmişe yürütülememesi ilkesi", "Suçluluğu mahkeme kararı ile saptanıncaya kadar kimsenin suçlu sayılamaması (Masumiyet karinesi)", "Mülkiyet hakkı ve miras hakkı"], "correctIndex": 4}'::jsonb,
  'Sert çekirdek haklar dörttür: 1) Yaşama hakkı ve vücut bütünlüğü, 2) Din ve vicdanını açıklamaya zorlanmama, 3) Masumiyet karinesi, 4) Suç ve cezaların geçmişe yürümemesi. Mülkiyet hakkı sert çekirdek hak değildir; OHAL ve savaşta sınırlandırılabilir ve el konulabilir.',
  'Savaşta dahi dokunulamayan haklar dörttür; mülkiyet ve seyahat hürriyeti bu grupta yer almaz.',
  6
);

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
  'Temel Hak ve Ödevler',
  'multiple_choice',
  1,
  '1982 Anayasası''na göre ilköğretim eğitimi ile ilgili aşağıdaki ifadelerden hangisi anayasal bir kuraldır?',
  '{"options": ["Yalnızca erkek çocuklar için zorunludur.", "Kız ve erkek bütün vatandaşlar için zorunludur ve Devlet okullarında parasızdır.", "Ücreti velinin gelir durumuna göre okul aile birliğince belirlenir.", "Sadece 12 yaşından sonra başlar.", "Özel okullarda parasız olmak zorundadır."], "correctIndex": 1}'::jsonb,
  'Anayasa m. 42 açık hükmüdür: ''İlköğretim, kız ve erkek bütün vatandaşlar için zorunludur ve Devlet okullarında parasızdır.''',
  'İlköğretim devlet okullarında parasız ve tüm kız-erkek vatandaşlar için zorunlu olan anayasal temel haktır.',
  7
);

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
  'Temel Hak ve Ödevler',
  'multiple_choice',
  1,
  '1982 Anayasası''na göre Türkiye Büyük Millet Meclisi Başkanlığı''na bağlı olarak kurulan ve idarenin işleyişiyle ilgili şikayetleri inceleyen ''Kamu Denetçiliği Kurumu''nun (Ombudsmanlık) başındaki Kamu Başdenetçisi kim tarafından seçilir?',
  '{"options": ["Cumhurbaşkanı", "Türkiye Büyük Millet Meclisi (TBMM)", "Anayasa Mahkemesi", "Danıştay Genel Kurulu", "Hakimler ve Savcılar Kurulu"], "correctIndex": 1}'::jsonb,
  'Kamu Denetçiliği Kurumu TBMM Başkanlığı''na bağlıdır ve Kamu Başdenetçisi TBMM Genel Kurulu tarafından gizli oyla dört turlu oylama usulüyle 4 yıl için seçilir.',
  'Kamu Başdenetçisini Cumhurbaşkanı DEĞİL, doğrudan TBMM seçer!',
  8
);

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
  'Temel Hak ve Ödevler',
  'multiple_choice',
  1,
  '1982 Anayasası''nın 73. maddesinde düzenlenen vergi ödevi ile ilgili olarak ''Herkes, kamu giderlerini karşılamak üzere ......... göre vergi ödemekle yükümlüdür.'' ifadesindeki boşluğa aşağıdakilerden hangisi getirilmelidir?',
  '{"options": ["Eğitim düzeyine", "Yaşına", "Mali gücüne", "Mesleki kıdemine", "Medeni durumuna"], "correctIndex": 2}'::jsonb,
  'Anayasa m. 73: ''Herkes, kamu giderlerini karşılamak üzere, mali gücüne göre, vergi ödemekle yükümlüdür.'' Bu ilkeye verginin mali güce göre alınması (ödeme gücü) ilkesi denir.',
  'Vergide eşitlik herkesin aynı TL tutarını ödemesi demek değildir; herkesin mali gücüne göre (artan oranlı) ödemesidir.',
  9
);

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
  'Temel Hak ve Ödevler',
  'multiple_choice',
  1,
  '1982 Anayasası''na göre Türk vatandaşlığı ile ilgili aşağıdaki hükümlerden hangisi yanlıştır?',
  '{"options": ["Türk Devletine vatandaşlık bağı ile bağlı olan herkes Türktür.", "Türk babanın veya Türk ananın çocuğu Türktür.", "Vatandaşlık, kanunun gösterdiği şartlarla kazanılır ve ancak kanunda belirtilen hallerde kaybedilir.", "Hiçbir Türk, vatana bağlılıkla bağdaşmayan bir eylemde bulunmadıkça vatandaşlıktan çıkarılamaz.", "Vatandaşlıktan çıkarma ile ilgili karar ve işlemlere karşı yargı yolu kesin olarak kapalıdır."], "correctIndex": 4}'::jsonb,
  'Anayasa m. 66 son fıkrası açıktır: ''Vatandaşlıktan çıkarma ile ilgili karar ve işlemlere karşı yargı yolu kapatılamaz.'' İptal davası Danıştay''da açılır.',
  'Vatandaşlıktan çıkarma işlemlerine karşı yargı yolu açıktır; yargı denetimi asla engellenemez.',
  10
);

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
  'Temel Hak ve Ödevler',
  'multiple_choice',
  2,
  '1982 Anayasası''na göre bir kimseye ''yurt dışına çıkma yasağı'' hangi makam tarafından ve hangi gerekçeyle konulabilir?',
  '{"options": ["Vergi dairesi müdürü tarafından vergi borcundan ötürü", "Yalnızca suç soruşturması veya kovuşturması sebebiyle HÂKİM KARARIYLA", "İçişleri Bakanı''nın idari genelgesiyle", "Emniyet Genel Müdürlüğü''nün güvenlik gerekçesiyle", "Valilik kararıyla il sınırları içinde"], "correctIndex": 1}'::jsonb,
  '2010 anayasa değişikliği ile Anayasa m. 23 değiştirilmiştir: Vatandaşın yurt dışına çıkma hürriyeti, ANCAK suç soruşturması veya kovuşturması sebebiyle HÂKİM KARARINA bağlı olarak sınırlanabilir. İdarenin vergi borcu sebebiyle yurtdışı yasağı koyma yetkisi tamamen kaldırılmıştır.',
  'Vergi borcu sebebiyle yurtdışı çıkış yasağı konulamaz! Yasak sadece hakim kararıyla ve ceza soruşturması/kovuşturması için verilebilir.',
  11
);

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
  'Temel Hak ve Ödevler',
  'multiple_choice',
  2,
  '1982 Anayasası''na göre siyasi partilere üye olabilecek ve üye olamayacak kişiler dikkate alındığında aşağıdakilerden hangisi siyasi partilere ÜYE OLABİLİR?',
  '{"options": ["Yargıtay ve Danıştay daire başkanları ve üyeleri", "Devlet memurları", "Silahlı Kuvvetler mensupları (subay, astsubay, uzman erbaş)", "Yükseköğretim elemanları (üniversite profesör ve doçentleri) ve yükseköğretim öğrencileri", "Askeri öğrenciler ve lise öğrencileri"], "correctIndex": 3}'::jsonb,
  'Anayasa m. 68 uyarınca hakimler-savcılar, memurlar, askerler ve lise öğrencileri partilere üye olamaz. Ancak Yükseköğretim elemanları (öğretim üyeleri) sadece merkez organlarında görev almak şartıyla ve Yükseköğretim öğrencileri (üniversite öğrencileri) siyasi partilere ÜYE OLABİLİRLER.',
  'Üniversite hocaları ve üniversite öğrencileri siyasi partilere üye olabilir; memurlar ve lise öğrencileri ise üye olamaz!',
  12
);

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
  'Temel Hak ve Ödevler',
  'multiple_choice',
  2,
  '1982 Anayasası''nda yer alan ''Suçluluğu hükmen sabit oluncaya kadar, kimse suçlu sayılamaz.'' hükmü ceza muhakemesinin hangi evrensel ilkesinin ifadesidir?',
  '{"options": ["Kanunilik ilkesi", "Masumiyet (Suçsuzluk) Karinesi", "Cezaların şahsiliği", "Adil yargılanma hakkı", "Aleniyet ilkesi"], "correctIndex": 1}'::jsonb,
  'Hakkında kesinleşmiş mahkumiyet kararı verilinceye kadar herkes hukuken masumdur. Buna ''masumiyet karinesi'' denir ve Anayasa m. 15 uyarınca savaş halinde bile dokunulamayan sert çekirdek haktır.',
  'Kişi gözaltına alınsa veya tutuklansa bile masumiyet karinesi devam eder; suçlu sayılması için kararın kesinleşmesi şarttır.',
  13
);

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
  'Temel Hak ve Ödevler',
  'multiple_choice',
  2,
  'Özel hayatın gizliliği ve konut dokunulmazlığı anayasal güvence altındadır.

Bir kimsenin üstü, özel kağıtları ve eşyası aranamaz ve bunlara el konulamaz kuralının istisnası olarak arama ve el koyma işlemi kural olarak kimin kararıyla yapılabilir?',
  '{"options": ["Valilik genelgesiyle", "Hâkim kararıyla (gecikmesinde sakınca bulunan hallerde kanunla yetkili kılınan merciin yazılı emriyle)", "Kolluk amirinin sözlü talimatıyla", "Muhtarın izniyle", "Apartman yöneticisinin rızasıyla"], "correctIndex": 1}'::jsonb,
  'Anayasa m. 20 ve 21''e göre üst araması, konut araması ve el koyma kural olarak HÂKİM KARARI ile yapılır. Gecikmesinde sakınca bulunan hallerde yetkili merciin yazılı emri gerekir ve bu emir 24 saat içinde görevli hakimin onayına sunulmalıdır.',
  'Sözlü emirle arama yapılamaz; hakim kararı veya gecikmesinde sakınca olan hallerde yetkili merciin YAZILI emri şarttır.',
  14
);

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
  'Temel Hak ve Ödevler',
  'multiple_choice',
  2,
  '1982 Anayasası''nda 2001 yılında yapılan değişiklikle temel hak ve hürriyetlerin sınırlandırılması rejiminden aşağıdakilerden hangisi tamamen çıkarılmıştır?',
  '{"options": ["Kanunla sınırlama kuralı", "Ölçülülük ilkesi", "Genel sınırlama sebepleri", "Hakkın özüne dokunma yasağı", "Demokratik toplum düzeninin gerekleri"], "correctIndex": 2}'::jsonb,
  '2001 anayasa değişikliğine kadar anayasada tüm haklar için geçerli ''kamu düzeni, milli güvenlik'' gibi torba genel sınırlama sebepleri vardı. 2001''de bu genel sınırlama sebepleri kaldırılmış; her hak için sadece kendi maddesinde yazan ÖZEL SEBEPLERLE sınırlama esası getirilmiştir.',
  'Genel sınırlama sebepleri artık yoktur! Sınırlama sadece o hakkın maddesindeki ÖZEL sınırlama sebebine dayanabilir.',
  15
);

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
  'Temel Hak ve Ödevler',
  'multiple_choice',
  2,
  'Kişi hürriyeti ve güvenliği kapsamında yakalanan veya tutuklanan bir kimse, tutulma yerine en yakın mahkemeye gönderilmesi için gerekli süre hariç en geç kaç saat içinde hâkim önüne çıkarılmalıdır?',
  '{"options": ["12 saat", "24 saat", "48 saat (Toplu işlenen suçlarda en çok 4 gün)", "72 saat", "7 gün"], "correctIndex": 2}'::jsonb,
  'Anayasa m. 19 uyarınca yakalanan veya tutuklanan kişi bireysel suçlarda en geç 48 SAAT; toplu olarak işlenen suçlarda ise en çok 4 GÜN içinde hâkim önüne çıkarılmak zorundadır.',
  'Bireysel suçlarda 48 saat, toplu suçlarda 4 gündür. Süreler yol süresi hariç tutularak hesaplanır.',
  16
);

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
  'Temel Hak ve Ödevler',
  'multiple_choice',
  2,
  'Kamulaştırma (istimlak), devlet veya kamu tüzel kişilerinin kamu yararının gerektirdiği hallerde özel mülkiyetteki bir taşınmazın mülkiyetini zorla devralmasıdır.

Kamulaştırma bedeli kural olarak nasıl ödenir?',
  '{"options": ["Hisse senedi ile", "Devlet tahvili ile", "Nakit ve peşin olarak", "5 eşit taksitle", "Gayrimenkul takası ile"], "correctIndex": 2}'::jsonb,
  'Anayasa m. 46 uyarınca kamulaştırma bedeli kural olarak NAKİT VE PEŞİN ödenir. İstisnai olarak büyük enerji, sulama, tarım ve orman projelerinde taksitle (en çok 5 yılda ve kamu alacaklarına uygulanan en yüksek faizle) ödenebilir.',
  'Kural nakit ve peşindir! Taksitlendirme sadece anayasada sayılan istisnai büyük projeler için en fazla 5 yıl geçerlidir.',
  17
);

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
  'Temel Hak ve Ödevler',
  'multiple_choice',
  2,
  'Devlet memurlarının ve kamu görevlilerinin kanunen ''Mal Bildiriminde Bulunma'' zorunluluğu bulunmaktadır.

Devlet memurları genel mal bildirimlerini sonu hangi rakamlarla biten yıllarda ve en geç hangi ayın sonuna kadar yenilemek zorundadır?',
  '{"options": ["Sonu 0 ve 5 ile biten yıllarda — Şubat ayı sonuna kadar", "Sonu 1 ve 6 ile biten yıllarda — Ocak ayı sonuna kadar", "Sonu çift rakamla biten yıllarda — Aralık ayı sonuna kadar", "Her yılın başında — Ocak ayı sonuna kadar", "Sonu 3 ve 8 ile biten yıllarda — Mart ayı sonuna kadar"], "correctIndex": 0}'::jsonb,
  '3628 sayılı Mal Bildiriminde Bulunulması Kanunu uyarınca memurlar sonu 0 ve 5 ile biten yıllarda (örn. 2020, 2025, 2030) en geç Şubat ayı sonuna kadar mal bildirimlerini yenilemek zorundadırlar.',
  'Sonu 0 ve 5 ile biten yıllar ve Şubat ayı sonu! Bu süre ve kural KPSS''de doğrudan bilgi sorusu olarak sorulur.',
  18
);

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
  'Temel Hak ve Ödevler',
  'multiple_choice',
  2,
  '1982 Anayasası''na göre ''Dilekçe Hakkı''nın kullanılması ve yabancıların bu haktan yararlanabilmesi ile ilgili şart aşağıdakilerden hangisidir?',
  '{"options": ["Yabancının en az 10 yıldır Türkiye''de ikamet etmesi", "Yabancının Türkçe bilmesi ve Türk vatandaşıyla evli olması", "Karşılıklılık (mütekabiliyet) esası gözetilmek ve dilekçenin Türkçe yazılması kaydıyla Türkiye''de oturan yabancılar da yararlanabilir", "Yabancılar dilekçe hakkından hiçbir şekilde yararlanamaz", "Yabancıların yalnızca kendi elçiliklerine dilekçe verebilmesi"], "correctIndex": 2}'::jsonb,
  'Anayasa m. 74 uyarınca Türkiye''de ikamet eden yabancılar; dilekçelerini Türkçe yazmak ve kendi ülkelerinde de Türk vatandaşlarına bu hakkın tanınmış olması (karşılıklılık/mütekabiliyet) şartıyla dilekçe hakkından faydalanabilirler.',
  'Yabancıların dilekçe verebilmesi için iki şart vardır: Karşılıklılık (mütekabiliyet) ve dilekçenin Türkçe yazılmış olması.',
  19
);

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
  'Mülkiyet hakkı adında ''ekonomik'' çağrışım yapsa da anayasada Sosyal-Ekonomik haklarda DEĞİL, Kişisel Haklar (Negatif Statü) bölümündedir!',
  20
);

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
  'Temel Hak ve Ödevler',
  'multiple_choice',
  2,
  '1982 Anayasası''na göre basımevi (matbaa) kurma hürriyeti ile ilgili aşağıdaki anayasal güvencelerden hangisi doğrudur?',
  '{"options": ["Basımevi kurmak için önceden izin alma ve mali teminat yatırma şartı konulamaz.", "Basımevi ancak İletişim Başkanlığı''nın izniyle kurulabilir.", "Basımevleri sadece anonim şirket şeklinde kurulabilir.", "Basımevi açabilmek için en az 10 yıl gazetecilik yapmış olmak şarttır.", "Basımevi kurmak yalnızca kamu tüzel kişilerine tanınmış bir imtiyazdır."], "correctIndex": 0}'::jsonb,
  'Anayasa m. 29 uyarınca basımevi kurmak, izin alma ve mali teminat yatırma şartına bağlanamaz. Ayrıca kanuna uygun kurulmuş bir basımevi ve eklentileri suç aleti olduğu gerekçesiyle zapt ve müsadere edilemez.',
  'Basımevi kurmak için izin alma şartı da mali teminat yatırma şartı da anayasa ile kesin olarak yasaklanmıştır.',
  21
);

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
  'Temel Hak ve Ödevler',
  'multiple_choice',
  2,
  'Din ve ahlak eğitimi ile ilgili 1982 Anayasası''nda yer alan kural aşağıdakilerden hangisidir?',
  '{"options": ["Din eğitimi tamamen yasaklanmıştır.", "Din ve ahlak eğitim ve öğretimi Devletin gözetim ve denetimi altında yapılır; din kültürü ve ahlak öğretimi ilk ve ortaöğretim kurumlarında okutulan zorunlu dersler arasındadır.", "Din eğitimi sadece vakıf ve dernekler tarafından verilebilir.", "Din dersleri sadece üniversitelerde seçmeli ders olarak verilir.", "Din dersi almayan öğrencilere mezuniyet belgesi verilemez."], "correctIndex": 1}'::jsonb,
  'Anayasa m. 24/4 gereğince din ve ahlak eğitim ve öğretimi devletin gözetim ve denetimi altında yapılır. Din kültürü ve ahlak öğretimi ilk ve ortaöğretim kurumlarında okutulan zorunlu derslerdendir.',
  'Din kültürü ve ahlak öğretimi anayasal olarak ilk ve ortaöğretimde ZORUNLU derstir; bunun dışındaki özel dini eğitim ise kişinin kendi, küçüklerin ise kanuni temsilcisinin isteğine bağlıdır.',
  22
);

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
  'Temel Hak ve Ödevler',
  'multiple_choice',
  2,
  '1982 Anayasası''nın 51. maddesinde düzenlenen ''Sendika Kurma Hakkı'' ile ilgili aşağıdaki hükümlerden hangisi doğrudur?',
  '{"options": ["Sendika kurabilmek için Çalışma ve Sosyal Güvenlik Bakanlığı''ndan önceden ruhsat alınmalıdır.", "Çalışanlar ve işverenler, önceden izin almaksızın sendikalar ve üst kuruluşlar kurma, bunlara serbestçe üye olma ve üyelikten çekilme hakkına sahiptir.", "Bir kimse aynı zamanda ve aynı işkolunda birden çok sendikaya kesinlikle üye olamaz.", "Sendika kurucularının en az 50 yaşında olması şarttır.", "Sendikaların grev kararı alması kanunen yasaktır."], "correctIndex": 1}'::jsonb,
  'Sendika kurma hakkı önceden izin almaksızın serbestçe kullanılır. Ayrıca 2010 anayasa değişikliği ile ''aynı zamanda ve aynı işkolunda birden çok sendikaya üye olunamaz'' yasağı kaldırılmıştır.',
  'Sendika kurmak için izin gerekmez; ayrıca 2010''dan beri aynı işkolunda birden çok sendikaya üye olma yasağı kaldırılmıştır.',
  23
);

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
  'Temel Hak ve Ödevler',
  'multiple_choice',
  2,
  '1982 Anayasası''na göre toplu iş sözleşmesi yapılması sırasında uyuşmazlık çıkması halinde işçilerin sahip olduğu anayasal hak aşağıdakilerden hangisidir?',
  '{"options": ["Grev hakkı", "Lokavt hakkı", "İstifa hakkı", "İşyerini işgal hakkı", "Genel grev hakkı"], "correctIndex": 0}'::jsonb,
  'Anayasa m. 54 uyarınca toplu iş sözleşmesinin yapılması sırasında uyuşmazlık çıkması halinde işçiler grev hakkına sahiptirler. İşverenler ise lokavt hakkına sahiptir.',
  'İşçinin hakkı Grev; işverenin karşı hakkı ise Lokavttır.',
  24
);

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
  'Temel Hak ve Ödevler',
  'multiple_choice',
  2,
  'Devlet memurları ve kamu görevlilerinin grev yapma hakkı anayasal olarak nasıl düzenlenmiştir?',
  '{"options": ["Memurlar da işçiler gibi serbestçe grev yapabilirler.", "Anayasa m. 54 uyarınca memurların grev yapması kesin olarak yasaklanmıştır; memurlara sadece toplu sözleşme hakkı tanınmıştır.", "Sadece amirlerinin izin verdiği günlerde grev yapabilirler.", "Yılda en fazla 3 gün grev yapabilirler.", "Grev hakkı yalnızca sağlık memurlarına tanınmıştır."], "correctIndex": 1}'::jsonb,
  'Memurlara 2010 anayasa değişikliği ile ''toplu sözleşme'' yapma hakkı verilmiştir; uyuşmazlık durumunda Kamu Görevlileri Hakem Kurulu''na gidilir. Ancak memurların GREV YAPMA HAKKI KESİNLİKLE YOKTUR.',
  'Memurların toplu sözleşme hakkı vardır ama GREV HAKLARI KESİNLİKLE YOKTUR!',
  25
);

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
  'Temel Hak ve Ödevler',
  'multiple_choice',
  2,
  '1982 Anayasası''nın 56. maddesinde yer alan ''Çevre Hakkı'' ile ilgili aşağıdaki ifadelerden hangisi anayasal bir gerçektir?',
  '{"options": ["Çevreyi geliştirmek ve çevre sağlığını korumak yalnızca Devletin ödevidir.", "Çevreyi geliştirmek, çevre sağlığını korumak ve çevre kirlenmesini önlemek hem Devletin hem de vatandaşların ortak ödevidir.", "Çevre hakkı sadece orman köylülerine tanınmış bir haktır.", "Sanayi tesislerine çevre kirliliği sebebiyle ceza verilemez.", "Çevre hakkı bir siyasi haktır."], "correctIndex": 1}'::jsonb,
  'Anayasa m. 56: ''Herkes, sağlıklı ve dengeli bir çevrede yaşama hakkına sahiptir. Çevreyi geliştirmek, çevre sağlığını korumak ve çevre kirlenmesini önlemek Devletin ve vatandaşların ödevidir.'' Hem hak hem ödev niteliğindedir.',
  'Çevreyi korumak sadece devletin değil; hem devletin hem de vatandaşın anayasal görevidir.',
  26
);

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
  'Temel Hak ve Ödevler',
  'multiple_choice',
  2,
  'Kişinin kamu makamları ve üçüncü kişiler tarafından izlenmeden, mektup, telefon, internet ve e-posta gibi iletişim araçlarıyla serbestçe haberleşebilmesini güvence altına alan hak hangisidir?',
  '{"options": ["Haberleşme hürriyeti", "Basın hürriyeti", "Hak arama hürriyeti", "İfade hürriyeti", "Düşünce hürriyeti"], "correctIndex": 0}'::jsonb,
  'Anayasa m. 22 uyarınca herkes haberleşme hürriyetine sahiptir. Haberleşmenin gizliliği esastır. Hakim kararı olmadıkça haberleşme engellenemez ve gizliliğine dokunulamaz.',
  'Haberleşme hürriyeti bir kişisel (negatif statü) haktır.',
  27
);

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
  'Temel Hak ve Ödevler',
  'multiple_choice',
  2,
  '1982 Anayasası''na göre ''Düzeltme ve Cevap Hakkı'' (Tekzip Hakkı) hangi durumda ve nasıl doğar?',
  '{"options": ["Sadece siyasi partilerin talebiyle doğar.", "Ancak kişilerin haysiyet ve şereflerine dokunulması veya kendileriyle ilgili gerçeğe aykırı yayınlar yapılması hallerinde tanınır ve kanunla düzenlenir.", "Her gazete haberine karşı doğrudan para cezası kesilmesini sağlar.", "Yalnızca devlet televizyonu yayınları için geçerlidir.", "Sadece internet sitelerindeki yorumlar için geçerlidir."], "correctIndex": 1}'::jsonb,
  'Anayasa m. 32 uyarınca düzeltme ve cevap hakkı, ancak kişilerin şeref ve haysiyetine dokunulması veya gerçeğe aykırı yayın yapılması halinde doğar. Düzeltme yayımlanmazsa hakim kararıyla yayımlatılır.',
  'Tekzip (düzeltme ve cevap hakkı) basın hürriyetine karşı bireyin şeref ve haysiyetini koruyan anayasal dengedir.',
  28
);

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
  'Temel Hak ve Ödevler',
  'multiple_choice',
  2,
  '1982 Anayasası''nda yer alan ''Sosyal Güvenlik Hakkı'' (m. 60) ile ilgili kural aşağıdakilerden hangisidir?',
  '{"options": ["Sosyal güvenlik sadece memurlar için geçerlidir.", "Herkes, sosyal güvenlik hakkına sahiptir. Devlet, bu güvenliği sağlayacak gerekli tedbirleri alır ve teşkilatı kurar.", "Sosyal güvenlik primlerini yalnızca devlet öder.", "Sosyal güvenlik hakkından yabancılar hiçbir şekilde faydalanamaz.", "Sosyal güvenlik sistemi sadece 65 yaşından sonra devreye girer."], "correctIndex": 1}'::jsonb,
  'Anayasa m. 60 amir hükmüdür: ''Herkes, sosyal güvenlik hakkına sahiptir. Devlet, bu güvenliği sağlayacak gerekli tedbirleri alır ve teşkilatı kurar.'' SGK bu anayasal emrin sonucudur.',
  'Sosyal güvenlik hakkı devletten hizmet talep edilen bir sosyal ve ekonomik haktır.',
  29
);

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
  'Temel Hak ve Ödevler',
  'multiple_choice',
  2,
  'Anayasa m. 72''de düzenlenen ''Vatan Hizmeti'' (askerlik ödevi) ile ilgili aşağıdaki anayasal hüküm hangisidir?',
  '{"options": ["Yalnızca erkekler için zorunlu ve sadece kışlada silah altında yapılır.", "Vatan hizmeti, her Türkün hakkı ve ödevidir. Bu hizmetin Silahlı Kuvvetlerde veya kamu hizmetlerinde ne şekilde yerine getirileceği veya getirilmiş sayılacağı kanunla düzenlenir.", "Vatan hizmeti sadece gönüllülük esasına dayanır.", "Vatan hizmeti sadece savaş zamanında geçerlidir.", "Bedelli askerlik anayasada açıkça yasaklanmıştır."], "correctIndex": 1}'::jsonb,
  'Anayasa m. 72 uyarınca vatan hizmeti her Türkün hem hakkı hem ödevidir; askerlik hizmetinin ordu bünyesinde veya kamu hizmetinde ne şekilde ifa edileceği kanuna bırakılmıştır.',
  'Vatan hizmeti anayasada hem ''hak'' hem de ''ödev'' olarak nitelenen tek hizmettir ve kamu hizmeti şeklinde ifası da anayasal olarak mümkündür.',
  30
);

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
  'Temel Hak ve Ödevler',
  'multiple_choice',
  3,
  'Temel hak ve hürriyetlerin sınırlandırılmasında uygulanan ''Ölçülülük İlkesi'' kendi içinde üç alt ilkeden oluşur.

Aşağıdakilerden hangisi ölçülülük ilkesinin bu üç alt unsurundan biri DEĞİLDİR?',
  '{"options": ["Elverişlilik (Sınırlama aracının ulaşılmak istenen amaca uygun olması)", "Gereklilik / Zorunluluk (Amaca ulaşmak için hakka daha az müdahale eden başka bir aracın bulunmaması)", "Orantılılık (Araç ile amaç arasında makul ve hakkaniyete uygun bir dengenin bulunması)", "Geriye Yürümezlik (Sınırlamanın sadece geçmiş olaylara uygulanması)", "Hakkın özünü zedelemeyecek asgari düzeyde kalınması"], "correctIndex": 3}'::jsonb,
  'Ölçülülük ilkesi üç alt ilkeden oluşur: 1) Elverişlilik, 2) Gereklilik (zorunluluk) ve 3) Orantılılık. ''Geriye yürümezlik'' ölçülülüğün bir unsuru değil, ceza hukukunun ayrı bir güvence ilkesidir.',
  'Ölçülülüğün üç sacayağı: Elverişlilik, Gereklilik ve Orantılılıktır. Bu üçlü Anayasa Mahkemesi kararlarının ana denetim kriteridir.',
  31
);

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
  'Temel Hak ve Ödevler',
  'multiple_choice',
  3,
  'Anayasa m. 38 uyarınca ''Kanuna aykırı olarak elde edilmiş bulgular, delil olarak kabul edilemez.'' hükmü ceza muhakemesinde hangi ilkeyi mutlak kılmıştır?',
  '{"options": ["Hukuka aykırı delillerin ceza yargılamasında hükme esas alınması yasağı (Zehirli ağacın meyvesi de zehirlidir)", "Hâkimin delilleri serbestçe takdir etme yetkisi", "Sanığın susma hakkını kullanmasının suç ikrarı sayılması", "İtirafın tek başına kesin delil teşkil etmesi", "Polisin mahkeme kararı olmadan dilediği gibi dinleme yapabilmesi"], "correctIndex": 0}'::jsonb,
  'Hukuka aykırı yollarla (işkence, izinsiz ses kaydı, yasa dışı ortam dinlemesi vb.) elde edilen bulgular mahkemede delil olarak kullanılamaz; sanık bu delillere dayanılarak cezalandırılamaz.',
  'Delil doğru bile olsa (örneğin cinayet silahı bulunsa bile) elde edilişi hukuka aykırıysa dosyadan çıkarılır ve hükme esas alınamaz.',
  32
);

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
  'Temel Hak ve Ödevler',
  'multiple_choice',
  3,
  '1982 Anayasası''na göre ''Siyasi Partilerin Uyacakları Esaslar ve Yasaklar'' düşünüldüğünde aşağıdakilerden hangisi yanlıştır?',
  '{"options": ["Siyasi partiler ticari faaliyetlere girişemezler.", "Siyasi partiler yabancı devletlerden, uluslararası kuruluşlardan ve yabancı uyruklu kişilerden maddi yardım alamazlar.", "Yabancı devletlerden yardım alan siyasi partiler Anayasa Mahkemesi tarafından temelli kapatılır.", "Siyasi partilerin gelir ve giderlerinin denetimi Danıştay tarafından yapılır.", "Siyasi partiler demokratik devlet ilkelerine aykırı faaliyette bulunamazlar."], "correctIndex": 3}'::jsonb,
  'Anayasa m. 69 uyarınca siyasi partilerin mali denetimini (gelir-gider hesaplarını) Danıştay değil, doğrudan ANAYASA MAHKEMESİ yapar. Anayasa Mahkemesi bu denetimi yaparken Sayıştay''dan yardım alır.',
  'Siyasi partilerin mali denetimini yapan organ ANAYASA MAHKEMESİ''dir (Sayıştay yardım eder, rapor hazırlar ama karar AYM''nindir; Danıştay''ın ilgisi yoktur).',
  33
);

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
  'Temel Hak ve Ödevler',
  'multiple_choice',
  3,
  'Anayasa Mahkemesi''ne ''Bireysel Başvuru'' hakkı Türk hukukuna hangi yıl yapılan anayasa değişikliği ile girmiştir ve bu başvurunun temel ön şartı nedir?',
  '{"options": ["1982''de girmiştir — Doğrudan başvuru esastır", "2001''de girmiştir — TBMM Başkanı''nın onayı şarttır", "2010''da girmiştir — Olağan kanun yollarının (istinaf, temyiz) tamamının tüketilmiş olması şarttır", "2017''de girmiştir — Adalet Bakanlığı''nın izni gerekir", "1961''de girmiştir — Sadece milletvekilleri başvurabilir"], "correctIndex": 2}'::jsonb,
  'Bireysel başvuru hakkı 2010 anayasa referandumu ile kabul edilmiştir. Temel hak ve özgürlükleri ihlal edilen herkes, olağan kanun yollarını (ilk derece, istinaf, Yargıtay/Danıştay) tamamen tükettikten sonra 30 gün içinde Anayasa Mahkemesi''ne bireysel başvuruda bulunabilir.',
  'Bireysel başvuru 2010 yılında gelmiştir ve ''tüm iç hukuk yollarının tüketilmesi'' zorunlu dava şartıdır.',
  34
);

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
  'Temel Hak ve Ödevler',
  'multiple_choice',
  3,
  'Anayasa Mahkemesi''ne yapılan bireysel başvurularda hangi hak ihlalleri incelenebilir?',
  '{"options": ["Anayasada yer alan haklardan herhangi birinin ihlal edilmesi yeterlidir.", "Yalnızca Anayasa''da güvence altına alınmış VE AYNI ZAMANDA Avrupa İnsan Hakları Sözleşmesi (AİHS) ve Türkiye''nin taraf olduğu ek protokollerde yer alan ortak temel hak ve hürriyetler", "Sadece ticaret ve borçlar hukukundan kaynaklanan alacak davaları", "Sadece vergi uyuşmazlıkları", "Yalnızca memurların disiplin cezaları"], "correctIndex": 1}'::jsonb,
  'Anayasa m. 148 uyarınca her hak için AYM''ye gidilemez. Başvurunun kabul edilebilmesi için ihlal edildiği iddia edilen hakkın HEM Anayasamızda HEM DE Avrupa İnsan Hakları Sözleşmesi''nde (AİHS) ortaklaşa korunan haklardan biri olması şarttır.',
  'Örn. Anayasa''da olup AİHS''te olmayan bir hak (veya tersi) için AYM''ye bireysel başvuru yapılamaz; ÇİFTE KORUMA (ortak alan) şarttır.',
  35
);

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
  'Temel Hak ve Ödevler',
  'multiple_choice',
  3,
  '1982 Anayasası''na göre temelli kapatılan bir siyasi partinin kapatılmasına beyan veya eylemleriyle sebep olan kurucuları ve üyeleri için uygulanan ''siyaset yasağı'' süresi ne kadardır?',
  '{"options": ["1 yıl", "3 yıl", "5 yıl", "10 yıl", "Ömür boyu"], "correctIndex": 2}'::jsonb,
  'Anayasa m. 69 uyarınca temelli kapatılan bir partinin kapatılmasına sebep olan kişiler, Anayasa Mahkemesi''nin gerekçeli kararının Resmî Gazete''de yayımlanmasından başlayarak 5 YIL süreyle bir başka partinin kurucusu, üyesi, yöneticisi veya deneticisi olamazlar (bağımsız milletvekili olabilirler).',
  'Siyaset yasağı 5 yıldır; bu kişiler parti üyesi veya yöneticisi olamazlar ancak BAĞIMSIZ aday olarak seçime girebilirler!',
  36
);

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
  'Temel Hak ve Ödevler',
  'multiple_choice',
  3,
  '1982 Anayasası''nda yer alan ''Devletleştirme'' ile ''Kamulaştırma'' arasındaki temel hukuki fark aşağıdakilerden hangisidir?',
  '{"options": ["Kamulaştırmada taşınır mallar, devletleştirmede taşınmaz mallar alınır.", "Kamulaştırmada kamu yararı amacıyla özel bir taşınmaz mülkiyeti alınırken; devletleştirmede kamu hizmeti niteliği taşıyan özel bir ''teşebbüs / işletme'' kamu yararı zorunlu kıldığında kanunla devlete mal edilir.", "Kamulaştırma bedeli ödenmez, devletleştirme bedeli ödenir.", "Kamulaştırma kanunla yapılır, devletleştirme yönetmelikle yapılır.", "İkisi arasında hiçbir fark yoktur."], "correctIndex": 1}'::jsonb,
  'Kamulaştırma (istimlak - m. 46) arsa, bina, tarla gibi özel taşınmaz malların kamu mülkiyetine geçirilmesidir. Devletleştirme (m. 47) ise elektrik dağıtım şirketi, fabrika, liman işletmesi gibi kamu hizmeti gören özel bir ticari işletmenin/şirketin kanunla devlete geçirilmesidir.',
  'Taşınmaz mal = Kamulaştırma; Özel teşebbüs ve şirket = Devletleştirme!',
  37
);

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
  'Temel Hak ve Ödevler',
  'multiple_choice',
  3,
  'Yerleşme ve seyahat hürriyetinin (m. 23) sınırlandırılması nedenleri anayasada ayrı ayrı sayılmıştır.

Aşağıdakilerden hangisi yalnızca ''Yerleşme Hürriyeti''nin sınırlandırılma sebepleri arasında yer alır (seyahat hürriyeti için geçerli değildir)?',
  '{"options": ["Suç soruşturması ve kovuşturması", "Suç işlenmesini önlemek", "Sosyal ve ekonomik gelişmeyi sağlamak, sağlıklı ve düzenli kentleşmeyi gerçekleştirmek ve kamu mallarını korumak", "Salgın hastalıkların yayılmasını engellemek", "Ceza infazını sağlamak"], "correctIndex": 2}'::jsonb,
  'Sağlıklı ve düzenli kentleşmeyi gerçekleştirmek, kaçak yapılaşmayı önlemek ve kamu mallarını korumak YERLEŞME hürriyetinin özel sınırlandırma sebebidir. Bir kimsenin bir şehre seyahat etmesi kentleşmeyi bozmaz; oraya yerleşip gecekondu yapması yerleşme yasağını doğurur.',
  'Düzenli kentleşme ve kamu mallarını koruma yalnızca YERLEŞME hürriyetinin sınırlandırma sebebidir; seyahat hürriyetini sınırlayamaz.',
  38
);

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
  'Temel Hak ve Ödevler',
  'multiple_choice',
  3,
  'I. Yabancı bir devletten izin almaksızın vatandaşlık alan bir Türk vatandaşı doğrudan Türk vatandaşlığından çıkarılır.
II. Vatandaşlıktan çıkarma kararlarına karşı Danıştay''da iptal davası açılabilir.
III. Vatandaşlıktan çıkarılan kişinin eş ve çocukları da kendiliğinden Türk vatandaşlığını kaybeder.

Yukarıdaki ifadelerden hangileri doğrudur?',
  '{"options": ["Yalnız I", "Yalnız II", "I ve III", "II ve III", "I, II ve III"], "correctIndex": 1}'::jsonb,
  'I yanlıştır; Türkiye''de çifte vatandaşlık serbesttir, yabancı vatandaşlık alan doğrudan çıkarılmaz. III yanlıştır; vatandaşlıktan çıkarma şahsidir, eş ve çocukların vatandaşlığını etkilemez. II doğrudur; vatandaşlıktan çıkarmaya karşı Danıştay''da iptal davası açılabilir.',
  'Vatandaşlıktan çıkarma cezası şahsidir; babanın veya annenin çıkarılması çocukları ve eşi etkilemez!',
  39
);

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
  'Temel Hak ve Ödevler',
  'multiple_choice',
  3,
  '1982 Anayasası''nın 65. maddesinde yer alan ''Devlet, sosyal ve ekonomik alanlarda Anayasa ile belirlenen ödevlerini, bu ödevlerin amaçlarına uygun öncelikleri gözeterek ......... ölçüsünde yerine getirir.'' hükmünde boş bırakılan yere aşağıdakilerden hangisi gelmelidir?',
  '{"options": ["Milletlerarası kuruluşların onayladığı", "Mali kaynaklarının yeterliliği", "Nüfus artış hızı", "Muhalefet partilerinin mutabakatı", "Askeri harcamalardan artan pay"], "correctIndex": 1}'::jsonb,
  'Anayasa m. 65: ''Devlet, sosyal ve ekonomik alanlarda Anayasa ile belirlenen ödevlerini, bu ödevlerin amaçlarına uygun öncelikleri gözeterek, MALİ KAYNAKLARININ YETERLİLİĞİ ölçüsünde yerine getirir.'' Devlet param yetmiyor derse vatandaşa konut veya iş vermek zorunda bırakılamaz.',
  'Devletin sosyal hakları yerine getirmesindeki anayasal fren ''mali kaynaklarının yeterliliği''dir.',
  40
);

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
  'Temel Hak ve Ödevler',
  'multiple_choice',
  2,
  'Anayasa''da güvence altına alınan temel hak ve özgürlüklerinin kamu gücü tarafından ihlal edildiğini iddia eden bir kişinin, olağan kanun yollarını tükettikten sonra nihai kararın tebliğinden veya öğrenilmesinden itibaren Anayasa Mahkemesi''ne BİREYSEL BAŞVURU yapma süresi kaç gündür?',
  '{"options": ["15 gün", "30 gün", "45 gün", "60 gün", "90 gün"], "correctIndex": 1}'::jsonb,
  '6216 sayılı Anayasa Mahkemesinin Kuruluşu ve Yargılama Usulleri Hakkında Kanun m. 47/5 uyarınca bireysel başvuru süresi, başvuru yollarının tüketildiği tarihten itibaren 30 GÜNDÜR.',
  'AYM''de norm denetimi iptal davası açma süresi 60 gündür; vatandaşın BİREYSEL BAŞVURU süresi ise 30 GÜNDÜR!',
  41
);

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
  'Temel Hak ve Ödevler',
  'multiple_choice',
  2,
  'Avrupa İnsan Hakları Sözleşmesi''ne (AİHS) ek 15 No''lu Protokol''ün yürürlüğe girmesiyle birlikte, iç hukuk yollarının tüketilmesinden sonra Avrupa İnsan Hakları Mahkemesi''ne (AİHM) bireysel başvuru yapma süresi kaç aya indirilmiştir?',
  '{"options": ["1 ay", "3 ay", "4 ay", "6 ay", "12 ay"], "correctIndex": 2}'::jsonb,
  'Eski düzenlemede AİHM başvuru süresi 6 ay idi. 15 No''lu Protokol''ün yürürlüğe girmesiyle kesinleşmiş nihai iç hukuk kararından itibaren AİHM''e başvuru süresi 4 AYA indirilmiştir.',
  'Eski 6 ay kuralı güncellenmiştir; güncel AİHM başvuru süresi 4 AYDIR!',
  42
);

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
  'Temel Hak ve Ödevler',
  'multiple_choice',
  2,
  '2820 sayılı Siyasi Partiler Kanunu''na göre Türkiye''de bir siyasi partinin kurulabilmesi için önceden izin almaksızın EN AZ kaç Türk vatandaşının bir araya gelmesi zorunludur?',
  '{"options": ["10", "20", "30", "50", "100"], "correctIndex": 2}'::jsonb,
  'Siyasi partiler, önceden izin almadan en az 30 TÜRK VATANDAŞI tarafından İçişleri Bakanlığı''na bildirimde bulunarak kurulur. Siyasi parti ''grubu'' kurmak için ise en az 20 milletvekili gerekir.',
  'Siyasi parti kurmak için en az 30 VATANDAŞ; TBMM''de parti grubu kurmak için en az 20 MİLLETVEKİLİ gerekir. 20 ve 30 sayıları ÖSYM''nin en popüler tuzak ikilisidir.',
  43
);

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
  'Temel Hak ve Ödevler',
  'multiple_choice',
  2,
  '1982 Anayasası''na göre bir siyasi partinin kapatılmasına ilişkin davayı açmaya yetkili makam ve kapatma kararını vermeye yetkili yargı organı hangi seçenekte doğru verilmiştir?',
  '{"options": ["Davayı Adalet Bakanı açar — Kararı Yargıtay verir.", "Davayı TBMM Başkanı açar — Kararı Danıştay verir.", "Davayı Yargıtay Cumhuriyet Başsavcısı açar — Kararı Anayasa Mahkemesi verir.", "Davayı Cumhurbaşkanı açar — Kararı Uyuşmazlık Mahkemesi verir.", "Davayı HSK açar — Kararı Yargıtay Ceza Genel Kurulu verir."], "correctIndex": 2}'::jsonb,
  'Anayasa m. 69: Siyasi partilerin kapatılması, YARGITAY CUMHURİYET BAŞSAVCISININ açacağı dava üzerine ANAYASA MAHKEMESİ tarafından karara bağlanır (kapatma kararı için 15 üyeden 10 üyenin oyu = 2/3 çoğunluk şarttır).',
  'Davayı açan = Yargıtay Cumhuriyet Başsavcısı; Kapatma kararını veren = Anayasa Mahkemesi''dir.',
  44
);

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
  'Temel Hak ve Ödevler',
  'multiple_choice',
  2,
  'Siyasi Partiler Kanunu''na göre genel seçimlerde ülke genel barajını (%7) aşamamış olsa bile, genel seçimlere katılan ve toplam geçerli oyların EN AZ yüzde kaçını alan siyasi partilere devlet bütçesinden orantılı olarak hazine yardımı yapılır?',
  '{"options": ["%1", "%2", "%3", "%5", "%7"], "correctIndex": 2}'::jsonb,
  'Siyasi Partiler Kanunu Ek m. 1 uyarınca, genel seçimlerde geçerli oyların EN AZ YÜZDE ÜÇÜNÜ (%3) alan siyasi partilere devlet hazinesinden yardım yapılır.',
  'Meclise girmek için seçim barajı %7''dir; hazine yardımı alabilmek için asgari oy oranı ise YÜZDE 3''tür (%3).',
  45
);

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
  'Temel Hak ve Ödevler',
  'multiple_choice',
  2,
  '3071 sayılı Dilekçe Hakkının Kullanılmasına Dair Kanun''a göre TBMM''ye veya yetkili idari makamlara verilen dilekçelere en geç kaç gün içinde gerekçeli olarak cevap verilmesi zorunludur?',
  '{"options": ["15 gün", "30 gün", "60 gün", "90 gün", "120 gün"], "correctIndex": 1}'::jsonb,
  'Dilekçe Kanunu m. 7 uyarınca yetkili makamlar dilekçe sahiplerine en geç 30 GÜN içinde cevap vermekle yükümlüdür. TBMM Dilekçe Komisyonu''nun inceleme ve karar süresi ise 60 gündür.',
  'İdari makamların dilekçeye cevap süresi 30 gündür; Bilgi edinme başvurusunda ise bu süre 15 gündür.',
  46
);

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
  'Temel Hak ve Ödevler',
  'multiple_choice',
  2,
  '1982 Anayasası''nın 74. maddesinde düzenlenen, idarenin her türlü eylem, işlem, tutum ve davranışını insan haklarına ve hukuka uygunluk yönünden inceleyen Kamu Denetçiliği Kurumu (Ombudsmanlık) nereye bağlı olarak kurulmuştur?',
  '{"options": ["Cumhurbaşkanlığına", "TBMM Başkanlığına", "Adalet Bakanlığına", "Anayasa Mahkemesine", "Danıştay Başkanlığına"], "correctIndex": 1}'::jsonb,
  'Anayasa m. 74 uyarınca TBMM BAŞKANLIĞINA BAĞLI olarak Kamu Denetçiliği Kurumu kurulmuştur. Kurumun başı olan Kamu Başdenetçisi TBMM tarafından gizli oyla 4 yıllığına seçilir.',
  'Devlet Denetleme Kurulu (DDK) Cumhurbaşkanlığına bağlıdır; Kamu Denetçiliği Kurumu (Ombudsmanlık) ise TBMM BAŞKANLIĞINA bağlıdır!',
  47
);

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
  'Temel Hak ve Ödevler',
  'multiple_choice',
  2,
  '1982 Anayasası''nın 30. maddesinde düzenlenen basın araçlarının korunması ilkesine göre aşağıdakilerden hangisi doğrudur?',
  '{"options": ["Kanuna uygun kurulmuş basımevi ve matbaalar suç aleti olduğu gerekçesiyle zapt ve müsadere edilemez veya işletilmekten alıkonulamaz.", "Basımevleri her türlü suç iddiasında savcılık kararıyla doğrudan kapatılır.", "Basımevlerinin basacağı her gazete önceden mülki amirin sansür onayından geçmelidir.", "Basın araçları yalnızca olağanüstü hal döneminde müsadere edilebilir.", "Yabancı dilde yayın yapan matbaalar süresiz kapatılabilir."], "correctIndex": 0}'::jsonb,
  'Anayasa m. 30 açık güvencesidir: ''Kanuna uygun şekilde basın işletmesi olarak kurulan basımevi ve eklentileri ile basın araçları, suç aleti olduğu gerekçesiyle zapt ve müsadere edilemez veya işletilmekten alıkonulamaz.''',
  'Kanuna uygun basımevleri suç aleti olduğu iddiasıyla müsadere edilemez ve kapatılamaz; bu anayasal özel bir güvencedir.',
  48
);

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
  'Temel Hak ve Ödevler',
  'multiple_choice',
  2,
  'Anayasa''nın 38. maddesinde güvence altına alınan ''Suç ve Cezalara İlişkin Esaslar'' arasında aşağıdakilerden hangisi YER ALMAZ?',
  '{"options": ["Kimse, işlendiği zaman yürürlükte bulunan kanunun suç saymadığı bir fiilden dolayı cezalandırılamaz.", "Suçluluğu hükmen sabit oluncaya kadar, kimse suçlu sayılamaz (Masumiyet Karinesi).", "Hiç kimse, yalnızca sözleşmeden doğan bir yükümlülüğü yerine getirememesinden (borcunu ödeyememekten) dolayı özgürlüğünden alıkonulamaz.", "Ceza sorumluluğu şahsidir; kimse başkasının fiilinden dolayı sorumlu tutulamaz.", "Ağır kamu zararına yol açan ekonomik suçlarda suçlunun tüm malvarlığına genel müsadere cezası uygulanabilir."], "correctIndex": 4}'::jsonb,
  'Anayasa m. 38 gereğince ''Genel müsadere cezası verilemez.'' 2004 anayasa değişikliği ile hem ölüm cezası hem de genel müsadere cezası kesin olarak yasaklanmıştır (yalnızca suça konu eşyanın özel müsaderesi mümkündür).',
  'Türkiye''de GENEL MÜSADERE cezası kesinlikle yasaktır; hiçbir suç tipi için genel müsadere verilemez.',
  49
);

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
  'Temel Hak ve Ödevler',
  'multiple_choice',
  2,
  'Anayasa''nın 51. maddesinde düzenlenen ''Sendika Kurma Hakkı'' ile ilgili olarak 2010 anayasa değişikliği ile yapılan önemli yenilik aşağıdakilerden hangisidir?',
  '{"options": ["Aynı zamanda ve aynı işkolunda birden çok sendikaya üye olunamayacağı kuralı anayasadan çıkarılarak çoklu sendika üyeliği serbest bırakılmıştır.", "Memurlara grev hakkı tanınmıştır.", "Sendika kurmak için İçişleri Bakanlığı''ndan izin alma şartı getirilmiştir.", "Sendika kurma yaşı 25''e çıkarılmıştır.", "Sendika yöneticilerine milletvekili dokunulmazlığı verilmiştir."], "correctIndex": 0}'::jsonb,
  '2010 anayasa değişikliğiyle ''Aynı zamanda ve aynı işkolunda birden çok sendikaya üye olunamaz'' sınırlaması anayasadan çıkarılmıştır. Böylece sendikal özgürlük genişletilmiştir.',
  'Memurlara toplu sözleşme hakkı verilmiştir ancak GREV HAKKI MEMURA HALEN TANINMAMIŞTIR! Sendikada değişen kural çoklu sendika üyeliğidir.',
  50
);


-- -------------------------------------------------------------
-- KONU 4: YASAMA, YÜRÜTME VE YARGI
-- -------------------------------------------------------------

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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  1,
  '1982 Anayasası''na göre Türkiye Büyük Millet Meclisi (TBMM) kaç milletvekilinden oluşur?',
  '{"options": ["450", "500", "550", "600", "650"], "correctIndex": 3}'::jsonb,
  '2017 Anayasa değişikliği ile Anayasa m. 75 uyarınca TBMM üye tamsayısı 550''den 600 milletvekiline yükseltilmiştir.',
  'Eski 550 sayısı 2017 referandumuyla 600 yapılmıştır; tüm meclis karar ve toplantı nisapları 600 üzerinden hesaplanır.',
  1
);

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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  1,
  '1982 Anayasası''na göre Cumhurbaşkanı seçilme yaşı ve görev süresi aşağıdakilerden hangisinde doğru olarak verilmiştir?',
  '{"options": ["30 yaşını doldurmuş olmak — 4 yıl", "35 yaşını doldurmuş olmak — 5 yıl", "40 yaşını doldurmuş olmak — 5 yıl", "40 yaşını doldurmuş olmak — 7 yıl", "18 yaşını doldurmuş olmak — 5 yıl"], "correctIndex": 2}'::jsonb,
  'Anayasa m. 101 uyarınca Cumhurbaşkanı; 40 yaşını doldurmuş, yükseköğrenim yapmış, milletvekili seçilme yeterliliğine sahip Türk vatandaşları arasından, halk tarafından 5 yıllık süre için seçilir.',
  'Milletvekili seçilme yaşı 18''e inmiş olsa da Cumhurbaşkanı seçilme yaşı 40''tır ve görev süresi 5 yıldır.',
  2
);

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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  1,
  '2017 Anayasa değişiklikleri ile Türk anayasa düzeninden tamamen kaldırılan denetim yolları aşağıdakilerden hangisinde birlikte verilmiştir?',
  '{"options": ["Meclis Araştırması ve Genel Görüşme", "Yazılı Soru ve Meclis Soruşturması", "Gensoru ve Sözlü Soru", "Yüce Divan ve Bütçe Denetimi", "Dilekçe ve Bilgi Edinme"], "correctIndex": 2}'::jsonb,
  'Cumhurbaşkanlığı Hükümet Sistemi''ne geçişle birlikte parlamenter sisteme özgü olan ''Gensoru'' (hükümeti düşürme) ve ''Sözlü Soru'' denetim yolları anayasadan tamamen kaldırılmıştır. Yazılı soru, meclis araştırması, genel görüşme ve meclis soruşturması ise devam etmektedir.',
  'Sözlü soru kaldırılmıştır, sadece YAZILI SORU vardır; gensoru ise tamamen kaldırılmıştır.',
  3
);

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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  1,
  '1982 Anayasası''nda günümüzde geçerli olan ''Yüksek Mahkemeler'' arasında aşağıdakilerden hangisi yer almaz?',
  '{"options": ["Anayasa Mahkemesi", "Yargıtay", "Danıştay", "Uyuşmazlık Mahkemesi", "Sayıştay"], "correctIndex": 4}'::jsonb,
  'Anayasa''nın Yargı bölümünde düzenlenen Yüksek Mahkemeler yalnızca 4 tanedir: Anayasa Mahkemesi, Yargıtay, Danıştay ve Uyuşmazlık Mahkemesi. Sayıştay ve HSK birer yüksek denetim/idari kuruldur, yüksek mahkeme değildirler. Askeri Yargıtay ve AYİM ise 2017''de kaldırılmıştır.',
  'Sayıştay ve Hakimler ve Savcılar Kurulu (HSK) yüksek mahkeme DEĞİLDİR! Dört yüksek mahkeme vardır.',
  4
);

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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  1,
  'Milletvekillerinin meclis çalışmalarındaki oy, söz ve düşüncelerinden ötürü ömür boyu hukuki ve cezai takibata uğramamalarını sağlayan ve kaldırılamayan mutlak güvenceye ne ad verilir?',
  '{"options": ["Yasama Dokunulmazlığı", "Yasama Sorumsuzluğu (Kürsü Dokunulmazlığı)", "Yasama Yetkisinin Devredilmezliği", "Milletvekili Ödeneği", "Gıyap Güvencesi"], "correctIndex": 1}'::jsonb,
  'Yasama sorumsuzluğu (kürsü dokunulmazlığı); vekillerin meclisteki konuşmalarından ötürü hiçbir zaman yargılanamamasıdır. Mutlaktır, TBMM kararıyla dahi kaldırılamaz ve milletvekilliği bittikten sonra da korur. Yasama dokunulmazlığı ise meclis dışındaki suçlar içindir ve meclis kararıyla kaldırılabilir.',
  'Dokunulmazlık kaldırılabilir (nisbidir); Sorumsuzluk ise asla kaldırılamaz (mutlaktır).',
  5
);

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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  1,
  'TBMM Genel Kurulu''nda bir kanun teklifinin oylanabilmesi için toplantı yeter sayısı (meclisin toplanabilmesi için gereken en az üye sayısı) ne kadardır?',
  '{"options": ["Üye tamsayısının üçte biri (200 milletvekili)", "Üye tamsayısının salt çoğunluğu (301 milletvekili)", "Üye tamsayısının beşte biri (120 milletvekili)", "184 milletvekili", "Üye tamsayısının beşte üçü (360 milletvekili)"], "correctIndex": 0}'::jsonb,
  'Anayasa m. 96 uyarınca TBMM, yapacağı seçimler dahil bütün işlerinde üye tamsayısının en az üçte biri (1/3 = 200 milletvekili) ile toplanır (Toplantı yeter sayısı = 200).',
  'Toplantı yeter sayısı 200''dür (1/3). Karar yeter sayısı ise toplantıya katılanların salt çoğunluğudur; ancak bu sayı üye tamsayısının 1/4''ünün bir fazlasından (151''den) az olamaz.',
  6
);

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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  1,
  'Bütçe ve Kesinhesap Kanun Tekliflerini hazırlayarak TBMM''ye sunma yetkisi münhasıran kime aittir?',
  '{"options": ["Hazine ve Maliye Bakanı", "Cumhurbaşkanı", "TBMM Plan ve Bütçe Komisyonu Başkanı", "Sayıştay Başkanı", "Merkez Bankası Başkanı"], "correctIndex": 1}'::jsonb,
  'Anayasa m. 161 uyarınca Bütçe Kanun Teklifi yürütmenin başı olan Cumhurbaşkanı tarafından hazırlanır ve mali yılbaşından en az 75 gün önce TBMM''ye sunulur. Kanun teklif etme yetkisi vekillerde olmasına rağmen Bütçe Teklifi sadece Cumhurbaşkanı tarafından sunulan tek kanundur.',
  'Normal kanunları sadece milletvekilleri teklif edebilir; Cumhurbaşkanı''nın teklif edebildiği YEGÂNE kanun Bütçe Kanunu''dur.',
  7
);

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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  1,
  'Anayasa Mahkemesi toplam kaç üyeden oluşur ve üyelerin görev süresi kaç yıldır?',
  '{"options": ["11 üye — 6 yıl", "15 üye — 12 yıl", "17 üye — 10 yıl", "13 üye — 4 yıl", "15 üye — Ömür boyu"], "correctIndex": 1}'::jsonb,
  '2017 anayasa değişikliği ile Askeri Yargıtay ve AYİM''den gelen 2 üyelik kaldırılmış, AYM üye sayısı 17''den 15''e düşürülmüştür. AYM üyeleri 12 yıl için seçilirler ve bir kimse iki defa AYM üyesi seçilemez (Yaş haddi 65''tir).',
  'AYM üye sayısı 15''tir; görev süreleri 12 yıldır. 12 üyeyi Cumhurbaşkanı, 3 üyeyi TBMM seçer.',
  8
);

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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  1,
  'Hakimler ve Savcılar Kurulu''nun (HSK) başkanı kimdir?',
  '{"options": ["Yargıtay Birinci Başkanı", "Danıştay Başkanı", "Adalet Bakanı", "Anayasa Mahkemesi Başkanı", "Cumhurbaşkanı"], "correctIndex": 2}'::jsonb,
  'Anayasa m. 159 açık hükmüdür: ''Hâkimler ve Savcılar Kurulunun Başkanı Adalet Bakanıdır. Adalet Bakanlığı Müsteşarı (Bakan Yardımcısı) Kurulun tabii üyesidir.''',
  'HSK başkanı Adalet Bakanı''dır. Kurul toplam 13 üyeden oluşur.',
  9
);

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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  1,
  'Adli yargı kolunun (hukuk ve ceza mahkemelerinin) en üst temyiz inceleme mercii aşağıdakilerden hangisidir?',
  '{"options": ["Danıştay", "Yargıtay", "Uyuşmazlık Mahkemesi", "Sayıştay", "Bölge Adliye Mahkemesi"], "correctIndex": 1}'::jsonb,
  'Adli yargının temyiz organı Yargıtay''dır. İdari yargının (idare ve vergi mahkemelerinin) en üst temyiz organı ise Danıştay''dır.',
  'Adli yargı = Yargıtay; İdari yargı = Danıştay.',
  10
);

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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  '1982 Anayasası''na göre milletvekilliği adaylığı için görevinden istifa eden ancak seçilemeyen kişilerden hangileri mesleklerine KESİNLİKLE GERİ DÖNEMEZLER?',
  '{"options": ["Devlet memurları", "Üniversite öğretim elemanları", "Hâkimler ve savcılar ile Türk Silahlı Kuvvetleri mensupları", "Kamu iktisadi teşebbüsü çalışanları", "Belediye personeli"], "correctIndex": 2}'::jsonb,
  'Yargı bağımsızlığı ve ordunun siyasete bulaşmaması ilkeleri gereğince; milletvekili adayı olmak için istifa eden hâkim ve savcılar ile TSK mensupları (subay/astsubay) seçilemeseler dahi mesleklerine kesinlikle geri dönemezler. Memurlar ve akademisyenler ise geri dönebilir.',
  'Geri dönemeyen iki zümre vardır: Hakim/Savcılar ve Askerler! Memurlar ise geri dönebilir.',
  11
);

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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  'Aşağıdaki hallerin hangisinde milletvekilliğinin düşmesi için ''TBMM Genel Kurulu kararı'' GEREKMEZ (milletvekilliği kendiliğinden veya bildirimin yapılmasıyla doğrudan düşer)?',
  '{"options": ["Milletvekilinin istifa etmesi", "Milletvekilliği ile bağdaşmayan bir görevi ısrarla sürdürmesi", "Meclis çalışmalarına mazeretsiz ve izinsiz olarak 1 ayda toplam 5 birleşim günü katılmaması", "Milletvekilinin Cumhurbaşkanı yardımcısı veya Bakan olarak atanması", "Milletvekilinin partisinden istifa etmesi"], "correctIndex": 3}'::jsonb,
  'Milletvekili olan biri Cumhurbaşkanı yardımcısı veya Bakan olarak atandığı anda milletvekilliği KENDİLİĞİNDEN (meclis oylamasına gerek olmaksızın) doğrudan düşer (aynı şekilde ölüm, gaiplik veya kesin hüküm giyme bildirimle düşürür). İstifa, bağdaşmayan görev ve devamsızlıkta ise TBMM Genel Kurul oylaması şarttır.',
  'Partiden istifa vekilliği düşürmez (bağımsız kalır). Bakan veya CB yardımcısı atanma ise oylamasız kendiliğinden vekilliği bitirir.',
  12
);

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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  'TBMM Genel Kurulu kararıyla dokunulmazlığı kaldırılan veya milletvekilliği düşürülen (istifa veya devamsızlık sebebiyle) bir milletvekili, bu karara karşı kaç gün içinde nereye başvurabilir?',
  '{"options": ["7 gün içinde — Anayasa Mahkemesi''ne", "15 gün içinde — Danıştay''a", "30 gün içinde — Yargıtay Ceza Genel Kurulu''na", "10 gün içinde — Yüksek Seçim Kurulu''na", "3 gün içinde — TBMM Başkanlık Divanı''na"], "correctIndex": 0}'::jsonb,
  'Anayasa m. 85 uyarınca dokunulmazlığı kaldırılan veya vekilliği düşürülen milletvekili veya bir başka vekil, kararın alındığı tarihten itibaren 7 GÜN içinde Anayasa Mahkemesi''ne iptal başvurusu yapabilir. Anayasa Mahkemesi 15 GÜN içinde kesin karara bağlar.',
  'Başvuru süresi 7 gün; AYM''nin inceleyip karar verme süresi 15 gündür (7-15 kuralı).',
  13
);

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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  '1982 Anayasası''na göre kanun teklif etmeye yetkili olan merci aşağıdakilerden hangisidir?',
  '{"options": ["Cumhurbaşkanı", "Yalnızca Milletvekilleri", "Bakanlar", "Danıştay ve Yargıtay", "Siyasi parti genel başkanları"], "correctIndex": 1}'::jsonb,
  '2017 anayasa değişikliği ile kanun tasarısı (hükümetin kanun teklifi) kurumu kaldırılmıştır. Bütçe Kanunu hariç kanun teklif etmeye YALNIZCA MİLLETVEKİLLERİ yetkilidir (tek bir milletvekili dahi kanun teklifi verebilir).',
  'Bakanlar veya Cumhurbaşkanı normal kanun teklif edemez; kanun teklif etme tekeli milletvekillerindedir.',
  14
);

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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  'TBMM Genel Kurulu tarafından kabul edilen bir kanunu Cumhurbaşkanı kaç gün içinde yayımlamak veya tekrar görüşülmek üzere TBMM''ye geri göndermek zorundadır?',
  '{"options": ["7 gün", "10 gün", "15 gün", "30 gün", "48 saat"], "correctIndex": 2}'::jsonb,
  'Anayasa m. 89 uyarınca Cumhurbaşkanı, TBMM''ce kabul edilen kanunları 15 GÜN içinde Resmî Gazete''de yayımlar veya veto ederek (tekrar görüşülmek üzere) gerekçesiyle birlikte meclise geri gönderir.',
  'Cumhurbaşkanının veto veya onay inceleme süresi 15 gündür. Cumhurbaşkanı Bütçe Kanunu''nu veto edemez!',
  15
);

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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  'Cumhurbaşkanı''nın veto ederek TBMM''ye geri gönderdiği bir kanunu, TBMM''nin hiçbir değişiklik yapmadan aynen kabul edebilmesi için en az kaç milletvekilinin kabul oyu gerekir?',
  '{"options": ["Toplantıya katılanların basit çoğunluğu", "Üye tamsayısının salt çoğunluğu (en az 301 milletvekili)", "Üye tamsayısının beşte üçü (360 milletvekili)", "Üye tamsayısının üçte ikisi (400 milletvekili)", "200 milletvekili"], "correctIndex": 1}'::jsonb,
  '2017 değişikliği öncesinde meclis basit çoğunlukla vetoyu aşabiliyordu. 2017 değişikliği ile Cumhurbaşkanı''nın vetosunu aşmak zorlaştırılmış ve ''TBMM üye tamsayısının salt çoğunluğu'' (en az 301 kabul oyu) şartı getirilmiştir. 301 ile aynen kabul edilirse Cumhurbaşkanı artık yayımlamak zorundadır.',
  'Veto edilen kanunu aynen kabul etmek için basit çoğunluk yetmez; en az 301 (üye tamsayısının salt çoğunluğu) şarttır!',
  16
);

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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  '1982 Anayasası''na göre genel ve özel af ilan edebilmek için TBMM Genel Kurulu''nda aranan asgari karar yeter sayısı aşağıdakilerden hangisidir?',
  '{"options": ["Toplantıya katılanların salt çoğunluğu", "Üye tamsayısının salt çoğunluğu (301)", "Üye tamsayısının beşte üçü (360 milletvekili)", "Üye tamsayısının üçte ikisi (400 milletvekili)", "Üye tamsayısının dörtte üçü (450 milletvekili)"], "correctIndex": 2}'::jsonb,
  'Anayasa m. 87 uyarınca genel ve özel af ilanı için TBMM üye tamsayısının en az beşte üçünün (3/5 = 360 milletvekili) kabul oyu şarttır. Ayrıca orman suçları için hiçbir şekilde af çıkarılamaz.',
  'Af ilanı için 3/5 (360) çoğunluk gerekir. Orman suçları için af kanunu çıkarılması anayasa m. 169 ile yasaklanmıştır.',
  17
);

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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  'Cumhurbaşkanı yardımcıları ve bakanların görevleriyle ilgili suçlarından dolayı Meclis Soruşturması ile ''Yüce Divan''a sevk edilebilmeleri için'' TBMM Genel Kurulu''nda aranan nihai gizli oy karar yeter sayısı ne kadardır?',
  '{"options": ["Üye tamsayısının salt çoğunluğu (301)", "Üye tamsayısının beşte üçü (360)", "Üye tamsayısının üçte ikisi (400 milletvekili)", "Toplantıya katılanların 2/3''ü", "Oy birliği"], "correctIndex": 2}'::jsonb,
  'Meclis soruşturması aşamaları: 1) Teklif: 301 vekil, 2) Soruşturma açılması kararı: 360 vekil (3/5), 3) Yüce Divan''a sevk kararı: 400 vekildir (2/3 gizli oy). Yüce Divan yargılamasını Anayasa Mahkemesi yapar.',
  'Yüce Divan''a sevk için 400 milletvekili (2/3) şarttır. Soruşturma açılması için ise 360 vekil yeterlidir.',
  18
);

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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  'Olağan dönem Cumhurbaşkanlığı Kararnameleri (CBK) ile ilgili olarak aşağıda verilen kurallardan hangisi yanlıştır?',
  '{"options": ["Yürütme yetkisine ilişkin konularda çıkarılabilir.", "Anayasa''da münhasıran kanunla düzenlenmesi öngörülen konularda CBK çıkarılamaz.", "Kanunda açıkça düzenlenen konularda CBK çıkarılamaz.", "Kanun ile CBK aynı konuda farklı hükümler içerirse CBK hükümleri uygulanır.", "Temel hak ve ödevlerden sadece Sosyal ve Ekonomik Haklar olağan CBK ile düzenlenebilir."], "correctIndex": 3}'::jsonb,
  'Anayasa m. 104 açıktır: Kanun ile Cumhurbaşkanlığı kararnamesinde farklı hükümler bulunması halinde KANUN hükümleri uygulanır. TBMM''nin aynı konuda kanun çıkarması durumunda CBK hükümsüz hale gelir.',
  'Kanun kararnameden üstündür; çatışma anında kanun geçerli olur.',
  19
);

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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  'Yargıtay Cumhuriyet Başsavcısı ve Başsavcıvekilini Yargıtay Genel Kurulu''nun belirlediği adaylar arasından seçen makam aşağıdakilerden hangisidir?',
  '{"options": ["TBMM", "Cumhurbaşkanı", "Hakimler ve Savcılar Kurulu (HSK)", "Adalet Bakanı", "Anayasa Mahkemesi"], "correctIndex": 1}'::jsonb,
  'Yargıtay Büyük Genel Kurulu''nun her kadro için göstereceği beşer aday arasından Cumhurbaşkanı tarafından 4 yıl için seçilirler. Süresi biten yeniden seçilebilir.',
  'Yargıtay Başsavcısını Yargıtay değil, adaylar arasından doğrudan CUMHURBAŞKANI seçer!',
  20
);

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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  'Uyuşmazlık Mahkemesi''nin görev alanı ve başkanı ile ilgili aşağıdakilerden hangisi doğrudur?',
  '{"options": ["Adli ve idari yargı mercileri arasındaki görev ve hüküm uyuşmazlıklarını kesin olarak çözer; Başkanı Anayasa Mahkemesi üyeleri arasından Anayasa Mahkemesi tarafından seçilir.", "Ceza davalarını temyiz eder; Başkanı TBMM tarafından seçilir.", "Vergi uyuşmazlıklarını çözer; Başkanı Sayıştay''dır.", "Anayasa değişikliklerini inceler; Başkanı Adalet Bakanıdır.", "Seçim uyuşmazlıklarını kesin karara bağlar."], "correctIndex": 0}'::jsonb,
  'Uyuşmazlık Mahkemesi, adli ve idari yargı kolları arasındaki uyuşmazlıkları kesin çözer. Uyuşmazlık Mahkemesi Başkanını kendi üyeleri değil; Anayasa Mahkemesi kendi üyeleri arasından seçip görevlendirir.',
  'Uyuşmazlık Mahkemesi Başkanı AYM üyesidir ve AYM Genel Kurulu tarafından seçilir.',
  21
);

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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  'Danıştay üyelerinin seçimi değerlendirildiğinde üyelerin dörtte birini (1/4) ve dörtte üçünü (3/4) sırasıyla hangi makamlar seçer?',
  '{"options": ["1/4''ünü TBMM — 3/4''ünü Cumhurbaşkanı", "1/4''ünü Cumhurbaşkanı — 3/4''ünü Hâkimler ve Savcılar Kurulu (HSK)", "Tamamını HSK", "Yarısını Yargıtay — Yarısını Danıştay", "1/4''ünü Danıştay — 3/4''ünü Adalet Bakanı"], "correctIndex": 1}'::jsonb,
  'Anayasa m. 155 uyarınca Danıştay üyelerinin dörtte birini (1/4) Cumhurbaşkanı; dörtte üçünü (3/4) ise Hâkimler ve Savcılar Kurulu (HSK) seçer.',
  'Danıştay''da üye seçicileri: 1/4 Cumhurbaşkanı, 3/4 HSK! Yargıtay üyelerinin tamamını ise HSK seçer.',
  22
);

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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  '1982 Anayasası''na göre Olağanüstü Hal (OHAL) ilan etme yetkisi kime aittir ve en fazla kaç ay süreyle ilan edilebilir?',
  '{"options": ["TBMM — En çok 1 yıl", "Cumhurbaşkanı — En çok 6 ay", "İçişleri Bakanı — En çok 3 ay", "Milli Güvenlik Kurulu — En çok 1 ay", "Genelkurmay Başkanı — En çok 2 yıl"], "correctIndex": 1}'::jsonb,
  'Anayasa m. 119 uyarınca tabii afet, tehlikeli salgın hastalık, ağır ekonomik bunalım veya kamu düzenini bozan şiddet olaylarında Cumhurbaşkanı yurdun tamamında veya bir bölgesinde süresi 6 AYI GEÇMEMEK ÜZERE OHAL ilan edebilir. Karar aynı gün Resmî Gazete''de yayımlanır ve TBMM onayına sunulur.',
  'OHAL ilanını Cumhurbaşkanı en çok 6 aylığına yapar; ilan edilen OHAL''i uzatma yetkisi ise TBMM''dedir (her defasında en çok 4 ay uzatabilir).',
  23
);

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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  'Cumhurbaşkanı tarafından ilan edilen Olağanüstü Hal (OHAL) süresini, Cumhurbaşkanı''nın talebi üzerine her defasında en çok kaç ay süreyle uzatmaya TBMM yetkilidir?',
  '{"options": ["1 ay", "2 ay", "3 ay", "4 ay", "6 ay"], "correctIndex": 3}'::jsonb,
  'TBMM, OHAL süresini değiştirebilir, kaldırabilir veya Cumhurbaşkanı''nın istemiyle her defasında 4 AYI GEÇMEMEK üzere uzatabilir (Savaş halinde 4 aylık sınır aranmaz).',
  'İlan süresi = En çok 6 ay (Cumhurbaşkanı); Uzatma süresi = Her defasında en çok 4 ay (TBMM)!',
  24
);

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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  'Milli Güvenlik Kurulu''nun (MGK) gündemini kim belirler ve toplantılarına kim başkanlık eder?',
  '{"options": ["Gündemi Genelkurmay Başkanı belirler, toplantıya Cumhurbaşkanı başkanlık eder.", "Gündemi Cumhurbaşkanı yardımcıları ve Genelkurmay Başkanı''nın önerilerini dikkate alarak Cumhurbaşkanı belirler ve toplantıya Cumhurbaşkanı başkanlık eder.", "Gündemi İçişleri Bakanı belirler, TBMM Başkanı yönetir.", "Gündemi Savunma Bakanı belirler, MGK Genel Sekreteri yönetir.", "Gündemi MİT Başkanı belirler, Cumhurbaşkanı yardımcısı yönetir."], "correctIndex": 1}'::jsonb,
  'Anayasa m. 118 uyarınca MGK gündemi; Cumhurbaşkanı yardımcıları ve Genelkurmay Başkanının önerileri dikkate alınarak Cumhurbaşkanınca düzenlenir. MGK''ya Cumhurbaşkanı başkanlık eder (katılamazsa Cumhurbaşkanı Yardımcısı vekalet eder).',
  'MGK iki ayda bir toplanır, kararları tavsiye niteliğindedir. Cumhurbaşkanı yoksa yardımcısı başkanlık eder.',
  25
);

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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  'Aşağıdakilerden hangisi Milli Güvenlik Kurulu''nun (MGK) anayasal üyeleri arasında YER ALMAZ?',
  '{"options": ["Adalet Bakanı", "Milli Savunma Bakanı", "İçişleri Bakanı", "Dışişleri Bakanı", "TBMM Başkanı"], "correctIndex": 4}'::jsonb,
  'TBMM Başkanı yasama organının başıdır; yürütmenin danışma organı olan MGK''nın üyesi DEĞİLDİR! MGK üyeleri: Cumhurbaşkanı, CB Yardımcıları, Adalet, İçişleri, Dışişleri ve Milli Savunma Bakanları ile Genelkurmay Başkanı, Kara, Deniz ve Hava Kuvvetleri Komutanlarıdır (Jandarma 2016''da çıkarıldı!).',
  'TBMM Başkanı ve Jandarma Genel Komutanı MGK ÜYESİ DEĞİLDİR!',
  26
);

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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  'TBMM Genel Kurulu''nda bir kanun veya kararın kabul edilebilmesi için geçerli olan ''Karar Yeter Sayısı'' kuralı aşağıdakilerden hangisidir?',
  '{"options": ["Her zaman üye tamsayısının salt çoğunluğu (301)", "Toplantıya katılanların salt çoğunluğudur; ancak bu sayı hiçbir şekilde üye tamsayısının dörtte birinin bir fazlasından (151 milletvekilinden) az olamaz", "Toplantıya katılanların üçte ikisi", "Her zaman en az 200 milletvekili", "Meclis Başkanı''nın tek oyu"], "correctIndex": 1}'::jsonb,
  'Anayasa m. 96: ''TBMM, yapacağı seçimler dahil bütün işlerinde üye tamsayısının en az üçte biri ile toplanır. Anayasada başkaca bir hüküm yoksa toplantıya katılanların salt çoğunluğu ile karar verir; ancak karar yeter sayısı hiçbir şekilde üye tamsayısının dörtte birinin bir fazlasından (151) az olamaz.''',
  'En düşük meclis karar yeter sayısı 151''dir! Örneğin 200 kişiyle toplanmış mecliste 101 ile karar alınamaz, en az 151 kabul gerekir.',
  27
);

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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  'Milletlerarası andlaşmaların Türk hukukundaki yeri düşünüldüğünde, usulüne göre yürürlüğe konulmuş temel hak ve özgürlüklere ilişkin milletlerarası andlaşmalar ile kanunların aynı konuda farklı hükümler içermesi halinde ortaya çıkan uyuşmazlıkta hangisi esas alınır?',
  '{"options": ["TBMM tarafından çıkarılan kanun hükümleri", "Milletlerarası andlaşma hükümleri", "Cumhurbaşkanlığı Kararnamesi", "Danıştay içtihadı", "Uyuşmazlık Mahkemesi kararı"], "correctIndex": 1}'::jsonb,
  'Anayasa m. 90 son fıkrası gereğince: Usulüne göre yürürlüğe konulmuş temel hak ve özgürlüklere ilişkin milletlerarası andlaşmalarla kanunların aynı konuda farklı hükümler içermesi nedeniyle çıkabilecek uyuşmazlıklarda MİLLETLERARASI ANDLAŞMA hükümleri esas alınır.',
  'Temel haklara ilişkin uluslararası sözleşmeler ile kanun çatışırsa sözleşme üstün tutulur; ayrıca usulüne göre yürürlüğe konulmuş andlaşmalar aleyhine AYM''ye iptal davası açılamaz!',
  28
);

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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  'TBMM Başkanlık Divanı kimlerden oluşur ve Meclis Başkanı seçimi en fazla kaç turda tamamlanır?',
  '{"options": ["Meclis Başkanı, Başkanvekilleri, Katip Üyeler ve İdare Amirlerinden oluşur — En çok 4 turda tamamlanır", "Yalnızca Meclis Başkanı ve Bakanlardan oluşur — 2 turda tamamlanır", "Meclis Başkanı ve Komisyon Başkanlarından oluşur — 3 turda tamamlanır", "Cumhurbaşkanı ve Meclis Başkanından oluşur — Tek turda biter", "Sadece siyasi parti grup başkanlarından oluşur — 5 turda tamamlanır"], "correctIndex": 0}'::jsonb,
  'Başkanlık Divanı; Meclis Başkanı, Başkanvekilleri, Kâtip Üyeler ve İdare Amirlerinden oluşur. Meclis Başkanı seçimi gizli oyla en çok 4 turda tamamlanır (1. ve 2. turda 400 oy; 3. turda 301 oy; 4. turda en çok oyu alan 2 adaydan en çok oyu alan seçilir).',
  'TBMM Başkanı 4 turlu gizli oylamayla seçilir. İlk iki turda 400 (2/3), üçüncü turda 301 (salt çoğunluk) aranır.',
  29
);

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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  'Anayasa Mahkemesi''nin ''Somut Norm Denetimi'' (İtiraz Yolu) ile önüne gelen bir kanun maddesini inceleyebilmesi için aşağıdakilerden hangisi zorunlu bir şarttır?',
  '{"options": ["En az 120 milletvekilinin AYM''ye dilekçe vermesi", "Görülmekte olan bir davanın bulunması, itiraz konusu kuralın o davada uygulanacak norm olması ve mahkemenin anayasaya aykırılık iddiasını ciddi bulması", "Cumhurbaşkanı''nın onay vermesi", "Davanın doğrudan Yargıtay Ceza Genel Kurulu''nda olması", "Kanunun yürürlüğe girmesinden itibaren 60 günün geçmemiş olması"], "correctIndex": 1}'::jsonb,
  'Somut norm denetimi (m. 152); bakılmakta olan somut bir davada hakimin uygulayacağı kanun maddesini anayasaya aykırı görmesi veya tarafların iddiasını ciddi bulmasıyla AYM''ye başvurmasıdır. Dava yoksa itiraz yolu işletilemez.',
  'Soyut norm denetimi (İptal davası) 60 gün içinde açılır; Somut norm denetiminde (İtiraz) ise herhangi bir süre sınırı yoktur, dava sürdüğü sürece her zaman başvurulabilir.',
  30
);

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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  3,
  'Somut norm denetimi (itiraz yolu) ile önüne gelen bir kanun maddesini esastan inceleyen Anayasa Mahkemesi, kanunun anayasaya aykırı olmadığına karar verip iptal istemini reddederse, aynı kanun hükmünün anayasaya aykırılığı iddiasıyla kaç yıl geçmedikçe yeniden itiraz başvurusu yapılamaz?',
  '{"options": ["1 yıl", "3 yıl", "5 yıl", "10 yıl", "Ömür boyu"], "correctIndex": 3}'::jsonb,
  'Anayasa m. 152 son fıkrası: ''Anayasa Mahkemesinin işin esasına girerek verdiği red kararının Resmî Gazetede yayımlanmasından sonra on yıl geçmedikçe aynı kanun hükmünün Anayasaya aykırılığı iddiasıyla tekrar başvuruda bulunulamaz.''',
  'Red kararından sonra ON YIL (10 yıl) geçmedikçe hiçbir mahkeme aynı maddeyi itiraz yoluyla AYM''ye taşıyamaz!',
  31
);

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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  3,
  'Sayıştay ile Danıştay kararları arasındaki ilişki düşünüldüğünde anayasal kural aşağıdakilerden hangisidir?',
  '{"options": ["Sayıştay kararları her durumda Danıştay kararlarından üstündür.", "Vergi, benzeri mali yükümlülükler ve ödevler hakkında Danıştay ile Sayıştay kararları arasındaki uyuşmazlıklarda Danıştay kararları esas alınır.", "Aralarındaki uyuşmazlığı çözmek üzere dosya Uyuşmazlık Mahkemesi''ne gider.", "Sayıştay kararları Danıştay tarafından bozulabilir.", "İki kurum arasında hiçbir zaman görüş ayrılığı çıkamaz."], "correctIndex": 1}'::jsonb,
  'Anayasa m. 160 açık hükmüdür: ''Vergi, benzeri mali yükümlülükler ve ödevler hakkında Danıştay ile Sayıştay kararları arasındaki uyuşmazlıklarda Danıştay kararları esas alınır.''',
  'Vergi uyuşmazlığında Sayıştay değil, DANIŞTAY kararı üstün tutulur; dosya Uyuşmazlık Mahkemesi''ne gitmez, anayasa doğrudan Danıştay''ı üstün kılmıştır.',
  32
);

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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  3,
  '1982 Anayasası''na göre bir Cumhurbaşkanı en fazla iki defa seçilebilir. Ancak bu kuralın tek bir anayasal istisnası bulunmaktadır.

Cumhurbaşkanının ikinci döneminde görev yaparken üçüncü kez aday olabilmesinin tek anayasal şartı aşağıdakilerden hangisidir?',
  '{"options": ["Cumhurbaşkanının kendisinin erken seçim kararı alması", "TBMM''nin üye tamsayısının beşte üç (3/5 = 360) çoğunluğuyla seçimlerin yenilenmesine karar vermesi", "Yüksek Seçim Kurulu''nun oy birliğiyle onay vermesi", "Anayasa Mahkemesi''nin izin vermesi", "Ülkede nüfus sayımının yapılması"], "correctIndex": 1}'::jsonb,
  'Anayasa m. 116/3: ''Cumhurbaşkanının ikinci döneminde Meclis tarafından seçimlerin yenilenmesine karar verilmesi halinde (en az 360 oyla), Cumhurbaşkanı bir defa daha aday olabilir.'' Cumhurbaşkanı kendi kararıyla meclisi feshederse 3. kez aday OLAMAZ; kararı Meclis vermelidir.',
  'Cumhurbaşkanı kendisi seçim kararı alırsa 3. kez aday olamaz! Mutlaka TBMM''nin 360 vekille seçim yenileme kararı alması gerekir.',
  33
);

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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  3,
  'Anayasa Mahkemesi kararlarının nitelikleri ile ilgili aşağıdaki ifadelerden hangisi yanlıştır?',
  '{"options": ["Anayasa Mahkemesi kararları kesindir.", "İptal kararları gerekçesi yazılmadan açıklanamaz.", "Anayasa Mahkemesi bir kanun hükmünü iptal ederken, kanun koyucu gibi hareketle yeni bir uygulamaya yol açacak biçimde hüküm tesis edemez.", "Anayasa Mahkemesi''nin iptal kararları kural olarak geriye yürür ve geçmişe etkili sonuç doğurur.", "İptal kararları Resmî Gazete''de yayımlandığı anda yürürlüğe girer (yürürlük tarihi en çok 1 yıla kadar ertelenebilir)."], "correctIndex": 3}'::jsonb,
  'Anayasa m. 153''ün en temel kuralı: ''İptal kararları GERİYE YÜRÜMEZ.'' İptal edilen kanuna dayanılarak geçmişte yapılmış işlemler geçerliliğini korur; iptal kararı kural olarak geleceğe etkilidir.',
  'İdari yargıdaki (Danıştay) iptal kararları geçmişe yürür; ancak Anayasa Mahkemesi''nin kanun iptal kararları KESİNLİKLE GERİYE YÜRÜMEZ!',
  34
);

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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  3,
  'Hakimler ve Savcılar Kurulu''nun (HSK) 13 üyesinin seçim dağılımı aşağıdakilerin hangisinde eksiksiz ve doğru verilmiştir?',
  '{"options": ["Adalet Bakanı (Başkan), Adalet Bakanlığı Müsteşarı (Bakan Yrd.), 4 üyeyi Cumhurbaşkanı, 7 üyeyi TBMM seçer", "13 üyenin tamamını TBMM seçer", "13 üyenin tamamını Cumhurbaşkanı seçer", "7 üyeyi Cumhurbaşkanı, 4 üyeyi TBMM seçer", "Yarısını Yargıtay, yarısını Danıştay seçer"], "correctIndex": 0}'::jsonb,
  'HSK 13 üyeden oluşur: 1 Adalet Bakanı (Başkan), 1 Bakan Yardımcısı (tabii üye). Kalan 11 üyenin 4''ünü doğrudan Cumhurbaşkanı, 7''sini ise TBMM Genel Kurulu (nitelikli çoğunlukla) seçer.',
  'HSK''da Cumhurbaşkanı 4 üye, TBMM ise 7 üye seçer (4+7=11 + 2 tabii üye = 13).',
  35
);

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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  3,
  'Kanunların ve TBMM İçtüzüğü''nün Anayasa''ya aykırılığı iddiasıyla doğrudan doğruya Anayasa Mahkemesi''nde ''İptal Davası'' (Soyut Norm Denetimi) açabilecek yetkililer kimlerdir?',
  '{"options": ["Sadece Adalet Bakanı ve Danıştay Başkanı", "Cumhurbaşkanı, TBMM''de en fazla üyeye sahip iki siyasi parti grubu ve TBMM üye tamsayısının en az beşte biri (120 milletvekili)", "Herhangi bir vatandaş veya baro başkanı", "TBMM Başkanı ve Başsavcı", "Yalnızca ana muhalefet partisi genel başkanı"], "correctIndex": 1}'::jsonb,
  'Anayasa m. 150 uyarınca doğrudan iptal davası açma hakkı: Cumhurbaşkanına, Meclis''te en fazla üyeye sahip iki siyasi parti grubuna (iktidar ve ana muhalefet) ve TBMM üye tamsayısının en az beşte birine (120 milletvekili) aittir.',
  'İptal davası açma yetkisi sadece bu üç mercidedir; başka hiçbir kurum veya kişi kanun iptali için AYM''ye doğrudan dava açamaz.',
  36
);

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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  3,
  'TBMM seçimleri devam ederken Cumhurbaşkanlığı makamının herhangi bir nedenle (ölüm, istifa vb.) boşalması halinde genel seçimlere 1 yıldan FAZLA süre kalmışsa ne yapılır?',
  '{"options": ["TBMM Başkanı derhal yeni Cumhurbaşkanı atanır.", "Cumhurbaşkanlığı makamının boşaldığı günden başlayarak 45 gün içindeki son pazar günü sadece Cumhurbaşkanı seçimi yapılır.", "Seçimler 1 yıl sonraya ertelenir.", "Bakanlar Kurulu kendi arasından bir başkan seçer.", "Genelkurmay Başkanı görevi devralır."], "correctIndex": 1}'::jsonb,
  'Genel seçime 1 yıldan FAZLA süre varken makam boşalırsa 45 gün içinde SADECE Cumhurbaşkanı seçimi yapılır ve seçilen kişi TBMM''nin görev süresini tamamlar. Eğer genel seçime 1 yıldan AZ süre kalmışsa 60 gün içinde TBMM ve Cumhurbaşkanı seçimi BİRLİKTE yenilenir.',
  '1 yıldan çok varsa = 45 günde sadece CB seçimi; 1 yıldan az varsa = 60 günde TBMM + CB seçimi birlikte!',
  37
);

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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  3,
  'Anayasa Mahkemesi''nin ''Yüce Divan'' sıfatıyla yargılayabileceği anayasal kişiler arasında aşağıdakilerden hangisi yer almaz?',
  '{"options": ["Cumhurbaşkanı ve Cumhurbaşkanı Yardımcıları", "Bakanlar", "TBMM Başkanı", "Milletvekilleri", "Genelkurmay Başkanı, Kara, Deniz ve Hava Kuvvetleri Komutanları"], "correctIndex": 3}'::jsonb,
  'Anayasa m. 148''de Yüce Divan''da yargılanacaklar tek tek sayılmıştır: Cumhurbaşkanı, yardımcıları, bakanlar, AYM, Yargıtay, Danıştay üyeleri ve başsavcıları, HSK ve Sayıştay üyeleri, TBMM Başkanı ve Kuvvet Komutanları. MİLLETVEKİLLERİ Yüce Divan''da yargılanmaz; dokunulmazlıkları kaldırılırsa genel ceza mahkemelerinde yargılanırlar.',
  'Milletvekilleri Yüce Divan''a gitmez! Normal adliye ceza mahkemelerinde (Ağır Ceza) yargılanırlar.',
  38
);

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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  3,
  'Cumhurbaşkanlığı kararnamesi ile kanun arasındaki hiyerarşi düşünüldüğünde aşağıdakilerden hangisi doğrudan Cumhurbaşkanlığı Kararnamesi ile kurulabilir ve düzenlenebilir?',
  '{"options": ["Bakanlıkların kurulması, kaldırılması, görevleri, yetkileri ve teşkilat yapısı", "Vergilerin konulması ve kaldırılması", "Suç ve cezaların ihdası", "Siyasi partilerin kuruluş ve işleyişi", "Vatandaşlık kanunu"], "correctIndex": 0}'::jsonb,
  'Anayasa m. 106 açıkça ''Bakanlıkların kurulması, kaldırılması, görevleri ve yetkileri ile teşkilat yapısı Cumhurbaşkanlığı kararnamesi ile düzenlenir'' demektedir. Vergi, suç-ceza, siyasi partiler ve vatandaşlık ise yalnızca KANUNLA düzenlenebilir.',
  'Bakanlıklar artık kanunla değil; doğrudan CUMHURBAŞKANLIĞI KARARNAMESİ ile kurulur ve kaldırılır!',
  39
);

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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  3,
  'Hakimler ve Savcılar Kurulu''nun (HSK) kararlarına karşı yargı yolu kural olarak kapalıdır. Ancak hukuk devleti ilkesi gereğince bu kurala tek bir istisna getirilmiştir.

HSK''nın aşağıdaki kararlarından hangisine karşı Danıştay''a yargı yolu açıktır?',
  '{"options": ["Hakimlerin görev yerlerinin değiştirilmesi (atama kararları)", "Meslekten çıkarma cezasına ilişkin nihai kararlar", "Uyarma ve kınama disiplin cezaları", "Derece yükselmesi kararları", "Kurul müfettişlerinin teftiş raporları"], "correctIndex": 1}'::jsonb,
  'Anayasa m. 159 son fıkrası gereğince HSK''nın ''meslekten çıkarma cezasına ilişkin olanlar dışındaki'' kararlarına karşı yargı mercilerine başvurulamaz. Yani MESLEKTEN ÇIKARMA kararlarına karşı Danıştay''a iptal davası açılabilir.',
  'HSK''nın sadece ve sadece ''meslekten çıkarma'' kararı yargı denetimine açıktır; atama, terfi veya kınama cezalarına karşı yargı yolu kesinlikle kapalıdır.',
  40
);

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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  '1982 Anayasası''na göre TBMM bir yasama yılında EN ÇOK kaç ay tatil yapabilir ve tatil sırasında Meclis üyelerinin en az kaçının yazılı istemi üzerine TBMM Başkanı meclisi toplantıya çağırmak zorundadır?',
  '{"options": ["En çok 3 ay tatil yapabilir — Üye tamsayısının 1/5''i (120 milletvekili) istemiyle", "En çok 2 ay tatil yapabilir — Üye tamsayısının 1/3''ü (200 milletvekili) istemiyle", "En çok 1 ay tatil yapabilir — Üye tamsayısının salt çoğunluğu (301 vekil) istemiyle", "En çok 4 ay tatil yapabilir — 50 milletvekili istemiyle", "En çok 3 ay tatil yapabilir — Yalnızca Cumhurbaşkanı istemiyle"], "correctIndex": 0}'::jsonb,
  'Anayasa m. 93 uyarınca TBMM bir yasama yılında en çok 3 ay tatil yapabilir. Ara verme ise 15 günü geçemez. Cumhurbaşkanı ve TBMM Başkanı doğrudan; milletvekillerinin en az 1/5''i (120 vekil) yazılı talepte bulunursa TBMM Başkanı zorunlu olarak meclisi olağanüstü toplantıya çağırır.',
  'Meclis tatili en çok 3 aydır; meclisi toplantıya çağırma istemi için 1/5 (120 milletvekili) imzası gerekir.',
  41
);

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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  'TBMM Genel Kurulu tarafından yasama dokunulmazlığı kaldırılan veya milletvekilliği düşürülen bir milletvekili, bu kararın iptali istemiyle kaç gün içinde Anayasa Mahkemesi''ne başvurabilir ve AYM bu başvuruyu en geç kaç gün içinde karara bağlar?',
  '{"options": ["7 gün içinde başvurur — Anayasa Mahkemesi 15 gün içinde kesin karara bağlar.", "15 gün içinde başvurur — Anayasa Mahkemesi 30 gün içinde karara bağlar.", "10 gün içinde başvurur — Anayasa Mahkemesi 10 gün içinde karara bağlar.", "30 gün içinde başvurur — Anayasa Mahkemesi 60 gün içinde karara bağlar.", "Yargı yolu kapalıdır, mahkemeye başvurulamaz."], "correctIndex": 0}'::jsonb,
  'Anayasa m. 85 uyarınca dokunulmazlığın kaldırılması veya vekilliğin düşürülmesi tarihinden itibaren 7 GÜN içinde milletvekilinin kendisi veya başka bir vekil AYM''ye iptal başvurusu yapabilir. Anayasa Mahkemesi başvuruyu 15 GÜN içinde kesin karara bağlamak zorundadır.',
  'ÖSYM''nin meşhur 7 - 15 gün kuralıdır: Başvuru süresi 7 GÜN, AYM''nin karar süresi 15 GÜNDÜR!',
  42
);

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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  'Anayasa''nın 94. maddesine göre TBMM Başkanlığı seçimi gizli oyla en çok kaç turda tamamlanır ve 3. tur oylamada seçilebilmek için aranan asgari çoğunluk nedir?',
  '{"options": ["En çok 4 turda tamamlanır — 3. turda üye tamsayısının salt çoğunluğu (301 oy) aranır.", "En çok 3 turda tamamlanır — 3. turda en çok oy alan seçilir.", "En çok 4 turda tamamlanır — 3. turda 2/3 çoğunluk (400 oy) aranır.", "En çok 2 turda tamamlanır — 2. turda salt çoğunluk aranır.", "En çok 5 turda tamamlanır — 3. turda 360 oy aranır."], "correctIndex": 0}'::jsonb,
  'TBMM Başkanlık seçimi en çok 4 turda biter: 1. Turda 400 (2/3), 2. Turda 400 (2/3), 3. Turda 301 (Salt çoğunluk) aranır. 3. turda da seçilemezse en çok oy alan iki aday 4. tura kalır ve en çok oy alan (basit çoğunluk) başkan seçilir.',
  '1 ve 2. turlarda 400; 3. turda 301; 4. turda en çok oyu alan kazanır. Süreç en çok 4 tur sürer.',
  43
);

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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  '1982 Anayasası''nın 101. maddesine göre Cumhurbaşkanlığına aday gösterilme usulü değerlendirildiğinde aşağıdakilerden hangisi doğrudan Cumhurbaşkanlığına aday gösteremez?',
  '{"options": ["TBMM''de grubu bulunan (en az 20 milletvekili olan) siyasi partiler", "En son yapılan genel seçimlerde tek başına veya birlikte geçerli oyların en az yüzde beşini (%5) almış olan siyasi partiler", "En az 100.000 seçmen", "Türkiye Barolar Birliği ve TOBB ortak imzası", "Birden fazla partinin ittifak yaparak oylarının toplamının %5''i bulması"], "correctIndex": 3}'::jsonb,
  'Anayasa m. 101 uyarınca CB adaylığı için üç meşru yol vardır: 1) Meclis grubu (20 vekil), 2) Son genel seçimde en az %5 oy almış partiler, 3) 100 bin seçmenin imzası. Meslek kuruluşları veya sendikalar aday gösteremez.',
  'CB adaylığı için oy oranı barajı %5''tir (seçim barajı olan %7 ile karıştırılmamalıdır); imza sayısı ise 100 bindir.',
  44
);

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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  'Cumhurbaşkanlığı makamının herhangi bir nedenle boşalması (ölüm, istifa vb.) halinde yenisi seçilene kadar Cumhurbaşkanlığına kim vekalet eder ve yetkilerini kullanır?',
  '{"options": ["TBMM Başkanı", "Cumhurbaşkanı Yardımcısı", "Anayasa Mahkemesi Başkanı", "Adalet Bakanı", "En yaşlı milletvekili"], "correctIndex": 1}'::jsonb,
  '2017 değişikliği öncesinde TBMM Başkanı vekalet etmekteydi. 2017 anayasa reformuyla bu kural değişmiş olup makamın boşalması veya yurt dışına çıkış hallerinde vekalet yetkisi CUMHURBAŞKANI YARDIMCISINA verilmiştir.',
  'Eski anayasada vekil TBMM Başkanı idi; 2017 sonrasında vekil CUMHURBAŞKANI YARDIMCISIDIR!',
  45
);

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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  '1982 Anayasası''nın 108. maddesinde düzenlenen ve doğrudan Cumhurbaşkanlığına bağlı olan Devlet Denetleme Kurulu''nun (DDK) inceleme ve denetleme yetkisi DIŞINDA bırakılan TEK ALAN aşağıdakilerden hangisidir?',
  '{"options": ["Türk Silahlı Kuvvetleri", "Kamu İktisadi Teşebbüsleri (KİT)", "Yargı Organları", "Meslek Kuruluşları ve Odalar", "Sendikalar ve Kamu Yararına Dernekler"], "correctIndex": 2}'::jsonb,
  'Anayasa m. 108 açık hükmüdür: ''Yargı organları, Devlet Denetleme Kurulunun görev alanı dışındadır.'' TSK, KİT''ler, vakıf ve dernekler ise DDK denetimine tabidir (2017''de TSK da DDK kapsamına alınmıştır).',
  '2017''den önce TSK denetlenemiyordu; 2017 ile TSK da DDK denetimine açıldı. DDK''nın denetleyemediği TEK ALAN YARGI ORGANLARIDIR!',
  46
);

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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  'Adli ve idari yargı kolları arasındaki görev ve hüküm uyuşmazlıklarını kesin olarak çözmekle görevli olan Uyuşmazlık Mahkemesi''nin Başkanı aşağıdakilerden hangisi tarafından seçilir?',
  '{"options": ["Anayasa Mahkemesi kendi üyeleri arasından seçer.", "Yargıtay Büyük Genel Kurulu seçer.", "Danıştay Genel Kurulu seçer.", "Hakimler ve Savcılar Kurulu seçer.", "Cumhurbaşkanı doğrudan atar."], "correctIndex": 0}'::jsonb,
  'Anayasa m. 158 uyarınca: ''Uyuşmazlık Mahkemesinin Başkanlığını Anayasa Mahkemesince kendi üyeleri arasından görevlendirilen üye yapar.''',
  'Uyuşmazlık Mahkemesi Başkanı AYM üyeleri arasından Anayasa Mahkemesi tarafından seçilir!',
  47
);

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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  'Anayasa''nın 160. maddesinde düzenlenen Sayıştay ile Danıştay''ın vergi, benzeri mali yükümlülükler ve ödevler konusundaki kesinleşmiş kararları arasında bir uyuşmazlık çıkarsa hangisinin kararı esas alınır?',
  '{"options": ["Danıştay kararları esas alınır.", "Sayıştay kararları esas alınır.", "Uyuşmazlık Mahkemesi''ne başvurulur.", "Anayasa Mahkemesi son sözü söyler.", "Hazine ve Maliye Bakanlığı''nın görüşü uygulanır."], "correctIndex": 0}'::jsonb,
  'Anayasa m. 160 son fıkrası gereğince: ''Vergi, benzeri mali yükümlülükler ve ödevler hakkında Danıştay ile Sayıştay kararları arasındaki uyuşmazlıklarda DANIŞTAY KARARLARI ESAS ALINIR.''',
  'Sayıştay hesap mahkemesidir ancak vergi konusunda uyuşmazlık çıkarsa yüksek idare mahkemesi olan DANIŞTAY''ın kararı üstündür.',
  48
);

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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  'Cumhurbaşkanının tek başına imzaladığı veya anayasada özel olarak yargı denetimi dışına çıkarılan işlemler düşünüldüğünde aşağıdakilerden hangisine karşı YARGI YOLU AÇIKTIR?',
  '{"options": ["Olağan dönem Cumhurbaşkanlığı Kararnameleri", "Yüksek Seçim Kurulu (YSK) kararları", "Kamu Görevlileri Hakem Kurulu kararları", "Yüksek Askeri Şura''nın (YAŞ) terfi işlemleri ile kadrosuzluk nedeniyle emekliye ayırma kararları", "Hakimler ve Savcılar Kurulu''nun (HSK) kınama ve yer değiştirme kararları"], "correctIndex": 0}'::jsonb,
  'Olağan dönem Cumhurbaşkanlığı Kararnamelerine karşı Anayasa Mahkemesi''nde iptal davası açılabilir (yargı yolu açıktır). YSK, Hakem Kurulu ve YAŞ''ın terfi kararlarına karşı ise anayasal olarak yargı yolu kapalıdır.',
  'Olağan CBK''lar yargı denetimine (AYM) açıktır; OHAL CBK''lar ve YSK kararları ise yargıya kapalıdır.',
  49
);

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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  'Anayasa Mahkemesi''nin Yüce Divan sıfatıyla verdiği mahkumiyet veya aklama kararlarına karşı anayasal olarak başvurulabilecek kanun yolu aşağıdakilerden hangisidir?',
  '{"options": ["Kararın tebliğinden itibaren 15 gün içinde Yüce Divan''da ''Yeniden İnceleme'' (itiraz) talep edilebilir; Genel Kurulun inceleme kararı kesindir.", "Yargıtay Ceza Genel Kurulu''na temyize gidilir.", "Danıştay İdari Dava Daireleri Kurulu''na itiraz edilir.", "Yüce Divan kararlarına karşı hiçbir itiraz veya kanun yolu yoktur, ilk karar kesindir.", "Doğrudan AİHM''e başvurulur."], "correctIndex": 0}'::jsonb,
  '2010 anayasa değişikliği ile Yüce Divan kararlarına karşı ''Yeniden İnceleme'' (itiraz) yolu getirilmiştir. Tebliğden itibaren 15 gün içinde itiraz edilir ve Anayasa Mahkemesi Genel Kurulu''nun itiraz üzerine verdiği karar kesindir.',
  'Eskiden Yüce Divan kararlarına itiraz edilemiyordu; 2010 değişikliği ile AYM Genel Kurulu''na 15 gün içinde ''Yeniden İnceleme'' başvurusu hakkı tanınmıştır.',
  50
);


-- -------------------------------------------------------------
-- KONU 5: İDARE HUKUKU
-- -------------------------------------------------------------

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
  'İdare Hukuku',
  'multiple_choice',
  1,
  'Türkiye''de taşra teşkilatında merkeze danışmadan merkez adına kendiliğinden karar alabilme ve uygulayabilme yetkisi olan ''Yetki Genişliği'' anayasal olarak yalnızca kime tanınmıştır?',
  '{"options": ["Kaymakam", "Vali", "İl Emniyet Müdürü", "Belediye Başkanı", "Köy Muhtarı"], "correctIndex": 1}'::jsonb,
  'Anayasa m. 126 uyarınca illerin idaresi ''yetki genişliği'' esasına dayanır. Türkiye''de yetki genişliğine sahip tek makam VALİ''dir. Kaymakamda veya diğer taşra amirlerinde yetki genişliği kesinlikle yoktur.',
  'ÖSYM''nin en popüler sorusudur: Yetki genişliği sadece İL''de ve sadece VALİ''dedir; Kaymakamda yetki genişliği YOKTUR!',
  1
);

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
  'İdare Hukuku',
  'multiple_choice',
  1,
  'Aşağıdakilerden hangisi Anayasa''nın 127. maddesinde düzenlenen ''Mahalli İdareler'' (Yerel Yönetimler) arasında yer almaz?',
  '{"options": ["İl Özel İdaresi", "Belediye İdaresi", "Büyükşehir Belediyesi", "Köy İdaresi", "İlçe İdaresi (Kaymakamlık)"], "correctIndex": 4}'::jsonb,
  'Anayasa m. 127''de sayılan mahalli idareler üç tanedir: İl Özel İdaresi, Belediye ve Köy (Büyükşehir belediyesi de belediye statüsündedir). İlçe idaresi (Kaymakamlık) ise yerel yönetim değil, devletin merkezi taşra teşkilatıdır.',
  'İlçe idaresi mahalli idare değildir! Merkezi idarenin taşra uzantısıdır.',
  2
);

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
  'İdare Hukuku',
  'multiple_choice',
  1,
  'Bir yerleşim yerinde belediye kurulabilmesi için asgari nüfusun en az kaç olması şarttır ve belediye hangi makamın kararı ile kurulur?',
  '{"options": ["Nüfusu en az 2.000 — İçişleri Bakanı kararı ile", "Nüfusu en az 5.000 — Cumhurbaşkanı kararı ile", "Nüfusu en az 10.000 — TBMM kanunu ile", "Nüfusu en az 50.000 — Vali onayı ile", "Nüfusu en az 750.000 — Cumhurbaşkanı kararı ile"], "correctIndex": 1}'::jsonb,
  '5393 sayılı Belediye Kanunu uyarınca nüfusu 5.000 ve üzerinde olan yerleşim yerlerinde CUMHURBAŞKANI KARARI ile belediye kurulabilir (İl ve ilçe merkezlerinde ise nüfus şartı aranmaksızın belediye kurulması zorunludur).',
  'Normal belediye = Nüfus 5.000 (Cumhurbaşkanı kararı); Büyükşehir belediyesi = Nüfus 750.000 (KANUNLA); Köy = Nüfus 150-2.000 (İçişleri Bakanlığı).',
  3
);

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
  'İdare Hukuku',
  'multiple_choice',
  1,
  'Büyükşehir Belediyesi kurulabilmesi için toplam nüfusun en az kaç olması ve kuruluşun hangi işlemle yapılması şarttır?',
  '{"options": ["Nüfusu en az 250.000 — Cumhurbaşkanlığı Kararnamesi ile", "Nüfusu en az 500.000 — İçişleri Bakanlığı onayı ile", "Toplam il nüfusu en az 750.000 — KANUNLA", "Nüfusu en az 1.000.000 — Danıştay kararı ile", "Nüfusu en az 5.000 — Vali teklifi ile"], "correctIndex": 2}'::jsonb,
  '5216 sayılı Büyükşehir Belediyesi Kanunu uyarınca toplam il nüfusu fiziki yerleşim durumuna göre en az 750.000 olan illerde YALNIZCA KANUNLA (TBMM tarafından) Büyükşehir Belediyesi kurulabilir.',
  'Büyükşehir belediyesi Cumhurbaşkanı kararıyla değil, mutlaka TBMM tarafından çıkarılan KANUNLA kurulur!',
  4
);

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
  'İdare Hukuku',
  'multiple_choice',
  1,
  '657 sayılı Devlet Memurları Kanunu''na göre aşağıdakilerden hangisi bir ''disiplin cezası'' DEĞİLDİR?',
  '{"options": ["Uyarma", "Kınama", "Aylıktan kesme", "Görevden uzaklaştırma", "Kademe ilerlemesinin durdurulması"], "correctIndex": 3}'::jsonb,
  '657 sayılı DMK m. 125''te disiplin cezaları 5 tanedir: 1) Uyarma, 2) Kınama, 3) Aylıktan kesme, 4) Kademe ilerlemesinin durdurulması, 5) Devlet memurluğundan çıkarma. ''Görevden uzaklaştırma'' bir disiplin cezası değil, soruşturmanın selameti için uygulanan geçici bir İDARİ TEDBİRDİR.',
  'Görevden uzaklaştırma ve sürgün/tayin disiplin cezası DEĞİLDİR! En klasik sınav tuzaklarından biridir.',
  5
);

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
  'İdare Hukuku',
  'multiple_choice',
  1,
  'Vali ile Kaymakamın hukuki statüleri ve atanma usulleri karşılaştırıldığında aşağıdakilerden hangisi doğrudur?',
  '{"options": ["Vali meslek memurudur; Kaymakam istisnai memurdur.", "Vali Cumhurbaşkanı kararıyla atanır ve istisnai memurdur; Kaymakam ise Cumhurbaşkanı onayıyla atanır ve güvenceli bir meslek/kariyer memurudur.", "Her ikisi de İçişleri Bakanı tarafından atanır.", "Kaymakam yetki genişliğine sahiptir, vali sahip değildir.", "Vali olabilmek için kaymakamlık yapmış olmak zorunludur."], "correctIndex": 1}'::jsonb,
  'Valiler Cumhurbaşkanı Kararı ile atanır ve ''istisnai memur'' statüsündedir (Cumhurbaşkanı dilediği kişiyi vali atayabilir, görev süresi CB ile biter). Kaymakamlar ise sınavla girilen, staj yapılan kariyer/meslek memurudur ve Cumhurbaşkanı Onayı ile atanırlar.',
  'Vali = Cumhurbaşkanı KARARI (İstisnai memur); Kaymakam = Cumhurbaşkanı ONAYI (Kariyer/meslek memuru).',
  6
);

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
  'İdare Hukuku',
  'multiple_choice',
  1,
  'Merkezi idarenin aynı kamu tüzel kişiliği (devlet tüzel kişiliği) içerisindeki üst makamlarının ast makamlar üzerindeki emir, talimat, denetim ve iptal yetkisine ne ad verilir?',
  '{"options": ["İdari Vesayet", "Hiyerarşi Yetkisi", "Yetki Genişliği", "Yetki Devri", "Özerklik"], "correctIndex": 1}'::jsonb,
  'Aynı tüzel kişilik içerisindeki ast-üst denetimine ''hiyerarşi'' denir (örneğin Bakanın Müsteşara/Valiye, Valinin Kaymakama, Rektörün Dekana, Emniyet Müdürünün polise emretmesi).',
  'Aynı çatı altındaki ast-üst ilişkisi = Hiyerarşi; İki farklı tüzel kişilik arasındaki dış denetim (Vali - Belediye) = İdari Vesayet.',
  7
);

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
  'İdare Hukuku',
  'multiple_choice',
  1,
  'Merkezi idarenin (devletin) yerinden yönetim kuruluşları (belediyeler, köyler, meslek odaları) üzerinde idarenin bütünlüğünü ve kamu hizmetlerinin uyumunu sağlamak amacıyla kanunla sınırlı olarak kullandığı dış denetim yetkisine ne ad verilir?',
  '{"options": ["Hiyerarşi", "İdari Vesayet", "İmza Devri", "Düzenleyici İşlem", "İstişari Görüş"], "correctIndex": 1}'::jsonb,
  'Farklı kamu tüzel kişileri arasındaki denetime ''idari vesayet'' denir. Örneğin İçişleri Bakanlığı''nın belediyeleri denetlemesi, Barolar Birliği''nin yerel baroları denetlemesi vesayet denetimidir.',
  'Vesayet makamı yerinden yönetim kuruluşuna emir ve talimat veremez, onun yerine geçip işlem yapamaz; sadece onaylar, iptal davası açabilir veya geciktirebilir.',
  8
);

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
  'İdare Hukuku',
  'multiple_choice',
  1,
  '657 sayılı Devlet Memurları Kanunu''na göre göreve yeni başlayan bir aday memurun adaylık süresi en az ve en çok ne kadardır?',
  '{"options": ["En az 6 ay — En çok 1 yıl", "En az 1 yıl — En çok 2 yıl", "En az 2 yıl — En çok 3 yıl", "En az 3 ay — En çok 6 ay", "Doğrudan asaleten başlar, adaylık yoktur"], "correctIndex": 1}'::jsonb,
  '657 sayılı DMK m. 54 uyarınca adaylık süresi 1 yıldan az, 2 yıldan çok olamaz. Adaylık devresi içinde göreve devamsızlık veya disiplinsizlik gösterenlerin memuriyetle ilişiği kesilir.',
  'Aday memurluk süresi: Asgari 1 yıl, azami 2 yıldır.',
  9
);

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
  'İdare Hukuku',
  'multiple_choice',
  1,
  'Köy idaresinin karar organı olan ve köydeki tüm kadın-erkek seçmenlerin doğal olarak üyesi bulunduğu organ hangisidir?',
  '{"options": ["Köy İhtiyar Meclisi", "Köy Derneği", "İl Encümeni", "Köy Komisyonu", "Muhtarlık Divanı"], "correctIndex": 1}'::jsonb,
  'Köy Derneği; köyde ikamet eden ve oy kullanma hakkına sahip tüm kadın ve erkek köylülerin oluşturduğu doğrudan demokrasi organıdır. Muhtarı ve İhtiyar Meclisi üyelerini seçer, köyün isteğe bağlı işlerini zorunlu hale getirebilir.',
  'Köy Derneği sivil toplum derneği değildir; köyün tüm seçmenlerinden oluşan resmi anayasal köy organıdır.',
  10
);

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
  'İdare Hukuku',
  'multiple_choice',
  2,
  'Hakkında görevleriyle ilgili bir suç sebebiyle soruşturma veya kovuşturma açılan bir Belediye Başkanını ''geçici bir tedbir olarak'' görevden uzaklaştırmaya yetkili makam hangisidir?',
  '{"options": ["Danıştay", "İçişleri Bakanı", "İl Valisi", "Cumhurbaşkanı", "Belediye Meclisi"], "correctIndex": 1}'::jsonb,
  'Anayasa m. 127 uyarınca görevleri ile ilgili bir suç sebebi ile hakkında soruşturma veya kovuşturma açılan mahalli idare organlarını veya bu organların üyelerini, İÇİŞLERİ BAKANI geçici bir tedbir olarak kesin hükme kadar uzaklaştırabilir.',
  'GEÇİCİ uzaklaştırmayı İçişleri Bakanı yapar; KESİN olarak başkanlık sıfatının düşürülmesine ise sadece DANIŞTAY karar verebilir!',
  11
);

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
  'İdare Hukuku',
  'multiple_choice',
  2,
  'Görevden uzaklaştırılan veya belediye başkanlığı sıfatı tartışmalı hale gelen bir belediye başkanının ''başkanlık sıfatını kesin olarak düşürme'' yetkisi hangi yargı organına aittir?',
  '{"options": ["İçişleri Bakanlığı Yüksek Disiplin Kurulu", "Danıştay", "Yargıtay", "Anayasa Mahkemesi", "İdare Mahkemesi"], "correctIndex": 1}'::jsonb,
  'Seçimle gelen bir yerel yöneticinin görevine kesin olarak son verme yetkisi yargı güvencesi altındadır. Belediye başkanlığının kesin olarak düşmesine yalnızca DANIŞTAY karar verebilir.',
  'İçişleri Bakanı sadece geçici uzaklaştırabilir; başkanlığı kesin bitiren Danıştay''dır.',
  12
);

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
  'İdare Hukuku',
  'multiple_choice',
  2,
  'Kamu görevlisinin amirinden aldığı emri hukuka aykırı görmesi durumu (Kanunsuz Emir - Anayasa m. 137) ile ilgili kurallar değerlendirildiğinde aşağıdakilerden hangisi yanlıştır?',
  '{"options": ["Kamu görevlisi amirinin verdiği emri anayasa ve kanunlara aykırı görürse yerine getirmez ve aykırılığı emri verene bildirir.", "Amir emrinde ısrar eder ve bu emrini yazılı olarak yenilerse memur emri yerine getirir; bu durumda sorumluluk emri verene ait olur.", "Konusu suç teşkil eden emir hiçbir surette yerine getirilemez; yerine getiren kimse sorumluluktan kurtulamaz.", "Konusu suç teşkil eden emir amir tarafından yazılı olarak tekrarlanırsa memur emri yapar ve tüm cezai sorumluluktan tamamen muaf tutulur.", "Askeri hizmetlerin görülmesi ve acele hallerde kamu düzeniyle ilgili kanuni istisnalar saklıdır."], "correctIndex": 3}'::jsonb,
  'Anayasa m. 137 son derece açıktır: ''Konusu suç teşkil eden emir, hiçbir suretle yerine getirilmez; yerine getiren kimse sorumluluktan kurtulamaz.'' Amir emri yazılı olarak verse, hatta tehdit etse bile konusu suç olan emir yerine getirilemez; getiren memur hapse girer.',
  'Kanuna aykırı emir yazılı tekrarlanırsa memur yapar ve sorumluluk amire geçer; ancak SUÇ TEŞKİL EDEN emir yazılı verilse bile ASLA YAPILAMAZ!',
  13
);

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
  'İdare Hukuku',
  'multiple_choice',
  2,
  'İl Genel İdaresi''nin organları ile İl Özel İdaresi''nin organları karşılaştırıldığında;

• İl Özel İdaresi''nin başı ve yürütme organı olan,
• Aynı zamanda merkezi idarenin İl Genel İdaresi''ndeki en üst amiri olan
çift şapkalı makam aşağıdakilerden hangisidir?',
  '{"options": ["İl Genel Meclisi Başkanı", "Vali", "Büyükşehir Belediye Başkanı", "İl İdare Kurulu Başkanı", "Garnizon Komutanı"], "correctIndex": 1}'::jsonb,
  'Vali çift şapkalıdır: Hem merkezi idarenin ildeki temsilcisi (İl Genel İdaresi başı) hem de yerel yönetim olan İl Özel İdaresi''nin başı ve yürütme organıdır.',
  'İl Özel İdaresi''nin başı Vali''dir; karar organı ise halkın seçtiği İl Genel Meclisi''dir.',
  14
);

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
  'İdare Hukuku',
  'multiple_choice',
  2,
  'Köy İhtiyar Meclisi''nin doğal (tabii) üyeleri aşağıdakilerden hangisinde birlikte verilmiştir?',
  '{"options": ["Köy Muhtarı ve Köy Korucusu", "Köy İmamı ve Köy Öğretmeni", "Köy Ebeleri ve Ziraat Mühendisi", "En yaşlı köylü ve Muhtar", "Köy Bakkalı ve Cami Dernek Başkanı"], "correctIndex": 1}'::jsonb,
  'Köy Kanunu uyarınca İhtiyar Meclisi üyelerinin bir kısmı Köy Derneği tarafından seçilir. Köyün İMAMI ve ilkokul ÖĞRETMENİ ise seçim yapılmaksızın heyetin tabii (doğal) üyeleridir.',
  'Köyün imamı ve öğretmeni İhtiyar Meclisi''nin kanuni tabii üyeleridir.',
  15
);

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
  'İdare Hukuku',
  'multiple_choice',
  2,
  '657 sayılı Devlet Memurları Kanunu''na göre memurlara verilen disiplin cezalarından hangileri doğrudan ''Disiplin Amiri'' (Birim Amiri/Müdür) tarafından tek başına verilebilir?',
  '{"options": ["Yalnızca Devlet memurluğundan çıkarma", "Uyarma, Kınama ve Aylıktan Kesme cezaları", "Kademe ilerlemesinin durdurulması ve İhraç", "Tüm disiplin cezaları sadece mahkemelerce verilir", "Disiplin amirleri hiçbir ceza veremez"], "correctIndex": 1}'::jsonb,
  'Uyarma, kınama ve aylıktan kesme cezaları soruşturma sonrası doğrudan disiplin amirleri tarafından verilir. Kademe ilerlemesinin durdurulmasını İl Disiplin Kurulu kararıyla Vali (veya bakanlık disiplin kurulu); Memurluktan çıkarmayı ise Yüksek Disiplin Kurulu verir.',
  'Memurluktan çıkarma cezasını disiplin amiri değil, sadece YÜKSEK DİSİPLİN KURULU verebilir.',
  16
);

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
  'İdare Hukuku',
  'multiple_choice',
  2,
  'Kamu tüzel kişiliği (KTK) anayasa veya kanunla ya da Cumhurbaşkanlığı kararnamesi ile kurulur.

Aşağıdakilerden hangisi doğrudan ''Devlet Tüzel Kişiliği'' içerisinde yer alır (ayrı bir kamu tüzel kişiliği BULUNMAZ)?',
  '{"options": ["Ankara Üniversitesi", "Türkiye Radyo ve Televizyon Kurumu (TRT)", "İstanbul Barosu", "Milli Savunma Bakanlığı ve Emniyet Genel Müdürlüğü", "Kadıköy Belediyesi"], "correctIndex": 3}'::jsonb,
  'Bakanlıklar, Emniyet, Valilikler ve Kaymakamlıklar genel idarenin parçasıdır; ayrı kamu tüzel kişilikleri yoktur, ''Devlet Tüzel Kişiliği''ni kullanırlar. Üniversiteler, TRT, Barolar ve Belediyeler ise ayrı kamu tüzel kişiliğine sahiptir.',
  'Bakanlıkların ayrı tüzel kişiliği YOKTUR; hepsi tek bir Devlet Tüzel Kişiliği''nin kollarıdır.',
  17
);

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
  'İdare Hukuku',
  'multiple_choice',
  2,
  'Köyde imece usulü ile tüm köylülerin ortaklaşa çalışarak köy yolunu veya çeşmesini yapması kuralının yanında; köy bütçesine katkı sağlamak amacıyla hane başına toplanan yerel vergi benzeri paraya ne ad verilir?',
  '{"options": ["Salma", "Öşür", "Haraç", "İltizam", "Cizye"], "correctIndex": 0}'::jsonb,
  'Köy Kanunu''na göre köyün zorunlu ortak harcamalarını karşılamak üzere İhtiyar Meclisi kararıyla hane reislerinin gelirine göre salınan yerel paraya ''Salma'' denir. Bedenen çalışmaya ise ''İmece'' denir.',
  'Bedenle çalışma = İmece; Parayla katkı = Salma. Köy idaresinin iki özgün aracıdır.',
  18
);

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
  'İdare Hukuku',
  'multiple_choice',
  2,
  'İçişleri Bakanlığı, Cumhurbaşkanlığı Kararnameleri ve Yönetmelikler çıkarabilen idari düzenleyici işlemler tesis eder.

Cumhurbaşkanı, bakanlıklar ve kamu tüzel kişilerinin kendi görev alanlarını ilgilendiren kanun ve Cumhurbaşkanlığı kararnamelerinin uygulanmasını sağlamak üzere çıkardıkları düzenleyici işlem hangisidir?',
  '{"options": ["Yönetmelik", "Kanun Hükmünde Kararname", "Tüzük", "Yasa Gücünde Karar", "İçtihadı Birleştirme Kararı"], "correctIndex": 0}'::jsonb,
  'Anayasa m. 124 gereğince Cumhurbaşkanı, bakanlıklar ve kamu tüzel kişileri görev alanlarını ilgilendiren kanunların uygulanmasını göstermek üzere ''Yönetmelik'' çıkarabilirler. Tüzük ve KHK 2017''de yürürlükten kalkmıştır.',
  'Tüzük ve KHK artık yoktur! Güncel düzenleyici işlemler: CBK ve Yönetmeliktir.',
  19
);

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
  'İdare Hukuku',
  'multiple_choice',
  2,
  'Aşağıdakilerden hangisi Cumhurbaşkanlığı teşkilatında ''idari vesayet'' yetkisine bir örnektir?',
  '{"options": ["İçişleri Bakanı''nın Emniyet Genel Müdürü''nü denetlemesi", "Vali''nin İl Milli Eğitim Müdürü''ne talimat vermesi", "Çevre, Şehircilik ve İklim Değişikliği Bakanlığı''nın bir ilçe belediyesinin imar planını denetlemesi", "Kaymakamın İlçe Nüfus Müdürü''nün sicilini doldurması", "Sağlık Bakanı''nın Başhekimi görevden alması"], "correctIndex": 2}'::jsonb,
  'Bakanlık devlet tüzel kişiliğidir; belediye ise ayrı bir mahalli kamu tüzel kişiliğidir. Bakanlığın belediyeyi denetlemesi iki ayrı tüzel kişilik arasında olduğu için ''idari vesayet''tir. Diğer tüm şıklar aynı çatı altındaki ''hiyerarşi''dir.',
  'Devletin belediyeyi veya üniversiteyi denetlemesi = Vesayet; Devletin kendi müdürünü denetlemesi = Hiyerarşi.',
  20
);

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
  'İdare Hukuku',
  'multiple_choice',
  2,
  'İdarenin tek taraflı irade beyanıyla ilgililerin rızası aranmaksızın hukuki sonuç doğuran, uygulanabilir ve hukuka uygun olduğu varsayılan işlemlerine ''İdari İşlem'' denir.

Aşağıdakilerden hangisi idari işlemlerin temel özelliklerinden biri DEĞİLDİR?',
  '{"options": ["Tek yanlı olması (karşı tarafın kabulüne bağlı olmaması)", "İcrai (yürütülebilir) olması", "Hukuka uygunluk karinesinden yararlanması (mahkemece iptal edilene kadar geçerli sayılması)", "Kamu gücüne dayanması", "İki tarafın karşılıklı rızası ve irade uyuşmasıyla doğması"], "correctIndex": 4}'::jsonb,
  'İdari işlemler tek yanlıdır, kamu gücüne dayanır, doğrudan uygulanabilir (icrailik) ve mahkemece aksi ispatlanıp iptal edilene kadar hukuka uygun kabul edilir (hukuka uygunluk karinesi). İki tarafın karşılıklı rızası ve irade uyuşması idari sözleşmelerde söz konusudur; tek taraflı idari işlemlerde muhatabın rızası aranmaz.',
  'İdari işlemler tek yanlıdır; muhatabın rızası veya onayı şart değildir (örneğin kamulaştırma, vergi cezası, memur tayini).',
  21
);

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
  'İdare Hukuku',
  'multiple_choice',
  2,
  'İdare ile özel kişiler arasında kamu hizmetlerinin gördürülmesi amacıyla akdedilen ''Kamu Hizmeti İmtiyaz Sözleşmeleri'' imzalanmadan önce Anayasa gereği düşüncesi alınması zorunlu olan yüksek yargı organı aşağıdakilerden hangisidir?',
  '{"options": ["Yargıtay", "Danıştay", "Sayıştay", "Anayasa Mahkemesi", "Uyuşmazlık Mahkemesi"], "correctIndex": 1}'::jsonb,
  'Anayasa m. 155 uyarınca kamu hizmetleri ile ilgili imtiyaz şartlaşma ve sözleşmeleri hakkında DANIŞTAY''ın iki ay içinde düşüncesini bildirmesi zorunludur.',
  'ÖSYM bu soruda Danıştay ile Sayıştay''ı karşı karşıya getirir. Sayıştay mali denetim yapar; imtiyaz sözleşmelerinde istişari düşünce bildiren yüksek yargı mercii DANIŞTAY''dır (inceleme süresi en fazla 2 aydır).',
  22
);

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
  'İdare Hukuku',
  'multiple_choice',
  2,
  '2942 sayılı Kamulaştırma Kanunu''na göre idare ile taşınmaz sahibi arasında uzlaşma sağlanamaması halinde, kamulaştırma bedelinin tespiti ve taşınmazın idare adına tescili için açılacak dava hangi mahkemede görülür?',
  '{"options": ["İdare Mahkemesi", "Vergi Mahkemesi", "Asliye Hukuk Mahkemesi", "Danıştay", "Sulh Hukuk Mahkemesi"], "correctIndex": 2}'::jsonb,
  'Kamulaştırmada ''bedel tespiti ve tescil'' davası adli yargı kolunda yer alan ASLİYE HUKUK MAHKEMESİ''nde görülür. Kamulaştırma işleminin kamu yararına veya hukuka aykırılığı nedeniyle işlemin kendisine karşı açılacak iptal davası ise idari yargıda (İdare Mahkemesi) açılır.',
  'En klasik ÖSYM çeldiricisidir: Kamulaştırma idari bir işlem olsa da, BEDEL TESPİTİ ve TESCİL davası adli mahkeme olan Asliye Hukuk Mahkemesi''nde görülür!',
  23
);

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
  'İdare Hukuku',
  'multiple_choice',
  2,
  'İdari yargılama hukukunda; hukuka aykırı bir idari işlemin geçmişe etkili olarak hukuk aleminden kaldırılmasını talep eden davaya ne ad verilir?',
  '{"options": ["Tam Yargı Davası", "İptal Davası", "Menfi Tespit Davası", "İstirdat Davası", "Tasfiye Davası"], "correctIndex": 1}'::jsonb,
  'İptal davası; idari işlemlerin yetki, şekil, sebep, konu ve maksat yönlerinden hukuka aykırı olduklarından dolayı menfaatleri ihlal edilenler tarafından açılan ve işlemin iptalini (hukuk düzeninden kaldırılmasını) sağlayan davadır. Bir zararın giderilmesi veya tazminat talebi ise ''Tam Yargı Davası'' ile istenir.',
  'İptal Davası = İşlemin ortadan kaldırılması (hukuka aykırılık); Tam Yargı Davası = Maddi veya manevi tazminat (zararın ödenmesi).',
  24
);

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
  'İdare Hukuku',
  'multiple_choice',
  2,
  '657 sayılı Devlet Memurları Kanunu''na göre disiplin amirleri veya kurulları tarafından memura bir disiplin cezası verilebilmesi için, memura savunmasını yapması amacıyla EN AZ kaç günlük süre tanınması zorunludur?',
  '{"options": ["3 gün", "7 gün", "10 gün", "15 gün", "30 gün"], "correctIndex": 1}'::jsonb,
  '657 sayılı DMK m. 130 uyarınca devlet memuru hakkında savunması alınmadan disiplin cezası verilemez. Soruşturmayı yapan veya yetkili disiplin amiri memura savunmasını yapması için EN AZ 7 GÜN süre tanımak zorundadır. Bu süre verilmeden ceza tesis edilirse işlem şekil yönünden iptal edilir.',
  'Disiplin savunma süresi kanunda açıkça EN AZ 7 GÜN olarak belirlenmiştir. 10 veya 15 gün çeldiricilerine dikkat edilmelidir.',
  25
);

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
  'İdare Hukuku',
  'multiple_choice',
  2,
  '657 sayılı Devlet Memurları Kanunu''na göre hizmet süresi 1 yıldan 10 yıla kadar (10 yıl dahil) olan bir devlet memurunun yıllık izin süresi kaç gündür?',
  '{"options": ["15 gün", "20 gün", "25 gün", "30 gün", "45 gün"], "correctIndex": 1}'::jsonb,
  '657 sayılı DMK m. 102 uyarınca memurların yıllık izin süresi: Hizmeti 1 yıldan 10 yıla kadar olanlar için 20 GÜN; hizmeti 10 yıldan fazla olanlar için ise 30 GÜNDÜR.',
  '1-10 yıl arası = 20 gün; 10 yılı aşan memurlar = 30 gün izin hakkına sahiptir. 15 gün çeldiricisi iş kanunundaki işçilerle karıştırılmamalıdır.',
  26
);

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
  'İdare Hukuku',
  'multiple_choice',
  2,
  '657 sayılı Devlet Memurları Kanunu''nda düzenlenen mazeret izinleri kapsamında; eşi doğum yapan erkek memura isteği üzerine kaç gün babalık izni verilir?',
  '{"options": ["3 gün", "5 gün", "7 gün", "10 gün", "15 gün"], "correctIndex": 3}'::jsonb,
  '657 sayılı DMK m. 104/B uyarınca memura eşinin doğum yapması halinde isteği üzerine 10 GÜN babalık izni verilir. Evlilik, kendisinin veya çocuğunun evlenmesi, eşinin, çocuğunun, anne-babasının veya kardeşinin vefatı halinde ise 7 gün izin verilir.',
  'Babalık izni 10 gündür! Evlilik ve ölüm izinleri ise 7 gündür. Bu iki süre ÖSYM tarafından sıkça yer değiştirilerek sorulur.',
  27
);

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
  'İdare Hukuku',
  'multiple_choice',
  2,
  'Türk Hukukunda Normlar Hiyerarşisi değerlendirildiğinde aşağıdakilerden hangisi idarenin düzenleyici işlemleri arasında yer alıp Cumhurbaşkanlığı Kararnameleri ve Kanunların altında, yönetmeliklerin ise altında veya yürütülmesine dair talimat niteliğinde yer alan adsız düzenleyici işlemlerden biridir?',
  '{"options": ["Genelge (Tamim)", "Uluslararası Andlaşma", "Temel Haklara İlişkin Kanun", "Olağanüstü Hal Cumhurbaşkanlığı Kararnamesi", "Anayasa Değişikliği"], "correctIndex": 0}'::jsonb,
  'Normlar Hiyerarşisinde sıra: Anayasa > Kanun/Uluslararası Andlaşma/Olağanüstü Hal CBK > Olağan CBK > Yönetmelik > Adsız Düzenleyici İşlemler (Genelge, Yönerge, Sirküler, Tebliğ). Genelge (tamim), yönetmelik ve kanunların ast makamlara nasıl uygulanacağını gösteren düzenleyici idari işlemlerdir.',
  'Genelgeler (tamim/sirküler), normlar piramidinde yönetmeliklerin de altında yer alan idari düzenlemelerdir.',
  28
);

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
  'İdare Hukuku',
  'multiple_choice',
  2,
  'İl idaresinde Vali ile İl İdare Şube Başkanları (örneğin İl Defterdarı, İl Milli Eğitim Müdürü, İl Sağlık Müdürü) arasındaki hukuki denetim ilişkisi aşağıdakilerden hangisidir?',
  '{"options": ["İdari Vesayet", "Hiyerarşi", "Yargısal Denetim", "İstişari Yetki", "Özerklik İlişkisi"], "correctIndex": 1}'::jsonb,
  'Vali de il idare şube başkanları da aynı kamu tüzel kişiliği olan ''Devlet Tüzel Kişiliği'' çatısı altındadır. Aynı kamu tüzel kişiliği içindeki ast-üst emir, talimat, sicil ve denetim ilişkisine ''HİYERARŞİ'' denir.',
  'Aynı kamu tüzel kişiliği içindeysen HİYERARŞİ; iki ayrı kamu tüzel kişiliği arasındaysan (Devletin Belediyeyi veya Üniversiteyi denetlemesi gibi) İDARİ VESAYET olur.',
  29
);

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
  'İdare Hukuku',
  'multiple_choice',
  2,
  'Anayasa''nın 127. maddesine göre görevleri sebebiyle haklarında soruşturma veya kovuşturma açılan mahalli idare organlarını veya bu organların üyelerini, kesin hükme kadar GEÇİCİ BİR TEDBİR olarak görevden uzaklaştırmaya yetkili makam aşağıdakilerden hangisidir?',
  '{"options": ["Danıştay", "Vali", "İçişleri Bakanı", "Cumhurbaşkanı", "İdare Mahkemesi"], "correctIndex": 2}'::jsonb,
  'Anayasa m. 127/4 uyarınca görevleri ile ilgili bir suç sebebi ile hakkında soruşturma veya kovuşturma açılan mahalli idare organlarını veya bu organların üyelerini, kesin hükme kadar bir tedbir olarak, İÇİŞLERİ BAKANI görevden uzaklaştırabilir. Organlık sıfatının KESİN olarak sona erdirilmesine ise ancak DANIŞTAY karar verebilir.',
  'ÖSYM''nin efsane tuzağı: GEÇİCİ olarak görevden uzaklaştıran = İÇİŞLERİ BAKANI; Organlık sıfatına KESİN olarak son veren = DANIŞTAY''dır!',
  30
);

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
  'İdare Hukuku',
  'multiple_choice',
  3,
  'Büyükşehir belediyesi bulunan bir ilde aşağıdakilerden hangisi KANUNEN MEVCUTTUR?',
  '{"options": ["İl Özel İdaresi", "Köy Tüzel Kişiliği", "Bucak Teşkilatı", "Yatırım İzleme ve Koordinasyon Başkanlığı (YİKOB)", "Köy Derneği"], "correctIndex": 3}'::jsonb,
  '6360 sayılı Kanun uyarınca 30 büyükşehir olan ilde İl Özel İdareleri, köyler ve beldeler kapatılmıştır. İl Özel İdaresi''nin kapatılmasıyla doğan kamu yatırımlarını yürütmek üzere valilik bünyesinde ''Yatırım İzleme ve Koordinasyon Başkanlığı'' (YİKOB) kurulmuştur.',
  'Büyükşehir olan 30 ilde İl Özel İdaresi ve Köy YOKTUR! Onların yerine valiliğe bağlı YİKOB vardır.',
  31
);

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
  'İdare Hukuku',
  'multiple_choice',
  3,
  'İdari işlemlerin unsurları (Yetki, Şekil, Sebep, Konu, Amaç) değerlendirildiğinde bütün idari işlemlerin ''Amaç (Maksat)'' unsuru istisnasız her zaman aşağıdakilerden hangisidir?',
  '{"options": ["Devlete gelir sağlamak", "Kamu Yararı", "Kamu görevlilerini korumak", "Yargı yükünü azaltmak", "Özel sektörü desteklemek"], "correctIndex": 1}'::jsonb,
  'İdare hukukunda amaç unsuru tektir, geneldir ve değişmez: KAMU YARARI''dır. Bir idari işlem kamu yararı dışında kişisel intikam, siyasi kayırma veya zümre menfaati amacıyla yapılırsa ''yetki saptırması'' sebebiyle amaç yönünden sakatlanır ve iptal edilir.',
  'Tüm idari işlemlerin değişmez ve tek meşru amacı Kamu Yararıdır; başka bir amaç güdülemez.',
  32
);

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
  'İdare Hukuku',
  'multiple_choice',
  3,
  'İdarenin hukuki sorumluluğunda uygulanan ''Kusursuz Sorumluluk'' halleri arasında aşağıdakilerden hangisi yer alır?',
  '{"options": ["İdarenin hizmet kusuru (hizmetin geç, kötü işlemesi veya hiç işlememesi)", "Risk (Tehlike) İlkesi ve Kamu Külfetleri Karşısında Eşitlik (Fedakarlığın Denkleştirilmesi) İlkesi", "Memurun kişisel kastı", "Mücbir sebep (deprem, sel gibi önüne geçilemez doğa olayları)", "Zarar görenin kendi ağır kusuru"], "correctIndex": 1}'::jsonb,
  'Kusursuz sorumlulukta idarenin bir hatası veya kusuru olmasa dahi meydana gelen zararı ödeme yükümlülüğü vardır. Bu sorumluluk iki ilkeye dayanır: 1) Risk (tehlike) ilkesi (idarenin tehlikeli faaliyetleri: mühimmat deposu patlaması vb.), 2) Kamu külfetleri karşısında eşitlik ilkesi (toplum için yapılan köprünün tek bir dükkanın önünü kapatıp batırması).',
  'Hizmet kusuru kusurlu sorumluluktur; Risk ve Fedakarlığın Denkleştirilmesi ise KUSURSUZ sorumluluk ilkeleridir.',
  33
);

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
  'İdare Hukuku',
  'multiple_choice',
  3,
  'Kamu düzenini korumakla görevli olan ''İdari Kolluk'' ile suç işlendikten sonra failleri yakalayan ''Adli Kolluk'' arasındaki temel fark aşağıdakilerden hangisidir?',
  '{"options": ["İdari kolluk adliye mahkemelerine bağlıdır, adli kolluk valiye bağlıdır.", "İdari kolluk suç işlenmesini ÖNLEYİCİ niteliktedir ve idari amirlere bağlıdır; adli kolluk ise suç işlendikten sonra delil toplayıp failleri adalete teslim eder ve CUMHURİYET SAVCISINA bağlıdır.", "İdari kolluk silah taşıyamaz, adli kolluk taşır.", "Adli kolluk sadece köylerde görev yapar.", "İdari kolluğun tüm işlemlerine karşı yargı yolu kapalıdır."], "correctIndex": 1}'::jsonb,
  'İdari kolluk henüz suç işlenmeden kamu düzenini korumak için önleyici tedbir alır (Vali, Kaymakam, polis devriyesi). Adli kolluk ise bir suç işlendikten sonra ceza muhakemesi için devreye girer ve doğrudan Cumhuriyet Savcısı''nın emri altında çalışır.',
  'İdari kolluk = Suç öncesi / İdari amir; Adli kolluk = Suç sonrası / Cumhuriyet Savcısı!',
  34
);

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
  'İdare Hukuku',
  'multiple_choice',
  3,
  'Türkiye''de Kamu İktisadi Teşebbüsleri (KİT); İktisadi Devlet Teşekkülleri (İDT) ve Kamu İktisadi Kuruluşları (KİK) olmak üzere ikiye ayrılır.

İDT ile KİK arasındaki temel ayrım kriteri aşağıdakilerden hangisidir?',
  '{"options": ["İDT''lerin kar amacı gütmesi ve ticari esaslara göre çalışması; KİK''lerin ise kamu hizmeti ve tekel niteliğindeki imtiyazlı kamu mallarını üretmesi ve kar amacı gütmemesi", "İDT''lerin özel sektöre ait olması", "KİK''lerin sadece yabancı ortaklıkla kurulması", "İDT''lerin Sayıştay denetimine tabi olmaması", "KİK''lerin iflas edebilmesi"], "correctIndex": 0}'::jsonb,
  '233 sayılı KHK uyarınca: Sermayesinin tamamı devlete ait olup iktisadi alanda ticari esaslara göre çalışan ve KAR AMACI güden KİT''lere İktisadi Devlet Teşekkülü (İDT - örn. ÇAYKUR, BOTAŞ); tekel niteliğindeki kamu hizmeti gören ve kar amacı öncelikli olmayan KİT''lere ise Kamu İktisadi Kuruluşu (KİK - örn. TCDD, DHMİ) denir.',
  'İDT = Ticari / Kar amaçlı; KİK = Tekel / Kamu hizmeti odaklı.',
  35
);

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
  'İdare Hukuku',
  'multiple_choice',
  3,
  'İdari yargıda dava açma süreleri genel kural olarak İdare Mahkemelerinde ve Danıştay''da kaç gündür?',
  '{"options": ["İdare Mahkemelerinde 30 gün — Danıştay''da 30 gün", "İdare Mahkemelerinde 60 gün — Vergi Mahkemelerinde 30 gün (Danıştay''da ilk derece 60 gün)", "Her mahkemede 15 gün", "İdare mahkemesinde 90 gün", "Süre sınırı yoktur"], "correctIndex": 1}'::jsonb,
  '2577 sayılı İdari Yargılama Usulü Kanunu (İYUK) m. 7 uyarınca dava açma süresi özel kanunlarda ayrı süre gösterilmemişse Danıştay''da ve İdare Mahkemelerinde 60 GÜN, Vergi Mahkemelerinde ise 30 GÜNDÜR.',
  'İdare Mahkemesi ve Danıştay = 60 gün; Vergi Mahkemesi = 30 gündür!',
  36
);

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
  'İdare Hukuku',
  'multiple_choice',
  3,
  'İdarenin mal edinme yöntemlerinden ''Kamulaştırma'' ile ''İstimval'' arasındaki temel fark aşağıdakilerden hangisidir?',
  '{"options": ["Kamulaştırma taşınmazlar içindir; İstimval ise savaş veya olağanüstü hallerde idarenin kişilere ait TAŞINIR mallara veya çalışma gücüne el koymasıdır.", "Kamulaştırmada bedel ödenmez, istimvalde peşin ödenir.", "İstimval belediyeler tarafından park yapmak için uygulanır.", "Kamulaştırma sadece askeri dönemde yapılır.", "İkisi tamamen aynı kavramdır."], "correctIndex": 0}'::jsonb,
  'Kamulaştırma olağan dönemde kamu yararı için taşınmaz (arsa/arazi) mülkiyetinin alınmasıdır. İstimval ise seferberlik, savaş veya olağanüstü afet hallerinde devletin özel kişilere ait kamyon, iş makinesi gibi TAŞINIR mallara el koyması veya kişileri ücretiyle çalıştırmasıdır.',
  'Taşınmaz = Kamulaştırma; Taşınır ve çalışma gücü (OHAL/Savaşta) = İstimval.',
  37
);

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
  'İdare Hukuku',
  'multiple_choice',
  3,
  'Memurluk statüsünü sona erdiren haller değerlendirildiğinde aşağıdakilerden hangisi memurluğu kendiliğinden veya doğrudan sona erdiren durumlardan biri değildir?',
  '{"options": ["Ölüm", "Emeklilik", "Memurluk şartlarından birini (örneğin kasten işlenen suçtan 1 yıl hapis alarak) sonradan kaybetme", "Görevden uzaklaştırma tedbiri uygulanması", "Çekilme (İstifa) veya çekilmiş sayılma (müstafi sayılma)"], "correctIndex": 3}'::jsonb,
  'Görevden uzaklaştırma memurluğu sona erdirmez; maaşının 2/3''ünü almaya devam eder ve soruşturma sonucunda suçsuz bulunursa görevine iade edilir. Ölüm, istifa, emeklilik ve şartların kaybı ise memuriyeti tamamen bitirir.',
  'Görevden uzaklaştırılan kişi halen memurdur; kadrosu ve memuriyet bağı devam eder.',
  38
);

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
  'İdare Hukuku',
  'multiple_choice',
  3,
  'Cumhurbaşkanı, bakanlıklar ve kamu tüzel kişileri tarafından çıkarılan yönetmeliklerin Resmî Gazete''de yayımlanma kuralı aşağıdakilerden hangisinde doğru ifade edilmiştir?',
  '{"options": ["Bütün yönetmelikler istisnasız Resmî Gazete''de yayımlanmak zorundadır.", "Hiçbir yönetmelik Resmî Gazete''de yayımlanmaz.", "Hangi yönetmeliklerin Resmî Gazete''de yayımlanacağı kanunla belirtilir; kural olarak kamu personelini ilgilendiren ve milli çapta uygulanan yönetmelikler yayımlanır, mahalli veya dar kapsamlı olanlar yerel duyuru ile ilan edilir.", "Yalnızca belediye yönetmelikleri yayımlanır.", "Yönetmelikler sadece TRT''de okunarak yürürlüğe girer."], "correctIndex": 2}'::jsonb,
  'Anayasa m. 124/2 uyarınca hangi yönetmeliklerin Resmî Gazete''de yayımlanacağı kanunda belirtilir. Ülke çapında uygulanacak ve genel düzenleme getiren yönetmelikler Resmî Gazete''de yayımlanır; yerel bir belediyenin veya üniversitenin iç yönetmeliği yerel ilan panolarıyla duyurulabilir.',
  'Bütün yönetmeliklerin Resmi Gazete''de yayımlanma zorunluluğu YOKTUR; hangilerinin yayımlanacağını kanun belirler.',
  39
);

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
  'İdare Hukuku',
  'multiple_choice',
  3,
  'İl Genel İdaresi bünyesinde yer alan ''İl İdare Kurulu'' kimlerden oluşur?',
  '{"options": ["Vali başkanlığında; Hukuk İşleri Müdürü, Defterdar, İl Milli Eğitim, İl Sağlık, İl Tarım ve Orman müdürleri", "Vali, Belediye Başkanı ve Garnizon Komutanı", "Kaymakamlar ve Muhtarlar", "Yalnızca İl Genel Meclisi üyeleri", "İl Emniyet Müdürü ve Cumhuriyet Başsavcısı"], "correctIndex": 0}'::jsonb,
  'İl İdare Kurulu; Valinin başkanlığında Hukuk İşleri Müdürü, Defterdar, İl Milli Eğitim Müdürü, İl Sağlık Müdürü, İl Tarım ve Orman Müdürü ile Çevre ve Şehircilik Müdüründen oluşur. Belediye başkanı veya askerler bu kurulda yer almaz.',
  'İl İdare Kurulu''nda Belediye Başkanı veya Garnizon Komutanı KESİNLİKLE YOKTUR! Tamamen merkezi idarenin il müdürlerinden oluşur.',
  40
);

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
  'İdare Hukuku',
  'multiple_choice',
  2,
  '657 sayılı Devlet Memurları Kanunu''na göre ilk defa veya naklen bir göreve atanan memurların göreve başlama süreleri değerlendirildiğinde; aynı belediye ve il sınırları içindeki bir göreve atananlar ile başka bir yerdeki göreve atananların işe başlama süreleri hangi seçenekte doğru verilmiştir?',
  '{"options": ["Aynı yerdeki göreve tebliğ gününü izleyen iş günü — Başka yerdeki göreve tebliğden itibaren 15 gün içinde", "Aynı yerdeki göreve 3 gün içinde — Başka yerdeki göreve 30 gün içinde", "Her iki göreve de derhal aynı gün", "Aynı yerdeki göreve 7 gün — Başka yerdeki göreve 1 ay içinde", "Aynı yerdeki göreve 15 gün — Başka yerdeki göreve 45 gün içinde"], "correctIndex": 0}'::jsonb,
  '657 sayılı DMK m. 62 uyarınca: Aynı yerdeki göreve atananlar atama emrinin kendilerine tebliğ gününü İZLEYEN İŞ GÜNÜ içinde; başka yerdeki göreve atananlar ise tebliğ tarihinden itibaren 15 GÜN İÇERİSİNDE o yere hareket ederek işe başlamak zorundadır.',
  'ÖSYM''nin en klasik memurluk süresi sorusudur: Aynı yer = Ertesi iş günü; Başka yer = 15 GÜN!',
  41
);

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
  'İdare Hukuku',
  'multiple_choice',
  2,
  '657 sayılı Devlet Memurları Kanunu''na göre bir devlet memuru mazeretsiz ve kesintisiz olarak EN AZ kaç gün görevini terk ederse çekilme (istifa) isteğinde bulunmuş sayılır (müstafi sayılır)?',
  '{"options": ["3 gün", "5 gün", "7 gün", "10 gün", "20 gün"], "correctIndex": 3}'::jsonb,
  '657 sayılı DMK m. 94 uyarınca: Mezuniyetsiz veya kurumunca kabul edilen mazereti olmaksızın görevin terk edilmesi ve bu terkin KESİNTİSİZ 10 GÜN devam etmesi halinde, yazılı müracaat şartı aranmaksızın memur çekilmiş (müstafi) sayılır.',
  'Kesintisiz 10 gün işe gelmeyen memur müstafi sayılır ve 1 yıl süreyle memurluğa geri dönemez.',
  42
);

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
  'İdare Hukuku',
  'multiple_choice',
  2,
  '657 sayılı Devlet Memurları Kanunu''na göre devlet memurluğuna yeni giren bir kişinin ''Aday Memurluk'' süresi en az ve en çok kaç yıl olabilir?',
  '{"options": ["En az 6 ay — En çok 1 yıl", "En az 1 yıl — En çok 2 yıl", "En az 1 yıl — En çok 3 yıl", "En az 2 yıl — En çok 4 yıl", "Sabit 1 yıldır, uzatılamaz."], "correctIndex": 1}'::jsonb,
  '657 sayılı DMK m. 54 uyarınca: Adaylık süresi EN AZ 1 YIL, EN ÇOK 2 YILDIR ve bu süre içinde aday memurun başka kurumlara nakli yapılamaz.',
  'Aday memurluk süresi EN AZ 1 YIL, EN ÇOK 2 YILDIR! 6 ay veya 3 yıl şıkları çeldiricidir.',
  43
);

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
  'İdare Hukuku',
  'multiple_choice',
  2,
  '657 sayılı Devlet Memurları Kanunu''nda düzenlenen disiplin cezalarından ''Devlet Memurluğundan Çıkarma'' cezasını vermeye yetkili makam aşağıdakilerden hangisidir?',
  '{"options": ["Disiplin Amiri", "Atamaya Yetkili Amir", "Yüksek Disiplin Kurulu", "Vali", "Cumhuriyet Başsavcısı"], "correctIndex": 2}'::jsonb,
  'Uyarma, kınama ve aylıktan kesme cezalarını disiplin amirleri; kademe ilerlemesinin durdurulmasını il disiplin kurulu kararıyla atamaya yetkili amir; MEMURLUKTAN ÇIKARMA cezasını ise amirin teklifi üzerine amirin bağlı olduğu kurumun YÜKSEK DİSİPLİN KURULU verir.',
  'Disiplin amiri tek başına memurluktan ihraç kararı veremez; çıkarma cezasını sadece YÜKSEK DİSİPLİN KURULU verebilir.',
  44
);

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
  'İdare Hukuku',
  'multiple_choice',
  2,
  'Türkiye''de bir yerleşim yerinde Köy İdaresi''nin kurulabilmesi için nüfusun hangi aralıkta olması gerekir ve köy tüzel kişiliği hangi makamın kararı ile kurulur?',
  '{"options": ["Nüfusu 150 ile 2.000 arasında olmalı — İçişleri Bakanlığı kararı ile kurulur.", "Nüfusu 500 ile 5.000 arasında olmalı — Çevre ve Şehircilik Bakanlığı kararı ile kurulur.", "Nüfusu 1.000 ile 2.000 arasında olmalı — Vali kararı ile kurulur.", "Nüfusu 2.000 ile 10.000 arasında olmalı — Kanunla kurulur.", "Nüfusu en az 5.000 olmalı — Cumhurbaşkanı kararı ile kurulur."], "correctIndex": 0}'::jsonb,
  'Köy Kanunu m. 1: Nüfusu 2.000''den aşağı olan yerlere köy denir (en alt sınır teamülen 150''dir). Köy tüzel kişiliği İÇİŞLERİ BAKANLIĞI kararı ile kurulur.',
  'Belediye Cumhurbaşkanı kararıyla (en az 5.000 nüfus); Köy ise İÇİŞLERİ BAKANLIĞI kararıyla (150 - 2.000 nüfus) kurulur.',
  45
);

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
  'İdare Hukuku',
  'multiple_choice',
  2,
  'Köy İdaresi''nin zorunlu organlarından olan ''Köy İhtiyar Meclisi''nin doğal (tabii) üyeleri hangi seçenekte doğru verilmiştir?',
  '{"options": ["Köy İmamı ve Köy Öğretmeni", "Köy Korucusu ve Ziraat Mühendisi", "Köy Muhtarı ve En yaşlı köylü", "Köy Çobanı ve Sağlık Memuru", "Karakol Komutanı ve Bakkal"], "correctIndex": 0}'::jsonb,
  'Köy İhtiyar Meclisi seçimle gelen üyelerin yanında iki daimi ve doğal (tabii) üyeye sahiptir: KÖY İMAMI ve KÖY ÖĞRETMENİ (varsa). Bu kişiler seçime girmeden mecliste yer alır.',
  'Köy ihtiyar heyetinin doğal üyeleri İMAM ve ÖĞRETMENDİR.',
  46
);

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
  'İdare Hukuku',
  'multiple_choice',
  2,
  '5393 sayılı Belediye Kanunu''na göre bir yerleşim yerinde Belediye kurulabilmesi için nüfusun EN AZ kaç olması gerekir ve belediye hangi idari işlemle kurulur?',
  '{"options": ["Nüfusu en az 5.000 olmalı — Cumhurbaşkanı Kararı ile kurulur.", "Nüfusu en az 2.000 olmalı — İçişleri Bakanlığı kararı ile kurulur.", "Nüfusu en az 10.000 olmalı — Kanunla kurulur.", "Nüfusu en az 50.000 olmalı — Vali onayı ile kurulur.", "Nüfusu en az 750.000 olmalı — Cumhurbaşkanlığı Kararnamesi ile kurulur."], "correctIndex": 0}'::jsonb,
  'Belediye kurulması için nüfusun en az 5.000 olması şarttır ve belediye CUMHURBAŞKANI KARARI ile kurulur. (İl ve ilçe merkezlerinde nüfus şartı aranmaksızın belediye kurulur).',
  'Belediye CUMHURBAŞKANI KARARIYLA (en az 5 bin nüfus); Büyükşehir belediyesi ise KANUNLA (en az 750 bin nüfus) kurulur!',
  47
);

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
  'İdare Hukuku',
  'multiple_choice',
  2,
  '5216 sayılı Büyükşehir Belediyesi Kanunu''na göre bir ilde Büyükşehir Belediyesi kurulabilmesi için toplam nüfusun en az kaç olması gerekir ve ne ile kurulur?',
  '{"options": ["Toplam il nüfusu en az 750.000 olmalı — KANUNLA kurulur.", "Toplam il nüfusu en az 500.000 olmalı — Cumhurbaşkanı Kararı ile kurulur.", "Toplam il nüfusu en az 1.000.000 olmalı — İçişleri Bakanlığı kararı ile kurulur.", "Toplam il nüfusu en az 250.000 olmalı — Kanunla kurulur.", "Nüfus şartı yoktur, TBMM kararıyla kurulur."], "correctIndex": 0}'::jsonb,
  'Büyükşehir belediyesi kurulması için toplam nüfusun EN AZ 750.000 olması ve münhasıran KANUNLA kurulması anayasal ve yasal zorunluluktur. Türkiye''de 30 büyükşehir belediyesi mevcuttur.',
  'Büyükşehir belediyesi Cumhurbaşkanı kararıyla KURULAMAZ; mutlaka TBMM tarafından çıkarılan KANUNLA kurulur!',
  48
);

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
  'İdare Hukuku',
  'multiple_choice',
  2,
  'Anayasa''nın 127. maddesine göre mahalli idare organlarından olan ''Belediye Meclisi'' veya ''İl Genel Meclisi''nin görevini yapamaz hale gelmesi durumunda feshine karar vermeye yetkili organ hangisidir?',
  '{"options": ["Vali", "İçişleri Bakanı", "Danıştay", "Anayasa Mahkemesi", "Bölge İdare Mahkemesi"], "correctIndex": 2}'::jsonb,
  'Yerel meclislerin (Belediye Meclisi veya İl Genel Meclisi) süresinden önce feshine ancak yüksek idare mahkemesi olan DANIŞTAY karar verebilir. İçişleri Bakanı sadece geçici olarak görevden uzaklaştırabilir.',
  'FESİH yetkisi yargısaldır ve DANIŞTAY''a aittir; İçişleri Bakanı feshedemez, sadece geçici uzaklaştırabilir.',
  49
);

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
  'İdare Hukuku',
  'multiple_choice',
  2,
  'Merkezi idarenin yerel yönetimler üzerindeki denetim aracı olan ''İdari Vesayet'' yetkisinin kapsamı ve sınırları değerlendirildiğinde aşağıdakilerden hangisi doğrudur?',
  '{"options": ["Vesayet makamı, vesayete tabi yerel idare organının yerine geçerek doğrudan onun adına karar alabilir.", "Vesayet makamı kural olarak yerel idarenin kararını yerindelik yönünden değiştiremez; kanunda açık yetki yoksa kararı ya onar, ya bozar (veya iptali için idari yargıya başvurur).", "Vesayet yetkisi hiyerarşik amirlik yetkisiyle tamamen aynıdır.", "Vesayet makamı belediye başkanına disiplin cezası olarak memurluktan çıkarma cezası verebilir.", "İdari vesayet Anayasa''da yer almayan teamüli bir yetkidir."], "correctIndex": 1}'::jsonb,
  'İdari vesayet istisnai bir yetkidir ve kanunla sınırlıdır. Vesayet makamı hiyerarşik amir gibi emir veremez veya belediye meclisinin kararını kafasına göre DEĞİŞTİREMEZ. Ya onaylar, ya reddeder ya da iptali için İdare Mahkemesine dava açar.',
  'Hiyerarşide değiştirme ve emir yetkisi vardır; İdari vesayette değiştirme yetkisi KURAL OLARAK YOKTUR!',
  50
);


-- -------------------------------------------------------------
-- KONU 6: ULUSLARARASI KURULUŞLAR
-- -------------------------------------------------------------

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
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  1,
  'Birleşmiş Milletler Güvenlik Konseyi''nde (BMGK) alınan kararları tek başına veto etme yetkisine sahip olan 5 daimi üye ülke aşağıdakilerin hangisinde eksiksiz verilmiştir?',
  '{"options": ["Türkiye, Almanya, Japonya, ABD, Fransa", "Fransa, İngiltere, Rusya, Çin, Amerika Birleşik Devletleri (FİRÇA)", "ABD, Rusya, Çin, Almanya, İtalya", "İngiltere, Fransa, Almanya, Rusya, Çin", "ABD, İngiltere, Kanada, Avustralya, Japonya"], "correctIndex": 1}'::jsonb,
  'BM Güvenlik Konseyi''nin 5 daimi üyesi ''FİRÇA'' şifresiyle hatırlanır: Fransa, İngiltere, Rusya, Çin ve ABD. Bu beş ülkeden birinin olumsuz oy kullanması (veto hakkı) durumunda karar tasarısı kabul edilemez.',
  'Almanya ve Japonya ekonomik güç olmalarına rağmen daimi üye DEĞİLDİR! Daimi üyeler II. Dünya Savaşı''nın galip devletleridir (FİRÇA).',
  1
);

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
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  1,
  'Türkiye''nin Kuzey Atlantik Antlaşması Örgütü''ne (NATO) tam üye olarak kabul edildiği yıl ve hangi ülkeyle birlikte katıldığı aşağıdakilerden hangisinde doğru verilmiştir?',
  '{"options": ["1949 — İtalya", "1952 — Yunanistan", "1955 — Almanya", "1960 — İspanya", "1945 — Fransa"], "correctIndex": 1}'::jsonb,
  'Türkiye, Kore Savaşı''na asker göndererek Batı bloğundaki yerini perçinlemiş ve 18 Şubat 1952 tarihinde Yunanistan ile birlikte NATO''ya resmen tam üye olmuştur.',
  'NATO 1949''da kurulmuştur; Türkiye ise kurucu üye değil, 1952''de Yunanistan ile birlikte katılan ilk genişleme üyesidir.',
  2
);

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
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  1,
  'Avrupa İnsan Hakları Mahkemesi (AİHM), hangi uluslararası kuruluşun yargı organı olarak görev yapmaktadır?',
  '{"options": ["Avrupa Birliği (AB)", "Avrupa Konseyi", "Birleşmiş Milletler (BM)", "Kuzey Atlantik İttifakı (NATO)", "Avrupa Güvenlik ve İşbirliği Teşkilatı (AGİT)"], "correctIndex": 1}'::jsonb,
  'AİHM, merkezi Strazburg''da bulunan ''Avrupa Konseyi''nin yargı organıdır. Avrupa Birliği''nin yargı organı ise Lüksemburg''daki ''Avrupa Birliği Adalet Divanı''dır (ABAD).',
  'AİHM Avrupa Birliği''nin değil, Türkiye''nin kurucusu olduğu AVRUPA KONSEYİ''nin mahkemesidir!',
  3
);

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
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  1,
  '2009 yılında Nahçıvan Anlaşması ile kurulan ve 2021 İstanbul Zirvesi''nde adını ''Türk Devletleri Teşkilatı'' (TDT) olarak değiştiren uluslararası örgütün genel merkezi hangi şehrimizdedir?',
  '{"options": ["Ankara", "İstanbul", "Bakü", "Taşkent", "Astana"], "correctIndex": 1}'::jsonb,
  'Türk Devletleri Teşkilatı''nın Genel Sekreterliği İstanbul''da bulunmaktadır.',
  'TDT''nin merkezi başkent Ankara değil, İstanbul''dur.',
  4
);

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
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  1,
  '1992 yılında Türkiye''nin öncülüğünde İstanbul''da kurulan ve Karadeniz havzasındaki ülkelerin ekonomik iş birliğini hedefleyen Karadeniz Ekonomik İşbirliği Teşkilatı''nın (KEİ) daimi sekreteryası hangi şehirdedir?',
  '{"options": ["Samsun", "Trabzon", "İstanbul", "Bükreş", "Moskova"], "correctIndex": 2}'::jsonb,
  'Karadeniz Ekonomik İşbirliği Teşkilatı (KEİ) 1992''de İstanbul Zirvesi ile kurulmuş olup Genel Sekreterliği İstanbul''da (İstinye) yer almaktadır.',
  'KEİ''nin merkezi Karadeniz kıyısındaki bir Karadeniz ili (Trabzon/Samsun) değil, Boğaz kenti İstanbul''dur.',
  5
);

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
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  1,
  'Birleşmiş Milletler''in eğitim, bilim ve kültür alanında dünya mirasını koruyan uzman kuruluşu aşağıdakilerden hangisidir?',
  '{"options": ["UNICEF", "UNESCO", "WHO", "FAO", "ILO"], "correctIndex": 1}'::jsonb,
  'UNESCO (Birleşmiş Milletler Eğitim, Bilim ve Kültür Örgütü), merkezi Paris''te bulunan ve Dünya Mirası Listesi''ni oluşturan kuruluştur. UNICEF çocuklara, WHO sağlığa, FAO gıda ve tarıma, ILO çalışma hayatına bakar.',
  'UNICEF çocuk fonudur; UNESCO ise bilim, kültür ve eğitim örgütüdür.',
  6
);

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
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  1,
  'İslam İşbirliği Teşkilatı (İİT), 1969 yılında hangi tarihi ve dini olayın ardından Fas''ın başkenti Rabat''ta toplanan zirve ile kurulmuştur?',
  '{"options": ["Körfez Savaşı''nın çıkması", "Kudüs''teki Mescid-i Aksa''nın bir fanatik tarafından kundaklanarak yakılması", "Sovyetler Birliği''nin Afganistan''ı işgali", "İran-Irak Savaşı''nın başlaması", "Kıbrıs Barış Harekatı"], "correctIndex": 1}'::jsonb,
  '21 Ağustos 1969''da Avustralyalı bir fanatik Yahudi''nin Kudüs''teki Mescid-i Aksa''yı kundaklaması İslam dünyasında büyük infial yaratmış ve Eylül 1969''da Rabat''ta İslam Zirvesi toplanarak İslam Konferansı Örgütü (bugünkü İİT) kurulmuştur. Merkezi Suudi Arabistan Cidde''dir.',
  'İİT''nin kuruluş kıvılcımı Mescid-i Aksa''nın kundaklanmasıdır; merkezi ise Cidde''dir.',
  7
);

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
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  1,
  'Gelişmekte olan sekiz Müslüman ülkenin ekonomik iş birliği için 1997 yılında Türkiye''nin öncülüğünde (Necmettin Erbakan) İstanbul''da kurulan uluslararası kuruluş hangisidir?',
  '{"options": ["G-20", "D-8 (Developing 8)", "OPEC", "KEİ", "ŞİÖ"], "correctIndex": 1}'::jsonb,
  'D-8 (Gelişen Sekiz Ülke); Türkiye, İran, Pakistan, Bangladeş, Malezya, Endonezya, Mısır ve Nijerya''dan oluşan ve genel sekreterliği İstanbul''da bulunan ekonomik örgüttür.',
  'D-8''in kurucusu Türkiye''dir ve merkezi İstanbul''dur. Üyeleri 8 büyük gelişmekte olan Müslüman devlettir.',
  8
);

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
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  1,
  'Kuzey Atlantik Antlaşması Örgütü''nün (NATO) genel idari merkezi ve karargahı hangi ülkede ve şehirde bulunmaktadır?',
  '{"options": ["ABD — Washington", "Fransa — Paris", "Belçika — Brüksel", "İsviçre — Cenevre", "Hollanda — Lahey"], "correctIndex": 2}'::jsonb,
  'NATO''nun genel siyasi ve idari merkezi Belçika''nın başkenti Brüksel''dedir. (AB kurumlarının da merkezi Brüksel''dir).',
  'NATO antlaşması Washington''da imzalanmıştır ancak karargahı Belçika Brüksel''dedir.',
  9
);

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
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  1,
  'Birleşmiş Milletler''in ana yargı organı olan ve devletler arasındaki hukuki uyuşmazlıkları karara bağlayan ''Uluslararası Adalet Divanı'' (UAD) hangi şehirde bulunmaktadır?',
  '{"options": ["New York (ABD)", "Cenevre (İsviçre)", "Lahey (Hollanda)", "Strazburg (Fransa)", "Viyana (Avusturya)"], "correctIndex": 2}'::jsonb,
  'BM''nin diğer tüm ana organları New York''ta bulunurken; tek istisna Uluslararası Adalet Divanı''dır (UAD). UAD Hollanda''nın Lahey (The Hague) kentindeki Barış Sarayı''nda görev yapar.',
  'BM ana organlarından merkezi New York''ta OLMAYAN tek organ Lahey''deki Uluslararası Adalet Divanı''dır.',
  10
);

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
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  'NATO''ya son yıllarda katılarak üye sayısını artıran en son iki üye devlet aşağıdakilerden hangisinde kronolojik sırasıyla doğru verilmiştir?',
  '{"options": ["Karadağ — Kuzey Makedonya", "Finlandiya (31. üye) — İsveç (32. üye)", "Ukrayna — Gürcistan", "İsveç — İsviçre", "Bosna-Hersek — Kosova"], "correctIndex": 1}'::jsonb,
  'Rusya-Ukrayna savaşı sonrası geleneksel tarafsızlık politikasını terk eden Finlandiya 2023 yılında NATO''nun 31. üyesi; İsveç ise 2024 yılında NATO''nun 32. üyesi olmuştur.',
  'Finlandiya 31. üye, İsveç ise 32. üyedir. İsviçre ve Avusturya NATO üyesi değildir.',
  11
);

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
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  '2022 yılında Özbekistan''ın Semerkant kentinde düzenlenen Türk Devletleri Teşkilatı (TDT) Liderler Zirvesi''nde teşkilata ''Gözlemci Üye'' olarak kabul edilen tarihi devlet hangisidir?',
  '{"options": ["Türkmenistan", "Macaristan", "Kuzey Kıbrıs Türk Cumhuriyeti (KKTC)", "Tacikistan", "Moğolistan"], "correctIndex": 2}'::jsonb,
  '11 Kasım 2022 Semerkant Zirvesi''nde Kuzey Kıbrıs Türk Cumhuriyeti (KKTC), anayasal adıyla Türk Devletleri Teşkilatı''na oy birliğiyle GÖZLEMCİ ÜYE olarak kabul edilmiştir (diplomatik bir dönüm noktasıdır).',
  'KKTC''nin TDT''ye gözlemci üye yapılması son yılların en önemli uluslararası siyasi kazanımıdır.',
  12
);

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
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  'Avrupa Birliği''nden (AB) halkoylaması (referandum) sonucu resmen ayrılarak ''Brexit'' sürecini tamamlayan ve birlikten ayrılan ilk tam üye ülke hangisidir?',
  '{"options": ["Norveç", "Birleşik Krallık (İngiltere)", "İsviçre", "İzlanda", "Danimarka"], "correctIndex": 1}'::jsonb,
  'Birleşik Krallık 2016 yılında yaptığı referandumla AB''den ayrılma kararı almış ve 31 Ocak 2020 tarihinde ''Brexit'' ile AB üyeliğinden resmen ayrılmıştır.',
  'Norveç ve İsviçre zaten hiçbir zaman AB üyesi olmamıştır; birlikten ayrılan tek ülke Birleşik Krallık''tır.',
  13
);

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
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  'İslam İşbirliği Teşkilatı''nın (İİT) tarihinde ilk kez bir Türk vatandaşı 2004-2014 yılları arasında Genel Sekreterlik görevini üstlenmiştir.

İİT Genel Sekreterliği yapan bu Türk diplomat ve akademisyen kimdir?',
  '{"options": ["Ekmeleddin İhsanoğlu", "Volkan Bozkır", "Mevlüt Çavuşoğlu", "Hikmet Çetin", "İsmail Cem"], "correctIndex": 0}'::jsonb,
  'Prof. Dr. Ekmeleddin İhsanoğlu, seçimle işbaşına gelen ilk İİT Genel Sekreteri olmuş ve 2005-2014 arasında bu görevi başarıyla yürütmüştür.',
  'Ekmeleddin İhsanoğlu İİT Genel Sekreterliği yapmıştır; Volkan Bozkır ise BM 75. Genel Kurul Başkanlığı yapmıştır.',
  14
);

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
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  'Avrupa Birliği''ne üye olmak isteyen aday ülkelerin tam üyelik müzakerelerine başlayabilmesi için yerine getirmesi gereken demokrasi, hukukun üstünlüğü, insan hakları ve azınlıkların korunması şartlarını içeren siyasi kriterler bütününe ne ad verilir?',
  '{"options": ["Maastricht Kriterleri", "Kopenhag Kriterleri", "Schengen İlkeleri", "Madrid Şartı", "Lizbon Kriterleri"], "correctIndex": 1}'::jsonb,
  'AB''nin siyasi kriterlerine ''Kopenhag Kriterleri'' (demokrasi, insan hakları, hukuk devleti); parasal ve ekonomik kriterlerine (bütçe açığı, enflasyon, kamu borç stoku) ise ''Maastricht Kriterleri'' denir.',
  'Siyasi kriterler = Kopenhag; Parasal/Ekonomik kriterler = Maastricht.',
  15
);

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
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  'Türkiye ile Avrupa Birliği arasındaki ilişkilerin tarihsel gelişimi değerlendirildiğinde aşağıdakilerden hangisi yanlıştır?',
  '{"options": ["Türkiye 1959 yılında dönemin Avrupa Ekonomik Topluluğu''na (AET) ortaklık başvurusu yapmıştır.", "1963 Ankara Anlaşması Türkiye ile AET arasında ortaklık ilişkisi kuran temel hukuki belgedir.", "Türkiye 1996 yılında AB ile Gümrük Birliği''ne girmiştir.", "Türkiye 1999 Helsinki Zirvesi''nde resmen ''Aday Ülke'' ilan edilmiştir.", "Türkiye Avrupa Birliği''nin kurucu üyeleri arasında yer almaktadır."], "correctIndex": 4}'::jsonb,
  'AB''nin (AET) 1957 Roma Antlaşması ile 6 kurucu üyesi vardır: Fransa, Batı Almanya, İtalya, Belçika, Hollanda, Lüksemburg. Türkiye kurucu üye değildir; 1999''da aday ülke olmuş, 2005''te müzakerelere başlamıştır.',
  'Türkiye BM, Avrupa Konseyi ve OECD''nin kurucusudur; ancak AB''nin kurucusu kesinlikle değildir.',
  16
);

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
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  'Uluslararası Polis Teşkilatı olan INTERPOL''ün genel sekreterliği ve merkezi hangi ülkede ve şehirdedir?',
  '{"options": ["Fransa — Lyon", "ABD — New York", "Hollanda — Lahey", "İsviçre — Cenevre", "Almanya — Berlin"], "correctIndex": 0}'::jsonb,
  'INTERPOL (Uluslararası Kriminal Polis Teşkilatı), 195 üye ülkesiyle dünyanın en büyük polis iş birliği örgütüdür ve genel merkezi Fransa''nın Lyon kentindedir.',
  'INTERPOL Paris''te değil, Fransa''nın Lyon kentindedir; EUROPOL ise Lahey''dedir.',
  17
);

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
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  'D-8 (Gelişen Sekiz Ülke) teşkilatının kurucu üyeleri arasında aşağıdakilerden hangisi YER ALMAZ?',
  '{"options": ["Türkiye", "İran", "Mısır", "Suudi Arabistan", "Endonezya"], "correctIndex": 3}'::jsonb,
  'D-8 üyeleri: Türkiye, İran, Pakistan, Bangladeş, Malezya, Endonezya, Mısır ve Nijerya''dır. Suudi Arabistan, Irak veya Katar D-8 üyesi DEĞİLDİR.',
  'Suudi Arabistan D-8 üyesi değildir; adaylar Arap ülkelerinin tamamının üye olduğunu sanabilir.',
  18
);

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
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  'Türkiye''nin 2012 yılında ''Diyalog Ortağı'' statüsü kazandığı ve Çin ile Rusya''nın öncülüğünde Avrasya coğrafyasında güvenlik ve ekonomik iş birliği yürüten örgüt hangisidir?',
  '{"options": ["Şanghay İşbirliği Örgütü (ŞİÖ)", "Arap Birliği", "Körfez İşbirliği Konseyi", "Kuzey Konseyi", "Bağımsız Devletler Topluluğu"], "correctIndex": 0}'::jsonb,
  '1996''da Şanghay Beşlisi olarak kurulan ve 2001''de Şanghay İşbirliği Örgütü''ne dönüşen teşkilatta Türkiye 2012''den bu yana ''Diyalog Ortağı'' statüsündedir.',
  'Türkiye ŞİÖ''ye tam üye değildir; Diyalog Ortağıdır.',
  19
);

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
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  'Avrupa Konseyi üyeliğinden 2022 yılında Ukrayna''ya karşı başlattığı askeri harekat sebebiyle resmen çıkarılan (ihraç edilen) ülke hangisidir?',
  '{"options": ["Belarus", "Rusya Federasyonu", "Sırbistan", "Ermenistan", "Macaristan"], "correctIndex": 1}'::jsonb,
  'Avrupa Konseyi Bakanlar Komitesi, 16 Mart 2022 tarihinde Ukrayna''nın işgali nedeniyle Rusya Federasyonu''nu Avrupa Konseyi üyeliğinden ihraç etmiştir.',
  'Rusya ihraç edilmiş, böylece Rus vatandaşlarının AİHM''ye başvuru yolu da kapanmıştır.',
  20
);

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
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  'Karadeniz Ekonomik İşbirliği Teşkilatı''nın (KEİ) kurucu üyeleri arasında yer almasına rağmen Karadeniz''e doğrudan kıyısı BULUNMAYAN ülkeler aşağıdakilerin hangisinde birlikte verilmiştir?',
  '{"options": ["Azerbaycan, Ermenistan, Yunanistan, Arnavutluk, Moldova, Sırbistan", "Türkiye, Rusya, Ukrayna", "Romanya, Bulgaristan, Gürcistan", "İtalya, Almanya, Macaristan", "İran, Irak, Suriye"], "correctIndex": 0}'::jsonb,
  'KEİ havza temelli bir örgüttür ancak Karadeniz''e sahili olmadığı halde KEİ kurucu/üyesi olan ülkeler vardır: Azerbaycan, Ermenistan, Yunanistan, Arnavutluk, Moldova, Sırbistan ve Kuzey Makedonya.',
  'Azerbaycan, Ermenistan ve Yunanistan''ın Karadeniz''e sahili yoktur fakat KEİ üyesidirler!',
  21
);

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
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  'Avrupa İnsan Hakları Mahkemesi''ne (AİHM) Türkiye aleyhine bireysel başvuru yapılabilmesi için iç hukukta son olarak hangi yargı merciine başvurulmuş ve tüketilmiş olması zorunludur?',
  '{"options": ["Yargıtay Ceza Genel Kurulu", "Danıştay İdari Dava Daireleri Kurulu", "Anayasa Mahkemesi (Bireysel Başvuru yolu)", "Uyuşmazlık Mahkemesi", "Adalet Bakanlığı İnsan Hakları Tazminat Komisyonu"], "correctIndex": 2}'::jsonb,
  '2010 yılında Türk Anayasa Mahkemesi''ne Bireysel Başvuru yolu getirildikten sonra, AİHM Türkiye''den doğrudan gelen başvuruları kabul etmemekte; öncelikle Anayasa Mahkemesi''ne bireysel başvuru yapılması ve bu yolun da tüketilmesi şartını aramaktadır.',
  'AYM''ye bireysel başvuru tüketilmeden AİHM''ye gidilemez; AİHM başvuruyu iç hukuk yolları tüketilmediği için usulden reddeder.',
  22
);

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
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  'Dünya Ticaret Örgütü (DTÖ / WTO) hangi uluslararası anlaşmanın yerine 1995 yılında kurulmuştur?',
  '{"options": ["Bretton Woods Anlaşması", "GATT (Gümrük Tarifeleri ve Ticaret Genel Anlaşması)", "Varşova Paktı", "Marshall Planı", "Balkan Antantı"], "correctIndex": 1}'::jsonb,
  '1947 tarihli GATT (Genel Tarifeler ve Ticaret Anlaşması), 1994 Marakeş Zirvesi ile kurumsal bir yapıya bürünerek 1 Ocak 1995''te Dünya Ticaret Örgütü''ne (DTÖ) dönüşmüştür. Merkezi Cenevre''dedir.',
  'DTÖ, GATT''ın halefidir; merkezi İsviçre Cenevre''dir.',
  23
);

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
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  'Petrol İhraç Eden Ülkeler Örgütü (OPEC) 1960 yılında Bağdat Konferansı''nda kurulmuştur.

OPEC''in genel merkezi aşağıdaki şehirlerden hangisindedir?',
  '{"options": ["Riyad (Suudi Arabistan)", "Bağdat (Irak)", "Viyana (Avusturya)", "Cenevre (İsviçre)", "Kuveyt Şehri"], "correctIndex": 2}'::jsonb,
  'OPEC Bağdat''ta kurulmuş ve ilk merkezi Cenevre olmuşsa da, 1965 yılından bu yana genel merkezi Avusturya''nın başkenti Viyana''dadır (Avusturya petrol üreticisi olmadığı halde tarafsız merkez seçilmiştir).',
  'OPEC petrolcülerin örgütüdür ancak merkezi bir petrol ülkesinde değil, Viyana''dadır!',
  24
);

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
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  'Birleşmiş Milletler Genel Kurulu Başkanlığı görevini üstlenen ilk Türk diplomat olan ve 75. BM Genel Kurul Başkanlığı''nı yürüten isim aşağıdakilerden hangisidir?',
  '{"options": ["Volkan Bozkır", "Rauf Denktaş", "Feridun Sinirlioğlu", "Ahmet Davutoğlu", "Şükrü Saraçoğlu"], "correctIndex": 0}'::jsonb,
  'Eski AB Bakanı ve Büyükelçi Volkan Bozkır, 2020-2021 yıllarında BM 75. Genel Kurul Başkanlığı görevini yürüterek bu makama seçilen ilk Türk vatandaşı olmuştur.',
  'BM Genel Kurul Başkanı seçilen tek Türk diplomat Volkan Bozkır''dır.',
  25
);

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
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  'Birleşmiş Milletler Mülteciler Yüksek Komiserliği (UNHCR) ve Uluslararası Çalışma Örgütü (ILO) gibi dev BM uzman kuruluşlarının genel merkezi hangi şehirde bulunmaktadır?',
  '{"options": ["New York", "Cenevre", "Paris", "Londra", "Roma"], "correctIndex": 1}'::jsonb,
  'İsviçre''nin Cenevre kenti; UNHCR (Mülteciler), ILO (Çalışma), WHO (Sağlık), WIPO (Fikri Mülkiyet) ve ITU gibi BM kuruluşlarının küresel merkezidir.',
  'Gıda/Tarım örgütleri Roma''dadır (FAO, WFP); Sağlık, Çalışma ve Mülteciler Cenevre''dedir.',
  26
);

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
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  'G-20 (Group of Twenty) zirvesi dünya ekonomisinin yaklaşık %85''ini temsil eder.

2023 Yeni Delhi Zirvesi''nde G-20''ye Avrupa Birliği''nden sonra ikinci bölgesel blok olarak daimi üye statüsüyle kabul edilen uluslararası birlik hangisidir?',
  '{"options": ["Afrika Birliği", "Arap Ligi", "ASEAN", "Türk Devletleri Teşkilatı", "Şanghay İşbirliği Örgütü"], "correctIndex": 0}'::jsonb,
  'G-20, 2023 yılında Hindistan''ın başkenti Yeni Delhi''de yapılan zirvede 55 Afrika ülkesini temsil eden ''Afrika Birliği''ni daimi üye olarak bünyesine katmıştır.',
  'G-20''ye en son daimi üye olarak katılan blok Afrika Birliği''dir.',
  27
);

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
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  'NATO Antlaşması''nın ''Bir müttefike yapılan silahlı saldırı, tüm müttefiklere yapılmış sayılır ve ortak savunma devreye girer'' ilkesini düzenleyen meşhur maddesi hangisidir?',
  '{"options": ["1. Madde", "4. Madde", "5. Madde", "10. Madde", "51. Madde"], "correctIndex": 2}'::jsonb,
  'NATO''nun kolektif savunma ilkesi 5. Maddede düzenlenmiştir. Tarihte sadece bir kez, 11 Eylül 2001 ABD terör saldırılarından sonra yürürlüğe konulmuştur.',
  '4. Madde tehdit anında ''istişare'' maddesidir; 5. Madde ise fiili ''ortak askeri müdahale ve savunma'' maddesidir.',
  28
);

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
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  'Birleşmiş Milletler Gıda ve Tarım Örgütü (FAO) ile Dünya Gıda Programı''nın (WFP) genel merkezi hangi ülkede ve şehirdedir?',
  '{"options": ["İtalya — Roma", "Fransa — Paris", "İsviçre — Cenevre", "Avusturya — Viyana", "Hollanda — Amsterdam"], "correctIndex": 0}'::jsonb,
  'Tarım, açlıkla mücadele ve gıda ile ilgili BM kuruluşları (FAO, WFP, IFAD) İtalya''nın başkenti Roma''da konuşlanmıştır.',
  'Tarım ve gıda kuruluşları Roma''dadır.',
  29
);

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
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  'OECD (Ekonomik İşbirliği ve Kalkınma Örgütü) ile ilgili olarak aşağıda verilenlerden hangisi doğrudur?',
  '{"options": ["Merkezi Cenevre''dedir.", "Türkiye bu örgüte 2000''li yıllarda üye olmuştur.", "1961 yılında kurulan örgütün kurucu üyeleri arasında Türkiye de yer almaktadır ve genel merkezi Paris''tedir.", "Yalnızca petrol üreten ülkeler üye olabilir.", "Askeri bir pakt olarak faaliyet gösterir."], "correctIndex": 2}'::jsonb,
  'OECD 1961 yılında kurulmuş gelişmiş piyasa ekonomilerini bir araya getiren bir teşkilattır. Türkiye 20 kurucu ülkeden biridir ve merkezi Paris''tedir.',
  'Türkiye OECD''nin kurucu üyesidir; merkezi Fransa Paris''tedir.',
  30
);

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
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  3,
  'Avrupa İnsan Hakları Mahkemesi''ne (AİHM) yapılacak bireysel başvurularda, iç hukuk yollarının tüketildiği nihai kararın (Türkiye için Anayasa Mahkemesi Bireysel Başvuru kararının) tebliğinden itibaren geçerli olan ''başvuru süresi'' 15 No''lu Protokol ile kaça indirilmiştir?',
  '{"options": ["1 yıl", "6 aydan 4 aya indirilmiştir", "30 gün", "3 ay", "60 gün"], "correctIndex": 1}'::jsonb,
  'AİHM''ye başvuru süresi eskiden 6 aydı. Yürürlüğe giren AİHS 15 No''lu Ek Protokol ile kesin kararın tebliğinden itibaren başvuru süresi 6 AYDAN 4 AYA indirilmiştir.',
  'Eski süre 6 aydı; güncel kural 4 AYDIR! Bu süre değişikliği güncel sınavların eleyici noktasıdır.',
  31
);

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
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  3,
  'Avrupa İnsan Hakları Mahkemesi''nde (AİHM) her üye devlet adına bir yargıç görev yapar. AİHM yargıçlarının görev süresi ve seçim usulü aşağıdakilerden hangisinde doğru verilmiştir?',
  '{"options": ["Görev süreleri 9 yıldır, yeniden seçilemezler ve Avrupa Konseyi Parlamenter Meclisi (AKPM) tarafından seçilirler.", "Görev süreleri 5 yıldır, ömür boyu kalırlar.", "Doğrudan ilgili ülkenin Cumhurbaşkanı tarafından atanırlar.", "Görev süreleri 12 yıldır ve BM Genel Kurulu seçer.", "Her 3 yılda bir kura ile belirlenirler."], "correctIndex": 0}'::jsonb,
  'AİHM yargıçları, ilgili devletin gösterdiği üç aday arasından Avrupa Konseyi Parlamenter Meclisi (AKPM) tarafından 9 YILLIK süre için seçilirler ve görev süreleri bitince yeniden seçilemezler (Yaş haddi 70''tir).',
  'AİHM yargıçlarının görev süresi 9 yıldır ve YENİDEN SEÇİLEMEZLER!',
  32
);

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
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  3,
  'Türk Devletleri Teşkilatı''nın (TDT) güncel kurucu ve tam üye devletleri (5 ülke) aşağıdakilerin hangisinde eksiksiz verilmiştir?',
  '{"options": ["Türkiye, Azerbaycan, Kazakistan, Kırgızistan, Özbekistan", "Türkiye, Türkmenistan, Macaristan, KKTC, Tacikistan", "Türkiye, Rusya, İran, Pakistan, Afganistan", "Türkiye, Azerbaycan, Gürcistan, Ukrayna, Moldova", "Türkiye, Kazakistan, Kırgızistan, Tataristan, Başkurdistan"], "correctIndex": 0}'::jsonb,
  'TDT''nin 5 tam üyesi: Türkiye, Azerbaycan, Kazakistan, Kırgızistan ve Özbekistan''dır (Özbekistan 2019''da tam üye oldu). Macaristan, Türkmenistan ve KKTC ise gözlemci üyelerdir.',
  'Türkmenistan ve KKTC tam üye DEĞİL, GÖZLEMCİ üyedir! Tam üyeler 5 tanedir.',
  33
);

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
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  3,
  'Uluslararası Ceza Mahkemesi (UCM / ICC); soykırım, insanlığa karşı suçlar, savaş suçları ve saldırı suçlarını yargılamak üzere kurulan ilk daimi uluslararası ceza mahkemesidir.

Uluslararası Ceza Mahkemesi''nin kuruluş belgesi olan ve Türkiye''nin henüz taraf olmadığı kurucu uluslararası antlaşma hangisidir?',
  '{"options": ["Roma Statüsü", "Versay Barış Antlaşması", "Cenevre Sözleşmeleri", "Viyana Sözleşmesi", "Madrid Protokolü"], "correctIndex": 0}'::jsonb,
  'Uluslararası Ceza Mahkemesi (UCM), 1998 yılında kabul edilen ve 2002''de yürürlüğe giren ''Roma Statüsü'' ile kurulmuştur. Mahkeme Lahey''dedir. Türkiye, ABD ve Rusya Roma Statüsü''ne taraf değildir.',
  'Uluslararası Ceza Mahkemesi''nin kurucu belgesi Roma Statüsü''dür.',
  34
);

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
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  3,
  'Birleşmiş Milletler bünyesinde nükleer enerjinin barışçıl amaçlarla kullanılmasını denetleyen, nükleer silahların yayılmasını önlemek amacıyla denetim ve teftişler yürüten ve genel merkezi Viyana''da olan uzman kuruluş hangisidir?',
  '{"options": ["IAEA (Uluslararası Atom Enerjisi Ajansı)", "NATO Nükleer Planlama Grubu", "UNIDO", "UNFPA", "OPEC"], "correctIndex": 0}'::jsonb,
  'IAEA (International Atomic Energy Agency - Uluslararası Atom Enerjisi Ajansı), 1957''de nükleer denetim için kurulmuş BM uzman kuruluşudur. Merkezi Avusturya Viyana''dadır.',
  'Nükleer denetim örgütü = IAEA; Merkezi Viyana''dır.',
  35
);

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
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  3,
  'Avrupa Birliği''nin kurumsal yapısı değerlendirildiğinde ''Avrupa Birliği Adalet Divanı'' (ABAD) ile ''Avrupa İnsan Hakları Mahkemesi'' (AİHM) arasındaki temel fark aşağıdakilerden hangisidir?',
  '{"options": ["ABAD Avrupa Birliği''nin Lüksemburg''daki yargı organı olup AB hukukunun uygulanmasını denetler; AİHM ise Avrupa Konseyi''nin Strazburg''daki mahkemesi olup İnsan Hakları Sözleşmesi ihlallerini yargılar.", "İkisi aynı mahkemedir, isimleri farklıdır.", "ABAD''a sadece ceza davaları gider, AİHM''ye sadece boşanma davaları gider.", "Türkiye ABAD üyesidir, AİHM üyesi değildir.", "ABAD''ın kararları tavsiye niteliğindedir."], "correctIndex": 0}'::jsonb,
  'ABAD (Lüksemburg), Avrupa Birliği müktesebatını ve AB üyesi devletleri denetler. Türkiye AB üyesi olmadığı için ABAD yargı yetkisine tabi değildir. AİHM (Strazburg) ise Avrupa Konseyi organıdır ve Türkiye AİHM''nin zorunlu yargı yetkisini tanımıştır.',
  'Türkiye ABAD''a tabi DEĞİLDİR; AİHM''ye TABİDİR!',
  36
);

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
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  3,
  'Avrupa Birliği''ne üye ülkeler arasında sınır kontrollerini kaldıran ve vatandaşların vizesiz serbestçe seyahat etmesine olanak tanıyan anlaşma aşağıdakilerden hangisidir?',
  '{"options": ["Schengen Anlaşması", "Maastricht Anlaşması", "Nice Anlaşması", "Amsterdam Anlaşması", "Dublin Sözleşmesi"], "correctIndex": 0}'::jsonb,
  '1985 yılında Lüksemburg''un Schengen kasabasında imzalanan Schengen Anlaşması, taraf ülkeler arasındaki iç sınır kontrollerini kaldırmış ve ortak bir dış sınır vize rejimi kurmuştur.',
  'Schengen serbest dolaşım alanıdır. Dublin Sözleşmesi ise sığınmacı ve mülteci iltica başvurularını düzenler.',
  37
);

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
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  3,
  'Avrupa Birliği''nin yürütme organı olan, kanun tasarılarını hazırlayan, AB bütçesini yöneten ve ''AB''nin hükümeti'' gibi işlev gören organ hangisidir?',
  '{"options": ["Avrupa Komisyonu", "Avrupa Parlamentosu", "Avrupa Birliği Konseyi", "Avrupa Zirvesi", "Sayıştay"], "correctIndex": 0}'::jsonb,
  'Avrupa Komisyonu (merkezi Brüksel), her üye devletten birer komiserin katıldığı 27 üyeli yürütme kabinesidir. AB mevzuatını teklif eden ve antlaşmaların koruyuculuğunu üstlenen tek organdır.',
  'Avrupa Parlamentosu yasama organıdır; yürütme/hükümet organı ise Avrupa Komisyonu''dur.',
  38
);

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
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  3,
  'I. Birleşmiş Milletler (BM)
II. Avrupa Konseyi
III. Ekonomik İşbirliği ve Kalkınma Örgütü (OECD)
IV. Kuzey Atlantik Antlaşması Örgütü (NATO)

Yukarıda verilen uluslararası kuruluşlardan hangilerinin ''kurucu üyeleri'' arasında Türkiye Cumhuriyeti yer almaktadır?',
  '{"options": ["I, II ve III", "II, III ve IV", "I ve IV", "Yalnız I", "I, II, III ve IV"], "correctIndex": 0}'::jsonb,
  'Türkiye; 1945''te BM''nin, 1949''da Avrupa Konseyi''nin, 1961''de OECD''nin kurucu üyeleri arasında yer almıştır. Ancak NATO''nun kurucusu değildir; NATO''ya 1952 yılında sonradan katılmıştır.',
  'Türkiye NATO''nun kurucusu DEĞİLDİR! 1952''de katılmıştır. BM, Avrupa Konseyi ve OECD''nin ise kurucu üyesidir.',
  39
);

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
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  3,
  'Avrupa Güvenlik ve İşbirliği Teşkilatı''nın (AGİT / OSCE) temelini oluşturan ve Soğuk Savaş döneminde Doğu ile Batı blokları arasında sınırların değişmezliğini ve insan haklarını kabul eden tarihi belge aşağıdakilerden hangisidir?',
  '{"options": ["1975 Helsinki Nihai Senedi", "Yalta Konferansı Bildirisi", "Potsdam Anlaşması", "Paris Şartı", "Cenevre Sözleşmesi"], "correctIndex": 0}'::jsonb,
  '1975 Helsinki Nihai Senedi ile temeli atılan Avrupa Güvenlik ve İşbirliği Konferansı (AGİK), 1994 Budapeşte Zirvesi''nde kurumsallaşarak AGİT (OSCE) adını almıştır. Merkezi Viyana''dadır.',
  'AGİT''in temeli 1975 Helsinki Nihai Senedi''dir; merkezi Avusturya Viyana''dır.',
  40
);

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
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  '1982 Anayasası''nın 90. maddesine göre usulüne göre yürürlüğe konulmuş milletlerarası antlaşmalar hakkında anayasaya aykırılık iddiasıyla nereye başvurulabilir?',
  '{"options": ["Anayasa Mahkemesine iptal davası açılabilir.", "Danıştay''a başvurulabilir.", "Uyuşmazlık Mahkemesine gidilebilir.", "Bunlar hakkında anayasaya aykırılık iddiası ile Anayasa Mahkemesine BAŞVURULAMAZ (yargı yolu kapalıdır).", "Sayıştay inceleme yapar."], "correctIndex": 3}'::jsonb,
  'Anayasa m. 90/son amir hükmüdür: ''Usulüne göre yürürlüğe konulmuş milletlerarası andlaşmalar kanun hükmündedir. Bunlar hakkında Anayasaya aykırılık iddiası ile Anayasa Mahkemesine başvurulamaz.''',
  'Milletlerarası andlaşmalar kanun gücündedir ama KANUNLARDAN FARKI: Anayasa Mahkemesi''ne iptal davası AÇILAMAZ!',
  41
);

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
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  'Anayasa''nın 90. maddesinin son fıkrasına 2004 yılında eklenen kurala göre; usulüne göre yürürlüğe konulmuş temel hak ve özgürlüklere ilişkin milletlerarası antlaşmalarla iç hukuk kanunlarının aynı konuda farklı hükümler içermesi (çatışması) durumunda hangisi esas alınır?',
  '{"options": ["TBMM''nin çıkaracağı yeni kanun esas alınır.", "Milletlerarası antlaşma hükümleri esas alınır.", "Cumhurbaşkanlığı Kararnamesi esas alınır.", "Her iki metin de geçersiz sayılarak genel ahlaka göre hüküm verilir.", "Hakim takdir yetkisini kullanır."], "correctIndex": 1}'::jsonb,
  'Anayasa m. 90: ''Usulüne göre yürürlüğe konulmuş temel hak ve özgürlüklere ilişkin milletlerarası andlaşmalarla kanunların aynı konuda farklı hükümler içermesi nedeniyle çıkabilecek uyuşmazlıklarda MİLLETLERARASI ANDLAŞMA HÜKÜMLERİ ESAS ALINIR.''',
  'Temel haklarda kanun ile andlaşma çatışırsa MİLLETLERARASI ANDLAŞMA kanundan üstündür ve esas alınır!',
  42
);

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
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  'Birleşmiş Milletler''in ana yargı organı olan ve Hollanda''nın Lahey kentindeki Barış Sarayı''nda görev yapan Uluslararası Adalet Divanı''na (UAD) ilişkin aşağıdakilerden hangisi doğrudur?',
  '{"options": ["Sadece gerçek kişilerin ceza davalarına bakar.", "Yalnızca DEVLETLER arasındaki hukuki uyuşmazlıkları karara bağlar ve BM organlarına istişari görüş bildirir.", "Yargıç sayısı 27''dir ve 3 yıllığına seçilirler.", "Kararları temyizen İsviçre Federal Mahkemesi''ne götürülebilir.", "Türkiye divanın zorunlu yargı yetkisini şartsız kabul etmiştir."], "correctIndex": 1}'::jsonb,
  'UAD (ICJ), BM''nin ana yargı organıdır. 15 yargıçtan oluşur (görev süreleri 9 yıldır). UAD önüne gerçek kişiler dava açamaz; yalnızca DEVLETLER taraf olabilir.',
  'UAD''de kişiler değil DEVLETLER yargılanır; gerçek kişilerin savaş ve soykırım suçlarını ise Uluslararası Ceza Mahkemesi (UCM) yargılar.',
  43
);

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
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  '3 Ekim 2009 tarihinde Türkiye, Azerbaycan, Kazakistan ve Kırgızistan tarafından imzalanan Nahçıvan Anlaşması ile kurulan ve genel sekreterliği İstanbul''da bulunan teşkilat hangisidir?',
  '{"options": ["Türk Devletleri Teşkilatı (TDT)", "Ekonomik İşbirliği Teşkilatı (EİT)", "Karadeniz Ekonomik İşbirliği (KEİ)", "D-8 Teşkilatı", "TÜRKSOY"], "correctIndex": 0}'::jsonb,
  'TDT (eski adıyla Türk Keneşi / Türk Konseyi), 3 Ekim 2009 Nahçıvan Anlaşması ile kurulmuştur ve merkezi İSTANBUL''dadır. Bu nedenle 3 Ekim günü ''Türk Dünyası İşbirliği Günü'' olarak kutlanır.',
  'TÜRKSOY''un merkezi Ankara''dadır; Türk Devletleri Teşkilatı''nın (TDT) genel sekreterliği ise İSTANBUL''dadır.',
  44
);

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
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  '1992 yılında İstanbul Zirvesi Bildirisi ile Türkiye''nin öncülüğünde kurulan ve daimi genel sekreterliği İstanbul Boğazı kıyısında yer alan bölgesel ekonomik kuruluş hangisidir?',
  '{"options": ["Karadeniz Ekonomik İşbirliği Teşkilatı (KEİ)", "Akdeniz İçin Birlik", "Avrupa Serbest Ticaret Birliği (EFTA)", "D-8 Teşkilatı", "Orta Avrupa Girişimi"], "correctIndex": 0}'::jsonb,
  'Karadeniz havzasındaki barış ve ekonomik entegrasyonu hedefleyen KEİ (BSEC), 1992 İstanbul Zirvesi ile kurulmuş ve daimi sekretaryası İSTANBUL''dadır.',
  'KEİ''nin kurucusu ve ev sahibi Türkiye''dir; merkezi İSTANBUL''dadır.',
  45
);

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
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  'Türkiye, İran ve Pakistan tarafından 1985 yılında kurulan ve daha sonra Orta Asya Türk cumhuriyetleri ile Afganistan ve Azerbaycan''ın katıldığı, genel merkezi TAHRAN''da bulunan ekonomik örgüt hangisidir?',
  '{"options": ["Ekonomik İşbirliği Teşkilatı (EİT / ECO)", "D-8 Teşkilatı", "Arap Birliği", "Şanghay İşbirliği Örgütü", "Körfez İşbirliği Konseyi"], "correctIndex": 0}'::jsonb,
  '1985''te kurulan Ekonomik İşbirliği Teşkilatı''nın (EİT) genel sekreterliği İran''ın başkenti TAHRAN''dadır. 10 üyesi vardır.',
  'D-8 İstanbul''dadır; EİT (ECO) ise TAHRAN''dadır.',
  46
);

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
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  '1995 yılında GATT''ın yerine kurulan, küresel ticaretin kurallarını belirleyen ve ticaret anlaşmazlıklarını çözen Dünya Ticaret Örgütü''nün (DTÖ / WTO) genel merkezi hangi şehirdedir?',
  '{"options": ["Cenevre (İsviçre)", "Brüksel (Belçika)", "New York (ABD)", "Viyana (Avusturya)", "Londra (İngiltere)"], "correctIndex": 0}'::jsonb,
  'Dünya Ticaret Örgütü (WTO), 1 Ocak 1995''te faaliyete geçmiş olup genel merkezi İsviçre''nin CENEVRE kentindedir.',
  'DTÖ (WTO) merkezi CENEVRE''dedir. Dünya Bankası ve IMF ise Washington''dadır.',
  47
);

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
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  '1949 yılında kurulan, Türkiye''nin kurucu üyesi olduğu, genel merkezi Fransa''nın Strazburg kentinde yer alan ve 2022''de Rusya''nın üyelikten çıkarıldığı insan hakları kuruluşu hangisidir?',
  '{"options": ["Avrupa Konseyi", "Avrupa Birliği", "Avrupa Güvenlik ve İşbirliği Teşkilatı (AGİT)", "Kuzey Atlantik İttifakı (NATO)", "Batı Avrupa Birliği"], "correctIndex": 0}'::jsonb,
  'Avrupa Konseyi (Council of Europe - Strazburg), AİHM''nin de bağlı olduğu örgüttür. Rusya''nın ihracından sonra üye sayısı 46''dır. Türkiye kurucu üyesidir.',
  'Avrupa Konseyi ile Avrupa Birliği ayrı örgütlerdir! Türkiye AB üyesi değildir ama AVRUPA KONSEYİ''NİN KURUCUSUDUR.',
  48
);

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
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  'Şanghay İşbirliği Örgütü''nün (ŞİÖ) kurumsal yapısı ve Türkiye''nin bu örgütle olan hukuki ilişkisi hakkında aşağıdakilerden hangisi doğrudur?',
  '{"options": ["Türkiye ŞİÖ''nün tam üyesidir.", "Türkiye ŞİÖ''de ''Gözlemci Üye'' statüsündedir.", "Türkiye ŞİÖ''de 2012 yılından bu yana ''DİYALOG ORTAĞI'' statüsündedir.", "Türkiye''nin ŞİÖ ile hiçbir resmi bağı yoktur.", "ŞİÖ genel sekreterliği Moskova''dadır."], "correctIndex": 2}'::jsonb,
  'Türkiye Şanghay İşbirliği Örgütü''ne tam üye veya gözlemci üye DEĞİLDİR; 2012 Pekin Zirvesi''nde onaylanan kararla ''DİYALOG ORTAĞI'' (Dialogue Partner) statüsündedir.',
  'ÖSYM''nin favori sorusudur: Türkiye ŞİÖ''de tam üye veya gözlemci DEĞİL, ''DİYALOG ORTAĞI''dır!',
  49
);

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
  'Uluslararası Kuruluşlar',
  'multiple_choice',
  2,
  'Arap dünyasında dayanışmayı sağlamak amacıyla 1945 yılında kurulan ve 22 Arap ülkesinin üye olduğu Arap Devletleri Ligi''nin (Arap Birliği) genel merkezi hangi başkenttedir?',
  '{"options": ["Kahire (Mısır)", "Riyad (Suudi Arabistan)", "Doha (Katar)", "Bağdat (Irak)", "Amman (Ürdün)"], "correctIndex": 0}'::jsonb,
  'Arap Birliği''nin genel merkezi Mısır''ın başkenti KAHİRE''dedir.',
  'İslam İşbirliği Teşkilatı CIDDE''dedir; Arap Birliği ise KAHİRE''dedir.',
  50
);

COMMIT;
