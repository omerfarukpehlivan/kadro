-- ==========================================================================
-- KADRO SORU HAVUZU — TARİH (ÜNİTE 5: KURTULUŞ SAVAŞI HAZIRLIK VE CEPHELER)
-- Toplam 40 Çoktan Seçmeli Soru (ÖSYM Çeldirici Tuzağı Analizli)
-- ==========================================================================

-- Soru tar_kshc_001
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
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  '1911-1912 Trablusgarp Savaşı öncesinde İtalya, Rusya ile imzaladığı gizli Racconigi Antlaşması ile Rusya''nın boğazlar üzerindeki emellerini serbest bırakırken Rusya da İtalya''nın Trablusgarp''ı işgaline onay vermiştir. Osmanlı Devleti donanması Haliç''te çürütüldüğü ve Mısır İngiliz işgalinde olduğu için bölgeye resmi ordu sevk edememiş; bunun üzerine genç subaylar gizlice Trablusgarp''a gitmiştir.

Mustafa Kemal''in ''Gazeteci Şerif Bey'' takma adıyla Derne ve Tobruk''ta, Enver Paşa''nın ise ''Kuyumcu Hamdi'' takma adıyla Bingazi''de yerli Berberi aşiretleri örgütleyerek İtalyanlara karşı gerilla direnişi başlattığı bu savaşın dünya askeri tarihindeki en önemli ilki aşağıdakilerden hangisidir?',
  '{"options": ["Tarihte ilk kez kimyasal gaz silahlarının kullanılması", "Dünya harp tarihinde ilk kez savaş uçağının (İtalya tarafından) keşif ve bombardıman amacıyla kullanılması", "İlk kez denizaltıların bir zırhlıyı batırması", "İlk kez telsiz ve radar teknolojisinin cephede denenmesi", "Tarihte ilk kez kadın savaşçıların muharip birlik kurması"], "correctIndex": 1}'::jsonb,
  '1911 Trablusgarp Savaşı''nda İtalyan ordusu dünya tarihinde ilk kez askeri amaçla tayyare (savaş uçağı) kullanmıştır. Türk direnişçileri tüfek ateşiyle bir İtalyan uçağını düşürerek dünya tarihinde uçak düşüren ilk güç olmuştur.',
  'ÖSYM Trablusgarp Savaşı''nın ilklerini çok sever: Mustafa Kemal''in ilk askeri başarısı ve sömürgeciliğe karşı ilk savaşıdır; İtalyanların tarihte ilk savaş uçağını kullandığı savaştır. Mustafa Kemal''in takma adı "Gazeteci Şerif Bey", Enver Paşa''nınki ise "Kuyumcu Hamdi"dir.'
);

-- Soru tar_kshc_002
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
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'Balkan Savaşları''nın patlak vermesi üzerine Osmanlı Devleti İtalya ile 1912 yılında İsviçre''de Uşi (Ouchy) Antlaşması''nı imzalamak zorunda kalmıştır.

Uşi Antlaşması''nda yer alan "Trablusgarp ve Bingazi halkı dini bakımdan Osmanlı Halifesine bağlı kalacaktır" maddesinin temel amacı aşağıdakilerden hangisidir?',
  '{"options": ["İtalya''nın İslamiyet''i resmi din olarak kabul etmesini sağlamak", "Bölge halkı ile kültürel ve manevi bağların koparılmasını engellemek", "Trablusgarp''tan düzenli vergi toplamaya devam etmek", "İtalya''nın Balkan Savaşları''nda Osmanlı yanında yer almasını sağlamak", "Rodos ve On İki Ada''yı kesin olarak Osmanlı toprağı yapmak"], "correctIndex": 1}'::jsonb,
  'Toprak kaybedilmesine rağmen halkın halifeye bağlı tutulması, bölge ile dini ve kültürel bağları sürdürme gayesidir. Osmanlı Devleti tarihinde hilafet makamını siyasi bir güç olarak sadece iki antlaşmada kullanmıştır: İlki 1774 Küçük Kaynarca (Kırım), ikincisi ve sonuncusu ise 1912 Uşi Antlaşması''dır (Trablusgarp).',
  'ÖSYM "Hilafet siyasi bir güç olarak hangi iki antlaşmada kullanılmıştır?" sorusunu sıkça yoklar: Küçük Kaynarca ve Uşi Antlaşması. Amaç toprak elden çıksa da kültürel bağı korumaktır.'
);

-- Soru tar_kshc_003
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
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  '1912 yılında Karadağ''ın saldırısıyla başlayan I. Balkan Savaşı''nda Bulgaristan, Yunanistan, Sırbistan ve Karadağ birleşerek Osmanlı Devleti''ne saldırmış ve Osmanlı ordusu çok kısa sürede ağır bir hezimete uğramıştır.

Aşağıdakilerden hangisi Osmanlı Devleti''nin I. Balkan Savaşı''nı kaybetmesinde doğrudan etkili olan en temel iç faktördür?',
  '{"options": ["Ordunun içine particilik ve siyasetin girmesi sonucu komutanlar arasındaki emir-komuta zincirinin kopması", "Osmanlı donanmasının Çanakkale Boğazı''ndan Ege Denizi''ne çıkamaması", "Padişah V. Mehmet Reşat''ın ordunun başında sefere çıkmaması", "Kutü''l-Amare''de ağır kayıplar verilmesi", "Kafkas Cephesi''ndeki Sarıkamış Harekatı''nın başarısızlıkla sonuçlanması"], "correctIndex": 0}'::jsonb,
  'I. Balkan Savaşı''nın kaybedilmesindeki 1 numaralı neden: İttihatçılar ve Hürriyet-İtilafçılar şeklinde ordunun içine particilik/siyaset girmesi ve bir fırkaya mensup subayın diğer fırkadaki subaya yardım etmemesidir. Mustafa Kemal bu faciayı görerek Cumhuriyet döneminde Erkan-ı Harbiye Kanunu ile orduyu siyasetten tamamen ayıracaktır.',
  'Adaylar savaşın kaybedilmesini sadece askeri sayı yetersizliğine bağlayabilir. Oysa temel iç neden savaştan hemen önce 65 bin tecrübeli askerin terhis edilmesi ve ordunun içine siyasetin (ikilik) girmesidir.'
);

-- Soru tar_kshc_004
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
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'I. Balkan Savaşı sırasında Osmanlı Devleti ile kara bağlantısı kopan ve bunu fırsat bilerek bağımsızlığını ilan eden; böylece Osmanlı Devleti''nden ayrılan son Balkan devleti olan ve ayrılışıyla Osmanlıcılık fikrinin tamamen iflas edip İslamcılık fikrinin ilk büyük darbeyi almasına yol açan devlet hangisidir?',
  '{"options": ["Bulgaristan", "Sırbistan", "Arnavutluk", "Karadağ", "Romanya"], "correctIndex": 2}'::jsonb,
  'Arnavutluk, 1912''de I. Balkan Savaşı devam ederken bağımsızlığını ilan ederek Osmanlı''dan ayrılan son Balkan devleti olmuştur. Halkının büyük kısmı Müslüman olmasına rağmen ayrılması İslamcılık (Ümmetçilik) fikrine vurulan ilk ağır darbedir.',
  'ÖSYM''nin en popüler sorusudur: İlk isyan eden = Sırplar; İlk bağımsız olan = Yunanlılar; Son bağımsız olan Balkan ülkesi = Arnavutluk. Bu ayrılıkla birlikte Osmanlıcılık tamamen çökmüş, Türkçülük yükselmiştir.'
);

-- Soru tar_kshc_005
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
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'I. Balkan Savaşı''nda yer almadığı halde, Bulgaristan''ın fazla toprak almasını kabullenemeyerek II. Balkan Savaşı''na katılan ve savaşı başlatan devlet ile bu kargaşadan yararlanarak Edirne ve Kırklareli''yi (Doğu Trakya) savaşarak geri alan ve "Edirne Fatihi" unvanını kazanan Osmanlı komutanı aşağıdakilerin hangisinde doğru verilmiştir?',
  '{"options": ["Romanya – Enver Paşa", "Karadağ – Rauf Orbay", "Sırbistan – Kazım Karabekir", "Yunanistan – Cemal Paşa", "Romanya – Mustafa Kemal"], "correctIndex": 0}'::jsonb,
  'I. Balkan Savaşı''nda olmayıp II. Balkan Savaşı''na katılan devlet Romanya''dır. Balkan devletleri kendi arasında savaşırken Enver Paşa komutasındaki Türk ordusu Midye-Enez hattını aşarak Edirne''yi geri almış ve Enver Paşa "Edirne Fatihi" olarak anılmıştır.',
  'ÖSYM "I. Balkan''da olmayıp II. Balkan''a katılan devlet kimdir?" (Romanya) ve "Edirne Fatihi kimdir?" (Enver Paşa) sorularını sıklıkla sorar. Mustafa Kemal ile Enver Paşa unvanları karıştırılmamalıdır.'
);

-- Soru tar_kshc_006
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
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'I. Dünya Savaşı''nda Osmanlı Devleti''nin açtığı cepheler taarruz, savunma ve müttefiklere yardım cepheleri olarak üçe ayrılır.

Buna göre, Osmanlı Devleti''nin kendi sınırları dışında müttefiklerine yardım amacıyla savaştığı Yardım Cepheleri aşağıdakilerin hangisinde eksiksiz verilmiştir?',
  '{"options": ["Kafkasya – Kanal – Çanakkale", "Galiçya – Makedonya – Romanya", "Irak – Suriye – Filistin", "Hicaz – Yemen – Trablusgarp", "Kafkasya – Galiçya – Romanya"], "correctIndex": 1}'::jsonb,
  'Osmanlı Devleti''nin kendi sınırları dışında savaştığı Yardım Cepheleri: Galiçya, Makedonya ve Romanya''dır (Sonları "-ya" ile biter). Taarruz cepheleri: Kafkasya ve Kanal''dır (KAKA). Diğerleri savunma cepheleridir.',
  'Şifreleme kuralı: Sonu "-ya" ile biten üç cephe (Galiçya, Makedonya, Romanya) sınır dışı yardım cepheleridir.'
);

-- Soru tar_kshc_007
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
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'I. Dünya Savaşı''nda Enver Paşa komutasında açılan, Kars, Ardahan ve Batum''u geri almak, Turancılık (Pantürkizm) ülküsüyle Orta Asya Türkleri ile birleşmek ve Bakü petrollerine ulaşmak amacıyla taarruz edilen Kafkasya Cephesi ile ilgili aşağıdaki bilgilerden hangisi yanlıştır?',
  '{"options": ["Hasan İzzet Paşa''nın kış şartları uyarısına rağmen başlatılan Sarıkamış Harekâtı ağır bir donma felaketiyle sonuçlanmıştır.", "Ruslarla iş birliği yapan Ermenilerin katliamları üzerine 1915 yılında Sevk ve İskân (Tehcir) Kanunu çıkarılmıştır.", "16. Kolordu Komutanı Tuğgeneral Mustafa Kemal Muş ve Bitlis''i Rus işgalinden geri alarak Altın Kılıç madalyası kazanmıştır.", "1918 Brest-Litovsk Antlaşması ile Çarlık Rusyası savaştan çekilmiş ve Elviye-i Selase (Kars, Ardahan, Batum) Osmanlı''ya verilmiştir.", "Bu cephede Türk ordularına Doğu Cephesi Komutanı sıfatıyla Kazım Karabekir Paşa komuta etmiştir."], "correctIndex": 4}'::jsonb,
  'Kafkasya Cephesi''nde Kazım Karabekir yer almamıştır! Kazım Karabekir Kurtuluş Savaşı sırasında (1920) TBMM Doğu Cephesi Komutanı olarak 15. Kolordu''nun başında Ermenilerle savaşacaktır. Kafkas Cephesi komutanları Enver Paşa, Ahmet İzzet Paşa ve Mustafa Kemal''dir.',
  'Ramazan Yetgin notlarında kalın harflerle altı çizilen uyarı: "DİKKAT! Kafkasya Cephesi''nde Kazım Karabekir YOKTUR! Karabekir Kurtuluş Savaşı Doğu Cephesi''ndedir."'
);

-- Soru tar_kshc_008
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
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  '18 Mart 1915 Çanakkale Deniz Zaferi''nin mimarı olan, Boğaz''a döşettiği mayınlar ve top bataryaları ile müttefik armadasını püskürterek tarihe "18 Mart Kahramanı" olarak geçen Osmanlı komutanı aşağıdakilerden hangisidir?',
  '{"options": ["Mustafa Kemal Paşa", "Cevat Paşa (Çobanlı)", "Fevzi Çakmak", "Liman von Sanders", "Enver Paşa"], "correctIndex": 1}'::jsonb,
  'Çanakkale Deniz Savaşları''nın müstahkem mevkii komutanı ve "18 Mart Kahramanı" unvanlı komutanı Cevat Paşa (Çobanlı)''dır. Mustafa Kemal ise deniz savaşlarında değil, 25 Nisan''da başlayan Çanakkale Kara Savaşları''nda Anafartalar Grup Komutanı olarak efsaneleşmiştir.',
  'ÖSYM "18 Mart Kahramanı kimdir?" sorusunda doğrudan Cevat Paşa''yı sorar. Adayların ezbere Mustafa Kemal şıkkına gitmesi en büyük sınav tuzağıdır.'
);

-- Soru tar_kshc_009
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
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'Mustafa Kemal Paşa''nın I. Dünya Savaşı boyunca mücadele ettiği üç cephe kronolojik sırasıyla aşağıdakilerin hangisinde doğru verilmiştir?',
  '{"options": ["Kafkasya $\ → $ Çanakkale $\ → $ Suriye-Filistin", "Çanakkale $\ → $ Kafkasya $\ → $ Suriye-Filistin", "Çanakkale $\ → $ Irak $\ → $ Hicaz", "Kanal $\ → $ Çanakkale $\ → $ Kafkasya", "Suriye-Filistin $\ → $ Çanakkale $\ → $ Kafkasya"], "correctIndex": 1}'::jsonb,
  'Mustafa Kemal I. Dünya Savaşı''nda sırasıyla: 1. Çanakkale Cephesi (Tekirdağ 19. Tümen / Anafartalar), 2. Kafkasya Cephesi (16. Kolordu / Muş ve Bitlis fethi), 3. Suriye-Filistin Cephesi (Yıldırım Orduları Grup Komutanlığı) olmak üzere üç cephede savaşmıştır [Şifre: ÇIKIŞ / Ç-K-S].',
  'ÖSYM cephelerin kronolojik sırasını ve Mustafa Kemal''in savaştığı yerleri çok sever. Mustafa Kemal Irak veya Kanal cephelerinde bulunmamıştır.'
);

-- Soru tar_kshc_010
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
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  '29 Nisan 1916 tarihinde Irak Cephesi''nde Halil Paşa komutasındaki Osmanlı ordusunun İngiliz tümenini kuşatarak General Townshend dahil 13 binden fazla İngiliz subay ve askerini esir aldığı ve İngiliz İmparatorluğu tarihinin en büyük askeri hezimetlerinden biri kabul edilen tarihi zafer aşağıdakilerden hangisidir?',
  '{"options": ["Kutü''l-Amare Zaferi", "Selman-ı Pak Zaferi", "Frenk Yazısı Zaferi", "Gazze Zaferi", "Dömeke Zaferi"], "correctIndex": 0}'::jsonb,
  'Kutü''l-Amare Zaferi (1916), Irak Cephesi''nde Halil Paşa (Kut) komutasında kazanılan muazzam bir askeri zaferdir. General Townshend esir alınmış ve Halil Paşa "Kutü''l-Amare Kahramanı" unvanını almıştır.',
  'Kutü''l-Amare Zaferi son yıllarda MEB ve KPSS müfredatında en çok öne çıkarılan zaferdir. Komutanı Halil Kut Paşa''dır.'
);

-- Soru tar_kshc_011
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
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'Hicaz-Yemen Cephesi''nde İngiliz ajanı Lawrence ile iş birliği yapan Şerif Hüseyin kabilelerine ve İngiliz kuşatmasına karşı Medine''yi 2 yıl 7 ay boyunca teslim etmeyen; askerlerine çekirge yedirerek Hz. Muhammed''in kabrini müdafaa eden ve tarihe "Çöl Aslanı", "Çöl Kaplanı" ve "Medine Müdafii" unvanlarıyla geçen kahraman komutanımız kimdir?',
  '{"options": ["Süleyman Askeri Bey", "Fahrettin Paşa (Türkkan)", "Ali Fuat Cebesoy", "Kazım Karabekir", "Refet Bele"], "correctIndex": 1}'::jsonb,
  'Medine Müdafii ve Çöl Kaplanı Fahrettin Paşa (Türkkan)''dır. Kuşatma altındayken Kutsal Emanetleri yağmalanmaktan kurtararak İstanbul''a göndermiştir. Yaşadıkları "Medine Müdafaası" kitabına konu olmuştur.',
  'ÖSYM Fahrettin Paşa''nın lakaplarını (Çöl Kaplanı / Çöl Aslanı / Medine Müdafii) doğrudan soru kökünde sorar.'
);

-- Soru tar_kshc_012
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
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  3,
  'I. Dünya Savaşı devam ederken İtilaf Devletleri Osmanlı topraklarını kendi aralarında paylaşmak amacıyla gizli antlaşmalar yapmışlardır.

1917 yılında Rusya''da meydana gelen Bolşevik İhtilali sonrasında iktidara gelen Sovyet hükümetinin Çarlık arşivlerindeki bu gizli paylaşım antlaşmalarını "Sarı Kitap" ile dünya kamuoyuna ifşa etmesinin ardından; İngiltere ve Fransa''nın İtalya''ya vaat ettiği İzmir ve çevresini 1919 Paris Barış Konferansı''nda Yunanistan''a devretmesi İtilaf Devletleri arasında aşağıdakilerden hangisine yol açmıştır?',
  '{"options": ["İttifak bloğunun savaşı kazanmasına", "İtilaf Devletleri arasında ilk kez derin bir görüş ayrılığı ve çıkar çatışmasının doğmasına", "İtalya''nın derhal Osmanlı safına geçerek savaşa girmesine", "Mondros Ateşkes Antlaşması''nın iptal edilmesine", "Amerika Birleşik Devletleri''nin Milletler Cemiyeti''ni feshetmesine"], "correctIndex": 1}'::jsonb,
  '1919 Paris Barış Konferansı''nda İngiltere, Doğu Akdeniz''de güçlü bir İtalya yerine kendi güdümünde zayıf bir Yunanistan görmeyi yeğlemiş ve İzmir''i İtalya''dan alıp Yunanlılara vermiştir. Bu durum İtilaf devletleri arasındaki ilk büyük çatlak ve görüş ayrılığı olmuştur (İtalya bu yüzden Kurtuluş Savaşı''nda TBMM ile çatışmamış ve ilk çekilen itilaf devleti olmuştur).',
  'ÖSYM "İtilaf devletleri arasındaki ilk görüş ayrılığı nerede yaşandı?" sorusunu sorar. Cevap kesinlikle 1919 Paris Barış Konferansı''dır (İzmir meselesi).'
);

-- Soru tar_kshc_013
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
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  '30 Ekim 1918 tarihinde Limni Adası''nın Mondros Limanı''nda Agamemnon zırhlısında imzalanan Mondros Ateşkes Antlaşması''nın;

"İtilaf Devletleri, güvenliklerini tehdit edecek bir durumun ortaya çıkması halinde herhangi bir stratejik noktayı işgal etme hakkına sahip olacaktır." şeklindeki 7. Maddesinin temel amacı aşağıdakilerden hangisidir?',
  '{"options": ["Doğu Anadolu''da bağımsız bir Ermenistan devleti kurmak", "Anadolu''nun tamamını hukuki gerekçe üreterek işgale açık hale getirmek", "Osmanlı ordusunun silahlarını denetim altına almak", "Boğazları Türk idaresine bırakmak", "Osmanlı padişahının otoritesini korumak"], "correctIndex": 1}'::jsonb,
  'Mondros''un 7. maddesi antlaşmanın en tehlikeli maddesidir; İtilaf devletleri istedikleri her yeri "güvenliğimiz tehdit altında" bahanesiyle işgal edebilmek için ucu açık bir işgal kılıfı hazırlamışlardır. 24. madde ise Vilayet-i Sitte''de Ermenistan kurma maddesidir.',
  'ÖSYM 7. Madde ile 24. Maddeyi karşılaştırır: 7. Madde = Tüm Anadolu''yu işgale açık hale getirme; 24. Madde = Megali Armenia (Büyük Ermenistan) kurma hedefidir.'
);

-- Soru tar_kshc_014
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
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'Mondros Ateşkes Antlaşması''ndan sonra başlayan işgallere karşı Türk milletinin gösterdiği ilk tepkilerle ilgili aşağıdaki eşleştirmelerden hangisi yanlıştır?',
  '{"options": ["Mondros''tan sonra ilk işgal edilen Osmanlı toprağı $\ → $ Musul (İngiltere)", "Mondros''tan sonra Anadolu sınırları içinde ilk işgal edilen yer $\ → $ Hatay-Dörtyol (Fransa)", "İşgallere karşı ilk silahlı halk direnişinin başladığı yer $\ → $ Hatay-Dörtyol (Kara Hasan Paşa)", "İzmir''in işgaline karşı ilk kurşunu atan gazeteci $\ → $ Hasan Tahsin (Osman Nevres)", "İzmir''in işgalinin ilk protesto edildiği miting $\ → $ Sultanahmet Mitingi"], "correctIndex": 4}'::jsonb,
  'İzmir''in işgalinin ilk protesto edildiği yer İstanbul değil; Mustafa Kemal''in talimatıyla düzenlenen Havza Mitingidir (Havza Genelgesi sonrası). Sultanahmet ve Kadıköy mitingleri (Halide Edip''in konuştuğu) Havza''dan sonra yapılmıştır.',
  'Ramazan Yetgin notlarında kalın altı çizili uyarı: "İzmir''in işgalinin ilk protesto edildiği yer Havza''dır!" Sultanahmet en kalabalık olanıdır ama ilk değildir.'
);

-- Soru tar_kshc_015
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
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'İzmir''in Yunanlılar tarafından işgal edilmesinden sonra bölgedeki katliam iddialarını incelemek üzere bölgeye gönderilen ve hazırladığı raporda;

"Bölgede Rumların değil Türklerin çoğunlukta olduğunu, katliamlardan Yunan ordusunun sorumlu olduğunu ve işgalin haksız olduğunu" belirterek Türk Milli Mücadelesi''nin haklılığını uluslararası alanda tescil eden ilk resmi belge aşağıdakilerden hangisidir?',
  '{"options": ["General Harbord Raporu", "Amiral Bristol Raporu", "Sandler Raporu", "Milne Raporu", "King-Crane Raporu"], "correctIndex": 1}'::jsonb,
  'Amiral Bristol Raporu, Batı Anadolu''daki Türk haklılığını dünyaya duyuran ilk uluslararası rapordur. General Harbord Raporu ise Doğu Anadolu''daki Ermeni iddialarını çürüten rapordur.',
  'ÖSYM Bristol (Batı Anadolu - Rum/Yunan haksızlığı) ile Harbord (Doğu Anadolu - Ermeni haksızlığı) raporlarını sürekli karşılaştırır.'
);

-- Soru tar_kshc_016
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
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'Milli Mücadele Dönemi''nde faaliyet gösteren cemiyetler ile ilgili;
I. Trakya Paşaeli Cemiyeti: Osmanlı''nın yıkılması halinde "Trakya Cumhuriyeti" adıyla yeni bir devlet kurmayı tüzüğüne koyan cemiyettir.
II. Milli Kongre Cemiyeti: Kurucusu Dr. Esat Işık olup milli mücadelede "Kuvay-ı Milliye" tabirini ilk kez kullanan ve basın-yayın yolunu benimseyen cemiyettir.
III. Kilikyalılar Cemiyeti: Adana ve Çukurova bölgesini Fransız ve Ermeni işgalinden kurtarmak amacıyla kurulan yararlı bir cemiyettir.

yargılarından hangileri doğrudur?',
  '{"options": ["Yalnız I", "I ve II", "I ve III", "II ve III", "I, II ve III"], "correctIndex": 4}'::jsonb,
  'Verilen üç öncül de yararlı cemiyetlere ait en kilit KPSS bilgileridir. Trakya Paşaeli devlet kurma fikri olan cemiyettir; Dr. Esat Işık Kuvay-ı Milliye tabirini ilk kullanan kişidir; Kilikyalılar ise adı yabancı gibi gelse de Adana''yı savunan milli bir cemiyettir.',
  'Kilikyalılar Cemiyeti isminden dolayı adaylar tarafından sıklıkla zararlı azınlık cemiyeti zannedilir. Kilikyalılar milli ve yararlı bir cemiyettir.'
);

-- Soru tar_kshc_017
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
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  3,
  '21-22 Haziran 1919''da yayımlanan Amasya Genelgesi''nin hazırlanmasında ve onaylanmasında Mustafa Kemal Paşa''nın yanı sıra Rauf Orbay, Ali Fuat Cebesoy, Refet Bele bizzat bulunmuş; Kazım Karabekir ve Cemal Paşa ise telgrafla onay vermiştir.

Mustafa Kemal''in genelgeyi tek başına yayımlamak yerine ordu komutanlarının ortak imzasıyla yayımlamasının temel amacı ve genelgede yer almayan komutan aşağıdakilerin hangisinde doğru verilmiştir?',
  '{"options": ["Milli Mücadeleyi kişisellikten çıkarıp milletin malı haline getirmek – İsmet İnönü", "Padişahın onayını almak – Kazım Karabekir", "Sovyet Rusya''dan yardım sağlamak – Ali Fuat Cebesoy", "İstanbul Hükümeti ile anlaşmak – Rauf Orbay", "İtilaf devletlerine gözdağı vermek – Fevzi Çakmak"], "correctIndex": 0}'::jsonb,
  'Mustafa Kemal genelgeyi çok imzalı yaparak hareketi tek bir kişinin isyanı görüntüsünden çıkarmış ve kurumsallaştırmıştır. Bu metinde İsmet İnönü''nün imzası veya onayı YOKTUR! (İsmet Paşa o tarihte henüz İstanbul''dadır).',
  'ÖSYM Amasya Genelgesi''nde imzası olanları sorarken şıklara istisnasız İsmet İnönü''yü çeldirici koyar. İsmet İnönü Amasya Genelgesi''nde yoktur!'
);

-- Soru tar_kshc_018
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
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'Amasya Genelgesi''nde yer alan;

"Milletin bağımsızlığını yine milletin azim ve kararı kurtaracaktır."

maddesi Kurtuluş Savaşı''nın hangi iki temel unsurunu ilk kez açıkça belirlemiştir?',
  '{"options": ["Gerekçesi ve Savaş Alanı", "Amacı ve Yöntemi", "Finansmanı ve Dış Desteği", "Lider kadrosu ve Ordusu", "Hukuki dayanağı ve İttifakları"], "correctIndex": 1}'::jsonb,
  '"Milletin bağımsızlığı" Kurtuluş Savaşı''nın Amacı; "milletin azim ve kararı" ise bu savaşın Yöntemidir (aynı zamanda üstü kapalı olarak halk egemenliğine/cumhuriyete geçileceğinin ilk müjdesidir). Gerekçe ise vatanın bütünlüğünün tehlikede olmasıdır.',
  'ÖSYM formülü: "Vatanın bütünlüğü tehlikededir" = Gerekçe; "Milletin bağımsızlığını milletin azim ve kararı kurtaracaktır" = Amaç ve Yöntem.'
);

-- Soru tar_kshc_019
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
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'Mustafa Kemal Paşa''nın çok sevdiği askerlik mesleğinden istifa ederek "Sine-i millete döndüğü" ve artık sivil bir fert olarak mücadeleye devam ettiği tarihsel dönüm noktası aşağıdakilerin hangisinde doğru belirtilmiştir?',
  '{"options": ["Havza Genelgesi''nden önce", "Amasya Genelgesi''nden sonra – Erzurum Kongresi''nden önce", "Sivas Kongresi''nden sonra", "Amasya Görüşmeleri sırasında", "TBMM açıldıktan hemen sonra"], "correctIndex": 1}'::jsonb,
  'Mustafa Kemal 7-8 Temmuz 1919 gecesi saraydan gelen azil telgrafı üzerine resmi görevinden ve askerlikten istifa etmiştir. Bu olay Amasya Genelgesi''nden sonra, Erzurum Kongresi''nden öncedir. Mustafa Kemal''in sivil bir vatandaş olarak yaptığı ilk çalışma Erzurum Kongresi''dir.',
  'ÖSYM istifanın yerini tam kronolojik aralık olarak sorar: Amasya''dan sonra, Erzurum''dan önce.'
);

-- Soru tar_kshc_020
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
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'Toplanış amacı ve delege yapısı bakımından bölgesel, aldığı kararlar ve temsil kabiliyeti bakımından ulusal olan Erzurum Kongresi (1919) ile ilgili aşağıdakilerden hangisi söylenemez?',
  '{"options": ["Milli sınırlardan (Misak-ı Milli) ilk kez bahsedilmiştir.", "Manda ve himaye fikri ilk kez açıkça reddedilmiştir.", "Tüm cemiyetler Anadolu ve Rumeli Müdafaa-i Hukuk Cemiyeti adı altında birleştirilmiştir.", "Kuvay-ı Milliye''yi amil, milli iradeyi hakim kılmak esastır maddesiyle rejim değişikliği hedeflenmiştir.", "9 kişiden oluşan ve başkanlığını Mustafa Kemal''in yaptığı Temsil Heyeti kurulmuştur."], "correctIndex": 2}'::jsonb,
  'Tüm milli cemiyetlerin Anadolu ve Rumeli Müdafaa-i Hukuk Cemiyeti (ARMHC) çatısı altında birleştirilmesi Erzurum Kongresi''nde değil, Sivas Kongresi''nde gerçekleşmiştir. Erzurum''da sadece Doğu cemiyetleri birleştirilmiştir.',
  'ÖSYM Erzurum ile Sivas Kongresi kararlarını sürekli birbirine katar. Manda ve himayenin İLK reddi = Erzurum; KESİN reddi ve cemiyetlerin birleşmesi = Sivas.'
);

-- Soru tar_kshc_021
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
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  3,
  'Sivas Kongresi''nde (4-11 Eylül 1919) Temsil Heyeti''nin Ali Fuat Cebesoy Paşa''yı Batı Cephesi Kuvay-ı Milliye Genel Komutanlığı''na ataması, Temsil Heyeti''nin devlet yönetimi açısından hangi gücü ilk kez bir hükümet gibi kullandığının kanıtıdır?',
  '{"options": ["Yasama Gücü", "Yürütme Gücü", "Yargı Gücü", "Diplomasi Gücü", "Denetleme Gücü"], "correctIndex": 1}'::jsonb,
  'Bir komutanı veya memuru bir makama atamak Yürütme (icra) yetkisidir. Temsil Heyeti Ali Fuat Paşa''yı Batı Cephesi''ne atayarak bir yürütme organı (hükümet) gibi hareket ettiğini ilk kez göstermiştir.',
  'ÖSYM atama işlemlerinin doğrudan "Yürütme Yetkisi" olduğu yorumunu KPSS sınavlarında defalarca sorgulamıştır.'
);

-- Soru tar_kshc_022
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
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'Sivas Kongresi''nin başarıyla tamamlanmasının ardından Temsil Heyeti''nin İstanbul Hükümeti ile tüm resmi telgraf ve haberleşmeyi kesmesi üzerine, baskılara dayanamayan Damat Ferit Paşa istifa etmek zorunda kalmış ve yerine Milli Mücadele''ye ılımlı Ali Rıza Paşa hükümeti kurulmuştur.

Damat Ferit Paşa hükümetinin düşürülmesi, Temsil Heyeti''nin İstanbul Hükümeti karşısında kazandığı ne tür bir zaferdir?',
  '{"options": ["İlk askeri zafer", "İlk siyasi / diplomatik zafer", "İlk ekonomik zafer", "İlk uluslararası anlaşma zaferi", "İlk yargı zaferi"], "correctIndex": 1}'::jsonb,
  'Damat Ferit Paşa''nın istifa ettirilmesi, Temsil Heyeti''nin ve Mustafa Kemal''in İstanbul Hükümeti karşısında elde ettiği ilk siyasi zaferdir.',
  'İlk askeri zafer Gümrü veya I. İnönü''dür; Damat Ferit''in istifası ise doğrudan siyasi bir başarıdır.'
);

-- Soru tar_kshc_023
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
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  '20-22 Ekim 1919''da İstanbul Hükümeti adına Bahriye Nazırı Salih Paşa ile Temsil Heyeti adına Mustafa Kemal Paşa arasında gerçekleşen Amasya Görüşmeleri''nin (Amasya Protokolü) en temel tarihi önemi aşağıdakilerden hangisidir?',
  '{"options": ["İstanbul Hükümeti''nin Sevr Antlaşması''nı iptal ettiğini açıklaması", "İstanbul Hükümeti''nin Temsil Heyeti''ni ve Anadolu hareketini ilk kez resmen ve hukuken tanıması", "Kuvay-ı Milliye''nin lağvedilerek düzenli ordunun kurulması", "Mustafa Kemal''in İstanbul Hükümeti''ne sadrazam olarak atanması", "TBMM''nin açılmasına İtilaf devletlerinin onay vermesi"], "correctIndex": 1}'::jsonb,
  'İstanbul Hükümeti''nin bir bakanını Temsil Heyeti ile müzakereye göndermesi ve protokol imzalaması, Temsil Heyeti''nin İstanbul Hükümeti tarafından ilk kez resmen ve hukuken tanındığı anlamına gelir.',
  'ÖSYM ilk tanınmaları karşılaştırır: Temsil Heyeti''ni ilk tanıyan Osmanlı hükümeti = Amasya Görüşmeleri; TBMM''yi tanıyan ilk devlet = Ermenistan; ilk İtilaf devleti = Fransa.'
);

-- Soru tar_kshc_024
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
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  3,
  'Son Osmanlı Mebusan Meclisi''nde Felah-ı Vatan grubu tarafından 12 Ocak 1920''de kabul edilen ve Türk bağımsızlık mücadelesinin asgari şartlarını içeren Misak-ı Millî (Milli Yemin) kararlarında;

I. Kapitülasyonların kesinlikle kaldırılması,
II. Boğazların dünya ticaretine açılması şartının Marmara ve İstanbul''un güvenliğine bağlanması,
III. Kars, Ardahan, Batum (Elviye-i Selase), Batı Trakya ve Arap vilayetlerinde gerekirse halk oylaması (plebisit) yapılması,
IV. Milli iradenin hakim kılınması amacıyla Cumhuriyet rejimine geçilmesi

konularından hangileri yer almaz?',
  '{"options": ["Yalnız I", "Yalnız IV", "I ve II", "II ve III", "III ve IV"], "correctIndex": 1}'::jsonb,
  'Misak-ı Millî kararlarında ULUSAL EGEMENLİK VE CUMHURİYETLE İLGİLİ HİÇBİR HÜKÜM YOKTUR! Misak-ı Millî yalnızca ulusal bağımsızlık ve vatan sınırları ile ilgilidir. Padişaha bağlı mebusların da oyunu alabilmek için rejim tartışmasından kaçınılmıştır.',
  'ÖSYM''nin en büyük ters köşe sorusudur: Misak-ı Millî''de kapitülasyon, boğazlar, azınlık, sınırlar ve halk oylaması vardır; ancak "milli egemenlik / cumhuriyet" maddesi kesinlikle yoktur!'
);

-- Soru tar_kshc_025
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
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'İtilaf Devletleri''nin Misak-ı Millî kararlarına tepki olarak 16 Mart 1920''de İstanbul''u resmen işgal etmesi ve Mebusan Meclisi''ni basarak milletvekillerini Malta''ya sürgüne göndermesi üzerine;

Bu işgali Ankara''daki Mustafa Kemal''e canı pahasına mors alfabesiyle anbean bildiren ve daha sonra Mustafa Kemal tarafından kendisine "Martonaltı" soyadı verilen kahraman telgrafçı kimdir?',
  '{"options": ["Yahya Kaptan", "Manastırlı Hamdi Bey", "Sütçü İmam", "Şahin Bey", "Topal Osman"], "correctIndex": 1}'::jsonb,
  'İstanbul''un işgalini Ankara''ya ulaştıran kahraman telgrafçı Manastırlı Hamdi Bey''dir. Mustafa Kemal Soyadı Kanunu çıktığında kendisine 16 Mart işgal gününe izafeten "Martonaltı" soyadını vermiştir.',
  'Adaylar Nutuk''ta çokça adı geçen Yahya Kaptan ile telgrafçı Manastırlı Hamdi Bey''i karıştırabilir.'
);

-- Soru tar_kshc_026
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
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  '23 Nisan 1920''de açılan I. TBMM''nin özellikleri ile ilgili olarak aşağıda verilen yargılardan hangisi yanlıştır?',
  '{"options": ["Yeni bir devlet, düzenli bir ordu ve yeni bir anayasa kurduğu için ''Kurucu Meclis''tir.", "İstanbul Hükümeti ve işgalci İtilaf Devletleri''ne açıkça başkaldırdığı için ''İhtilalci Meclis''tir.", "Hızlı karar alabilmek amacıyla yasama, yürütme ve yargı erklerini kendisinde toplayarak ''Güçler Birliği'' ilkesini benimsemiştir.", "Toplumsal ve hukuki alanda köklü Batılılaşma inkılaplarını gerçekleştirdiği için ''Radikal İnkılapçı Meclis''tir.", "Üyelerinin tamamı Türk milletinin temsilcilerinden oluştuğu için ''Ulusçu (Milli) Meclis''tir."], "correctIndex": 3}'::jsonb,
  'I. TBMM inkılapçı bir meclis DEĞİLDİR! Önceliği vatanı düşmandan kurtarmak olduğu için toplumda bölünmeye yol açmamak adına inkılap yapmaktan kaçınmıştır. I. TBMM''nin yaptığı tek inkılap 1 Kasım 1922''de Saltanatı kaldırmaktır. Asıl inkılapçı meclis II. TBMM''dir (1923-1927).',
  'ÖSYM''nin en meşhur "I. Meclis inkılapçı mıdır?" sorusudur. I. Meclis savaşçı ve kurucudur, inkılapçı değildir (tek istisnası saltanattır).'
);

-- Soru tar_kshc_027
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
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'I. TBMM bünyesinde farklı fikirleri temsil eden çeşitli gruplar bulunmaktaydı.

Aşağıdakilerden hangisi I. TBMM içerisinde yer alan siyasi gruplardan biri değildir?',
  '{"options": ["Müdafaa-i Hukuk Grubu", "Tesanüt Grubu", "Yeşil Ordu Grubu", "Felah-ı Vatan Grubu", "Halk Zümresi"], "correctIndex": 3}'::jsonb,
  'Felah-ı Vatan Grubu, Ankara''daki I. TBMM''de değil; son Osmanlı Mebusan Meclisi''nde Rauf Orbay başkanlığında kurulan ve Misak-ı Millî''yi kabul ettiren gruptur. I. TBMM''deki gruplar ise: Müdafaa-i Hukuk, Tesanüt, Yeşil Ordu, İstiklal, Islahat ve Halk Zümresi''dir.',
  'ÖSYM I. TBMM grupları arasına daima Felah-ı Vatan''ı çeldirici olarak yerleştirir. Felah-ı Vatan Osmanlı meclisindedir!'
);

-- Soru tar_kshc_028
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
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'Mustafa Kemal Paşa başkanlığında açılan I. TBMM''nin yasama faaliyeti olarak çıkardığı ilk kanun aşağıdakilerden hangisidir?',
  '{"options": ["Hıyanet-i Vataniye Kanunu", "Ağnam Vergisinin Dört Katına Çıkarılması Hakkında Kanun", "Firariler Kanunu", "Teşkilat-ı Esasiye Kanunu", "Men-i Müskirat Kanunu"], "correctIndex": 1}'::jsonb,
  'I. TBMM''nin kabul ettiği 1 Numaralı Kanun, mali kaynak yaratmak amacıyla çıkarılan Ağnam Vergisinin (küçükbaş hayvan vergisi) 4 katına çıkarılmasına dair kanundur. 2 numaralı kanun ise Hıyanet-i Vataniye Kanunu''dur.',
  'Adayların çoğu ilk kanunun Hıyanet-i Vataniye veya Teşkilat-ı Esasiye olduğunu düşünür. 1 Numaralı kanun Ağnam vergisidir.'
);

-- Soru tar_kshc_029
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
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'I. TBMM''ye karşı çıkarılan isyanlar; İstanbul Hükümeti''nin bizzat çıkardığı, İtilaf Devletleri ile ortaklaşa çıkarılan, azınlıkların çıkardığı ve önceden Kuvay-ı Milliyeci olup sonradan ayaklananlar olmak üzere gruplandırılır.

Buna göre, başlangıçta milli mücadeleye hizmet ettiği halde düzenli ordunun emri altına girmeyi reddederek I. İnönü Savaşı sırasında TBMM''ye karşı ayaklanan Kuvay-ı Milliyeci lider kimdir?',
  '{"options": ["Ahmet Anzavur", "Çerkez Ethem", "Delibaş Mehmet", "Şeyh Recep", "Zeynel Abidin"], "correctIndex": 1}'::jsonb,
  'Kuvay-ı Seyyare komutanı Çerkez Ethem, düzenli ordunun disiplini altına girmek istemeyerek I. İnönü Savaşı sürerken TBMM''ye isyan etmiş; İsmet İnönü komutasındaki düzenli ordu hem Yunanlıları hem de Çerkez Ethem''i bertaraf etmiştir.',
  'Ahmet Anzavur İstanbul Hükümeti''nin paralı isyancısıdır. Eski Kuvay-ı Milliyeci olup sonradan isyan edenler Çerkez Ethem ve Demirci Mehmet Efe''dir.'
);

-- Soru tar_kshc_030
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
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  '10 Ağustos 1920 Sevr Barış Antlaşması''nı Osmanlı Devleti''ne zorla kabul ettirmek amacıyla İngilizlerin desteğiyle Yunan ordusunun Milne Hattı''nı aşarak Bursa ve Uşak''ı işgal etmesi üzerine;

Bursa''nın işgalinin yarattığı derin teessür ve matem sebebiyle TBMM riyaset (başkanlık) kürsüsüne örtülen ve Bursa kurtarılıncaya kadar kaldırılmayan simgesel örtüye ne ad verilmiştir?',
  '{"options": ["Puşide-i Siyah (Siyah Örtü)", "Gülbank Örtüsü", "Hilafet Sancağı", "İstiklal Bayrağı", "Matem-i Milli"], "correctIndex": 0}'::jsonb,
  'Bursa''nın işgali üzerine TBMM meclis kürsüsüne Puşide-i Siyah (Kara Örtü) örtülmüş ve 2 yıl boyunca kurtuluşa kadar orada tutulmuştur.',
  'Ramazan Yetgin notlarında özel olarak geçen bir KPSS soru kalıbıdır: "Bursa''nın işgali üzerine meclis kürsüsüne Puşide-i Siyah (siyah örtü) serilmiştir."'
);

-- Soru tar_kshc_031
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
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'Ekim 1920''de Kuvay-ı Milliye komutanı Ali Fuat Cebesoy''un emrindeki birliklerle Yunan işgal kuvvetlerine karşı icra ettiği, ancak hezimetle sonuçlanarak Kuvay-ı Milliye birliklerinin kaldırılarak düzenli ordunun kurulmasını zorunlu hale getiren askeri harekât aşağıdakilerden hangisidir?',
  '{"options": ["Büyük Taarruz", "Gediz Taarruzu", "Dumlupınar Muharebesi", "İnönü Taarruzu", "Aslıhanlar Muharebesi"], "correctIndex": 1}'::jsonb,
  'Gediz Taarruzu''nda Kuvay-ı Milliye disiplinsizliği sebebiyle ağır mağlubiyet alınmıştır. Bunun üzerine Ali Fuat Cebesoy Moskova Büyükelçiliği''ne atanmış, Kuvay-ı Milliye feshedilerek düzenli ordu kurulmuştur.',
  'ÖSYM Gediz Taarruzu''nun sonucunu ve Ali Fuat Cebesoy''un atandığı yeri (Moskova Büyükelçiliği) sınavda doğrudan sorgulamıştır.'
);

-- Soru tar_kshc_032
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
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  '3 Aralık 1920 tarihinde Kazım Karabekir komutasındaki 15. Kolordu''nun Ermenileri mağlup etmesiyle imzalanan Gümrü Barış Antlaşması''nın Türk diplomasisi ve TBMM açısından en temel önemi aşağıdakilerden hangisidir?',
  '{"options": ["TBMM Hükümeti''nin uluslararası alanda kazandığı ilk askeri ve siyasi zafer olması, Sevr''i geçersiz sayan ilk antlaşma olması", "Doğu sınırımızın nihai ve kesin olarak çizilmesi", "Ermenistan''ın Sovyet Rusya''ya katıldığını ilan etmesi", "Kafkasya''daki tüm petrol sahalarının Türkiye''ye devredilmesi", "Güney Cephesi''nin tamamen kapanması"], "correctIndex": 0}'::jsonb,
  'Gümrü Antlaşması ile Ermenistan Sevr''deki taleplerinden vazgeçmiş, Misak-ı Millî''yi tanımış ve TBMM''yi tanıyan ilk devlet olmuştur. Resmi bir antlaşma metninde ilk kez "Türkiye" tabiri yer almıştır.',
  'Adaylar doğu sınırının kesinleştiğini zannedebilir. Doğu sınırı Gümrü ile değil, Sakarya sonrası imzalanan 1921 Kars Antlaşması ile kesinleşecektir.'
);

-- Soru tar_kshc_033
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
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  'Milli Mücadele Dönemi''nde düzenli ordunun bulunmadığı, tamamen yerel sivil direniş ve Kuvay-ı Milliye birlikleriyle Fransız ve Ermeni işgaline karşı destansı mücadeleler verilen Güney Cephesi kahramanları ile ilgili aşağıdaki eşleştirmelerden hangisi yanlıştır?',
  '{"options": ["Maraş $\ → $ Sütçü İmam ve Rıdvan Hoca", "Antep $\ → $ Şahin Bey ve Şehit Kamil", "Urfa $\ → $ Ali Saip Bey (Ursavaş)", "Adana $\ → $ Tufan Bey (Yüzbaşı Osman)", "Dörtyol $\ → $ Kazım Karabekir"], "correctIndex": 4}'::jsonb,
  'Kazım Karabekir Doğu Cephesi komutanıdır; Güney Cephesi''nde bulunmamıştır. Dörtyol''da ilk kurşunu atan Kara Hasan Paşa''dır.',
  'ÖSYM Güney Cephesi''ndeki kahramanların takma isimlerini ve şehirlerini sorar: Adana = Tufan Bey; Antep = Şahin Bey; Maraş = Sütçü İmam; Urfa = Ali Saip Bey.'
);

-- Soru tar_kshc_034
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
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  '6-10 Ocak 1921 tarihleri arasında Albay İsmet İnönü komutasındaki düzenli ordunun Yunan taarruzuna karşı kazandığı I. İnönü Zaferi sonrasında yaşanan ulusal ve uluslararası gelişmeler arasında aşağıdakilerden hangisi yer almaz?',
  '{"options": ["Teşkilat-ı Esasiye Kanunu''nun (1921 Anayasası) kabul edilmesi", "İstiklal Marşı''nın milli marş olarak kabul edilmesi", "Sovyet Rusya ile Moskova Antlaşması''nın imzalanması", "Afganistan ile Dostluk Antlaşması imzalanarak Türkiye''yi tanıyan ilk Müslüman devlet olması", "Fransa ile Ankara Antlaşması imzalanarak Güney Cephesi''nin kapanması"], "correctIndex": 4}'::jsonb,
  'Fransa ile Ankara Antlaşması I. İnönü sonrası değil, Sakarya Meydan Muharebesi sonrasında (Ekim 1921) imzalanmıştır. I. İnönü sonuçları ise [TALİM / MİLAT] kodlamasıdır (Teşkilat-ı Esasiye, Afganistan Dostluk, Londra Konferansı, İstiklal Marşı, Moskova Antlaşması).',
  'Adaylar İtilaf devletleriyle yapılan antlaşmaları karıştırır. I. İnönü''den sonra Londra Konferansı toplanmış ama Fransa ile kesin anlaşma Sakarya''dan sonraya kalmıştır.'
);

-- Soru tar_kshc_035
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
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  '12 Mart 1921''de kabul edilen İstiklal Marşı ile ilgili olarak aşağıda verilen bilgilerden hangisi yanlıştır?',
  '{"options": ["Milli Marş yarışması dönemin Maarif Vekaleti (Milli Eğitim Bakanlığı) tarafından düzenlenmiştir.", "Şiir TBMM kürsüsünde dönemin Maarif Vekili Hamdullah Suphi Tanrıöver tarafından coşkuyla okunmuştur.", "İstiklal Marşı''nın yayımlandığı ilk yerel gazete Kastamonu''da çıkan ''Açıksöz'' gazetesidir.", "İstiklal Marşı''nın ilk bestecisi Osman Zeki Üngör, günümüzdeki bestecisi ise Ali Rıfat Çağatay''dır.", "Mehmet Akif Ersoy kazandığı 500 liralık para ödülünü kadın ve yetimlere meslek öğreten ''Dârü''l-Mesâi'' vakfına bağışlamıştır."], "correctIndex": 3}'::jsonb,
  'İstiklal Marşı''nın ilk bestecisi Ali Rıfat Çağatay (1924-1930 arası çalınan alaturka beste), günümüzdeki bestecisi ise Osman Zeki Üngör''dür (1930''dan beri çalınan marş). İsimlerin sırası ters verilmiştir.',
  'ÖSYM ilk besteci (Ali Rıfat Çağatay) ile günümüz bestecisini (Osman Zeki Üngör) daima ters eşleştirerek sorar.'
);

-- Soru tar_kshc_036
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
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  '16 Mart 1921 tarihinde TBMM ile Sovyet Rusya arasında imzalanan Moskova Antlaşması''nda yer alan;

"Batum şehri ve limanı Gürcistan yönetimine bırakılacaktır." hükmünün Türk Kurtuluş Savaşı açısından en önemli tarihi niteliği aşağıdakilerden hangisidir?',
  '{"options": ["Misak-ı Millî sınırlarından verilen ilk taviz olması", "Kafkasya''da yeni bir cephe açılmasına neden olması", "Boğazların Rusya''ya devredilmesi", "Gürcistan ile savaşa son verilmesi", "Mustafa Kemal''in askerlikten istifasına yol açması"], "correctIndex": 0}'::jsonb,
  'Batum''un Gürcistan''a bırakılması, TBMM''nin Misak-ı Millî''den verdiği İLK tavizdir. İkinci taviz Hatay (1921 Ankara Antlaşması), üçüncü taviz ise Musul''dur (1926 Ankara Antlaşması).',
  'ÖSYM Misak-ı Millî tavizlerini sırasıyla sorar: 1. Batum (Moskova Ant.), 2. Hatay (1921 Ankara Ant.), 3. Musul (1926 Ankara Ant.).'
);

-- Soru tar_kshc_037
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
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  3,
  'Temmuz 1921''de Kütahya-Eskişehir Muharebeleri''nde Türk ordusunun yenilerek Sakarya Irmağı''nın doğusuna çekilmesi üzerine Meclis''te büyük bir kriz çıkmış ve Meclis''in Kayseri''ye taşınması tartışılmıştır.

Bu ağır kriz ortamında 5 Ağustos 1921''de çıkarılan Başkomutanlık Kanunu ile;
I. TBMM''nin yasama ve yürütme yetkileri üç aylığına doğrudan Mustafa Kemal Paşa''ya devredilmiştir.
II. Mustafa Kemal Paşa, Amasya Genelgesi sonrasında istifa ettiği askerlik mesleğine başkomutan sıfatıyla resmen geri dönmüştür.
III. Mustafa Kemal Paşa başkomutanlık yetkisine dayanarak ordunun acil ihtiyaçlarını halktan temin etmek amacıyla "Tekalif-i Milliye Emirleri"ni yayımlamıştır.

yargılarından hangileri doğrudur?',
  '{"options": ["Yalnız I", "I ve II", "I ve III", "II ve III", "I, II ve III"], "correctIndex": 4}'::jsonb,
  'Üç öncül de tarihsel olarak tamamen doğrudur. Başkomutanlık Kanunu ile olağanüstü yetkiler Mustafa Kemal''de toplanmış, askerliğe dönmüş ve Tekalif-i Milliye emirlerini doğrudan yayımlamıştır.',
  'Tekalif-i Milliye Emirleri meclis tarafından değil, Mustafa Kemal''in başkomutanlık yetkisiyle doğrudan çıkardığı emirlerdir.'
);

-- Soru tar_kshc_038
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
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  '23 Ağustos - 13 Eylül 1921 tarihleri arasında 22 gün 22 gece aralıksız süren, Mustafa Kemal Paşa''nın "Hatt-ı müdafaa yoktur, sath-ı müdafaa vardır. O satıh bütün vatandır!" emrini verdiği, subay kaybının yüksekliği sebebiyle tarihe "Subaylar Savaşı" veya "Melhame-i Kübra" (Büyük Kıyım) olarak geçen ve 1683 II. Viyana Kuşatması''ndan beri süren Türk geri çekilişini durduran savaş aşağıdakilerden hangisidir?',
  '{"options": ["I. İnönü Savaşı", "II. İnönü Savaşı", "Kütahya-Eskişehir Savaşı", "Sakarya Meydan Muharebesi", "Büyük Taarruz"], "correctIndex": 3}'::jsonb,
  'Sakarya Meydan Muharebesi, Türk ordusunun son savunma savaşıdır. Bu zaferle 238 yıllık geri çekilme durmuş; Mustafa Kemal''e Gazilik unvanı ve Mareşallik rütbesi verilmiştir.',
  'Adaylar "Subaylar Savaşı" tabirini Çanakkale veya Büyük Taarruz ile karıştırabilir. Subaylar Savaşı ve Melhame-i Kübra Sakarya''dır.'
);

-- Soru tar_kshc_039
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
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  2,
  '26 Ağustos 1922''de Kocatepe''den başlayan ve 30 Ağustos''ta Dumlupınar Meydan Muharebesi ile Yunan ordusunun imha edilmesiyle sonuçlanan Büyük Taarruz''dan sonra;

Mustafa Kemal Paşa''nın "Ordular ilk hedefiniz Akdeniz''dir, ileri!" emriyle İzmir''e giren Türk ordusunun ardından İtilaf Devletleri ile imzalanan ve Doğu Trakya, İstanbul ve Boğazların savaş yapılmadan (diplomatik yolla) kurtarılmasını sağlayan ateşkes antlaşması aşağıdakilerden hangisidir?',
  '{"options": ["Mondros Ateşkesi", "Mudanya Ateşkes Antlaşması", "Gümrü Antlaşması", "Lozan Barış Antlaşması", "Ankara Antlaşması"], "correctIndex": 1}'::jsonb,
  'Mudanya Ateşkes Antlaşması (11 Ekim 1922) ile Doğu Trakya, İstanbul ve Boğazlar tek bir kurşun atılmadan kurtarılmıştır. TBMM adına görüşmeleri İsmet İnönü yürütmüş; Trakya Yüksek Komiseri Refet Bele Doğu Trakya''yı teslim almıştır.',
  'ÖSYM "Savaşsız kurtarılan yerler neresidir?" (Doğu Trakya, Boğazlar, İstanbul) ve "Trakya Yüksek Komiseri kimdir?" (Refet Bele) sorularını sıklıkla sorar.'
);

-- Soru tar_kshc_040
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
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'multiple_choice',
  3,
  '24 Temmuz 1923 tarihinde imzalanan Türkiye Cumhuriyeti''nin tapu senedi niteliğindeki Lozan Barış Antlaşması ile ilgili olarak aşağıda verilen bilgilerden hangisi yanlıştır?',
  '{"options": ["Kapitülasyonlar ve Düyun-u Umumiye İdaresi hiçbir taviz verilmeksizin tamamen kaldırılmıştır.", "Türkiye''deki tüm gayrimüslim azınlıklar Türk vatandaşı sayılarak Avrupalıların iç işlerimize karışması engellenmiştir.", "Suriye sınırı 1921 Ankara Antlaşması, Doğu sınırı ise 1921 Kars Antlaşması esas alınarak belirlenmiştir.", "Boğazların yönetimi, başkanı Türk olan uluslararası bir komisyona bırakılmış ve boğazın her iki yakası askersizleştirilmiştir.", "Türkiye ile İngiltere arasında yaşanan Musul (Irak Sınırı) sorunu Türkiye lehine çözülerek Musul Türkiye sınırlarına katılmıştır."], "correctIndex": 4}'::jsonb,
  'Musul Sorunu (Irak Sınırı) Lozan''da çözülememiştir! İkili görüşmelere bırakılmış; daha sonra Şeyh Sait İsyanı''nın çıkması üzerine 1926 Ankara Antlaşması ile Musul maalesef İngiliz mandasındaki Irak''a bırakılmak zorunda kalınmıştır.',
  'ÖSYM''nin en klasik Lozan sorusudur: "Lozan''da çözülemeyip sonraya bırakılan tek konu nedir?" Cevap: Musul (Irak Sınırı) Sorunu.'
);
