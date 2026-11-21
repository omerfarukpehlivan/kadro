-- ==========================================================================
-- KADRO SORU HAVUZU · KPSS GY Türkçe · GEMİNİ PARTİ 4 (30 soru: 12 Sözel Mantık, 8 Cümlede Anlam, 10 Dil Bilgisi) · SUPABASE SQL
-- exam_scopes: lisans_gygk · education_level: lisans · Özgün üretim
-- Kullanıcı onayı bekliyor
-- ==========================================================================

insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  exam_scopes,
  education_level
) values
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  'Beş katlı bir apartmanın 1''den 5''e kadar numaralandırılmış katlarının her birinde Ali, Burcu, Can, Deniz ve Elif''ten biri oturmaktadır. Bu kişilerin meslekleri doktor, öğretmen, mühendis, avukat ve mimardır. Kişilerin katları ve meslekleriyle ilgili şunlar bilinmektedir:
- Burcu 2. kattadır ve mühendis değildir.
- Avukat 5. kattadır; mühendis ise avukatın iki kat altındadır.
- Doktor, öğretmenin hemen üstündeki kattadır.
- Can, Ali''nin hemen altındaki kattadır ve Ali 5. katta değildir.
- Deniz 1. katta değildir ve mimar değildir.

Buna göre 4. katta oturan kişi ve mesleği aşağıdakilerden hangisidir?',
  '{"options":["Burcu - Doktor","Can - Mühendis","Deniz - Avukat","Ali - Mimar","Elif - Öğretmen"],"correctIndex":3}'::jsonb,
  'Avukat 5. katta, mühendis 3. kattadır. Doktor öğretmenin hemen üstünde olduğu için boş kalan ardışık katlar yalnızca 1 ve 2''dir; bu nedenle 1. kat öğretmen, 2. kat doktor (Burcu) olur ve 4. kata mimar kalır. Can, Ali''nin hemen altında olup Ali 5. katta olmadığından Can 3. katta (mühendis), Ali 4. katta (mimar) oturur. Deniz 1. katta olmadığına göre 5. katta (avukat), Elif ise 1. katta (öğretmen) oturur.',
  'Can ile Ali''nin 4 ve 5. katlara yerleştirilmesi olası görünse de "Ali 5. katta değildir" ve "Deniz mimar değildir" koşulları birlikte değerlendirildiğinde 4. katta yalnızca Ali (mimar) yer alabilir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  'Bir üniversitede pazartesiden cumaya kadar beş gün boyunca her gün yalnızca bir kişi (Aylin, Barış, Cemil, Derya ve Emre) tarih, coğrafya, ekonomi, hukuk ve sosyoloji konularından birinde seminer verecektir. Programla ilgili şunlar bilinmektedir:
- Ekonomi semineri çarşamba günüdür.
- Sosyoloji semineri, coğrafya seminerinden hemen önceki gündür.
- Aylin hukuk semineri verecektir ve sunumu cuma günü değildir.
- Barış, tarih seminerini pazartesi değil ama Emre''den önceki bir günde verecektir.
- Derya, Cemil''den hemen sonraki gün sunum yapacaktır ve konusu coğrafya değildir.
- Cemil''in konusu coğrafya değildir.

Buna göre perşembe günü hangi kişi hangi konuda seminer verecektir?',
  '{"options":["Cemil - Sosyoloji","Emre - Coğrafya","Barış - Tarih","Derya - Sosyoloji","Aylin - Hukuk"],"correctIndex":3}'::jsonb,
  'Çarşamba ekonomi olduğuna göre ardışık sosyoloji-coğrafya ikilisi yalnızca perşembe-cuma olabilir (pazartesi-salıda Barış salı günü tarih verecektir; çünkü pazartesi değil ve çarşamba ekonomi). Böylece salı Barış (tarih), pazartesi Aylin (hukuk) olur. Kalan günlerden çarşamba için Derya Cemil''den hemen sonra olduğundan Cemil-Derya ikilisi çarşamba-perşembe yerleşir ve cuma Emre (coğrafya) kalır. Perşembe günü Derya sosyoloji semineri verir.',
  'Cemil ve Derya''nın perşembe-cuma günlerine yerleşebileceği düşünülebilir; ancak "Derya''nın konusu coğrafya değildir" koşulu bu olasılığı eler ve perşembe gününe Derya''yı (sosyoloji) sabitler.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  'Arda, Begüm, Cihan, Damla ve Erdem adlı beş araştırmacı; Ankara, İzmir ve Trabzon''daki konferanslara gidecektir. Her kente en az bir, en fazla iki kişi gidecek biçimde yapılan görevlendirmede şunlar bilinmektedir:
- Ankara''ya yalnızca bir kişi gidecektir.
- Arda ile Damla aynı kente gidecektir.
- Begüm İzmir''e gitmeyecektir ve Cihan ile aynı kente gidecektir.
- Erdem Trabzon''a gitmeyecektir.

Buna göre aşağıdakilerden hangisi kesinlikle doğrudur?',
  '{"options":["Erdem İzmir''e gidecektir.","Cihan Ankara''ya gidecektir.","Arda Trabzon''a gidecektir.","Damla İzmir''e gidecektir.","Begüm Ankara''ya gidecektir."],"correctIndex":3}'::jsonb,
  'Ankara''ya yalnızca 1 kişi gidebildiğinden ikişer kişilik iki grup olan Arda-Damla ve Begüm-Cihan Ankara''ya gidemez; dolayısıyla Ankara''ya tek kalan Erdem gider. Begüm İzmir''e gitmediğine göre Begüm ve Cihan Trabzon''a, Arda ve Damla ise İzmir''e gider. Bu nedenle Damla''nın İzmir''e gideceği kesindir.',
  'Erdem''in Trabzon''a gitmeyeceği söylendiği için aday doğrudan Erdem''i İzmir''e yerleştirebilir. Ancak ikişer kişilik iki çift Ankara''ya sığamadığından Ankara''ya mutlaka tek kalan Erdem gitmelidir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  'Bir rafa soldan sağa 1''den 6''ya kadar numaralandırılmış yerlere 2 kırmızı, 2 mavi, 1 sarı ve 1 yeşil dosya aşağıdaki kurallara göre dizilecektir:
- Aynı renkteki iki dosya yan yana olmayacaktır.
- Yeşil dosya, sarı dosyanın hemen solunda olacaktır.
- Sarı dosya 1. sırada, yeşil dosya da 1. sırada olmayacaktır.
- 1. ve 6. sıradaki dosyalar farklı renklerde olacaktır.
- 2. sıradaki dosya mavi olmayacaktır.

Buna göre 2. sıradaki dosya için aşağıdakilerden hangisi kesinlikle doğrudur?',
  '{"options":["Kesinlikle kırmızı renktedir.","1. sıradaki dosya ile aynı renktedir.","Kesinlikle yeşil renktedir.","Sarı renktedir.","Kırmızı veya yeşil renktedir."],"correctIndex":4}'::jsonb,
  '2. sıradaki dosya mavi olamaz. Eğer 2. sıradaki dosya sarı olsaydı hemen solundaki 1. sıraya yeşil dosya gelirdi; ancak yeşil dosyanın 1. sırada olmadığı verilmiştir. Dolayısıyla 2. sıradaki dosya sarı da olamaz. Tüm kuralları sağlayan beş farklı dizilimde 2. sırada yalnızca kırmızı ya da yeşil dosya bulunabilmektedir.',
  'Yeşil-sarı ikilisi blok hâlinde hareket ettiği için aday 2. sıranın sarı olabileceğini düşünebilir. Oysa yeşil dosyanın 1. sırada bulunamaması, sarı dosyanın da 2. sırada yer almasını engeller.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  'Ece, Fatih, Gökhan ve Hale adlı dört sporcu bir koşu yarışmasında ilk dört dereceyi (1., 2., 3., 4.) paylaşmıştır. Her biri Bursa, Eskişehir, Konya ve Samsun''dan birini temsil etmektedir. Yarışmayla ilgili şunlar bilinmektedir:
- Eskişehir temsilcisi 1. olmuştur.
- Ece, Fatih''in hemen arkasındaki dereceyi almıştır.
- Bursa temsilcisi, Gökhan''dan daha iyi bir derece elde etmiştir.
- Hale 4. olmamıştır ve Samsun temsilcisi değildir.
- Gökhan 2. olmamıştır ve Konya temsilcisi değildir.
- Fatih Konya temsilcisidir.

Buna göre 3. olan sporcu ve temsil ettiği şehir aşağıdakilerden hangisidir?',
  '{"options":["Hale - Eskişehir","Fatih - Konya","Ece - Samsun","Gökhan - Samsun","Ece - Bursa"],"correctIndex":4}'::jsonb,
  'Fatih (Konya) 1. olamaz (1. Eskişehir). Fatih 3. olsaydı Ece 4. olurdu, bu durumda Gökhan 2. olamayacağı için 2. sıraya Hale kalır ve Eskişehir temsilcisi 1. olamazdı (Gökhan 1. olursa Bursa ondan iyi olamaz). Bu yüzden Fatih 2., Ece 3. olmalıdır. Gökhan 2. olamadığı ve Bursa temsilcisinden geride kaldığı için 4.dür; 1. ise Hale (Eskişehir) olur. Ece''ye Bursa, Gökhan''a Samsun kalır.',
  'Fatih ve Ece ardışık olduğu için aday ikisini 3. ve 4. sıralara yerleştirmeyi deneyebilir. Ancak Gökhan''ın 1. olması "Bursa temsilcisi Gökhan''dan iyi derece almıştır" koşuluyla çeliştiğinden tek çözüm Fatih''in 2., Ece''nin 3. olmasıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  'Bir kafede oturan Defne, Emre, Furkan ve Gizem; kahve, çay ve limonatadan birer içecek, börek ve poğaçadan birer yiyecek sipariş etmiştir. Siparişlerle ilgili şunlar bilinmektedir:
- Üç içeceğin her birinden en az bir kişi sipariş vermiştir.
- Yalnızca bir kişi poğaça seçmiştir.
- Defne çay içmiştir ve Furkan ile aynı yiyeceği seçmiştir.
- Emre kahve içmemiştir ve poğaça seçmemiştir.
- Limonata içen kişi börek seçmemiştir.

Buna göre aşağıdakilerden hangisi kesinlikle doğrudur?',
  '{"options":["Furkan limonata içmiştir.","Emre limonata içmiştir.","Gizem kahve içmiştir.","Defne poğaça seçmiştir.","Gizem limonata içmiş ve poğaça seçmiştir."],"correctIndex":4}'::jsonb,
  'Yalnızca 1 kişi poğaça seçtiğinden aynı yiyeceği seçen Defne ve Furkan börek seçmiştir. Emre de poğaça seçmediğine göre poğaça seçen tek kişi Gizem''dir. Limonata içen kişi börek seçmediğine (yani poğaça seçtiğine) göre limonata içen tek kişi de Gizem''dir. Emre kahve içmediği için çay içmiş, üç içeceğin de seçilebilmesi için Furkan kahve içmiştir.',
  'Emre kahve içmediği için limonata içmiş olabileceği düşünülebilir. Ancak limonata içen kişinin börek seçememesi ve poğaça seçen tek kişinin Gizem olması, limonatayı da yalnızca Gizem''e bağlar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  2,
  'Altı vagondan oluşan bir trende A, B, C, D, E ve F vagonları lokomotifin arkasından 1''den 6''ya kadar numaralandırılarak sıralanmıştır. Vagonların sırasıyla ilgili şunlar bilinmektedir:
- E vagonu 6. sıradadır.
- D vagonu 1. sırada değildir.
- B vagonu, A vagonunun hemen arkasındadır.
- C vagonu, A vagonundan daha önde bir sıradadır.
- C vagonu ile F vagonu arasında tam iki vagon vardır ve F vagonu B vagonundan daha arkadadır.

Buna göre 4. sırada hangi vagon bulunmaktadır?',
  '{"options":["D","A","B","C","F"],"correctIndex":4}'::jsonb,
  'C ile F arasında tam 2 vagon olduğuna ve 6. sırada E bulunduğuna göre (C, F) çifti yalnızca (1, 4) ya da (2, 5) olabilir. Eğer C 2., F 5. sırada olsaydı C''den arkada ve F''den önde olan (A, B) ikilisi 3 ve 4. sıraya yerleşir, böylece 1. sıraya tek kalan D geçerdi; ancak D 1. sırada değildir. Bu nedenle C 1., F 4., A 2., B 3., D 5. ve E 6. sıradadır.',
  'C ve F arasındaki iki vagonun A ile B olduğu varsayıldığında (2, 5) yerleşimi doğru gibi görünür. Ancak bu durumda 1. sırada kalacak tek vagonun D olması koşulla çelişir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  'İrem, Kaan, Lale ve Mert; salı, çarşamba, perşembe ve cuma günlerinde birer gün kütüphaneden tarih, roman, biyografi ve deneme türlerinden farklı birer kitap ödünç almıştır. Konuyla ilgili şunlar bilinmektedir:
- Tarih kitabı salı günü ödünç alınmıştır.
- Deneme kitabı, roman türündeki kitaptan hemen önceki gün alınmıştır.
- Mert, İrem''den iki gün sonra kitap almıştır.
- Kaan cuma günü kitap almamıştır ve biyografi türünü seçmemiştir.
- Lale roman ve tarih türlerini almamıştır.
- İrem biyografi türünü almamıştır.

Buna göre perşembe günü kim hangi tür kitabı almıştır?',
  '{"options":["Kaan - Deneme","Mert - Roman","İrem - Tarih","Lale - Biyografi","Mert - Deneme"],"correctIndex":1}'::jsonb,
  'Mert İrem''den iki gün sonra aldığı için (İrem, Mert) ikilisi ya (Salı, Perşembe) ya da (Çarşamba, Cuma) olur. Eğer (Çarşamba, Cuma) olsaydı ardışık Deneme-Roman günleri ya çarşamba-perşembe (bu durumda Lale perşembe günü roman almış olur ve kural bozulur) ya da perşembe-cuma (bu durumda İrem çarşamba biyografi almış olur ve kural bozulur) olurdu. Bu nedenle İrem salı (tarih), Mert perşembe olur; Deneme-Roman çarşamba-perşembe yerleşir; cuma Lale biyografi, çarşamba Kaan deneme alır.',
  'İrem''i çarşamba gününe yerleştirmek ilk adımda mümkün görünür; ancak "İrem biyografi almamıştır" ve "Lale roman ile tarih almamıştır" koşulları birlikte işletildiğinde İrem''in salı, Mert''in perşembe olduğu tek çözüm kalır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  2,
  'Tek kişilik sıra hâlindeki 1''den 5''e kadar numaralı beş koltukta Ozan, Pınar, Rıza, Seda ve Tarık oturmaktadır. Yolculardan yalnızca Pınar ve Seda kadındır. Oturma düzeniyle ilgili şunlar bilinmektedir:
- Kadın yolcular yan yana koltuklarda oturmamaktadır.
- Ozan ile Tarık arasında tam bir yolcu oturmaktadır.
- Rıza 1. veya 5. koltukta değildir ve Seda''nın hemen solundadır.
- Pınar 1. koltukta değildir ve Tarık''ın hemen sağındadır.

Buna göre 3. koltukta oturan yolcu kimdir?',
  '{"options":["Tarık","Pınar","Rıza","Seda","Ozan"],"correctIndex":4}'::jsonb,
  'Rıza Seda''nın hemen solunda ve 1. ya da 5. koltukta değilse (Rıza, Seda) ikilisi (2, 3), (3, 4) veya (4, 5) olabilir. Pınar Tarık''ın hemen sağında ve Ozan ile Tarık arasında 1 kişi varsa diziliş (Tarık, Pınar, Ozan) ya da (Ozan, ..., Tarık, Pınar) şeklindedir. Kadınlar yan yana olamayacağından tek geçerli yerleşim: 1. Tarık, 2. Pınar, 3. Ozan, 4. Rıza, 5. Seda olur. 3. koltukta Ozan oturmaktadır.',
  'Ozan ile Tarık''ın yerlerini değiştirerek (Ozan 1., Tarık 3., Pınar 4.) kurmaya çalışmak kadınlar olan Pınar ve Seda''nın veya Rıza ile Seda''nın yerlerini çakıştırır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  2,
  'Bir yarışmada yalnızca bir kişi birinci olmuştur ve birinci olan kişi Alp, Bilge, Cem ya da Duru''dan biridir. Dördünün söyledikleri aşağıdadır:
- Alp: "Birinci olan ben değilim."
- Bilge: "Birinci olan Cem ya da Duru''dur."
- Cem: "Birinci olan Duru değildir."
- Duru: "Birinci olan Bilge''dir."

Bu dört kişiden yalnızca ikisi doğru söylediğine göre birinci olan kimdir?',
  '{"options":["Alp","Bilge","Cem","Duru","Belirlenemez"],"correctIndex":3}'::jsonb,
  'Her aday tek tek sınandığında: Alp birinciyse Bilge ve Duru yanlış, Alp yanlış, yalnızca Cem doğru söyler (1 doğru). Bilge birinciyse Alp, Cem ve Duru doğru söyler (3 doğru). Cem birinciyse Alp, Bilge ve Cem doğru söyler (3 doğru). Duru birinciyse yalnızca Alp ve Bilge doğru söyler (2 doğru). Koşulu yalnızca Duru''nun birinci olduğu durum sağlar.',
  'Cem ve Duru''nun ifadelerinin ikisi de doğrudan bir kişiyi işaret ettiği için aday doğru sayısını hesaplarken Alp''in "ben değilim" sözünü atlayabilir. Tüm ifadelerin doğruluk değeri dört senaryo için ayrı ayrı sayılmalıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  '"Bir eğitim programına katılan herkes sertifika almıştır. Sertifika alan hiç kimse sınava yeniden girmemiştir. Sınava yeniden giren bazı kişiler yüksek lisans öğrencisidir."

Selin''in sınava yeniden girdiği bilindiğine göre aşağıdakilerden hangisi kesinlikle doğrudur?',
  '{"options":["Selin yüksek lisans öğrencisidir.","Selin sertifika almış ama programı tamamlamamıştır.","Eğitim programına katılmayan herkes sınava yeniden girmiştir.","Selin bu eğitim programına katılmamıştır.","Yüksek lisans öğrencilerinin hiçbiri sertifika almamıştır."],"correctIndex":3}'::jsonb,
  'Sertifika alan hiç kimse sınava yeniden girmediğine göre sınava yeniden giren Selin sertifika almamıştır. Eğitim programına katılan herkes sertifika aldığı için Selin''in bu eğitim programına katılmadığı kesinleşir (aksi hâlde sertifika almış olurdu).',
  '"Sınava yeniden giren bazı kişiler yüksek lisans öğrencisidir" önermesi, Selin''in de yüksek lisans öğrencisi olduğu izlenimini verebilir. Ancak "bazı" ifadesi sınava yeniden giren herkesi kapsamaz.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözel Mantık ve Muhakeme',
  'multiple_choice',
  3,
  'Bir kurumdaki K, L, M, N, O ve P adlı altı uzmandan dört kişilik bir komisyon seçilecektir. Seçimle ilgili kurallar şunlardır:
- K seçilirse L de seçilir.
- M ile N birlikte seçilemez.
- O seçilmezse P de seçilmez.
- L ve P aynı anda seçilemez.

K''nin komisyona seçildiği bilindiğine göre aşağıdakilerden hangisi kesinlikle doğrudur?',
  '{"options":["M komisyona seçilir.","N komisyona seçilir.","P komisyona seçilir.","O komisyona seçilir.","L komisyona seçilmez."],"correctIndex":3}'::jsonb,
  'K seçildiğine göre L de seçilir. L seçildiği için L ile birlikte seçilemeyen P komisyona giremez. Kalan dört kişiden (M, N, O ve kalan seçim hakkı) M ile N aynı anda seçilemeyeceğinden bu ikisinden en fazla biri komisyona alınabilir; böylece dört kişiyi tamamlamak için O mutlaka komisyona seçilir (komisyon K-L-M-O ya da K-L-N-O olur).',
  '"O seçilmezse P de seçilmez" kuralı yüzünden P elenince O''nun da elenebileceği sanılabilir. Oysa P''nin elenmesi L yüzündendir ve M ile N aynı anda seçilemediği için 4. koltuğu doldurmak adına O''nun seçilmesi zorunludur.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  3,
  '(I) Tarih boyunca şehirler, çoğunlukla verimli tarım ovalarının kıyısına ya da akarsu kavşaklarına kurulmuştur.
(II) Bu yerleşim tercihi, hem günlük içme suyuna erişimi hem de ticaret yollarının kontrolünü kolaylaştırmıştır.

Bu iki cümlede ifade edilenlerin anlamca doğru bir biçimde birleştirilmiş hâli aşağıdakilerden hangisidir?',
  '{"options":["Tarih boyunca yalnızca akarsu kavşaklarına kurulan şehirler, ticaret yollarını kontrol ettikleri için verimli tarım ovalarına dönüşmüştür.","Verimli tarım ovalarının kıyısında ya da akarsu kavşaklarında kurulan şehirler, tarih boyunca içme suyuna erişimi sağlasa da ticaret yollarını koruyamamıştır.","Tarih boyunca şehirlerin çoğunlukla verimli tarım ovalarının kıyısına ya da akarsu kavşaklarına kurulması, hem günlük içme suyuna erişimi hem de ticaret yollarının denetimini kolaylaştırmıştır.","Günlük içme suyuna erişmek isteyen bütün şehirler, tarih boyunca verimli ovalardan uzaklaşıp akarsu kavşaklarına taşınmıştır.","Tarih boyunca şehirler ticaret yollarını kontrol etmek için kurulmuş, daha sonra çevrelerinde verimli tarım ovaları oluşmuştur."],"correctIndex":2}'::jsonb,
  'Doğru birleştirme, birinci cümledeki zaman ve yer kapsamını ("tarih boyunca", "çoğunlukla", "verimli tarım ovalarının kıyısına ya da akarsu kavşaklarına") koruyarak ikinci cümledeki her iki sonucu ("günlük içme suyuna erişim" ve "ticaret yollarının denetimi/kontrolü") neden-sonuç ilişkisi içinde eksiksiz aktarır.',
  'Diğer şıklarda "yalnızca", "bütün" gibi kapsayıcı abartılar ya da "kontrol edememiştir" gibi ters yargılar eklenmiştir. İki cümle birleştirilirken hiçbir bilgi eklenip çıkarılmamalıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  3,
  '"Bir toplumun gelişmişliği, ürettiği bilginin miktarından çok, o bilgiyi eleştirel süzgeçten geçirip gündelik yaşamda ne ölçüde uygulayabildiğiyle ölçülür."

Bu cümleyle anlamca en yakın cümle aşağıdakilerden hangisidir?',
  '{"options":["Çok bilgi üreten toplumlar, o bilgiyi sorgulamadan da yüksek gelişmişlik düzeyine ulaşır.","Toplumsal gelişmişlikte asıl belirleyici olan, bilginin yığınından ziyade sorgulanarak hayata geçirilebilmesidir.","Gündelik yaşamda uygulanan bilgilerin hiçbiri eleştirel süzgeçten geçirilmek zorunda değildir.","Bilgi üretimi arttıkça toplumların eleştirel düşünme alışkanlığı kendiliğinden azalır.","Gelişmiş toplumlarda bilgi yalnızca kuramsal çalışmalar için üretilir."],"correctIndex":1}'::jsonb,
  'Kökteki cümle, bilginin miktarından çok onu eleştirel biçimde süzüp yaşama uygulayabilmenin gelişmişlik ölçütü olduğunu söyler; doğru seçenek aynı yargıyı "bilginin yığını" ve "sorgulanarak hayata geçirilmesi" ifadeleriyle karşılar.',
  'Bilgi üretimi vurgusunu gören aday "çok bilgi üreten toplumlar" yargısına yönelebilir; ancak cümle "miktarından çok" diyerek salt nicelik birikimini ikinci plana iter.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  3,
  '"Deneyimli bir zanaatkâr, kullandığı aleti kusursuz olduğu için değil, onun sınırlarını ve tepkilerini yıllar içinde ezberlediği için hatasız iş çıkarır."

Bu cümleden aşağıdaki yargılardan hangisine ulaşılamaz?',
  '{"options":["Ustalık, kullanılan aracın sınırlarını tanımayı gerektirir.","Kusursuz araçlara sahip olmadan da nitelikli iş üretilebilir.","Bir işi hatasız yapabilmek için mutlaka en gelişmiş ve kusursuz araçlara sahip olmak gerekir.","Uzun süreli deneyim, aracın tepkilerini öngörmeyi kolaylaştırır.","Zanaatkârın başarısı, aracından çok aracıyla kurduğu deneyime bağlıdır."],"correctIndex":2}'::jsonb,
  'Cümle, zanaatkârın başarısını aracın kusursuzluğuna değil, yıllar içinde kazanılan tanıma ve deneyime bağlar. Bu nedenle mutlaka kusursuz araçlara sahip olunması gerektiği yargısına ulaşılamaz.',
  '"Kullandığı aleti kusursuz olduğu için değil" ifadesi hızlı okunduğunda kusursuz aletin gerekliliği gibi yanlış bir algı yaratabilir. Oysa cümle, kusursuzluk şartını açıkça reddeder.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde aşamalı bir durum (dereceli değişim) anlatılmaktadır?',
  '{"options":["Yağmur şiddetini artırdığı için açık hava konseri ertelendi.","Köyün nüfusu, gençlerin büyük kentlere göç etmesiyle yıl geçtikçe azalıyordu.","Kitabın son sayfasını okuduktan sonra derin bir nefes aldı.","Yarınki toplantıya bütün birim yöneticilerinin katılması bekleniyor.","Eski ahşap köprü, geçen kış yapılan onarımın ardından yeniden açıldı."],"correctIndex":1}'::jsonb,
  '"Yıl geçtikçe azalıyordu" ifadesinde olayın birdenbire değil, zaman içinde aşama aşama değiştiği bildirilmektedir. Diğer cümlelerde anlık neden-sonuç, ardışıklık, beklenti ve tamamlanmış bir eylem vardır.',
  '"Yağmur şiddetini artırdığı için" ifadesindeki "artırmak" fiili artış çağrışımı yaptığı için aşamalı durum sanılabilir; ancak burada yağmurun artışı bir olayın gerekçesi olarak tek bir anı anlatır, "yıl geçtikçe" gibi sürece yayılan bir değişimi vurgulamaz.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerin hangisinde varsayım anlamı vardır?',
  '{"options":["Keşke geçen yaz o eski sahil kasabasına birkaç gün daha kalsaydık.","Zamanında yola çıkarsak güneş batmadan yaylaya ulaşabiliriz.","Diyelim ki bütün hazırlıklarına rağmen sınav günü beklenmedik bir aksilik yaşadın, nasıl davranırsın?","Hava çok soğuk olduğundan çocuklar bahçede uzun süre kalamadı.","Babam eve gelir gelmez gününün nasıl geçtiğini sordu."],"correctIndex":2}'::jsonb,
  'Varsayım cümleleri, gerçekleşmemiş bir durumun geçici olarak gerçekleşmiş gibi kabul edilmesini ("diyelim ki, tut ki, farz edelim ki") içerir. "Diyelim ki ... aksilik yaşadın" cümlesi varsayım anlamı taşır.',
  '"Keşke ... kalsaydık" pişmanlık/gerçekleşmemiş dilek, "çıkarsak" ise gelecek için koşul bildirir. İkisi de gerçek olmayan durumlara gönderme yaptığı için varsayımla karıştırılabilir; varsayım zihinsel bir senaryoyu kabulle kurar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  'Araştırmacının elindeki veriler öne sürdüğü varsayımı güçlü biçimde destekliyordu; ....... örneklem yalnızca tek bir kentle sınırlı olduğundan kesin bir genelleme yapmaktan kaçındı.

Bu cümlede boş bırakılan yere anlam akışına göre aşağıdakilerden hangisi getirilmelidir?',
  '{"options":["nitekim","ne var ki","bu yüzden","örneğin","ayrıca"],"correctIndex":1}'::jsonb,
  'Cümlenin ilk yarısı verilerin varsayımı desteklediğini (olumlu yön), ikinci yarısı ise araştırmacının genellemeden kaçındığını (sınırlama/karşıt yön) bildirir. Bu iki yargı arasındaki karşıtlığı yalnızca "ne var ki" bağlacı kurar.',
  'İkinci bölümün içinde "sınırlı olduğundan" ifadesi geçtiği için aday "bu yüzden" seçeneğine yönelebilir. Oysa boşluk, "sınırlı olduğundan" gerekçesiyle birlikte bütününde ilk yarıya ("güçlü biçimde destekliyordu") karşıtlık kuran bir köprü ister.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde kanıksama (alışıp doğal görme) anlamı vardır?',
  '{"options":["Yıllardır sokağımızdaki bitmek bilmeyen gürültüyü o kadar olağan karşılıyoruz ki artık kimse bu duruma tepki bile vermiyor.","O kadar uyarmama rağmen yine aynı dikkatsizliği yapmana bir anlam veremiyorum.","Kendi hatalarını görmezden gelip sürekli başkalarını suçlaması beni çok kırdı.","Bu küçük kasabada insanların birbirine bu denli yardım etmesine doğrusu çok şaşırdım.","Yıllar önce çekilmiş o sararmış fotoğrafı görünce eski günler aklıma geldi."],"correctIndex":0}'::jsonb,
  'Kanıksama, olumsuz ya da yadırgatıcı bir durumun tekrar tekrar yaşanması sonucu artık olağan karşılanması ve tepki verilmemesi anlamındadır; inşaat gürültüsüne alışıp şikâyet etmemek bunu ifade eder. Diğer cümlelerde sitem, kırgınlık, şaşırma ve özlem vardır.',
  '"Yıllar önce... eski günler aklıma geldi" ya da "yine aynı dikkatsizlik" gibi tekrar bildiren cümleler alışma çağrışımı yapabilir; ancak kanıksama, tepki göstermemeyi ve durumu kanıksayıp kabullenmeyi içerir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerden hangisi anlamca diğerlerinden farklıdır?',
  '{"options":["Belirsizliği göze alamayan kişi, yeni bir yol açmayı başaramaz.","Bütün riskler tamamen ortadan kalkmadan yeni bir girişime başlamak doğru değildir.","Yenilik üretmek isteyen herkes, bilinmeyene doğru adım atma cesaretini göstermelidir.","Başarısızlık ihtimalinden bütünüyle kaçınanlar, özgün bir sonuca ulaşamaz.","Önünü sonunu eksiksiz hesaplamayı beklemek, çoğu zaman yaratıcı atılımları engeller."],"correctIndex":1}'::jsonb,
  'Dört cümle belirsizliği ve riski göze almadan yenilik/başarı üretilemeyeceğini savunur. "Bütün riskler tamamen ortadan kalkmadan yeni bir girişime başlamak doğru değildir." cümlesi ise tam tersine riskler bitmeden adım atılmaması gerektiğini söyler.',
  'Beş cümlede de risk, belirsizlik ve yeni girişim kavramları geçtiği için aday yüzeysel sözcük benzerliğine kapılabilir. Yargıların olumlu mu olumsuz mu yönlendirdiğine bakıldığında yalnızca riskin sıfırlanmasını şart koşan cümle ayrılır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Ses Bilgisi ve Ses Olayları',
  'multiple_choice',
  3,
  'Aşağıdaki sözcüklerden hangisi küçük ünlü uyumuna uymaz?',
  '{"options":["gömlek","koltuk","horoz","börek","çadır"],"correctIndex":2}'::jsonb,
  'Küçük ünlü uyumuna göre düz ünlülerden (a, e, ı, i) sonra düz ünlüler; yuvarlak ünlülerden (o, ö, u, ü) sonra ise ya düz-geniş (a, e) ya da dar-yuvarlak (u, ü) ünlüler gelir. "o" ve "ö" ünlüleri Türkçe sözcüklerde yalnızca ilk hecede bulunur. "Horoz" sözcüğünün ikinci hecesinde geniş-yuvarlak "o" bulunduğu için küçük ünlü uyumuna uymaz; diğer dört sözcük (ö-e, o-u, ö-e, a-ı) uyar.',
  'Aday "gömlek" ve "börek" sözcüklerinde yuvarlak "ö"den sonra düz "e" geldiği için uyumun bozulduğunu sanabilir. Oysa küçük ünlü uyumunda yuvarlak ünlüden sonra düz-geniş (a, e) ünlü gelmesi kurala uygundur.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Ses Bilgisi ve Ses Olayları',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde ünsüz benzeşmesine (ünsüz sertleşmesine) uğramış bir sözcük vardır?',
  '{"options":["Dün akşamki yağmurdan sonra bahçedeki çiçekler yeniden canlandı.","Küçük kardeşim okuldan dönünce hemen ödevine başladı.","Sınıftaki öğrenciler sessizce öğretmenin açıklamasını dinledi.","Balkondaki saksıları güneş gören pencerenin önüne taşıdı.","Akşam serinliğinde sahil boyunca yürüyüp eve döndüler."],"correctIndex":2}'::jsonb,
  '"Sınıftaki" sözcüğünde sert ünsüzle ("f") biten "sınıf" sözcüğüne gelen "-da" bulunma hâl ekinin başındaki "d" ünsüzü sertleşerek "t"ye dönüşmüştür (sınıf-da-ki → sınıftaki). Diğer cümlelerde sert ünsüzden sonra yumuşak ünsüzün sertleştiği bir örnek yoktur.',
  '"Akşamki" ve "bahçedeki" sözcükleri de "-ki" eki aldığı için aday bu sözcüklerde ses olayı arayabilir. Ayrıca "serinliğinde" sözcüğünde ünsüz yumuşaması vardır, benzeşme değildir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Ses Bilgisi ve Ses Olayları',
  'multiple_choice',
  3,
  'Aşağıdaki sözcüklerin hangisinde hem ünlü düşmesi hem de ünsüz yumuşaması birlikte görülmektedir?',
  '{"options":["kaybı","alnı","kitabı","küçücük","hissetti"],"correctIndex":0}'::jsonb,
  '"Kayıp" sözcüğüne ünlüyle başlayan "-ı" eki geldiğinde hem ikinci hecedeki "ı" ünlüsü düşer (ünlü düşmesi) hem de sözcüğün sonundaki "p" sert ünsüzü "b"ye dönüşür (ünsüz yumuşaması): kayıp + ı → kaybı. "Alnı"da yalnızca ünlü düşmesi, "kitabı"da yalnızca ünsüz yumuşaması, "küçücük"te ünsüz düşmesi, "hissetti"de ise ünsüz türemesi ve benzeşme vardır.',
  '"Alnı" ve "kitabı" sözcüklerinin her biri sorulan iki ses olayından birini içerdiği için aday tek bir ses olayını görüp acele karar verebilir. Soruda iki ses olayının aynı sözcükte birleştiği örnek istenmektedir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Ses Bilgisi ve Ses Olayları',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerin hangisinde ünlü daralmasına uğramış bir sözcük vardır?',
  '{"options":["Çocuklar bahçede büyük bir neşeyle koşuyor.","Yeni gelen komşumuz herkesi her sabah güler yüzle karşılıyor.","Yaşlı adam her sabah gazetesini balkonda dikkatle okuyor.","Kardeşim kitaplarını renklerine göre rafa sırayla diziyor.","Öğrenciler sınav öncesinde kütüphanede sessizce çalışıyor."],"correctIndex":1}'::jsonb,
  '"Karşılıyor" sözcüğünün kökü/gövdesi "karşıla-" fiilidir; "-yor" eki geldiğinde fiil sonundaki geniş "a" ünlüsü daralarak "ı"ya dönüşmüştür (karşıla-yor → karşılıyor). "Koşuyor", "diziyor" ve "çalışıyor" ünsüzle biten fiillere yardımcı ünlü gelmesiyle oluşmuştur; "okuyor" fiilinin sonundaki "u" ise zaten dardır.',
  '"Okuyor" fiili de ünlüyle bittiği ve "-yor" aldığı için daralma geçirmiş sanılabilir. Ancak ünlü daralması yalnızca geniş ünlülerin ("a, e") daralmasıyla gerçekleşir; "oku-" zaten dar "u" ile biter.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcük Türleri (İsim, Sıfat, Zamir, Zarf, Edat, Fiil)',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerin hangisinde "yalnız" sözcüğü diğerlerinden farklı bir türde kullanılmıştır?',
  '{"options":["Bu zorlu yolculuğa yalnız çıkmayı bir türlü göze alamadı.","Koca evde günlerce yalnız yaşamak ona oldukça zor geliyordu.","Seninle görüşmeyi çok isterim, yalnız bugün hiç vaktim yok.","Sınav salonunun kapısında yalnız bekleyen çocuk oldukça heyecanlıydı.","Akşamları kıyı boyunca sessizce, yalnız yürümeyi çok severdi."],"correctIndex":2}'::jsonb,
  '"Seninle görüşmeyi çok isterim, yalnız bugün hiç vaktim yok." cümlesinde "yalnız" sözcüğü "ama, fakat" anlamıyla iki cümleyi birbirine bağlayan bağlaç görevindedir. Diğer dört cümlede ise fiilleri ya da fiilimsileri ("çıkmayı", "yaşamak", "bekleyen", "yürümeyi") durum yönünden niteleyen zarf görevindedir.',
  '"Yalnız" sözcüğü "sadece" anlamında edat, "tek başına" anlamında zarf/sıfat ve "ama" anlamında bağlaç olabilir. "Bekleyen" sıfat-fiilinin önünde gelmesi onu sıfat gibi gösterebilir; ancak sözcük "nasıl bekleyen?" sorusuna yanıt verdiği için durum zarfıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcük Türleri (İsim, Sıfat, Zamir, Zarf, Edat, Fiil)',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerin hangisinde "-ecek / -acak" eki diğerlerinden farklı bir görevde kullanılmıştır?',
  '{"options":["Yarın sabah erkenden trenle Ankara''ya gidecek.","Görünmez kazalar için mutlaka gerekli önlemler alınacak.","Bu akşam misafirlere özel bir yemek hazırlayacak.","Böyle harcamaya devam ederse bütün birikimini kısa sürede tüketecek.","Okunacak kitapları masanın sağ köşesine düzenli biçimde dizdi."],"correctIndex":4}'::jsonb,
  '"Okunacak kitapları" tamlamasında "-acak" eki fiili sıfata dönüştüren sıfat-fiil (ortaç) ekidir ve "kitaplar" adını nitelemektedir. Diğer dört cümlede ise "-ecek/-acak" eki yüklemin zamanını bildiren gelecek zaman kip ekidir.',
  'Her cümlede gelecekte yapılacak bir iş anlamı sezildiği için aday eklerin görevini ayırt etmekte zorlanabilir. Yüklemde kip bildiren çekim eki ile bir adın önünde sıfat kuran sıfat-fiil eki ayırt edilmelidir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Sözcük Türleri (İsim, Sıfat, Zamir, Zarf, Edat, Fiil)',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerin hangisinde "ne" sözcüğü soru zamiri olarak kullanılmıştır?',
  '{"options":["Akşamki toplantıda ne konuşulduğunu bana da anlatır mısın?","Bu soğuk havada ne bakıp duruyorsun pencereden dışarı?","Yıllardır görmediğin arkadaşına ne gün uğramayı düşünüyorsun?","Ne güzel bir akşamüstüydü o gün sahilde yaşadığımız!","Bu yarışmaya katılmak için ne kadar çalıştığını herkes biliyor."],"correctIndex":0}'::jsonb,
  '"Akşamki toplantıda ne konuşulduğunu..." cümlesinde "ne" sözcüğü bir adın (konuşulan şeyin/konunun) yerini tuttuğu için soru zamiridir. Diğer cümlelerde "ne" sırasıyla "niçin" anlamında soru zarfı, adı belirten soru sıfatı ("ne gün"), ünlem/derece zarfı ("ne güzel") ve miktar zarfı ("ne kadar") görevindedir.',
  '"Ne gün" ve "ne bakıp duruyorsun" kullanımları da soru cümlesi içinde yer aldığı için zamir sanılabilir. Ancak bir adı niteleyen "ne" sıfat, "niçin" anlamına gelen "ne" zarftır; yalnızca bir adın yerini tutan "ne" zamirdir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlenin Ögeleri ve Cümle Türleri',
  'multiple_choice',
  3,
  '"Yıllardır beklenen serginin açılışını büyük bir heyecanla izleyen sanatseverler, salonun çıkışında duygularını gazetecilere uzun uzun anlattı."

Bu cümlenin öge sıralanışı aşağıdakilerden hangisinde doğru verilmiştir?',
  '{"options":["Özne - Dolaylı tümleç - Belirtili nesne - Dolaylı tümleç - Zarf tümleci - Yüklem","Belirtili nesne - Zarf tümleci - Özne - Dolaylı tümleç - Zarf tümleci - Yüklem","Özne - Zarf tümleci - Belirtisiz nesne - Dolaylı tümleç - Zarf tümleci - Yüklem","Zarf tümleci - Özne - Belirtili nesne - Dolaylı tümleç - Zarf tümleci - Yüklem","Özne - Dolaylı tümleç - Belirtisiz nesne - Zarf tümleci - Dolaylı tümleç - Yüklem"],"correctIndex":0}'::jsonb,
  'Yüklem: "anlattı". Anlatan kim?: "Yıllardır beklenen serginin açılışını büyük bir heyecanla izleyen sanatseverler" (Özne). Nerede anlattı?: "salonun çıkışında" (Dolaylı tümleç). Neyi anlattı?: "duygularını" (Belirtili nesne). Kime anlattı?: "gazetecilere" (Dolaylı tümleç). Nasıl anlattı?: "uzun uzun" (Zarf tümleci).',
  'Özne öbeğinin içinde "açılışını" (belirtili nesne gibi görünen kısım) ve "büyük bir heyecanla" (zarf tümleci gibi görünen kısım) yer aldığı için aday özneyi bölme hatasına düşebilir. Fiilimsiyle kurulu tamlama bütünüyle özne olduğundan parçalanamaz.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlenin Ögeleri ve Cümle Türleri',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerin hangisinde ara söz, belirtili nesnenin açıklayıcısı olarak kullanılmıştır?',
  '{"options":["Çocukluğumun geçtiği o küçük sahil kasabasını, yani Ayvalık''ı, yıllar sonra yeniden gördüm.","En yakın arkadaşım, liseden beri görüştüğüm Deniz, gelecek ay İzmir''e taşınıyor.","Tatilin büyük bölümünü memleketimizde, dedemin taş evinde, huzur içinde geçirdik.","Geçen hafta, havanın birdenbire soğuduğu o salı günü, bütün planlarımızı erteledik.","Bu konuyu, sen de iyi bilirsin ya, kimseyle açıkça konuşmak istemezdi."],"correctIndex":0}'::jsonb,
  '"O küçük sahil kasabasını, yani Ayvalık''ı" bölümünde "neyi gördüm?" sorusuna yanıt veren belirtili nesne, kendisi de belirtme hâl eki (-ı) alan "yani Ayvalık''ı" ara sözüyle açıklanmıştır. Diğer cümlelerde ara sözler sırasıyla öznenin, dolaylı tümlecin, zarf tümlecinin açıklayıcısı ve cümle dışı unsur (ara cümle) görevindedir.',
  '"Memleketimizde, dedemin taş evinde" ara sözü de yer bildirdiği için nesne açıklayıcısı sanılabilir; ancak bulunma hâl eki (-de) aldığı için dolaylı tümleci açıklamaktadır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlenin Ögeleri ve Cümle Türleri',
  'multiple_choice',
  3,
  'Aşağıdaki cümlelerin hangisi yapısına göre bağlı, yükleminin türüne göre isim cümlesidir?',
  '{"options":["Salon oldukça genişti ancak içerideki aydınlatma yetersizdi.","Yağmur dinince dışarı çıktık, sahil boyunca uzun süre yürüdük.","Sabahki toplantı oldukça verimli geçti çünkü herkes hazırlıklı gelmişti.","Kentin eski sokakları dar olmasına karşın oldukça sessizdi.","Güneş batmış, gökyüzü kızıla boyanmış, şehir uykuya hazırlanıyordu."],"correctIndex":0}'::jsonb,
  '"Salon oldukça genişti ancak içerideki aydınlatma yetersizdi." cümlesi iki yargıyı ("genişti" ve "yetersizdi") "ancak" bağlacıyla bağladığı için yapısına göre bağlı cümledir; ayrıca her iki yüklemi de ad soylu sözcüklere ek-fiil getirilerek kurulduğu için yükleminin türüne göre isim cümlesidir.',
  '"Kentin eski sokakları dar olmasına karşın oldukça sessizdi." cümlesi de isim cümlesidir ama bağlaçla iki yüklemi bağlamaz; içinde "-ma" isim-fiili barındırdığı için yapısına göre girişik birleşik cümledir.',
  array['lisans_gygk']::text[],
  'lisans'
);
