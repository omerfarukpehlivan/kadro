-- ==========================================================================
-- KADRO SORU HAVUZU · Matematik & Geometri · Temel Kavramlar ve Sayı Basamakları (40 soru)
-- Kaynak: docs/soru_havuzu/matematik/01_temel_kavramlar_ve_sayi_basamaklari.md · Üretici: tools/math/compile_questions.mjs (elle düzenlemeyin)
-- Önkoşul: docs/supabase_migrations/12_math_figures.sql
-- İdempotent: soru kimlikleri sabit UUID'dir; dosya tekrar çalıştırılırsa sorular güncellenir.
-- ==========================================================================

insert into public.questions (
  id, lesson, topic, question_type, difficulty, prompt_text, interaction_data,
  explanation, distractor_trap, exam_scopes, education_level, figure_svg, is_active
) values
  -- mat-01-001 · doğrulandı
  ('1158394c-8521-5c5f-bc80-6049309e1780'::uuid, 'Matematik & Geometri', 'Temel Kavramlar ve Sayı Basamakları', 'multiple_choice', 1,
   'Rakamları sıfırdan ve birbirinden farklı iki basamaklı en büyük negatif tam sayı ile rakamları birbirinden farklı üç basamaklı en küçük pozitif tam sayının toplamı kaçtır?',
   '{"options":["4","90","92","104","114"],"correctIndex":1}'::jsonb,
   'Negatif sayılar sıfıra yaklaştıkça büyür. İki basamaklı, rakamları sıfırdan ve birbirinden farklı en büyük negatif tam sayı $-12$''dir ($-10$ sıfır içerdiği, $-11$ ise aynı rakamdan oluştuğu için seçilemez). Rakamları birbirinden farklı üç basamaklı en küçük pozitif tam sayı ise yüzler basamağı $1$, onlar basamağı $0$, birler basamağı $2$ seçilerek $102$ bulunur. İki sayının toplamı $-12 + 102 = 90$ olur.',
   'C şıkkı (92), sorudaki sıfırdan farklı koşulunu gözden kaçırıp iki basamaklı en büyük negatif sayıyı $-10$ alan adayı yakalar. A şıkkı (4) ise negatiflerde en büyük yerine en küçük sayıyı ($-98$) seçme hatasından doğar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-01-002
  ('723492ca-977b-5a36-9bc1-2a4dfd3dee28'::uuid, 'Matematik & Geometri', 'Temel Kavramlar ve Sayı Basamakları', 'multiple_choice', 1,
   '$a$, $b$ ve $c$ tam sayıları için
$$3a + 4b = 5c + 1$$
eşitliği sağlanmaktadır.
Buna göre,
I. $a + c$ tek sayıdır.
II. $b$ çift sayıdır.
III. $a \cdot c$ çift sayıdır.
ifadelerinden hangileri her zaman doğrudur?',
   '{"options":["Yalnız I","Yalnız II","I ve II","I ve III","II ve III"],"correctIndex":3}'::jsonb,
   '$4b$ terimi $b$ tam sayısı ne olursa olsun her zaman çifttir; dolayısıyla $b$''nin tek mi çift mi olduğu belirlenemez (II kesin değildir). Eşitliğin sol tarafı $3a + \text{çift}$, sağ tarafı $5c + 1$ biçimindedir. $3$ ve $5$ tek katsayılar olduğu için $3a$''nın tekliği $a$''nın, $5c$''nin tekliği $c$''nin tekliğiyle aynıdır. Buna göre $a$ çift ise $5c + 1$ çift olacağından $c$ tektir; $a$ tek ise $5c + 1$ tek olacağından $c$ çifttir. Her iki durumda da $a$ ve $c$ zıt paritededir; biri tek biri çift olduğundan $a + c$ toplamı her zaman tek (I doğru), $a \cdot c$ çarpımı ise her zaman çifttir (III doğru).',
   'C şıkkı (I ve II), denklemde $4b$ terimini görüp $b$''nin de çift olmak zorunda olduğunu sanan adayı yakalar. Oysa $4$ çarpanı nedeniyle $b$ tek bir tam sayı olsa bile $4b$ çift kalır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-01-003
  ('3c0fc780-50bd-5c02-a542-51f9fba45fc7'::uuid, 'Matematik & Geometri', 'Temel Kavramlar ve Sayı Basamakları', 'multiple_choice', 2,
   '$x$, $y$ ve $z$ sıfırdan farklı gerçel sayılar olmak üzere
$x^2 \cdot y < 0$
$y \cdot z < 0$
$x \cdot z^3 < 0$
eşitsizlikleri veriliyor.
Buna göre $x$, $y$ ve $z$ sayılarının işaretleri sırasıyla aşağıdakilerden hangisidir?',
   '{"options":["$-, -, +$","$-, +, -$","$+, -, +$","$+, +, -$","$-, +, +$"],"correctIndex":0}'::jsonb,
   '$x \neq 0$ olduğundan $x^2 > 0$''dır. İlk eşitsizlikten $x^2 \cdot y < 0$ olduğuna göre $y < 0$ (negatif) olmalıdır. İkinci eşitsizlikte $y < 0$ ve $y \cdot z < 0$ olduğundan $z > 0$ (pozitif) bulunur. Üçüncü eşitsizlikte $z > 0$ olduğu için $z^3 > 0$ olur; çarpımın negatif kalması için $x < 0$ (negatif) olmalıdır. İşaretler sırasıyla $-, -, +$ şeklindedir.',
   'C şıkkı ($+, -, +$), ilk eşitsizlikten $y < 0$ ve $z > 0$ bulduktan sonra $x^2$''nin pozitifliğini $x$''in kendisi pozitifmiş gibi yorumlayan adayı yakalar. Bir sayının karesinin pozitif olması, o sayının işaretini değil yalnızca sıfırdan farklı olduğunu gösterir.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-01-004 · doğrulandı
  ('5ae0277a-bf7b-5f31-a2a1-1950c94a7c1d'::uuid, 'Matematik & Geometri', 'Temel Kavramlar ve Sayı Basamakları', 'multiple_choice', 1,
   'Ardışık beş çift tam sayının toplamı $140$''tır.
Buna göre bu sayıların en küçüğü ile en büyüğünün çarpımı kaçtır?',
   '{"options":["640","700","720","756","768"],"correctIndex":4}'::jsonb,
   'Ardışık beş çift tam sayının ortancası toplamın terim sayısına bölünmesiyle bulunur: $140 \div 5 = 28$. Ardışık çift sayılar ikişer ikişer arttığı için bu beş sayı $24, 26, 28, 30, 32$ olur. En küçük sayı $24$, en büyük sayı $32$''dir; çarpımları $24 \cdot 32 = 768$ olarak bulunur.',
   'D şıkkı (756), ortanca sayı $28$''i bulduktan sonra sayıları birer birer artan ardışık tam sayı sanıp $26 \cdot 30$ ya da $27 \cdot 28$ gibi hatalı uç değerler seçen adayı yakalar. Çift sayılarda ardışık iki terim arasındaki fark $2$''dir.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-01-005 · doğrulandı
  ('18092adc-7ebe-542b-85bb-4d728f848dcd'::uuid, 'Matematik & Geometri', 'Temel Kavramlar ve Sayı Basamakları', 'multiple_choice', 2,
   '$a$ ve $b$ asal sayılar olmak üzere
$$a^2 - b^2 = 165$$
eşitliği sağlanmaktadır.
Buna göre $a \cdot b$ çarpımı kaçtır?',
   '{"options":["15","22","26","38","58"],"correctIndex":2}'::jsonb,
   'İki kare farkı özdeşliğiyle $(a - b)(a + b) = 165$ yazılır. $165 = 3 \cdot 5 \cdot 11$ pozitif çarpan çiftleri incelenir: $(1, 165)$ için $a = 83, b = 82$ ($82$ asal değil); $(3, 55)$ için $a = 29, b = 26$ ($26$ asal değil); $(5, 33)$ için $a = 19, b = 14$ ($14$ asal değil); $(11, 15)$ için $a = 13, b = 2$ (ikisi de asal). Dolayısıyla tek çözüm $a = 13$ ve $b = 2$''dir; çarpımları $13 \cdot 2 = 26$ bulunur.',
   'D şıkkı (38), $(5, 33)$ çarpan çiftinden $a = 19$ bulup $19$''un asal olmasından hareketle $b$''nin asal olup olmadığını denetlemeden $19 \cdot 2 = 38$ işaretleyen adayı yakalar. $2$ dışındaki tüm asal sayılar tek olduğundan iki tek asalın toplamı ve farkı çift olamaz; bu nedenle küçük asal mutlaka $2$ olmalıdır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-01-006 · doğrulandı
  ('6a2c9e31-6d1c-5c5a-acb6-88bdac74186e'::uuid, 'Matematik & Geometri', 'Temel Kavramlar ve Sayı Basamakları', 'multiple_choice', 2,
   'Rakamları sıfırdan ve birbirinden farklı üç basamaklı bir $ABC$ doğal sayısının yüzler basamağındaki rakamın basamak değeri, birler basamağındaki rakamın basamak değerinin $25$ katıdır. Onlar basamağındaki rakam ise yüzler ve birler basamağındaki rakamların toplamına eşittir.
Buna göre $ABC$ sayısı kaçtır?',
   '{"options":["124","145","152","154","289"],"correctIndex":3}'::jsonb,
   'Yüzler basamağındaki $A$ rakamının basamak değeri $100A$, birler basamağındaki $C$ rakamının basamak değeri $C$''dir. Verilen koşuldan $100A = 25C$, yani $C = 4A$ elde edilir. $A$ ve $C$ sıfırdan farklı birer rakam olduğundan $A = 1$ için $C = 4$, $A = 2$ için $C = 8$ olur. Ancak onlar basamağındaki $B = A + C$ rakamı tek haneli olmalıdır: $A = 2$ durumunda $B = 2 + 8 = 10$ çıkacağından elenir. $A = 1, C = 4$ seçildiğinde $B = 1 + 4 = 5$ olur ve sayı $154$ bulunur.',
   'B şıkkı (145), $A = 1, B = 5, C = 4$ rakamlarını doğru bulduktan sonra onlar ve birler basamağının yerini karıştıran adayı yakalar. Soruda $4$''ün birler, $5$''in onlar basamağı olduğu açıkça verilmiştir.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-01-007 · doğrulandı
  ('55c1c701-eb63-5ab3-b823-c3b4f07f9a24'::uuid, 'Matematik & Geometri', 'Temel Kavramlar ve Sayı Basamakları', 'multiple_choice', 2,
   'Üç basamaklı $ABA$ doğal sayısı ile iki basamaklı $AB$ doğal sayısının farkı
$$ABA - AB = 318$$
olduğuna göre $A^2 + B^2$ toplamı kaçtır?',
   '{"options":["25","34","41","52","65"],"correctIndex":1}'::jsonb,
   'Basamak çözümlemesi yapılırsa $ABA = 100A + 10B + A = 101A + 10B$ ve $AB = 10A + B$ olur. Fark alındığında $(101A + 10B) - (10A + B) = 91A + 9B = 318$ elde edilir. $A$ sıfırdan farklı bir rakam olmak üzere değer denenirse $A = 1$ için $9B = 227$ ve $A = 2$ için $9B = 136$ tam bölünmez; $A = 3$ için $91 \cdot 3 = 273$ ve $9B = 318 - 273 = 45$ olduğundan $B = 5$ bulunur ($A \ge 4$ için $91A > 318$). O hâlde $A^2 + B^2 = 3^2 + 5^2 = 9 + 25 = 34$ olur.',
   'C şıkkı (41), $ABA$''yı $100A + 10B$ gibi eksik çözümleyip $A$ ve $B$ için yanlış rakamlara (örneğin $4$ ve $5$) ulaşan adayı yakalar. Yüzler ve birler basamağındaki aynı $A$ harfinin toplam katkısı $101A$''dır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-01-008 · doğrulandı
  ('80e2ed84-f345-56bb-9c97-206653cdabfa'::uuid, 'Matematik & Geometri', 'Temel Kavramlar ve Sayı Basamakları', 'multiple_choice', 1,
   '$n$ bir pozitif tam sayı olmak üzere
$$\dfrac{(n + 1)! + n!}{(n + 1)! - n!} = \dfrac{7}{5}$$
eşitliğini sağlayan $n$ değeri kaçtır?',
   '{"options":["3","4","5","6","7"],"correctIndex":2}'::jsonb,
   'Pay ve payda $n!$ ortak çarpan parantezine alınır:
$$\dfrac{n!((n + 1) + 1)}{n!((n + 1) - 1)} = \dfrac{n + 2}{n} = \dfrac{7}{5}$$
İçler dışlar çarpımı yapıldığında $5(n + 2) = 7n \Rightarrow 5n + 10 = 7n \Rightarrow 2n = 10 \Rightarrow n = 5$ bulunur.',
   'D şıkkı ($6$), paydadaki $(n + 1)! - n!$ sadeleştirmesinde $-1$''i unutup $n + 1 = 6$ sonucuna giden veya bulduğu $n$ yerine $n + 1$ değerini işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-01-009 · doğrulandı
  ('4a75cf22-4396-5504-be0a-397b7a2bbf05'::uuid, 'Matematik & Geometri', 'Temel Kavramlar ve Sayı Basamakları', 'multiple_choice', 2,
   '$$18! + 19!$$
sayısının sondan kaç basamağı sıfırdır?',
   '{"options":["2","3","4","5","6"],"correctIndex":2}'::jsonb,
   'İfade küçük olan faktöriyel parantezine alınır: $18! + 19! = 18!(1 + 19) = 18! \cdot 20$. Sondaki sıfır sayısını $10 = 2 \cdot 5$ çarpanlarının adedi ve belirleyici olarak daha az bulunan $5$ çarpanı tayin eder. $18!$ içinde $\lfloor 18 \div 5 \rfloor = 3$ tane $5$ çarpanı vardır. Yanındaki $20 = 4 \cdot 5$ çarpanından da $1$ tane daha $5$ çarpanı geldiği için toplam $3 + 1 = 4$ tane $5$ çarpanı bulunur (yeterince $2$ çarpanı vardır). Dolayısıyla sayının sondan $4$ basamağı sıfırdır.',
   'B şıkkı (3), yalnızca $18!$ içindeki $5$ çarpanlarını sayıp parantez dışından gelen $1 + 19 = 20$ çarpanındaki $5$''i unutan adayı yakalar. E şıkkı (6) ise $18!$ ve $19!$''in ayrı ayrı sondan sıfır sayılarını ($3 + 3$) toplayan adayın düştüğü tuzaktır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-01-010 · doğrulandı
  ('2e9dd3fd-27bb-5104-ad2e-fa325d2682a9'::uuid, 'Matematik & Geometri', 'Temel Kavramlar ve Sayı Basamakları', 'multiple_choice', 3,
   '$1$''den $n$''ye kadar olan ardışık doğal sayıların yazılı olduğu bir listeden ardışık iki doğal sayı siliniyor. Kalan sayıların toplamı $195$ olduğuna göre silinen sayılardan büyük olanı kaçtır?',
   '{"options":["4","5","6","7","8"],"correctIndex":4}'::jsonb,
   '$1$''den $n$''ye kadar olan sayıların toplamı $\dfrac{n(n + 1)}{2}$''dir. Silinen ardışık iki sayı $k$ ve $k + 1$ ($1 \le k \le n - 1$) ise toplamları $2k + 1$ olur; bu toplam tek sayıdır ve en az $3$, en çok $2n - 1$ olabilir.
$n = 19$ için $\dfrac{19 \cdot 20}{2} = 190 < 195$ olduğundan yetmez.
$n = 20$ için $\dfrac{20 \cdot 21}{2} = 210$ olur ve silinen toplam $210 - 195 = 15$ bulunur; $2k + 1 = 15 \Rightarrow k = 7$ (uygun aralıktadır).
$n = 21$ için $231 - 195 = 36$ çift sayıdır ($2k + 1$''e eşit olamaz); $n \ge 22$ için ise fark en az $253 - 195 = 58 > 2n - 1$ olacağından imkânsızdır.
Silinen sayılar $7$ ve $8$ olup büyük olanı $8$''dir.',
   'D şıkkı (7), $2k + 1 = 15$ denkleminden $k = 7$ değerini bulup küçük olan sayıyı işaretleyen adayı yakalar. Soru silinen ardışık iki sayıdan büyük olanını ($k + 1 = 8$) sormaktadır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-01-011 · şekilli
  ('49187b35-d8d5-5c8e-88cd-e92bb9e8a797'::uuid, 'Matematik & Geometri', 'Temel Kavramlar ve Sayı Basamakları', 'multiple_choice', 2,
   'Sayı doğrusunda gösterilen $a$, $b$ ve $c$ gerçel sayıları $-2 < a < -1 < 0 < b < 1 < c < 2$ eşitsizliğini sağlamaktadır.
Buna göre,
I. $b - a$
II. $a + c$
III. $a(b - c)$
ifadelerinden hangileri her zaman pozitiftir?',
   '{"options":["Yalnız I","Yalnız III","I ve II","I ve III","I, II ve III"],"correctIndex":3}'::jsonb,
   '$b > 0$ ve $a < 0$ olduğundan $b > a$''dır; büyük sayıdan küçük sayı çıkarıldığında $b - a > 0$ her zaman pozitiftir (I doğru). II numaralı ifadede $a \in (-2, -1)$ ve $c \in (1, 2)$ aralığındadır; örneğin $a = -1{,}8$ ve $c = 1{,}2$ seçilirse $a + c = -0{,}6 < 0$ olur, yani her zaman pozitif değildir (II yanlış). III numaralı ifadede $a < 0$ ve $b < c$ olduğu için $b - c < 0$ olur; iki negatif sayının çarpımı olan $a(b - c)$ her zaman pozitiftir (III doğru).',
   'E şıkkı (I, II ve III), şekilde $c$''nin sıfıra olan uzaklığının $a$''nınkine kıyasla biraz daha büyük görünmesine aldanıp $a + c$''nin de kesinlikle pozitif olduğunu düşünen adayı yakalar. Aralık verilerinde uç değerler ($a = -1{,}9$, $c = 1{,}1$) denenerek işaretin değişebildiği kontrol edilmelidir.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 300 64" width="300" height="64" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><line x1="12" y1="30" x2="292" y2="30"/><path d="M292 30 l-8 -4 m8 4 l-8 4"/><path d="M12 30 l8 -4 m-8 4 l8 4"/><line x1="30" y1="25" x2="30" y2="35" stroke-width="1.2"/><text x="30" y="51.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">-3</text><line x1="70" y1="25" x2="70" y2="35" stroke-width="1.2"/><text x="70" y="51.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">-2</text><line x1="110" y1="25" x2="110" y2="35" stroke-width="1.2"/><text x="110" y="51.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">-1</text><line x1="150" y1="25" x2="150" y2="35" stroke-width="1.2"/><text x="150" y="51.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">0</text><line x1="190" y1="25" x2="190" y2="35" stroke-width="1.2"/><text x="190" y="51.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">1</text><line x1="230" y1="25" x2="230" y2="35" stroke-width="1.2"/><text x="230" y="51.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">2</text><line x1="270" y1="25" x2="270" y2="35" stroke-width="1.2"/><text x="270" y="51.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">3</text><text x="94" y="16.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13" font-style="italic">a</text><text x="166" y="16.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13" font-style="italic">b</text><text x="214" y="16.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13" font-style="italic">c</text><circle cx="94" cy="30" r="5" fill="currentColor" stroke="none"/><circle cx="166" cy="30" r="5" fill="currentColor" stroke="none"/><circle cx="214" cy="30" r="5" fill="currentColor" stroke="none"/></svg>', true),
  -- mat-01-012 · doğrulandı
  ('df9b9e86-0275-5b58-b677-874608e99a72'::uuid, 'Matematik & Geometri', 'Temel Kavramlar ve Sayı Basamakları', 'multiple_choice', 3,
   'Üç basamaklı bir $ABC$ doğal sayısının sağına $2$ rakamı yazılarak dört basamaklı $ABC2$ sayısı, soluna $3$ rakamı yazılarak dört basamaklı $3ABC$ sayısı elde ediliyor.
$$ABC2 - 3ABC = 1.655$$
olduğuna göre $A + B + C$ toplamı kaçtır?',
   '{"options":["11","12","13","14","15"],"correctIndex":2}'::jsonb,
   'Üç basamaklı sayı $x = ABC$ olarak adlandırılırsa sağına $2$ yazmak sayıyı $10$ ile çarpıp $2$ eklemek demektir: $ABC2 = 10x + 2$. Soluna $3$ yazmak ise binler basamağına $3$ eklemektir: $3ABC = 3.000 + x$. Verilen fark denkleminde yerine konursa $(10x + 2) - (3.000 + x) = 1.655 \Rightarrow 9x - 2.998 = 1.655 \Rightarrow 9x = 4.653 \Rightarrow x = 517$ bulunur. $ABC = 517$ olduğundan rakamlar toplamı $5 + 1 + 7 = 13$ olur.',
   'B şıkkı (12), $3ABC$ sayısını çıkarırken $+2$ ve $-3.000$ terimlerinin işaretini karıştırıp $9x = 4.653$ yerine hatalı bir bölme veya rakam toplamı elde eden adayı yakalar. Dört basamaklı çözümlemeyi tek tek $1000A + \ldots$ açmak yerine $ABC$ bloğunu $x$ değişkeni olarak tutmak işlem hatasını önler.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-01-013 · doğrulandı
  ('abe77194-4d71-5c30-a242-07650a128d74'::uuid, 'Matematik & Geometri', 'Temel Kavramlar ve Sayı Basamakları', 'multiple_choice', 1,
   '$a$, $b$ ve $c$ birbirinden farklı pozitif tam sayılar olmak üzere
$$3a + 2b + c = 28$$
eşitliğini sağlayan en büyük $a$ değeri kaçtır?',
   '{"options":["8","7","9","6","10"],"correctIndex":0}'::jsonb,
   '$a$''nın en büyük değerini alması için $2b + c$ toplamı en küçük seçilmelidir. Katsayısı büyük olan $b$ en küçük pozitif tam sayı $1$, $c$ ise farklı pozitif tam sayı $2$ seçilirse $2(1) + 2 = 4$ olur. Buradan $3a = 28 - 4 = 24 \Rightarrow a = 8$ bulunur ($a = 9$ için $2b + c = 1$ gerekir, pozitif tam sayılarla imkânsızdır).',
   'C şıkkı (9), "pozitif tam sayı" şartını sıfır dahil sanıp $b = 0, c = 1$ alarak $3a = 27 \Rightarrow a = 9$ bulan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-01-014 · doğrulandı
  ('235e16ea-0b01-5703-bb56-1fc519ed51d2'::uuid, 'Matematik & Geometri', 'Temel Kavramlar ve Sayı Basamakları', 'multiple_choice', 1,
   '$x$ ve $y$ birer tam sayı olmak üzere $x \cdot y = 24$ eşitliği verilmektedir.
Buna göre $x + y$ toplamı aşağıdakilerden hangisi olamaz?',
   '{"options":["-25","-14","-10","13","25"],"correctIndex":3}'::jsonb,
   '$x$ ve $y$ "tam sayı" olduğu için negatif çarpan çiftleri de dikkate alınmalıdır. Çarpımları $24$ olan tam sayı ikilileri ve toplamları:
- $(1, 24) \rightarrow 25$ ve $(-1, -24) \rightarrow -25$
- $(2, 12) \rightarrow 14$ ve $(-2, -12) \rightarrow -14$
- $(3, 8) \rightarrow 11$ ve $(-3, -8) \rightarrow -11$
- $(4, 6) \rightarrow 10$ ve $(-4, -6) \rightarrow -10$
Dolayısıyla $x + y$ toplamı $13$ değerini alamaz.',
   'A şıkkı ($-25$) veya B şıkkı ($-14$), sorudaki "tam sayı" ifadesini "pozitif tam sayı" sanıp negatif toplamların olamayacağını düşünen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-01-015
  ('de022aca-8d0d-5d6e-8e85-757eac380444'::uuid, 'Matematik & Geometri', 'Temel Kavramlar ve Sayı Basamakları', 'multiple_choice', 2,
   '$a$, $b$ ve $c$ pozitif tam sayılar olmak üzere
$$\dfrac{a \cdot b + 3}{2} = c$$
eşitliğinde $c$ bir tek tam sayıdır.
Buna göre aşağıdakilerden hangisi her zaman bir çift sayıdır?',
   '{"options":["$a \\cdot b$","$a + 2b$","$a + b$","$a^b + 2$","$2a + b$"],"correctIndex":2}'::jsonb,
   'Eşitlikten $a \cdot b + 3 = 2c$ yazılır. $c$ tam sayı olduğundan $2c$ kesinlikle çifttir. $3$ tek sayı olduğuna göre toplamın çift çıkması için $a \cdot b$ çarpımı mutlaka tek olmalıdır. İki tam sayının çarpımı tek ise her ikisi de tek sayıdır ($a$ tek, $b$ tek). İki tek sayının toplamı olan $a + b$ her zaman çifttir.',
   'A şıkkı ($a \cdot b$), soruda verilen "$c$ tek sayıdır" bilgisini karıştırıp $a \cdot b$''nin de çift olacağını sanan adayı yakalar. Oysa $2c$ daima çift olduğu için $a \cdot b + 3$ çifttir.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-01-016 · doğrulandı
  ('97bf5c3b-4428-5850-a4d7-68721a71837a'::uuid, 'Matematik & Geometri', 'Temel Kavramlar ve Sayı Basamakları', 'multiple_choice', 2,
   'Ardışık altı tek tam sayının toplamı $156$''dır.
Buna göre bu sayıların en küçüğü kaçtır?',
   '{"options":["17","19","23","25","21"],"correctIndex":4}'::jsonb,
   'Ardışık $6$ tek tam sayının aritmetik ortalaması $\dfrac{156}{6} = 26$''dır. Terim sayısı çift olduğu için bu ortalama, ortadaki iki tek sayının ($25$ ve $27$) tam ortasıdır. Buna göre sayılar $21, 23, 25, 27, 29, 31$ olur ve en küçük sayı $21$ bulunur.',
   'D şıkkı (25), ortadaki sayılardan küçüğü olan $25$''i en küçük sayı sanan adayı; B şıkkı (19) ise $26$''dan geriye yanlış adımda gidenleri yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-01-017 · doğrulandı
  ('9fcc6726-beda-58a8-9de5-6ac02c478fff'::uuid, 'Matematik & Geometri', 'Temel Kavramlar ve Sayı Basamakları', 'multiple_choice', 2,
   '$$11 + 15 + 19 + \cdots + 75$$
toplamının sonucu kaçtır?',
   '{"options":["688","731","748","774","817"],"correctIndex":1}'::jsonb,
   'Terimler $4$''er artmaktadır. Önce terim sayısı bulunur: $\dfrac{75 - 11}{4} + 1 = \dfrac{64}{4} + 1 = 16 + 1 = 17$ terim. Ardından terimler toplamı hesaplanır: $\dfrac{11 + 75}{2} \cdot 17 = 43 \cdot 17 = 731$ bulunur.',
   'A şıkkı (688), terim sayısını hesaplarken sondaki $+1$''i ekleyip $17$ bulmak yerine $\dfrac{75 - 11}{4} = 16$ alıp $43 \cdot 16 = 688$ hesaplayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-01-018 · doğrulandı
  ('71d782aa-0921-50f6-bae2-a2ca07618a15'::uuid, 'Matematik & Geometri', 'Temel Kavramlar ve Sayı Basamakları', 'multiple_choice', 2,
   '$(2x - 3)$ ve $(y + 4)$ aralarında asal pozitif tam sayılar olmak üzere
$$\dfrac{2x - 3}{y + 4} = \dfrac{36}{60}$$
eşitliği verilmektedir.
Buna göre $x + y$ toplamı kaçtır?',
   '{"options":["4","5","8","24","76"],"correctIndex":0}'::jsonb,
   '$(2x - 3)$ ve $(y + 4)$ aralarında asal olduğundan eşitliğin sağ tarafındaki kesir en sade hâle getirilir: $\dfrac{36}{60} = \dfrac{3}{5}$ ($\text{EBOB}(3, 5) = 1$). Aralarında asal iki orantıda pay paya, payda paydaya eşitlenir: $2x - 3 = 3 \Rightarrow x = 3$ ve $y + 4 = 5 \Rightarrow y = 1$. Toplam $x + y = 3 + 1 = 4$ bulunur.',
   'E şıkkı (76), kesri sadeleştirmeden doğrudan $2x - 3 = 36$ veya $y + 4 = 60$ almaya çalışan ya da $x$ ve $y$''nin tam sayı olması için mutlaka en sade hâle gelmesi gerektiğini unutan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-01-019 · doğrulandı
  ('1ad55141-45e0-524b-be35-10d234525730'::uuid, 'Matematik & Geometri', 'Temel Kavramlar ve Sayı Basamakları', 'multiple_choice', 1,
   '$n$ bir doğal sayı olmak üzere
$$\dfrac{(n + 2)!}{n!} = 56$$
eşitliği sağlanmaktadır.
Buna göre $(n - 1)!$ değeri kaçtır?',
   '{"options":["6","24","60","720","120"],"correctIndex":4}'::jsonb,
   'Paydaki faktöriyel paydaya kadar açılır: $\dfrac{(n + 2)(n + 1) \cdot n!}{n!} = 56 \Rightarrow (n + 2)(n + 1) = 56$. Ardışık iki sayının çarpımı $8 \cdot 7 = 56$ olduğundan $n + 1 = 7 \Rightarrow n = 6$ bulunur. İstenen değer $(6 - 1)! = 5! = 120$''dir.',
   'D şıkkı (720), $n = 6$ bulduktan sonra $(n - 1)! = 5!$ yerine $n! = 6! = 720$ hesaplayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-01-020 · doğrulandı
  ('a12218d2-3a4c-5b8d-96c6-fa95175b7f41'::uuid, 'Matematik & Geometri', 'Temel Kavramlar ve Sayı Basamakları', 'multiple_choice', 2,
   '$A$ ve $B$ sıfırdan farklı rakamlar olmak üzere iki basamaklı $AB$ sayısının rakamları yer değiştirildiğinde elde edilen iki basamaklı $BA$ sayısı, $AB$ sayısından $45$ fazladır.
Bu koşulu sağlayan kaç farklı $AB$ sayısı vardır?',
   '{"options":["2","3","4","5","8"],"correctIndex":2}'::jsonb,
   '$BA - AB = 45$ eşitliği basamak çözümlemesiyle açılır: $(10B + A) - (10A + B) = 45 \Rightarrow 9(B - A) = 45 \Rightarrow B - A = 5$. Sıfırdan farklı rakamlar için $(A, B)$ ikilileri $(1, 6)$, $(2, 7)$, $(3, 8)$ ve $(4, 9)$ olabilir. Dolayısıyla $16, 27, 38, 49$ olmak üzere $4$ farklı sayı vardır.',
   'D şıkkı (5), "sıfırdan farklı" şartını unutup $(0, 5)$ ikilisini ($05$) de geçerli sayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-01-021 · doğrulandı
  ('be4dc65f-715b-5fe9-a03b-9c0fb25cb64e'::uuid, 'Matematik & Geometri', 'Temel Kavramlar ve Sayı Basamakları', 'multiple_choice', 2,
   'Üç basamaklı bir $ABC$ doğal sayısının yüzler basamağındaki rakam $2$ artırılır, onlar basamağındaki rakam $3$ azaltılır ve birler basamağındaki rakam $4$ artırılırsa sayının değeri kaç artar?',
   '{"options":["134","166","170","174","234"],"correctIndex":3}'::jsonb,
   'Basamak değerlerindeki değişimler toplanır: yüzler basamağı $+2 \cdot 100 = +200$, onlar basamağı $-3 \cdot 10 = -30$ ve birler basamağı $+4 \cdot 1 = +4$ değişir. Net değişim $200 - 30 + 4 = 174$ artış olur.',
   'E şıkkı (234), onlar basamağındaki $3$ azalmayı çıkarmak yerine ekleyen ($200 + 30 + 4 = 234$) adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-01-022 · doğrulandı
  ('957c63a6-db42-54d2-b642-4ef134bdcc16'::uuid, 'Matematik & Geometri', 'Temel Kavramlar ve Sayı Basamakları', 'multiple_choice', 1,
   'Rakamları sıfırdan ve birbirinden farklı üç basamaklı bir doğal sayının rakamlarının yerleri değiştirilerek yazılabilen en büyük sayı ile en küçük sayı arasındaki fark $594$''tür.
Buna göre bu sayının en büyük rakamı ile en küçük rakamı arasındaki fark kaçtır?',
   '{"options":["5","6","7","8","9"],"correctIndex":1}'::jsonb,
   'Rakamları büyükten küçüğe $x > y > z > 0$ olsun. Bu rakamlarla yazılabilecek en büyük üç basamaklı sayı $xyz$, en küçük üç basamaklı sayı ise $zyx$''tir. Basamak çözümlemesi yapılırsa:
$$xyz - zyx = 99(x - z) = 594 \Rightarrow x - z = 6$$
En büyük rakam $x$ ile en küçük rakam $z$ arasındaki fark $6$ bulunur.',
   'A şıkkı ($5$) veya C şıkkı ($7$), $594 \div 99$ bölmesinde tahmini değer deneyen ya da ortadaki $y$ rakamının farkı etkilediğini sanan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-01-023 · doğrulandı
  ('05bb94da-a652-5ec8-aefd-c50eb12fdba8'::uuid, 'Matematik & Geometri', 'Temel Kavramlar ve Sayı Basamakları', 'multiple_choice', 3,
   '$x$ ve $y$ pozitif tam sayılar olmak üzere
$$25! = 12^x \cdot y$$
eşitliğinde $x$''in alabileceği en büyük değer kaçtır?',
   '{"options":["2","8","10","11","22"],"correctIndex":2}'::jsonb,
   '$12 = 2^2 \cdot 3$ olduğundan $25!$ içindeki $2^2$ çiftlerinin sayısı ile $3$ çarpanlarının sayısından küçük olanı $x$''in en büyük değerini belirler.
$25!$ içindeki $3$ çarpanları: $\lfloor 25 \div 3 \rfloor + \lfloor 8 \div 3 \rfloor = 8 + 2 = 10$ adettir.
$25!$ içindeki $2$ çarpanları: $\lfloor 25 \div 2 \rfloor + \lfloor 12 \div 2 \rfloor + \lfloor 6 \div 2 \rfloor + \lfloor 3 \div 2 \rfloor = 12 + 6 + 3 + 1 = 22$ adettir; bundan $\lfloor 22 \div 2 \rfloor = 11$ tane $2^2$ oluşur.
$11$ tane $2^2$ ve $10$ tane $3$ ile en fazla $10$ tane $12$ oluşturulabilir; dolayısıyla $x = 10$ bulunur.',
   'D şıkkı (11), $2^2$ sayısını hesaplayıp $3$ çarpanlarını kontrol etmeden $11$''i seçen; B şıkkı (8) ise $\lfloor 25 \div 9 \rfloor$''u eklemeyi unutan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-01-024 · doğrulandı
  ('fac8e323-76f1-5452-a78e-f1047f3b64d9'::uuid, 'Matematik & Geometri', 'Temel Kavramlar ve Sayı Basamakları', 'multiple_choice', 2,
   '$$A = 4 + 7 + 10 + \cdots + 61$$
$$B = 2 + 5 + 8 + \cdots + 59$$
olduğuna göre $A - B$ farkı kaçtır?',
   '{"options":["38","40","42","58","60"],"correctIndex":1}'::jsonb,
   'Her iki toplamdaki terim sayısı $\dfrac{61 - 4}{3} + 1 = 19 + 1 = 20$''dir. İki dizi terim terime çıkarıldığında her terim çiftinin farkı sabittir: $(4 - 2) + (7 - 5) + \cdots + (61 - 59) = 2 + 2 + \cdots + 2$ ($20$ kez). Buna göre $A - B = 20 \cdot 2 = 40$ bulunur.',
   'A şıkkı (38), terim sayısını $20$ yerine $19$ bularak $19 \cdot 2 = 38$ işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-01-025 · doğrulandı
  ('27ca7551-5259-548f-9267-e5c065ee291f'::uuid, 'Matematik & Geometri', 'Temel Kavramlar ve Sayı Basamakları', 'multiple_choice', 3,
   'Bir öğrenci iki basamaklı bir $AB$ sayısını $24$ ile çarparken ikinci satırı bir basamak sola kaydırmak yerine, yanlışlıkla birinci satırla aynı hizaya yazarak alt alta toplamış ve sonucu $270$ bulmuştur.
Buna göre bu çarpma işleminin doğru sonucu kaçtır?',
   '{"options":["45","540","900","1.008","1.080"],"correctIndex":4}'::jsonb,
   'Doğru işlemde $4 \cdot AB$ ile $20 \cdot AB$ toplanırken, kaydırma yapılmadan alt alta hizalandığında $4 \cdot AB$ ile $2 \cdot AB$ toplanmış olur. Buna göre $4 \cdot AB + 2 \cdot AB = 6 \cdot AB = 270 \Rightarrow AB = \dfrac{270}{6} = 45$ bulunur. Doğru çarpma sonucu $45 \cdot 24 = 1.080$''dir.',
   'A şıkkı (45), $AB$ sayısını bulup $24$ ile çarpmayı unutan adayı yakalar. D şıkkı (1.008) ise kaydırma hatasında $AB = 42$ gibi işlem hatası yapanların seçtiği şıktır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-01-026 · doğrulandı
  ('e101d9fb-a59a-59e5-842d-bd47ab972e94'::uuid, 'Matematik & Geometri', 'Temel Kavramlar ve Sayı Basamakları', 'multiple_choice', 3,
   '$x$, $y$ ve $z$ sıfırdan farklı birer rakam olmak üzere
$$x \cdot y = 12 \quad \text{ve} \quad y \cdot z = 18$$
eşitlikleri verilmektedir.
Buna göre üç basamaklı $xyz$ doğal sayısının alabileceği en büyük değer ile en küçük değerin farkı kaçtır?',
   '{"options":["366","193","283","386","466"],"correctIndex":0}'::jsonb,
   '$y$ hem $12$''nin hem $18$''in ortak böleni olan bir rakamdır: $y \in \{1, 2, 3, 6\}$.
$y = 1$ için $x = 12$ (rakam değildir, elenir).
$y = 2$ için $x = 6, z = 9 \Rightarrow xyz = 629$.
$y = 3$ için $x = 4, z = 6 \Rightarrow xyz = 436$.
$y = 6$ için $x = 2, z = 3 \Rightarrow xyz = 263$.
En büyük değer $629$, en küçük değer $263$ olduğundan fark $629 - 263 = 366$ bulunur.',
   'B şıkkı (193), yalnızca $629 - 436$ farkını alan veya $y = 6$ durumunu gözden kaçıran adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-01-027
  ('a1fc50a9-f51d-5e32-a210-1cefca2a3c08'::uuid, 'Matematik & Geometri', 'Temel Kavramlar ve Sayı Basamakları', 'multiple_choice', 1,
   '$a$, $b$ ve $c$ gerçel sayıları için $a < b < 0 < c$ sıralaması verilmektedir.
Buna göre aşağıdakilerden hangisi kesinlikle pozitiftir?',
   '{"options":["$a + b$","$(b - a) \\cdot c$","$a \\cdot c$","$a + c$","$b - c$"],"correctIndex":1}'::jsonb,
   '$a < b$ olduğundan büyük sayıdan küçük sayı çıkarıldığında $b - a > 0$ pozitiftir. $c > 0$ da pozitif olduğundan iki pozitif sayının çarpımı olan $(b - a) \cdot c > 0$ her zaman pozitiftir. Diğer şıklarda $a + b < 0$, $a \cdot c < 0$, $b - c < 0$ negatiftir; $a + c$ ise değerlere göre işaret değiştirebilir.',
   'D şıkkı ($a + c$), $c$''nin pozitif olmasından dolayı toplamın da pozitif olacağını sanan adayı yakalar; oysa $a = -5$ ve $c = 1$ seçilirse $a + c = -4 < 0$ olur.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-01-028
  ('d912e79e-31ba-57b8-ae7b-6029521f8972'::uuid, 'Matematik & Geometri', 'Temel Kavramlar ve Sayı Basamakları', 'multiple_choice', 1,
   '$m$ ve $n$ birer tam sayı olmak üzere
$$m \cdot (n + 2) = 15$$
eşitliği sağlanmaktadır.
Buna göre,
I. $m$ tek sayıdır.
II. $n$ tek sayıdır.
III. $m + n$ tek sayıdır.
ifadelerinden hangileri her zaman doğrudur?',
   '{"options":["Yalnız I","Yalnız II","I ve II","I ve III","I, II ve III"],"correctIndex":2}'::jsonb,
   'İki tam sayının çarpımı tek sayı ($15$) olduğuna göre her iki çarpan da mutlaka tek tam sayıdır. Dolayısıyla $m$ tek sayıdır (I doğru) ve $n + 2$ de tek sayıdır. $2$ çift sayı olduğu için $n + 2$''nin tek kalabilmesi adına $n$ kesinlikle tek sayı olmalıdır (II doğru). İki tek sayının toplamı çift olacağından $m + n$ tek değil çifttir (III yanlış).',
   'D şıkkı (I ve III), $n + 2$''nin tek olmasından $n$''nin çift olması gerektiğini zanneden adayı yakalar. Oysa bir tam sayıya çift sayı ($2$) eklendiğinde sayının tekliği veya çiftliği değişmez.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-01-029
  ('4cfa7e61-ffa3-522b-a7f0-4273b239e5e9'::uuid, 'Matematik & Geometri', 'Temel Kavramlar ve Sayı Basamakları', 'multiple_choice', 2,
   '$x$, $y$ ve $z$ tam sayılar olmak üzere
$$x(y + 1) + 2z = 11$$
eşitliği sağlanmaktadır.
Buna göre aşağıdakilerden hangisi kesinlikle çifttir?',
   '{"options":["$x \\cdot y$","$x + y$","$x + 2y$","$y + 3$","$x^2 + y$"],"correctIndex":0}'::jsonb,
   '$z$ tam sayı olduğu için $2z$ daima çifttir. Eşitliğin sağ tarafı $11$ tek sayı olduğundan $x(y + 1)$ çarpımı mutlaka tek olmalıdır. İki tam sayının çarpımı tek ise ikisi de tektir: $x$ tek ve $y + 1$ tek $\Rightarrow y$ çifttir. $y$ çift olduğundan $x \cdot y$ çarpımı kesinlikle çifttir; diğer şıkların hepsi ($x + y$, $x + 2y$, $y + 3$, $x^2 + y$) kesinlikle tektir.',
   'B şıkkı ($x + y$) veya D şıkkı ($y + 3$), $y + 1$ tek olduğu için $y$''nin de tek olduğunu sanarak işaret hatası yapan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-01-030 · doğrulandı
  ('ccb99e3b-a59b-5eae-a5de-b6955506aae2'::uuid, 'Matematik & Geometri', 'Temel Kavramlar ve Sayı Basamakları', 'multiple_choice', 2,
   'Ardışık $7$ tam sayının toplamı $91$''dir.
Buna göre bu sayıların en küçüğü ile en büyüğünün toplamı kaçtır?',
   '{"options":["13","24","26","28","32"],"correctIndex":2}'::jsonb,
   'Ardışık $7$ tam sayının ortancası (ve aritmetik ortalaması) $\dfrac{91}{7} = 13$''tür. En küçük ve en büyük sayı ortancaya eşit uzaklıkta olduğundan ($10$ ve $16$) ikisinin toplamı ortancanın $2$ katıdır: $2 \cdot 13 = 26$ bulunur.',
   'A şıkkı (13), ortanca sayıyı bulup en küçük ve en büyük terimlerin toplamını almayı unutan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-01-031 · doğrulandı
  ('9c427a5a-b105-5ef4-b87e-95c1b3a9516b'::uuid, 'Matematik & Geometri', 'Temel Kavramlar ve Sayı Basamakları', 'multiple_choice', 1,
   '$$\dfrac{8! - 2 \cdot 7!}{6!}$$
işleminin sonucu kaçtır?',
   '{"options":["7","14","36","48","42"],"correctIndex":4}'::jsonb,
   'Pay kısmı $7!$ ortak çarpan parantezine alınır: $8! - 2 \cdot 7! = 7!(8 - 2) = 6 \cdot 7 \cdot 6!$. Paydadaki $6!$ ile sadeleştirilirse $6 \cdot 7 = 42$ bulunur.',
   'D şıkkı (48) veya A şıkkı (7), $8! - 2 \cdot 7!$ ifadesini $6!$ parantezine alırken $8 \cdot 7$ çarpımını eksik hesaplayan ya da $8 - 2$ çıkarma adımını yanlış kuran adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-01-032 · doğrulandı
  ('b72385ab-3092-5c63-955a-c6bf0d51600f'::uuid, 'Matematik & Geometri', 'Temel Kavramlar ve Sayı Basamakları', 'multiple_choice', 2,
   '$a$, $b$ ve $c$ asal sayılar olmak üzere $a < b < c$ ve $a + b + c = 20$ eşitliği verilmektedir.
Buna göre $c - a$ farkı en az kaç olabilir?',
   '{"options":["7","9","11","13","15"],"correctIndex":1}'::jsonb,
   'Üç asal sayının toplamı $20$ (çift) olduğuna göre üçünün birden tek olması mümkün değildir (üç tek sayının toplamı tek olur). Dolayısıyla en küçük asal sayı olan $a$ mutlaka çift asal $2$ olmalıdır. Geriye $b + c = 18$ kalır ($2 < b < c$ asal). Bu koşulu sağlayan asal ikililer $(5, 13)$ ve $(7, 11)$''dir. $c - a$ farkının en küçük olması için $c = 11$ seçilir ve $11 - 2 = 9$ bulunur.',
   'C şıkkı (11), $(5, 13)$ asal çiftinden $13 - 2 = 11$ değerini bulup daha yakın $(7, 11)$ asal çiftini denemeyi unutan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-01-033 · doğrulandı
  ('997f6bb9-e930-567b-b353-b39f58284a76'::uuid, 'Matematik & Geometri', 'Temel Kavramlar ve Sayı Basamakları', 'multiple_choice', 2,
   'Rakamları toplamı $9$ olan tüm iki basamaklı doğal sayıların toplamı kaçtır?',
   '{"options":["396","405","450","486","495"],"correctIndex":3}'::jsonb,
   'Rakamları toplamı $9$ olan iki basamaklı doğal sayılar küçükten büyüğe $18, 27, 36, 45, 54, 63, 72, 81, 90$ olmak üzere $9$ tanedir ($9$''ar artan bir dizi). Toplamları $\dfrac{18 + 90}{2} \cdot 9 = 54 \cdot 9 = 486$ bulunur.',
   'A şıkkı (396), son terim olan $90$ sayısını ($9 + 0 = 9$) unutarak yalnızca $18$''den $81$''e kadar olan $8$ sayıyı toplayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-01-034 · doğrulandı
  ('84c7044d-541a-5ba4-bc9f-e9f661e04372'::uuid, 'Matematik & Geometri', 'Temel Kavramlar ve Sayı Basamakları', 'multiple_choice', 2,
   'Rakamları çarpımının $3$ katına eşit olan iki basamaklı doğal sayıların toplamı kaçtır?',
   '{"options":["39","15","24","51","63"],"correctIndex":0}'::jsonb,
   'İki basamaklı sayı $AB$ olsun: $10A + B = 3 \cdot A \cdot B \Rightarrow B(3A - 1) = 10A$. $A \in \{1, 2, \ldots, 9\}$ rakamları denenir:
$A = 1$ için $2B = 10 \Rightarrow B = 5$ (sayı $15$).
$A = 2$ için $5B = 20 \Rightarrow B = 4$ (sayı $24$).
$A \ge 3$ için $3A - 1$ sayısı $10A$''yı tam bölmez (örneğin $A = 3$ için $30 \div 8$ ve $A = 7$ için $70 \div 20$ tam sayı değildir). Koşulu sağlayan sayılar $15$ ve $24$ olup toplamları $15 + 24 = 39$ bulunur.',
   'B şıkkı (15) veya C şıkkı (24), iki çözümden yalnızca birini bulup diğer rakamları denemeyi bırakan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-01-035 · doğrulandı
  ('483328ea-d3f8-511f-a83a-a098d51dfae7'::uuid, 'Matematik & Geometri', 'Temel Kavramlar ve Sayı Basamakları', 'multiple_choice', 1,
   'Bir sokaktaki evler baştan sona doğru $1, 3, 5, \ldots$ biçiminde ardışık tek tam sayılarla numaralandırılmıştır.
Bu sokakta baştan $k.$ sıradaki evin numarası $19$, sondan $k.$ sıradaki evin numarası ise $45$ olduğuna göre sokakta toplam kaç ev vardır?',
   '{"options":["26","28","30","32","33"],"correctIndex":3}'::jsonb,
   'Baştan $k.$ sıradaki tek sayı $2k - 1 = 19 \Rightarrow 2k = 20 \Rightarrow k = 10$ bulunur. Sondan $10.$ evin numarası $45$ olduğuna göre bu evden sonra $9$ ev daha vardır ve numaralar $2$''şer arttığı için son evin numarası $45 + 9 \cdot 2 = 63$ olur. $1$''den $63$''e kadar olan tek sayı adedi $\dfrac{63 - 1}{2} + 1 = 32$''dir. (Kısaca simetri nedeniyle $\dfrac{19 + 45}{2} = 32$ ev vardır.)',
   'E şıkkı ($33$) veya C şıkkı ($30$), $k = 10$ bulduktan sonra sondan $10.$ sırayı $9$ yerine $10$ ev ekleyerek $65$ numarasını bulan ya da $+1$ sınır terimini hatalı sayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-01-036 · doğrulandı
  ('21342249-0b05-5095-b72c-e044b9280209'::uuid, 'Matematik & Geometri', 'Temel Kavramlar ve Sayı Basamakları', 'multiple_choice', 2,
   '$a$ ve $b$ pozitif tam sayılar olmak üzere
$$a^2 - b^2 = 29$$
eşitliği verilmektedir.
Buna göre $a \cdot b$ çarpımı kaçtır?',
   '{"options":["180","196","205","210","225"],"correctIndex":3}'::jsonb,
   'İki kare farkı özdeşliğiyle $(a - b)(a + b) = 29$ yazılır. $29$ asal bir sayı ve $a, b$ pozitif tam sayılar olduğu için küçük çarpan $a - b = 1$, büyük çarpan $a + b = 29$ olmalıdır. İki denklem toplanırsa $2a = 30 \Rightarrow a = 15$ ve $b = 14$ bulunur. Çarpım $15 \cdot 14 = 210$''dur.',
   'B şıkkı (196) veya E şıkkı (225), $a$ ve $b$''yi doğru bulduktan sonra çarpımları yerine karelerinden birini işaretleyen veya $a$ ile $b$''yi bulmada $1$ kayması yapan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-01-037 · doğrulandı
  ('8a7e8da9-65fa-55f0-ad3c-7c05d38eb103'::uuid, 'Matematik & Geometri', 'Temel Kavramlar ve Sayı Basamakları', 'multiple_choice', 3,
   '$$1! + 2! + 3! + 4! + \cdots + 30!$$
toplamının $12$ ile bölümünden kalan kaçtır?',
   '{"options":["1","3","6","7","9"],"correctIndex":4}'::jsonb,
   '$4! = 24$ sayısı $12$''nin tam katı olduğundan $n \ge 4$ için tüm $n!$ terimleri $12$''ye tam bölünür (kalan $0$ olur). Bu nedenle toplamın $12$ ile bölümünden kalanı yalnızca ilk üç terim belirler: $1! + 2! + 3! = 1 + 2 + 6 = 9$. $9 < 12$ olduğu için kalan $9$ bulunur.',
   'C şıkkı (6), $3! = 6$ değerinin $12$''ye bölünmediğini görüp yalnızca $3!$''i kalan sanan veya $1! + 2!$ terimlerini toplama katmayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-01-038 · doğrulandı
  ('de886d7c-bbd9-5c43-9ab6-2d24b66f5612'::uuid, 'Matematik & Geometri', 'Temel Kavramlar ve Sayı Basamakları', 'multiple_choice', 3,
   'Üç basamaklı $ABC$ doğal sayısından $CBA$ doğal sayısı çıkarıldığında $396$ elde edilmektedir.
$A + B + C = 18$ ve $B = 6$ olduğuna göre $A \cdot C$ çarpımı kaçtır?',
   '{"options":["24","32","36","40","48"],"correctIndex":1}'::jsonb,
   'Basamak çözümlemesi yapılırsa $ABC - CBA = (100A + 10B + C) - (100C + 10B + A) = 99(A - C) = 396 \Rightarrow A - C = 4$ bulunur. Diğer yandan $A + 6 + C = 18 \Rightarrow A + C = 12$ elde edilir. $A + C = 12$ ve $A - C = 4$ denklemlerinden $A = 8$, $C = 4$ olur; çarpımları $8 \cdot 4 = 32$''dir.',
   'C şıkkı (36), $A + C = 12$ eşitliğinde $A - C = 4$''ü gözden kaçırıp $6 \cdot 6$ veya hatalı bölme sonucu $9 \cdot 4 = 36$ bulan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-01-039 · doğrulandı
  ('20c6ac7c-9c0a-5fc0-bbd2-0819c3668ae6'::uuid, 'Matematik & Geometri', 'Temel Kavramlar ve Sayı Basamakları', 'multiple_choice', 2,
   'Toplamları $19$ olan aralarında asal iki pozitif tam sayının çarpımı en çok kaç olabilir?',
   '{"options":["84","88","90","91","96"],"correctIndex":2}'::jsonb,
   'Toplamları sabit iki sayının çarpımı birbirine en yakın seçildiğinde en büyük değerini alır: $19 = 9 + 10$. Ardışık iki pozitif tam sayı ($9$ ve $10$) her zaman aralarında asaldır ($\text{EBOB}(9, 10) = 1$). Bu nedenle en büyük çarpım $9 \cdot 10 = 90$ bulunur.',
   'B şıkkı (88), çift sayı olan $10$''un aralarında asallığı bozacağını sanıp tek-çift yerine $8 + 11$ (veya tek asal $7 + 12 = 84$) ikilisini seçen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-01-040 · doğrulandı
  ('49b564e9-356c-5cc2-ae7b-24015e28fb50'::uuid, 'Matematik & Geometri', 'Temel Kavramlar ve Sayı Basamakları', 'multiple_choice', 3,
   'Her $n$ pozitif tam sayısı için $1$''den $n$''ye kadar olan tam sayıların toplamı $T_n$ ile gösterilmektedir.
$$T_{n + 2} - T_n = 35$$
eşitliğini sağlayan $n$ değeri kaçtır?',
   '{"options":["14","15","17","16","18"],"correctIndex":3}'::jsonb,
   '$T_{n + 2} = 1 + 2 + \cdots + n + (n + 1) + (n + 2)$ olduğundan $T_n$ çıkarıldığında geriye yalnızca son iki terim kalır: $T_{n + 2} - T_n = (n + 1) + (n + 2) = 2n + 3$. Verilen eşitlikten $2n + 3 = 35 \Rightarrow 2n = 32 \Rightarrow n = 16$ bulunur.',
   'C şıkkı (17), $T_{n + 2} - T_n$ farkını son iki terim yerine $n + (n + 1) = 35 \Rightarrow n = 17$ ya da tek terim $n + 2$ sanıp yanlış denklem kuran adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true)
on conflict (id) do update set
  lesson = excluded.lesson, topic = excluded.topic, question_type = excluded.question_type,
  difficulty = excluded.difficulty, prompt_text = excluded.prompt_text,
  interaction_data = excluded.interaction_data, explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap, exam_scopes = excluded.exam_scopes,
  education_level = excluded.education_level, figure_svg = excluded.figure_svg, is_active = true;
