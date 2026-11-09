-- =============================================================
-- KPSS VATANDAŞLIK — KONU 4: YASAMA, YÜRÜTME VE YARGI
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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  1,
  '1982 Anayasası''na göre Türkiye Büyük Millet Meclisi (TBMM) kaç milletvekilinden oluşur?',
  '{"options": ["450", "500", "550", "600", "650"], "correctIndex": 3}'::jsonb,
  '2017 Anayasa değişikliği ile Anayasa m. 75 uyarınca TBMM üye tamsayısı 550''den 600 milletvekiline yükseltilmiştir.',
  'Eski 550 sayısı 2017 referandumuyla 600 yapılmıştır; tüm meclis karar ve toplantı nisapları 600 üzerinden hesaplanır.',
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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  1,
  '1982 Anayasası''na göre Cumhurbaşkanı seçilme yaşı ve görev süresi aşağıdakilerden hangisinde doğru olarak verilmiştir?',
  '{"options": ["30 yaşını doldurmuş olmak — 4 yıl", "35 yaşını doldurmuş olmak — 5 yıl", "40 yaşını doldurmuş olmak — 5 yıl", "40 yaşını doldurmuş olmak — 7 yıl", "18 yaşını doldurmuş olmak — 5 yıl"], "correctIndex": 2}'::jsonb,
  'Anayasa m. 101 uyarınca Cumhurbaşkanı; 40 yaşını doldurmuş, yükseköğrenim yapmış, milletvekili seçilme yeterliliğine sahip Türk vatandaşları arasından, halk tarafından 5 yıllık süre için seçilir.',
  'Milletvekili seçilme yaşı 18''e inmiş olsa da Cumhurbaşkanı seçilme yaşı 40''tır ve görev süresi 5 yıldır.',
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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  1,
  '2017 Anayasa değişiklikleri ile Türk anayasa düzeninden tamamen kaldırılan denetim yolları aşağıdakilerden hangisinde birlikte verilmiştir?',
  '{"options": ["Meclis Araştırması ve Genel Görüşme", "Yazılı Soru ve Meclis Soruşturması", "Gensoru ve Sözlü Soru", "Yüce Divan ve Bütçe Denetimi", "Dilekçe ve Bilgi Edinme"], "correctIndex": 2}'::jsonb,
  'Cumhurbaşkanlığı Hükümet Sistemi''ne geçişle birlikte parlamenter sisteme özgü olan ''Gensoru'' (hükümeti düşürme) ve ''Sözlü Soru'' denetim yolları anayasadan tamamen kaldırılmıştır. Yazılı soru, meclis araştırması, genel görüşme ve meclis soruşturması ise devam etmektedir.',
  'Sözlü soru kaldırılmıştır, sadece YAZILI SORU vardır; gensoru ise tamamen kaldırılmıştır.',
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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  1,
  '1982 Anayasası''nda günümüzde geçerli olan ''Yüksek Mahkemeler'' arasında aşağıdakilerden hangisi yer almaz?',
  '{"options": ["Anayasa Mahkemesi", "Yargıtay", "Danıştay", "Uyuşmazlık Mahkemesi", "Sayıştay"], "correctIndex": 4}'::jsonb,
  'Anayasa''nın Yargı bölümünde düzenlenen Yüksek Mahkemeler yalnızca 4 tanedir: Anayasa Mahkemesi, Yargıtay, Danıştay ve Uyuşmazlık Mahkemesi. Sayıştay ve HSK birer yüksek denetim/idari kuruldur, yüksek mahkeme değildirler. Askeri Yargıtay ve AYİM ise 2017''de kaldırılmıştır.',
  'Sayıştay ve Hakimler ve Savcılar Kurulu (HSK) yüksek mahkeme DEĞİLDİR! Dört yüksek mahkeme vardır.',
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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  1,
  'Milletvekillerinin meclis çalışmalarındaki oy, söz ve düşüncelerinden ötürü ömür boyu hukuki ve cezai takibata uğramamalarını sağlayan ve kaldırılamayan mutlak güvenceye ne ad verilir?',
  '{"options": ["Yasama Dokunulmazlığı", "Yasama Sorumsuzluğu (Kürsü Dokunulmazlığı)", "Yasama Yetkisinin Devredilmezliği", "Milletvekili Ödeneği", "Gıyap Güvencesi"], "correctIndex": 1}'::jsonb,
  'Yasama sorumsuzluğu (kürsü dokunulmazlığı); vekillerin meclisteki konuşmalarından ötürü hiçbir zaman yargılanamamasıdır. Mutlaktır, TBMM kararıyla dahi kaldırılamaz ve milletvekilliği bittikten sonra da korur. Yasama dokunulmazlığı ise meclis dışındaki suçlar içindir ve meclis kararıyla kaldırılabilir.',
  'Dokunulmazlık kaldırılabilir (nisbidir); Sorumsuzluk ise asla kaldırılamaz (mutlaktır).',
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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  1,
  'TBMM Genel Kurulu''nda bir kanun teklifinin oylanabilmesi için toplantı yeter sayısı (meclisin toplanabilmesi için gereken en az üye sayısı) ne kadardır?',
  '{"options": ["Üye tamsayısının üçte biri (200 milletvekili)", "Üye tamsayısının salt çoğunluğu (301 milletvekili)", "Üye tamsayısının beşte biri (120 milletvekili)", "184 milletvekili", "Üye tamsayısının beşte üçü (360 milletvekili)"], "correctIndex": 0}'::jsonb,
  'Anayasa m. 96 uyarınca TBMM, yapacağı seçimler dahil bütün işlerinde üye tamsayısının en az üçte biri (1/3 = 200 milletvekili) ile toplanır (Toplantı yeter sayısı = 200).',
  'Toplantı yeter sayısı 200''dür (1/3). Karar yeter sayısı ise toplantıya katılanların salt çoğunluğudur; ancak bu sayı üye tamsayısının 1/4''ünün bir fazlasından (151''den) az olamaz.',
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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  1,
  'Bütçe ve Kesinhesap Kanun Tekliflerini hazırlayarak TBMM''ye sunma yetkisi münhasıran kime aittir?',
  '{"options": ["Hazine ve Maliye Bakanı", "Cumhurbaşkanı", "TBMM Plan ve Bütçe Komisyonu Başkanı", "Sayıştay Başkanı", "Merkez Bankası Başkanı"], "correctIndex": 1}'::jsonb,
  'Anayasa m. 161 uyarınca Bütçe Kanun Teklifi yürütmenin başı olan Cumhurbaşkanı tarafından hazırlanır ve mali yılbaşından en az 75 gün önce TBMM''ye sunulur. Kanun teklif etme yetkisi vekillerde olmasına rağmen Bütçe Teklifi sadece Cumhurbaşkanı tarafından sunulan tek kanundur.',
  'Normal kanunları sadece milletvekilleri teklif edebilir; Cumhurbaşkanı''nın teklif edebildiği YEGÂNE kanun Bütçe Kanunu''dur.',
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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  1,
  'Anayasa Mahkemesi toplam kaç üyeden oluşur ve üyelerin görev süresi kaç yıldır?',
  '{"options": ["11 üye — 6 yıl", "15 üye — 12 yıl", "17 üye — 10 yıl", "13 üye — 4 yıl", "15 üye — Ömür boyu"], "correctIndex": 1}'::jsonb,
  '2017 anayasa değişikliği ile Askeri Yargıtay ve AYİM''den gelen 2 üyelik kaldırılmış, AYM üye sayısı 17''den 15''e düşürülmüştür. AYM üyeleri 12 yıl için seçilirler ve bir kimse iki defa AYM üyesi seçilemez (Yaş haddi 65''tir).',
  'AYM üye sayısı 15''tir; görev süreleri 12 yıldır. 12 üyeyi Cumhurbaşkanı, 3 üyeyi TBMM seçer.',
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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  1,
  'Hakimler ve Savcılar Kurulu''nun (HSK) başkanı kimdir?',
  '{"options": ["Yargıtay Birinci Başkanı", "Danıştay Başkanı", "Adalet Bakanı", "Anayasa Mahkemesi Başkanı", "Cumhurbaşkanı"], "correctIndex": 2}'::jsonb,
  'Anayasa m. 159 açık hükmüdür: ''Hâkimler ve Savcılar Kurulunun Başkanı Adalet Bakanıdır. Adalet Bakanlığı Müsteşarı (Bakan Yardımcısı) Kurulun tabii üyesidir.''',
  'HSK başkanı Adalet Bakanı''dır. Kurul toplam 13 üyeden oluşur.',
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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  1,
  'Adli yargı kolunun (hukuk ve ceza mahkemelerinin) en üst temyiz inceleme mercii aşağıdakilerden hangisidir?',
  '{"options": ["Danıştay", "Yargıtay", "Uyuşmazlık Mahkemesi", "Sayıştay", "Bölge Adliye Mahkemesi"], "correctIndex": 1}'::jsonb,
  'Adli yargının temyiz organı Yargıtay''dır. İdari yargının (idare ve vergi mahkemelerinin) en üst temyiz organı ise Danıştay''dır.',
  'Adli yargı = Yargıtay; İdari yargı = Danıştay.',
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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  '1982 Anayasası''na göre milletvekilliği adaylığı için görevinden istifa eden ancak seçilemeyen kişilerden hangileri mesleklerine KESİNLİKLE GERİ DÖNEMEZLER?',
  '{"options": ["Devlet memurları", "Üniversite öğretim elemanları", "Hâkimler ve savcılar ile Türk Silahlı Kuvvetleri mensupları", "Kamu iktisadi teşebbüsü çalışanları", "Belediye personeli"], "correctIndex": 2}'::jsonb,
  'Yargı bağımsızlığı ve ordunun siyasete bulaşmaması ilkeleri gereğince; milletvekili adayı olmak için istifa eden hâkim ve savcılar ile TSK mensupları (subay/astsubay) seçilemeseler dahi mesleklerine kesinlikle geri dönemezler. Memurlar ve akademisyenler ise geri dönebilir.',
  'Geri dönemeyen iki zümre vardır: Hakim/Savcılar ve Askerler! Memurlar ise geri dönebilir.',
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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  'Aşağıdaki hallerin hangisinde milletvekilliğinin düşmesi için ''TBMM Genel Kurulu kararı'' GEREKMEZ (milletvekilliği kendiliğinden veya bildirimin yapılmasıyla doğrudan düşer)?',
  '{"options": ["Milletvekilinin istifa etmesi", "Milletvekilliği ile bağdaşmayan bir görevi ısrarla sürdürmesi", "Meclis çalışmalarına mazeretsiz ve izinsiz olarak 1 ayda toplam 5 birleşim günü katılmaması", "Milletvekilinin Cumhurbaşkanı yardımcısı veya Bakan olarak atanması", "Milletvekilinin partisinden istifa etmesi"], "correctIndex": 3}'::jsonb,
  'Milletvekili olan biri Cumhurbaşkanı yardımcısı veya Bakan olarak atandığı anda milletvekilliği KENDİLİĞİNDEN (meclis oylamasına gerek olmaksızın) doğrudan düşer (aynı şekilde ölüm, gaiplik veya kesin hüküm giyme bildirimle düşürür). İstifa, bağdaşmayan görev ve devamsızlıkta ise TBMM Genel Kurul oylaması şarttır.',
  'Partiden istifa vekilliği düşürmez (bağımsız kalır). Bakan veya CB yardımcısı atanma ise oylamasız kendiliğinden vekilliği bitirir.',
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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  'TBMM Genel Kurulu kararıyla dokunulmazlığı kaldırılan veya milletvekilliği düşürülen (istifa veya devamsızlık sebebiyle) bir milletvekili, bu karara karşı kaç gün içinde nereye başvurabilir?',
  '{"options": ["7 gün içinde — Anayasa Mahkemesi''ne", "15 gün içinde — Danıştay''a", "30 gün içinde — Yargıtay Ceza Genel Kurulu''na", "10 gün içinde — Yüksek Seçim Kurulu''na", "3 gün içinde — TBMM Başkanlık Divanı''na"], "correctIndex": 0}'::jsonb,
  'Anayasa m. 85 uyarınca dokunulmazlığı kaldırılan veya vekilliği düşürülen milletvekili veya bir başka vekil, kararın alındığı tarihten itibaren 7 GÜN içinde Anayasa Mahkemesi''ne iptal başvurusu yapabilir. Anayasa Mahkemesi 15 GÜN içinde kesin karara bağlar.',
  'Başvuru süresi 7 gün; AYM''nin inceleyip karar verme süresi 15 gündür (7-15 kuralı).',
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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  '1982 Anayasası''na göre kanun teklif etmeye yetkili olan merci aşağıdakilerden hangisidir?',
  '{"options": ["Cumhurbaşkanı", "Yalnızca Milletvekilleri", "Bakanlar", "Danıştay ve Yargıtay", "Siyasi parti genel başkanları"], "correctIndex": 1}'::jsonb,
  '2017 anayasa değişikliği ile kanun tasarısı (hükümetin kanun teklifi) kurumu kaldırılmıştır. Bütçe Kanunu hariç kanun teklif etmeye YALNIZCA MİLLETVEKİLLERİ yetkilidir (tek bir milletvekili dahi kanun teklifi verebilir).',
  'Bakanlar veya Cumhurbaşkanı normal kanun teklif edemez; kanun teklif etme tekeli milletvekillerindedir.',
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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  'TBMM Genel Kurulu tarafından kabul edilen bir kanunu Cumhurbaşkanı kaç gün içinde yayımlamak veya tekrar görüşülmek üzere TBMM''ye geri göndermek zorundadır?',
  '{"options": ["7 gün", "10 gün", "15 gün", "30 gün", "48 saat"], "correctIndex": 2}'::jsonb,
  'Anayasa m. 89 uyarınca Cumhurbaşkanı, TBMM''ce kabul edilen kanunları 15 GÜN içinde Resmî Gazete''de yayımlar veya veto ederek (tekrar görüşülmek üzere) gerekçesiyle birlikte meclise geri gönderir.',
  'Cumhurbaşkanının veto veya onay inceleme süresi 15 gündür. Cumhurbaşkanı Bütçe Kanunu''nu veto edemez!',
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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  'Cumhurbaşkanı''nın veto ederek TBMM''ye geri gönderdiği bir kanunu, TBMM''nin hiçbir değişiklik yapmadan aynen kabul edebilmesi için en az kaç milletvekilinin kabul oyu gerekir?',
  '{"options": ["Toplantıya katılanların basit çoğunluğu", "Üye tamsayısının salt çoğunluğu (en az 301 milletvekili)", "Üye tamsayısının beşte üçü (360 milletvekili)", "Üye tamsayısının üçte ikisi (400 milletvekili)", "200 milletvekili"], "correctIndex": 1}'::jsonb,
  '2017 değişikliği öncesinde meclis basit çoğunlukla vetoyu aşabiliyordu. 2017 değişikliği ile Cumhurbaşkanı''nın vetosunu aşmak zorlaştırılmış ve ''TBMM üye tamsayısının salt çoğunluğu'' (en az 301 kabul oyu) şartı getirilmiştir. 301 ile aynen kabul edilirse Cumhurbaşkanı artık yayımlamak zorundadır.',
  'Veto edilen kanunu aynen kabul etmek için basit çoğunluk yetmez; en az 301 (üye tamsayısının salt çoğunluğu) şarttır!',
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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  '1982 Anayasası''na göre genel ve özel af ilan edebilmek için TBMM Genel Kurulu''nda aranan asgari karar yeter sayısı aşağıdakilerden hangisidir?',
  '{"options": ["Toplantıya katılanların salt çoğunluğu", "Üye tamsayısının salt çoğunluğu (301)", "Üye tamsayısının beşte üçü (360 milletvekili)", "Üye tamsayısının üçte ikisi (400 milletvekili)", "Üye tamsayısının dörtte üçü (450 milletvekili)"], "correctIndex": 2}'::jsonb,
  'Anayasa m. 87 uyarınca genel ve özel af ilanı için TBMM üye tamsayısının en az beşte üçünün (3/5 = 360 milletvekili) kabul oyu şarttır. Ayrıca orman suçları için hiçbir şekilde af çıkarılamaz.',
  'Af ilanı için 3/5 (360) çoğunluk gerekir. Orman suçları için af kanunu çıkarılması anayasa m. 169 ile yasaklanmıştır.',
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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  'Cumhurbaşkanı yardımcıları ve bakanların görevleriyle ilgili suçlarından dolayı Meclis Soruşturması ile ''Yüce Divan''a sevk edilebilmeleri için'' TBMM Genel Kurulu''nda aranan nihai gizli oy karar yeter sayısı ne kadardır?',
  '{"options": ["Üye tamsayısının salt çoğunluğu (301)", "Üye tamsayısının beşte üçü (360)", "Üye tamsayısının üçte ikisi (400 milletvekili)", "Toplantıya katılanların 2/3''ü", "Oy birliği"], "correctIndex": 2}'::jsonb,
  'Meclis soruşturması aşamaları: 1) Teklif: 301 vekil, 2) Soruşturma açılması kararı: 360 vekil (3/5), 3) Yüce Divan''a sevk kararı: 400 vekildir (2/3 gizli oy). Yüce Divan yargılamasını Anayasa Mahkemesi yapar.',
  'Yüce Divan''a sevk için 400 milletvekili (2/3) şarttır. Soruşturma açılması için ise 360 vekil yeterlidir.',
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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  'Olağan dönem Cumhurbaşkanlığı Kararnameleri (CBK) ile ilgili olarak aşağıda verilen kurallardan hangisi yanlıştır?',
  '{"options": ["Yürütme yetkisine ilişkin konularda çıkarılabilir.", "Anayasa''da münhasıran kanunla düzenlenmesi öngörülen konularda CBK çıkarılamaz.", "Kanunda açıkça düzenlenen konularda CBK çıkarılamaz.", "Kanun ile CBK aynı konuda farklı hükümler içerirse CBK hükümleri uygulanır.", "Temel hak ve ödevlerden sadece Sosyal ve Ekonomik Haklar olağan CBK ile düzenlenebilir."], "correctIndex": 3}'::jsonb,
  'Anayasa m. 104 açıktır: Kanun ile Cumhurbaşkanlığı kararnamesinde farklı hükümler bulunması halinde KANUN hükümleri uygulanır. TBMM''nin aynı konuda kanun çıkarması durumunda CBK hükümsüz hale gelir.',
  'Kanun kararnameden üstündür; çatışma anında kanun geçerli olur.',
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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  'Yargıtay Cumhuriyet Başsavcısı ve Başsavcıvekilini Yargıtay Genel Kurulu''nun belirlediği adaylar arasından seçen makam aşağıdakilerden hangisidir?',
  '{"options": ["TBMM", "Cumhurbaşkanı", "Hakimler ve Savcılar Kurulu (HSK)", "Adalet Bakanı", "Anayasa Mahkemesi"], "correctIndex": 1}'::jsonb,
  'Yargıtay Büyük Genel Kurulu''nun her kadro için göstereceği beşer aday arasından Cumhurbaşkanı tarafından 4 yıl için seçilirler. Süresi biten yeniden seçilebilir.',
  'Yargıtay Başsavcısını Yargıtay değil, adaylar arasından doğrudan CUMHURBAŞKANI seçer!',
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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  'Uyuşmazlık Mahkemesi''nin görev alanı ve başkanı ile ilgili aşağıdakilerden hangisi doğrudur?',
  '{"options": ["Adli ve idari yargı mercileri arasındaki görev ve hüküm uyuşmazlıklarını kesin olarak çözer; Başkanı Anayasa Mahkemesi üyeleri arasından Anayasa Mahkemesi tarafından seçilir.", "Ceza davalarını temyiz eder; Başkanı TBMM tarafından seçilir.", "Vergi uyuşmazlıklarını çözer; Başkanı Sayıştay''dır.", "Anayasa değişikliklerini inceler; Başkanı Adalet Bakanıdır.", "Seçim uyuşmazlıklarını kesin karara bağlar."], "correctIndex": 0}'::jsonb,
  'Uyuşmazlık Mahkemesi, adli ve idari yargı kolları arasındaki uyuşmazlıkları kesin çözer. Uyuşmazlık Mahkemesi Başkanını kendi üyeleri değil; Anayasa Mahkemesi kendi üyeleri arasından seçip görevlendirir.',
  'Uyuşmazlık Mahkemesi Başkanı AYM üyesidir ve AYM Genel Kurulu tarafından seçilir.',
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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  'Danıştay üyelerinin seçimi değerlendirildiğinde üyelerin dörtte birini (1/4) ve dörtte üçünü (3/4) sırasıyla hangi makamlar seçer?',
  '{"options": ["1/4''ünü TBMM — 3/4''ünü Cumhurbaşkanı", "1/4''ünü Cumhurbaşkanı — 3/4''ünü Hâkimler ve Savcılar Kurulu (HSK)", "Tamamını HSK", "Yarısını Yargıtay — Yarısını Danıştay", "1/4''ünü Danıştay — 3/4''ünü Adalet Bakanı"], "correctIndex": 1}'::jsonb,
  'Anayasa m. 155 uyarınca Danıştay üyelerinin dörtte birini (1/4) Cumhurbaşkanı; dörtte üçünü (3/4) ise Hâkimler ve Savcılar Kurulu (HSK) seçer.',
  'Danıştay''da üye seçicileri: 1/4 Cumhurbaşkanı, 3/4 HSK! Yargıtay üyelerinin tamamını ise HSK seçer.',
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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  '1982 Anayasası''na göre Olağanüstü Hal (OHAL) ilan etme yetkisi kime aittir ve en fazla kaç ay süreyle ilan edilebilir?',
  '{"options": ["TBMM — En çok 1 yıl", "Cumhurbaşkanı — En çok 6 ay", "İçişleri Bakanı — En çok 3 ay", "Milli Güvenlik Kurulu — En çok 1 ay", "Genelkurmay Başkanı — En çok 2 yıl"], "correctIndex": 1}'::jsonb,
  'Anayasa m. 119 uyarınca tabii afet, tehlikeli salgın hastalık, ağır ekonomik bunalım veya kamu düzenini bozan şiddet olaylarında Cumhurbaşkanı yurdun tamamında veya bir bölgesinde süresi 6 AYI GEÇMEMEK ÜZERE OHAL ilan edebilir. Karar aynı gün Resmî Gazete''de yayımlanır ve TBMM onayına sunulur.',
  'OHAL ilanını Cumhurbaşkanı en çok 6 aylığına yapar; ilan edilen OHAL''i uzatma yetkisi ise TBMM''dedir (her defasında en çok 4 ay uzatabilir).',
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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  'Cumhurbaşkanı tarafından ilan edilen Olağanüstü Hal (OHAL) süresini, Cumhurbaşkanı''nın talebi üzerine her defasında en çok kaç ay süreyle uzatmaya TBMM yetkilidir?',
  '{"options": ["1 ay", "2 ay", "3 ay", "4 ay", "6 ay"], "correctIndex": 3}'::jsonb,
  'TBMM, OHAL süresini değiştirebilir, kaldırabilir veya Cumhurbaşkanı''nın istemiyle her defasında 4 AYI GEÇMEMEK üzere uzatabilir (Savaş halinde 4 aylık sınır aranmaz).',
  'İlan süresi = En çok 6 ay (Cumhurbaşkanı); Uzatma süresi = Her defasında en çok 4 ay (TBMM)!',
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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  'Milli Güvenlik Kurulu''nun (MGK) gündemini kim belirler ve toplantılarına kim başkanlık eder?',
  '{"options": ["Gündemi Genelkurmay Başkanı belirler, toplantıya Cumhurbaşkanı başkanlık eder.", "Gündemi Cumhurbaşkanı yardımcıları ve Genelkurmay Başkanı''nın önerilerini dikkate alarak Cumhurbaşkanı belirler ve toplantıya Cumhurbaşkanı başkanlık eder.", "Gündemi İçişleri Bakanı belirler, TBMM Başkanı yönetir.", "Gündemi Savunma Bakanı belirler, MGK Genel Sekreteri yönetir.", "Gündemi MİT Başkanı belirler, Cumhurbaşkanı yardımcısı yönetir."], "correctIndex": 1}'::jsonb,
  'Anayasa m. 118 uyarınca MGK gündemi; Cumhurbaşkanı yardımcıları ve Genelkurmay Başkanının önerileri dikkate alınarak Cumhurbaşkanınca düzenlenir. MGK''ya Cumhurbaşkanı başkanlık eder (katılamazsa Cumhurbaşkanı Yardımcısı vekalet eder).',
  'MGK iki ayda bir toplanır, kararları tavsiye niteliğindedir. Cumhurbaşkanı yoksa yardımcısı başkanlık eder.',
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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  'Aşağıdakilerden hangisi Milli Güvenlik Kurulu''nun (MGK) anayasal üyeleri arasında YER ALMAZ?',
  '{"options": ["Adalet Bakanı", "Milli Savunma Bakanı", "İçişleri Bakanı", "Dışişleri Bakanı", "TBMM Başkanı"], "correctIndex": 4}'::jsonb,
  'TBMM Başkanı yasama organının başıdır; yürütmenin danışma organı olan MGK''nın üyesi DEĞİLDİR! MGK üyeleri: Cumhurbaşkanı, CB Yardımcıları, Adalet, İçişleri, Dışişleri ve Milli Savunma Bakanları ile Genelkurmay Başkanı, Kara, Deniz ve Hava Kuvvetleri Komutanlarıdır (Jandarma 2016''da çıkarıldı!).',
  'TBMM Başkanı ve Jandarma Genel Komutanı MGK ÜYESİ DEĞİLDİR!',
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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  'TBMM Genel Kurulu''nda bir kanun veya kararın kabul edilebilmesi için geçerli olan ''Karar Yeter Sayısı'' kuralı aşağıdakilerden hangisidir?',
  '{"options": ["Her zaman üye tamsayısının salt çoğunluğu (301)", "Toplantıya katılanların salt çoğunluğudur; ancak bu sayı hiçbir şekilde üye tamsayısının dörtte birinin bir fazlasından (151 milletvekilinden) az olamaz", "Toplantıya katılanların üçte ikisi", "Her zaman en az 200 milletvekili", "Meclis Başkanı''nın tek oyu"], "correctIndex": 1}'::jsonb,
  'Anayasa m. 96: ''TBMM, yapacağı seçimler dahil bütün işlerinde üye tamsayısının en az üçte biri ile toplanır. Anayasada başkaca bir hüküm yoksa toplantıya katılanların salt çoğunluğu ile karar verir; ancak karar yeter sayısı hiçbir şekilde üye tamsayısının dörtte birinin bir fazlasından (151) az olamaz.''',
  'En düşük meclis karar yeter sayısı 151''dir! Örneğin 200 kişiyle toplanmış mecliste 101 ile karar alınamaz, en az 151 kabul gerekir.',
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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  'Milletlerarası andlaşmaların Türk hukukundaki yeri düşünüldüğünde, usulüne göre yürürlüğe konulmuş temel hak ve özgürlüklere ilişkin milletlerarası andlaşmalar ile kanunların aynı konuda farklı hükümler içermesi halinde ortaya çıkan uyuşmazlıkta hangisi esas alınır?',
  '{"options": ["TBMM tarafından çıkarılan kanun hükümleri", "Milletlerarası andlaşma hükümleri", "Cumhurbaşkanlığı Kararnamesi", "Danıştay içtihadı", "Uyuşmazlık Mahkemesi kararı"], "correctIndex": 1}'::jsonb,
  'Anayasa m. 90 son fıkrası gereğince: Usulüne göre yürürlüğe konulmuş temel hak ve özgürlüklere ilişkin milletlerarası andlaşmalarla kanunların aynı konuda farklı hükümler içermesi nedeniyle çıkabilecek uyuşmazlıklarda MİLLETLERARASI ANDLAŞMA hükümleri esas alınır.',
  'Temel haklara ilişkin uluslararası sözleşmeler ile kanun çatışırsa sözleşme üstün tutulur; ayrıca usulüne göre yürürlüğe konulmuş andlaşmalar aleyhine AYM''ye iptal davası açılamaz!',
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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  'TBMM Başkanlık Divanı kimlerden oluşur ve Meclis Başkanı seçimi en fazla kaç turda tamamlanır?',
  '{"options": ["Meclis Başkanı, Başkanvekilleri, Katip Üyeler ve İdare Amirlerinden oluşur — En çok 4 turda tamamlanır", "Yalnızca Meclis Başkanı ve Bakanlardan oluşur — 2 turda tamamlanır", "Meclis Başkanı ve Komisyon Başkanlarından oluşur — 3 turda tamamlanır", "Cumhurbaşkanı ve Meclis Başkanından oluşur — Tek turda biter", "Sadece siyasi parti grup başkanlarından oluşur — 5 turda tamamlanır"], "correctIndex": 0}'::jsonb,
  'Başkanlık Divanı; Meclis Başkanı, Başkanvekilleri, Kâtip Üyeler ve İdare Amirlerinden oluşur. Meclis Başkanı seçimi gizli oyla en çok 4 turda tamamlanır (1. ve 2. turda 400 oy; 3. turda 301 oy; 4. turda en çok oyu alan 2 adaydan en çok oyu alan seçilir).',
  'TBMM Başkanı 4 turlu gizli oylamayla seçilir. İlk iki turda 400 (2/3), üçüncü turda 301 (salt çoğunluk) aranır.',
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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  'Anayasa Mahkemesi''nin ''Somut Norm Denetimi'' (İtiraz Yolu) ile önüne gelen bir kanun maddesini inceleyebilmesi için aşağıdakilerden hangisi zorunlu bir şarttır?',
  '{"options": ["En az 120 milletvekilinin AYM''ye dilekçe vermesi", "Görülmekte olan bir davanın bulunması, itiraz konusu kuralın o davada uygulanacak norm olması ve mahkemenin anayasaya aykırılık iddiasını ciddi bulması", "Cumhurbaşkanı''nın onay vermesi", "Davanın doğrudan Yargıtay Ceza Genel Kurulu''nda olması", "Kanunun yürürlüğe girmesinden itibaren 60 günün geçmemiş olması"], "correctIndex": 1}'::jsonb,
  'Somut norm denetimi (m. 152); bakılmakta olan somut bir davada hakimin uygulayacağı kanun maddesini anayasaya aykırı görmesi veya tarafların iddiasını ciddi bulmasıyla AYM''ye başvurmasıdır. Dava yoksa itiraz yolu işletilemez.',
  'Soyut norm denetimi (İptal davası) 60 gün içinde açılır; Somut norm denetiminde (İtiraz) ise herhangi bir süre sınırı yoktur, dava sürdüğü sürece her zaman başvurulabilir.',
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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  3,
  'Somut norm denetimi (itiraz yolu) ile önüne gelen bir kanun maddesini esastan inceleyen Anayasa Mahkemesi, kanunun anayasaya aykırı olmadığına karar verip iptal istemini reddederse, aynı kanun hükmünün anayasaya aykırılığı iddiasıyla kaç yıl geçmedikçe yeniden itiraz başvurusu yapılamaz?',
  '{"options": ["1 yıl", "3 yıl", "5 yıl", "10 yıl", "Ömür boyu"], "correctIndex": 3}'::jsonb,
  'Anayasa m. 152 son fıkrası: ''Anayasa Mahkemesinin işin esasına girerek verdiği red kararının Resmî Gazetede yayımlanmasından sonra on yıl geçmedikçe aynı kanun hükmünün Anayasaya aykırılığı iddiasıyla tekrar başvuruda bulunulamaz.''',
  'Red kararından sonra ON YIL (10 yıl) geçmedikçe hiçbir mahkeme aynı maddeyi itiraz yoluyla AYM''ye taşıyamaz!',
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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  3,
  'Sayıştay ile Danıştay kararları arasındaki ilişki düşünüldüğünde anayasal kural aşağıdakilerden hangisidir?',
  '{"options": ["Sayıştay kararları her durumda Danıştay kararlarından üstündür.", "Vergi, benzeri mali yükümlülükler ve ödevler hakkında Danıştay ile Sayıştay kararları arasındaki uyuşmazlıklarda Danıştay kararları esas alınır.", "Aralarındaki uyuşmazlığı çözmek üzere dosya Uyuşmazlık Mahkemesi''ne gider.", "Sayıştay kararları Danıştay tarafından bozulabilir.", "İki kurum arasında hiçbir zaman görüş ayrılığı çıkamaz."], "correctIndex": 1}'::jsonb,
  'Anayasa m. 160 açık hükmüdür: ''Vergi, benzeri mali yükümlülükler ve ödevler hakkında Danıştay ile Sayıştay kararları arasındaki uyuşmazlıklarda Danıştay kararları esas alınır.''',
  'Vergi uyuşmazlığında Sayıştay değil, DANIŞTAY kararı üstün tutulur; dosya Uyuşmazlık Mahkemesi''ne gitmez, anayasa doğrudan Danıştay''ı üstün kılmıştır.',
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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  3,
  'Anayasa Mahkemesi kararlarının nitelikleri ile ilgili aşağıdaki ifadelerden hangisi yanlıştır?',
  '{"options": ["Anayasa Mahkemesi kararları kesindir.", "İptal kararları gerekçesi yazılmadan açıklanamaz.", "Anayasa Mahkemesi bir kanun hükmünü iptal ederken, kanun koyucu gibi hareketle yeni bir uygulamaya yol açacak biçimde hüküm tesis edemez.", "Anayasa Mahkemesi''nin iptal kararları kural olarak geriye yürür ve geçmişe etkili sonuç doğurur.", "İptal kararları Resmî Gazete''de yayımlandığı anda yürürlüğe girer (yürürlük tarihi en çok 1 yıla kadar ertelenebilir)."], "correctIndex": 3}'::jsonb,
  'Anayasa m. 153''ün en temel kuralı: ''İptal kararları GERİYE YÜRÜMEZ.'' İptal edilen kanuna dayanılarak geçmişte yapılmış işlemler geçerliliğini korur; iptal kararı kural olarak geleceğe etkilidir.',
  'İdari yargıdaki (Danıştay) iptal kararları geçmişe yürür; ancak Anayasa Mahkemesi''nin kanun iptal kararları KESİNLİKLE GERİYE YÜRÜMEZ!',
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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  3,
  'Hakimler ve Savcılar Kurulu''nun (HSK) 13 üyesinin seçim dağılımı aşağıdakilerin hangisinde eksiksiz ve doğru verilmiştir?',
  '{"options": ["Adalet Bakanı (Başkan), Adalet Bakanlığı Müsteşarı (Bakan Yrd.), 4 üyeyi Cumhurbaşkanı, 7 üyeyi TBMM seçer", "13 üyenin tamamını TBMM seçer", "13 üyenin tamamını Cumhurbaşkanı seçer", "7 üyeyi Cumhurbaşkanı, 4 üyeyi TBMM seçer", "Yarısını Yargıtay, yarısını Danıştay seçer"], "correctIndex": 0}'::jsonb,
  'HSK 13 üyeden oluşur: 1 Adalet Bakanı (Başkan), 1 Bakan Yardımcısı (tabii üye). Kalan 11 üyenin 4''ünü doğrudan Cumhurbaşkanı, 7''sini ise TBMM Genel Kurulu (nitelikli çoğunlukla) seçer.',
  'HSK''da Cumhurbaşkanı 4 üye, TBMM ise 7 üye seçer (4+7=11 + 2 tabii üye = 13).',
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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  3,
  'Kanunların ve TBMM İçtüzüğü''nün Anayasa''ya aykırılığı iddiasıyla doğrudan doğruya Anayasa Mahkemesi''nde ''İptal Davası'' (Soyut Norm Denetimi) açabilecek yetkililer kimlerdir?',
  '{"options": ["Sadece Adalet Bakanı ve Danıştay Başkanı", "Cumhurbaşkanı, TBMM''de en fazla üyeye sahip iki siyasi parti grubu ve TBMM üye tamsayısının en az beşte biri (120 milletvekili)", "Herhangi bir vatandaş veya baro başkanı", "TBMM Başkanı ve Başsavcı", "Yalnızca ana muhalefet partisi genel başkanı"], "correctIndex": 1}'::jsonb,
  'Anayasa m. 150 uyarınca doğrudan iptal davası açma hakkı: Cumhurbaşkanına, Meclis''te en fazla üyeye sahip iki siyasi parti grubuna (iktidar ve ana muhalefet) ve TBMM üye tamsayısının en az beşte birine (120 milletvekili) aittir.',
  'İptal davası açma yetkisi sadece bu üç mercidedir; başka hiçbir kurum veya kişi kanun iptali için AYM''ye doğrudan dava açamaz.',
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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  3,
  'TBMM seçimleri devam ederken Cumhurbaşkanlığı makamının herhangi bir nedenle (ölüm, istifa vb.) boşalması halinde genel seçimlere 1 yıldan FAZLA süre kalmışsa ne yapılır?',
  '{"options": ["TBMM Başkanı derhal yeni Cumhurbaşkanı atanır.", "Cumhurbaşkanlığı makamının boşaldığı günden başlayarak 45 gün içindeki son pazar günü sadece Cumhurbaşkanı seçimi yapılır.", "Seçimler 1 yıl sonraya ertelenir.", "Bakanlar Kurulu kendi arasından bir başkan seçer.", "Genelkurmay Başkanı görevi devralır."], "correctIndex": 1}'::jsonb,
  'Genel seçime 1 yıldan FAZLA süre varken makam boşalırsa 45 gün içinde SADECE Cumhurbaşkanı seçimi yapılır ve seçilen kişi TBMM''nin görev süresini tamamlar. Eğer genel seçime 1 yıldan AZ süre kalmışsa 60 gün içinde TBMM ve Cumhurbaşkanı seçimi BİRLİKTE yenilenir.',
  '1 yıldan çok varsa = 45 günde sadece CB seçimi; 1 yıldan az varsa = 60 günde TBMM + CB seçimi birlikte!',
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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  3,
  'Anayasa Mahkemesi''nin ''Yüce Divan'' sıfatıyla yargılayabileceği anayasal kişiler arasında aşağıdakilerden hangisi yer almaz?',
  '{"options": ["Cumhurbaşkanı ve Cumhurbaşkanı Yardımcıları", "Bakanlar", "TBMM Başkanı", "Milletvekilleri", "Genelkurmay Başkanı, Kara, Deniz ve Hava Kuvvetleri Komutanları"], "correctIndex": 3}'::jsonb,
  'Anayasa m. 148''de Yüce Divan''da yargılanacaklar tek tek sayılmıştır: Cumhurbaşkanı, yardımcıları, bakanlar, AYM, Yargıtay, Danıştay üyeleri ve başsavcıları, HSK ve Sayıştay üyeleri, TBMM Başkanı ve Kuvvet Komutanları. MİLLETVEKİLLERİ Yüce Divan''da yargılanmaz; dokunulmazlıkları kaldırılırsa genel ceza mahkemelerinde yargılanırlar.',
  'Milletvekilleri Yüce Divan''a gitmez! Normal adliye ceza mahkemelerinde (Ağır Ceza) yargılanırlar.',
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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  3,
  'Cumhurbaşkanlığı kararnamesi ile kanun arasındaki hiyerarşi düşünüldüğünde aşağıdakilerden hangisi doğrudan Cumhurbaşkanlığı Kararnamesi ile kurulabilir ve düzenlenebilir?',
  '{"options": ["Bakanlıkların kurulması, kaldırılması, görevleri, yetkileri ve teşkilat yapısı", "Vergilerin konulması ve kaldırılması", "Suç ve cezaların ihdası", "Siyasi partilerin kuruluş ve işleyişi", "Vatandaşlık kanunu"], "correctIndex": 0}'::jsonb,
  'Anayasa m. 106 açıkça ''Bakanlıkların kurulması, kaldırılması, görevleri ve yetkileri ile teşkilat yapısı Cumhurbaşkanlığı kararnamesi ile düzenlenir'' demektedir. Vergi, suç-ceza, siyasi partiler ve vatandaşlık ise yalnızca KANUNLA düzenlenebilir.',
  'Bakanlıklar artık kanunla değil; doğrudan CUMHURBAŞKANLIĞI KARARNAMESİ ile kurulur ve kaldırılır!',
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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  '1982 Anayasası''na göre TBMM bir yasama yılında EN ÇOK kaç ay tatil yapabilir ve tatil sırasında Meclis üyelerinin en az kaçının yazılı istemi üzerine TBMM Başkanı meclisi toplantıya çağırmak zorundadır?',
  '{"options": ["En çok 3 ay tatil yapabilir — Üye tamsayısının 1/5''i (120 milletvekili) istemiyle", "En çok 2 ay tatil yapabilir — Üye tamsayısının 1/3''ü (200 milletvekili) istemiyle", "En çok 1 ay tatil yapabilir — Üye tamsayısının salt çoğunluğu (301 vekil) istemiyle", "En çok 4 ay tatil yapabilir — 50 milletvekili istemiyle", "En çok 3 ay tatil yapabilir — Yalnızca Cumhurbaşkanı istemiyle"], "correctIndex": 0}'::jsonb,
  'Anayasa m. 93 uyarınca TBMM bir yasama yılında en çok 3 ay tatil yapabilir. Ara verme ise 15 günü geçemez. Cumhurbaşkanı ve TBMM Başkanı doğrudan; milletvekillerinin en az 1/5''i (120 vekil) yazılı talepte bulunursa TBMM Başkanı zorunlu olarak meclisi olağanüstü toplantıya çağırır.',
  'Meclis tatili en çok 3 aydır; meclisi toplantıya çağırma istemi için 1/5 (120 milletvekili) imzası gerekir.',
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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  'TBMM Genel Kurulu tarafından yasama dokunulmazlığı kaldırılan veya milletvekilliği düşürülen bir milletvekili, bu kararın iptali istemiyle kaç gün içinde Anayasa Mahkemesi''ne başvurabilir ve AYM bu başvuruyu en geç kaç gün içinde karara bağlar?',
  '{"options": ["7 gün içinde başvurur — Anayasa Mahkemesi 15 gün içinde kesin karara bağlar.", "15 gün içinde başvurur — Anayasa Mahkemesi 30 gün içinde karara bağlar.", "10 gün içinde başvurur — Anayasa Mahkemesi 10 gün içinde karara bağlar.", "30 gün içinde başvurur — Anayasa Mahkemesi 60 gün içinde karara bağlar.", "Yargı yolu kapalıdır, mahkemeye başvurulamaz."], "correctIndex": 0}'::jsonb,
  'Anayasa m. 85 uyarınca dokunulmazlığın kaldırılması veya vekilliğin düşürülmesi tarihinden itibaren 7 GÜN içinde milletvekilinin kendisi veya başka bir vekil AYM''ye iptal başvurusu yapabilir. Anayasa Mahkemesi başvuruyu 15 GÜN içinde kesin karara bağlamak zorundadır.',
  'ÖSYM''nin meşhur 7 - 15 gün kuralıdır: Başvuru süresi 7 GÜN, AYM''nin karar süresi 15 GÜNDÜR!',
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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  'Anayasa''nın 94. maddesine göre TBMM Başkanlığı seçimi gizli oyla en çok kaç turda tamamlanır ve 3. tur oylamada seçilebilmek için aranan asgari çoğunluk nedir?',
  '{"options": ["En çok 4 turda tamamlanır — 3. turda üye tamsayısının salt çoğunluğu (301 oy) aranır.", "En çok 3 turda tamamlanır — 3. turda en çok oy alan seçilir.", "En çok 4 turda tamamlanır — 3. turda 2/3 çoğunluk (400 oy) aranır.", "En çok 2 turda tamamlanır — 2. turda salt çoğunluk aranır.", "En çok 5 turda tamamlanır — 3. turda 360 oy aranır."], "correctIndex": 0}'::jsonb,
  'TBMM Başkanlık seçimi en çok 4 turda biter: 1. Turda 400 (2/3), 2. Turda 400 (2/3), 3. Turda 301 (Salt çoğunluk) aranır. 3. turda da seçilemezse en çok oy alan iki aday 4. tura kalır ve en çok oy alan (basit çoğunluk) başkan seçilir.',
  '1 ve 2. turlarda 400; 3. turda 301; 4. turda en çok oyu alan kazanır. Süreç en çok 4 tur sürer.',
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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  '1982 Anayasası''nın 101. maddesine göre Cumhurbaşkanlığına aday gösterilme usulü değerlendirildiğinde aşağıdakilerden hangisi doğrudan Cumhurbaşkanlığına aday gösteremez?',
  '{"options": ["TBMM''de grubu bulunan (en az 20 milletvekili olan) siyasi partiler", "En son yapılan genel seçimlerde tek başına veya birlikte geçerli oyların en az yüzde beşini (%5) almış olan siyasi partiler", "En az 100.000 seçmen", "Türkiye Barolar Birliği ve TOBB ortak imzası", "Birden fazla partinin ittifak yaparak oylarının toplamının %5''i bulması"], "correctIndex": 3}'::jsonb,
  'Anayasa m. 101 uyarınca CB adaylığı için üç meşru yol vardır: 1) Meclis grubu (20 vekil), 2) Son genel seçimde en az %5 oy almış partiler, 3) 100 bin seçmenin imzası. Meslek kuruluşları veya sendikalar aday gösteremez.',
  'CB adaylığı için oy oranı barajı %5''tir (seçim barajı olan %7 ile karıştırılmamalıdır); imza sayısı ise 100 bindir.',
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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  'Cumhurbaşkanlığı makamının herhangi bir nedenle boşalması (ölüm, istifa vb.) halinde yenisi seçilene kadar Cumhurbaşkanlığına kim vekalet eder ve yetkilerini kullanır?',
  '{"options": ["TBMM Başkanı", "Cumhurbaşkanı Yardımcısı", "Anayasa Mahkemesi Başkanı", "Adalet Bakanı", "En yaşlı milletvekili"], "correctIndex": 1}'::jsonb,
  '2017 değişikliği öncesinde TBMM Başkanı vekalet etmekteydi. 2017 anayasa reformuyla bu kural değişmiş olup makamın boşalması veya yurt dışına çıkış hallerinde vekalet yetkisi CUMHURBAŞKANI YARDIMCISINA verilmiştir.',
  'Eski anayasada vekil TBMM Başkanı idi; 2017 sonrasında vekil CUMHURBAŞKANI YARDIMCISIDIR!',
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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  '1982 Anayasası''nın 108. maddesinde düzenlenen ve doğrudan Cumhurbaşkanlığına bağlı olan Devlet Denetleme Kurulu''nun (DDK) inceleme ve denetleme yetkisi DIŞINDA bırakılan TEK ALAN aşağıdakilerden hangisidir?',
  '{"options": ["Türk Silahlı Kuvvetleri", "Kamu İktisadi Teşebbüsleri (KİT)", "Yargı Organları", "Meslek Kuruluşları ve Odalar", "Sendikalar ve Kamu Yararına Dernekler"], "correctIndex": 2}'::jsonb,
  'Anayasa m. 108 açık hükmüdür: ''Yargı organları, Devlet Denetleme Kurulunun görev alanı dışındadır.'' TSK, KİT''ler, vakıf ve dernekler ise DDK denetimine tabidir (2017''de TSK da DDK kapsamına alınmıştır).',
  '2017''den önce TSK denetlenemiyordu; 2017 ile TSK da DDK denetimine açıldı. DDK''nın denetleyemediği TEK ALAN YARGI ORGANLARIDIR!',
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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  'Adli ve idari yargı kolları arasındaki görev ve hüküm uyuşmazlıklarını kesin olarak çözmekle görevli olan Uyuşmazlık Mahkemesi''nin Başkanı aşağıdakilerden hangisi tarafından seçilir?',
  '{"options": ["Anayasa Mahkemesi kendi üyeleri arasından seçer.", "Yargıtay Büyük Genel Kurulu seçer.", "Danıştay Genel Kurulu seçer.", "Hakimler ve Savcılar Kurulu seçer.", "Cumhurbaşkanı doğrudan atar."], "correctIndex": 0}'::jsonb,
  'Anayasa m. 158 uyarınca: ''Uyuşmazlık Mahkemesinin Başkanlığını Anayasa Mahkemesince kendi üyeleri arasından görevlendirilen üye yapar.''',
  'Uyuşmazlık Mahkemesi Başkanı AYM üyeleri arasından Anayasa Mahkemesi tarafından seçilir!',
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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  'Anayasa''nın 160. maddesinde düzenlenen Sayıştay ile Danıştay''ın vergi, benzeri mali yükümlülükler ve ödevler konusundaki kesinleşmiş kararları arasında bir uyuşmazlık çıkarsa hangisinin kararı esas alınır?',
  '{"options": ["Danıştay kararları esas alınır.", "Sayıştay kararları esas alınır.", "Uyuşmazlık Mahkemesi''ne başvurulur.", "Anayasa Mahkemesi son sözü söyler.", "Hazine ve Maliye Bakanlığı''nın görüşü uygulanır."], "correctIndex": 0}'::jsonb,
  'Anayasa m. 160 son fıkrası gereğince: ''Vergi, benzeri mali yükümlülükler ve ödevler hakkında Danıştay ile Sayıştay kararları arasındaki uyuşmazlıklarda DANIŞTAY KARARLARI ESAS ALINIR.''',
  'Sayıştay hesap mahkemesidir ancak vergi konusunda uyuşmazlık çıkarsa yüksek idare mahkemesi olan DANIŞTAY''ın kararı üstündür.',
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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  'Cumhurbaşkanının tek başına imzaladığı veya anayasada özel olarak yargı denetimi dışına çıkarılan işlemler düşünüldüğünde aşağıdakilerden hangisine karşı YARGI YOLU AÇIKTIR?',
  '{"options": ["Olağan dönem Cumhurbaşkanlığı Kararnameleri", "Yüksek Seçim Kurulu (YSK) kararları", "Kamu Görevlileri Hakem Kurulu kararları", "Yüksek Askeri Şura''nın (YAŞ) terfi işlemleri ile kadrosuzluk nedeniyle emekliye ayırma kararları", "Hakimler ve Savcılar Kurulu''nun (HSK) kınama ve yer değiştirme kararları"], "correctIndex": 0}'::jsonb,
  'Olağan dönem Cumhurbaşkanlığı Kararnamelerine karşı Anayasa Mahkemesi''nde iptal davası açılabilir (yargı yolu açıktır). YSK, Hakem Kurulu ve YAŞ''ın terfi kararlarına karşı ise anayasal olarak yargı yolu kapalıdır.',
  'Olağan CBK''lar yargı denetimine (AYM) açıktır; OHAL CBK''lar ve YSK kararları ise yargıya kapalıdır.',
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
  'Yasama, Yürütme ve Yargı',
  'multiple_choice',
  2,
  'Anayasa Mahkemesi''nin Yüce Divan sıfatıyla verdiği mahkumiyet veya aklama kararlarına karşı anayasal olarak başvurulabilecek kanun yolu aşağıdakilerden hangisidir?',
  '{"options": ["Kararın tebliğinden itibaren 15 gün içinde Yüce Divan''da ''Yeniden İnceleme'' (itiraz) talep edilebilir; Genel Kurulun inceleme kararı kesindir.", "Yargıtay Ceza Genel Kurulu''na temyize gidilir.", "Danıştay İdari Dava Daireleri Kurulu''na itiraz edilir.", "Yüce Divan kararlarına karşı hiçbir itiraz veya kanun yolu yoktur, ilk karar kesindir.", "Doğrudan AİHM''e başvurulur."], "correctIndex": 0}'::jsonb,
  '2010 anayasa değişikliği ile Yüce Divan kararlarına karşı ''Yeniden İnceleme'' (itiraz) yolu getirilmiştir. Tebliğden itibaren 15 gün içinde itiraz edilir ve Anayasa Mahkemesi Genel Kurulu''nun itiraz üzerine verdiği karar kesindir.',
  'Eskiden Yüce Divan kararlarına itiraz edilemiyordu; 2010 değişikliği ile AYM Genel Kurulu''na 15 gün içinde ''Yeniden İnceleme'' başvurusu hakkı tanınmıştır.',
  50
);

COMMIT;
