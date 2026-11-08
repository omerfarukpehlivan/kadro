-- =============================================================
-- KPSS VATANDAŞLIK — KONU 5: İDARE HUKUKU
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
  'İdare Hukuku',
  'multiple_choice',
  1,
  'Türkiye''de taşra teşkilatında merkeze danışmadan merkez adına kendiliğinden karar alabilme ve uygulayabilme yetkisi olan ''Yetki Genişliği'' anayasal olarak yalnızca kime tanınmıştır?',
  '{"options": ["Kaymakam", "Vali", "İl Emniyet Müdürü", "Belediye Başkanı", "Köy Muhtarı"], "correctIndex": 1}'::jsonb,
  'Anayasa m. 126 uyarınca illerin idaresi ''yetki genişliği'' esasına dayanır. Türkiye''de yetki genişliğine sahip tek makam VALİ''dir. Kaymakamda veya diğer taşra amirlerinde yetki genişliği kesinlikle yoktur.',
  'ÖSYM''nin en popüler sorusudur: Yetki genişliği sadece İL''de ve sadece VALİ''dedir; Kaymakamda yetki genişliği YOKTUR!'
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
  'İdare Hukuku',
  'multiple_choice',
  1,
  'Aşağıdakilerden hangisi Anayasa''nın 127. maddesinde düzenlenen ''Mahalli İdareler'' (Yerel Yönetimler) arasında yer almaz?',
  '{"options": ["İl Özel İdaresi", "Belediye İdaresi", "Büyükşehir Belediyesi", "Köy İdaresi", "İlçe İdaresi (Kaymakamlık)"], "correctIndex": 4}'::jsonb,
  'Anayasa m. 127''de sayılan mahalli idareler üç tanedir: İl Özel İdaresi, Belediye ve Köy (Büyükşehir belediyesi de belediye statüsündedir). İlçe idaresi (Kaymakamlık) ise yerel yönetim değil, devletin merkezi taşra teşkilatıdır.',
  'İlçe idaresi mahalli idare değildir! Merkezi idarenin taşra uzantısıdır.'
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
  'İdare Hukuku',
  'multiple_choice',
  1,
  'Bir yerleşim yerinde belediye kurulabilmesi için asgari nüfusun en az kaç olması şarttır ve belediye hangi makamın kararı ile kurulur?',
  '{"options": ["Nüfusu en az 2.000 — İçişleri Bakanı kararı ile", "Nüfusu en az 5.000 — Cumhurbaşkanı kararı ile", "Nüfusu en az 10.000 — TBMM kanunu ile", "Nüfusu en az 50.000 — Vali onayı ile", "Nüfusu en az 750.000 — Cumhurbaşkanı kararı ile"], "correctIndex": 1}'::jsonb,
  '5393 sayılı Belediye Kanunu uyarınca nüfusu 5.000 ve üzerinde olan yerleşim yerlerinde CUMHURBAŞKANI KARARI ile belediye kurulabilir (İl ve ilçe merkezlerinde ise nüfus şartı aranmaksızın belediye kurulması zorunludur).',
  'Normal belediye = Nüfus 5.000 (Cumhurbaşkanı kararı); Büyükşehir belediyesi = Nüfus 750.000 (KANUNLA); Köy = Nüfus 150-2.000 (İçişleri Bakanlığı).'
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
  'İdare Hukuku',
  'multiple_choice',
  1,
  'Büyükşehir Belediyesi kurulabilmesi için toplam nüfusun en az kaç olması ve kuruluşun hangi işlemle yapılması şarttır?',
  '{"options": ["Nüfusu en az 250.000 — Cumhurbaşkanlığı Kararnamesi ile", "Nüfusu en az 500.000 — İçişleri Bakanlığı onayı ile", "Toplam il nüfusu en az 750.000 — KANUNLA", "Nüfusu en az 1.000.000 — Danıştay kararı ile", "Nüfusu en az 5.000 — Vali teklifi ile"], "correctIndex": 2}'::jsonb,
  '5216 sayılı Büyükşehir Belediyesi Kanunu uyarınca toplam il nüfusu fiziki yerleşim durumuna göre en az 750.000 olan illerde YALNIZCA KANUNLA (TBMM tarafından) Büyükşehir Belediyesi kurulabilir.',
  'Büyükşehir belediyesi Cumhurbaşkanı kararıyla değil, mutlaka TBMM tarafından çıkarılan KANUNLA kurulur!'
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
  'İdare Hukuku',
  'multiple_choice',
  1,
  '657 sayılı Devlet Memurları Kanunu''na göre aşağıdakilerden hangisi bir ''disiplin cezası'' DEĞİLDİR?',
  '{"options": ["Uyarma", "Kınama", "Aylıktan kesme", "Görevden uzaklaştırma", "Kademe ilerlemesinin durdurulması"], "correctIndex": 3}'::jsonb,
  '657 sayılı DMK m. 125''te disiplin cezaları 5 tanedir: 1) Uyarma, 2) Kınama, 3) Aylıktan kesme, 4) Kademe ilerlemesinin durdurulması, 5) Devlet memurluğundan çıkarma. ''Görevden uzaklaştırma'' bir disiplin cezası değil, soruşturmanın selameti için uygulanan geçici bir İDARİ TEDBİRDİR.',
  'Görevden uzaklaştırma ve sürgün/tayin disiplin cezası DEĞİLDİR! En klasik sınav tuzaklarından biridir.'
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
  'İdare Hukuku',
  'multiple_choice',
  1,
  'Vali ile Kaymakamın hukuki statüleri ve atanma usulleri karşılaştırıldığında aşağıdakilerden hangisi doğrudur?',
  '{"options": ["Vali meslek memurudur; Kaymakam istisnai memurdur.", "Vali Cumhurbaşkanı kararıyla atanır ve istisnai memurdur; Kaymakam ise Cumhurbaşkanı onayıyla atanır ve güvenceli bir meslek/kariyer memurudur.", "Her ikisi de İçişleri Bakanı tarafından atanır.", "Kaymakam yetki genişliğine sahiptir, vali sahip değildir.", "Vali olabilmek için kaymakamlık yapmış olmak zorunludur."], "correctIndex": 1}'::jsonb,
  'Valiler Cumhurbaşkanı Kararı ile atanır ve ''istisnai memur'' statüsündedir (Cumhurbaşkanı dilediği kişiyi vali atayabilir, görev süresi CB ile biter). Kaymakamlar ise sınavla girilen, staj yapılan kariyer/meslek memurudur ve Cumhurbaşkanı Onayı ile atanırlar.',
  'Vali = Cumhurbaşkanı KARARI (İstisnai memur); Kaymakam = Cumhurbaşkanı ONAYI (Kariyer/meslek memuru).'
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
  'İdare Hukuku',
  'multiple_choice',
  1,
  'Merkezi idarenin aynı kamu tüzel kişiliği (devlet tüzel kişiliği) içerisindeki üst makamlarının ast makamlar üzerindeki emir, talimat, denetim ve iptal yetkisine ne ad verilir?',
  '{"options": ["İdari Vesayet", "Hiyerarşi Yetkisi", "Yetki Genişliği", "Yetki Devri", "Özerklik"], "correctIndex": 1}'::jsonb,
  'Aynı tüzel kişilik içerisindeki ast-üst denetimine ''hiyerarşi'' denir (örneğin Bakanın Müsteşara/Valiye, Valinin Kaymakama, Rektörün Dekana, Emniyet Müdürünün polise emretmesi).',
  'Aynı çatı altındaki ast-üst ilişkisi = Hiyerarşi; İki farklı tüzel kişilik arasındaki dış denetim (Vali - Belediye) = İdari Vesayet.'
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
  'İdare Hukuku',
  'multiple_choice',
  1,
  'Merkezi idarenin (devletin) yerinden yönetim kuruluşları (belediyeler, köyler, meslek odaları) üzerinde idarenin bütünlüğünü ve kamu hizmetlerinin uyumunu sağlamak amacıyla kanunla sınırlı olarak kullandığı dış denetim yetkisine ne ad verilir?',
  '{"options": ["Hiyerarşi", "İdari Vesayet", "İmza Devri", "Düzenleyici İşlem", "İstişari Görüş"], "correctIndex": 1}'::jsonb,
  'Farklı kamu tüzel kişileri arasındaki denetime ''idari vesayet'' denir. Örneğin İçişleri Bakanlığı''nın belediyeleri denetlemesi, Barolar Birliği''nin yerel baroları denetlemesi vesayet denetimidir.',
  'Vesayet makamı yerinden yönetim kuruluşuna emir ve talimat veremez, onun yerine geçip işlem yapamaz; sadece onaylar, iptal davası açabilir veya geciktirebilir.'
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
  'İdare Hukuku',
  'multiple_choice',
  1,
  '657 sayılı Devlet Memurları Kanunu''na göre göreve yeni başlayan bir aday memurun adaylık süresi en az ve en çok ne kadardır?',
  '{"options": ["En az 6 ay — En çok 1 yıl", "En az 1 yıl — En çok 2 yıl", "En az 2 yıl — En çok 3 yıl", "En az 3 ay — En çok 6 ay", "Doğrudan asaleten başlar, adaylık yoktur"], "correctIndex": 1}'::jsonb,
  '657 sayılı DMK m. 54 uyarınca adaylık süresi 1 yıldan az, 2 yıldan çok olamaz. Adaylık devresi içinde göreve devamsızlık veya disiplinsizlik gösterenlerin memuriyetle ilişiği kesilir.',
  'Aday memurluk süresi: Asgari 1 yıl, azami 2 yıldır.'
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
  'İdare Hukuku',
  'multiple_choice',
  1,
  'Köy idaresinin karar organı olan ve köydeki tüm kadın-erkek seçmenlerin doğal olarak üyesi bulunduğu organ hangisidir?',
  '{"options": ["Köy İhtiyar Meclisi", "Köy Derneği", "İl Encümeni", "Köy Komisyonu", "Muhtarlık Divanı"], "correctIndex": 1}'::jsonb,
  'Köy Derneği; köyde ikamet eden ve oy kullanma hakkına sahip tüm kadın ve erkek köylülerin oluşturduğu doğrudan demokrasi organıdır. Muhtarı ve İhtiyar Meclisi üyelerini seçer, köyün isteğe bağlı işlerini zorunlu hale getirebilir.',
  'Köy Derneği sivil toplum derneği değildir; köyün tüm seçmenlerinden oluşan resmi anayasal köy organıdır.'
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
  'İdare Hukuku',
  'multiple_choice',
  2,
  'Hakkında görevleriyle ilgili bir suç sebebiyle soruşturma veya kovuşturma açılan bir Belediye Başkanını ''geçici bir tedbir olarak'' görevden uzaklaştırmaya yetkili makam hangisidir?',
  '{"options": ["Danıştay", "İçişleri Bakanı", "İl Valisi", "Cumhurbaşkanı", "Belediye Meclisi"], "correctIndex": 1}'::jsonb,
  'Anayasa m. 127 uyarınca görevleri ile ilgili bir suç sebebi ile hakkında soruşturma veya kovuşturma açılan mahalli idare organlarını veya bu organların üyelerini, İÇİŞLERİ BAKANI geçici bir tedbir olarak kesin hükme kadar uzaklaştırabilir.',
  'GEÇİCİ uzaklaştırmayı İçişleri Bakanı yapar; KESİN olarak başkanlık sıfatının düşürülmesine ise sadece DANIŞTAY karar verebilir!'
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
  'İdare Hukuku',
  'multiple_choice',
  2,
  'Görevden uzaklaştırılan veya belediye başkanlığı sıfatı tartışmalı hale gelen bir belediye başkanının ''başkanlık sıfatını kesin olarak düşürme'' yetkisi hangi yargı organına aittir?',
  '{"options": ["İçişleri Bakanlığı Yüksek Disiplin Kurulu", "Danıştay", "Yargıtay", "Anayasa Mahkemesi", "İdare Mahkemesi"], "correctIndex": 1}'::jsonb,
  'Seçimle gelen bir yerel yöneticinin görevine kesin olarak son verme yetkisi yargı güvencesi altındadır. Belediye başkanlığının kesin olarak düşmesine yalnızca DANIŞTAY karar verebilir.',
  'İçişleri Bakanı sadece geçici uzaklaştırabilir; başkanlığı kesin bitiren Danıştay''dır.'
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
  'İdare Hukuku',
  'multiple_choice',
  2,
  'Kamu görevlisinin amirinden aldığı emri hukuka aykırı görmesi durumu (Kanunsuz Emir - Anayasa m. 137) ile ilgili kurallar değerlendirildiğinde aşağıdakilerden hangisi yanlıştır?',
  '{"options": ["Kamu görevlisi amirinin verdiği emri anayasa ve kanunlara aykırı görürse yerine getirmez ve aykırılığı emri verene bildirir.", "Amir emrinde ısrar eder ve bu emrini yazılı olarak yenilerse memur emri yerine getirir; bu durumda sorumluluk emri verene ait olur.", "Konusu suç teşkil eden emir hiçbir surette yerine getirilemez; yerine getiren kimse sorumluluktan kurtulamaz.", "Konusu suç teşkil eden emir amir tarafından yazılı olarak tekrarlanırsa memur emri yapar ve tüm cezai sorumluluktan tamamen muaf tutulur.", "Askeri hizmetlerin görülmesi ve acele hallerde kamu düzeniyle ilgili kanuni istisnalar saklıdır."], "correctIndex": 3}'::jsonb,
  'Anayasa m. 137 son derece açıktır: ''Konusu suç teşkil eden emir, hiçbir suretle yerine getirilmez; yerine getiren kimse sorumluluktan kurtulamaz.'' Amir emri yazılı olarak verse, hatta tehdit etse bile konusu suç olan emir yerine getirilemez; getiren memur hapse girer.',
  'Kanuna aykırı emir yazılı tekrarlanırsa memur yapar ve sorumluluk amire geçer; ancak SUÇ TEŞKİL EDEN emir yazılı verilse bile ASLA YAPILAMAZ!'
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
  'İdare Hukuku',
  'multiple_choice',
  2,
  'İl Genel İdaresi''nin organları ile İl Özel İdaresi''nin organları karşılaştırıldığında;

• İl Özel İdaresi''nin başı ve yürütme organı olan,
• Aynı zamanda merkezi idarenin İl Genel İdaresi''ndeki en üst amiri olan
çift şapkalı makam aşağıdakilerden hangisidir?',
  '{"options": ["İl Genel Meclisi Başkanı", "Vali", "Büyükşehir Belediye Başkanı", "İl İdare Kurulu Başkanı", "Garnizon Komutanı"], "correctIndex": 1}'::jsonb,
  'Vali çift şapkalıdır: Hem merkezi idarenin ildeki temsilcisi (İl Genel İdaresi başı) hem de yerel yönetim olan İl Özel İdaresi''nin başı ve yürütme organıdır.',
  'İl Özel İdaresi''nin başı Vali''dir; karar organı ise halkın seçtiği İl Genel Meclisi''dir.'
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
  'İdare Hukuku',
  'multiple_choice',
  2,
  'Köy İhtiyar Meclisi''nin doğal (tabii) üyeleri aşağıdakilerden hangisinde birlikte verilmiştir?',
  '{"options": ["Köy Muhtarı ve Köy Korucusu", "Köy İmamı ve Köy Öğretmeni", "Köy Ebeleri ve Ziraat Mühendisi", "En yaşlı köylü ve Muhtar", "Köy Bakkalı ve Cami Dernek Başkanı"], "correctIndex": 1}'::jsonb,
  'Köy Kanunu uyarınca İhtiyar Meclisi üyelerinin bir kısmı Köy Derneği tarafından seçilir. Köyün İMAMI ve ilkokul ÖĞRETMENİ ise seçim yapılmaksızın heyetin tabii (doğal) üyeleridir.',
  'Köyün imamı ve öğretmeni İhtiyar Meclisi''nin kanuni tabii üyeleridir.'
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
  'İdare Hukuku',
  'multiple_choice',
  2,
  '657 sayılı Devlet Memurları Kanunu''na göre memurlara verilen disiplin cezalarından hangileri doğrudan ''Disiplin Amiri'' (Birim Amiri/Müdür) tarafından tek başına verilebilir?',
  '{"options": ["Yalnızca Devlet memurluğundan çıkarma", "Uyarma, Kınama ve Aylıktan Kesme cezaları", "Kademe ilerlemesinin durdurulması ve İhraç", "Tüm disiplin cezaları sadece mahkemelerce verilir", "Disiplin amirleri hiçbir ceza veremez"], "correctIndex": 1}'::jsonb,
  'Uyarma, kınama ve aylıktan kesme cezaları soruşturma sonrası doğrudan disiplin amirleri tarafından verilir. Kademe ilerlemesinin durdurulmasını İl Disiplin Kurulu kararıyla Vali (veya bakanlık disiplin kurulu); Memurluktan çıkarmayı ise Yüksek Disiplin Kurulu verir.',
  'Memurluktan çıkarma cezasını disiplin amiri değil, sadece YÜKSEK DİSİPLİN KURULU verebilir.'
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
  'İdare Hukuku',
  'multiple_choice',
  2,
  'Kamu tüzel kişiliği (KTK) anayasa veya kanunla ya da Cumhurbaşkanlığı kararnamesi ile kurulur.

Aşağıdakilerden hangisi doğrudan ''Devlet Tüzel Kişiliği'' içerisinde yer alır (ayrı bir kamu tüzel kişiliği BULUNMAZ)?',
  '{"options": ["Ankara Üniversitesi", "Türkiye Radyo ve Televizyon Kurumu (TRT)", "İstanbul Barosu", "Milli Savunma Bakanlığı ve Emniyet Genel Müdürlüğü", "Kadıköy Belediyesi"], "correctIndex": 3}'::jsonb,
  'Bakanlıklar, Emniyet, Valilikler ve Kaymakamlıklar genel idarenin parçasıdır; ayrı kamu tüzel kişilikleri yoktur, ''Devlet Tüzel Kişiliği''ni kullanırlar. Üniversiteler, TRT, Barolar ve Belediyeler ise ayrı kamu tüzel kişiliğine sahiptir.',
  'Bakanlıkların ayrı tüzel kişiliği YOKTUR; hepsi tek bir Devlet Tüzel Kişiliği''nin kollarıdır.'
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
  'İdare Hukuku',
  'multiple_choice',
  2,
  'Köyde imece usulü ile tüm köylülerin ortaklaşa çalışarak köy yolunu veya çeşmesini yapması kuralının yanında; köy bütçesine katkı sağlamak amacıyla hane başına toplanan yerel vergi benzeri paraya ne ad verilir?',
  '{"options": ["Salma", "Öşür", "Haraç", "İltizam", "Cizye"], "correctIndex": 0}'::jsonb,
  'Köy Kanunu''na göre köyün zorunlu ortak harcamalarını karşılamak üzere İhtiyar Meclisi kararıyla hane reislerinin gelirine göre salınan yerel paraya ''Salma'' denir. Bedenen çalışmaya ise ''İmece'' denir.',
  'Bedenle çalışma = İmece; Parayla katkı = Salma. Köy idaresinin iki özgün aracıdır.'
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
  'İdare Hukuku',
  'multiple_choice',
  2,
  'İçişleri Bakanlığı, Cumhurbaşkanlığı Kararnameleri ve Yönetmelikler çıkarabilen idari düzenleyici işlemler tesis eder.

Cumhurbaşkanı, bakanlıklar ve kamu tüzel kişilerinin kendi görev alanlarını ilgilendiren kanun ve Cumhurbaşkanlığı kararnamelerinin uygulanmasını sağlamak üzere çıkardıkları düzenleyici işlem hangisidir?',
  '{"options": ["Yönetmelik", "Kanun Hükmünde Kararname", "Tüzük", "Yasa Gücünde Karar", "İçtihadı Birleştirme Kararı"], "correctIndex": 0}'::jsonb,
  'Anayasa m. 124 gereğince Cumhurbaşkanı, bakanlıklar ve kamu tüzel kişileri görev alanlarını ilgilendiren kanunların uygulanmasını göstermek üzere ''Yönetmelik'' çıkarabilirler. Tüzük ve KHK 2017''de yürürlükten kalkmıştır.',
  'Tüzük ve KHK artık yoktur! Güncel düzenleyici işlemler: CBK ve Yönetmeliktir.'
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
  'İdare Hukuku',
  'multiple_choice',
  2,
  'Aşağıdakilerden hangisi Cumhurbaşkanlığı teşkilatında ''idari vesayet'' yetkisine bir örnektir?',
  '{"options": ["İçişleri Bakanı''nın Emniyet Genel Müdürü''nü denetlemesi", "Vali''nin İl Milli Eğitim Müdürü''ne talimat vermesi", "Çevre, Şehircilik ve İklim Değişikliği Bakanlığı''nın bir ilçe belediyesinin imar planını denetlemesi", "Kaymakamın İlçe Nüfus Müdürü''nün sicilini doldurması", "Sağlık Bakanı''nın Başhekimi görevden alması"], "correctIndex": 2}'::jsonb,
  'Bakanlık devlet tüzel kişiliğidir; belediye ise ayrı bir mahalli kamu tüzel kişiliğidir. Bakanlığın belediyeyi denetlemesi iki ayrı tüzel kişilik arasında olduğu için ''idari vesayet''tir. Diğer tüm şıklar aynı çatı altındaki ''hiyerarşi''dir.',
  'Devletin belediyeyi veya üniversiteyi denetlemesi = Vesayet; Devletin kendi müdürünü denetlemesi = Hiyerarşi.'
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
  'İdare Hukuku',
  'multiple_choice',
  2,
  'İdarenin tek taraflı irade beyanıyla ilgililerin rızası aranmaksızın hukuki sonuç doğuran, uygulanabilir ve hukuka uygun olduğu varsayılan işlemlerine ''İdari İşlem'' denir.

Aşağıdakilerden hangisi idari işlemlerin temel özelliklerinden biri DEĞİLDİR?',
  '{"options": ["Tek yanlı olması (karşı tarafın kabulüne bağlı olmaması)", "İcrai (yürütülebilir) olması", "Hukuka uygunluk karinesinden yararlanması (mahkemece iptal edilene kadar geçerli sayılması)", "Kamu gücüne dayanması", "İki tarafın karşılıklı rızası ve irade uyuşmasıyla doğması"], "correctIndex": 4}'::jsonb,
  'İdari işlemler tek yanlıdır, kamu gücüne dayanır, doğrudan uygulanabilir (icrailik) ve mahkemece aksi ispatlanıp iptal edilene kadar hukuka uygun kabul edilir (hukuka uygunluk karinesi). İki tarafın karşılıklı rızası ve irade uyuşması idari sözleşmelerde söz konusudur; tek taraflı idari işlemlerde muhatabın rızası aranmaz.',
  'İdari işlemler tek yanlıdır; muhatabın rızası veya onayı şart değildir (örneğin kamulaştırma, vergi cezası, memur tayini).'
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
  'İdare Hukuku',
  'multiple_choice',
  2,
  'İdare ile özel kişiler arasında kamu hizmetlerinin gördürülmesi amacıyla akdedilen ''Kamu Hizmeti İmtiyaz Sözleşmeleri'' imzalanmadan önce Anayasa gereği düşüncesi alınması zorunlu olan yüksek yargı organı aşağıdakilerden hangisidir?',
  '{"options": ["Yargıtay", "Danıştay", "Sayıştay", "Anayasa Mahkemesi", "Uyuşmazlık Mahkemesi"], "correctIndex": 1}'::jsonb,
  'Anayasa m. 155 uyarınca kamu hizmetleri ile ilgili imtiyaz şartlaşma ve sözleşmeleri hakkında DANIŞTAY''ın iki ay içinde düşüncesini bildirmesi zorunludur.',
  'ÖSYM bu soruda Danıştay ile Sayıştay''ı karşı karşıya getirir. Sayıştay mali denetim yapar; imtiyaz sözleşmelerinde istişari düşünce bildiren yüksek yargı mercii DANIŞTAY''dır (inceleme süresi en fazla 2 aydır).'
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
  'İdare Hukuku',
  'multiple_choice',
  2,
  '2942 sayılı Kamulaştırma Kanunu''na göre idare ile taşınmaz sahibi arasında uzlaşma sağlanamaması halinde, kamulaştırma bedelinin tespiti ve taşınmazın idare adına tescili için açılacak dava hangi mahkemede görülür?',
  '{"options": ["İdare Mahkemesi", "Vergi Mahkemesi", "Asliye Hukuk Mahkemesi", "Danıştay", "Sulh Hukuk Mahkemesi"], "correctIndex": 2}'::jsonb,
  'Kamulaştırmada ''bedel tespiti ve tescil'' davası adli yargı kolunda yer alan ASLİYE HUKUK MAHKEMESİ''nde görülür. Kamulaştırma işleminin kamu yararına veya hukuka aykırılığı nedeniyle işlemin kendisine karşı açılacak iptal davası ise idari yargıda (İdare Mahkemesi) açılır.',
  'En klasik ÖSYM çeldiricisidir: Kamulaştırma idari bir işlem olsa da, BEDEL TESPİTİ ve TESCİL davası adli mahkeme olan Asliye Hukuk Mahkemesi''nde görülür!'
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
  'İdare Hukuku',
  'multiple_choice',
  2,
  'İdari yargılama hukukunda; hukuka aykırı bir idari işlemin geçmişe etkili olarak hukuk aleminden kaldırılmasını talep eden davaya ne ad verilir?',
  '{"options": ["Tam Yargı Davası", "İptal Davası", "Menfi Tespit Davası", "İstirdat Davası", "Tasfiye Davası"], "correctIndex": 1}'::jsonb,
  'İptal davası; idari işlemlerin yetki, şekil, sebep, konu ve maksat yönlerinden hukuka aykırı olduklarından dolayı menfaatleri ihlal edilenler tarafından açılan ve işlemin iptalini (hukuk düzeninden kaldırılmasını) sağlayan davadır. Bir zararın giderilmesi veya tazminat talebi ise ''Tam Yargı Davası'' ile istenir.',
  'İptal Davası = İşlemin ortadan kaldırılması (hukuka aykırılık); Tam Yargı Davası = Maddi veya manevi tazminat (zararın ödenmesi).'
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
  'İdare Hukuku',
  'multiple_choice',
  2,
  '657 sayılı Devlet Memurları Kanunu''na göre disiplin amirleri veya kurulları tarafından memura bir disiplin cezası verilebilmesi için, memura savunmasını yapması amacıyla EN AZ kaç günlük süre tanınması zorunludur?',
  '{"options": ["3 gün", "7 gün", "10 gün", "15 gün", "30 gün"], "correctIndex": 1}'::jsonb,
  '657 sayılı DMK m. 130 uyarınca devlet memuru hakkında savunması alınmadan disiplin cezası verilemez. Soruşturmayı yapan veya yetkili disiplin amiri memura savunmasını yapması için EN AZ 7 GÜN süre tanımak zorundadır. Bu süre verilmeden ceza tesis edilirse işlem şekil yönünden iptal edilir.',
  'Disiplin savunma süresi kanunda açıkça EN AZ 7 GÜN olarak belirlenmiştir. 10 veya 15 gün çeldiricilerine dikkat edilmelidir.'
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
  'İdare Hukuku',
  'multiple_choice',
  2,
  '657 sayılı Devlet Memurları Kanunu''na göre hizmet süresi 1 yıldan 10 yıla kadar (10 yıl dahil) olan bir devlet memurunun yıllık izin süresi kaç gündür?',
  '{"options": ["15 gün", "20 gün", "25 gün", "30 gün", "45 gün"], "correctIndex": 1}'::jsonb,
  '657 sayılı DMK m. 102 uyarınca memurların yıllık izin süresi: Hizmeti 1 yıldan 10 yıla kadar olanlar için 20 GÜN; hizmeti 10 yıldan fazla olanlar için ise 30 GÜNDÜR.',
  '1-10 yıl arası = 20 gün; 10 yılı aşan memurlar = 30 gün izin hakkına sahiptir. 15 gün çeldiricisi iş kanunundaki işçilerle karıştırılmamalıdır.'
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
  'İdare Hukuku',
  'multiple_choice',
  2,
  '657 sayılı Devlet Memurları Kanunu''nda düzenlenen mazeret izinleri kapsamında; eşi doğum yapan erkek memura isteği üzerine kaç gün babalık izni verilir?',
  '{"options": ["3 gün", "5 gün", "7 gün", "10 gün", "15 gün"], "correctIndex": 3}'::jsonb,
  '657 sayılı DMK m. 104/B uyarınca memura eşinin doğum yapması halinde isteği üzerine 10 GÜN babalık izni verilir. Evlilik, kendisinin veya çocuğunun evlenmesi, eşinin, çocuğunun, anne-babasının veya kardeşinin vefatı halinde ise 7 gün izin verilir.',
  'Babalık izni 10 gündür! Evlilik ve ölüm izinleri ise 7 gündür. Bu iki süre ÖSYM tarafından sıkça yer değiştirilerek sorulur.'
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
  'İdare Hukuku',
  'multiple_choice',
  2,
  'Türk Hukukunda Normlar Hiyerarşisi değerlendirildiğinde aşağıdakilerden hangisi idarenin düzenleyici işlemleri arasında yer alıp Cumhurbaşkanlığı Kararnameleri ve Kanunların altında, yönetmeliklerin ise altında veya yürütülmesine dair talimat niteliğinde yer alan adsız düzenleyici işlemlerden biridir?',
  '{"options": ["Genelge (Tamim)", "Uluslararası Andlaşma", "Temel Haklara İlişkin Kanun", "Olağanüstü Hal Cumhurbaşkanlığı Kararnamesi", "Anayasa Değişikliği"], "correctIndex": 0}'::jsonb,
  'Normlar Hiyerarşisinde sıra: Anayasa > Kanun/Uluslararası Andlaşma/Olağanüstü Hal CBK > Olağan CBK > Yönetmelik > Adsız Düzenleyici İşlemler (Genelge, Yönerge, Sirküler, Tebliğ). Genelge (tamim), yönetmelik ve kanunların ast makamlara nasıl uygulanacağını gösteren düzenleyici idari işlemlerdir.',
  'Genelgeler (tamim/sirküler), normlar piramidinde yönetmeliklerin de altında yer alan idari düzenlemelerdir.'
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
  'İdare Hukuku',
  'multiple_choice',
  2,
  'İl idaresinde Vali ile İl İdare Şube Başkanları (örneğin İl Defterdarı, İl Milli Eğitim Müdürü, İl Sağlık Müdürü) arasındaki hukuki denetim ilişkisi aşağıdakilerden hangisidir?',
  '{"options": ["İdari Vesayet", "Hiyerarşi", "Yargısal Denetim", "İstişari Yetki", "Özerklik İlişkisi"], "correctIndex": 1}'::jsonb,
  'Vali de il idare şube başkanları da aynı kamu tüzel kişiliği olan ''Devlet Tüzel Kişiliği'' çatısı altındadır. Aynı kamu tüzel kişiliği içindeki ast-üst emir, talimat, sicil ve denetim ilişkisine ''HİYERARŞİ'' denir.',
  'Aynı kamu tüzel kişiliği içindeysen HİYERARŞİ; iki ayrı kamu tüzel kişiliği arasındaysan (Devletin Belediyeyi veya Üniversiteyi denetlemesi gibi) İDARİ VESAYET olur.'
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
  'İdare Hukuku',
  'multiple_choice',
  2,
  'Anayasa''nın 127. maddesine göre görevleri sebebiyle haklarında soruşturma veya kovuşturma açılan mahalli idare organlarını veya bu organların üyelerini, kesin hükme kadar GEÇİCİ BİR TEDBİR olarak görevden uzaklaştırmaya yetkili makam aşağıdakilerden hangisidir?',
  '{"options": ["Danıştay", "Vali", "İçişleri Bakanı", "Cumhurbaşkanı", "İdare Mahkemesi"], "correctIndex": 2}'::jsonb,
  'Anayasa m. 127/4 uyarınca görevleri ile ilgili bir suç sebebi ile hakkında soruşturma veya kovuşturma açılan mahalli idare organlarını veya bu organların üyelerini, kesin hükme kadar bir tedbir olarak, İÇİŞLERİ BAKANI görevden uzaklaştırabilir. Organlık sıfatının KESİN olarak sona erdirilmesine ise ancak DANIŞTAY karar verebilir.',
  'ÖSYM''nin efsane tuzağı: GEÇİCİ olarak görevden uzaklaştıran = İÇİŞLERİ BAKANI; Organlık sıfatına KESİN olarak son veren = DANIŞTAY''dır!'
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
  'İdare Hukuku',
  'multiple_choice',
  3,
  'Büyükşehir belediyesi bulunan bir ilde aşağıdakilerden hangisi KANUNEN MEVCUTTUR?',
  '{"options": ["İl Özel İdaresi", "Köy Tüzel Kişiliği", "Bucak Teşkilatı", "Yatırım İzleme ve Koordinasyon Başkanlığı (YİKOB)", "Köy Derneği"], "correctIndex": 3}'::jsonb,
  '6360 sayılı Kanun uyarınca 30 büyükşehir olan ilde İl Özel İdareleri, köyler ve beldeler kapatılmıştır. İl Özel İdaresi''nin kapatılmasıyla doğan kamu yatırımlarını yürütmek üzere valilik bünyesinde ''Yatırım İzleme ve Koordinasyon Başkanlığı'' (YİKOB) kurulmuştur.',
  'Büyükşehir olan 30 ilde İl Özel İdaresi ve Köy YOKTUR! Onların yerine valiliğe bağlı YİKOB vardır.'
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
  'İdare Hukuku',
  'multiple_choice',
  3,
  'İdari işlemlerin unsurları (Yetki, Şekil, Sebep, Konu, Amaç) değerlendirildiğinde bütün idari işlemlerin ''Amaç (Maksat)'' unsuru istisnasız her zaman aşağıdakilerden hangisidir?',
  '{"options": ["Devlete gelir sağlamak", "Kamu Yararı", "Kamu görevlilerini korumak", "Yargı yükünü azaltmak", "Özel sektörü desteklemek"], "correctIndex": 1}'::jsonb,
  'İdare hukukunda amaç unsuru tektir, geneldir ve değişmez: KAMU YARARI''dır. Bir idari işlem kamu yararı dışında kişisel intikam, siyasi kayırma veya zümre menfaati amacıyla yapılırsa ''yetki saptırması'' sebebiyle amaç yönünden sakatlanır ve iptal edilir.',
  'Tüm idari işlemlerin değişmez ve tek meşru amacı Kamu Yararıdır; başka bir amaç güdülemez.'
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
  'İdare Hukuku',
  'multiple_choice',
  3,
  'İdarenin hukuki sorumluluğunda uygulanan ''Kusursuz Sorumluluk'' halleri arasında aşağıdakilerden hangisi yer alır?',
  '{"options": ["İdarenin hizmet kusuru (hizmetin geç, kötü işlemesi veya hiç işlememesi)", "Risk (Tehlike) İlkesi ve Kamu Külfetleri Karşısında Eşitlik (Fedakarlığın Denkleştirilmesi) İlkesi", "Memurun kişisel kastı", "Mücbir sebep (deprem, sel gibi önüne geçilemez doğa olayları)", "Zarar görenin kendi ağır kusuru"], "correctIndex": 1}'::jsonb,
  'Kusursuz sorumlulukta idarenin bir hatası veya kusuru olmasa dahi meydana gelen zararı ödeme yükümlülüğü vardır. Bu sorumluluk iki ilkeye dayanır: 1) Risk (tehlike) ilkesi (idarenin tehlikeli faaliyetleri: mühimmat deposu patlaması vb.), 2) Kamu külfetleri karşısında eşitlik ilkesi (toplum için yapılan köprünün tek bir dükkanın önünü kapatıp batırması).',
  'Hizmet kusuru kusurlu sorumluluktur; Risk ve Fedakarlığın Denkleştirilmesi ise KUSURSUZ sorumluluk ilkeleridir.'
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
  'İdare Hukuku',
  'multiple_choice',
  3,
  'Kamu düzenini korumakla görevli olan ''İdari Kolluk'' ile suç işlendikten sonra failleri yakalayan ''Adli Kolluk'' arasındaki temel fark aşağıdakilerden hangisidir?',
  '{"options": ["İdari kolluk adliye mahkemelerine bağlıdır, adli kolluk valiye bağlıdır.", "İdari kolluk suç işlenmesini ÖNLEYİCİ niteliktedir ve idari amirlere bağlıdır; adli kolluk ise suç işlendikten sonra delil toplayıp failleri adalete teslim eder ve CUMHURİYET SAVCISINA bağlıdır.", "İdari kolluk silah taşıyamaz, adli kolluk taşır.", "Adli kolluk sadece köylerde görev yapar.", "İdari kolluğun tüm işlemlerine karşı yargı yolu kapalıdır."], "correctIndex": 1}'::jsonb,
  'İdari kolluk henüz suç işlenmeden kamu düzenini korumak için önleyici tedbir alır (Vali, Kaymakam, polis devriyesi). Adli kolluk ise bir suç işlendikten sonra ceza muhakemesi için devreye girer ve doğrudan Cumhuriyet Savcısı''nın emri altında çalışır.',
  'İdari kolluk = Suç öncesi / İdari amir; Adli kolluk = Suç sonrası / Cumhuriyet Savcısı!'
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
  'İdare Hukuku',
  'multiple_choice',
  3,
  'Türkiye''de Kamu İktisadi Teşebbüsleri (KİT); İktisadi Devlet Teşekkülleri (İDT) ve Kamu İktisadi Kuruluşları (KİK) olmak üzere ikiye ayrılır.

İDT ile KİK arasındaki temel ayrım kriteri aşağıdakilerden hangisidir?',
  '{"options": ["İDT''lerin kar amacı gütmesi ve ticari esaslara göre çalışması; KİK''lerin ise kamu hizmeti ve tekel niteliğindeki imtiyazlı kamu mallarını üretmesi ve kar amacı gütmemesi", "İDT''lerin özel sektöre ait olması", "KİK''lerin sadece yabancı ortaklıkla kurulması", "İDT''lerin Sayıştay denetimine tabi olmaması", "KİK''lerin iflas edebilmesi"], "correctIndex": 0}'::jsonb,
  '233 sayılı KHK uyarınca: Sermayesinin tamamı devlete ait olup iktisadi alanda ticari esaslara göre çalışan ve KAR AMACI güden KİT''lere İktisadi Devlet Teşekkülü (İDT - örn. ÇAYKUR, BOTAŞ); tekel niteliğindeki kamu hizmeti gören ve kar amacı öncelikli olmayan KİT''lere ise Kamu İktisadi Kuruluşu (KİK - örn. TCDD, DHMİ) denir.',
  'İDT = Ticari / Kar amaçlı; KİK = Tekel / Kamu hizmeti odaklı.'
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
  'İdare Hukuku',
  'multiple_choice',
  3,
  'İdari yargıda dava açma süreleri genel kural olarak İdare Mahkemelerinde ve Danıştay''da kaç gündür?',
  '{"options": ["İdare Mahkemelerinde 30 gün — Danıştay''da 30 gün", "İdare Mahkemelerinde 60 gün — Vergi Mahkemelerinde 30 gün (Danıştay''da ilk derece 60 gün)", "Her mahkemede 15 gün", "İdare mahkemesinde 90 gün", "Süre sınırı yoktur"], "correctIndex": 1}'::jsonb,
  '2577 sayılı İdari Yargılama Usulü Kanunu (İYUK) m. 7 uyarınca dava açma süresi özel kanunlarda ayrı süre gösterilmemişse Danıştay''da ve İdare Mahkemelerinde 60 GÜN, Vergi Mahkemelerinde ise 30 GÜNDÜR.',
  'İdare Mahkemesi ve Danıştay = 60 gün; Vergi Mahkemesi = 30 gündür!'
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
  'İdare Hukuku',
  'multiple_choice',
  3,
  'İdarenin mal edinme yöntemlerinden ''Kamulaştırma'' ile ''İstimval'' arasındaki temel fark aşağıdakilerden hangisidir?',
  '{"options": ["Kamulaştırma taşınmazlar içindir; İstimval ise savaş veya olağanüstü hallerde idarenin kişilere ait TAŞINIR mallara veya çalışma gücüne el koymasıdır.", "Kamulaştırmada bedel ödenmez, istimvalde peşin ödenir.", "İstimval belediyeler tarafından park yapmak için uygulanır.", "Kamulaştırma sadece askeri dönemde yapılır.", "İkisi tamamen aynı kavramdır."], "correctIndex": 0}'::jsonb,
  'Kamulaştırma olağan dönemde kamu yararı için taşınmaz (arsa/arazi) mülkiyetinin alınmasıdır. İstimval ise seferberlik, savaş veya olağanüstü afet hallerinde devletin özel kişilere ait kamyon, iş makinesi gibi TAŞINIR mallara el koyması veya kişileri ücretiyle çalıştırmasıdır.',
  'Taşınmaz = Kamulaştırma; Taşınır ve çalışma gücü (OHAL/Savaşta) = İstimval.'
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
  'İdare Hukuku',
  'multiple_choice',
  3,
  'Memurluk statüsünü sona erdiren haller değerlendirildiğinde aşağıdakilerden hangisi memurluğu kendiliğinden veya doğrudan sona erdiren durumlardan biri değildir?',
  '{"options": ["Ölüm", "Emeklilik", "Memurluk şartlarından birini (örneğin kasten işlenen suçtan 1 yıl hapis alarak) sonradan kaybetme", "Görevden uzaklaştırma tedbiri uygulanması", "Çekilme (İstifa) veya çekilmiş sayılma (müstafi sayılma)"], "correctIndex": 3}'::jsonb,
  'Görevden uzaklaştırma memurluğu sona erdirmez; maaşının 2/3''ünü almaya devam eder ve soruşturma sonucunda suçsuz bulunursa görevine iade edilir. Ölüm, istifa, emeklilik ve şartların kaybı ise memuriyeti tamamen bitirir.',
  'Görevden uzaklaştırılan kişi halen memurdur; kadrosu ve memuriyet bağı devam eder.'
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
  'İdare Hukuku',
  'multiple_choice',
  3,
  'Cumhurbaşkanı, bakanlıklar ve kamu tüzel kişileri tarafından çıkarılan yönetmeliklerin Resmî Gazete''de yayımlanma kuralı aşağıdakilerden hangisinde doğru ifade edilmiştir?',
  '{"options": ["Bütün yönetmelikler istisnasız Resmî Gazete''de yayımlanmak zorundadır.", "Hiçbir yönetmelik Resmî Gazete''de yayımlanmaz.", "Hangi yönetmeliklerin Resmî Gazete''de yayımlanacağı kanunla belirtilir; kural olarak kamu personelini ilgilendiren ve milli çapta uygulanan yönetmelikler yayımlanır, mahalli veya dar kapsamlı olanlar yerel duyuru ile ilan edilir.", "Yalnızca belediye yönetmelikleri yayımlanır.", "Yönetmelikler sadece TRT''de okunarak yürürlüğe girer."], "correctIndex": 2}'::jsonb,
  'Anayasa m. 124/2 uyarınca hangi yönetmeliklerin Resmî Gazete''de yayımlanacağı kanunda belirtilir. Ülke çapında uygulanacak ve genel düzenleme getiren yönetmelikler Resmî Gazete''de yayımlanır; yerel bir belediyenin veya üniversitenin iç yönetmeliği yerel ilan panolarıyla duyurulabilir.',
  'Bütün yönetmeliklerin Resmi Gazete''de yayımlanma zorunluluğu YOKTUR; hangilerinin yayımlanacağını kanun belirler.'
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
  'İdare Hukuku',
  'multiple_choice',
  3,
  'İl Genel İdaresi bünyesinde yer alan ''İl İdare Kurulu'' kimlerden oluşur?',
  '{"options": ["Vali başkanlığında; Hukuk İşleri Müdürü, Defterdar, İl Milli Eğitim, İl Sağlık, İl Tarım ve Orman müdürleri", "Vali, Belediye Başkanı ve Garnizon Komutanı", "Kaymakamlar ve Muhtarlar", "Yalnızca İl Genel Meclisi üyeleri", "İl Emniyet Müdürü ve Cumhuriyet Başsavcısı"], "correctIndex": 0}'::jsonb,
  'İl İdare Kurulu; Valinin başkanlığında Hukuk İşleri Müdürü, Defterdar, İl Milli Eğitim Müdürü, İl Sağlık Müdürü, İl Tarım ve Orman Müdürü ile Çevre ve Şehircilik Müdüründen oluşur. Belediye başkanı veya askerler bu kurulda yer almaz.',
  'İl İdare Kurulu''nda Belediye Başkanı veya Garnizon Komutanı KESİNLİKLE YOKTUR! Tamamen merkezi idarenin il müdürlerinden oluşur.'
);

COMMIT;
