-- ==========================================================================
-- KADRO SORU HAVUZU · Matematik & Geometri · Üslü ve Köklü İfadeler (40 soru)
-- Kaynak: docs/soru_havuzu/matematik/05_uslu_ve_koklu_ifadeler.md · Üretici: tools/math/compile_questions.mjs (elle düzenlemeyin)
-- Önkoşul: docs/supabase_migrations/12_math_figures.sql
-- İdempotent: soru kimlikleri sabit UUID'dir; dosya tekrar çalıştırılırsa sorular güncellenir.
-- ==========================================================================

insert into public.questions (
  id, lesson, topic, question_type, difficulty, prompt_text, interaction_data,
  explanation, distractor_trap, exam_scopes, education_level, figure_svg, is_active
) values
  -- mat-05-001 · doğrulandı
  ('bbda6734-4d56-5a21-ad49-e0f3a3fa9156'::uuid, 'Matematik & Geometri', 'Üslü ve Köklü İfadeler', 'multiple_choice', 1,
   '$$\dfrac{2^{-2} + 2^{-3}}{2^{-4}}$$
işleminin sonucu kaçtır?',
   '{"options":["3","6","8","12","16"],"correctIndex":1}'::jsonb,
   'Paydaki terimler ortak çarpan parantezine alınır veya doğrudan kesre çevrilir: $2^{-2} + 2^{-3} = \dfrac{1}{4} + \dfrac{1}{8} = \dfrac{3}{8}$. Payda $2^{-4} = \dfrac{1}{16}$ olduğundan bölme işlemi $\dfrac{3}{8} \cdot 16 = 6$ bulunur.',
   'D şıkkı (12), $\frac{1}{4} + \frac{1}{8}$ toplamını $\frac{3}{4}$ sanarak $16$ ile çarpan veya üsleri toplama-çıkarma sırasında kaydıran adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-05-002 · doğrulandı
  ('de9b9946-117e-5fc4-bbb5-948dcd17cac8'::uuid, 'Matematik & Geometri', 'Üslü ve Köklü İfadeler', 'multiple_choice', 1,
   '$$3^{2x - 1} = 27^{x - 2}$$
eşitliğini sağlayan $x$ gerçel sayısı kaçtır?',
   '{"options":["1","2","3","5","7"],"correctIndex":3}'::jsonb,
   'Sağ taraftaki taban $27 = 3^3$ biçiminde yazılır: $3^{2x - 1} = (3^3)^{x - 2} = 3^{3x - 6}$. Tabanlar eşit ve $1$''den büyük olduğu için üsler eşitlenir: $2x - 1 = 3x - 6 \Rightarrow x = 5$ bulunur.',
   'A şıkkı (1), $27$''yi $3^3$ yazarken üssü $x - 2$ ile dağıtmadan $3x - 2$ alıp $2x - 1 = 3x - 2 \Rightarrow x = 1$ bulan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-05-003 · doğrulandı
  ('be69efbf-def0-5f50-97d8-d49c61950a65'::uuid, 'Matematik & Geometri', 'Üslü ve Köklü İfadeler', 'multiple_choice', 2,
   '$$4^x + 4^x + 4^x + 4^x = 2^{10}$$
eşitliğini sağlayan $x$ sayısı kaçtır?',
   '{"options":["4","5","6","8","9"],"correctIndex":0}'::jsonb,
   'Sol tarafta dört tane $4^x$ toplandığı için ifade $4 \cdot 4^x = 4^{x + 1}$ şeklinde yazılır. Taban $2$ cinsine çevrilirse $4^{x + 1} = (2^2)^{x + 1} = 2^{2x + 2}$ olur. Eşitlikten $2^{2x + 2} = 2^{10} \Rightarrow 2x + 2 = 10 \Rightarrow 2x = 8 \Rightarrow x = 4$ bulunur.',
   'B şıkkı (5), baştaki $4$ çarpanını üsse $+1$ olarak eklemeyi unutup $2^{2x} = 2^{10} \Rightarrow x = 5$ işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-05-004 · doğrulandı
  ('9ad8dc0b-8d5d-5416-a017-ad49d06112b9'::uuid, 'Matematik & Geometri', 'Üslü ve Köklü İfadeler', 'multiple_choice', 2,
   '$$27^{-\frac{2}{3}} + 16^{\frac{3}{4}}$$
işleminin sonucu kaçtır?',
   '{"options":["$\\dfrac{17}{9}$","$\\dfrac{65}{9}$","$\\dfrac{73}{9}$","$\\dfrac{75}{9}$","$17$"],"correctIndex":2}'::jsonb,
   'Tabanlar üslü biçimde yazılır: $27 = 3^3$ ve $16 = 2^4$.
$27^{-2/3} = (3^3)^{-2/3} = 3^{-2} = \dfrac{1}{9}$.
$16^{3/4} = (2^4)^{3/4} = 2^3 = 8$.
Toplam $8 + \dfrac{1}{9} = \dfrac{72 + 1}{9} = \dfrac{73}{9}$ bulunur.',
   'A şıkkı ($\frac{17}{9}$), $16^{3/4}$ hesabında $2^3 = 8$ yerine $2^1 = 2$ veya yanlış üs sadeleştirmesi yapan adayı yakalar. Negatif üs sayının işaretini değiştirmez, çarpmaya göre tersini alır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-05-005
  ('0dd8e9d1-9a82-58c1-b8dc-ab015ac20d0a'::uuid, 'Matematik & Geometri', 'Üslü ve Köklü İfadeler', 'multiple_choice', 2,
   '$2^x = m$ ve $3^x = n$ olmak üzere
$$12^{x + 1}$$
ifadesinin $m$ ve $n$ türünden eşiti aşağıdakilerden hangisidir?',
   '{"options":["$6mn$","$12mn$","$6m^2 n$","$12mn^2$","$12m^2 n$"],"correctIndex":4}'::jsonb,
   'Önce $+1$ kuvveti ayrılır ve taban asal çarpanlarına bölünür:
$$12^{x + 1} = 12 \cdot 12^x = 12 \cdot (2^2 \cdot 3)^x = 12 \cdot (2^x)^2 \cdot 3^x$$
Sorudaki $2^x = m$ ve $3^x = n$ eşitlikleri yerine yazılırsa $12 m^2 n$ bulunur.',
   'D şıkkı ($12mn^2$), $12 = 2^2 \cdot 3$ çarpanlara ayırmasını $2 \cdot 3^2$ ile karıştırarak karesi alınacak harfi yanlış seçen adayı; B şıkkı ($12mn$) ise yalnızca $12^x = (2 \cdot 3)^x$ sanıp $2$''nin karesini unutan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-05-006 · doğrulandı
  ('739cdaf5-b69d-5f37-b236-42f256a3bac0'::uuid, 'Matematik & Geometri', 'Üslü ve Köklü İfadeler', 'multiple_choice', 3,
   '$$(x - 3)^{x^2 - 9} = 1$$
denklemini sağlayan farklı $x$ tam sayılarının toplamı kaçtır?',
   '{"options":["$-3$","1","3","4","6"],"correctIndex":1}'::jsonb,
   'Bir üslü ifadenin $1$''e eşit olması için üç durum incelenir:
1. Üs $0$ ve taban $0$''dan farklı: $x^2 - 9 = 0 \Rightarrow x = 3$ veya $x = -3$. Ancak $x = 3$ tabanı $0$ yaptığı ($0^0$ belirsizliği) için alınmaz; $x = -3$ ise $(-6)^0 = 1$ olduğundan sağlar.
2. Taban $1$: $x - 3 = 1 \Rightarrow x = 4$ ($1^7 = 1$, sağlar).
3. Taban $-1$ ve üs çift: $x - 3 = -1 \Rightarrow x = 2$. Bu durumda üs $2^2 - 9 = -5$ tek sayı olduğundan $(-1)^{-5} = -1 \neq 1$, sağlamaz.
Denklemi sağlayan sayılar $-3$ ve $4$ olup toplamları $-3 + 4 = 1$ bulunur.',
   'D şıkkı (4), $x = 3$ değerinin $0^0$ belirsizliği doğurduğunu fark etmeyip $-3 + 3 + 4 = 4$ toplayan adayı yakalar. C şıkkı (3) ise $x = 2$''yi de geçerli sananların ($-3 + 2 + 4 = 3$) düştüğü tuzaktır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-05-007 · doğrulandı
  ('44bf9f80-b992-588e-94e2-902094e60a4d'::uuid, 'Matematik & Geometri', 'Üslü ve Köklü İfadeler', 'multiple_choice', 1,
   '$x$ pozitif bir gerçel sayı olmak üzere
$$\sqrt{0{,}36 \cdot x^2} + \sqrt{0{,}04} = 1{,}4$$
eşitliğini sağlayan $x$ değeri kaçtır?',
   '{"options":["$1{,}8$","$2$","$2{,}3$","$2{,}5$","$3$"],"correctIndex":1}'::jsonb,
   'Ondalıklı karekökler rasyonel olarak kök dışına çıkarılır ($x > 0$ olduğu için $\sqrt{x^2} = x$):
$$0{,}6x + 0{,}2 = 1{,}4 \Rightarrow 0{,}6x = 1{,}2 \Rightarrow x = 2$$
bulunur.',
   'C şıkkı ($2{,}3$), $\sqrt{0{,}04}$ ifadesini $0{,}2$ yerine $0{,}02$ olarak çıkarıp $0{,}6x = 1{,}38 \Rightarrow x = 2{,}3$ sonucunu bulan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-05-008 · doğrulandı
  ('cb102059-c0db-5e18-a793-688e6dc0c864'::uuid, 'Matematik & Geometri', 'Üslü ve Köklü İfadeler', 'multiple_choice', 1,
   '$$\sqrt{0{,}64} + \sqrt{1{,}44} - \sqrt{0{,}04}$$
işleminin sonucu kaçtır?',
   '{"options":["1,2","1,6","1,8","2,0","2,2"],"correctIndex":2}'::jsonb,
   'Ondalık sayılar kesir hâlinde yazılarak kök dışına çıkarılır: $\sqrt{\dfrac{64}{100}} = 0{,}8$, $\sqrt{\dfrac{144}{100}} = 1{,}2$ ve $\sqrt{\dfrac{4}{100}} = 0{,}2$. İşlem $0{,}8 + 1{,}2 - 0{,}2 = 1{,}8$ bulunur.',
   'E şıkkı (2,2), eksi işaretini artı gibi toplayan adayı; A şıkkı (1,2) ise $\sqrt{0{,}04}$''ü $0{,}2$ yerine $0{,}02$ ya da $0{,}8$''i yanlış çıkaran adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-05-009 · doğrulandı
  ('02983c40-1ad2-5062-a6a9-9b26e14b77a6'::uuid, 'Matematik & Geometri', 'Üslü ve Köklü İfadeler', 'multiple_choice', 2,
   '$$\dfrac{6}{\sqrt{7} - 2} - \dfrac{6}{\sqrt{7} + 2}$$
işleminin sonucu kaçtır?',
   '{"options":["4","$4\\sqrt{7}$","6","8","12"],"correctIndex":3}'::jsonb,
   'Her iki kesrin paydası eşlenikleriyle çarpılır ($\sqrt{7}^2 - 2^2 = 7 - 4 = 3$):
$\dfrac{6(\sqrt{7} + 2)}{3} - \dfrac{6(\sqrt{7} - 2)}{3} = 2(\sqrt{7} + 2) - 2(\sqrt{7} - 2) = 2\sqrt{7} + 4 - 2\sqrt{7} + 4 = 8$ bulunur.',
   'B şıkkı ($4\sqrt{7}$), ikinci kesrin önündeki eksi işaretini paranteze dağıtmayı unutup $-2(\sqrt{7} - 2)$ yerine $2\sqrt{7} + 4$ yazdığı için köklü terimleri sadeleştiremeyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-05-010 · doğrulandı
  ('50fb8de9-28dc-5357-997a-cca4aff7afc3'::uuid, 'Matematik & Geometri', 'Üslü ve Köklü İfadeler', 'multiple_choice', 2,
   '$$\sqrt{19 + \sqrt{32 + \sqrt{16}}}$$
işleminin sonucu kaçtır?',
   '{"options":["3","$3\\sqrt{2}$","4","$\\sqrt{23}$","5"],"correctIndex":4}'::jsonb,
   'İç içe kökler en içten dışa doğru açılır: $\sqrt{16} = 4$. Bir sonraki kök $\sqrt{32 + 4} = \sqrt{36} = 6$ olur. En dıştaki kök ise $\sqrt{19 + 6} = \sqrt{25} = 5$ olarak bulunur.',
   'C şıkkı (4), en içteki $\sqrt{16} = 4$ adımından sonra $32 + 4$ yerine yanlış kök çıkarıp $19$''a eklediğinde tam kare olmayan ya da $4$''e yuvarlanan sonuca giden adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-05-011 · doğrulandı
  ('71554960-8871-5746-8310-e9be403b91c4'::uuid, 'Matematik & Geometri', 'Üslü ve Köklü İfadeler', 'multiple_choice', 2,
   '$$\sqrt{8 + 2\sqrt{15}} - \sqrt{8 - 2\sqrt{15}}$$
işleminin sonucu kaçtır?',
   '{"options":["0","$2\\sqrt{5}$","$\\sqrt{3}$","$2\\sqrt{3}$","$4$"],"correctIndex":3}'::jsonb,
   '$\sqrt{a \pm 2\sqrt{b}}$ kuralına göre çarpımları $15$, toplamları $8$ olan iki sayı $5$ ve $3$''tür ($5 \cdot 3 = 15$, $5 + 3 = 8$). Büyük sayı önce yazılır:
$\sqrt{8 + 2\sqrt{15}} = \sqrt{5} + \sqrt{3}$ ve $\sqrt{8 - 2\sqrt{15}} = \sqrt{5} - \sqrt{3}$.
Çıkarma işlemi yapılırsa $(\sqrt{5} + \sqrt{3}) - (\sqrt{5} - \sqrt{3}) = \sqrt{5} + \sqrt{3} - \sqrt{5} + \sqrt{3} = 2\sqrt{3}$ bulunur.',
   'B şıkkı ($2\sqrt{5}$), ikinci kökü parantezsiz çıkarıp $-\sqrt{5} - \sqrt{3}$ yerine $+\sqrt{5} - \sqrt{3}$ işaretlemesi yapan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-05-012
  ('80f63e50-41ec-5e99-b5ea-723a85b63b7e'::uuid, 'Matematik & Geometri', 'Üslü ve Köklü İfadeler', 'multiple_choice', 3,
   '$$a = 2\sqrt{13}, \quad b = 3\sqrt{5}, \quad c = 4\sqrt{3}$$
sayılarının küçükten büyüğe doğru sıralanışı aşağıdakilerden hangisidir?',
   '{"options":["$a < b < c$","$b < c < a$","$c < b < a$","$b < a < c$","$c < a < b$"],"correctIndex":1}'::jsonb,
   'Pozitif köklü sayıları sıralamak için katsayılar kök içine alınır (veya kareleri karşılaştırılır):
$a = \sqrt{2^2 \cdot 13} = \sqrt{52}$,
$b = \sqrt{3^2 \cdot 5} = \sqrt{45}$,
$c = \sqrt{4^2 \cdot 3} = \sqrt{48}$.
Kök içindeki değerler $45 < 48 < 52$ olduğundan sıralama $b < c < a$ olur.',
   'A şıkkı ($a < b < c$) yalnızca kök dışındaki katsayılara ($2 < 3 < 4$), C şıkkı ($c < b < a$) ise yalnızca kök içindeki sayılara ($3 < 5 < 13$) bakarak sıralama yapan adayı yakalar. Köklü sayılarda tüm çarpanlar kök içine alınmadan karşılaştırma yapılamaz.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-05-013
  ('b3b027ff-360a-5920-8986-9f40d7ca2c74'::uuid, 'Matematik & Geometri', 'Üslü ve Köklü İfadeler', 'multiple_choice', 1,
   '$$x = -2^{-4}, \quad y = (-2)^{-3}, \quad z = -(-2)^{-2}$$
sayılarının doğru sıralanışı aşağıdakilerden hangisidir?',
   '{"options":["$x < y < z$","$x < z < y$","$y < x < z$","$z < y < x$","$z < x < y$"],"correctIndex":3}'::jsonb,
   'Her sayının işareti parantez konumuna dikkat edilerek bulunur:
- $x = -2^{-4} = -\dfrac{1}{2^4} = -\dfrac{1}{16}$ (eksi işareti üssün dışındadır)
- $y = (-2)^{-3} = -\dfrac{1}{8} = -\dfrac{2}{16}$
- $z = -(-2)^{-2} = -\dfrac{1}{(-2)^2} = -\dfrac{1}{4} = -\dfrac{4}{16}$
Negatif sayılarda mutlak değeri büyük olan daha küçük olduğundan $-\dfrac{4}{16} < -\dfrac{2}{16} < -\dfrac{1}{16}$, yani $z < y < x$ bulunur.',
   'A şıkkı ($x < y < z$), negatif işaretleri görmezden gelerek yalnızca $\frac{1}{16} < \frac{1}{8} < \frac{1}{4}$ pozitif sıralamasını yapan adayı; B şıkkı ($x < z < y$) ise $x = -2^{-4}$ ifadesini $( -2 )^{-4} = +\frac{1}{16}$ sananların işaret karmaşasını yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-05-014 · doğrulandı
  ('e325dc5e-ba49-5805-93d9-c20ff0fa600f'::uuid, 'Matematik & Geometri', 'Üslü ve Köklü İfadeler', 'multiple_choice', 1,
   '$$\dfrac{6^4 \cdot 15^3}{10^3 \cdot 9^3}$$
işleminin sonucu kaçtır?',
   '{"options":["6","3","9","12","18"],"correctIndex":0}'::jsonb,
   'Tüm sayılar asal tabanların kuvvetleri hâline getirilir: $6^4 = 2^4 \cdot 3^4$, $15^3 = 3^3 \cdot 5^3$, $10^3 = 2^3 \cdot 5^3$ ve $9^3 = (3^2)^3 = 3^6$. İfade düzenlenirse $\dfrac{2^4 \cdot 3^7 \cdot 5^3}{2^3 \cdot 3^6 \cdot 5^3} = 2^{4 - 3} \cdot 3^{7 - 6} \cdot 5^{3 - 3} = 2^1 \cdot 3^1 \cdot 1 = 6$ bulunur.',
   'B şıkkı (3) veya D şıkkı (12), $9^3$''ü $3^6$ yerine $3^5$ ya da $3^3$ yazıp üsleri yanlış çıkaran adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-05-015 · doğrulandı
  ('c370bbc8-b4c0-59dd-b6e6-323f8328ef13'::uuid, 'Matematik & Geometri', 'Üslü ve Köklü İfadeler', 'multiple_choice', 2,
   '$$2^{x + 1} - 2^{x - 1} = 24$$
denklemini sağlayan $x$ sayısı kaçtır?',
   '{"options":["2","3","5","6","4"],"correctIndex":4}'::jsonb,
   'Sol taraf en küçük üslü terim olan $2^{x - 1}$ parantezine alınır: $2^{x - 1}(2^2 - 1) = 24 \Rightarrow 2^{x - 1} \cdot 3 = 24 \Rightarrow 2^{x - 1} = 8 = 2^3$. Tabanlar eşit olduğu için üsler eşitlenir: $x - 1 = 3 \Rightarrow x = 4$ bulunur.',
   'B şıkkı (3), $2^{x - 1} = 2^3$ eşitliğinden üssü doğrudan $x = 3$ sanan; C şıkkı (5) ise $-1$''i karşıya ters işaretli atan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-05-016 · doğrulandı
  ('dbb6960d-5564-5149-bad2-785bd1f9dab4'::uuid, 'Matematik & Geometri', 'Üslü ve Köklü İfadeler', 'multiple_choice', 2,
   '$2^a = 5$ ve $5^b = 16$ olduğuna göre $a \cdot b$ çarpımı kaçtır?',
   '{"options":["3","4","5","8","10"],"correctIndex":1}'::jsonb,
   '$2^a = 5$ eşitliği ikinci denklemde $5$ yerine yazılırsa $(2^a)^b = 16 \Rightarrow 2^{a \cdot b} = 2^4$ elde edilir. Tabanlar eşit olduğundan üsler de eşittir: $a \cdot b = 4$ bulunur.',
   'D şıkkı (8), $16$''yı $2^4$ yerine $2 \cdot 8$ gibi düşünerek veya $a$ ile $b$''ye yaklaşık tam sayılar vermeye çalışarak $8$ bulan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-05-017 · doğrulandı
  ('502a01b6-c73f-53c7-bb79-e624c7732ba4'::uuid, 'Matematik & Geometri', 'Üslü ve Köklü İfadeler', 'multiple_choice', 2,
   '$$4^6 \cdot 5^{10}$$
çarpımı kaç basamaklı bir doğal sayıdır?',
   '{"options":["9","10","12","11","16"],"correctIndex":3}'::jsonb,
   'Basamak sayısını bulmak için $10$''un kuvveti oluşturulur: $4^6 \cdot 5^{10} = (2^2)^6 \cdot 5^{10} = 2^{12} \cdot 5^{10} = 2^2 \cdot (2^{10} \cdot 5^{10}) = 4 \cdot 10^{10}$. Bu sayı $4$''ün sağına $10$ tane sıfır yazılarak oluşturulduğundan toplam $1 + 10 = 11$ basamaklıdır.',
   'B şıkkı (10), yalnızca sondaki sıfır sayısını ($10^{10}$) bulup baştaki $4$ rakamını basamak sayısına katmayı unutan adayı; E şıkkı (16) ise üsleri toplayan ($6 + 10 = 16$) adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-05-018
  ('d05013c9-dd1e-55bc-bc05-9e77c15377a8'::uuid, 'Matematik & Geometri', 'Üslü ve Köklü İfadeler', 'multiple_choice', 3,
   '$$a = 2^{60}, \quad b = 3^{45}, \quad c = 5^{30}$$
sayılarının küçükten büyüğe doğru sıralanışı aşağıdakilerden hangisidir?',
   '{"options":["$a < b < c$","$c < b < a$","$a < c < b$","$b < c < a$","$c < a < b$"],"correctIndex":2}'::jsonb,
   'Üsler olan $60$, $45$ ve $30$''un en büyük ortak böleni $15$''tir; tüm sayılar $15$. kuvvet biçiminde yazılır:
$a = (2^4)^{15} = 16^{15}$,
$b = (3^3)^{15} = 27^{15}$,
$c = (5^2)^{15} = 25^{15}$.
Üsler eşit ve pozitif olduğundan tabanı küçük olan küçüktür: $16 < 25 < 27 \Rightarrow a < c < b$ bulunur.',
   'A şıkkı ($a < b < c$) yalnızca tabanlara ($2 < 3 < 5$), B şıkkı ($c < b < a$) ise yalnızca üslere ($30 < 45 < 60$) bakarak sıralama yapan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-05-019 · doğrulandı
  ('0e9eade2-81d1-5e0f-9636-1a940474fe95'::uuid, 'Matematik & Geometri', 'Üslü ve Köklü İfadeler', 'multiple_choice', 1,
   '$$\sqrt[3]{-27} + \sqrt{(-5)^2} - \sqrt[4]{16}$$
işleminin sonucu kaçtır?',
   '{"options":["$-10$","$-6$","$-2$","$0$","$4$"],"correctIndex":3}'::jsonb,
   'Tek dereceli kökte işaret korunur: $\sqrt[3]{-27} = -3$. Çift dereceli kökte mutlak değer dışına çıkar: $\sqrt{(-5)^2} = |-5| = 5$. Son terim $\sqrt[4]{16} = 2$''dir. İşlem $-3 + 5 - 2 = 0$ bulunur.',
   'A şıkkı ($-10$), çift kuvvetli kökte $\sqrt{(-5)^2}$ ifadesini mutlak değer yerine doğrudan $-5$ çıkaran ($-3 - 5 - 2 = -10$) adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-05-020 · doğrulandı
  ('b192f6cf-942e-57b3-813b-fb54f860c299'::uuid, 'Matematik & Geometri', 'Üslü ve Köklü İfadeler', 'multiple_choice', 1,
   '$$\dfrac{\sqrt{18} \cdot \sqrt{12}}{\sqrt{6}}$$
işleminin sonucu kaçtır?',
   '{"options":["4","6","$6\\sqrt{2}$","12","36"],"correctIndex":1}'::jsonb,
   'Aynı dereceli kökler tek kök içinde çarpılıp bölünebilir: $\sqrt{\dfrac{18 \cdot 12}{6}} = \sqrt{18 \cdot 2} = \sqrt{36} = 6$ bulunur.',
   'E şıkkı (36), kök içindeki işlemi doğru yapıp $\sqrt{36}$''yı kök dışına çıkarmayı unutan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-05-021 · doğrulandı
  ('3dd97b9c-da6a-5108-96bf-25fc1fb226c1'::uuid, 'Matematik & Geometri', 'Üslü ve Köklü İfadeler', 'multiple_choice', 2,
   '$$\dfrac{\sqrt{x} + 2}{\sqrt{x} - 2} = 3$$
denklemini sağlayan $x$ gerçel sayısı kaçtır?',
   '{"options":["16","4","8","9","25"],"correctIndex":0}'::jsonb,
   'İçler dışlar çarpımı yapılır: $\sqrt{x} + 2 = 3(\sqrt{x} - 2) \Rightarrow \sqrt{x} + 2 = 3\sqrt{x} - 6 \Rightarrow 8 = 2\sqrt{x} \Rightarrow \sqrt{x} = 4$. Her iki tarafın karesi alınırsa $x = 16$ bulunur (paydayı sıfır yapmaz).',
   'B şıkkı (4), $\sqrt{x} = 4$ değerini bulduktan sonra $x$''i bulmak için karesini almayı unutup $4$''ü işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-05-022 · doğrulandı
  ('34a2cd0e-0cdb-53f0-aba6-fb6cbc312b5e'::uuid, 'Matematik & Geometri', 'Üslü ve Köklü İfadeler', 'multiple_choice', 2,
   '$$\sqrt{\dfrac{1}{9} + \dfrac{1}{16}}$$
işleminin sonucu kaçtır?',
   '{"options":["$\\dfrac{1}{5}$","$\\dfrac{1}{12}$","$\\dfrac{7}{12}$","$\\dfrac{5}{7}$","$\\dfrac{5}{12}$"],"correctIndex":4}'::jsonb,
   'Kök içindeki toplama işlemi yapılmadan terimler ayrı ayrı kök dışına çıkarılamaz. Önce payda eşitlenir: $\sqrt{\dfrac{16 + 9}{144}} = \sqrt{\dfrac{25}{144}} = \dfrac{5}{12}$ bulunur.',
   'C şıkkı ($\frac{7}{12}$), kök içindeki kesirleri toplamadan ayrı ayrı kök dışına çıkarıp $\dfrac{1}{3} + \dfrac{1}{4} = \dfrac{7}{12}$ bulan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-05-023 · doğrulandı
  ('788b5dc9-9bcd-5789-a848-c544f3ff7e15'::uuid, 'Matematik & Geometri', 'Üslü ve Köklü İfadeler', 'multiple_choice', 2,
   '$$\dfrac{4}{\sqrt{5} - 1} - \dfrac{5}{\sqrt{5}}$$
işleminin sonucu kaçtır?',
   '{"options":["$-1$","$0$","$1$","$\\sqrt{5}$","$2\\sqrt{5} + 1$"],"correctIndex":2}'::jsonb,
   'Her iki kesrin paydası eşleniğiyle rasyonel yapılır:
İlk kesir $\dfrac{4(\sqrt{5} + 1)}{(\sqrt{5} - 1)(\sqrt{5} + 1)} = \dfrac{4(\sqrt{5} + 1)}{5 - 1} = \sqrt{5} + 1$.
İkinci kesir $\dfrac{5\sqrt{5}}{5} = \sqrt{5}$.
Çıkarma işlemi $(\sqrt{5} + 1) - \sqrt{5} = 1$ bulunur.',
   'E şıkkı ($2\sqrt{5} + 1$), ikinci kesri çıkarırken işaret veya eşlenik hatası yaparak $\sqrt{5}$''lerin birbirini götürmesini kaçıran adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-05-024 · doğrulandı
  ('b3f12db9-3d60-56e5-81c0-9c43d6932b53'::uuid, 'Matematik & Geometri', 'Üslü ve Köklü İfadeler', 'multiple_choice', 3,
   '$a$ pozitif bir gerçel sayı olmak üzere
$$\sqrt{a} + \dfrac{1}{\sqrt{a}} = 4$$
eşitliği verilmektedir.
Buna göre $a + \dfrac{1}{a}$ değeri kaçtır?',
   '{"options":["14","12","16","18","8"],"correctIndex":0}'::jsonb,
   'Verilen eşitliğin her iki tarafının karesi alınır: $\left(\sqrt{a} + \dfrac{1}{\sqrt{a}}\right)^2 = 4^2 \Rightarrow a + 2 \cdot \sqrt{a} \cdot \dfrac{1}{\sqrt{a}} + \dfrac{1}{a} = 16$. Ortadaki $\sqrt{a}$''lar sadeleşir: $a + 2 + \dfrac{1}{a} = 16 \Rightarrow a + \dfrac{1}{a} = 14$ bulunur.',
   'C şıkkı (16), kare açılımındaki ortanca $+2$ terimini unutan; D şıkkı (18) ise $+2$''yi karşıya $-2$ yerine $+2$ olarak geçiren adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-05-025 · doğrulandı
  ('d807a793-3cd6-558d-85a3-93bc10f8caef'::uuid, 'Matematik & Geometri', 'Üslü ve Köklü İfadeler', 'multiple_choice', 1,
   '$$\dfrac{2^{12} + 2^{11}}{3 \cdot 2^{10}}$$
işleminin sonucu kaçtır?',
   '{"options":["2","1","3","4","8"],"correctIndex":0}'::jsonb,
   'Pay kısmı ortak çarpan $2^{11}$ parantezine alınır: $2^{11}(2 + 1) = 3 \cdot 2^{11}$. Kesirde $3$''ler sadeleşirse $\dfrac{2^{11}}{2^{10}} = 2$ bulunur.',
   'D şıkkı ($4$) veya C şıkkı ($3$), ortak parantez yerine $2^{12}$ ile $2^{11}$''i ayrı ayrı bölüp yanlış toplayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-05-026 · doğrulandı
  ('ac38567c-36c2-5751-938f-124290ccb5f2'::uuid, 'Matematik & Geometri', 'Üslü ve Köklü İfadeler', 'multiple_choice', 1,
   '$x$ bir gerçel sayı olmak üzere
$$\dfrac{6^{x + 2} - 6^{x + 1}}{3^x \cdot 2^{x + 1}}$$
işleminin sonucu kaçtır?',
   '{"options":["5","10","15","18","30"],"correctIndex":2}'::jsonb,
   'Pay kısmı $6^{x + 1}$ ortak parantezine alınır: $6^{x + 1}(6 - 1) = 5 \cdot 6^{x + 1}$. Tabanı $6 = 3 \cdot 2$ olarak ayrıldığında pay $5 \cdot 3^{x + 1} \cdot 2^{x + 1}$ olur. Paydayla sadeleştirilirse:
$$\dfrac{5 \cdot 3^{x + 1} \cdot 2^{x + 1}}{3^x \cdot 2^{x + 1}} = 5 \cdot 3^1 = 15$$
bulunur.',
   'A şıkkı ($5$), $6^{x + 1} = 3^{x + 1} \cdot 2^{x + 1}$ dönüşümünü yaparken $3$''ün üssündeki $+1$''i unutup $3^x$ ile tamamen sadeleştiğini sanan adayı; E şıkkı ($30$) ise $2^{x + 1}$''de de $+1$ kaldığını varsayıp $5 \cdot 6 = 30$ yazan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-05-027 · doğrulandı
  ('d8ec5645-e035-5e04-8964-1fa9509e0e84'::uuid, 'Matematik & Geometri', 'Üslü ve Köklü İfadeler', 'multiple_choice', 1,
   '$x > 0$ olmak üzere
$$\dfrac{\sqrt{x} + \sqrt{4x}}{\sqrt{9x} - \sqrt{x}} + \dfrac{\sqrt{25x}}{2\sqrt{x}}$$
işleminin sonucu kaçtır?',
   '{"options":["$1$","$2$","$3$","$3{,}5$","$4$"],"correctIndex":4}'::jsonb,
   'Kök içindeki tam kare katsayılar dışarı çıkarılır: $\sqrt{4x} = 2\sqrt{x}$, $\sqrt{9x} = 3\sqrt{x}$ ve $\sqrt{25x} = 5\sqrt{x}$. İfadede yerine yazılırsa:
$$\dfrac{\sqrt{x} + 2\sqrt{x}}{3\sqrt{x} - \sqrt{x}} + \dfrac{5\sqrt{x}}{2\sqrt{x}} = \dfrac{3\sqrt{x}}{2\sqrt{x}} + \dfrac{5}{2} = \dfrac{3}{2} + \dfrac{5}{2} = 4$$
bulunur.',
   'C şıkkı ($3$), ilk kesirde paydadaki $\sqrt{x}$ katsayısını $1$ yerine $0$ ya da payı $\sqrt{5x}$ sanıp sadeleştirmede hata yapan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-05-028 · doğrulandı
  ('8d2f3e6e-769e-50fb-911d-4e09410095d6'::uuid, 'Matematik & Geometri', 'Üslü ve Köklü İfadeler', 'multiple_choice', 2,
   '$2^x = 3$ olduğuna göre
$$4^{x + 1} - 8^x$$
ifadesinin sayısal değeri kaçtır?',
   '{"options":["3","6","9","12","18"],"correctIndex":2}'::jsonb,
   'İfade $2^x$ cinsinden yazılır: $4^{x + 1} = 4 \cdot 4^x = 4 \cdot (2^x)^2$ ve $8^x = (2^x)^3$. Verilen $2^x = 3$ yerine konursa $4 \cdot 3^2 - 3^3 = 36 - 27 = 9$ bulunur.',
   'B şıkkı ($6$) veya E şıkkı ($18$), $4^{x + 1}$ ifadesindeki $+1$ üssünü $4^1$ yerine $2^1$ olarak dışarı çıkaran adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-05-029 · doğrulandı
  ('43448821-90f7-5bdc-b7ad-51b8a16c4677'::uuid, 'Matematik & Geometri', 'Üslü ve Köklü İfadeler', 'multiple_choice', 2,
   '$$\dfrac{\sqrt{1{,}69} - \sqrt{0{,}09}}{\sqrt{0{,}25}}$$
işleminin sonucu kaçtır?',
   '{"options":["$0{,}5$","$1$","$1{,}5$","$2$","$4$"],"correctIndex":3}'::jsonb,
   'Ondalıklı karekökler rasyonel olarak hesaplanır: $\sqrt{1{,}69} = 1{,}3$, $\sqrt{0{,}09} = 0{,}3$ ve $\sqrt{0{,}25} = 0{,}5$. Pay $1{,}3 - 0{,}3 = 1$ olduğundan sonuç $\dfrac{1}{0{,}5} = 2$ bulunur.',
   'A şıkkı ($0{,}5$), $1 \div 0{,}5$ işlemini $2$ yerine $0{,}5$ bulan ya da $\sqrt{0{,}09}$ yerine $0{,}03$ çıkaran adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-05-030
  ('255823f8-9965-5ac3-bae2-37aa7a26abcf'::uuid, 'Matematik & Geometri', 'Üslü ve Köklü İfadeler', 'multiple_choice', 2,
   '$3^x \neq 2$ olmak üzere
$$\dfrac{9^x - 4}{3^x - 2} - \dfrac{9^x - 1}{3^x + 1}$$
ifadesinin eşiti aşağıdakilerden hangisidir?',
   '{"options":["$1$","$2$","$3^x + 1$","$3$","$2 \\cdot 3^x + 1$"],"correctIndex":3}'::jsonb,
   '$9^x = (3^x)^2$ yazılarak her iki kesrin payına iki kare farkı özdeşliği uygulanır:
- $\dfrac{(3^x)^2 - 2^2}{3^x - 2} = \dfrac{(3^x - 2)(3^x + 2)}{3^x - 2} = 3^x + 2$
- $\dfrac{(3^x)^2 - 1^2}{3^x + 1} = \dfrac{(3^x - 1)(3^x + 1)}{3^x + 1} = 3^x - 1$
Çıkarma işlemi yapıldığında $(3^x + 2) - (3^x - 1) = 3^x + 2 - 3^x + 1 = 3$ bulunur.',
   'A şıkkı ($1$), ikinci kesrin sonucunu $(3^x - 1)$ olarak çıkardıktan sonra önündeki eksi işaretini dağıtmamaktan dolayı $2 - 1 = 1$ bulan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-05-031 · doğrulandı
  ('726e5a32-afc8-5ff0-be13-d47bb1c05106'::uuid, 'Matematik & Geometri', 'Üslü ve Köklü İfadeler', 'multiple_choice', 2,
   '$$(3x - 7)^4 = (x - 1)^4$$
denklemini sağlayan $x$ gerçel sayılarının toplamı kaçtır?',
   '{"options":["5","3","4","6","7"],"correctIndex":0}'::jsonb,
   'Çift kuvvetler eşit olduğunda tabanlar ya birbirine eşittir ya da zıt işaretlidir:
- $3x - 7 = x - 1 \Rightarrow 2x = 6 \Rightarrow x = 3$
- $3x - 7 = -(x - 1) \Rightarrow 4x = 8 \Rightarrow x = 2$
Köklerin toplamı $3 + 2 = 5$ bulunur.',
   'B şıkkı ($3$), çift üslerde negatif eşlenik durumunu ($a = -b$) unutup yalnızca $3x - 7 = x - 1 \Rightarrow x = 3$ kökünü bulan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-05-032 · doğrulandı
  ('0043c9f0-f174-5cd9-969c-52584d7682bb'::uuid, 'Matematik & Geometri', 'Üslü ve Köklü İfadeler', 'multiple_choice', 2,
   '$$(x - 4)^{x^2 - 1} = 1$$
denklemini sağlayan tüm $x$ tam sayılarının toplamı kaçtır?',
   '{"options":["4","5","8","9","10"],"correctIndex":2}'::jsonb,
   'Üslü ifadenin $1$''e eşit olması için üç durum incelenir:
1. Üs $0$, taban sıfırdan farklı: $x^2 - 1 = 0 \Rightarrow x = 1$ ve $x = -1$ (tabanlar $-3$ ve $-5$, sıfırdan farklı olduğu için ikisi de geçerli).
2. Taban $1$: $x - 4 = 1 \Rightarrow x = 5$ ($1^{24} = 1$, geçerli).
3. Taban $-1$ ve üs çift: $x - 4 = -1 \Rightarrow x = 3$; üs $3^2 - 1 = 8$ çift olduğundan $(-1)^8 = 1$ (geçerli).
Dört değerin toplamı $(-1) + 1 + 3 + 5 = 8$ bulunur.',
   'B şıkkı ($5$), üssün çift olduğu taban $-1$ ($x = 3$) durumunu incelemeyi unutup yalnızca $(-1) + 1 + 5 = 5$ bulan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-05-033 · doğrulandı
  ('94b2b855-ca56-59f6-899f-3ff64b93ce4f'::uuid, 'Matematik & Geometri', 'Üslü ve Köklü İfadeler', 'multiple_choice', 3,
   '$x$ pozitif bir gerçel sayı olmak üzere
$$\sqrt{x\sqrt{x\sqrt{x}}} = 128$$
eşitliğini sağlayan $x$ sayısı kaçtır?',
   '{"options":["64","128","192","256","512"],"correctIndex":3}'::jsonb,
   'İç içe karekökler tek üslü ifade hâline getirilir: en içteki $x$ üç karekökün içinde ($x^{1/8}$), ortadaki iki karekökün ($x^{1/4}$), dıştaki tek karekökün içindedir ($x^{1/2}$):
$$x^{\frac{1}{2} + \frac{1}{4} + \frac{1}{8}} = x^{\frac{7}{8}} = 128 = 2^7$$
Her iki tarafın $\dfrac{8}{7}$. kuvveti alınırsa $x = (2^7)^{8/7} = 2^8 = 256$ bulunur.',
   'E şıkkı ($512$) veya A şıkkı ($64$), kök kuvvetlerini toplarken $1/2 + 1/4 + 1/8 = 7/8$ yerine farklı kesirler bulup $2$''nin yanlış üssünü hesaplayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-05-034 · doğrulandı
  ('897de218-18fb-5a66-8057-c0debd8891da'::uuid, 'Matematik & Geometri', 'Üslü ve Köklü İfadeler', 'multiple_choice', 3,
   '$$2^a = 3, \quad 3^b = 5, \quad 5^c = 64$$
eşitlikleri veriliyor.
Buna göre $a \cdot b \cdot c$ çarpımı kaçtır?',
   '{"options":["4","6","8","12","16"],"correctIndex":1}'::jsonb,
   'Eşitlikler zincirleme olarak birbirinin içine yazılır: $3 = 2^a$ olduğundan $3^b = (2^a)^b = 2^{ab} = 5$. Benzer şekilde $5 = 2^{ab}$ üçüncü eşitlikte yerine yazılırsa $(2^{ab})^c = 64 \Rightarrow 2^{abc} = 2^6 \Rightarrow a \cdot b \cdot c = 6$ bulunur.',
   'C şıkkı ($8$) veya D şıkkı ($12$), $64$''ü $2$''nin kuvveti yerine yanlışlıkla $4$''ün ya da başka bir tabanın kuvveti sanarak veya $a \cdot b \cdot c$ yerine toplamsal ilişki arayarak yanılan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-05-035 · doğrulandı
  ('d7599f5b-7c0b-5f27-bc44-589b1f5409b6'::uuid, 'Matematik & Geometri', 'Üslü ve Köklü İfadeler', 'multiple_choice', 3,
   '$x = \sqrt{5} - 2$ olduğuna göre
$$x^2 + 4x + 11$$
ifadesinin değeri kaçtır?',
   '{"options":["1","5","8","10","12"],"correctIndex":4}'::jsonb,
   '$x = \sqrt{5} - 2 \Rightarrow x + 2 = \sqrt{5}$ yazılır ve her iki tarafın karesi alınır: $(x + 2)^2 = 5 \Rightarrow x^2 + 4x + 4 = 5 \Rightarrow x^2 + 4x = 1$. Verilen ifadede yerine konursa $1 + 11 = 12$ bulunur.',
   'D şıkkı ($10$), doğrudan $x^2 + 4x + 4 = 5$ yerine $x^2 + 4x$ değerini $-1$ gibi işaret hatasıyla bulan adayı; A şıkkı ($1$) ise $11$''i eklemeyi unutanları yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-05-036 · şekilli · doğrulandı
  ('366a848b-cdc1-553f-b63a-4e93d9d3148a'::uuid, 'Matematik & Geometri', 'Üslü ve Köklü İfadeler', 'multiple_choice', 1,
   'Şekildeki sayı doğrusunda $A = \sqrt{2n + 1}$ sayısı $3$ ile $4$ arasında işaretlenmiştir.
$n$ bir tam sayı olduğuna göre $n$''nin alabileceği en büyük değer kaçtır?',
   '{"options":["6","7","8","14","15"],"correctIndex":1}'::jsonb,
   '$3 < \sqrt{2n + 1} < 4$ eşitsizliğinde tüm terimlerin karesi alınır: $9 < 2n + 1 < 16 \Rightarrow 8 < 2n < 15 \Rightarrow 4 < n < 7{,}5$. Bu eşitsizliği sağlayan en büyük tam sayı $n = 7$''dir.',
   'C şıkkı ($8$), üst sınırı $2n + 1 \le 16$ gibi kapalı kabul edip veya $16 \div 2 = 8$ olarak hesaplayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 300 64" width="300" height="64" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><line x1="12" y1="30" x2="292" y2="30"/><path d="M292 30 l-8 -4 m8 4 l-8 4"/><path d="M12 30 l8 -4 m-8 4 l8 4"/><line x1="30" y1="25" x2="30" y2="35" stroke-width="1.2"/><text x="30" y="51.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">2</text><line x1="110" y1="25" x2="110" y2="35" stroke-width="1.2"/><text x="110" y="51.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">3</text><line x1="190" y1="25" x2="190" y2="35" stroke-width="1.2"/><text x="190" y="51.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">4</text><line x1="270" y1="25" x2="270" y2="35" stroke-width="1.2"/><text x="270" y="51.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">5</text><text x="158" y="16.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13" font-style="italic">A</text><circle cx="158" cy="30" r="5" fill="currentColor" stroke="none"/></svg>', true),
  -- mat-05-037 · şekilli · doğrulandı
  ('f4534f86-6e0a-522e-a5f4-dd5b468731b4'::uuid, 'Matematik & Geometri', 'Üslü ve Köklü İfadeler', 'multiple_choice', 2,
   'Şekildeki gibi düz bir zemin üzerine kenarları bitişik yerleştirilen üç kareden soldan sağa alanları sırasıyla $18\text{ cm}^2$, $50\text{ cm}^2$ ve $72\text{ cm}^2$''dir.
Buna göre $|AB|$ uzunluğu kaç cm''dir?',
   '{"options":["$14\\sqrt{2}$","$12\\sqrt{2}$","$13\\sqrt{2}$","$15\\sqrt{2}$","$16\\sqrt{2}$"],"correctIndex":0}'::jsonb,
   'Her karenin kenar uzunluğu alanının kareköküne eşittir:
- $1.$ kare: $\sqrt{18} = 3\sqrt{2}$ cm
- $2.$ kare: $\sqrt{50} = 5\sqrt{2}$ cm
- $3.$ kare: $\sqrt{72} = 6\sqrt{2}$ cm
Taban uzunlukları toplamı $|AB| = 3\sqrt{2} + 5\sqrt{2} + 6\sqrt{2} = 14\sqrt{2}$ cm bulunur.',
   'B şıkkı ($12\sqrt{2}$) veya C şıkkı ($13\sqrt{2}$), özellikle $\sqrt{72}$ sayısını $6\sqrt{2}$ yerine $4\sqrt{2}$ veya $5\sqrt{2}$ biçiminde hatalı kök dışına çıkaran adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 340 180" width="340" height="180" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><polygon points="30,150 90,150 90,90 30,90"/><polygon points="90,150 190,150 190,50 90,50"/><polygon points="190,150 310,150 310,30 190,30"/><text x="19.5" y="165.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="320.5" y="165.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text></svg>', true),
  -- mat-05-038 · şekilli · doğrulandı
  ('6d0539f0-6ada-516b-9365-013af6ce70b5'::uuid, 'Matematik & Geometri', 'Üslü ve Köklü İfadeler', 'multiple_choice', 2,
   'Şekildeki işlem makinesine girilen $n$ tam sayısı oklar üzerindeki işlemlerden geçerek çıkışta $63$ sonucunu vermektedir.
Buna göre girişe yazılan $n$ tam sayısı kaçtır?',
   '{"options":["2","3","4","5","6"],"correctIndex":2}'::jsonb,
   'Şema denklemleştirilir: $3 \cdot 2^n + 15 = 63 \Rightarrow 3 \cdot 2^n = 48 \Rightarrow 2^n = 16 = 2^4 \Rightarrow n = 4$ bulunur.',
   'D şıkkı ($5$) veya B şıkkı ($3$), $2^n = 16$ eşitliğini yanlışlıkla $n = 3$ ($8$) ya da $15$''i eklemek yerine çıkaran adım hatasından doğar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 499.1 66" width="499.1" height="66" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><line x1="50" y1="33" x2="149" y2="33" stroke-width="1.4"/><path d="M149 33 L141.6 36.1 M149 33 L141.6 29.9" stroke-width="1.4"/><text x="99.5" y="46.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">2 üzeri</text><line x1="205" y1="33" x2="286.6" y2="33" stroke-width="1.4"/><path d="M286.6 33 L279.3 36.1 M286.6 33 L279.3 29.9" stroke-width="1.4"/><text x="245.8" y="46.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">× 3</text><line x1="355.4" y1="33" x2="446.9" y2="33" stroke-width="1.4"/><path d="M446.9 33 L439.5 36.1 M446.9 33 L439.5 29.9" stroke-width="1.4"/><text x="401.1" y="46.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">+ 15</text><circle cx="33" cy="33" r="17" fill="currentColor" fill-opacity="0.06"/><text x="33" y="37.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">n</text><rect x="149" y="16" width="56" height="34" rx="6" fill="currentColor" fill-opacity="0.06"/><text x="177" y="37.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">2ⁿ</text><rect x="286.6" y="16" width="68.7" height="34" rx="6" fill="currentColor" fill-opacity="0.06"/><text x="321" y="37.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">3 · 2ⁿ</text><circle cx="465" cy="33" r="18.1" fill="currentColor" fill-opacity="0.06"/><text x="465" y="37.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">63</text></svg>', true),
  -- mat-05-039 · şekilli · doğrulandı
  ('21a468e1-1625-5213-a5a4-580c346a2411'::uuid, 'Matematik & Geometri', 'Üslü ve Köklü İfadeler', 'multiple_choice', 2,
   'Şekildeki $ABCD$ dikdörtgeninin kenar uzunlukları $|AB| = \sqrt{48}$ cm ve $|BC| = \sqrt{27}$ cm''dir.
Buna göre bu dikdörtgenin çevresi kaç cm''dir?',
   '{"options":["$7\\sqrt{3}$","$10\\sqrt{3}$","$12\\sqrt{3}$","$14\\sqrt{3}$","$16\\sqrt{3}$"],"correctIndex":3}'::jsonb,
   'Kenar uzunlukları düzenlenir: $|AB| = \sqrt{48} = 4\sqrt{3}$ cm ve $|BC| = \sqrt{27} = 3\sqrt{3}$ cm. Dikdörtgenin çevresi $2(4\sqrt{3} + 3\sqrt{3}) = 2 \cdot 7\sqrt{3} = 14\sqrt{3}$ cm bulunur.',
   'A şıkkı ($7\sqrt{3}$), kısa ve uzun kenarı topladıktan sonra çevre için $2$ ile çarpmayı unutan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 329.5 260" width="329.5" height="260" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><polygon points="30,230 296.5,230 296.5,30 30,30"/><line x1="30" y1="230" x2="296.5" y2="230"/><text x="163.3" y="246.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">√48</text><line x1="296.5" y1="230" x2="296.5" y2="30"/><text x="314.2" y="134.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">√27</text><text x="19.5" y="245.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="307" y="245.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="307" y="24.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="19.5" y="24.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text></svg>', true),
  -- mat-05-040 · şekilli · doğrulandı
  ('ec7cdfc7-47f2-531d-b399-c8e6e5466b4f'::uuid, 'Matematik & Geometri', 'Üslü ve Köklü İfadeler', 'multiple_choice', 3,
   'Şekildeki akış şemasına girilen pozitif bir $n$ tam sayısının karekökü alınmakta, çıkan sayı tam sayıysa üst koldan, değilse alt koldan ilerlenmektedir.
Çıkışta $27$ sayısı elde edildiğine göre girişe yazılabilecek pozitif $n$ tam sayılarının toplamı kaçtır?',
   '{"options":["27","36","54","81","108"],"correctIndex":4}'::jsonb,
   'İki kol ayrı ayrı değerlendirilir:
- Üst kol ($\sqrt{n}$ tam sayı ise): $\sqrt{n} \cdot 3 = 27 \Rightarrow \sqrt{n} = 9 \Rightarrow n = 81$ (gerçekten $\sqrt{81} = 9$ tam sayıdır, koşul sağlanır).
- Alt kol ($\sqrt{n}$ tam sayı değilse): $(\sqrt{n})^2 = 27 \Rightarrow n = 27$ (gerçekten $\sqrt{27} = 3\sqrt{3}$ tam sayı değildir, koşul sağlanır).
Girişe yazılabilecek iki değerin toplamı $81 + 27 = 108$ bulunur.',
   'D şıkkı ($81$) ve A şıkkı ($27$), yalnızca tek bir kolu çözüp ikinci kolun da $27$ sonucunu verebileceğini unutan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 499.1 226" width="499.1" height="226" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><line x1="50" y1="113" x2="149" y2="113" stroke-width="1.4"/><path d="M149 113 L141.6 116.1 M149 113 L141.6 109.9" stroke-width="1.4"/><line x1="205" y1="97.4" x2="293" y2="48.6" stroke-width="1.4"/><path d="M293 48.6 L288.1 54.9 M293 48.6 L285 49.4" stroke-width="1.4"/><text x="259.9" y="96.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">tam sayı</text><line x1="205" y1="128.6" x2="290.4" y2="176" stroke-width="1.4"/><path d="M290.4 176 L282.4 175.1 M290.4 176 L285.5 169.7" stroke-width="1.4"/><text x="239.2" y="171.7" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">değil</text><line x1="349" y1="48.6" x2="449.2" y2="104.2" stroke-width="1.4"/><path d="M449.2 104.2 L441.2 103.3 M449.2 104.2 L444.2 97.9" stroke-width="1.4"/><line x1="351.6" y1="176" x2="449.2" y2="121.8" stroke-width="1.4"/><path d="M449.2 121.8 L444.2 128.1 M449.2 121.8 L441.2 122.7" stroke-width="1.4"/><circle cx="33" cy="113" r="17" fill="currentColor" fill-opacity="0.06"/><text x="33" y="117.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">n</text><rect x="149" y="96" width="56" height="34" rx="6" fill="currentColor" fill-opacity="0.06"/><text x="177" y="117.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">√n</text><rect x="293" y="16" width="56" height="34" rx="6" fill="currentColor" fill-opacity="0.06"/><text x="321" y="37.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">× 3</text><rect x="286.6" y="176" width="68.7" height="34" rx="6" fill="currentColor" fill-opacity="0.06"/><text x="321" y="197.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">karesi</text><circle cx="465" cy="113" r="18.1" fill="currentColor" fill-opacity="0.06"/><text x="465" y="117.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">27</text></svg>', true)
on conflict (id) do update set
  lesson = excluded.lesson, topic = excluded.topic, question_type = excluded.question_type,
  difficulty = excluded.difficulty, prompt_text = excluded.prompt_text,
  interaction_data = excluded.interaction_data, explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap, exam_scopes = excluded.exam_scopes,
  education_level = excluded.education_level, figure_svg = excluded.figure_svg, is_active = true;
