-- ==========================================================================
-- KADRO SORU HAVUZU · Matematik & Geometri · Denklem Çözme ve Sayı-Kesir Problemleri (50 soru)
-- Kaynak: docs/soru_havuzu/matematik/07_denklem_cozme_ve_sayi_kesir_problemleri.md · Üretici: tools/math/compile_questions.mjs (elle düzenlemeyin)
-- Önkoşul: docs/supabase_migrations/12_math_figures.sql
-- İdempotent: soru kimlikleri sabit UUID'dir; dosya tekrar çalıştırılırsa sorular güncellenir.
-- ==========================================================================

insert into public.questions (
  id, lesson, topic, question_type, difficulty, prompt_text, interaction_data,
  explanation, distractor_trap, exam_scopes, education_level, figure_svg, is_active
) values
  -- mat-07-001 · doğrulandı
  ('0c5702be-be1c-5940-ab56-8cfc08b2c288'::uuid, 'Matematik & Geometri', 'Denklem Çözme ve Sayı-Kesir Problemleri', 'multiple_choice', 1,
   '$$\dfrac{2x - 1}{3} - \dfrac{x + 2}{4} = \dfrac{5}{6}$$
denklemini sağlayan $x$ değeri kaçtır?',
   '{"options":["2","4","5","6","8"],"correctIndex":1}'::jsonb,
   'Tüm kesirlerin paydaları $12$''de eşitlenir (veya eşitliğin her iki tarafı $12$ ile çarpılır): $4(2x - 1) - 3(x + 2) = 2 \cdot 5$. Parantezler açıldığında $8x - 4 - 3x - 6 = 10 \Rightarrow 5x - 10 = 10 \Rightarrow 5x = 20 \Rightarrow x = 4$ bulunur.',
   'A şıkkı (2), ikinci kesrin önündeki eksi işaretini parantezin ikinci terimi olan $+2$''ye dağıtmayı unutup $-3x + 6$ yazan ve hatalı denklemden küçük kök elde eden adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-07-002 · doğrulandı
  ('39e9cef4-6d6c-544a-b55c-6abe8ba3bcad'::uuid, 'Matematik & Geometri', 'Denklem Çözme ve Sayı-Kesir Problemleri', 'multiple_choice', 1,
   '$$3x + 2y = 26$$
$$2x - y = 8$$
denklem sistemini sağlayan $x$ ve $y$ sayıları için $x + y$ toplamı kaçtır?',
   '{"options":["6","8","9","10","12"],"correctIndex":3}'::jsonb,
   'İkinci denklem $2$ ile çarpılıp birinci denklemle taraf tarafa toplanır:
$(3x + 2y) + (4x - 2y) = 26 + 16 \Rightarrow 7x = 42 \Rightarrow x = 6$.
$2(6) - y = 8 \Rightarrow y = 4$ bulunur. İstenen toplam $x + y = 6 + 4 = 10$''dur.',
   'A şıkkı (6), $x = 6$ değerini bulduktan sonra $y$''yi eklemeden doğrudan $x$''i işaretleyen adayı; B şıkkı (8) ise ikinci denklemi $2$ ile çarparken sağ taraftaki $8$''i çarpmayı unutanları yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-07-003 · doğrulandı
  ('59df6747-8a3d-594f-9c78-187fb49ce61e'::uuid, 'Matematik & Geometri', 'Denklem Çözme ve Sayı-Kesir Problemleri', 'multiple_choice', 2,
   'Bir kişi bir merdivenin basamaklarını ikişer ikişer çıkıp üçer üçer indiğinde çıkışta attığı adım sayısı, inişte attığı adım sayısından $12$ fazla olmaktadır.
Buna göre bu merdiven kaç basamaklıdır?',
   '{"options":["72","60","48","36","24"],"correctIndex":0}'::jsonb,
   'Merdivenin basamak sayısına $x$ denirse çıkıştaki adım sayısı $\dfrac{x}{2}$, inişteki adım sayısı $\dfrac{x}{3}$ olur. Aradaki fark $12$ olduğundan $\dfrac{x}{2} - \dfrac{x}{3} = 12 \Rightarrow \dfrac{3x - 2x}{6} = 12 \Rightarrow \dfrac{x}{6} = 12 \Rightarrow x = 72$ bulunur.',
   'D şıkkı (36), basamak sayısı yerine çıkıştaki adım sayısını ($72 \div 2 = 36$) işaretleyen adayı yakalar. E şıkkı (24) ise inişteki adım sayısını seçenlerin düştüğü tuzaktır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-07-004 · doğrulandı
  ('7559fc94-3d1e-575e-8332-9c78cf536fc6'::uuid, 'Matematik & Geometri', 'Denklem Çözme ve Sayı-Kesir Problemleri', 'multiple_choice', 2,
   'Bir sınıftaki öğrenciler sıralara ikişerli otururlarsa $8$ öğrenci ayakta kalıyor, üçerli otururlarsa $4$ sıra boş kalıyor.
Buna göre bu sınıfta kaç öğrenci vardır?',
   '{"options":["20","32","36","44","48"],"correctIndex":4}'::jsonb,
   'Sınıftaki sıra sayısına $s$ denir. İkişerli oturulduğunda öğrenci sayısı $2s + 8$, üçerli oturulduğunda $4$ sıra boş kaldığı için $3(s - 4)$ olur. İki ifade birbirine eşitlenir: $2s + 8 = 3(s - 4) \Rightarrow 2s + 8 = 3s - 12 \Rightarrow s = 20$ sıra bulunur. Öğrenci sayısı $2 \cdot 20 + 8 = 48$''dir.',
   'A şıkkı (20), öğrenci sayısı yerine sıra sayısını ($s = 20$) işaretleyen adayı yakalar. B şıkkı (32) ise $3(s - 4)$ yerine $3s - 4$ yazarak parantez hatası yapanların bulduğu sonuçtur.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-07-005 · doğrulandı
  ('a8670953-df15-50ce-934e-2af8c2962a62'::uuid, 'Matematik & Geometri', 'Denklem Çözme ve Sayı-Kesir Problemleri', 'multiple_choice', 2,
   'Bir memur aylık maaşının önce $\dfrac{1}{4}$''ünü kiraya, kalan maaşının $\dfrac{2}{5}$''ini mutfak masraflarına harcamaktadır.
Geriye $18.000$ TL parası kaldığına göre memurun aylık maaşı kaç TL''dir?',
   '{"options":["30.000","36.000","40.000","45.000","51.428"],"correctIndex":2}'::jsonb,
   'Maaşa $M$ denirse kiranın ardından maaşın $1 - \dfrac{1}{4} = \dfrac{3}{4}$''ü kalır. Bu kalan tutarın $\dfrac{2}{5}$''i harcandığında geriye kalanının $1 - \dfrac{2}{5} = \dfrac{3}{5}$''i kalır. Buna göre $\dfrac{3}{4} \cdot \dfrac{3}{5} \cdot M = 18.000 \Rightarrow \dfrac{9}{20} M = 18.000 \Rightarrow M = \dfrac{18.000 \cdot 20}{9} = 40.000$ TL bulunur.',
   'A şıkkı (30.000), mutfak harcamasını kalan maaş yerine ilk maaşın $\frac{2}{5}$''i olarak alıp oranları yanlış hesaplayan veya payda sadeleştirmede hata yapan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-07-006 · doğrulandı
  ('3a65c844-e5a0-5a2b-89c7-e1ec3075d7dc'::uuid, 'Matematik & Geometri', 'Denklem Çözme ve Sayı-Kesir Problemleri', 'multiple_choice', 1,
   '$50$ soruluk bir testte her doğru yanıt $+4$ puan, her yanlış yanıt $-1$ puan getirmekte ve boş sorular puanı etkilememektedir.
Tüm soruları yanıtlayıp $125$ puan alan bir öğrenci kaç soruyu doğru yanıtlamıştır?',
   '{"options":["30","32","34","35","38"],"correctIndex":3}'::jsonb,
   'Doğru sayısına $d$, yanlış sayısına $y$ denirse tüm sorular yanıtlandığı için $d + y = 50$ ve puan denklemi $4d - y = 125$ olur. İki denklem taraf tarafa toplanırsa $5d = 175 \Rightarrow d = 35$ bulunur.',
   'B şıkkı (32), her yanlışta yalnızca $1$ puan silmek yerine dört yanlışın bir doğruyu götürdüğü ($4$ yerine $1{,}25$ veya $5$ bölümü) varsayımıyla denklem kuran adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-07-007 · doğrulandı
  ('2dcb63f9-721e-58d3-af97-ab9e0e4ac267'::uuid, 'Matematik & Geometri', 'Denklem Çözme ve Sayı-Kesir Problemleri', 'multiple_choice', 2,
   'Düz bir telin bir ucundan uzunluğunun $\dfrac{1}{6}$''sı, diğer ucundan uzunluğunun $\dfrac{1}{4}$''ü kesilip atılıyor.
Telin orta noktası başlangıçtaki konumuna göre $3$ cm kaydığına göre telin kesilmeden önceki uzunluğu kaç cm''dir?',
   '{"options":["36","72","84","96","144"],"correctIndex":1}'::jsonb,
   'Telin bir ucundan $a$, diğer ucundan $b$ cm kesildiğinde orta nokta $\dfrac{|a - b|}{2}$ cm kayar. Telin başlangıç boyuna $12k$ denirse bir uçtan $2k$, diğer uçtan $3k$ kesilir. Orta noktanın kayma miktarı $\dfrac{3k - 2k}{2} = \dfrac{k}{2} = 3$ cm olduğundan $k = 6$ bulunur. Telin ilk boyu $12 \cdot 6 = 72$ cm''dir.',
   'A şıkkı (36), orta nokta kaymasını kesilen parçaların farkının yarısı yerine doğrudan farkına ($3k - 2k = 3 \Rightarrow k = 3$) eşitleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-07-008 · doğrulandı
  ('ec80d656-7614-5f55-a4c4-8901c8ee9777'::uuid, 'Matematik & Geometri', 'Denklem Çözme ve Sayı-Kesir Problemleri', 'multiple_choice', 2,
   '$a$ ve $b$ gerçel sayılar olmak üzere
$$(a - 3)x + 6 = 4x + 2b$$
denkleminin çözüm kümesi tüm gerçel sayılar ($\mathbb{R}$) olduğuna göre $a \cdot b$ çarpımı kaçtır?',
   '{"options":["21","14","12","10","7"],"correctIndex":0}'::jsonb,
   'Birinci dereceden $Ax + B = Cx + D$ denkleminin tüm gerçel sayılar için sağlanabilmesi için $x$''in katsayıları ve sabit terimler karşılıklı eşit olmalıdır ($0 \cdot x = 0$). Buradan $a - 3 = 4 \Rightarrow a = 7$ ve $6 = 2b \Rightarrow b = 3$ bulunur. Çarpım $a \cdot b = 7 \cdot 3 = 21$ olur.',
   'E şıkkı (7), yalnızca $a = 7$ değerini bulup $b$''yi bulmayı unutan; C şıkkı (12) ise $2b = 6$ yerine $b = 6$ veya $a = 4$ alan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-07-009 · doğrulandı
  ('a184c548-e7de-5d3e-a1b2-72bb4ad81f88'::uuid, 'Matematik & Geometri', 'Denklem Çözme ve Sayı-Kesir Problemleri', 'multiple_choice', 1,
   'Bir şişe tamamen su ile doluyken $640$ gram, $\dfrac{3}{5}$''i su ile doluyken $424$ gram gelmektedir.
Buna göre boş şişenin ağırlığı kaç gramdır?',
   '{"options":["80","90","96","100","120"],"correctIndex":3}'::jsonb,
   'İki tartım arasındaki fark boşalan suyun ağırlığıdır: $640 - 424 = 216$ gram. Şişedeki suyun $1 - \dfrac{3}{5} = \dfrac{2}{5}$''i $216$ gram olduğundan tam dolu su ağırlığı $216 \cdot \dfrac{5}{2} = 540$ gramdır. Tam dolu tartımdan su ağırlığı çıkarılırsa boş şişe $640 - 540 = 100$ gram bulunur.',
   'E şıkkı (120) veya C şıkkı (96), $216$ gram farkı kalan $\frac{2}{5}$ yerine dökülen sanılan $\frac{3}{5}$''e eşitleyen ($216 \cdot 5 / 3 = 360$) veya bölme hatası yapan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-07-010 · doğrulandı
  ('772dae7f-9e21-513a-9113-77f5d94bc09e'::uuid, 'Matematik & Geometri', 'Denklem Çözme ve Sayı-Kesir Problemleri', 'multiple_choice', 2,
   'Bir kumbarada yalnızca $50$ kuruşluk ve $1$ TL''lik madeni paralar bulunmaktadır.
Toplam $36$ adet madeni paranın toplam değeri $25{,}5$ TL olduğuna göre kumbarada kaç adet $50$ kuruşluk vardır?',
   '{"options":["15","16","18","20","21"],"correctIndex":4}'::jsonb,
   '$50$ kuruşlukların adedine $x$ denirse $1$ TL''liklerin adedi $36 - x$ olur. $50$ kuruş $= 0{,}5$ TL olduğundan toplam tutar denklemi kurulur: $0{,}5x + 1 \cdot (36 - x) = 25{,}5 \Rightarrow 36 - 0{,}5x = 25{,}5 \Rightarrow 0{,}5x = 10{,}5 \Rightarrow x = 21$ bulunur.',
   'A şıkkı (15), $21$ adet $50$ kuruşluk yerine $36 - 21 = 15$ adet $1$ TL''lik sayısını işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-07-011 · doğrulandı
  ('a6202afd-020b-52c6-8b81-1168b181321c'::uuid, 'Matematik & Geometri', 'Denklem Çözme ve Sayı-Kesir Problemleri', 'multiple_choice', 3,
   'Belirli bir yükseklikten serbest bırakılan bir top, yere her çarpışından sonra bir önceki yüksekliğinin $\dfrac{2}{3}$''ü kadar yükselmektedir.
Top yere üçüncü kez çarptıktan sonra $32$ cm yükseldiğine göre başlangıçta kaç cm yükseklikten bırakılmıştır?',
   '{"options":["72","96","108","128","162"],"correctIndex":2}'::jsonb,
   'Başlangıç yüksekliği $H$ olsun. $1$. çarpıştan sonra $\dfrac{2}{3}H$, $2$. çarpıştan sonra $\left(\dfrac{2}{3}\right)^2 H$ ve $3$. çarpıştan sonra $\left(\dfrac{2}{3}\right)^3 H$ yükselir. Buna göre $\dfrac{8}{27} H = 32 \Rightarrow H = \dfrac{32 \cdot 27}{8} = 4 \cdot 27 = 108$ cm bulunur.',
   'A şıkkı (72), $3$. çarpıştan sonraki yüksekliği hesaplarken üssü $3$ yerine $2$ alıp $\left(\frac{2}{3}\right)^2 H = 32 \Rightarrow H = 72$ bulan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-07-012 · doğrulandı
  ('e59ccbe5-eda5-5b06-982d-ed96c500e25a'::uuid, 'Matematik & Geometri', 'Denklem Çözme ve Sayı-Kesir Problemleri', 'multiple_choice', 3,
   'Bir su deposunun $\dfrac{2}{5}$''i su ile doludur. Depoya $24$ litre su eklendikten sonra depoda biriken suyun $\dfrac{1}{4}$''ü kullanıldığında deponun tam yarısı dolu kalmaktadır.
Buna göre bu deponun tamamı kaç litre su alır?',
   '{"options":["80","90","100","120","150"],"correctIndex":1}'::jsonb,
   'Deponun tamamına $V$ litre denir. $24$ litre eklendikten sonra depodaki su $\dfrac{2}{5}V + 24$ olur. Bu suyun $\dfrac{1}{4}$''ü kullanıldığında geriye $\dfrac{3}{4}$''ü kalır ve bu miktar deponun yarısına eşittir:
$\dfrac{3}{4}\left(\dfrac{2}{5}V + 24\right) = \dfrac{1}{2}V \Rightarrow \dfrac{3}{10}V + 18 = \dfrac{5}{10}V \Rightarrow \dfrac{2}{10}V = 18 \Rightarrow V = 90$ litre bulunur.',
   'D şıkkı (120), kullanılan $\frac{1}{4}$ oranını depoda biriken su yerine deponun tamamına uygulayıp $\frac{2}{5}V + 24 - \frac{1}{4}V = \frac{1}{2}V$ denklemini kuran adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-07-013 · doğrulandı
  ('f6af2b06-df8f-5614-a2e9-f51fb3631327'::uuid, 'Matematik & Geometri', 'Denklem Çözme ve Sayı-Kesir Problemleri', 'multiple_choice', 1,
   '$$\dfrac{3x - 2}{2x + 8} = \dfrac{4}{5}$$
denklemini sağlayan $x$ sayısı kaçtır?',
   '{"options":["6","4","5","7","8"],"correctIndex":0}'::jsonb,
   'İçler dışlar çarpımı yapılır: $5(3x - 2) = 4(2x + 8) \Rightarrow 15x - 10 = 8x + 32 \Rightarrow 7x = 42 \Rightarrow x = 6$ bulunur.',
   'B şıkkı (4), $5$''i $-2$''ye çarpmayı unutup $15x - 2 = 8x + 32$ veya $4$''ü $8$''e çarpmayı unutup hatalı sadeleştirme yapan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-07-014 · doğrulandı
  ('2c2bb52e-b587-558e-a26a-4e12ea6e2ad5'::uuid, 'Matematik & Geometri', 'Denklem Çözme ve Sayı-Kesir Problemleri', 'multiple_choice', 1,
   'Toplamları $96$ olan iki sayıdan büyüğü, küçüğünün $3$ katından $8$ eksiktir.
Buna göre büyük sayı kaçtır?',
   '{"options":["22","26","70","74","78"],"correctIndex":2}'::jsonb,
   'Küçük sayıya $x$ denirse büyük sayı $3x - 8$ olur. Toplamları $x + (3x - 8) = 96 \Rightarrow 4x - 8 = 96 \Rightarrow 4x = 104 \Rightarrow x = 26$ bulunur. Büyük sayı $96 - 26 = 70$''tir ($3 \cdot 26 - 8 = 70$).',
   'B şıkkı (26), küçük sayıyı ($x = 26$) bulup sorunun büyük sayıyı sorduğunu gözden kaçıran adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-07-015 · doğrulandı
  ('32abd2ee-efc0-5a29-b8bb-6f3b82a61174'::uuid, 'Matematik & Geometri', 'Denklem Çözme ve Sayı-Kesir Problemleri', 'multiple_choice', 2,
   'Bir bilet kuyruğunda Ayşe baştan $14$. sırada, Burak ise sondan $19$. sıradadır.
Ayşe ile Burak arasında $6$ kişi bulunduğuna ve Burak gişeye Ayşe''den daha yakın olduğuna göre bu kuyrukta toplam kaç kişi vardır?',
   '{"options":["39","33","27","26","25"],"correctIndex":4}'::jsonb,
   'Burak gişeye daha yakın olduğu için baştan sıralamada Burak, Ayşe''nin önündedir. Ayşe baştan $14$. sırada olup Burak ile arasında $6$ kişi bulunduğundan Burak baştan $14 - 6 - 1 = 7$. sıradadır. Burak aynı zamanda sondan $19$. sırada olduğundan kuyruktaki toplam kişi sayısı $7 + 19 - 1 = 25$ bulunur (kısaca $14 + 19 - 6 - 2 = 25$).',
   'A şıkkı (39), gişeye yakınlık bilgisini gözden kaçırıp Ayşe''yi önde sanarak $14 + 19 + 6 = 39$ toplayan adayı; C şıkkı (27) ise Ayşe ve Burak''ın kendilerini ikişer kez sayıp $-2$''yi unutanları yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-07-016 · doğrulandı
  ('50be3c8c-e95e-51af-8096-7e0bc8540490'::uuid, 'Matematik & Geometri', 'Denklem Çözme ve Sayı-Kesir Problemleri', 'multiple_choice', 2,
   'Bir otelde yalnızca $2$ yataklı ve $3$ yataklı olmak üzere toplam $28$ oda bulunmaktadır.
Bu odalardaki toplam yatak sayısı $68$ olduğuna göre otelde kaç tane $3$ yataklı oda vardır?',
   '{"options":["10","14","16","12","18"],"correctIndex":3}'::jsonb,
   '$3$ yataklı oda sayısına $x$ denirse $2$ yataklı oda sayısı $28 - x$ olur. Toplam yatak sayısı denklemi kurulur: $3x + 2(28 - x) = 68 \Rightarrow 3x + 56 - 2x = 68 \Rightarrow x = 12$ bulunur.',
   'C şıkkı (16), $3$ yataklı oda sayısı ($12$) yerine $2$ yataklı oda sayısını ($28 - 12 = 16$) işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-07-017 · doğrulandı
  ('b4b778dd-16c1-5ba2-b0a5-f2907e4e2936'::uuid, 'Matematik & Geometri', 'Denklem Çözme ve Sayı-Kesir Problemleri', 'multiple_choice', 2,
   'Boyları eşit iki mumdan birincisi $4$ saatte, ikincisi ise $6$ saatte tamamen yanarak bitmektedir.
İki mum aynı anda yakıldıktan kaç saat sonra birinin boyu diğerinin boyunun $2$ katı olur?',
   '{"options":["2","3","3,5","4","4,5"],"correctIndex":1}'::jsonb,
   'Mumların başlangıç boyu $1$ birim kabul edilsin. $t$ saat sonunda birinci mumun kalan boyu $1 - \dfrac{t}{4}$, ikinci mumun kalan boyu $1 - \dfrac{t}{6}$ olur. Daha yavaş yanan ikinci mum daha uzun olacağından $1 - \dfrac{t}{6} = 2\left(1 - \dfrac{t}{4}\right)$ yazılır. Buradan $1 - \dfrac{t}{6} = 2 - \dfrac{t}{2} \Rightarrow \dfrac{t}{2} - \dfrac{t}{6} = 1 \Rightarrow \dfrac{t}{3} = 1 \Rightarrow t = 3$ saat bulunur.',
   'A şıkkı (2), kalan boy yerine eriyen boyların oranını alan ya da $4$ ile $6$''nın ortalamasını seçmeye yönelen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-07-018 · doğrulandı
  ('072fa4b0-27a9-57be-9ffa-26907a4bd19a'::uuid, 'Matematik & Geometri', 'Denklem Çözme ve Sayı-Kesir Problemleri', 'multiple_choice', 1,
   'Bir kitabın $\dfrac{3}{7}$''sini okuyan bir öğrenci $36$ sayfa daha okursa kitabın tam yarısını okumuş olacaktır.
Buna göre bu kitap kaç sayfadır?',
   '{"options":["252","336","420","504","588"],"correctIndex":3}'::jsonb,
   'Kitabın tamamına $S$ sayfa denir. Yarısına ($\dfrac{1}{2}$) ulaşmak için $\dfrac{1}{2}S - \dfrac{3}{7}S = 36$ sayfa daha okunmalıdır. Payda eşitlenirse $\dfrac{7 - 6}{14}S = 36 \Rightarrow \dfrac{S}{14} = 36 \Rightarrow S = 36 \cdot 14 = 504$ sayfa bulunur.',
   'A şıkkı (252), kitabın tamamını ($504$) değil yarısını ($252$) işaretleyen veya payda farkını $\frac{1}{7}$ sanan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-07-019 · doğrulandı
  ('14641e16-5cd3-50db-b5d1-2cc749bc5ae8'::uuid, 'Matematik & Geometri', 'Denklem Çözme ve Sayı-Kesir Problemleri', 'multiple_choice', 2,
   'Bir grup arkadaş fiyatı $720$ TL olan bir hediyeyi aralarında eşit olarak paylaşmaya karar veriyor. Gruptan $3$ kişi vazgeçince kalanların her biri başlangıçta ödeyeceği tutardan $20$ TL daha fazla ödemek zorunda kalıyor.
Buna göre başlangıçta grupta kaç kişi vardı?',
   '{"options":["12","9","10","15","18"],"correctIndex":0}'::jsonb,
   'Başlangıçtaki kişi sayısına $n$ denirse kişi başı düşen tutar $\dfrac{720}{n}$ TL''den $\dfrac{720}{n - 3}$ TL''ye çıkar. Aradaki fark $20$ TL olduğundan $\dfrac{720}{n - 3} - \dfrac{720}{n} = 20 \Rightarrow \dfrac{720 \cdot 3}{n(n - 3)} = 20 \Rightarrow n(n - 3) = 108$ elde edilir. Aralarında $3$ fark bulunan iki pozitif tam sayının çarpımı $12 \cdot 9 = 108$ olduğundan $n = 12$ bulunur.',
   'B şıkkı (9), başlangıçtaki kişi sayısı ($12$) yerine $3$ kişi ayrıldıktan sonra grupta kalan kişi sayısını ($9$) işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-07-020 · doğrulandı
  ('36e5ee1c-2302-54d4-a177-0fa3a56f41ad'::uuid, 'Matematik & Geometri', 'Denklem Çözme ve Sayı-Kesir Problemleri', 'multiple_choice', 2,
   '$$a + b = 17$$
$$b + c = 21$$
$$a + c = 24$$
denklem sistemini sağlayan $c$ sayısı kaçtır?',
   '{"options":["7","10","14","17","21"],"correctIndex":2}'::jsonb,
   'Üç denklem taraf tarafa toplanırsa $2(a + b + c) = 17 + 21 + 24 = 62 \Rightarrow a + b + c = 31$ elde edilir. İlk denklem ($a + b = 17$) toplamdan çıkarılırsa $c = 31 - 17 = 14$ bulunur.',
   'B şıkkı (10) veya A şıkkı (7), $c$ yerine $a$''yı ($31 - 21 = 10$) ya da $b$''yi ($31 - 24 = 7$) işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-07-021 · doğrulandı
  ('72b1a5e2-cbce-58b8-a8c9-fa2434ec2642'::uuid, 'Matematik & Geometri', 'Denklem Çözme ve Sayı-Kesir Problemleri', 'multiple_choice', 3,
   'Ali, Burak ve Cem''in toplam $144$ bilyesi vardır. Ali bilyelerinin $\dfrac{1}{4}$''ünü Burak''a, ardından Burak o anda elinde bulunan bilyelerin $\dfrac{1}{3}$''ünü Cem''e verdiğinde üçünün bilye sayıları birbirine eşit oluyor.
Buna göre başlangıçta Burak''ın kaç bilyesi vardı?',
   '{"options":["24","48","64","72","56"],"correctIndex":4}'::jsonb,
   'Son durumda üçünün de eşit ve $\dfrac{144}{3} = 48$ bilyesi vardır. Sondan başa doğru gidilir:
Ali bilyelerinin $\dfrac{1}{4}$''ünü verdiğinde elinde $\dfrac{3}{4}$''ü ($48$) kalmıştır; $\dfrac{3}{4}A = 48 \Rightarrow A = 64$. Yani Ali, Burak''a $64 - 48 = 16$ bilye vermiştir.
Burak, Ali''den $16$ bilye aldıktan sonra elindekilerin $\dfrac{1}{3}$''ünü verdiğinde $\dfrac{2}{3}$''ü ($48$) kalmıştır: $\dfrac{2}{3}(B + 16) = 48 \Rightarrow B + 16 = 72 \Rightarrow B = 56$ bulunur.',
   'D şıkkı (72), Burak''ın Cem''e vermeden önceki bilye sayısını ($72$) bulup Ali''den aldığı $16$ bilyeyi düşmeyi unutan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-07-022 · doğrulandı
  ('9f90f856-9a64-5360-bb58-b5f63f9dd3b4'::uuid, 'Matematik & Geometri', 'Denklem Çözme ve Sayı-Kesir Problemleri', 'multiple_choice', 1,
   'Boş bir kumbaraya ilk gün $10$ TL, sonraki her gün ise bir önceki günden $5$ TL daha fazla para atan bir kişi, $8$. günün sonunda kumbarada toplam kaç TL biriktirmiş olur?',
   '{"options":["45","180","200","220","240"],"correctIndex":3}'::jsonb,
   'Günlük atılan tutarlar $10, 15, 20, \ldots$ şeklinde $5$''er artan $8$ terimli bir dizidir. $8$. gün atılan tutar $10 + 7 \cdot 5 = 45$ TL''dir. Terim toplamı formülünden $\dfrac{\text{İlk terim} + \text{Son terim}}{2} \cdot \text{Terim sayısı} = \dfrac{10 + 45}{2} \cdot 8 = 55 \cdot 4 = 220$ TL bulunur.',
   'E şıkkı (240), $8$. gün atılan tutarı $10 + 8 \cdot 5 = 50$ TL sanarak toplamı $\frac{10 + 50}{2} \cdot 8 = 240$ bulan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-07-023 · doğrulandı
  ('91ba1dfd-5780-5460-9208-c2986c53da1f'::uuid, 'Matematik & Geometri', 'Denklem Çözme ve Sayı-Kesir Problemleri', 'multiple_choice', 2,
   '$\dfrac{3}{8}$''i su ile dolu olan bir depodan $30$ litre su boşaltıldığında deponun $\dfrac{1}{4}$''ü dolu kalmaktadır.
Buna göre son durumda depoyu tamamen doldurmak için kaç litre daha su eklemek gerekir?',
   '{"options":["60","150","180","210","240"],"correctIndex":2}'::jsonb,
   'Deponun tamamı $V$ litre olsun. Boşaltılan su miktarı deponun $\dfrac{3}{8} - \dfrac{1}{4} = \dfrac{1}{8}$''ine eşittir: $\dfrac{1}{8}V = 30 \Rightarrow V = 240$ litre. Son durumda deponun $\dfrac{1}{4}$''ü ($60$ litre) dolu olduğundan depoyu tamamen doldurmak için $240 - 60 = 180$ litre daha su gerekir.',
   'E şıkkı (240), deponun toplam hacmini ($240$ litre) bulduktan sonra sorunun son durumda kalan boş kısmı sorduğunu unutup $240$''ı işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-07-024 · doğrulandı
  ('cb442750-33c6-5737-b817-5a6dd06407b3'::uuid, 'Matematik & Geometri', 'Denklem Çözme ve Sayı-Kesir Problemleri', 'multiple_choice', 2,
   '$10$ arkadaş birlikte yedikleri yemeğin hesabını eşit paylaşmayı planlamaktadır. Ancak içlerinden $2$ kişi cüzdanını unuttuğu için kalan $8$ kişi kendi paylarına ek olarak $35$''er TL daha fazla ödeyerek hesabı kapatmıştır.
Buna göre toplam yemek hesabı kaç TL''dir?',
   '{"options":["1.400","1.120","1.200","1.500","1.750"],"correctIndex":0}'::jsonb,
   'Kalan $8$ kişinin fazladan ödediği toplam tutar $8 \cdot 35 = 280$ TL''dir; bu tutar cüzdanını unutan $2$ kişinin ödemesi gereken paya eşittir. Dolayısıyla başlangıçta bir kişiye düşen pay $\dfrac{280}{2} = 140$ TL''dir. Toplam hesap $10 \cdot 140 = 1.400$ TL bulunur.',
   'B şıkkı (1.120), kişi başı $140$ TL''yi bulduktan sonra $10$ kişi yerine $8$ kişiyle çarpan adayı yakalar. Hesap başlangıçtaki $10$ kişilik grubun toplam tutarıdır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-07-025 · doğrulandı
  ('e9c857cf-f491-599b-92b5-e491981e31fc'::uuid, 'Matematik & Geometri', 'Denklem Çözme ve Sayı-Kesir Problemleri', 'multiple_choice', 3,
   '$30$ soruluk bir yarışmada her doğru cevaba $+5$ puan verilmekte, her yanlış cevaptan $2$ puan ve boş bırakılan her sorudan $1$ puan silinmektedir.
Bu yarışmada $4$ soruyu boş bırakıp toplam $91$ puan alan bir yarışmacı kaç soruyu yanlış yanıtlamıştır?',
   '{"options":["21","8","7","6","5"],"correctIndex":4}'::jsonb,
   '$4$ soru boş bırakıldığına göre yanıtlanan soru sayısı $30 - 4 = 26$''dır. Yanlış sayısına $y$ denirse doğru sayısı $26 - y$ olur. Boşlardan $4 \cdot 1 = 4$ puan silineceğinden puan denklemi yazılır:
$5(26 - y) - 2y - 4 = 91 \Rightarrow 130 - 5y - 2y = 95 \Rightarrow 7y = 35 \Rightarrow y = 5$ bulunur.',
   'A şıkkı (21), yanlış sayısı yerine doğru sayısını ($26 - 5 = 21$) işaretleyen adayı; D şıkkı (6) ise boş sorular için silinen $4$ puanı denklemde hesaba katmayanları yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-07-026 · doğrulandı
  ('59aaf8b3-2e5c-58d2-aa02-d236f24124bb'::uuid, 'Matematik & Geometri', 'Denklem Çözme ve Sayı-Kesir Problemleri', 'multiple_choice', 2,
   'Bir çiftçi tarlasının $\dfrac{1}{3}$''üne buğday, $\dfrac{2}{5}$''ine arpa ve geriye kalan $16$ dönümlük kısmına ise mısır ekmiştir.
Buna göre bu çiftçinin arpa ektiği alan kaç dönümdür?',
   '{"options":["20","24","30","36","60"],"correctIndex":1}'::jsonb,
   'Buğday ve arpa ekili alanların toplam oranı $\dfrac{1}{3} + \dfrac{2}{5} = \dfrac{5 + 6}{15} = \dfrac{11}{15}$''tir. Geriye tarlanın $1 - \dfrac{11}{15} = \dfrac{4}{15}$''i kalır ve bu kısım $16$ dönüme eşittir. Tarlanın tamamı $16 \cdot \dfrac{15}{4} = 60$ dönümdür. Arpa ekili alan $60 \cdot \dfrac{2}{5} = 24$ dönüm bulunur.',
   'E şıkkı (60), tarlanın tamamını bulup arpa payını hesaplamayı unutan adayı; A şıkkı (20) ise buğday ekili alanı ($60 \cdot \frac{1}{3} = 20$) işaretleyenleri yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-07-027 · doğrulandı
  ('8a7715bf-6743-5a3a-8cef-7a0ce7b4647e'::uuid, 'Matematik & Geometri', 'Denklem Çözme ve Sayı-Kesir Problemleri', 'multiple_choice', 1,
   '$a$ bir gerçel sayı olmak üzere
$$\dfrac{2x - a}{3} + \dfrac{x + a}{2} = 5$$
denklemini sağlayan $x$ değeri $4$ olduğuna göre $a$ kaçtır?',
   '{"options":["$-4$","$-2$","$2$","$4$","$6$"],"correctIndex":2}'::jsonb,
   'Denklemi sağlayan $x = 4$ değeri yerine yazılıp payda eşitlenir ($6$ üzerinden):
$$\dfrac{8 - a}{3} + \dfrac{4 + a}{2} = 5 \Rightarrow 2(8 - a) + 3(4 + a) = 30$$
Parantezler açılırsa $16 - 2a + 12 + 3a = 30 \Rightarrow 28 + a = 30 \Rightarrow a = 2$ bulunur.',
   'A şıkkı ($-4$) veya B şıkkı ($-2$), $-2a + 3a$ işlemini toplama yönüyle karıştırıp $28 - a = 30$ yazarak işaret hatası yapan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-07-028 · doğrulandı
  ('161456ca-7f74-5a70-863a-69fadf1f62c0'::uuid, 'Matematik & Geometri', 'Denklem Çözme ve Sayı-Kesir Problemleri', 'multiple_choice', 1,
   'Bir kargo şirketi gönderilen paketlerin ağırlığı ilk $3$ kg için sabit $45$ TL, $3$ kg''ı aşan her $1$ kg için ise $12$ TL ek ücret almaktadır.
Toplam $117$ TL kargo ücreti ödeyen bir müşterinin paketi kaç kilogramdır?',
   '{"options":["6","8","9","10","12"],"correctIndex":2}'::jsonb,
   'Paketin ağırlığı $x$ kg ($x > 3$) olsun. İlk $3$ kg için $45$ TL, kalan $(x - 3)$ kg için ise kilogram başına $12$ TL ödenir:
$$45 + 12(x - 3) = 117 \Rightarrow 12(x - 3) = 72 \Rightarrow x - 3 = 6 \Rightarrow x = 9\text{ kg}$$
bulunur.',
   'A şıkkı ($6$), $3$ kg''ı aşan miktar için bulduğu $x - 3 = 6$ sonucunu doğrudan paketin toplam ağırlığı sanıp başlangıçtaki $3$ kilogramı eklemeyi unutan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-07-029 · doğrulandı
  ('3b1dcb18-cd88-5a54-b738-fbbbefedb090'::uuid, 'Matematik & Geometri', 'Denklem Çözme ve Sayı-Kesir Problemleri', 'multiple_choice', 2,
   'Ali''nin parası Burak''ın parasının $5$ katıdır. Ali, Burak''a $60$ TL verirse ikisinin paraları eşit olmaktadır.
Buna göre başlangıçta ikisinin paraları toplamı kaç TL''dir?',
   '{"options":["90","150","180","240","300"],"correctIndex":2}'::jsonb,
   'Burak''ın parasına $B$, Ali''nin parasına $5B$ denirse transfer sonrası $5B - 60 = B + 60 \Rightarrow 4B = 120 \Rightarrow B = 30$ TL olur. Ali''nin parası $5 \cdot 30 = 150$ TL olduğundan ikisinin başlangıçtaki toplam parası $30 + 150 = 180$ TL bulunur.',
   'A şıkkı (90), $5B - 60 = B$ denklemini kurarak Burak''ın da $60$ TL kazandığını unutan ($4B = 60 \Rightarrow B = 15 \Rightarrow 6B = 90$) adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-07-030 · doğrulandı
  ('124e76a7-b021-5c7f-a8a7-7ade9518d9d0'::uuid, 'Matematik & Geometri', 'Denklem Çözme ve Sayı-Kesir Problemleri', 'multiple_choice', 2,
   'Düz bir tahta çubuk $6$ eş parçaya bölünmek istendiğinde kesim işlemi toplam $30$ saniye sürmektedir.
Aynı çubuk aynı hızla $10$ eş parçaya bölünmek istenseydi işlem toplam kaç saniye sürerdi?',
   '{"options":["45","48","50","60","54"],"correctIndex":4}'::jsonb,
   'Bir çubuğu $n$ eş parçaya ayırmak için $n - 1$ kesim yapılır. $6$ eş parça için $6 - 1 = 5$ kesim yapıldığından bir kesim $\dfrac{30}{5} = 6$ saniye sürer. $10$ eş parça için $10 - 1 = 9$ kesim gerekeceğinden toplam süre $9 \cdot 6 = 54$ saniye bulunur.',
   'C şıkkı (50), kesim sayısı yerine doğrudan parça sayısıyla orantı kurup $\dfrac{30}{6} \cdot 10 = 50$ saniye bulan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-07-031 · doğrulandı
  ('a2035a50-9f05-5ba0-abc9-417823cf0cec'::uuid, 'Matematik & Geometri', 'Denklem Çözme ve Sayı-Kesir Problemleri', 'multiple_choice', 2,
   'Deposunun $\dfrac{2}{7}$''si yakıtla dolu olan bir araç, deposundaki yakıtın $\dfrac{1}{4}$''ünü harcadıktan sonra depoya $22$ litre yakıt doldurunca deponun tam yarısı dolmaktadır.
Buna göre bu aracın yakıt deposu toplam kaç litre yakıt alır?',
   '{"options":["63","77","84","98","112"],"correctIndex":1}'::jsonb,
   'Deponun tamamına $V$ denir. Başlangıçtaki $\dfrac{2}{7}V$ yakıtın $\dfrac{1}{4}$''ü harcanınca geriye $\dfrac{2}{7}V \cdot \dfrac{3}{4} = \dfrac{3}{14}V$ kalır. Üzerine $22$ litre eklendiğinde deponun yarısına ulaşıldığından $\dfrac{3}{14}V + 22 = \dfrac{1}{2}V \Rightarrow \left(\dfrac{7}{14} - \dfrac{3}{14}\right)V = 22 \Rightarrow \dfrac{4}{14}V = 22 \Rightarrow \dfrac{2}{7}V = 22 \Rightarrow V = 77$ litre bulunur.',
   'C şıkkı (84) veya A şıkkı (63), harcanan $\frac{1}{4}$''ü depodaki mevcut yakıt yerine deponun tamamı ($V$) üzerinden çıkarıp payda hatası yapan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-07-032 · doğrulandı
  ('f301037f-1b20-5e24-aa8c-c4209b246f56'::uuid, 'Matematik & Geometri', 'Denklem Çözme ve Sayı-Kesir Problemleri', 'multiple_choice', 1,
   'Bir miktar ceviz $8$ çocuğa eşit olarak paylaştırılacaktır. Eğer gruptaki çocuk sayısı $2$ eksik olsaydı her çocuk $5$ ceviz daha fazla alacaktı.
Buna göre toplam kaç ceviz vardır?',
   '{"options":["80","96","120","144","160"],"correctIndex":2}'::jsonb,
   'Toplam ceviz sayısına $C$ denirse $8$ çocuk yerine $6$ çocuğa bölündüğünde kişi başı düşen fark $5$''tir: $\dfrac{C}{6} - \dfrac{C}{8} = 5$. Payda eşitlenirse $\dfrac{4C - 3C}{24} = 5 \Rightarrow \dfrac{C}{24} = 5 \Rightarrow C = 120$ ceviz bulunur.',
   'A şıkkı (80), $2$ çocuk eksikliğinde her çocuğun $5$ ceviz fazla almasını $8 \cdot 5 = 40$ üzerinden yanlış yorumlayan veya paydaları hatalı eşitleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-07-033 · doğrulandı
  ('16ba7daa-a2d9-5a38-8174-b507ae63f489'::uuid, 'Matematik & Geometri', 'Denklem Çözme ve Sayı-Kesir Problemleri', 'multiple_choice', 2,
   'Bir sınıftaki erkek öğrencilerin sayısı, kız öğrencilerin sayısının $\dfrac{2}{3}$''ü kadardır.
Sınıfa $4$ erkek öğrenci katılıp sınıftan $2$ kız öğrenci ayrılınca erkek ve kız öğrenci sayıları eşit olduğuna göre başlangıçta sınıfta toplam kaç öğrenci vardı?',
   '{"options":["30","24","28","32","35"],"correctIndex":0}'::jsonb,
   'Başlangıçta erkekler $2k$, kızlar $3k$ kişi olsun. Değişim sonrası $2k + 4 = 3k - 2 \Rightarrow k = 6$ bulunur. Başlangıçtaki toplam öğrenci sayısı $2k + 3k = 5k = 5 \cdot 6 = 30$''dur.',
   'D şıkkı (32), başlangıçtaki öğrenci sayısı ($30$) yerine $4$ erkek gelip $2$ kız gittikten sonraki sınıf mevcudunu ($30 + 4 - 2 = 32$) işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-07-034 · doğrulandı
  ('5de3aeaa-d113-55aa-9eb7-4e8a9f3ebf50'::uuid, 'Matematik & Geometri', 'Denklem Çözme ve Sayı-Kesir Problemleri', 'multiple_choice', 2,
   'Bir kumaş yıkandığında boyunun $\dfrac{1}{10}$''u kadar çekip kısalmaktadır.
Yıkandıktan sonraki boyu $36$ metre olan bir kumaşın yıkanmadan önceki boyu kaç metredir?',
   '{"options":["39,6","38","39","40","42"],"correctIndex":3}'::jsonb,
   'İlk boya $L$ metre denirse $\dfrac{1}{10}$''u kısaldığında geriye $L - \dfrac{L}{10} = \dfrac{9}{10}L$ kalır. $\dfrac{9}{10}L = 36 \Rightarrow L = \dfrac{36 \cdot 10}{9} = 40$ metre bulunur.',
   'A şıkkı (39,6), kısalma oranını ilk boy yerine yıkandıktan sonraki $36$ metreye uygulayıp $36 + 3{,}6 = 39{,}6$ hesaplayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-07-035 · doğrulandı
  ('adf2bf7f-0da7-516d-967e-a315cc0ed3df'::uuid, 'Matematik & Geometri', 'Denklem Çözme ve Sayı-Kesir Problemleri', 'multiple_choice', 2,
   'Aylık geliri $24.000$ TL olan bir kişi, her ay sabit tutarda harcama yapıp kalan parasını biriktirmektedir.
$6$ ayın sonunda biriktirdiği toplam para, $1$ aylık giderinin $2$ katına eşit olduğuna göre bu kişinin aylık gideri kaç TL''dir?',
   '{"options":["6.000","12.000","15.000","16.000","18.000"],"correctIndex":4}'::jsonb,
   'Aylık gidere $g$ TL denirse aylık birikim $24.000 - g$ olur. $6$ aylık toplam birikim $6(24.000 - g) = 2g$ olarak veriliyor. Buradan $144.000 - 6g = 2g \Rightarrow 8g = 144.000 \Rightarrow g = 18.000$ TL bulunur.',
   'A şıkkı (6.000), aylık gideri ($18.000$ TL) bulmak yerine aylık birikimi ($24.000 - 18.000 = 6.000$ TL) işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-07-036 · doğrulandı
  ('ea80f1c4-86b8-5964-8ecd-20bb37ffe130'::uuid, 'Matematik & Geometri', 'Denklem Çözme ve Sayı-Kesir Problemleri', 'multiple_choice', 3,
   'Bir kuruyemişçi elindeki fındıkların $\dfrac{1}{3}$''ünü $400$ gramlık paketlere, kalan fındıkların tamamını ise $500$ gramlık paketlere hiç artmayacak biçimde dolduruyor.
Toplam $52$ paket elde ettiğine göre satıcının elinde toplam kaç kg fındık vardır?',
   '{"options":["18","24","27","30","36"],"correctIndex":1}'::jsonb,
   'Toplam fındık miktarına $3x$ kg ($3.000x$ gram) denirse $\dfrac{1}{3}$''ü olan $1.000x$ gramdan $\dfrac{1.000x}{400} = 2{,}5x$ paket, kalan $2.000x$ gramdan ise $\dfrac{2.000x}{500} = 4x$ paket çıkar. Toplam paket sayısı $2{,}5x + 4x = 6{,}5x = 52 \Rightarrow x = 8$ bulunur. Toplam fındık $3 \cdot 8 = 24$ kg''dır.',
   'A şıkkı (18) veya E şıkkı (36), gram-kilogram dönüşümünde ya da $2{,}5x$ katsayısında ondalık hata yapıp $x$''i yanlış bulan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-07-037 · doğrulandı
  ('e86d1889-d196-5596-a803-63b019c42af9'::uuid, 'Matematik & Geometri', 'Denklem Çözme ve Sayı-Kesir Problemleri', 'multiple_choice', 1,
   '$$\dfrac{1}{x - 2} + \dfrac{3}{2x - 4} = \dfrac{5}{4}$$
denklemini sağlayan $x$ gerçel sayısı kaçtır?',
   '{"options":["2","3","4","5","6"],"correctIndex":2}'::jsonb,
   'İkinci kesrin paydası $2x - 4 = 2(x - 2)$ biçiminde çarpanlarına ayrılır ve ilk kesir $2$ ile genişletilir: $\dfrac{2}{2(x - 2)} + \dfrac{3}{2(x - 2)} = \dfrac{5}{4} \Rightarrow \dfrac{5}{2(x - 2)} = \dfrac{5}{4}$. Paylar eşit olduğundan paydalar da eşitlenir: $2(x - 2) = 4 \Rightarrow x - 2 = 2 \Rightarrow x = 4$ bulunur.',
   'A şıkkı (2), $x - 2 = 2$ adımında $2$''yi karşıya geçirmeyi unutan adayı yakalar ($x = 2$ zaten paydayı sıfır yapar).',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-07-038 · doğrulandı
  ('e3f49900-927e-55d7-a90b-e4fcd8830555'::uuid, 'Matematik & Geometri', 'Denklem Çözme ve Sayı-Kesir Problemleri', 'multiple_choice', 2,
   'Bir kutlamadaki herkes birbirine birer adet hediye verdiğinde toplam $90$ hediye verilmiş oluyor.
Buna göre bu kutlamada kaç kişi vardır?',
   '{"options":["10","9","15","18","45"],"correctIndex":0}'::jsonb,
   '$n$ kişinin bulunduğu bir ortamda her kişi kendisi dışındaki $n - 1$ kişiye birer hediye vereceğinden toplam hediye sayısı $n(n - 1)$''dir (tokalaşmadan farklı olarak iki yönlüdür). $n(n - 1) = 90 = 10 \cdot 9$ olduğundan $n = 10$ kişi bulunur.',
   'E şıkkı (45) veya B şıkkı (9), hediyeleşmeyi tokalaşma formülü $\dfrac{n(n - 1)}{2} = 90$ gibi kurmaya çalışan ya da $90 \div 2 = 45$ işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-07-039 · doğrulandı
  ('d911f2f7-69ad-5e7e-9634-11a799520294'::uuid, 'Matematik & Geometri', 'Denklem Çözme ve Sayı-Kesir Problemleri', 'multiple_choice', 3,
   'İki sepette toplam $120$ elma vardır. Birinci sepetteki elmaların $\dfrac{1}{4}$''ü ikinci sepete aktarılıyor; ardından ikinci sepette oluşan elmaların $\dfrac{1}{3}$''ü birinci sepete geri aktarılıyor. Son durumda iki sepetteki elma sayıları eşit olduğuna göre başlangıçta birinci sepette kaç elma vardı?',
   '{"options":["30","50","60","80","40"],"correctIndex":4}'::jsonb,
   'Son durumda her iki sepette $\dfrac{120}{2} = 60$''ar elma vardır. Sondan başa doğru gidilir:
İkinci sepet, içindekilerin $\dfrac{1}{3}$''ünü verdikten sonra geriye $\dfrac{2}{3}$''ü ($60$) kalmıştır: $\dfrac{2}{3} \cdot S_2 = 60 \Rightarrow S_2 = 90$. Yani ikinci sepet birinci sepete $90 - 60 = 30$ elma vermiştir; vermeden önce birinci sepette $60 - 30 = 30$ elma vardı.
Birinci sepet başlangıçtaki elmalarının $\dfrac{1}{4}$''ünü verdiğinde geriye $\dfrac{3}{4}$''ü ($30$) kalmıştır: $\dfrac{3}{4} \cdot B_1 = 30 \Rightarrow B_1 = 40$ elma bulunur.',
   'C şıkkı (60), son durumda eşitlik olduğu için başlangıçta da eşit elma olduğunu sanan; D şıkkı (80) ise ikinci sepetin başlangıç değerini seçen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-07-040 · doğrulandı
  ('0d42c150-1af1-5910-9ff0-b3d7a0d6310e'::uuid, 'Matematik & Geometri', 'Denklem Çözme ve Sayı-Kesir Problemleri', 'multiple_choice', 3,
   'Bir tiyatro gösterisinde tam bilet $120$ TL, öğrenci bileti $80$ TL''dir.
$35$ kişilik bir izleyici grubu biletler için toplam $3.400$ TL ödediğine göre gruptaki tam bilet alan kişi sayısı, öğrenci bileti alan kişi sayısından kaç eksiktir?',
   '{"options":["15","20","10","5","8"],"correctIndex":3}'::jsonb,
   'Tam bilet alanların sayısına $t$ denirse öğrenci bileti alanların sayısı $35 - t$ olur. Toplam tutar denklemi kurulur: $120t + 80(35 - t) = 3.400 \Rightarrow 120t + 2.800 - 80t = 3.400 \Rightarrow 40t = 600 \Rightarrow t = 15$ bulunur. Öğrenci bileti alanlar $35 - 15 = 20$ kişidir. Fark $20 - 15 = 5$ olur.',
   'A şıkkı (15) veya B şıkkı (20), bilet adetlerinden birini bulup iki grup arasındaki farkı almayı unutan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-07-041 · doğrulandı
  ('6dfd483d-e30e-5635-abd3-06398e4a2ad5'::uuid, 'Matematik & Geometri', 'Denklem Çözme ve Sayı-Kesir Problemleri', 'multiple_choice', 1,
   'İçinde $45$ yolcu bulunan bir otobüsten ilk durakta yolcuların $\dfrac{2}{5}$''i iniyor. İkinci durakta ise kalan yolcuların $\dfrac{1}{3}$''ü kadar yolcu otobüse biniyor.
Buna göre ikinci duraktan sonra otobüste toplam kaç yolcu vardır?',
   '{"options":["32","36","39","42","45"],"correctIndex":1}'::jsonb,
   'İlk durakta otobüsten $45 \cdot \dfrac{2}{5} = 18$ yolcu iner ve geriye $45 - 18 = 27$ yolcu kalır. İkinci durakta kalanların $\dfrac{1}{3}$''ü olan $27 \cdot \dfrac{1}{3} = 9$ yolcu biner. Son durumda otobüste $27 + 9 = 36$ yolcu vardır.',
   'D şıkkı ($42$), ikinci durakta binen yolcu sayısını kalan $27$ yerine başlangıçtaki $45$ yolcunun $\dfrac{1}{3}$''ü ($15$ kişi) alarak $27 + 15 = 42$ hesaplayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-07-042 · doğrulandı
  ('2ffe0b1c-f65b-5040-b664-b5bfce81ac64'::uuid, 'Matematik & Geometri', 'Denklem Çözme ve Sayı-Kesir Problemleri', 'multiple_choice', 1,
   'İki kutuda toplam $84$ kalem vardır. Birinci kutudan $12$ kalem alınıp ikinci kutuya konulduğunda iki kutudaki kalem sayıları birbirine eşit oluyor.
Buna göre başlangıçta ikinci kutuda kaç kalem vardır?',
   '{"options":["30","36","42","48","54"],"correctIndex":0}'::jsonb,
   'Toplam kalem sayısı değişmediğinden son durumda her iki kutuda da $\dfrac{84}{2} = 42$ kalem bulunur. İkinci kutuya $12$ kalem eklenerek $42$ olduğuna göre başlangıçta ikinci kutuda $42 - 12 = 30$ kalem vardır.',
   'C şıkkı ($42$) eşitleme sonrasındaki sayıyı, E şıkkı ($54$) ise birinci kutudaki başlangıç sayısını ($42 + 12 = 54$) işaretleyen dikkatsiz adayları yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-07-043 · doğrulandı
  ('275f6e64-9ecd-5b51-8ab0-4affdbc89537'::uuid, 'Matematik & Geometri', 'Denklem Çözme ve Sayı-Kesir Problemleri', 'multiple_choice', 2,
   'Bir öğrenci bir kitabın birinci gün $\dfrac{2}{5}$''ini, ikinci gün ise kalan sayfaların $\dfrac{1}{4}$''ünü okuyor. Geriye okunacak $54$ sayfa kaldığına göre bu öğrenci ikinci gün kaç sayfa kitap okumuştur?',
   '{"options":["12","15","18","24","30"],"correctIndex":2}'::jsonb,
   'Kitabın tamamına $20k$ sayfa diyelim. Birinci gün $20k \cdot \dfrac{2}{5} = 8k$ sayfa okunur, geriye $12k$ sayfa kalır. İkinci gün kalanın $\dfrac{1}{4}$''ü olan $12k \cdot \dfrac{1}{4} = 3k$ sayfa okunur ve geriye $12k - 3k = 9k$ sayfa kalır. $9k = 54 \Rightarrow k = 6$ olduğundan ikinci gün okunan sayfa sayısı $3 \cdot 6 = 18$''dir.',
   'E şıkkı ($30$), ikinci gün okunan oranı bütün kitabın $\dfrac{1}{4}$''ü sanıp $\dfrac{2}{5} + \dfrac{1}{4} = \dfrac{13}{20}$ toplayarak hesap yapan adayı; A şıkkı ($12$) ise denklem hatası yapanları yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-07-044 · doğrulandı
  ('7159acc3-1c9b-5ede-8371-726c8767b39d'::uuid, 'Matematik & Geometri', 'Denklem Çözme ve Sayı-Kesir Problemleri', 'multiple_choice', 2,
   'Bir giyim mağazasında $1$ pantolonun fiyatı, $1$ gömleğin fiyatının $2$ katından $100$ TL fazladır; $1$ ceketin fiyatı ise $1$ pantolon ile $1$ gömleğin toplam fiyatına eşittir.
Bu mağazadan $1$ ceket, $1$ pantolon ve $2$ gömlek alan bir müşteri toplam $3.000$ TL ödediğine göre, $1$ gömleğin fiyatı kaç TL''dir?',
   '{"options":["300","320","360","400","450"],"correctIndex":3}'::jsonb,
   '$1$ gömleğin fiyatı $g$ TL olsun. Buna göre $1$ pantolon $2g + 100$ TL, $1$ ceket ise $(2g + 100) + g = 3g + 100$ TL olur. Toplam ödeme denklemi:
$$(3g + 100) + (2g + 100) + 2g = 3.000 \Rightarrow 7g + 200 = 3.000 \Rightarrow 7g = 2.800 \Rightarrow g = 400\text{ TL}$$
bulunur.',
   'E şıkkı ($450$) veya C şıkkı ($360$), müşteri $2$ gömlek aldığı hâlde toplam denklemine yalnızca $1$ gömlek ekleyip $6g + 200$ kuran adayın bölme hatasından kaynaklanır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-07-045 · doğrulandı
  ('ad47eaab-081b-52e4-a14d-8f0ab40b8697'::uuid, 'Matematik & Geometri', 'Denklem Çözme ve Sayı-Kesir Problemleri', 'multiple_choice', 2,
   'A ve B kolilerinde başlangıçta toplam $135$ adet ürün bulunmaktadır. A kolisindeki ürünlerin $\dfrac{1}{4}$''ü alınıp B kolisine aktarıldığında, B kolisindeki ürün sayısı A kolisinde kalan ürün sayısının $2$ katı olmaktadır.
Buna göre başlangıçta B kolisinde kaç adet ürün vardır?',
   '{"options":["60","75","80","85","90"],"correctIndex":1}'::jsonb,
   'Aktarım sonrası toplam ürün sayısı değişmez ($135$). A kolisinde kalan ürün sayısına $k$ denirse B kolisinde $2k$ ürün olur:
$$k + 2k = 135 \Rightarrow 3k = 135 \Rightarrow k = 45$$
A kolisindeki ürünlerin $\dfrac{1}{4}$''ü aktarıldıktan sonra $\dfrac{3}{4}$''ü ($45$ adet) kaldığından başlangıçta A kolisinde $\dfrac{45 \cdot 4}{3} = 60$ ürün vardır. Başlangıçta B kolisinde ise $135 - 60 = 75$ ürün bulunur.',
   'E şıkkı ($90$), aktarım sonrasındaki B kolisi miktarını ($2k = 90$) başlangıç değeri sanıp aktarılan $15$ ürünü çıkarmayı unutan; A şıkkı ($60$) ise B yerine A kolisini işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-07-046 · doğrulandı
  ('1cdfac90-387b-58db-989e-c342b6f6d969'::uuid, 'Matematik & Geometri', 'Denklem Çözme ve Sayı-Kesir Problemleri', 'multiple_choice', 3,
   'Bir lokantada yemek yiyen bir grup arkadaş gelen hesabı eşit olarak paylaşacaktır. Gruptan $4$ kişinin cüzdanı yanında olmadığı için kalanlar kişi başı $30$ TL daha fazla ödüyor. Eğer başlangıçtaki gruba sonradan $4$ kişi daha katılıp hesabı tüm grup eşit paylaşsaydı kişi başı $15$ TL daha az ödenecekti.
Buna göre lokantada ödenen toplam hesap kaç TL''dir?',
   '{"options":["480","600","640","720","840"],"correctIndex":3}'::jsonb,
   'Başlangıçtaki kişi sayısı $n$, başlangıçtaki kişi başı pay $p$ olsun. Toplam hesap $n \cdot p$''dir:
- $(n - 4)(p + 30) = np \Rightarrow 30n - 4p = 120$
- $(n + 4)(p - 15) = np \Rightarrow -15n + 4p = 60$
İki denklem taraf tarafa toplanırsa $15n = 180 \Rightarrow n = 12$ kişi bulunur. İkinci denklemde yerine konursa $4p = 60 + 180 = 240 \Rightarrow p = 60$ TL elde edilir. Toplam hesap $12 \times 60 = 720$ TL''dir.',
   'A şıkkı ($480$) veya B şıkkı ($600$), kişi başı ödeme farklarındaki $30$ TL ile $15$ TL''yi $n - 4$ ve $n + 4$ yerine yanlış katsayıyla çarpıp kişi sayısını hatalı bulan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-07-047 · doğrulandı
  ('e94df7d2-4f71-5e27-83d3-c90a0433f606'::uuid, 'Matematik & Geometri', 'Denklem Çözme ve Sayı-Kesir Problemleri', 'multiple_choice', 1,
   'Bir sınıftaki öğrencilerin $\dfrac{3}{8}$''i erkektir. Bu sınıfta $30$ kız öğrenci olduğuna göre sınıf mevcudu kaçtır?',
   '{"options":["32","36","40","45","48"],"correctIndex":4}'::jsonb,
   'Erkek öğrenciler sınıfın $\dfrac{3}{8}$''i ise kız öğrenciler sınıfın $1 - \dfrac{3}{8} = \dfrac{5}{8}$''idir. Sınıf mevcudu $M$ olsun:
$$\frac{5}{8} M = 30 \Rightarrow M = \frac{30 \cdot 8}{5} = 48$$
Sınıf mevcudu $48$''dir.',
   'A şıkkı ($32$), $30$ sayısını yanlış kesirle ($3/8$ yerine ters orantı) ilişkilendirip erkek sayısıyla mevcudu karıştıran adayı; D şıkkı ($45$) ise $30 + 15$ gibi tahmini toplama yapanları yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-07-048 · doğrulandı
  ('332f1528-9756-5d67-9ea2-faf3244821c5'::uuid, 'Matematik & Geometri', 'Denklem Çözme ve Sayı-Kesir Problemleri', 'multiple_choice', 2,
   'Bir kırtasiyede kalemler tekli olarak tanesi $30$ TL''ye, $4$''lü paketler hâlinde ise paketi $100$ TL''ye satılmaktadır.
Bu kırtasiyeden tekli veya paket olarak toplam $34$ adet kalem alan bir müşteri $880$ TL ödediğine göre, toplam kaç adet $4$''lü paket satın almıştır?',
   '{"options":["3","4","5","6","7"],"correctIndex":4}'::jsonb,
   'Satın alınan $4$''lü paket sayısı $p$ olsun. Paketlerden $4p$ kalem geleceğinden tekli alınan kalem sayısı $34 - 4p$ olur. Toplam ödeme denklemi:
$$100p + 30(34 - 4p) = 880 \Rightarrow 100p + 1.020 - 120p = 880 \Rightarrow 20p = 140 \Rightarrow p = 7$$
Buna göre müşteri $7$ adet $4$''lü paket (ve $6$ adet tekli kalem) satın almıştır.',
   'D şıkkı ($6$), paket sayısını bulduktan sonra tekli alınan kalem sayısını ($34 - 28 = 6$) paket sayısı sanıp işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-07-049 · doğrulandı
  ('c304f53f-6aa6-5eb3-8501-ea4739ee28aa'::uuid, 'Matematik & Geometri', 'Denklem Çözme ve Sayı-Kesir Problemleri', 'multiple_choice', 3,
   'Bir belediye konut su tüketiminde ilk $10\text{ m}^3$ için $\text{m}^3$ başına $18$ TL, $10\text{ m}^3$''ü aşan her $1\text{ m}^3$ için ise sabit $x$ TL tarife uygulamaktadır.
Her iki ayda da $10\text{ m}^3$''ün üzerinde olmak üzere iki ayda toplam $32\text{ m}^3$ su tüketen bir abone; birinci ay $355$ TL, ikinci ay $425$ TL su faturası ödemiştir.
Buna göre aşım ücreti $x$ kaç TL''dir?',
   '{"options":["25","28","32","35","40"],"correctIndex":3}'::jsonb,
   'İki aydaki su tüketimleri $a > 10$ ve $b > 10$ olsun ($a + b = 32$). İlk $10\text{ m}^3$''lük kısım her iki ayda da $10 \cdot 18 = 180$ TL tutar. Aşım bedelleri üzerinden:
- $180 + (a - 10)x = 355 \Rightarrow (a - 10)x = 175$
- $180 + (b - 10)x = 425 \Rightarrow (b - 10)x = 245$
Taraf tarafa toplanırsa $(a + b - 20)x = 175 + 245 \Rightarrow (32 - 20)x = 420 \Rightarrow 12x = 420 \Rightarrow x = 35$ TL bulunur.',
   'A şıkkı ($25$) veya E şıkkı ($40$), iki ayın toplamında yalnızca bir aylık $180$ TL sabit kısmı çıkarıp diğer ayın ilk $10\text{ m}^3$''ünü hesaba katmayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-07-050 · doğrulandı
  ('fe905c67-4393-50db-b85b-9d81ca832834'::uuid, 'Matematik & Geometri', 'Denklem Çözme ve Sayı-Kesir Problemleri', 'multiple_choice', 3,
   'Bir okul gezisine katılan $120$ öğrencinin bir kısmı tam bilet, kalanları ise indirimli bilet almıştır.
Tam bilet alan öğrencilerin $\dfrac{1}{3}$''ü ile indirimli bilet alan öğrencilerin $\dfrac{1}{4}$''ü olmak üzere toplam $34$ öğrenci öğle yemeği menüsü tercih etmiştir.
Buna göre bu gezide indirimli bilet alan toplam kaç öğrenci vardır?',
   '{"options":["72","48","54","64","68"],"correctIndex":0}'::jsonb,
   'Tam bilet alan öğrenci sayısı $3a$, indirimli bilet alan öğrenci sayısı $4b$ olsun. Verilenlere göre:
- $3a + 4b = 120$
- $a + b = 34$
İkinci denklem $3$ ile çarpılıp birinci denklemden çıkarılırsa:
$$(3a + 4b) - (3a + 3b) = 120 - 102 \Rightarrow b = 18$$
İndirimli bilet alan toplam öğrenci sayısı $4b = 4 \cdot 18 = 72$ bulunur.',
   'B şıkkı ($48$), $a = 16$ bulduktan sonra indirimli bilet ($4b = 72$) yerine tam bilet alan öğrencilerin sayısını ($3a = 48$) işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true)
on conflict (id) do update set
  lesson = excluded.lesson, topic = excluded.topic, question_type = excluded.question_type,
  difficulty = excluded.difficulty, prompt_text = excluded.prompt_text,
  interaction_data = excluded.interaction_data, explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap, exam_scopes = excluded.exam_scopes,
  education_level = excluded.education_level, figure_svg = excluded.figure_svg, is_active = true;
