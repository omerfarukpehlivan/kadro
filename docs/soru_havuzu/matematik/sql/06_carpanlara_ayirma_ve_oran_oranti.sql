-- ==========================================================================
-- KADRO SORU HAVUZU · Matematik & Geometri · Çarpanlara Ayırma ve Oran-Orantı (40 soru)
-- Kaynak: docs/soru_havuzu/matematik/06_carpanlara_ayirma_ve_oran_oranti.md · Üretici: tools/math/compile_questions.mjs (elle düzenlemeyin)
-- Önkoşul: docs/supabase_migrations/12_math_figures.sql
-- İdempotent: soru kimlikleri sabit UUID'dir; dosya tekrar çalıştırılırsa sorular güncellenir.
-- ==========================================================================

insert into public.questions (
  id, lesson, topic, question_type, difficulty, prompt_text, interaction_data,
  explanation, distractor_trap, exam_scopes, education_level, figure_svg, is_active
) values
  -- mat-06-001 · doğrulandı
  ('111fb641-a9d8-5b9c-a6cd-abcdd258bd42'::uuid, 'Matematik & Geometri', 'Çarpanlara Ayırma ve Oran-Orantı', 'multiple_choice', 1,
   '$x - y = 5$ ve $a + b = 4$ olduğuna göre
$$ax - ay + bx - by$$
ifadesinin değeri kaçtır?',
   '{"options":["9","16","20","24","25"],"correctIndex":2}'::jsonb,
   'İfade ikişerli gruplandırılarak ortak çarpan parantezine alınır: $ax - ay + bx - by = a(x - y) + b(x - y) = (x - y)(a + b)$. Verilen değerler yerine yazılırsa $5 \cdot 4 = 20$ bulunur.',
   'A şıkkı (9), çarpanlara ayırma sonucunda elde edilen iki çarpanı çarpmak yerine toplayan ($5 + 4 = 9$) adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-06-002 · doğrulandı
  ('ab71d03b-e9e9-5c43-b4c5-76a7f8b45261'::uuid, 'Matematik & Geometri', 'Çarpanlara Ayırma ve Oran-Orantı', 'multiple_choice', 1,
   '$$\dfrac{55^2 - 45^2}{55^2 - 2 \cdot 55 \cdot 45 + 45^2}$$
işleminin sonucu kaçtır?',
   '{"options":["10","5","2","20","100"],"correctIndex":0}'::jsonb,
   'Payda iki kare farkı, paydada ise tam kare farkı özdeşliği vardır:
Pay: $55^2 - 45^2 = (55 - 45)(55 + 45) = 10 \cdot 100$.
Payda: $(55 - 45)^2 = 10^2$.
Bölme yapıldığında $\dfrac{10 \cdot 100}{10 \cdot 10} = \dfrac{100}{10} = 10$ bulunur.',
   'E şıkkı (100), paydadaki $(55 - 45)^2$''nin karesini unutup yalnızca $55 - 45 = 10$ ile sadeleştirme yapan ($100$) adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-06-003 · doğrulandı
  ('494dfd86-5429-5368-811f-481b8a96a9a2'::uuid, 'Matematik & Geometri', 'Çarpanlara Ayırma ve Oran-Orantı', 'multiple_choice', 2,
   '$$x - \dfrac{1}{x} = 4$$
olduğuna göre $x^2 + \dfrac{1}{x^2}$ ifadesinin değeri kaçtır?',
   '{"options":["12","14","16","18","20"],"correctIndex":3}'::jsonb,
   'Verilen eşitliğin her iki tarafının karesi alınır: $\left(x - \dfrac{1}{x}\right)^2 = 4^2 \Rightarrow x^2 - 2 \cdot x \cdot \dfrac{1}{x} + \dfrac{1}{x^2} = 16$. Ortadaki $x$''ler sadeleşince $x^2 - 2 + \dfrac{1}{x^2} = 16 \Rightarrow x^2 + \dfrac{1}{x^2} = 16 + 2 = 18$ bulunur.',
   'B şıkkı (14), $x^2 - 2 + \frac{1}{x^2} = 16$ denkleminden $-2$''yi karşıya $+2$ yerine $-2$ olarak geçirip $16 - 2 = 14$ bulan adayı yakalar. C şıkkı (16) ise açılımdaki ortanca $-2$ terimini tamamen unutanların tuzağıdır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-06-004 · doğrulandı
  ('36ee0ac4-c966-5859-b0fe-d9b82e148f1e'::uuid, 'Matematik & Geometri', 'Çarpanlara Ayırma ve Oran-Orantı', 'multiple_choice', 2,
   '$a + b = 9$ ve $a^2 + b^2 = 53$ olduğuna göre $a \cdot b$ çarpımı kaçtır?',
   '{"options":["12","14","16","24","28"],"correctIndex":1}'::jsonb,
   'Tam kare toplamı özdeşliği yazılır: $(a + b)^2 = a^2 + 2ab + b^2$. Verilenler yerine konursa $9^2 = 53 + 2ab \Rightarrow 81 - 53 = 2ab \Rightarrow 28 = 2ab \Rightarrow ab = 14$ bulunur.',
   'E şıkkı (28), $81 - 53 = 28$ farkını bulduktan sonra $2ab$''deki $2$''ye bölmeyi unutan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-06-005
  ('f6b0d087-2539-5447-8460-1427aadae84e'::uuid, 'Matematik & Geometri', 'Çarpanlara Ayırma ve Oran-Orantı', 'multiple_choice', 2,
   '$x \notin \{-2, -1, 3\}$ olmak üzere
$$\dfrac{x^2 - 9}{x^2 - 2x - 3} \cdot \dfrac{x + 1}{x + 2}$$
ifadesinin en sade biçimi aşağıdakilerden hangisidir?',
   '{"options":["$1$","$\\dfrac{x - 3}{x + 2}$","$\\dfrac{x + 3}{x - 3}$","$\\dfrac{x - 1}{x + 2}$","$\\dfrac{x + 3}{x + 2}$"],"correctIndex":4}'::jsonb,
   'Paydaki ifade iki kare farkıyla $x^2 - 9 = (x - 3)(x + 3)$ şeklinde, paydadaki ifade ise çarpımları $-3$ ve toplamları $-2$ olan sayılarla $x^2 - 2x - 3 = (x - 3)(x + 1)$ şeklinde çarpanlarına ayrılır. Çarpım yazılırsa $\dfrac{(x - 3)(x + 3)}{(x - 3)(x + 1)} \cdot \dfrac{x + 1}{x + 2}$ olur; $(x - 3)$ ve $(x + 1)$ çarpanları sadeleşince sonuç $\dfrac{x + 3}{x + 2}$ bulunur.',
   'B şıkkı ($\frac{x - 3}{x + 2}$), $x^2 - 2x - 3$ ifadesini $(x + 3)(x - 1)$ şeklinde yanlış çarpanlara ayırıp $(x + 3)$''leri sadeleştiren adayı yakalar. Kök çarpımı ve toplamının işaretleri dikkatle kontrol edilmelidir.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-06-006 · doğrulandı
  ('bc0e4e47-cbea-5061-ba25-84544cfb17db'::uuid, 'Matematik & Geometri', 'Çarpanlara Ayırma ve Oran-Orantı', 'multiple_choice', 3,
   '$x$ ve $y$ gerçel sayıları için
$$x^2 + y^2 - 6x + 8y + 30$$
ifadesinin alabileceği en küçük değer kaçtır?',
   '{"options":["1","3","4","5","21"],"correctIndex":3}'::jsonb,
   '$x$ ve $y$ terimleri tam kareye tamamlanır:
$x^2 - 6x = (x - 3)^2 - 9$ ve
$y^2 + 8y = (y + 4)^2 - 16$.
İfade yeniden yazılırsa $(x - 3)^2 + (y + 4)^2 - 9 - 16 + 30 = (x - 3)^2 + (y + 4)^2 + 5$ olur. Gerçel sayıların kareleri en az $0$ olabildiğinden ($x = 3$ ve $y = -4$ için) toplamın en küçük değeri $0 + 0 + 5 = 5$ bulunur.',
   'E şıkkı (21), yalnızca $x$ terimini tam kareye tamamlayıp $y^2 + 8y$ için gereken $-16$ düzeltmesini unutan ($30 - 9 = 21$) adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-06-007 · doğrulandı
  ('070ed491-04fc-53d6-afe8-cc85b45736b5'::uuid, 'Matematik & Geometri', 'Çarpanlara Ayırma ve Oran-Orantı', 'multiple_choice', 1,
   '$\dfrac{a}{b} = \dfrac{3}{5}$ ve $2a + b = 33$ olduğuna göre $b - a$ farkı kaçtır?',
   '{"options":["3","6","9","12","15"],"correctIndex":1}'::jsonb,
   'Orandan $a = 3k$ ve $b = 5k$ yazılıp denklemde yerine konur: $2(3k) + 5k = 33 \Rightarrow 11k = 33 \Rightarrow k = 3$. Buna göre $a = 9$ ve $b = 15$ olur; fark $b - a = 15 - 9 = 6$ bulunur.',
   'A şıkkı (3), orantı sabiti $k = 3$''ü bulduktan sonra doğrudan $k$''yı işaretleyen adayı; C şıkkı (9) ise $a$''nın değerini seçenleri yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-06-008 · doğrulandı
  ('376051fb-a4d6-575f-aae1-da9e9089b395'::uuid, 'Matematik & Geometri', 'Çarpanlara Ayırma ve Oran-Orantı', 'multiple_choice', 1,
   '$180$ adet kalem üç kardeşe $2$, $3$ ve $4$ sayılarıyla doğru orantılı olacak biçimde paylaştırılıyor.
Buna göre en fazla kalem alan kardeş, en az kalem alan kardeşten kaç kalem fazla almıştır?',
   '{"options":["20","30","36","40","60"],"correctIndex":3}'::jsonb,
   'Kardeşlerin aldığı kalem sayıları sırasıyla $2k$, $3k$ ve $4k$ olsun. Toplam $2k + 3k + 4k = 9k = 180 \Rightarrow k = 20$ bulunur. En fazla alan $4 \cdot 20 = 80$, en az alan $2 \cdot 20 = 40$ kalem alır; fark $80 - 40 = 40$ kalemdir.',
   'A şıkkı (20), orantı sabiti $k = 20$''yi veya ardışık iki kardeş arasındaki farkı ($3k - 2k = 20$) işaretleyen adayı yakalar. Soru en büyük ile en küçük pay arasındaki farkı sormaktadır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-06-009 · doğrulandı
  ('6c5fea1a-ea14-5822-98f4-eb3cfe947e98'::uuid, 'Matematik & Geometri', 'Çarpanlara Ayırma ve Oran-Orantı', 'multiple_choice', 2,
   '$260$ TL üç kişiye sırasıyla $2$, $3$ ve $4$ sayılarıyla ters orantılı olarak paylaştırılıyor.
Buna göre en az para alan kişi kaç TL almıştır?',
   '{"options":["40","60","80","100","120"],"correctIndex":1}'::jsonb,
   'Ters orantılı paylar $\dfrac{k}{2}$, $\dfrac{k}{3}$ ve $\dfrac{k}{4}$ olur. Paydaların ortak katı $12$ üzerinden paylar $6m$, $4m$ ve $3m$ şeklinde yazılabilir. Toplam $6m + 4m + 3m = 13m = 260 \Rightarrow m = 20$ bulunur. En az para alan kişi $4$ ile ters orantılı olan paydır: $3 \cdot 20 = 60$ TL alır.',
   'E şıkkı (120), en az yerine en fazla para alan kişinin payını ($6m = 120$) işaretleyen adayı yakalar. Ayrıca ters orantıda büyük sayıyla orantılı payın en küçük olacağına dikkat edilmelidir.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-06-010 · doğrulandı
  ('1a7ec293-52a9-5c25-8961-dfef78401b18'::uuid, 'Matematik & Geometri', 'Çarpanlara Ayırma ve Oran-Orantı', 'multiple_choice', 2,
   'Eşit kapasitedeki $6$ işçi günde $8$ saat çalışarak bir işi $15$ günde bitirebilmektedir.
İşçi sayısı $4$ artırılır ve günlük çalışma süresi $6$ saate düşürülürse aynı iş kaç günde biter?',
   '{"options":["12","15","18","24","30"],"correctIndex":0}'::jsonb,
   'Yapılan aynı iş için toplam çalışma saati sabittir: $\text{İşçi} \cdot \text{Saat/gün} \cdot \text{Gün} = 6 \cdot 8 \cdot 15 = 720$ işçi-saat. İşçi sayısı $4$ artırıldığında $6 + 4 = 10$ işçi olur. Yeni günlük çalışma süresi $6$ saat ve gereken gün sayısı $g$ olursa $10 \cdot 6 \cdot g = 720 \Rightarrow 60g = 720 \Rightarrow g = 12$ gün bulunur.',
   'E şıkkı (30), "işçi sayısı 4 artırılır" ifadesini "işçi sayısı 4''e düşürülür" gibi okuyup $4 \cdot 6 \cdot g = 720 \Rightarrow g = 30$ hesaplayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-06-011 · doğrulandı
  ('a5222d03-2bc8-59dc-b1f9-dd6183c69361'::uuid, 'Matematik & Geometri', 'Çarpanlara Ayırma ve Oran-Orantı', 'multiple_choice', 2,
   '$a$ ve $b$ pozitif gerçel sayılarının aritmetik ortalaması $10$, geometrik ortalaması $6$''dır.
Buna göre $a^2 + b^2$ toplamı kaçtır?',
   '{"options":["28","64","328","388","400"],"correctIndex":2}'::jsonb,
   'Aritmetik ortalama $\dfrac{a + b}{2} = 10 \Rightarrow a + b = 20$''dir. Geometrik ortalama $\sqrt{a \cdot b} = 6 \Rightarrow a \cdot b = 36$''dır. Tam kare özdeşliğinden $a^2 + b^2 = (a + b)^2 - 2ab = 20^2 - 2 \cdot 36 = 400 - 72 = 328$ bulunur.',
   'D şıkkı (388), geometrik ortalamanın $6$ olmasından $a \cdot b$''yi $6^2 = 36$ yerine doğrudan $6$ alıp $400 - 2 \cdot 6 = 388$ bulan adayı yakalar. A şıkkı (28) ise $a + b$ toplamını $20$ yerine $10$ alanların tuzağıdır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-06-012 · doğrulandı
  ('b60f7e03-2420-5408-8f23-84c2e55adf44'::uuid, 'Matematik & Geometri', 'Çarpanlara Ayırma ve Oran-Orantı', 'multiple_choice', 3,
   '$a$, $b$ ve $c$ pozitif gerçel sayılar olmak üzere
$$\dfrac{a}{2} = \dfrac{b}{3} = \dfrac{c}{5} \quad \text{ve} \quad a^2 + b^2 + c^2 = 152$$
eşitlikleri veriliyor.
Buna göre $a + b + c$ toplamı kaçtır?',
   '{"options":["10","12","15","40","20"],"correctIndex":4}'::jsonb,
   'Orantı sabitine $k$ ($k > 0$) denirse $a = 2k$, $b = 3k$ ve $c = 5k$ olur. Kareler toplamında yerine yazılırsa $(2k)^2 + (3k)^2 + (5k)^2 = 152 \Rightarrow 4k^2 + 9k^2 + 25k^2 = 152 \Rightarrow 38k^2 = 152 \Rightarrow k^2 = 4$ elde edilir. Sayılar pozitif olduğundan $k = 2$ bulunur. Toplam $a + b + c = 2k + 3k + 5k = 10k = 20$''dir.',
   'D şıkkı (40), $38k^2 = 152$ denkleminde $k$''nın karesini unutarak $38k = 152 \Rightarrow k = 4$ alıp $10 \cdot 4 = 40$ bulan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-06-013 · doğrulandı
  ('a3e8afa4-411e-5a39-b694-2a0e6b489c28'::uuid, 'Matematik & Geometri', 'Çarpanlara Ayırma ve Oran-Orantı', 'multiple_choice', 1,
   '$$\sqrt{98 \cdot 102 + 4}$$
işleminin sonucu kaçtır?',
   '{"options":["98","100","102","104","200"],"correctIndex":1}'::jsonb,
   '$98$ ve $102$ sayıları $100$''e eşit uzaklıkta olduğundan $98 = 100 - 2$ ve $102 = 100 + 2$ yazılır. İki kare farkı özdeşliğiyle $\sqrt{(100 - 2)(100 + 2) + 4} = \sqrt{100^2 - 4 + 4} = \sqrt{100^2} = 100$ bulunur.',
   'C şıkkı (102) veya D şıkkı (104), $98 \cdot 102$ çarpımını $100^2$''ye eşitlemeyip $+4$''ü kök dışına $2$ olarak çıkarmaya çalışan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-06-014 · doğrulandı
  ('326fd6f5-965b-5999-a76b-4a27cce9cea5'::uuid, 'Matematik & Geometri', 'Çarpanlara Ayırma ve Oran-Orantı', 'multiple_choice', 1,
   '$x \neq y$ olmak üzere
$$\dfrac{x + 2y}{x - y} = 3$$
eşitliği sağlanmaktadır. Buna göre $\dfrac{x^2 - y^2}{(x - y)^2}$ ifadesinin değeri kaçtır?',
   '{"options":["$\\dfrac{3}{7}$","$\\dfrac{5}{3}$","$\\dfrac{7}{3}$","$\\dfrac{9}{4}$","$3$"],"correctIndex":2}'::jsonb,
   'İçler dışlar çarpımıyla $x$ ile $y$ arasındaki oran bulunur: $x + 2y = 3x - 3y \Rightarrow 2x = 5y$. Buradan $x = 5k$ ve $y = 2k$ ($k \neq 0$) yazılabilir. İstenen ifade iki kare farkıyla sadeleştirilip yerine konursa:
$$\dfrac{x^2 - y^2}{(x - y)^2} = \dfrac{(x - y)(x + y)}{(x - y)^2} = \dfrac{x + y}{x - y} = \dfrac{5k + 2k}{5k - 2k} = \dfrac{7}{3}$$
elde edilir.',
   'A şıkkı ($\frac{3}{7}$), sadeleştirme ya da yerine koyma sırasında $x = 5k, y = 2k$ yerine yanlışlıkla $x = 2k, y = 5k$ seçip pay ve paydanın yerini ters çeviren adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-06-015 · doğrulandı
  ('ba23538b-ffae-5742-812c-608143b1a063'::uuid, 'Matematik & Geometri', 'Çarpanlara Ayırma ve Oran-Orantı', 'multiple_choice', 2,
   '$$x^2 - 5x + 1 = 0$$
denklemini sağlayan $x$ sayısı için $x^2 + \dfrac{1}{x^2}$ ifadesinin değeri kaçtır?',
   '{"options":["19","21","23","25","27"],"correctIndex":2}'::jsonb,
   '$x = 0$ denklemi sağlamadığından ($1 \neq 0$) denklemin her terimi $x$''e bölünebilir: $x - 5 + \dfrac{1}{x} = 0 \Rightarrow x + \dfrac{1}{x} = 5$. Her iki tarafın karesi alınırsa $x^2 + 2 + \dfrac{1}{x^2} = 25 \Rightarrow x^2 + \dfrac{1}{x^2} = 23$ bulunur.',
   'E şıkkı (27), $x + \frac{1}{x} = 5$ eşitliğinin karesini alırken ortadaki $+2$ terimini karşıya $-2$ yerine $+2$ geçiren ($25 + 2 = 27$) adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-06-016 · doğrulandı
  ('65302627-de1f-5668-a0f1-d07b3cabf120'::uuid, 'Matematik & Geometri', 'Çarpanlara Ayırma ve Oran-Orantı', 'multiple_choice', 2,
   '$a - b = 3$ ve $a \cdot b = 4$ olduğuna göre $a^3 - b^3$ ifadesinin değeri kaçtır?',
   '{"options":["63","27","36","51","75"],"correctIndex":0}'::jsonb,
   'Küp farkı özdeşliği kullanılır: $a^3 - b^3 = (a - b)^3 + 3ab(a - b)$. Verilen değerler yerine konursa $3^3 + 3 \cdot 4 \cdot 3 = 27 + 36 = 63$ bulunur.',
   'B şıkkı (27), yalnızca $(a - b)^3 = 27$ terimini hesaplayıp $3ab(a - b)$ eklemesini unutan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-06-017
  ('655f4439-fa17-5455-a25e-124120aeea32'::uuid, 'Matematik & Geometri', 'Çarpanlara Ayırma ve Oran-Orantı', 'multiple_choice', 2,
   '$a \neq 0$ ve $a \neq \pm b$ olmak üzere
$$\dfrac{a^2 - b^2}{a^2 + ab} \div \dfrac{a - b}{a^2}$$
ifadesinin en sade biçimi aşağıdakilerden hangisidir?',
   '{"options":["$\\dfrac{1}{a}$","$b$","$a - b$","$a + b$","$a$"],"correctIndex":4}'::jsonb,
   'Pay ve payda çarpanlarına ayrılır ve ikinci kesir ters çevrilip çarpılır:
$\dfrac{(a - b)(a + b)}{a(a + b)} \cdot \dfrac{a^2}{a - b}$.
$(a + b)$ ve $(a - b)$ çarpanları sadeleşir, geriye $\dfrac{a^2}{a} = a$ kalır.',
   'A şıkkı ($\frac{1}{a}$), bölme işleminde ikinci kesri ters çevirmeden doğrudan çarpmaya çalışıp $\frac{a}{a^2}$ sadeleştirmesine düşen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-06-018 · doğrulandı
  ('95785469-756f-51bd-bd87-89d42ef8f79c'::uuid, 'Matematik & Geometri', 'Çarpanlara Ayırma ve Oran-Orantı', 'multiple_choice', 3,
   '$$(x^2 + 2x)^2 - 11(x^2 + 2x) + 24 = 0$$
denklemini sağlayan farklı $x$ gerçel sayılarının toplamı kaçtır?',
   '{"options":["$-2$","$0$","$-4$","$4$","$11$"],"correctIndex":2}'::jsonb,
   'Değişken değiştirme yapılır: $x^2 + 2x = t$ denirse denklem $t^2 - 11t + 24 = 0 \Rightarrow (t - 3)(t - 8) = 0$ olur. Buradan $t = 3$ veya $t = 8$ bulunur.
1. durum: $x^2 + 2x = 3 \Rightarrow x^2 + 2x - 3 = 0 \Rightarrow (x + 3)(x - 1) = 0 \Rightarrow x_1 = -3, x_2 = 1$.
2. durum: $x^2 + 2x = 8 \Rightarrow x^2 + 2x - 8 = 0 \Rightarrow (x + 4)(x - 2) = 0 \Rightarrow x_3 = -4, x_4 = 2$.
Dört kök de birbirinden farklıdır ve toplamları $-3 + 1 + (-4) + 2 = -4$ bulunur.',
   'E şıkkı (11), değişken değiştirmeyle bulduğu $t = 3$ ve $t = 8$ değerlerini $x$''in kökleri sanıp $3 + 8 = 11$ işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-06-019 · doğrulandı
  ('e9c1e5b7-226a-52ad-9859-9cf3b9ced761'::uuid, 'Matematik & Geometri', 'Çarpanlara Ayırma ve Oran-Orantı', 'multiple_choice', 1,
   '$a$, $b$ ve $c$ gerçel sayıları için
$$2a = 3b = 4c \quad \text{ve} \quad a + b + c = 26$$
eşitlikleri verilmektedir.
Buna göre $a - c$ farkı kaçtır?',
   '{"options":["2","3","4","6","12"],"correctIndex":3}'::jsonb,
   '$2$, $3$ ve $4$''ün ortak katı olan $12k$ değeri orantı sabiti seçilirse $2a = 3b = 4c = 12k \Rightarrow a = 6k$, $b = 4k$ ve $c = 3k$ olur. Toplamda yerine konursa $6k + 4k + 3k = 26 \Rightarrow 13k = 26 \Rightarrow k = 2$ bulunur. Fark $a - c = 6k - 3k = 3k = 3 \cdot 2 = 6$''dır.',
   'A şıkkı (2), orantı sabiti $k = 2$''yi bulduktan sonra $3k$ yerine doğrudan $k$''yı işaretleyen; E şıkkı (12) ise $a = 12$ değerini seçen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-06-020 · doğrulandı
  ('6775a8f8-332d-557a-bf15-1d21d742e742'::uuid, 'Matematik & Geometri', 'Çarpanlara Ayırma ve Oran-Orantı', 'multiple_choice', 1,
   '$$\dfrac{a}{b} = \dfrac{c}{d} = \dfrac{3}{4}$$
olduğuna göre
$$\dfrac{a + 2b}{b} \cdot \dfrac{d}{c}$$
ifadesinin değeri kaçtır?',
   '{"options":["$\\dfrac{11}{4}$","$\\dfrac{9}{4}$","$\\dfrac{8}{3}$","$3$","$\\dfrac{11}{3}$"],"correctIndex":4}'::jsonb,
   'İlk kesir parçalanırsa $\dfrac{a}{b} + \dfrac{2b}{b} = \dfrac{3}{4} + 2 = \dfrac{11}{4}$ olur. İkinci kesir $\dfrac{c}{d} = \dfrac{3}{4}$''ün tersi olduğu için $\dfrac{d}{c} = \dfrac{4}{3}$''tür. Çarpım $\dfrac{11}{4} \cdot \dfrac{4}{3} = \dfrac{11}{3}$ bulunur.',
   'A şıkkı ($\frac{11}{4}$), yalnızca ilk kesrin değerini hesaplayıp $\frac{d}{c} = \frac{4}{3}$ çarpanını unutan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-06-021 · doğrulandı
  ('73f416f4-0958-549c-873f-a3abaf9c7ba0'::uuid, 'Matematik & Geometri', 'Çarpanlara Ayırma ve Oran-Orantı', 'multiple_choice', 2,
   '$x$ sayısı $y$ ile doğru, $z$ ile ters orantılıdır.
$y = 4$ ve $z = 3$ iken $x = 6$ olduğuna göre $y = 10$ ve $z = 5$ iken $x$ kaçtır?',
   '{"options":["6","9","10","12","15"],"correctIndex":1}'::jsonb,
   'Doğru orantılı çokluk bölme, ters orantılı çokluk çarpma ile yazılır: $\dfrac{x \cdot z}{y} = k$. İlk değerler yerine konursa $\dfrac{6 \cdot 3}{4} = \dfrac{18}{4} = \dfrac{9}{2}$ olur. İkinci durumda $\dfrac{x \cdot 5}{10} = \dfrac{9}{2} \Rightarrow \dfrac{x}{2} = \dfrac{9}{2} \Rightarrow x = 9$ bulunur.',
   'E şıkkı (15), hem $y$ hem $z$''yi doğru orantılıymış gibi $\frac{x}{y \cdot z} = k$ şeklinde kuran veya $z$ ters orantısını ters çeviren adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-06-022 · doğrulandı
  ('ee9f6863-635e-5f6b-b427-f2c3da3eca6a'::uuid, 'Matematik & Geometri', 'Çarpanlara Ayırma ve Oran-Orantı', 'multiple_choice', 2,
   '$30$ kişilik bir sınıfta kız öğrencilerin boy ortalaması $160$ cm, erkek öğrencilerin boy ortalaması $175$ cm ve tüm sınıfın boy ortalaması $166$ cm''dir.
Buna göre bu sınıfta kaç tane kız öğrenci vardır?',
   '{"options":["12","15","18","20","22"],"correctIndex":2}'::jsonb,
   'Kız öğrenci sayısına $k$ denirse erkek öğrenci sayısı $30 - k$ olur. Tüm sınıfın boy toplamı iki yoldan eşitlenir:
$160k + 175(30 - k) = 166 \cdot 30 \Rightarrow 160k + 5.250 - 175k = 4.980 \Rightarrow 15k = 270 \Rightarrow k = 18$ kız öğrenci bulunur.',
   'A şıkkı (12), kız öğrenci sayısı ($18$) yerine erkek öğrenci sayısını ($30 - 18 = 12$) işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-06-023 · doğrulandı
  ('115321b6-b433-51bd-9e7f-e9cb828961b8'::uuid, 'Matematik & Geometri', 'Çarpanlara Ayırma ve Oran-Orantı', 'multiple_choice', 2,
   '$\dfrac{1}{250.000}$ ölçekli bir haritada iki şehir arasındaki uzaklık $12$ cm olarak ölçülmüştür.
Buna göre bu iki şehir arasındaki gerçek uzaklık kaç km''dir?',
   '{"options":["30","3","25","300","3.000"],"correctIndex":0}'::jsonb,
   'Ölçek $\dfrac{\text{Harita uzunluğu}}{\text{Gerçek uzunluk}}$ olduğundan gerçek uzaklık $12 \cdot 250.000 = 3.000.000$ cm olur. $1$ km $= 100.000$ cm olduğu için gerçek uzaklık $\dfrac{3.000.000}{100.000} = 30$ km bulunur.',
   'D şıkkı (300) ve B şıkkı (3), santimetreden kilometreye çevirirken $5$ sıfır silmek yerine $4$ veya $6$ sıfır silen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-06-024 · doğrulandı
  ('970c2a5a-b165-5e61-ba01-7d25cc11ac01'::uuid, 'Matematik & Geometri', 'Çarpanlara Ayırma ve Oran-Orantı', 'multiple_choice', 3,
   'Birbirini döndüren üç dişli çarktan birincisinde $24$, ikincisinde $36$ ve üçüncüsünde $48$ diş vardır.
Birinci çark $12$ tur döndüğünde üç çarkın yaptığı toplam tur sayısı kaç olur?',
   '{"options":["14","20","24","54","26"],"correctIndex":4}'::jsonb,
   'Birbirini döndüren dişli çarklarda diş sayısı ile tur sayısı ters orantılıdır (toplam dönen diş sayısı eşittir): $24 \cdot 12 = 36 \cdot t_2 = 48 \cdot t_3 = 288$.
Buradan ikinci çark $t_2 = \dfrac{288}{36} = 8$ tur, üçüncü çark $t_3 = \dfrac{288}{48} = 6$ tur döner. Üç çarkın toplam tur sayısı $12 + 8 + 6 = 26$ bulunur.',
   'D şıkkı (54), diş sayısıyla tur sayısını ters değil doğru orantılı sanıp $t_2 = 18$ ve $t_3 = 24$ hesaplayarak $12 + 18 + 24 = 54$ bulan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-06-025
  ('7715f6bd-54df-50af-ad8b-21c47281dcab'::uuid, 'Matematik & Geometri', 'Çarpanlara Ayırma ve Oran-Orantı', 'multiple_choice', 1,
   '$a \neq 0$ ve $a \neq \pm b$ olmak üzere
$$\dfrac{a^2 - b^2}{a^2 + ab} \cdot \dfrac{a^2}{a - b}$$
ifadesinin sadeleştirilmiş biçimi aşağıdakilerden hangisidir?',
   '{"options":["$1$","$b$","$a - b$","$a$","$a + b$"],"correctIndex":3}'::jsonb,
   'İlk kesrin payı iki kare farkıyla $(a - b)(a + b)$, paydası ise $a$ ortak çarpanıyla $a(a + b)$ şeklinde yazılır:
$$\dfrac{(a - b)(a + b)}{a(a + b)} \cdot \dfrac{a^2}{a - b} = \dfrac{a - b}{a} \cdot \dfrac{a^2}{a - b} = a$$
bulunur.',
   'A şıkkı ($1$), paydadaki $a$ ile ikinci kesrin payındaki $a^2$ terimini sadeleştirirken üssün $1$ azaldığını unutup tüm ifadelerin birbirini götürdüğünü sanan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-06-026 · doğrulandı
  ('37d2a9f9-1ab2-5c44-98cf-e845c52dafc5'::uuid, 'Matematik & Geometri', 'Çarpanlara Ayırma ve Oran-Orantı', 'multiple_choice', 1,
   '$$\dfrac{a}{3} = \dfrac{b}{5} = \dfrac{c}{7}$$
ve $a + c - b = 15$ olduğuna göre $a + b + c$ toplamı kaçtır?',
   '{"options":["30","45","50","60","75"],"correctIndex":1}'::jsonb,
   'Orantı sabiti $k$ olsun: $a = 3k$, $b = 5k$ ve $c = 7k$. Verilen denklemde yerine konursa $3k + 7k - 5k = 15 \Rightarrow 5k = 15 \Rightarrow k = 3$ bulunur. Toplam $a + b + c = 3k + 5k + 7k = 15k = 15 \cdot 3 = 45$''tir.',
   'E şıkkı ($75$) veya A şıkkı ($30$), $a + c - b$ yerine tüm terimleri toplam ($15k = 15 \Rightarrow k = 1$) ya da hatalı katsayı ($3k = 15$) alan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-06-027 · doğrulandı
  ('9177d7bc-264f-5d56-9840-1ffffca01b8b'::uuid, 'Matematik & Geometri', 'Çarpanlara Ayırma ve Oran-Orantı', 'multiple_choice', 1,
   'Bir depodaki A, B ve C marka ürünlerin sayıları hakkında aşağıdakiler bilinmektedir:
- A marka ürünlerin sayısının B marka ürünlerin sayısına oranı $\dfrac{2}{3}$''tür.
- B marka ürünlerin sayısının C marka ürünlerin sayısına oranı $\dfrac{4}{5}$''tir.
Depoda bu üç markadan toplam $105$ adet ürün bulunduğuna göre, C marka ürün sayısı A marka ürün sayısından kaç fazladır?',
   '{"options":["14","21","24","36","45"],"correctIndex":1}'::jsonb,
   'Her iki oranda ortak olan B markasının katsayıları $\text{EKOK}(3, 4) = 12$ üzerinde eşitlenir:
- $\dfrac{A}{B} = \dfrac{2 \cdot 4}{3 \cdot 4} = \dfrac{8}{12}$
- $\dfrac{B}{C} = \dfrac{4 \cdot 3}{5 \cdot 3} = \dfrac{12}{15}$
Böylece $A = 8k$, $B = 12k$ ve $C = 15k$ yazılır. Toplam $8k + 12k + 15k = 35k = 105 \Rightarrow k = 3$ bulunur. Fark ise $C - A = 15k - 8k = 7k = 7 \cdot 3 = 21$''dir.',
   'C şıkkı ($24$), $A = 8 \cdot 3 = 24$ değerini bulup fark yerine doğrudan A marka ürün sayısını işaretleyen; E şıkkı ($45$) ise $C$''yi işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-06-028
  ('e48c81ae-116d-501f-be17-2a2305889c4f'::uuid, 'Matematik & Geometri', 'Çarpanlara Ayırma ve Oran-Orantı', 'multiple_choice', 2,
   '$a \notin \{-3, -2, 0, 2, 3\}$ olmak üzere
$$\dfrac{a^2 - a - 6}{a^2 - 4} \div \dfrac{a^2 - 9}{a^2 + 3a}$$
ifadesinin sadeleştirilmiş biçimi aşağıdakilerden hangisidir?',
   '{"options":["$\\dfrac{a}{a - 2}$","$\\dfrac{a}{a + 2}$","$\\dfrac{a + 2}{a - 2}$","$\\dfrac{a - 3}{a + 3}$","$\\dfrac{a + 3}{a - 2}$"],"correctIndex":0}'::jsonb,
   'Tüm pay ve paydalar çarpanlarına ayrılır ve ikinci kesir ters çevrilip çarpılır:
$$\dfrac{(a - 3)(a + 2)}{(a - 2)(a + 2)} \cdot \dfrac{a(a + 3)}{(a - 3)(a + 3)}$$
Ortak $(a - 3)$, $(a + 2)$ ve $(a + 3)$ çarpanları sadeleştiğinde geriye $\dfrac{a}{a - 2}$ kalır.',
   'B şıkkı ($\frac{a}{a+2}$), $a^2 - a - 6$ üç terimlisini $(a + 3)(a - 2)$ şeklinde ters işaretle çarpanlara ayıran adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-06-029 · doğrulandı
  ('9c3a1707-5534-52eb-a3ae-46f65eb87ebc'::uuid, 'Matematik & Geometri', 'Çarpanlara Ayırma ve Oran-Orantı', 'multiple_choice', 2,
   '$x = 27$ ve $y = 23$ olduğuna göre
$$\dfrac{x^3 - y^3}{x^2 + xy + y^2} + (y - x)^2$$
ifadesinin değeri kaçtır?',
   '{"options":["4","8","12","16","20"],"correctIndex":4}'::jsonb,
   'Pay kısmı küp farkı özdeşliğiyle $x^3 - y^3 = (x - y)(x^2 + xy + y^2)$ biçiminde açılır; paydadaki $x^2 + xy + y^2$ ile sadeleştiğinde ilk terim yalnızca $x - y$ olur. İkinci terimle birlikte ifade $(x - y) + (y - x)^2$ hâline gelir. $x = 27$ ve $y = 23$ yazılırsa $(27 - 23) + (23 - 27)^2 = 4 + 16 = 20$ bulunur.',
   'D şıkkı ($16$) veya A şıkkı ($4$), sadeleştirmeden sonra yalnızca $(y - x)^2 = 16$''yı veya yalnızca $x - y = 4$''ü işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-06-030 · doğrulandı
  ('112dfddb-1d74-5676-9599-993ae5d842c5'::uuid, 'Matematik & Geometri', 'Çarpanlara Ayırma ve Oran-Orantı', 'multiple_choice', 2,
   '$930$ TL, yaşları $2$, $3$ ve $5$ olan üç kardeşe yaşlarıyla ters orantılı olarak paylaştırılıyor.
Buna göre en küçük kardeş kaç TL alır?',
   '{"options":["450","180","270","300","540"],"correctIndex":0}'::jsonb,
   'Ters orantılı paylaştırmada paylar $\dfrac{k}{2}$, $\dfrac{k}{3}$ ve $\dfrac{k}{5}$''tir (veya ortak kat olan $30$''la genişleterek $15t$, $10t$, $6t$ yazılır). Toplam para $15t + 10t + 6t = 31t = 930 \Rightarrow t = 30$ olur. En küçük kardeş ($2$ yaşındaki) $15 \cdot 30 = 450$ TL alır.',
   'B şıkkı ($180$), en küçük kardeşi yaşlarla doğru orantılı paylaştırmış gibi hesaplayıp $\frac{2}{10} \cdot 930 \approx 186$ veya ters sıradaki en büyük kardeşin payını ($6 \cdot 30 = 180$) işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-06-031
  ('f4d7b38a-25f9-5676-811e-c163f0ba0ecd'::uuid, 'Matematik & Geometri', 'Çarpanlara Ayırma ve Oran-Orantı', 'multiple_choice', 2,
   'Pozitif $a, b, c, d$ gerçel sayıları için $\dfrac{a}{b} = \dfrac{c}{d} = \dfrac{3}{4}$ eşitliği sağlanmaktadır. Buna göre,
I. $\dfrac{a + c}{b + d} = \dfrac{3}{4}$
II. $\dfrac{a + b}{b} = \dfrac{c + d}{d}$
III. $\dfrac{a \cdot c}{b \cdot d} = \dfrac{3}{4}$
ifadelerinden hangileri her zaman doğrudur?',
   '{"options":["Yalnız I","Yalnız II","Yalnız III","I ve II","I, II ve III"],"correctIndex":3}'::jsonb,
   'Orantı özelliklerine göre $a = 3k, b = 4k$ ve $c = 3m, d = 4m$ ($k, m > 0$) yazılır:
- I: $\dfrac{a + c}{b + d} = \dfrac{3(k + m)}{4(k + m)} = \dfrac{3}{4}$ her zaman doğrudur.
- II: $\dfrac{a + b}{b} = \dfrac{a}{b} + 1 = \dfrac{3}{4} + 1 = \dfrac{7}{4}$ ve $\dfrac{c + d}{d} = \dfrac{c}{d} + 1 = \dfrac{7}{4}$ olduğundan eşitlik her zaman doğrudur.
- III: $\dfrac{a \cdot c}{b \cdot d} = \dfrac{a}{b} \cdot \dfrac{c}{d} = \dfrac{3}{4} \cdot \dfrac{3}{4} = \dfrac{9}{16} \neq \dfrac{3}{4}$ olduğundan III yanlıştır.',
   'E şıkkı (I, II ve III), oranların toplamda korunduğu gibi çarpımda da aynı sabit $\frac{3}{4}$ değerini koruduğunu zanneden adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-06-032 · doğrulandı
  ('afe77c86-61be-58a9-b0c4-4efd106f7456'::uuid, 'Matematik & Geometri', 'Çarpanlara Ayırma ve Oran-Orantı', 'multiple_choice', 2,
   'Sıfırdan farklı $x$ ve $y$ gerçel sayıları için
$$x + y = 7 \quad \text{ve} \quad \dfrac{1}{x} + \dfrac{1}{y} = \dfrac{7}{10}$$
eşitlikleri sağlanmaktadır. Buna göre $x^2 + y^2$ toplamı kaçtır?',
   '{"options":["19","25","29","39","49"],"correctIndex":2}'::jsonb,
   'İkinci eşitlikte payda eşitlenirse $\dfrac{x + y}{x \cdot y} = \dfrac{7}{10}$ elde edilir. Soruda $x + y = 7$ verildiğinden $\dfrac{7}{x \cdot y} = \dfrac{7}{10} \Rightarrow x \cdot y = 10$ bulunur.
Tam kare özdeşliğiyle:
$$x^2 + y^2 = (x + y)^2 - 2xy = 7^2 - 2 \cdot 10 = 49 - 20 = 29$$
hesaplanır.',
   'D şıkkı ($39$), $x^2 + y^2 = (x + y)^2 - 2xy$ özdeşliğinde $2xy$ yerine yalnızca $xy = 10$ çıkaran ($49 - 10 = 39$) adayı; E şıkkı ($49$) ise doğrudan $(x + y)^2$ sonucunu alanları yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-06-033 · doğrulandı
  ('d8ec72f0-76e4-55f5-8cc8-6ce848f49495'::uuid, 'Matematik & Geometri', 'Çarpanlara Ayırma ve Oran-Orantı', 'multiple_choice', 3,
   '$a$, $b$ ve $c$ gerçel sayıları için
$$a + b + c = 9 \quad \text{ve} \quad a^2 + b^2 + c^2 = 35$$
eşitlikleri veriliyor.
Buna göre $ab + ac + bc$ toplamı kaçtır?',
   '{"options":["11","18","20","23","46"],"correctIndex":3}'::jsonb,
   'Üç terimli tam kare açılımı uygulanır:
$$(a + b + c)^2 = a^2 + b^2 + c^2 + 2(ab + ac + bc)$$
Bilinenler yerine yazılırsa $9^2 = 35 + 2(ab + ac + bc) \Rightarrow 81 - 35 = 2(ab + ac + bc) \Rightarrow 46 = 2(ab + ac + bc) \Rightarrow ab + ac + bc = 23$ bulunur.',
   'E şıkkı ($46$), $2(ab + ac + bc) = 46$ bulduktan sonra katsayı olan $2$''ye bölmeyi unutup doğrudan $46$''yı işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-06-034 · doğrulandı
  ('05f8b0bc-8cd6-56c1-92d0-009c60e30225'::uuid, 'Matematik & Geometri', 'Çarpanlara Ayırma ve Oran-Orantı', 'multiple_choice', 3,
   'Bir izci kampındaki $30$ kişiye $24$ gün yetecek kadar erzak bulunmaktadır. Kamp başladıktan $6$ gün sonra kampa $6$ kişi daha katılıyor.
Kalan erzak kamptaki tüm kişilere kaç gün yeter?',
   '{"options":["10","12","13","14","15"],"correctIndex":4}'::jsonb,
   '$6$ gün sonunda başlangıçtaki $30$ kişiye kalan erzak $24 - 6 = 18$ gün daha yetecek miktardadır. Kampa $6$ kişi katılınca kişi sayısı $30 + 6 = 36$ olur. Kişi sayısıyla yetme süresi ters orantılıdır:
$$30 \cdot 18 = 36 \cdot g \Rightarrow 540 = 36g \Rightarrow g = 15$$
gün yeter.',
   'B şıkkı ($12$) veya D şıkkı ($14$), $6$ gün geçtiğini unutup başlangıçtaki $24$ günü ters orantılayarak $30 \cdot 24 = 36 \cdot g \Rightarrow 20$ ya da $6$ düşenleri yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-06-035 · doğrulandı
  ('1bfc5711-4f0b-5c6e-b837-af9ad8e0edda'::uuid, 'Matematik & Geometri', 'Çarpanlara Ayırma ve Oran-Orantı', 'multiple_choice', 3,
   '$x$ sıfırdan farklı bir gerçel sayı olmak üzere
$$x - \dfrac{1}{x} = 3$$
eşitliği sağlanmaktadır.
Buna göre $x^4 + \dfrac{1}{x^4}$ değeri kaçtır?',
   '{"options":["119","47","81","121","123"],"correctIndex":0}'::jsonb,
   'İki aşamada kare alınır:
1. İlk eşitliğin karesi: $x^2 - 2 + \dfrac{1}{x^2} = 9 \Rightarrow x^2 + \dfrac{1}{x^2} = 11$.
2. Elde edilen denklemin karesi: $x^4 + 2 + \dfrac{1}{x^4} = 121 \Rightarrow x^4 + \dfrac{1}{x^4} = 121 - 2 = 119$ bulunur.',
   'B şıkkı ($47$), ilk adımda $x^2 + \dfrac{1}{x^2}$''yi $3^2 + 2 = 11$ yerine $3^2 - 2 = 7$ bulan adayın ($7^2 - 2 = 47$) düştüğü işaret tuzağıdır; E şıkkı ($123$) ise ikinci adımda $-2$ yerine $+2$ ekleyenleri yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-06-036 · şekilli · doğrulandı
  ('abd3dbdd-80f7-57a2-a3f6-1ac777563b2d'::uuid, 'Matematik & Geometri', 'Çarpanlara Ayırma ve Oran-Orantı', 'multiple_choice', 1,
   'Şekildeki bir kenarı $14$ cm olan büyük kareden, bir köşesinden kenarı $6$ cm olan küçük kare kesilerek çıkarılıyor.
Buna göre kalan taralı bölgenin alanı kaç cm²''dir?',
   '{"options":["64","100","160","176","196"],"correctIndex":2}'::jsonb,
   'İki kare farkı özdeşliği doğrudan uygulanır:
$$14^2 - 6^2 = (14 - 6)(14 + 6) = 8 \cdot 20 = 160\text{ cm}^2$$',
   'A şıkkı ($64$), $(14 - 6)^2 = 8^2 = 64$ sanarak iki kare farkı özdeşliği ile tam kare farkını karıştıran adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 260 260" width="260" height="260" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><polygon points="115.7,230 230,230 230,30 30,30 30,144.3 115.7,144.3" fill="currentColor" fill-opacity="0.12"/><polygon points="30,230 115.7,230 115.7,144.3 30,144.3"/><line x1="30" y1="30" x2="230" y2="30"/><text x="130" y="22.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">14</text><line x1="30" y1="230" x2="115.7" y2="230"/><text x="72.9" y="246.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">6</text></svg>', true),
  -- mat-06-037 · şekilli · doğrulandı
  ('049035c4-6f8b-5a48-9387-2822b57fa11e'::uuid, 'Matematik & Geometri', 'Çarpanlara Ayırma ve Oran-Orantı', 'multiple_choice', 2,
   'Bir ailenin aylık gelirinin üç harcama kalemine göre dağılımı aşağıdaki daire grafiğinde verilmiştir.
Kira ve Eğitim giderlerinin toplamı, Gıda giderinden $2.400$ TL fazla olduğuna göre bu ailenin toplam aylık harcaması kaç TL''dir?',
   '{"options":["7.200","4.800","6.000","8.400","9.600"],"correctIndex":0}'::jsonb,
   'Daire dilimlerinin açıları harcama tutarlarıyla doğru orantılıdır. Kira ve Eğitim toplam açısı $150^\circ + 90^\circ = 240^\circ$, Gıda açısı ise $120^\circ$''dir. Aradaki açı farkı $240^\circ - 120^\circ = 120^\circ$ olup $2.400$ TL''ye karşılık gelir. Bütün daire $360^\circ = 3 \cdot 120^\circ$ olduğundan toplam harcama $3 \cdot 2.400 = 7.200$ TL bulunur.',
   'E şıkkı ($9.600$), açı farkını $120^\circ$ yerine $90^\circ$ sanarak $4 \cdot 2.400 = 9.600$ hesaplayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 331.3 198" width="331.3" height="198" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><g transform="translate(62 0)"><path d="M95 99 L95 14 A85 85 0 0 1 137.5 172.6 Z" fill="currentColor" fill-opacity="0.08"/><line x1="171.3" y1="78.6" x2="184.8" y2="74.9" stroke-width="1"/><text x="188.7" y="78.1" fill="currentColor" stroke="none" text-anchor="start" font-size="12">Kira (150°)</text><path d="M95 99 L137.5 172.6 A85 85 0 0 1 10 99 Z" fill="currentColor" fill-opacity="0.3"/><line x1="55.5" y1="167.4" x2="48.5" y2="179.5" stroke-width="1"/><text x="46.5" y="187.2" fill="currentColor" stroke="none" text-anchor="end" font-size="12">Gıda (120°)</text><path d="M95 99 L10 99 A85 85 0 0 1 95 14 Z" fill="currentColor" fill-opacity="0.16"/><line x1="39.1" y1="43.1" x2="29.2" y2="33.2" stroke-width="1"/><text x="26.4" y="34.6" fill="currentColor" stroke="none" text-anchor="end" font-size="12">Eğitim (90°)</text></g></svg>', true),
  -- mat-06-038 · şekilli · doğrulandı
  ('f36ffee8-b9ff-5aba-9ca2-c188ae7f19f9'::uuid, 'Matematik & Geometri', 'Çarpanlara Ayırma ve Oran-Orantı', 'multiple_choice', 2,
   '$x$ ve $y$ pozitif sayılarının aldığı değerlere ait tablo aşağıda verilmiştir.
$y$ sayısı $x$ ile ters orantılı olduğuna göre $a + b$ toplamı kaçtır?',
   '{"options":["24","28","30","32","36"],"correctIndex":1}'::jsonb,
   'Ters orantılı çoklukların çarpımı sabittir: $x \cdot y = 6 \cdot 24 = 144$.
- $2.$ satırdan $12 \cdot b = 144 \Rightarrow b = 12$.
- $3.$ satırdan $a \cdot 9 = 144 \Rightarrow a = 16$.
Toplam $a + b = 16 + 12 = 28$ bulunur.',
   'C şıkkı ($30$) veya E şıkkı ($36$), ters orantı yerine doğru orantı kurup $\dfrac{6}{24} = \dfrac{12}{b} \Rightarrow b = 48$ veya bölme hatası yapan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 80.2 122" width="80.2" height="122" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><rect x="1" y="1" width="78.2" height="30" fill="currentColor" fill-opacity="0.1" stroke="none"/><rect x="1" y="1" width="78.2" height="120" stroke-width="1.4"/><line x1="1" y1="31" x2="79.2" y2="31" stroke-width="1"/><line x1="1" y1="61" x2="79.2" y2="61" stroke-width="1"/><line x1="1" y1="91" x2="79.2" y2="91" stroke-width="1"/><text x="20.5" y="20.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13" font-weight="600">x</text><text x="20.5" y="50.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">6</text><text x="20.5" y="80.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">12</text><text x="20.5" y="110.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">a</text><line x1="40.1" y1="1" x2="40.1" y2="121" stroke-width="1"/><text x="59.6" y="20.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13" font-weight="600">y</text><text x="59.6" y="50.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">24</text><text x="59.6" y="80.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">b</text><text x="59.6" y="110.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">9</text></svg>', true),
  -- mat-06-039 · şekilli · doğrulandı
  ('dfb7445b-59c2-5cc5-9c2d-44b7bbdc4a22'::uuid, 'Matematik & Geometri', 'Çarpanlara Ayırma ve Oran-Orantı', 'multiple_choice', 2,
   'Şekildeki bir kenarı $(a + b)$ birim olan büyük kare dört dikdörtgensel bölgeye ayrılmıştır. Boyalı küçük karelerin alanları toplamı $a^2 + b^2 = 40\text{ cm}^2$ ve büyük karenin tamamının alanı $(a + b)^2 = 64\text{ cm}^2$ olduğuna göre boyalı olmayan iki dikdörtgenden birinin alanı kaç cm²''dir?',
   '{"options":["6","8","10","12","24"],"correctIndex":3}'::jsonb,
   'Tam kare özdeşliği açılır:
$$(a + b)^2 = a^2 + b^2 + 2ab \Rightarrow 64 = 40 + 2ab \Rightarrow 2ab = 24 \Rightarrow ab = 12$$
Boyalı olmayan iki eş dikdörtgenin her birinin alanı $a \cdot b = 12$ cm² bulunur.',
   'E şıkkı ($24$), $2ab = 24$ değerini bulduktan sonra iki dikdörtgenden yalnızca birinin alanı sorulduğu hâlde $2$''ye bölmeyi unutup $24$''ü işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 260 260" width="260" height="260" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><polygon points="30,155 155,155 155,30 30,30" fill="currentColor" fill-opacity="0.12"/><polygon points="155,155 155,230 230,230 230,155" fill="currentColor" fill-opacity="0.12"/><polygon points="30,230 230,230 230,30 30,30"/><line x1="30" y1="155" x2="230" y2="155"/><line x1="155" y1="230" x2="155" y2="30"/><line x1="30" y1="30" x2="155" y2="30"/><text x="92.5" y="22.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">a</text><line x1="155" y1="30" x2="230" y2="30"/><text x="192.5" y="22.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">b</text><line x1="30" y1="30" x2="30" y2="155"/><text x="16.1" y="97.1" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">a</text><line x1="30" y1="155" x2="30" y2="230"/><text x="16.1" y="197.1" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">b</text></svg>', true),
  -- mat-06-040 · şekilli · doğrulandı
  ('47ed9140-f003-5f2a-8f61-8cd68f61d790'::uuid, 'Matematik & Geometri', 'Çarpanlara Ayırma ve Oran-Orantı', 'multiple_choice', 3,
   'Aşağıdaki tabloda $x$ ve $y$ değişkenlerinin aldığı pozitif değerler verilmiştir.
$y$ sayısı $x$''in karesi ile doğru orantılı olduğuna göre $a + b$ toplamı kaçtır?',
   '{"options":["18","22","27","29","31"],"correctIndex":4}'::jsonb,
   '$y$, $x^2$ ile doğru orantılı olduğundan $\dfrac{y}{x^2} = k$ sabittir. İlk satırdan orantı sabiti $k = \dfrac{12}{2^2} = \dfrac{12}{4} = 3$ bulunur.
- $2.$ satırdan $\dfrac{a}{3^2} = 3 \Rightarrow a = 3 \cdot 9 = 27$.
- $3.$ satırdan $\dfrac{48}{b^2} = 3 \Rightarrow b^2 = 16 \Rightarrow b = 4$ ($b > 0$).
Sonuç olarak $a + b = 27 + 4 = 31$ bulunur.',
   'A şıkkı ($18$) veya B şıkkı ($22$), $y$''nin $x^2$ ile değil doğrudan $x$ ile doğru orantılı olduğunu sanarak $a = 18$ ve $b = 8$ ($18 + 8 = 26$ ya da sadece $18$) bulan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 134.3 122" width="134.3" height="122" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><rect x="1" y="1" width="132.3" height="30" fill="currentColor" fill-opacity="0.1" stroke="none"/><rect x="1" y="1" width="132.3" height="120" stroke-width="1.4"/><line x1="1" y1="31" x2="133.3" y2="31" stroke-width="1"/><line x1="1" y1="61" x2="133.3" y2="61" stroke-width="1"/><line x1="1" y1="91" x2="133.3" y2="91" stroke-width="1"/><text x="31.9" y="20.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13" font-weight="600">Durum</text><text x="31.9" y="50.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">1.</text><text x="31.9" y="80.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">2.</text><text x="31.9" y="110.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">3.</text><line x1="62.7" y1="1" x2="62.7" y2="121" stroke-width="1"/><text x="78.5" y="20.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13" font-weight="600">x</text><text x="78.5" y="50.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">2</text><text x="78.5" y="80.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">3</text><text x="78.5" y="110.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">b</text><line x1="94.2" y1="1" x2="94.2" y2="121" stroke-width="1"/><text x="113.8" y="20.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13" font-weight="600">y</text><text x="113.8" y="50.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">12</text><text x="113.8" y="80.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">a</text><text x="113.8" y="110.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">48</text></svg>', true)
on conflict (id) do update set
  lesson = excluded.lesson, topic = excluded.topic, question_type = excluded.question_type,
  difficulty = excluded.difficulty, prompt_text = excluded.prompt_text,
  interaction_data = excluded.interaction_data, explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap, exam_scopes = excluded.exam_scopes,
  education_level = excluded.education_level, figure_svg = excluded.figure_svg, is_active = true;
