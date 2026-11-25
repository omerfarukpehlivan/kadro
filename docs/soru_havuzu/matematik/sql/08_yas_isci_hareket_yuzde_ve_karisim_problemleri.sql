-- ==========================================================================
-- KADRO SORU HAVUZU · Matematik & Geometri · Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri (70 soru)
-- Kaynak: docs/soru_havuzu/matematik/08_yas_isci_hareket_yuzde_ve_karisim_problemleri.md · Üretici: tools/math/compile_questions.mjs (elle düzenlemeyin)
-- Önkoşul: docs/supabase_migrations/12_math_figures.sql
-- İdempotent: soru kimlikleri sabit UUID'dir; dosya tekrar çalıştırılırsa sorular güncellenir.
-- ==========================================================================

insert into public.questions (
  id, lesson, topic, question_type, difficulty, prompt_text, interaction_data,
  explanation, distractor_trap, exam_scopes, education_level, figure_svg, is_active
) values
  -- mat-08-001 · doğrulandı
  ('7de54470-ff5e-522c-961c-7f4e34139e32'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 1,
   'Bir annenin bugünkü yaşı, iki çocuğunun yaşları toplamının $3$ katından $4$ fazladır. $6$ yıl sonra annenin yaşı, iki çocuğunun yaşları toplamının $2$ katına eşit olacaktır.
Buna göre anne bugün kaç yaşındadır?',
   '{"options":["42","46","48","52","58"],"correctIndex":1}'::jsonb,
   'İki çocuğun bugünkü yaşları toplamına $t$ denirse annenin bugünkü yaşı $3t + 4$ olur. $6$ yıl sonra anne $6$ yaş büyürken ($3t + 10$), iki çocuğun her biri $6$''şar yıl büyüyeceği için yaşları toplamı $12$ artar ($t + 12$). Verilen eşitlik kurulur: $3t + 10 = 2(t + 12) \Rightarrow 3t + 10 = 2t + 24 \Rightarrow t = 14$. Annenin bugünkü yaşı $3 \cdot 14 + 4 = 46$''dır.',
   'D şıkkı (52), $t = 14$ bulduktan sonra annenin bugünkü yaşı yerine $6$ yıl sonraki yaşını ($46 + 6 = 52$) işaretleyen adayı yakalar. Ayrıca çocukların yaşları toplamına $12$ yerine yalnızca $6$ eklemek de sık yapılan bir hatadır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-002 · doğrulandı
  ('d753f145-cfc7-5f31-a9b1-196b699809fb'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 2,
   'Bir babanın bugünkü yaşı, oğlunun bugünkü yaşının $4$ katıdır. Oğlu babasının bugünkü yaşına geldiğinde ikisinin yaşları toplamı $99$ olacaktır.
Buna göre baba ile oğlunun bugünkü yaşları farkı kaçtır?',
   '{"options":["9","18","24","27","36"],"correctIndex":3}'::jsonb,
   'Oğlunun bugünkü yaşı $x$, babanın bugünkü yaşı $4x$ olsun. Oğlunun $4x$ yaşına gelmesi için $4x - x = 3x$ yıl geçmelidir. Bu sürede baba da $3x$ yıl yaşlanarak $4x + 3x = 7x$ yaşına gelir. Gelecekteki yaşlar toplamı $4x + 7x = 11x = 99$ olduğundan $x = 9$ bulunur. Baba ile oğlunun yaşları farkı zamanla değişmez ve $4x - x = 3x = 27$ olur.',
   'E şıkkı (36), $x = 9$ bulduktan sonra yaş farkı ($3x$) yerine babanın bugünkü yaşını ($4x = 36$) seçen adayı yakalar. A şıkkı (9) ise yalnızca oğlunun yaşını bulanların işaretlediği şıktır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-003 · doğrulandı
  ('045514d0-9652-5616-ba7f-1ef41a0805df'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 2,
   'Bir işi Ali tek başına $12$ günde, Burak ise tek başına $18$ günde bitirebilmektedir. İkisi birlikte $4$ gün çalıştıktan sonra Ali işi bırakıyor.
Buna göre kalan işi Burak tek başına kaç günde bitirir?',
   '{"options":["8","9","10","12","14"],"correctIndex":0}'::jsonb,
   'Ali bir günde işin $\dfrac{1}{12}$''sini, Burak $\dfrac{1}{18}$''ini yapar. İkisinin birlikte $4$ günde bitirdiği kısım $4\left(\dfrac{1}{12} + \dfrac{1}{18}\right) = 4 \cdot \dfrac{5}{36} = \dfrac{5}{9}$''dur. Geriye işin $1 - \dfrac{5}{9} = \dfrac{4}{9}$''u kalır. Burak günde $\dfrac{1}{18}$ iş yaptığından kalan kısmı $\dfrac{4/9}{1/18} = 8$ günde tamamlar.',
   'D şıkkı (12), kalan iş için gereken $8$ günü bulduktan sonra birlikte çalışılan $4$ günü ekleyip tüm işin süresini ($4 + 8 = 12$) işaretleyen adayı yakalar. Soru toplam süreyi değil, kalan işin süresini sormaktadır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-004 · doğrulandı
  ('94956904-3f9d-5d34-949e-b0886c8c919b'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 3,
   'Boş bir havuzu tek başına A musluğu $12$ saatte, B musluğu $15$ saatte doldurabilmektedir. Havuzun dibindeki C musluğu ise dolu havuzu tek başına $20$ saatte boşaltmaktadır. Üç musluk birlikte açıldıktan $4$ saat sonra C musluğu kapatılıyor.
Buna göre boş havuz toplam kaç saatte dolar?',
   '{"options":["4","5","6","7","8"],"correctIndex":4}'::jsonb,
   'Üç musluk birlikte açıkken $1$ saatte havuzun $\dfrac{1}{12} + \dfrac{1}{15} - \dfrac{1}{20} = \dfrac{5 + 4 - 3}{60} = \dfrac{6}{60} = \dfrac{1}{10}$''u dolar. İlk $4$ saatte havuzun $4 \cdot \dfrac{1}{10} = \dfrac{2}{5}$''i dolar ve geriye $\dfrac{3}{5}$''lik boş kısım kalır. C musluğu kapatıldıktan sonra A ve B birlikte saatte $\dfrac{1}{12} + \dfrac{1}{15} = \dfrac{9}{60} = \dfrac{3}{20}$ doldurur. Kalan kısım $\dfrac{3/5}{3/20} = 4$ saatte dolar. Havuzun tamamı toplam $4 + 4 = 8$ saatte dolmuş olur.',
   'A şıkkı (4), C musluğu kapatıldıktan sonraki süreyi bulup baştaki $4$ saati eklemeyi unutan adayı yakalar. Boşaltan musluğun birim zamandaki katkısının eksi işaretli alınması da kritik noktadır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-005 · doğrulandı
  ('387c9e4e-6374-5bfa-9b9e-bdcbf5b94ca5'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 1,
   'Aralarında $540$ km mesafe bulunan A ve B kentlerinden saatteki sabit hızları sırasıyla $70$ km ve $80$ km olan iki araç aynı anda birbirine doğru yola çıkıyor.
Hareketlerinden kaç saat sonra aralarındaki mesafe ilk kez $90$ km olur?',
   '{"options":["2","2,5","3","3,6","4,2"],"correctIndex":2}'::jsonb,
   'Araçlar karşılaşmadan önce aralarındaki mesafe ilk kez $90$ km olduğunda birlikte $540 - 90 = 450$ km yol almış olurlar. Birbirine doğru hareket ettikleri için saatte toplam $70 + 80 = 150$ km yaklaşırlar. Süre $\dfrac{450}{150} = 3$ saat bulunur.',
   'E şıkkı (4,2), araçların karşılaşıp birbirini geçtikten sonraki $90$ km uzaklaştıkları anı ($540 + 90 = 630$ km) hesaplayan adayı yakalar. Soruda "ilk kez" ifadesi karşılaşma öncesini belirtir.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-006 · doğrulandı
  ('35a6a144-f7ae-52ba-915d-e874188c4bf8'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 2,
   'Bir otomobil A kentinden B kentine saatte $60$ km sabit hızla gidip, hiç beklemeden aynı yoldan saatte $90$ km sabit hızla geri dönmüştür.
Bu otomobilin gidiş-dönüş yolculuğundaki ortalama hızı saatte kaç km''dir?',
   '{"options":["68","70","75","72","78"],"correctIndex":3}'::jsonb,
   'İki kent arası uzaklık $d$ km olsun (örneğin $d = 180$ km seçilebilir). Gidiş süresi $\dfrac{d}{60}$, dönüş süresi $\dfrac{d}{90}$ olur. Ortalama hız, toplam yolun toplam zamana bölünmesiyle bulunur: $\dfrac{2d}{\frac{d}{60} + \frac{d}{90}} = \dfrac{2 \cdot 60 \cdot 90}{60 + 90} = \dfrac{10.800}{150} = 72$ km/sa olur.',
   'C şıkkı (75), gidiş ve dönüş hızlarının aritmetik ortalamasını ($\dfrac{60 + 90}{2} = 75$) alan adayı yakalar. Eşit mesafeler farklı hızlarla alındığında süreler farklı olduğu için ortalama hız aritmetik değil harmonik ortalamayla bulunur.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-007 · doğrulandı
  ('1ea2e763-f6f8-5008-8de0-2ccadc2d9db2'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 2,
   'Saatteki sabit hızı $60$ km olan bir kamyon A noktasından hareket ettikten $2$ saat sonra, aynı noktadan aynı yöne doğru saatteki sabit hızı $84$ km olan bir otomobil yola çıkıyor.
Otomobil hareketinden kaç saat sonra kamyona yetişir?',
   '{"options":["4","5","6","7","8"],"correctIndex":1}'::jsonb,
   'Otomobil yola çıktığı anda kamyon $60 \cdot 2 = 120$ km öndedir. Aynı yönde hareket ettikleri için otomobil kamyona her saat $84 - 60 = 24$ km yaklaşır. Yetişme süresi $\dfrac{120}{24} = 5$ saat olarak bulunur.',
   'D şıkkı (7), otomobilin yetiştiği saati değil kamyonun toplam hareket süresini ($2 + 5 = 7$) işaretleyen adayı yakalar. Soru otomobilin hareketinden sonraki süreyi sormaktadır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-008 · doğrulandı
  ('d65ee005-d74c-5265-abbd-db186fbf4ab7'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 1,
   'Etiket fiyatı $800$ TL olan bir cekete önce $\%20$ zam yapılıyor, ardından zamlı fiyat üzerinden $\%25$ indirim uygulanıyor.
Buna göre ceketin son satış fiyatı kaç TL''dir?',
   '{"options":["720","750","760","780","800"],"correctIndex":0}'::jsonb,
   '$800$ TL''ye $\%20$ zam yapıldığında zamlı fiyat $800 \cdot \dfrac{120}{100} = 960$ TL olur. Bu zamlı fiyat üzerinden $\%25$ indirim uygulandığında satış fiyatı $960 \cdot \dfrac{75}{100} = 720$ TL bulunur.',
   'C şıkkı (760), $+\%20$ ve $-\%25$ oranlarını doğrudan toplayarak başlangıç fiyatına net $\%5$ indirim ($800 - 40 = 760$) uygulayan adayı yakalar. İkinci yüzde işlemi ilk fiyat üzerinden değil, zamlı fiyat olan $960$ TL üzerinden yapılır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-009 · doğrulandı
  ('148818c1-d2e7-593c-bfca-5494c12e0c35'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 2,
   'Bir tüccar elindeki ürünlerin $\%40$''ını $\%25$ kârla, kalan ürünlerini ise $\%10$ zararla satıyor.
Buna göre tüccarın bu satışın tamamından elde ettiği kâr oranı yüzde kaçtır?',
   '{"options":["%1","%2","%3","%3,5","%4"],"correctIndex":4}'::jsonb,
   'Toplam $100$ birim ürün ve her birinin maliyeti $1$ TL kabul edilirse toplam maliyet $100$ TL olur. İlk $40$ ürün $\%25$ kârla $40 \cdot 1{,}25 = 50$ TL''ye, kalan $60$ ürün ise $\%10$ zararla $60 \cdot 0{,}90 = 54$ TL''ye satılır. Toplam gelir $50 + 54 = 104$ TL olduğundan $4$ TL kâr edilir; toplam kâr oranı $\%4$''tür.',
   'B şıkkı (%2), ürün miktarlarının ağırlığını dikkate almadan $25$ ve $-10$ oranlarını sadeleştiren ya da iki oranı yarımşar ağırlıkla hesaplayan adayı yakalar. Oranlar doğrudan değil, kendi satış paylarıyla çarpılarak toplanmalıdır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-010 · doğrulandı
  ('8036202d-ad0a-5d7d-8f18-0dc3c72400c4'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 2,
   'Yıllık $\%18$ basit faiz oranıyla bankaya yatırılan bir miktar anapara, $8$ ay sonunda faiziyle birlikte toplam $5.600$ TL olarak çekiliyor.
Buna göre bankaya yatırılan anapara kaç TL''dir?',
   '{"options":["4.500","4.800","5.000","5.200","5.400"],"correctIndex":2}'::jsonb,
   'Anapara $A$ TL olsun. Yıllık $\%18$ basit faizle $8$ aylık ($8/12 = 2/3$ yıl) faiz getirisi $A \cdot \dfrac{18}{100} \cdot \dfrac{8}{12} = 0{,}12A$ olur. Anapara ve faiz toplamı $A + 0{,}12A = 1{,}12A = 5.600$ TL olduğundan $A = \dfrac{5.600}{1{,}12} = 5.000$ TL bulunur.',
   'B şıkkı (4.800), verilen $5.600$ TL''yi $1{,}12$''ye bölmek yerine $5.600$''den doğrudan faiz yüzdesi kadar çıkarma veya yıllık $18$ oranını ay dönüşümü yapmadan yanlış kullanma hatasına düşen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-011 · doğrulandı
  ('3b7a47ba-ab77-5018-8949-50831b5f19dc'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 1,
   'Tuz oranı $\%20$ olan $300$ gram tuzlu su ile tuz oranı $\%50$ olan $200$ gram tuzlu su karıştırılıyor.
Oluşan yeni karışımın tuz oranı yüzde kaçtır?',
   '{"options":["%28","%30","%31","%32","%35"],"correctIndex":3}'::jsonb,
   'İlk karışımdaki tuz miktarı $300 \cdot \dfrac{20}{100} = 60$ gram, ikinci karışımdaki tuz miktarı $200 \cdot \dfrac{50}{100} = 100$ gramdır. Toplam tuz $60 + 100 = 160$ gram, toplam karışım ise $300 + 200 = 500$ gram olur. Yeni tuz oranı $\dfrac{160}{500} = \dfrac{32}{100}$, yani $\%32$''dir.',
   'E şıkkı (%35), karışımların kütleleri farklı olmasına rağmen yüzdelerin aritmetik ortalamasını ($\dfrac{20 + 50}{2} = 35$) alan adayı yakalar. Kütleler eşit olsaydı oran $\%35$ çıkardı; burada $\%20$''lik karışımdan daha fazla olduğu için sonuç $\%35$''in altında kalır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-012 · doğrulandı
  ('e4bf5356-58ff-575a-a6d0-f3cb4152b564'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 3,
   'Şeker oranı $\%30$ olan $240$ gram şekerli su karışımından kaç gram su buharlaştırılırsa karışımın şeker oranı $\%40$ olur?',
   '{"options":["48","60","72","80","180"],"correctIndex":1}'::jsonb,
   'Su buharlaştırılırken karışımdaki şeker miktarı değişmez. Başlangıçtaki şeker miktarı $240 \cdot \dfrac{30}{100} = 72$ gramdır. Yeni karışımda bu $72$ gram şeker tüm karışımın $\%40$''ını oluşturmalıdır: $\text{Yeni kütle} \cdot \dfrac{40}{100} = 72 \Rightarrow \text{Yeni kütle} = 180$ gram bulunur. Başlangıçtaki $240$ gramdan $180$ grama düşülmesi için $240 - 180 = 60$ gram su buharlaştırılmalıdır.',
   'E şıkkı (180), buharlaşma sonrası kalan yeni karışım ağırlığını ($180$ gram) bulup buharlaşan su miktarı diye işaretleyen adayı yakalar. Soru kalan kütleyi değil, eksilen su miktarını sormaktadır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-013 · doğrulandı
  ('a4ef733b-afae-5552-bd4f-1fc5e6b6e398'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 1,
   '$5$ arkadaşın bugünkü yaşlarının aritmetik ortalaması $25$''tir.
Bu gruptan yaşları toplamı $41$ olan iki kişi ayrılırsa kalan $3$ kişinin yaş ortalaması kaç olur?',
   '{"options":["24","26","28","29","30"],"correctIndex":2}'::jsonb,
   '$5$ kişinin yaşları toplamı $5 \cdot 25 = 125$''tir. Yaşları toplamı $41$ olan iki kişi ayrıldığında kalan $3$ kişinin yaşları toplamı $125 - 41 = 84$ olur. Kalan $3$ kişinin yaş ortalaması $\dfrac{84}{3} = 28$ bulunur.',
   'A şıkkı (24), ayrılan iki kişinin yaşları toplamını $5$''ten çıkarmak yerine $25$''ten ortalama eksiltmeye çalışan veya kalan kişi sayısına ($3$) bölmeyi unutup hatalı sadeleştirme yapan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-014 · doğrulandı
  ('5621a937-d1c5-5568-b314-7143e7f27d2c'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 2,
   'Ayşe ile Burcu''nun bugünkü yaşları oranı $\dfrac{3}{5}$''tir. $8$ yıl sonra yaşları oranı $\dfrac{5}{7}$ olacağına göre Ayşe bugün kaç yaşındadır?',
   '{"options":["12","15","16","20","24"],"correctIndex":0}'::jsonb,
   'Ayşe''nin bugünkü yaşı $3k$, Burcu''nun bugünkü yaşı $5k$ olsun. $8$ yıl sonra ikisinin yaşları $3k + 8$ ve $5k + 8$ olur. Oran yazılırsa $\dfrac{3k + 8}{5k + 8} = \dfrac{5}{7} \Rightarrow 7(3k + 8) = 5(5k + 8) \Rightarrow 21k + 56 = 25k + 40 \Rightarrow 4k = 16 \Rightarrow k = 4$ bulunur. Ayşe''nin bugünkü yaşı $3 \cdot 4 = 12$''dir.',
   'D şıkkı (20), Ayşe''nin bugünkü yaşı ($12$) yerine Burcu''nun bugünkü yaşını ($5 \cdot 4 = 20$) ya da Ayşe''nin $8$ yıl sonraki yaşını ($12 + 8 = 20$) işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-015 · doğrulandı
  ('03ab8d98-1204-5d0d-9cd4-4667690acf7c'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 3,
   'İki kardeşten büyüğü, küçüğünün bugünkü yaşındayken küçüğünün doğmasına $4$ yıl vardı.
Bugün iki kardeşin yaşları toplamı $31$ olduğuna göre büyük kardeş bugün kaç yaşındadır?',
   '{"options":["16","18","19","20","22"],"correctIndex":4}'::jsonb,
   'Küçük kardeşin bugünkü yaşı $y$, büyük kardeşin bugünkü yaşı $x$ olsun ($x > y$). Büyüğün $y$ yaşında olduğu dönem bugünden $(x - y)$ yıl öncesidir. O dönemde küçüğün doğmasına $4$ yıl olması, $y - (x - y) = -4 \Rightarrow 2y - x = -4 \Rightarrow x - 2y = 4$ demektir. İkinci denklem $x + y = 31$ olduğundan iki denklem çıkarılırsa $3y = 27 \Rightarrow y = 9$ bulunur. Büyük kardeşin yaşı $x = 31 - 9 = 22$''dir.',
   'B şıkkı (18) veya D şıkkı (20), doğmaya $4$ yıl kalmasını $-4$ yerine $+4$ olarak alıp $x - 2y = -4$ denklemini kuran ya da iki kardeş arasındaki yaş farkını yanlış kuran adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-016 · doğrulandı
  ('4728314c-b3a7-59bc-a52f-95aaffb825e1'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 1,
   'Bir işte A işçisinin çalışma hızı, B işçisinin çalışma hızının $3$ katıdır.
İkisi birlikte bu işi $6$ günde bitirebildiğine göre B işçisi tek başına bu işin yarısını kaç günde bitirir?',
   '{"options":["6","8","10","12","24"],"correctIndex":3}'::jsonb,
   'B işçisinin günlük iş hızına $v$ denirse A işçisinin günlük hızı $3v$ olur. İkisi birlikte günde $v + 3v = 4v$ hızla çalışarak $6$ günde işi bitirdiğinden toplam iş $6 \cdot 4v = 24v$ olur. B işçisi tek başına tüm işi $\dfrac{24v}{v} = 24$ günde, işin yarısını ise $\dfrac{24}{2} = 12$ günde bitirir.',
   'E şıkkı (24), B işçisinin tüm işi bitirme süresini ($24$ gün) bulduktan sonra sorunun işin yarısını sorduğunu gözden kaçıran adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-017 · doğrulandı
  ('25776297-31e0-59e3-a9bc-297846084354'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 2,
   'Bir usta bir işi tek başına $12$ günde, bir çırak ise aynı işi tek başına $24$ günde bitirebilmektedir.
Usta çalışma hızını $\%25$ azaltır, çırak ise çalışma hızını $\%50$ artırırsa ikisi birlikte bu işi kaç günde bitirir?',
   '{"options":["6","8","9","10","12"],"correctIndex":1}'::jsonb,
   'Usta başlangıçta günde $\dfrac{1}{12}$ iş yaparken hızını $\%25$ azaltırsa yeni hızı $\dfrac{1}{12} \cdot \dfrac{75}{100} = \dfrac{1}{12} \cdot \dfrac{3}{4} = \dfrac{1}{16}$ olur. Çırak başlangıçta günde $\dfrac{1}{24}$ iş yaparken hızını $\%50$ artırırsa yeni hızı $\dfrac{1}{24} \cdot \dfrac{150}{100} = \dfrac{1}{24} \cdot \dfrac{3}{2} = \dfrac{1}{16}$ olur. İkisinin yeni günlük hızları toplamı $\dfrac{1}{16} + \dfrac{1}{16} = \dfrac{1}{8}$ olduğundan işi birlikte $8$ günde bitirirler.',
   'C şıkkı (9), çalışma hızının $\%25$ azalmasını sürenin $\%25$ azalması ($12 \cdot 0{,}75 = 9$ gün) gibi ters yorumlayan adayı yakalar. Hız azaldıkça işi bitirme süresi artar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-018 · doğrulandı
  ('e045352a-7618-5ba9-a3cc-0b4dddf0b4f7'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 2,
   'Saatteki sabit hızı $72$ km olan $160$ metre uzunluğundaki bir tren, $240$ metre uzunluğundaki bir tüneli tamamen kaç saniyede geçer?',
   '{"options":["12","16","20","24","30"],"correctIndex":2}'::jsonb,
   'Önce trenin hızı metre/saniye birimine çevrilir: $72 \text{ km/sa} = \dfrac{72 \cdot 1.000}{3.600} = 20$ m/sn. Trenin tüneli tamamen geçmesi için kendi boyu ile tünel boyunun toplamı kadar yol alması gerekir: $160 + 240 = 400$ metre. Geçiş süresi $\dfrac{400}{20} = 20$ saniye bulunur.',
   'A şıkkı (12), trenin kendi boyunu toplama eklemeyi unutup yalnızca tünel uzunluğunu ($\dfrac{240}{20} = 12$ sn) bölen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-019 · doğrulandı
  ('35d66da1-a86e-5bbb-a3f7-ec1bb12462a2'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 2,
   'Çevresi $720$ metre olan dairesel bir pistin aynı noktasından aynı anda ve aynı yöne doğru dakikadaki sabit hızları $55$ metre ve $35$ metre olan iki koşucu harekete başlıyor.
Buna göre koşucular harekete başladıktan kaç dakika sonra ikinci kez yan yana gelirler?',
   '{"options":["16","18","36","72","90"],"correctIndex":3}'::jsonb,
   'Aynı yöne koşan iki sporcunun birbirine göre bağıl hızı $55 - 35 = 20$ m/dk''dır. Hızlı olanın yavaş olana $1$ tur fark atarak ilk kez yan yana gelme süresi $\dfrac{720}{20} = 36$ dakikadır. İkinci kez yan yana gelmeleri için $2$ tur fark atması gerekir: $2 \cdot 36 = 72$ dakika bulunur.',
   'C şıkkı (36), ilk kez yan yana gelme süresini ($36$ dakika) bulup sorudaki "ikinci kez" ifadesini gözden kaçıran adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-020 · doğrulandı
  ('d401049c-f459-5d69-a292-7ca9764f606e'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 3,
   'Akıntı hızının sabit olduğu bir nehirde durgun sudaki hızı saatte $25$ km olan bir tekne, akıntı yönünde $4$ saatte aldığı yolu akıntıya karşı $6$ saatte geri dönmektedir.
Buna göre nehrin akıntı hızı saatte kaç km''dir?',
   '{"options":["5","4","6","8","10"],"correctIndex":0}'::jsonb,
   'Akıntı hızına $v$ km/sa denirse tekne akıntıyla birlikte $25 + v$, akıntıya karşı $25 - v$ hızla gider. Gidiş ve dönüş mesafeleri eşit olduğundan $4(25 + v) = 6(25 - v) \Rightarrow 100 + 4v = 150 - 6v \Rightarrow 10v = 50 \Rightarrow v = 5$ km/sa bulunur.',
   'E şıkkı (10), $4v$ ile $6v$''yi toplamak yerine çıkarıp $2v = 50$ veya hız farkını alıp $2$ katını işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-021 · doğrulandı
  ('70066d8c-2b40-5cc6-97d6-156b4166c787'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 1,
   'Bir sayının $\%40$''ı ile $\%15$''inin farkı $75$''tir.
Buna göre bu sayının $\%20$''si kaçtır?',
   '{"options":["45","60","75","90","300"],"correctIndex":1}'::jsonb,
   'Sayıya $x$ denirse $\%40$ ile $\%15$''in farkı sayının $\%25$''idir. $\dfrac{25}{100}x = 75 \Rightarrow \dfrac{x}{4} = 75 \Rightarrow x = 300$ bulunur. Bu sayının $\%20$''si $300 \cdot \dfrac{20}{100} = 60$ olur.',
   'E şıkkı (300), sayının kendisini ($x = 300$) bulup $\%20$''sini hesaplamayı unutan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-022 · doğrulandı
  ('7adcfe9d-f904-58d0-8f28-dcb6e535f312'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 2,
   'Bir mağaza maliyet fiyatı üzerinden $\%50$ kârla etiketlediği bir ürüne, etiket fiyatı üzerinden $\%20$ indirim uyguluyor.
Buna göre mağazanın bu satıştan elde ettiği net kâr oranı yüzde kaçtır?',
   '{"options":["%10","%15","%18","%20","%30"],"correctIndex":3}'::jsonb,
   'Ürünün maliyeti $100$ TL olsun. $\%50$ kârla etiket fiyatı $150$ TL olarak belirlenir. Etiket fiyatı üzerinden $\%20$ indirim yapıldığında satış fiyatı $150 \cdot \dfrac{80}{100} = 120$ TL olur. $100$ TL maliyet üzerinden $120$ TL''ye satıldığı için net kâr $\%20$''dir.',
   'E şıkkı (%30), $+\%50$ kâr ve $-\%20$ indirimi aynı taban üzerinden düşünüp doğrudan $50 - 20 = 30$ çıkaran adayı yakalar. İndirim maliyet üzerinden değil, zamlı etiket fiyatı üzerinden yapılır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-023 · doğrulandı
  ('4208d180-a423-5783-bdd0-4998a6111718'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 2,
   'Kilogramı $24$ TL''den $50$ kg yaş üzüm alan bir tüccar, üzümleri kuruttuğunda ağırlığının $\%20$''sinin kaybolduğunu görüyor.
Tüccarın bu satıştan $\%20$ kâr elde edebilmesi için kuru üzümün kilogramını kaç TL''den satması gerekir?',
   '{"options":["30","33,6","36","38,4","40"],"correctIndex":2}'::jsonb,
   'Toplam maliyet $50 \cdot 24 = 1.200$ TL''dir. $\%20$ kâr elde etmek için toplam satış geliri $1.200 \cdot 1{,}20 = 1.440$ TL olmalıdır. Üzüm $\%20$ fire verdiğinde elde kalan kuru üzüm miktarı $50 \cdot 0{,}80 = 40$ kg''dır. Kilogram satış fiyatı $\dfrac{1.440}{40} = 36$ TL bulunur.',
   'B şıkkı (33,6), fire ve kâr oranlarını doğrudan $24$ TL''ye toplayarak ekleyen ($24 \cdot 1{,}40 = 33{,}6$) adayı yakalar. Fire kütleyi böldüğü için birim fiyat $\frac{1{,}20}{0{,}80} = 1{,}5$ katına çıkar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-024 · doğrulandı
  ('40a2ce7c-4817-5986-9d9b-208fdfe55649'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 1,
   '$4.000$ TL, yıllık $\%15$ basit faiz oranıyla bir bankaya yatırılıyor.
Kaç ay sonra bu anaparanın getirdiği faiz tutarı $400$ TL olur?',
   '{"options":["4","5","6","7","8"],"correctIndex":4}'::jsonb,
   'Süre $t$ ay olsun. Basit faiz formülü uygulanır: $400 = 4.000 \cdot \dfrac{15}{100} \cdot \dfrac{t}{12}$. Buradan $400 = 600 \cdot \dfrac{t}{12} = 50t \Rightarrow t = \dfrac{400}{50} = 8$ ay bulunur.',
   'C şıkkı (6), $4.000$''in $\%15$''ini $600$ bulduktan sonra aylık faizi $600 \div 12 = 50$ yerine yanlış bölerek veya yılı $10$ ay gibi düşünerek hesap yapan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-025 · doğrulandı
  ('a9c8bc45-ec91-5480-a85b-066f6b1175ae'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 2,
   'Alkol oranı $\%24$ olan $250$ mL kolonyaya $40$ mL saf alkol ve $110$ mL saf su ekleniyor.
Oluşan yeni karışımın alkol oranı yüzde kaçtır?',
   '{"options":["%25","%26","%28","%30","%34"],"correctIndex":0}'::jsonb,
   'Başlangıçtaki alkol miktarı $250 \cdot \dfrac{24}{100} = 60$ mL''dir. Eklenen $40$ mL saf alkol ile birlikte yeni karışımdaki toplam alkol $60 + 40 = 100$ mL olur (saf su alkol miktarını artırmaz). Toplam karışım hacmi $250 + 40 + 110 = 400$ mL''dir. Yeni alkol oranı $\dfrac{100}{400} \cdot 100 = \%25$ bulunur.',
   'C şıkkı (%28) veya E şıkkı (%34), eklenen $110$ mL saf suyu toplam karışım hacmine katmayı unutan veya saf alkolün oranını $\%100$ yerine başka değer alan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-026 · doğrulandı
  ('3ab85911-0d37-5575-9292-c8cc564fe820'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 3,
   'A kabında tuz oranı $\%30$ olan $200$ gram tuzlu su, B kabında ise tuz oranı $\%60$ olan $150$ gram tuzlu su bulunmaktadır. Önce A kabındaki karışımın yarısı B kabına dökülüp karıştırılıyor; ardından B kabında oluşan yeni karışımın $\dfrac{1}{5}$''i tekrar A kabına dökülüyor.
Son durumda A kabındaki karışımın tuz oranı yüzde kaçtır?',
   '{"options":["%34","%36","%39","%42","%48"],"correctIndex":1}'::jsonb,
   'Başlangıçta A''da $200$ g karışımda $60$ g tuz, B''de $150$ g karışımda $90$ g tuz vardır.
1. adım: A''nın yarısı ($100$ g karışım, $30$ g tuz) B''ye dökülür. A''da $100$ g karışım ($30$ g tuz) kalır. B''deki toplam karışım $150 + 100 = 250$ g, tuz ise $90 + 30 = 120$ g olur.
2. adım: B''deki karışımın $\dfrac{1}{5}$''i ($\dfrac{250}{5} = 50$ g karışım, $\dfrac{120}{5} = 24$ g tuz) A''ya dökülür.
Son durumda A''da $100 + 50 = 150$ g karışım ve $30 + 24 = 54$ g tuz bulunur. A''nın son tuz oranı $\dfrac{54}{150} \cdot 100 = 36$ yani $\%36$''dır.',
   'E şıkkı (%48), ilk aktarım sonrasında B kabında oluşan karışımın tuz oranını ($\dfrac{120}{250} = \%48$) bulup ikinci aktarımı yapmadan işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-027 · doğrulandı
  ('c6ee27bc-69f1-5c7f-bdc2-e5f6fd082828'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 1,
   'Bir babanın bugünkü yaşı, kızının bugünkü yaşının $3$ katından $5$ fazladır. $4$ yıl önce ikisinin yaşları toplamı $45$ olduğuna göre baba bugün kaç yaşındadır?',
   '{"options":["12","36","37","41","45"],"correctIndex":3}'::jsonb,
   '$4$ yıl önce ikisinin yaşları toplamı $45$ ise bugün ikisi de $4$''er yıl büyüdüğü için yaşları toplamı $45 + 8 = 53$''tür. Kızının bugünkü yaşına $x$ denirse babanın yaşı $3x + 5$ olur. Toplam $x + (3x + 5) = 53 \Rightarrow 4x = 48 \Rightarrow x = 12$ bulunur. Babanın bugünkü yaşı $3 \cdot 12 + 5 = 41$''dir.',
   'C şıkkı (37), $4$ yıl önceki $45$ toplamından bugüne geçerken $2$ kişi için $+8$ eklemek yerine $+4$ ekleyip $49$ üzerinden giden veya babanın $4$ yıl önceki yaşını işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-028 · doğrulandı
  ('ddb78cb1-e703-5c56-bd9a-d00eeaadb9da'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 2,
   '$4$ kişilik bir ailenin $3$ yıl önceki yaş ortalaması $22$''dir.
Bu aileye bugün yeni doğan bir bebek katılırsa ailenin bugünkü yaş ortalaması kaç olur?',
   '{"options":["20","17,6","22","24","25"],"correctIndex":0}'::jsonb,
   '$4$ kişinin $3$ yıl önceki yaş ortalaması $22$ olduğundan bugünkü yaş ortalamaları $22 + 3 = 25$''tir ve bugünkü yaşları toplamı $4 \cdot 25 = 100$ olur. Bugün doğan bebeğin yaşı $0$ olduğu için $5$ kişinin bugünkü yaşları toplamı yine $100$''dür. Yeni ortalama $\dfrac{100}{5} = 20$ bulunur.',
   'E şıkkı (25), bebeğin yaşının $0$ olmasına rağmen ortalama hesabında kişi sayısını $4$''ten $5$''e çıkarmayı unutan; B şıkkı (17,6) ise $3$ yıl önceki toplama ($88$) $3$ yıl eklemeden $5$''e bölen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-029 · doğrulandı
  ('e30cb864-2215-591e-b0d3-3eea0d37f56f'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 2,
   'Bir işi Can tek başına $10$ günde, Deniz ise tek başına $20$ günde bitirebilmektedir.
İşe Can başlamak üzere her gün yalnızca bir kişi birer gün sırayla çalışırsa bu iş toplam kaç günde biter?',
   '{"options":["10","11","12","14","13"],"correctIndex":4}'::jsonb,
   '$2$ günlük tam bir turda (1 gün Can, 1 gün Deniz) yapılan iş $\dfrac{1}{10} + \dfrac{1}{20} = \dfrac{3}{20}$''dir. $6$ tur ($12$ gün) sonunda işin $6 \cdot \dfrac{3}{20} = \dfrac{18}{20} = \dfrac{9}{10}$''u tamamlanır. Geriye kalan $\dfrac{1}{10}$''luk kısmı $13$. gün sırası gelen Can tek günde ($\dfrac{1}{10}$) bitirir. İş toplam $12 + 1 = 13$ günde tamamlanır.',
   'D şıkkı (14), $6$ turdan sonra kalan işi hesaplamak yerine ikisinin ortalama hızını alıp yuvarlayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-030 · doğrulandı
  ('b735c45e-7761-59ec-851b-cdfc19dc823b'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 2,
   'Boş bir havuzu tek başına A musluğu $12$ saatte doldurmaktadır. Havuzun tam ortasındaki (yüksekliğinin yarısındaki) B musluğu ise kendi seviyesinin üstünde kalan yarım havuzu tek başına $12$ saatte boşaltabilmektedir.
İki musluk birlikte açılırsa boş havuz toplam kaç saatte dolar?',
   '{"options":["12","18","24","15","20"],"correctIndex":1}'::jsonb,
   'Havuzun alt yarısı dolana kadar B musluğu su seviyesinin üstünde kaldığı için devrede değildir; A musluğu tüm havuzu $12$ saatte doldurduğundan alt yarıyı $\dfrac{12}{2} = 6$ saatte doldurur. Üst yarıda A musluğu yarım havuzu $6$ saatte doldururken, B musluğu bu üst yarıyı $12$ saatte boşaltır. Üst yarıdaki net dolum hızı $\dfrac{1}{6} - \dfrac{1}{12} = \dfrac{1}{12}$ olduğundan üst yarı $12$ saatte dolar. Toplam süre $6 + 12 = 18$ saat bulunur.',
   'C şıkkı (24), B musluğunun havuzun ortasında değil dibinde olduğunu varsayıp baştan itibaren $\frac{1}{12} - \frac{1}{24} = \frac{1}{24}$ hızıyla $24$ saat bulan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-031 · doğrulandı
  ('316bdea2-9b21-59bb-972c-b6ce8686dbaa'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 1,
   'Saatte $80$ km sabit hızla giden bir otomobil A şehrinden B şehrine $6$ saatte ulaşmaktadır.
Bu otomobil aynı yolu saatte $120$ km sabit hızla gitseydi B şehrine kaç saat daha erken varırdı?',
   '{"options":["4","3","2","1,5","2,5"],"correctIndex":2}'::jsonb,
   'İki şehir arası mesafe $80 \cdot 6 = 480$ km''dir. Saatte $120$ km hızla gidildiğinde yolculuk $\dfrac{480}{120} = 4$ saat sürer. Önceki süre $6$ saat olduğundan araç $6 - 4 = 2$ saat daha erken varır.',
   'A şıkkı (4), ikinci durumdaki yolculuk süresini ($4$ saat) bulup sorunun "kaç saat daha erken varır?" sorusuna dikkat etmeden $4$''ü işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-032 · doğrulandı
  ('de741174-0ce0-5471-ae94-050b1bedf93d'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 2,
   'Aralarında $120$ km mesafe bulunan A ve B kentlerinden aynı anda ve aynı yöne doğru saatteki sabit hızları sırasıyla $95$ km ve $65$ km olan iki araç hareket ediyor.
Hızlı olan araç yavaş olan araca C noktasında yetiştiğine göre B ile C kentleri arası mesafe kaç km''dir?',
   '{"options":["180","220","240","260","380"],"correctIndex":3}'::jsonb,
   'A''daki aracın B''deki araca yetişme süresi $\dfrac{120}{95 - 65} = \dfrac{120}{30} = 4$ saattir. Bu $4$ saat boyunca B''den çıkan araç $65$ km/sa hızla ilerlediğinden $|BC| = 65 \cdot 4 = 260$ km bulunur.',
   'E şıkkı (380), $|BC|$ mesafesi yerine A''dan çıkan aracın aldığı $|AC| = 95 \cdot 4 = 380$ km mesafeyi işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-033 · doğrulandı
  ('d9ee77fb-90f8-5017-b27c-75d215e256b1'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 3,
   'Bir sürücü evinden işine saatte $60$ km sabit hızla giderse planladığı saatten $1$ saat geç, saatte $90$ km sabit hızla giderse planladığı saatten $1$ saat erken varmaktadır.
Buna göre sürücünün evi ile iş yeri arasındaki mesafe kaç km''dir?',
   '{"options":["180","360","240","300","450"],"correctIndex":1}'::jsonb,
   'İki nokta arasındaki uzaklık $d$ km, planlanan süre $t$ saat olsun. İlk durumda $\dfrac{d}{60} = t + 1$, ikinci durumda $\dfrac{d}{90} = t - 1$ yazılır. İki denklem çıkarılırsa $\dfrac{d}{60} - \dfrac{d}{90} = (t + 1) - (t - 1) = 2$ saat olur. Payda eşitlenirse $\dfrac{3d - 2d}{180} = 2 \Rightarrow \dfrac{d}{180} = 2 \Rightarrow d = 360$ km bulunur.',
   'A şıkkı (180), $1$ saat geç ile $1$ saat erken arasındaki süre farkını $2$ saat yerine $1$ saat sanıp $\dfrac{d}{180} = 1 \Rightarrow d = 180$ km bulan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-034 · doğrulandı
  ('7427fefa-56da-52de-ab10-e48a00748bd9'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 1,
   'Etiket fiyatına $\%30$ indirim yapılarak $560$ TL''ye satılan bir çantanın indirimden önceki fiyatı kaç TL''dir?',
   '{"options":["800","728","750","780","840"],"correctIndex":0}'::jsonb,
   'Etiket fiyatına $P$ TL denirse $\%30$ indirimli satış fiyatı $P \cdot \dfrac{70}{100} = 560$ TL olur. Buradan $P = \dfrac{560 \cdot 100}{70} = 800$ TL bulunur.',
   'B şıkkı (728), indirimli fiyattan etiket fiyatına dönerken $560$''a $\%30$ zam ekleyip $560 \cdot 1{,}30 = 728$ TL hesaplayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-035 · doğrulandı
  ('4374926e-3d72-5378-a840-d330a505be88'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 2,
   'Bir dikdörtgenin uzun kenarı $\%20$ artırılıp kısa kenarı $\%20$ azaltılırsa dikdörtgenin alanı yüzde kaç azalır?',
   '{"options":["%0","%2","%4","%8","%10"],"correctIndex":2}'::jsonb,
   'Başlangıçta dikdörtgenin kenarları $10$ ve $10$ birim alınırsa alanı $100$ birimkare olur. Uzun kenar $\%20$ artırıldığında $12$, kısa kenar $\%20$ azaltıldığında $8$ olur. Yeni alan $12 \cdot 8 = 96$ birimkare olduğundan alan $100 - 96 = 4$ yani $\%4$ azalır.',
   'A şıkkı (%0), bir kenarı $\%20$ artırıp diğerini $\%20$ azaltmanın birbirini sıfırlayacağını sanan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-036 · doğrulandı
  ('a574fc50-e58d-5c13-94ff-da776312dea8'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 2,
   'Bir kırtasiyeci toptancıdan $5$ tanesini $60$ TL''ye aldığı kalemlerin $4$ tanesini $60$ TL''ye satmaktadır.
Buna göre bu kırtasiyecinin kâr oranı yüzde kaçtır?',
   '{"options":["%15","%16","%20","%24","%25"],"correctIndex":4}'::jsonb,
   'Bir kalemin alış maliyeti $\dfrac{60}{5} = 12$ TL, bir kalemin satış fiyatı ise $\dfrac{60}{4} = 15$ TL''dir. Kalem başına $15 - 12 = 3$ TL kâr edilir. Kâr oranı maliyet üzerinden hesaplanır: $\dfrac{3}{12} \cdot 100 = \%25$ bulunur.',
   'C şıkkı (%20), $3$ TL kârı alış fiyatı olan $12$ TL''ye bölmek yerine satış fiyatı olan $15$ TL''ye bölerek $\dfrac{3}{15} = \%20$ bulan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-037 · doğrulandı
  ('752da1ae-9ae2-5330-8682-891842761112'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 2,
   '$10.000$ TL''nin bir kısmı yıllık $\%20$, kalan kısmı ise yıllık $\%30$ basit faiz oranıyla iki ayrı hesaba yatırılıyor.
$1$ yılın sonunda iki hesaptan toplam $2.400$ TL faiz geliri elde edildiğine göre $\%30$ faiz oranıyla yatırılan tutar kaç TL''dir?',
   '{"options":["2.000","3.000","6.000","4.000","5.000"],"correctIndex":3}'::jsonb,
   '$\%30$''luk hesaba yatırılan tutara $x$ TL denirse $\%20$''lik hesaba $10.000 - x$ TL yatırılmıştır. $1$ yıllık toplam faiz denklemi kurulur:
$(10.000 - x) \cdot \dfrac{20}{100} + x \cdot \dfrac{30}{100} = 2.400 \Rightarrow 2.000 - 0{,}2x + 0{,}3x = 2.400 \Rightarrow 0{,}1x = 400 \Rightarrow x = 4.000$ TL bulunur.',
   'C şıkkı (6.000), $x = 4.000$ TL''yi bulduktan sonra $\%20$ faize yatırılan kısım olan $10.000 - 4.000 = 6.000$ TL''yi işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-038 · doğrulandı
  ('ed17dfd5-01de-58d1-9393-42c771ac1826'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 1,
   '$180$ gram un ve $70$ gram şeker karıştırılarak bir hamur karışımı hazırlanıyor.
Buna göre oluşan bu karışımdaki şeker oranı yüzde kaçtır?',
   '{"options":["%25","%28","%30","%35","%38"],"correctIndex":1}'::jsonb,
   'Karışımın toplam kütlesi $180 + 70 = 250$ gramdır. Bu toplam kütle içindeki şeker miktarı $70$ gram olduğundan şeker oranı $\dfrac{70}{250} \cdot 100 = \dfrac{700}{25} = 28$, yani $\%28$ bulunur.',
   'E şıkkı (%38) veya D şıkkı (%35), şeker miktarını toplam $250$ gram yerine un miktarı olan $180$ grama oranlamaya çalışan ($70 / 180 \approx 0{,}388$) adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-039 · doğrulandı
  ('0cf93f54-a1ac-5e21-af03-1e314858c52f'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 3,
   'Bir satıcı iki farklı ürünü de $720$''şer TL''den satmıştır. Satıcı birinci üründen $\%20$ kâr, ikinci üründen ise $\%20$ zarar etmiştir.
Buna göre satıcının bu iki satışın tamamından elde ettiği zarar kaç TL''dir?',
   '{"options":["60","0","40","80","120"],"correctIndex":0}'::jsonb,
   'İki ürünün alış maliyetleri ayrı ayrı bulunur:
1. ürün: $1{,}2 \cdot M_1 = 720 \Rightarrow M_1 = 600$ TL.
2. ürün: $0{,}8 \cdot M_2 = 720 \Rightarrow M_2 = 900$ TL.
Toplam maliyet $600 + 900 = 1.500$ TL, toplam satış geliri ise $720 + 720 = 1.440$ TL''dir. Dolayısıyla satıcı $1.500 - 1.440 = 60$ TL zarar etmiştir.',
   'B şıkkı (0), satış fiyatları ve yüzde oranları aynı olduğu için $\%20$ kâr ile $\%20$ zararın birbirini nötrleyeceğini sanan adayı yakalar. Kâr küçük maliyetten ($600$), zarar büyük maliyetten ($900$) hesaplandığı için sonuç zarardır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-040 · doğrulandı
  ('bd068650-464c-5f08-9a49-27ac6d2f876d'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 3,
   'Tuz oranı $\%36$ olan bir miktar tuzlu su karışımının $\dfrac{1}{4}$''ü dökülüp, dökülen miktar kadar saf su ekleniyor.
Buna göre oluşan yeni karışımın tuz oranı yüzde kaç olur?',
   '{"options":["%9","%11","%18","%24","%27"],"correctIndex":4}'::jsonb,
   'Başlangıçta $100$ gram karışım ($36$ gram tuz) olduğu kabul edilir. Karışımın $\dfrac{1}{4}$''ü ($25$ gram karışım, içinde $9$ gram tuz) döküldüğünde kapta $75$ gram karışım ve $36 - 9 = 27$ gram tuz kalır. Dökülen $25$ gram yerine $25$ gram saf su (tuz oranı $\%0$) eklendiğinde toplam karışım yeniden $100$ gram olur, tuz ise $27$ gram kalır. Dolayısıyla yeni tuz oranı $\%27$ bulunur.',
   'B şıkkı (%11), $\frac{1}{4} = \%25$ oranını doğrudan yüzdelerden çıkarıp $36 - 25 = 11$ bulan adayı; A şıkkı (%9) ise kalan yerine dökülen tuz miktarını seçenleri yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-041 · doğrulandı
  ('010b6835-b6f8-593c-bd7a-39622fe48753'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 1,
   'Bugün $36$ yaşında olan bir annenin kızı $8$ yaşındadır.
Kaç yıl sonra annenin yaşı kızının yaşının $3$ katı olur?',
   '{"options":["6","7","8","9","10"],"correctIndex":0}'::jsonb,
   '$t$ yıl sonra anne $36 + t$, kızı $8 + t$ yaşında olur. Koşula göre:
$$36 + t = 3(8 + t) \Rightarrow 36 + t = 24 + 3t \Rightarrow 2t = 12 \Rightarrow t = 6$$
$6$ yıl sonra anne $42$, kızı $14$ yaşında olur ($42 = 3 \cdot 14$).',
   'C şıkkı ($8$) veya D şıkkı ($9$), denklemi kurarken yalnızca annenin yaşına $t$ ekleyip kızın da $t$ yıl büyüdüğünü unutan ($36 + t = 24$) adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-042 · doğrulandı
  ('17fa151a-9dbb-5ea5-b73c-2d887e99387d'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 2,
   'Burak, Cem ve Defne''nin bugünkü yaşları toplamı $86$''dır. Burak, Cem''in bugünkü yaşındayken Defne''nin doğmasına $6$ yıl vardı.
Cem''in bugünkü yaşı Defne''nin bugünkü yaşının $2$ katından $2$ eksik olduğuna göre Burak bugün kaç yaşındadır?',
   '{"options":["40","46","42","38","34"],"correctIndex":1}'::jsonb,
   'Defne''nin bugünkü yaşı $x$ olsun. Cem''in bugünkü yaşı $2x - 2$ olur.
Burak ($B$), Cem''in bugünkü yaşındayken aradan geçen süre $B - (2x - 2)$ yıl geriye gidilmesi demektir; o tarihte Defne''nin doğmasına $6$ yıl varsa:
$$x - [B - (2x - 2)] = -6 \Rightarrow B = 3x + 4$$
Üçünün bugünkü yaşları toplamı:
$$(3x + 4) + (2x - 2) + x = 86 \Rightarrow 6x + 2 = 86 \Rightarrow 6x = 84 \Rightarrow x = 14$$
Buna göre Burak bugün $3(14) + 4 = 46$ yaşındadır.',
   'A şıkkı ($40$), Burak''ın yaşı ile Cem''in yaşı arasındaki farkı $D$ olarak alıp doğmasına kalan $6$ yılı eklemek yerine çıkaran veya yalnızca $C + D = 26 + 14 = 40$ bulan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-043 · doğrulandı
  ('eb78bce2-18f6-5920-98ad-ca63a27734cf'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 1,
   'Ahmet bir işi tek başına $12$ günde, Mehmet ise aynı işi tek başına $24$ günde bitirebilmektedir.
İkisi birlikte çalışarak aynı işin $\dfrac{3}{4}$''ünü kaç günde bitirirler?',
   '{"options":["3","4","5","6","8"],"correctIndex":3}'::jsonb,
   'İkisinin $1$ günde birlikte bitirdikleri iş oranı $\dfrac{1}{12} + \dfrac{1}{24} = \dfrac{3}{24} = \dfrac{1}{8}$''dir; yani tamamını $8$ günde bitirirler. İşin $\dfrac{3}{4}$''ünü bitirmeleri $8 \cdot \dfrac{3}{4} = 6$ gün sürer.',
   'E şıkkı ($8$), ikisinin işin tamamını bitirme süresini ($8$ gün) bulduktan sonra $\dfrac{3}{4}$ kesrini uygulamayı unutan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-044 · doğrulandı
  ('74d7a058-af2f-5be6-aa58-5d4a66f498f3'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 2,
   'Bir atölyede bir siparişi A makinesi tek başına $12$ saatte, B makinesi ise tek başına $20$ saatte tamamlayabilmektedir. İki makine aynı anda çalıştırıldıktan $3$ saat sonra A makinesi durduruluyor; kalan işi bitirmek için B makinesinin yanına, B makinesiyle aynı kapasitede ikinci bir makine daha çalıştırılıyor.
Buna göre siparişin tamamı toplam kaç saatte tamamlanmıştır?',
   '{"options":["6","7","8","9","10"],"correctIndex":3}'::jsonb,
   'Toplam iş $60$ birim olsun ($\text{EKOK}(12, 20) = 60$). A makinesi saatte $5$ birim, B makinesi saatte $3$ birim üretir.
- İlk $3$ saatte birlikte $3 \cdot (5 + 3) = 24$ birim iş yapılır; geriye $60 - 24 = 36$ birim iş kalır.
- Kalan işi B kapasitesindeki iki makine birlikte saatte $3 + 3 = 6$ birim hızla $\dfrac{36}{6} = 6$ saatte bitirir.
Sipariş toplam $3 + 6 = 9$ saatte tamamlanır.',
   'A şıkkı ($6$), A makinesi durdurulduktan sonraki kalan süreyi ($6$ saat) toplam süre sanıp başlangıçtaki $3$ saati eklemeyi unutan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-045 · doğrulandı
  ('1689fb83-76b1-5c6c-bd08-fdf4f821053f'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 3,
   'Boş bir havuzu $A$ musluğu tek başına $12$ saatte, $B$ musluğu tek başına $18$ saatte doldurmaktadır. Havuzun dibindeki $C$ musluğu ise dolu havuzu tek başına $36$ saatte boşaltmaktadır.
Üç musluk aynı anda açıldıktan $4$ saat sonra $C$ musluğu kapatılıyor. Buna göre havuzun tamamı toplam kaç saatte dolar?',
   '{"options":["6","8","9","10","12"],"correctIndex":1}'::jsonb,
   'Üç musluk birlikte $1$ saatte havuzun $\dfrac{1}{12} + \dfrac{1}{18} - \dfrac{1}{36} = \dfrac{3 + 2 - 1}{36} = \dfrac{4}{36} = \dfrac{1}{9}$''unu doldurur. İlk $4$ saatte havuzun $4 \cdot \dfrac{1}{9} = \dfrac{4}{9}$''u dolar, geriye $1 - \dfrac{4}{9} = \dfrac{5}{9}$''u kalır.
$C$ kapatıldıktan sonra $A$ ve $B$ birlikte $1$ saatte $\dfrac{1}{12} + \dfrac{1}{18} = \dfrac{5}{36}$ doldurduğundan kalan kısım $\dfrac{5/9}{5/36} = 4$ saatte dolar. Havuz toplam $4 + 4 = 8$ saatte dolar.',
   'A şıkkı ($6$) veya B yerine B''den sonraki C ($9$), yalnızca sonradan geçen $4$ saati işaretleyen ya da başlangıçtaki $4$ saati eklemeyi unutarak eksik süre bulan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-046 · doğrulandı
  ('8f6956d4-de0b-53fc-a90d-92bfe13c0bab'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 1,
   'Saatte $90$ km sabit hızla giden bir otomobil $4$ saat $20$ dakikada kaç km yol alır?',
   '{"options":["360","375","390","405","420"],"correctIndex":2}'::jsonb,
   '$20$ dakika $\dfrac{20}{60} = \dfrac{1}{3}$ saattir. Toplam süre $4 + \dfrac{1}{3} = \dfrac{13}{3}$ saat olur. Alınan yol $90 \cdot \dfrac{13}{3} = 30 \cdot 13 = 390$ km''dir.',
   'B şıkkı ($375$) veya A şıkkı ($360$), $4$ saat $20$ dakikayı ondalık saat gibi yanlışlıkla $4{,}2$ saat alarak $90 \cdot 4{,}2 = 378$ civarı düşünen veya $20$ dakikayı ihmal eden adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-047 · doğrulandı
  ('168e3fe9-96eb-58bd-ac5d-6bb3cac3dabc'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 2,
   'Aralarında $390$ km mesafe bulunan A ve B kentleri arasındaki yolun bir kısmı asfalt, kalan kısmı ise toprak yoldur.
Asfalt yolda saatte $90$ km, toprak yolda saatte $60$ km sabit hızla giden bir araç A''dan B''ye toplam $5$ saatte ulaşmıştır.
Buna göre yolun toprak olan kısmı kaç km''dir?',
   '{"options":["90","100","120","180","270"],"correctIndex":2}'::jsonb,
   'Aracın asfalt yolda geçen süresi $t$ saat olsun; toprak yolda geçen süre $5 - t$ saat olur. Alınan toplam yol denklemi:
$$90t + 60(5 - t) = 390 \Rightarrow 30t + 300 = 390 \Rightarrow 30t = 90 \Rightarrow t = 3\text{ saat}$$
Buna göre toprak yolda $5 - 3 = 2$ saat yol alınmıştır; toprak yolun uzunluğu $60 \cdot 2 = 120$ km bulunur.',
   'E şıkkı ($270$), $t = 3$ saat süresini bulduktan sonra toprak yol yerine asfalt yolun uzunluğunu ($90 \cdot 3 = 270$) işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-048 · doğrulandı
  ('ce09b074-2bef-5a7d-aa53-dcf79f042963'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 2,
   'Aralarında $450$ km mesafe bulunan A ve B şehirlerinden aynı anda birbirine doğru sabit hızlarla yola çıkan iki araç $3$ saat sonra karşılaşmaktadır.
B şehrinden yola çıkan hızlı araç karşılaşmadan $2$ saat sonra A şehrine ulaştığına göre, A şehrinden yola çıkan yavaş aracın hızı saatte kaç km''dir?',
   '{"options":["60","75","80","90","112,5"],"correctIndex":0}'::jsonb,
   'B şehrinden kalkan araç karşılaşmaya kadar $3$ saat, karşılaşmadan sonra A şehrine kadar $2$ saat olmak üzere $450$ km''lik tüm yolu toplam $3 + 2 = 5$ saatte almıştır. Dolayısıyla hızlı aracın hızı $V_B = \dfrac{450}{5} = 90$ km/sa olur.
İki araç $3$ saatte toplam $450$ km yol alarak karşılaştıklarından hızlar toplamı $V_A + V_B = \dfrac{450}{3} = 150$ km/sa''dir. Buradan yavaş aracın hızı $V_A = 150 - 90 = 60$ km/sa bulunur.',
   'D şıkkı ($90$), tüm yolu $5$ saatte alan B şehrindeki aracın hızını bulup yavaş aracın hızı yerine işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-049 · doğrulandı
  ('658991b9-2669-5705-b521-0c0c13cfaed9'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 3,
   'Aralarındaki uzaklık $300$ km olan $A$ ve $B$ kentlerinden aynı anda birbirine doğru yola çıkan iki araçtan $A$''dan kalkanın hızı $40$ km/sa, $B$''den kalkanın hızı $100$ km/sa''dir. $B$''den kalkan hızlı araç $A$ kentine ulaşıp hiç durmadan aynı hızla $B$ kentine doğru geri dönüyor.
İki aracın dönüş yolunda (hızlı olanın yavaş olana yetiştiği) buluştukları noktanın $A$ kentine uzaklığı kaç km''dir?',
   '{"options":["120","150","160","180","200"],"correctIndex":4}'::jsonb,
   '$B$''den kalkan hızlı araç $A$''ya $\dfrac{300}{100} = 3$ saatte ulaşır. Bu $3$ saat sonunda $A$''dan çıkan yavaş araç $A$''dan $40 \cdot 3 = 120$ km uzaklıktadır ve aynı yöne ($B$''ye doğru) ilerlemektedir.
$3.$ saatten sonra iki araç arasındaki mesafe $120$ km ve hız farkı $100 - 40 = 60$ km/sa''dir. Hızlı araç yavaş araca $\dfrac{120}{60} = 2$ saat sonra yetişir. Toplam $3 + 2 = 5$ saat geçtiğinden buluştukları noktanın $A$''ya uzaklığı $5 \cdot 40 = 200$ km olur.',
   'A şıkkı ($120$), hızlı aracın $A$''ya vardığı $3.$ saatte yavaş aracın konumunu ($120$ km) bulup yakalama adımına geçmeyen adayı; B şıkkı ($150$) ise tam orta noktayı tahmin edenleri yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-050 · doğrulandı
  ('2921a832-8b0f-5f8b-87e6-6beab2962be4'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 1,
   'Bir ürün etiket fiyatının $\%20$ eksiğine alınıp etiket fiyatının $\%20$ fazlasına satılıyor.
Buna göre bu satıştan elde edilen kâr oranı yüzde kaçtır?',
   '{"options":["%40","%50","%55","%60","%65"],"correctIndex":1}'::jsonb,
   'Etiket fiyatı $100$ TL olsun. Alış fiyatı $100 - 20 = 80$ TL, satış fiyatı $100 + 20 = 120$ TL''dir. Elde edilen kâr $120 - 80 = 40$ TL olduğundan maliyet üzerinden kâr oranı $\dfrac{40}{80} \cdot 100 = \%50$ bulunur.',
   'A şıkkı ($\%40$), aradaki $40$ TL kârı maliyet ($80$ TL) yerine etiket fiyatı ($100$ TL) üzerinden oranlayıp $\%40$ bulan adayı yakalar; kâr oranı daima alış fiyatı üzerinden hesaplanır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-051 · doğrulandı
  ('844196fb-b0cc-5744-837c-c9f5b3162e47'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 2,
   'Bir mağaza tüm ürünlere önce $\%20$ indirim yapıyor, ardından indirimli fiyat üzerinden $\%25$ ikinci bir indirim daha uyguluyor.
İki indirim sonunda $360$ TL''ye satılan bir ürünün başlangıçtaki etiket fiyatı kaç TL''dir?',
   '{"options":["520","540","580","600","650"],"correctIndex":3}'::jsonb,
   'Başlangıç etiket fiyatı $F$ olsun. İlk $\%20$ indirimle fiyat $0{,}8F$ olur; bunun üzerinden $\%25$ indirim yapıldığında fiyat $0{,}8F \cdot 0{,}75 = 0{,}6F$ olur.
$0{,}6F = 360 \Rightarrow F = \dfrac{360}{0{,}6} = 600$ TL bulunur.',
   'E şıkkı ($650$) veya farklı tutarlar, iki indirimi doğrudan toplayarak toplam indirimi $\%20 + \%25 = \%45$ sanıp $0{,}55F = 360$ üzerinden yanlış tahmin yürüten adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-052 · doğrulandı
  ('dfd5cb74-d409-5407-9eb4-3c70bfd17602'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 2,
   'Bir kırtasiyeci elindeki kalemlerin $\dfrac{2}{5}$''ini $\%30$ kârla, kalanını ise $\%10$ zararla satıyor.
Buna göre tüm satış sonunda kırtasiyecinin kâr oranı yüzde kaçtır?',
   '{"options":["%2","%4","%6","%8","%10"],"correctIndex":2}'::jsonb,
   'Elimizde birim maliyeti $100$ TL olan $5$ kalem olsun (toplam maliyet $500$ TL).
- $2$ kalem $\%30$ kârla $130$ TL''den satılır: $2 \cdot 130 = 260$ TL.
- Kalan $3$ kalem $\%10$ zararla $90$ TL''den satılır: $3 \cdot 90 = 270$ TL.
Toplam satış geliri $260 + 270 = 530$ TL, kâr ise $530 - 500 = 30$ TL''dir. Kâr oranı $\dfrac{30}{500} \cdot 100 = \%6$ bulunur.',
   'E şıkkı ($\%10$) veya D şıkkı ($\%8$), miktar ağırlıklarını dikkate almadan $\%30 - \%10$ işleminin yarısını ya da $2$ ile $3$''ü ters ağırlıklandırarak hesap yapan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-053 · doğrulandı
  ('fa38e6b4-1589-5e00-ab9f-d705c8d78266'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 3,
   'Kilogramını $32$ TL''den yaş incir alan bir manav, incirleri kuruttuğunda ağırlığının $\%20$''sinin kaybolduğunu görüyor.
Bu satıştan maliyet üzerinden $\%25$ kâr elde etmek isteyen manav, kuru incirin kilogramını kaç TL''den satmalıdır?',
   '{"options":["38","40","45","48","50"],"correctIndex":4}'::jsonb,
   '$10$ kg yaş incir alındığını düşünelim: toplam maliyet $10 \cdot 32 = 320$ TL''dir. Kuruyunca $\%20$ fire verdiği için elde $8$ kg kuru incir kalır. $\%25$ kâr elde etmek için hedeflenen toplam gelir $320 \cdot 1{,}25 = 400$ TL olmalıdır. Buna göre kuru incirin kilogram satış fiyatı $\dfrac{400}{8} = 50$ TL bulunur.',
   'B şıkkı ($40$), $32$ TL maliyetin üzerine $\%25$ kâr koyup ($32 \cdot 1{,}25 = 40$ TL) kuru incirin ağırlık kaybını fiyatlandırmaya dahil etmeyi unutan adayların düştüğü en yaygın fire tuzağıdır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-054 · doğrulandı
  ('56147a6a-07fd-5daa-99d2-51f474e2576d'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 1,
   'Şeker oranı $\%20$ olan $30$ litre şekerli suya $10$ litre saf su eklenirse oluşan yeni karışımın şeker oranı yüzde kaç olur?',
   '{"options":["%8","%10","%12","%14","%15"],"correctIndex":4}'::jsonb,
   'Başlangıçtaki şeker miktarı $30 \cdot \dfrac{20}{100} = 6$ litredir. Saf su eklendiğinde şeker miktarı değişmez, toplam karışım $30 + 10 = 40$ litre olur. Yeni şeker oranı $\dfrac{6}{40} \cdot 100 = \%15$ bulunur.',
   'B şıkkı ($\%10$), eklenen $10$ litre suyun yüzdeden doğrudan $\%10$ eksilteceğini sanıp $\%20 - \%10 = \%10$ yazan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-055 · doğrulandı
  ('9a546f3f-0e48-5545-a142-d7873261d8ef'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 2,
   'Alkol oranı $\%30$ olan $40$ gram alkol-su karışımına kaç gram saf alkol eklenirse yeni karışımın alkol oranı $\%50$ olur?',
   '{"options":["16","18","20","24","28"],"correctIndex":0}'::jsonb,
   'Başlangıçtaki alkol miktarı $40 \cdot \dfrac{30}{100} = 12$ gramdır. Karışıma $x$ gram saf alkol ($\%100$''ü alkol) eklendiğinde hem alkol miktarı hem toplam kütle $x$ gram artar:
$$\frac{12 + x}{40 + x} = \frac{50}{100} = \frac{1}{2} \Rightarrow 24 + 2x = 40 + x \Rightarrow x = 16$$
Buna göre $16$ gram saf alkol eklenmelidir.',
   'B şıkkı ($18$) veya C şıkkı ($20$), eklenen saf alkolün toplam karışım kütlesini ($40 + x$) artırdığını paydada unutup $\dfrac{12 + x}{40} = 0{,}5 \Rightarrow x = 8$ veya hatalı yüzdelerle $20$ bulan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-056 · doğrulandı
  ('2d6b1629-5103-50ff-8904-ebab3e749233'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 2,
   '$6$ kişilik bir grubun yaş ortalaması $24$''tür. Bu gruptan yaşları toplamı $58$ olan iki kişi ayrılıp gruba $x$ yaşında bir kişi katıldığında, oluşan yeni grubun yaş ortalaması $21$ olmaktadır.
Buna göre gruba sonradan katılan kişinin yaşı $x$ kaçtır?',
   '{"options":["15","17","18","19","21"],"correctIndex":3}'::jsonb,
   'Başlangıçtaki $6$ kişinin yaşları toplamı $6 \cdot 24 = 144$''tür. İki kişi ayrılıp bir kişi katılınca gruptaki kişi sayısı $6 - 2 + 1 = 5$ olur. Yeni grubun yaşları toplamı $5 \cdot 21 = 105$ olacağından:
$$144 - 58 + x = 105 \Rightarrow 86 + x = 105 \Rightarrow x = 19$$
bulunur.',
   'A şıkkı ($15$) veya E şıkkı ($21$), iki kişi ayrılıp bir kişi katıldığı hâlde kişi sayısını $4$ sanarak $4 \cdot 21$ alan ya da katılan kişinin doğrudan yeni ortalama ($21$) yaşında olduğunu sanan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-057 · doğrulandı
  ('747eff89-48d6-594b-9aae-b388e9de9bfa'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 1,
   'Bugün $42$ yaşında olan bir babanın iki çocuğunun bugünkü yaşları toplamı $16$''dır.
Kaç yıl sonra babanın yaşı, iki çocuğunun yaşları toplamına eşit olur?',
   '{"options":["26","13","20","24","28"],"correctIndex":0}'::jsonb,
   '$t$ yıl sonra baba $42 + t$ yaşında olurken, iki çocuğunun her biri $t$ yaş büyüyeceği için çocukların yaşları toplamı $16 + 2t$ olur:
$$42 + t = 16 + 2t \Rightarrow t = 26$$
$26$ yıl sonra baba $68$, çocuklar toplam $16 + 52 = 68$ yaşında olur.',
   'B şıkkı ($13$), iki çocuğun yaş toplamını $t$ yıl sonra $16 + t$ olarak artırıp $42 + t$ ile eşit sanmaya çalışan veya $26$''yı ikiye bölen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-058 · doğrulandı
  ('568c535d-c95a-54b6-b748-d243871a86dd'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 2,
   'Annesi $28$ yaşındayken doğan Elif ile annesinin bugünkü yaşları toplamı $72$''dir.
Buna göre kaç yıl önce annesinin yaşı, Elif''in yaşının $3$ katıydı?',
   '{"options":["4","5","6","7","8"],"correctIndex":4}'::jsonb,
   'Anne ($A$) ile Elif ($E$) arasındaki yaş farkı daima $28$''dir ($A - E = 28$). Bugünkü toplamları $A + E = 72$ ile taraf tarafa toplanırsa $2A = 100 \Rightarrow A = 50$ ve $E = 22$ bulunur.
$t$ yıl önce annenin yaşı Elif''in yaşının $3$ katı olsun:
$$50 - t = 3(22 - t) \Rightarrow 50 - t = 66 - 3t \Rightarrow 2t = 16 \Rightarrow t = 8$$
($8$ yıl önce anne $42$, Elif $14$ yaşındaydı; $42 = 3 \cdot 14$.)',
   'A şıkkı ($4$) veya C şıkkı ($6$), yaş farkı sabit kalırken $3$ kat yaşa geçmede yalnızca anneyi veya yalnızca kızı $t$ yıl geriye götürüp $50 - t = 3 \cdot 22$ gibi tek taraflı denklem kuran adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-059 · doğrulandı
  ('c45dc567-48be-5cfe-83a0-424582e3b526'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 1,
   'Eşit kapasiteli $8$ işçi bir duvarı $12$ günde örebilmektedir.
Aynı duvarı aynı kapasitedeki $6$ işçi kaç günde örer?',
   '{"options":["9","14","16","18","24"],"correctIndex":2}'::jsonb,
   'İşçi sayısı ile bitirme süresi ters orantılıdır: $8 \cdot 12 = 6 \cdot g \Rightarrow 96 = 6g \Rightarrow g = 16$ gün bulunur.',
   'A şıkkı ($9$), işçi sayısıyla gün sayısını ters değil doğru orantılıymış gibi $\dfrac{8}{12} = \dfrac{6}{g} \Rightarrow g = 9$ kuran adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-060 · doğrulandı
  ('ceb1f0cb-fe00-5f59-b9b6-f2c157f769fe'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 2,
   'Eşit kapasiteli $3$ usta bir duvarı $12$ günde, eşit kapasiteli $4$ çırak ise aynı duvarı $18$ günde örebilmektedir.
Buna göre $1$ usta ve $2$ çırak birlikte çalışarak aynı duvarı kaç günde örer?',
   '{"options":["15","18","20","24","30"],"correctIndex":1}'::jsonb,
   'Önce $1$ ustanın ve $1$ çırağın tek başına bitirme süreleri ters orantıyla bulunur:
- $1$ usta aynı duvarı $3 \cdot 12 = 36$ günde örer ($1$ günde işin $\dfrac{1}{36}$''sı).
- $1$ çırak aynı duvarı $4 \cdot 18 = 72$ günde örer ($1$ günde işin $\dfrac{1}{72}$''si).
$1$ usta ve $2$ çırak birlikte $1$ günde işin $\dfrac{1}{36} + \dfrac{2}{72} = \dfrac{1}{36} + \dfrac{1}{36} = \dfrac{1}{18}$''ini yapar; dolayısıyla duvarı $18$ günde örerler.',
   'D şıkkı ($24$) veya A şıkkı ($15$), $3$ usta $12$ günde bitiriyorsa $1$ ustanın daha kısa sürede bitireceğini ya da sürelerin doğrudan aritmetik ortalamasının alınacağını sanan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-061 · doğrulandı
  ('842d740b-6013-5da9-8a69-3170b15de9ba'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 2,
   'Aralarında $580$ km mesafe bulunan $A$ ve $B$ kentlerinden $A$''daki araç saatte $50$ km sabit hızla $B$''ye doğru yola çıkıyor. Bu araç hareket ettikten $2$ saat sonra $B$ kentindeki bir diğer araç saatte $70$ km sabit hızla $A$''ya doğru yola çıkıyor.
$B$''den çıkan araç hareket ettikten kaç saat sonra iki araç karşılaşır?',
   '{"options":["2","2,5","3","3,5","4"],"correctIndex":4}'::jsonb,
   'İlk $2$ saat boyunca $A$''dan çıkan araç tek başına $50 \cdot 2 = 100$ km yol alır; aralarında kalan mesafe $580 - 100 = 480$ km olur. $B$''den araç çıktıktan sonra iki araç birbirine doğru $50 + 70 = 120$ km/sa bağıl hızla yaklaşır. Karşılaşma süresi $\dfrac{480}{120} = 4$ saat bulunur.',
   'C şıkkı ($3$), ilk $2$ saatlik mesafeyi ($100$ km) düşerken hata yapanları; ya da doğrudan $A$''dan hareketten itibaren toplam süre ($4 + 2 = 6$) ile karıştıranları hedefler.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-062 · doğrulandı
  ('77840a5e-0802-5b8a-8b3f-fefc041fa47b'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 2,
   'Çevresi $600$ metre olan dairesel bir pistin aynı noktasından aynı anda zıt yönlere doğru koşmaya başlayan iki sporcudan birinin hızı $15$ m/sn, diğerinin hızı $25$ m/sn''dir.
Bu iki sporcu hareketlerinden kaç saniye sonra 3. kez karşılaşırlar?',
   '{"options":["45","15","30","60","90"],"correctIndex":0}'::jsonb,
   'Zıt yönlerde koşan sporcuların birbirine göre bağıl hızı $15 + 25 = 40$ m/sn''dir. Her karşılaşmada birlikte bir pist çevresi ($600$ m) kadar yol alırlar: bir karşılaşma süresi $\dfrac{600}{40} = 15$ saniyedir. Üçüncü karşılaşma $3 \cdot 15 = 45$ saniye sonra gerçekleşir.',
   'B şıkkı ($15$), ilk karşılaşma süresini bulup $3$. karşılaşma için $3$ ile çarpmayı unutan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-063 · doğrulandı
  ('270cd314-866d-5477-9e9d-a5a5a9519154'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 3,
   'Durgun sudaki hızı saatte $20$ km olan bir motor, akıntı hızının saatte $4$ km olduğu bir nehirde $A$ iskelesinden $B$ iskelesine akıntıyla aynı yönde gidip hiç durmadan geri dönüyor.
Bu gidiş-dönüş yolculuğu toplam $10$ saat sürdüğüne göre $A$ ile $B$ iskeleleri arasındaki uzaklık kaç km''dir?',
   '{"options":["80","96","100","120","192"],"correctIndex":1}'::jsonb,
   'Akıntıyla giderken motorun hızı $20 + 4 = 24$ km/sa, akıntıya karşı dönerken hızı $20 - 4 = 16$ km/sa olur. İki iskele arası mesafe $x$ km ise:
$$\frac{x}{24} + \frac{x}{16} = 10 \Rightarrow \frac{2x + 3x}{48} = 10 \Rightarrow 5x = 480 \Rightarrow x = 96\text{ km}$$',
   'C şıkkı ($100$), akıntının gidişte artırıp dönüşte azalttığı için hızları birbirini götürür sanarak durgun su hızı $20$ km/sa ile $\dfrac{2x}{20} = 10 \Rightarrow x = 100$ hesaplayan adayların düştüğü tuzaktır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-064 · doğrulandı
  ('084f9ef7-ef44-525b-86c0-3c3e83aeae7b'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 1,
   'Bir elektronik mağazasında peşin alımlarda etiket fiyatı üzerinden $\%15$ indirim yapılmaktadır. Etiket fiyatı $4.800$ TL olan bir tableti taksitli almak isteyen bir müşteriye ise indirimli peşin fiyatın $\%20$ fazlası üzerinden ödeme planı sunulmaktadır.
Buna göre bu tabletin taksitli satış fiyatı kaç TL''dir?',
   '{"options":["4.560","4.800","4.896","4.920","5.040"],"correctIndex":2}'::jsonb,
   'Önce peşin indirimli fiyat hesaplanır: $4.800 \cdot \dfrac{85}{100} = 4.080$ TL. Ardından taksitli fiyat için bu değer $\%20$ artırılır: $4.080 \cdot \dfrac{120}{100} = 4.896$ TL bulunur.',
   'E şıkkı ($5.040$), $\%15$ indirim ve $\%20$ artışı ayrı tabanlar yerine doğrudan etiket fiyatına uygulayıp $+\%5$ net farkla $4.800 \cdot 1{,}05 = 5.040$ bulan adayların düştüğü klasik zincirleme yüzde tuzağıdır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-065
  ('f592fbac-7ad2-59de-bac7-88fb4eb16902'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 2,
   'Bir sinema salonunda bilet fiyatına $\%20$ indirim yapıldığında günlük bilet satış adedi $\%30$ artmaktadır.
Buna göre bu sinema salonunun günlük toplam hasılatı nasıl değişir?',
   '{"options":["%4 artar","%4 azalır","%6 artar","%10 artar","Değişmez"],"correctIndex":0}'::jsonb,
   'Başlangıçta bilet fiyatı $10$ TL ve günlük satılan bilet sayısı $10$ adet olsun; başlangıç hasılatı $10 \cdot 10 = 100$ TL''dir.
İndirim sonrası yeni fiyat $10 \cdot 0{,}80 = 8$ TL, yeni satış adedi ise $10 \cdot 1{,}30 = 13$ adet olur. Yeni hasılat $8 \cdot 13 = 104$ TL olduğundan günlük toplam hasılat $\%4$ artar.',
   'D şıkkı ($\%10$ artar), fiyat ile adedin çarpımsal ilişkisini göz ardı edip yalnızca yüzdeler farkını ($+30\% - 20\% = +10\%$) alan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-066 · doğrulandı
  ('4cd7109c-02c4-5942-9957-b5bd5d1ac9bb'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 2,
   'Maliyet üzerinden $\%25$ kârla satılan bir ürüne satış fiyatı üzerinden $60$ TL indirim yapıldığında ürün maliyet üzerinden $\%10$ kârla satılmış oluyor.
Buna göre bu ürünün maliyeti kaç TL''dir?',
   '{"options":["240","300","320","360","400"],"correctIndex":4}'::jsonb,
   'Ürünün maliyeti $M$ TL olsun. $\%25$ kârlı satış fiyatı $1{,}25M$, $\%10$ kârlı satış fiyatı $1{,}10M$''dir. Aradaki fark indirime eşittir:
$$1{,}25M - 1{,}10M = 60 \Rightarrow 0{,}15M = 60 \Rightarrow M = \frac{6.000}{15} = 400\text{ TL}$$',
   'A şıkkı ($240$), $60$ TL''lik indirimi doğrudan $\%25$''e oranlayıp $60 / 0{,}25 = 240$ bulan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-067 · doğrulandı
  ('563efc03-14a9-5b2e-b5be-b2a785fa5b26'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 3,
   'Bir mağaza sahibi maliyeti üzerinden $\%40$ kâr ekleyerek etiket fiyatını belirlediği bir gömleği, sezon sonunda etiket fiyatı üzerinden $\%25$ indirimle satarak bu satıştan $45$ TL kâr elde etmiştir.
Buna göre bu gömleğin etiket fiyatı kaç TL''dir?',
   '{"options":["900","945","1.050","1.260","1.350"],"correctIndex":3}'::jsonb,
   'Gömleğin maliyeti $100x$ TL olsun. Etiket fiyatı $140x$ TL''dir. Etiket üzerinden $\%25$ indirim yapıldığında satış fiyatı $140x \cdot 0{,}75 = 105x$ TL olur.
Elde edilen kâr $105x - 100x = 5x = 45 \Rightarrow x = 9$ TL bulunur. Buna göre etiket fiyatı $140 \cdot 9 = 1.260$ TL''dir.',
   'A şıkkı ($900$), maliyet fiyatını ($100x = 900$) bulup etiket fiyatına geçmeden işaretleyen; B şıkkı ($945$) ise indirimli satış fiyatını seçen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-068 · doğrulandı
  ('f2990a5d-14d3-5815-a471-4e960e41733a'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 1,
   'Tuz oranı $\%25$ olan $80$ gram tuzlu su karışımının yarısı dökülüyor ve kalan karışımın üzerine $10$ gram saf tuz ekleniyor.
Buna göre oluşan yeni karışımın tuz oranı yüzde kaç olur?',
   '{"options":["%30","%35","%40","%45","%50"],"correctIndex":2}'::jsonb,
   'Karışımın yarısı dökülünce kalan miktar $40$ gram olur; ancak karışım homojen olduğu için tuz oranı değişmez ve $\%25$ kalır. Kalan karışımdaki tuz $40 \cdot 0{,}25 = 10$ gramdır. Üzerine $10$ gram saf tuz eklendiğinde toplam tuz $10 + 10 = 20$ gram, toplam karışım ise $40 + 10 = 50$ gram olur. Yeni tuz oranı $\dfrac{20}{50} \cdot 100 = \%40$ bulunur.',
   'E şıkkı ($\%50$), eklenen $10$ gram tuzun yalnızca başlangıçtaki $10$ gram tuz kadar olduğunu görüp paydadaki karışım ağırlığının $40$''tan $50$''ye çıktığını unutan ($20/40 = \%50$) adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-069 · doğrulandı
  ('aa28d072-4662-58d6-a69c-b0609d5c4851'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 2,
   'Tuz oranı $\%15$ olan $40$ gram tuzlu su ile tuz oranı $\%35$ olan $60$ gram tuzlu su aynı kapta karıştırılıyor.
Oluşan yeni karışımın tuz oranı yüzde kaç olur?',
   '{"options":["%25","%27","%28","%30","%32"],"correctIndex":1}'::jsonb,
   'İlk kaptan $40 \cdot \dfrac{15}{100} = 6$ gram, ikinci kaptan $60 \cdot \dfrac{35}{100} = 21$ gram tuz gelir. Toplam tuz $6 + 21 = 27$ gram, toplam karışım $40 + 60 = 100$ gramdır. Yeni tuz oranı $\dfrac{27}{100} = \%27$ bulunur.',
   'A şıkkı ($\%25$), ağırlık farkını ($40$ g ve $60$ g) dikkate almadan iki yüzdenin aritmetik ortalamasını ($\frac{15 + 35}{2} = 25$) alan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-08-070 · doğrulandı
  ('4257035e-6097-5761-b02a-48374acba66a'::uuid, 'Matematik & Geometri', 'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri', 'multiple_choice', 3,
   '$A$ kabında tuz oranı $\%20$ olan $50$ kg tuzlu su, $B$ kabında ise tuz oranı $\%40$ olan $60$ kg tuzlu su bulunmaktadır. Önce $A$ kabındaki karışımın $\dfrac{2}{5}$''i $B$ kabına dökülüp karıştırılıyor. Ardından $B$ kabında oluşan yeni karışımın $\dfrac{1}{4}$''ü $A$ kabına geri dökülüyor.
Son durumda $A$ kabındaki karışımın tuz oranı yüzde kaç olur?',
   '{"options":["%20","%22","%24","%25","%26"],"correctIndex":4}'::jsonb,
   'Adım adım kütle ve tuz miktarları izlenir:
- Başlangıçta $A$''da $50$ kg ($10$ kg tuz), $B$''de $60$ kg ($24$ kg tuz) vardır.
- $1.$ aktarım: $A$''nın $\dfrac{2}{5}$''i olan $20$ kg karışım ($20 \cdot 0{,}2 = 4$ kg tuz) $B$''ye gider. $A$''da $30$ kg ($6$ kg tuz) kalır. $B$''de $60 + 20 = 80$ kg karışım ve $24 + 4 = 28$ kg tuz olur (tuz oranı $\dfrac{28}{80} = \%35$).
- $2.$ aktarım: $B$''deki $80$ kg karışımın $\dfrac{1}{4}$''ü ($20$ kg) $\%35$ oranıyla $A$''ya döner; taşınan tuz $20 \cdot 0{,}35 = 7$ kg''dır.
Son durumda $A$''da $30 + 20 = 50$ kg karışım ve $6 + 7 = 13$ kg tuz bulunur. Tuz oranı $\dfrac{13}{50} \cdot 100 = \%26$''dır.',
   'C şıkkı ($\%24$) veya A şıkkı ($\%20$), ikinci aktarımda $B$''nin yeni oranının $\%35$ değil başlangıçtaki $\%40$ kaldığını ya da karşılıklı aktarımın oranları birbirine eşitlediğini sanan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true)
on conflict (id) do update set
  lesson = excluded.lesson, topic = excluded.topic, question_type = excluded.question_type,
  difficulty = excluded.difficulty, prompt_text = excluded.prompt_text,
  interaction_data = excluded.interaction_data, explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap, exam_scopes = excluded.exam_scopes,
  education_level = excluded.education_level, figure_svg = excluded.figure_svg, is_active = true;
