-- ==========================================================================
-- KADRO SORU HAVUZU · Matematik & Geometri · TÜMÜ TEK DOSYA (590 soru)
-- Birleştirilen dosya sayısı: 14 · Üretici: tools/math/bundle_sql.mjs
-- Önkoşul: docs/supabase_migrations/12_math_figures.sql (Supabase'de uygulanmış olmalı)
-- İdempotent: tüm kayıtlar sabit UUID v5 ile upsert edilir (on conflict do update).
-- ==========================================================================

begin;
-- >>> 01_temel_kavramlar_ve_sayi_basamaklari.sql
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

-- >>> 02_bolme_bolunebilme_ve_ebob_ekok.sql
-- ==========================================================================
-- KADRO SORU HAVUZU · Matematik & Geometri · Bölme-Bölünebilme ve EBOB-EKOK (40 soru)
-- Kaynak: docs/soru_havuzu/matematik/02_bolme_bolunebilme_ve_ebob_ekok.md · Üretici: tools/math/compile_questions.mjs (elle düzenlemeyin)
-- Önkoşul: docs/supabase_migrations/12_math_figures.sql
-- İdempotent: soru kimlikleri sabit UUID'dir; dosya tekrar çalıştırılırsa sorular güncellenir.
-- ==========================================================================

insert into public.questions (
  id, lesson, topic, question_type, difficulty, prompt_text, interaction_data,
  explanation, distractor_trap, exam_scopes, education_level, figure_svg, is_active
) values
  -- mat-02-001 · doğrulandı
  ('990130f4-ced1-584b-8b7f-a9203fc913cb'::uuid, 'Matematik & Geometri', 'Bölme-Bölünebilme ve EBOB-EKOK', 'multiple_choice', 1,
   '$A$, $B$ ve $C$ sıfırdan farklı pozitif tam sayılardır.
$A$ sayısı $8$ ile bölündüğünde bölüm $B$, kalan $0$ olmaktadır.
$A + 4B$ sayısı $3B$ ile bölündüğünde bölüm $C$ ve kalan $0$ olduğuna göre $C$ kaçtır?',
   '{"options":["3","4","5","6","8"],"correctIndex":1}'::jsonb,
   'İlk bölme işleminden $A = 8B$ yazılır. İkinci bölme işleminde bölünen yerine $8B$ konulduğunda $A + 4B = 8B + 4B = 12B$ elde edilir. $12B = 3B \cdot C$ eşitliğinde $B > 0$ olduğu için $B$''ler sadeleşir ve $C = \dfrac{12}{3} = 4$ bulunur.',
   'A şıkkı ($3$), $A = 8B$ yerine $A + 4B$ toplamını $9B$ gibi eksik toplayan ya da bölen olan $3$''ü bölümle karıştıran adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-02-002 · doğrulandı
  ('8cc87192-5fd5-51cb-8476-4465f168e2b2'::uuid, 'Matematik & Geometri', 'Bölme-Bölünebilme ve EBOB-EKOK', 'multiple_choice', 2,
   '$A$ pozitif tam sayısı $12$ ile bölündüğünde bölüm $B$, kalan $5$''tir. $B$ sayısı $5$ ile bölündüğünde kalan $3$ olduğuna göre $A$ sayısının $15$ ile bölümünden kalan kaçtır?',
   '{"options":["5","8","9","11","13"],"correctIndex":3}'::jsonb,
   'Verilen bölme işlemleri denklem biçiminde yazılır: $A = 12B + 5$ ve $B = 5k + 3$ ($k \in \mathbb{Z}$). İkinci ifade birincide yerine konursa $A = 12(5k + 3) + 5 = 60k + 36 + 5 = 60k + 41$ elde edilir. $60k$ sayısı $15$''in tam katı olduğundan kalanı $41$''in $15$ ile bölümünden kalan belirler: $41 = 15 \cdot 2 + 11$, yani kalan $11$''dir.',
   'B şıkkı (8), kalanları doğrudan toplayıp $5 + 3 = 8$ bulan adayı yakalar. Oysa $B$''den gelen $3$ kalanı $12$ katsayısıyla çarpılarak $A$''ya yansır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-02-003 · doğrulandı
  ('01fb139a-3274-5524-a902-6ddeb01cbbb7'::uuid, 'Matematik & Geometri', 'Bölme-Bölünebilme ve EBOB-EKOK', 'multiple_choice', 1,
   'Rakamları birbirinden farklı dört basamaklı $5A3B$ doğal sayısı $12$ ile tam bölünebilmektedir.
Buna göre $A$ rakamının alabileceği değerler toplamı kaçtır?',
   '{"options":["20","22","25","27","29"],"correctIndex":0}'::jsonb,
   '$12$ ile tam bölünebilme, aralarında asal olan $3$ ve $4$ ile tam bölünebilme demektir. $4$ ile bölünebilme için son iki basamak olan $3B$ sayısı $4$''ün katı olmalıdır; buradan $B = 2$ veya $B = 6$ bulunur.
$B = 2$ için sayının rakamları toplamı $5 + A + 3 + 2 = 10 + A$''dır; $3$''ün katı olması için $A \in \{2, 5, 8\}$ olabilir. Rakamlar farklı koşulu nedeniyle $2$ ve $5$ elenir, yalnızca $A = 8$ kalır.
$B = 6$ için rakamlar toplamı $5 + A + 3 + 6 = 14 + A$ olur; $3$''ün katı için $A \in \{1, 4, 7\}$ değerlerinin üçü de $\{5, 3, 6\}$''dan farklıdır.
O hâlde $A$''nın alabileceği değerler toplamı $8 + 1 + 4 + 7 = 20$''dir.',
   'D şıkkı (27), sorudaki "rakamları birbirinden farklı" şartını unutup $B = 2$ durumunda $A = 2$ ve $A = 5$ değerlerini de toplama ($20 + 2 + 5 = 27$) dahil eden adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-02-004 · doğrulandı
  ('866a84ae-31c8-5fd7-9a63-dee2472fb938'::uuid, 'Matematik & Geometri', 'Bölme-Bölünebilme ve EBOB-EKOK', 'multiple_choice', 2,
   'Rakamları birbirinden farklı beş basamaklı $4A81B$ doğal sayısı $45$ ile bölündüğünde $12$ kalanını vermektedir.
Buna göre $A$ kaçtır?',
   '{"options":["1","4","6","7","9"],"correctIndex":2}'::jsonb,
   '$45$ ile bölündüğünde $12$ kalanını veren bir sayının $5$ ile bölümünden kalan $12 \div 5$''ten $2$, $9$ ile bölümünden kalan $12 \div 9$''dan $3$ olmalıdır.
$5$''ten kalan $2$ olduğu için birler basamağı $B = 2$ veya $B = 7$ olabilir.
Rakamlar toplamı $4 + A + 8 + 1 + B = 13 + A + B$ ifadesinin $9$ ile bölümünden kalan $3$ olmalı, yani $13 + A + B$ toplamı $21$ veya $30$ olmalıdır ($A + B = 8$ veya $A + B = 17$).
$B = 7$ seçilirse $A = 1$ çıkar (rakam tekrarı olduğu için elenir; $A = 10$ rakam değildir). $B = 2$ seçildiğinde $A = 6$ bulunur ve $46.812$ sayısının tüm rakamları birbirinden farklıdır.',
   'A şıkkı (1), $B = 7$ durumunu deneyip $A = 1$ bulduktan sonra sayıdaki $1$ rakamıyla çakıştığını görmeden işaretleyen adayı yakalar. Koşullu sorularda bulunan tüm adayların "rakamları farklı" şartına göre elenmesi gerekir.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-02-005 · doğrulandı
  ('96142117-569d-52cf-a780-c50f17babdd2'::uuid, 'Matematik & Geometri', 'Bölme-Bölünebilme ve EBOB-EKOK', 'multiple_choice', 2,
   'Rakamları birbirinden farklı beş basamaklı $3A52B$ doğal sayısı $88$ ile tam bölünebilmektedir.
Buna göre $A + B$ toplamı kaçtır?',
   '{"options":["3","5","8","11","6"],"correctIndex":4}'::jsonb,
   '$88 = 8 \cdot 11$ olduğundan sayı hem $8$ hem $11$ ile tam bölünmelidir. $8$ ile bölünebilme için son üç basamak olan $52B$ sayısı $8$''in katı olmalıdır: $520 = 8 \cdot 65$ olduğundan $B = 0$ veya $B = 8$ olabilir.
$11$ ile bölünebilme için sağdan sola $+, -, +, -, +$ işaretleri uygulanır: $(B + 5 + 3) - (2 + A) = 6 + B - A$ sayısı $11$''in katı olmalıdır.
$B = 8$ alınırsa $14 - A$ ifadesinin $11$''in katı olması için $A = 3$ gerekir; ancak sayıda $3$ rakamı bulunduğu için rakamlar farklı şartına aykırıdır.
$B = 0$ alınırsa $6 - A$ ifadesinin $11$''in katı olması için $A = 6$ bulunur ($36.520$). Böylece $A + B = 6 + 0 = 6$ olur.',
   'D şıkkı (11), $B = 8$ ve $A = 3$ çiftini bulup $3$ rakamının zaten yüz binler değil on binler basamağında var olduğunu gözden kaçırarak $3 + 8 = 11$ işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-02-006 · doğrulandı
  ('592b6948-351e-5a64-8c4b-084398e6257a'::uuid, 'Matematik & Geometri', 'Bölme-Bölünebilme ve EBOB-EKOK', 'multiple_choice', 2,
   '$x$ doğal sayısının $11$ ile bölümünden kalan $7$, $y$ doğal sayısının $11$ ile bölümünden kalan $9$''dur.
Buna göre $x^2 + 3y$ sayısının $11$ ile bölümünden kalan kaçtır?',
   '{"options":["1","10","7","5","3"],"correctIndex":1}'::jsonb,
   'Bölme kalanları işlemlerde doğrudan sayıların yerine yazılabilir. Buna göre $x^2 + 3y$ yerine $7^2 + 3 \cdot 9 = 49 + 27 = 76$ hesaplanır. $76$ sayısının $11$ ile bölümünden kalan $76 = 11 \cdot 6 + 10$ olduğundan $10$ bulunur.',
   'A şıkkı (1), $x^2$ yerine $x$''in karesini almayı unutup $7 + 3 \cdot 9 = 34$ değerinin $11$ ile bölümünden kalan $1$''i işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-02-007 · doğrulandı
  ('be0a1ab3-2735-55c4-accb-7a713f666d6d'::uuid, 'Matematik & Geometri', 'Bölme-Bölünebilme ve EBOB-EKOK', 'multiple_choice', 1,
   '$a$ ve $b$ pozitif tam sayılar olmak üzere
$$180 \cdot a = b^2$$
eşitliğini sağlayan en küçük $a$ ve $b$ değerleri için $a + b$ toplamı kaçtır?',
   '{"options":["25","30","32","35","45"],"correctIndex":3}'::jsonb,
   '$180$ asal çarpanlarına ayrılır: $180 = 2^2 \cdot 3^2 \cdot 5^1$. Çarpımın bir tam sayının karesi ($b^2$) olabilmesi için tüm asal çarpanların üsleri çift olmalıdır. $2$ ve $3$''ün üsleri zaten çift olduğundan $5^1$''in üssünü çift yapmak için en küçük $a = 5$ seçilir. Bu durumda $b^2 = 2^2 \cdot 3^2 \cdot 5^2 = 30^2$ olur ve $b = 30$ bulunur. Toplam $a + b = 5 + 30 = 35$''tir.',
   'B şıkkı (30), $a = 5$ ve $b = 30$ değerlerini doğru bulduktan sonra yalnızca $b$''yi işaretleyen adayı yakalar. A şıkkı (25) ise $180$''i yanlış çarpanlara ayırma hatasından gelir.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-02-008 · doğrulandı
  ('f0651a08-d45e-525a-8126-d7fed6816d28'::uuid, 'Matematik & Geometri', 'Bölme-Bölünebilme ve EBOB-EKOK', 'multiple_choice', 2,
   '$n$ bir pozitif tam sayı olmak üzere $A = 15^n \cdot 12$ sayısının $36$ tane pozitif tam sayı böleni vardır.
Buna göre $n$ kaçtır?',
   '{"options":["2","3","4","5","6"],"correctIndex":0}'::jsonb,
   'Sayı asal çarpanlarına ayrılır: $A = (3 \cdot 5)^n \cdot (2^2 \cdot 3) = 2^2 \cdot 3^{n+1} \cdot 5^n$. Pozitif tam sayı bölen adedi, asal çarpanların üslerinin $1$ fazlasının çarpımıdır: $(2 + 1)(n + 2)(n + 1) = 36 \Rightarrow 3(n + 1)(n + 2) = 36 \Rightarrow (n + 1)(n + 2) = 12$. Ardışık iki pozitif tam sayının çarpımı $12 = 3 \cdot 4$ olduğundan $n + 1 = 3 \Rightarrow n = 2$ bulunur.',
   'B şıkkı (3), $n + 1 = 3$ eşitliğini bulduktan sonra $n$ yerine doğrudan $3$''ü seçen ya da $12$''nin içindeki $3^1$ çarpanını $3^n$''e eklemeyi unutan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-02-009 · doğrulandı
  ('502ad916-8874-546c-bdc8-d69bb1e3c6cb'::uuid, 'Matematik & Geometri', 'Bölme-Bölünebilme ve EBOB-EKOK', 'multiple_choice', 1,
   'Boyutları $48$ metre ve $64$ metre olan dikdörtgen biçimindeki bir bahçenin çevresine, köşelerine de birer adet gelmek koşuluyla eşit aralıklarla en az sayıda ağaç dikilecektir.
Buna göre toplam kaç ağaç gerekir?',
   '{"options":["10","12","14","15","28"],"correctIndex":2}'::jsonb,
   'Ağaç sayısının en az olması için iki ağaç arasındaki mesafe en büyük seçilmelidir; bu değer $\text{EBOB}(48, 64) = 16$ metredir. Dikdörtgenin çevresi kapalı bir yol olduğundan ağaç sayısı doğrudan çevrenin aralığa bölünmesiyle bulunur: $\dfrac{2(48 + 64)}{16} = \dfrac{224}{16} = 14$ ağaç dikilir.',
   'D şıkkı (15), kapalı dikdörtgen çevresinde fazladan $1$ eklenmeyeceğini unutup düz doğru parçası gibi $+1$ ekleyen adayı yakalar. B şıkkı (12) ise alan hesabına kayıp $48 \cdot 64 \div 16^2$ işlemi yapanların düştüğü tuzaktır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-02-010
  ('2db27a62-6378-5d00-bb52-fee5fbde2779'::uuid, 'Matematik & Geometri', 'Bölme-Bölünebilme ve EBOB-EKOK', 'multiple_choice', 2,
   'Üç hemşire sırasıyla $4$, $6$ ve $9$ günde bir nöbet tutmaktadır.
Üçü birlikte ilk nöbetlerini Salı günü tuttuklarına göre üçüncü kez birlikte tutacakları nöbet hangi güne denk gelir?',
   '{"options":["Pazartesi","Salı","Çarşamba","Perşembe","Cuma"],"correctIndex":3}'::jsonb,
   'Üç hemşirenin birlikte nöbet tutma periyodu $\text{EKOK}(4, 6, 9) = 36$ gündür. İlk nöbet $0$. gün (Salı) tutulduğuna göre ikinci birlikte nöbet $36$ gün sonra, üçüncü birlikte nöbet ise $2 \cdot 36 = 72$ gün sonra tutulur. $72$ günün $7$ ile bölümünden kalan $72 = 7 \cdot 10 + 2$ olduğundan Salı gününden $2$ gün ileri gidilir ve Perşembe günü bulunur.',
   'E şıkkı (Cuma), "üçüncü kez" ifadesini görünce aradan $2$ değil $3$ periyot ($3 \cdot 36 = 108$ gün, kalan $3$) geçtiğini sanan adayı yakalar. İlk nöbet zaten başlangıçta tutulduğu için $n$. nöbet $(n - 1)$ periyot sonradır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-02-011 · doğrulandı
  ('f834ba11-537b-51cb-95d0-676377bf3a09'::uuid, 'Matematik & Geometri', 'Bölme-Bölünebilme ve EBOB-EKOK', 'multiple_choice', 3,
   '$a$ ve $b$ pozitif tam sayılar olmak üzere $\text{EBOB}(a, b) = 6$ ve $\text{EKOK}(a, b) = 180$''dir.
$a$ ve $b$ sayılarından hiçbiri $6$''ya eşit olmadığına göre $a + b$ toplamı en az kaçtır?',
   '{"options":["186","102","84","78","66"],"correctIndex":4}'::jsonb,
   '$\text{EBOB}(a, b) = 6$ olduğundan aralarında asal $x$ ve $y$ pozitif tam sayıları için $a = 6x$ ve $b = 6y$ yazılabilir. $\text{EKOK}(a, b) = 6 \cdot x \cdot y = 180 \Rightarrow x \cdot y = 30$ bulunur. Sayıların hiçbiri $6$ olmadığından $x > 1$ ve $y > 1$ olmalıdır. Aralarında asal $x \cdot y = 30$ çarpan çiftleri $(2, 15)$, $(3, 10)$ ve $(5, 6)$''dır. Toplamın en küçük olması için birbirine en yakın çift olan $(5, 6)$ seçilir: $a = 30$, $b = 36$ ve $a + b = 66$ olur.',
   'D şıkkı (78), $(3, 10)$ çiftini alıp daha küçük toplam veren $(5, 6)$ çiftini gözden kaçıran adayı yakalar. A şıkkı (186) ise "hiçbiri 6 değildir" şartını yok sayıp $(1, 30)$ çiftiyle $6 + 180$ bulanların tuzağıdır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-02-012 · doğrulandı
  ('c2be84f2-1509-5cfb-90c7-af659de7031f'::uuid, 'Matematik & Geometri', 'Bölme-Bölünebilme ve EBOB-EKOK', 'multiple_choice', 3,
   'Bir sepetteki cevizler beşerli, altışarlı ve sekizerli sayıldığında her seferinde $3$ ceviz eksik kalmaktadır.
Sepetteki ceviz sayısı $300$''den fazla olduğuna göre sepette en az kaç ceviz vardır?',
   '{"options":["237","357","360","363","477"],"correctIndex":1}'::jsonb,
   'Ceviz sayısına $C$ denirse her sayımda $3$ eksik kaldığı için $C + 3$ sayısı $5$, $6$ ve $8$''in ortak katı olmalıdır. $\text{EKOK}(5, 6, 8) = 120$ olduğundan $C + 3 = 120k$ ($k \in \mathbb{Z}^+$) yazılır. $C > 300$ koşulunu sağlayan en küçük kat $k = 3$ için $C + 3 = 360 \Rightarrow C = 357$ bulunur.',
   'D şıkkı (363), "3 eksik kalmaktadır" ifadesini "3 fazla kalmaktadır" gibi yorumlayıp $360$''a $3$ ekleyen adayı yakalar. A şıkkı (237) ise $300$''den büyük olma koşulunu unutanların seçtiği şıktır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-02-013 · doğrulandı
  ('29ae701a-c312-5001-892d-3de24c5223ea'::uuid, 'Matematik & Geometri', 'Bölme-Bölünebilme ve EBOB-EKOK', 'multiple_choice', 1,
   'Rakamları birbirinden farklı dört basamaklı $4A6B$ doğal sayısı $15$ ile tam bölünebilmektedir.
Bu koşulu sağlayan kaç farklı $4A6B$ sayısı yazılabilir?',
   '{"options":["3","5","6","7","8"],"correctIndex":2}'::jsonb,
   '$15$ ile tam bölünen sayı hem $5$ hem $3$ ile tam bölünmelidir. $5$ ile bölünme nedeniyle $B = 0$ veya $B = 5$ olur.
$B = 0$ için rakamlar toplamı $4 + A + 6 + 0 = 10 + A$ olup $3$''ün katı olması için $A \in \{2, 5, 8\}$ olabilir (üçü de $\{4, 6, 0\}$''dan farklıdır, $3$ sayı).
$B = 5$ için rakamlar toplamı $4 + A + 6 + 5 = 15 + A$ olup $3$''ün katı olması için $A \in \{0, 3, 6, 9\}$ olabilir; ancak sayıda $6$ bulunduğu için $A = 6$ elenir ($0, 3, 9$ olmak üzere $3$ sayı).
Toplam $3 + 3 = 6$ farklı sayı yazılabilir.',
   'D şıkkı (7), $B = 5$ durumunda $A = 6$ seçeneğinin rakam tekrarına yol açtığını gözden kaçırıp $3 + 4 = 7$ sayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-02-014
  ('c3b34bf0-7ae1-555b-9623-ec20bfac46eb'::uuid, 'Matematik & Geometri', 'Bölme-Bölünebilme ve EBOB-EKOK', 'multiple_choice', 1,
   '$x$ ve $y$ pozitif tam sayıları için $x$ sayısı $12$ ile bölündüğünde kalan $y$ olmaktadır.
$y$''nin tek sayı olduğu bilindiğine göre aşağıdakilerden hangisi her zaman doğrudur?',
   '{"options":["$x$ sayısı $3$ ile tam bölünür.","$x$ tek sayıdır.","$x$ çift sayıdır.","$x + y$ tek sayıdır.","$y < 6$''dır."],"correctIndex":1}'::jsonb,
   'Bölme özdeşliğine göre bölüm $k$ olmak üzere $x = 12k + y$ yazılır ($0 \le y < 12$). $12k$ terimi $k$ hangi tam sayı olursa olsun daima çifttir. $y$ tek sayı olduğu için $x = \text{çift} + \text{tek} = \text{tek}$ olur; dolayısıyla $x$ her zaman tek sayıdır. Ayrıca iki tek sayının toplamı olan $x + y$ çift olur ($D$ yanlış), $y = 7$ veya $11$ seçilebileceğinden $E$ kesin değildir.',
   'D şıkkı ($x + y$ tek sayıdır), $x$''in tek olduğunu gördükten sonra $x$ ve $y$''nin toplamında iki tek sayının toplamının çift olacağını unutan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-02-015 · doğrulandı
  ('66af7730-45ee-581d-a0f9-fb8ec68900be'::uuid, 'Matematik & Geometri', 'Bölme-Bölünebilme ve EBOB-EKOK', 'multiple_choice', 2,
   '$42$ basamaklı $555\ldots5$ doğal sayısının $9$ ile bölümünden kalan kaçtır?',
   '{"options":["3","2","4","5","6"],"correctIndex":0}'::jsonb,
   'Bir sayının $9$ ile bölümünden kalan, rakamları toplamının $9$ ile bölümünden kalana eşittir. $42$ tane $5$ rakamının toplamı $42 \cdot 5 = 210$ olur. $210$ sayısının rakamları toplamı $2 + 1 + 0 = 3$ olduğundan $9$ ile bölümünden kalan $3$ bulunur.',
   'E şıkkı (6), basamak sayısının $9$ ile bölümünden kalanı ($42 \equiv 6$) alıp $5$ ile çarpmadan işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-02-016 · doğrulandı
  ('48e2eab3-e733-5378-b524-b4127a01f0de'::uuid, 'Matematik & Geometri', 'Bölme-Bölünebilme ve EBOB-EKOK', 'multiple_choice', 2,
   'Dört basamaklı $6A4B$ sayısının $11$ ile bölümünden kalan $3$''tür.
$A - B = 3$ olduğuna göre $A$ kaçtır?',
   '{"options":["5","6","7","8","9"],"correctIndex":3}'::jsonb,
   '$11$ ile bölünebilme kuralına göre sağdan sola $+, -, +, -$ işaretleri uygulanır: $(B + A) - (4 + 6) = A + B - 10$. Kalan $3$ olduğundan $A + B - 10 = 3 \Rightarrow A + B = 13$ bulunur ($A + B - 10 = 14 \Rightarrow A + B = 24$ rakamlarla imkânsızdır). $A + B = 13$ ve $A - B = 3$ denklemleri taraf tarafa toplanırsa $2A = 16 \Rightarrow A = 8$ elde edilir.',
   'A şıkkı (5), $A$ yerine $B$''nin değerini ($8 - 3 = 5$) işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-02-017 · doğrulandı
  ('8ccd0884-164f-5365-8c8a-898548d0b427'::uuid, 'Matematik & Geometri', 'Bölme-Bölünebilme ve EBOB-EKOK', 'multiple_choice', 2,
   '$360$ sayısının kaç tane tek pozitif tam sayı böleni vardır?',
   '{"options":["4","6","8","12","24"],"correctIndex":1}'::jsonb,
   '$360$ sayısı asal çarpanlarına ayrılır: $360 = 8 \cdot 9 \cdot 5 = 2^3 \cdot 3^2 \cdot 5^1$. Tek bölenler $2$ çarpanını içermeyeceğinden yalnızca tek asal çarpanlardan ($3^2 \cdot 5^1$) üretilir. Tek pozitif tam sayı bölen adedi $(2 + 1)(1 + 1) = 3 \cdot 2 = 6$ bulunur.',
   'E şıkkı (24), tek bölen yerine tüm pozitif bölen sayısını ($4 \cdot 3 \cdot 2 = 24$) hesaplayan; A şıkkı (4) ise üslere $1$ eklemeyi veya $2$''yi ayırmayı karıştıran adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-02-018 · doğrulandı
  ('0f9ff225-630c-5800-8933-99e9bc6fcedf'::uuid, 'Matematik & Geometri', 'Bölme-Bölünebilme ve EBOB-EKOK', 'multiple_choice', 1,
   '$42$ litre zeytinyağı ve $70$ litre ayçiçek yağı birbirine karıştırılmadan ve hiç artmayacak biçimde eşit hacimli en büyük şişelere doldurulacaktır.
Bu iş için en az kaç şişe gerekir?',
   '{"options":["5","6","8","12","14"],"correctIndex":2}'::jsonb,
   'Şişe sayısının en az olması için şişe hacmi en büyük seçilmelidir: $\text{EBOB}(42, 70) = 14$ litre. Zeytinyağı için $\dfrac{42}{14} = 3$ şişe, ayçiçek yağı için $\dfrac{70}{14} = 5$ şişe gerekir; toplam $3 + 5 = 8$ şişe olur.',
   'E şıkkı (14), gereken şişe sayısı ($8$) yerine bir şişenin hacmini ($14$ litre) işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-02-019 · doğrulandı
  ('f3565960-a589-58c0-845d-b89118c9b038'::uuid, 'Matematik & Geometri', 'Bölme-Bölünebilme ve EBOB-EKOK', 'multiple_choice', 2,
   'Boyutları $12$ cm ve $18$ cm olan dikdörtgen biçimindeki fayanslar boşluk kalmadan yan yana dizilerek en küçük alanlı bir kare oluşturulacaktır.
Bu iş için kaç adet fayans gerekir?',
   '{"options":["2","3","4","12","6"],"correctIndex":4}'::jsonb,
   'Oluşturulacak karenin bir kenarı $12$ ve $18$''in en küçük ortak katıdır: $\text{EKOK}(12, 18) = 36$ cm. Karenin bir kenarı boyunca $\dfrac{36}{12} = 3$ fayans, diğer kenarı boyunca $\dfrac{36}{18} = 2$ fayans yerleştirilir. Toplam fayans sayısı $3 \cdot 2 = 6$ adettir.',
   'D şıkkı (12) veya C şıkkı (4), kenar uzunluklarını $72$ cm alarak veya alan oranında yanlış bölme yaparak farklı adede ulaşan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-02-020 · doğrulandı
  ('a96b2929-0016-5a5f-ad6d-8a64dd0a5113'::uuid, 'Matematik & Geometri', 'Bölme-Bölünebilme ve EBOB-EKOK', 'multiple_choice', 2,
   '$a$ doğal sayısının $12$ ile bölümünden kalan $7$, $b$ doğal sayısının $8$ ile bölümünden kalan $5$''tir.
Buna göre $a \cdot b$ çarpımının $4$ ile bölümünden kalan kaçtır?',
   '{"options":["1","3","2","0","5"],"correctIndex":1}'::jsonb,
   '$12$ ve $8$ sayıları $4$''ün katı olduğu için $a = 12k + 7$ sayısının $4$ ile bölümünden kalan $7 \div 4$''ten $3$, $b = 8m + 5$ sayısının $4$ ile bölümünden kalan $5 \div 4$''ten $1$ olur. Çarpımın $4$ ile bölümünden kalan $3 \cdot 1 = 3$ bulunur.',
   'A şıkkı (1), $7 \cdot 5 = 35$ işlemini $4$''e bölmek yerine $7$ ve $5$''in kendi kalanlarını ya da toplamlarını karıştıran adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-02-021 · doğrulandı
  ('254ea35e-d9a0-5853-b3c5-92188208f26e'::uuid, 'Matematik & Geometri', 'Bölme-Bölünebilme ve EBOB-EKOK', 'multiple_choice', 1,
   'Aralarında asal iki doğal sayının en küçük ortak katı (EKOK) $84$''tür.
Bu sayılardan biri $12$ olduğuna göre diğeri kaçtır?',
   '{"options":["7","6","14","21","28"],"correctIndex":0}'::jsonb,
   'Aralarında asal iki sayının $\text{EBOB}$''u $1$ olduğundan çarpımları $\text{EKOK}$''larına eşittir: $a \cdot b = \text{EKOK}(a, b) = 84$. Sayılardan biri $12$ ise diğeri $\dfrac{84}{12} = 7$ bulunur ($12$ ve $7$ aralarında asaldır).',
   'C şıkkı (14) veya E şıkkı (28), $12$ ile aralarında asal olmayan sayıları ($14$ veya $28$ ile $12$''nin EKOK''u $84$ olsa da EBOB''u $1$ değildir) seçen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-02-022 · doğrulandı
  ('7e56eab3-cd6f-5a9a-aeaa-01289ca422ab'::uuid, 'Matematik & Geometri', 'Bölme-Bölünebilme ve EBOB-EKOK', 'multiple_choice', 2,
   '$1$''den $200$''e kadar olan doğal sayılardan (sınırlar dahil) kaç tanesi $4$ veya $6$ ile tam bölünür?',
   '{"options":["50","58","66","67","83"],"correctIndex":3}'::jsonb,
   '$4$''ün katı olan sayılar $\lfloor 200 \div 4 \rfloor = 50$ tanedir.
$6$''nın katı olan sayılar $\lfloor 200 \div 6 \rfloor = 33$ tanedir.
Hem $4$''e hem $6$''ya bölünenler $\text{EKOK}(4, 6) = 12$''nin katları olup iki kez sayılmıştır: $\lfloor 200 \div 12 \rfloor = 16$ tane.
Birleşim $50 + 33 - 16 = 67$ bulunur.',
   'E şıkkı (83), iki kez sayılan $12$''nin katlarını çıkarmayı unutup $50 + 33 = 83$ bulan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-02-023 · doğrulandı
  ('036905f6-aeb9-5c00-94fc-851c4b0d4399'::uuid, 'Matematik & Geometri', 'Bölme-Bölünebilme ve EBOB-EKOK', 'multiple_choice', 3,
   '$77$, $105$ ve $147$ sayıları bir $x$ pozitif tam sayısına bölündüğünde her seferinde $7$ kalanını vermektedir.
Buna göre $x$''in alabileceği en büyük değer kaçtır?',
   '{"options":["7","10","14","21","28"],"correctIndex":2}'::jsonb,
   'Her bölmede $7$ kalanı verdiğine göre bu sayılardan $7$ çıkarıldığında elde edilen $77 - 7 = 70$, $105 - 7 = 98$ ve $147 - 7 = 140$ sayıları $x$''e tam bölünür. $x$''in en büyük değeri $\text{EBOB}(70, 98, 140) = 14$ bulunur (bölen $14 > 7$ olduğundan kalan $7$ olabilir).',
   'A şıkkı (7), sayılardan $7$ çıkarmayı unutup $\text{EBOB}(77, 105, 147) = 7$ bulan adayı yakalar. Bölen kalanla aynı ($7$) olursa kalan $7$ değil $0$ olur.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-02-024 · doğrulandı
  ('a13fa12b-7ddf-5635-bf28-1cc9ab36f11c'::uuid, 'Matematik & Geometri', 'Bölme-Bölünebilme ve EBOB-EKOK', 'multiple_choice', 3,
   'Aralarında asal $x$ ve $y$ pozitif tam sayıları için
$$\text{EKOK}(x, y) + \text{EBOB}(x, y) = 61 \quad \text{ve} \quad x + \dfrac{24}{y} = 7$$
eşitlikleri verilmektedir.
Buna göre $x + y$ toplamı kaçtır?',
   '{"options":["13","16","19","23","17"],"correctIndex":4}'::jsonb,
   '$x$ ve $y$ aralarında asal olduğundan $\text{EBOB}(x, y) = 1$ ve $\text{EKOK}(x, y) = x \cdot y$''dir. İlk eşitlikten $x \cdot y + 1 = 61 \Rightarrow x \cdot y = 60$ bulunur.
İkinci eşitlikte $y$''ye $24$''ü bölen değerler ve $x \cdot y = 60$ uyumu denenir: $y = 12$ için $x = 5$ olur; $\text{EBOB}(5, 12) = 1$ ve $5 + \dfrac{24}{12} = 7$ sağlanır ($y = 4 \Rightarrow x = 15$ ve $y = 1 \Rightarrow x = 60$ sağlamaz). Toplam $x + y = 5 + 12 = 17$ bulunur.',
   'B şıkkı (16) veya C şıkkı (19), $\text{EKOK} + \text{EBOB} = 61$ denkleminde $\text{EBOB} = 1$''i düşmeyip $x \cdot y = 61$ sanan veya aralarında asal olmayan $(6, 10)$ çarpan çiftini deneyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-02-025 · doğrulandı
  ('b8364417-6d90-5f4c-b5e1-b944fc6ff9c2'::uuid, 'Matematik & Geometri', 'Bölme-Bölünebilme ve EBOB-EKOK', 'multiple_choice', 1,
   'Rakamları birbirinden farklı beş basamaklı $52a4b$ doğal sayısı $36$ ile tam bölünebilmektedir.
Buna göre $a$ rakamı kaçtır?',
   '{"options":["7","8","5","4","9"],"correctIndex":0}'::jsonb,
   '$36 = 4 \cdot 9$ ve $\text{EBOB}(4, 9) = 1$ olduğundan sayı hem $4$''e hem $9$''a tam bölünmelidir. $4$''e bölünebilmesi için son iki basamak $4b$ ifadesi $40$, $44$ veya $48$ olabilir. Rakamları farklı ($5, 2, 4$ kullanılmış) olduğundan $b = 0$ veya $b = 8$''dir:
- $b = 8$ seçilirse rakamlar toplamı $5 + 2 + a + 4 + 8 = 19 + a = 9k \Rightarrow a = 8$ olur; ancak $8$ rakamı tekrarlanmış olur (elenir).
- $b = 0$ seçilirse $5 + 2 + a + 4 + 0 = 11 + a = 9k \Rightarrow a = 7$ olur ($52740$ rakamları farklıdır).
Buna göre $a = 7$''dir.',
   'B şıkkı ($8$), $b = 8$ durumu için bulunan $a = 8$ değerini rakamların birbirinden farklı olma şartıyla denetlemeden işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-02-026 · doğrulandı
  ('0cebc50b-08f6-5aed-a761-26a18f7cd955'::uuid, 'Matematik & Geometri', 'Bölme-Bölünebilme ve EBOB-EKOK', 'multiple_choice', 1,
   '$m$ ve $n$ pozitif tam sayılar olmak üzere, $m$ sayısı $15$ ile bölündüğünde bölüm $4$ ve kalan $n$ olmaktadır.
Buna göre $m + n$ toplamının alabileceği en büyük değer kaçtır?',
   '{"options":["60","74","75","88","90"],"correctIndex":3}'::jsonb,
   'Bölme kuralına göre kalan bölenden küçük olmalıdır: $n < 15$. Dolayısıyla $n$''nin alabileceği en büyük tam sayı değeri $14$''tür. Bu durumda $m = 15 \cdot 4 + 14 = 74$ olur ve toplam $m + n = 74 + 14 = 88$ bulunur.',
   'B şıkkı ($74$), yalnızca bölünen sayı olan $m$''nin en büyük değerini bulup $n$''yi toplamaya eklemeyi unutan adayı; E şıkkı ($90$) ise $n < 15$ yerine $n = 15$ alanları yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-02-027 · doğrulandı
  ('a406781a-7d58-5aa7-9ab8-5470ec002d8d'::uuid, 'Matematik & Geometri', 'Bölme-Bölünebilme ve EBOB-EKOK', 'multiple_choice', 2,
   'Beş basamaklı $38a5b$ doğal sayısı $5$ ile bölündüğünde $2$ kalanını vermekte ve $11$ ile tam bölünmektedir.
Buna göre $a$ rakamının alabileceği değerlerin toplamı kaçtır?',
   '{"options":["5","8","11","13","15"],"correctIndex":2}'::jsonb,
   '$5$''e bölümünden $2$ kalanını vermesi için birler basamağı $b = 2$ veya $b = 7$ olmalıdır. Sağdan sola $+, -, +, -, +$ işaretleri yazılarak $11$ ile bölünebilme incelenir:
- $b = 2$ için: $(2 + a + 3) - (5 + 8) = a - 8 = 11k \Rightarrow a = 8$.
- $b = 7$ için: $(7 + a + 3) - (5 + 8) = a - 3 = 11k \Rightarrow a = 3$.
$a$''nın alabileceği değerlerin toplamı $8 + 3 = 11$ bulunur.',
   'B şıkkı ($8$), $5$''e bölümünden $2$ kalanı için yalnızca $b = 2$''yi düşünüp $b = 7$ durumunu unutan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-02-028 · doğrulandı
  ('aebf0c27-231e-515d-918b-9437e43fcad9'::uuid, 'Matematik & Geometri', 'Bölme-Bölünebilme ve EBOB-EKOK', 'multiple_choice', 2,
   'Bir kütüphanedeki kitaplar $6$''şarlı ve $8$''erli paketlendiğinde her seferinde $4$ kitap artmaktadır. Aynı kitaplar $7$''şerli paketlendiğinde ise hiç kitap artmamaktadır.
Kitap sayısı $200$''den az olduğuna göre bu kütüphanede en çok kaç kitap vardır?',
   '{"options":["28","148","168","172","196"],"correctIndex":4}'::jsonb,
   'Kitap sayısına $K$ denirse $K - 4$ sayısı hem $6$''nın hem $8$''in tam katıdır. $\text{EKOK}(6, 8) = 24$ olduğundan $K = 24k + 4$ biçimindedir ve aynı zamanda $7$''nin tam katı ($K < 200$) olmalıdır. $200$''ün hemen altındaki $24k + 4$ sayıları denenir: $k = 8$ için $K = 24 \cdot 8 + 4 = 196$. $196 = 7 \cdot 28$ olduğundan $7$''ye tam bölünür ve $200$''den küçüktür.',
   'C şıkkı ($168$), üç sayının ortak katı $\text{EKOK}(6, 8, 7) = 168$''i doğrudan cevap sanıp "+4 kalan" şartını göz ardı eden adayı; A şıkkı ($28$) ise en büyük yerine en küçük değeri ($k = 1$) işaretleyenleri yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-02-029 · doğrulandı
  ('91ad4410-3b4a-51a5-a69d-adf84b54cb6f'::uuid, 'Matematik & Geometri', 'Bölme-Bölünebilme ve EBOB-EKOK', 'multiple_choice', 2,
   '$3$ ile bölündüğünde $2$, $4$ ile bölündüğünde $3$ ve $5$ ile bölündüğünde $4$ kalanını veren üç basamaklı en küçük doğal sayı kaçtır?',
   '{"options":["59","61","89","118","119"],"correctIndex":4}'::jsonb,
   'Aranan sayıya $A$ diyelim. Her bölmede kalan, bölenden $1$ eksiktir; dolayısıyla $A + 1$ sayısı $3$, $4$ ve $5$''in tam katıdır. $\text{EKOK}(3, 4, 5) = 60$ olduğundan $A + 1 = 60k \Rightarrow A = 60k - 1$ yazılır. Üç basamaklı en küçük değer için $k = 2$ alınır: $A = 60 \cdot 2 - 1 = 119$.',
   'A şıkkı ($59$), sorudaki "üç basamaklı" şartını gözden kaçırıp $k = 1$ için $59$''u işaretleyen; D şıkkı ($118$) ise $-1$ yerine $-2$ veya yanlış kalan hesabı yapan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-02-030
  ('81bd1018-d39c-5068-82e2-59c5d89ecd64'::uuid, 'Matematik & Geometri', 'Bölme-Bölünebilme ve EBOB-EKOK', 'multiple_choice', 1,
   '$A = 2^3 \cdot 3^2 \cdot 5$ sayısı için,
I. Pozitif tam sayı bölenlerinin sayısı $24$''tür.
II. Asal olmayan pozitif tam sayı bölenlerinin sayısı $20$''dir.
III. Tek pozitif tam sayı bölenlerinin sayısı $6$''dır.
ifadelerinden hangileri doğrudur?',
   '{"options":["Yalnız I","Yalnız III","I ve II","I ve III","I, II ve III"],"correctIndex":3}'::jsonb,
   '- I: Pozitif bölen sayısı $(3 + 1)(2 + 1)(1 + 1) = 4 \cdot 3 \cdot 2 = 24$''tür (I doğru).
- II: Asal bölenler $\{2, 3, 5\}$ olmak üzere $3$ tanedir; dolayısıyla asal olmayan pozitif bölen sayısı $24 - 3 = 21$ olur, $20$ değildir (II yanlış).
- III: Tek bölenler $2$ çarpanı içermez; $3^2 \cdot 5^1$ kısmından $(2 + 1)(1 + 1) = 6$ tane tek pozitif bölen gelir (III doğru).',
   'E şıkkı (I, II ve III), asal olmayan bölen sayısını bulurken $3$ asal sayının yanında $1$''i de ayrıca çıkarıp $24 - 4 = 20$ bulan adayı yakalar. Oysa $1$ sayısı zaten asal değildir ve bu kümenin içinde yer alır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-02-031 · doğrulandı
  ('67f15c93-c0a6-56ec-961c-45804c47aa84'::uuid, 'Matematik & Geometri', 'Bölme-Bölünebilme ve EBOB-EKOK', 'multiple_choice', 2,
   'Biri diğerinin tam katı olmayan $a$ ve $b$ pozitif tam sayıları için $\text{EBOB}(a, b) = 6$ ve $\text{EKOK}(a, b) = 90$ veriliyor.
Buna göre $a + b$ toplamı kaçtır?',
   '{"options":["36","48","60","84","96"],"correctIndex":1}'::jsonb,
   '$\text{EBOB}(a, b) = 6$ olduğundan aralarında asal $x$ ve $y$ pozitif tam sayıları için $a = 6x$ ve $b = 6y$ yazılır. $\text{EKOK}(a, b) = 6xy = 90 \Rightarrow xy = 15$ bulunur. Aralarında asal çarpan çiftleri $(1, 15)$ ve $(3, 5)$''tir. Biri diğerinin tam katı olmayacağı için $(1, 15)$ çifti $(6, 90)$ elenir; $(3, 5)$ çiftinden sayılar $18$ ve $30$ elde edilir. Toplam $18 + 30 = 48$''dir.',
   'E şıkkı ($96$), "biri diğerinin tam katı olmayan" koşulunu atlayıp $(6, 90)$ çiftinin toplamını ($6 + 90 = 96$) işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-02-032 · doğrulandı
  ('c21dcff2-45c4-53b0-a70c-7cf934a6bbb1'::uuid, 'Matematik & Geometri', 'Bölme-Bölünebilme ve EBOB-EKOK', 'multiple_choice', 2,
   'Ayrıt uzunlukları $4$ cm, $6$ cm ve $9$ cm olan dikdörtgenler prizması biçimindeki tuğlalar boşluk kalmadan yan yana ve üst üste dizilerek en küçük hacimli bir küp oluşturulacaktır.
Buna göre bu iş için en az kaç tuğla gerekir?',
   '{"options":["19","36","216","270","324"],"correctIndex":2}'::jsonb,
   'Oluşacak en küçük küpün bir ayrıtı $4, 6$ ve $9$''un en küçük ortak katı olan $\text{EKOK}(4, 6, 9) = 36$ cm olmalıdır. Küpün üç boyutuna sığacak tuğla sayıları çarpılarak toplam adet bulunur:
$$\frac{36}{4} \cdot \frac{36}{6} \cdot \frac{36}{9} = 9 \cdot 6 \cdot 4 = 216$$',
   'A şıkkı ($19$), boyutlara sığan adetleri çarpmak yerine $9 + 6 + 4 = 19$ olarak toplayan adayı; B şıkkı ($36$) ise sadece küpün bir kenar uzunluğunu işaretleyenleri yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-02-033 · doğrulandı
  ('feff3d27-7715-5d43-99a1-6b29add3ccf2'::uuid, 'Matematik & Geometri', 'Bölme-Bölünebilme ve EBOB-EKOK', 'multiple_choice', 3,
   '$A$ doğal sayısının $9$ ile bölümünden kalan $5$, $B$ doğal sayısının $9$ ile bölümünden kalan $7$''dir.
Buna göre $A^2 + B^2 + 5$ sayısının $9$ ile bölümünden kalan kaçtır?',
   '{"options":["1","3","5","7","8"],"correctIndex":3}'::jsonb,
   'Bölmede kalanlarla doğrudan işlem yapılabilir: $A \equiv 5$ ve $B \equiv 7$ (mod $9$) alınır:
$$5^2 + 7^2 + 5 = 25 + 49 + 5 = 79$$
$79$ sayısı $9$''a bölünürse $79 = 9 \cdot 8 + 7$ elde edilir; yani kalan $7$''dir.',
   'A şıkkı ($1$) veya E şıkkı ($8$), $7^2 = 49$ hesaplamasını mod $9$''da indirgerken veya $+5$ sabitini eklemeyi unuttuğunda ortaya çıkan yanlış kalanlardır ($74 \equiv 2$ veya $79$ bölme hatası).',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-02-034 · doğrulandı
  ('fcd14843-e5f6-5a32-9582-999d2540dfad'::uuid, 'Matematik & Geometri', 'Bölme-Bölünebilme ve EBOB-EKOK', 'multiple_choice', 3,
   '$$23! + 24!$$
toplamının sondan kaç basamağı sıfırdır?',
   '{"options":["2","3","4","5","6"],"correctIndex":4}'::jsonb,
   'Toplama işlemi ortak çarpan parantezine alınır:
$$23! + 24! = 23! + 24 \cdot 23! = 23!(1 + 24) = 23! \cdot 25 = 23! \cdot 5^2$$
$23!$ içindeki $5$ çarpanı sayısı $\lfloor 23 \div 5 \rfloor = 4$ adettir ($5^4$). Yanındaki $25 = 5^2$ çarpanından $2$ tane daha $5$ çarpanı geldiğinden toplam $4 + 2 = 6$ tane $5$ çarpanı (ve yeterince fazla $2$ çarpanı) vardır. Dolayısıyla sayının sondan $6$ basamağı sıfırdır.',
   'C şıkkı ($4$), $23! + 24!$ toplamını paranteze almadan doğrudan küçük faktöriyel olan $23!$''in sondan sıfır sayısını ($\lfloor 23/5 \rfloor = 4$) işaretleyen adayların düştüğü klasik faktöriyel tuzağıdır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-02-035 · doğrulandı
  ('23c86c37-8382-59b3-b645-c9fd1c176d52'::uuid, 'Matematik & Geometri', 'Bölme-Bölünebilme ve EBOB-EKOK', 'multiple_choice', 3,
   'Bir $A$ doğal sayısı $4$ ile bölündüğünde $1$, $5$ ile bölündüğünde $2$, $6$ ile bölündüğünde $3$ kalanını vermektedir.
$A > 200$ olduğuna göre $A$''nın alabileceği en küçük değer kaçtır?',
   '{"options":["237","117","177","243","297"],"correctIndex":0}'::jsonb,
   'Her bölmede kalan bölenden $3$ eksiktir ($4 - 1 = 5 - 2 = 6 - 3 = 3$). O hâlde $A + 3$ sayısı $4$, $5$ ve $6$''nın tam katıdır. $\text{EKOK}(4, 5, 6) = 60$ olduğundan $A + 3 = 60k \Rightarrow A = 60k - 3$ olur. $A > 200$ şartını sağlayan en küçük $k$ değeri $k = 4$''tür ($k = 3 \Rightarrow 177$): $A = 60 \cdot 4 - 3 = 237$ bulunur.',
   'D şıkkı ($243$), $A = 60k - 3$ yerine yanlışlıkla $60k + 3$ kurarak $240 + 3 = 243$ bulan adayı; C şıkkı ($177$) ise $200$''den büyük olma şartını ihmal edenleri yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-02-036 · şekilli · doğrulandı
  ('84ffe78b-246c-5207-a5d1-99e20325c028'::uuid, 'Matematik & Geometri', 'Bölme-Bölünebilme ve EBOB-EKOK', 'multiple_choice', 1,
   'Şekildeki $42$ cm ve $56$ cm kenar uzunluklarına sahip dikdörtgen biçimindeki bir levha, hiç parça artmayacak şekilde eşit büyüklükte en büyük karelere bölünecektir.
Buna göre en az kaç kare elde edilir?',
   '{"options":["12","7","14","16","24"],"correctIndex":0}'::jsonb,
   'Elde edilecek karelerin sayısının en az olması için karenin bir kenarı $42$ ve $56$''nın en büyük ortak böleni olmalıdır: $\text{EBOB}(42, 56) = 14$ cm. Yatayda $\dfrac{56}{14} = 4$, dikeyde $\dfrac{42}{14} = 3$ kare oluştuğundan toplam $4 \cdot 3 = 12$ kare elde edilir.',
   'C şıkkı ($14$), kare sayısını bulmak yerine karenin bir kenar uzunluğu olan $\text{EBOB} = 14$ değerini işaretleyen; B şıkkı ($7$) ise parçaları $4 + 3 = 7$ şeklinde toplayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 340.9 260" width="340.9" height="260" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><polygon points="30,230 296.7,230 296.7,30 30,30"/><line x1="30" y1="230" x2="296.7" y2="230"/><text x="163.3" y="246.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">56 cm</text><line x1="296.7" y1="230" x2="296.7" y2="30"/><text x="318.1" y="134.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">42 cm</text><line x1="96.7" y1="230" x2="96.7" y2="30" stroke-dasharray="6 5"/><line x1="163.3" y1="230" x2="163.3" y2="30" stroke-dasharray="6 5"/><line x1="230" y1="230" x2="230" y2="30" stroke-dasharray="6 5"/><line x1="30" y1="163.3" x2="296.7" y2="163.3" stroke-dasharray="6 5"/><line x1="30" y1="96.7" x2="296.7" y2="96.7" stroke-dasharray="6 5"/></svg>', true),
  -- mat-02-037 · şekilli · doğrulandı
  ('2855a7f3-8435-5d19-850e-f989b2238ba0'::uuid, 'Matematik & Geometri', 'Bölme-Bölünebilme ve EBOB-EKOK', 'multiple_choice', 2,
   'Bir duraktan kalkan üç farklı otobüs hattının dakika cinsinden hareket aralıkları aşağıdaki tabloda verilmiştir.
Üç otobüs aynı anda ilk seferine çıktıktan en az kaç saat sonra tekrar birlikte hareket eder?',
   '{"options":["4","6","8","9","12"],"correctIndex":1}'::jsonb,
   'Üç hattın tekrar aynı anda hareket etmesi için geçen süre $18$, $24$ ve $30$''un en küçük ortak katıdır:
$$\text{EKOK}(18, 24, 30) = 360\text{ dakika}$$
$1$ saat $60$ dakika olduğundan $\dfrac{360}{60} = 6$ saat sonra tekrar birlikte hareket ederler.',
   'A şıkkı ($4$) veya C şıkkı ($8$), asal çarpanlara ayırırken $18 = 2 \cdot 3^2$, $24 = 2^3 \cdot 3$, $30 = 2 \cdot 3 \cdot 5$ içinden $2$''nin en büyük kuvveti ($8$) yerine yanlış kat alarak $240$ ya da $480$ dakika hesaplayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 291.3 122" width="291.3" height="122" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><rect x="1" y="1" width="289.3" height="30" fill="currentColor" fill-opacity="0.1" stroke="none"/><rect x="1" y="1" width="289.3" height="120" stroke-width="1.4"/><line x1="1" y1="31" x2="290.3" y2="31" stroke-width="1"/><line x1="1" y1="61" x2="290.3" y2="61" stroke-width="1"/><line x1="1" y1="91" x2="290.3" y2="91" stroke-width="1"/><text x="58.2" y="20.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13" font-weight="600">Otobüs Hattı</text><text x="58.2" y="50.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">A Hattı</text><text x="58.2" y="80.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">B Hattı</text><text x="58.2" y="110.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">C Hattı</text><line x1="115.5" y1="1" x2="115.5" y2="121" stroke-width="1"/><text x="202.9" y="20.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13" font-weight="600">Hareket Aralığı (dk)</text><text x="202.9" y="50.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">18</text><text x="202.9" y="80.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">24</text><text x="202.9" y="110.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">30</text></svg>', true),
  -- mat-02-038 · şekilli · doğrulandı
  ('e6a320db-a2f8-509b-a795-572965832778'::uuid, 'Matematik & Geometri', 'Bölme-Bölünebilme ve EBOB-EKOK', 'multiple_choice', 2,
   'Şekildeki akış şemasına rakamları birbirinden farklı dört basamaklı bir $5a2b$ doğal sayısı giriliyor ve sırasıyla tüm koşulları sağlayan en büyük $5a2b$ sayısı çıkışa yazılıyor.
Buna göre bu sayıdaki $a$ rakamı kaçtır?',
   '{"options":["3","5","7","8","9"],"correctIndex":2}'::jsonb,
   '$5a2b$ sayısının en büyük olması için yüzler basamağı $a$''nın en büyük değeri aranır:
- $4$''ün katı olması için son iki basamak $2b \in \{20, 24, 28\}$ olmalıdır ($b \in \{0, 4, 8\}$).
- $b = 0 \Rightarrow 5 + a + 2 + 0 = 9k \Rightarrow a = 2$ ($5220$, $2$ tekrar eder).
- $b = 4 \Rightarrow 5 + a + 2 + 4 = 11 + a = 9k \Rightarrow a = 7$ ($5724$, rakamları farklı ve en büyük).
- $b = 8 \Rightarrow 5 + a + 2 + 8 = 15 + a = 9k \Rightarrow a = 3$ ($5328$, daha küçük).
En büyük sayı $5724$ olduğundan $a = 7$ bulunur.',
   'A şıkkı ($3$), yalnızca en büyük birler basamağı olan $b = 8$''i deneyip sayının büyüklüğünü belirleyen basamağın $a$ olduğunu gözden kaçırarak $5328$ sayısını alan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 532.7 66" width="532.7" height="66" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><line x1="68.5" y1="33" x2="139.7" y2="33" stroke-width="1.4"/><path d="M139.7 33 L132.3 36.1 M139.7 33 L132.3 29.9" stroke-width="1.4"/><line x1="232.8" y1="33" x2="283.7" y2="33" stroke-width="1.4"/><path d="M283.7 33 L276.3 36.1 M283.7 33 L276.3 29.9" stroke-width="1.4"/><line x1="376.8" y1="33" x2="431.8" y2="33" stroke-width="1.4"/><path d="M431.8 33 L424.4 36.1 M431.8 33 L424.4 29.9" stroke-width="1.4"/><text x="404.3" y="46.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">a ≠ b</text><circle cx="42.2" cy="33" r="26.2" fill="currentColor" fill-opacity="0.06"/><text x="42.2" y="37.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">5a2b</text><rect x="139.7" y="16" width="93.1" height="34" rx="6" fill="currentColor" fill-opacity="0.06"/><text x="186.2" y="37.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">4''ün katı</text><rect x="283.7" y="16" width="93.1" height="34" rx="6" fill="currentColor" fill-opacity="0.06"/><text x="330.2" y="37.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">9''un katı</text><circle cx="474.2" cy="33" r="42.5" fill="currentColor" fill-opacity="0.06"/><text x="474.2" y="37.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">En büyük</text></svg>', true),
  -- mat-02-039 · şekilli · doğrulandı
  ('2af36cd8-5c20-56a5-8384-443f73a3ca20'::uuid, 'Matematik & Geometri', 'Bölme-Bölünebilme ve EBOB-EKOK', 'multiple_choice', 2,
   'Şekildeki uzunlukları $24$ cm, $36$ cm ve $42$ cm olan üç ahşap çubuk, hiç parça artmayacak biçimde eşit uzunlukta en büyük parçalara kesilecektir.
Her kesim işlemi ayrı yapıldığına göre bu iş için toplam en az kaç kesim yapılmalıdır?',
   '{"options":["6","11","12","14","17"],"correctIndex":3}'::jsonb,
   'Kesim sayısının en az olması için her parçanın uzunluğu en büyük seçilir: $\text{EBOB}(24, 36, 42) = 6$ cm.
Oluşan parça sayıları ve gereken kesim sayıları ($n$ parça için $n - 1$ kesim):
- $24 \div 6 = 4$ parça $\to 3$ kesim,
- $36 \div 6 = 6$ parça $\to 5$ kesim,
- $42 \div 6 = 7$ parça $\to 6$ kesim.
Toplam kesim sayısı $3 + 5 + 6 = 14$''tür.',
   'E şıkkı ($17$), kesim sayısı yerine elde edilen toplam parça sayısını ($4 + 6 + 7 = 17$) işaretleyen adayın düştüğü klasik parça-kesim tuzağıdır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 340 193.3" width="340" height="193.3" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><line x1="30" y1="30" x2="190" y2="30"/><text x="110" y="22.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">24 cm</text><line x1="30" y1="96.7" x2="270" y2="96.7"/><text x="150" y="113.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">36 cm</text><line x1="30" y1="163.3" x2="310" y2="163.3"/><text x="170" y="179.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">42 cm</text></svg>', true),
  -- mat-02-040 · doğrulandı
  ('ebd0a7d1-36ad-5a33-9726-96e71b0097fd'::uuid, 'Matematik & Geometri', 'Bölme-Bölünebilme ve EBOB-EKOK', 'multiple_choice', 3,
   'Dört basamaklı $4a3b$ doğal sayısı $15$ ile bölündüğünde $2$ kalanını vermektedir.
Buna göre bu koşulu sağlayan kaç farklı $4a3b$ doğal sayısı yazılabilir?',
   '{"options":["3","4","5","6","7"],"correctIndex":4}'::jsonb,
   '$4a3b$ sayısı $15$''e bölündüğünde $2$ kalanını veriyorsa $4a3b - 2$ sayısı hem $5$''e hem $3$''e tam bölünür:
- $5$''e bölünebilmeden $b - 2 \equiv 0$ (mod $5$) $\Rightarrow b = 2$ veya $b = 7$ olur.
- $3$''e bölünebilmeden $4 + a + 3 + b - 2 = 5 + a + b \equiv 0$ (mod $3$):
- $b = 2$ için $7 + a \equiv 0$ (mod $3$) $\Rightarrow a \in \{2, 5, 8\}$ ($3$ sayı).
- $b = 7$ için $12 + a \equiv 0$ (mod $3$) $\Rightarrow a \in \{0, 3, 6, 9\}$ ($4$ sayı).
Toplam $3 + 4 = 7$ farklı $4a3b$ sayısı yazılabilir.',
   'A şıkkı ($3$) veya D şıkkı ($6$), $b = 7$ durumunu gözden kaçıran ya da $b = 7$ için $a = 0$ rakamını ($4037$) saymayı unutan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true)
on conflict (id) do update set
  lesson = excluded.lesson, topic = excluded.topic, question_type = excluded.question_type,
  difficulty = excluded.difficulty, prompt_text = excluded.prompt_text,
  interaction_data = excluded.interaction_data, explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap, exam_scopes = excluded.exam_scopes,
  education_level = excluded.education_level, figure_svg = excluded.figure_svg, is_active = true;

-- >>> 03_rasyonel_ve_ondalik_sayilar.sql
-- ==========================================================================
-- KADRO SORU HAVUZU · Matematik & Geometri · Rasyonel ve Ondalık Sayılar (30 soru)
-- Kaynak: docs/soru_havuzu/matematik/03_rasyonel_ve_ondalik_sayilar.md · Üretici: tools/math/compile_questions.mjs (elle düzenlemeyin)
-- Önkoşul: docs/supabase_migrations/12_math_figures.sql
-- İdempotent: soru kimlikleri sabit UUID'dir; dosya tekrar çalıştırılırsa sorular güncellenir.
-- ==========================================================================

insert into public.questions (
  id, lesson, topic, question_type, difficulty, prompt_text, interaction_data,
  explanation, distractor_trap, exam_scopes, education_level, figure_svg, is_active
) values
  -- mat-03-001 · doğrulandı
  ('987448dc-5a00-5b68-86d7-c1e5632f33e9'::uuid, 'Matematik & Geometri', 'Rasyonel ve Ondalık Sayılar', 'multiple_choice', 1,
   '$$\dfrac{2 + \dfrac{1}{3}}{1 - \dfrac{1}{6}} \div \dfrac{7}{10}$$
işleminin sonucu kaçtır?',
   '{"options":["4","$\\dfrac{14}{5}$","$\\dfrac{49}{25}$","2","5"],"correctIndex":0}'::jsonb,
   'Ana kesrin payı $2 + \dfrac{1}{3} = \dfrac{7}{3}$, paydası $1 - \dfrac{1}{6} = \dfrac{5}{6}$''dır. İlk bölme işlemi $\dfrac{7}{3} \cdot \dfrac{6}{5} = \dfrac{14}{5}$ olur. Ardından $\dfrac{14}{5} \div \dfrac{7}{10} = \dfrac{14}{5} \cdot \dfrac{10}{7} = 2 \cdot 2 = 4$ bulunur.',
   'B şıkkı ($\frac{14}{5}$), yalnızca büyük kesrin değerini hesaplayıp sondaki $\div \frac{7}{10}$ işlemini yapmayı unutan adayı yakalar. C şıkkı ($\frac{49}{25}$) ise bölmede ikinci kesri ters çevirmeden çarpanların düştüğü tuzaktır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-03-002 · doğrulandı
  ('4469704d-0730-54fb-bbbb-4dbe1c81bb0e'::uuid, 'Matematik & Geometri', 'Rasyonel ve Ondalık Sayılar', 'multiple_choice', 1,
   '$$\dfrac{0{,}12}{0{,}04} + \dfrac{0{,}45}{0{,}15} - \dfrac{0{,}08}{0{,}4}$$
işleminin sonucu kaçtır?',
   '{"options":["4","5,2","5,8","6,2","6,8"],"correctIndex":2}'::jsonb,
   'Pay ve paydalar virgülden kurtulacak şekilde $100$ ile genişletilir: $\dfrac{12}{4} + \dfrac{45}{15} - \dfrac{8}{40} = 3 + 3 - 0{,}2 = 5{,}8$ bulunur.',
   'A şıkkı (4), son kesirdeki $\dfrac{0{,}08}{0{,}4}$ oranını virgülden sonraki basamak sayılarını eşitlemeden $\dfrac{8}{4} = 2$ sanan ve $3 + 3 - 2 = 4$ bulan adayı yakalar. Ondalık bölmede pay ve payda aynı $10$ kuvvetiyle çarpılmalıdır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-03-003 · doğrulandı
  ('aa50fdb0-6b4c-5ba6-ac86-55f1a536dba4'::uuid, 'Matematik & Geometri', 'Rasyonel ve Ondalık Sayılar', 'multiple_choice', 2,
   '$$1{,}\overline{2} + 0{,}\overline{4} - 0{,}1\overline{6}$$
işleminin sonucu kaçtır?',
   '{"options":["$\\dfrac{4}{3}$","$\\dfrac{13}{9}$","$\\dfrac{25}{18}$","$\\dfrac{3}{2}$","$\\dfrac{5}{3}$"],"correctIndex":3}'::jsonb,
   'Devirli ondalık sayılar kesre çevrilir: $1{,}\overline{2} = \dfrac{12 - 1}{9} = \dfrac{11}{9}$, $0{,}\overline{4} = \dfrac{4}{9}$ ve $0{,}1\overline{6} = \dfrac{16 - 1}{90} = \dfrac{15}{90} = \dfrac{1}{6}$. İşlem yapılır: $\dfrac{11 + 4}{9} - \dfrac{1}{6} = \dfrac{15}{9} - \dfrac{1}{6} = \dfrac{5}{3} - \dfrac{1}{6} = \dfrac{10 - 1}{6} = \dfrac{9}{6} = \dfrac{3}{2}$ bulunur.',
   'C şıkkı ($\frac{25}{18}$), $0{,}1\overline{6}$ sayısını dönüştürürken payı $16 - 1$ yerine $16$ alıp $\frac{16}{90}$ üzerinden devam eden ($5/3 - 8/45$ yerine benzer payda hatası) veya $1{,}\overline{2}$ sayısında tam kısmı çıkarmayı unutup $\frac{12}{9}$ alan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-03-004
  ('779807c5-8d95-569e-ae94-138534a7fca7'::uuid, 'Matematik & Geometri', 'Rasyonel ve Ondalık Sayılar', 'multiple_choice', 2,
   '$$a = \dfrac{11}{13}, \quad b = \dfrac{17}{19}, \quad c = \dfrac{23}{25}$$
sayılarının küçükten büyüğe doğru sıralanışı aşağıdakilerden hangisidir?',
   '{"options":["$c < b < a$","$a < b < c$","$b < a < c$","$a < c < b$","$b < c < a$"],"correctIndex":1}'::jsonb,
   'Verilen üç kesir de basit kesirdir ve pay ile payda arasındaki farkları eşittir ($2$). Her bir kesrin $1$''e olan uzaklığı hesaplanır: $1 - a = \dfrac{2}{13}$, $1 - b = \dfrac{2}{19}$, $1 - c = \dfrac{2}{25}$. Payları eşit pozitif kesirlerde paydası büyük olan daha küçüktür: $\dfrac{2}{25} < \dfrac{2}{19} < \dfrac{2}{13}$. Bütüne ($1$''e) uzaklığı en küçük olan $c$ en büyüktür; dolayısıyla $a < b < c$ olur.',
   'A şıkkı ($c < b < a$), payları eşit kesirlerde paydası büyük olanın küçük olması kuralını kesirlerin kendisi için ters uygulayıp bütünden uzaklık mantığını unutan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-03-005 · doğrulandı
  ('dae60edc-ac2c-5b32-9546-ab93d1103cec'::uuid, 'Matematik & Geometri', 'Rasyonel ve Ondalık Sayılar', 'multiple_choice', 2,
   '$$3 + \dfrac{4}{1 + \dfrac{2}{x - 1}} = 5$$
eşitliğini sağlayan $x$ sayısı kaçtır?',
   '{"options":["$-1$","1","2","2,5","3"],"correctIndex":4}'::jsonb,
   'Adım adım dıştan içe doğru çözülür: $3$''e ne eklenirse $5$ olur? $\dfrac{4}{1 + \dfrac{2}{x - 1}} = 2$. $4$''ü neye bölersek $2$ olur? $1 + \dfrac{2}{x - 1} = 2$. Buradan $\dfrac{2}{x - 1} = 1 \Rightarrow x - 1 = 2 \Rightarrow x = 3$ bulunur.',
   'C şıkkı (2), $x - 1 = 2$ adımında $1$''i karşıya $+1$ olarak geçirmek yerine doğrudan $x = 2$ işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-03-006 · şekilli · doğrulandı
  ('1604c153-10ce-55b5-a089-8a57195ece13'::uuid, 'Matematik & Geometri', 'Rasyonel ve Ondalık Sayılar', 'multiple_choice', 2,
   'Yukarıdaki sayı doğrusunda işaretlenen $a$ ve $b$ gerçel sayıları $0{,}5 < a < 1$ ve $2 < b < 2{,}5$ eşitsizliklerini sağlamaktadır.
Buna göre $\dfrac{b}{a}$ kesri aşağıdakilerden hangisi olabilir?',
   '{"options":["$\\dfrac{11}{4}$","$\\dfrac{3}{4}$","$\\dfrac{7}{4}$","$\\dfrac{21}{4}$","$\\dfrac{26}{5}$"],"correctIndex":0}'::jsonb,
   '$\dfrac{b}{a}$ oranının alabileceği en küçük değer için pay ($b$) olabildiğince küçük, payda ($a$) olabildiğince büyük alınır: $\dfrac{2}{1} = 2$. En büyük değer için ise $b$ olabildiğince büyük, $a$ olabildiğince küçük alınır: $\dfrac{2{,}5}{0{,}5} = 5$. Uç noktalar açık olduğu için $2 < \dfrac{b}{a} < 5$ olur. Şıklar incelendiğinde $\dfrac{3}{4} = 0{,}75$, $\dfrac{7}{4} = 1{,}75$, $\dfrac{11}{4} = 2{,}75$, $\dfrac{21}{4} = 5{,}25$ ve $\dfrac{26}{5} = 5{,}2$''dir; $(2, 5)$ aralığına düşen tek kesir $\dfrac{11}{4}$''tür.',
   'C şıkkı ($\frac{7}{4}$), bölme aralığının alt sınırını $\dfrac{2}{0{,}5} = 4$ veya payın en küçük değerini paydanın en küçük değerine bölerek yanlış çaprazlamayla hesaplayıp $2$''nin altındaki değerleri mümkün sanan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 300 64" width="300" height="64" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><line x1="12" y1="30" x2="292" y2="30"/><path d="M292 30 l-8 -4 m8 4 l-8 4"/><path d="M12 30 l8 -4 m-8 4 l8 4"/><line x1="30" y1="25" x2="30" y2="35" stroke-width="1.2"/><text x="30" y="51.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">0</text><line x1="70" y1="25" x2="70" y2="35" stroke-width="1.2"/><text x="70" y="51.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">0,5</text><line x1="110" y1="25" x2="110" y2="35" stroke-width="1.2"/><text x="110" y="51.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">1</text><line x1="150" y1="25" x2="150" y2="35" stroke-width="1.2"/><text x="150" y="51.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">1,5</text><line x1="190" y1="25" x2="190" y2="35" stroke-width="1.2"/><text x="190" y="51.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">2</text><line x1="230" y1="25" x2="230" y2="35" stroke-width="1.2"/><text x="230" y="51.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">2,5</text><line x1="270" y1="25" x2="270" y2="35" stroke-width="1.2"/><text x="270" y="51.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">3</text><text x="90" y="16.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13" font-style="italic">a</text><text x="210" y="16.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13" font-style="italic">b</text><circle cx="90" cy="30" r="5" fill="currentColor" stroke="none"/><circle cx="210" cy="30" r="5" fill="currentColor" stroke="none"/></svg>', true),
  -- mat-03-007 · doğrulandı
  ('10b14a4a-f9a8-5142-b69c-fda388bee8ce'::uuid, 'Matematik & Geometri', 'Rasyonel ve Ondalık Sayılar', 'multiple_choice', 1,
   '$$\dfrac{0{,}06}{0{,}2} + \dfrac{x}{0{,}5} = 2{,}3$$
eşitliğini sağlayan $x$ değeri kaçtır?',
   '{"options":["0,25","0,5","0,8","1","4"],"correctIndex":3}'::jsonb,
   'İlk kesir $100$ ile genişletilirse $\dfrac{6}{20} = 0{,}3$ olur. Denklem $0{,}3 + \dfrac{x}{0{,}5} = 2{,}3 \Rightarrow \dfrac{x}{0{,}5} = 2$ şeklini alır. Buradan $x = 2 \cdot 0{,}5 = 1$ bulunur.',
   'E şıkkı (4), $\dfrac{x}{0{,}5} = 2$ denkleminde $0{,}5$''i karşıya çarpım yerine bölme olarak geçirip $x = 2 \div 0{,}5 = 4$ bulan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-03-008 · doğrulandı
  ('db29d4cb-3cd1-5364-b079-d7f95a634ffe'::uuid, 'Matematik & Geometri', 'Rasyonel ve Ondalık Sayılar', 'multiple_choice', 2,
   '$$\left(1 + \dfrac{1}{2}\right)\left(1 + \dfrac{1}{3}\right)\left(1 + \dfrac{1}{4}\right)\cdots\left(1 + \dfrac{1}{19}\right)$$
çarpımının sonucu kaçtır?',
   '{"options":["$\\dfrac{19}{2}$","10","$\\dfrac{21}{2}$","19","20"],"correctIndex":1}'::jsonb,
   'Her parantez içi bileşik kesre çevrilirse çarpım $\dfrac{3}{2} \cdot \dfrac{4}{3} \cdot \dfrac{5}{4} \cdots \dfrac{20}{19}$ olur. İlk kesrin payından son kesrin paydasına kadar ardışık çapraz terimler ($3, 4, \ldots, 19$) sadeleşir; geriye son kesrin payı ($20$) ile ilk kesrin paydası ($2$) kalır: $\dfrac{20}{2} = 10$.',
   'E şıkkı (20), çapraz sadeleştirme sonucunda ilk kesrin paydasındaki $2$''yi unutup doğrudan kalan son payı ($20$) işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-03-009
  ('a01fdaf4-6f6d-50cc-a877-dc3bfac97d7b'::uuid, 'Matematik & Geometri', 'Rasyonel ve Ondalık Sayılar', 'multiple_choice', 3,
   '$$A = \dfrac{4}{7} + \dfrac{5}{9} + \dfrac{7}{11}$$
olduğuna göre
$$\dfrac{10}{7} + \dfrac{13}{9} + \dfrac{15}{11}$$
toplamının $A$ türünden eşiti aşağıdakilerden hangisidir?',
   '{"options":["$3 - A$","$4 - A$","$6 - A$","$A + 3$","$2A - 3$"],"correctIndex":2}'::jsonb,
   'İstenen toplama $B$ denirse $A$ ve $B$ taraf tarafa toplanarak aynı paydalı kesirler bir araya getirilir:
$A + B = \dfrac{4 + 10}{7} + \dfrac{5 + 13}{9} + \dfrac{7 + 15}{11} = \dfrac{14}{7} + \dfrac{18}{9} + \dfrac{22}{11} = 2 + 2 + 2 = 6$.
$A + B = 6$ eşitliğinden $B = 6 - A$ bulunur.',
   'A şıkkı ($3 - A$), üç kesirden her birinin toplamını $2$ yerine $1$ sanarak $A + B = 3$ yazan adayı yakalar. Aynı paydalı kesir çiftleri toplanıp tam sayıya ulaşıp ulaşılmadığı mutlaka kontrol edilmelidir.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-03-010 · doğrulandı
  ('be21f7fa-fac4-5aa5-b53c-da3afdcc6354'::uuid, 'Matematik & Geometri', 'Rasyonel ve Ondalık Sayılar', 'multiple_choice', 3,
   '$a$ ve $b$ sıfırdan farklı birer rakam olmak üzere
$$0{,}\overline{ab} + 0{,}\overline{ba} = \dfrac{13}{9}$$
eşitliği verilmektedir.
Buna göre $a + b$ toplamı kaçtır?',
   '{"options":["7","9","11","12","13"],"correctIndex":4}'::jsonb,
   'İki basamaklı devirli ondalık sayılar kesre çevrilir: $0{,}\overline{ab} = \dfrac{ab}{99} = \dfrac{10a + b}{99}$ ve $0{,}\overline{ba} = \dfrac{ba}{99} = \dfrac{10b + a}{99}$. İki kesir toplandığında $\dfrac{11a + 11b}{99} = \dfrac{11(a + b)}{99} = \dfrac{a + b}{9}$ elde edilir. Verilen eşitlikten $\dfrac{a + b}{9} = \dfrac{13}{9} \Rightarrow a + b = 13$ bulunur.',
   'D şıkkı (12), $0{,}\overline{ab}$ ifadesinin paydasını $99$ yerine $90$ alarak basamak çözümlemesinde hatalı sadeleştirme yapan ya da devirli kısımda çıkarma işlemi varmış gibi $1$ eksilten adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-03-011 · doğrulandı
  ('d4b093d1-0d37-52c4-9350-1040aa54239c'::uuid, 'Matematik & Geometri', 'Rasyonel ve Ondalık Sayılar', 'multiple_choice', 1,
   '$$\dfrac{3}{4} - \dfrac{1}{2} \cdot \left(\dfrac{5}{6} - \dfrac{1}{3}\right)$$
işleminin sonucu kaçtır?',
   '{"options":["$\\dfrac{1}{8}$","$\\dfrac{1}{4}$","$\\dfrac{1}{2}$","$\\dfrac{3}{8}$","$\\dfrac{5}{8}$"],"correctIndex":2}'::jsonb,
   'İşlem önceliğine göre önce parantez içi hesaplanır: $\dfrac{5}{6} - \dfrac{2}{6} = \dfrac{3}{6} = \dfrac{1}{2}$. Ardından çarpma işlemi yapılır: $\dfrac{1}{2} \cdot \dfrac{1}{2} = \dfrac{1}{4}$. Son olarak $\dfrac{3}{4} - \dfrac{1}{4} = \dfrac{2}{4} = \dfrac{1}{2}$ bulunur.',
   'A şıkkı ($\frac{1}{8}$), işlem önceliğini bozarak çarpmadan önce baştaki çıkarmayı ($\dfrac{3}{4} - \dfrac{1}{2} = \dfrac{1}{4}$) yapıp sonra $\dfrac{1}{2}$ ile çarpan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-03-012 · doğrulandı
  ('e7c8752a-0b73-5cf5-8152-fc128a2ea0e0'::uuid, 'Matematik & Geometri', 'Rasyonel ve Ondalık Sayılar', 'multiple_choice', 1,
   '$$\dfrac{0{,}25 \cdot 0{,}8}{0{,}04} + \dfrac{1{,}5}{0{,}05}$$
işleminin sonucu kaçtır?',
   '{"options":["35","8","25","30,5","50"],"correctIndex":0}'::jsonb,
   'İlk kesrin payı $0{,}25 \cdot 0{,}8 = 0{,}2$''dir. Pay ve payda $100$ ile genişletilirse $\dfrac{20}{4} = 5$ olur. İkinci kesirde pay ve payda $100$ ile genişletilirse $\dfrac{150}{5} = 30$ olur. Toplam $5 + 30 = 35$ bulunur.',
   'B şıkkı (8), ikinci kesirde virgül kaydırmayı eksik yapıp $\dfrac{15}{5} = 3$ alan ($5 + 3 = 8$) adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-03-013 · doğrulandı
  ('821fc816-6a9f-59fc-9114-62ccaeaf2c85'::uuid, 'Matematik & Geometri', 'Rasyonel ve Ondalık Sayılar', 'multiple_choice', 2,
   '$a$ sıfırdan farklı bir rakam olmak üzere
$$0{,}\overline{a} + 0{,}0\overline{a} = \dfrac{11}{15}$$
eşitliğini sağlayan $a$ rakamı kaçtır?',
   '{"options":["2","3","4","5","6"],"correctIndex":4}'::jsonb,
   'Devirli ondalık sayılar kesre çevrilir: $0{,}\overline{a} = \dfrac{a}{9}$ ve $0{,}0\overline{a} = \dfrac{a}{90}$. Payda eşitlenip toplanırsa $\dfrac{10a + a}{90} = \dfrac{11a}{90}$ elde edilir. Verilen eşitlikten $\dfrac{11a}{90} = \dfrac{11}{15} \Rightarrow \dfrac{a}{90} = \dfrac{1}{15} \Rightarrow a = \dfrac{90}{15} = 6$ bulunur.',
   'B şıkkı (3) veya D şıkkı (5), $0{,}0\overline{a}$ sayısının paydasını $90$ yerine $99$ veya $100$ alarak yanlış payda eşitleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-03-014
  ('462643c0-0dfe-542c-bf79-cae6e3de6840'::uuid, 'Matematik & Geometri', 'Rasyonel ve Ondalık Sayılar', 'multiple_choice', 2,
   '$$x = -\dfrac{7}{8}, \quad y = -\dfrac{11}{12}, \quad z = -\dfrac{15}{16}$$
sayılarının küçükten büyüğe doğru sıralanışı aşağıdakilerden hangisidir?',
   '{"options":["$x < y < z$","$z < y < x$","$y < z < x$","$x < z < y$","$z < x < y$"],"correctIndex":1}'::jsonb,
   'Önce sayıların pozitif değerleri karşılaştırılır: $\dfrac{7}{8}$, $\dfrac{11}{12}$ ve $\dfrac{15}{16}$ kesirlerinin $1$''e uzaklıkları sırasıyla $\dfrac{1}{8}$, $\dfrac{1}{12}$ ve $\dfrac{1}{16}$''dır. Bütüne en yakın olan $\dfrac{15}{16}$ en büyüktür: $\dfrac{7}{8} < \dfrac{11}{12} < \dfrac{15}{16}$. Sayılar negatif olduğu için eksi ile çarpıldıklarında sıralama yön değiştirir: $-\dfrac{15}{16} < -\dfrac{11}{12} < -\dfrac{7}{8}$, yani $z < y < x$ olur.',
   'A şıkkı ($x < y < z$), negatif işaretleri görmezden gelip pozitif kesirlerdeki sıralamayı doğrudan yazan adayı yakalar. Sayı doğrusunda sıfırdan sola uzaklaştıkça değer küçülür.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-03-015 · doğrulandı
  ('201bc13e-935e-5839-9c79-de5c5749cc7a'::uuid, 'Matematik & Geometri', 'Rasyonel ve Ondalık Sayılar', 'multiple_choice', 2,
   '$$\dfrac{2x + 17}{x + 1}$$
kesrini bir tam sayı yapan kaç farklı $x$ doğal sayısı vardır?',
   '{"options":["1","2","3","4","8"],"correctIndex":3}'::jsonb,
   'Paydaki ifade paydaya bölünerek tam kısım ayrılır: $\dfrac{2(x + 1) + 15}{x + 1} = 2 + \dfrac{15}{x + 1}$. İfadenin tam sayı olması için $x + 1$ sayısının $15$''i tam bölmesi gerekir. $x$ doğal sayı ($x \ge 0$) olduğundan $x + 1 \ge 1$ olmalıdır; $15$''in pozitif bölenleri $1, 3, 5, 15$ olmak üzere $4$ tanedir ($x \in \{0, 2, 4, 14\}$).',
   'C şıkkı (3), doğal sayılar kümesinin en küçük elemanı olan $0$''ı ($x = 0 \Rightarrow \frac{17}{1} = 17$) unutarak yalnızca pozitif tam sayıları sayan adayı; E şıkkı (8) ise negatif bölenleri de sayanları yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-03-016 · doğrulandı
  ('865465be-6944-5e7b-bf7b-8ef792994802'::uuid, 'Matematik & Geometri', 'Rasyonel ve Ondalık Sayılar', 'multiple_choice', 2,
   '$x$ ve $y$ birbirinden farklı pozitif rakamlar olmak üzere
$$\dfrac{x + 2y}{x}$$
ifadesinin alabileceği en büyük değer kaçtır?',
   '{"options":["10","11","17","18","19"],"correctIndex":4}'::jsonb,
   'Kesir ayrıştırılır: $\dfrac{x}{x} + \dfrac{2y}{x} = 1 + \dfrac{2y}{x}$. İfadenin en büyük değerini alması için $y$ en büyük rakam ($9$), $x$ ise en küçük pozitif rakam ($1$) seçilir ($9$ ile $1$ farklıdır). Buradan $1 + \dfrac{2 \cdot 9}{1} = 1 + 18 = 19$ bulunur.',
   'D şıkkı (18), kesri ayırdıktan sonra baştaki $\frac{x}{x} = 1$ tam sayısını unutup yalnızca $\frac{2 \cdot 9}{1} = 18$''i işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-03-017 · doğrulandı
  ('5ca57848-e327-50a4-bea8-ab1ba45e8524'::uuid, 'Matematik & Geometri', 'Rasyonel ve Ondalık Sayılar', 'multiple_choice', 1,
   '$$\dfrac{1{,}2}{0{,}3} - \dfrac{0{,}24}{0{,}06} + \dfrac{0{,}05}{0{,}25}$$
işleminin sonucu kaçtır?',
   '{"options":["0","0,1","0,2","0,5","2"],"correctIndex":2}'::jsonb,
   'Her kesir pay ve paydası virgülden kurtulacak biçimde genişletilir: $\dfrac{12}{3} - \dfrac{24}{6} + \dfrac{5}{25} = 4 - 4 + \dfrac{1}{5} = 0{,}2$ bulunur.',
   'E şıkkı (2), son kesirdeki $\dfrac{5}{25} = \dfrac{1}{5} = 0{,}2$ işlemini ters bölüp $\dfrac{25}{5} = 5$ ya da $0{,}2$ yerine $2$ alan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-03-018 · şekilli · doğrulandı
  ('cdc5c81c-9c05-5632-922c-5f50dbca68ac'::uuid, 'Matematik & Geometri', 'Rasyonel ve Ondalık Sayılar', 'multiple_choice', 2,
   'Yukarıdaki sayı doğrusunda işaretlenen $a$ ve $b$ gerçel sayıları $-1 < a < -0{,}5$ ve $0 < b < 0{,}5$ eşitsizliklerini sağlamaktadır.
Buna göre $a - b$ farkı aşağıdakilerden hangisi olabilir?',
   '{"options":["$-\\dfrac{5}{4}$","$-\\dfrac{7}{4}$","$-\\dfrac{1}{4}$","$\\dfrac{1}{4}$","$\\dfrac{3}{4}$"],"correctIndex":0}'::jsonb,
   'Verilen eşitsizlikte $0 < b < 0{,}5$ ifadesi $-1$ ile çarpılırsa $-0{,}5 < -b < 0$ olur. İlk eşitsizlik olan $-1 < a < -0{,}5$ ile taraf tarafa toplanırsa $-1{,}5 < a - b < -0{,}5$ aralığı elde edilir. Şıklar ondalık yazıldığında $-\dfrac{7}{4} = -1{,}75$, $-\dfrac{5}{4} = -1{,}25$, $-\dfrac{1}{4} = -0{,}25$ olur; $(-1{,}5, -0{,}5)$ aralığına düşen tek sayı $-\dfrac{5}{4}$''tür.',
   'C şıkkı ($-\frac{1}{4}$), $a - b$ çıkarma işlemini yapmak yerine $a + b$ aralığını ($-1 < a + b < 0$) hesaplayıp $-0{,}25$''i seçen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 332 64" width="332" height="64" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><line x1="12" y1="30" x2="324" y2="30"/><path d="M324 30 l-8 -4 m8 4 l-8 4"/><path d="M12 30 l8 -4 m-8 4 l8 4"/><line x1="30" y1="25" x2="30" y2="35" stroke-width="1.2"/><text x="30" y="51.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">-2</text><line x1="64" y1="25" x2="64" y2="35" stroke-width="1.2"/><text x="64" y="51.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">-1,5</text><line x1="98" y1="25" x2="98" y2="35" stroke-width="1.2"/><text x="98" y="51.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">-1</text><line x1="132" y1="25" x2="132" y2="35" stroke-width="1.2"/><text x="132" y="51.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">-0,5</text><line x1="166" y1="25" x2="166" y2="35" stroke-width="1.2"/><text x="166" y="51.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">0</text><line x1="200" y1="25" x2="200" y2="35" stroke-width="1.2"/><text x="200" y="51.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">0,5</text><line x1="234" y1="25" x2="234" y2="35" stroke-width="1.2"/><text x="234" y="51.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">1</text><line x1="268" y1="25" x2="268" y2="35" stroke-width="1.2"/><text x="268" y="51.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">1,5</text><line x1="302" y1="25" x2="302" y2="35" stroke-width="1.2"/><text x="302" y="51.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">2</text><text x="115" y="16.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13" font-style="italic">a</text><text x="183" y="16.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13" font-style="italic">b</text><circle cx="115" cy="30" r="5" fill="currentColor" stroke="none"/><circle cx="183" cy="30" r="5" fill="currentColor" stroke="none"/></svg>', true),
  -- mat-03-019 · doğrulandı
  ('3154827c-d5e2-58bb-aec5-06eaac7d04a4'::uuid, 'Matematik & Geometri', 'Rasyonel ve Ondalık Sayılar', 'multiple_choice', 1,
   'Payı paydasından $4$ eksik olan bir kesrin payına $1$ eklenip paydasından $1$ çıkarıldığında elde edilen yeni kesrin değeri $\dfrac{3}{4}$ olmaktadır.
Buna göre başlangıçtaki kesrin payı ile paydasının toplamı kaçtır?',
   '{"options":["12","14","16","18","20"],"correctIndex":1}'::jsonb,
   'Başlangıçtaki kesrin paydasına $x$ denirse payı $x - 4$ olur. Payına $1$ eklenip paydasından $1$ çıkarılınca $\dfrac{(x - 4) + 1}{x - 1} = \dfrac{x - 3}{x - 1} = \dfrac{3}{4}$ denklemi kurulur. İçler dışlar çarpımıyla $4x - 12 = 3x - 3 \Rightarrow x = 9$ bulunur. İlk kesir $\dfrac{5}{9}$ olduğundan pay ve payda toplamı $5 + 9 = 14$''tür.',
   'C şıkkı (16), kesrin sadeleştirilmiş hâli olan $\frac{3}{4}$ üzerinden ters işlem yaparken $+1$ ve $-1$''i yanlış yönde uygulayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-03-020 · doğrulandı
  ('b46ccc24-6bce-5708-9e50-69a60457342f'::uuid, 'Matematik & Geometri', 'Rasyonel ve Ondalık Sayılar', 'multiple_choice', 2,
   '$$\left(1 - \dfrac{1}{4}\right)\left(1 - \dfrac{1}{9}\right)\left(1 - \dfrac{1}{16}\right)\cdots\left(1 - \dfrac{1}{100}\right)$$
çarpımının sonucu kaçtır?',
   '{"options":["$\\dfrac{1}{10}$","$\\dfrac{9}{20}$","$\\dfrac{1}{2}$","$\\dfrac{11}{20}$","$\\dfrac{11}{10}$"],"correctIndex":3}'::jsonb,
   'Her parantez içi iki kare farkı özdeşliğiyle $\left(1 - \dfrac{1}{n^2}\right) = \left(1 - \dfrac{1}{n}\right)\left(1 + \dfrac{1}{n}\right) = \dfrac{n - 1}{n} \cdot \dfrac{n + 1}{n}$ şeklinde ayrılır. $n = 2$''den $10$''a kadar tüm terimler yazıldığında:
$\left(\dfrac{1}{2} \cdot \dfrac{3}{2}\right)\left(\dfrac{2}{3} \cdot \dfrac{4}{3}\right)\left(\dfrac{3}{4} \cdot \dfrac{5}{4}\right)\cdots\left(\dfrac{9}{10} \cdot \dfrac{11}{10}\right)$.
Ortadaki tüm çarpanlar birbirini sadeleştirir; geriye yalnızca en baştaki $\dfrac{1}{2}$ ile en sondaki $\dfrac{11}{10}$ kalır. Çarpım $\dfrac{1}{2} \cdot \dfrac{11}{10} = \dfrac{11}{20}$ bulunur.',
   'A şıkkı ($\frac{1}{10}$) veya E şıkkı ($\frac{11}{10}$), iki kare farkını açmak yerine yalnızca $1 - \frac{1}{n}$ biçimindeki tek zincir gibi sadeleştirme yapan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-03-021 · doğrulandı
  ('b2f9a2ef-aecf-5096-858f-0f244ea3f500'::uuid, 'Matematik & Geometri', 'Rasyonel ve Ondalık Sayılar', 'multiple_choice', 3,
   '$$\dfrac{1}{2 \cdot 3} + \dfrac{1}{3 \cdot 4} + \dfrac{1}{4 \cdot 5} + \cdots + \dfrac{1}{19 \cdot 20}$$
toplamının sonucu kaçtır?',
   '{"options":["$\\dfrac{17}{40}$","$\\dfrac{19}{40}$","$\\dfrac{9}{20}$","$\\dfrac{11}{20}$","$\\dfrac{9}{19}$"],"correctIndex":2}'::jsonb,
   'Ardışık iki sayının çarpımı biçimindeki her kesir basit kesirlere ayrılır: $\dfrac{1}{n(n + 1)} = \dfrac{1}{n} - \dfrac{1}{n + 1}$. Toplam yazılırsa
$\left(\dfrac{1}{2} - \dfrac{1}{3}\right) + \left(\dfrac{1}{3} - \dfrac{1}{4}\right) + \cdots + \left(\dfrac{1}{19} - \dfrac{1}{20}\right)$.
Ara terimler birbirini götürür ve geriye yalnızca $\dfrac{1}{2} - \dfrac{1}{20} = \dfrac{10 - 1}{20} = \dfrac{9}{20}$ kalır.',
   'E şıkkı ($\frac{9}{19}$), son terimi $\frac{1}{19} - \frac{1}{20}$ yerine $\frac{1}{19}$''da bitiren; A şıkkı ($\frac{17}{40}$) ise ilk terimi $\frac{1}{2}$ yerine $\frac{1}{3}$ alan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-03-022 · doğrulandı
  ('284e76cb-52bd-56d4-9a78-5700c9ea1696'::uuid, 'Matematik & Geometri', 'Rasyonel ve Ondalık Sayılar', 'multiple_choice', 3,
   '$x$ ve $y$ sıfırdan farklı birer rakam olmak üzere
$$0{,}x\overline{y} - 0{,}y\overline{x} = 0{,}\overline{4}$$
eşitliğini sağlayan kaç farklı $(x, y)$ ikilisi vardır?',
   '{"options":["2","3","5","6","4"],"correctIndex":4}'::jsonb,
   'Devirli ondalık sayılar kesre çevrilir: $0{,}x\overline{y} = \dfrac{10x + y - x}{90} = \dfrac{9x + y}{90}$ ve $0{,}y\overline{x} = \dfrac{9y + x}{90}$. Fark alındığında $\dfrac{(9x + y) - (9y + x)}{90} = \dfrac{8(x - y)}{90} = \dfrac{4(x - y)}{45}$ elde edilir. Sağ taraf $0{,}\overline{4} = \dfrac{4}{9}$ olduğundan $\dfrac{4(x - y)}{45} = \dfrac{4}{9} \Rightarrow x - y = 5$ bulunur. Sıfırdan farklı rakamlar için $(6, 1)$, $(7, 2)$, $(8, 3)$ ve $(9, 4)$ olmak üzere $4$ ikili vardır.',
   'C şıkkı (5), "sıfırdan farklı" koşulunu gözden kaçırıp $(5, 0)$ ikilisini de sayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-03-023 · doğrulandı
  ('784aa922-7b5f-5364-8ded-d7c549d40c1a'::uuid, 'Matematik & Geometri', 'Rasyonel ve Ondalık Sayılar', 'multiple_choice', 1,
   '$$\dfrac{\dfrac{1}{2} + \dfrac{1}{3}}{\dfrac{1}{2} - \dfrac{1}{3}}$$
işleminin sonucu kaçtır?',
   '{"options":["5","1","2","3","6"],"correctIndex":0}'::jsonb,
   'Pay ve paydadaki kesirlerin paydası $6$''da eşitlenir: $\dfrac{1}{2} + \dfrac{1}{3} = \dfrac{3 + 2}{6} = \dfrac{5}{6}$ ve $\dfrac{1}{2} - \dfrac{1}{3} = \dfrac{3 - 2}{6} = \dfrac{1}{6}$. Bölme yapılırsa $\dfrac{5/6}{1/6} = 5$ bulunur.',
   'B şıkkı ($1$) veya E şıkkı ($6$), payda eşitlemeden payları kendi arasında toplayıp çıkaran ya da ters çevirip çarpmada hata yapan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-03-024 · doğrulandı
  ('227b490f-7e3e-5bc7-ab90-4d57efdcac4e'::uuid, 'Matematik & Geometri', 'Rasyonel ve Ondalık Sayılar', 'multiple_choice', 1,
   '$$\dfrac{0{,}48}{0{,}06} + \dfrac{0{,}36}{0{,}12} - \dfrac{0{,}5}{0{,}25}$$
işleminin sonucu kaçtır?',
   '{"options":["7","9","11","13","15"],"correctIndex":1}'::jsonb,
   'Her kesir pay ve paydası $100$ ile genişletilerek virgülden kurtarılır:
$$\frac{48}{6} + \frac{36}{12} - \frac{50}{25} = 8 + 3 - 2 = 9$$',
   'A şıkkı ($7$), son kesirde $\dfrac{0{,}5}{0{,}25}$ genişletmesini $5 \div 25$ sanıp veya $8 + 3 - 4$ gibi basamak kaydırma hatası yapan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-03-025 · doğrulandı
  ('20b71b11-2ea1-5340-a05e-f5a37e02f641'::uuid, 'Matematik & Geometri', 'Rasyonel ve Ondalık Sayılar', 'multiple_choice', 2,
   '$$2 + \dfrac{3}{1 - \dfrac{1}{1 + \dfrac{1}{2}}}$$
işleminin sonucu kaçtır?',
   '{"options":["5","7","9","11","13"],"correctIndex":3}'::jsonb,
   'En alttan yukarıya doğru adım adım ilerlenir:
- $1 + \dfrac{1}{2} = \dfrac{3}{2}$
- $\dfrac{1}{3/2} = \dfrac{2}{3} \Rightarrow 1 - \dfrac{2}{3} = \dfrac{1}{3}$
- $\dfrac{3}{1/3} = 9 \Rightarrow 2 + 9 = 11$ bulunur.',
   'A şıkkı ($5$), $1 - \dfrac{2}{3}$ yerine $1 + \dfrac{2}{3}$ veya $3 \div (1/3)$ işlemini $3 \cdot \frac{1}{3} = 1$ sanarak $2 + 1$ üzerinden hata yapan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-03-026 · doğrulandı
  ('6ad604ac-1e45-5d56-9a3a-f7285ebd177d'::uuid, 'Matematik & Geometri', 'Rasyonel ve Ondalık Sayılar', 'multiple_choice', 2,
   '$$\dfrac{0{,}\overline{7} + 0{,}\overline{2}}{0{,}1\overline{6}}$$
işleminin sonucu kaçtır?',
   '{"options":["3","4","6","8","9"],"correctIndex":2}'::jsonb,
   'Devirli ondalık sayılar kesre çevrilir: $0{,}\overline{7} = \dfrac{7}{9}$, $0{,}\overline{2} = \dfrac{2}{9}$ ve $0{,}1\overline{6} = \dfrac{16 - 1}{90} = \dfrac{15}{90} = \dfrac{1}{6}$.
Pay kısmı $\dfrac{7}{9} + \dfrac{2}{9} = \dfrac{9}{9} = 1$''dir. Bölme sonucu $\dfrac{1}{1/6} = 6$ bulunur.',
   'E şıkkı ($9$) veya D şıkkı ($8$), paydadaki $0{,}1\overline{6}$ sayısını $\dfrac{16}{99}$ ya da $\dfrac{15}{99}$ sanıp devretmeyen basamak kuralını yanlış uygulayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-03-027 · doğrulandı
  ('19d990ec-495f-5912-98e4-8875d1d577f5'::uuid, 'Matematik & Geometri', 'Rasyonel ve Ondalık Sayılar', 'multiple_choice', 2,
   '$$\dfrac{0{,}04x}{0{,}2} + \dfrac{0{,}15}{0{,}03} = 7$$
denklemini sağlayan $x$ sayısı kaçtır?',
   '{"options":["2","4","6","8","10"],"correctIndex":4}'::jsonb,
   'Her kesir $100$ ile genişletilir: $\dfrac{4x}{20} + \dfrac{15}{3} = 7 \Rightarrow \dfrac{x}{5} + 5 = 7 \Rightarrow \dfrac{x}{5} = 2 \Rightarrow x = 10$ bulunur.',
   'A şıkkı ($2$), ilk kesirde $0{,}2$''yi $0{,}02$ gibi virgülden kurtarıp $4x / 2 = 2x$ elde ederek $2x = 2 \Rightarrow x = 1$ (veya $x = 2$) basamak hatası yapan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-03-028 · doğrulandı
  ('c4dddb76-0871-53cb-b057-1ab8135f7755'::uuid, 'Matematik & Geometri', 'Rasyonel ve Ondalık Sayılar', 'multiple_choice', 2,
   '$$A = \dfrac{2}{5} + \dfrac{3}{7} + \dfrac{4}{9} \quad \text{ve} \quad B = \dfrac{18}{5} + \dfrac{25}{7} + \dfrac{32}{9}$$
olduğuna göre $A + B$ toplamı kaçtır?',
   '{"options":["12","9","10","14","15"],"correctIndex":0}'::jsonb,
   'Paydaları eşit olan kesirler kendi aralarında toplanır:
$$A + B = \frac{2 + 18}{5} + \frac{3 + 25}{7} + \frac{4 + 32}{9} = \frac{20}{5} + \frac{28}{7} + \frac{36}{9} = 4 + 4 + 4 = 12$$',
   'B şıkkı ($9$), üç kesrin de tam kısmını yanlışlıkla $3$ olarak sadeleştirip $3 + 3 + 3 = 9$ bulan; ya da ayrı ayrı payda eşitlemeye çalışıp işlem hatası yapan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-03-029 · doğrulandı
  ('19350239-e532-5541-b53d-199c86daf2af'::uuid, 'Matematik & Geometri', 'Rasyonel ve Ondalık Sayılar', 'multiple_choice', 3,
   '$$7 - \dfrac{12}{5 - \dfrac{6}{1 + \dfrac{4}{x}}} = 3$$
denklemini sağlayan $x$ sayısı kaçtır?',
   '{"options":["1","2","3","4","6"],"correctIndex":1}'::jsonb,
   'Dıştan içe doğru çözüm yapılır:
- $7 - 3 = 4$ olduğundan ilk büyük kesir $4$''e eşittir: $\dfrac{12}{5 - \frac{6}{1 + 4/x}} = 4 \Rightarrow 5 - \dfrac{6}{1 + 4/x} = 3$.
- Buradan $\dfrac{6}{1 + 4/x} = 2 \Rightarrow 1 + \dfrac{4}{x} = 3$.
- Son olarak $\dfrac{4}{x} = 2 \Rightarrow x = 2$ bulunur.',
   'D şıkkı ($4$) veya A şıkkı ($1$), $\dfrac{6}{1 + 4/x} = 2$ adımında $1 + \dfrac{4}{x} = 3$ yerine $1$''i karşıya atmayı unutup $\dfrac{4}{x} = 2$ adımında karışıklık yaşayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-03-030 · doğrulandı
  ('5bc6d7df-268a-5847-9032-473d21191141'::uuid, 'Matematik & Geometri', 'Rasyonel ve Ondalık Sayılar', 'multiple_choice', 3,
   'Payı paydasından $3$ küçük olan bir kesrin payına $4$ eklenip paydasından $1$ çıkarıldığında kesrin değeri $\dfrac{3}{2}$ oluyor.
Buna göre başlangıçtaki kesrin payı ile paydasının toplamı kaçtır?',
   '{"options":["3","5","6","7","9"],"correctIndex":3}'::jsonb,
   'Başlangıçtaki kesrin payı $x$ ise paydası $x + 3$''tür. Verilen değişiklik uygulanırsa:
$$\frac{x + 4}{(x + 3) - 1} = \frac{3}{2} \Rightarrow \frac{x + 4}{x + 2} = \frac{3}{2}$$
İçler dışlar çarpımı ile $2x + 8 = 3x + 6 \Rightarrow x = 2$ bulunur. Başlangıç kesri $\dfrac{2}{5}$ olduğundan pay ile paydanın toplamı $2 + 5 = 7$''dir.',
   'B şıkkı ($5$), $x = 2$ bulduktan sonra pay ve payda toplamı ($2 + 5 = 7$) yerine yalnızca payda olan $5$''i işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true)
on conflict (id) do update set
  lesson = excluded.lesson, topic = excluded.topic, question_type = excluded.question_type,
  difficulty = excluded.difficulty, prompt_text = excluded.prompt_text,
  interaction_data = excluded.interaction_data, explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap, exam_scopes = excluded.exam_scopes,
  education_level = excluded.education_level, figure_svg = excluded.figure_svg, is_active = true;

-- >>> 04_basit_esitsizlikler_ve_mutlak_deger.sql
-- ==========================================================================
-- KADRO SORU HAVUZU · Matematik & Geometri · Basit Eşitsizlikler ve Mutlak Değer (30 soru)
-- Kaynak: docs/soru_havuzu/matematik/04_basit_esitsizlikler_ve_mutlak_deger.md · Üretici: tools/math/compile_questions.mjs (elle düzenlemeyin)
-- Önkoşul: docs/supabase_migrations/12_math_figures.sql
-- İdempotent: soru kimlikleri sabit UUID'dir; dosya tekrar çalıştırılırsa sorular güncellenir.
-- ==========================================================================

insert into public.questions (
  id, lesson, topic, question_type, difficulty, prompt_text, interaction_data,
  explanation, distractor_trap, exam_scopes, education_level, figure_svg, is_active
) values
  -- mat-04-001 · şekilli · doğrulandı
  ('9b042556-d01e-5de8-9ff3-c4f350bf7ea1'::uuid, 'Matematik & Geometri', 'Basit Eşitsizlikler ve Mutlak Değer', 'multiple_choice', 1,
   'Sayı doğrusunda gösterilen aralığın içinde kaç tane tam sayı vardır?',
   '{"options":["5","6","8","7","9"],"correctIndex":3}'::jsonb,
   'Sayı doğrusunda sol uç $-2$ dolu çemberle gösterildiği için kümeye dahildir; sağ uç $5$ boş çemberle gösterildiği için kümeye dahil değildir. Yani aralık $[-2, 5)$ yarı açık aralığıdır. Bu aralıktaki tam sayılar $-2, -1, 0, 1, 2, 3, 4$ olup toplam $4 - (-2) + 1 = 7$ tanedir.',
   'C şıkkı (8), sağ uçtaki boş çemberi de dahil sayıp $5$''i kümeye katan adayı yakalar. B şıkkı (6) ise $-2$ ile $5$ arasındaki tam sayıları uç noktaların ikisini de hariç tutarak sayanların tuzağıdır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 366 64" width="366" height="64" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><line x1="12" y1="30" x2="296.5" y2="30"/><line x1="307.5" y1="30" x2="358" y2="30"/><path d="M358 30 l-8 -4 m8 4 l-8 4"/><path d="M12 30 l8 -4 m-8 4 l8 4"/><line x1="64" y1="30" x2="296.5" y2="30" stroke-width="5" stroke-opacity="0.55"/><line x1="30" y1="25" x2="30" y2="35" stroke-width="1.2"/><text x="30" y="51.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">-3</text><line x1="64" y1="25" x2="64" y2="35" stroke-width="1.2"/><text x="64" y="51.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">-2</text><line x1="98" y1="25" x2="98" y2="35" stroke-width="1.2"/><text x="98" y="51.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">-1</text><line x1="132" y1="25" x2="132" y2="35" stroke-width="1.2"/><text x="132" y="51.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">0</text><line x1="166" y1="25" x2="166" y2="35" stroke-width="1.2"/><text x="166" y="51.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">1</text><line x1="200" y1="25" x2="200" y2="35" stroke-width="1.2"/><text x="200" y="51.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">2</text><line x1="234" y1="25" x2="234" y2="35" stroke-width="1.2"/><text x="234" y="51.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">3</text><line x1="268" y1="25" x2="268" y2="35" stroke-width="1.2"/><text x="268" y="51.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">4</text><text x="302" y="51.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">5</text><line x1="336" y1="25" x2="336" y2="35" stroke-width="1.2"/><text x="336" y="51.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">6</text><circle cx="64" cy="30" r="5" fill="currentColor" stroke="none"/><circle cx="302" cy="30" r="5" stroke-width="1.8"/></svg>', true),
  -- mat-04-002 · doğrulandı
  ('31086a42-4cb6-5f15-b037-629adf089941'::uuid, 'Matematik & Geometri', 'Basit Eşitsizlikler ve Mutlak Değer', 'multiple_choice', 1,
   '$$\dfrac{2x - 5}{-3} \ge 1$$
eşitsizliğini sağlayan en büyük $x$ tam sayısı kaçtır?',
   '{"options":["0","1","2","4","$-1$"],"correctIndex":1}'::jsonb,
   'Eşitsizliğin her iki tarafı negatif olan $-3$ ile çarpıldığında eşitsizlik yön değiştirir: $2x - 5 \le -3$. Buradan $2x \le 2 \Rightarrow x \le 1$ elde edilir. Bu koşulu sağlayan en büyük $x$ tam sayısı $1$''dir.',
   'C şıkkı (2) veya D şıkkı (4), negatif sayıyla çarpma sırasında eşitsizliğin yönünü çevirmeyi unutup $x \ge 1$ sonucuna ulaşan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-04-003 · doğrulandı
  ('3291f021-3876-5cbe-9999-6fde24722a4c'::uuid, 'Matematik & Geometri', 'Basit Eşitsizlikler ve Mutlak Değer', 'multiple_choice', 2,
   '$x$ ve $y$ gerçel sayıları için
$$-3 < x \le 4 \quad \text{ve} \quad -2 < y \le 5$$
eşitsizlikleri veriliyor.
Buna göre $2x - 3y$ ifadesinin alabileceği en büyük tam sayı değeri kaçtır?',
   '{"options":["13","14","11","12","10"],"correctIndex":0}'::jsonb,
   '$x$ ve $y$ gerçel sayılar olduğu için değer seçilmez, aralıklarla işlem yapılır.
$2x$ için $-6 < 2x \le 8$,
$-3y$ için $-15 \le -3y < 6$ (negatif $-3$ ile çarpılınca yön değişir).
İki eşitsizlik taraf tarafa toplanır (biri $\le$, diğeri $<$ olduğu için üst sınır açık olur): $-21 < 2x - 3y < 14$. İfadenin alabileceği en büyük tam sayı değeri $13$''tür.',
   'C şıkkı (11), $x$ ve $y$''yi gerçel sayı yerine tam sayı sanıp $x = 4, y = -1$ seçerek $2(4) - 3(-1) = 11$ bulan adayı yakalar. B şıkkı (14) ise üst sınırın açık olduğunu gözden kaçıranların tuzağıdır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-04-004 · doğrulandı
  ('ad18981e-ccd7-50ce-a1da-f0b7ef880418'::uuid, 'Matematik & Geometri', 'Basit Eşitsizlikler ve Mutlak Değer', 'multiple_choice', 2,
   '$a$ bir gerçel sayı olmak üzere $a^2 < a$ eşitsizliği sağlanmaktadır.
Buna göre $6a - 1$ ifadesinin alabileceği tam sayı değerlerinin toplamı kaçtır?',
   '{"options":["5","6","9","15","10"],"correctIndex":4}'::jsonb,
   'Karesi kendisinden küçük olan gerçel sayılar $0 < a < 1$ aralığındadır. Eşitsizliğin tüm tarafları $6$ ile çarpılır: $0 < 6a < 6$. Ardından her taraftan $1$ çıkarılır: $-1 < 6a - 1 < 5$. Bu aralıktaki tam sayılar $0, 1, 2, 3, 4$ olup toplamları $0 + 1 + 2 + 3 + 4 = 10$ bulunur.',
   'D şıkkı (15), sağ uç açık olduğu hâlde $5$''i de dahil edip $10 + 5 = 15$ toplayan adayı yakalar. B şıkkı (6) ise yalnızca $1, 2, 3$ değerlerini sayan veya üst sınırı yanlış kuranların seçtiği şıktır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-04-005 · doğrulandı
  ('bfc910cf-029a-5a5d-991c-5f24636c2789'::uuid, 'Matematik & Geometri', 'Basit Eşitsizlikler ve Mutlak Değer', 'multiple_choice', 3,
   '$x$ ve $y$ gerçel sayıları için
$$-4 < x \le 3 \quad \text{ve} \quad 1 < y < 5$$
eşitsizlikleri veriliyor.
Buna göre $x^2 + y$ ifadesi kaç farklı tam sayı değeri alabilir?',
   '{"options":["10","15","19","20","21"],"correctIndex":2}'::jsonb,
   '$-4 < x \le 3$ aralığında $x = 0$ değeri bulunduğu için $x^2$''nin alabileceği en küçük değer $0$''dır (dahil). Uçların kareleri $(-4)^2 = 16$ ve $3^2 = 9$ olduğundan büyük olan $16$ açık sınır olur: $0 \le x^2 < 16$.
Diğer yandan $1 < y < 5$ eşitsizliğiyle taraf tarafa toplandığında $1 < x^2 + y < 21$ bulunur. Bu aralıktaki tam sayılar $2$''den $20$''ye kadar olup toplam $20 - 2 + 1 = 19$ adettir.',
   'A şıkkı (10), $-4 < x \le 3$ aralığında $0$''ı unutarak doğrudan uçların karesini ($9 < x^2 < 16 \Rightarrow 10 < x^2 + y < 21$) alan adayı yakalar. Negatiften pozitife geçen bir aralığın karesinde alt sınır her zaman $0$''dır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-04-006 · doğrulandı
  ('897adda5-7578-524e-859f-0a427e37a0bc'::uuid, 'Matematik & Geometri', 'Basit Eşitsizlikler ve Mutlak Değer', 'multiple_choice', 1,
   '$$|3x - 6| = 9$$
denklemini sağlayan $x$ gerçel sayılarının çarpımı kaçtır?',
   '{"options":["$-5$","$-3$","3","4","5"],"correctIndex":0}'::jsonb,
   'Mutlak değer dışına iki durum çıkar:
$3x - 6 = 9 \Rightarrow 3x = 15 \Rightarrow x_1 = 5$ ve
$3x - 6 = -9 \Rightarrow 3x = -3 \Rightarrow x_2 = -1$.
Köklerin çarpımı $5 \cdot (-1) = -5$ bulunur.',
   'E şıkkı (5), yalnızca pozitif durumu çözüp $x = 5$ kökünü bulan ve $-1$ kökünü gözden kaçıran adayı yakalar. D şıkkı (4) ise iki kökün çarpımı yerine toplamını ($5 - 1 = 4$) hesaplayanların tuzağıdır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-04-007
  ('65732d30-1f30-5ee3-958b-d7cee8c575ec'::uuid, 'Matematik & Geometri', 'Basit Eşitsizlikler ve Mutlak Değer', 'multiple_choice', 2,
   '$x < 0 < y$ olmak üzere
$$|x - y| + |x| - |y|$$
ifadesinin en sade biçimi aşağıdakilerden hangisidir?',
   '{"options":["$0$","$2y$","$-2y$","$-2x$","$2x - 2y$"],"correctIndex":3}'::jsonb,
   '$x < y$ olduğundan $x - y < 0$ negatiftir; mutlak değer dışına eksi ile çarpılarak çıkar: $|x - y| = y - x$.
$x < 0$ olduğundan $|x| = -x$, $y > 0$ olduğundan $|y| = y$''dir.
Yerine yazılırsa $(y - x) + (-x) - y = y - x - x - y = -2x$ bulunur.',
   'E şıkkı ($2x - 2y$), $x - y < 0$ ifadesinin mutlak değerini işaret değiştirmeden $x - y$ olarak çıkaran adayı yakalar. Her mutlak değerin içinin işareti önce belirlenmelidir.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-04-008 · doğrulandı
  ('d24242fb-c8cc-5825-b2b9-e3389cbbe30d'::uuid, 'Matematik & Geometri', 'Basit Eşitsizlikler ve Mutlak Değer', 'multiple_choice', 2,
   '$$|2x + 1| \le 7$$
eşitsizliğini sağlayan $x$ tam sayılarının toplamı kaçtır?',
   '{"options":["$-7$","$-4$","0","6","8"],"correctIndex":1}'::jsonb,
   'Mutlak değer eşitsizliği iki taraflı yazılır: $-7 \le 2x + 1 \le 7$. Her taraftan $1$ çıkarılırsa $-8 \le 2x \le 6$, ardından $2$''ye bölünürse $-4 \le x \le 3$ elde edilir. Bu aralıktaki tam sayılar $-4, -3, -2, -1, 0, 1, 2, 3$''tür; $-3$''ten $3$''e kadar olan simetrik sayılar birbirini sıfırlayacağından toplam $-4$ olur.',
   'E şıkkı (8), çözüm aralığındaki tam sayıların toplamı yerine adedini ($8$ tane) bulan adayı yakalar. D şıkkı (6) ise negatif kısmı ihmal edip yalnızca $0 + 1 + 2 + 3$ toplayanların düştüğü tuzaktır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-04-009 · doğrulandı
  ('60bbfbde-0bab-552f-a320-ddabda05f981'::uuid, 'Matematik & Geometri', 'Basit Eşitsizlikler ve Mutlak Değer', 'multiple_choice', 2,
   '$$|x - 4| = 2x - 5$$
denklemini sağlayan $x$ gerçel sayılarının toplamı kaçtır?',
   '{"options":["1","2","4","5","3"],"correctIndex":4}'::jsonb,
   'Mutlak değer sonucu negatif olamayacağı için önce $2x - 5 \ge 0 \Rightarrow x \ge 2{,}5$ şartı sağlanmalıdır.
İki durum çözülür:
$x - 4 = 2x - 5 \Rightarrow x = 1$ (ancak $x = 1$ değeri $2x - 5 = -3 < 0$ yaptığı için denklemi sağlamaz ve elenir).
$x - 4 = -(2x - 5) = -2x + 5 \Rightarrow 3x = 9 \Rightarrow x = 3$ (kontrol: $|3 - 4| = 1$ ve $2(3) - 5 = 1$, sağlar).
Tek geçerli kök $x = 3$ olduğundan toplam $3$ bulunur.',
   'C şıkkı (4), bulduğu $x = 1$ ve $x = 3$ adaylarının ikisini de sağlama yapmadan toplayan ($1 + 3 = 4$) adayı yakalar. Mutlak değerin bir tarafında değişken varken bulunan kökler mutlaka başlangıç denkleminde denenmelidir.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-04-010 · doğrulandı
  ('a8f53beb-81c7-5c14-b85d-ff6ec9715ea9'::uuid, 'Matematik & Geometri', 'Basit Eşitsizlikler ve Mutlak Değer', 'multiple_choice', 3,
   '$$2 < |x - 1| \le 5$$
eşitsizliğini sağlayan kaç farklı $x$ tam sayısı vardır?',
   '{"options":["3","4","6","7","8"],"correctIndex":2}'::jsonb,
   'Çift taraflı mutlak değer eşitsizliği iki ayrı durum olarak incelenir:
1. $2 < x - 1 \le 5 \Rightarrow 3 < x \le 6$: Bu aralıktaki tam sayılar $4, 5, 6$ ($3$ adet).
2. $-5 \le x - 1 < -2 \Rightarrow -4 \le x < -1$: Bu aralıktaki tam sayılar $-4, -3, -2$ ($3$ adet).
İki küme ayrık olduğundan toplam $3 + 3 = 6$ farklı tam sayı değeri vardır.',
   'A şıkkı (3), yalnızca pozitif durumu ($2 < x - 1 \le 5$) çözüp negatif simetriyi unutan adayı yakalar. E şıkkı (8) ise kesin eşitsizlik ($<$) olan uç noktalar $3$ ve $-1$''i de sayanların tuzağıdır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-04-011 · şekilli · doğrulandı
  ('2180a9a2-74b5-5dec-8ea2-0147321ccfc3'::uuid, 'Matematik & Geometri', 'Basit Eşitsizlikler ve Mutlak Değer', 'multiple_choice', 1,
   'Yukarıdaki sayı doğrusunda gösterilen kalın aralıklara dahil olmayan kaç tane tam sayı vardır?',
   '{"options":["4","5","6","3","7"],"correctIndex":1}'::jsonb,
   'Sayı doğrusunda kalın çizgiler $(-\infty, -1)$ ve $[4, +\infty)$ bölgelerini göstermektedir ($-1$ noktası boş çemberle hariç, $4$ noktası ise dolu çemberle dahildir). Bu iki aralığın dışında kalan, yani dahil olmayan tam sayılar $[-1, 4)$ aralığındaki $-1, 0, 1, 2, 3$ sayılarıdır; toplam $5$ tanedir.',
   'A şıkkı (4), $-1$''deki boş çemberin bu noktanın taralı bölgeye dahil olmadığını gösterdiğini gözden kaçırıp yalnızca $0, 1, 2, 3$''ü sayan adayı; C şıkkı (6) ise $4$''ü de hariç sayanları yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 64" width="400" height="64" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><line x1="12" y1="30" x2="126.5" y2="30"/><line x1="137.5" y1="30" x2="392" y2="30"/><path d="M392 30 l-8 -4 m8 4 l-8 4"/><path d="M12 30 l8 -4 m-8 4 l8 4"/><line x1="14" y1="30" x2="126.5" y2="30" stroke-width="5" stroke-opacity="0.55"/><line x1="302" y1="30" x2="390" y2="30" stroke-width="5" stroke-opacity="0.55"/><line x1="30" y1="25" x2="30" y2="35" stroke-width="1.2"/><text x="30" y="51.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">-4</text><line x1="64" y1="25" x2="64" y2="35" stroke-width="1.2"/><text x="64" y="51.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">-3</text><line x1="98" y1="25" x2="98" y2="35" stroke-width="1.2"/><text x="98" y="51.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">-2</text><text x="132" y="51.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">-1</text><line x1="166" y1="25" x2="166" y2="35" stroke-width="1.2"/><text x="166" y="51.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">0</text><line x1="200" y1="25" x2="200" y2="35" stroke-width="1.2"/><text x="200" y="51.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">1</text><line x1="234" y1="25" x2="234" y2="35" stroke-width="1.2"/><text x="234" y="51.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">2</text><line x1="268" y1="25" x2="268" y2="35" stroke-width="1.2"/><text x="268" y="51.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">3</text><line x1="302" y1="25" x2="302" y2="35" stroke-width="1.2"/><text x="302" y="51.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">4</text><line x1="336" y1="25" x2="336" y2="35" stroke-width="1.2"/><text x="336" y="51.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">5</text><line x1="370" y1="25" x2="370" y2="35" stroke-width="1.2"/><text x="370" y="51.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">6</text><circle cx="132" cy="30" r="5" stroke-width="1.8"/><circle cx="302" cy="30" r="5" fill="currentColor" stroke="none"/></svg>', true),
  -- mat-04-012
  ('8ce2d9cc-8079-5823-a59c-044cba210c2a'::uuid, 'Matematik & Geometri', 'Basit Eşitsizlikler ve Mutlak Değer', 'multiple_choice', 1,
   '$x$ ve $y$ gerçel sayıları için
$$x < 0 < y \quad \text{ve} \quad |x| > |y|$$
koşulları sağlanmaktadır. Buna göre,
I. $x + y < 0$
II. $y - x > 0$
III. $x^2 \cdot y < 0$
ifadelerinden hangileri her zaman doğrudur?',
   '{"options":["Yalnız I","Yalnız II","Yalnız III","I ve II","II ve III"],"correctIndex":3}'::jsonb,
   '$x < 0 < y$ ve $|x| > |y|$ olduğundan $-x > y$ yazılır; buradan $x + y < 0$ elde edilir (I doğru). $y > x$ olduğundan $y - x > 0$ her zaman sağlanır (II doğru). $x \neq 0$ için $x^2 > 0$ ve $y > 0$ olduğundan $x^2 \cdot y > 0$ olur; dolayısıyla III yanlıştır.',
   'A şıkkı (Yalnız I) ve E şıkkı (II ve III), $x < 0$ iken $x^2$ ifadesinin işaretini negatif sanıp $x^2 \cdot y < 0$ sonucuna varan veya mutlak değer büyüklüğünü işaret yönüyle karıştıran adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-04-013
  ('75f8f22f-c797-549c-8b58-211dce12ddd6'::uuid, 'Matematik & Geometri', 'Basit Eşitsizlikler ve Mutlak Değer', 'multiple_choice', 2,
   '$a < 0 < b$ ve $|a| > b$ olduğuna göre aşağıdakilerden hangisi kesinlikle negatiftir?',
   '{"options":["$a + b$","$b - a$","$a^2 - b^2$","$a^2 + ab$","$b(b - a)$"],"correctIndex":0}'::jsonb,
   '$a$ negatif, $b$ pozitif ve mutlak değerce $|a| > b$ olduğundan $a$''nın negatif büyüklüğü $b$''den fazladır (örneğin $a = -3$, $b = 1$). Bu nedenle $a + b < 0$ toplamı her zaman negatiftir. Diğer şıklarda $b - a > 0$, $a^2 - b^2 > 0$, $a^2 + ab = a(a + b) > 0$ ve $b(b - a) > 0$ ifadelerinin hepsi pozitiftir.',
   'D şıkkı ($a^2 + ab$), $ab$ çarpımının negatif olmasına bakarak toplamın da negatif olacağını sanan adayı yakalar; oysa $|a| > b$ nedeniyle $a^2 > |ab|$ olduğundan sonuç pozitif kalır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-04-014 · doğrulandı
  ('719b6ac8-269d-58f4-b79d-60ae03f57852'::uuid, 'Matematik & Geometri', 'Basit Eşitsizlikler ve Mutlak Değer', 'multiple_choice', 2,
   '$x$ ve $y$ gerçel sayıları için
$$-3 < x < 5 \quad \text{ve} \quad -4 < y < 2$$
eşitsizlikleri veriliyor.
Buna göre $x \cdot y$ çarpımının alabileceği en büyük tam sayı değeri ile en küçük tam sayı değerinin toplamı kaçtır?',
   '{"options":["1","$-2$","$-8$","$-10$","$-12$"],"correctIndex":2}'::jsonb,
   'Gerçel sayı aralıklarının çarpımı için uç değerlerin tüm ikili çarpımları kontrol edilir:
$(-3) \cdot (-4) = 12$, $(-3) \cdot 2 = -6$, $5 \cdot (-4) = -20$ ve $5 \cdot 2 = 10$.
En küçük ve en büyük değerlere göre $-20 < x \cdot y < 12$ elde edilir. En büyük tam sayı $11$, en küçük tam sayı $-19$ olduğundan toplamları $11 + (-19) = -8$ bulunur.',
   'A şıkkı (1), çapraz uç çarpımlarını ($5 \cdot (-4) = -20$) kontrol etmeyip yalnızca aynı taraf uçlarını çarparak $-6 < xy < 10$ veya $-10$ aralığı kuran adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-04-015 · doğrulandı
  ('e092bbe3-b652-5b51-9aff-bc71e436d5a3'::uuid, 'Matematik & Geometri', 'Basit Eşitsizlikler ve Mutlak Değer', 'multiple_choice', 2,
   '$$\dfrac{1}{5} < \dfrac{1}{x - 2} < \dfrac{1}{2}$$
eşitsizliğini sağlayan $x$ tam sayılarının toplamı kaçtır?',
   '{"options":["7","9","10","15","11"],"correctIndex":4}'::jsonb,
   'Aynı işaretli (pozitif) kesirler ters çevrildiğinde eşitsizlikler yön değiştirir: $5 > x - 2 > 2$, yani $2 < x - 2 < 5$. Her tarafa $2$ eklenirse $4 < x < 7$ bulunur. Bu aralıktaki tam sayılar $5$ ve $6$ olup toplamları $5 + 6 = 11$''dir.',
   'A şıkkı (7), $2 < x - 2 < 5$ aralığındaki $3 + 4 = 7$ değerini alan ($2$''yi eklemeyi unutan) adayı; D şıkkı (15) ise sınır değer olan $4$''ü de toplayanları yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-04-016 · doğrulandı
  ('8859f81d-8b80-59d0-9eb5-06cdf5981e2d'::uuid, 'Matematik & Geometri', 'Basit Eşitsizlikler ve Mutlak Değer', 'multiple_choice', 1,
   '$x$ ve $y$ gerçel sayıları için
$$|2x - 6| + |y + 4| = 0$$
eşitliği sağlanmaktadır.
Buna göre $x \cdot y$ çarpımı kaçtır?',
   '{"options":["$-24$","$-6$","12","$-12$","24"],"correctIndex":3}'::jsonb,
   'Mutlak değerler sıfırdan küçük olamayacağı için iki mutlak değerin toplamının $0$ olması ancak her birinin ayrı ayrı $0$ olmasıyla mümkündür: $2x - 6 = 0 \Rightarrow x = 3$ ve $y + 4 = 0 \Rightarrow y = -4$. Çarpım $3 \cdot (-4) = -12$ bulunur.',
   'C şıkkı (12), $y + 4 = 0$ denkleminden $y = +4$ çıkararak işaret hatası yapan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-04-017 · doğrulandı
  ('1137f2b8-e8e0-57b6-9b5e-6a4f953c6c14'::uuid, 'Matematik & Geometri', 'Basit Eşitsizlikler ve Mutlak Değer', 'multiple_choice', 2,
   '$$\left\lvert|x - 2| - 5\right\rvert = 3$$
denklemini sağlayan farklı $x$ gerçel sayılarının toplamı kaçtır?',
   '{"options":["4","8","10","12","14"],"correctIndex":1}'::jsonb,
   'Dıştaki mutlak değer açılır: $|x - 2| - 5 = 3$ veya $|x - 2| - 5 = -3$.
1. durum: $|x - 2| = 8 \Rightarrow x - 2 = 8$ ($x = 10$) veya $x - 2 = -8$ ($x = -6$).
2. durum: $|x - 2| = 2 \Rightarrow x - 2 = 2$ ($x = 4$) veya $x - 2 = -2$ ($x = 0$).
Dört farklı kökün toplamı $10 + (-6) + 4 + 0 = 8$ bulunur.',
   'A şıkkı (4), yalnızca $|x - 2| = 8$ durumunu çözüp $-3$ durumundan gelen kökleri unutan adayı; E şıkkı (14) ise $-6$ yerine $+6$ alanları yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-04-018 · doğrulandı
  ('8e53cfc0-ca63-528b-ba97-75247ee771ba'::uuid, 'Matematik & Geometri', 'Basit Eşitsizlikler ve Mutlak Değer', 'multiple_choice', 2,
   '$$|x - 3| + |3 - x| = 14$$
denklemini sağlayan $x$ değerlerinin çarpımı kaçtır?',
   '{"options":["$-187$","$-70$","$-28$","$-40$","$40$"],"correctIndex":3}'::jsonb,
   '$|3 - x| = |x - 3|$ olduğundan denklem $2|x - 3| = 14 \Rightarrow |x - 3| = 7$ hâline gelir. Buradan $x - 3 = 7 \Rightarrow x_1 = 10$ ve $x - 3 = -7 \Rightarrow x_2 = -4$ bulunur. Köklerin çarpımı $10 \cdot (-4) = -40$''tır.',
   'A şıkkı ($-187$), eşitliği $2$''ye bölmeyi unutup $|x - 3| = 14$ çözerek $17 \cdot (-11) = -187$ bulan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-04-019 · doğrulandı
  ('0feda377-f0b4-57cc-aa55-d1eb8f96e890'::uuid, 'Matematik & Geometri', 'Basit Eşitsizlikler ve Mutlak Değer', 'multiple_choice', 1,
   'Sayı doğrusunda $3$ noktasına olan uzaklığı en fazla $5$ birim olan kaç tane tam sayı vardır?',
   '{"options":["11","9","10","7","5"],"correctIndex":0}'::jsonb,
   '$x$ sayısının $3$''e uzaklığının en fazla $5$ birim olması $|x - 3| \le 5$ eşitsizliğiyle ifade edilir: $-5 \le x - 3 \le 5 \Rightarrow -2 \le x \le 8$. Bu aralıktaki tam sayıların adedi $8 - (-2) + 1 = 11$ bulunur.',
   'B şıkkı (9), "en fazla" ifadesinde uç noktalar $-2$ ve $8$''i hariç tutarak sayan adayı; C şıkkı (10) ise $8 - (-2) = 10$ diyerek $+1$ eklemeyi unutanları yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-04-020 · doğrulandı
  ('83429b3f-dd19-5aca-8dc4-1a91f4994c88'::uuid, 'Matematik & Geometri', 'Basit Eşitsizlikler ve Mutlak Değer', 'multiple_choice', 2,
   '$$|3x - 6| > 9$$
eşitsizliğini sağlamayan kaç farklı $x$ tam sayısı vardır?',
   '{"options":["4","5","7","6","8"],"correctIndex":2}'::jsonb,
   '$|3x - 6| > 9$ eşitsizliğini sağlamayan değerler, tümleyeni olan $|3x - 6| \le 9$ eşitsizliğini sağlayan değerlerdir. İki taraflı yazılırsa $-9 \le 3x - 6 \le 9 \Rightarrow -3 \le 3x \le 15 \Rightarrow -1 \le x \le 5$ bulunur. Bu aralıktaki tam sayılar $-1, 0, 1, 2, 3, 4, 5$ olup toplam $7$ tanedir.',
   'B şıkkı (5), $> 9$ eşitsizliğinin tümleyenini $\le 9$ yerine $< 9$ alarak uç noktalar $-1$ ve $5$''i dışarıda bırakan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-04-021 · doğrulandı
  ('7d7171dd-00a3-52f9-a418-83c96fa61cfb'::uuid, 'Matematik & Geometri', 'Basit Eşitsizlikler ve Mutlak Değer', 'multiple_choice', 3,
   '$x$ bir gerçel sayı olmak üzere
$$\dfrac{42}{|x - 2| + |x - 7| + 1}$$
ifadesinin alabileceği en büyük tam sayı değeri kaçtır?',
   '{"options":["1","3","6","42","7"],"correctIndex":4}'::jsonb,
   'Kesrin en büyük değeri için payda en küçük olmalıdır. Üçgen eşitsizliğinden (veya sayı doğrusunda $2$ ve $7$ noktalarına uzaklıklar toplamından) $x \in [2, 7]$ aralığındaki her sayı için $|x - 2| + |x - 7|$ toplamı en küçük değeri olan $7 - 2 = 5$''i alır. Dolayısıyla paydanın en küçük değeri $5 + 1 = 6$, kesrin en büyük değeri ise $\dfrac{42}{6} = 7$ bulunur.',
   'D şıkkı (42), $|x - 2|$ ve $|x - 7|$ ifadelerinin aynı $x$ değeri için aynı anda sıfır olabileceğini sanıp paydayı $0 + 0 + 1 = 1$ alan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-04-022 · doğrulandı
  ('9745ba1d-f87e-574d-86db-26c0a7264dd9'::uuid, 'Matematik & Geometri', 'Basit Eşitsizlikler ve Mutlak Değer', 'multiple_choice', 3,
   '$x$ bir gerçel sayı olmak üzere
$$|x - 2| < 3 \quad \text{ve} \quad 2x + y = 7$$
koşullarını sağlayan $y$ tam sayılarının toplamı kaçtır?',
   '{"options":["15","33","24","30","42"],"correctIndex":1}'::jsonb,
   'Önce $x$''in aralığı bulunur: $-3 < x - 2 < 3 \Rightarrow -1 < x < 5$. Eşitlikten $y = 7 - 2x$ çekilir. $x$ gerçel sayı olduğundan aralıkla işlem yapılır: $-10 < -2x < 2 \Rightarrow -3 < 7 - 2x < 9$, yani $-3 < y < 9$ elde edilir. Bu aralıktaki $y$ tam sayıları $-2, -1, 0, \ldots, 8$ olup toplamları $\dfrac{-2 + 8}{2} \cdot 11 = 3 \cdot 11 = 33$ bulunur.',
   'A şıkkı (15), soruda "$x$ bir gerçel sayı" denmesine rağmen $x$''i tam sayı ($0, 1, 2, 3, 4$) seçip yalnızca $y \in \{-1, 1, 3, 5, 7\}$ değerlerini toplayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-04-023 · doğrulandı
  ('0467e393-e83e-568a-9b94-c9796d20c159'::uuid, 'Matematik & Geometri', 'Basit Eşitsizlikler ve Mutlak Değer', 'multiple_choice', 1,
   '$x$ ve $y$ birer tam sayı olmak üzere
$$-3 \le x < 4 \quad \text{ve} \quad -2 < y \le 5$$
eşitsizlikleri verilmektedir. Buna göre $2x - 3y$ ifadesinin alabileceği en büyük tam sayı değeri kaçtır?',
   '{"options":["7","9","11","13","14"],"correctIndex":1}'::jsonb,
   '$x$ ve $y$ tam sayı olduğundan $2x - 3y$ farkını en büyük yapmak için $x$ en büyük, $y$ en küçük seçilir. Verilen aralıklarda en büyük $x = 3$ ve en küçük $y = -1$ olur. Buna göre $2(3) - 3(-1) = 6 + 3 = 9$ bulunur.',
   'D şıkkı ($13$), $x$ ve $y$''nin tam sayı olduğunu gözden kaçırıp gerçel sayı aralığından $2x - 3y < 14 \Rightarrow 13$ sonucunu bulan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-04-024
  ('9dbfd48b-1e86-54c3-9f8b-e5ba4390ab87'::uuid, 'Matematik & Geometri', 'Basit Eşitsizlikler ve Mutlak Değer', 'multiple_choice', 1,
   '$x < y < 0$ olmak üzere
$$|x - y| + |y| - |x + y|$$
ifadesinin eşiti aşağıdakilerden hangisidir?',
   '{"options":["$-y$","$-x$","$y$","$x$","$2y - x$"],"correctIndex":2}'::jsonb,
   'Verilen sıralamaya göre mutlak değer içlerindeki işaretler belirlenir:
- $x < y \Rightarrow x - y < 0$ olduğundan $|x - y| = y - x$.
- $y < 0$ olduğundan $|y| = -y$.
- $x < 0$ ve $y < 0 \Rightarrow x + y < 0$ olduğundan $|x + y| = -(x + y) = -x - y$.
Yerine yazıldığında $(y - x) + (-y) - (-x - y) = y - x - y + x + y = y$ bulunur.',
   'A şıkkı ($-y$), mutlak değer önündeki çıkarma işaretini dağıtırken $-(-x - y)$ ifadesini $-x - y$ olarak bırakan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-04-025 · doğrulandı
  ('3405ec72-69fd-5245-9d19-3329d4dacae3'::uuid, 'Matematik & Geometri', 'Basit Eşitsizlikler ve Mutlak Değer', 'multiple_choice', 2,
   '$x$ ve $y$ gerçel sayıları için $-3 < x < 4$ ve $-2 < y < 5$ eşitsizlikleri veriliyor.
Buna göre $x^2 - 2y$ ifadesinin alabileceği en büyük tam sayı değeri kaçtır?',
   '{"options":["15","16","17","18","19"],"correctIndex":4}'::jsonb,
   '$x$ ve $y$ gerçel sayı olduğu için aralıklar üzerinde işlem yapılır:
- $-3 < x < 4$ aralığında $0$ yer aldığından $0 \le x^2 < 16$''dır.
- $-2 < y < 5$ eşitsizliği $-2$ ile çarpılınca yön değişir: $-10 < -2y < 4$.
Taraf tarafa toplanırsa $-10 < x^2 - 2y < 20$ bulunur. $20$''den küçük en büyük tam sayı $19$''dur.',
   'B şıkkı ($16$) veya C şıkkı ($17$), $x$ ve $y$''yi gerçel değil tam sayı sanıp $x = 3, y = -1 \Rightarrow 9 + 2 = 11$ ya da uçlarda $-2$''yi alamayıp $17$ bulan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-04-026
  ('588e2bca-a55e-57d1-861b-699f49d1b66f'::uuid, 'Matematik & Geometri', 'Basit Eşitsizlikler ve Mutlak Değer', 'multiple_choice', 2,
   '$a$ ve $b$ gerçel sayıları için
$$a^2 < a \quad \text{ve} \quad a \cdot b < 0$$
eşitsizlikleri sağlanmaktadır. Buna göre,
I. $a + b < 0$
II. $\dfrac{b}{a} < b$
III. $a^2 \cdot b > b$
ifadelerinden hangileri her zaman doğrudur?',
   '{"options":["Yalnız I","Yalnız II","I ve II","I ve III","II ve III"],"correctIndex":4}'::jsonb,
   '$a^2 < a$ eşitsizliği yalnızca $0 < a < 1$ aralığında sağlanır. $a \cdot b < 0$ ve $a > 0$ olduğundan $b < 0$ bulunur.
- I: $a = \frac{1}{2}$ ve $b = -\frac{1}{4}$ için $a + b > 0$ olduğundan her zaman doğru değildir.
- II: $0 < a < 1 \Rightarrow \frac{1}{a} > 1$ olur; bu eşitsizlik negatif $b$ ile çarpılırsa yön değiştirir ve $\frac{b}{a} < b$ elde edilir (doğru).
- III: $0 < a^2 < 1$ eşitsizliği negatif $b$ ile çarpılınca yön değiştirir ve $a^2 \cdot b > b$ elde edilir (doğru).',
   'D şıkkı (I ve III), $0 < a < 1$ ile $b < 0$ eşitsizliklerinde $b$''nin mutlak değerinin $a$''dan büyük olmak zorunda olduğunu varsayıp I. öncülü doğru sanan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-04-027 · doğrulandı
  ('f9ec1795-2e10-5e0f-b948-2022b5b47229'::uuid, 'Matematik & Geometri', 'Basit Eşitsizlikler ve Mutlak Değer', 'multiple_choice', 2,
   '$2 < x < 5$ olduğuna göre
$$|x - 7| + |x - 1| + |5 - x| + |x - 2|$$
ifadesinin eşiti kaçtır?',
   '{"options":["9","5","7","11","15"],"correctIndex":0}'::jsonb,
   '$2 < x < 5$ aralığında her mutlak değerin içinin işareti belirlenir:
- $x - 7 < 0 \Rightarrow |x - 7| = 7 - x$
- $x - 1 > 0 \Rightarrow |x - 1| = x - 1$
- $5 - x > 0 \Rightarrow |5 - x| = 5 - x$
- $x - 2 > 0 \Rightarrow |x - 2| = x - 2$
Toplam yazılır: $(7 - x) + (x - 1) + (5 - x) + (x - 2) = 7 - 1 + 5 - 2 = 9$ bulunur ($x$''ler sadeleşir).',
   'C şıkkı ($7$) veya D şıkkı ($11$), $5 - x$ ifadesini negatif sanarak $x - 5$ diye çıkarıp sadeleştirme sonrasında yanlış sabit elde eden adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-04-028 · doğrulandı
  ('265f37b2-2c1f-56bb-b27c-ec8a15a38699'::uuid, 'Matematik & Geometri', 'Basit Eşitsizlikler ve Mutlak Değer', 'multiple_choice', 2,
   '$a$ ve $b$ birer tam sayı olmak üzere
$$|a - 1| \le 2 \quad \text{ve} \quad |b + 1| \le 2$$
eşitsizliklerini sağlayan ve $a \cdot b > 0$ koşuluna uyan kaç farklı $(a, b)$ sıralı ikilisi vardır?',
   '{"options":["3","6","8","12","16"],"correctIndex":1}'::jsonb,
   'Eşitsizlikler çözüldüğünde:
- $-2 \le a - 1 \le 2 \Rightarrow -1 \le a \le 3 \Rightarrow a \in \{-1, 0, 1, 2, 3\}$
- $-2 \le b + 1 \le 2 \Rightarrow -3 \le b \le 1 \Rightarrow b \in \{-3, -2, -1, 0, 1\}$
$a \cdot b > 0$ olması için $a$ ve $b$ aynı işaretli ve sıfırdan farklı olmalıdır:
- Her ikisi pozitif ($a \in \{1, 2, 3\}$, $b \in \{1\}$): $3 \cdot 1 = 3$ ikili.
- Her ikisi negatif ($a \in \{-1\}$, $b \in \{-3, -2, -1\}$): $1 \cdot 3 = 3$ ikili.
Toplam $3 + 3 = 6$ farklı sıralı ikili vardır.',
   'A şıkkı ($3$), yalnızca $a$ ve $b$''nin ikisinin de pozitif olduğu durumu sayıp ikisinin de negatif olduğu durumu unutan adayı; C şıkkı ($8$) ise $0$ değerini de katan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-04-029 · doğrulandı
  ('6545198d-f391-51eb-ba1e-74c613d16474'::uuid, 'Matematik & Geometri', 'Basit Eşitsizlikler ve Mutlak Değer', 'multiple_choice', 3,
   '$a$ bir gerçel sayı olmak üzere $-3 < a < 2$ ve
$$b = \frac{12}{a^2 + 2}$$
olduğuna göre $b$''nin alabileceği tam sayı değerlerinin toplamı kaçtır?',
   '{"options":["10","14","15","18","20"],"correctIndex":4}'::jsonb,
   '$-3 < a < 2$ aralığında $a = 0$ bulunduğundan $0 \le a^2 < 9$ olur. Her tarafa $2$ eklenirse $2 \le a^2 + 2 < 11$ elde edilir. Pozitif ifadeler ters çevrildiğinde yön değişir:
$$\frac{1}{11} < \frac{1}{a^2 + 2} \le \frac{1}{2} \Rightarrow \frac{12}{11} < b \le 6$$
Bu aralıktaki $b$ tam sayıları $\{2, 3, 4, 5, 6\}$ olup toplamları $2 + 3 + 4 + 5 + 6 = 20$''dir.',
   'D şıkkı ($18$), $12/11 > 1$ olduğundan $2$''yi atlayıp veya $0 \le a^2$ yerine yanlışlıkla $4 < a^2 < 9$ alıp $b = 6$''yı kaçıran adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-04-030 · doğrulandı
  ('f678a669-bdbf-50da-8ccb-8725cec28929'::uuid, 'Matematik & Geometri', 'Basit Eşitsizlikler ve Mutlak Değer', 'multiple_choice', 3,
   '$$|x - 2| + |y + 1| \le 2$$
eşitsizliğini sağlayan kaç farklı $(x, y)$ tam sayı ikilisi vardır?',
   '{"options":["9","13","15","17","25"],"correctIndex":1}'::jsonb,
   '$u = x - 2$ ve $v = y + 1$ tam sayıları için $|u| + |v| \le 2$ koşulu incelenir:
- $|u| + |v| = 0$: $(0, 0) \to 1$ ikili.
- $|u| + |v| = 1$: $(\pm 1, 0), (0, \pm 1) \to 4$ ikili.
- $|u| + |v| = 2$: $(\pm 2, 0), (0, \pm 2), (\pm 1, \pm 1) \to 2 + 2 + 4 = 8$ ikili.
Toplam $1 + 4 + 8 = 13$ farklı $(x, y)$ tam sayı ikilisi vardır.',
   'A şıkkı ($9$), $(1, 1)$ gibi her ikisi de $\pm 1$ olan çapraz $4$ ikiliyi saymayı unutan; E şıkkı ($25$) ise her iki değişkeni bağımsız $[-2, 2]$ aralığında $5 \cdot 5 = 25$ sanan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true)
on conflict (id) do update set
  lesson = excluded.lesson, topic = excluded.topic, question_type = excluded.question_type,
  difficulty = excluded.difficulty, prompt_text = excluded.prompt_text,
  interaction_data = excluded.interaction_data, explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap, exam_scopes = excluded.exam_scopes,
  education_level = excluded.education_level, figure_svg = excluded.figure_svg, is_active = true;

-- >>> 05_uslu_ve_koklu_ifadeler.sql
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

-- >>> 06_carpanlara_ayirma_ve_oran_oranti.sql
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

-- >>> 07_denklem_cozme_ve_sayi_kesir_problemleri.sql
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

-- >>> 08_yas_isci_hareket_yuzde_ve_karisim_problemleri.sql
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

-- >>> 09_kumeler_baginti_fonksiyon_ve_moduler_aritmetik.sql
-- ==========================================================================
-- KADRO SORU HAVUZU · Matematik & Geometri · Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik (40 soru)
-- Kaynak: docs/soru_havuzu/matematik/09_kumeler_baginti_fonksiyon_ve_moduler_aritmetik.md · Üretici: tools/math/compile_questions.mjs (elle düzenlemeyin)
-- Önkoşul: docs/supabase_migrations/12_math_figures.sql
-- İdempotent: soru kimlikleri sabit UUID'dir; dosya tekrar çalıştırılırsa sorular güncellenir.
-- ==========================================================================

insert into public.questions (
  id, lesson, topic, question_type, difficulty, prompt_text, interaction_data,
  explanation, distractor_trap, exam_scopes, education_level, figure_svg, is_active
) values
  -- mat-09-001 · doğrulandı
  ('1b85ac11-ffa3-50d2-ac06-71020d37d2cd'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 1,
   '$$A = \{1, 2, 3, 4, 5, 6\}$$
kümesinin alt kümelerinin kaç tanesinde $1$ elemanı bulunur ancak $2$ elemanı bulunmaz?',
   '{"options":["16","15","24","32","64"],"correctIndex":0}'::jsonb,
   'Alt kümede $1$''in bulunması ve $2$''nin bulunmaması kesin olduğu için karar vereceğimiz elemanlar geriye kalan $\{3, 4, 5, 6\}$ kümesinin $4$ elemanıdır. Bu $4$ elemanla oluşturulabilecek her alt kümeye $1$ eklendiğinde istenen koşulu sağlayan $2^4 = 16$ tane alt küme elde edilir.',
   'D şıkkı (32), yalnızca bir eleman için şart varmış gibi $2^5 = 32$ hesaplayan adayı; B şıkkı (15) ise öz alt küme sorusu sanıp $1$ çıkaranları yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-09-002 · şekilli · doğrulandı
  ('d9a71e6b-44c0-5133-b0d4-1b8d0488d11d'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 2,
   'Şekildeki Venn şemasında her bölgedeki eleman sayısı verilmiştir. Evrensel küme $s(E) = 28$ olduğuna göre $s(A \setminus B)$ kaçtır?',
   '{"options":["6","7","8","10","12"],"correctIndex":2}'::jsonb,
   'Venn şemasındaki tüm ayrık bölgelerin eleman sayıları toplamı evrensel kümeyi verir: $(x + 2) + 4 + (2x - 1) + 5 = 28 \Rightarrow 3x + 10 = 28 \Rightarrow 3x = 18 \Rightarrow x = 6$. $A \setminus B$ bölgesi yalnızca $A$''ya ait bölge olduğundan $s(A \setminus B) = x + 2 = 6 + 2 = 8$ bulunur.',
   'A şıkkı (6), $x = 6$ değerini bulduktan sonra $x + 2$ yerine $x$''i işaretleyen; E şıkkı (12) ise $s(A \setminus B)$ yerine $s(A) = 8 + 4 = 12$''yi seçen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 210" width="320" height="210" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><rect x="4" y="4" width="312" height="202" rx="6" stroke-width="1.4"/><text x="18" y="24.9" fill="currentColor" stroke="none" text-anchor="start" font-weight="600">E</text><circle cx="115" cy="105" r="70" fill="currentColor" fill-opacity="0.06"/><text x="63" y="35.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><circle cx="205" cy="105" r="70" fill="currentColor" fill-opacity="0.06"/><text x="257" y="35.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="80" y="109.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">x + 2</text><text x="160" y="109.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">4</text><text x="240" y="109.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">2x − 1</text><text x="294" y="194.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">5</text></svg>', true),
  -- mat-09-003 · doğrulandı
  ('b5447dd6-9c94-5a77-8631-b4108f597520'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 2,
   '$32$ kişilik bir sınıfta İngilizce bilenlerin sayısı, Almanca bilenlerin sayısının $2$ katıdır. Bu sınıfta her iki dili de bilen $5$ kişi, iki dili de bilmeyen $4$ kişi vardır.
Buna göre bu sınıfta yalnızca İngilizce bilen kaç kişi vardır?',
   '{"options":["11","14","16","17","22"],"correctIndex":3}'::jsonb,
   'İki dili de bilmeyen $4$ kişi çıkarılırsa en az bir dil bilenlerin sayısı $s(I \cup A) = 32 - 4 = 28$ olur. Almanca bilenlere $x$ denirse İngilizce bilenler $2x$ olur. Birleşim formülü yazılır: $s(I \cup A) = s(I) + s(A) - s(I \cap A) \Rightarrow 28 = 2x + x - 5 \Rightarrow 3x = 33 \Rightarrow x = 11$. İngilizce bilenler $2 \cdot 11 = 22$ kişidir; bunların $5$''i Almanca da bildiği için yalnızca İngilizce bilen $22 - 5 = 17$ kişi bulunur.',
   'E şıkkı (22), İngilizce bilenlerin tamamını ($2x = 22$) bulup kesişimdeki $5$ kişiyi çıkarmayı unutan adayı yakalar. Soru "yalnızca İngilizce" bilenleri sormaktadır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-09-004 · şekilli · doğrulandı
  ('07e7b370-a5aa-5d7d-97c7-861c02054ee0'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 3,
   'Şekildeki üç kümeli Venn şemasında her bölgeye ait eleman sayısı yazılmıştır. $s(A \cup B) = 19$ olduğuna göre $s(E)$ kaçtır?',
   '{"options":["25","26","27","28","29"],"correctIndex":4}'::jsonb,
   '$A \cup B$ kümesi $A$ veya $B$ çemberlerinin içinde kalan tüm bölgeleri kapsar: $s(A \cup B) = 5 + 4 + 3 + 2 + 1 + x = 15 + x$. Verilen $15 + x = 19$ eşitliğinden $x = 4$ bulunur. Evrensel küme $E$, şemadaki tüm bölgelerin toplamıdır: $s(E) = 19 + 6 + 4 = 29$ olur.',
   'B şıkkı (26), $A \cup B$''yi hesaplarken $C$ ile ortak olan $AC$ ($2$) ve $BC$ ($1$) bölgelerini dışarıda bırakıp $x$''i $7$ bularak sonraki toplamda hata yapan veya dıştaki $4$''ü eklemeyi unutan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 270" width="320" height="270" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><rect x="4" y="4" width="312" height="262" rx="6" stroke-width="1.4"/><text x="18" y="24.9" fill="currentColor" stroke="none" text-anchor="start" font-weight="600">E</text><circle cx="120" cy="100" r="70" fill="currentColor" fill-opacity="0.06"/><text x="62" y="42.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><circle cx="200" cy="100" r="70" fill="currentColor" fill-opacity="0.06"/><text x="258" y="42.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><circle cx="160" cy="165" r="70" fill="currentColor" fill-opacity="0.06"/><text x="160" y="249.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="92" y="86.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">5</text><text x="228" y="86.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">4</text><text x="160" y="204.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">6</text><text x="160" y="76.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">3</text><text x="118" y="146.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">2</text><text x="202" y="146.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">1</text><text x="160" y="122.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">x</text><text x="294" y="254.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">4</text></svg>', true),
  -- mat-09-005 · doğrulandı
  ('7599b060-a926-5aa6-bc54-f104605cd8a7'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 1,
   'Gerçel sayılar kümesinde tanımlı $f$ fonksiyonu için
$$f(2x - 3) = 4x + 5$$
eşitliği verilmektedir.
Buna göre $f(5)$ değeri kaçtır?',
   '{"options":["17","21","23","25","29"],"correctIndex":1}'::jsonb,
   'Parantez içinin $5$ olması için $2x - 3 = 5 \Rightarrow 2x = 8 \Rightarrow x = 4$ yazılmalıdır. Sağ tarafta $x = 4$ yerine konursa $f(5) = 4 \cdot 4 + 5 = 16 + 5 = 21$ bulunur.',
   'D şıkkı (25), $2x - 3 = 5$ eşitliğini çözmeden doğrudan $x$ yerine $5$ yazarak $4 \cdot 5 + 5 = 25$ hesaplayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-09-006 · doğrulandı
  ('908c3935-ac0a-539e-b0b5-87e621269f66'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 2,
   'Gerçel sayılarda tanımlı $f(x) = 3x - 2$ ve $g(x) = x^2 + 1$ fonksiyonları için
$$(f \circ g)(2) - (g \circ f)(1)$$
işleminin sonucu kaçtır?',
   '{"options":["11","9","7","5","3"],"correctIndex":0}'::jsonb,
   'Bileşke işlemlerinde içten dışa doğru gidilir:
$(f \circ g)(2) = f(g(2))$. Önce $g(2) = 2^2 + 1 = 5$, sonra $f(5) = 3 \cdot 5 - 2 = 13$.
$(g \circ f)(1) = g(f(1))$. Önce $f(1) = 3 \cdot 1 - 2 = 1$, sonra $g(1) = 1^2 + 1 = 2$.
Fark $13 - 2 = 11$ bulunur.',
   'C şıkkı (7) veya B şıkkı (9), bileşke sırasını karıştırıp $(f \circ g)(2)$ yerine $g(f(2)) = 4^2 + 1 = 17$ ya da çıkarma işleminde değerleri ters sırada alan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-09-007 · doğrulandı
  ('3921fc20-7003-55ff-bfb9-280f61226d58'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 2,
   'Uygun tanım kümesinde bire bir ve örten olan
$$f(x) = \dfrac{3x + 1}{x - 2}$$
fonksiyonu için $f^{-1}(4)$ değeri kaçtır?',
   '{"options":["$\\dfrac{13}{2}$","7","9","$-7$","$\\dfrac{7}{3}$"],"correctIndex":2}'::jsonb,
   '$f^{-1}(4) = a$ demek $f(a) = 4$ demektir. Denklem yazılırsa $\dfrac{3a + 1}{a - 2} = 4 \Rightarrow 3a + 1 = 4a - 8 \Rightarrow a = 9$ bulunur. (Kısa yoldan $f^{-1}(x) = \dfrac{2x + 1}{x - 3}$ yazılarak $x = 4$ için $\dfrac{9}{1} = 9$ da elde edilir.)',
   'A şıkkı ($\frac{13}{2}$), ters fonksiyon yerine doğrudan $f(4) = \dfrac{3 \cdot 4 + 1}{4 - 2} = \dfrac{13}{2}$ değerini hesaplayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-09-008 · şekilli · doğrulandı
  ('7dcdcced-0789-5020-9659-8bc23c26facf'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 3,
   'Şekildeki dik koordinat düzleminde $y = f(x)$ doğrusal fonksiyonunun grafiği $A(0, 3)$ ve $B(4, 0)$ noktalarından geçmektedir.
Buna göre $f(8) + f^{-1}(6)$ toplamı kaçtır?',
   '{"options":["$-1$","$-3$","$-5$","$-7$","1"],"correctIndex":3}'::jsonb,
   'Doğru eksenleri $(4, 0)$ ve $(0, 3)$ noktalarında kestiğinden denklemi $\dfrac{x}{4} + \dfrac{y}{3} = 1 \Rightarrow y = f(x) = 3 - \dfrac{3}{4}x$ olur.
$x = 8$ için $f(8) = 3 - \dfrac{3}{4} \cdot 8 = 3 - 6 = -3$ bulunur.
$f^{-1}(6) = k$ için $f(k) = 6 \Rightarrow 3 - \dfrac{3}{4}k = 6 \Rightarrow -\dfrac{3}{4}k = 3 \Rightarrow k = -4$ bulunur.
Toplam $-3 + (-4) = -7$''dir.',
   'A şıkkı ($-1$), $f^{-1}(6)$ yerine $f(6) = -\frac{3}{2}$ hesaplayan ya da $f^{-1}(6)$ adımında işaret hatası yaparak $k = +4$ alıp $-3 + 4 = 1$ (E şıkkı) bulan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 288.6 260" width="288.6" height="260" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><g stroke-width="0.6" stroke-opacity="0.25"><line x1="30" y1="230" x2="30" y2="30"/><line x1="58.6" y1="230" x2="58.6" y2="30"/><line x1="87.1" y1="230" x2="87.1" y2="30"/><line x1="115.7" y1="230" x2="115.7" y2="30"/><line x1="144.3" y1="230" x2="144.3" y2="30"/><line x1="172.9" y1="230" x2="172.9" y2="30"/><line x1="201.4" y1="230" x2="201.4" y2="30"/><line x1="230" y1="230" x2="230" y2="30"/><line x1="258.6" y1="230" x2="258.6" y2="30"/><line x1="30" y1="230" x2="258.6" y2="230"/><line x1="30" y1="201.4" x2="258.6" y2="201.4"/><line x1="30" y1="172.9" x2="258.6" y2="172.9"/><line x1="30" y1="144.3" x2="258.6" y2="144.3"/><line x1="30" y1="115.7" x2="258.6" y2="115.7"/><line x1="30" y1="87.1" x2="258.6" y2="87.1"/><line x1="30" y1="58.6" x2="258.6" y2="58.6"/><line x1="30" y1="30" x2="258.6" y2="30"/></g><line x1="24" y1="172.9" x2="268.6" y2="172.9"/><line x1="87.1" y1="236" x2="87.1" y2="20"/><path d="M268.6 172.9 l-7 -4 m7 4 l-7 4"/><path d="M87.1 20 l-4 7 m4 -7 l4 7"/><text x="272.6" y="189.8" fill="currentColor" stroke="none" text-anchor="end" font-style="italic">x</text><text x="99.1" y="22.9" fill="currentColor" stroke="none" text-anchor="start" font-style="italic">y</text><g stroke-width="1.2"><line x1="30" y1="169.9" x2="30" y2="175.9"/><text x="30" y="190.7" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">-2</text><line x1="58.6" y1="169.9" x2="58.6" y2="175.9"/><text x="58.6" y="190.7" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">-1</text><line x1="115.7" y1="169.9" x2="115.7" y2="175.9"/><text x="115.7" y="190.7" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">1</text><line x1="144.3" y1="169.9" x2="144.3" y2="175.9"/><text x="144.3" y="190.7" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">2</text><line x1="172.9" y1="169.9" x2="172.9" y2="175.9"/><text x="172.9" y="190.7" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">3</text><line x1="201.4" y1="169.9" x2="201.4" y2="175.9"/><text x="201.4" y="190.7" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">4</text><line x1="230" y1="169.9" x2="230" y2="175.9"/><text x="230" y="190.7" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">5</text><line x1="258.6" y1="169.9" x2="258.6" y2="175.9"/><text x="258.6" y="190.7" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">6</text><line x1="84.1" y1="230" x2="90.1" y2="230"/><text x="81.1" y="233.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">-2</text><line x1="84.1" y1="201.4" x2="90.1" y2="201.4"/><text x="81.1" y="205.3" fill="currentColor" stroke="none" text-anchor="end" font-size="11">-1</text><line x1="84.1" y1="144.3" x2="90.1" y2="144.3"/><text x="81.1" y="148.1" fill="currentColor" stroke="none" text-anchor="end" font-size="11">1</text><line x1="84.1" y1="115.7" x2="90.1" y2="115.7"/><text x="81.1" y="119.6" fill="currentColor" stroke="none" text-anchor="end" font-size="11">2</text><line x1="84.1" y1="87.1" x2="90.1" y2="87.1"/><text x="81.1" y="91" fill="currentColor" stroke="none" text-anchor="end" font-size="11">3</text><line x1="84.1" y1="58.6" x2="90.1" y2="58.6"/><text x="81.1" y="62.4" fill="currentColor" stroke="none" text-anchor="end" font-size="11">4</text><line x1="84.1" y1="30" x2="90.1" y2="30"/><text x="81.1" y="33.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">5</text><text x="79.1" y="188.7" fill="currentColor" stroke="none" text-anchor="end" font-size="11">O</text></g><path d="M30 44.3L31 45L31.9 45.7L32.9 46.4L33.8 47.1L34.8 47.9L35.7 48.6L36.7 49.3L37.6 50L38.6 50.7L39.5 51.4L40.5 52.1L41.4 52.9L42.4 53.6L43.3 54.3L44.3 55L45.2 55.7L46.2 56.4L47.1 57.1L48.1 57.9L49 58.6L50 59.3L51 60L51.9 60.7L52.9 61.4L53.8 62.1L54.8 62.9L55.7 63.6L56.7 64.3L57.6 65L58.6 65.7L59.5 66.4L60.5 67.1L61.4 67.9L62.4 68.6L63.3 69.3L64.3 70L65.2 70.7L66.2 71.4L67.1 72.1L68.1 72.9L69 73.6L70 74.3L71 75L71.9 75.7L72.9 76.4L73.8 77.1L74.8 77.9L75.7 78.6L76.7 79.3L77.6 80L78.6 80.7L79.5 81.4L80.5 82.1L81.4 82.9L82.4 83.6L83.3 84.3L84.3 85L85.2 85.7L86.2 86.4L87.1 87.1L88.1 87.9L89 88.6L90 89.3L91 90L91.9 90.7L92.9 91.4L93.8 92.1L94.8 92.9L95.7 93.6L96.7 94.3L97.6 95L98.6 95.7L99.5 96.4L100.5 97.1L101.4 97.9L102.4 98.6L103.3 99.3L104.3 100L105.2 100.7L106.2 101.4L107.1 102.1L108.1 102.9L109 103.6L110 104.3L111 105L111.9 105.7L112.9 106.4L113.8 107.1L114.8 107.9L115.7 108.6L116.7 109.3L117.6 110L118.6 110.7L119.5 111.4L120.5 112.1L121.4 112.9L122.4 113.6L123.3 114.3L124.3 115L125.2 115.7L126.2 116.4L127.1 117.1L128.1 117.9L129 118.6L130 119.3L131 120L131.9 120.7L132.9 121.4L133.8 122.1L134.8 122.9L135.7 123.6L136.7 124.3L137.6 125L138.6 125.7L139.5 126.4L140.5 127.1L141.4 127.9L142.4 128.6L143.3 129.3L144.3 130L145.2 130.7L146.2 131.4L147.1 132.1L148.1 132.9L149 133.6L150 134.3L151 135L151.9 135.7L152.9 136.4L153.8 137.1L154.8 137.9L155.7 138.6L156.7 139.3L157.6 140L158.6 140.7L159.5 141.4L160.5 142.1L161.4 142.9L162.4 143.6L163.3 144.3L164.3 145L165.2 145.7L166.2 146.4L167.1 147.1L168.1 147.9L169 148.6L170 149.3L171 150L171.9 150.7L172.9 151.4L173.8 152.1L174.8 152.9L175.7 153.6L176.7 154.3L177.6 155L178.6 155.7L179.5 156.4L180.5 157.1L181.4 157.9L182.4 158.6L183.3 159.3L184.3 160L185.2 160.7L186.2 161.4L187.1 162.1L188.1 162.9L189 163.6L190 164.3L191 165L191.9 165.7L192.9 166.4L193.8 167.1L194.8 167.9L195.7 168.6L196.7 169.3L197.6 170L198.6 170.7L199.5 171.4L200.5 172.1L201.4 172.9L202.4 173.6L203.3 174.3L204.3 175L205.2 175.7L206.2 176.4L207.1 177.1L208.1 177.9L209 178.6L210 179.3L211 180L211.9 180.7L212.9 181.4L213.8 182.1L214.8 182.9L215.7 183.6L216.7 184.3L217.6 185L218.6 185.7L219.5 186.4L220.5 187.1L221.4 187.9L222.4 188.6L223.3 189.3L224.3 190L225.2 190.7L226.2 191.4L227.1 192.1L228.1 192.9L229 193.6L230 194.3L231 195L231.9 195.7L232.9 196.4L233.8 197.1L234.8 197.9L235.7 198.6L236.7 199.3L237.6 200L238.6 200.7L239.5 201.4L240.5 202.1L241.4 202.9L242.4 203.6L243.3 204.3L244.3 205L245.2 205.7L246.2 206.4L247.1 207.1L248.1 207.9L249 208.6L250 209.3L251 210L251.9 210.7L252.9 211.4L253.8 212.1L254.8 212.9L255.7 213.6L256.7 214.3L257.6 215L258.6 215.7" stroke-width="2.2"/><text x="56" y="54.2" fill="currentColor" stroke="none" text-anchor="start" font-style="italic">f</text><circle cx="87.1" cy="87.1" r="3" fill="currentColor" stroke="none"/><text x="97.6" y="81.5" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><circle cx="201.4" cy="172.9" r="3" fill="currentColor" stroke="none"/><text x="211.9" y="167.3" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text></svg>', true),
  -- mat-09-009 · doğrulandı
  ('bddcdd4d-2388-5955-a080-f1a68169333b'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 1,
   'Şu an saat $14{:}00$''ı göstermektedir.
Buna göre $100$ saat sonra saat kaçı gösterir?',
   '{"options":["16:00","18:00","19:00","20:00","22:00"],"correctIndex":1}'::jsonb,
   'Bir gün $24$ saat olduğundan saat $24$''ün katlarında aynı değeri gösterir. $100$ sayısının $24$ ile bölümünden kalan $100 = 24 \cdot 4 + 4$''tür. Şu anki saat olan $14{:}00$''a $4$ saat eklendiğinde saat $18{:}00$ bulunur.',
   'D şıkkı (20:00), mod $24$ yerine yanlış bölme yapıp kalanı $6$ sanan veya $14$''ten geriye giderek farklı bir saate ulaşan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-09-010 · doğrulandı
  ('e54a6215-c677-5de3-ba27-0e636c82f185'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 2,
   '$$2^{53}$$
sayısının $7$ ile bölümünden kalan kaçtır?',
   '{"options":["1","2","3","5","4"],"correctIndex":4}'::jsonb,
   '$2$''nin kuvvetlerinin $7$ ile bölümünden kalanlar incelenir:
$2^1 \equiv 2$ (mod $7$),
$2^2 \equiv 4$ (mod $7$),
$2^3 = 8 \equiv 1$ (mod $7$).
Kalan $1$ olduğu için periyot $3$''tür. Üs olan $53$, periyot $3$''e bölünür: $53 = 3 \cdot 17 + 2$. Dolayısıyla $2^{53} \equiv 2^2 = 4$ (mod $7$) bulunur.',
   'B şıkkı (2), periyodu $3$ almak yerine üs $53$''ü doğrudan bölen $7$''ye bölerek $53 = 7 \cdot 7 + 4$ (ya da mod $6$ alıp $2^5 = 32 \equiv 4$ yerine yanlış kalan) üzerinden hesap yapan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-09-011 · doğrulandı
  ('da848379-4428-518c-8054-4d4fde2e7f8f'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 1,
   '$A$ ve $B$ iki küme olmak üzere $s(A \setminus B) = 7$, $s(B \setminus A) = 9$ ve $s(A \cup B) = 21$''dir.
Buna göre $s(A \cap B)$ kaçtır?',
   '{"options":["2","4","5","7","16"],"correctIndex":2}'::jsonb,
   '$A \cup B$ kümesi üç ayrık bölgenin birleşimidir: $s(A \cup B) = s(A \setminus B) + s(A \cap B) + s(B \setminus A)$. Verilenler yerine konursa $21 = 7 + s(A \cap B) + 9 \Rightarrow s(A \cap B) = 21 - 16 = 5$ bulunur.',
   'E şıkkı (16), $A \setminus B$ ile $B \setminus A$''nın toplamını ($7 + 9 = 16$) bulup $21$''den çıkarmayı unutan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-09-012 · doğrulandı
  ('0b45e078-247a-5d6b-8df8-eaa44222dc8e'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 1,
   '$$A = \{1, 2, 3, 4, 5\} \quad \text{ve} \quad B = \{3, 4, 5, 6, 7\}$$
kümeleri verilmektedir.
Buna göre $A$ kümesinin alt kümelerinden kaç tanesi aynı zamanda $B$ kümesinin alt kümesi değildir?',
   '{"options":["8","16","23","24","25"],"correctIndex":3}'::jsonb,
   '$A$ kümesinin tüm alt kümelerinin sayısı $2^5 = 32$''dir. Hem $A$''nın hem de $B$''nin alt kümesi olan kümeler, yalnızca kesişim kümesi $A \cap B = \{3, 4, 5\}$''in alt kümeleridir ve sayısı $2^3 = 8$''dir. Dolayısıyla $B$''nin alt kümesi olmayan $A$ alt kümelerinin sayısı $32 - 8 = 24$ bulunur.',
   'A şıkkı ($8$), kesişim kümesinin alt küme sayısını bulup tümünden çıkarmayan; C şıkkı ($23$) ise boş kümeyi çıkarıp $2^5 - 1 - 8$ hesaplayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-09-013 · şekilli · doğrulandı
  ('b5e7755a-8f04-58bb-a9f4-878220265298'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 2,
   'Şekildeki Venn şemasında $26$ kişilik bir topluluğun A ve B etkinliklerine katılım sayıları gösterilmiştir.
Buna göre B etkinliğine katılan toplam kişi sayısı $s(B)$ kaçtır?',
   '{"options":["11","17","13","15","20"],"correctIndex":1}'::jsonb,
   'Tüm bölgelerin eleman sayıları toplamı evrensel kümeyi ($26$) verir: $x + 6 + (x + 4) + 2 = 26 \Rightarrow 2x + 12 = 26 \Rightarrow 2x = 14 \Rightarrow x = 7$. B kümesi hem yalnızca B ($x + 4 = 11$) hem de kesişim ($6$) bölgesini kapsadığından $s(B) = 11 + 6 = 17$ bulunur.',
   'A şıkkı (11), $s(B)$ yerine yalnızca B''ye katılanları ($s(B \setminus A) = 7 + 4 = 11$) işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 210" width="320" height="210" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><rect x="4" y="4" width="312" height="202" rx="6" stroke-width="1.4"/><text x="18" y="24.9" fill="currentColor" stroke="none" text-anchor="start" font-weight="600">E</text><circle cx="115" cy="105" r="70" fill="currentColor" fill-opacity="0.06"/><text x="63" y="35.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><circle cx="205" cy="105" r="70" fill="currentColor" fill-opacity="0.06"/><text x="257" y="35.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="80" y="109.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">x</text><text x="160" y="109.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">6</text><text x="240" y="109.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">x + 4</text><text x="294" y="194.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">2</text></svg>', true),
  -- mat-09-014 · doğrulandı
  ('97c88a89-4f1d-553f-b601-b9e4a7ba302b'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 2,
   '$1$''den $80$''e kadar olan doğal sayılar içinde $3$''ün katı olanların kümesi $A$, $5$''in katı olanların kümesi $B$''dir.
Buna göre $s(A \setminus B)$ kaçtır?',
   '{"options":["16","18","20","21","26"],"correctIndex":3}'::jsonb,
   '$1$ ile $80$ arasında $3$''ün katı olan $\lfloor 80 \div 3 \rfloor = 26$ tane sayı vardır ($s(A) = 26$). $A \cap B$ kümesi hem $3$''ün hem $5$''in katı yani $15$''in katı olan sayılardır: $\lfloor 80 \div 15 \rfloor = 5$ tane. $A \setminus B$, $A$''da olup $B$''de olmayanlar olduğundan $s(A \setminus B) = 26 - 5 = 21$ bulunur.',
   'E şıkkı (26), tüm $A$ kümesinin eleman sayısını bulup kesişimdeki $15$''in katlarını çıkarmayı unutan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-09-015 · doğrulandı
  ('cdc70e34-d150-5392-995a-d90364aad605'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 1,
   'Gerçel sayılarda tanımlı
$$f(x) = (a - 2)x + b + 3$$
fonksiyonu birim fonksiyon olduğuna göre $a \cdot b$ çarpımı kaçtır?',
   '{"options":["$-9$","$-6$","$0$","$6$","$9$"],"correctIndex":0}'::jsonb,
   'Birim fonksiyon her $x$ için $f(x) = x$ (yani $1 \cdot x + 0$) biçimindedir. Katsayılar eşitlenirse $a - 2 = 1 \Rightarrow a = 3$ ve sabit terim $b + 3 = 0 \Rightarrow b = -3$ bulunur. Çarpım $a \cdot b = 3 \cdot (-3) = -9$''dur.',
   'B şıkkı ($-6$), birim fonksiyonu sabit fonksiyonla ($f(x) = c$, $a - 2 = 0$) karıştırıp $a = 2$ alan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-09-016 · doğrulandı
  ('ef405e96-06b7-5da9-b255-509a1423bd72'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 2,
   'Gerçel sayılar kümesinde tanımlı $f$ parçalı fonksiyonu için
$x < 3$ iken $f(x) = 2x + 1$,
$x \ge 3$ iken $f(x) = x^2 - 4$
kuralları geçerlidir.
Buna göre $f(1) + f(4)$ toplamı kaçtır?',
   '{"options":["1","9","12","15","18"],"correctIndex":3}'::jsonb,
   '$1 < 3$ olduğundan $f(1)$ için ilk kural uygulanır: $f(1) = 2 \cdot 1 + 1 = 3$.
$4 \ge 3$ olduğundan $f(4)$ için ikinci kural uygulanır: $f(4) = 4^2 - 4 = 12$.
Toplam $f(1) + f(4) = 3 + 12 = 15$ bulunur.',
   'C şıkkı (12), $f(1)$''i hesaplarken ikinci kuralı kullanıp $1^2 - 4 = -3$ veya $f(1)$''i toplamaya katmayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-09-017 · şekilli · doğrulandı
  ('aa988cb8-4a02-5dea-b747-52f36f9bf2f5'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 2,
   'Şekildeki dik koordinat düzleminde grafiği verilen $f(x) = a(x^2 - 4)$ parabolü $A(-2, 0)$, $B(2, 0)$ ve $C(0, -4)$ noktalarından geçmektedir.
Buna göre $(f \circ f)(1)$ değeri kaçtır?',
   '{"options":["$-3$","$0$","$5$","$9$","$12$"],"correctIndex":2}'::jsonb,
   '$C(0, -4)$ noktası denklemde yerine konursa $f(0) = a(0 - 4) = -4 \Rightarrow a = 1$ bulunur; yani $f(x) = x^2 - 4$''tür. İstenen bileşke değerde önce $f(1) = 1^2 - 4 = -3$ hesaplanır, ardından $f(-3) = (-3)^2 - 4 = 9 - 4 = 5$ bulunur.',
   'A şıkkı ($-3$), yalnızca $f(1) = -3$''ü bulup ikinci kez $f$''ye uygulamayı unutan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 228 340" width="228" height="340" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><g stroke-width="0.6" stroke-opacity="0.25"><line x1="30" y1="310" x2="30" y2="30"/><line x1="58" y1="310" x2="58" y2="30"/><line x1="86" y1="310" x2="86" y2="30"/><line x1="114" y1="310" x2="114" y2="30"/><line x1="142" y1="310" x2="142" y2="30"/><line x1="170" y1="310" x2="170" y2="30"/><line x1="198" y1="310" x2="198" y2="30"/><line x1="30" y1="310" x2="198" y2="310"/><line x1="30" y1="282" x2="198" y2="282"/><line x1="30" y1="254" x2="198" y2="254"/><line x1="30" y1="226" x2="198" y2="226"/><line x1="30" y1="198" x2="198" y2="198"/><line x1="30" y1="170" x2="198" y2="170"/><line x1="30" y1="142" x2="198" y2="142"/><line x1="30" y1="114" x2="198" y2="114"/><line x1="30" y1="86" x2="198" y2="86"/><line x1="30" y1="58" x2="198" y2="58"/><line x1="30" y1="30" x2="198" y2="30"/></g><line x1="24" y1="170" x2="208" y2="170"/><line x1="114" y1="316" x2="114" y2="20"/><path d="M208 170 l-7 -4 m7 4 l-7 4"/><path d="M114 20 l-4 7 m4 -7 l4 7"/><text x="212" y="186.9" fill="currentColor" stroke="none" text-anchor="end" font-style="italic">x</text><text x="126" y="22.9" fill="currentColor" stroke="none" text-anchor="start" font-style="italic">y</text><g stroke-width="1.2"><line x1="30" y1="167" x2="30" y2="173"/><text x="30" y="187.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">-3</text><line x1="58" y1="167" x2="58" y2="173"/><text x="58" y="187.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">-2</text><line x1="86" y1="167" x2="86" y2="173"/><text x="86" y="187.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">-1</text><line x1="142" y1="167" x2="142" y2="173"/><text x="142" y="187.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">1</text><line x1="170" y1="167" x2="170" y2="173"/><text x="170" y="187.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">2</text><line x1="198" y1="167" x2="198" y2="173"/><text x="198" y="187.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">3</text><line x1="111" y1="310" x2="117" y2="310"/><text x="108" y="313.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">-5</text><line x1="111" y1="282" x2="117" y2="282"/><text x="108" y="285.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">-4</text><line x1="111" y1="254" x2="117" y2="254"/><text x="108" y="257.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">-3</text><line x1="111" y1="226" x2="117" y2="226"/><text x="108" y="229.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">-2</text><line x1="111" y1="198" x2="117" y2="198"/><text x="108" y="201.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">-1</text><line x1="111" y1="142" x2="117" y2="142"/><text x="108" y="145.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">1</text><line x1="111" y1="114" x2="117" y2="114"/><text x="108" y="117.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">2</text><line x1="111" y1="86" x2="117" y2="86"/><text x="108" y="89.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">3</text><line x1="111" y1="58" x2="117" y2="58"/><text x="108" y="61.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">4</text><line x1="111" y1="30" x2="117" y2="30"/><text x="108" y="33.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">5</text><text x="106" y="185.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">O</text></g><path d="M32.8 46.5L33.5 50.4L34.2 54.3L34.8 58.1L35.5 62L36.2 65.7L36.9 69.5L37.5 73.2L38.2 76.9L38.9 80.5L39.6 84.1L40.2 87.7L40.9 91.3L41.6 94.8L42.3 98.3L42.9 101.7L43.6 105.1L44.3 108.5L45 111.9L45.7 115.2L46.3 118.5L47 121.7L47.7 124.9L48.4 128.1L49 131.3L49.7 134.4L50.4 137.5L51.1 140.6L51.7 143.6L52.4 146.6L53.1 149.5L53.8 152.5L54.5 155.4L55.1 158.2L55.8 161.1L56.5 163.9L57.2 166.6L57.8 169.3L58.5 172L59.2 174.7L59.9 177.3L60.5 179.9L61.2 182.5L61.9 185L62.6 187.5L63.3 190L63.9 192.5L64.6 194.9L65.3 197.2L66 199.6L66.6 201.9L67.3 204.1L68 206.4L68.7 208.6L69.3 210.8L70 212.9L70.7 215L71.4 217.1L72 219.1L72.7 221.2L73.4 223.1L74.1 225.1L74.8 227L75.4 228.9L76.1 230.7L76.8 232.5L77.5 234.3L78.1 236.1L78.8 237.8L79.5 239.5L80.2 241.1L80.8 242.7L81.5 244.3L82.2 245.9L82.9 247.4L83.6 248.9L84.2 250.3L84.9 251.8L85.6 253.2L86.3 254.5L86.9 255.8L87.6 257.1L88.3 258.4L89 259.6L89.6 260.8L90.3 262L91 263.1L91.7 264.2L92.3 265.3L93 266.3L93.7 267.3L94.4 268.2L95.1 269.2L95.7 270.1L96.4 270.9L97.1 271.8L97.8 272.6L98.4 273.3L99.1 274.1L99.8 274.8L100.5 275.5L101.1 276.1L101.8 276.7L102.5 277.3L103.2 277.8L103.9 278.3L104.5 278.8L105.2 279.2L105.9 279.6L106.6 280L107.2 280.4L107.9 280.7L108.6 281L109.3 281.2L109.9 281.4L110.6 281.6L111.3 281.7L112 281.9L112.6 281.9L113.3 282L114 282L114.7 282L115.4 281.9L116 281.9L116.7 281.7L117.4 281.6L118.1 281.4L118.7 281.2L119.4 281L120.1 280.7L120.8 280.4L121.4 280L122.1 279.6L122.8 279.2L123.5 278.8L124.2 278.3L124.8 277.8L125.5 277.3L126.2 276.7L126.9 276.1L127.5 275.5L128.2 274.8L128.9 274.1L129.6 273.3L130.2 272.6L130.9 271.8L131.6 270.9L132.3 270.1L132.9 269.2L133.6 268.2L134.3 267.3L135 266.3L135.7 265.3L136.3 264.2L137 263.1L137.7 262L138.4 260.8L139 259.6L139.7 258.4L140.4 257.1L141.1 255.8L141.7 254.5L142.4 253.2L143.1 251.8L143.8 250.3L144.5 248.9L145.1 247.4L145.8 245.9L146.5 244.3L147.2 242.7L147.8 241.1L148.5 239.5L149.2 237.8L149.9 236.1L150.5 234.3L151.2 232.5L151.9 230.7L152.6 228.9L153.2 227L153.9 225.1L154.6 223.1L155.3 221.2L156 219.1L156.6 217.1L157.3 215L158 212.9L158.7 210.8L159.3 208.6L160 206.4L160.7 204.1L161.4 201.9L162 199.6L162.7 197.2L163.4 194.9L164.1 192.5L164.8 190L165.4 187.5L166.1 185L166.8 182.5L167.5 179.9L168.1 177.3L168.8 174.7L169.5 172L170.2 169.3L170.8 166.6L171.5 163.9L172.2 161.1L172.9 158.2L173.5 155.4L174.2 152.5L174.9 149.5L175.6 146.6L176.3 143.6L176.9 140.6L177.6 137.5L178.3 134.4L179 131.3L179.6 128.1L180.3 124.9L181 121.7L181.7 118.5L182.3 115.2L183 111.9L183.7 108.5L184.4 105.1L185 101.7L185.7 98.3L186.4 94.8L187.1 91.3L187.8 87.7L188.4 84.1L189.1 80.5L189.8 76.9L190.5 73.2L191.1 69.5L191.8 65.7L192.5 62L193.2 58.1L193.8 54.3L194.5 50.4L195.2 46.5" stroke-width="2.2"/><text x="195.6" y="72.8" fill="currentColor" stroke="none" text-anchor="start" font-style="italic">f</text><circle cx="58" cy="170" r="3" fill="currentColor" stroke="none"/><text x="47.5" y="164.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><circle cx="170" cy="170" r="3" fill="currentColor" stroke="none"/><text x="180.5" y="164.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><circle cx="114" cy="282" r="3" fill="currentColor" stroke="none"/><text x="124.5" y="297.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text></svg>', true),
  -- mat-09-018 · doğrulandı
  ('fa7f7084-f1c7-5387-94f2-a127a1c575de'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 2,
   'Gerçel sayılarda tanımlı fonksiyonlar için $(f \circ g)(x) = 6x - 5$ ve $g(x) = 2x + 1$ eşitlikleri veriliyor.
Buna göre $f(7)$ değeri kaçtır?',
   '{"options":["7","13","15","37","85"],"correctIndex":1}'::jsonb,
   '$(f \circ g)(x) = f(g(x)) = 6x - 5$ olduğundan $f(2x + 1) = 6x - 5$ yazılır. Parantez içinin $7$ olması için $2x + 1 = 7 \Rightarrow 2x = 6 \Rightarrow x = 3$ konur. Buradan $f(7) = 6 \cdot 3 - 5 = 18 - 5 = 13$ bulunur.',
   'D şıkkı (37), $2x + 1 = 7$ çözmeden doğrudan $x = 7$ yazarak $6 \cdot 7 - 5 = 37$ hesaplayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-09-019 · doğrulandı
  ('1783d377-068b-5142-9352-4eed7ea8801e'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 3,
   'Gerçel sayılar kümesinde tanımlı $f$ fonksiyonu her $x$ gerçel sayısı için
$$f(x) + 2f(-x) = 3x + 9$$
eşitliğini sağlamaktadır.
Buna göre $f(2)$ değeri kaçtır?',
   '{"options":["$-9$","$-1$","$3$","$9$","$-3$"],"correctIndex":4}'::jsonb,
   'Denklemde sırasıyla $x = 2$ ve $x = -2$ yazılır:
$x = 2$ için $f(2) + 2f(-2) = 3(2) + 9 = 15$.
$x = -2$ için $f(-2) + 2f(2) = 3(-2) + 9 = 3$.
İkinci denklem $-2$ ile çarpılıp birinci denklemle toplanırsa $(f(2) + 2f(-2)) + (-2f(-2) - 4f(2)) = 15 - 6 \Rightarrow -3f(2) = 9 \Rightarrow f(2) = -3$ bulunur.',
   'D şıkkı (9), denklem sistemini çözerken $f(2)$ yerine $f(-2) = 9$ değerini bulan ya da $-3f(2) = 9$ adımında işareti unutan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-09-020 · doğrulandı
  ('542df0c6-892f-5313-a632-d27fcf52d0f4'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 1,
   '$A = \{0, 1, 2, 3, 4\}$ kümesi üzerinde $\Delta$ ve $\circ$ işlemleri her $a, b \in A$ için:
- $a \Delta b$: "$a + b$ toplamının $5$ ile bölümünden kalan"
- $a \circ b$: "$a \cdot b$ çarpımının $5$ ile bölümünden kalan"
biçiminde tanımlanıyor.
Buna göre $(4 \Delta 3) \circ (4 \Delta 4)$ işleminin sonucu kaçtır?',
   '{"options":["0","1","2","3","4"],"correctIndex":1}'::jsonb,
   'Parantez içindeki modüler toplama işlemleri ayrı ayrı hesaplanır:
- $4 + 3 = 7$ olduğundan $4 \Delta 3 = 2$ (mod $5$),
- $4 + 4 = 8$ olduğundan $4 \Delta 4 = 3$ (mod $5$).
Ardından çarpma işlemi uygulanır: $2 \cdot 3 = 6$ olup $5$ ile bölümünden kalan $1$ bulunur.',
   'D şıkkı ($3$) veya C şıkkı ($2$), mod $5$ yerine kalanları farklı bir modda hesaplayan veya parantezlerdeki $\Delta$ işlemi yerine çarpma yapan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-09-021
  ('c36a1f31-b684-5611-a4e1-09398d324173'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 2,
   '`KADROKADROKADRO...` biçiminde harfleri belirli bir düzende tekrar eden dizinin baştan $138$. sıradaki harfi aşağıdakilerden hangisidir?',
   '{"options":["K","A","R","D","O"],"correctIndex":3}'::jsonb,
   'Tekrar eden blok `KADRO` olup $5$ harften oluşmaktadır. $138$ sayısı blok uzunluğu olan $5$''e bölünür: $138 = 5 \cdot 27 + 3$. Kalan $3$ olduğundan bloğun $3$. harfi olan D harfi bulunur ($1$: K, $2$: A, $3$: D, $4$: R, $5$: O).',
   'C şıkkı (R) veya B şıkkı (A), sıfır tabanlı indeksleme gibi kayma yapıp $2$. veya $4$. harfi seçen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-09-022 · doğrulandı
  ('b977b127-7d12-5741-b320-08922034be01'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 3,
   '$$3^{40} + 4^{25}$$
toplamının $5$ ile bölümünden kalan kaçtır?',
   '{"options":["0","1","2","3","4"],"correctIndex":0}'::jsonb,
   'İki terimin $5$ ile bölümünden kalanlar ayrı ayrı bulunur:
$3$''ün kuvvetleri mod $5$''te $3^1 \equiv 3$, $3^2 \equiv 4$, $3^3 \equiv 2$, $3^4 \equiv 1$ olarak $4$''lük periyoda sahiptir. $40$ sayısı $4$''ün tam katı olduğundan $3^{40} \equiv 1$ (mod $5$) olur.
$4 \equiv -1$ (mod $5$) olduğundan $4^{25} \equiv (-1)^{25} = -1 \equiv 4$ (mod $5$) olur.
İki kalanın toplamı $1 + 4 = 5 \equiv 0$ (mod $5$) bulunur.',
   'C şıkkı (2), $4 \equiv -1$ yerine $4$''ün tüm kuvvetlerinin kalanını $4$ veya $1$ sanıp $1 + 1 = 2$ bulan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-09-023
  ('eb329407-54ea-5fa6-ac08-975bc9d9f0f7'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 1,
   '$A$ ve $B$ iki küme olmak üzere $s(A \setminus B) = 4$, $s(B \setminus A) = 7$ ve $s(A \cup B) = 15$''tir.
Buna göre,
I. $s(A \cap B) = 4$''tür.
II. $s(A) + s(B) = 15$''tir.
III. $A$ ve $B$ ayrık kümeler değildir.
ifadelerinden hangileri doğrudur?',
   '{"options":["Yalnız I","Yalnız II","I ve III","I ve II","I, II ve III"],"correctIndex":2}'::jsonb,
   'Birleşim kümesi üç ayrık bölgeden oluşur: $s(A \cup B) = s(A \setminus B) + s(A \cap B) + s(B \setminus A)$.
Buradan $15 = 4 + s(A \cap B) + 7 \Rightarrow s(A \cap B) = 4$ bulunur (I doğru). Kesişim kümesi boş olmadığından $A$ ve $B$ ayrık kümeler değildir (III doğru). Diğer yandan $s(A) = 4 + 4 = 8$ ve $s(B) = 7 + 4 = 11$ olduğundan $s(A) + s(B) = 19 \neq 15$''tir (II yanlış).',
   'E şıkkı (I, II ve III), $s(A) + s(B)$ toplamını $s(A \cup B)$ ile özdeş sanıp kesişim elemanlarını ikinci kez eklemeyi unutan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-09-024 · şekilli · doğrulandı
  ('c7a28dd4-8943-5ffa-a59a-4121a56c97ef'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 2,
   'Şekildeki Venn şemasında ayrık bölgelerin eleman sayıları verilmiştir. Evrensel küme $s(E) = 42$ olduğuna göre $s(B)$ kaçtır?',
   '{"options":["8","11","17","22","24"],"correctIndex":2}'::jsonb,
   'Evrensel kümenin eleman sayısı şemadaki dört ayrık bölgenin toplamına eşittir:
$$2x + 6 + (x + 3) + 9 = 42 \Rightarrow 3x + 18 = 42 \Rightarrow 3x = 24 \Rightarrow x = 8$$
$B$ kümesi $A \cap B$ ile $B \setminus A$ bölgelerinden oluştuğundan $s(B) = 6 + (8 + 3) = 6 + 11 = 17$ bulunur.',
   'B şıkkı ($11$), $x = 8$''i doğru bulduktan sonra $s(B)$ yerine yalnızca $s(B \setminus A) = x + 3 = 11$ bölgesini alan; A şıkkı ($8$) ise doğrudan $x$''i işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 210" width="320" height="210" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><rect x="4" y="4" width="312" height="202" rx="6" stroke-width="1.4"/><text x="18" y="24.9" fill="currentColor" stroke="none" text-anchor="start" font-weight="600">E</text><circle cx="115" cy="105" r="70" fill="currentColor" fill-opacity="0.06"/><text x="63" y="35.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><circle cx="205" cy="105" r="70" fill="currentColor" fill-opacity="0.06"/><text x="257" y="35.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="80" y="109.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">2x</text><text x="160" y="109.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">6</text><text x="240" y="109.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">x + 3</text><text x="294" y="194.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">9</text></svg>', true),
  -- mat-09-025 · doğrulandı
  ('954f15ef-83e6-5176-bdbc-4b9204475132'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 2,
   '$A$, $B$ ve $C$ kümeleri için $s(B) > 1$, $s(A \times B) = 28$, $s(C \times B) = 35$ ve $s(A \cap C) = 1$ veriliyor.
Buna göre $s((A \cup C) \times B)$ kaçtır?',
   '{"options":["35","42","49","54","56"],"correctIndex":4}'::jsonb,
   '$s(A \times B) = s(A) \cdot s(B) = 28$ ve $s(C \times B) = s(C) \cdot s(B) = 35$ olduğundan $s(B)$ hem $28$''i hem de $35$''i bölen $1$''den büyük tam sayı olmalıdır: $\text{EBOB}(28, 35) = 7 \Rightarrow s(B) = 7$.
Buradan $s(A) = \dfrac{28}{7} = 4$ ve $s(C) = \dfrac{35}{7} = 5$ bulunur.
$s(A \cup C) = s(A) + s(C) - s(A \cap C) = 4 + 5 - 1 = 8$ olduğundan $s((A \cup C) \times B) = 8 \cdot 7 = 56$ elde edilir.',
   'B şıkkı ($42$) veya C şıkkı ($49$), $s(A \cap C) = 1$ ortak elemanını çıkarırken veya $s(B) = 7$ çarpanını uygularken işlem hatası yapan; ya da $63$ ($9 \cdot 7$) doğrultusunda ortak elemanı unutarak yanılgıya düşen adayları hedefler.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-09-026
  ('8f658295-f24a-5784-b035-14205650b9e7'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 1,
   'Gerçel sayılarda tanımlı $f(x) = 3x - 2$ fonksiyonu verilmektedir.
Buna göre $f(2x + 1)$ ifadesinin $f(x)$ türünden eşiti aşağıdakilerden hangisidir?',
   '{"options":["$2f(x) + 5$","$2f(x) + 1$","$2f(x) - 1$","$3f(x) + 5$","$2f(x) + 3$"],"correctIndex":0}'::jsonb,
   'Verilen tanımdan $3x = f(x) + 2$ çekilir. İstenen ifade açıldığında:
$$f(2x + 1) = 3(2x + 1) - 2 = 6x + 3 - 2 = 2(3x) + 1$$
Burada $3x = f(x) + 2$ yerine yazılırsa $2(f(x) + 2) + 1 = 2f(x) + 5$ elde edilir.',
   'B şıkkı ($2f(x) + 1$), yalnızca $6x$''i $2f(x)$ yerine koyup $3x = f(x) + 2$ eşitliğindeki $+2$ sabitini çarpmayı unutan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-09-027 · şekilli · doğrulandı
  ('66b65ffd-8ca3-5f37-babd-300a9b3ed359'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 2,
   '$38$ öğrencinin bulunduğu bir sınıfta İngilizce (İ), Almanca (A) ve Fransızca (F) dillerini bilenlerin dağılımı aşağıdaki Venn şemasında verilmiştir.
Buna göre bu sınıfta bu üç dilden en az ikisini bilen toplam kaç öğrenci vardır?',
   '{"options":["12","14","15","16","19"],"correctIndex":1}'::jsonb,
   'Tüm bölgelerin toplamı $38$''i vermelidir:
$$8 + 6 + 7 + 4 + 3 + 2 + x + 3 = 38 \Rightarrow 33 + x = 38 \Rightarrow x = 5$$
En az iki dil bilen öğrenciler ikişerli kesişim bölgeleri ile üçlü kesişim bölgesinde yer alır: $4 + 3 + 2 + x = 4 + 3 + 2 + 5 = 14$ kişi bulunur.',
   'E şıkkı ($19$), $x = 5$''i doğru bulduktan sonra "en az iki dil" yerine dıştaki $3$ kişiyi veya yalnızca tek dil bilen bir bölgeyi yanlışlıkla toplama dahil edenleri; A şıkkı ($12$) ise üçlü kesişimi saymayanları yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 270" width="320" height="270" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><rect x="4" y="4" width="312" height="262" rx="6" stroke-width="1.4"/><text x="18" y="24.9" fill="currentColor" stroke="none" text-anchor="start" font-weight="600">E</text><circle cx="120" cy="100" r="70" fill="currentColor" fill-opacity="0.06"/><text x="62" y="42.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">İ</text><circle cx="200" cy="100" r="70" fill="currentColor" fill-opacity="0.06"/><text x="258" y="42.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><circle cx="160" cy="165" r="70" fill="currentColor" fill-opacity="0.06"/><text x="160" y="249.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">F</text><text x="92" y="86.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">8</text><text x="228" y="86.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">6</text><text x="160" y="204.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">7</text><text x="160" y="76.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">4</text><text x="118" y="146.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">3</text><text x="202" y="146.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">2</text><text x="160" y="122.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">x</text><text x="294" y="254.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">3</text></svg>', true),
  -- mat-09-028 · doğrulandı
  ('e995dd6b-9655-5fbe-adcf-7c5d8b45b6dc'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 2,
   'Gerçel sayılarda tanımlı $f$ doğrusal bir fonksiyon olup $f(2) = 7$ ve $f(5) = 19$ eşitliklerini sağlamaktadır.
Buna göre $f(8)$ değeri kaçtır?',
   '{"options":["23","25","27","31","35"],"correctIndex":3}'::jsonb,
   'Doğrusal fonksiyon $f(x) = ax + b$ biçimindedir. Tanım kümesindeki değişime oranla değer artışı sabittir:
$$a = \frac{f(5) - f(2)}{5 - 2} = \frac{19 - 7}{3} = 4$$
$x = 5$''ten $x = 8$''e $3$ birimlik artış olduğunda fonksiyon değeri $3 \cdot 4 = 12$ artar: $f(8) = 19 + 12 = 31$ bulunur.',
   'C şıkkı ($27$), $x$''in $5$''ten $8$''e $3$ birim artmasını gözden kaçırıp sabit artış miktarı olan $12$''yi değil $8$''i ekleyen adayı; E şıkkı ($35$) ise bir adım fazla ekleyenleri yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-09-029 · doğrulandı
  ('28538e76-877c-5172-a56c-0484e89d1f83'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 3,
   'Gerçel sayılarda tanımlı $f$ ve bire bir örten $g$ fonksiyonları için
$$f(2x - 1) = 4x + 5$$
$$g^{-1}(x + 2) = 3x - 4$$
eşitlikleri veriliyor.
Buna göre $(f \circ g)(5)$ değeri kaçtır?',
   '{"options":["17","19","21","23","25"],"correctIndex":0}'::jsonb,
   'Önce $g(5)$ değeri bulunur. $g^{-1}(x + 2) = 3x - 4 \Leftrightarrow g(3x - 4) = x + 2$ olduğundan parantez içini $5$''e eşitleyen $x$ aranır: $3x - 4 = 5 \Rightarrow 3x = 9 \Rightarrow x = 3$. Buradan $g(5) = 3 + 2 = 5$ elde edilir.
Şimdi $(f \circ g)(5) = f(g(5)) = f(5)$ hesaplanır. $f(2x - 1) = 4x + 5$ eşitliğinde $2x - 1 = 5 \Rightarrow x = 3$ konursa $f(5) = 4(3) + 5 = 17$ bulunur.',
   'E şıkkı ($25$), $f(5)$''i hesaplarken $2x - 1 = 5$ denklemini çözmeden doğrudan $x = 5$ koyarak $4 \cdot 5 + 5 = 25$ yazan; B şıkkı ($19$) ise $g^{-1}$ ters dönüşümünde $x + 2$ yerine doğrudan $5 + 2$ koyan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-09-030 · doğrulandı
  ('e88cac3f-a981-581b-8309-a8f6fb749296'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 1,
   'Bir deney sayacı $0$''dan $23$''e kadar tam saatleri göstermekte, $23$''ten bir saat sonra tekrar $0$''a dönmektedir. Sayaç şu an $15$''i gösterdiğine göre $100$ saat sonra kaçı gösterir?',
   '{"options":["11","13","15","17","19"],"correctIndex":4}'::jsonb,
   'Sayaç $24$ saatte bir aynı değere döndüğünden $100$ sayısı $24$''e bölünür: $100 = 24 \cdot 4 + 4$, kalan $4$''tür. Şu an $15$''te bulunan sayaca $4$ saat eklenirse $15 + 4 = 19$ bulunur.',
   'A şıkkı ($11$), $4$ saati eklemek yerine $15$''ten $4$ çıkararak $11$ bulan; C şıkkı ($15$) ise $100$''ü yanlışlıkla $24$''ün değil $25$''in tam katı sanan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-09-031 · doğrulandı
  ('6a8a92a6-f201-527d-98f1-0c3246364288'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 2,
   'Gerçel sayılarda tanımlı $f$ ve $g$ fonksiyonları için
$$(f + g)(x) = 3x + 5 \quad \text{ve} \quad (f - g)(x) = x - 3$$
eşitlikleri verilmektedir.
Buna göre $(f \cdot g)(2)$ değeri kaçtır?',
   '{"options":["11","18","24","30","36"],"correctIndex":3}'::jsonb,
   'Verilen her iki eşitlikte de $x = 2$ yazılır:
- $f(2) + g(2) = 3(2) + 5 = 11$
- $f(2) - g(2) = 2 - 3 = -1$
Bu iki denklem taraf tarafa toplanırsa $2f(2) = 10 \Rightarrow f(2) = 5$ bulunur. Buradan $g(2) = 11 - 5 = 6$ olur. Çarpımları $(f \cdot g)(2) = f(2) \cdot g(2) = 5 \cdot 6 = 30$''dur.',
   'A şıkkı ($11$), $f(2) = 5$ ve $g(2) = 6$ değerlerini bulduktan sonra çarpım yerine $f(2) + g(2)$ toplamını işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-09-032 · şekilli · doğrulandı
  ('6cc578eb-4481-55a1-91b6-1d172d383e44'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 1,
   'Şekildeki Venn şemasında ayrık bölgelerdeki eleman sayıları verilmiştir. Evrensel küme $s(E) = 32$ olduğuna göre $s(A \cap B)$ kaçtır?',
   '{"options":["4","5","6","7","8"],"correctIndex":3}'::jsonb,
   'Şemadaki dört ayrık bölgenin toplamı evrensel küme eleman sayısına eşittir:
$$12 + x + 9 + 4 = 32 \Rightarrow 25 + x = 32 \Rightarrow x = 7$$
Buna göre $s(A \cap B) = 7$''dir.',
   'A şıkkı ($4$) veya B şıkkı ($5$), toplama yaparken dıştaki $4$ elemanını hesaba katmayıp çıkarma hatası yapan veya $x$ yerine başka bir bölgeyi seçen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 210" width="320" height="210" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><rect x="4" y="4" width="312" height="202" rx="6" stroke-width="1.4"/><text x="18" y="24.9" fill="currentColor" stroke="none" text-anchor="start" font-weight="600">E</text><circle cx="115" cy="105" r="70" fill="currentColor" fill-opacity="0.06"/><text x="63" y="35.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><circle cx="205" cy="105" r="70" fill="currentColor" fill-opacity="0.06"/><text x="257" y="35.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="80" y="109.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">12</text><text x="160" y="109.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">x</text><text x="240" y="109.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">9</text><text x="294" y="194.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">4</text></svg>', true),
  -- mat-09-033
  ('df1fdc3d-d507-5818-bf18-1605888afe75'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 2,
   'Gerçel sayılarda tanımlı $f$ çift fonksiyon, $g$ ise tek fonksiyon olup $f(3) = 4$ ve $g(-2) = 5$ verilmektedir.
Buna göre,
I. $f(-3) + g(2) = 9$
II. $h(x) = f(x) \cdot g(x)$ tek fonksiyondur.
III. $f(-3) \cdot g(2) = -20$
ifadelerinden hangileri doğrudur?',
   '{"options":["Yalnız I","Yalnız II","I ve II","I ve III","II ve III"],"correctIndex":4}'::jsonb,
   '$f$ çift fonksiyon olduğu için $f(-3) = f(3) = 4$''tür. $g$ tek fonksiyon olduğu için $g(-2) = -g(2) = 5 \Rightarrow g(2) = -5$ bulunur.
- I: $f(-3) + g(2) = 4 + (-5) = -1 \neq 9$ (yanlış).
- II: $h(-x) = f(-x) \cdot g(-x) = f(x) \cdot (-g(x)) = -h(x)$ olduğundan $h$ tek fonksiyondur (doğru).
- III: $f(-3) \cdot g(2) = 4 \cdot (-5) = -20$ (doğru).',
   'C şıkkı (I ve II), tek fonksiyonda $g(-2) = 5$ iken $g(2)$''yi işaret değiştirmeden $+5$ sanıp $4 + 5 = 9$ bulan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-09-034 · doğrulandı
  ('5e38d73a-402d-59f4-a7b6-ad08a2b7efab'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 3,
   'Pozitif tam sayılarda tanımlı bir $f$ fonksiyonu her $n$ pozitif tam sayısı için
$$f(n + 1) = f(n) + 2n$$
eşitliğini sağlamaktadır. $f(1) = 3$ olduğuna göre $f(10)$ değeri kaçtır?',
   '{"options":["83","93","95","103","113"],"correctIndex":1}'::jsonb,
   '$n = 1, 2, \ldots, 9$ için eşitlik alt alta yazılıp taraf tarafa toplanır (teleskopik toplam):
$$f(2) - f(1) = 2 \cdot 1$$
$$f(3) - f(2) = 2 \cdot 2$$
$$f(10) - f(9) = 2 \cdot 9$$
Taraf tarafa toplandığında aradaki terimler birbirini götürür ve $f(10) - f(1) = 2(1 + 2 + \cdots + 9)$ elde edilir. $1$''den $9$''a kadar toplam $\dfrac{9 \cdot 10}{2} = 45$ olduğundan $f(10) - 3 = 2 \cdot 45 = 90 \Rightarrow f(10) = 93$ bulunur.',
   'D şıkkı ($103$) veya E şıkkı ($113$), teleskopik toplamın son teriminde $n = 9$ yerine $n = 10$ alarak $1$''den $10$''a kadar ($55 \cdot 2 = 110 \Rightarrow 113$) toplayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-09-035 · doğrulandı
  ('10e67399-7b40-51a1-b0df-972258e9a61c'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 3,
   'Bir $A$ kümesinin eleman sayısı $2$ artırıldığında alt küme sayısı $384$ artmaktadır. $s(B) = 8$ ve $s(A \cup B) = 11$ olduğuna göre $s(A \times (A \cap B))$ kaçtır?',
   '{"options":["14","18","21","24","28"],"correctIndex":4}'::jsonb,
   '$s(A) = n$ olsun. Eleman sayısı $2$ artırıldığında alt küme sayısı farkı:
$$2^{n + 2} - 2^n = 384 \Rightarrow 2^n(4 - 1) = 384 \Rightarrow 3 \cdot 2^n = 384 \Rightarrow 2^n = 128 \Rightarrow n = 7$$
Böylece $s(A) = 7$ bulunur. Birleşim formülünden $11 = 7 + 8 - s(A \cap B) \Rightarrow s(A \cap B) = 4$ elde edilir. Sonuç olarak $s(A \times (A \cap B)) = s(A) \cdot s(A \cap B) = 7 \cdot 4 = 28$''dir.',
   'C şıkkı ($21$) veya D şıkkı ($24$), $2^n = 128$ değerinden $n = 6$ gibi üs hatası yapan ya da Kartezyen çarpım eleman sayısında toplama yaparak yanlış sonuca ulaşan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-09-036 · şekilli · doğrulandı
  ('a360ce06-1390-5857-a62e-55fa84a52205'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 1,
   'Şekildeki Venn şemasında ayrık bölgelerin eleman sayıları verilmiştir. Evrensel küme $s(E) = 36$ olduğuna göre $s(A) + s(B)$ toplamı kaçtır?',
   '{"options":["30","38","32","36","44"],"correctIndex":1}'::jsonb,
   'Tüm ayrık bölgelerin toplamı $36$ olmalıdır: $10 + x + 12 + 6 = 36 \Rightarrow 28 + x = 36 \Rightarrow x = 8$.
Buradan $s(A) = 10 + 8 = 18$ ve $s(B) = 12 + 8 = 20$ bulunur. Toplam $s(A) + s(B) = 18 + 20 = 38$''dir.',
   'A şıkkı ($30$), $s(A) + s(B)$ yerine $s(A \cup B) = 36 - 6 = 30$ değerini işaretleyen (kesişimdeki $x = 8$''i ikinci kez saymayı unutan) adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 210" width="320" height="210" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><rect x="4" y="4" width="312" height="202" rx="6" stroke-width="1.4"/><text x="18" y="24.9" fill="currentColor" stroke="none" text-anchor="start" font-weight="600">E</text><circle cx="115" cy="105" r="70" fill="currentColor" fill-opacity="0.06"/><text x="63" y="35.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><circle cx="205" cy="105" r="70" fill="currentColor" fill-opacity="0.06"/><text x="257" y="35.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="80" y="109.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">10</text><text x="160" y="109.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">x</text><text x="240" y="109.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">12</text><text x="294" y="194.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">6</text></svg>', true),
  -- mat-09-037 · şekilli · doğrulandı
  ('b1d8a53a-0e11-592b-a5da-fd4f675fbf8f'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 2,
   'Şekildeki dik koordinat düzleminde $y = f(x)$ doğrusal fonksiyonunun grafiği $A(-3, 0)$ ve $B(0, 6)$ noktalarından geçmektedir.
Buna göre $f(4) + f^{-1}(2)$ toplamı kaçtır?',
   '{"options":["12","10","14","16","18"],"correctIndex":0}'::jsonb,
   'Eksenleri $(-3, 0)$ ve $(0, 6)$ noktalarında kesen doğrunun denklemi $\dfrac{x}{-3} + \dfrac{y}{6} = 1 \Rightarrow y = 2x + 6$''dır; yani $f(x) = 2x + 6$.
- $f(4) = 2 \cdot 4 + 6 = 14$.
- $f^{-1}(2) = a \Leftrightarrow 2a + 6 = 2 \Rightarrow 2a = -4 \Rightarrow a = -2$.
Toplam $14 + (-2) = 12$ bulunur.',
   'D şıkkı ($16$), $2a + 6 = 2$ denkleminden $a = -2$ yerine $+2$ alıp $14 + 2 = 16$ hesaplayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 237.8 260" width="237.8" height="260" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><g stroke-width="0.6" stroke-opacity="0.25"><line x1="30" y1="230" x2="30" y2="30"/><line x1="74.4" y1="230" x2="74.4" y2="30"/><line x1="118.9" y1="230" x2="118.9" y2="30"/><line x1="163.3" y1="230" x2="163.3" y2="30"/><line x1="207.8" y1="230" x2="207.8" y2="30"/><line x1="30" y1="207.8" x2="207.8" y2="207.8"/><line x1="30" y1="163.3" x2="207.8" y2="163.3"/><line x1="30" y1="118.9" x2="207.8" y2="118.9"/><line x1="30" y1="74.4" x2="207.8" y2="74.4"/><line x1="30" y1="30" x2="207.8" y2="30"/></g><line x1="24" y1="207.8" x2="217.8" y2="207.8"/><line x1="118.9" y1="236" x2="118.9" y2="20"/><path d="M217.8 207.8 l-7 -4 m7 4 l-7 4"/><path d="M118.9 20 l-4 7 m4 -7 l4 7"/><text x="221.8" y="224.7" fill="currentColor" stroke="none" text-anchor="end" font-style="italic">x</text><text x="130.9" y="22.9" fill="currentColor" stroke="none" text-anchor="start" font-style="italic">y</text><g stroke-width="1.2"><line x1="30" y1="204.8" x2="30" y2="210.8"/><text x="30" y="225.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">-4</text><line x1="74.4" y1="204.8" x2="74.4" y2="210.8"/><text x="74.4" y="225.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">-2</text><line x1="163.3" y1="204.8" x2="163.3" y2="210.8"/><text x="163.3" y="225.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">2</text><line x1="207.8" y1="204.8" x2="207.8" y2="210.8"/><text x="207.8" y="225.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">4</text><line x1="115.9" y1="163.3" x2="121.9" y2="163.3"/><text x="112.9" y="167.2" fill="currentColor" stroke="none" text-anchor="end" font-size="11">2</text><line x1="115.9" y1="118.9" x2="121.9" y2="118.9"/><text x="112.9" y="122.7" fill="currentColor" stroke="none" text-anchor="end" font-size="11">4</text><line x1="115.9" y1="74.4" x2="121.9" y2="74.4"/><text x="112.9" y="78.3" fill="currentColor" stroke="none" text-anchor="end" font-size="11">6</text><line x1="115.9" y1="30" x2="121.9" y2="30"/><text x="112.9" y="33.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">8</text><text x="110.9" y="223.6" fill="currentColor" stroke="none" text-anchor="end" font-size="11">O</text></g><path d="M43.3 225.6L43.7 224.8L44.1 224L44.5 223.2L44.9 222.4L45.3 221.7L45.7 220.9L46.1 220.1L46.4 219.3L46.8 218.6L47.2 217.8L47.6 217L48 216.2L48.4 215.4L48.8 214.7L49.2 213.9L49.6 213.1L49.9 212.3L50.3 211.6L50.7 210.8L51.1 210L51.5 209.2L51.9 208.4L52.3 207.7L52.7 206.9L53.1 206.1L53.4 205.3L53.8 204.6L54.2 203.8L54.6 203L55 202.2L55.4 201.4L55.8 200.7L56.2 199.9L56.6 199.1L56.9 198.3L57.3 197.6L57.7 196.8L58.1 196L58.5 195.2L58.9 194.4L59.3 193.7L59.7 192.9L60.1 192.1L60.4 191.3L60.8 190.6L61.2 189.8L61.6 189L62 188.2L62.4 187.4L62.8 186.7L63.2 185.9L63.6 185.1L63.9 184.3L64.3 183.6L64.7 182.8L65.1 182L65.5 181.2L65.9 180.4L66.3 179.7L66.7 178.9L67.1 178.1L67.4 177.3L67.8 176.6L68.2 175.8L68.6 175L69 174.2L69.4 173.4L69.8 172.7L70.2 171.9L70.6 171.1L70.9 170.3L71.3 169.6L71.7 168.8L72.1 168L72.5 167.2L72.9 166.4L73.3 165.7L73.7 164.9L74.1 164.1L74.4 163.3L74.8 162.6L75.2 161.8L75.6 161L76 160.2L76.4 159.4L76.8 158.7L77.2 157.9L77.6 157.1L77.9 156.3L78.3 155.6L78.7 154.8L79.1 154L79.5 153.2L79.9 152.4L80.3 151.7L80.7 150.9L81.1 150.1L81.4 149.3L81.8 148.6L82.2 147.8L82.6 147L83 146.2L83.4 145.4L83.8 144.7L84.2 143.9L84.6 143.1L84.9 142.3L85.3 141.6L85.7 140.8L86.1 140L86.5 139.2L86.9 138.4L87.3 137.7L87.7 136.9L88.1 136.1L88.4 135.3L88.8 134.6L89.2 133.8L89.6 133L90 132.2L90.4 131.4L90.8 130.7L91.2 129.9L91.6 129.1L91.9 128.3L92.3 127.6L92.7 126.8L93.1 126L93.5 125.2L93.9 124.4L94.3 123.7L94.7 122.9L95.1 122.1L95.4 121.3L95.8 120.6L96.2 119.8L96.6 119L97 118.2L97.4 117.4L97.8 116.7L98.2 115.9L98.6 115.1L98.9 114.3L99.3 113.6L99.7 112.8L100.1 112L100.5 111.2L100.9 110.4L101.3 109.7L101.7 108.9L102.1 108.1L102.4 107.3L102.8 106.6L103.2 105.8L103.6 105L104 104.2L104.4 103.4L104.8 102.7L105.2 101.9L105.6 101.1L105.9 100.3L106.3 99.6L106.7 98.8L107.1 98L107.5 97.2L107.9 96.4L108.3 95.7L108.7 94.9L109.1 94.1L109.4 93.3L109.8 92.6L110.2 91.8L110.6 91L111 90.2L111.4 89.4L111.8 88.7L112.2 87.9L112.6 87.1L112.9 86.3L113.3 85.6L113.7 84.8L114.1 84L114.5 83.2L114.9 82.4L115.3 81.7L115.7 80.9L116.1 80.1L116.4 79.3L116.8 78.6L117.2 77.8L117.6 77L118 76.2L118.4 75.4L118.8 74.7L119.2 73.9L119.6 73.1L119.9 72.3L120.3 71.6L120.7 70.8L121.1 70L121.5 69.2L121.9 68.4L122.3 67.7L122.7 66.9L123.1 66.1L123.4 65.3L123.8 64.6L124.2 63.8L124.6 63L125 62.2L125.4 61.4L125.8 60.7L126.2 59.9L126.6 59.1L126.9 58.3L127.3 57.6L127.7 56.8L128.1 56L128.5 55.2L128.9 54.4L129.3 53.7L129.7 52.9L130.1 52.1L130.4 51.3L130.8 50.6L131.2 49.8L131.6 49L132 48.2L132.4 47.4L132.8 46.7L133.2 45.9L133.6 45.1L133.9 44.3L134.3 43.6L134.7 42.8L135.1 42L135.5 41.2L135.9 40.4L136.3 39.7L136.7 38.9" stroke-width="2.2"/><text x="98.2" y="122.7" fill="currentColor" stroke="none" text-anchor="start" font-style="italic">f</text><circle cx="52.2" cy="207.8" r="3" fill="currentColor" stroke="none"/><text x="41.7" y="202.2" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><circle cx="118.9" cy="74.4" r="3" fill="currentColor" stroke="none"/><text x="132.9" y="79.3" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text></svg>', true),
  -- mat-09-038 · şekilli · doğrulandı
  ('5c1ca2ae-d3f1-5eee-9730-9df90a89e7d3'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 2,
   'Şekildeki dik koordinat düzleminde $f$ ve $g$ doğrusal fonksiyonlarının grafikleri $C(2, 4)$ noktasında kesişmektedir. $f$ doğrusu $(-2, 0)$ ve $(0, 2)$ noktalarından, $g$ doğrusu ise $(0, 6)$ ve $(6, 0)$ noktalarından geçmektedir.
Buna göre $(f \circ g)(1) + g^{-1}(4)$ toplamı kaçtır?',
   '{"options":["5","7","9","11","13"],"correctIndex":2}'::jsonb,
   'Grafikten doğrunun denklemleri yazılır: $f(x) = x + 2$ ve $g(x) = 6 - x$.
- $(f \circ g)(1) = f(g(1)) = f(6 - 1) = f(5) = 5 + 2 = 7$.
- $g(2) = 4$ ($C(2, 4)$ noktası grafik üzerinde) olduğundan $g^{-1}(4) = 2$''dir.
Toplam $7 + 2 = 9$ bulunur.',
   'B şıkkı ($7$), yalnızca $(f \circ g)(1) = 7$ değerini hesaplayıp $g^{-1}(4) = 2$''yi eklemeyi unutan adayı; E şıkkı ($13$) ise $g^{-1}(4)$ yerine $g(4)$ veya ters sırada $(g \circ f)(1)$ alanları yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 310 260" width="310" height="260" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><g stroke-width="0.6" stroke-opacity="0.25"><line x1="55" y1="230" x2="55" y2="30"/><line x1="105" y1="230" x2="105" y2="30"/><line x1="155" y1="230" x2="155" y2="30"/><line x1="205" y1="230" x2="205" y2="30"/><line x1="255" y1="230" x2="255" y2="30"/><line x1="30" y1="205" x2="280" y2="205"/><line x1="30" y1="155" x2="280" y2="155"/><line x1="30" y1="105" x2="280" y2="105"/><line x1="30" y1="55" x2="280" y2="55"/></g><line x1="24" y1="205" x2="290" y2="205"/><line x1="105" y1="236" x2="105" y2="20"/><path d="M290 205 l-7 -4 m7 4 l-7 4"/><path d="M105 20 l-4 7 m4 -7 l4 7"/><text x="294" y="221.9" fill="currentColor" stroke="none" text-anchor="end" font-style="italic">x</text><text x="117" y="22.9" fill="currentColor" stroke="none" text-anchor="start" font-style="italic">y</text><g stroke-width="1.2"><line x1="55" y1="202" x2="55" y2="208"/><text x="55" y="222.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">-2</text><line x1="155" y1="202" x2="155" y2="208"/><text x="155" y="222.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">2</text><line x1="205" y1="202" x2="205" y2="208"/><text x="205" y="222.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">4</text><line x1="255" y1="202" x2="255" y2="208"/><text x="255" y="222.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">6</text><line x1="102" y1="155" x2="108" y2="155"/><text x="99" y="158.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">2</text><line x1="102" y1="105" x2="108" y2="105"/><text x="99" y="108.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">4</text><line x1="102" y1="55" x2="108" y2="55"/><text x="99" y="58.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">6</text><text x="97" y="220.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">O</text></g><path d="M45 215L45.7 214.3L46.4 213.6L47.1 212.9L47.8 212.2L48.5 211.5L49.3 210.8L50 210L50.7 209.3L51.4 208.6L52.1 207.9L52.8 207.2L53.5 206.5L54.2 205.8L54.9 205.1L55.6 204.4L56.3 203.7L57 203L57.8 202.3L58.5 201.5L59.2 200.8L59.9 200.1L60.6 199.4L61.3 198.7L62 198L62.7 197.3L63.4 196.6L64.1 195.9L64.8 195.2L65.5 194.5L66.3 193.8L67 193L67.7 192.3L68.4 191.6L69.1 190.9L69.8 190.2L70.5 189.5L71.2 188.8L71.9 188.1L72.6 187.4L73.3 186.7L74 186L74.8 185.3L75.5 184.5L76.2 183.8L76.9 183.1L77.6 182.4L78.3 181.7L79 181L79.7 180.3L80.4 179.6L81.1 178.9L81.8 178.2L82.5 177.5L83.3 176.7L84 176L84.7 175.3L85.4 174.6L86.1 173.9L86.8 173.2L87.5 172.5L88.2 171.8L88.9 171.1L89.6 170.4L90.3 169.7L91 169L91.8 168.2L92.5 167.5L93.2 166.8L93.9 166.1L94.6 165.4L95.3 164.7L96 164L96.7 163.3L97.4 162.6L98.1 161.9L98.8 161.2L99.5 160.5L100.3 159.8L101 159L101.7 158.3L102.4 157.6L103.1 156.9L103.8 156.2L104.5 155.5L105.2 154.8L105.9 154.1L106.6 153.4L107.3 152.7L108 152L108.8 151.3L109.5 150.5L110.2 149.8L110.9 149.1L111.6 148.4L112.3 147.7L113 147L113.7 146.3L114.4 145.6L115.1 144.9L115.8 144.2L116.5 143.5L117.3 142.8L118 142L118.7 141.3L119.4 140.6L120.1 139.9L120.8 139.2L121.5 138.5L122.2 137.8L122.9 137.1L123.6 136.4L124.3 135.7L125 135L125.8 134.3L126.5 133.5L127.2 132.8L127.9 132.1L128.6 131.4L129.3 130.7L130 130L130.7 129.3L131.4 128.6L132.1 127.9L132.8 127.2L133.5 126.5L134.3 125.7L135 125L135.7 124.3L136.4 123.6L137.1 122.9L137.8 122.2L138.5 121.5L139.2 120.8L139.9 120.1L140.6 119.4L141.3 118.7L142 118L142.8 117.2L143.5 116.5L144.2 115.8L144.9 115.1L145.6 114.4L146.3 113.7L147 113L147.7 112.3L148.4 111.6L149.1 110.9L149.8 110.2L150.5 109.5L151.3 108.7L152 108L152.7 107.3L153.4 106.6L154.1 105.9L154.8 105.2L155.5 104.5L156.2 103.8L156.9 103.1L157.6 102.4L158.3 101.7L159 101L159.8 100.2L160.5 99.5L161.2 98.8L161.9 98.1L162.6 97.4L163.3 96.7L164 96L164.7 95.3L165.4 94.6L166.1 93.9L166.8 93.2L167.5 92.5L168.3 91.7L169 91L169.7 90.3L170.4 89.6L171.1 88.9L171.8 88.2L172.5 87.5L173.2 86.8L173.9 86.1L174.6 85.4L175.3 84.7L176 84L176.8 83.2L177.5 82.5L178.2 81.8L178.9 81.1L179.6 80.4L180.3 79.7L181 79L181.7 78.3L182.4 77.6L183.1 76.9L183.8 76.2L184.5 75.5L185.3 74.7L186 74L186.7 73.3L187.4 72.6L188.1 71.9L188.8 71.2L189.5 70.5L190.2 69.8L190.9 69.1L191.6 68.4L192.3 67.7L193 67L193.8 66.2L194.5 65.5L195.2 64.8L195.9 64.1L196.6 63.4L197.3 62.7L198 62L198.7 61.3L199.4 60.6L200.1 59.9L200.8 59.2L201.5 58.5L202.3 57.7L203 57L203.7 56.3L204.4 55.6L205.1 54.9L205.8 54.2L206.5 53.5L207.2 52.8L207.9 52.1L208.6 51.4L209.3 50.7L210 50L210.8 49.2L211.5 48.5L212.2 47.8L212.9 47.1L213.6 46.4L214.3 45.7L215 45" stroke-width="2.2"/><text x="206" y="54.9" fill="currentColor" stroke="none" text-anchor="start" font-style="italic">f</text><path d="M95 45L95.7 45.7L96.4 46.4L97.1 47.1L97.8 47.8L98.5 48.5L99.3 49.2L100 50L100.7 50.7L101.4 51.4L102.1 52.1L102.8 52.8L103.5 53.5L104.2 54.2L104.9 54.9L105.6 55.6L106.3 56.3L107 57L107.8 57.8L108.5 58.5L109.2 59.2L109.9 59.9L110.6 60.6L111.3 61.3L112 62L112.7 62.7L113.4 63.4L114.1 64.1L114.8 64.8L115.5 65.5L116.3 66.3L117 67L117.7 67.7L118.4 68.4L119.1 69.1L119.8 69.8L120.5 70.5L121.2 71.2L121.9 71.9L122.6 72.6L123.3 73.3L124 74L124.8 74.8L125.5 75.5L126.2 76.2L126.9 76.9L127.6 77.6L128.3 78.3L129 79L129.7 79.7L130.4 80.4L131.1 81.1L131.8 81.8L132.5 82.5L133.3 83.3L134 84L134.7 84.7L135.4 85.4L136.1 86.1L136.8 86.8L137.5 87.5L138.2 88.2L138.9 88.9L139.6 89.6L140.3 90.3L141 91L141.8 91.8L142.5 92.5L143.2 93.2L143.9 93.9L144.6 94.6L145.3 95.3L146 96L146.7 96.7L147.4 97.4L148.1 98.1L148.8 98.8L149.5 99.5L150.3 100.3L151 101L151.7 101.7L152.4 102.4L153.1 103.1L153.8 103.8L154.5 104.5L155.2 105.2L155.9 105.9L156.6 106.6L157.3 107.3L158 108L158.8 108.8L159.5 109.5L160.2 110.2L160.9 110.9L161.6 111.6L162.3 112.3L163 113L163.7 113.7L164.4 114.4L165.1 115.1L165.8 115.8L166.5 116.5L167.3 117.3L168 118L168.7 118.7L169.4 119.4L170.1 120.1L170.8 120.8L171.5 121.5L172.2 122.2L172.9 122.9L173.6 123.6L174.3 124.3L175 125L175.8 125.8L176.5 126.5L177.2 127.2L177.9 127.9L178.6 128.6L179.3 129.3L180 130L180.7 130.7L181.4 131.4L182.1 132.1L182.8 132.8L183.5 133.5L184.3 134.3L185 135L185.7 135.7L186.4 136.4L187.1 137.1L187.8 137.8L188.5 138.5L189.2 139.2L189.9 139.9L190.6 140.6L191.3 141.3L192 142L192.8 142.8L193.5 143.5L194.2 144.2L194.9 144.9L195.6 145.6L196.3 146.3L197 147L197.7 147.7L198.4 148.4L199.1 149.1L199.8 149.8L200.5 150.5L201.3 151.3L202 152L202.7 152.7L203.4 153.4L204.1 154.1L204.8 154.8L205.5 155.5L206.2 156.2L206.9 156.9L207.6 157.6L208.3 158.3L209 159L209.8 159.8L210.5 160.5L211.2 161.2L211.9 161.9L212.6 162.6L213.3 163.3L214 164L214.7 164.7L215.4 165.4L216.1 166.1L216.8 166.8L217.5 167.5L218.3 168.3L219 169L219.7 169.7L220.4 170.4L221.1 171.1L221.8 171.8L222.5 172.5L223.2 173.2L223.9 173.9L224.6 174.6L225.3 175.3L226 176L226.8 176.8L227.5 177.5L228.2 178.2L228.9 178.9L229.6 179.6L230.3 180.3L231 181L231.7 181.7L232.4 182.4L233.1 183.1L233.8 183.8L234.5 184.5L235.3 185.3L236 186L236.7 186.7L237.4 187.4L238.1 188.1L238.8 188.8L239.5 189.5L240.2 190.2L240.9 190.9L241.6 191.6L242.3 192.3L243 193L243.8 193.8L244.5 194.5L245.2 195.2L245.9 195.9L246.6 196.6L247.3 197.3L248 198L248.7 198.7L249.4 199.4L250.1 200.1L250.8 200.8L251.5 201.5L252.3 202.3L253 203L253.7 203.7L254.4 204.4L255.1 205.1L255.8 205.8L256.5 206.5L257.2 207.2L257.9 207.9L258.6 208.6L259.3 209.3L260 210L260.8 210.8L261.5 211.5L262.2 212.2L262.9 212.9L263.6 213.6L264.3 214.3L265 215" stroke-width="2.2"/><text x="231" y="169.9" fill="currentColor" stroke="none" text-anchor="start" font-style="italic">g</text><circle cx="155" cy="105" r="3" fill="currentColor" stroke="none"/><text x="155" y="95.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text></svg>', true),
  -- mat-09-039 · şekilli · doğrulandı
  ('7964f577-0d22-594c-9cf6-5b321244f906'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 2,
   'Şekildeki Venn şemasında ayrık bölgelerdeki eleman sayıları verilmiştir.
Buna göre $s((A \cup B) \setminus C)$ kaçtır?',
   '{"options":["16","18","19","20","25"],"correctIndex":3}'::jsonb,
   '$(A \cup B) \setminus C$ kümesi, $A$ veya $B$''nin içinde olup $C$ kümesinin dışında kalan bölgelerden oluşur. Bunlar sırasıyla yalnızca $A$ ($9$), yalnızca $A \cap B$ ($4$) ve yalnızca $B$ ($7$) bölgeleridir. Toplam eleman sayısı $9 + 4 + 7 = 20$ bulunur.',
   'A şıkkı ($16$), ikişerli kesişim olan $AB = 4$ bölgesini çıkarmayıp yalnızca $9 + 7 = 16$ alan adayı; E şıkkı ($25$) ise dıştaki $5$ veya $C$''nin içindeki bir bölgeyi de ekleyenleri yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 270" width="320" height="270" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><rect x="4" y="4" width="312" height="262" rx="6" stroke-width="1.4"/><text x="18" y="24.9" fill="currentColor" stroke="none" text-anchor="start" font-weight="600">E</text><circle cx="120" cy="100" r="70" fill="currentColor" fill-opacity="0.06"/><text x="62" y="42.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><circle cx="200" cy="100" r="70" fill="currentColor" fill-opacity="0.06"/><text x="258" y="42.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><circle cx="160" cy="165" r="70" fill="currentColor" fill-opacity="0.06"/><text x="160" y="249.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="92" y="86.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">9</text><text x="228" y="86.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">7</text><text x="160" y="204.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">6</text><text x="160" y="76.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">4</text><text x="118" y="146.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">3</text><text x="202" y="146.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">2</text><text x="160" y="122.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">3</text><text x="294" y="254.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">5</text></svg>', true),
  -- mat-09-040 · şekilli · doğrulandı
  ('b6355885-5f57-534d-bd42-82f9f5a3a558'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 3,
   'Şekildeki işlem makinesine girilen sayıya ok üzerindeki işlem uygulanıp $7$ ile bölümünden kalan $y$ değeri elde edilmekte, ardından bu $y$ değeri tekrar girişe verilerek sistem art arda çalıştırılmaktadır.
Başlangıçta girişe $x = 2025$ yazıldığında $29.$ turun sonunda çıkışta hangi $y$ değeri görülür?',
   '{"options":["0","1","2","4","5"],"correctIndex":4}'::jsonb,
   'Önce $2025$ sayısının $7$ ile bölümünden kalan bulunur: $2025 = 7 \cdot 289 + 2 \equiv 2$ (mod $7$).
Şimdi turlar mod $7$''de takip edilir:
- $1.$ tur: $3(2) + 1 = 7 \equiv 0$ (mod $7$)
- $2.$ tur: $3(0) + 1 = 1 \equiv 1$ (mod $7$)
- $3.$ tur: $3(1) + 1 = 4 \equiv 4$ (mod $7$)
- $4.$ tur: $3(4) + 1 = 13 \equiv 6$ (mod $7$)
- $5.$ tur: $3(6) + 1 = 19 \equiv 5$ (mod $7$)
- $6.$ tur: $3(5) + 1 = 16 \equiv 2$ (mod $7$)
$6$ turda bir $(0, 1, 4, 6, 5, 2)$ dizisi tekrar eder. $29 = 6 \cdot 4 + 5$ olduğundan $29.$ turun sonunda $5.$ turdaki değer olan $5$ elde edilir.',
   'C şıkkı ($2$) veya B şıkkı ($1$), $29$ sayısını yanlış periyoda bölerek ya da başlangıç kalanı olan $2$''yi $1.$ tur sanarak bir adım kaydıran adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 354 66" width="354" height="66" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><line x1="50" y1="33" x2="142.6" y2="33" stroke-width="1.4"/><path d="M142.6 33 L135.3 36.1 M142.6 33 L135.3 29.9" stroke-width="1.4"/><text x="96.3" y="46.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">×3, +1</text><line x1="211.4" y1="33" x2="304" y2="33" stroke-width="1.4"/><path d="M304 33 L296.6 36.1 M304 33 L296.6 29.9" stroke-width="1.4"/><text x="257.7" y="46.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">mod 7</text><circle cx="33" cy="33" r="17" fill="currentColor" fill-opacity="0.06"/><text x="33" y="37.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">x</text><rect x="142.6" y="16" width="68.7" height="34" rx="6" fill="currentColor" fill-opacity="0.06"/><text x="177" y="37.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">3x + 1</text><circle cx="321" cy="33" r="17" fill="currentColor" fill-opacity="0.06"/><text x="321" y="37.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">y</text></svg>', true)
on conflict (id) do update set
  lesson = excluded.lesson, topic = excluded.topic, question_type = excluded.question_type,
  difficulty = excluded.difficulty, prompt_text = excluded.prompt_text,
  interaction_data = excluded.interaction_data, explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap, exam_scopes = excluded.exam_scopes,
  education_level = excluded.education_level, figure_svg = excluded.figure_svg, is_active = true;

-- >>> 10_permutasyon_kombinasyon_ve_olasilik.sql
-- ==========================================================================
-- KADRO SORU HAVUZU · Matematik & Geometri · Permütasyon, Kombinasyon ve Olasılık (40 soru)
-- Kaynak: docs/soru_havuzu/matematik/10_permutasyon_kombinasyon_ve_olasilik.md · Üretici: tools/math/compile_questions.mjs (elle düzenlemeyin)
-- Önkoşul: docs/supabase_migrations/12_math_figures.sql
-- İdempotent: soru kimlikleri sabit UUID'dir; dosya tekrar çalıştırılırsa sorular güncellenir.
-- ==========================================================================

insert into public.questions (
  id, lesson, topic, question_type, difficulty, prompt_text, interaction_data,
  explanation, distractor_trap, exam_scopes, education_level, figure_svg, is_active
) values
  -- mat-10-001 · doğrulandı
  ('a0f67c14-0a5c-5fcb-b7b3-a5b99ca29f35'::uuid, 'Matematik & Geometri', 'Permütasyon, Kombinasyon ve Olasılık', 'multiple_choice', 1,
   '$$A = \{1, 2, 3, 4, 5\}$$
kümesinin elemanları kullanılarak rakamları birbirinden farklı üç basamaklı kaç çift doğal sayı yazılabilir?',
   '{"options":["12","18","24","36","60"],"correctIndex":2}'::jsonb,
   'Sayının çift olabilmesi için birler basamağına kümedeki çift rakamlardan ($2$ veya $4$) biri yazılmalıdır; yani birler basamağı için $2$ seçenek vardır. Rakamlar farklı olacağından kalan $4$ rakam yüzler basamağına ($4$ seçenek), ardından kalan $3$ rakam onlar basamağına ($3$ seçenek) yazılır. Çarpma ilkesiyle $4 \cdot 3 \cdot 2 = 24$ farklı çift sayı yazılabilir.',
   'E şıkkı (60), çift olma koşulunu unutup tüm rakamları farklı üç basamaklı sayıları ($5 \cdot 4 \cdot 3 = 60$) hesaplayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-10-002 · doğrulandı
  ('cd0e092c-3526-5e19-bb37-fedfe24b16cd'::uuid, 'Matematik & Geometri', 'Permütasyon, Kombinasyon ve Olasılık', 'multiple_choice', 1,
   'Birbirinden farklı $3$ matematik kitabı ve $2$ tarih kitabı düz bir rafa, tarih kitapları yan yana olmak şartıyla kaç farklı biçimde sıralanabilir?',
   '{"options":["48","24","36","72","120"],"correctIndex":0}'::jsonb,
   'Yan yana durması gereken $2$ tarih kitabı tek bir paket gibi düşünülür. $3$ matematik kitabı ile bu $1$ paket toplam $4$ nesne oluşturur ve $4! = 24$ farklı biçimde dizilir. Tarih kitapları kendi aralarında $2! = 2$ farklı biçimde yer değiştirebildiğinden toplam $24 \cdot 2 = 48$ farklı sıralama vardır.',
   'B şıkkı (24), tarih kitaplarını tek paket sayıp $4! = 24$ bulduktan sonra iki tarih kitabının kendi aralarında yer değiştirmesini ($2!$) çarpmayı unutan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-10-003 · doğrulandı
  ('58bc3ea7-08bc-5e07-83f0-896e5f569b69'::uuid, 'Matematik & Geometri', 'Permütasyon, Kombinasyon ve Olasılık', 'multiple_choice', 2,
   '`MARMARA` kelimesindeki harflerin yerleri değiştirilerek $7$ harfli anlamlı ya da anlamsız kaç farklı kelime yazılabilir?',
   '{"options":["105","140","180","210","420"],"correctIndex":3}'::jsonb,
   '$7$ harfli `MARMARA` kelimesinde M harfi $2$ kez, A harfi $3$ kez ve R harfi $2$ kez tekrar etmektedir. Tekrarlı permütasyon formülüne göre farklı sıralamaların sayısı $\dfrac{7!}{2! \cdot 3! \cdot 2!} = \dfrac{5.040}{2 \cdot 6 \cdot 2} = \dfrac{5.040}{24} = 210$ bulunur.',
   'E şıkkı (420), paydadaki tekrar eden harflerden M veya R''nin $2!$ çarpanını eksik yazıp yalnızca $12$''ye bölen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-10-004 · doğrulandı
  ('5c1b681c-2939-505a-8e72-f647bfcf602c'::uuid, 'Matematik & Geometri', 'Permütasyon, Kombinasyon ve Olasılık', 'multiple_choice', 2,
   'Anne, baba ve $4$ çocuktan oluşan $6$ kişilik bir aile yuvarlak bir masa etrafında, anne ve baba yan yana oturmak şartıyla kaç farklı biçimde oturabilir?',
   '{"options":["24","60","120","240","48"],"correctIndex":4}'::jsonb,
   'Anne ve baba yan yana oturacağı için $1$ grup kabul edilir; $4$ çocukla birlikte yuvarlak masa etrafına dizilecek toplam $5$ birim oluşur. Dairesel permütasyonda $5$ birim $(5 - 1)! = 4! = 24$ farklı biçimde oturur. Anne ile babanın kendi aralarındaki yer değişimi $2! = 2$ olduğundan toplam $24 \cdot 2 = 48$ farklı oturma düzeni elde edilir.',
   'D şıkkı (240), yuvarlak masa yerine düz sıra permütasyonu ($5! \cdot 2!$) uygulayan; A şıkkı (24) ise anne ve babanın yer değişimini ($2!$) çarpmayı unutan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-10-005 · doğrulandı
  ('e08ec30a-30a6-5e61-aa2b-3e718c8c9d89'::uuid, 'Matematik & Geometri', 'Permütasyon, Kombinasyon ve Olasılık', 'multiple_choice', 1,
   '$5$ erkek ve $4$ kadın arasından $2$ erkek ve $2$ kadından oluşan $4$ kişilik bir komisyon kaç farklı biçimde seçilebilir?',
   '{"options":["16","60","72","120","126"],"correctIndex":1}'::jsonb,
   '$5$ erkekten $2$ erkek $\binom{5}{2} = \dfrac{5 \cdot 4}{2} = 10$ farklı biçimde, $4$ kadından $2$ kadın $\binom{4}{2} = \dfrac{4 \cdot 3}{2} = 6$ farklı biçimde seçilir. İki seçim birlikte yapıldığı için çarpma ilkesiyle $10 \cdot 6 = 60$ farklı komisyon oluşturulur.',
   'A şıkkı (16), iki kombinasyon değerini çarpmak yerine toplayan ($10 + 6 = 16$) adayı yakalar. E şıkkı (126) ise cinsiyet şartı olmadan $\binom{9}{4}$ seçenlerin düştüğü tuzaktır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-10-006 · doğrulandı
  ('2f1198c0-8beb-5d53-b5ed-78a449d73b5e'::uuid, 'Matematik & Geometri', 'Permütasyon, Kombinasyon ve Olasılık', 'multiple_choice', 2,
   '$4$ doktor ve $5$ hemşire arasından içinde en az $2$ doktor bulunan $4$ kişilik bir sağlık ekibi kaç farklı biçimde oluşturulabilir?',
   '{"options":["60","80","81","105","121"],"correctIndex":2}'::jsonb,
   'Ekipte en az $2$ doktor bulunması, $2$, $3$ veya $4$ doktor seçilmesi demektir:
$2$ doktor, $2$ hemşire: $\binom{4}{2}\binom{5}{2} = 6 \cdot 10 = 60$.
$3$ doktor, $1$ hemşire: $\binom{4}{3}\binom{5}{1} = 4 \cdot 5 = 20$.
$4$ doktor, $0$ hemşire: $\binom{4}{4}\binom{5}{0} = 1 \cdot 1 = 1$.
Toplam $60 + 20 + 1 = 81$ farklı ekip oluşturulabilir.',
   'A şıkkı (60), "en az 2 doktor" koşulunu "tam 2 doktor" gibi anlayıp $3$ ve $4$ doktorlu durumları eklemeyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-10-007 · doğrulandı
  ('a0ac6b1f-fd03-58a2-b213-a6dc32bae583'::uuid, 'Matematik & Geometri', 'Permütasyon, Kombinasyon ve Olasılık', 'multiple_choice', 2,
   'Bir düzlemde bulunan $9$ farklı noktadan $4$''ü aynı doğru üzerindedir; bu $4$ nokta dışındaki hiçbir üç nokta doğrusal değildir.
Köşeleri bu noktalar olan en çok kaç farklı üçgen çizilebilir?',
   '{"options":["80","78","82","84","81"],"correctIndex":0}'::jsonb,
   'Üçgen oluşturmak için doğrusal olmayan $3$ nokta seçilmelidir. Tüm $9$ noktadan seçilebilecek üçlülerin sayısı $\binom{9}{3} = \dfrac{9 \cdot 8 \cdot 7}{6} = 84$''tür. Aynı doğru üzerindeki $4$ noktadan seçilen $\binom{4}{3} = 4$ tane üçlü üçgen oluşturmaz. Dolayısıyla $84 - 4 = 80$ farklı üçgen çizilebilir.',
   'D şıkkı (84), doğru üzerindeki $4$ noktanın üçgen oluşturamayacağını hesaba katmayıp doğrudan $\binom{9}{3} = 84$ bulan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-10-008 · doğrulandı
  ('9be92b6b-7e51-5f9c-96b4-4a6e045bb094'::uuid, 'Matematik & Geometri', 'Permütasyon, Kombinasyon ve Olasılık', 'multiple_choice', 2,
   'Bir torbada aynı büyüklükte $4$ kırmızı ve $5$ mavi bilye vardır.
Torbadan aynı anda rastgele çekilen $2$ bilyenin aynı renkte olma olasılığı kaçtır?',
   '{"options":["$\\dfrac{1}{6}$","$\\dfrac{5}{18}$","$\\dfrac{1}{3}$","$\\dfrac{4}{9}$","$\\dfrac{5}{9}$"],"correctIndex":3}'::jsonb,
   '$9$ bilyeden $2$ bilye çekmenin tüm durumları $\binom{9}{2} = \dfrac{9 \cdot 8}{2} = 36$''dır. İki bilyenin de aynı renkte olması, ikisinin de kırmızı veya ikisinin de mavi olması demektir: $\binom{4}{2} + \binom{5}{2} = 6 + 10 = 16$. Olasılık $\dfrac{16}{36} = \dfrac{4}{9}$ bulunur.',
   'E şıkkı ($\frac{5}{9}$), istenen durum olan aynı renk yerine zıt renk olma olasılığını ($\dfrac{4 \cdot 5}{36} = \dfrac{5}{9}$) hesaplayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-10-009 · doğrulandı
  ('08fa8309-aac4-5508-bd55-cb84553b3e09'::uuid, 'Matematik & Geometri', 'Permütasyon, Kombinasyon ve Olasılık', 'multiple_choice', 3,
   'Bir hedefi Ahmet''in vurma olasılığı $\dfrac{2}{3}$, Mehmet''in vurma olasılığı ise $\dfrac{3}{4}$''tür.
Ahmet ve Mehmet aynı anda hedefe birer atış yaptıklarında hedefin vurulmuş olma olasılığı kaçtır?',
   '{"options":["$\\dfrac{1}{12}$","$\\dfrac{1}{2}$","$\\dfrac{7}{12}$","$\\dfrac{5}{6}$","$\\dfrac{11}{12}$"],"correctIndex":4}'::jsonb,
   'Hedefin vurulmuş olması en az birinin vurması demektir; bunun tümleyeni ikisinin de hedefi vuramamasıdır. Ahmet''in vuramama olasılığı $1 - \dfrac{2}{3} = \dfrac{1}{3}$, Mehmet''in vuramama olasılığı $1 - \dfrac{3}{4} = \dfrac{1}{4}$''tür. İkisinin de vuramama olasılığı $\dfrac{1}{3} \cdot \dfrac{1}{4} = \dfrac{1}{12}$ olduğundan hedefin vurulma olasılığı $1 - \dfrac{1}{12} = \dfrac{11}{12}$ bulunur.',
   'B şıkkı ($\frac{1}{2}$), en az birinin vurması yerine ikisinin birden vurma olasılığını ($\dfrac{2}{3} \cdot \dfrac{3}{4} = \dfrac{1}{2}$) hesaplayan adayı yakalar. A şıkkı ($\frac{1}{12}$) ise tümleyeni bulup $1$''den çıkarmayı unutanların tuzağıdır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-10-010 · doğrulandı
  ('bc54fc63-19f9-55c0-b861-db9c5d1c53b3'::uuid, 'Matematik & Geometri', 'Permütasyon, Kombinasyon ve Olasılık', 'multiple_choice', 3,
   'İki hilesiz zar birlikte atıldığında üst yüze gelen sayıların toplamının $8$ olduğu biliniyor.
Buna göre zarların ikisinin de tek sayı gelmiş olma olasılığı kaçtır?',
   '{"options":["$\\dfrac{1}{18}$","$\\dfrac{2}{5}$","$\\dfrac{1}{3}$","$\\dfrac{1}{5}$","$\\dfrac{3}{5}$"],"correctIndex":1}'::jsonb,
   'Koşullu olasılık sorusu olduğu için örnek uzay toplamı $8$ olan ikililerle sınırlanır: $(2, 6)$, $(3, 5)$, $(4, 4)$, $(5, 3)$, $(6, 2)$ olmak üzere $5$ olası durum vardır. Bunların içinde her iki zarın da tek sayı olduğu durumlar $(3, 5)$ ve $(5, 3)$ olmak üzere $2$ tanedir. İstenen olasılık $\dfrac{2}{5}$ bulunur.',
   'A şıkkı ($\frac{1}{18}$), koşullu olasılık gereği örnek uzayı $5$''e daraltmak yerine tüm zar uzayı olan $36$''ya bölerek $\frac{2}{36}$ bulan adayı yakalar. D şıkkı ($\frac{1}{5}$) ise $(3, 5)$ ile $(5, 3)$ ikililerini tek durum sananların tuzağıdır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-10-011 · doğrulandı
  ('8329ae1f-f2b8-5d97-807c-20216f6611d1'::uuid, 'Matematik & Geometri', 'Permütasyon, Kombinasyon ve Olasılık', 'multiple_choice', 1,
   'A kentinden B kentine $3$ farklı yol, B kentinden C kentine ise $4$ farklı yol vardır.
A''dan yola çıkıp B''ye uğrayarak C''ye giden ve giderken kullandığı yolların hiçbirini kullanmadan B üzerinden A''ya geri dönen bir kişi kaç farklı gidiş-dönüş yapabilir?',
   '{"options":["36","72","132","144","24"],"correctIndex":1}'::jsonb,
   'Gidişte A''dan B''ye $3$, B''den C''ye $4$ farklı yol olmak üzere $3 \cdot 4 = 12$ rota vardır. Dönüşte C''den B''ye giderken kullanılan $1$ yol hariç $4 - 1 = 3$ yol, B''den A''ya giderken kullanılan $1$ yol hariç $3 - 1 = 2$ yol kullanılabilir ($3 \cdot 2 = 6$ rota). Toplam $12 \cdot 6 = 72$ farklı gidiş-dönüş yapılır.',
   'C şıkkı (132), dönüşte her iki etaptan birer yol eksiltmek yerine toplam $12$ rotadan yalnızca $1$ rota çıkarıp $12 \cdot 11 = 132$ hesaplayan adayı; D şıkkı (144) ise yol şartını unutanları yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-10-012 · doğrulandı
  ('428fafc0-b839-5c04-b235-cf2ba8a77826'::uuid, 'Matematik & Geometri', 'Permütasyon, Kombinasyon ve Olasılık', 'multiple_choice', 1,
   '$$A = \{0, 1, 2, 3, 4\}$$
kümesinin elemanlarıyla rakamları birbirinden farklı üç basamaklı kaç doğal sayı yazılabilir?',
   '{"options":["24","36","60","48","100"],"correctIndex":3}'::jsonb,
   'Üç basamaklı bir sayının yüzler basamağına $0$ yazılamaz; bu yüzden yüzler basamağı için $\{1, 2, 3, 4\}$ olmak üzere $4$ seçenek vardır. Onlar basamağına $0$ gelebileceğinden kalan $4$ rakamdan biri ($4$ seçenek), birler basamağına ise kalan $3$ rakamdan biri ($3$ seçenek) yazılır. Toplam $4 \cdot 4 \cdot 3 = 48$ sayı yazılabilir.',
   'C şıkkı (60), $0$''ın yüzler basamağına gelemeyeceğini unutup $5 \cdot 4 \cdot 3 = 60$ hesaplayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-10-013 · doğrulandı
  ('0c01e680-f9a5-5514-a18e-7d77326c282c'::uuid, 'Matematik & Geometri', 'Permütasyon, Kombinasyon ve Olasılık', 'multiple_choice', 2,
   '$0, 1, 1, 2, 2, 2$ rakamlarının tamamı birer kez kullanılarak $6$ basamaklı kaç farklı doğal sayı yazılabilir?',
   '{"options":["50","60","40","30","120"],"correctIndex":0}'::jsonb,
   'Tekrarlı permütasyonla $0$ dahil tüm dizilişlerin sayısı $\dfrac{6!}{2! \cdot 3!} = \dfrac{720}{12} = 60$''tır. Ancak $6$ rakamdan biri olan $0$ başa gelemez; başa gelemeyen $1$ adet $0$ dışındaki $5$ rakamdan biri başa gelebileceğinden geçerli dizilişler tümünün $\dfrac{5}{6}$''sıdır: $60 \cdot \dfrac{5}{6} = 50$ farklı sayı yazılabilir.',
   'B şıkkı (60), $0$''ın en soldaki basamağa gelmesi durumunda sayının $6$ basamaklı olmayacağını unutup tüm permütasyonları ($60$) işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-10-014 · doğrulandı
  ('c303a8c5-d1b3-569f-a51c-2db9ddf3e6e4'::uuid, 'Matematik & Geometri', 'Permütasyon, Kombinasyon ve Olasılık', 'multiple_choice', 2,
   'Kareli bir düzlemde $A$ noktasında bulunan bir hareketli, yalnızca sağa ve yukarı doğru birim adımlar atarak $A$''nın $4$ birim sağında ve $3$ birim yukarısında bulunan $B$ noktasına ulaşmak istemektedir.
Buna göre $A$''dan $B$''ye en kısa yoldan kaç farklı biçimde gidebilir?',
   '{"options":["12","21","28","42","35"],"correctIndex":4}'::jsonb,
   'En kısa yol için toplam $4$ kez sağa (S) ve $3$ kez yukarı (Y) olmak üzere $7$ adım atılmalıdır. `SSSSYYY` harflerinin farklı sıralanışı tekrarlı permütasyonla $\dfrac{7!}{4! \cdot 3!} = \binom{7}{3} = \dfrac{7 \cdot 6 \cdot 5}{6} = 35$ bulunur.',
   'A şıkkı (12), adım sayılarını permütasyon yerine doğrudan çarpıp $4 \cdot 3 = 12$ bulan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-10-015 · doğrulandı
  ('ec7c3e40-c6b3-5900-9965-0d6a259a04b1'::uuid, 'Matematik & Geometri', 'Permütasyon, Kombinasyon ve Olasılık', 'multiple_choice', 1,
   '$n \ge 2$ bir tam sayı olmak üzere
$$\binom{n}{2} + \binom{n}{1} = 21$$
eşitliğini sağlayan $n$ değeri kaçtır?',
   '{"options":["4","5","6","7","8"],"correctIndex":2}'::jsonb,
   'Kombinasyon açılımları yazılır: $\dfrac{n(n - 1)}{2} + n = 21 \Rightarrow \dfrac{n^2 - n + 2n}{2} = 21 \Rightarrow n(n + 1) = 42$ (veya Pascal özdeşliğinden $\binom{n + 1}{2} = 21$). Ardışık iki pozitif tam sayının çarpımı $6 \cdot 7 = 42$ olduğundan $n = 6$ bulunur.',
   'D şıkkı (7), $\binom{n + 1}{2} = 21$ özdeşliğinden $n + 1 = 7$ bulup $n$ yerine $7$''yi işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-10-016 · doğrulandı
  ('2252e027-c1bd-5f5a-b6e5-c64dcf131a4c'::uuid, 'Matematik & Geometri', 'Permütasyon, Kombinasyon ve Olasılık', 'multiple_choice', 2,
   '$7$ kişilik bir gruptan $3$ kişilik bir temsil ekibi seçilecektir.
Gruptaki Ali ve Veli aynı ekipte birlikte bulunmak istemediklerine göre bu ekip kaç farklı biçimde seçilebilir?',
   '{"options":["25","30","32","35","20"],"correctIndex":1}'::jsonb,
   'Hiçbir koşul olmadan $7$ kişiden $3$ kişi $\binom{7}{3} = 35$ farklı biçimde seçilir. Ali ve Veli''nin ikisinin de aynı ekipte bulunduğu istenmeyen durumlarda kalan $5$ kişiden $1$ kişi $\binom{5}{1} = 5$ farklı biçimde seçilir. Tüm durumlardan istenmeyenler çıkarılırsa $35 - 5 = 30$ farklı ekip seçilebilir.',
   'D şıkkı (35), kısıtı hesaba katmayan adayı; E şıkkı (20) ise ikisini de tamamen gruptan çıkarıp $\binom{5}{3} = 10$ veya ikisinin tek başına olma sayısını yanlış toplayanları yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-10-017 · doğrulandı
  ('e11b464e-676e-5abb-a47b-827a74ad38e6'::uuid, 'Matematik & Geometri', 'Permütasyon, Kombinasyon ve Olasılık', 'multiple_choice', 2,
   'Birbirine paralel $4$ yatay doğru ile birbirine paralel $5$ dikey doğrunun kesişmesiyle en fazla kaç tane paralelkenar oluşur?',
   '{"options":["20","36","40","60","120"],"correctIndex":3}'::jsonb,
   'Bir paralelkenar oluşturmak için $2$ tane yatay doğru ve $2$ tane dikey doğru seçmek gerekir. $4$ yatay doğrudan $2$''si $\binom{4}{2} = 6$ farklı biçimde, $5$ dikey doğrudan $2$''si $\binom{5}{2} = 10$ farklı biçimde seçilir. Toplam $6 \cdot 10 = 60$ paralelkenar oluşur.',
   'A şıkkı (20), doğru çiftleri yerine doğrudan $4 \cdot 5 = 20$ kesişim noktasını (veya $4 + 5$) çarpan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-10-018 · doğrulandı
  ('58272890-83ac-500b-8786-7fad5b01250e'::uuid, 'Matematik & Geometri', 'Permütasyon, Kombinasyon ve Olasılık', 'multiple_choice', 2,
   'Hilesiz bir madeni para art arda $3$ kez atıldığında en az $2$ kez tura gelme olasılığı kaçtır?',
   '{"options":["$\\dfrac{1}{4}$","$\\dfrac{3}{8}$","$\\dfrac{1}{2}$","$\\dfrac{5}{8}$","$\\dfrac{3}{4}$"],"correctIndex":2}'::jsonb,
   '$3$ para atışında örnek uzay $2^3 = 8$ elemandan oluşur. En az $2$ tura gelmesi, $2$ tura ($\binom{3}{2} = 3$ durum: TTY, TYT, YTT) veya $3$ tura ($\binom{3}{3} = 1$ durum: TTT) gelmesi demektir. İstenen durum sayısı $3 + 1 = 4$ olduğundan olasılık $\dfrac{4}{8} = \dfrac{1}{2}$ bulunur.',
   'B şıkkı ($\frac{3}{8}$), "en az 2 tura" ifadesini "tam 2 tura" gibi yorumlayıp $3$ tura durumunu (TTT) eklemeyi unutan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-10-019 · doğrulandı
  ('d1b69bf7-0e45-536b-948c-ba5a22063def'::uuid, 'Matematik & Geometri', 'Permütasyon, Kombinasyon ve Olasılık', 'multiple_choice', 1,
   '$$A = \{1, 2, 3, 4, 5, 6, 7, 8, 9\}$$
kümesinden rastgele seçilen bir sayının asal sayı olma olasılığı kaçtır?',
   '{"options":["$\\dfrac{4}{9}$","$\\dfrac{1}{3}$","$\\dfrac{5}{9}$","$\\dfrac{2}{9}$","$\\dfrac{1}{2}$"],"correctIndex":0}'::jsonb,
   'Kümedeki $9$ elemandan asal olanlar $2, 3, 5, 7$ olmak üzere $4$ tanedir ($1$ asal sayı değildir). Bu nedenle istenen olasılık $\dfrac{4}{9}$ bulunur.',
   'C şıkkı ($\frac{5}{9}$), en küçük asal sayının $2$ olduğunu unutup $1$''i de asal sayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-10-020 · doğrulandı
  ('cf3ad85d-ce4c-5926-8c57-13b48d383b82'::uuid, 'Matematik & Geometri', 'Permütasyon, Kombinasyon ve Olasılık', 'multiple_choice', 2,
   'İki hilesiz zar birlikte atıldığında üst yüze gelen sayıların çarpımının çift sayı olma olasılığı kaçtır?',
   '{"options":["$\\dfrac{1}{4}$","$\\dfrac{1}{2}$","$\\dfrac{2}{3}$","$\\dfrac{5}{6}$","$\\dfrac{3}{4}$"],"correctIndex":4}'::jsonb,
   'İki sayının çarpımının tek olabilmesi için her iki sayının da tek olması gerekir; diğer tüm durumlarda çarpım çifttir. Bir zarda tek gelme olasılığı $\dfrac{3}{6} = \dfrac{1}{2}$ olduğundan ikisinin de tek gelme olasılığı $\dfrac{1}{2} \cdot \dfrac{1}{2} = \dfrac{1}{4}$''tür. Tümleyeninden çarpımın çift olma olasılığı $1 - \dfrac{1}{4} = \dfrac{3}{4}$ bulunur.',
   'B şıkkı ($\frac{1}{2}$), zarda çift ve tek sayıların eşit sayıda olmasından hareketle çarpımlarının da yarı yarıya çift çıkacağını sanan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-10-021 · doğrulandı
  ('865217bc-8d1d-5845-833f-ddfe5573e7a8'::uuid, 'Matematik & Geometri', 'Permütasyon, Kombinasyon ve Olasılık', 'multiple_choice', 3,
   'A torbasında $3$ kırmızı, $2$ beyaz; B torbasında $4$ kırmızı, $1$ beyaz bilye vardır.
A torbasından rastgele $1$ bilye çekilip rengine bakılmadan B torbasına atılıyor, ardından B torbasından rastgele $1$ bilye çekiliyor.
Buna göre B torbasından çekilen bilyenin kırmızı olma olasılığı kaçtır?',
   '{"options":["$\\dfrac{2}{5}$","$\\dfrac{3}{5}$","$\\dfrac{4}{5}$","$\\dfrac{23}{30}$","$\\dfrac{7}{10}$"],"correctIndex":3}'::jsonb,
   'İki ayrık durum incelenir:
1. A''dan kırmızı çekilip B''ye atılırsa (olasılık $\dfrac{3}{5}$), B''de $5$ kırmızı, $1$ beyaz toplam $6$ bilye olur ve kırmızı çekme olasılığı $\dfrac{5}{6}$''dır.
2. A''dan beyaz çekilip B''ye atılırsa (olasılık $\dfrac{2}{5}$), B''de $4$ kırmızı, $2$ beyaz toplam $6$ bilye olur ve kırmızı çekme olasılığı $\dfrac{4}{6}$''dır.
Toplam olasılık $\dfrac{3}{5} \cdot \dfrac{5}{6} + \dfrac{2}{5} \cdot \dfrac{4}{6} = \dfrac{15 + 8}{30} = \dfrac{23}{30}$ bulunur.',
   'C şıkkı ($\frac{4}{5}$), B torbasının başlangıçtaki kırmızı olasılığını kullanıp A''dan gelen bilyenin B''deki dağılımı değiştirdiğini hesaba katmayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-10-022 · doğrulandı
  ('dd9bfc66-a5fa-569b-807d-65db653b6386'::uuid, 'Matematik & Geometri', 'Permütasyon, Kombinasyon ve Olasılık', 'multiple_choice', 3,
   '$3$ kız ve $3$ erkek öğrenci düz bir sıraya rastgele dizilecektir.
Buna göre kız öğrencilerin tamamının yan yana olma olasılığı kaçtır?',
   '{"options":["$\\dfrac{1}{20}$","$\\dfrac{1}{5}$","$\\dfrac{1}{10}$","$\\dfrac{1}{30}$","$\\dfrac{2}{5}$"],"correctIndex":1}'::jsonb,
   '$6$ kişinin tüm sıralanış sayısı $6! = 720$''dir. Kızların yan yana olması için $3$ kız tek paket kabul edilir; $3$ erkekle birlikte $4$ nesne $4!$ biçimde sıralanır, kızlar da kendi içinde $3!$ yer değiştirir: $4! \cdot 3! = 24 \cdot 6 = 144$. Olasılık $\dfrac{144}{720} = \dfrac{1}{5}$ bulunur.',
   'A şıkkı ($\frac{1}{20}$), kızların kendi arasındaki $3! = 6$ yer değişimini unutup yalnızca $\dfrac{4!}{6!} = \dfrac{1}{30}$ bulan veya paydada yanlış sadeleştirme yapan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-10-023 · doğrulandı
  ('d5c629dd-b0bb-5af9-825b-6eecbb81970a'::uuid, 'Matematik & Geometri', 'Permütasyon, Kombinasyon ve Olasılık', 'multiple_choice', 1,
   'Bir dolapta $4$ farklı gömlek, $5$ farklı pantolon ve $3$ farklı çift ayakkabı bulunmaktadır.
Bir gömlek, bir pantolon ve bir çift ayakkabıdan oluşan bir kombin kaç farklı biçimde seçilebilir?',
   '{"options":["60","48","36","24","12"],"correctIndex":0}'::jsonb,
   'Çarpma yoluyla sayma ilkesine göre her türden birer parça seçimi birbirinden bağımsızdır: $4 \cdot 5 \cdot 3 = 60$ farklı kombin oluşturulabilir.',
   'E şıkkı ($12$), seçimler bağımsız olarak aynı anda yapıldığı hâlde çarpmak yerine toplama ($4 + 5 + 3 = 12$) yapan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-10-024 · doğrulandı
  ('afe384bd-f9ea-53ad-9ebe-2f3ee9815d39'::uuid, 'Matematik & Geometri', 'Permütasyon, Kombinasyon ve Olasılık', 'multiple_choice', 1,
   '$9$ kişilik bir basketbol aday kadrosundan $5$ kişilik bir maç kadrosu oluşturulacaktır. Takımın kaptanı Ali kadroda kesinlikle yer alacak, sakatlığı bulunan Burak ise kadroda yer almayacaktır.
Buna göre bu $5$ kişilik maç kadrosu kaç farklı biçimde seçilebilir?',
   '{"options":["15","20","21","35","56"],"correctIndex":3}'::jsonb,
   'Ali kesinlikle seçileceğinden kadroda kalan $4$ kişilik yer için seçim yapılmalıdır. Burak da elendiğinden geriye kalan $9 - 2 = 7$ kişi arasından seçim yapılır:
$$\binom{7}{4} = \binom{7}{3} = \frac{7 \cdot 6 \cdot 5}{3 \cdot 2 \cdot 1} = 35$$
farklı kadro oluşturulabilir.',
   'C şıkkı ($21$), Ali''nin seçilecek $5$ kişilik kontenjandan $1$ kişilik yeri doldurduğunu unutup kalan $7$ kişiden $5$ kişi ($\binom{7}{5} = 21$) seçen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-10-025 · doğrulandı
  ('e4ee3a52-7db1-5a81-b9ea-145a0929e2c5'::uuid, 'Matematik & Geometri', 'Permütasyon, Kombinasyon ve Olasılık', 'multiple_choice', 2,
   'Aralarında Zeynep ve Kerem''in de bulunduğu $5$ arkadaş düz bir sıraya yan yana oturacaktır.
Buna göre Zeynep ile Kerem''in yan yana OLMADIĞI kaç farklı oturma düzeni oluşturulabilir?',
   '{"options":["48","72","84","96","120"],"correctIndex":1}'::jsonb,
   'Tüm oturma düzenlerinden ($5! = 120$), Zeynep ile Kerem''in yan yana olduğu düzenler çıkarılır. İkisi tek grup sayıldığında $4! \cdot 2! = 24 \cdot 2 = 48$ durumda yan yana olurlar.
Yan yana olmadıkları durum sayısı $120 - 48 = 72$ bulunur.',
   'A şıkkı ($48$), sorudaki "yan yana olmadığı" ifadesi yerine ikisinin yan yana geldiği durumların sayısını işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-10-026 · doğrulandı
  ('62358a00-223d-5492-b237-52d285b78632'::uuid, 'Matematik & Geometri', 'Permütasyon, Kombinasyon ve Olasılık', 'multiple_choice', 2,
   '$$A = \{0, 1, 2, 3, 4, 5\}$$
kümesinin elemanları kullanılarak rakamları birbirinden farklı üç basamaklı kaç farklı çift doğal sayı yazılabilir?',
   '{"options":["48","52","60","64","72"],"correctIndex":1}'::jsonb,
   '$0$ rakamı yüzler basamağına gelemeyeceğinden birler basamağının $0$ olduğu ve olmadığı durumlar ayrı incelenir:
- Birler basamağı $0$ ise: Yüzler basamağı için kalan $5$ rakamdan biri, onlar basamağı için kalan $4$ rakamdan biri seçilir: $5 \cdot 4 \cdot 1 = 20$ sayı.
- Birler basamağı $2$ veya $4$ ise ($2$ durum): Yüzler basamağına $0$ ve birler basamağındaki rakam gelemeyeceği için $4$ seçenek, onlar basamağına ise $0$ dahil kalan $4$ rakamdan biri gelir: $4 \cdot 4 \cdot 2 = 32$ sayı.
Toplam $20 + 32 = 52$ farklı çift doğal sayı yazılabilir.',
   'C şıkkı ($60$), üç durumun tamamında $0$''ın başa gelememesi ayrımını yapmadan $5 \cdot 4 \cdot 3 = 60$ biçiminde tek adımda çarpan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-10-027 · doğrulandı
  ('a34c58b5-f0e2-5092-9a89-cd14ad243b86'::uuid, 'Matematik & Geometri', 'Permütasyon, Kombinasyon ve Olasılık', 'multiple_choice', 2,
   '`KARAKTER` kelimesindeki tüm harflerin yerleri değiştirilerek oluşturulan $8$ harfli anlamlı ya da anlamsız kelimelerin kaç tanesi `T` harfi ile başlar ve `E` harfi ile biter?',
   '{"options":["45","60","90","180","360"],"correctIndex":2}'::jsonb,
   'Başta `T` ve sonda `E` harfleri sabitlendiğinde, ortaya geriye kalan `K, A, R, A, K, R` harfleri ($6$ harf: $2$ `K`, $2$ `A`, $2$ `R`) sıralanmalıdır. Tekrarlı permütasyonla:
$$\frac{6!}{2! \cdot 2! \cdot 2!} = \frac{720}{8} = 90$$
farklı kelime yazılabilir.',
   'D şıkkı ($180$), başa `T` ve sona `E` sabitlemek yerine ikisinin uçlarda yer değiştirebileceğini düşünerek sonucu $2$ ile çarpan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-10-028 · doğrulandı
  ('21e3d07d-831c-592e-be3f-70721f55362c'::uuid, 'Matematik & Geometri', 'Permütasyon, Kombinasyon ve Olasılık', 'multiple_choice', 3,
   'Aynı düzlemde bulunan birbirine paralel iki doğrudan $d_1$ doğrusu üzerinde $4$ nokta, $d_2$ doğrusu üzerinde $5$ nokta işaretlenmiştir.
Köşeleri bu $9$ noktadan seçilen kaç farklı üçgen çizilebilir?',
   '{"options":["70","74","80","84","90"],"correctIndex":0}'::jsonb,
   '$9$ noktadan herhangi $3$''ü $\binom{9}{3} = \dfrac{9 \cdot 8 \cdot 7}{6} = 84$ farklı biçimde seçilebilir. Ancak aynı doğru üzerindeki $3$ nokta doğrusal olduğundan üçgen oluşturmaz. $d_1$''den seçilen $\binom{4}{3} = 4$ ve $d_2$''den seçilen $\binom{5}{3} = 10$ üçlü çıkarılırsa:
$$84 - 4 - 10 = 70$$
farklı üçgen çizilebilir.',
   'D şıkkı ($84$), tüm noktaların $\binom{9}{3} = 84$ üçlüsünü alıp doğrusal üçlüleri çıkarmayı unutan adayı; C şıkkı ($80$) ise yalnızca $4$''lü doğrudaki $\binom{4}{3} = 4$ üçlüyü çıkaranları yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-10-029 · doğrulandı
  ('571fdbd4-adb9-52a5-85b6-7d9de048217c'::uuid, 'Matematik & Geometri', 'Permütasyon, Kombinasyon ve Olasılık', 'multiple_choice', 1,
   '$1$''den $12$''ye kadar (sınırlar dahil) numaralandırılmış özdeş $12$ kart bir torbaya atılıyor.
Torbadan rastgele çekilen bir kartın üzerindeki sayının $2$ veya $3$ ile tam bölünebilme olasılığı kaçtır?',
   '{"options":["$\\dfrac{1}{2}$","$\\dfrac{2}{3}$","$\\dfrac{3}{4}$","$\\dfrac{5}{6}$","$\\dfrac{7}{12}$"],"correctIndex":1}'::jsonb,
   '$1$''den $12$''ye kadar $2$ ile bölünen sayılar $\{2, 4, 6, 8, 10, 12\}$ ($6$ adet), $3$ ile bölünen sayılar $\{3, 6, 9, 12\}$ ($4$ adet) ve her ikisine birden ($6$ ile) bölünen sayılar $\{6, 12\}$ ($2$ adet) olmak üzere istenen eleman sayısı $6 + 4 - 2 = 8$''dir. Olasılık $\dfrac{8}{12} = \dfrac{2}{3}$ bulunur.',
   'D şıkkı ($\frac{5}{6}$), $6$ ve $12$ sayılarını iki kez sayıp ortak katları çıkarmayı unutan ($6 + 4 = 10 \Rightarrow \dfrac{10}{12}$) adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-10-030 · doğrulandı
  ('4fa0a401-8a22-5bfb-b23e-9b8438cc847c'::uuid, 'Matematik & Geometri', 'Permütasyon, Kombinasyon ve Olasılık', 'multiple_choice', 2,
   '$3$ evli çiftin bulunduğu $6$ kişilik bir topluluktan rastgele seçilen $2$ kişinin birbiriyle evli OLMAMA olasılığı kaçtır?',
   '{"options":["$\\dfrac{1}{5}$","$\\dfrac{2}{5}$","$\\dfrac{3}{5}$","$\\dfrac{4}{5}$","$\\dfrac{5}{6}$"],"correctIndex":3}'::jsonb,
   '$6$ kişiden $2$ kişi $\binom{6}{2} = 15$ farklı biçimde seçilir. Seçilen iki kişinin birbiriyle evli olması $3$ çift arasından $3$ farklı durumdur (olasılık $\dfrac{3}{15} = \dfrac{1}{5}$). Dolayısıyla birbiriyle evli olmama olasılığı $1 - \dfrac{1}{5} = \dfrac{4}{5}$ bulunur.',
   'A şıkkı ($\frac{1}{5}$), sorudaki olumsuz eki atlayıp seçilen ikilinin evli olma olasılığını işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-10-031 · doğrulandı
  ('ab0c94a9-118b-5a8a-b67c-f9fa5d14d472'::uuid, 'Matematik & Geometri', 'Permütasyon, Kombinasyon ve Olasılık', 'multiple_choice', 2,
   '$3$ erkek ve $3$ kız öğrenci, hiçbir iki kız öğrenci yan yana gelmemek şartıyla düz bir sıraya kaç farklı biçimde oturabilir?',
   '{"options":["36","72","108","144","288"],"correctIndex":3}'::jsonb,
   'Önce $3$ erkek öğrenci $3! = 6$ farklı biçimde sıralanır. Erkeklerin sağında, solunda ve aralarında kızların yerleşebileceği $4$ boşluk oluşur (`_ E _ E _ E _`). Bu $4$ boşluğa $3$ kız öğrenci $P(4, 3) = 4 \cdot 3 \cdot 2 = 24$ farklı biçimde oturabilir. Toplam oturma düzeni $6 \cdot 24 = 144$''tür.',
   'B şıkkı ($72$), $4$ boşluk yerine yalnızca dönüşümlü `K E K E K E` ve `E K E K E K` dizilimlerini ($3! \cdot 3! \cdot 2 = 72$) sayıp araya iki erkek gelebileceği durumları unutan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-10-032 · doğrulandı
  ('9897a7f1-c857-5aac-b2f7-aed31ddf8fe1'::uuid, 'Matematik & Geometri', 'Permütasyon, Kombinasyon ve Olasılık', 'multiple_choice', 1,
   'Hilesiz bir madeni para art arda $3$ kez havaya atıldığında en az bir kez tura gelme olasılığı kaçtır?',
   '{"options":["$\\dfrac{1}{8}$","$\\dfrac{3}{8}$","$\\dfrac{7}{8}$","$\\dfrac{1}{2}$","$\\dfrac{3}{4}$"],"correctIndex":2}'::jsonb,
   'Toplam örnek uzay $2^3 = 8$ durumdan oluşur. "En az bir kez tura gelmesi" olayının tümleyeni, üç atışın tamamının yazı (`Y-Y-Y`) gelmesidir; bunun olasılığı $\dfrac{1}{8}$''dir. İstenen olasılık $1 - \dfrac{1}{8} = \dfrac{7}{8}$ bulunur.',
   'B şıkkı ($\frac{3}{8}$), "en az bir tura" yerine "tam olarak bir tura" (`T-Y-Y`, `Y-T-Y`, `Y-Y-T`) olasılığını hesaplayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-10-033 · doğrulandı
  ('92a40acb-e667-56f2-867e-780694c694b0'::uuid, 'Matematik & Geometri', 'Permütasyon, Kombinasyon ve Olasılık', 'multiple_choice', 2,
   'Anne, baba ve $5$ çocuktan oluşan $7$ kişilik bir aile yuvarlak bir masa etrafında, anne ile baba arasında yalnızca en küçük çocuk oturmak koşuluyla kaç farklı biçimde oturabilir?',
   '{"options":["24","48","72","96","120"],"correctIndex":1}'::jsonb,
   'Anne, en küçük çocuk ve baba birbirinden ayrılmadan $3$''lü tek bir blok oluşturur (`Anne - EnKüçükÇocuk - Baba` veya `Baba - EnKüçükÇocuk - Anne` olmak üzere $2$ iç sıralama). Bu blok ve kalan $4$ çocuk olmak üzere toplam $5$ öge yuvarlak masa etrafında $(5 - 1)! = 4! = 24$ şekilde dizilir. Toplam oturma biçimi $24 \cdot 2 = 48$''dir.',
   'A şıkkı ($24$), en küçük çocuğun ortada olduğu $2$ farklı anne-baba yönünü çarpmayı unutan adayı; E şıkkı ($120$) ise blok içindeki $3$ kişiyi serbestçe $3!$ ile çarpanları yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-10-034 · doğrulandı
  ('0ff53c23-0192-5963-9c41-e5b9c3e45c8c'::uuid, 'Matematik & Geometri', 'Permütasyon, Kombinasyon ve Olasılık', 'multiple_choice', 3,
   'Dik koordinat düzleminde $A(0, 0)$ noktasından hareket eden bir robot, her adımda yalnızca $1$ birim sağa veya $1$ birim yukarı ilerleyerek $B(5, 4)$ noktasına ulaşacaktır.
Robotun yol üzerinde bulunan $C(2, 2)$ noktasından geçmeden $A$''dan $B$''ye gidebileceği kaç farklı en kısa yol vardır?',
   '{"options":["36","48","54","60","66"],"correctIndex":4}'::jsonb,
   '$A(0, 0)$''dan $B(5, 4)$''e giden tüm en kısa yollar $5$ sağ ve $4$ yukarı adımdan oluşur: $\dfrac{9!}{5! \cdot 4!} = \binom{9}{4} = 126$ yol vardır.
$C(2, 2)$ noktasından geçen yollar iki parçada hesaplanır:
- $A(0, 0) \to C(2, 2)$ ($2$ sağ, $2$ yukarı): $\binom{4}{2} = 6$ yol.
- $C(2, 2) \to B(5, 4)$ ($3$ sağ, $2$ yukarı): $\binom{5}{2} = 10$ yol.
$C$''den geçen toplam yol sayısı $6 \cdot 10 = 60$''tır. $C$''den geçmeyen yolların sayısı $126 - 60 = 66$ bulunur.',
   'D şıkkı ($60$), sorunun "$C$''den geçmeden" dediğini gözden kaçırıp $C$''den geçen yolların sayısını ($60$) işaretleyen adayların düştüğü en güçlü tuzaktır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-10-035 · doğrulandı
  ('80c5efdb-35d0-5641-832b-1eb90b04f204'::uuid, 'Matematik & Geometri', 'Permütasyon, Kombinasyon ve Olasılık', 'multiple_choice', 3,
   '$4$ kız ve $3$ erkek öğrenciden oluşan $7$ kişilik bir gruptan rastgele $3$ kişilik bir nöbet ekibi seçiliyor.
Seçilen ekipte en az $1$ kız öğrenci bulunduğu bilindiğine göre, ekipteki kız sayısının erkek sayısından fazla olma olasılığı kaçtır?',
   '{"options":["$\\dfrac{9}{17}$","$\\dfrac{18}{35}$","$\\dfrac{22}{35}$","$\\dfrac{12}{17}$","$\\dfrac{11}{17}$"],"correctIndex":4}'::jsonb,
   'Koşullu olasılık gereği örnek uzay en az $1$ kız bulunan $3$ kişilik tüm ekiplerdir: tüm $\binom{7}{3} = 35$ ekipten hiç kız bulunmayan $\binom{3}{3} = 1$ ekip çıkarılırsa $35 - 1 = 34$ durum kalır.
Kız sayısının erkek sayısından fazla olması ($2$ kız $1$ erkek veya $3$ kız $0$ erkek):
$$\binom{4}{2}\binom{3}{1} + \binom{4}{3} = 6 \cdot 3 + 4 = 22$$
İstenen olasılık $\dfrac{22}{34} = \dfrac{11}{17}$ bulunur.',
   'C şıkkı ($\frac{22}{35}$), "en az $1$ kız bulunduğu bilindiğine göre" koşullu olasılık şartını atlayıp tüm $35$ ekip üzerinden oranlayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-10-036 · şekilli · doğrulandı
  ('19622c51-82c5-517b-a18a-69680c06fcc1'::uuid, 'Matematik & Geometri', 'Permütasyon, Kombinasyon ve Olasılık', 'multiple_choice', 1,
   'Şekildeki çember üzerinde birbirinden farklı $6$ nokta ($A, B, C, D, E, F$) işaretlenmiştir.
Köşeleri bu noktalardan oluşan kaç farklı üçgen çizilebilir?',
   '{"options":["20","12","15","24","30"],"correctIndex":0}'::jsonb,
   'Bir çember üzerindeki herhangi üç nokta hiçbir zaman doğrusal değildir. Dolayısıyla $6$ noktadan seçilen her $3$ nokta bir üçgen oluşturur:
$$\binom{6}{3} = \frac{6 \cdot 5 \cdot 4}{3 \cdot 2 \cdot 1} = 20$$
farklı üçgen çizilebilir.',
   'C şıkkı ($15$), üçgen yerine iki nokta seçerek oluşturulan doğru/kiriş sayısını ($\binom{6}{2} = 15$) hesaplayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 260 260" width="260" height="260" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><circle cx="130" cy="130" r="100"/><circle cx="230" cy="130" r="3" fill="currentColor" stroke="none"/><text x="244" y="134.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><circle cx="180" cy="43.4" r="3" fill="currentColor" stroke="none"/><text x="190.5" y="37.8" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><circle cx="80" cy="43.4" r="3" fill="currentColor" stroke="none"/><text x="69.5" y="37.8" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><circle cx="30" cy="130" r="3" fill="currentColor" stroke="none"/><text x="16" y="134.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text><circle cx="80" cy="216.6" r="3" fill="currentColor" stroke="none"/><text x="69.5" y="232" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">E</text><circle cx="180" cy="216.6" r="3" fill="currentColor" stroke="none"/><text x="190.5" y="232" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">F</text></svg>', true),
  -- mat-10-037 · şekilli · doğrulandı
  ('df1add51-51af-594e-a370-06dcf0fd495e'::uuid, 'Matematik & Geometri', 'Permütasyon, Kombinasyon ve Olasılık', 'multiple_choice', 2,
   'Şekilde birbirine paralel $4$ yatay ve bunları dik kesen $5$ dikey doğrunun oluşturduğu ızgara verilmiştir.
Bu doğrularla sınırlanan kaç farklı dikdörtgen vardır?',
   '{"options":["30","60","45","72","90"],"correctIndex":1}'::jsonb,
   'Bir dikdörtgen oluşturmak için $4$ yatay doğrudandan $2$ tane, $5$ dikey doğrudan da $2$ tane seçilmelidir:
$$\binom{4}{2} \cdot \binom{5}{2} = 6 \cdot 10 = 60$$
farklı dikdörtgen vardır.',
   'A şıkkı ($30$), çizgi sayıları yerine ızgaradaki küçük birim kare sayısı olan $3 \cdot 4 = 12$''yi ya da $1 \times k$ biçimli eksik sayımları düşünen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 315.6 260" width="315.6" height="260" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><line x1="30" y1="213.3" x2="285.6" y2="213.3"/><line x1="30" y1="157.8" x2="285.6" y2="157.8"/><line x1="30" y1="102.2" x2="285.6" y2="102.2"/><line x1="30" y1="46.7" x2="285.6" y2="46.7"/><line x1="46.7" y1="230" x2="46.7" y2="30"/><line x1="102.2" y1="230" x2="102.2" y2="30"/><line x1="157.8" y1="230" x2="157.8" y2="30"/><line x1="213.3" y1="230" x2="213.3" y2="30"/><line x1="268.9" y1="230" x2="268.9" y2="30"/></svg>', true),
  -- mat-10-038 · şekilli · doğrulandı
  ('652df99d-8728-5ba4-84c0-e707831b7aa1'::uuid, 'Matematik & Geometri', 'Permütasyon, Kombinasyon ve Olasılık', 'multiple_choice', 2,
   'Merkez açıları aşağıdaki daire grafiğinde verilen dört renkli şans çarkı bir kez döndürülüp durduğunda, ibrenin Kırmızı veya Mavi bölge üzerinde durma olasılığı kaçtır?',
   '{"options":["$\\dfrac{3}{20}$","$\\dfrac{1}{4}$","$\\dfrac{2}{5}$","$\\dfrac{3}{5}$","$\\dfrac{3}{4}$"],"correctIndex":2}'::jsonb,
   'Kırmızı ($54^\circ$) ve Mavi ($90^\circ$) bölgelerin toplam merkez açısı $54^\circ + 90^\circ = 144^\circ$''dir. Çarkın tamamı $360^\circ$ olduğundan istenen olasılık:
$$\frac{144}{360} = \frac{2}{5}$$
olarak bulunur.',
   'D şıkkı ($\frac{3}{5}$), Sarı ve Yeşil dilimlerin olasılığını ($1 - \frac{2}{5} = \frac{3}{5}$) bulan; B şıkkı ($\frac{1}{4}$) ise yalnızca Mavi ($90^\circ$) dilimi hesaplayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 335.4 202.5" width="335.4" height="202.5" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><g transform="translate(71 0)"><path d="M95 99 L95 14 A85 85 0 0 1 163.8 49 Z" fill="currentColor" fill-opacity="0.08"/><line x1="130.9" y1="28.6" x2="137.2" y2="16.1" stroke-width="1"/><text x="139" y="16.8" fill="currentColor" stroke="none" text-anchor="start" font-size="12">Kırmızı (54°)</text><path d="M95 99 L163.8 49 A85 85 0 0 1 145 167.8 Z" fill="currentColor" fill-opacity="0.3"/><line x1="173" y1="111.4" x2="186.9" y2="113.5" stroke-width="1"/><text x="190.8" y="118.4" fill="currentColor" stroke="none" text-anchor="start" font-size="12">Mavi (90°)</text><path d="M95 99 L145 167.8 A85 85 0 0 1 14.2 125.3 Z" fill="currentColor" fill-opacity="0.16"/><line x1="70.6" y1="174.1" x2="66.3" y2="187.4" stroke-width="1"/><text x="65" y="195.5" fill="currentColor" stroke="none" text-anchor="end" font-size="12">Sarı (108°)</text><path d="M95 99 L14.2 125.3 A85 85 0 0 1 95 14 Z" fill="currentColor" fill-opacity="0.42"/><line x1="31.1" y1="52.6" x2="19.8" y2="44.3" stroke-width="1"/><text x="16.5" y="46.2" fill="currentColor" stroke="none" text-anchor="end" font-size="12">Yeşil (108°)</text></g></svg>', true),
  -- mat-10-039 · şekilli · doğrulandı
  ('4bab903d-2b65-540a-82e6-3db5a4d71181'::uuid, 'Matematik & Geometri', 'Permütasyon, Kombinasyon ve Olasılık', 'multiple_choice', 2,
   'Şekildeki $4 \times 2$''lik birim kareli ızgaranın $A$ köşesinden hareket eden bir hareketli, çizgiler boyunca yalnızca sağa ve yukarı ilerleyerek $B$ köşesine en kısa yoldan kaç farklı biçimde ulaşabilir?',
   '{"options":["8","10","12","15","20"],"correctIndex":3}'::jsonb,
   '$A$''dan $B$''ye gitmek için toplam $4$ sağ ve $2$ yukarı adım (toplam $6$ adım) atılmalıdır. Tekrarlı permütasyon ile:
$$\frac{6!}{4! \cdot 2!} = \binom{6}{2} = \frac{6 \cdot 5}{2} = 15$$
farklı en kısa yol vardır.',
   'A şıkkı ($8$), yatay ve dikey birim kare sayılarını çarpan ($4 \cdot 2 = 8$); E şıkkı ($20$) ise adım sayısını $6$ yerine yanlışlıkla farklı kombinasyonla hesaplayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 340 200" width="340" height="200" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><line x1="30" y1="170" x2="310" y2="170"/><line x1="30" y1="100" x2="310" y2="100"/><line x1="30" y1="30" x2="310" y2="30"/><line x1="30" y1="170" x2="30" y2="30"/><line x1="100" y1="170" x2="100" y2="30"/><line x1="170" y1="170" x2="170" y2="30"/><line x1="240" y1="170" x2="240" y2="30"/><line x1="310" y1="170" x2="310" y2="30"/><circle cx="30" cy="170" r="3" fill="currentColor" stroke="none"/><text x="19.5" y="185.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><circle cx="310" cy="30" r="3" fill="currentColor" stroke="none"/><text x="320.5" y="24.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text></svg>', true),
  -- mat-10-040 · şekilli · doğrulandı
  ('0ebcdef0-3f07-542f-987e-c89ae5157657'::uuid, 'Matematik & Geometri', 'Permütasyon, Kombinasyon ve Olasılık', 'multiple_choice', 3,
   '$40$ kişilik bir topluluktaki bireylerin cinsiyet ve gözlük kullanma dağılımları aşağıdaki tabloda verilmiştir.
Bu topluluktan rastgele seçilen bir kişinin kadın veya gözlüksüz olma olasılığı kaçtır?',
   '{"options":["$\\dfrac{13}{20}$","$\\dfrac{3}{5}$","$\\dfrac{7}{10}$","$\\dfrac{4}{5}$","$\\dfrac{17}{20}$"],"correctIndex":4}'::jsonb,
   'İstenen olay, Kadın kümesi ($8 + 12 = 20$) ile Gözlüksüz kümesinin ($12 + 14 = 26$) birleşimidir. İki kez sayılan Gözlüksüz Kadın ($12$) çıkarılır:
$$s(\text{Kadın} \cup \text{Gözlüksüz}) = 20 + 26 - 12 = 34$$
(veya tümleyen olan Gözlüklü Erkek ($6$) kişi $40$''tan çıkarılır: $40 - 6 = 34$). Olasılık $\dfrac{34}{40} = \dfrac{17}{20}$ bulunur.',
   'A şıkkı ($\frac{13}{20}$), yalnızca gözlüksüzler toplamını ($\frac{26}{40} = \frac{13}{20}$) işaretleyen; B şıkkı ($\frac{3}{5}$) ise yalnızca gözlüklü veya diğer ayrık iki hücreyi toplayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 239.9 92" width="239.9" height="92" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><rect x="1" y="1" width="237.9" height="30" fill="currentColor" fill-opacity="0.1" stroke="none"/><rect x="1" y="1" width="237.9" height="90" stroke-width="1.4"/><line x1="1" y1="31" x2="238.9" y2="31" stroke-width="1"/><line x1="1" y1="61" x2="238.9" y2="61" stroke-width="1"/><text x="31.9" y="20.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13" font-weight="600">Grup</text><text x="31.9" y="50.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">Kadın</text><text x="31.9" y="80.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">Erkek</text><line x1="62.7" y1="1" x2="62.7" y2="91" stroke-width="1"/><text x="104.9" y="20.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13" font-weight="600">Gözlüklü</text><text x="104.9" y="50.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">8</text><text x="104.9" y="80.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">6</text><line x1="147" y1="1" x2="147" y2="91" stroke-width="1"/><text x="193" y="20.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13" font-weight="600">Gözlüksüz</text><text x="193" y="50.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">12</text><text x="193" y="80.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">14</text></svg>', true)
on conflict (id) do update set
  lesson = excluded.lesson, topic = excluded.topic, question_type = excluded.question_type,
  difficulty = excluded.difficulty, prompt_text = excluded.prompt_text,
  interaction_data = excluded.interaction_data, explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap, exam_scopes = excluded.exam_scopes,
  education_level = excluded.education_level, figure_svg = excluded.figure_svg, is_active = true;

-- >>> 11_sayisal_mantik_ve_tablo_grafik_yorumlama.sql
-- ==========================================================================
-- KADRO SORU HAVUZU · Matematik & Geometri · Sayısal Mantık ve Tablo-Grafik Yorumlama (60 soru)
-- Kaynak: docs/soru_havuzu/matematik/11_sayisal_mantik_ve_tablo_grafik_yorumlama.md · Üretici: tools/math/compile_questions.mjs (elle düzenlemeyin)
-- Önkoşul: docs/supabase_migrations/12_math_figures.sql
-- İdempotent: soru kimlikleri sabit UUID'dir; dosya tekrar çalıştırılırsa sorular güncellenir.
-- ==========================================================================

insert into public.questions (
  id, lesson, topic, question_type, difficulty, prompt_text, interaction_data,
  explanation, distractor_trap, exam_scopes, education_level, figure_svg, is_active
) values
  -- mat-11-001 · şekilli · doğrulandı
  ('bd5ef673-2100-5b18-8a1d-6c71e3372fc0'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 1,
   'Bir kütüphaneye yılın ilk beş ayında kaydolan yeni üye sayıları grafikte verilmiştir.
Buna göre Mart ve Nisan aylarında kaydolan toplam üye sayısı, beş aylık toplam yeni üye sayısının yüzde kaçıdır?',
   '{"options":["%35","%40","%45","%48","%50"],"correctIndex":2}'::jsonb,
   'Beş ayda kaydolan toplam üye sayısı $25 + 35 + 24 + 48 + 28 = 160$''tır. Mart ve Nisan aylarındaki toplam üye sayısı $24 + 48 = 72$''dir. Yüzde oranı $\dfrac{72}{160} \cdot 100 = \dfrac{9}{20} \cdot 100 = 45$ olduğundan $\%45$ bulunur.',
   'D şıkkı (%48), yalnızca Nisan ayındaki $48$ değerini görüp yüzdeyle karıştıran ya da paydadaki $160$ toplamını eksik toplayarak farklı bir orana ulaşan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 322 242" width="322" height="242" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><text x="40" y="205.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">0</text><text x="40" y="177.5" fill="currentColor" stroke="none" text-anchor="end" font-size="11">10</text><text x="40" y="149.2" fill="currentColor" stroke="none" text-anchor="end" font-size="11">20</text><text x="40" y="120.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">30</text><text x="40" y="92.5" fill="currentColor" stroke="none" text-anchor="end" font-size="11">40</text><text x="40" y="64.2" fill="currentColor" stroke="none" text-anchor="end" font-size="11">50</text><text x="40" y="35.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">60</text><g stroke-width="0.6" stroke-opacity="0.3"><line x1="46" y1="202" x2="306" y2="202"/><line x1="46" y1="173.7" x2="306" y2="173.7"/><line x1="46" y1="145.3" x2="306" y2="145.3"/><line x1="46" y1="117" x2="306" y2="117"/><line x1="46" y1="88.7" x2="306" y2="88.7"/><line x1="46" y1="60.3" x2="306" y2="60.3"/><line x1="46" y1="32" x2="306" y2="32"/></g><line x1="46" y1="28" x2="46" y2="202"/><line x1="46" y1="202" x2="306" y2="202"/><text x="40" y="19.9" fill="currentColor" stroke="none" text-anchor="start" font-size="11">Üye</text><rect x="56.4" y="131.2" width="31.2" height="70.8" fill="currentColor" fill-opacity="0.22"/><text x="72" y="126" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">25</text><text x="72" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">Oca</text><rect x="108.4" y="102.8" width="31.2" height="99.2" fill="currentColor" fill-opacity="0.22"/><text x="124" y="97.7" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">35</text><text x="124" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">Şub</text><rect x="160.4" y="134" width="31.2" height="68" fill="currentColor" fill-opacity="0.22"/><text x="176" y="128.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">24</text><text x="176" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">Mar</text><rect x="212.4" y="66" width="31.2" height="136" fill="currentColor" fill-opacity="0.22"/><text x="228" y="60.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">48</text><text x="228" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">Nis</text><rect x="264.4" y="122.7" width="31.2" height="79.3" fill="currentColor" fill-opacity="0.22"/><text x="280" y="117.5" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">28</text><text x="280" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">May</text></svg>', true),
  -- mat-11-002 · şekilli · doğrulandı
  ('1eec02e7-67de-527b-ba91-e47e4b7ae966'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 2,
   'Bir teknoloji mağazasının dört çeyrekteki çevrimiçi ve mağaza içi satış tutarları grafikte verilmiştir.
Çevrimiçi satışların mağaza içi satışları geçtiği çeyreklerdeki toplam satış tutarı (çevrimiçi ve mağaza içi birlikte) kaç bin TL''dir?',
   '{"options":["195","110","170","180","210"],"correctIndex":0}'::jsonb,
   'Grafikte düz çizgi çevrimiçi satışları, kesikli çizgi mağaza içi satışları göstermektedir. Ç1''de $30 < 50$ ve Ç3''te $40 < 55$ olduğundan çevrimiçi satışlar geridedir. Ç2''de $45 > 40$ ve Ç4''te $65 > 45$ olduğundan bu iki çeyrek koşulu sağlar. İstenen çeyreklerdeki toplam satış $(45 + 40) + (65 + 45) = 85 + 110 = 195$ bin TL olur.',
   'B şıkkı (110), doğru çeyrekler olan Ç2 ve Ç4''ü belirledikten sonra yalnızca çevrimiçi satışları ($45 + 65 = 110$) toplayıp mağaza içi satışları toplama katmayı unutan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 282 250" width="282" height="250" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><text x="40" y="205.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">0</text><text x="40" y="181.6" fill="currentColor" stroke="none" text-anchor="end" font-size="11">10</text><text x="40" y="157.3" fill="currentColor" stroke="none" text-anchor="end" font-size="11">20</text><text x="40" y="133" fill="currentColor" stroke="none" text-anchor="end" font-size="11">30</text><text x="40" y="108.7" fill="currentColor" stroke="none" text-anchor="end" font-size="11">40</text><text x="40" y="84.4" fill="currentColor" stroke="none" text-anchor="end" font-size="11">50</text><text x="40" y="60.1" fill="currentColor" stroke="none" text-anchor="end" font-size="11">60</text><text x="40" y="35.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">70</text><g stroke-width="0.6" stroke-opacity="0.3"><line x1="46" y1="202" x2="266" y2="202"/><line x1="46" y1="177.7" x2="266" y2="177.7"/><line x1="46" y1="153.4" x2="266" y2="153.4"/><line x1="46" y1="129.1" x2="266" y2="129.1"/><line x1="46" y1="104.9" x2="266" y2="104.9"/><line x1="46" y1="80.6" x2="266" y2="80.6"/><line x1="46" y1="56.3" x2="266" y2="56.3"/><line x1="46" y1="32" x2="266" y2="32"/></g><line x1="46" y1="28" x2="46" y2="202"/><line x1="46" y1="202" x2="266" y2="202"/><text x="40" y="19.9" fill="currentColor" stroke="none" text-anchor="start" font-size="11">Bin TL</text><text x="73.5" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">Ç1</text><text x="128.5" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">Ç2</text><text x="183.5" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">Ç3</text><text x="238.5" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">Ç4</text><polyline points="73.5,129.1 128.5,92.7 183.5,104.9 238.5,44.1" stroke-width="2.2"/><circle cx="73.5" cy="129.1" r="3" fill="currentColor" stroke="none"/><circle cx="128.5" cy="92.7" r="3" fill="currentColor" stroke="none"/><circle cx="183.5" cy="104.9" r="3" fill="currentColor" stroke="none"/><circle cx="238.5" cy="44.1" r="3" fill="currentColor" stroke="none"/><polyline points="73.5,80.6 128.5,104.9 183.5,68.4 238.5,92.7" stroke-width="2.2" stroke-dasharray="7 5"/><circle cx="73.5" cy="80.6" r="3" fill="currentColor" stroke="none"/><circle cx="128.5" cy="104.9" r="3" fill="currentColor" stroke="none"/><circle cx="183.5" cy="68.4" r="3" fill="currentColor" stroke="none"/><circle cx="238.5" cy="92.7" r="3" fill="currentColor" stroke="none"/><line x1="46" y1="232" x2="68" y2="232"/><text x="72" y="235.9" fill="currentColor" stroke="none" text-anchor="start" font-size="11">Çevrimiçi</text><line x1="137.4" y1="232" x2="159.4" y2="232" stroke-dasharray="7 5"/><text x="163.4" y="235.9" fill="currentColor" stroke="none" text-anchor="start" font-size="11">Mağaza</text></svg>', true),
  -- mat-11-003 · şekilli · doğrulandı
  ('e30c771c-bcf3-5ee2-b7cd-000e9cb80403'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 2,
   'Bir çiftçinin arazisindeki dört ürünün ekili alan dağılımı merkez açılarıyla daire grafiğinde gösterilmiştir.
Nohut ekili alan $18$ dönüm olduğuna göre buğday ekili alan, mısır ekili alandan kaç dönüm fazladır?',
   '{"options":["12","16","18","20","24"],"correctIndex":4}'::jsonb,
   'Grafikte $54^\circ$''lik dilime $18$ dönüm karşılık gelmektedir; buradan her $3^\circ$''nin $1$ dönüme ($18 \div 54 = 1/3$ dönüm/derece) denk geldiği görülür. Buğday ($144^\circ$) ile mısır ($72^\circ$) arasındaki açı farkı $144^\circ - 72^\circ = 72^\circ$''dir. Bu açı farkı $72 \div 3 = 24$ dönüme karşılık gelir.',
   'C şıkkı (18), açı farkını oranlamak yerine doğrudan nohut alanıyla aynı sanan ya da yanlış dilimi çıkaran adayı yakalar. Önce bir dereceye veya sade bir açıya karşılık gelen alan bulunmalıdır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 364.7 212" width="364.7" height="212" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><g transform="translate(83 0)"><path d="M95 99 L95 14 A85 85 0 0 1 145 167.8 Z" fill="currentColor" fill-opacity="0.08"/><line x1="170.1" y1="74.6" x2="183.4" y2="70.3" stroke-width="1"/><text x="187.3" y="73.2" fill="currentColor" stroke="none" text-anchor="start" font-size="12">Buğday (144°)</text><path d="M95 99 L145 167.8 A85 85 0 0 1 26.2 149 Z" fill="currentColor" fill-opacity="0.3"/><line x1="82.6" y1="177" x2="80.5" y2="190.9" stroke-width="1"/><text x="79.8" y="205" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">Arpa (90°)</text><path d="M95 99 L26.2 149 A85 85 0 0 1 26.2 49 Z" fill="currentColor" fill-opacity="0.16"/><line x1="16" y1="99" x2="2" y2="99" stroke-width="1"/><text x="-2" y="103.2" fill="currentColor" stroke="none" text-anchor="end" font-size="12">Mısır (72°)</text><path d="M95 99 L26.2 49 A85 85 0 0 1 95 14 Z" fill="currentColor" fill-opacity="0.42"/><line x1="59.1" y1="28.6" x2="52.8" y2="16.1" stroke-width="1"/><text x="51" y="16.8" fill="currentColor" stroke="none" text-anchor="end" font-size="12">Nohut (54°)</text></g></svg>', true),
  -- mat-11-004 · şekilli · doğrulandı
  ('122e16a3-4289-523c-a6ea-a0b913e33df6'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 2,
   'Bir otelin üç farklı oda tipine ait gecelik konaklama ücretleri tabloda verilmiştir.
Hafta içi $3$ gece ve hafta sonu $2$ gece konaklayacak bir misafir, Standart oda yerine Aile odasını tercih ederse ödeyeceği toplam ücret yüzde kaç artar?',
   '{"options":["%25","%33","%40","%50","%60"],"correctIndex":3}'::jsonb,
   'Standart odada $3$ hafta içi ve $2$ hafta sonu gecesinin toplam ücreti $3 \cdot 1.200 + 2 \cdot 1.600 = 3.600 + 3.200 = 6.800$ TL''dir. Aile odasında aynı konaklamanın toplam ücreti $3 \cdot 1.800 + 2 \cdot 2.400 = 5.400 + 4.800 = 10.200$ TL olur. Ücretteki artış $10.200 - 6.800 = 3.400$ TL olduğundan artış oranı $\dfrac{3.400}{6.800} = \dfrac{1}{2} = \%50$ bulunur.',
   'B şıkkı (%33), aradaki $3.400$ TL''lik farkı başlangıç ücreti olan $6.800$ TL''ye bölmek yerine büyük tutar olan $10.200$ TL''ye bölen adayı yakalar. Artış yüzdesi her zaman başlangıçtaki (referans) değer üzerinden hesaplanır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 353 122" width="353" height="122" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><rect x="1" y="1" width="351" height="30" fill="currentColor" fill-opacity="0.1" stroke="none"/><rect x="1" y="1" width="351" height="120" stroke-width="1.4"/><line x1="1" y1="31" x2="352" y2="31" stroke-width="1"/><line x1="1" y1="61" x2="352" y2="61" stroke-width="1"/><line x1="1" y1="91" x2="352" y2="91" stroke-width="1"/><text x="43.2" y="20.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13" font-weight="600">Oda Tipi</text><text x="43.2" y="50.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">Standart</text><text x="43.2" y="80.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">Aile</text><text x="43.2" y="110.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">Süit</text><line x1="85.3" y1="1" x2="85.3" y2="121" stroke-width="1"/><text x="150.1" y="20.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13" font-weight="600">Hafta İçi (TL)</text><text x="150.1" y="50.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">1.200</text><text x="150.1" y="80.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">1.800</text><text x="150.1" y="110.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">2.500</text><line x1="214.9" y1="1" x2="214.9" y2="121" stroke-width="1"/><text x="283.4" y="20.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13" font-weight="600">Hafta Sonu (TL)</text><text x="283.4" y="50.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">1.600</text><text x="283.4" y="80.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">2.400</text><text x="283.4" y="110.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">3.200</text></svg>', true),
  -- mat-11-005 · şekilli · doğrulandı
  ('95df0de9-18bd-5bef-b9e5-e88719a987f8'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 1,
   'Şekildeki işlem düzeneneğinde dairelerin içine sayılar yazılmakta, okların üzerindeki işlemler soldan sağa sırayla uygulanmaktadır.
Çıkış değeri $19$ olduğuna göre girişteki $x$ sayısı kaçtır?',
   '{"options":["9","11","13","15","17"],"correctIndex":1}'::jsonb,
   'Şemadaki işlemler tersten uygulanabilir veya denklem kurulabilir: $\dfrac{3x + 5}{2} = 19 \Rightarrow 3x + 5 = 38 \Rightarrow 3x = 33 \Rightarrow x = 11$ bulunur.',
   'C şıkkı (13), sondan başa giderken $+5$ yerine yanlışlıkla $-5$ işlem sırasını bozup $\dfrac{19 \cdot 2 + 5}{3}$ ya da hatalı denklem kuran adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 427.1 66" width="427.1" height="66" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><line x1="50" y1="33" x2="125" y2="33" stroke-width="1.4"/><path d="M125 33 L117.6 36.1 M125 33 L117.6 29.9" stroke-width="1.4"/><text x="87.5" y="46.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">×3</text><line x1="181" y1="33" x2="238.6" y2="33" stroke-width="1.4"/><path d="M238.6 33 L231.3 36.1 M238.6 33 L231.3 29.9" stroke-width="1.4"/><text x="209.8" y="46.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">+5</text><line x1="307.4" y1="33" x2="374.9" y2="33" stroke-width="1.4"/><path d="M374.9 33 L367.5 36.1 M374.9 33 L367.5 29.9" stroke-width="1.4"/><text x="341.1" y="46.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">÷2</text><circle cx="33" cy="33" r="17" fill="currentColor" fill-opacity="0.06"/><text x="33" y="37.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">x</text><rect x="125" y="16" width="56" height="34" rx="6" fill="currentColor" fill-opacity="0.06"/><text x="153" y="37.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">3x</text><rect x="238.6" y="16" width="68.7" height="34" rx="6" fill="currentColor" fill-opacity="0.06"/><text x="273" y="37.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">3x + 5</text><circle cx="393" cy="33" r="18.1" fill="currentColor" fill-opacity="0.06"/><text x="393" y="37.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">19</text></svg>', true),
  -- mat-11-006 · şekilli · doğrulandı
  ('16cd404e-0fe8-5d86-a099-18e523f16882'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 3,
   'Şekildeki akış şemasında $n$ tam sayısı tek veya çift olmasına göre ilgili koldan ilerleyerek bir çıkış değeri üretmektedir. Elde edilen ilk çıkış değeri tekrar girişe verilerek sistem ikinci kez çalıştırılıyor.
İlk giriş $n = 7$ olduğuna göre ikinci çalıştırma sonunda elde edilen çıkış değeri kaçtır?',
   '{"options":["15","20","25","40","59"],"correctIndex":0}'::jsonb,
   'İlk çalıştırmada $n = 7$ tek sayı olduğu için alt kol uygulanır: $3 \cdot 7 - 1 = 20$. İkinci çalıştırmada yeni giriş $n = 20$ çift sayı olduğu için üst kol seçilir: $20 \div 2 + 5 = 10 + 5 = 15$ bulunur.',
   'B şıkkı (20), ilk adımın sonucunu bulduktan sonra ikinci kez sisteme sokmayı unutan adayı yakalar. E şıkkı (59) ise $20$''nin çift olduğunu gözden kaçırıp ikinci adımda da tek kolunu ($3 \cdot 20 - 1$) uygulayanların işaretlediği şıktır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 399.3 226" width="399.3" height="226" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><line x1="48.2" y1="105.4" x2="159" y2="50" stroke-width="1.4"/><path d="M159 50 L153.8 56.1 M159 50 L151 50.5" stroke-width="1.4"/><text x="111.8" y="98.3" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">n çift</text><line x1="48.2" y1="120.6" x2="159" y2="176" stroke-width="1.4"/><path d="M159 176 L151 175.5 M159 176 L153.8 169.9" stroke-width="1.4"/><text x="96.1" y="167.5" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">n tek</text><line x1="227" y1="50" x2="325.9" y2="99.4" stroke-width="1.4"/><path d="M325.9 99.4 L317.9 98.9 M325.9 99.4 L320.7 93.4" stroke-width="1.4"/><line x1="227" y1="176" x2="325.9" y2="126.6" stroke-width="1.4"/><path d="M325.9 126.6 L320.7 132.6 M325.9 126.6 L317.9 127.1" stroke-width="1.4"/><circle cx="33" cy="113" r="17" fill="currentColor" fill-opacity="0.06"/><text x="33" y="117.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">n</text><rect x="146.5" y="16" width="93.1" height="34" rx="6" fill="currentColor" fill-opacity="0.06"/><text x="193" y="37.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">n ÷ 2 + 5</text><rect x="158.6" y="176" width="68.7" height="34" rx="6" fill="currentColor" fill-opacity="0.06"/><text x="193" y="197.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">3n − 1</text><circle cx="353" cy="113" r="30.3" fill="currentColor" fill-opacity="0.06"/><text x="353" y="117.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">Çıkış</text></svg>', true),
  -- mat-11-007 · doğrulandı
  ('827b3a3d-b884-5538-8d1c-a903dff3af0c'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 2,
   'Rakamları sıfırdan ve birbirinden farklı üç basamaklı bir $A6C$ doğal sayısının "denge kodu" şu iki kuraldan biriyle hesaplanmaktadır:
- $A + C > 6$ ise $\text{kod} = 6A + C$
- $A + C \le 6$ ise $\text{kod} = 6C - A$
Denge kodu $26$ olduğuna göre $A + C$ toplamı kaçtır?',
   '{"options":["6","8","9","11","13"],"correctIndex":3}'::jsonb,
   'İki durum ayrı ayrı kontrol edilir ($A, C \in \{1, \ldots, 9\} \setminus \{6\}$ ve $A \neq C$):
1. $A + C > 6$ durumu: $6A + C = 26$. Burada $A = 4$ seçilirse $C = 2$ olur ancak $4 + 2 = 6$ olup $6$''dan büyük değildir; koşul sağlanmaz. $A = 3$ için $C = 8$ bulunur; $3 + 8 = 11 > 6$ ve $\{3, 6, 8\}$ rakamları farklıdır (geçerli tek sayı $368$).
2. $A + C \le 6$ durumu: $6C - A = 26 \Rightarrow 6C = 26 + A$. Rakam aralığında yalnızca $C = 5, A = 4$ çıkar; ancak $4 + 5 = 9 > 6$ olduğundan geçersizdir.
O hâlde $A = 3$ ve $C = 8$ olup $A + C = 11$ bulunur.',
   'A şıkkı ($6$), $6A + C = 26$ eşitliğinden bulduğu $A = 4, C = 2$ çiftinin $A + C > 6$ kesin eşitsizliğini sağlamadığını kontrol etmeden $4 + 2 = 6$ işaretleyen; C şıkkı ($9$) ise ikinci kolda $4 + 5 = 9$''u kontrolsüz alan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-11-008 · doğrulandı
  ('377668bf-7283-5775-bf59-9c61da1c0fe4'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 3,
   'Gerçel sayılar kümesinde $\Delta$ ve $\circ$ işlemleri her $a$ ve $b$ gerçel sayısı için
$a \Delta b = 2a - b$
$a \circ b = a^2 + b$
biçiminde tanımlanıyor.
Buna göre $(x \Delta 3) \circ 5 = 30$ eşitliğini sağlayan $x$ gerçel sayılarının toplamı kaçtır?',
   '{"options":["$-1$","$1$","$2$","$4$","$3$"],"correctIndex":4}'::jsonb,
   'Önce parantez içi hesaplanır: $x \Delta 3 = 2x - 3$. Ardından $\circ$ işlemi uygulanır: $(2x - 3) \circ 5 = (2x - 3)^2 + 5 = 30 \Rightarrow (2x - 3)^2 = 25$. Karesi $25$ olan iki gerçel sayı olduğundan iki durum incelenir: $2x - 3 = 5 \Rightarrow x_1 = 4$ ve $2x - 3 = -5 \Rightarrow x_2 = -1$. Eşitliği sağlayan $x$ değerlerinin toplamı $4 + (-1) = 3$ bulunur.',
   'D şıkkı (4), $(2x - 3)^2 = 25$ denkleminden yalnızca pozitif kök olan $2x - 3 = 5 \Rightarrow x = 4$ değerini alıp negatif karekök ($-5$) durumunu unutan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-11-009 · şekilli · doğrulandı
  ('a696b1c3-ffa2-5551-9a45-41435fb334b5'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 1,
   'Bir işletmenin dört farklı ürününün aylık satış adetleri grafikte gösterilmiştir.
Buna göre D ürününün satış adedi, A ürününün satış adedinden yüzde kaç fazladır?',
   '{"options":["%60","%100","%125","%150","%250"],"correctIndex":3}'::jsonb,
   'Grafikten A ürününün satış adedi $40$, D ürününün satış adedi $100$ okunur. Artış miktarı $100 - 40 = 60$ adettir. A ürününe göre fazlalık yüzdesi $\dfrac{60}{40} \cdot 100 = 150$, yani $\%150$ bulunur.',
   'E şıkkı (%250), $\dfrac{100}{40} \cdot 100 = 250$ hesaplayarak "yüzde kaçıdır?" ile "yüzde kaç fazlasıdır?" sorularını karıştıran adayı yakalar. A şıkkı (%60) ise doğrudan farkı ($100 - 40 = 60$) yüzde sananların tuzağıdır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 282 242" width="282" height="242" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><text x="40" y="205.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">0</text><text x="40" y="177.5" fill="currentColor" stroke="none" text-anchor="end" font-size="11">20</text><text x="40" y="149.2" fill="currentColor" stroke="none" text-anchor="end" font-size="11">40</text><text x="40" y="120.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">60</text><text x="40" y="92.5" fill="currentColor" stroke="none" text-anchor="end" font-size="11">80</text><text x="40" y="64.2" fill="currentColor" stroke="none" text-anchor="end" font-size="11">100</text><text x="40" y="35.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">120</text><g stroke-width="0.6" stroke-opacity="0.3"><line x1="46" y1="202" x2="266" y2="202"/><line x1="46" y1="173.7" x2="266" y2="173.7"/><line x1="46" y1="145.3" x2="266" y2="145.3"/><line x1="46" y1="117" x2="266" y2="117"/><line x1="46" y1="88.7" x2="266" y2="88.7"/><line x1="46" y1="60.3" x2="266" y2="60.3"/><line x1="46" y1="32" x2="266" y2="32"/></g><line x1="46" y1="28" x2="46" y2="202"/><line x1="46" y1="202" x2="266" y2="202"/><text x="40" y="19.9" fill="currentColor" stroke="none" text-anchor="start" font-size="11">Adet</text><rect x="57" y="145.3" width="33" height="56.7" fill="currentColor" fill-opacity="0.22"/><text x="73.5" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">A</text><rect x="112" y="88.7" width="33" height="113.3" fill="currentColor" fill-opacity="0.22"/><text x="128.5" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">B</text><rect x="167" y="117" width="33" height="85" fill="currentColor" fill-opacity="0.22"/><text x="183.5" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">C</text><rect x="222" y="60.3" width="33" height="141.7" fill="currentColor" fill-opacity="0.22"/><text x="238.5" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">D</text></svg>', true),
  -- mat-11-010 · şekilli · doğrulandı
  ('d0181f2a-eef3-5f1c-9a04-cf7a56f9eb9f'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 2,
   'Bir okul kütüphanesindeki toplam $720$ kitabın türlere göre dağılımı daire grafiğinde verilmiştir.
Buna göre kütüphanedeki Tarih kitaplarının sayısı, Şiir kitaplarının sayısından kaç fazladır?',
   '{"options":["24","36","48","72","144"],"correctIndex":1}'::jsonb,
   'Tarih kitapları toplamın $\%25$''i, Şiir kitapları ise $\%20$''sidir. Aradaki yüzde farkı $\%25 - \%20 = \%5$''tir. Toplam $720$ kitabın $\%5$''i $720 \cdot \dfrac{5}{100} = 36$ kitap fazlalık verir.',
   'E şıkkı (144), yalnızca Şiir kitaplarının sayısını ($720 \cdot 0{,}20 = 144$) hesaplayıp fark almayı unutan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 340 212" width="340" height="212" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><g transform="translate(78 0)"><path d="M95 99 L95 14 A85 85 0 0 1 163.8 149 Z" fill="currentColor" fill-opacity="0.08"/><line x1="165.4" y1="63.1" x2="177.9" y2="56.8" stroke-width="1"/><text x="181.4" y="59.2" fill="currentColor" stroke="none" text-anchor="start" font-size="12">Roman (%35)</text><path d="M95 99 L163.8 149 A85 85 0 0 1 45 167.8 Z" fill="currentColor" fill-opacity="0.3"/><line x1="107.4" y1="177" x2="109.5" y2="190.9" stroke-width="1"/><text x="110.2" y="205" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">Tarih (%25)</text><path d="M95 99 L45 167.8 A85 85 0 0 1 14.2 72.7 Z" fill="currentColor" fill-opacity="0.16"/><line x1="19.9" y1="123.4" x2="6.6" y2="127.7" stroke-width="1"/><text x="2.7" y="133.2" fill="currentColor" stroke="none" text-anchor="end" font-size="12">Bilim (%20)</text><path d="M95 99 L14.2 72.7 A85 85 0 0 1 95 14 Z" fill="currentColor" fill-opacity="0.42"/><line x1="48.6" y1="35.1" x2="40.3" y2="23.8" stroke-width="1"/><text x="38" y="24.7" fill="currentColor" stroke="none" text-anchor="end" font-size="12">Şiir (%20)</text></g></svg>', true),
  -- mat-11-011 · şekilli · doğrulandı
  ('dfb28edf-8c1a-53df-883f-8ba2f2e24db6'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 2,
   'Bir öğrencinin hafta içi beş gün boyunca çözdüğü günlük soru sayıları çizgi grafiğinde verilmiştir.
Bir önceki güne göre günlük soru sayısında yaşanan en büyük artış kaç sorudur?',
   '{"options":["30","15","20","35","75"],"correctIndex":0}'::jsonb,
   'Artış yaşanan günler incelenir: Pazartesi''den Salı''ya artış $55 - 40 = 15$ sorudur. Salı''dan Çarşamba''ya düşüş yaşanmıştır. Çarşamba''dan Perşembe''ye artış $75 - 45 = 30$ sorudur. Perşembe''den Cuma''ya düşüş yaşanmıştır. Dolayısıyla en büyük günlük artış $30$ sorudur.',
   'E şıkkı (75), artış miktarı yerine en yüksek soru çözülen Perşembe günündeki toplam sayıyı ($75$) işaretleyen; D şıkkı (35) ise tüm haftanın en yüksek ve en düşük değerleri farkını ($75 - 40 = 35$) alan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 302 242" width="302" height="242" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><text x="40" y="205.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">0</text><text x="40" y="177.5" fill="currentColor" stroke="none" text-anchor="end" font-size="11">15</text><text x="40" y="149.2" fill="currentColor" stroke="none" text-anchor="end" font-size="11">30</text><text x="40" y="120.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">45</text><text x="40" y="92.5" fill="currentColor" stroke="none" text-anchor="end" font-size="11">60</text><text x="40" y="64.2" fill="currentColor" stroke="none" text-anchor="end" font-size="11">75</text><text x="40" y="35.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">90</text><g stroke-width="0.6" stroke-opacity="0.3"><line x1="46" y1="202" x2="286" y2="202"/><line x1="46" y1="173.7" x2="286" y2="173.7"/><line x1="46" y1="145.3" x2="286" y2="145.3"/><line x1="46" y1="117" x2="286" y2="117"/><line x1="46" y1="88.7" x2="286" y2="88.7"/><line x1="46" y1="60.3" x2="286" y2="60.3"/><line x1="46" y1="32" x2="286" y2="32"/></g><line x1="46" y1="28" x2="46" y2="202"/><line x1="46" y1="202" x2="286" y2="202"/><text x="40" y="19.9" fill="currentColor" stroke="none" text-anchor="start" font-size="11">Soru</text><text x="70" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">Pzt</text><text x="118" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">Sal</text><text x="166" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">Çar</text><text x="214" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">Per</text><text x="262" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">Cum</text><polyline points="70,126.4 118,98.1 166,117 214,60.3 262,88.7" stroke-width="2.2"/><circle cx="70" cy="126.4" r="3" fill="currentColor" stroke="none"/><circle cx="118" cy="98.1" r="3" fill="currentColor" stroke="none"/><circle cx="166" cy="117" r="3" fill="currentColor" stroke="none"/><circle cx="214" cy="60.3" r="3" fill="currentColor" stroke="none"/><circle cx="262" cy="88.7" r="3" fill="currentColor" stroke="none"/></svg>', true),
  -- mat-11-012 · şekilli · doğrulandı
  ('e8746173-18ca-57ba-9d04-b928ba6e80f3'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 2,
   'Bir kırtasiyede gün içinde satılan üç ürüne ait birim fiyat ve satış adedi bilgileri tabloda verilmiştir.
Bu üç ürünün satışından elde edilen toplam gelir $1.400$ TL olduğuna göre satılan kalem adedi ($x$) kaçtır?',
   '{"options":["12","15","16","18","20"],"correctIndex":4}'::jsonb,
   'Defter ve silgi satışlarından elde edilen gelirler hesaplanır: $40 \cdot 15 = 600$ TL ve $15 \cdot 20 = 300$ TL (toplam $900$ TL). Toplam gelirin $1.400$ TL olması için kalem satışından $1.400 - 900 = 500$ TL gelir gelmelidir. Tanesi $25$ TL olan kalemlerden $x = \dfrac{500}{25} = 20$ adet satılmıştır.',
   'C şıkkı (16), $1.400$''den $600 + 300 = 900$ yerine $1.000$ çıkarıp $400 \div 25 = 16$ bulan ya da silgi adetini yanlış çarpan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 330.4 122" width="330.4" height="122" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><rect x="1" y="1" width="328.4" height="30" fill="currentColor" fill-opacity="0.1" stroke="none"/><rect x="1" y="1" width="328.4" height="120" stroke-width="1.4"/><line x1="1" y1="31" x2="329.4" y2="31" stroke-width="1"/><line x1="1" y1="61" x2="329.4" y2="61" stroke-width="1"/><line x1="1" y1="91" x2="329.4" y2="91" stroke-width="1"/><text x="35.6" y="20.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13" font-weight="600">Ürün</text><text x="35.6" y="50.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">Defter</text><text x="35.6" y="80.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">Kalem</text><text x="35.6" y="110.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">Silgi</text><line x1="70.2" y1="1" x2="70.2" y2="121" stroke-width="1"/><text x="142.6" y="20.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13" font-weight="600">Birim Fiyat (TL)</text><text x="142.6" y="50.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">40</text><text x="142.6" y="80.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">25</text><text x="142.6" y="110.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">15</text><line x1="214.9" y1="1" x2="214.9" y2="121" stroke-width="1"/><text x="272.1" y="20.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13" font-weight="600">Satılan Adet</text><text x="272.1" y="50.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">15</text><text x="272.1" y="80.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">x</text><text x="272.1" y="110.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">20</text></svg>', true),
  -- mat-11-013 · şekilli · doğrulandı
  ('10da261d-c63f-5acb-bbb0-29196a9542b6'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 1,
   'Bir otoparkın tek girişlik ücret tarifesi tabloda verilmiştir.
Aracını bu otoparka Pazartesi günü $3$ saat, Salı günü $6$ saat ve Çarşamba günü $1$ saat bırakan bir sürücü üç gün için toplam kaç TL öder?',
   '{"options":["190","240","280","300","330"],"correctIndex":2}'::jsonb,
   'Her gün ayrı giriş yapıldığı için günlere karşılık gelen tarife dilimleri okunur: Pazartesi ($3$ saat $\to 2 - 5$ saat dilimi) için $90$ TL, Salı ($6$ saat $\to 5 - 10$ saat dilimi) için $140$ TL ve Çarşamba ($1$ saat $\to 0 - 2$ saat dilimi) için $50$ TL ödenir. Toplam ücret $90 + 140 + 50 = 280$ TL''dir.',
   'A şıkkı (190) veya E şıkkı (330), üç günün saatlerini toplayıp ($10$ saat) tek gün üzerinden tarife uygulamaya çalışan ya da saatleri $90 \cdot 3$ gibi çarpan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 215.9 122" width="215.9" height="122" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><rect x="1" y="1" width="213.9" height="30" fill="currentColor" fill-opacity="0.1" stroke="none"/><rect x="1" y="1" width="213.9" height="120" stroke-width="1.4"/><line x1="1" y1="31" x2="214.9" y2="31" stroke-width="1"/><line x1="1" y1="61" x2="214.9" y2="61" stroke-width="1"/><line x1="1" y1="91" x2="214.9" y2="91" stroke-width="1"/><text x="58.2" y="20.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13" font-weight="600">Kalış Süresi</text><text x="58.2" y="50.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">0 - 2 saat</text><text x="58.2" y="80.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">2 - 5 saat</text><text x="58.2" y="110.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">5 - 10 saat</text><line x1="115.5" y1="1" x2="115.5" y2="121" stroke-width="1"/><text x="165.2" y="20.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13" font-weight="600">Ücret (TL)</text><text x="165.2" y="50.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">50</text><text x="165.2" y="80.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">90</text><text x="165.2" y="110.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">140</text></svg>', true),
  -- mat-11-014 · şekilli · doğrulandı
  ('3c639a48-4875-5bec-a809-9fd10ca32a3f'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 2,
   'Şekildeki işlem makinesinde ilk kutuda $5$ ve $b$ sayıları toplanmakta, ardından okların üzerindeki işlemler sırayla uygulanarak çıkışa $29$ sayısı yazılmaktadır.
Buna göre $b$ değeri kaçtır?',
   '{"options":["3","4","5","6","11"],"correctIndex":3}'::jsonb,
   'Denklem soldan sağa kurulur: $3(5 + b) - 4 = 29 \Rightarrow 3(5 + b) = 33 \Rightarrow 5 + b = 11 \Rightarrow b = 6$ bulunur.',
   'E şıkkı (11), $5 + b = 11$ ara değerini bulduktan sonra $5$''i çıkarmadan doğrudan $11$''i işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 368.4 66" width="368.4" height="66" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><line x1="76.6" y1="33" x2="147.8" y2="33" stroke-width="1.4"/><path d="M147.8 33 L140.5 36.1 M147.8 33 L140.5 29.9" stroke-width="1.4"/><text x="112.2" y="46.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">×3</text><line x1="232.8" y1="33" x2="316.2" y2="33" stroke-width="1.4"/><path d="M316.2 33 L308.8 36.1 M316.2 33 L308.8 29.9" stroke-width="1.4"/><text x="274.5" y="46.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">−4</text><rect x="16" y="16" width="60.6" height="34" rx="6" fill="currentColor" fill-opacity="0.06"/><text x="46.3" y="37.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">5 + b</text><rect x="147.8" y="16" width="85" height="34" rx="6" fill="currentColor" fill-opacity="0.06"/><text x="190.3" y="37.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">3(5 + b)</text><circle cx="334.3" cy="33" r="18.1" fill="currentColor" fill-opacity="0.06"/><text x="334.3" y="37.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">29</text></svg>', true),
  -- mat-11-015 · şekilli · doğrulandı
  ('9c266fde-a746-5410-bf91-ddcd25e3ff6c'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 3,
   'Şekildeki iki kollu işlem düzeneğine aynı $x$ sayısı girildiğinde üst koldan $A$, alt koldan $B$ çıkışı elde edilmektedir.
$B - A = 10$ olduğuna göre girişteki $x$ sayısı kaçtır?',
   '{"options":["8","12","14","16","18"],"correctIndex":1}'::jsonb,
   'Üst koldaki çıkış $A = 2x + 8$, alt koldaki çıkış ise $B = 3(x + 2) = 3x + 6$ olur. Verilen $B - A = 10$ eşitliğinde yerine konursa $(3x + 6) - (2x + 8) = 10 \Rightarrow x - 2 = 10 \Rightarrow x = 12$ bulunur.',
   'D şıkkı (16), alt kolda parantez dağıtmayı unutup $B = 3x + 2$ yazarak $(3x + 2) - (2x + 8) = x - 6 = 10 \Rightarrow x = 16$ bulan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 322 226" width="322" height="226" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><line x1="47.4" y1="104" x2="133.8" y2="50" stroke-width="1.4"/><path d="M133.8 50 L129.2 56.5 M133.8 50 L125.9 51.3" stroke-width="1.4"/><text x="97.3" y="92" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">×2</text><line x1="189" y1="33" x2="272" y2="33" stroke-width="1.4"/><path d="M272 33 L264.6 36.1 M272 33 L264.6 29.9" stroke-width="1.4"/><text x="230.5" y="46.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">+8</text><line x1="47.4" y1="122" x2="133.8" y2="176" stroke-width="1.4"/><path d="M133.8 176 L125.9 174.7 M133.8 176 L129.2 169.5" stroke-width="1.4"/><text x="83.9" y="164" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">+2</text><line x1="191.3" y1="193" x2="272" y2="193" stroke-width="1.4"/><path d="M272 193 L264.6 196.1 M272 193 L264.6 189.9" stroke-width="1.4"/><text x="231.7" y="206.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">×3</text><circle cx="33" cy="113" r="17" fill="currentColor" fill-opacity="0.06"/><text x="33" y="117.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">x</text><rect x="133" y="16" width="56" height="34" rx="6" fill="currentColor" fill-opacity="0.06"/><text x="161" y="37.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">2x</text><circle cx="289" cy="33" r="17" fill="currentColor" fill-opacity="0.06"/><text x="289" y="37.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><rect x="130.7" y="176" width="60.6" height="34" rx="6" fill="currentColor" fill-opacity="0.06"/><text x="161" y="197.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">x + 2</text><circle cx="289" cy="193" r="17" fill="currentColor" fill-opacity="0.06"/><text x="289" y="197.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text></svg>', true),
  -- mat-11-016
  ('e04544a3-0996-5964-9206-2697509a465a'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 1,
   'Bir ekipteki Arda, Burak, Can, Deniz ve Emre isimli beş çalışan, Pazartesi gününden başlayarak haftanın her günü yalnızca bir kişi görev alacak biçimde sırayla (Arda, Burak, Can, Deniz, Emre, Arda, ...) nöbet tutmaktadır.
İlk nöbeti Pazartesi günü Arda tuttuğuna göre, $43.$ nöbeti kim ve hangi gün tutar?',
   '{"options":["Arda - Salı","Can - Pazartesi","Can - Salı","Deniz - Pazartesi","Burak - Pazar"],"correctIndex":1}'::jsonb,
   '- Kişi döngüsü $5$ günde bir başa döner: $43 = 5 \cdot 8 + 3$ (mod $5$''te $3$) olduğundan $3.$ sıradaki çalışan olan Can nöbet tutar.
- Gün döngüsü $7$ günde bir başa döner: $43 = 7 \cdot 6 + 1$ (mod $7$''de $1$) olduğundan ilk gün olan Pazartesi gününe denk gelir.
Sonuç olarak $43.$ nöbeti Can - Pazartesi günü tutar.',
   'C şıkkı (Can - Salı), $43 \div 7$ bölmesinin kalanını $1$ bulduktan sonra Pazartesi''yi $0$. gün sanıp $1$ gün ileri kayarak Salı''yı seçen adayı yakalar. İlk nöbet Pazartesi ($1.$ gün) olduğundan kalan $1$ doğrudan Pazartesi''yi verir.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-11-017 · doğrulandı
  ('d8ef20bf-e9f9-5ec6-b75c-6192f6c70a81'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 2,
   'Üç basamaklı bir $abc$ doğal sayısının "kodu", $a \cdot b + c$ işlemiyle tanımlanmaktadır (örneğin $243$ sayısının kodu $2 \cdot 4 + 3 = 11$''dir).
Buna göre kodu $20$ olan üç basamaklı en büyük doğal sayının rakamları toplamı kaçtır?',
   '{"options":["9","11","13","14","15"],"correctIndex":2}'::jsonb,
   'Üç basamaklı en büyük sayıyı elde etmek için önce yüzler basamağı olan $a$ en büyük değer olan $9$ seçilir. $9 \cdot b + c = 20$ eşitliğinde $b$''nin alabileceği en büyük rakam $2$''dir ($b = 3$ için $27 > 20$; $b = 1$ için $c = 11$ rakam olmaz). $b = 2$ alındığında $18 + c = 20 \Rightarrow c = 2$ olur ve sayı $922$ bulunur. Rakamları toplamı $9 + 2 + 2 = 13$''tür.',
   'A şıkkı (9), büyük sayıyı kurarken en büyük yüzler basamağı yerine $a \cdot b = 20$ yapıp $540$ ($5 + 4 + 0 = 9$) seçen adayı yakalar. Oysa $c = 2$ bırakılarak yüzler basamağı $9$ yapılabilmektedir.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-11-018 · doğrulandı
  ('c9f4ff73-dda5-52cc-ad8b-536b184f1a2d'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 2,
   '$6$ takımın katıldığı bir futbol liginde her takım diğer tüm takımlarla biri kendi sahasında diğeri deplasmanda olmak üzere ikişer kez karşılaşmaktadır.
Bu ligde sezon boyunca toplam kaç maç oynanır?',
   '{"options":["12","15","24","30","36"],"correctIndex":3}'::jsonb,
   'Her iki takım arasında bir maç oynansaydı toplam $\binom{6}{2} = \dfrac{6 \cdot 5}{2} = 15$ maç oynanırdı. Her çift birbiriyle ikişer kez (ev ve deplasman) karşılaştığı için toplam maç sayısı $2 \cdot 15 = 30$ olur.',
   'B şıkkı (15), iki takımın birbiriyle iki kez oynayacağını unutup tek devreli lig hesabıyla $\binom{6}{2} = 15$ işaretleyen adayı; E şıkkı (36) ise $6 \cdot 6 = 36$ yapanları yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-11-019 · doğrulandı
  ('32ce4044-5b21-5b9f-b32a-63314fa5a612'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 3,
   '$1$''den başlayarak ardışık biçimde numaralandırılan bir kitabın tüm sayfalarını numaralandırmak için toplam $252$ adet rakam kullanılmıştır.
Buna göre bu kitap kaç sayfadır?',
   '{"options":["110","118","121","126","120"],"correctIndex":4}'::jsonb,
   'Tek basamaklı sayfalar ($1$''den $9$''a kadar) için $9 \cdot 1 = 9$ rakam kullanılır.
İki basamaklı sayfalar ($10$''dan $99$''a kadar $90$ sayfa) için $90 \cdot 2 = 180$ rakam kullanılır.
İlk $99$ sayfada toplam $9 + 180 = 189$ rakam harcanmıştır. Kalan $252 - 189 = 63$ rakam üç basamaklı sayfalar içindir; her sayfa $3$ rakam kullandığından $\dfrac{63}{3} = 21$ tane üç basamaklı sayfa vardır. Kitabın son sayfası $99 + 21 = 120$''dir.',
   'D şıkkı (126), iki basamaklı sayfa adedini $90$ yerine $99 - 10 = 89$ sanarak hesaplayan; C şıkkı (121) ise $100$''den başlayarak $21$ sayfa sayarken $+1$ ekleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-11-020 · şekilli · doğrulandı
  ('1b65a40c-ff11-52f7-a513-70acb973e7bc'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 2,
   'Bir kırtasiyede bulunan dört farklı renkteki toplam $300$ kalemin dağılımı daire grafiğinde verilmiştir.
Buna göre Yeşil kalemleri gösteren daire diliminin merkez açısı kaç derecedir?',
   '{"options":["30","36","40","45","72"],"correctIndex":1}'::jsonb,
   'Toplam kalem sayısı $120 + 90 + 60 + 30 = 300$''dür ve tam daire $360^\circ$''ye karşılık gelir. Yeşil kalemlerin sayısı $30$ olduğundan tüm kalemlerin $\dfrac{30}{300} = \dfrac{1}{10}$''udur. Merkez açısı $\dfrac{360^\circ}{10} = 36^\circ$ bulunur.',
   'A şıkkı (30), kalem adedini doğrudan merkez açı sanıp $30^\circ$ işaretleyen adayı yakalar. $300$ kalem $360^\circ$''ye karşılık geldiği için sayı ile açı aynı değildir.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 345.9 207.5" width="345.9" height="207.5" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><g transform="translate(85 5)"><path d="M95 99 L95 14 A85 85 0 0 1 145 167.8 Z" fill="currentColor" fill-opacity="0.08"/><line x1="170.1" y1="74.6" x2="183.4" y2="70.3" stroke-width="1"/><text x="187.3" y="73.2" fill="currentColor" stroke="none" text-anchor="start" font-size="12">Mavi (120)</text><path d="M95 99 L145 167.8 A85 85 0 0 1 14.2 125.3 Z" fill="currentColor" fill-opacity="0.3"/><line x1="70.6" y1="174.1" x2="66.3" y2="187.4" stroke-width="1"/><text x="65" y="195.5" fill="currentColor" stroke="none" text-anchor="end" font-size="12">Siyah (90)</text><path d="M95 99 L14.2 125.3 A85 85 0 0 1 45 30.2 Z" fill="currentColor" fill-opacity="0.16"/><line x1="19.9" y1="74.6" x2="6.6" y2="70.3" stroke-width="1"/><text x="2.7" y="73.2" fill="currentColor" stroke="none" text-anchor="end" font-size="12">Kırmızı (60)</text><path d="M95 99 L45 30.2 A85 85 0 0 1 95 14 Z" fill="currentColor" fill-opacity="0.42"/><line x1="70.6" y1="23.9" x2="66.3" y2="10.6" stroke-width="1"/><text x="65" y="10.9" fill="currentColor" stroke="none" text-anchor="end" font-size="12">Yeşil (30)</text></g></svg>', true),
  -- mat-11-021 · şekilli · doğrulandı
  ('91164641-13d0-55b7-84b7-88c897c37073'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 1,
   'Bir kargo şubesinin dört günde dağıttığı paket sayıları grafikte verilmiştir.
Buna göre dört gün boyunca günlük ortalama kaç paket dağıtılmıştır?',
   '{"options":["20","21","22","23","24"],"correctIndex":2}'::jsonb,
   'Dört günün paket sayıları toplanır: $16 + 24 + 20 + 28 = 88$. Günlük ortalama toplamın gün sayısına bölünmesiyle $\dfrac{88}{4} = 22$ paket bulunur.',
   'B şıkkı (21) veya E şıkkı (24), verileri toplayıp $4$''e bölmek yerine grafikteki ortadaki değerleri seçmeye çalışan veya toplamı hatalı yapan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 282 242" width="282" height="242" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><text x="40" y="205.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">0</text><text x="40" y="177.5" fill="currentColor" stroke="none" text-anchor="end" font-size="11">5</text><text x="40" y="149.2" fill="currentColor" stroke="none" text-anchor="end" font-size="11">10</text><text x="40" y="120.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">15</text><text x="40" y="92.5" fill="currentColor" stroke="none" text-anchor="end" font-size="11">20</text><text x="40" y="64.2" fill="currentColor" stroke="none" text-anchor="end" font-size="11">25</text><text x="40" y="35.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">30</text><g stroke-width="0.6" stroke-opacity="0.3"><line x1="46" y1="202" x2="266" y2="202"/><line x1="46" y1="173.7" x2="266" y2="173.7"/><line x1="46" y1="145.3" x2="266" y2="145.3"/><line x1="46" y1="117" x2="266" y2="117"/><line x1="46" y1="88.7" x2="266" y2="88.7"/><line x1="46" y1="60.3" x2="266" y2="60.3"/><line x1="46" y1="32" x2="266" y2="32"/></g><line x1="46" y1="28" x2="46" y2="202"/><line x1="46" y1="202" x2="266" y2="202"/><text x="40" y="19.9" fill="currentColor" stroke="none" text-anchor="start" font-size="11">Paket</text><rect x="57" y="111.3" width="33" height="90.7" fill="currentColor" fill-opacity="0.22"/><text x="73.5" y="106.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">16</text><text x="73.5" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">Pzt</text><rect x="112" y="66" width="33" height="136" fill="currentColor" fill-opacity="0.22"/><text x="128.5" y="60.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">24</text><text x="128.5" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">Sal</text><rect x="167" y="88.7" width="33" height="113.3" fill="currentColor" fill-opacity="0.22"/><text x="183.5" y="83.5" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">20</text><text x="183.5" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">Çar</text><rect x="222" y="43.3" width="33" height="158.7" fill="currentColor" fill-opacity="0.22"/><text x="238.5" y="38.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">28</text><text x="238.5" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">Per</text></svg>', true),
  -- mat-11-022 · şekilli · doğrulandı
  ('0564b497-db55-51e5-a8cc-795ca3e2dfd2'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 3,
   'Bir sınıftaki kız ve erkek öğrencilerin gözlük kullanma durumları tabloda verilmiştir.
Bu sınıftaki gözlüklü öğrencilerin sayısı, tüm sınıf mevcudunun $\%25$''i olduğuna göre gözlüklü erkek öğrenci sayısı ($x$) kaçtır?',
   '{"options":["2","3","4","6","8"],"correctIndex":0}'::jsonb,
   'Sınıftaki toplam öğrenci sayısı $6 + 13 + x + 11 = 30 + x$, gözlüklü öğrenci sayısı ise $6 + x$''tir. Verilen yüzde oranından $\dfrac{6 + x}{30 + x} = \dfrac{25}{100} = \dfrac{1}{4}$ denklemi kurulur. İçler dışlar çarpımı yapılırsa $4(6 + x) = 30 + x \Rightarrow 24 + 4x = 30 + x \Rightarrow 3x = 6 \Rightarrow x = 2$ bulunur.',
   'E şıkkı (8), sınıf mevcudunu $32$ bulduktan sonra gözlüklü erkek sayısı $x = 2$ yerine sınıftaki toplam gözlüklü öğrenci sayısını ($6 + 2 = 8$) işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 239.9 92" width="239.9" height="92" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><rect x="1" y="1" width="237.9" height="30" fill="currentColor" fill-opacity="0.1" stroke="none"/><rect x="1" y="1" width="237.9" height="90" stroke-width="1.4"/><line x1="1" y1="31" x2="238.9" y2="31" stroke-width="1"/><line x1="1" y1="61" x2="238.9" y2="61" stroke-width="1"/><text x="31.9" y="20.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13" font-weight="600">Grup</text><text x="31.9" y="50.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">Kız</text><text x="31.9" y="80.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">Erkek</text><line x1="62.7" y1="1" x2="62.7" y2="91" stroke-width="1"/><text x="104.9" y="20.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13" font-weight="600">Gözlüklü</text><text x="104.9" y="50.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">6</text><text x="104.9" y="80.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">x</text><line x1="147" y1="1" x2="147" y2="91" stroke-width="1"/><text x="193" y="20.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13" font-weight="600">Gözlüksüz</text><text x="193" y="50.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">13</text><text x="193" y="80.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">11</text></svg>', true),
  -- mat-11-023 · şekilli · doğrulandı
  ('2772fed5-ec08-53c1-ba4a-2d852ea0d823'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 1,
   'Bir kırtasiyenin yılın ilk dört ayında sattığı defter sayıları aşağıdaki sütun grafiğinde verilmiştir.
Buna göre bu dört aydaki aylık ortalama defter satışı, Ocak ayındaki satış adedinden yüzde kaç fazladır?',
   '{"options":["%15","%20","%25","%30","%35"],"correctIndex":2}'::jsonb,
   'Grafikten okunan aylık satış adetlerinin ortalaması $\dfrac{140 + 180 + 160 + 220}{4} = \dfrac{700}{4} = 175$ adettir. Ortalama satış, Ocak ayındaki $140$ adetten $175 - 140 = 35$ adet fazladır. Artış yüzdesi Ocak ayına göre hesaplanır:
$$\frac{35}{140} \cdot 100 = \frac{1}{4} \cdot 100 = \%25$$',
   'B şıkkı ($\%20$), fark olan $35$''i Ocak ayı ($140$) yerine ortalama satış olan $175$''e bölerek $\dfrac{35}{175} = \%20$ bulan adayların düştüğü klasik referans noktası tuzağıdır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 282 242" width="282" height="242" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><text x="40" y="205.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">0</text><text x="40" y="177.5" fill="currentColor" stroke="none" text-anchor="end" font-size="11">40</text><text x="40" y="149.2" fill="currentColor" stroke="none" text-anchor="end" font-size="11">80</text><text x="40" y="120.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">120</text><text x="40" y="92.5" fill="currentColor" stroke="none" text-anchor="end" font-size="11">160</text><text x="40" y="64.2" fill="currentColor" stroke="none" text-anchor="end" font-size="11">200</text><text x="40" y="35.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">240</text><g stroke-width="0.6" stroke-opacity="0.3"><line x1="46" y1="202" x2="266" y2="202"/><line x1="46" y1="173.7" x2="266" y2="173.7"/><line x1="46" y1="145.3" x2="266" y2="145.3"/><line x1="46" y1="117" x2="266" y2="117"/><line x1="46" y1="88.7" x2="266" y2="88.7"/><line x1="46" y1="60.3" x2="266" y2="60.3"/><line x1="46" y1="32" x2="266" y2="32"/></g><line x1="46" y1="28" x2="46" y2="202"/><line x1="46" y1="202" x2="266" y2="202"/><text x="40" y="19.9" fill="currentColor" stroke="none" text-anchor="start" font-size="11">Adet</text><rect x="57" y="102.8" width="33" height="99.2" fill="currentColor" fill-opacity="0.22"/><text x="73.5" y="97.7" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">140</text><text x="73.5" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">Ocak</text><rect x="112" y="74.5" width="33" height="127.5" fill="currentColor" fill-opacity="0.22"/><text x="128.5" y="69.4" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">180</text><text x="128.5" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">Şubat</text><rect x="167" y="88.7" width="33" height="113.3" fill="currentColor" fill-opacity="0.22"/><text x="183.5" y="83.5" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">160</text><text x="183.5" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">Mart</text><rect x="222" y="46.2" width="33" height="155.8" fill="currentColor" fill-opacity="0.22"/><text x="238.5" y="41" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">220</text><text x="238.5" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">Nisan</text></svg>', true),
  -- mat-11-024 · şekilli · doğrulandı
  ('dfb10ba0-dade-54cc-9d74-026e70b28c09'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 2,
   'Bir fabrikada bir ayda üretilen toplam $3.600$ adet ürünün A, B, C ve D modellerine göre dağılımı aşağıdaki daire grafiğinde merkez açılarıyla gösterilmiştir.
Buna göre bu ayda üretilen B modeli ürün sayısı, C modeli ürün sayısından kaç fazladır?',
   '{"options":["240","280","320","360","420"],"correctIndex":3}'::jsonb,
   'Daire grafiğinde $360^\circ$''nin tamamı $3.600$ ürüne karşılık geldiğinden her $1^\circ$''lik dilim $\dfrac{3.600}{360} = 10$ ürünü temsil eder. B modelinin merkez açısı $90^\circ$, C modelinin merkez açısı $54^\circ$ olduğundan aradaki açı farkı $90 - 54 = 36^\circ$''dir. Bu durumda ürün sayısı farkı $36 \times 10 = 360$ adet olur.',
   'C şıkkı ($320$), $1^\circ$''yi $10$ ürün olarak doğru hesapladıktan sonra $90 - 54$ çıkarma işlemini aceleyle $32^\circ$ almanın sonucudur; her bir modelin ayrı sayısını bulup ($900 - 540 = 360$) kontrol etmek hatayı önler.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 277.2 198" width="277.2" height="198" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><g transform="translate(44 0)"><path d="M95 99 L95 14 A85 85 0 0 1 175.8 125.3 Z" fill="currentColor" fill-opacity="0.08"/><line x1="158.9" y1="52.6" x2="170.2" y2="44.3" stroke-width="1"/><text x="173.5" y="46.2" fill="currentColor" stroke="none" text-anchor="start" font-size="12">A (108°)</text><path d="M95 99 L175.8 125.3 A85 85 0 0 1 68.7 179.8 Z" fill="currentColor" fill-opacity="0.3"/><line x1="130.9" y1="169.4" x2="137.2" y2="181.9" stroke-width="1"/><text x="139" y="189.6" fill="currentColor" stroke="none" text-anchor="start" font-size="12">B (90°)</text><path d="M95 99 L68.7 179.8 A85 85 0 0 1 14.2 125.3 Z" fill="currentColor" fill-opacity="0.16"/><line x1="39.1" y1="154.9" x2="29.2" y2="164.8" stroke-width="1"/><text x="26.4" y="171.8" fill="currentColor" stroke="none" text-anchor="end" font-size="12">C (54°)</text><path d="M95 99 L14.2 125.3 A85 85 0 0 1 95 14 Z" fill="currentColor" fill-opacity="0.42"/><line x1="31.1" y1="52.6" x2="19.8" y2="44.3" stroke-width="1"/><text x="16.5" y="46.2" fill="currentColor" stroke="none" text-anchor="end" font-size="12">D (108°)</text></g></svg>', true),
  -- mat-11-025 · şekilli · doğrulandı
  ('266df028-68d1-5c9b-b8c0-631be3c06242'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 2,
   'Bir kütüphanenin hafta içi beş günlük ziyaretçi sayıları aşağıdaki çizgi grafiğinde gösterilmiştir.
Ziyaretçi sayısının bir önceki güne göre oransal olarak en çok arttığı günde, bu artış yüzde kaçtır?',
   '{"options":["%25","%35","%40","%45","%50"],"correctIndex":4}'::jsonb,
   'Artış yaşanan günler tek tek incelenir:
- Salı günü: $80 \to 120$ artışı $40$ kişi olup oran $\dfrac{40}{80} = \%50$''dir.
- Çarşamba günü azalış vardır.
- Perşembe günü: $100 \to 140$ artışı $40$ kişi olup oran $\dfrac{40}{100} = \%40$''tır.
- Cuma günü: $140 \to 175$ artışı $35$ kişi olup oran $\dfrac{35}{140} = \%25$''tir.
En yüksek oransal artış Salı günü gerçekleşmiştir ve $\%50$''dir.',
   'C şıkkı ($\%40$), Perşembe günündeki $40$ kişilik sayısal artışı yüzdesiyle karıştıran veya paydaya başlangıç değerini ($80$) değil bir sonraki artışın başlangıcını ($100$) koyan adaylar için hazırlanmış en güçlü çeldiricidir.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 302 242" width="302" height="242" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><text x="40" y="205.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">0</text><text x="40" y="171.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">40</text><text x="40" y="137.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">80</text><text x="40" y="103.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">120</text><text x="40" y="69.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">160</text><text x="40" y="35.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">200</text><g stroke-width="0.6" stroke-opacity="0.3"><line x1="46" y1="202" x2="286" y2="202"/><line x1="46" y1="168" x2="286" y2="168"/><line x1="46" y1="134" x2="286" y2="134"/><line x1="46" y1="100" x2="286" y2="100"/><line x1="46" y1="66" x2="286" y2="66"/><line x1="46" y1="32" x2="286" y2="32"/></g><line x1="46" y1="28" x2="46" y2="202"/><line x1="46" y1="202" x2="286" y2="202"/><text x="40" y="19.9" fill="currentColor" stroke="none" text-anchor="start" font-size="11">Kişi</text><text x="70" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">Pzt</text><text x="118" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">Sal</text><text x="166" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">Çar</text><text x="214" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">Per</text><text x="262" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">Cum</text><polyline points="70,134 118,100 166,117 214,83 262,53.3" stroke-width="2.2"/><circle cx="70" cy="134" r="3" fill="currentColor" stroke="none"/><circle cx="118" cy="100" r="3" fill="currentColor" stroke="none"/><circle cx="166" cy="117" r="3" fill="currentColor" stroke="none"/><circle cx="214" cy="83" r="3" fill="currentColor" stroke="none"/><circle cx="262" cy="53.3" r="3" fill="currentColor" stroke="none"/></svg>', true),
  -- mat-11-026 · şekilli · doğrulandı
  ('1150b36b-a1d0-5b7a-83c5-d140162fa1f6'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 1,
   'Bir müzenin hafta içi ve hafta sonu uyguladığı bilet tarifesi aşağıdaki tabloda verilmiştir.
Hafta içi müzeye giden $3$ öğrenci ve $2$ tam biletli yetişkin gişeye toplam $300$ TL verirse kaç TL para üstü alır?',
   '{"options":["45","55","60","65","75"],"correctIndex":0}'::jsonb,
   'Tablonun "Hafta İçi" sütunundan öğrenci bileti $45$ TL, tam bilet $60$ TL okunur. Toplam bilet tutarı $3 \times 45 + 2 \times 60 = 135 + 120 = 255$ TL''dir. Verilen $300$ TL''den $255$ TL çıkarılırsa $300 - 255 = 45$ TL para üstü alınır.',
   'D şıkkı ($65$) ve E şıkkı ($75$), öğrenci ve yetişkin sayılarını çaprazlayarak $2 \times 45 + 3 \times 60 = 270$ hesaplayıp farklı çıkarma yapmaktan ya da hafta sonu sütunundan veri okumaktan kaynaklanan dikkatsizlik tuzaklarıdır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 375.6 122" width="375.6" height="122" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><rect x="1" y="1" width="373.6" height="30" fill="currentColor" fill-opacity="0.1" stroke="none"/><rect x="1" y="1" width="373.6" height="120" stroke-width="1.4"/><line x1="1" y1="31" x2="374.6" y2="31" stroke-width="1"/><line x1="1" y1="61" x2="374.6" y2="61" stroke-width="1"/><line x1="1" y1="91" x2="374.6" y2="91" stroke-width="1"/><text x="54.5" y="20.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13" font-weight="600">Bilet Türü</text><text x="54.5" y="50.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">Tam</text><text x="54.5" y="80.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">Öğrenci</text><text x="54.5" y="110.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">65 Yaş Üstü</text><line x1="107.9" y1="1" x2="107.9" y2="121" stroke-width="1"/><text x="172.7" y="20.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13" font-weight="600">Hafta İçi (TL)</text><text x="172.7" y="50.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">60</text><text x="172.7" y="80.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">45</text><text x="172.7" y="110.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">30</text><line x1="237.5" y1="1" x2="237.5" y2="121" stroke-width="1"/><text x="306.1" y="20.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13" font-weight="600">Hafta Sonu (TL)</text><text x="306.1" y="50.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">80</text><text x="306.1" y="80.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">55</text><text x="306.1" y="110.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">40</text></svg>', true),
  -- mat-11-027 · şekilli · doğrulandı
  ('d9a6536d-84ae-5a47-af2e-6a124c3e2cea'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 2,
   'Şekildeki akış şemasına pozitif bir $x$ tam sayısı girilmekte, elde edilen sayı tek veya çift olmasına göre ilgili koldan ilerleyip son kutuda $3$ ile çarpılıp $5$ çıkarılarak çıkışa ulaşmaktadır.
Çıkışta $43$ sayısı elde edildiğine göre girişe yazılan $x$ tam sayısı kaçtır?',
   '{"options":["4","5","6","8","9"],"correctIndex":2}'::jsonb,
   'Çıkıştan geriye doğru gidilir. Son adımda $3y - 5 = 43 \Rightarrow 3y = 48 \Rightarrow y = 16$ bulunur. Bir önceki adımda $16$ sayısının elde edilmesi için iki durum incelenir:
- Gelen sayı tek ise $t + 7 = 16 \Rightarrow t = 9$ (tektir, koşulu sağlar).
- Gelen sayı çift ise $\dfrac{c}{2} = 16 \Rightarrow c = 32$ (çifttir, koşulu sağlar).
Ancak ikinci kutudan çıkan sayı $2x - 3$ olup $x$ tam sayı iken $2x - 3$ her zaman tek sayıdır (çift olan $32$''ye eşit olamaz; $2x - 3 = 32 \Rightarrow x = 17{,}5$). Dolayısıyla $2x - 3 = 9 \Rightarrow 2x = 12 \Rightarrow x = 6$ bulunur.',
   'D şıkkı ($8$) veya E şıkkı ($9$), üçüncü kolda elde edilen $t = 9$ ara değerini doğrudan $x$ sanıp $2x - 3 = 9$ adımını uygulamayan adayların düştüğü yanılgıdır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 507.1 226" width="507.1" height="226" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><line x1="50" y1="113" x2="142.6" y2="113" stroke-width="1.4"/><path d="M142.6 113 L135.3 116.1 M142.6 113 L135.3 109.9" stroke-width="1.4"/><line x1="207.6" y1="96" x2="293" y2="48.6" stroke-width="1.4"/><path d="M293 48.6 L288.1 54.9 M293 48.6 L285 49.4" stroke-width="1.4"/><text x="257.1" y="88.8" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">tek</text><line x1="207.6" y1="130" x2="293" y2="177.4" stroke-width="1.4"/><path d="M293 177.4 L285 176.6 M293 177.4 L288.1 171.1" stroke-width="1.4"/><text x="242.6" y="171.7" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">çift</text><line x1="349" y1="47.7" x2="457" y2="104.6" stroke-width="1.4"/><path d="M457 104.6 L449 103.9 M457 104.6 L451.9 98.4" stroke-width="1.4"/><text x="394.3" y="96.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">×3, −5</text><line x1="349" y1="178.3" x2="457" y2="121.4" stroke-width="1.4"/><path d="M457 121.4 L451.9 127.6 M457 121.4 L449 122.1" stroke-width="1.4"/><text x="411.7" y="170.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">×3, −5</text><circle cx="33" cy="113" r="17" fill="currentColor" fill-opacity="0.06"/><text x="33" y="117.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">x</text><rect x="142.6" y="96" width="68.7" height="34" rx="6" fill="currentColor" fill-opacity="0.06"/><text x="177" y="117.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">2x − 3</text><rect x="293" y="16" width="56" height="34" rx="6" fill="currentColor" fill-opacity="0.06"/><text x="321" y="37.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">+7</text><rect x="293" y="176" width="56" height="34" rx="6" fill="currentColor" fill-opacity="0.06"/><text x="321" y="197.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">÷2</text><circle cx="473" cy="113" r="18.1" fill="currentColor" fill-opacity="0.06"/><text x="473" y="117.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">43</text></svg>', true),
  -- mat-11-028 · doğrulandı
  ('8968a917-1ec4-5f84-b6b3-0f371ab317b3'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 1,
   'Bir konser salonunun $1.$ sırasında $8$ koltuk bulunmaktadır. İlk sıradan sonraki her sırada, bir önceki sıraya göre $3$ koltuk fazla yer almaktadır.
Buna göre bu salondaki baştan $12.$ sırada kaç koltuk vardır?',
   '{"options":["35","38","40","41","44"],"correctIndex":3}'::jsonb,
   'Sıralardaki koltuk sayısı ortak farkı $3$ olan bir aritmetik dizi oluşturur. İlk terim $a_1 = 8$ olduğuna göre $12.$ sıradaki koltuk sayısı:
$$a_{12} = 8 + (12 - 1) \times 3 = 8 + 33 = 41$$
olarak bulunur.',
   'E şıkkı ($44$), terim sayısı formülündeki $(n - 1)$ yerine doğrudan $n = 12$ koyarak $8 + 12 \times 3 = 44$ hesaplayanların düştüğü klasik $+1$ adım tuzağıdır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-11-029 · doğrulandı
  ('cd91b940-511e-5feb-81ff-29e70daa81d8'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 2,
   'Bir sayı oyununda her satırdaki ilk üç sayıdan okun sağındaki sayı aynı kurala göre üretilmektedir:
- $3,\; 2,\; 4 \;\to\; 14$
- $5,\; 3,\; 2 \;\to\; 16$
- $4,\; 5,\; 3 \;\to\; 23$
- $6,\; 4,\; 5 \;\to\; ?$

Buna göre son satırdaki soru işareti (?) yerine hangi sayı gelmelidir?',
   '{"options":["26","28","29","30","32"],"correctIndex":4}'::jsonb,
   'Her satırdaki sayılar soldan sağa $a, b, c$ olarak adlandırılırsa kural $2a + b \cdot c$ biçimindedir:
- $2(3) + 2 \cdot 4 = 6 + 8 = 14$
- $2(5) + 3 \cdot 2 = 10 + 6 = 16$
- $2(4) + 5 \cdot 3 = 8 + 15 = 23$
Aynı kural son satıra uygulanırsa $2(6) + 4 \cdot 5 = 12 + 20 = 32$ elde edilir.',
   'C şıkkı ($29$), yalnızca diğer satırlarda sınamadan $a \cdot b + c$ kuralını ($6 \times 4 + 5 = 29$) uygulayan adayları yanıltır; bulunan kural mutlaka verilen üç satırın tamamında doğrulanmalıdır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-11-030 · şekilli · doğrulandı
  ('510b70d4-81bd-5376-9279-d3faf48c8d03'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 3,
   'Bir firmanın K, L, M ve N şubelerinin iki dönemlik satış adetleri ile dönemlik ve yıllık toplamları aşağıdaki tabloda verilmiştir.
Tablodaki verilere göre $c - a$ farkı kaçtır?',
   '{"options":["12","18","22","24","28"],"correctIndex":1}'::jsonb,
   '1. Dönem sütununun toplamı $184$ olduğundan $a + 52 + 48 + 40 = 184 \Rightarrow a + 140 = 184 \Rightarrow a = 44$ bulunur.
N şubesinin yıllık toplamı $94$ olduğundan $40 + e = 94 \Rightarrow e = 54$ olur.
2. Dönem sütununun toplamı $206$ olduğundan $36 + c + 54 + 54 = 206 \Rightarrow c + 144 = 206 \Rightarrow c = 62$ elde edilir.
Sonuç olarak $c - a = 62 - 44 = 18$''dir.',
   'C şıkkı ($22$) ve D şıkkı ($24$), 2. Dönem toplamında N şubesi için bulduğu $e = 54$ değerini sütun toplamına katarken hatalı hesaplama yapmaktan kaynaklanır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 361.9 182" width="361.9" height="182" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><rect x="1" y="1" width="359.9" height="30" fill="currentColor" fill-opacity="0.1" stroke="none"/><rect x="1" y="1" width="359.9" height="180" stroke-width="1.4"/><line x1="1" y1="31" x2="360.9" y2="31" stroke-width="1"/><line x1="1" y1="61" x2="360.9" y2="61" stroke-width="1"/><line x1="1" y1="91" x2="360.9" y2="91" stroke-width="1"/><line x1="1" y1="121" x2="360.9" y2="121" stroke-width="1"/><line x1="1" y1="151" x2="360.9" y2="151" stroke-width="1"/><text x="35.6" y="20.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13" font-weight="600">Şube</text><text x="35.6" y="50.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">K</text><text x="35.6" y="80.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">L</text><text x="35.6" y="110.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">M</text><text x="35.6" y="140.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">N</text><text x="35.6" y="170.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">Toplam</text><line x1="70.2" y1="1" x2="70.2" y2="181" stroke-width="1"/><text x="112.4" y="20.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13" font-weight="600">1. Dönem</text><text x="112.4" y="50.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">a</text><text x="112.4" y="80.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">52</text><text x="112.4" y="110.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">48</text><text x="112.4" y="140.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">40</text><text x="112.4" y="170.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">184</text><line x1="154.6" y1="1" x2="154.6" y2="181" stroke-width="1"/><text x="196.7" y="20.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13" font-weight="600">2. Dönem</text><text x="196.7" y="50.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">36</text><text x="196.7" y="80.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">c</text><text x="196.7" y="110.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">54</text><text x="196.7" y="140.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">e</text><text x="196.7" y="170.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">206</text><line x1="238.9" y1="1" x2="238.9" y2="181" stroke-width="1"/><text x="299.9" y="20.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13" font-weight="600">Yıllık Toplam</text><text x="299.9" y="50.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">b</text><text x="299.9" y="80.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">d</text><text x="299.9" y="110.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">102</text><text x="299.9" y="140.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">94</text><text x="299.9" y="170.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">390</text></svg>', true),
  -- mat-11-031 · şekilli · doğrulandı
  ('2ebf4290-559d-5a6c-a6ea-073291714ee2'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 2,
   'Bir okuldaki dört kulübe kayıtlı öğrenci sayıları aşağıdaki sütun grafiğinde gösterilmiştir.
Bu veriler bir daire grafiğiyle gösterilseydi Spor kulübüne ait daire diliminin merkez açısı kaç derece olurdu?',
   '{"options":["120","105","90","135","150"],"correctIndex":0}'::jsonb,
   'Toplam öğrenci sayısı $45 + 30 + 60 + 45 = 180$''dir. Daire grafiğinin tamamı $360^\circ$ olduğu için $180$ öğrenciye $360^\circ$ karşılık gelir (öğrenci başına $2^\circ$). Spor kulübünde $60$ öğrenci olduğundan merkez açısı $\dfrac{60}{180} \times 360 = 120^\circ$ bulunur.',
   'C şıkkı ($90$), Spor kulübündeki $60$ sayısını hatalı şekilde toplam $240$ ile ilişkilendirip dörtte bir sanmaktan; B şıkkı ($105$) ise toplam öğrenciyi yanlış hesaplamaktan kaynaklanır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 282 242" width="282" height="242" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><text x="40" y="205.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">0</text><text x="40" y="171.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">15</text><text x="40" y="137.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">30</text><text x="40" y="103.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">45</text><text x="40" y="69.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">60</text><text x="40" y="35.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">75</text><g stroke-width="0.6" stroke-opacity="0.3"><line x1="46" y1="202" x2="266" y2="202"/><line x1="46" y1="168" x2="266" y2="168"/><line x1="46" y1="134" x2="266" y2="134"/><line x1="46" y1="100" x2="266" y2="100"/><line x1="46" y1="66" x2="266" y2="66"/><line x1="46" y1="32" x2="266" y2="32"/></g><line x1="46" y1="28" x2="46" y2="202"/><line x1="46" y1="202" x2="266" y2="202"/><text x="40" y="19.9" fill="currentColor" stroke="none" text-anchor="start" font-size="11">Kişi</text><rect x="57" y="100" width="33" height="102" fill="currentColor" fill-opacity="0.22"/><text x="73.5" y="94.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">45</text><text x="73.5" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">Müzik</text><rect x="112" y="134" width="33" height="68" fill="currentColor" fill-opacity="0.22"/><text x="128.5" y="128.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">30</text><text x="128.5" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">Tiyatro</text><rect x="167" y="66" width="33" height="136" fill="currentColor" fill-opacity="0.22"/><text x="183.5" y="60.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">60</text><text x="183.5" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">Spor</text><rect x="222" y="100" width="33" height="102" fill="currentColor" fill-opacity="0.22"/><text x="238.5" y="94.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">45</text><text x="238.5" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">Bilim</text></svg>', true),
  -- mat-11-032 · doğrulandı
  ('8d21a6cf-bad5-55a2-b037-b0aad1bd073a'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 3,
   '$1$''den $40$''a kadar numaralandırılmış $40$ dolabın tamamının kapağı başlangıçta kapalıdır. Sırasıyla şu üç işlem uygulanır:
- $1.$ adımda numarası $2$''nin katı olan dolapların,
- $2.$ adımda numarası $3$''ün katı olan dolapların,
- $3.$ adımda numarası $5$''in katı olan dolapların
durumu değiştirilir (kapalıysa açılır, açıksa kapatılır).

Üçüncü adımın sonunda kapağı açık kalan toplam kaç dolap vardır?',
   '{"options":["17","19","20","21","30"],"correctIndex":3}'::jsonb,
   'Başlangıçta kapalı olan bir dolabın sonunda açık kalabilmesi için durumunun tek sayıda ($1$ veya $3$ kez) değişmiş olması gerekir:
- Her üç sayıya da ($2, 3, 5 \Rightarrow 30$''un katı) bölünen dolap sayısı $\lfloor 40/30 \rfloor = 1$''dir (yalnızca $30$; $3$ kez değiştiğinden açık).
- Tam iki sayıya bölünenler ($2$ kez değiştiğinden kapalı):
- Yalnız $2$ ve $3$''e ($6$''nın katı, $30$ hariç): $6 - 1 = 5$
- Yalnız $2$ ve $5$''e ($10$''un katı, $30$ hariç): $4 - 1 = 3$
- Yalnız $3$ ve $5$''e ($15$''in katı, $30$ hariç): $2 - 1 = 1$
- Yalnız bir sayıya bölünenler ($1$ kez değiştiğinden açık):
- Yalnız $2$''nin katı: $20 - 5 - 3 - 1 = 11$
- Yalnız $3$''ün katı: $13 - 5 - 1 - 1 = 6$
- Yalnız $5$''in katı: $8 - 3 - 1 - 1 = 3$
Toplam açık dolap sayısı $11 + 6 + 3 + 1 = 21$''dir.',
   'E şıkkı ($30$), $2$, $3$ veya $5$''e bölünen tüm dolapların birleşimini ($20 + 13 + 8 - 6 - 4 - 2 + 1 = 30$) bulup iki kez değişenlerin tekrar kapandığını unutanları; C şıkkı ($20$) ise $30$ numaralı dolabın $3$ kez değişip yeniden açıldığını gözden kaçıranları yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-11-033 · şekilli · doğrulandı
  ('c810a8b0-df1e-5697-9983-cedb16f11145'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 1,
   'Bir mağazada bir günde satılan toplam $720$ ürünün türlerine göre dağılımı aşağıdaki daire grafiğinde verilmiştir.
Buna göre satılan ayakkabı sayısı, satılan çanta sayısından kaç fazladır?',
   '{"options":["90","105","120","135","150"],"correctIndex":2}'::jsonb,
   '$360^\circ$ toplam $720$ ürüne denk geldiğinden her $1^\circ$''lik açı $\dfrac{720}{360} = 2$ ürüne karşılık gelir. Ayakkabı ($105^\circ$) ile çanta ($45^\circ$) arasındaki açı farkı $105 - 45 = 60^\circ$''dir. Dolayısıyla ürün farkı $60 \times 2 = 120$ adet olur.',
   'B şıkkı ($105$) ve E şıkkı ($150$), ayakkabı açısı olan $105^\circ$''yi doğrudan adet sanmaktan veya çarpan olan $2$ yerine farklı bir oran kullanmaktan kaynaklanır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 383.5 205.9" width="383.5" height="205.9" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><g transform="translate(110 2)"><path d="M95 99 L95 14 A85 85 0 0 1 168.6 141.5 Z" fill="currentColor" fill-opacity="0.08"/><line x1="163.4" y1="59.5" x2="175.5" y2="52.5" stroke-width="1"/><text x="179" y="54.7" fill="currentColor" stroke="none" text-anchor="start" font-size="12">Gömlek (120°)</text><path d="M95 99 L168.6 141.5 A85 85 0 0 1 52.5 172.6 Z" fill="currentColor" fill-opacity="0.3"/><line x1="115.4" y1="175.3" x2="119.1" y2="188.8" stroke-width="1"/><text x="120.1" y="196.9" fill="currentColor" stroke="none" text-anchor="start" font-size="12">Pantolon (90°)</text><path d="M95 99 L52.5 172.6 A85 85 0 0 1 34.9 38.9 Z" fill="currentColor" fill-opacity="0.16"/><line x1="16.7" y1="109.3" x2="2.8" y2="111.1" stroke-width="1"/><text x="-1.2" y="115.9" fill="currentColor" stroke="none" text-anchor="end" font-size="12">Ayakkabı (105°)</text><path d="M95 99 L34.9 38.9 A85 85 0 0 1 95 14 Z" fill="currentColor" fill-opacity="0.42"/><line x1="64.8" y1="26" x2="59.4" y2="13.1" stroke-width="1"/><text x="57.9" y="13.6" fill="currentColor" stroke="none" text-anchor="end" font-size="12">Çanta (45°)</text></g></svg>', true),
  -- mat-11-034 · şekilli · doğrulandı
  ('257ba1fa-d508-5042-b08b-3be50f0169a2'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 2,
   'Bir işletmenin ilk beş ayda elde ettiği aylık kâr tutarları (milyon TL) aşağıdaki çizgi grafiğinde verilmiştir.
Buna göre Mayıs ayındaki kâr, ilk dört ayın ortalama kârından yüzde kaç fazladır?',
   '{"options":["%20","%25","%30","%35","%40"],"correctIndex":1}'::jsonb,
   'İlk dört ayın (Ocak–Nisan) toplam kârı $15 + 21 + 18 + 26 = 80$ milyon TL, ortalaması ise $\dfrac{80}{4} = 20$ milyon TL''dir. Mayıs ayındaki kâr ($25$ milyon TL), bu ortalamadan $25 - 20 = 5$ milyon TL fazladır. Artış yüzdesi $\dfrac{5}{20} \times 100 = \%25$ olarak bulunur.',
   'A şıkkı ($\%20$), farkı ($5$) ilk dört ayın ortalaması olan $20$''ye bölmek yerine Mayıs ayı değeri olan $25$''e bölerek $\dfrac{5}{25} = \%20$ hesaplayanların düştüğü temel yüzde referansı tuzağıdır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 302 242" width="302" height="242" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><text x="40" y="205.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">0</text><text x="40" y="177.5" fill="currentColor" stroke="none" text-anchor="end" font-size="11">5</text><text x="40" y="149.2" fill="currentColor" stroke="none" text-anchor="end" font-size="11">10</text><text x="40" y="120.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">15</text><text x="40" y="92.5" fill="currentColor" stroke="none" text-anchor="end" font-size="11">20</text><text x="40" y="64.2" fill="currentColor" stroke="none" text-anchor="end" font-size="11">25</text><text x="40" y="35.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">30</text><g stroke-width="0.6" stroke-opacity="0.3"><line x1="46" y1="202" x2="286" y2="202"/><line x1="46" y1="173.7" x2="286" y2="173.7"/><line x1="46" y1="145.3" x2="286" y2="145.3"/><line x1="46" y1="117" x2="286" y2="117"/><line x1="46" y1="88.7" x2="286" y2="88.7"/><line x1="46" y1="60.3" x2="286" y2="60.3"/><line x1="46" y1="32" x2="286" y2="32"/></g><line x1="46" y1="28" x2="46" y2="202"/><line x1="46" y1="202" x2="286" y2="202"/><text x="40" y="19.9" fill="currentColor" stroke="none" text-anchor="start" font-size="11">mn TL</text><text x="70" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">Oca</text><text x="118" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">Şub</text><text x="166" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">Mar</text><text x="214" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">Nis</text><text x="262" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">May</text><polyline points="70,117 118,83 166,100 214,54.7 262,60.3" stroke-width="2.2"/><circle cx="70" cy="117" r="3" fill="currentColor" stroke="none"/><circle cx="118" cy="83" r="3" fill="currentColor" stroke="none"/><circle cx="166" cy="100" r="3" fill="currentColor" stroke="none"/><circle cx="214" cy="54.7" r="3" fill="currentColor" stroke="none"/><circle cx="262" cy="60.3" r="3" fill="currentColor" stroke="none"/></svg>', true),
  -- mat-11-035 · doğrulandı
  ('27ecaea0-9784-56d0-920a-d3b353feaaa8'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 3,
   'Pozitif tam sayılar $1$''den başlanarak her $k.$ satırda $2k - 1$ tane ardışık tam sayı olacak biçimde aşağıdaki düzende satırlara yazılıyor:
- $1.$ satır: $1$
- $2.$ satır: $2,\; 3,\; 4$
- $3.$ satır: $5,\; 6,\; 7,\; 8,\; 9$
- $4.$ satır: $10,\; 11,\; 12,\; 13,\; 14,\; 15,\; 16$

Buna göre $12.$ satırın tam ortasında yer alan sayı kaçtır?',
   '{"options":["121","125","129","131","133"],"correctIndex":4}'::jsonb,
   'İlk $k$ satırdaki toplam terim sayısı $1 + 3 + 5 + \cdots + (2k - 1) = k^2$''dir. Bu nedenle her $k.$ satırın son sayısı $k^2$, bir sonraki satırın ilk sayısı ise $(k - 1)^2 + 1$ olur.
$12.$ satırda ilk sayı $11^2 + 1 = 122$, son sayı $12^2 = 144$''tür. Ardışık sayıların ortancası ilk ve son sayının ortalamasıdır:
$$\frac{122 + 144}{2} = \frac{266}{2} = 133$$',
   'A şıkkı ($121$), $11.$ satırın son terimi olan $11^2$ değeridir; D şıkkı ($131$) ise $12.$ satırın başlangıcını $121$ alıp sonu hatalı sınırlamaktan ortaya çıkar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-11-036 · şekilli · doğrulandı
  ('8dd0d310-0fe5-5d76-b3b7-460d8fe6f153'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 2,
   'Şekildeki işlem makinesine girilen bir sayıya okların üzerindeki işlemler soldan sağa uygulanmaktadır. Elde edilen çıkış değeri tekrar girişe verilerek işlem zinciri art arda çalıştırılmaktadır.
Başlangıçta girişe $4$ sayısı yazıldığında 3. turun sonunda çıkışta hangi sayı görülür?',
   '{"options":["14","17","20","23","26"],"correctIndex":3}'::jsonb,
   'Makinenin bir turda uyguladığı net kural $\dfrac{(3x - 1) + 5}{2} = \dfrac{3x + 4}{2}$''dir. Başlangıç değeri $x = 4$ için turlar izlenir:
- $1.$ tur: $\dfrac{3(4) + 4}{2} = \dfrac{16}{2} = 8$
- $2.$ tur: $\dfrac{3(8) + 4}{2} = \dfrac{28}{2} = 14$
- $3.$ tur: $\dfrac{3(14) + 4}{2} = \dfrac{46}{2} = 23$
Üçüncü turun sonunda çıkışta $23$ sayısı görülür.',
   'A şıkkı ($14$), ikinci tur sonunda durup 3. turu uygulamayan adayların bulacağı ara değerdir; C şıkkı ($20$) ise her turda artışın sabit ($+6$) ilerlediğini sanarak $8 + 6 + 6 = 20$ yazanların düştüğü doğrusallık tuzağıdır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 463.3 66" width="463.3" height="66" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><line x1="50" y1="33" x2="126.6" y2="33" stroke-width="1.4"/><path d="M126.6 33 L119.3 36.1 M126.6 33 L119.3 29.9" stroke-width="1.4"/><text x="88.3" y="46.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">×3, −1</text><line x1="195.4" y1="33" x2="254.6" y2="33" stroke-width="1.4"/><path d="M254.6 33 L247.3 36.1 M254.6 33 L247.3 29.9" stroke-width="1.4"/><text x="225" y="46.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">+5</text><line x1="323.4" y1="33" x2="386.7" y2="33" stroke-width="1.4"/><path d="M386.7 33 L379.3 36.1 M386.7 33 L379.3 29.9" stroke-width="1.4"/><text x="355" y="46.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">÷2</text><circle cx="33" cy="33" r="17" fill="currentColor" fill-opacity="0.06"/><text x="33" y="37.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">x</text><rect x="126.6" y="16" width="68.7" height="34" rx="6" fill="currentColor" fill-opacity="0.06"/><text x="161" y="37.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">3x − 1</text><rect x="254.6" y="16" width="68.7" height="34" rx="6" fill="currentColor" fill-opacity="0.06"/><text x="289" y="37.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">3x + 4</text><circle cx="417" cy="33" r="30.3" fill="currentColor" fill-opacity="0.06"/><text x="417" y="37.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">Çıkış</text></svg>', true),
  -- mat-11-037 · şekilli · doğrulandı
  ('5289aeb5-ee47-5c17-ab25-f06b8a02550a'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 1,
   'Bir öğrencinin dört gün boyunca okuduğu kitap sayfa sayıları aşağıdaki sütun grafiğinde gösterilmiştir.
En çok kitap okuduğu gündeki sayfa sayısı, en az kitap okuduğu gündeki sayfa sayısından yüzde kaç fazladır?',
   '{"options":["%50","%40","%33","%25","%20"],"correctIndex":0}'::jsonb,
   'Grafikten en az okunan günün Pazartesi ($40$ sayfa), en çok okunan günün Perşembe ($60$ sayfa) olduğu görülür. Aradaki fark $60 - 40 = 20$ sayfadır. En az okunan güne göre fazlalık yüzdesi $\dfrac{20}{40} \cdot 100 = \%50$ bulunur.',
   'C şıkkı ($\%33$), $20$ sayfalık farkı başlangıçtaki küçük değer ($40$) yerine büyük değer olan $60$''a bölerek $\dfrac{20}{60} \approx \%33$ hesaplayanların düştüğü referans hatasıdır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 282 242" width="282" height="242" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><text x="40" y="205.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">0</text><text x="40" y="171.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">15</text><text x="40" y="137.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">30</text><text x="40" y="103.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">45</text><text x="40" y="69.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">60</text><text x="40" y="35.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">75</text><g stroke-width="0.6" stroke-opacity="0.3"><line x1="46" y1="202" x2="266" y2="202"/><line x1="46" y1="168" x2="266" y2="168"/><line x1="46" y1="134" x2="266" y2="134"/><line x1="46" y1="100" x2="266" y2="100"/><line x1="46" y1="66" x2="266" y2="66"/><line x1="46" y1="32" x2="266" y2="32"/></g><line x1="46" y1="28" x2="46" y2="202"/><line x1="46" y1="202" x2="266" y2="202"/><text x="40" y="19.9" fill="currentColor" stroke="none" text-anchor="start" font-size="11">Sayfa</text><rect x="57" y="111.3" width="33" height="90.7" fill="currentColor" fill-opacity="0.22"/><text x="73.5" y="106.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">40</text><text x="73.5" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">Pzt</text><rect x="112" y="77.3" width="33" height="124.7" fill="currentColor" fill-opacity="0.22"/><text x="128.5" y="72.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">55</text><text x="128.5" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">Sal</text><rect x="167" y="100" width="33" height="102" fill="currentColor" fill-opacity="0.22"/><text x="183.5" y="94.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">45</text><text x="183.5" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">Çar</text><rect x="222" y="66" width="33" height="136" fill="currentColor" fill-opacity="0.22"/><text x="238.5" y="60.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">60</text><text x="238.5" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">Per</text></svg>', true),
  -- mat-11-038 · şekilli · doğrulandı
  ('895811ca-65bb-5f00-8ca3-218c294413dc'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 2,
   'Bir üniversitedeki toplam $1.440$ öğrencinin dört fakülteye göre dağılımı aşağıdaki daire grafiğinde verilmiştir.
Buna göre Mühendislik fakültesindeki öğrenci sayısı, Tıp fakültesindeki öğrenci sayısından kaç fazladır?',
   '{"options":["120","140","160","180","200"],"correctIndex":1}'::jsonb,
   '$360^\circ$ toplam $1.440$ öğrenciye denk geldiğinden her $1^\circ$''lik merkez açı $\dfrac{1.440}{360} = 4$ öğrenciyi temsil eder. Mühendislik ($100^\circ$) ile Tıp ($65^\circ$) arasındaki açı farkı $100 - 65 = 35^\circ$ olduğundan öğrenci farkı $35 \cdot 4 = 140$ kişi bulunur.',
   'A şıkkı ($120$) veya C şıkkı ($160$), her $1^\circ$''ye düşen $4$ öğrenci çarpanını doğru bulduktan sonra $100 - 65$ çıkarma işleminde veya çarpmada dikkatsizlik yapanları yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 370.6 198" width="370.6" height="198" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><g transform="translate(72 0)"><path d="M95 99 L95 14 A85 85 0 0 1 178.7 113.8 Z" fill="currentColor" fill-opacity="0.08"/><line x1="155.5" y1="48.2" x2="166.2" y2="39.2" stroke-width="1"/><text x="169.3" y="40.8" fill="currentColor" stroke="none" text-anchor="start" font-size="12">Mühendislik (100°)</text><path d="M95 99 L178.7 113.8 A85 85 0 0 1 87.6 183.7 Z" fill="currentColor" fill-opacity="0.3"/><line x1="143.1" y1="161.7" x2="151.6" y2="172.8" stroke-width="1"/><text x="154" y="180.2" fill="currentColor" stroke="none" text-anchor="start" font-size="12">Eğitim (85°)</text><path d="M95 99 L87.6 183.7 A85 85 0 0 1 15.1 128.1 Z" fill="currentColor" fill-opacity="0.16"/><line x1="46.9" y1="161.7" x2="38.4" y2="172.8" stroke-width="1"/><text x="36" y="180.2" fill="currentColor" stroke="none" text-anchor="end" font-size="12">Tıp (65°)</text><path d="M95 99 L15.1 128.1 A85 85 0 0 1 95 14 Z" fill="currentColor" fill-opacity="0.42"/><line x1="30.3" y1="53.7" x2="18.8" y2="45.7" stroke-width="1"/><text x="15.5" y="47.6" fill="currentColor" stroke="none" text-anchor="end" font-size="12">Hukuk (110°)</text></g></svg>', true),
  -- mat-11-039 · şekilli · doğrulandı
  ('d307ad5c-dce6-5905-b1c8-c349060168bf'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 1,
   'Bir kafede satılan dört ürünün birim satış fiyatları aşağıdaki tabloda verilmiştir.
Bu kafeden $3$ çay ve $2$ tost sipariş eden bir müşteriye toplam tutar üzerinden $\%20$ indirim uygulanmıştır. Kasaya $200$ TL veren müşteri kaç TL para üstü alır?',
   '{"options":["33","35","68","72","132"],"correctIndex":2}'::jsonb,
   'İndirimsiz toplam tutar $3 \cdot 15 + 2 \cdot 60 = 45 + 120 = 165$ TL''dir. $\%20$ indirim sonrası ödenecek tutar $165 \cdot 0{,}80 = 132$ TL olur. Kasaya $200$ TL verildiğinde alınan para üstü $200 - 132 = 68$ TL bulunur.',
   'E şıkkı ($132$) indirimli fatura tutarını para üstü yerine işaretleyen adayı; A şıkkı ($33$) ise yalnızca yapılan indirim tutarını ($165 \cdot 0{,}20 = 33$) seçen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200.8 152" width="200.8" height="152" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><rect x="1" y="1" width="198.8" height="30" fill="currentColor" fill-opacity="0.1" stroke="none"/><rect x="1" y="1" width="198.8" height="150" stroke-width="1.4"/><line x1="1" y1="31" x2="199.8" y2="31" stroke-width="1"/><line x1="1" y1="61" x2="199.8" y2="61" stroke-width="1"/><line x1="1" y1="91" x2="199.8" y2="91" stroke-width="1"/><line x1="1" y1="121" x2="199.8" y2="121" stroke-width="1"/><text x="50.7" y="20.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13" font-weight="600">Ürün</text><text x="50.7" y="50.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">Çay</text><text x="50.7" y="80.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">Kahve</text><text x="50.7" y="110.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">Tost</text><text x="50.7" y="140.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">Meyve Suyu</text><line x1="100.4" y1="1" x2="100.4" y2="151" stroke-width="1"/><text x="150.1" y="20.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13" font-weight="600">Fiyat (TL)</text><text x="150.1" y="50.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">15</text><text x="150.1" y="80.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">45</text><text x="150.1" y="110.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">60</text><text x="150.1" y="140.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">35</text></svg>', true),
  -- mat-11-040 · şekilli · doğrulandı
  ('a435c2fd-cb51-555e-b940-1cf903ffb3b0'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 2,
   'Bir atölyenin ilk dört aydaki aylık gelir ve gider tutarları (bin TL cinsinden) aşağıdaki çift çizgi grafiğinde verilmiştir.
Buna göre bu dört ayda elde edilen toplam net kâr (Gelir $-$ Gider) kaç bin TL''dir?',
   '{"options":["85","95","100","105","115"],"correctIndex":3}'::jsonb,
   'Her ayın net kârı (Gelir $-$ Gider) ayrı ayrı toplanır veya toplam gelirden toplam gider çıkarılır:
- Toplam gelir: $50 + 70 + 60 + 90 = 270$ bin TL.
- Toplam gider: $30 + 45 + 40 + 50 = 165$ bin TL.
Net kâr $270 - 165 = 105$ bin TL olarak bulunur.',
   'E şıkkı ($115$) veya C şıkkı ($100$), Şubat ayındaki gideri ($45$) çizgi ekseninden $40$ ya da $50$ okuyup toplam gideri yanlış hesaplayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 282 250" width="282" height="250" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><text x="40" y="205.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">0</text><text x="40" y="171.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">20</text><text x="40" y="137.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">40</text><text x="40" y="103.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">60</text><text x="40" y="69.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">80</text><text x="40" y="35.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">100</text><g stroke-width="0.6" stroke-opacity="0.3"><line x1="46" y1="202" x2="266" y2="202"/><line x1="46" y1="168" x2="266" y2="168"/><line x1="46" y1="134" x2="266" y2="134"/><line x1="46" y1="100" x2="266" y2="100"/><line x1="46" y1="66" x2="266" y2="66"/><line x1="46" y1="32" x2="266" y2="32"/></g><line x1="46" y1="28" x2="46" y2="202"/><line x1="46" y1="202" x2="266" y2="202"/><text x="40" y="19.9" fill="currentColor" stroke="none" text-anchor="start" font-size="11">Bin TL</text><text x="73.5" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">Oca</text><text x="128.5" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">Şub</text><text x="183.5" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">Mar</text><text x="238.5" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">Nis</text><polyline points="73.5,117 128.5,83 183.5,100 238.5,49" stroke-width="2.2"/><circle cx="73.5" cy="117" r="3" fill="currentColor" stroke="none"/><circle cx="128.5" cy="83" r="3" fill="currentColor" stroke="none"/><circle cx="183.5" cy="100" r="3" fill="currentColor" stroke="none"/><circle cx="238.5" cy="49" r="3" fill="currentColor" stroke="none"/><polyline points="73.5,151 128.5,125.5 183.5,134 238.5,117" stroke-width="2.2" stroke-dasharray="7 5"/><circle cx="73.5" cy="151" r="3" fill="currentColor" stroke="none"/><circle cx="128.5" cy="125.5" r="3" fill="currentColor" stroke="none"/><circle cx="183.5" cy="134" r="3" fill="currentColor" stroke="none"/><circle cx="238.5" cy="117" r="3" fill="currentColor" stroke="none"/><line x1="46" y1="232" x2="68" y2="232"/><text x="72" y="235.9" fill="currentColor" stroke="none" text-anchor="start" font-size="11">Gelir</text><line x1="111.9" y1="232" x2="133.9" y2="232" stroke-dasharray="7 5"/><text x="137.9" y="235.9" fill="currentColor" stroke="none" text-anchor="start" font-size="11">Gider</text></svg>', true),
  -- mat-11-041 · doğrulandı
  ('cb20bc4d-130c-54e9-80e7-b0f6af4c2b0b'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 1,
   '$\{1, 2, 3, 4, 5\}$ kümesinin elemanlarının tamamı birer kez kullanılarak oluşturulan beş basamaklı $ABCDE$ doğal sayısında;
- $C = 3$
- $A + B = D + E$
- $B > A$
koşulları sağlanmaktadır.
Buna göre yazılabilecek en büyük $ABCDE$ sayısında $D$ rakamı kaçtır?',
   '{"options":["1","2","3","4","5"],"correctIndex":4}'::jsonb,
   '$C = 3$ kullanıldığı için kalan dört rakam $\{1, 2, 4, 5\}$ olup toplamları $1 + 2 + 4 + 5 = 12$''dir. $A + B = D + E = 6$ olmalıdır. Bu kümede toplamı $6$ veren yalnızca iki çift vardır: $\{1, 5\}$ ve $\{2, 4\}$.
$ABCDE$ sayısının en büyük olması için $A$ en büyük seçilmelidir; ancak $B > A$ koşulu nedeniyle $5$ başa gelemez ($A = 1, B = 5$ olur). Bu yüzden $A = 2, B = 4$ seçilir ve diğer çift $\{1, 5\}$ son iki basamağa $D = 5, E = 1$ olarak yerleştirilir. En büyük sayı $24.351$ olup $D = 5$''tir.',
   'D şıkkı ($4$), $B > A$ koşulunu unutup $A = 5, B = 1$ alarak en büyük sayıyı $51.342$ ($D = 4$) sanan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-11-042 · şekilli · doğrulandı
  ('db6c3929-9579-58cf-a973-79c1858537f6'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 2,
   'Şekildeki akış şemasına pozitif bir $x$ tam sayısı girilmekte, $x^2 + 5$ sonucu çift veya tek olmasına göre ilgili koldan ilerleyerek çıkışa ulaşmaktadır.
Çıkışta $27$ sayısı elde edildiğine göre girişe yazılan $x$ tam sayısı kaçtır?',
   '{"options":["7","5","6","8","9"],"correctIndex":0}'::jsonb,
   'İki kol ayrı ayrı test edilir:
- Alt kol (tek koşulu): $x^2 + 5 - 3 = 27 \Rightarrow x^2 = 25 \Rightarrow x = 5$ gelir; ancak $x = 5$ için ara değer $5^2 + 5 = 30$ çifttir, bu yüzden alt kola giremez.
- Üst kol (çift koşulu): $\dfrac{x^2 + 5}{2} = 27 \Rightarrow x^2 + 5 = 54 \Rightarrow x^2 = 49 \Rightarrow x = 7$ gelir. $7^2 + 5 = 54$ gerçekten çift olduğundan koşul sağlanır.
Doğru değer $x = 7$''dir.',
   'B şıkkı ($5$), alt koldan çıkan $x = 5$ değerini bulduktan sonra $5^2 + 5 = 30$ ara sayısının tek mi çift mi olduğunu kontrol etmeden işaretleyen adayların düştüğü tuzaktır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 499.1 226" width="499.1" height="226" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><line x1="50" y1="113" x2="142.6" y2="113" stroke-width="1.4"/><path d="M142.6 113 L135.3 116.1 M142.6 113 L135.3 109.9" stroke-width="1.4"/><line x1="207.6" y1="96" x2="293" y2="48.6" stroke-width="1.4"/><path d="M293 48.6 L288.1 54.9 M293 48.6 L285 49.4" stroke-width="1.4"/><text x="258" y="90.3" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">çift</text><line x1="207.6" y1="130" x2="293" y2="177.4" stroke-width="1.4"/><path d="M293 177.4 L285 176.6 M293 177.4 L288.1 171.1" stroke-width="1.4"/><text x="243.5" y="170.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">tek</text><line x1="349" y1="48.6" x2="449.2" y2="104.2" stroke-width="1.4"/><path d="M449.2 104.2 L441.2 103.3 M449.2 104.2 L444.2 97.9" stroke-width="1.4"/><line x1="349" y1="177.4" x2="449.2" y2="121.8" stroke-width="1.4"/><path d="M449.2 121.8 L444.2 128.1 M449.2 121.8 L441.2 122.7" stroke-width="1.4"/><circle cx="33" cy="113" r="17" fill="currentColor" fill-opacity="0.06"/><text x="33" y="117.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">x</text><rect x="142.6" y="96" width="68.7" height="34" rx="6" fill="currentColor" fill-opacity="0.06"/><text x="177" y="117.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">x² + 5</text><rect x="293" y="16" width="56" height="34" rx="6" fill="currentColor" fill-opacity="0.06"/><text x="321" y="37.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">÷2</text><rect x="293" y="176" width="56" height="34" rx="6" fill="currentColor" fill-opacity="0.06"/><text x="321" y="197.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">−3</text><circle cx="465" cy="113" r="18.1" fill="currentColor" fill-opacity="0.06"/><text x="465" y="117.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">27</text></svg>', true),
  -- mat-11-043 · şekilli · doğrulandı
  ('f54df45c-72d9-5bfd-aaf4-29d0f261d96a'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 2,
   'Dört yarışmacının üç etaplı bir bilgi yarışmasında aldığı puanlar aşağıdaki tabloda verilmiştir.
Ali''nin üç etap ortalaması $24$ puan ve Can''ın $2$. etap puanı ($b$) Burak''ın toplam puanının $\dfrac{1}{4}$''üne eşit olduğuna göre $a - b$ farkı kaçtır?',
   '{"options":["12","14","16","18","20"],"correctIndex":1}'::jsonb,
   'Ali''nin üç etaptaki toplam puanı $3 \cdot 24 = 72$ olduğundan $18 + 24 + a = 72 \Rightarrow a = 30$ bulunur.
Burak''ın toplam puanı $20 + 16 + 28 = 64$''tür; buradan Can''ın $2$. etap puanı $b = \dfrac{64}{4} = 16$ elde edilir.
Sonuç olarak $a - b = 30 - 16 = 14$ bulunur.',
   'C şıkkı ($16$), yalnızca $b$''yi bulup soru $a - b$ farkını istediği hâlde $16$''yı işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 324.2 152" width="324.2" height="152" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><rect x="1" y="1" width="322.2" height="30" fill="currentColor" fill-opacity="0.1" stroke="none"/><rect x="1" y="1" width="322.2" height="150" stroke-width="1.4"/><line x1="1" y1="31" x2="323.2" y2="31" stroke-width="1"/><line x1="1" y1="61" x2="323.2" y2="61" stroke-width="1"/><line x1="1" y1="91" x2="323.2" y2="91" stroke-width="1"/><line x1="1" y1="121" x2="323.2" y2="121" stroke-width="1"/><text x="46.9" y="20.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13" font-weight="600">Yarışmacı</text><text x="46.9" y="50.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">Ali</text><text x="46.9" y="80.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">Burak</text><text x="46.9" y="110.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">Can</text><text x="46.9" y="140.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">Deniz</text><line x1="92.9" y1="1" x2="92.9" y2="151" stroke-width="1"/><text x="131.3" y="20.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13" font-weight="600">1. Etap</text><text x="131.3" y="50.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">18</text><text x="131.3" y="80.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">20</text><text x="131.3" y="110.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">22</text><text x="131.3" y="140.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">15</text><line x1="169.6" y1="1" x2="169.6" y2="151" stroke-width="1"/><text x="208" y="20.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13" font-weight="600">2. Etap</text><text x="208" y="50.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">24</text><text x="208" y="80.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">16</text><text x="208" y="110.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">b</text><text x="208" y="140.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">25</text><line x1="246.4" y1="1" x2="246.4" y2="151" stroke-width="1"/><text x="284.8" y="20.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13" font-weight="600">3. Etap</text><text x="284.8" y="50.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">a</text><text x="284.8" y="80.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">28</text><text x="284.8" y="110.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">20</text><text x="284.8" y="140.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">20</text></svg>', true),
  -- mat-11-044 · doğrulandı
  ('03824fa8-f1c4-529a-a609-28b78c6da9e4'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 3,
   'Rakamları sıfırdan farklı üç basamaklı bir $ABC$ doğal sayısı şu üç koşulu sağlamaktadır:
- $A + B = C$''dir.
- $CBA - ABC = 297$''dir.
- $ABC$ sayısının $5$ ile bölümünden kalan $2$''dir.

Buna göre $ABC$ sayısının rakamları çarpımı $A \cdot B \cdot C$ kaçtır?',
   '{"options":["42","63","84","96","105"],"correctIndex":2}'::jsonb,
   'İkinci koşul açılırsa $CBA - ABC = 99(C - A) = 297 \Rightarrow C - A = 3$ bulunur. İlk koşuldan $A + B = C \Rightarrow B = C - A = 3$ elde edilir.
Üçüncü koşula göre $ABC$''nin $5$''e bölümünden kalan $2$ ise birler basamağı $C = 2$ veya $C = 7$ olmalıdır. Ancak $A \ge 1$ ve $C = A + 3$ olduğundan $C \ge 4$ olur; yani $C = 7$''dir. Buradan $A = 7 - 3 = 4$ ve sayı $437$ olarak bulunur. Rakamlar çarpımı $4 \cdot 3 \cdot 7 = 84$''tür.',
   'B şıkkı ($63$), basamak farkından $C - A = 3$ yerine $C - A = 2$ veya yanlış basamak çözümüyle $A = 3, B = 3, C = 7$ ($3 \cdot 3 \cdot 7 = 63$) bulan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-11-045 · şekilli · doğrulandı
  ('df3ff135-4a6f-5e76-aaf8-f8f2596af44f'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 2,
   'Bir okuldaki beş şubeden yarışmaya katılan öğrenci sayıları aşağıdaki sütun grafiğinde gösterilmiştir.
Katılımcı sayısı tüm şubelerin ortalamasının üzerinde olan şubelerdeki öğrencilerin toplamı, tüm katılımcıların yüzde kaçıdır?',
   '{"options":["%30","%40","%45","%50","%55"],"correctIndex":4}'::jsonb,
   'Beş şubedeki toplam katılımcı sayısı $12 + 25 + 18 + 30 + 15 = 100$ öğrencidir. Şube ortalaması $\dfrac{100}{5} = 20$ öğrenci olur. Ortalamanın ($20$''nin) üzerinde olan şubeler $B$ ($25$) ve $D$ ($30$) olup toplamları $25 + 30 = 55$ öğrencidir. Tüm katılımcılar $100$ kişi olduğundan oran $\%55$ bulunur.',
   'A şıkkı ($\%30$) en kalabalık tek şubeyi seçenleri; C şıkkı ($\%45$) ise ortalamanın altında kalan şubelerin toplam oranını ($\dfrac{12 + 18 + 15}{100} = \%45$) hesaplayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 322 242" width="322" height="242" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><text x="40" y="205.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">0</text><text x="40" y="181.6" fill="currentColor" stroke="none" text-anchor="end" font-size="11">5</text><text x="40" y="157.3" fill="currentColor" stroke="none" text-anchor="end" font-size="11">10</text><text x="40" y="133" fill="currentColor" stroke="none" text-anchor="end" font-size="11">15</text><text x="40" y="108.7" fill="currentColor" stroke="none" text-anchor="end" font-size="11">20</text><text x="40" y="84.4" fill="currentColor" stroke="none" text-anchor="end" font-size="11">25</text><text x="40" y="60.1" fill="currentColor" stroke="none" text-anchor="end" font-size="11">30</text><text x="40" y="35.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">35</text><g stroke-width="0.6" stroke-opacity="0.3"><line x1="46" y1="202" x2="306" y2="202"/><line x1="46" y1="177.7" x2="306" y2="177.7"/><line x1="46" y1="153.4" x2="306" y2="153.4"/><line x1="46" y1="129.1" x2="306" y2="129.1"/><line x1="46" y1="104.9" x2="306" y2="104.9"/><line x1="46" y1="80.6" x2="306" y2="80.6"/><line x1="46" y1="56.3" x2="306" y2="56.3"/><line x1="46" y1="32" x2="306" y2="32"/></g><line x1="46" y1="28" x2="46" y2="202"/><line x1="46" y1="202" x2="306" y2="202"/><text x="40" y="19.9" fill="currentColor" stroke="none" text-anchor="start" font-size="11">Öğrenci</text><rect x="56.4" y="143.7" width="31.2" height="58.3" fill="currentColor" fill-opacity="0.22"/><text x="72" y="138.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">12</text><text x="72" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">A</text><rect x="108.4" y="80.6" width="31.2" height="121.4" fill="currentColor" fill-opacity="0.22"/><text x="124" y="75.4" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">25</text><text x="124" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">B</text><rect x="160.4" y="114.6" width="31.2" height="87.4" fill="currentColor" fill-opacity="0.22"/><text x="176" y="109.4" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">18</text><text x="176" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">C</text><rect x="212.4" y="56.3" width="31.2" height="145.7" fill="currentColor" fill-opacity="0.22"/><text x="228" y="51.1" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">30</text><text x="228" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">D</text><rect x="264.4" y="129.1" width="31.2" height="72.9" fill="currentColor" fill-opacity="0.22"/><text x="280" y="124" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">15</text><text x="280" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">E</text></svg>', true),
  -- mat-11-046 · şekilli · doğrulandı
  ('6c7d155b-7da2-539f-937c-0ceeedaff3ae'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 1,
   'Aylık toplam bütçesi $24.000$ TL olan bir ailenin gider dağılımı aşağıdaki daire grafiğinde yüzde cinsinden verilmiştir.
Buna göre bu ailenin Gıda ve Ulaşım harcamalarının toplamı kaç TL''dir?',
   '{"options":["8.400","9.600","10.200","10.800","12.000"],"correctIndex":1}'::jsonb,
   'Gıda ($\%25$) ve Ulaşım ($\%15$) harcamalarının toplam payı $\%25 + \%15 = \%40$''tır. $24.000$ TL bütçenin $\%40$''ı $24.000 \cdot \dfrac{40}{100} = 9.600$ TL olarak bulunur.',
   'E şıkkı ($12.000$), bütçenin yarısını tahmin edenleri; A şıkkı ($8.400$) ise yanlışlıkla diğer ($\%20$) ve ulaşım ($\%15$) toplamını ($\%35$) hesaplayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 349.9 212" width="349.9" height="212" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><g transform="translate(89 0)"><path d="M95 99 L95 14 A85 85 0 0 1 145 167.8 Z" fill="currentColor" fill-opacity="0.08"/><line x1="170.1" y1="74.6" x2="183.4" y2="70.3" stroke-width="1"/><text x="187.3" y="73.2" fill="currentColor" stroke="none" text-anchor="start" font-size="12">Kira (%40)</text><path d="M95 99 L145 167.8 A85 85 0 0 1 26.2 149 Z" fill="currentColor" fill-opacity="0.3"/><line x1="82.6" y1="177" x2="80.5" y2="190.9" stroke-width="1"/><text x="79.8" y="205" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">Gıda (%25)</text><path d="M95 99 L26.2 149 A85 85 0 0 1 14.2 72.7 Z" fill="currentColor" fill-opacity="0.16"/><line x1="17" y1="111.4" x2="3.1" y2="113.5" stroke-width="1"/><text x="-0.8" y="118.4" fill="currentColor" stroke="none" text-anchor="end" font-size="12">Ulaşım (%15)</text><path d="M95 99 L14.2 72.7 A85 85 0 0 1 95 14 Z" fill="currentColor" fill-opacity="0.42"/><line x1="48.6" y1="35.1" x2="40.3" y2="23.8" stroke-width="1"/><text x="38" y="24.7" fill="currentColor" stroke="none" text-anchor="end" font-size="12">Diğer (%20)</text></g></svg>', true),
  -- mat-11-047 · şekilli · doğrulandı
  ('abee07b2-9fb8-56eb-a335-0f74a5273aad'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 2,
   'Bir ürünün beş yıllık satış fiyatı değişimi aşağıdaki çizgi grafiğinde gösterilmiştir.
Buna göre $2020$ yılından $2024$ yılına kadar geçen sürede bu ürünün fiyatı toplam yüzde kaç artmıştır?',
   '{"options":["%50","%60","%70","%75","%80"],"correctIndex":3}'::jsonb,
   '$2020$ yılı fiyatı $32$ TL, $2024$ yılı fiyatı $56$ TL''dir. Toplam fiyat artışı $56 - 32 = 24$ TL olduğundan $2020$ yılına göre artış yüzdesi:
$$\frac{24}{32} \cdot 100 = \frac{3}{4} \cdot 100 = \%75$$
olarak bulunur.',
   'A şıkkı ($\%50$) veya B şıkkı ($\%60$), aradaki artışları yıllara bölüp yanlışlıkla bir ara yıla ($40$ TL) oranlayan ($24/40 = \%60$) adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 302 242" width="302" height="242" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><text x="40" y="205.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">0</text><text x="40" y="177.5" fill="currentColor" stroke="none" text-anchor="end" font-size="11">10</text><text x="40" y="149.2" fill="currentColor" stroke="none" text-anchor="end" font-size="11">20</text><text x="40" y="120.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">30</text><text x="40" y="92.5" fill="currentColor" stroke="none" text-anchor="end" font-size="11">40</text><text x="40" y="64.2" fill="currentColor" stroke="none" text-anchor="end" font-size="11">50</text><text x="40" y="35.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">60</text><g stroke-width="0.6" stroke-opacity="0.3"><line x1="46" y1="202" x2="286" y2="202"/><line x1="46" y1="173.7" x2="286" y2="173.7"/><line x1="46" y1="145.3" x2="286" y2="145.3"/><line x1="46" y1="117" x2="286" y2="117"/><line x1="46" y1="88.7" x2="286" y2="88.7"/><line x1="46" y1="60.3" x2="286" y2="60.3"/><line x1="46" y1="32" x2="286" y2="32"/></g><line x1="46" y1="28" x2="46" y2="202"/><line x1="46" y1="202" x2="286" y2="202"/><text x="40" y="19.9" fill="currentColor" stroke="none" text-anchor="start" font-size="11">TL</text><text x="70" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">2020</text><text x="118" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">2021</text><text x="166" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">2022</text><text x="214" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">2023</text><text x="262" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">2024</text><polyline points="70,111.3 118,88.7 166,100 214,66 262,43.3" stroke-width="2.2"/><circle cx="70" cy="111.3" r="3" fill="currentColor" stroke="none"/><circle cx="118" cy="88.7" r="3" fill="currentColor" stroke="none"/><circle cx="166" cy="100" r="3" fill="currentColor" stroke="none"/><circle cx="214" cy="66" r="3" fill="currentColor" stroke="none"/><circle cx="262" cy="43.3" r="3" fill="currentColor" stroke="none"/></svg>', true),
  -- mat-11-048 · doğrulandı
  ('dc8af1eb-d220-5dee-9910-4e155d64ca04'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 1,
   '$3$ haneli bir dijital kilidin her hanesi $\{1, 2, 3, 4\}$ kümesindeki rakamlardan biriyle oluşturulacaktır.
Rakamları toplamı $6$ olan kaç farklı $3$ haneli şifre yazılabilir?',
   '{"options":["10","11","12","14","16"],"correctIndex":0}'::jsonb,
   'Toplamı $6$ veren rakam üçlüleri ve kendi aralarındaki sıralanış sayıları yazılır:
- $(1, 1, 4)$ üçlüsü: $\dfrac{3!}{2!} = 3$ farklı şifre (`114`, `141`, `411`).
- $(1, 2, 3)$ üçlüsü: $3! = 6$ farklı şifre.
- $(2, 2, 2)$ üçlüsü: $1$ farklı şifre (`222`).
Toplam $3 + 6 + 1 = 10$ farklı şifre yazılabilir.',
   'C şıkkı ($12$), $(2, 2, 2)$ durumunu ya da $(1, 1, 4)$ permütasyon sayısını yanlış sayıp iki kez sayan; B şıkkı ($11$) ise $(2, 2, 2)$ dizilimini $2$ sayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-11-049 · şekilli · doğrulandı
  ('cfd68e5c-d027-5c3e-9ec6-55c401ced684'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 2,
   'Şekildeki işlem makinesine pozitif bir $x$ sayısı girilmekte ve okların üzerindeki işlemler sırasıyla uygulanarak çıkışta $77$ sayısı elde edilmektedir.
Buna göre girişe yazılan $x$ sayısı kaçtır?',
   '{"options":["1","2","3","4","5"],"correctIndex":2}'::jsonb,
   'Son adımdan geriye gidilir: $(2x + 3)^2 - 4 = 77 \Rightarrow (2x + 3)^2 = 81$. $x > 0$ olduğu için $2x + 3 > 0$ olduğundan $2x + 3 = 9 \Rightarrow 2x = 6 \Rightarrow x = 3$ bulunur.',
   'D şıkkı ($4$) veya E şıkkı ($5$), $2x + 3 = 9$ adımında $3$''ü çıkarmak yerine $9 \div 2$ gibi yaklaşık tahmine ya da işlem önceliği hatasına düşen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 371.1 66" width="371.1" height="66" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><line x1="50" y1="33" x2="142.6" y2="33" stroke-width="1.4"/><path d="M142.6 33 L135.3 36.1 M142.6 33 L135.3 29.9" stroke-width="1.4"/><text x="96.3" y="46.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">×2, +3</text><line x1="211.4" y1="33" x2="318.9" y2="33" stroke-width="1.4"/><path d="M318.9 33 L311.5 36.1 M318.9 33 L311.5 29.9" stroke-width="1.4"/><text x="265.1" y="46.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">karesi − 4</text><circle cx="33" cy="33" r="17" fill="currentColor" fill-opacity="0.06"/><text x="33" y="37.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">x</text><rect x="142.6" y="16" width="68.7" height="34" rx="6" fill="currentColor" fill-opacity="0.06"/><text x="177" y="37.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">2x + 3</text><circle cx="337" cy="33" r="18.1" fill="currentColor" fill-opacity="0.06"/><text x="337" y="37.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">77</text></svg>', true),
  -- mat-11-050 · doğrulandı
  ('ba4ba7a8-d3b7-59a7-b057-7860dd3a7a87'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 3,
   'İçinde $9$ kırmızı, $7$ mavi, $6$ yeşil ve $3$ sarı özdeş topun bulunduğu karanlık bir kutudan renklerine bakılmadan art arda toplar çekiliyor.
Çekilen toplar arasında aynı renkten en az $5$ adet bulunmasını kesin olarak garantilemek için kutudan en az kaç top çekilmelidir?',
   '{"options":["8","12","13","15","16"],"correctIndex":4}'::jsonb,
   'Güvercin yuvası (en kötü durum) ilkesi uygulanır. $5$ topa ulaşamayacak renk olan sarıların tamamı ($3$ adet) en kötü senaryoda çekilebilir; kırmızı, mavi ve yeşil renklerden ise her birinden $4$''er adet ($4 \cdot 3 = 12$ adet) çekildiğinde hâlâ aynı renkten $5$ top sağlanmamış olur. Bu en kötü durumda toplam $3 + 12 = 15$ top çekilmiştir. Çekilecek $16.$ top kesinlikle kırmızı, mavi veya yeşilden biri olacağı için aynı renkten $5$ topu garantiler.',
   'D şıkkı ($15$), en kötü senaryo sınırında kalıp garantilemek için $+1$ top eklemeyi unutan adayı; C şıkkı ($13$) ise $3$ sarı topun tamamının ($4$ sınırından küçük olsa bile) çekilebileceğini gözden kaçırıp $4 \cdot 3 + 1 = 13$ hesaplayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-11-051 · şekilli · doğrulandı
  ('9c3afdef-017e-5f03-b178-8b7d941d5eac'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 1,
   'Bir öğrencinin okuduğu dört farklı kitabın sayfa sayıları aşağıdaki sütun grafiğinde gösterilmiştir.
Bu öğrenci dört kitabın tamamını toplam $15$ günde okuyup bitirdiğine göre günde ortalama kaç sayfa kitap okumuştur?',
   '{"options":["40","30","35","45","50"],"correctIndex":0}'::jsonb,
   'Dört kitabın toplam sayfa sayısı $120 + 180 + 150 + 150 = 600$ sayfadır. Toplam $15$ günde okunduğuna göre günlük ortalama $\dfrac{600}{15} = 40$ sayfa bulunur.',
   'C şıkkı ($35$) veya D şıkkı ($45$), toplam sayfa sayısını $600$ yerine yanlış toplayarak $525$ ya da $675$ hesaplayan; veya yalnızca tek bir kitabın ortalamasına bakan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 282 242" width="282" height="242" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><text x="40" y="205.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">0</text><text x="40" y="181.6" fill="currentColor" stroke="none" text-anchor="end" font-size="11">30</text><text x="40" y="157.3" fill="currentColor" stroke="none" text-anchor="end" font-size="11">60</text><text x="40" y="133" fill="currentColor" stroke="none" text-anchor="end" font-size="11">90</text><text x="40" y="108.7" fill="currentColor" stroke="none" text-anchor="end" font-size="11">120</text><text x="40" y="84.4" fill="currentColor" stroke="none" text-anchor="end" font-size="11">150</text><text x="40" y="60.1" fill="currentColor" stroke="none" text-anchor="end" font-size="11">180</text><text x="40" y="35.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">210</text><g stroke-width="0.6" stroke-opacity="0.3"><line x1="46" y1="202" x2="266" y2="202"/><line x1="46" y1="177.7" x2="266" y2="177.7"/><line x1="46" y1="153.4" x2="266" y2="153.4"/><line x1="46" y1="129.1" x2="266" y2="129.1"/><line x1="46" y1="104.9" x2="266" y2="104.9"/><line x1="46" y1="80.6" x2="266" y2="80.6"/><line x1="46" y1="56.3" x2="266" y2="56.3"/><line x1="46" y1="32" x2="266" y2="32"/></g><line x1="46" y1="28" x2="46" y2="202"/><line x1="46" y1="202" x2="266" y2="202"/><text x="40" y="19.9" fill="currentColor" stroke="none" text-anchor="start" font-size="11">Sayfa</text><rect x="57" y="104.9" width="33" height="97.1" fill="currentColor" fill-opacity="0.22"/><text x="73.5" y="99.7" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">120</text><text x="73.5" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">K1</text><rect x="112" y="56.3" width="33" height="145.7" fill="currentColor" fill-opacity="0.22"/><text x="128.5" y="51.1" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">180</text><text x="128.5" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">K2</text><rect x="167" y="80.6" width="33" height="121.4" fill="currentColor" fill-opacity="0.22"/><text x="183.5" y="75.4" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">150</text><text x="183.5" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">K3</text><rect x="222" y="80.6" width="33" height="121.4" fill="currentColor" fill-opacity="0.22"/><text x="238.5" y="75.4" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">150</text><text x="238.5" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">K4</text></svg>', true),
  -- mat-11-052 · şekilli · doğrulandı
  ('71ce49a4-f25f-50b1-a94c-f9f328b1318d'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 1,
   'Bir kargo firmasının ağırlığa göre uyguladığı paket gönderim ücretleri aşağıdaki tabloda verilmiştir.
Ağırlıkları $1{,}5$ kg, $3$ kg ve $7$ kg olan üç paketi ayrı ayrı göndermek yerine hepsini tek bir koliye koyarak gönderen bir müşteri kaç TL tasarruf etmiş olur?',
   '{"options":["60","70","80","90","105"],"correctIndex":1}'::jsonb,
   'Üç paket ayrı ayrı gönderilirse: $1{,}5$ kg ($0-2$ kg dilimi) için $40$ TL, $3$ kg ($2-5$ kg dilimi) için $65$ TL, $7$ kg ($5-10$ kg dilimi) için $95$ TL ödenir; toplam $40 + 65 + 95 = 200$ TL tutar.
Tek kolide toplam ağırlık $1{,}5 + 3 + 7 = 11{,}5$ kg olur ($10-15$ kg dilimi) ve ücret $130$ TL''dir. Tasarruf tutarı $200 - 130 = 70$ TL bulunur.',
   'A şıkkı ($60$) veya E şıkkı ($105$), tek koli ağırlığını yanlış toplayıp $5-10$ kg diliminden ($95$ TL) hesaplayan adayı ($200 - 95 = 105$) yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 238.5 152" width="238.5" height="152" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><rect x="1" y="1" width="236.5" height="30" fill="currentColor" fill-opacity="0.1" stroke="none"/><rect x="1" y="1" width="236.5" height="150" stroke-width="1.4"/><line x1="1" y1="31" x2="237.5" y2="31" stroke-width="1"/><line x1="1" y1="61" x2="237.5" y2="61" stroke-width="1"/><line x1="1" y1="91" x2="237.5" y2="91" stroke-width="1"/><line x1="1" y1="121" x2="237.5" y2="121" stroke-width="1"/><text x="69.6" y="20.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13" font-weight="600">Ağırlık Aralığı</text><text x="69.6" y="50.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">0 - 2 kg</text><text x="69.6" y="80.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">2 - 5 kg</text><text x="69.6" y="110.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">5 - 10 kg</text><text x="69.6" y="140.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">10 - 15 kg</text><line x1="138.1" y1="1" x2="138.1" y2="151" stroke-width="1"/><text x="187.8" y="20.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13" font-weight="600">Ücret (TL)</text><text x="187.8" y="50.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">40</text><text x="187.8" y="80.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">65</text><text x="187.8" y="110.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">95</text><text x="187.8" y="140.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">130</text></svg>', true),
  -- mat-11-053 · şekilli · doğrulandı
  ('1cbf5ce9-7a34-521b-a946-bfc613cc2d2e'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 2,
   'Bir depodaki A, B, C ve D ürünlerinin adet dağılımı aşağıdaki daire grafiğinde merkez açılarıyla gösterilmiştir.
Depoda D ürününden $180$ adet bulunduğuna göre C ürünü B ürününden kaç adet fazladır?',
   '{"options":["72","90","108","120","144"],"correctIndex":2}'::jsonb,
   '$60^\circ$''lik D dilimi $180$ ürüne denk geldiğinden her $1^\circ$''lik açı $\dfrac{180}{60} = 3$ ürünü temsil eder. C ($108^\circ$) ile B ($72^\circ$) arasındaki açı farkı $108 - 72 = 36^\circ$''dir. Ürün sayısı farkı $36 \cdot 3 = 108$ adet bulunur.',
   'A şıkkı ($72$) ve E şıkkı ($144$), açı farkı yerine doğrudan C ve B derecelerini ikiye katlayan veya $1^\circ$''ye düşen ürün sayısını yanlış bölen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 292.7 198.8" width="292.7" height="198.8" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><g transform="translate(54 0)"><path d="M95 99 L95 14 A85 85 0 0 1 168.6 141.5 Z" fill="currentColor" fill-opacity="0.08"/><line x1="163.4" y1="59.5" x2="175.5" y2="52.5" stroke-width="1"/><text x="179" y="54.7" fill="currentColor" stroke="none" text-anchor="start" font-size="12">A (120°)</text><path d="M95 99 L168.6 141.5 A85 85 0 0 1 77.3 182.1 Z" fill="currentColor" fill-opacity="0.3"/><line x1="127.1" y1="171.2" x2="132.8" y2="184" stroke-width="1"/><text x="134.5" y="191.8" fill="currentColor" stroke="none" text-anchor="start" font-size="12">B (72°)</text><path d="M95 99 L77.3 182.1 A85 85 0 0 1 21.4 56.5 Z" fill="currentColor" fill-opacity="0.16"/><line x1="22.8" y1="131.1" x2="10" y2="136.8" stroke-width="1"/><text x="6.4" y="142.7" fill="currentColor" stroke="none" text-anchor="end" font-size="12">C (108°)</text><path d="M95 99 L21.4 56.5 A85 85 0 0 1 95 14 Z" fill="currentColor" fill-opacity="0.42"/><line x1="55.5" y1="30.6" x2="48.5" y2="18.5" stroke-width="1"/><text x="46.5" y="19.2" fill="currentColor" stroke="none" text-anchor="end" font-size="12">D (60°)</text></g></svg>', true),
  -- mat-11-054 · şekilli · doğrulandı
  ('cf0fd723-7812-573a-9030-600582a362c3'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 2,
   'Bir fabrikanın dört yılda ürettiği ve sattığı bisiklet adetleri aşağıdaki çift çizgi grafiğinde verilmiştir.
Bu dört yılın sonunda üretilip de satılamayan toplam kaç bisiklet kalmıştır?',
   '{"options":["30","35","40","45","55"],"correctIndex":3}'::jsonb,
   'Yıllara göre satılamayan stok miktarı ($\text{Üretim} - \text{Satış}$) hesaplanıp toplanır:
- $2021$: $60 - 45 = 15$
- $2022$: $80 - 70 = 10$
- $2023$: $75 - 60 = 15$
- $2024$: $95 - 90 = 5$
Toplam kalan stok $15 + 10 + 15 + 5 = 45$ bisiklettir.',
   'C şıkkı ($40$), $2023$ yılındaki $75$ üretim değerini eksenden $70$ gibi okuyup $15 + 10 + 10 + 5 = 40$ bulan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 282 250" width="282" height="250" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><text x="40" y="205.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">0</text><text x="40" y="171.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">20</text><text x="40" y="137.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">40</text><text x="40" y="103.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">60</text><text x="40" y="69.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">80</text><text x="40" y="35.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">100</text><g stroke-width="0.6" stroke-opacity="0.3"><line x1="46" y1="202" x2="266" y2="202"/><line x1="46" y1="168" x2="266" y2="168"/><line x1="46" y1="134" x2="266" y2="134"/><line x1="46" y1="100" x2="266" y2="100"/><line x1="46" y1="66" x2="266" y2="66"/><line x1="46" y1="32" x2="266" y2="32"/></g><line x1="46" y1="28" x2="46" y2="202"/><line x1="46" y1="202" x2="266" y2="202"/><text x="40" y="19.9" fill="currentColor" stroke="none" text-anchor="start" font-size="11">Adet</text><text x="73.5" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">2021</text><text x="128.5" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">2022</text><text x="183.5" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">2023</text><text x="238.5" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">2024</text><polyline points="73.5,100 128.5,66 183.5,74.5 238.5,40.5" stroke-width="2.2"/><circle cx="73.5" cy="100" r="3" fill="currentColor" stroke="none"/><circle cx="128.5" cy="66" r="3" fill="currentColor" stroke="none"/><circle cx="183.5" cy="74.5" r="3" fill="currentColor" stroke="none"/><circle cx="238.5" cy="40.5" r="3" fill="currentColor" stroke="none"/><polyline points="73.5,125.5 128.5,83 183.5,100 238.5,49" stroke-width="2.2" stroke-dasharray="7 5"/><circle cx="73.5" cy="125.5" r="3" fill="currentColor" stroke="none"/><circle cx="128.5" cy="83" r="3" fill="currentColor" stroke="none"/><circle cx="183.5" cy="100" r="3" fill="currentColor" stroke="none"/><circle cx="238.5" cy="49" r="3" fill="currentColor" stroke="none"/><line x1="46" y1="232" x2="68" y2="232"/><text x="72" y="235.9" fill="currentColor" stroke="none" text-anchor="start" font-size="11">Üretim</text><line x1="118.3" y1="232" x2="140.3" y2="232" stroke-dasharray="7 5"/><text x="144.3" y="235.9" fill="currentColor" stroke="none" text-anchor="start" font-size="11">Satış</text></svg>', true),
  -- mat-11-055 · şekilli · doğrulandı
  ('8d3e5be6-f885-5b89-a6fa-5c8ab568fd6e'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 2,
   'Şekildeki akış şemasına girilen tam sayıya ilk kutuda $4$ eklenmekte; çıkan sayı çift ise üst koldan, tek ise alt koldan ilerleyerek çıkışa ulaşılmaktadır.
Girişe önce $x = 3$, ardından $x = 6$ yazıldığında elde edilen iki çıkış değerinin toplamı kaç olur?',
   '{"options":["35","39","42","45","49"],"correctIndex":4}'::jsonb,
   'İki giriş değeri için dallar ayrı ayrı izlenir:
- $x = 3$ için: $3 + 4 = 7$ (tek sayı → alt kol): $7 \cdot 2 + 5 = 19$.
- $x = 6$ için: $6 + 4 = 10$ (çift sayı → üst kol): $10 \cdot 3 = 30$.
İki çıkış değerinin toplamı $19 + 30 = 49$ bulunur.',
   'C şıkkı ($42$) veya B şıkkı ($39$), kol seçiminde $x + 4$ yerine ilk girilen $x$''in tekliğine/çiftliğine bakarak kolları ters uygulayan ($3 \to$ tek değil $6 \to$ çift sanarak yanlış çaprazlama) adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 479.3 226" width="479.3" height="226" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><line x1="50" y1="113" x2="130.7" y2="113" stroke-width="1.4"/><path d="M130.7 113 L123.3 116.1 M130.7 113 L123.3 109.9" stroke-width="1.4"/><line x1="189.9" y1="96" x2="269" y2="49.5" stroke-width="1.4"/><path d="M269 49.5 L264.2 55.9 M269 49.5 L261.1 50.5" stroke-width="1.4"/><text x="237.6" y="90.8" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">çift</text><line x1="189.9" y1="130" x2="268.1" y2="176" stroke-width="1.4"/><path d="M268.1 176 L260.2 174.9 M268.1 176 L263.3 169.6" stroke-width="1.4"/><text x="221.8" y="169.5" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">tek</text><line x1="325" y1="49.5" x2="406.9" y2="97.6" stroke-width="1.4"/><path d="M406.9 97.6 L399 96.6 M406.9 97.6 L402.1 91.2" stroke-width="1.4"/><line x1="325.9" y1="176" x2="406.9" y2="128.4" stroke-width="1.4"/><path d="M406.9 128.4 L402.1 134.8 M406.9 128.4 L399 129.4" stroke-width="1.4"/><circle cx="33" cy="113" r="17" fill="currentColor" fill-opacity="0.06"/><text x="33" y="117.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">x</text><rect x="130.7" y="96" width="60.6" height="34" rx="6" fill="currentColor" fill-opacity="0.06"/><text x="161" y="117.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">x + 4</text><rect x="269" y="16" width="56" height="34" rx="6" fill="currentColor" fill-opacity="0.06"/><text x="297" y="37.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">× 3</text><rect x="258.6" y="176" width="76.8" height="34" rx="6" fill="currentColor" fill-opacity="0.06"/><text x="297" y="197.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">× 2 + 5</text><circle cx="433" cy="113" r="30.3" fill="currentColor" fill-opacity="0.06"/><text x="433" y="117.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">Çıkış</text></svg>', true),
  -- mat-11-056 · doğrulandı
  ('06dace96-1e9c-587a-9ec7-3aaa90f92855'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 1,
   'Toplam $26$ öğrencinin bulunduğu bir kursta öğrenciler $4$ farklı sınıfa dağıtılmıştır. Her sınıfta farklı sayıda öğrenci bulunmakta ve en kalabalık sınıfta $9$ öğrenci yer almaktadır.
Buna göre bu $4$ sınıftan öğrenci sayısı en az olanında en az kaç öğrenci vardır?',
   '{"options":["1","2","3","4","5"],"correctIndex":1}'::jsonb,
   'En az öğrencisi bulunan sınıfı en küçük tutmak için diğer iki sınıf mümkün olan en büyük farklı değerleri almalıdır. En kalabalık sınıfta $9$ öğrenci bulunduğundan diğer iki sınıf en fazla $8$ ve $7$ öğrenci alabilir. Bu durumda en küçük sınıfta $26 - (9 + 8 + 7) = 26 - 24 = 2$ öğrenci bulunur.',
   'A şıkkı ($1$), "her sınıfta farklı sayıda öğrenci" şartını gözden kaçırıp iki sınıfa da $9$ öğrenci ($9 + 9 + 7 + 1$) veren adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-11-057 · şekilli · doğrulandı
  ('1549d305-f530-5752-9dd2-b7f7b3fca2c9'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 2,
   'Bir mağazanın hafta içi beş gün boyunca sattığı gömlek sayıları aşağıdaki sütun grafiğinde verilmiştir.
Bu veriler bir daire grafiğiyle gösterilseydi Perşembe gününe ait daire diliminin merkez açısı kaç derece olurdu?',
   '{"options":["72","84","90","96","108"],"correctIndex":1}'::jsonb,
   'Beş günlük toplam gömlek satışı $40 + 60 + 50 + 70 + 80 = 300$ adettir. Daire grafiğinin tamamı $360^\circ$ olduğundan Perşembe ($70$ adet) diliminin merkez açısı:
$$\frac{70}{300} \cdot 360^\circ = \frac{7 \cdot 360^\circ}{30} = 7 \cdot 12^\circ = 84^\circ$$
olarak bulunur.',
   'A şıkkı ($72$) veya D şıkkı ($96$), sırasıyla Salı ($60$) ya da Cuma ($80$) günlerinin açılarını hesaplayıp Perşembe yerine işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 322 242" width="322" height="242" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><text x="40" y="205.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">0</text><text x="40" y="171.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">20</text><text x="40" y="137.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">40</text><text x="40" y="103.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">60</text><text x="40" y="69.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">80</text><text x="40" y="35.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">100</text><g stroke-width="0.6" stroke-opacity="0.3"><line x1="46" y1="202" x2="306" y2="202"/><line x1="46" y1="168" x2="306" y2="168"/><line x1="46" y1="134" x2="306" y2="134"/><line x1="46" y1="100" x2="306" y2="100"/><line x1="46" y1="66" x2="306" y2="66"/><line x1="46" y1="32" x2="306" y2="32"/></g><line x1="46" y1="28" x2="46" y2="202"/><line x1="46" y1="202" x2="306" y2="202"/><text x="40" y="19.9" fill="currentColor" stroke="none" text-anchor="start" font-size="11">Adet</text><rect x="56.4" y="134" width="31.2" height="68" fill="currentColor" fill-opacity="0.22"/><text x="72" y="128.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">40</text><text x="72" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">Pzt</text><rect x="108.4" y="100" width="31.2" height="102" fill="currentColor" fill-opacity="0.22"/><text x="124" y="94.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">60</text><text x="124" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">Sal</text><rect x="160.4" y="117" width="31.2" height="85" fill="currentColor" fill-opacity="0.22"/><text x="176" y="111.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">50</text><text x="176" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">Çar</text><rect x="212.4" y="83" width="31.2" height="119" fill="currentColor" fill-opacity="0.22"/><text x="228" y="77.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">70</text><text x="228" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">Per</text><rect x="264.4" y="66" width="31.2" height="136" fill="currentColor" fill-opacity="0.22"/><text x="280" y="60.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">80</text><text x="280" y="220.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">Cum</text></svg>', true),
  -- mat-11-058 · şekilli · doğrulandı
  ('0ee35075-5b23-5330-b56a-c2c5d0678699'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 2,
   'Bir mağazada satılan dört ürünün birim alış fiyatı, birim satış fiyatı ve satılan adet sayıları aşağıdaki tabloda verilmiştir.
Buna göre bu dört ürünün satışından elde edilen toplam kâr kaç TL''dir?',
   '{"options":["350","380","410","430","460"],"correctIndex":2}'::jsonb,
   'Her ürünün birim kârı ($\text{Satış} - \text{Alış}$) satılan adetle çarpılıp toplanır:
- $K$: $(25 - 20) \cdot 10 = 50$ TL
- $L$: $(39 - 30) \cdot 20 = 180$ TL
- $M$: $(48 - 40) \cdot 15 = 120$ TL
- $N$: $(55 - 50) \cdot 12 = 60$ TL
Toplam kâr $50 + 180 + 120 + 60 = 410$ TL bulunur.',
   'B şıkkı ($380$) veya D şıkkı ($430$), özellikle $L$ ve $M$ ürünlerinde birim kârı adetle çarparken hata yapmaktan ya da toplam satış tutarından eksik çıkarma yapmaktan kaynaklanır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 301.6 152" width="301.6" height="152" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><rect x="1" y="1" width="299.6" height="30" fill="currentColor" fill-opacity="0.1" stroke="none"/><rect x="1" y="1" width="299.6" height="150" stroke-width="1.4"/><line x1="1" y1="31" x2="300.6" y2="31" stroke-width="1"/><line x1="1" y1="61" x2="300.6" y2="61" stroke-width="1"/><line x1="1" y1="91" x2="300.6" y2="91" stroke-width="1"/><line x1="1" y1="121" x2="300.6" y2="121" stroke-width="1"/><text x="28.1" y="20.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13" font-weight="600">Ürün</text><text x="28.1" y="50.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">K</text><text x="28.1" y="80.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">L</text><text x="28.1" y="110.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">M</text><text x="28.1" y="140.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">N</text><line x1="55.2" y1="1" x2="55.2" y2="151" stroke-width="1"/><text x="101.1" y="20.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13" font-weight="600">Alış (TL)</text><text x="101.1" y="50.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">20</text><text x="101.1" y="80.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">30</text><text x="101.1" y="110.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">40</text><text x="101.1" y="140.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">50</text><line x1="147" y1="1" x2="147" y2="151" stroke-width="1"/><text x="196.7" y="20.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13" font-weight="600">Satış (TL)</text><text x="196.7" y="50.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">25</text><text x="196.7" y="80.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">39</text><text x="196.7" y="110.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">48</text><text x="196.7" y="140.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">55</text><line x1="246.4" y1="1" x2="246.4" y2="151" stroke-width="1"/><text x="273.5" y="20.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13" font-weight="600">Adet</text><text x="273.5" y="50.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">10</text><text x="273.5" y="80.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">20</text><text x="273.5" y="110.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">15</text><text x="273.5" y="140.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">12</text></svg>', true),
  -- mat-11-059 · doğrulandı
  ('96d357dc-5fc6-5d6b-86ce-5263bd6739a6'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 3,
   '$1$''den $160$''a kadar numaralandırılmış (sınırlar dahil) bir kitabın tüm sayfaları numaralandırılırken `5` rakamı toplam kaç kez kullanılır?',
   '{"options":["32","34","35","36","38"],"correctIndex":3}'::jsonb,
   '$5$ rakamının basamaklara göre kaç kez yazıldığı ayrı ayrı sayılır ($1$–$160$ arasında yüzler basamağında $5$ yoktur):
- Birler basamağında $5$: $5, 15, 25, \ldots, 155$ olmak üzere toplam $\dfrac{155 - 5}{10} + 1 = 16$ kez.
- Onlar basamağında $5$: $50$–$59$ arasında $10$ kez ve $150$–$159$ arasında $10$ kez olmak üzere toplam $20$ kez.
Toplam $16 + 20 = 36$ kez $5$ rakamı kullanılır ($55$ ve $155$ sayılarında $5$ rakamı ikişer kez kullanıldığı için iki basamakta da ayrı sayılır).',
   'B şıkkı ($34$), $55$ ve $155$ sayılarında iki tane $5$ rakamı olduğunu fark etmeyip "kaç sayıda $5$ vardır?" mantığıyla $2$ eksik sayan adayların düştüğü klasik basamak sayma tuzağıdır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-11-060 · şekilli · doğrulandı
  ('7ccd6f5b-c601-5a2d-8a92-d4fb438f8164'::uuid, 'Matematik & Geometri', 'Sayısal Mantık ve Tablo-Grafik Yorumlama', 'multiple_choice', 3,
   'Aşağıdaki $3 \times 3$''lük tablonun her satırındaki, her sütunundaki ve her iki köşegenindeki üç sayının toplamı birbirine eşittir (sihirli kare).
Buna göre $a \cdot x + b$ değeri kaçtır?',
   '{"options":["32","36","38","40","42"],"correctIndex":4}'::jsonb,
   'Sabit toplam $S$ olsun. $2.$ sütun toplamı $1 + x + 9 = 10 + x$ ve sol üstten sağ alta ana köşegen $a + x + b = S$''dir.
$1.$ satırdan $a + 1 + 6 = 10 + x \Rightarrow a = x + 3$ ve $3.$ satırdan $4 + 9 + b = 10 + x \Rightarrow b = x - 3$ bulunur.
Bu değerler ana köşegende yerine yazılırsa:
$$(x + 3) + x + (x - 3) = 10 + x \Rightarrow 3x = 10 + x \Rightarrow 2x = 10 \Rightarrow x = 5$$
Buradan $a = 5 + 3 = 8$ ve $b = 5 - 3 = 2$ elde edilir (sihirli toplam $15$). Sonuç olarak $a \cdot x + b = 8 \cdot 5 + 2 = 42$''dir.',
   'D şıkkı ($40$), $x = 5$ ve $a = 8$ bulunduktan sonra $b = 2$ yerine $a \cdot x = 40$''ı işaretleyen veya $b$''yi toplarken $3 - 5 = -2$ gibi işaret hatası yapan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 232.3 122" width="232.3" height="122" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><rect x="1" y="1" width="230.3" height="30" fill="currentColor" fill-opacity="0.1" stroke="none"/><rect x="1" y="1" width="230.3" height="120" stroke-width="1.4"/><line x1="1" y1="31" x2="231.3" y2="31" stroke-width="1"/><line x1="1" y1="61" x2="231.3" y2="61" stroke-width="1"/><line x1="1" y1="91" x2="231.3" y2="91" stroke-width="1"/><text x="39.4" y="20.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13" font-weight="600">Sütun 1</text><text x="39.4" y="50.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">a</text><text x="39.4" y="80.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">3</text><text x="39.4" y="110.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">4</text><line x1="77.8" y1="1" x2="77.8" y2="121" stroke-width="1"/><text x="116.2" y="20.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13" font-weight="600">Sütun 2</text><text x="116.2" y="50.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">1</text><text x="116.2" y="80.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">x</text><text x="116.2" y="110.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">9</text><line x1="154.6" y1="1" x2="154.6" y2="121" stroke-width="1"/><text x="193" y="20.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13" font-weight="600">Sütun 3</text><text x="193" y="50.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">6</text><text x="193" y="80.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">7</text><text x="193" y="110.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">b</text></svg>', true)
on conflict (id) do update set
  lesson = excluded.lesson, topic = excluded.topic, question_type = excluded.question_type,
  difficulty = excluded.difficulty, prompt_text = excluded.prompt_text,
  interaction_data = excluded.interaction_data, explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap, exam_scopes = excluded.exam_scopes,
  education_level = excluded.education_level, figure_svg = excluded.figure_svg, is_active = true;

-- >>> 12_dogruda_ve_ucgende_acilar_ucgenler.sql
-- ==========================================================================
-- KADRO SORU HAVUZU · Matematik & Geometri · Doğruda ve Üçgende Açılar, Üçgenler (40 soru)
-- Kaynak: docs/soru_havuzu/matematik/12_dogruda_ve_ucgende_acilar_ucgenler.md · Üretici: tools/math/compile_questions.mjs (elle düzenlemeyin)
-- Önkoşul: docs/supabase_migrations/12_math_figures.sql
-- İdempotent: soru kimlikleri sabit UUID'dir; dosya tekrar çalıştırılırsa sorular güncellenir.
-- ==========================================================================

insert into public.questions (
  id, lesson, topic, question_type, difficulty, prompt_text, interaction_data,
  explanation, distractor_trap, exam_scopes, education_level, figure_svg, is_active
) values
  -- mat-12-001 · şekilli · doğrulandı
  ('c4106afa-7ec8-59d2-ad36-b17ab5041429'::uuid, 'Matematik & Geometri', 'Doğruda ve Üçgende Açılar, Üçgenler', 'multiple_choice', 1,
   'Şekilde $d_1 \parallel d_2$ olmak üzere $m(\widehat{BPE}) = 38^\circ$ ve $m(\widehat{PEQ}) = 85^\circ$ veriliyor.
Buna göre $m(\widehat{DQE}) = x$ kaç derecedir?',
   '{"options":["42","47","52","57","62"],"correctIndex":1}'::jsonb,
   '$E$ noktasından $d_1$ ve $d_2$ doğrularına paralel bir yardımcı doğru çizildiğinde iç ters açılar nedeniyle $85^\circ$''lik açı üstte $38^\circ$ ve altta $x$ olmak üzere iki parçaya ayrılır (M kuralı). Buradan $38^\circ + x = 85^\circ \Rightarrow x = 85^\circ - 38^\circ = 47^\circ$ bulunur.',
   'C şıkkı (52), $90^\circ - 38^\circ = 52^\circ$ hesabıyla ortadaki açıyı $85^\circ$ yerine dik açı gibi düşünen veya $85 - 38$ çıkarmasında onluk bozmayı yanlış yapan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 340 212.7" width="340" height="212.7" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><line x1="30" y1="30" x2="310" y2="30"/><line x1="30" y1="182.7" x2="310" y2="182.7"/><line x1="106.4" y1="30" x2="204.1" y2="106.4"/><line x1="132.9" y1="182.7" x2="204.1" y2="106.4"/><path d="M106.4 30 L132.4 30 A26 26 0 0 1 126.9 46 Z" stroke="none"/><path d="M132.4 30 A26 26 0 0 1 126.9 46" stroke-width="1.4"/><text x="145.4" y="47.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">38°</text><path d="M132.9 182.7 L158.9 182.7 A26 26 0 0 0 150.6 163.7 Z" stroke="none"/><path d="M158.9 182.7 A26 26 0 0 0 150.6 163.7" stroke-width="1.4"/><text x="166.3" y="172.4" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">x</text><path d="M204.1 106.4 L186.8 92.8 A22 22 0 0 0 189.1 122.5 Z" stroke="none"/><path d="M186.8 92.8 A22 22 0 0 0 189.1 122.5" stroke-width="1.4"/><text x="166.9" y="113.5" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">85°</text><text x="16" y="34.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">d₁</text><text x="16" y="187.3" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">d₂</text><text x="106.4" y="20.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">P</text><text x="324" y="34.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="132.9" y="201.6" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">Q</text><text x="324" y="187.6" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text><text x="218.1" y="111.3" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">E</text></svg>', true),
  -- mat-12-002 · şekilli · doğrulandı
  ('297b8dc9-2bd9-5cd5-b8a4-e398fd86f23b'::uuid, 'Matematik & Geometri', 'Doğruda ve Üçgende Açılar, Üçgenler', 'multiple_choice', 2,
   'Şekilde $[BA \parallel [DE$ olmak üzere $m(\widehat{ABC}) = 115^\circ$ ve $m(\widehat{BCD}) = 105^\circ$ veriliyor.
Buna göre $m(\widehat{CDE}) = x$ kaç derecedir?',
   '{"options":["120","130","135","140","150"],"correctIndex":3}'::jsonb,
   '$C$ noktasından $[BA$ ve $[DE$ ışınlarına paralel ve sola doğru bir ışın çizilirse iki tane U kuralı oluşur. Bu paralel ışının üstte ve altta oluşturduğu açıların toplamı $105^\circ$''dir. Üst U kuralından üst parça $180^\circ - 115^\circ = 65^\circ$, alt parça $105^\circ - 65^\circ = 40^\circ$ olur. Alt U kuralından $x = 180^\circ - 40^\circ = 140^\circ$ bulunur (kısaca üç açının toplamı $360^\circ$''dir).',
   'B şıkkı (130), ardışık açılar toplamını $360^\circ$ yerine $350^\circ$ alan ya da $180^\circ$''ye tamamlarken $65^\circ$ yerine $55^\circ$ çıkaran adayı yakalar. İki kırılmalı paralel sistemde iç bölge açılarının toplamı her zaman $360^\circ$''dir.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 286.6 260" width="286.6" height="260" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><line x1="76.7" y1="30" x2="210" y2="30"/><line x1="210" y1="30" x2="256.6" y2="130"/><line x1="256.6" y1="130" x2="137.4" y2="230"/><line x1="137.4" y1="230" x2="30" y2="230"/><path d="M210 30 L186 30 A24 24 0 0 0 220.1 51.8 Z" stroke="none"/><path d="M186 30 A24 24 0 0 0 220.1 51.8" stroke-width="1.4"/><text x="187.6" y="69.4" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">115°</text><path d="M256.6 130 L247.3 110.1 A22 22 0 0 0 239.7 144.1 Z" stroke="none"/><path d="M247.3 110.1 A22 22 0 0 0 239.7 144.1" stroke-width="1.4"/><text x="217.8" y="125.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">105°</text><path d="M137.4 230 L155.8 214.6 A24 24 0 0 0 113.4 230 Z" stroke="none"/><path d="M155.8 214.6 A24 24 0 0 0 113.4 230" stroke-width="1.4"/><text x="125.6" y="201.8" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">x</text><text x="62.7" y="34.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="210" y="20.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="270.6" y="134.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="137.4" y="248.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text><text x="16" y="234.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">E</text></svg>', true),
  -- mat-12-003 · şekilli · doğrulandı
  ('f25ddb32-2ce9-5666-9089-84cde2c89758'::uuid, 'Matematik & Geometri', 'Doğruda ve Üçgende Açılar, Üçgenler', 'multiple_choice', 2,
   'Şekildeki $ABC$ üçgeninde $D \in [AC]$, $|AB| = |BD| = |DC|$ ve $m(\widehat{ACB}) = 34^\circ$ olduğuna göre $m(\widehat{ABD}) = x$ kaç derecedir?',
   '{"options":["44","46","52","68","78"],"correctIndex":0}'::jsonb,
   '$|BD| = |DC|$ olduğu için $BDC$ ikizkenar üçgeninde taban açıları eşittir: $m(\widehat{DBC}) = m(\widehat{DCB}) = 34^\circ$. İki iç açının toplamı komşu olmayan dış açıya eşit olduğundan $m(\widehat{ADB}) = 34^\circ + 34^\circ = 68^\circ$ olur. $ABD$ üçgeninde $|AB| = |BD|$ verildiğinden $m(\widehat{BAD}) = m(\widehat{ADB}) = 68^\circ$ bulunur. Üçgenin iç açıları toplamından $x = 180^\circ - (68^\circ + 68^\circ) = 44^\circ$ elde edilir.',
   'D şıkkı (68), $m(\widehat{ADB}) = 68^\circ$ dış açısını bulduktan sonra bunu $x$ açısı sanan ya da $A$ ve $D$ açılarından yalnızca birini $180^\circ$''den çıkaran adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 340 225.2" width="340" height="225.2" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><polygon points="65.1,30 30,195.2 310,195.2"/><line x1="65.1" y1="30" x2="30" y2="195.2"/><line x1="53.9" y1="111.4" x2="42.2" y2="108.9"/><line x1="52.9" y1="116.3" x2="41.2" y2="113.8"/><line x1="30" y1="195.2" x2="170" y2="100.8"/><line x1="94.6" y1="144.4" x2="101.3" y2="154.4"/><line x1="98.7" y1="141.6" x2="105.4" y2="151.6"/><line x1="170" y1="100.8" x2="310" y2="195.2"/><line x1="241.3" y1="141.6" x2="234.6" y2="151.6"/><line x1="245.4" y1="144.4" x2="238.7" y2="154.4"/><path d="M310 195.2 L281.8 176.2 A34 34 0 0 0 276 195.2 Z" stroke="none"/><path d="M281.8 176.2 A34 34 0 0 0 276 195.2" stroke-width="1.4"/><text x="262.8" y="185" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">34°</text><path d="M30 195.2 L53.2 179.5 A28 28 0 0 0 35.8 167.8 Z" stroke="none"/><path d="M53.2 179.5 A28 28 0 0 0 35.8 167.8" stroke-width="1.4"/><text x="51.5" y="167.5" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">x</text><text x="65.1" y="20.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="19.5" y="210.6" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="320.5" y="210.6" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="180.5" y="95.2" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text></svg>', true),
  -- mat-12-004 · şekilli · doğrulandı
  ('5be1389f-d3f0-5238-8399-e62bf00125ab'::uuid, 'Matematik & Geometri', 'Doğruda ve Üçgende Açılar, Üçgenler', 'multiple_choice', 3,
   'Şekildeki $ABC$ eşkenar üçgeninde $|BD| = |BC|$ ve $m(\widehat{CBD}) = 40^\circ$ olduğuna göre $m(\widehat{ADC}) = x$ kaç derecedir?',
   '{"options":["20","25","30","35","40"],"correctIndex":2}'::jsonb,
   '$ABC$ eşkenar üçgen olduğundan $|AB| = |BC| = |AC|$ ve $m(\widehat{ABC}) = 60^\circ$''dir. Soruda $|BD| = |BC|$ verildiği için $|AB| = |BD|$ gizli ikizkenar üçgeni ortaya çıkar. $ABD$ üçgeninin tepe açısı $m(\widehat{ABD}) = 60^\circ + 40^\circ = 100^\circ$ olduğundan $m(\widehat{ADB}) = \dfrac{180^\circ - 100^\circ}{2} = 40^\circ$ bulunur. Diğer yandan $BCD$ ikizkenar üçgeninde $m(\widehat{BDC}) = \dfrac{180^\circ - 40^\circ}{2} = 70^\circ$''dir. O hâlde $x = m(\widehat{BDC}) - m(\widehat{ADB}) = 70^\circ - 40^\circ = 30^\circ$ olur.',
   'E şıkkı (40), $|AB| = |BD|$ gizli ikizkenarını kullanarak $m(\widehat{ADB}) = 40^\circ$ açısını bulup sonucu $40^\circ$ işaretleyen adayı yakalar. Oysa soru $ADC$ açısını sormaktadır ve $70^\circ$''den $40^\circ$ çıkarılmalıdır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 192.6 260" width="192.6" height="260" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><line x1="96.3" y1="30" x2="30" y2="144.8"/><line x1="68.3" y1="90.4" x2="57.9" y2="84.4"/><line x1="30" y1="144.8" x2="162.6" y2="144.8"/><line x1="96.3" y1="138.8" x2="96.3" y2="150.8"/><line x1="96.3" y1="30" x2="162.6" y2="144.8"/><line x1="134.6" y1="84.4" x2="124.2" y2="90.4"/><line x1="30" y1="144.8" x2="131.5" y2="230"/><line x1="84.6" y1="182.8" x2="76.9" y2="192"/><line x1="162.6" y1="144.8" x2="131.5" y2="230"/><line x1="96.3" y1="30" x2="131.5" y2="230"/><path d="M30 144.8 L49.9 161.5 A26 26 0 0 0 56 144.8 Z" stroke="none"/><path d="M49.9 161.5 A26 26 0 0 0 56 144.8" stroke-width="1.4"/><text x="68.8" y="163.1" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">40°</text><path d="M131.5 230 L125.6 196.5 A34 34 0 0 1 143.2 198.1 Z" stroke="none"/><path d="M125.6 196.5 A34 34 0 0 1 143.2 198.1" stroke-width="1.4"/><text x="135.4" y="189.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">x</text><text x="96.3" y="20.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="16" y="149.7" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="176.6" y="149.7" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="131.5" y="248.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text></svg>', true),
  -- mat-12-005 · şekilli · doğrulandı
  ('21232c15-93cc-507c-88dd-3bf0603617ba'::uuid, 'Matematik & Geometri', 'Doğruda ve Üçgende Açılar, Üçgenler', 'multiple_choice', 1,
   'Şekildeki $ABC$ ve $ACD$ birer dik üçgendir. $AB \perp BC$, $AC \perp CD$, $|AB| = 4$ cm, $|BC| = 3$ cm ve $|CD| = 12$ cm olduğuna göre $|AD| = x$ kaç cm''dir?',
   '{"options":["10","11","12","$\\sqrt{149}$","13"],"correctIndex":4}'::jsonb,
   '$ABC$ dik üçgeninde $3-4-5$ özel üçgeninden $|AC| = \sqrt{3^2 + 4^2} = 5$ cm bulunur. $ACD$ dik üçgeninde dik kenarlar $|AC| = 5$ cm ve $|CD| = 12$ cm olduğundan $5-12-13$ özel üçgeniyle hipotenüs $x = \sqrt{5^2 + 12^2} = 13$ cm elde edilir.',
   'D şıkkı ($\sqrt{149}$), $|AC|$ hipotenüsünü hesaplamadan doğrudan $4, 3, 12$ kenarlarını kullanıp $5$ yerine $4$ ya da $3$''ü $12$ ile Pisagor''a sokan adayı yakalar ($\sqrt{12^2 + 5} = \sqrt{149}$ veya $\sqrt{169}$ yerine karekök toplamı hatası).',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 340 220" width="340" height="220" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><line x1="30" y1="101.1" x2="30" y2="190"/><text x="16.1" y="150.1" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">4</text><line x1="30" y1="190" x2="96.7" y2="190"/><text x="63.3" y="206.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">3</text><line x1="30" y1="101.1" x2="96.7" y2="190"/><line x1="96.7" y1="190" x2="310" y2="30"/><text x="211.9" y="126" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">12</text><line x1="30" y1="101.1" x2="310" y2="30"/><text x="166.9" y="58" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">x</text><polyline points="30,179 41,179 41,190" stroke-width="1.4"/><polyline points="90.1,181.2 98.9,174.6 105.5,183.4" stroke-width="1.4"/><text x="19.5" y="95.5" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="19.5" y="205.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="107.2" y="205.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="320.5" y="24.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text></svg>', true),
  -- mat-12-006 · şekilli · doğrulandı
  ('3f3fc1f0-854c-540f-89ac-3e207e481c3e'::uuid, 'Matematik & Geometri', 'Doğruda ve Üçgende Açılar, Üçgenler', 'multiple_choice', 2,
   'Şekildeki $ABC$ üçgeninde $m(\widehat{B}) = 45^\circ$, $m(\widehat{C}) = 30^\circ$ ve $|AB| = 6\sqrt{2}$ cm olduğuna göre $|AC| = x$ kaç cm''dir?',
   '{"options":["12","$6\\sqrt{3}$","$6\\sqrt{6}$","$12\\sqrt{2}$","18"],"correctIndex":0}'::jsonb,
   '$A$ köşesinden $[BC]$ kenarına $AH$ yüksekliği indirilir. Solda oluşan $ABH$ dik üçgeni $45^\circ - 45^\circ - 90^\circ$ ikizkenar dik üçgeni olduğundan $|AH| = \dfrac{6\sqrt{2}}{\sqrt{2}} = 6$ cm bulunur. Sağda oluşan $AHC$ dik üçgeni $30^\circ - 60^\circ - 90^\circ$ üçgenidir ve $30^\circ$''nin karşısındaki $|AH| = 6$ cm olduğundan hipotenüs $x = 2 \cdot 6 = 12$ cm olur.',
   'D şıkkı ($12\sqrt{2}$), $|AB|$ kenarını $\sqrt{2}$''ye bölerek yüksekliği $6$ bulmak yerine doğrudan $6\sqrt{2}$''yi $2$ ile çarpan adayı yakalar. Özel açılı üçgenlerde önce ortak yüksekliği bulmak gerekir.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 340 162.5" width="340" height="162.5" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><line x1="132.5" y1="30" x2="30" y2="132.5"/><text x="67.1" y="71.7" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">6√2 cm</text><line x1="30" y1="132.5" x2="310" y2="132.5"/><line x1="132.5" y1="30" x2="310" y2="132.5"/><text x="214.8" y="97" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">x</text><path d="M30 132.5 L47 115.5 A24 24 0 0 1 54 132.5 Z" stroke="none"/><path d="M47 115.5 A24 24 0 0 1 54 132.5" stroke-width="1.4"/><text x="66.3" y="121.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">45°</text><path d="M310 132.5 L282.3 116.5 A32 32 0 0 0 278 132.5 Z" stroke="none"/><path d="M282.3 116.5 A32 32 0 0 0 278 132.5" stroke-width="1.4"/><text x="264.3" y="124.4" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">30°</text><text x="132.5" y="20.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="19.5" y="147.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="320.5" y="147.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text></svg>', true),
  -- mat-12-007 · şekilli · doğrulandı
  ('0c6291f1-6556-5210-8b15-48208a22050f'::uuid, 'Matematik & Geometri', 'Doğruda ve Üçgende Açılar, Üçgenler', 'multiple_choice', 2,
   'Şekildeki $ABC$ üçgeninde $D \in [AB]$, $E \in [AC]$ ve $DE \parallel BC$''dir. $|AD| = 4$ cm, $|DB| = 6$ cm ve $|DE| = 6$ cm olduğuna göre $|BC| = x$ kaç cm''dir?',
   '{"options":["9","10","12","15","18"],"correctIndex":3}'::jsonb,
   '$DE \parallel BC$ olduğundan $ADE$ ve $ABC$ üçgenleri benzerdir (Temel Orantı Teoremi). Benzerlik oranı tepe noktası $A$''dan tüm kenara göre yazılır: $\dfrac{|AD|}{|AB|} = \dfrac{|DE|}{|BC|}$. Buradan $\dfrac{4}{4 + 6} = \dfrac{6}{x} \Rightarrow \dfrac{4}{10} = \dfrac{6}{x} \Rightarrow 4x = 60 \Rightarrow x = 15$ cm bulunur.',
   'A şıkkı (9), taban oranını yazarken $\dfrac{|AD|}{|AB|}$ yerine parça-parça oranı $\dfrac{|AD|}{|DB|} = \dfrac{4}{6}$ alıp $\dfrac{4}{6} = \dfrac{6}{x} \Rightarrow x = 9$ yazan adayı yakalar. Tabanların oranı yalnızca yan parçaların birbirine oranına değil, küçük kenarın tüm kenara oranına eşittir.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 340 246.7" width="340" height="246.7" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><line x1="123.3" y1="30" x2="86" y2="104.7"/><text x="92.4" y="65.8" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">4</text><line x1="86" y1="104.7" x2="30" y2="216.7"/><text x="45.8" y="159.1" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">6</text><line x1="30" y1="216.7" x2="310" y2="216.7"/><text x="170" y="233.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">x</text><line x1="123.3" y1="30" x2="310" y2="216.7"/><line x1="86" y1="104.7" x2="198" y2="104.7"/><text x="142" y="121.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">6</text><text x="123.3" y="20.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="19.5" y="232.1" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="320.5" y="232.1" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="72" y="109.6" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text><text x="212" y="109.6" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">E</text></svg>', true),
  -- mat-12-008 · şekilli · doğrulandı
  ('f078fbad-e11a-5c02-97ca-b517a854c012'::uuid, 'Matematik & Geometri', 'Doğruda ve Üçgende Açılar, Üçgenler', 'multiple_choice', 3,
   'Şekildeki $ABC$ dik üçgeninde $m(\widehat{BAC}) = 90^\circ$, $AH \perp BC$ ve $|AE| = |EC|$ veriliyor. $|BH| = 4$ cm ve $|AH| = 8$ cm olduğuna göre taralı $AHE$ üçgeninin alanı kaç cm²''dir?',
   '{"options":["16","24","32","40","64"],"correctIndex":2}'::jsonb,
   'Öklid bağıntısından $|AH|^2 = |BH| \cdot |HC|$ yazılır: $8^2 = 4 \cdot |HC| \Rightarrow 64 = 4|HC| \Rightarrow |HC| = 16$ cm bulunur. $AHC$ dik üçgeninin alanı $\dfrac{16 \cdot 8}{2} = 64$ cm²''dir. $[HE]$ doğru parçası, $AHC$ üçgeninde $[AC]$ tabanını $|AE| = |EC|$ olacak şekilde iki eşit parçaya böldüğünden $AHE$ ve $CHE$ üçgenlerinin alanları eşittir. Dolayısıyla taralı alan $\dfrac{64}{2} = 32$ cm² olur.',
   'E şıkkı (64), $AHC$ üçgeninin tüm alanını bulup $E$''nin orta nokta olması nedeniyle ikiye bölmeyi unutan adayı yakalar. D şıkkı (40) ise $ABC$ toplam alanının ($80$) yarısını alanların düştüğü tuzaktır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 340 172" width="340" height="172" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><polygon points="86,30 86,142 198,86" fill="currentColor" fill-opacity="0.12"/><line x1="86" y1="30" x2="30" y2="142"/><line x1="30" y1="142" x2="86" y2="142"/><text x="58" y="158.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">4</text><line x1="86" y1="142" x2="310" y2="142"/><line x1="86" y1="30" x2="198" y2="86"/><line x1="144.7" y1="52.6" x2="139.3" y2="63.4"/><line x1="198" y1="86" x2="310" y2="142"/><line x1="256.7" y1="108.6" x2="251.3" y2="119.4"/><line x1="86" y1="30" x2="86" y2="142"/><text x="99.9" y="90.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">8</text><line x1="86" y1="142" x2="198" y2="86"/><polyline points="81.1,39.8 90.9,44.8 95.8,34.9" stroke-width="1.4"/><polyline points="86,131 97,131 97,142" stroke-width="1.4"/><text x="86" y="20.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="19.5" y="157.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="86" y="160.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">H</text><text x="320.5" y="157.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="208.5" y="80.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">E</text></svg>', true),
  -- mat-12-009 · şekilli · doğrulandı
  ('4aded390-a674-517f-b4ff-a94b8c0cfaa8'::uuid, 'Matematik & Geometri', 'Doğruda ve Üçgende Açılar, Üçgenler', 'multiple_choice', 1,
   'Şekildeki $ABC$ üçgeninde $D \in [BC]$, $|BD| = 3$ cm ve $|DC| = 5$ cm''dir. Taralı $ABD$ üçgeninin alanı $12$ cm² olduğuna göre $ABC$ üçgeninin alanı kaç cm²''dir?',
   '{"options":["15","20","24","28","32"],"correctIndex":4}'::jsonb,
   '$ABD$ ve $ADC$ üçgenlerinin $A$ köşesinden $[BC]$ doğrusuna inilen yükseklikleri ortaktır; bu yüzden alanları tabanlarıyla doğru orantılıdır. $3$ cm''lik tabana karşılık $12$ cm² alan düştüğüne göre birim taban başına $4$ cm² alan düşer. Tüm $ABC$ üçgeninin tabanı $|BC| = 3 + 5 = 8$ cm olduğundan alanı $8 \cdot 4 = 32$ cm² bulunur.',
   'B şıkkı (20), $ADC$ üçgeninin alanını ($5 \cdot 4 = 20$) hesaplayıp soru $ABC$ üçgeninin tamamını sorduğu hâlde $20$''yi işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 340 235" width="340" height="235" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><polygon points="117.5,30 30,205 135,205" fill="currentColor" fill-opacity="0.12"/><polygon points="117.5,30 30,205 310,205"/><line x1="30" y1="205" x2="135" y2="205"/><text x="82.5" y="221.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">3 cm</text><line x1="135" y1="205" x2="310" y2="205"/><text x="222.5" y="221.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">5 cm</text><text x="117.5" y="20.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="19.5" y="220.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="135" y="223.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text><text x="320.5" y="220.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text></svg>', true),
  -- mat-12-010 · doğrulandı
  ('2da3a18e-5a0d-5445-b0b9-4d3b31cbdb19'::uuid, 'Matematik & Geometri', 'Doğruda ve Üçgende Açılar, Üçgenler', 'multiple_choice', 2,
   'Kenar uzunlukları tam sayı olan bir $ABC$ üçgeninde $|AB| = 7$ cm, $|BC| = 11$ cm ve $m(\widehat{B}) > m(\widehat{C})$ olduğu bilinmektedir.
Buna göre $|AC|$ kenarının uzunluğu kaç farklı tam sayı değeri alabilir?',
   '{"options":["9","10","11","12","13"],"correctIndex":1}'::jsonb,
   'Üçgen eşitsizliğine göre $|BC| - |AB| < |AC| < |BC| + |AB|$, yani $11 - 7 < |AC| < 11 + 7 \Rightarrow 4 < |AC| < 18$ olmalıdır. Ayrıca $m(\widehat{B}) > m(\widehat{C})$ açı koşulundan büyük açının karşısında büyük kenar bulunacağı için $|AC| > |AB| = 7$ olmalıdır. İki eşitsizliğin kesişimi $7 < |AC| < 18$ olur. Bu aralıktaki tam sayılar $8, 9, \ldots, 17$ olup toplam $17 - 8 + 1 = 10$ tanedir.',
   'E şıkkı (13), $m(\widehat{B}) > m(\widehat{C})$ açı-kenar bağıntısını gözden kaçırıp yalnızca üçgen eşitsizliğindeki $5$''ten $17$''ye kadar olan $13$ tam sayıyı sayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-12-011 · şekilli · doğrulandı
  ('23dafe34-58de-53cd-84bb-046addd226b3'::uuid, 'Matematik & Geometri', 'Doğruda ve Üçgende Açılar, Üçgenler', 'multiple_choice', 1,
   'Şekilde $A, O, B$ noktaları doğrusal, $OC \perp OD$, $m(\widehat{AOC}) = 3x - 10^\circ$ ve $m(\widehat{DOB}) = 2x + 10^\circ$''dir.
Buna göre $x$ kaç derecedir?',
   '{"options":["18","16","20","22","36"],"correctIndex":0}'::jsonb,
   '$A, O, B$ doğrusal olduğundan doğru açı $180^\circ$''dir: $(3x - 10^\circ) + 90^\circ + (2x + 10^\circ) = 180^\circ \Rightarrow 5x + 90^\circ = 180^\circ \Rightarrow 5x = 90^\circ \Rightarrow x = 18^\circ$ bulunur.',
   'E şıkkı (36), ortadaki $90^\circ$''lik dik açıyı çıkardıktan sonra toplamı $180^\circ$ alıp $5x = 180^\circ \Rightarrow x = 36^\circ$ bulan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 340 160.7" width="340" height="160.7" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><line x1="30" y1="130.7" x2="310" y2="130.7"/><line x1="170" y1="130.7" x2="69.3" y2="33.4"/><line x1="170" y1="130.7" x2="267.3" y2="30"/><polyline points="162.1,123.1 169.7,115.1 177.6,122.8" stroke-width="1.4"/><path d="M170 130.7 L136 130.7 A34 34 0 0 1 145.5 107.1 Z" stroke="none"/><path d="M136 130.7 A34 34 0 0 1 145.5 107.1" stroke-width="1.4"/><text x="117.5" y="113.7" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">3x−10°</text><path d="M170 130.7 L193.6 106.2 A34 34 0 0 1 204 130.7 Z" stroke="none"/><path d="M193.6 106.2 A34 34 0 0 1 204 130.7" stroke-width="1.4"/><text x="222.1" y="112.8" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">2x+10°</text><text x="16" y="135.6" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="170" y="149.6" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">O</text><text x="324" y="135.6" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="58.8" y="27.8" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="277.8" y="24.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text></svg>', true),
  -- mat-12-012 · şekilli · doğrulandı
  ('cb930499-83e3-5fa7-954d-6a4c4ac26f0f'::uuid, 'Matematik & Geometri', 'Doğruda ve Üçgende Açılar, Üçgenler', 'multiple_choice', 2,
   'Şekildeki $ABC$ üçgeninde $[BD]$ ve $[CD]$ iç açıortaylardır. $m(\widehat{BDC}) = 118^\circ$ olduğuna göre $m(\widehat{BAC}) = x$ kaç derecedir?',
   '{"options":["28","48","52","56","62"],"correctIndex":3}'::jsonb,
   'Bir üçgende iki iç açıortayın oluşturduğu açı $m(\widehat{BDC}) = 90^\circ + \dfrac{m(\widehat{A})}{2}$ kuralıyla hesaplanır. Yerine yazılırsa $118^\circ = 90^\circ + \dfrac{x}{2} \Rightarrow \dfrac{x}{2} = 28^\circ \Rightarrow x = 56^\circ$ bulunur. (Açıortaylara $\alpha$ ve $\beta$ denerek $118 + \alpha + \beta = 180$ ile de aynı sonuca ulaşılır.)',
   'A şıkkı (28), $118^\circ - 90^\circ = 28^\circ$ farkını bulduktan sonra $2$ ile çarpmayı unutan adayı; E şıkkı (62) ise $180^\circ - 118^\circ = 62^\circ$''yi doğrudan tepe açısı sananları yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 272.7 260" width="272.7" height="260" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><polygon points="136.3,30 30,230 242.7,230"/><line x1="30" y1="230" x2="136.3" y2="166.1"/><line x1="242.7" y1="230" x2="136.3" y2="166.1"/><path d="M136.3 166.1 L115.8 178.4 A24 24 0 0 0 156.9 178.4 Z" stroke="none"/><path d="M115.8 178.4 A24 24 0 0 0 156.9 178.4" stroke-width="1.4"/><text x="136.3" y="212" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">118°</text><path d="M136.3 30 L124.1 53 A26 26 0 0 0 148.6 53 Z" stroke="none"/><path d="M124.1 53 A26 26 0 0 0 148.6 53" stroke-width="1.4"/><text x="136.3" y="70.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">x</text><path d="M30 230 L40.3 210.6 A22 22 0 0 1 48.9 218.7 Z" stroke="none"/><path d="M40.3 210.6 A22 22 0 0 1 48.9 218.7" stroke-width="1.4"/><path d="M30 230 L52.3 216.6 A26 26 0 0 1 56 230 Z" stroke="none"/><path d="M52.3 216.6 A26 26 0 0 1 56 230" stroke-width="1.4"/><path d="M242.7 230 L223.8 218.7 A22 22 0 0 1 232.4 210.6 Z" stroke="none"/><path d="M223.8 218.7 A22 22 0 0 1 232.4 210.6" stroke-width="1.4"/><path d="M220.4 216.6 A26 26 0 0 1 230.5 207" stroke-width="1.4"/><path d="M242.7 230 L216.7 230 A26 26 0 0 1 220.4 216.6 Z" stroke="none"/><path d="M216.7 230 A26 26 0 0 1 220.4 216.6" stroke-width="1.4"/><path d="M212.7 230 A30 30 0 0 1 217 214.5" stroke-width="1.4"/><text x="136.3" y="20.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="19.5" y="245.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="253.2" y="245.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="136.3" y="157" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text></svg>', true),
  -- mat-12-013 · şekilli · doğrulandı
  ('2b1d54f2-ab63-52c7-889d-d84a8352a599'::uuid, 'Matematik & Geometri', 'Doğruda ve Üçgende Açılar, Üçgenler', 'multiple_choice', 2,
   'Şekildeki $ABC$ ikizkenar üçgeninde $|AB| = |AC| = 10$ cm ve $|BC| = 12$ cm''dir.
Buna göre $ABC$ üçgeninin alanı kaç cm²''dir?',
   '{"options":["24","48","60","80","96"],"correctIndex":1}'::jsonb,
   'İkizkenar üçgende tepe noktasından tabana indirilen yükseklik tabanı iki eşit parçaya böler: $|BH| = |HC| = \dfrac{12}{2} = 6$ cm. Oluşan $ABH$ dik üçgeninde $6-8-10$ özel üçgeninden yükseklik $h = \sqrt{10^2 - 6^2} = 8$ cm olur. Üçgenin alanı $\dfrac{12 \cdot 8}{2} = 48$ cm² bulunur.',
   'C şıkkı (60), dikme indirip yüksekliği $8$ bulmak yerine yan kenar $10$ cm''yi yükseklik sanıp $\dfrac{12 \cdot 10}{2} = 60$ hesaplayan adayı; E şıkkı (96) ise alan formülünde ikiye bölmeyi unutanları yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 340 246.7" width="340" height="246.7" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><polygon points="170,30 30,216.7 310,216.7"/><line x1="170" y1="30" x2="30" y2="216.7"/><line x1="104.8" y1="126.9" x2="95.2" y2="119.7"/><text x="88" y="118.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">10</text><line x1="170" y1="30" x2="310" y2="216.7"/><line x1="244.8" y1="119.7" x2="235.2" y2="126.9"/><text x="252" y="118.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">10</text><line x1="30" y1="216.7" x2="310" y2="216.7"/><text x="170" y="233.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">12</text><text x="170" y="20.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="19.5" y="232.1" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="320.5" y="232.1" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text></svg>', true),
  -- mat-12-014 · doğrulandı
  ('c638f69a-663e-540d-9d42-b1a6a38e7cae'::uuid, 'Matematik & Geometri', 'Doğruda ve Üçgende Açılar, Üçgenler', 'multiple_choice', 1,
   'Bir tel bükülerek alanı $36\text{ cm}^2$ olan bir kare oluşturuluyor.
Aynı tel bozulup tamamıyla bir eşkenar üçgen oluşturulduğunda bu eşkenar üçgenin alanı kaç $\text{cm}^2$ olur?',
   '{"options":["$8\\sqrt{3}$","$12\\sqrt{3}$","$16\\sqrt{3}$","$24\\sqrt{3}$","$32\\sqrt{3}$"],"correctIndex":2}'::jsonb,
   'Alanı $36\text{ cm}^2$ olan karenin bir kenarı $\sqrt{36} = 6$ cm, dolayısıyla telin toplam uzunluğu (kare çevresi) $4 \cdot 6 = 24$ cm''dir. Bu telle yapılan eşkenar üçgenin bir kenarı $\dfrac{24}{3} = 8$ cm olur. Eşkenar üçgenin alanı $\dfrac{8^2\sqrt{3}}{4} = 16\sqrt{3}\text{ cm}^2$ bulunur.',
   'D şıkkı ($24\sqrt{3}$) veya B şıkkı ($12\sqrt{3}$), karenin çevresi ($24$) yerine kenarını $9$ alıp kare alanını veya eşkenar üçgen paydasındaki $4$ yerine $2$''ye bölen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-12-015 · şekilli · doğrulandı
  ('20de0cb1-82f7-5644-82ea-c4dc2b242cef'::uuid, 'Matematik & Geometri', 'Doğruda ve Üçgende Açılar, Üçgenler', 'multiple_choice', 2,
   'Şekildeki $ABC$ üçgeninde $[AD]$ iç açıortaydır. $|AB| = 6$ cm, $|AC| = 9$ cm ve $|BC| = 10$ cm olduğuna göre $|BD| = x$ kaç cm''dir?',
   '{"options":["2","3","4","5","6"],"correctIndex":2}'::jsonb,
   'İç açıortay teoremine göre kolların oranı taban parçalarının oranına eşittir: $\dfrac{|BD|}{|DC|} = \dfrac{|AB|}{|AC|} = \dfrac{6}{9} = \dfrac{2}{3}$. Buradan $|BD| = 2k$ ve $|DC| = 3k$ denirse $2k + 3k = 10 \Rightarrow 5k = 10 \Rightarrow k = 2$ olur. İstenen uzunluk $x = 2k = 4$ cm bulunur.',
   'E şıkkı (6), $k = 2$ bulduktan sonra küçük parça $|BD| = 4$ yerine büyük parça $|DC| = 6$''yı işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 340 209.3" width="340" height="209.3" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><polygon points="107,30 30,179.3 310,179.3"/><line x1="107" y1="30" x2="142" y2="179.3"/><line x1="107" y1="30" x2="30" y2="179.3"/><text x="56.3" y="102.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">6</text><line x1="107" y1="30" x2="310" y2="179.3"/><text x="216.3" y="98.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">9</text><line x1="30" y1="179.3" x2="142" y2="179.3"/><text x="86" y="195.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">x</text><path d="M107 30 L96 51.3 A24 24 0 0 0 112.5 53.4 Z" stroke="none"/><path d="M96 51.3 A24 24 0 0 0 112.5 53.4" stroke-width="1.4"/><path d="M107 30 L113.4 57.3 A28 28 0 0 0 129.6 46.6 Z" stroke="none"/><path d="M113.4 57.3 A28 28 0 0 0 129.6 46.6" stroke-width="1.4"/><text x="107" y="20.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="19.5" y="194.7" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="142" y="198.2" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text><text x="320.5" y="194.7" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text></svg>', true),
  -- mat-12-016 · şekilli · doğrulandı
  ('eb623e41-4ae0-5155-994c-1a657ec601d0'::uuid, 'Matematik & Geometri', 'Doğruda ve Üçgende Açılar, Üçgenler', 'multiple_choice', 2,
   'Şekildeki $ABC$ dik üçgeninde $m(\widehat{BAC}) = 90^\circ$ ve $G$ noktası üçgenin ağırlık merkezidir. $|AB| = 6$ cm ve $|AC| = 6\sqrt{3}$ cm olduğuna göre $|AG| = x$ kaç cm''dir?',
   '{"options":["2","3","$2\\sqrt{3}$","4","6"],"correctIndex":3}'::jsonb,
   '$ABC$ dik üçgeninde Pisagor ile hipotenüs $|BC| = \sqrt{6^2 + (6\sqrt{3})^2} = \sqrt{36 + 108} = 12$ cm bulunur. Dik açıdan hipotenüse çizilen kenarortay hipotenüsün yarısına eşittir (muhteşem üçlü): $|AD| = \dfrac{12}{2} = 6$ cm. Ağırlık merkezi $G$, kenarortayı köşeden itibaren $2 : 1$ oranında böldüğü için $x = |AG| = \dfrac{2}{3} \cdot 6 = 4$ cm bulunur.',
   'E şıkkı (6), kenarortayın tamamını ($|AD| = 6$) bulup ağırlık merkezi oranını uygulamayı unutan adayı; A şıkkı (2) ise $|AG|$ yerine $|GD| = 2$ cm''yi seçenleri yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 340 181.2" width="340" height="181.2" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><polygon points="100,30 30,151.2 310,151.2"/><line x1="100" y1="30" x2="170" y2="151.2"/><line x1="100" y1="30" x2="30" y2="151.2"/><text x="53.2" y="88.4" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">6</text><line x1="100" y1="30" x2="310" y2="151.2"/><text x="212.4" y="82.3" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">6√3</text><line x1="30" y1="151.2" x2="170" y2="151.2"/><line x1="100" y1="145.2" x2="100" y2="157.2"/><line x1="170" y1="151.2" x2="310" y2="151.2"/><line x1="240" y1="145.2" x2="240" y2="157.2"/><polyline points="94.5,39.5 104,45 109.5,35.5" stroke-width="1.4"/><text x="100" y="20.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="19.5" y="166.6" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="320.5" y="166.6" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="170" y="170.1" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text><circle cx="146.7" cy="110.8" r="3" fill="currentColor" stroke="none"/><text x="157.2" y="105.2" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">G</text></svg>', true),
  -- mat-12-017 · şekilli · doğrulandı
  ('f4f6246d-bf76-5e1d-9486-1f0c9dc9ce0a'::uuid, 'Matematik & Geometri', 'Doğruda ve Üçgende Açılar, Üçgenler', 'multiple_choice', 1,
   'Şekildeki $ABC$ dik üçgeninde $m(\widehat{BAC}) = 90^\circ$, $m(\widehat{C}) = 30^\circ$ ve $|AB| = 5$ cm''dir.
Buna göre $ABC$ üçgeninin çevresi kaç cm''dir?',
   '{"options":["$10 + 5\\sqrt{3}$","$15 + 5\\sqrt{3}$","$15 + 5\\sqrt{2}$","$20$","$10 + 10\\sqrt{3}$"],"correctIndex":1}'::jsonb,
   '$30^\circ - 60^\circ - 90^\circ$ dik üçgeninde $30^\circ$''nin karşısındaki kenar $|AB| = 5$ cm olduğundan hipotenüs $|BC| = 2 \cdot 5 = 10$ cm ve $60^\circ$''nin karşısındaki dik kenar $|AC| = 5\sqrt{3}$ cm olur. Üçgenin çevresi $5 + 10 + 5\sqrt{3} = 15 + 5\sqrt{3}$ cm bulunur.',
   'A şıkkı ($10 + 5\sqrt{3}$), yalnızca $|BC| = 10$ ile $|AC| = 5\sqrt{3}$''ü toplayıp dik kenar $|AB| = 5$''i çevreye eklemeyi unutan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 340 221.7" width="340" height="221.7" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><polygon points="30,191.7 30,30 310,191.7"/><line x1="30" y1="191.7" x2="30" y2="30"/><text x="16.1" y="115.4" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">5</text><polyline points="30,180.7 41,180.7 41,191.7" stroke-width="1.4"/><path d="M310 191.7 L282 191.7 A28 28 0 0 1 285.8 177.7 Z" stroke="none"/><path d="M282 191.7 A28 28 0 0 1 285.8 177.7" stroke-width="1.4"/><text x="268.2" y="184.7" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">30°</text><text x="19.5" y="207.1" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="30" y="20.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="320.5" y="207.1" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text></svg>', true),
  -- mat-12-018 · şekilli · doğrulandı
  ('d86390ad-64e6-5c2d-a814-c54cc429c779'::uuid, 'Matematik & Geometri', 'Doğruda ve Üçgende Açılar, Üçgenler', 'multiple_choice', 3,
   'Şekilde $DC \parallel AB$ olmak üzere $[AC]$ ve $[BD]$ doğru parçaları $E$ noktasında kesişmektedir. $|DC| = 4$ cm, $|AB| = 12$ cm ve taralı $DEC$ üçgeninin alanı $6$ cm² olduğuna göre $AEB$ üçgeninin alanı kaç cm²''dir?',
   '{"options":["12","18","24","36","54"],"correctIndex":4}'::jsonb,
   '$DC \parallel AB$ olduğundan $DEC$ ve $BEA$ üçgenleri benzerdir (kelebek benzerliği). Benzerlik oranı $k = \dfrac{|AB|}{|DC|} = \dfrac{12}{4} = 3$''tür. Benzer üçgenlerin alanları oranı benzerlik oranının karesine ($k^2 = 3^2 = 9$) eşittir. Dolayısıyla $\text{Alan}(\triangle AEB) = 9 \cdot \text{Alan}(\triangle DEC) = 9 \cdot 6 = 54$ cm² bulunur.',
   'B şıkkı (18), alanlar oranını benzerlik oranının karesi yerine doğrudan benzerlik oranına ($3$) eşit sanıp $6 \cdot 3 = 18$ bulan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 340 153.3" width="340" height="153.3" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><polygon points="76.7,30 135,53.3 170,30" fill="currentColor" fill-opacity="0.12"/><line x1="76.7" y1="30" x2="170" y2="30"/><text x="123.3" y="22.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">4</text><line x1="30" y1="123.3" x2="310" y2="123.3"/><text x="170" y="139.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">12</text><line x1="30" y1="123.3" x2="170" y2="30"/><line x1="310" y1="123.3" x2="76.7" y2="30"/><text x="66.2" y="24.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text><text x="180.5" y="24.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="19.5" y="138.7" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="320.5" y="138.7" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="149" y="58.2" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">E</text></svg>', true),
  -- mat-12-019 · şekilli · doğrulandı
  ('019d55bd-2b95-51c9-af72-90824015dacd'::uuid, 'Matematik & Geometri', 'Doğruda ve Üçgende Açılar, Üçgenler', 'multiple_choice', 2,
   'Şekildeki $ABC$ üçgeninde $D$ ve $E$ sırasıyla $[AB]$ ve $[AC]$ kenarlarının orta noktalarıdır. $|DE| = 7$ cm, $|BD| = 4$ cm ve $|EC| = 5$ cm olduğuna göre $ABC$ üçgeninin çevresi kaç cm''dir?',
   '{"options":["32","23","25","28","36"],"correctIndex":0}'::jsonb,
   '$D$ ve $E$ orta noktalar olduğu için $[DE]$ orta tabandır ve $|BC| = 2|DE| = 2 \cdot 7 = 14$ cm''dir. Ayrıca $|AB| = 2|BD| = 8$ cm ve $|AC| = 2|EC| = 10$ cm olur. Üçgenin çevresi $8 + 10 + 14 = 32$ cm bulunur.',
   'B şıkkı (23), $|BC| = 14$ bulduktan sonra $|AB|$ ve $|AC|$ yerine yarım parçalar olan $4$ ve $5$''i toplayan ($14 + 4 + 5 = 23$) adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 340 172" width="340" height="172" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><polygon points="144.3,30 30,142 310,142"/><line x1="144.3" y1="30" x2="87.1" y2="86"/><line x1="119.9" y1="62.3" x2="111.5" y2="53.7"/><line x1="87.1" y1="86" x2="30" y2="142"/><line x1="62.8" y1="118.3" x2="54.4" y2="109.7"/><text x="49.2" y="109" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">4</text><line x1="144.3" y1="30" x2="227.1" y2="86"/><line x1="187" y1="51.6" x2="180.3" y2="61.6"/><line x1="191.1" y1="54.4" x2="184.4" y2="64.4"/><line x1="227.1" y1="86" x2="310" y2="142"/><line x1="269.9" y1="107.6" x2="263.1" y2="117.6"/><line x1="274" y1="110.4" x2="267.3" y2="120.4"/><text x="275.9" y="107.7" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">5</text><line x1="87.1" y1="86" x2="227.1" y2="86"/><text x="157.1" y="102.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">7</text><text x="144.3" y="20.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="19.5" y="157.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="320.5" y="157.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="76.6" y="80.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text><text x="237.6" y="80.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">E</text></svg>', true),
  -- mat-12-020 · şekilli · doğrulandı
  ('c0ca34ad-c546-5bc7-87bc-fca20547b2b9'::uuid, 'Matematik & Geometri', 'Doğruda ve Üçgende Açılar, Üçgenler', 'multiple_choice', 2,
   'Şekildeki $ABC$ dik üçgeninde $m(\widehat{BAC}) = 90^\circ$, $|AD| = |BD| = |DC|$ ve $m(\widehat{ADB}) = 110^\circ$ olduğuna göre $m(\widehat{ACD}) = x$ kaç derecedir?',
   '{"options":["35","45","55","65","70"],"correctIndex":2}'::jsonb,
   '$B, D, C$ doğrusal olduğundan $m(\widehat{ADC}) = 180^\circ - 110^\circ = 70^\circ$''dir. $ADC$ üçgeninde $|AD| = |DC|$ verildiği için taban açıları eşittir: $x = m(\widehat{DAC}) = \dfrac{180^\circ - 70^\circ}{2} = \dfrac{110^\circ}{2} = 55^\circ$ bulunur.',
   'A şıkkı (35), $ABD$ üçgeninde taban açısı olan $m(\widehat{B}) = 35^\circ$''yi bulup soru $\widehat{C}$ açısını sorduğu hâlde $35^\circ$''yi işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 340 191.5" width="340" height="191.5" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><polygon points="217.9,30 30,161.5 310,161.5"/><line x1="217.9" y1="30" x2="170" y2="161.5"/><line x1="199.6" y1="97.8" x2="188.3" y2="93.7"/><line x1="30" y1="161.5" x2="170" y2="161.5"/><line x1="100" y1="155.5" x2="100" y2="167.5"/><line x1="170" y1="161.5" x2="310" y2="161.5"/><line x1="240" y1="155.5" x2="240" y2="167.5"/><path d="M170 161.5 L146 161.5 A24 24 0 0 1 178.2 139 Z" stroke="none"/><path d="M146 161.5 A24 24 0 0 1 178.2 139" stroke-width="1.4"/><text x="146.1" y="131.5" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">110°</text><path d="M310 161.5 L295.1 140.2 A26 26 0 0 0 284 161.5 Z" stroke="none"/><path d="M295.1 140.2 A26 26 0 0 0 284 161.5" stroke-width="1.4"/><text x="277.7" y="148.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">x</text><polyline points="208.9,36.3 215.2,45.3 224.2,39" stroke-width="1.4"/><text x="217.9" y="20.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="19.5" y="176.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="170" y="180.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text><text x="320.5" y="176.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text></svg>', true),
  -- mat-12-021 · şekilli · doğrulandı
  ('91d4ff2e-9fc2-53ee-8e36-78ddc339a8da'::uuid, 'Matematik & Geometri', 'Doğruda ve Üçgende Açılar, Üçgenler', 'multiple_choice', 3,
   'Şekildeki $ABC$ üçgeninde $I$ noktası iç açıortayların kesim noktasıdır ve $DE \parallel BC$ veriliyor. $|AB| = 9$ cm, $|AC| = 11$ cm ve $|BC| = 12$ cm olduğuna göre $ADE$ üçgeninin çevresi kaç cm''dir?',
   '{"options":["18","21","23","20","32"],"correctIndex":3}'::jsonb,
   '$DE \parallel BC$ ve $[BI]$ açıortay olduğundan iç ters açılar nedeniyle $m(\widehat{DIB}) = m(\widehat{IBC}) = m(\widehat{DBI})$ olur; buradan $|DI| = |DB|$ bulunur. Aynı şekilde $[CI]$ açıortayından $|IE| = |EC|$ elde edilir. $ADE$ üçgeninin çevresi $|AD| + |DI| + |IE| + |AE| = (|AD| + |DB|) + (|AE| + |EC|) = |AB| + |AC| = 9 + 11 = 20$ cm bulunur.',
   'E şıkkı (32), üç kenarı da toplayarak $ABC$ üçgeninin çevresini ($9 + 11 + 12 = 32$) işaretleyen adayı yakalar. Paralellik + açıortay ikizkenarı nedeniyle $|BC| = 12$ bilgisi $ADE$ çevresini etkilemez.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 340 244.1" width="340" height="244.1" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><polygon points="131.1,30 30,214.1 310,214.1"/><line x1="67.9" y1="145" x2="242.9" y2="145"/><line x1="30" y1="214.1" x2="146.7" y2="145"/><line x1="310" y1="214.1" x2="146.7" y2="145"/><path d="M30 214.1 L40.6 194.8 A22 22 0 0 1 48.9 202.9 Z" stroke="none"/><path d="M40.6 194.8 A22 22 0 0 1 48.9 202.9" stroke-width="1.4"/><path d="M30 214.1 L52.4 200.8 A26 26 0 0 1 56 214.1 Z" stroke="none"/><path d="M52.4 200.8 A26 26 0 0 1 56 214.1" stroke-width="1.4"/><path d="M310 214.1 L289.7 205.5 A22 22 0 0 1 294.7 198.3 Z" stroke="none"/><path d="M289.7 205.5 A22 22 0 0 1 294.7 198.3" stroke-width="1.4"/><path d="M286.1 203.9 A26 26 0 0 1 291.9 195.4" stroke-width="1.4"/><path d="M310 214.1 L284 214.1 A26 26 0 0 1 286.1 203.9 Z" stroke="none"/><path d="M284 214.1 A26 26 0 0 1 286.1 203.9" stroke-width="1.4"/><path d="M280 214.1 A30 30 0 0 1 282.4 202.4" stroke-width="1.4"/><text x="131.1" y="20.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="19.5" y="229.5" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="320.5" y="229.5" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><circle cx="146.7" cy="145" r="3" fill="currentColor" stroke="none"/><text x="146.7" y="163.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">I</text><text x="57.4" y="139.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text><text x="253.4" y="139.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">E</text></svg>', true),
  -- mat-12-022 · doğrulandı
  ('71f41912-99a5-5d32-b013-52ef3caa3ed4'::uuid, 'Matematik & Geometri', 'Doğruda ve Üçgende Açılar, Üçgenler', 'multiple_choice', 1,
   'İkizkenar bir üçgenin bir iç açısının ölçüsü $40^\circ$''dir.
Buna göre bu üçgenin en büyük iç açısı ile en küçük iç açısı arasındaki fark en çok kaç derece olabilir?',
   '{"options":["30","60","70","80","100"],"correctIndex":1}'::jsonb,
   'İkizkenar üçgende verilen $40^\circ$''lik açı tepe açısı veya taban açısı olabilir:
- $40^\circ$ tepe açısıysa iç açılar $(40^\circ, 70^\circ, 70^\circ)$ olur; en büyük ve en küçük açı farkı $70^\circ - 40^\circ = 30^\circ$''dir.
- $40^\circ$ taban açısıysa iç açılar $(40^\circ, 40^\circ, 100^\circ)$ olur; en büyük ve en küçük açı farkı $100^\circ - 40^\circ = 60^\circ$''dir.
Fark en çok $60^\circ$ olabilir.',
   'A şıkkı ($30$), $40^\circ$''nin yalnızca tepe açısı olabileceğini düşünüp $(40^\circ, 70^\circ, 70^\circ)$ üçgenini inceleyen; E şıkkı ($100$) ise fark yerine yalnızca en büyük tepe açısını ($100^\circ$) işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-12-023 · şekilli · doğrulandı
  ('dc605f9f-1f46-58d2-8cb4-f5e52039811b'::uuid, 'Matematik & Geometri', 'Doğruda ve Üçgende Açılar, Üçgenler', 'multiple_choice', 1,
   'Şekilde $[PB \parallel [RE$, $m(\widehat{BPK}) = 38^\circ$ ve $m(\widehat{ERK}) = 47^\circ$ veriliyor.
Buna göre $m(\widehat{PKR}) = x$ kaç derecedir?',
   '{"options":["65","70","75","80","85"],"correctIndex":4}'::jsonb,
   'Paralel doğrular arasında kırık çizgi (M) kuralı uygulanır veya $K$ noktasından $PB$ ve $RE$ ışınlarına paralel üçüncü bir doğru çizilir. İç ters açılardan $x$ açısı $38^\circ$ ve $47^\circ$''lik iki açıya bölünür:
$$x = 38^\circ + 47^\circ = 85^\circ$$',
   'C şıkkı ($75$) veya D şıkkı ($80$), $38 + 47$ toplamını aceleyle $85$ yerine yanlış toplamanın; A şıkkı ($65$) ise açıları çıkarıp $90^\circ$''ye tamamlamaya çalışan adayın düştüğü tuzaktır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 340 220" width="340" height="220" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><line x1="30" y1="30" x2="310" y2="30"/><line x1="30" y1="190" x2="310" y2="190"/><line x1="110" y1="30" x2="212.4" y2="110"/><line x1="212.4" y1="110" x2="137.8" y2="190"/><path d="M110 30 L130.5 46 A26 26 0 0 0 136 30 Z" stroke="none"/><path d="M130.5 46 A26 26 0 0 0 136 30" stroke-width="1.4"/><text x="149.1" y="47.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">38°</text><path d="M137.8 190 L161.8 190 A24 24 0 0 0 154.2 172.4 Z" stroke="none"/><path d="M161.8 190 A24 24 0 0 0 154.2 172.4" stroke-width="1.4"/><text x="173.8" y="178.5" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">47°</text><path d="M212.4 110 L193.5 95.2 A24 24 0 0 0 196 127.6 Z" stroke="none"/><path d="M193.5 95.2 A24 24 0 0 0 196 127.6" stroke-width="1.4"/><text x="178.1" y="116.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">x</text><text x="16" y="34.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><circle cx="110" cy="30" r="3" fill="currentColor" stroke="none"/><text x="110" y="20.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">P</text><text x="324" y="34.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><circle cx="212.4" cy="110" r="3" fill="currentColor" stroke="none"/><text x="198.4" y="114.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">K</text><text x="16" y="194.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text><circle cx="137.8" cy="190" r="3" fill="currentColor" stroke="none"/><text x="137.8" y="208.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">R</text><text x="324" y="194.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">E</text></svg>', true),
  -- mat-12-024 · şekilli · doğrulandı
  ('08ea2fc0-1b0e-572a-a99c-c19aa3933b0b'::uuid, 'Matematik & Geometri', 'Doğruda ve Üçgende Açılar, Üçgenler', 'multiple_choice', 2,
   'Şekildeki $ABC$ ikizkenar üçgeninde $|AB| = |AC|$, $[BD]$ açıortay ve $m(\widehat{BAC}) = 44^\circ$ veriliyor.
Buna göre $m(\widehat{BDC}) = x$ kaç derecedir?',
   '{"options":["78","82","84","92","102"],"correctIndex":0}'::jsonb,
   '$|AB| = |AC|$ olduğu için $ABC$ üçgeninin taban açıları eşittir:
$$m(\widehat{ABC}) = m(\widehat{ACB}) = \frac{180^\circ - 44^\circ}{2} = 68^\circ$$
$[BD]$ açıortay olduğundan $m(\widehat{ABD}) = m(\widehat{DBC}) = \dfrac{68^\circ}{2} = 34^\circ$ olur. $ABD$ üçgeninde iki iç açının toplamı komşu olmayan dış açıya eşittir:
$$x = m(\widehat{BDC}) = 44^\circ + 34^\circ = 78^\circ$$',
   'E şıkkı ($102$), $x$ olarak sorulan $\widehat{BDC}$ açısı yerine bütünleri olan $\widehat{ADB} = 180^\circ - 78^\circ = 102^\circ$ açısını bulanların işaretlediği güçlü çeldiricidir.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 221.6 260" width="221.6" height="260" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><polygon points="110.8,30 30,230 191.6,230"/><line x1="110.8" y1="30" x2="30" y2="230"/><line x1="76" y1="132.2" x2="64.8" y2="127.8"/><line x1="110.8" y1="30" x2="191.6" y2="230"/><line x1="156.8" y1="127.8" x2="145.6" y2="132.2"/><line x1="30" y1="230" x2="157" y2="144.3"/><path d="M110.8 30 L101.8 52.3 A24 24 0 0 0 119.8 52.3 Z" stroke="none"/><path d="M101.8 52.3 A24 24 0 0 0 119.8 52.3" stroke-width="1.4"/><text x="110.8" y="73.5" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">44°</text><path d="M30 230 L38.2 209.6 A22 22 0 0 1 48.2 217.7 Z" stroke="none"/><path d="M38.2 209.6 A22 22 0 0 1 48.2 217.7" stroke-width="1.4"/><path d="M30 230 L51.6 215.5 A26 26 0 0 1 56 230 Z" stroke="none"/><path d="M51.6 215.5 A26 26 0 0 1 56 230" stroke-width="1.4"/><path d="M157 144.3 L138.8 156.6 A22 22 0 0 0 165.3 164.7 Z" stroke="none"/><path d="M138.8 156.6 A22 22 0 0 0 165.3 164.7" stroke-width="1.4"/><text x="147.5" y="179.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">x</text><text x="110.8" y="20.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="19.5" y="245.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="202.1" y="245.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="167.5" y="138.7" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text></svg>', true),
  -- mat-12-025 · şekilli · doğrulandı
  ('2a6abb04-cefe-568c-bffe-c942b6018ab3'::uuid, 'Matematik & Geometri', 'Doğruda ve Üçgende Açılar, Üçgenler', 'multiple_choice', 2,
   'Şekildeki $ABC$ dik üçgeninde $m(\widehat{BAC}) = 90^\circ$ ve $[AH] \perp [BC]$ veriliyor. $|AB| = 15$ cm ve $|BH| = 9$ cm olduğuna göre $|AC| = x$ kaç cm''dir?',
   '{"options":["16","18","20","22","24"],"correctIndex":2}'::jsonb,
   '$ABC$ dik üçgeninde Öklid bağıntısı uygulanır:
$$|AB|^2 = |BH| \cdot |BC| \Rightarrow 15^2 = 9 \cdot |BC| \Rightarrow |BC| = \frac{225}{9} = 25\text{ cm}$$
Böylece $ABC$ dik üçgeni $15-20-25$ ($3-4-5$ üçgeninin $5$ katı) özel dik üçgeni olur ve $x = |AC| = 20$ cm bulunur (alternatif olarak $|HC| = 25 - 9 = 16$ üzerinden $|AC| = \sqrt{16 \cdot 25} = 20$ elde edilir).',
   'A şıkkı ($16$), $|BC| = 25$ bulup $|HC| = 25 - 9 = 16$ parçasını doğrudan $|AC|$ sanan adayı; D şıkkı ($22$) ise Öklid yerine yanlış orantı kuranları yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 340 194.4" width="340" height="194.4" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><polygon points="130.8,30 30,164.4 310,164.4"/><line x1="130.8" y1="30" x2="130.8" y2="164.4"/><line x1="130.8" y1="30" x2="30" y2="164.4"/><text x="68.4" y="92.7" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">15</text><line x1="30" y1="164.4" x2="130.8" y2="164.4"/><text x="80.4" y="181" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">9</text><line x1="130.8" y1="30" x2="310" y2="164.4"/><text x="212.5" y="112.3" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">x</text><polyline points="124.2,38.8 133,45.4 139.6,36.6" stroke-width="1.4"/><polyline points="130.8,153.4 141.8,153.4 141.8,164.4" stroke-width="1.4"/><text x="130.8" y="20.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="19.5" y="179.8" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="130.8" y="183.3" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">H</text><text x="320.5" y="179.8" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text></svg>', true),
  -- mat-12-026 · şekilli · doğrulandı
  ('0e6dba2c-6703-5cf6-90e3-ddd1b146185a'::uuid, 'Matematik & Geometri', 'Doğruda ve Üçgende Açılar, Üçgenler', 'multiple_choice', 2,
   'Şekildeki $ABC$ üçgeninde $m(\widehat{ABC}) = 45^\circ$, $m(\widehat{ACB}) = 30^\circ$ ve $|AC| = 12$ cm veriliyor.
Buna göre $|AB| = x$ kaç cm''dir?',
   '{"options":["6","$6\\sqrt{2}$","$6\\sqrt{3}$","$8\\sqrt{2}$","12"],"correctIndex":1}'::jsonb,
   '$A$ köşesinden $[BC]$ kenarına $[AH] \perp [BC]$ yüksekliği indirilir. Oluşan $AHC$ üçgeni $30^\circ-60^\circ-90^\circ$ üçgeni olduğundan $30^\circ$''nin karşısındaki yükseklik hipotenüsün yarısıdır: $|AH| = \dfrac{12}{2} = 6$ cm. Soldaki $ABH$ üçgeni $45^\circ-45^\circ-90^\circ$ ikizkenar dik üçgeni olduğundan hipotenüs $x = |AB| = 6\sqrt{2}$ cm bulunur.',
   'C şıkkı ($6\sqrt{3}$), $45^\circ-45^\circ-90^\circ$ oranı ($\sqrt{2}$) ile $30^\circ-60^\circ-90^\circ$ kenar oranı ($\sqrt{3}$) çarpımını karıştıran; A şıkkı ($6$) ise yalnızca yükseklik uzunluğunda duran adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 340 162.5" width="340" height="162.5" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><polygon points="132.5,30 30,132.5 310,132.5"/><line x1="132.5" y1="30" x2="310" y2="132.5"/><text x="228.2" y="73.8" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">12</text><line x1="132.5" y1="30" x2="30" y2="132.5"/><text x="71.8" y="76.4" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">x</text><path d="M30 132.5 L47 115.5 A24 24 0 0 1 54 132.5 Z" stroke="none"/><path d="M47 115.5 A24 24 0 0 1 54 132.5" stroke-width="1.4"/><text x="66.3" y="121.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">45°</text><path d="M310 132.5 L280 132.5 A30 30 0 0 1 284 117.5 Z" stroke="none"/><path d="M280 132.5 A30 30 0 0 1 284 117.5" stroke-width="1.4"/><text x="266.2" y="125" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">30°</text><text x="132.5" y="20.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="19.5" y="147.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="320.5" y="147.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text></svg>', true),
  -- mat-12-027 · şekilli · doğrulandı
  ('08d65fb2-b1a4-51cd-a11e-972f4f871632'::uuid, 'Matematik & Geometri', 'Doğruda ve Üçgende Açılar, Üçgenler', 'multiple_choice', 3,
   'Şekildeki $ABC$ üçgeninde $[AD]$ dış açıortaydır ($m(\widehat{CAD}) = m(\widehat{DAE})$). $|AB| = 9$ cm, $|AC| = 6$ cm ve $|BC| = 5$ cm olduğuna göre $|CD| = x$ kaç cm''dir?',
   '{"options":["6","7","8","9","10"],"correctIndex":4}'::jsonb,
   'Dış açıortay teoremine göre dış açıortayın uzantı üzerindeki bitim noktasından yakın ve uzak köşelere olan uzaklıklarının oranı, komşu üçgen kenarlarının oranına eşittir:
$$\frac{|CD|}{|BD|} = \frac{|AC|}{|AB|} \Rightarrow \frac{x}{x + 5} = \frac{6}{9} = \frac{2}{3}$$
İçler dışlar çarpımıyla $3x = 2x + 10 \Rightarrow x = 10$ cm bulunur.',
   'C şıkkı ($8$) veya D şıkkı ($9$), dış açıortay oranını kurarken paydaya tüm $|BD| = x + 5$ yerine yanlışlıkla sadece $|BC| = 5$ yazarak $\dfrac{x}{5} = \dfrac{9}{6}$ gibi ters/hatalı orantılar kuran adayları düşürür.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 340 218.4" width="340" height="218.4" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><polygon points="160.7,82.8 30,188.4 123.3,188.4"/><line x1="160.7" y1="82.8" x2="30" y2="188.4"/><text x="87" y="129.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">9</text><line x1="160.7" y1="82.8" x2="123.3" y2="188.4"/><text x="155" y="144.7" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">6</text><line x1="30" y1="188.4" x2="123.3" y2="188.4"/><text x="76.7" y="204.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">5</text><line x1="123.3" y1="188.4" x2="310" y2="188.4"/><text x="216.7" y="204.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">x</text><line x1="160.7" y1="82.8" x2="310" y2="188.4"/><line x1="160.7" y1="82.8" x2="226" y2="30"/><path d="M160.7 82.8 L176.2 70.2 A20 20 0 0 1 177 94.3 Z" stroke="none"/><path d="M176.2 70.2 A20 20 0 0 1 177 94.3" stroke-width="1.4"/><path d="M160.7 82.8 L180.3 96.6 A24 24 0 0 1 152.7 105.4 Z" stroke="none"/><path d="M180.3 96.6 A24 24 0 0 1 152.7 105.4" stroke-width="1.4"/><text x="19.5" y="203.8" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="123.3" y="207.3" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="320.5" y="203.8" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text><text x="150.2" y="77.2" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="236.5" y="24.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">E</text></svg>', true),
  -- mat-12-028 · doğrulandı
  ('483da659-4c3a-5cdb-aed2-6e6b105a9c39'::uuid, 'Matematik & Geometri', 'Doğruda ve Üçgende Açılar, Üçgenler', 'multiple_choice', 1,
   'Kenar uzunlukları $5$ cm, $8$ cm ve $x$ cm olan bir çeşitkenar üçgende $x$''in alabileceği kaç farklı tam sayı değeri vardır?',
   '{"options":["5","6","7","8","9"],"correctIndex":2}'::jsonb,
   'Üçgen eşitsizliğine göre $x$ kenarı diğer iki kenarın farkından büyük, toplamından küçük olmalıdır:
$$8 - 5 < x < 8 + 5 \Rightarrow 3 < x < 13$$
Bu aralıktaki tam sayılar $\{4, 5, 6, 7, 8, 9, 10, 11, 12\}$ olmak üzere $9$ tanedir. Ancak üçgen çeşitkenar olduğundan $x \neq 5$ ve $x \neq 8$ olmalıdır. Bu iki değer çıkarılırsa $9 - 2 = 7$ farklı tam sayı değeri kalır.',
   'E şıkkı ($9$), üçgen eşitsizliğini doğru kurduktan sonra sorudaki "çeşitkenar" koşulunu atlayıp $5$ ve $8$ değerlerini de sayan adayların neredeyse tamamının düştüğü sorudaki kelime tuzağıdır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-12-029 · şekilli · doğrulandı
  ('cbcb4a9c-2a2c-5e37-a2d7-310717460970'::uuid, 'Matematik & Geometri', 'Doğruda ve Üçgende Açılar, Üçgenler', 'multiple_choice', 2,
   'Şekilde $AB \parallel DE$ ve $[AE] \cap [BD] = \{C\}$ veriliyor. $|AB| = 15$ cm, $|DE| = 10$ cm ve $|BD| = 30$ cm olduğuna göre $|BC| = x$ kaç cm''dir?',
   '{"options":["10","12","15","18","20"],"correctIndex":3}'::jsonb,
   '$AB \parallel DE$ olduğundan $ABC$ ve $EDC$ üçgenleri kelebek benzerliğiyle benzerdir:
$$\frac{|BC|}{|CD|} = \frac{|AB|}{|DE|} = \frac{15}{10} = \frac{3}{2}$$
Buradan $|BC| = 3k$ ve $|CD| = 2k$ yazılırsa $|BD| = 5k = 30 \Rightarrow k = 6$ olur. Aranan uzunluk $x = |BC| = 3 \cdot 6 = 18$ cm bulunur.',
   'B şıkkı ($12$), $k = 6$ bulduktan sonra büyük parça olan $|BC| = 3k$ yerine küçük parça olan $|CD| = 2k = 12$ uzunluğunu işaretleyen; C şıkkı ($15$) ise $30$''u doğrudan ikiye bölen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 340 246.7" width="340" height="246.7" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><polygon points="30,30 310,30 170,142"/><polygon points="76.7,216.7 263.3,216.7 170,142"/><line x1="30" y1="30" x2="310" y2="30"/><text x="170" y="22.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">15</text><line x1="76.7" y1="216.7" x2="263.3" y2="216.7"/><text x="170" y="233.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">10</text><text x="19.5" y="24.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="320.5" y="24.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="184" y="146.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="66.2" y="232.1" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text><text x="273.8" y="232.1" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">E</text></svg>', true),
  -- mat-12-030 · şekilli · doğrulandı
  ('2a6d77b8-26ec-5785-ae5d-e2f48f13c7f3'::uuid, 'Matematik & Geometri', 'Doğruda ve Üçgende Açılar, Üçgenler', 'multiple_choice', 2,
   'Şekildeki $ABC$ üçgeninde $|BD| = 2|DC|$ ve $|AE| = 2|ED|$ veriliyor.
$\text{Alan}(\triangle EDC) = 4\text{ cm}^2$ olduğuna göre $\text{Alan}(\triangle ABC)$ kaç $\text{cm}^2$''dir?',
   '{"options":["18","24","27","32","36"],"correctIndex":4}'::jsonb,
   'Yükseklikleri ortak olan üçgenlerin alanları tabanlarıyla orantılıdır. Önce $ADC$ üçgeninde $C$ köşesinden bakılırsa $|AE| = 2|ED|$ olduğundan $\text{Alan}(\triangle AEC) = 2 \cdot \text{Alan}(\triangle EDC) = 2 \cdot 4 = 8\text{ cm}^2$ ve buradan $\text{Alan}(\triangle ADC) = 8 + 4 = 12\text{ cm}^2$ olur.
Ardından $ABC$ üçgeninde $A$ köşesinden bakılırsa $|BD| = 2|DC|$ olduğundan $\text{Alan}(\triangle ABD) = 2 \cdot 12 = 24\text{ cm}^2$ bulunur. Tüm alan $\text{Alan}(\triangle ABC) = 24 + 12 = 36\text{ cm}^2$''dir.',
   'B şıkkı ($24$), $\text{Alan}(\triangle ABD) = 24$ değerini tüm üçgenin alanı sanıp $\text{Alan}(\triangle ADC) = 12$''yi eklemeyi unutanları; A şıkkı ($18$) ise oranları $2$ yerine $3/2$ gibi alan hatası yapanları yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 326.7 260" width="326.7" height="260" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><polygon points="141.1,30 30,230 296.7,230"/><polygon points="185.6,163.3 207.8,230 296.7,230" fill="currentColor" fill-opacity="0.12"/><line x1="141.1" y1="30" x2="207.8" y2="230"/><line x1="30" y1="230" x2="207.8" y2="230"/><text x="118.9" y="246.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">2k</text><line x1="207.8" y1="230" x2="296.7" y2="230"/><text x="252.2" y="246.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">k</text><line x1="141.1" y1="30" x2="185.6" y2="163.3"/><text x="148.6" y="106.1" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">2m</text><line x1="185.6" y1="163.3" x2="207.8" y2="230"/><text x="183.6" y="205.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">m</text><text x="141.1" y="20.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="19.5" y="245.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="307.2" y="245.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="207.8" y="248.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text><text x="175.1" y="157.7" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">E</text></svg>', true),
  -- mat-12-031 · şekilli · doğrulandı
  ('a0db7017-3498-5ab9-a2a3-6a7bb47d14b4'::uuid, 'Matematik & Geometri', 'Doğruda ve Üçgende Açılar, Üçgenler', 'multiple_choice', 1,
   'Şekildeki $ABC$ üçgeninde $G$ noktası ağırlık merkezi ($|BD| = |DC|$ ve $|AE| = |EC|$) olup $|GD| = 3$ cm ve $|BG| = 10$ cm''dir.
Buna göre $|AD| + |BE|$ toplamı kaç cm''dir?',
   '{"options":["21","24","26","27","30"],"correctIndex":1}'::jsonb,
   'Ağırlık merkezi $G$, her kenarortayı köşeye $2$, kenara $1$ oranında böler:
- $|AG| = 2|GD| = 2 \cdot 3 = 6\text{ cm} \Rightarrow |AD| = 6 + 3 = 9\text{ cm}$.
- $|GE| = \dfrac{|BG|}{2} = \dfrac{10}{2} = 5\text{ cm} \Rightarrow |BE| = 10 + 5 = 15\text{ cm}$.
Bu iki kenarortayın toplamı $|AD| + |BE| = 9 + 15 = 24$ cm bulunur.',
   'A şıkkı ($21$), $|AG| = 6$ ve $|GE| = 5$ bulunduktan sonra soru $|AD| + |BE|$ toplamını istediği hâlde eksik parça eklemesiyle $6 + 15$ veya $9 + 12$ gibi hatalı toplam yapanları; E şıkkı ($30$) ise $|BG|$ için de $2$ ile çarpıp $10 + 20$ yazanları yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 326.7 260" width="326.7" height="260" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><polygon points="118.9,30 30,230 296.7,230"/><line x1="118.9" y1="30" x2="163.3" y2="230"/><line x1="30" y1="230" x2="207.8" y2="130"/><line x1="30" y1="230" x2="163.3" y2="230"/><line x1="96.7" y1="224" x2="96.7" y2="236"/><line x1="163.3" y1="230" x2="296.7" y2="230"/><line x1="230" y1="224" x2="230" y2="236"/><line x1="118.9" y1="30" x2="207.8" y2="130"/><line x1="166.2" y1="74.1" x2="157.2" y2="82.1"/><line x1="169.5" y1="77.9" x2="160.5" y2="85.9"/><line x1="207.8" y1="130" x2="296.7" y2="230"/><line x1="255" y1="174.1" x2="246.1" y2="182.1"/><line x1="258.4" y1="177.9" x2="249.4" y2="185.9"/><line x1="148.5" y1="163.3" x2="163.3" y2="230"/><text x="169.4" y="198.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">3</text><line x1="30" y1="230" x2="148.5" y2="163.3"/><text x="82.5" y="189.1" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">10</text><text x="118.9" y="20.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="19.5" y="245.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="307.2" y="245.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="163.3" y="248.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text><text x="218.3" y="124.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">E</text><circle cx="148.5" cy="163.3" r="3" fill="currentColor" stroke="none"/><text x="138" y="157.7" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">G</text></svg>', true),
  -- mat-12-032 · şekilli · doğrulandı
  ('5923ecf2-d1df-500d-b09f-12f1e5c4af36'::uuid, 'Matematik & Geometri', 'Doğruda ve Üçgende Açılar, Üçgenler', 'multiple_choice', 2,
   'Şekildeki $ABC$ üçgeninde $DE \parallel BC$ ve $[BE]$ açıortaydır ($m(\widehat{ABE}) = m(\widehat{EBC})$). $|AD| = 12$ cm ve $|BD| = 6$ cm olduğuna göre $|BC| = x$ kaç cm''dir?',
   '{"options":["9","10","11","12","14"],"correctIndex":0}'::jsonb,
   '$DE \parallel BC$ ve $[BE]$ açıortay olduğundan iç ters açılardan $m(\widehat{DEB}) = m(\widehat{EBC}) = m(\widehat{DBE})$ elde edilir. Bu nedenle $BDE$ üçgeni ikizkenardır ve $|DE| = |BD| = 6$ cm olur.
$DE \parallel BC$ paralelliğinden Tales (temel orantı) benzerliği kurulur:
$$\frac{|AD|}{|AB|} = \frac{|DE|}{|BC|} \Rightarrow \frac{12}{12 + 6} = \frac{6}{x} \Rightarrow \frac{12}{18} = \frac{6}{x} \Rightarrow \frac{2}{3} = \frac{6}{x} \Rightarrow x = 9\text{ cm}$$',
   'D şıkkı ($12$), temel orantıda $|AD|/|AB| = 12/18$ yerine dikkatsizce $|AD|/|BD| = 12/6$ yazıp $\dfrac{12}{6} = \dfrac{6}{x}$ (veya tersi) hatasıyla $12$ bulanları yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 193.6 260" width="193.6" height="260" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><polygon points="163.6,30 30,230 150.3,230"/><line x1="74.5" y1="163.3" x2="154.7" y2="163.3"/><line x1="30" y1="230" x2="154.7" y2="163.3"/><line x1="163.6" y1="30" x2="74.5" y2="163.3"/><text x="106.5" y="92.8" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">12</text><line x1="30" y1="230" x2="74.5" y2="163.3"/><text x="41" y="193.7" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">6</text><line x1="30" y1="230" x2="150.3" y2="230"/><text x="90.1" y="246.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">x</text><path d="M30 230 L42.2 211.7 A22 22 0 0 1 49.4 219.6 Z" stroke="none"/><path d="M42.2 211.7 A22 22 0 0 1 49.4 219.6" stroke-width="1.4"/><path d="M30 230 L52.9 217.7 A26 26 0 0 1 56 230 Z" stroke="none"/><path d="M52.9 217.7 A26 26 0 0 1 56 230" stroke-width="1.4"/><text x="163.6" y="20.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="19.5" y="245.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="160.8" y="245.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="64" y="157.7" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text><text x="165.2" y="157.7" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">E</text></svg>', true),
  -- mat-12-033 · şekilli · doğrulandı
  ('a67debd0-dc49-5132-b264-5fe44a4230e7'::uuid, 'Matematik & Geometri', 'Doğruda ve Üçgende Açılar, Üçgenler', 'multiple_choice', 3,
   'Şekildeki $ABC$ üçgeninde $|AB| = |AC|$, $|AD| = |AE|$ ve $m(\widehat{BAD}) = 50^\circ$ veriliyor.
Buna göre $m(\widehat{EDC}) = x$ kaç derecedir?',
   '{"options":["15","20","22","25","50"],"correctIndex":3}'::jsonb,
   '$|AB| = |AC|$ olduğundan taban açılarına $m(\widehat{B}) = m(\widehat{C}) = \beta$ diyelim.
$ABD$ üçgeninde dış açı özelliğinden $m(\widehat{ADC}) = \beta + 50^\circ$ olur. O hâlde $m(\widehat{ADE}) = \beta + 50^\circ - x$''tir.
Diğer yandan $EDC$ üçgeninde $m(\widehat{AED})$ dış açısı $\beta + x$''e eşittir. $|AD| = |AE|$ ikizkenarlığından $m(\widehat{ADE}) = m(\widehat{AED})$ yazılır:
$$\beta + 50^\circ - x = \beta + x \Rightarrow 2x = 50^\circ \Rightarrow x = 25^\circ$$',
   'E şıkkı ($50$), $|AD| = |AE|$ açılarındaki $\beta$ bilinmeyenini sadeleştirmeyip açının doğrudan $50^\circ$''ye eşit olacağını tahmin eden adayı yakalar. Oysa $\beta$''nın değeri ne olursa olsun $x$ her zaman $\widehat{BAD}$ açısının yarısıdır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 340 260" width="340" height="260" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><polygon points="170,30 30,230 310,230"/><line x1="170" y1="30" x2="223.6" y2="230"/><line x1="202.6" y1="128.4" x2="191" y2="131.6"/><line x1="170" y1="30" x2="288.7" y2="199.6"/><line x1="234.3" y1="111.4" x2="224.5" y2="118.3"/><line x1="223.6" y1="230" x2="288.7" y2="199.6"/><path d="M170 30 L155.1 51.3 A26 26 0 0 0 176.7 55.1 Z" stroke="none"/><path d="M155.1 51.3 A26 26 0 0 0 176.7 55.1" stroke-width="1.4"/><text x="162.8" y="74.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">50°</text><path d="M223.6 230 L245.3 219.9 A24 24 0 0 1 247.6 230 Z" stroke="none"/><path d="M245.3 219.9 A24 24 0 0 1 247.6 230" stroke-width="1.4"/><text x="257.2" y="226.7" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">x</text><text x="170" y="20.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="19.5" y="245.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="320.5" y="245.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="223.6" y="248.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text><text x="299.2" y="194" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">E</text></svg>', true),
  -- mat-12-034 · doğrulandı
  ('7c4e84d2-5e9d-5761-9bdd-d8446419607c'::uuid, 'Matematik & Geometri', 'Doğruda ve Üçgende Açılar, Üçgenler', 'multiple_choice', 1,
   'Kenar uzunlukları birer tam sayı olan bir $ABC$ üçgeninin iki kenar uzunluğu $5$ cm ve $9$ cm''dir.
Buna göre bu üçgenin çevresinin alabileceği en büyük değer ile en küçük değerin toplamı kaç cm''dir?',
   '{"options":["46","44","42","40","38"],"correctIndex":0}'::jsonb,
   'Üçgenin üçüncü kenarı $c$ olmak üzere üçgen eşitsizliği uygulanır:
$$9 - 5 < c < 9 + 5 \Rightarrow 4 < c < 14$$
Kenar uzunlukları tam sayı olduğundan $c$''nin en küçük değeri $5$ cm, en büyük değeri $13$ cm olur (soruda çeşitkenar şartı aranmamaktadır).
- En küçük çevre: $5 + 9 + 5 = 19$ cm
- En büyük çevre: $5 + 9 + 13 = 27$ cm
İki değerin toplamı $19 + 27 = 46$ cm bulunur.',
   'B şıkkı ($44$), soruda "çeşitkenar" koşulu verilmediği hâlde $c = 5$ değerini eleyip en küçük kenarı $c = 6$ ($20 + 27 = 47$ veya farklı hatalı sınırlarla $44$) alan adayı; E şıkkı ($38$) ise uç sınırları karıştıranları yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-12-035 · şekilli · doğrulandı
  ('90b273d9-5290-535a-a7ca-d0b11cc59b2f'::uuid, 'Matematik & Geometri', 'Doğruda ve Üçgende Açılar, Üçgenler', 'multiple_choice', 2,
   'Şekildeki $ABC$ dik üçgeninde $m(\widehat{BAC}) = 90^\circ$, $[DE] \perp [AC]$, $|BD| = |DC|$, $|AD| = 13$ cm ve $|DE| = 5$ cm veriliyor.
Buna göre $|AC| = x$ kaç cm''dir?',
   '{"options":["18","20","24","25","26"],"correctIndex":2}'::jsonb,
   '$m(\widehat{BAC}) = 90^\circ$ ve $[DE] \perp [AC]$ olduğu için $DE \parallel AB$''dir. $D$ noktası $[BC]$''nin orta noktası olduğundan $[DE]$ orta tabandır ve $|AB| = 2|DE| = 2 \cdot 5 = 10$ cm bulunur.
Diğer yandan dik üçgende hipotenüse ait kenarortay hipotenüsün yarısına eşittir (muhteşem üçlü): $|BD| = |DC| = |AD| = 13$ cm, yani $|BC| = 26$ cm olur.
$ABC$ üçgeninde $10-24-26$ ($5-12-13$ üçgeninin $2$ katı) özel dik üçgeninden $x = |AC| = 24$ cm elde edilir.',
   'E şıkkı ($26$), hipotenüs uzunluğu olan $|BC| = 26$ değerini bulup Pisagor adımına geçmeden işaretleyen; B şıkkı ($20$) ise $13$''ün yerine yanlışlıkla $5-12-13$ üçgeninin katlarını karıştıran adayları hedefler.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 340 176.7" width="340" height="176.7" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><polygon points="30,146.7 30,30 310,146.7"/><line x1="30" y1="146.7" x2="170" y2="88.3"/><text x="94.8" y="109.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">13</text><line x1="170" y1="88.3" x2="170" y2="146.7"/><text x="183.9" y="122.1" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">5</text><line x1="30" y1="30" x2="170" y2="88.3"/><line x1="102.3" y1="53.6" x2="97.7" y2="64.7"/><line x1="170" y1="88.3" x2="310" y2="146.7"/><line x1="242.3" y1="112" x2="237.7" y2="123"/><line x1="30" y1="146.7" x2="310" y2="146.7"/><text x="170" y="139.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">x</text><polyline points="30,135.7 41,135.7 41,146.7" stroke-width="1.4"/><polyline points="170,135.7 181,135.7 181,146.7" stroke-width="1.4"/><text x="19.5" y="162.1" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="19.5" y="24.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="320.5" y="162.1" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="180.5" y="82.7" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text><text x="170" y="165.6" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">E</text></svg>', true),
  -- mat-12-036 · şekilli · doğrulandı
  ('b86d5155-a205-51a5-ae94-273008b0d1fa'::uuid, 'Matematik & Geometri', 'Doğruda ve Üçgende Açılar, Üçgenler', 'multiple_choice', 3,
   'Şekildeki $ABC$ dik üçgeninde $m(\widehat{ABC}) = 90^\circ$ ve $[AD]$ açıortaydır ($m(\widehat{BAD}) = m(\widehat{DAC})$). $|BD| = 6$ cm ve $|DC| = 10$ cm olduğuna göre boyalı $ADC$ üçgeninin alanı kaç $\text{cm}^2$''dir?',
   '{"options":["48","60","72","80","96"],"correctIndex":1}'::jsonb,
   'İç açıortay teoremine göre $\dfrac{|AB|}{|AC|} = \dfrac{|BD|}{|DC|} = \dfrac{6}{10} = \dfrac{3}{5}$ olduğundan $|AB| = 3k$ ve $|AC| = 5k$ yazılır.
$ABC$ dik üçgeninde $|BC| = 6 + 10 = 16$ cm olup $3k - 4k - 5k$ özel dik üçgeninden $4k = 16 \Rightarrow k = 4$ bulunur. Buradan dik kenar $|AB| = 3 \cdot 4 = 12$ cm olur.
$[DC]$ tabanına ait $ADC$ üçgeninin dışarıdan düşen yüksekliği $|AB| = 12$ cm olduğundan:
$$\text{Alan}(\triangle ADC) = \frac{|DC| \cdot |AB|}{2} = \frac{10 \cdot 12}{2} = 60\text{ cm}^2$$',
   'E şıkkı ($96$), $|AB| = 12$ bulunduktan sonra yalnızca boyalı $ADC$ üçgeninin alanı yerine tüm $ABC$ üçgeninin alanını ($\dfrac{16 \cdot 12}{2} = 96$) işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 326.7 260" width="326.7" height="260" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><polygon points="30,30 30,230 296.7,230"/><polygon points="30,30 130,230 296.7,230" fill="currentColor" fill-opacity="0.12"/><line x1="30" y1="30" x2="130" y2="230"/><line x1="30" y1="230" x2="130" y2="230"/><text x="80" y="246.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">6</text><line x1="130" y1="230" x2="296.7" y2="230"/><text x="213.3" y="246.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">10</text><polyline points="30,219 41,219 41,230" stroke-width="1.4"/><path d="M30 30 L30 52 A22 22 0 0 0 39.8 49.7 Z" stroke="none"/><path d="M30 52 A22 22 0 0 0 39.8 49.7" stroke-width="1.4"/><path d="M30 30 L41.6 53.3 A26 26 0 0 0 50.8 45.6 Z" stroke="none"/><path d="M41.6 53.3 A26 26 0 0 0 50.8 45.6" stroke-width="1.4"/><text x="30" y="20.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="19.5" y="245.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="307.2" y="245.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="130" y="248.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text></svg>', true),
  -- mat-12-037 · şekilli · doğrulandı
  ('d66edf5e-201a-5216-b7c0-928c05d29020'::uuid, 'Matematik & Geometri', 'Doğruda ve Üçgende Açılar, Üçgenler', 'multiple_choice', 1,
   'Şekilde $[BA \parallel [DE$, $m(\widehat{ABC}) = 135^\circ$ ve $m(\widehat{CDE}) = 115^\circ$ veriliyor.
Buna göre $m(\widehat{BCD}) = x$ kaç derecedir?',
   '{"options":["110","115","120","125","130"],"correctIndex":0}'::jsonb,
   'Paralel iki ışın arasındaki "kalem ucu" (U toplamı) kuralına göre üç iç açının toplamı $360^\circ$''dir:
$$135^\circ + x + 115^\circ = 360^\circ \Rightarrow 250^\circ + x = 360^\circ \Rightarrow x = 110^\circ$$',
   'C şıkkı ($120$) veya D şıkkı ($125$), $135 + 115 = 250$ toplamını yaparken $240$ ya da $235$ bulmaktan; ya da U kuralındaki toplamı iki paralel açı gibi $180^\circ$ sanmaya çalışmaktan kaynaklanır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 260 260" width="260" height="260" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><line x1="30" y1="30" x2="130" y2="30"/><line x1="130" y1="30" x2="230" y2="130"/><line x1="230" y1="130" x2="183.4" y2="230"/><line x1="183.4" y1="230" x2="30" y2="230"/><path d="M130 30 L106 30 A24 24 0 0 0 147 47 Z" stroke="none"/><path d="M106 30 A24 24 0 0 0 147 47" stroke-width="1.4"/><text x="114" y="72.8" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">135°</text><path d="M183.4 230 L193.5 208.2 A24 24 0 0 0 159.4 230 Z" stroke="none"/><path d="M193.5 208.2 A24 24 0 0 0 159.4 230" stroke-width="1.4"/><text x="160.9" y="199" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">115°</text><path d="M230 130 L213 113 A24 24 0 0 0 219.9 151.8 Z" stroke="none"/><path d="M213 113 A24 24 0 0 0 219.9 151.8" stroke-width="1.4"/><text x="196.1" y="140.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">x</text><text x="16" y="34.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="130" y="20.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="244" y="134.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="183.4" y="248.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text><text x="16" y="234.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">E</text></svg>', true),
  -- mat-12-038 · şekilli · doğrulandı
  ('aaa34827-46bd-58c8-81c2-cbc7dedf650a'::uuid, 'Matematik & Geometri', 'Doğruda ve Üçgende Açılar, Üçgenler', 'multiple_choice', 2,
   'Şekildeki $ABC$ üçgeninde $[AH] \perp [BC]$ ve $[AN]$ açıortaydır ($m(\widehat{BAN}) = m(\widehat{NAC})$). $m(\widehat{ABC}) = 74^\circ$ ve $m(\widehat{ACB}) = 38^\circ$ olduğuna göre $m(\widehat{HAN}) = x$ kaç derecedir?',
   '{"options":["14","18","22","28","36"],"correctIndex":1}'::jsonb,
   '$ABC$ üçgeninde $m(\widehat{BAC}) = 180^\circ - (74^\circ + 38^\circ) = 68^\circ$''dir. $[AN]$ açıortay olduğundan $m(\widehat{BAN}) = 34^\circ$ olur. Diğer yandan $ABH$ dik üçgeninde $m(\widehat{BAH}) = 90^\circ - 74^\circ = 16^\circ$''dir. Bu iki açı arasındaki fark:
$$x = m(\widehat{HAN}) = 34^\circ - 16^\circ = 18^\circ$$
(Kısa yoldan $x = \dfrac{|74^\circ - 38^\circ|}{2} = 18^\circ$).',
   'E şıkkı ($36$), $|74^\circ - 38^\circ| = 36^\circ$ farkını bulup $2$''ye bölmeyi unutan adayı; A şıkkı ($14$) ise $m(\widehat{BAH})$ değerini $90 - 74 = 16$ yerine hatalı hesaplayanları yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 340 238.7" width="340" height="238.7" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><polygon points="81.2,30 30,208.7 310,208.7"/><line x1="81.2" y1="30" x2="81.2" y2="208.7"/><line x1="81.2" y1="30" x2="139.3" y2="208.7"/><polyline points="81.2,197.7 92.2,197.7 92.2,208.7" stroke-width="1.4"/><path d="M30 208.7 L36.1 187.6 A22 22 0 0 1 52 208.7 Z" stroke="none"/><path d="M36.1 187.6 A22 22 0 0 1 52 208.7" stroke-width="1.4"/><text x="59.8" y="190.5" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">74°</text><path d="M310 208.7 L282 208.7 A28 28 0 0 1 287.9 191.5 Z" stroke="none"/><path d="M282 208.7 A28 28 0 0 1 287.9 191.5" stroke-width="1.4"/><text x="269.1" y="198.8" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">38°</text><path d="M81.2 30 L81.2 68 A38 38 0 0 0 93 66.1 Z" stroke="none"/><path d="M81.2 68 A38 38 0 0 0 93 66.1" stroke-width="1.4"/><text x="88.8" y="82" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">x</text><text x="81.2" y="20.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="19.5" y="224.1" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="81.2" y="227.6" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">H</text><text x="139.3" y="227.6" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">N</text><text x="320.5" y="224.1" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text></svg>', true),
  -- mat-12-039 · şekilli · doğrulandı
  ('e5eec563-4094-56a2-8635-e871b2c9aba2'::uuid, 'Matematik & Geometri', 'Doğruda ve Üçgende Açılar, Üçgenler', 'multiple_choice', 2,
   'Şekildeki $ABC$ dik üçgeninde $m(\widehat{BAC}) = 90^\circ$, $|BD| = |DC|$ ve $[DE] \perp [BC]$ veriliyor. $|AB| = 12$ cm ve $|AE| = 5$ cm olduğuna göre $|AC|$ kaç cm''dir?',
   '{"options":["13","15","18","20","24"],"correctIndex":2}'::jsonb,
   '$[DE]$ doğrusu $[BC]$ kenarının orta dikmesidir (hem dik hem iki eş parçaya böler). Bu nedenle $E$ noktasından $B$ ve $C$ köşelerine uzaklıklar eşittir: $|BE| = |EC|$.
$BAE$ dik üçgeninde $5-12-13$ özel üçgeninden $|BE| = 13$ cm bulunur; dolayısıyla $|EC| = 13$ cm''dir. Buradan $|AC| = |AE| + |EC| = 5 + 13 = 18$ cm elde edilir.',
   'A şıkkı ($13$), $5-12-13$ özel üçgeniyle $|EC| = 13$ cm değerini bulduktan sonra $|AE| = 5$ parçasını ekleyip $|AC|$ uzunluğunu tamamlamadan işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 340 246.7" width="340" height="246.7" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><polygon points="30,216.7 30,30 310,216.7"/><line x1="170" y1="123.3" x2="107.8" y2="216.7"/><line x1="30" y1="30" x2="107.8" y2="216.7"/><line x1="30" y1="30" x2="170" y2="123.3"/><line x1="103.3" y1="71.7" x2="96.7" y2="81.7"/><line x1="170" y1="123.3" x2="310" y2="216.7"/><line x1="243.3" y1="165" x2="236.7" y2="175"/><line x1="30" y1="216.7" x2="30" y2="30"/><text x="14.2" y="127.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">12</text><line x1="30" y1="216.7" x2="107.8" y2="216.7"/><text x="68.9" y="233.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">5</text><polyline points="30,205.7 41,205.7 41,216.7" stroke-width="1.4"/><polyline points="163.9,132.5 173.1,138.6 179.2,129.4" stroke-width="1.4"/><text x="19.5" y="232.1" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="19.5" y="24.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="320.5" y="232.1" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="180.5" y="117.7" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text><text x="107.8" y="235.6" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">E</text></svg>', true),
  -- mat-12-040 · şekilli · doğrulandı
  ('21bdd13e-e6a6-5a94-89cc-6cef3bcfda7b'::uuid, 'Matematik & Geometri', 'Doğruda ve Üçgende Açılar, Üçgenler', 'multiple_choice', 3,
   'Şekilde $B, C, D$ noktaları doğrusal olup $[AB] \perp [BD]$, $[AC] \perp [CE]$ ve $[ED] \perp [BD]$ veriliyor. $|AB| = 9$ cm, $|BC| = 12$ cm ve $|CD| = 12$ cm olduğuna göre $|AE|$ uzunluğu kaç cm''dir?',
   '{"options":["25","20","24","28","30"],"correctIndex":0}'::jsonb,
   '$ABC$ dik üçgeninde $9-12-15$ ($3-4-5$ üçgeninin $3$ katı) özel üçgeninden $|AC| = 15$ cm bulunur.
$C$ noktasındaki diklikten $m(\widehat{ACB}) + m(\widehat{ECD}) = 90^\circ$ olduğu için $ABC$ ve $CDE$ dik üçgenleri açı-açı benzeridir ($\triangle ABC \sim \triangle CDE$):
$$\frac{|AB|}{|CD|} = \frac{|BC|}{|DE|} \Rightarrow \frac{9}{12} = \frac{12}{|DE|} \Rightarrow |DE| = 16\text{ cm}$$
Böylece $CDE$ dik üçgeni $12-16-20$ üçgenidir ve $|CE| = 20$ cm olur. Son olarak $ACE$ dik üçgeninde $15-20-25$ özel üçgeninden $|AE| = 25$ cm bulunur.',
   'B şıkkı ($20$), yalnızca $CDE$ üçgeninin hipotenüsü olan $|CE| = 20$ uzunluğunu bulup son $ACE$ Pisagor adımına geçmeyen adayı; C şıkkı ($24$) ise $|BD| = 24$ yatay mesafesini $|AE|$ ile karıştıranları yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 340 246.7" width="340" height="246.7" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><polygon points="30,111.7 30,216.7 170,216.7"/><polygon points="170,216.7 310,216.7 310,30"/><line x1="30" y1="111.7" x2="310" y2="30"/><line x1="30" y1="111.7" x2="30" y2="216.7"/><text x="16.1" y="168.7" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">9</text><line x1="30" y1="216.7" x2="170" y2="216.7"/><text x="100" y="233.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">12</text><line x1="170" y1="216.7" x2="310" y2="216.7"/><text x="240" y="233.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">12</text><polyline points="30,205.7 41,205.7 41,216.7" stroke-width="1.4"/><polyline points="161.2,210.1 167.8,201.3 176.6,207.9" stroke-width="1.4"/><polyline points="299,216.7 299,205.7 310,205.7" stroke-width="1.4"/><text x="19.5" y="106.1" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="19.5" y="232.1" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="170" y="235.6" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="320.5" y="232.1" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text><text x="320.5" y="24.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">E</text></svg>', true)
on conflict (id) do update set
  lesson = excluded.lesson, topic = excluded.topic, question_type = excluded.question_type,
  difficulty = excluded.difficulty, prompt_text = excluded.prompt_text,
  interaction_data = excluded.interaction_data, explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap, exam_scopes = excluded.exam_scopes,
  education_level = excluded.education_level, figure_svg = excluded.figure_svg, is_active = true;

-- >>> 13_cokgenler_dortgenler_ve_cember_daire.sql
-- ==========================================================================
-- KADRO SORU HAVUZU · Matematik & Geometri · Çokgenler, Dörtgenler ve Çember-Daire (40 soru)
-- Kaynak: docs/soru_havuzu/matematik/13_cokgenler_dortgenler_ve_cember_daire.md · Üretici: tools/math/compile_questions.mjs (elle düzenlemeyin)
-- Önkoşul: docs/supabase_migrations/12_math_figures.sql
-- İdempotent: soru kimlikleri sabit UUID'dir; dosya tekrar çalıştırılırsa sorular güncellenir.
-- ==========================================================================

insert into public.questions (
  id, lesson, topic, question_type, difficulty, prompt_text, interaction_data,
  explanation, distractor_trap, exam_scopes, education_level, figure_svg, is_active
) values
  -- mat-13-001 · doğrulandı
  ('158d43cc-db6b-549e-97e8-68b35c0995ab'::uuid, 'Matematik & Geometri', 'Çokgenler, Dörtgenler ve Çember-Daire', 'multiple_choice', 1,
   'Bir dışbükey çokgenin iç açılarının ölçüleri toplamı, dış açılarının ölçüleri toplamının $4$ katıdır.
Buna göre bu çokgenin bir köşesinden en fazla kaç tane köşegen çizilebilir?',
   '{"options":["5","6","8","7","10"],"correctIndex":3}'::jsonb,
   '$n$ kenarlı bir dışbükey çokgenin iç açıları toplamı $(n - 2) \cdot 180^\circ$, dış açıları toplamı ise $360^\circ$''dir. Verilen koşuldan $(n - 2) \cdot 180 = 4 \cdot 360 \Rightarrow n - 2 = 8 \Rightarrow n = 10$ (on gen) bulunur. Bir köşesinden kendisine ve komşu iki köşeye köşegen çizilemediği için en fazla $n - 3 = 10 - 3 = 7$ köşegen çizilebilir.',
   'E şıkkı (10), çokgenin kenar sayısını bulup sorunun istediği köşegen sayısını hesaplamadan $10$''u işaretleyen adayı yakalar. C şıkkı (8) ise $n - 2$ değerini seçenlerin tuzağıdır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-13-002 · şekilli · doğrulandı
  ('e31fa8c5-3c3d-571d-ae6a-79bf2e8a6589'::uuid, 'Matematik & Geometri', 'Çokgenler, Dörtgenler ve Çember-Daire', 'multiple_choice', 2,
   'Şekildeki $ABCDEF$ düzgün altıgeninin bir kenar uzunluğu $4$ cm''dir.
Buna göre taralı $ACD$ üçgeninin alanı kaç cm²''dir?',
   '{"options":["$4\\sqrt{3}$","$8\\sqrt{3}$","$12\\sqrt{3}$","$16$","$16\\sqrt{3}$"],"correctIndex":1}'::jsonb,
   'Düzgün altıgenin bir iç açısı $120^\circ$''dir. $ABC$ üçgeninde $|AB| = |BC| = 4$ cm ve $m(\widehat{B}) = 120^\circ$ olduğundan $[AC]$ kısa köşegeni $4\sqrt{3}$ cm ve $m(\widehat{BCA}) = 30^\circ$''dir. Altıgenin $C$ iç açısı $120^\circ$ olduğu için $m(\widehat{ACD}) = 120^\circ - 30^\circ = 90^\circ$ olur. $ACD$ dik üçgeninin dik kenarları $|CD| = 4$ cm ve $|AC| = 4\sqrt{3}$ cm olduğundan alanı $\dfrac{4 \cdot 4\sqrt{3}}{2} = 8\sqrt{3}$ cm² bulunur.',
   'E şıkkı ($16\sqrt{3}$), dik üçgenin alan formülünde ikiye bölmeyi unutup $4 \cdot 4\sqrt{3}$ çarpan adayı yakalar. C şıkkı ($12\sqrt{3}$) ise altıgenin yarısının alanını hesaplayanların tuzağıdır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 290.9 260" width="290.9" height="260" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><polygon points="260.9,130 87.7,30 30,130" fill="currentColor" fill-opacity="0.12"/><polygon points="260.9,130 203.2,30 87.7,30 30,130 87.7,230 203.2,230"/><line x1="260.9" y1="130" x2="203.2" y2="30"/><text x="248.1" y="75.3" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">4 cm</text><text x="274.9" y="134.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="213.7" y="24.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="77.2" y="24.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="16" y="134.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text><text x="77.2" y="245.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">E</text><text x="213.7" y="245.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">F</text></svg>', true),
  -- mat-13-003 · şekilli · doğrulandı
  ('1388423e-09d9-5fb5-91f5-9585107d942f'::uuid, 'Matematik & Geometri', 'Çokgenler, Dörtgenler ve Çember-Daire', 'multiple_choice', 1,
   'Şekildeki $ABCD$ karesinin bir kenarı $6$ cm ve $[AC]$ köşegeni üzerinde $|AE| = 2|EC|$ olacak biçimde $E$ noktası alınmıştır.
Buna göre taralı $ABE$ üçgeninin alanı kaç cm²''dir?',
   '{"options":["12","6","9","18","24"],"correctIndex":0}'::jsonb,
   'Karenin alanı $6^2 = 36$ cm², $[AC]$ köşegeninin ayırdığı $ABC$ üçgeninin alanı ise $\dfrac{36}{2} = 18$ cm²''dir. $ABE$ ve $CBE$ üçgenlerinin $B$ köşesinden $[AC]$''ye inen yükseklikleri ortak olduğundan alanları tabanları oranındadır. $|AE| = 2|EC|$ verildiğine göre $ABE$ üçgeni $ABC$ alanının $\dfrac{2}{3}$''üne eşittir: $18 \cdot \dfrac{2}{3} = 12$ cm².',
   'B şıkkı (6), taralı olmayan $CBE$ üçgeninin alanını ($18 \cdot \frac{1}{3} = 6$) işaretleyen adayı; D şıkkı (18) ise $ABC$ yarım karenin alanını seçenleri yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 269 260" width="269" height="260" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><g transform="translate(9 0)"><polygon points="30,30 30,230 163.3,163.3" fill="currentColor" fill-opacity="0.12"/><polygon points="30,30 30,230 230,230 230,30"/><line x1="30" y1="30" x2="230" y2="230"/><line x1="30" y1="230" x2="163.3" y2="163.3"/><line x1="30" y1="30" x2="30" y2="230"/><text x="10.5" y="134.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">6 cm</text><text x="19.5" y="24.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="19.5" y="245.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="240.5" y="245.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="240.5" y="24.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text><text x="173.8" y="157.7" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">E</text></g></svg>', true),
  -- mat-13-004 · şekilli · doğrulandı
  ('26e8cb80-f73f-55e0-9c93-22e5c7bce294'::uuid, 'Matematik & Geometri', 'Çokgenler, Dörtgenler ve Çember-Daire', 'multiple_choice', 2,
   'Şekildeki $ABCD$ dikdörtgeninde $E \in [DC]$ ve $AE \perp BE$''dir. $|AD| = 6$ cm ve $|DE| = 4$ cm olduğuna göre $ABCD$ dikdörtgeninin alanı kaç cm²''dir?',
   '{"options":["48","54","78","84","96"],"correctIndex":2}'::jsonb,
   '$ADE$ ve $ECB$ dik üçgenlerinde $\widehat{DEA}$ ile $\widehat{CEB}$ açılarının toplamı $90^\circ$ olduğundan bu iki üçgen benzerdir ($ADE \sim ECB$). Benzerlikten $\dfrac{|AD|}{|EC|} = \dfrac{|DE|}{|CB|}$ yazılır. $|CB| = |AD| = 6$ cm olduğundan $\dfrac{6}{|EC|} = \dfrac{4}{6} \Rightarrow 4|EC| = 36 \Rightarrow |EC| = 9$ cm bulunur. Böylece uzun kenar $|DC| = 4 + 9 = 13$ cm ve dikdörtgenin alanı $6 \cdot 13 = 78$ cm² olur.',
   'B şıkkı (54), $|EC| = 9$ cm uzunluğunu bulduktan sonra $|DE| = 4$ cm''yi eklemeden $6 \cdot 9 = 54$ alanını işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 340 189.2" width="340" height="189.2" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><polygon points="30,159.2 310,159.2 310,30 30,30"/><line x1="30" y1="159.2" x2="30" y2="30"/><text x="16.1" y="99.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">6</text><line x1="30" y1="30" x2="116.2" y2="30"/><text x="73.1" y="22.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">4</text><line x1="30" y1="159.2" x2="116.2" y2="30"/><line x1="310" y1="159.2" x2="116.2" y2="30"/><polyline points="110.1,39.2 119.2,45.3 125.3,36.1" stroke-width="1.4"/><text x="19.5" y="174.6" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="320.5" y="174.6" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="320.5" y="24.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="19.5" y="24.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text><text x="116.2" y="20.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">E</text></svg>', true),
  -- mat-13-005 · şekilli · doğrulandı
  ('7e4b8d12-1909-5956-8bae-da0568d36224'::uuid, 'Matematik & Geometri', 'Çokgenler, Dörtgenler ve Çember-Daire', 'multiple_choice', 2,
   'Şekildeki $ABCD$ paralelkenarında $[AE]$ ve $[BE]$ sırasıyla $\widehat{DAB}$ ve $\widehat{CBA}$ açılarının açıortaylarıdır ($E \in [DC]$). $|AD| = 5$ cm olduğuna göre $ABCD$ paralelkenarının çevresi kaç cm''dir?',
   '{"options":["15","20","24","25","30"],"correctIndex":4}'::jsonb,
   '$DC \parallel AB$ olduğundan iç ters açılar nedeniyle $m(\widehat{DEA}) = m(\widehat{EAB}) = m(\widehat{DAE})$ olur; buradan $ADE$ ikizkenar üçgen çıkar ve $|DE| = |AD| = 5$ cm bulunur. Aynı şekilde $m(\widehat{CEB}) = m(\widehat{EBA}) = m(\widehat{EBC})$ olduğundan $|EC| = |BC| = 5$ cm''dir. Dolayısıyla $|DC| = |AB| = 5 + 5 = 10$ cm olur. Paralelkenarın çevresi $2(5 + 10) = 30$ cm bulunur.',
   'B şıkkı (20), paralelkenarın tabanını $10$ cm yerine $5$ cm sanan ($4 \cdot 5 = 20$) adayı; A şıkkı (15) ise yalnızca iki kenar toplamı $5 + 10 = 15$''i işaretleyenleri yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 340 177.9" width="340" height="177.9" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><polygon points="30,147.9 275.6,147.9 310,30 64.4,30"/><line x1="30" y1="147.9" x2="64.4" y2="30"/><text x="33.9" y="89.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">5</text><line x1="30" y1="147.9" x2="187.2" y2="30"/><line x1="275.6" y1="147.9" x2="187.2" y2="30"/><path d="M30 147.9 L36.2 126.8 A22 22 0 0 1 47.6 134.7 Z" stroke="none"/><path d="M36.2 126.8 A22 22 0 0 1 47.6 134.7" stroke-width="1.4"/><path d="M30 147.9 L50.8 132.3 A26 26 0 0 1 56 147.9 Z" stroke="none"/><path d="M50.8 132.3 A26 26 0 0 1 56 147.9" stroke-width="1.4"/><path d="M275.6 147.9 L253.6 147.9 A22 22 0 0 1 262.4 130.3 Z" stroke="none"/><path d="M253.6 147.9 A22 22 0 0 1 262.4 130.3" stroke-width="1.4"/><path d="M249.6 147.9 A26 26 0 0 1 260 127.1" stroke-width="1.4"/><path d="M275.6 147.9 L260 127.1 A26 26 0 0 1 282.9 122.9 Z" stroke="none"/><path d="M260 127.1 A26 26 0 0 1 282.9 122.9" stroke-width="1.4"/><path d="M257.6 123.9 A30 30 0 0 1 284 119.1" stroke-width="1.4"/><text x="19.5" y="163.3" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="286.1" y="163.3" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="320.5" y="24.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="53.9" y="24.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text><text x="187.2" y="20.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">E</text></svg>', true),
  -- mat-13-006 · şekilli · doğrulandı
  ('770bd8e9-bd81-5d68-bead-e506333c0a8e'::uuid, 'Matematik & Geometri', 'Çokgenler, Dörtgenler ve Çember-Daire', 'multiple_choice', 2,
   'Şekildeki $ABCD$ dik yamuğunda $AB \parallel DC$, $AD \perp AB$, $|DC| = 5$ cm, $|AB| = 11$ cm ve $|BC| = 10$ cm''dir.
Buna göre $ABCD$ yamuğunun alanı kaç cm²''dir?',
   '{"options":["48","56","60","64","80"],"correctIndex":3}'::jsonb,
   '$C$ köşesinden $[AB]$ tabanına $CH$ yüksekliği indirilirse $AHCD$ dikdörtgeni oluşur ve $|AH| = |DC| = 5$ cm, dolayısıyla $|HB| = 11 - 5 = 6$ cm kalır. $CHB$ dik üçgeninde $6-8-10$ özel üçgeninden yükseklik $|CH| = \sqrt{10^2 - 6^2} = 8$ cm bulunur. Yamuğun alanı $\dfrac{\text{Alt taban} + \text{Üst taban}}{2} \cdot h = \dfrac{11 + 5}{2} \cdot 8 = 8 \cdot 8 = 64$ cm² olur.',
   'E şıkkı (80), dikme indirip yüksekliği $8$ bulmak yerine yan kenar olan $10$ cm''yi doğrudan yükseklik alıp $\dfrac{11 + 5}{2} \cdot 10 = 80$ hesaplayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 335 260" width="335" height="260" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><polygon points="30,230 305,230 155,30 30,30"/><line x1="30" y1="30" x2="155" y2="30"/><text x="92.5" y="22.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">5</text><line x1="30" y1="230" x2="305" y2="230"/><text x="167.5" y="246.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">11</text><line x1="305" y1="230" x2="155" y2="30"/><text x="242" y="125.5" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">10</text><polyline points="30,219 41,219 41,230" stroke-width="1.4"/><polyline points="30,41 41,41 41,30" stroke-width="1.4"/><text x="19.5" y="245.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="315.5" y="245.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="165.5" y="24.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="19.5" y="24.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text></svg>', true),
  -- mat-13-007 · şekilli · doğrulandı
  ('b8c3445d-b5b4-5312-b0bc-829b6fb05b0a'::uuid, 'Matematik & Geometri', 'Çokgenler, Dörtgenler ve Çember-Daire', 'multiple_choice', 1,
   'Şekildeki $O$ merkezli çemberde $[AB]$ çap, $C$ ve $D$ çember üzerinde noktalardır. $m(\widehat{CAB}) = 28^\circ$ olduğuna göre $m(\widehat{ADC}) = x$ kaç derecedir?',
   '{"options":["56","62","64","72","118"],"correctIndex":1}'::jsonb,
   '$m(\widehat{CAB}) = 28^\circ$ çevre açısının gördüğü $BC$ yayı $2 \cdot 28^\circ = 56^\circ$''dir. $[AB]$ çap olduğu için üst yarım çember $180^\circ$''dir; dolayısıyla $AC$ yayının ölçüsü $180^\circ - 56^\circ = 124^\circ$ olur. İstenen $x = m(\widehat{ADC})$ çevre açısı da $AC$ yayını gördüğü için $x = \dfrac{124^\circ}{2} = 62^\circ$ bulunur.',
   'A şıkkı (56), $BC$ yayının ölçüsünü ($56^\circ$) bulup yarım çemberden çıkarmayı unutan ya da $\widehat{ADC}$ açısını $BC$ yayını görüyor sanan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 260 260" width="260" height="260" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><circle cx="130" cy="130" r="100"/><line x1="30" y1="130" x2="230" y2="130"/><line x1="30" y1="130" x2="185.9" y2="47.1"/><line x1="30" y1="130" x2="180" y2="216.6"/><line x1="180" y1="216.6" x2="185.9" y2="47.1"/><path d="M30 130 L62 130 A32 32 0 0 0 58.3 115 Z" stroke="none"/><path d="M62 130 A32 32 0 0 0 58.3 115" stroke-width="1.4"/><text x="75.9" y="122.8" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">28°</text><path d="M180 216.6 L155.8 202.6 A28 28 0 0 1 181 188.6 Z" stroke="none"/><path d="M155.8 202.6 A28 28 0 0 1 181 188.6" stroke-width="1.4"/><text x="161.4" y="187.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">x</text><circle cx="130" cy="130" r="3" fill="currentColor" stroke="none"/><text x="130" y="148.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">O</text><text x="16" y="134.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="244" y="134.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="196.4" y="41.5" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="190.5" y="232" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text></svg>', true),
  -- mat-13-008 · şekilli · doğrulandı
  ('581c7b3d-d865-5590-a7fa-4ff00b069c1a'::uuid, 'Matematik & Geometri', 'Çokgenler, Dörtgenler ve Çember-Daire', 'multiple_choice', 2,
   'Şekildeki $O$ merkezli çemberde $[AB]$ kiriş ve $OH \perp AB$''dir. $|OH| = 5$ cm ve $|AB| = 24$ cm olduğuna göre çemberin yarıçapı kaç cm''dir?',
   '{"options":["10","12","$\\sqrt{601}$","13","17"],"correctIndex":3}'::jsonb,
   'Merkezden kirişe indirilen dikme kirişi iki eşit parçaya böler: $|AH| = |HB| = \dfrac{24}{2} = 12$ cm. Oluşan $OHB$ dik üçgeninde $5-12-13$ özel üçgeninden yarıçap $r = \sqrt{5^2 + 12^2} = 13$ cm bulunur.',
   'C şıkkı ($\sqrt{601}$), merkezden inen dikmenin kirişi ikiye böldüğünü unutup $12$ yerine kirişin tamamı olan $24$''ü Pisagor''da ($\sqrt{5^2 + 24^2}$) kullanan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 260 260" width="260" height="260" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><circle cx="130" cy="130" r="100"/><line x1="37.7" y1="168.5" x2="222.3" y2="168.5"/><line x1="130" y1="130" x2="130" y2="168.5"/><text x="143.9" y="153.8" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">5</text><line x1="130" y1="130" x2="222.3" y2="168.5"/><text x="181" y="142" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">r</text><polyline points="130,157.5 141,157.5 141,168.5" stroke-width="1.4"/><circle cx="130" cy="130" r="3" fill="currentColor" stroke="none"/><text x="130" y="120.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">O</text><text x="130" y="187.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">H</text><text x="27.2" y="183.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="232.8" y="183.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text></svg>', true),
  -- mat-13-009 · şekilli · doğrulandı
  ('c29a6693-dd31-5500-b62b-9be2ed7654d9'::uuid, 'Matematik & Geometri', 'Çokgenler, Dörtgenler ve Çember-Daire', 'multiple_choice', 3,
   'Şekildeki $O$ merkezli çembere $PT$ ışını $T$ noktasında teğettir. $P, A, O, B$ noktaları doğrusal, $|PA| = 4$ cm ve $|PT| = 8$ cm olduğuna göre çemberin yarıçapı kaç cm''dir?',
   '{"options":["6","8","10","12","16"],"correctIndex":0}'::jsonb,
   'Merkezden teğet değme noktasına çizilen yarıçap teğete diktir ($OT \perp PT$). Çemberin yarıçapına $r$ denirse $|PO| = 4 + r$ olur. $PTO$ dik üçgeninde Pisagor bağıntısı yazılır:
$r^2 + 8^2 = (r + 4)^2 \Rightarrow r^2 + 64 = r^2 + 8r + 16 \Rightarrow 8r = 48 \Rightarrow r = 6$ cm bulunur. (Çemberde kuvvet bağıntısından $|PT|^2 = |PA| \cdot |PB| \Rightarrow 64 = 4(4 + 2r)$ ile de aynı sonuç elde edilir.)',
   'D şıkkı (12), $64 = 4 \cdot |PB| \Rightarrow |PB| = 16 \Rightarrow |AB| = 12$ bulup çapı yarıçap sanarak $12$''yi işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 326.7 260" width="326.7" height="260" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><circle cx="196.7" cy="130" r="100"/><line x1="30" y1="130" x2="296.7" y2="130"/><line x1="30" y1="130" x2="136.7" y2="50"/><text x="75.5" y="84" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">8</text><line x1="30" y1="130" x2="96.7" y2="130"/><text x="63.3" y="146.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">4</text><line x1="196.7" y1="130" x2="136.7" y2="50" stroke-dasharray="6 5"/><text x="177.5" y="86.4" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">r</text><polyline points="127.9,56.6 134.5,65.4 143.3,58.8" stroke-width="1.4"/><circle cx="196.7" cy="130" r="3" fill="currentColor" stroke="none"/><text x="196.7" y="148.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">O</text><text x="96.7" y="148.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="310.7" y="134.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="16" y="134.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">P</text><circle cx="136.7" cy="50" r="3" fill="currentColor" stroke="none"/><text x="136.7" y="40.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">T</text></svg>', true),
  -- mat-13-010 · şekilli · doğrulandı
  ('0b8343ba-e9a9-5d15-bc39-1f54c982bca3'::uuid, 'Matematik & Geometri', 'Çokgenler, Dörtgenler ve Çember-Daire', 'multiple_choice', 1,
   'Şekildeki $O$ merkezli, $6$ cm yarıçaplı dairede $m(\widehat{AOB}) = 60^\circ$''dir.
Buna göre taralı daire diliminin alanı kaç cm²''dir?',
   '{"options":["$2\\pi$","$4\\pi$","$6\\pi$","$9\\pi$","$12\\pi$"],"correctIndex":2}'::jsonb,
   'Daire diliminin alanı $\pi r^2 \cdot \dfrac{\alpha}{360^\circ}$ formülüyle hesaplanır. $r = 6$ cm ve $\alpha = 60^\circ$ yerine konursa $\pi \cdot 6^2 \cdot \dfrac{60}{360} = 36\pi \cdot \dfrac{1}{6} = 6\pi$ cm² bulunur.',
   'A şıkkı ($2\pi$), alan formülü ($\pi r^2$) yerine yay uzunluğu formülünü ($2\pi r \cdot \frac{60}{360} = 2\pi$) hesaplayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 260 260" width="260" height="260" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><circle cx="130" cy="130" r="100"/><path d="M130 130 L230 130 A100 100 0 0 0 180 43.4 Z" fill="currentColor" fill-opacity="0.15"/><line x1="130" y1="130" x2="230" y2="130"/><text x="180" y="146.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">6 cm</text><line x1="130" y1="130" x2="180" y2="43.4"/><path d="M130 130 L156 130 A26 26 0 0 0 143 107.5 Z" stroke="none"/><path d="M156 130 A26 26 0 0 0 143 107.5" stroke-width="1.4"/><text x="165.8" y="113.5" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">60°</text><circle cx="130" cy="130" r="3" fill="currentColor" stroke="none"/><text x="119.5" y="145.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">O</text><text x="244" y="134.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="190.5" y="37.8" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text></svg>', true),
  -- mat-13-011 · doğrulandı
  ('5d14a5e4-f34d-553f-8203-9d0ade260a0d'::uuid, 'Matematik & Geometri', 'Çokgenler, Dörtgenler ve Çember-Daire', 'multiple_choice', 2,
   'Çevresi $16\pi$ cm olan bir daireden merkez açısı $135^\circ$ olan bir daire dilimi kesilip çıkarılıyor.
Buna göre kalan daire parçasının alanı kaç cm²''dir?',
   '{"options":["$24\\pi$","$30\\pi$","$32\\pi$","$36\\pi$","$40\\pi$"],"correctIndex":4}'::jsonb,
   'Dairenin çevresi $2\pi r = 16\pi \Rightarrow r = 8$ cm bulunur. $135^\circ$''lik dilim çıkarıldığında geriye $360^\circ - 135^\circ = 225^\circ$''lik bir daire dilimi kalır. Kalan alan $\pi \cdot 8^2 \cdot \dfrac{225}{360} = 64\pi \cdot \dfrac{5}{8} = 40\pi$ cm² olur.',
   'A şıkkı ($24\pi$), kalan bölgenin alanı yerine kesilip çıkarılan $135^\circ$''lik dilimin alanını ($\pi \cdot 64 \cdot \frac{3}{8} = 24\pi$) işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-13-012 · şekilli · doğrulandı
  ('7426ef1a-3a64-5722-b36a-8c393ca25945'::uuid, 'Matematik & Geometri', 'Çokgenler, Dörtgenler ve Çember-Daire', 'multiple_choice', 3,
   'Şekildeki $ABCD$ karesinin bir kenar uzunluğu $6$ cm''dir.
$B$ merkezli $6$ cm yarıçaplı çeyrek daire karenin içine çizildiğine göre karenin taralı olmayan bölgesinin alanı kaç cm²''dir?',
   '{"options":["$36 - 6\\pi$","$36 - 9\\pi$","$36 - 18\\pi$","$9\\pi$","$24 - 9\\pi$"],"correctIndex":1}'::jsonb,
   '$ABCD$ karesinin alanı $6^2 = 36$ cm²''dir. $B$ merkezli ve $6$ cm yarıçaplı taralı çeyrek dairenin alanı $\dfrac{\pi \cdot 6^2}{4} = 9\pi$ cm²''dir. Taralı olmayan bölgenin alanı, karenin alanından çeyrek dairenin alanının çıkarılmasıyla $36 - 9\pi$ cm² bulunur.',
   'D şıkkı ($9\pi$), sorulan taralı olmayan bölge yerine taralı çeyrek dairenin alanını işaretleyen; C şıkkı ($36 - 18\pi$) ise çeyrek daire ($90^\circ$) yerine yarım daire ($180^\circ$) alanı çıkaran adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 269 260" width="269" height="260" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><g transform="translate(9 0)"><path d="M30 230 L230 230 A200 200 0 0 0 30 30 Z" fill="currentColor" fill-opacity="0.15"/><polygon points="30,30 30,230 230,230 230,30"/><line x1="30" y1="30" x2="30" y2="230"/><text x="10.5" y="134.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">6 cm</text><text x="19.5" y="24.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="19.5" y="245.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="240.5" y="245.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="240.5" y="24.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text></g></svg>', true),
  -- mat-13-013 · şekilli · doğrulandı
  ('b72ade41-af2d-54ac-adf2-a8635dcdee9f'::uuid, 'Matematik & Geometri', 'Çokgenler, Dörtgenler ve Çember-Daire', 'multiple_choice', 1,
   'Şekildeki $ABCDE$ düzgün beşgeninde $[AC]$ ve $[BE]$ köşegenleri $P$ noktasında kesişmektedir.
Buna göre $m(\widehat{APB}) = x$ kaç derecedir?',
   '{"options":["108","72","90","100","120"],"correctIndex":0}'::jsonb,
   'Düzgün beşgenin bir iç açısı $\dfrac{(5 - 2) \cdot 180^\circ}{5} = 108^\circ$''dir. $ABC$ ve $BAE$ ikizkenar üçgenlerinin tepe açıları $108^\circ$ olduğu için taban açıları $\dfrac{180^\circ - 108^\circ}{2} = 36^\circ$ olur; yani $m(\widehat{BAC}) = 36^\circ$ ve $m(\widehat{ABE}) = 36^\circ$''dir. $ABP$ üçgeninin iç açıları toplamından $x = 180^\circ - (36^\circ + 36^\circ) = 108^\circ$ bulunur.',
   'B şıkkı (72), $m(\widehat{APB})$ iç açısı yerine bütünleri olan $m(\widehat{BPC}) = 72^\circ$ dış açısını işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 270.3 260" width="270.3" height="260" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><polygon points="135.1,30 30,106.4 70.2,230 200.1,230 240.3,106.4"/><line x1="135.1" y1="30" x2="70.2" y2="230"/><line x1="30" y1="106.4" x2="240.3" y2="106.4"/><path d="M110.3 106.4 L88.3 106.4 A22 22 0 0 1 117.1 85.5 Z" stroke="none"/><path d="M88.3 106.4 A22 22 0 0 1 117.1 85.5" stroke-width="1.4"/><text x="91.3" y="84.4" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">x</text><text x="135.1" y="20.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="16" y="111.3" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="59.7" y="245.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="210.6" y="245.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text><text x="254.3" y="111.3" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">E</text><text x="120.8" y="121.8" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">P</text></svg>', true),
  -- mat-13-014 · şekilli · doğrulandı
  ('fc033ed8-7cda-5750-b126-5a18525c9b1a'::uuid, 'Matematik & Geometri', 'Çokgenler, Dörtgenler ve Çember-Daire', 'multiple_choice', 1,
   'Şekildeki $ABCD$ dikdörtgeninin köşegenleri $E$ noktasında kesişmektedir.
$m(\widehat{EAB}) = 28^\circ$ olduğuna göre $m(\widehat{AEB}) = x$ kaç derecedir?',
   '{"options":["56","118","124","136","152"],"correctIndex":2}'::jsonb,
   'Dikdörtgenin köşegenleri eşit uzunlukta olup birbirini ortalar; bu nedenle $|EA| = |EB|$ olur ve $AEB$ ikizkenar üçgen elde edilir. Taban açıları eşit olduğundan $m(\widehat{EBA}) = m(\widehat{EAB}) = 28^\circ$ bulunur. Üçgenin iç açıları toplamından $x = 180^\circ - (28^\circ + 28^\circ) = 124^\circ$ olur.',
   'A şıkkı (56), $m(\widehat{AEB})$ yerine bütünleri olan $m(\widehat{BEC}) = 28^\circ + 28^\circ = 56^\circ$ açısını işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 340 208.9" width="340" height="208.9" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><polygon points="30,178.9 310,178.9 310,30 30,30"/><line x1="30" y1="178.9" x2="310" y2="30"/><line x1="310" y1="178.9" x2="30" y2="30"/><path d="M30 178.9 L62 178.9 A32 32 0 0 0 58.3 163.9 Z" stroke="none"/><path d="M62 178.9 A32 32 0 0 0 58.3 163.9" stroke-width="1.4"/><text x="75.9" y="171.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">28°</text><path d="M170 104.4 L148.8 115.7 A24 24 0 0 0 191.2 115.7 Z" stroke="none"/><path d="M148.8 115.7 A24 24 0 0 0 191.2 115.7" stroke-width="1.4"/><text x="170" y="143.1" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">x</text><text x="19.5" y="194.3" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="320.5" y="194.3" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="320.5" y="24.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="19.5" y="24.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text><text x="170" y="95.3" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">E</text></svg>', true),
  -- mat-13-015 · şekilli · doğrulandı
  ('e0588478-39c4-5f72-94b0-d2cfaa7148b1'::uuid, 'Matematik & Geometri', 'Çokgenler, Dörtgenler ve Çember-Daire', 'multiple_choice', 2,
   'Şekildeki $ABCD$ eşkenar dörtgeninde $|AB| = 10$ cm ve $|BD| = 12$ cm''dir.
Buna göre $ABCD$ eşkenar dörtgeninin alanı kaç cm²''dir?',
   '{"options":["48","60","72","80","96"],"correctIndex":4}'::jsonb,
   'Eşkenar dörtgende köşegenler birbirini dik ortalar. $|BD| = 12$ cm olduğundan $|BO| = |OD| = 6$ cm olur. $AOB$ dik üçgeninde $6-8-10$ özel üçgeninden $|AO| = \sqrt{10^2 - 6^2} = 8$ cm, dolayısıyla diğer köşegen $|AC| = 2 \cdot 8 = 16$ cm bulunur. Eşkenar dörtgenin alanı köşegenler çarpımının yarısıdır: $\dfrac{12 \cdot 16}{2} = 96$ cm².',
   'A şıkkı (48), $|AO| = 8$ cm değerini bulduktan sonra $2$ ile çarpıp tüm köşegeni ($16$ cm) almak yerine $\dfrac{12 \cdot 8}{2} = 48$ hesaplayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 326.7 260" width="326.7" height="260" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><polygon points="30,230 238.3,230 296.7,30 88.3,30"/><line x1="30" y1="230" x2="238.3" y2="230"/><line x1="134.2" y1="224" x2="134.2" y2="236"/><text x="134.2" y="246.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">10</text><line x1="238.3" y1="230" x2="296.7" y2="30"/><line x1="261.7" y1="128.3" x2="273.3" y2="131.7"/><line x1="296.7" y1="30" x2="88.3" y2="30"/><line x1="192.5" y1="36" x2="192.5" y2="24"/><line x1="88.3" y1="30" x2="30" y2="230"/><line x1="64.9" y1="131.7" x2="53.4" y2="128.3"/><line x1="30" y1="230" x2="296.7" y2="30"/><line x1="238.3" y1="230" x2="88.3" y2="30"/><text x="19.5" y="245.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="248.8" y="245.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="307.2" y="24.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="77.8" y="24.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text><text x="163.3" y="120.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">O</text></svg>', true),
  -- mat-13-016 · şekilli · doğrulandı
  ('cedc9d1a-f668-5bd2-9d34-e3f3403ff845'::uuid, 'Matematik & Geometri', 'Çokgenler, Dörtgenler ve Çember-Daire', 'multiple_choice', 2,
   'Şekildeki $ABCD$ dikdörtgeninde $BH \perp AC$, $|AB| = 20$ cm ve $|BC| = 15$ cm''dir.
Buna göre $|BH| = x$ kaç cm''dir?',
   '{"options":["12","9","10","14","16"],"correctIndex":0}'::jsonb,
   '$ABC$ dik üçgeninde $15-20-25$ ($3-4-5$''in $5$ katı) özel üçgeninden $|AC| = \sqrt{20^2 + 15^2} = 25$ cm bulunur. $ABC$ dik üçgeninin alanı iki farklı yoldan eşitlenir: $\dfrac{20 \cdot 15}{2} = \dfrac{25 \cdot x}{2} \Rightarrow 300 = 25x \Rightarrow x = 12$ cm bulunur.',
   'E şıkkı (16) veya B şıkkı (9), Öklid bağlantısından ayırdığı $|AH| = 16$ ve $|HC| = 9$ parçalarından birini yükseklik $|BH|$ yerine işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 326.7 260" width="326.7" height="260" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><polygon points="30,230 296.7,230 296.7,30 30,30"/><line x1="30" y1="230" x2="296.7" y2="230"/><text x="163.3" y="246.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">20</text><line x1="296.7" y1="230" x2="296.7" y2="30"/><text x="312.4" y="134.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">15</text><line x1="30" y1="230" x2="296.7" y2="30"/><line x1="296.7" y1="230" x2="200.7" y2="102"/><text x="237.9" y="178.7" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">x</text><polyline points="191.9,108.6 198.5,117.4 207.3,110.8" stroke-width="1.4"/><text x="19.5" y="245.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="307.2" y="245.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="307.2" y="24.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="19.5" y="24.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text><text x="190.2" y="96.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">H</text></svg>', true),
  -- mat-13-017 · şekilli · doğrulandı
  ('234adf13-308d-5dd5-8e22-0882c9d05ac4'::uuid, 'Matematik & Geometri', 'Çokgenler, Dörtgenler ve Çember-Daire', 'multiple_choice', 2,
   'Şekildeki $ABCD$ ikizkenar yamuğunda $DC \parallel AB$, $|AD| = |BC| = 5$ cm, $|DC| = 6$ cm ve $|AB| = 14$ cm''dir.
Buna göre $ABCD$ yamuğunun alanı kaç cm²''dir?',
   '{"options":["20","24","40","30","50"],"correctIndex":3}'::jsonb,
   '$D$ ve $C$ köşelerinden $[AB]$ tabanına dikmeler indirildiğinde ortada $6$ cm''lik parça kalır ve iki uçtaki eşit parçalar $\dfrac{14 - 6}{2} = 4$''er cm olur. Yanlardaki $3-4-5$ dik üçgenlerinden yamuğun yüksekliği $h = \sqrt{5^2 - 4^2} = 3$ cm bulunur. Yamuğun alanı $\dfrac{14 + 6}{2} \cdot 3 = 10 \cdot 3 = 30$ cm²''dir.',
   'E şıkkı (50), yüksekliği $3$ cm bulmak yerine yan kenar uzunluğu $5$ cm''yi yükseklik sanıp $\dfrac{14 + 6}{2} \cdot 5 = 50$ hesaplayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 340 120" width="340" height="120" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><polygon points="30,90 310,90 230,30 110,30"/><line x1="30" y1="90" x2="110" y2="30"/><line x1="66.4" y1="55.2" x2="73.6" y2="64.8"/><text x="62.1" y="54" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">5</text><line x1="310" y1="90" x2="230" y2="30"/><line x1="266.4" y1="64.8" x2="273.6" y2="55.2"/><text x="277.9" y="54" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">5</text><line x1="110" y1="30" x2="230" y2="30"/><text x="170" y="22.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">6</text><line x1="30" y1="90" x2="310" y2="90"/><text x="170" y="106.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">14</text><text x="19.5" y="105.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="320.5" y="105.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="240.5" y="24.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="99.5" y="24.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text></svg>', true),
  -- mat-13-018 · şekilli · doğrulandı
  ('63ed8597-b511-5c63-b27d-3be24007f746'::uuid, 'Matematik & Geometri', 'Çokgenler, Dörtgenler ve Çember-Daire', 'multiple_choice', 1,
   'Şekildeki $O$ merkezli çembere $P$ noktasından $A$ ve $B$ noktalarında teğet olan $PA$ ve $PB$ ışınları çizilmiştir.
$m(\widehat{APB}) = 50^\circ$ olduğuna göre $m(\widehat{AOB}) = x$ kaç derecedir?',
   '{"options":["100","130","115","140","150"],"correctIndex":1}'::jsonb,
   'Merkezden teğet değme noktalarına çizilen yarıçaplar teğetlere diktir: $m(\widehat{OAP}) = m(\widehat{OBP}) = 90^\circ$. $PAOB$ dörtgeninin iç açıları toplamı $360^\circ$ olduğundan $x + 50^\circ + 90^\circ + 90^\circ = 360^\circ \Rightarrow x = 180^\circ - 50^\circ = 130^\circ$ bulunur.',
   'A şıkkı (100), $m(\widehat{AOB})$ merkez açısını $m(\widehat{APB})$ dış açısının $2$ katı ($2 \cdot 50^\circ = 100^\circ$) sanan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 340 226.4" width="340" height="226.4" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><circle cx="226.8" cy="113.2" r="83.2"/><line x1="30" y1="113.2" x2="191.7" y2="37.8"/><line x1="30" y1="113.2" x2="191.7" y2="188.6"/><line x1="226.8" y1="113.2" x2="191.7" y2="37.8"/><line x1="226.8" y1="113.2" x2="191.7" y2="188.6"/><path d="M30 113.2 L55.4 125 A28 28 0 0 0 55.4 101.3 Z" stroke="none"/><path d="M55.4 125 A28 28 0 0 0 55.4 101.3" stroke-width="1.4"/><text x="73.3" y="117.4" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">50°</text><path d="M226.8 113.2 L216.7 91.4 A24 24 0 0 0 216.7 134.9 Z" stroke="none"/><path d="M216.7 91.4 A24 24 0 0 0 216.7 134.9" stroke-width="1.4"/><text x="192.4" y="117.4" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">x</text><circle cx="226.8" cy="113.2" r="3" fill="currentColor" stroke="none"/><text x="240.8" y="118.1" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">O</text><circle cx="191.7" cy="37.8" r="3" fill="currentColor" stroke="none"/><text x="191.7" y="28.7" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><circle cx="191.7" cy="188.6" r="3" fill="currentColor" stroke="none"/><text x="191.7" y="207.5" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="16" y="118.1" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">P</text></svg>', true),
  -- mat-13-019 · şekilli · doğrulandı
  ('159481c6-bf17-58ac-a225-d8d3b5ce7c8d'::uuid, 'Matematik & Geometri', 'Çokgenler, Dörtgenler ve Çember-Daire', 'multiple_choice', 2,
   'Şekildeki çemberde $[AC]$ ve $[BD]$ kirişleri $E$ noktasında kesişmektedir. $m(\widehat{ADB}) = 37^\circ$ ve $m(\widehat{CAD}) = 23^\circ$ olduğuna göre $m(\widehat{AEB}) = x$ kaç derecedir?',
   '{"options":["30","50","60","74","120"],"correctIndex":2}'::jsonb,
   '$AED$ üçgeninde $m(\widehat{AEB}) = x$ açısı, $E$ köşesine ait dış açıdır ve kendisine komşu olmayan iki iç açının toplamına eşittir: $x = 37^\circ + 23^\circ = 60^\circ$ bulunur. (Çemberdeki iç açı kuralından $\widehat{AB} = 74^\circ$ ve $\widehat{CD} = 46^\circ$ yaylarının yarı toplamı $\dfrac{74^\circ + 46^\circ}{2} = 60^\circ$ ile de aynı sonuca ulaşılır.)',
   'E şıkkı (120), $m(\widehat{AED}) = 180^\circ - 60^\circ = 120^\circ$ açısını bulup bütünler olan $x$''i değil $120^\circ$''yi işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 260 260" width="260" height="260" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><circle cx="130" cy="130" r="100"/><line x1="53.4" y1="65.7" x2="219.9" y2="173.9"/><line x1="47.1" y1="185.9" x2="224" y2="95.8"/><line x1="53.4" y1="65.7" x2="224" y2="95.8"/><path d="M224 95.8 L195.5 110.3 A32 32 0 0 1 192.5 90.2 Z" stroke="none"/><path d="M195.5 110.3 A32 32 0 0 1 192.5 90.2" stroke-width="1.4"/><text x="177.2" y="107" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">37°</text><path d="M53.4 65.7 L81.9 84.2 A34 34 0 0 0 86.9 71.6 Z" stroke="none"/><path d="M81.9 84.2 A34 34 0 0 0 86.9 71.6" stroke-width="1.4"/><text x="99.3" y="88" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">23°</text><path d="M154.3 131.3 L134.2 118.2 A24 24 0 0 0 132.9 142.2 Z" stroke="none"/><path d="M134.2 118.2 A24 24 0 0 0 132.9 142.2" stroke-width="1.4"/><text x="119.9" y="133.7" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">x</text><text x="42.9" y="60.1" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="36.6" y="201.3" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="230.4" y="189.3" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="234.5" y="90.2" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text><text x="154.3" y="150.2" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">E</text></svg>', true),
  -- mat-13-020 · doğrulandı
  ('72c1f651-1a27-5a25-adda-89559148c7d1'::uuid, 'Matematik & Geometri', 'Çokgenler, Dörtgenler ve Çember-Daire', 'multiple_choice', 2,
   'Bir çemberin tüm kenarlarına içten teğet olduğu $ABCD$ teğetler dörtgeninde $|AB| = 7$ cm, $|BC| = 9$ cm ve $|CD| = 11$ cm''dir.
Buna göre $|AD|$ uzunluğu kaç cm''dir?',
   '{"options":["5","7","10","13","9"],"correctIndex":4}'::jsonb,
   'Teğetler dörtgeninde karşılıklı kenar uzunluklarının toplamı birbirine eşittir: $|AB| + |CD| = |BC| + |AD|$. Verilen değerler yerine konursa $7 + 11 = 9 + |AD| \Rightarrow 18 = 9 + |AD| \Rightarrow |AD| = 9$ cm bulunur.',
   'D şıkkı (13), karşılıklı kenarlar yerine komşu kenarları toplayıp $7 + 9 = 11 + |AD| \Rightarrow |AD| = 5$ (A şıkkı) veya $9 + 11 - 7 = 13$ bulan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-13-021 · şekilli · doğrulandı
  ('90e4d01d-d837-5836-af65-fb6a363bdd05'::uuid, 'Matematik & Geometri', 'Çokgenler, Dörtgenler ve Çember-Daire', 'multiple_choice', 1,
   'Şekildeki $O$ merkezli iç içe iki çemberden dıştakinin $[AB]$ kirişi, içteki çembere $H$ noktasında teğettir. $|AB| = 8$ cm olduğuna göre iki çember arasında kalan daire halkasının alanı kaç cm²''dir?',
   '{"options":["$16\\pi$","$8\\pi$","$24\\pi$","$32\\pi$","$64\\pi$"],"correctIndex":0}'::jsonb,
   'Merkezden teğet değme noktası $H$''ye inen yarıçap kirişe diktir ve kirişi iki eşit parçaya böler: $|HB| = \dfrac{8}{2} = 4$ cm. Büyüğün yarıçapı $R = |OB|$, küçüğün yarıçapı $r = |OH|$ olmak üzere $OHB$ dik üçgeninde Pisagor yazılırsa $R^2 - r^2 = |HB|^2 = 4^2 = 16$ bulunur. Daire halkasının alanı $\pi R^2 - \pi r^2 = \pi(R^2 - r^2) = 16\pi$ cm²''dir.',
   'E şıkkı ($64\pi$), $|AB| = 8$ kirişini ikiye bölmeden doğrudan karesini ($8^2 = 64\pi$) alan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 260 260" width="260" height="260" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><circle cx="130" cy="130" r="100"/><circle cx="130" cy="130" r="60"/><line x1="50" y1="190" x2="210" y2="190"/><line x1="130" y1="130" x2="130" y2="190"/><line x1="130" y1="130" x2="210" y2="190" stroke-dasharray="6 5"/><polyline points="130,179 141,179 141,190" stroke-width="1.4"/><circle cx="130" cy="130" r="3" fill="currentColor" stroke="none"/><text x="130" y="120.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">O</text><circle cx="130" cy="190" r="3" fill="currentColor" stroke="none"/><text x="130" y="208.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">H</text><text x="39.5" y="205.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="220.5" y="205.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text></svg>', true),
  -- mat-13-022 · doğrulandı
  ('f1c5ca9c-8483-56b2-9a65-61efd87854ff'::uuid, 'Matematik & Geometri', 'Çokgenler, Dörtgenler ve Çember-Daire', 'multiple_choice', 2,
   'Bir çemberde $72^\circ$''lik merkez açının gördüğü yayın uzunluğu $6\pi$ cm olduğuna göre, aynı merkez açılı daire diliminin alanı kaç $\text{cm}^2$''dir?',
   '{"options":["$45\\pi$","$30\\pi$","$60\\pi$","$75\\pi$","$225\\pi$"],"correctIndex":0}'::jsonb,
   'Önce yay uzunluğu formülünden yarıçap $r$ bulunur:
$$2\pi r \cdot \frac{72^\circ}{360^\circ} = 6\pi \Rightarrow 2\pi r \cdot \frac{1}{5} = 6\pi \Rightarrow r = 15\text{ cm}$$
Aynı $72^\circ$''lik daire diliminin alanı ise:
$$\pi \cdot 15^2 \cdot \frac{72^\circ}{360^\circ} = 225\pi \cdot \frac{1}{5} = 45\pi\text{ cm}^2$$
bulunur.',
   'E şıkkı ($225\pi$), $r = 15$ değerini bulduktan sonra daire dilimi yerine tüm dairenin alanını ($\pi \cdot 15^2 = 225\pi$) işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-13-023 · şekilli · doğrulandı
  ('f013a25a-ac2e-5411-86e9-7ce0c27dbcc3'::uuid, 'Matematik & Geometri', 'Çokgenler, Dörtgenler ve Çember-Daire', 'multiple_choice', 3,
   'Şekildeki $ABCD$ dikdörtgeninin içine, birbirine ve dikdörtgenin kenarlarına teğet olacak biçimde $3$ cm yarıçaplı iki eş daire çizilmiştir.
Buna göre dikdörtgenin içinde olup dairelerin dışında kalan taralı olmayan bölgenin alanı kaç cm²''dir?',
   '{"options":["$72 - 9\\pi$","$72 - 18\\pi$","$36 - 18\\pi$","$72 - 36\\pi$","$18\\pi$"],"correctIndex":1}'::jsonb,
   'Her bir dairenin çapı $2 \cdot 3 = 6$ cm olduğundan dikdörtgenin kısa kenarı $6$ cm, yan yana iki daireden dolayı uzun kenarı ise $6 + 6 = 12$ cm''dir. Dikdörtgenin alanı $12 \cdot 6 = 72$ cm², iki eş dairenin toplam alanı ise $2 \cdot (\pi \cdot 3^2) = 18\pi$ cm² bulunur. Taralı olmayan bölgenin alanı $72 - 18\pi$ cm²''dir.',
   'A şıkkı ($72 - 9\pi$), iki dairenin alanını toplamak yerine yalnızca bir dairenin alanını ($9\pi$) çıkaran adayı; C şıkkı ($36 - 18\pi$) ise dikdörtgenin kenarlarını $6$ ve $6$ alanların düştüğü tuzaktır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 340 200" width="340" height="200" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><circle cx="100" cy="100" r="70" fill="currentColor" fill-opacity="0.12"/><circle cx="240" cy="100" r="70" fill="currentColor" fill-opacity="0.12"/><polygon points="30,170 310,170 310,30 30,30"/><line x1="100" y1="100" x2="170" y2="100"/><text x="135" y="92.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">3</text><text x="19.5" y="185.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="320.5" y="185.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="320.5" y="24.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="19.5" y="24.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text><circle cx="100" cy="100" r="3" fill="currentColor" stroke="none"/><circle cx="240" cy="100" r="3" fill="currentColor" stroke="none"/></svg>', true),
  -- mat-13-024 · şekilli · doğrulandı
  ('73091989-8adc-5cc4-8bd2-4020cbf26e21'::uuid, 'Matematik & Geometri', 'Çokgenler, Dörtgenler ve Çember-Daire', 'multiple_choice', 3,
   'Şekildeki $ABCD$ paralelkenarında $E \in [DC]$ ve $|DE| = 2|EC|$ verilmektedir.
Taralı $BCE$ üçgeninin alanı $10$ cm² olduğuna göre $ABCD$ paralelkenarının alanı kaç cm²''dir?',
   '{"options":["30","40","50","60","80"],"correctIndex":3}'::jsonb,
   'Paralelkenarda $[BD]$ köşegeni çizilirse $BCD$ üçgeni paralelkenarın yarısı olur. $BDE$ ve $BCE$ üçgenlerinin yükseklikleri ortak olduğundan alanları tabanlarıyla orantılıdır: $|EC| = k$ tabanına $10$ cm² düşerse $|DE| = 2k$ tabanına $20$ cm² düşer. Dolayısıyla $\text{Alan}(\triangle BCD) = 10 + 20 = 30$ cm² olur. Paralelkenarın tamamı bunun $2$ katı olduğundan $2 \cdot 30 = 60$ cm² bulunur.',
   'A şıkkı (30), $BCD$ üçgeninin alanını bulduktan sonra paralelkenarın yarısı olduğu için $2$ ile çarpmayı unutan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 340 187.3" width="340" height="187.3" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><polygon points="259.1,157.3 310,30 233.6,30" fill="currentColor" fill-opacity="0.12"/><polygon points="30,157.3 259.1,157.3 310,30 80.9,30"/><line x1="80.9" y1="30" x2="233.6" y2="30"/><text x="157.3" y="22.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">2k</text><line x1="233.6" y1="30" x2="310" y2="30"/><text x="271.8" y="22.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">k</text><line x1="259.1" y1="157.3" x2="233.6" y2="30"/><text x="19.5" y="172.7" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="269.6" y="172.7" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="320.5" y="24.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="70.4" y="24.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text><text x="233.6" y="20.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">E</text></svg>', true),
  -- mat-13-025 · doğrulandı
  ('4fe82de4-675a-5571-a0b2-4af90e95116f'::uuid, 'Matematik & Geometri', 'Çokgenler, Dörtgenler ve Çember-Daire', 'multiple_choice', 1,
   'Bir dış açısının ölçüsü $30^\circ$ olan düzgün çokgen ile bir iç açısının ölçüsü $135^\circ$ olan düzgün çokgenin kenar sayıları toplamı kaçtır?',
   '{"options":["16","18","20","22","24"],"correctIndex":2}'::jsonb,
   'Düzgün çokgenlerde kenar sayısı $n = \dfrac{360^\circ}{\text{Dış açı}}$ bağıntısıyla bulunur:
- İlk çokgenin dış açısı $30^\circ$ olduğundan kenar sayısı $n_1 = \dfrac{360}{30} = 12$''dir.
- İkinci çokgenin iç açısı $135^\circ$ olduğundan bir dış açısı $180^\circ - 135^\circ = 45^\circ$ ve kenar sayısı $n_2 = \dfrac{360}{45} = 8$''dir.
Kenar sayıları toplamı $12 + 8 = 20$ bulunur.',
   'B şıkkı ($18$) veya A şıkkı ($16$), ikinci çokgenin dış açısını $180^\circ - 135^\circ = 45^\circ$ almak yerine bölmede $36^\circ$ veya hatalı tam bölen seçen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-13-026 · şekilli · doğrulandı
  ('4b4a2fed-a83c-522c-ad30-9621ec2059f8'::uuid, 'Matematik & Geometri', 'Çokgenler, Dörtgenler ve Çember-Daire', 'multiple_choice', 1,
   'Şekildeki $ABCD$ dikdörtgeninde $[AC]$ ve $[BD]$ köşegenleri $E$ noktasında kesişmektedir. $m(\widehat{CAB}) = 32^\circ$ olduğuna göre $m(\widehat{CEB}) = x$ kaç derecedir?',
   '{"options":["32","64","58","116","128"],"correctIndex":1}'::jsonb,
   'Dikdörtgende köşegenler eşittir ve birbirini ortalar: $|EA| = |EB|$. $EAB$ ikizkenar üçgeninde $m(\widehat{EBA}) = m(\widehat{EAB}) = 32^\circ$ olur. $E$ köşesindeki dış açı iki iç açının toplamına eşittir: $x = m(\widehat{CEB}) = 32^\circ + 32^\circ = 64^\circ$ bulunur.',
   'D şıkkı ($116$), soru $m(\widehat{CEB})$ dar açısını sorduğu hâlde $EAB$ üçgeninin tepe açısı $m(\widehat{AEB}) = 180^\circ - 64^\circ = 116^\circ$''yi işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 340 235" width="340" height="235" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><polygon points="30,205 310,205 310,30 30,30"/><line x1="30" y1="205" x2="310" y2="30"/><line x1="310" y1="205" x2="30" y2="30"/><path d="M30 205 L64 205 A34 34 0 0 0 58.8 187 Z" stroke="none"/><path d="M64 205 A34 34 0 0 0 58.8 187" stroke-width="1.4"/><text x="77.4" y="195.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">32°</text><path d="M170 117.5 L190.4 130.2 A24 24 0 0 0 190.4 104.8 Z" stroke="none"/><path d="M190.4 130.2 A24 24 0 0 0 190.4 104.8" stroke-width="1.4"/><text x="204.4" y="121.7" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">x</text><text x="19.5" y="220.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="320.5" y="220.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="320.5" y="24.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="19.5" y="24.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text><text x="170" y="108.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">E</text></svg>', true),
  -- mat-13-027 · şekilli · doğrulandı
  ('9f18d07c-a46f-5c72-854a-e96f4e8c711e'::uuid, 'Matematik & Geometri', 'Çokgenler, Dörtgenler ve Çember-Daire', 'multiple_choice', 2,
   'Şekildeki $ABCD$ eşkenar dörtgeninin çevresi $40$ cm ve köşegenlerinden biri $|AC| = 16$ cm''dir.
Buna göre $ABCD$ eşkenar dörtgeninin alanı kaç cm²''dir?',
   '{"options":["48","64","96","120","160"],"correctIndex":2}'::jsonb,
   'Eşkenar dörtgenin çevresi $40$ cm olduğundan bir kenarı $\dfrac{40}{4} = 10$ cm''dir. Köşegenler birbirini dik ortaladığından $|AO| = \dfrac{16}{2} = 8$ cm olur. $AOD$ dik üçgeninde $6-8-10$ özel üçgeninden $|OD| = 6$ cm, yani diğer köşegen $|BD| = 12$ cm bulunur. Alan köşegenler çarpımının yarısıdır:
$$\text{Alan}(ABCD) = \frac{16 \cdot 12}{2} = 96\text{ cm}^2$$',
   'E şıkkı ($160$), yükseklik yerine kenar uzunluğu ($10$) ile köşegeni ($16$) çarpan; A şıkkı ($48$) ise alan hesabında $|BD| = 12$ yerine yarı köşegen $|OD| = 6$ kullanarak $\dfrac{16 \cdot 6}{2} = 48$ bulan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 326.7 260" width="326.7" height="260" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><polygon points="30,130 163.3,230 296.7,130 163.3,30"/><line x1="30" y1="130" x2="296.7" y2="130"/><line x1="163.3" y1="230" x2="163.3" y2="30"/><polyline points="163.3,119 174.3,119 174.3,130" stroke-width="1.4"/><text x="16" y="134.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="163.3" y="248.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="310.7" y="134.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="163.3" y="20.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text><text x="152.8" y="124.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">O</text></svg>', true),
  -- mat-13-028 · şekilli · doğrulandı
  ('a058d041-8ce2-5694-af4a-dd56ddcab0ab'::uuid, 'Matematik & Geometri', 'Çokgenler, Dörtgenler ve Çember-Daire', 'multiple_choice', 2,
   'Şekildeki $ABCD$ paralelkenarında $[AE]$ ve $[BE]$ sırasıyla $\widehat{DAB}$ ve $\widehat{CBA}$ açılarının açıortaylarıdır ($E \in [DC]$).
$|AE| = 12$ cm ve $|BE| = 16$ cm olduğuna göre $ABCD$ paralelkenarının alanı kaç $\text{cm}^2$''dir?',
   '{"options":["60","96","128","192","256"],"correctIndex":3}'::jsonb,
   'Paralelkenarda ardışık iki açının toplamı $180^\circ$ olduğundan açıortayların kesiştiği açı $m(\widehat{AEB}) = 90^\circ$''dir. Dolayısıyla $AEB$ bir dik üçgendir ve alanı:
$$\text{Alan}(\triangle AEB) = \frac{12 \cdot 16}{2} = 96\text{ cm}^2$$
$E \in [DC]$ noktası karşı kenar üzerinde olduğundan $AEB$ üçgeni paralelkenarın alanının tam yarısına eşittir. O hâlde $\text{Alan}(ABCD) = 2 \cdot 96 = 192\text{ cm}^2$ bulunur.',
   'B şıkkı ($96$), dik üçgenin alanını hesapladıktan sonra paralelkenarın alanının bunun $2$ katı olduğunu unutup $96$''yı işaretleyen; A şıkkı ($60$) ise alan yerine çevreyi hesaplayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 340 177.9" width="340" height="177.9" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><polygon points="64.4,147.9 310,147.9 275.6,30 30,30"/><line x1="64.4" y1="147.9" x2="152.8" y2="30"/><text x="96.6" y="84.5" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">12</text><line x1="310" y1="147.9" x2="152.8" y2="30"/><text x="240" y="82.1" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">16</text><path d="M64.4 147.9 L76.4 131.9 A20 20 0 0 0 58.8 128.7 Z" stroke="none"/><path d="M76.4 131.9 A20 20 0 0 0 58.8 128.7" stroke-width="1.4"/><path d="M64.4 147.9 L88.4 147.9 A24 24 0 0 0 78.8 128.7 Z" stroke="none"/><path d="M88.4 147.9 A24 24 0 0 0 78.8 128.7" stroke-width="1.4"/><path d="M310 147.9 L294 135.9 A20 20 0 0 0 290 147.9 Z" stroke="none"/><path d="M294 135.9 A20 20 0 0 0 290 147.9" stroke-width="1.4"/><path d="M290.8 133.5 A24 24 0 0 0 286 147.9" stroke-width="1.4"/><path d="M310 147.9 L303.3 124.9 A24 24 0 0 0 290.8 133.5 Z" stroke="none"/><path d="M303.3 124.9 A24 24 0 0 0 290.8 133.5" stroke-width="1.4"/><path d="M302.2 121 A28 28 0 0 0 287.6 131.1" stroke-width="1.4"/><text x="53.9" y="163.3" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="320.5" y="163.3" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="286.1" y="24.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="19.5" y="24.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text><text x="152.8" y="20.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">E</text></svg>', true),
  -- mat-13-029 · şekilli · doğrulandı
  ('2fa3bcf0-b2ce-5417-813d-ef9817edbc16'::uuid, 'Matematik & Geometri', 'Çokgenler, Dörtgenler ve Çember-Daire', 'multiple_choice', 2,
   'Şekildeki $ABCD$ dik yamuğunda $DC \parallel AB$, $[AD] \perp [AB]$, $|DC| = 5$ cm, $|AB| = 13$ cm ve $|BC| = 10$ cm''dir.
Buna göre $ABCD$ yamuğunun alanı kaç cm²''dir?',
   '{"options":["30","42","45","48","54"],"correctIndex":4}'::jsonb,
   '$C$ köşesinden $[AB]$ tabanına $[CH] \perp [AB]$ dikmesi indirilir. $|AH| = |DC| = 5$ cm olduğundan $|HB| = 13 - 5 = 8$ cm kalır. $CHB$ dik üçgeninde $6-8-10$ özel üçgeninden yükseklik $|CH| = 6$ cm bulunur. Yamuğun alanı $\dfrac{13 + 5}{2} \cdot 6 = 9 \cdot 6 = 54$ cm²''dir.',
   'D şıkkı ($48$), yükseklik $h = 6$ ve parça $8$ değerlerinden yanlışlıkla dik üçgen ya da başka alan kombinasyonları hesaplayan; $90$ bulanlar ise yüksekliği yan kenar $10$ sananlardır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 340 189.2" width="340" height="189.2" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><polygon points="30,159.2 310,159.2 137.7,30 30,30"/><line x1="30" y1="30" x2="137.7" y2="30"/><text x="83.8" y="22.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">5</text><line x1="30" y1="159.2" x2="310" y2="159.2"/><text x="170" y="175.8" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">13</text><line x1="310" y1="159.2" x2="137.7" y2="30"/><text x="232.4" y="87.8" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">10</text><polyline points="41,159.2 41,148.2 30,148.2" stroke-width="1.4"/><polyline points="30,41 41,41 41,30" stroke-width="1.4"/><text x="19.5" y="174.6" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="320.5" y="174.6" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="148.2" y="24.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="19.5" y="24.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text></svg>', true),
  -- mat-13-030 · şekilli · doğrulandı
  ('995ac0cf-7552-5933-9d83-e8646acc5ba1'::uuid, 'Matematik & Geometri', 'Çokgenler, Dörtgenler ve Çember-Daire', 'multiple_choice', 2,
   'Şekildeki $ABCD$ karesinin içine $DEC$ eşkenar üçgeni yerleştirilmiştir ($|DE| = |EC| = |DC|$).
Buna göre $m(\widehat{DAE}) = x$ kaç derecedir?',
   '{"options":["75","30","45","60","80"],"correctIndex":0}'::jsonb,
   'Kare kenarları eşkenar üçgen kenarlarına eşit olduğundan $|AD| = |DC| = |DE|$''dir.
$m(\widehat{EDC}) = 60^\circ$ olduğu için $m(\widehat{ADE}) = 90^\circ - 60^\circ = 30^\circ$ bulunur. $ADE$ ikizkenar üçgeninde taban açıları birbirine eşittir:
$$x = m(\widehat{DAE}) = \frac{180^\circ - 30^\circ}{2} = \frac{150^\circ}{2} = 75^\circ$$',
   'C şıkkı ($45$), $[AE]$ doğru parçasını karenin köşegeni sanıp $90^\circ$''nin yarısını işaretleyen; D şıkkı ($60$) ise eşkenar üçgen açısıyla karıştıran adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 260 260" width="260" height="260" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><polygon points="30,230 230,230 230,30 30,30"/><line x1="30" y1="30" x2="130" y2="203.2"/><line x1="230" y1="30" x2="130" y2="203.2"/><line x1="30" y1="230" x2="130" y2="203.2"/><path d="M30 230 L57 222.8 A28 28 0 0 0 30 202 Z" stroke="none"/><path d="M57 222.8 A28 28 0 0 0 30 202" stroke-width="1.4"/><text x="53.4" y="203.7" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">x</text><text x="19.5" y="245.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="240.5" y="245.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="240.5" y="24.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="19.5" y="24.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text><text x="130" y="222.1" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">E</text></svg>', true),
  -- mat-13-031 · şekilli · doğrulandı
  ('1f8f751c-90e7-5fcd-8fd6-d9572330098e'::uuid, 'Matematik & Geometri', 'Çokgenler, Dörtgenler ve Çember-Daire', 'multiple_choice', 1,
   'Şekildeki $O$ merkezli çember üzerinde $A$, $B$ ve $C$ noktaları verilmiştir. $m(\widehat{ABC}) = 52^\circ$ olduğuna göre $m(\widehat{OAC}) = x$ kaç derecedir?',
   '{"options":["26","32","38","52","76"],"correctIndex":2}'::jsonb,
   '$m(\widehat{ABC}) = 52^\circ$ çevre açısının gördüğü $AC$ yayı $2 \cdot 52^\circ = 104^\circ$''dir. Aynı yayı gören merkez açı $m(\widehat{AOC}) = 104^\circ$ olur. Yarıçaplar eşit olduğundan ($|OA| = |OC|$) $OAC$ ikizkenar üçgeninde $x = \dfrac{180^\circ - 104^\circ}{2} = \dfrac{76^\circ}{2} = 38^\circ$ bulunur.',
   'D şıkkı ($52$) veya E şıkkı ($76$), $76^\circ$''yi ikiye bölmeyi unutan ya da $\widehat{OAC}$ açısını doğrudan $52^\circ$''ye eşit sanan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 260 260" width="260" height="260" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><circle cx="130" cy="130" r="100"/><line x1="51.2" y1="191.6" x2="95.8" y2="36"/><line x1="95.8" y1="36" x2="208.8" y2="191.6"/><line x1="130" y1="130" x2="51.2" y2="191.6"/><line x1="130" y1="130" x2="208.8" y2="191.6"/><line x1="51.2" y1="191.6" x2="208.8" y2="191.6"/><path d="M95.8 36 L88.6 61 A26 26 0 0 0 111.1 57.1 Z" stroke="none"/><path d="M88.6 61 A26 26 0 0 0 111.1 57.1" stroke-width="1.4"/><text x="103" y="80.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">52°</text><path d="M51.2 191.6 L79.2 191.6 A28 28 0 0 0 73.3 174.3 Z" stroke="none"/><path d="M79.2 191.6 A28 28 0 0 0 73.3 174.3" stroke-width="1.4"/><text x="87.5" y="183.3" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">x</text><circle cx="130" cy="130" r="3" fill="currentColor" stroke="none"/><text x="130" y="120.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">O</text><text x="40.7" y="207" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="219.3" y="207" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="85.3" y="30.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text></svg>', true),
  -- mat-13-032 · şekilli · doğrulandı
  ('d430a572-0fb2-53f4-a00b-ddb77a45a320'::uuid, 'Matematik & Geometri', 'Çokgenler, Dörtgenler ve Çember-Daire', 'multiple_choice', 2,
   'Şekildeki $O$ merkezli çemberde $[OC] \perp [AB]$, $|AB| = 16$ cm ve $|HC| = 4$ cm''dir.
Buna göre bu çemberin yarıçapı kaç cm''dir?',
   '{"options":["6","8","9","10","12"],"correctIndex":3}'::jsonb,
   'Merkezden kirişe inen dikme kirişi ortalar: $|HB| = \dfrac{16}{2} = 8$ cm. Yarıçap $r = |OB| = |OC|$ olmak üzere $|OH| = r - 4$ cm olur. $OHB$ dik üçgeninde Pisagor teoremi uygulanır:
$$(r - 4)^2 + 8^2 = r^2 \Rightarrow r^2 - 8r + 16 + 64 = r^2 \Rightarrow 8r = 80 \Rightarrow r = 10\text{ cm}$$',
   'B şıkkı ($8$) veya E şıkkı ($12$), kirişin yarısını ($8$) doğrudan yarıçap sanan ya da $|OH| = 6$ değerini bulduktan sonra $6 + 4 = 10$ yerine yanlış işlem yapan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 260 260" width="260" height="260" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><circle cx="130" cy="130" r="100"/><line x1="50" y1="190" x2="210" y2="190"/><line x1="130" y1="130" x2="130" y2="190"/><line x1="130" y1="190" x2="130" y2="230"/><text x="116.1" y="214.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">4</text><line x1="130" y1="130" x2="210" y2="190" stroke-dasharray="6 5"/><polyline points="130,179 141,179 141,190" stroke-width="1.4"/><circle cx="130" cy="130" r="3" fill="currentColor" stroke="none"/><text x="130" y="120.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">O</text><circle cx="130" cy="190" r="3" fill="currentColor" stroke="none"/><text x="119.5" y="184.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">H</text><circle cx="130" cy="230" r="3" fill="currentColor" stroke="none"/><text x="130" y="248.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="39.5" y="205.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="220.5" y="205.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text></svg>', true),
  -- mat-13-033 · şekilli · doğrulandı
  ('ca594cb5-d396-5484-8178-961338229145'::uuid, 'Matematik & Geometri', 'Çokgenler, Dörtgenler ve Çember-Daire', 'multiple_choice', 3,
   'Şekildeki $O_1$ ve $O_2$ merkezli, sırasıyla $9$ cm ve $4$ cm yarıçaplı iki çember birbirine dıştan teğettir. Doğrusal bir $[AB]$ teğeti iki çembere $A$ ve $B$ noktalarında değmektedir.
Buna göre $|AB| = x$ uzunluğu kaç cm''dir?',
   '{"options":["10","12","13","15","16"],"correctIndex":1}'::jsonb,
   'Merkezler arasındaki uzaklık yarıçaplar toplamıdır: $|O_1 O_2| = 9 + 4 = 13$ cm. $O_2$ merkezinden $[O_1 A]$ yarıçapına dikme indirildiğinde oluşan dik üçgende düşey kenar $9 - 4 = 5$ cm, hipotenüs $13$ cm olur. $5-12-13$ özel dik üçgeninden yatay kenar $x = |AB| = 12$ cm bulunur.',
   'C şıkkı ($13$), merkezler arası mesafeyi ($9 + 4 = 13$) teğet uzunluğuyla aynı sanan; A şıkkı ($10$) ise $2\sqrt{r_1 r_2}$ ortak dış teğet formülünü yanlış uygulayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 337.8 260" width="337.8" height="260" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><circle cx="130" cy="130" r="100"/><circle cx="263.3" cy="185.6" r="44.4"/><line x1="130" y1="230" x2="263.3" y2="230"/><text x="196.7" y="246.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">x</text><line x1="130" y1="130" x2="263.3" y2="185.6"/><line x1="130" y1="130" x2="130" y2="230"/><text x="116.1" y="184.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">9</text><line x1="263.3" y1="185.6" x2="263.3" y2="230"/><text x="277.2" y="212.3" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">4</text><polyline points="130,219 141,219 141,230" stroke-width="1.4"/><polyline points="252.3,230 252.3,219 263.3,219" stroke-width="1.4"/><circle cx="130" cy="130" r="3" fill="currentColor" stroke="none"/><text x="130" y="120.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">O₁</text><circle cx="130" cy="230" r="3" fill="currentColor" stroke="none"/><text x="130" y="248.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><circle cx="263.3" cy="185.6" r="3" fill="currentColor" stroke="none"/><text x="263.3" y="176.5" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">O₂</text><circle cx="263.3" cy="230" r="3" fill="currentColor" stroke="none"/><text x="263.3" y="248.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text></svg>', true),
  -- mat-13-034 · doğrulandı
  ('302058c2-b802-5f6d-a06a-99538b538699'::uuid, 'Matematik & Geometri', 'Çokgenler, Dörtgenler ve Çember-Daire', 'multiple_choice', 3,
   'Bir dış açısının ölçüsü $36^\circ$ olan bir düzgün çokgenin toplam köşegen sayısı kaçtır?',
   '{"options":["20","25","27","30","35"],"correctIndex":4}'::jsonb,
   'Dış açılar toplamı $360^\circ$ olduğundan çokgenin kenar sayısı $n = \dfrac{360^\circ}{36^\circ} = 10$''dur (düzgün ongen). $n$ kenarlı bir konveks çokgenin toplam köşegen sayısı $\dfrac{n(n - 3)}{2}$ formülüyle bulunur:
$$\frac{10 \cdot (10 - 3)}{2} = \frac{10 \cdot 7}{2} = 35$$',
   'C şıkkı ($27$) veya D şıkkı ($30$), dokuzgen ($9 \cdot 6 / 2 = 27$) ile karıştıran ya da köşegen formülünde $(n - 3)$ yerine yanlış terim kullanan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-13-035 · şekilli · doğrulandı
  ('9c4ed9e0-8f9a-5559-b21f-3c759ec03d5e'::uuid, 'Matematik & Geometri', 'Çokgenler, Dörtgenler ve Çember-Daire', 'multiple_choice', 3,
   'Şekildeki $ABCD$ ikizkenar yamuğunda $DC \parallel AB$, $|AD| = |BC|$, $[AC] \perp [BD]$, $|DC| = 4$ cm ve $|AB| = 10$ cm''dir.
Buna göre $ABCD$ yamuğunun alanı kaç cm²''dir?',
   '{"options":["28","35","40","42","49"],"correctIndex":4}'::jsonb,
   'Köşegenleri dik kesişen bir ikizkenar yamukta yükseklik orta tabana eşittir: $h = \dfrac{|AB| + |DC|}{2} = \dfrac{10 + 4}{2} = 7$ cm. (Simetriden $ABE$ ve $DCE$ ikizkenar dik üçgenlerinin yükseklikleri sırasıyla $5$ ve $2$ cm olup toplam yükseklik $5 + 2 = 7$ cm''dir.)
Yamuğun alanı $\text{Orta taban} \cdot h = 7 \cdot 7 = 49$ cm² bulunur.',
   'B şıkkı ($35$) veya D şıkkı ($42$), yüksekliği orta taban $7$ yerine sırasıyla $5$ ya da $6$ sanarak yamuk alanını çarpan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 340 256" width="340" height="256" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><polygon points="30,226 310,226 226,30 114,30"/><line x1="30" y1="226" x2="226" y2="30"/><line x1="310" y1="226" x2="114" y2="30"/><line x1="30" y1="226" x2="114" y2="30"/><line x1="66.5" y1="125.6" x2="77.5" y2="130.4"/><line x1="310" y1="226" x2="226" y2="30"/><line x1="262.5" y1="130.4" x2="273.5" y2="125.6"/><line x1="114" y1="30" x2="226" y2="30"/><text x="170" y="22.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">4</text><line x1="30" y1="226" x2="310" y2="226"/><text x="170" y="242.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">10</text><polyline points="162.2,93.8 154.4,86 162.2,78.2" stroke-width="1.4"/><text x="19.5" y="241.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="320.5" y="241.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="236.5" y="24.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="103.5" y="24.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text><text x="170" y="76.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">E</text></svg>', true),
  -- mat-13-036 · şekilli · doğrulandı
  ('487011ae-9c30-5428-b30a-9e8fcb209a36'::uuid, 'Matematik & Geometri', 'Çokgenler, Dörtgenler ve Çember-Daire', 'multiple_choice', 1,
   'Şekildeki $ABCDEF$ düzgün altıgeninin bir kenar uzunluğu $|AB| = 6$ cm''dir.
Buna göre $[AC]$ köşegeninin uzunluğu kaç cm''dir?',
   '{"options":["$6$","$6\\sqrt{2}$","$6\\sqrt{3}$","$12$","$12\\sqrt{3}$"],"correctIndex":2}'::jsonb,
   'Düzgün altıgenin bir iç açısı $120^\circ$''dir. $ABC$ üçgeninde $|AB| = |BC| = 6$ cm ve $m(\widehat{ABC}) = 120^\circ$ olduğundan $120^\circ-30^\circ-30^\circ$ ikizkenar üçgeni oluşur; taban uzunluğu $|AC| = 6\sqrt{3}$ cm bulunur.',
   'D şıkkı ($12$), kısa köşegen olan $[AC]$ yerine düzgün altıgenin en uzun köşegeni (simetri ekseni) olan $[AD] = 2 \cdot 6 = 12$ cm''yi işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 290.9 260" width="290.9" height="260" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><polygon points="87.7,230 203.2,230 260.9,130 203.2,30 87.7,30 30,130"/><line x1="87.7" y1="230" x2="260.9" y2="130"/><line x1="87.7" y1="230" x2="203.2" y2="230"/><text x="145.5" y="246.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">6</text><text x="77.2" y="245.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="213.7" y="245.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="274.9" y="134.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="213.7" y="24.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text><text x="77.2" y="24.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">E</text><text x="16" y="134.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">F</text></svg>', true),
  -- mat-13-037 · şekilli · doğrulandı
  ('9728b457-9ca9-5b35-8f87-f83e6d59bfa3'::uuid, 'Matematik & Geometri', 'Çokgenler, Dörtgenler ve Çember-Daire', 'multiple_choice', 2,
   'Şekildeki $ABCD$ deltoidinde $|AB| = |AD| = 10$ cm, $|CB| = |CD| = 17$ cm ve $|BD| = 16$ cm veriliyor.
Buna göre $ABCD$ deltoidinin alanı kaç cm²''dir?',
   '{"options":["168","84","120","144","192"],"correctIndex":0}'::jsonb,
   'Deltoidde köşegenler dik kesişir ve $[AC]$ ana köşegeni $[BD]$''yi ortalar: $|BO| = |OD| = \dfrac{16}{2} = 8$ cm.
- $AOB$ dik üçgeninden ($6-8-10$): $|AO| = 6$ cm.
- $COB$ dik üçgeninden ($8-15-17$): $|OC| = 15$ cm.
Ana köşegen $|AC| = 6 + 15 = 21$ cm olur. Deltoidin alanı $\dfrac{|AC| \cdot |BD|}{2} = \dfrac{21 \cdot 16}{2} = 168$ cm² bulunur.',
   'B şıkkı ($84$), iki üçgenin alanlarını hesaplamak yerine $21 \cdot 16$ çarpımında fazladan $2$''ye bölen; C şıkkı ($120$) ise $|OC|$ parçasını yanlış üçlüyle $9$ alan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 212.4 260" width="212.4" height="260" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><polygon points="106.2,30 30,87.1 106.2,230 182.4,87.1"/><line x1="106.2" y1="30" x2="106.2" y2="230" stroke-dasharray="6 5"/><line x1="30" y1="87.1" x2="182.4" y2="87.1" stroke-dasharray="6 5"/><line x1="106.2" y1="30" x2="30" y2="87.1"/><line x1="71.7" y1="63.4" x2="64.5" y2="53.8"/><text x="59.5" y="51.7" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">10</text><line x1="106.2" y1="30" x2="182.4" y2="87.1"/><line x1="147.9" y1="53.8" x2="140.7" y2="63.4"/><line x1="30" y1="87.1" x2="106.2" y2="230"/><line x1="72.2" y1="153.5" x2="61.6" y2="159.2"/><line x1="74.6" y1="158" x2="64" y2="163.6"/><text x="54.6" y="170.3" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">17</text><line x1="106.2" y1="230" x2="182.4" y2="87.1"/><line x1="137.8" y1="158" x2="148.4" y2="163.6"/><line x1="140.2" y1="153.5" x2="150.8" y2="159.2"/><polyline points="106.2,76.1 117.2,76.1 117.2,87.1" stroke-width="1.4"/><text x="106.2" y="20.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="16" y="92" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="106.2" y="248.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="196.4" y="92" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text><text x="95.7" y="81.5" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">O</text></svg>', true),
  -- mat-13-038 · şekilli · doğrulandı
  ('3319f8b5-ce8d-5dd0-a9cd-312df69cd2ce'::uuid, 'Matematik & Geometri', 'Çokgenler, Dörtgenler ve Çember-Daire', 'multiple_choice', 2,
   'Şekildeki $ABCD$ dikdörtgeninde $E \in [DC]$, $|DE| = 4$ cm ve $|EC| = 8$ cm veriliyor. $[AC]$ ve $[BE]$ doğru parçaları $F$ noktasında kesişmektedir.
Taralı $CEF$ üçgeninin alanı $12$ cm² olduğuna göre $ABCD$ dikdörtgeninin alanı kaç cm²''dir?',
   '{"options":["72","90","96","108","120"],"correctIndex":1}'::jsonb,
   '$|AB| = |DC| = 4 + 8 = 12$ cm''dir. $EC \parallel AB$ olduğundan $ECF$ ve $BAF$ üçgenleri kelebek benzeridir; benzerlik oranı $\dfrac{|EC|}{|AB|} = \dfrac{8}{12} = \dfrac{2}{3}$''tür.
Benzerlik oranının karesinden $\text{Alan}(\triangle BAF) = \left(\dfrac{3}{2}\right)^2 \cdot 12 = \dfrac{9}{4} \cdot 12 = 27$ cm² olur.
Ayrıca $\dfrac{|BF|}{|FE|} = \dfrac{3}{2}$ olduğundan $\text{Alan}(\triangle BCF) = \dfrac{3}{2} \cdot 12 = 18$ cm²''dir.
Dikdörtgenin yarısı olan $\text{Alan}(\triangle ABC) = 27 + 18 = 45$ cm² olduğundan $\text{Alan}(ABCD) = 2 \cdot 45 = 90$ cm² bulunur.',
   'A şıkkı ($72$), benzerlikte yükseklik oranını $\dfrac{2}{3}$ yerine $\dfrac{1}{2}$ alarak dikdörtgenin yüksekliğini $6$ cm sanan ($12 \cdot 6 = 72$) adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 340 235" width="340" height="235" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><polygon points="310,30 123.3,30 198,100" fill="currentColor" fill-opacity="0.12"/><polygon points="30,205 310,205 310,30 30,30"/><line x1="30" y1="205" x2="310" y2="30"/><line x1="310" y1="205" x2="123.3" y2="30"/><line x1="30" y1="30" x2="123.3" y2="30"/><text x="76.7" y="22.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">4</text><line x1="123.3" y1="30" x2="310" y2="30"/><text x="216.7" y="22.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">8</text><text x="19.5" y="220.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="320.5" y="220.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="320.5" y="24.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="19.5" y="24.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text><text x="123.3" y="20.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">E</text><text x="212" y="104.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">F</text></svg>', true),
  -- mat-13-039 · şekilli · doğrulandı
  ('d30e97d8-0f55-59c0-93ed-f28269afe973'::uuid, 'Matematik & Geometri', 'Çokgenler, Dörtgenler ve Çember-Daire', 'multiple_choice', 2,
   'Şekildeki çemberin dışındaki $P$ noktasından çizilen iki kesen çemberi sırasıyla $A, B$ ve $C, D$ noktalarında kesmektedir.
$m(\widehat{BAD}) = 52^\circ$ ve $m(\widehat{ADC}) = 22^\circ$ olduğuna göre $m(\widehat{BPD}) = x$ kaç derecedir?',
   '{"options":["22","26","28","30","37"],"correctIndex":3}'::jsonb,
   '$PAD$ üçgeninde $m(\widehat{BAD}) = 52^\circ$ açısı dış açı olduğundan kendisine komşu olmayan iki iç açının toplamına eşittir:
$$52^\circ = x + 22^\circ \Rightarrow x = 30^\circ$$
(Aynı sonuç çemberde dış açı kuralıyla $\widehat{BD} = 104^\circ$ ve $\widehat{AC} = 44^\circ$ yaylarından $\dfrac{104^\circ - 44^\circ}{2} = 30^\circ$ şeklinde de bulunur.)',
   'E şıkkı ($37$), $\dfrac{52^\circ + 22^\circ}{2} = 37^\circ$ diyerek iki açının aritmetik ortalamasını alan adayı; C şıkkı ($28$) ise çıkarma işlemini hatalı yapanları yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 340 232.3" width="340" height="232.3" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><circle cx="223.8" cy="116.2" r="86.2"/><line x1="30" y1="116.2" x2="252.9" y2="35"/><line x1="30" y1="116.2" x2="296.1" y2="163.1"/><line x1="149.5" y1="72.7" x2="296.1" y2="163.1"/><path d="M149.5 72.7 L169.9 85.3 A24 24 0 0 0 172 64.5 Z" stroke="none"/><path d="M169.9 85.3 A24 24 0 0 0 172 64.5" stroke-width="1.4"/><text x="188.6" y="80.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">52°</text><path d="M296.1 163.1 L268.5 158.2 A28 28 0 0 1 272.3 148.4 Z" stroke="none"/><path d="M268.5 158.2 A28 28 0 0 1 272.3 148.4" stroke-width="1.4"/><text x="255.6" y="151.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">22°</text><path d="M30 116.2 L63.5 122.1 A34 34 0 0 0 61.9 104.5 Z" stroke="none"/><path d="M63.5 122.1 A34 34 0 0 0 61.9 104.5" stroke-width="1.4"/><text x="74.3" y="116.5" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">x</text><text x="16" y="121.1" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">P</text><text x="139" y="67.1" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="252.9" y="25.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="129.4" y="150.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="306.6" y="178.5" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text></svg>', true),
  -- mat-13-040 · şekilli · doğrulandı
  ('e2861941-7ed9-59f0-acf9-ab7fc6ed900f'::uuid, 'Matematik & Geometri', 'Çokgenler, Dörtgenler ve Çember-Daire', 'multiple_choice', 3,
   'Şekildeki $[AB]$ çaplı çember üzerinde $C$ noktası alınmış ve $[CH] \perp [AB]$ dikmesi indirilmiştir.
$|AH| = 4$ cm ve $|HB| = 16$ cm olduğuna göre boyalı $ABC$ üçgeninin alanı kaç cm²''dir?',
   '{"options":["32","40","64","72","80"],"correctIndex":4}'::jsonb,
   'Çapı gören çevre açı $90^\circ$ olduğundan $m(\widehat{ACB}) = 90^\circ$''dir. $ABC$ dik üçgeninde $[CH] \perp [AB]$ için Öklid bağıntısı uygulanır:
$$|CH|^2 = |AH| \cdot |HB| = 4 \cdot 16 = 64 \Rightarrow |CH| = 8\text{ cm}$$
Taban $|AB| = 4 + 16 = 20$ cm ve yükseklik $|CH| = 8$ cm olduğundan:
$$\text{Alan}(\triangle ABC) = \frac{20 \cdot 8}{2} = 80\text{ cm}^2$$',
   'C şıkkı ($64$), Öklid bağlantısından $|CH|^2 = 64$ değerini bulup karekök almadan veya yarım çap ($10$) üzerinden farklı alan hesaplayıp $64$ bulan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 260 260" width="260" height="260" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><polygon points="30,130 230,130 70,50" fill="currentColor" fill-opacity="0.12"/><circle cx="130" cy="130" r="100"/><line x1="70" y1="50" x2="70" y2="130"/><line x1="30" y1="130" x2="70" y2="130"/><text x="50" y="146.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">4</text><line x1="70" y1="130" x2="230" y2="130"/><text x="150" y="146.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">16</text><polyline points="70,119 81,119 81,130" stroke-width="1.4"/><text x="16" y="134.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="244" y="134.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="70" y="148.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">H</text><text x="59.5" y="44.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text></svg>', true)
on conflict (id) do update set
  lesson = excluded.lesson, topic = excluded.topic, question_type = excluded.question_type,
  difficulty = excluded.difficulty, prompt_text = excluded.prompt_text,
  interaction_data = excluded.interaction_data, explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap, exam_scopes = excluded.exam_scopes,
  education_level = excluded.education_level, figure_svg = excluded.figure_svg, is_active = true;

-- >>> 14_analitik_geometri_ve_kati_cisimler.sql
-- ==========================================================================
-- KADRO SORU HAVUZU · Matematik & Geometri · Analitik Geometri ve Katı Cisimler (30 soru)
-- Kaynak: docs/soru_havuzu/matematik/14_analitik_geometri_ve_kati_cisimler.md · Üretici: tools/math/compile_questions.mjs (elle düzenlemeyin)
-- Önkoşul: docs/supabase_migrations/12_math_figures.sql
-- İdempotent: soru kimlikleri sabit UUID'dir; dosya tekrar çalıştırılırsa sorular güncellenir.
-- ==========================================================================

insert into public.questions (
  id, lesson, topic, question_type, difficulty, prompt_text, interaction_data,
  explanation, distractor_trap, exam_scopes, education_level, figure_svg, is_active
) values
  -- mat-14-001 · doğrulandı
  ('ffaf30f7-d77c-557e-8d26-8595dd38c6cc'::uuid, 'Matematik & Geometri', 'Analitik Geometri ve Katı Cisimler', 'multiple_choice', 1,
   'Dik koordinat düzleminde $A(-2, 5)$ ve $B(4, -3)$ noktaları arasındaki uzaklık kaç birimdir?',
   '{"options":["10","8","$2\\sqrt{5}$","$2\\sqrt{13}$","14"],"correctIndex":0}'::jsonb,
   'İki nokta arası uzaklık formülü uygulanır:
$|AB| = \sqrt{(4 - (-2))^2 + (-3 - 5)^2} = \sqrt{6^2 + (-8)^2} = \sqrt{36 + 64} = \sqrt{100} = 10$ birim bulunur.',
   'C şıkkı ($2\sqrt{5}$) veya D şıkkı ($2\sqrt{13}$), koordinat farklarını alırken eksili sayılarda işaret hatası yapıp $4 - 2 = 2$ veya $5 - 3 = 2$ alan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-14-002 · doğrulandı
  ('6e25644f-8016-5784-8c35-2c7cbb5e4eee'::uuid, 'Matematik & Geometri', 'Analitik Geometri ve Katı Cisimler', 'multiple_choice', 1,
   'Köşe koordinatları sırasıyla $A(1, 2)$, $B(5, 4)$, $C(7, 8)$ ve $D(x, y)$ olan $ABCD$ paralelkenarı için $x + y$ toplamı kaçtır?',
   '{"options":["6","8","9","11","13"],"correctIndex":2}'::jsonb,
   'Bir paralelkenarda karşılıklı köşelerin apsisleri toplamı ve ordinatları toplamı birbirine eşittir (köşegenler birbirini ortalar):
$1 + 7 = 5 + x \Rightarrow x = 3$ ve
$2 + 8 = 4 + y \Rightarrow y = 6$.
Buna göre $x + y = 3 + 6 = 9$ bulunur.',
   'D şıkkı (11) veya E şıkkı (13), karşılıklı köşeler olan $A$ ve $C$ yerine komşu köşeleri eşleştiren ($1 + 5 = 7 + x$ vb.) adayı yakalar. Paralelkenar harf sırasına göre $A$ ile $C$, $B$ ile $D$ karşılıklıdır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-14-003 · şekilli · doğrulandı
  ('ae15dfcf-0867-5ce8-bc46-c82fd802d9f7'::uuid, 'Matematik & Geometri', 'Analitik Geometri ve Katı Cisimler', 'multiple_choice', 2,
   'Şekildeki dik koordinat düzleminde $d_1$ doğrusu $A(-2, 0)$ ve $B(0, 4)$ noktalarından geçmektedir. $B$ noktasından geçen ve $d_1$ doğrusuna dik olan $d_2$ doğrusunun $x$-eksenini kestiği $C$ noktasının apsisi kaçtır?',
   '{"options":["2","4","6","8","10"],"correctIndex":3}'::jsonb,
   '$d_1$ doğrusunun eğimi $m_1 = \dfrac{4 - 0}{0 - (-2)} = 2$''dir. İki doğru dik olduğunda eğimleri çarpımı $-1$ olacağından $d_2$ doğrusunun eğimi $m_2 = -\dfrac{1}{2}$ olur. $B(0, 4)$ noktasından geçen $d_2$ doğrusunun denklemi $y = -\dfrac{1}{2}x + 4$''tür. $x$-eksenini kestiği noktada $y = 0$ yazılırsa $-\dfrac{1}{2}x + 4 = 0 \Rightarrow x = 8$ bulunur.',
   'A şıkkı (2), dik doğruların eğimleri çarpımını $-1$ almak yerine $m_2 = -2$ alarak $y = -2x + 4 \Rightarrow x = 2$ bulan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 340 200" width="340" height="200" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><g stroke-width="0.6" stroke-opacity="0.25"><line x1="53.3" y1="170" x2="53.3" y2="30"/><line x1="100" y1="170" x2="100" y2="30"/><line x1="146.7" y1="170" x2="146.7" y2="30"/><line x1="193.3" y1="170" x2="193.3" y2="30"/><line x1="240" y1="170" x2="240" y2="30"/><line x1="286.7" y1="170" x2="286.7" y2="30"/><line x1="30" y1="146.7" x2="310" y2="146.7"/><line x1="30" y1="100" x2="310" y2="100"/><line x1="30" y1="53.3" x2="310" y2="53.3"/></g><line x1="24" y1="146.7" x2="320" y2="146.7"/><line x1="100" y1="176" x2="100" y2="20"/><path d="M320 146.7 l-7 -4 m7 4 l-7 4"/><path d="M100 20 l-4 7 m4 -7 l4 7"/><text x="324" y="163.6" fill="currentColor" stroke="none" text-anchor="end" font-style="italic">x</text><text x="112" y="22.9" fill="currentColor" stroke="none" text-anchor="start" font-style="italic">y</text><g stroke-width="1.2"><line x1="53.3" y1="143.7" x2="53.3" y2="149.7"/><text x="53.3" y="164.5" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">-2</text><line x1="146.7" y1="143.7" x2="146.7" y2="149.7"/><text x="146.7" y="164.5" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">2</text><line x1="193.3" y1="143.7" x2="193.3" y2="149.7"/><text x="193.3" y="164.5" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">4</text><line x1="240" y1="143.7" x2="240" y2="149.7"/><text x="240" y="164.5" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">6</text><line x1="286.7" y1="143.7" x2="286.7" y2="149.7"/><text x="286.7" y="164.5" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">8</text><line x1="97" y1="100" x2="103" y2="100"/><text x="94" y="103.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">2</text><line x1="97" y1="53.3" x2="103" y2="53.3"/><text x="94" y="57.2" fill="currentColor" stroke="none" text-anchor="end" font-size="11">4</text><text x="92" y="162.5" fill="currentColor" stroke="none" text-anchor="end" font-size="11">O</text></g><path d="M41.7 170L42 169.4L42.3 168.8L42.5 168.3L42.8 167.7L43.1 167.1L43.4 166.5L43.7 165.9L44 165.3L44.3 164.8L44.6 164.2L44.9 163.6L45.2 163L45.5 162.4L45.7 161.8L46 161.3L46.3 160.7L46.6 160.1L46.9 159.5L47.2 158.9L47.5 158.3L47.8 157.8L48.1 157.2L48.4 156.6L48.7 156L49 155.4L49.3 154.8L49.5 154.3L49.8 153.7L50.1 153.1L50.4 152.5L50.7 151.9L51 151.3L51.3 150.8L51.6 150.2L51.9 149.6L52.2 149L52.5 148.4L52.8 147.8L53 147.3L53.3 146.7L53.6 146.1L53.9 145.5L54.2 144.9L54.5 144.3L54.8 143.8L55.1 143.2L55.4 142.6L55.7 142L56 141.4L56.3 140.8L56.5 140.3L56.8 139.7L57.1 139.1L57.4 138.5L57.7 137.9L58 137.3L58.3 136.8L58.6 136.2L58.9 135.6L59.2 135L59.5 134.4L59.8 133.8L60 133.3L60.3 132.7L60.6 132.1L60.9 131.5L61.2 130.9L61.5 130.3L61.8 129.8L62.1 129.2L62.4 128.6L62.7 128L63 127.4L63.3 126.8L63.5 126.3L63.8 125.7L64.1 125.1L64.4 124.5L64.7 123.9L65 123.3L65.3 122.8L65.6 122.2L65.9 121.6L66.2 121L66.5 120.4L66.8 119.8L67 119.3L67.3 118.7L67.6 118.1L67.9 117.5L68.2 116.9L68.5 116.3L68.8 115.7L69.1 115.2L69.4 114.6L69.7 114L70 113.4L70.3 112.8L70.5 112.3L70.8 111.7L71.1 111.1L71.4 110.5L71.7 109.9L72 109.3L72.3 108.8L72.6 108.2L72.9 107.6L73.2 107L73.5 106.4L73.8 105.8L74 105.3L74.3 104.7L74.6 104.1L74.9 103.5L75.2 102.9L75.5 102.3L75.8 101.8L76.1 101.2L76.4 100.6L76.7 100L77 99.4L77.3 98.8L77.5 98.2L77.8 97.7L78.1 97.1L78.4 96.5L78.7 95.9L79 95.3L79.3 94.8L79.6 94.2L79.9 93.6L80.2 93L80.5 92.4L80.8 91.8L81 91.3L81.3 90.7L81.6 90.1L81.9 89.5L82.2 88.9L82.5 88.3L82.8 87.8L83.1 87.2L83.4 86.6L83.7 86L84 85.4L84.3 84.8L84.5 84.3L84.8 83.7L85.1 83.1L85.4 82.5L85.7 81.9L86 81.3L86.3 80.8L86.6 80.2L86.9 79.6L87.2 79L87.5 78.4L87.8 77.8L88 77.3L88.3 76.7L88.6 76.1L88.9 75.5L89.2 74.9L89.5 74.3L89.8 73.8L90.1 73.2L90.4 72.6L90.7 72L91 71.4L91.3 70.8L91.5 70.3L91.8 69.7L92.1 69.1L92.4 68.5L92.7 67.9L93 67.3L93.3 66.8L93.6 66.2L93.9 65.6L94.2 65L94.5 64.4L94.8 63.8L95 63.2L95.3 62.7L95.6 62.1L95.9 61.5L96.2 60.9L96.5 60.3L96.8 59.8L97.1 59.2L97.4 58.6L97.7 58L98 57.4L98.2 56.8L98.5 56.3L98.8 55.7L99.1 55.1L99.4 54.5L99.7 53.9L100 53.3L100.3 52.7L100.6 52.2L100.9 51.6L101.2 51L101.5 50.4L101.8 49.8L102 49.3L102.3 48.7L102.6 48.1L102.9 47.5L103.2 46.9L103.5 46.3L103.8 45.7L104.1 45.2L104.4 44.6L104.7 44L105 43.4L105.3 42.8L105.5 42.3L105.8 41.7L106.1 41.1L106.4 40.5L106.7 39.9L107 39.3L107.3 38.8L107.6 38.2L107.9 37.6L108.2 37L108.5 36.4L108.8 35.8L109 35.2L109.3 34.7L109.6 34.1L109.9 33.5L110.2 32.9L110.5 32.3L110.8 31.8L111.1 31.2L111.4 30.6L111.7 30" stroke-width="2.2"/><text x="92" y="76.2" fill="currentColor" stroke="none" text-anchor="start" font-style="italic">d₁</text><path d="M76.7 41.7L77.6 42.2L78.6 42.6L79.6 43.1L80.6 43.6L81.5 44.1L82.5 44.6L83.5 45.1L84.4 45.6L85.4 46L86.4 46.5L87.4 47L88.3 47.5L89.3 48L90.3 48.5L91.3 49L92.2 49.4L93.2 49.9L94.2 50.4L95.1 50.9L96.1 51.4L97.1 51.9L98.1 52.4L99 52.8L100 53.3L101 53.8L101.9 54.3L102.9 54.8L103.9 55.3L104.9 55.8L105.8 56.3L106.8 56.7L107.8 57.2L108.8 57.7L109.7 58.2L110.7 58.7L111.7 59.2L112.6 59.7L113.6 60.1L114.6 60.6L115.6 61.1L116.5 61.6L117.5 62.1L118.5 62.6L119.4 63.1L120.4 63.5L121.4 64L122.4 64.5L123.3 65L124.3 65.5L125.3 66L126.3 66.5L127.2 66.9L128.2 67.4L129.2 67.9L130.1 68.4L131.1 68.9L132.1 69.4L133.1 69.9L134 70.3L135 70.8L136 71.3L136.9 71.8L137.9 72.3L138.9 72.8L139.9 73.3L140.8 73.8L141.8 74.2L142.8 74.7L143.8 75.2L144.7 75.7L145.7 76.2L146.7 76.7L147.6 77.2L148.6 77.6L149.6 78.1L150.6 78.6L151.5 79.1L152.5 79.6L153.5 80.1L154.4 80.6L155.4 81L156.4 81.5L157.4 82L158.3 82.5L159.3 83L160.3 83.5L161.3 84L162.2 84.4L163.2 84.9L164.2 85.4L165.1 85.9L166.1 86.4L167.1 86.9L168.1 87.4L169 87.8L170 88.3L171 88.8L171.9 89.3L172.9 89.8L173.9 90.3L174.9 90.8L175.8 91.3L176.8 91.7L177.8 92.2L178.8 92.7L179.7 93.2L180.7 93.7L181.7 94.2L182.6 94.7L183.6 95.1L184.6 95.6L185.6 96.1L186.5 96.6L187.5 97.1L188.5 97.6L189.4 98.1L190.4 98.5L191.4 99L192.4 99.5L193.3 100L194.3 100.5L195.3 101L196.3 101.5L197.2 101.9L198.2 102.4L199.2 102.9L200.1 103.4L201.1 103.9L202.1 104.4L203.1 104.9L204 105.3L205 105.8L206 106.3L206.9 106.8L207.9 107.3L208.9 107.8L209.9 108.3L210.8 108.8L211.8 109.2L212.8 109.7L213.8 110.2L214.7 110.7L215.7 111.2L216.7 111.7L217.6 112.2L218.6 112.6L219.6 113.1L220.6 113.6L221.5 114.1L222.5 114.6L223.5 115.1L224.4 115.6L225.4 116L226.4 116.5L227.4 117L228.3 117.5L229.3 118L230.3 118.5L231.3 119L232.2 119.4L233.2 119.9L234.2 120.4L235.1 120.9L236.1 121.4L237.1 121.9L238.1 122.4L239 122.8L240 123.3L241 123.8L241.9 124.3L242.9 124.8L243.9 125.3L244.9 125.8L245.8 126.3L246.8 126.7L247.8 127.2L248.8 127.7L249.7 128.2L250.7 128.7L251.7 129.2L252.6 129.7L253.6 130.1L254.6 130.6L255.6 131.1L256.5 131.6L257.5 132.1L258.5 132.6L259.4 133.1L260.4 133.5L261.4 134L262.4 134.5L263.3 135L264.3 135.5L265.3 136L266.3 136.5L267.2 136.9L268.2 137.4L269.2 137.9L270.1 138.4L271.1 138.9L272.1 139.4L273.1 139.9L274 140.3L275 140.8L276 141.3L276.9 141.8L277.9 142.3L278.9 142.8L279.9 143.3L280.8 143.8L281.8 144.2L282.8 144.7L283.8 145.2L284.7 145.7L285.7 146.2L286.7 146.7L287.6 147.2L288.6 147.6L289.6 148.1L290.6 148.6L291.5 149.1L292.5 149.6L293.5 150.1L294.4 150.6L295.4 151L296.4 151.5L297.4 152L298.3 152.5L299.3 153L300.3 153.5L301.3 154L302.2 154.4L303.2 154.9L304.2 155.4L305.1 155.9L306.1 156.4L307.1 156.9L308.1 157.4L309 157.8L310 158.3" stroke-width="2.2"/><text x="246" y="118.2" fill="currentColor" stroke="none" text-anchor="start" font-style="italic">d₂</text><circle cx="53.3" cy="146.7" r="3" fill="currentColor" stroke="none"/><text x="42.8" y="141.1" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><circle cx="100" cy="53.3" r="3" fill="currentColor" stroke="none"/><text x="110.5" y="47.7" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><circle cx="286.7" cy="146.7" r="3" fill="currentColor" stroke="none"/><text x="297.2" y="141.1" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text></svg>', true),
  -- mat-14-004 · şekilli · doğrulandı
  ('ed0650dd-5ed2-5104-8546-a164b524d37e'::uuid, 'Matematik & Geometri', 'Analitik Geometri ve Katı Cisimler', 'multiple_choice', 2,
   'Şekildeki dik koordinat düzleminde $3x + 4y = 12$ doğrusunun koordinat eksenleriyle sınırladığı taralı üçgenin çevresi kaç birimdir?',
   '{"options":["6","12","10","14","15"],"correctIndex":1}'::jsonb,
   'Doğrunun eksenleri kestiği noktalar bulunur: $y = 0$ için $3x = 12 \Rightarrow x = 4$ ($A(4, 0)$); $x = 0$ için $4y = 12 \Rightarrow y = 3$ ($B(0, 3)$). $OAB$ dik üçgeninin dik kenarları $3$ ve $4$ birim olduğundan $3-4-5$ üçgeninden hipotenüs $|AB| = 5$ birim olur. Üçgenin çevresi $3 + 4 + 5 = 12$ birimdir.',
   'A şıkkı (6), taralı üçgenin çevresi yerine alanını ($\dfrac{3 \cdot 4}{2} = 6$) hesaplayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 300 260" width="300" height="260" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><g stroke-width="0.6" stroke-opacity="0.25"><line x1="30" y1="230" x2="30" y2="30"/><line x1="70" y1="230" x2="70" y2="30"/><line x1="110" y1="230" x2="110" y2="30"/><line x1="150" y1="230" x2="150" y2="30"/><line x1="190" y1="230" x2="190" y2="30"/><line x1="230" y1="230" x2="230" y2="30"/><line x1="270" y1="230" x2="270" y2="30"/><line x1="30" y1="230" x2="270" y2="230"/><line x1="30" y1="190" x2="270" y2="190"/><line x1="30" y1="150" x2="270" y2="150"/><line x1="30" y1="110" x2="270" y2="110"/><line x1="30" y1="70" x2="270" y2="70"/><line x1="30" y1="30" x2="270" y2="30"/></g><line x1="24" y1="190" x2="280" y2="190"/><line x1="70" y1="236" x2="70" y2="20"/><path d="M280 190 l-7 -4 m7 4 l-7 4"/><path d="M70 20 l-4 7 m4 -7 l4 7"/><text x="284" y="206.9" fill="currentColor" stroke="none" text-anchor="end" font-style="italic">x</text><text x="82" y="22.9" fill="currentColor" stroke="none" text-anchor="start" font-style="italic">y</text><g stroke-width="1.2"><line x1="30" y1="187" x2="30" y2="193"/><text x="30" y="207.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">-1</text><line x1="110" y1="187" x2="110" y2="193"/><text x="110" y="207.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">1</text><line x1="150" y1="187" x2="150" y2="193"/><text x="150" y="207.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">2</text><line x1="190" y1="187" x2="190" y2="193"/><text x="190" y="207.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">3</text><line x1="230" y1="187" x2="230" y2="193"/><text x="230" y="207.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">4</text><line x1="270" y1="187" x2="270" y2="193"/><text x="270" y="207.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">5</text><line x1="67" y1="230" x2="73" y2="230"/><text x="64" y="233.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">-1</text><line x1="67" y1="150" x2="73" y2="150"/><text x="64" y="153.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">1</text><line x1="67" y1="110" x2="73" y2="110"/><text x="64" y="113.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">2</text><line x1="67" y1="70" x2="73" y2="70"/><text x="64" y="73.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">3</text><line x1="67" y1="30" x2="73" y2="30"/><text x="64" y="33.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">4</text><text x="62" y="205.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">O</text></g><path d="M38 46L38.9 46.7L39.9 47.4L40.8 48.1L41.7 48.8L42.7 49.5L43.6 50.2L44.5 50.9L45.5 51.6L46.4 52.3L47.3 53L48.3 53.7L49.2 54.4L50.1 55.1L51.1 55.8L52 56.5L52.9 57.2L53.9 57.9L54.8 58.6L55.7 59.3L56.7 60L57.6 60.7L58.5 61.4L59.5 62.1L60.4 62.8L61.3 63.5L62.3 64.2L63.2 64.9L64.1 65.6L65.1 66.3L66 67L66.9 67.7L67.9 68.4L68.8 69.1L69.7 69.8L70.7 70.5L71.6 71.2L72.5 71.9L73.5 72.6L74.4 73.3L75.3 74L76.3 74.7L77.2 75.4L78.1 76.1L79.1 76.8L80 77.5L80.9 78.2L81.9 78.9L82.8 79.6L83.7 80.3L84.7 81L85.6 81.7L86.5 82.4L87.5 83.1L88.4 83.8L89.3 84.5L90.3 85.2L91.2 85.9L92.1 86.6L93.1 87.3L94 88L94.9 88.7L95.9 89.4L96.8 90.1L97.7 90.8L98.7 91.5L99.6 92.2L100.5 92.9L101.5 93.6L102.4 94.3L103.3 95L104.3 95.7L105.2 96.4L106.1 97.1L107.1 97.8L108 98.5L108.9 99.2L109.9 99.9L110.8 100.6L111.7 101.3L112.7 102L113.6 102.7L114.5 103.4L115.5 104.1L116.4 104.8L117.3 105.5L118.3 106.2L119.2 106.9L120.1 107.6L121.1 108.3L122 109L122.9 109.7L123.9 110.4L124.8 111.1L125.7 111.8L126.7 112.5L127.6 113.2L128.5 113.9L129.5 114.6L130.4 115.3L131.3 116L132.3 116.7L133.2 117.4L134.1 118.1L135.1 118.8L136 119.5L136.9 120.2L137.9 120.9L138.8 121.6L139.7 122.3L140.7 123L141.6 123.7L142.5 124.4L143.5 125.1L144.4 125.8L145.3 126.5L146.3 127.2L147.2 127.9L148.1 128.6L149.1 129.3L150 130L150.9 130.7L151.9 131.4L152.8 132.1L153.7 132.8L154.7 133.5L155.6 134.2L156.5 134.9L157.5 135.6L158.4 136.3L159.3 137L160.3 137.7L161.2 138.4L162.1 139.1L163.1 139.8L164 140.5L164.9 141.2L165.9 141.9L166.8 142.6L167.7 143.3L168.7 144L169.6 144.7L170.5 145.4L171.5 146.1L172.4 146.8L173.3 147.5L174.3 148.2L175.2 148.9L176.1 149.6L177.1 150.3L178 151L178.9 151.7L179.9 152.4L180.8 153.1L181.7 153.8L182.7 154.5L183.6 155.2L184.5 155.9L185.5 156.6L186.4 157.3L187.3 158L188.3 158.7L189.2 159.4L190.1 160.1L191.1 160.8L192 161.5L192.9 162.2L193.9 162.9L194.8 163.6L195.7 164.3L196.7 165L197.6 165.7L198.5 166.4L199.5 167.1L200.4 167.8L201.3 168.5L202.3 169.2L203.2 169.9L204.1 170.6L205.1 171.3L206 172L206.9 172.7L207.9 173.4L208.8 174.1L209.7 174.8L210.7 175.5L211.6 176.2L212.5 176.9L213.5 177.6L214.4 178.3L215.3 179L216.3 179.7L217.2 180.4L218.1 181.1L219.1 181.8L220 182.5L220.9 183.2L221.9 183.9L222.8 184.6L223.7 185.3L224.7 186L225.6 186.7L226.5 187.4L227.5 188.1L228.4 188.8L229.3 189.5L230.3 190.2L231.2 190.9L232.1 191.6L233.1 192.3L234 193L234.9 193.7L235.9 194.4L236.8 195.1L237.7 195.8L238.7 196.5L239.6 197.2L240.5 197.9L241.5 198.6L242.4 199.3L243.3 200L244.3 200.7L245.2 201.4L246.1 202.1L247.1 202.8L248 203.5L248.9 204.2L249.9 204.9L250.8 205.6L251.7 206.3L252.7 207L253.6 207.7L254.5 208.4L255.5 209.1L256.4 209.8L257.3 210.5L258.3 211.2L259.2 211.9L260.1 212.6L261.1 213.3L262 214" stroke-width="2.2"/><text x="140" y="112.9" fill="currentColor" stroke="none" text-anchor="start" font-style="italic">d</text><polygon points="70,190 230,190 70,70" fill="currentColor" fill-opacity="0.12"/><circle cx="230" cy="190" r="3" fill="currentColor" stroke="none"/><text x="240.5" y="184.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><circle cx="70" cy="70" r="3" fill="currentColor" stroke="none"/><text x="80.5" y="64.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text></svg>', true),
  -- mat-14-005 · şekilli · doğrulandı
  ('402c871b-f36b-5d94-b098-eef2a6cf296c'::uuid, 'Matematik & Geometri', 'Analitik Geometri ve Katı Cisimler', 'multiple_choice', 3,
   'Şekildeki dik koordinat düzleminde $y = 2x$ ve $y = -x + 6$ doğruları $A$ noktasında kesişmektedir.
Buna göre bu iki doğru ile $x$-ekseni arasında kalan taralı $OAB$ üçgeninin alanı kaç birimkaredir?',
   '{"options":["6","8","9","10","12"],"correctIndex":4}'::jsonb,
   '$y = -x + 6$ doğrusunun $x$-eksenini kestiği nokta $y = 0 \Rightarrow x = 6$ olduğundan üçgenin tabanı $|OB| = 6$ birimdir. Kesişim noktası $A$''yı bulmak için iki doğru eşitlenir: $2x = -x + 6 \Rightarrow 3x = 6 \Rightarrow x = 2$. $y = 2 \cdot 2 = 4$ olduğundan üçgenin yüksekliği $4$ birim olur. Alan $\dfrac{6 \cdot 4}{2} = 12$ birimkaredir.',
   'A şıkkı (6), kesişim noktasının yüksekliği olan $y = 4$ yerine apsisi olan $x = 2$''yi yükseklik sanıp $\dfrac{6 \cdot 2}{2} = 6$ bulan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 326.7 260" width="326.7" height="260" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><g stroke-width="0.6" stroke-opacity="0.25"><line x1="30" y1="230" x2="30" y2="30"/><line x1="63.3" y1="230" x2="63.3" y2="30"/><line x1="96.7" y1="230" x2="96.7" y2="30"/><line x1="130" y1="230" x2="130" y2="30"/><line x1="163.3" y1="230" x2="163.3" y2="30"/><line x1="196.7" y1="230" x2="196.7" y2="30"/><line x1="230" y1="230" x2="230" y2="30"/><line x1="263.3" y1="230" x2="263.3" y2="30"/><line x1="296.7" y1="230" x2="296.7" y2="30"/><line x1="30" y1="230" x2="296.7" y2="230"/><line x1="30" y1="196.7" x2="296.7" y2="196.7"/><line x1="30" y1="163.3" x2="296.7" y2="163.3"/><line x1="30" y1="130" x2="296.7" y2="130"/><line x1="30" y1="96.7" x2="296.7" y2="96.7"/><line x1="30" y1="63.3" x2="296.7" y2="63.3"/><line x1="30" y1="30" x2="296.7" y2="30"/></g><line x1="24" y1="196.7" x2="306.7" y2="196.7"/><line x1="63.3" y1="236" x2="63.3" y2="20"/><path d="M306.7 196.7 l-7 -4 m7 4 l-7 4"/><path d="M63.3 20 l-4 7 m4 -7 l4 7"/><text x="310.7" y="213.6" fill="currentColor" stroke="none" text-anchor="end" font-style="italic">x</text><text x="75.3" y="22.9" fill="currentColor" stroke="none" text-anchor="start" font-style="italic">y</text><g stroke-width="1.2"><line x1="30" y1="193.7" x2="30" y2="199.7"/><text x="30" y="214.5" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">-1</text><line x1="96.7" y1="193.7" x2="96.7" y2="199.7"/><text x="96.7" y="214.5" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">1</text><line x1="130" y1="193.7" x2="130" y2="199.7"/><text x="130" y="214.5" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">2</text><line x1="163.3" y1="193.7" x2="163.3" y2="199.7"/><text x="163.3" y="214.5" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">3</text><line x1="196.7" y1="193.7" x2="196.7" y2="199.7"/><text x="196.7" y="214.5" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">4</text><line x1="230" y1="193.7" x2="230" y2="199.7"/><text x="230" y="214.5" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">5</text><line x1="263.3" y1="193.7" x2="263.3" y2="199.7"/><text x="263.3" y="214.5" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">6</text><line x1="296.7" y1="193.7" x2="296.7" y2="199.7"/><text x="296.7" y="214.5" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">7</text><line x1="60.3" y1="230" x2="66.3" y2="230"/><text x="57.3" y="233.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">-1</text><line x1="60.3" y1="163.3" x2="66.3" y2="163.3"/><text x="57.3" y="167.2" fill="currentColor" stroke="none" text-anchor="end" font-size="11">1</text><line x1="60.3" y1="130" x2="66.3" y2="130"/><text x="57.3" y="133.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">2</text><line x1="60.3" y1="96.7" x2="66.3" y2="96.7"/><text x="57.3" y="100.5" fill="currentColor" stroke="none" text-anchor="end" font-size="11">3</text><line x1="60.3" y1="63.3" x2="66.3" y2="63.3"/><text x="57.3" y="67.2" fill="currentColor" stroke="none" text-anchor="end" font-size="11">4</text><line x1="60.3" y1="30" x2="66.3" y2="30"/><text x="57.3" y="33.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">5</text><text x="55.3" y="212.5" fill="currentColor" stroke="none" text-anchor="end" font-size="11">O</text></g><path d="M50 223.3L50.4 222.6L50.8 221.8L51.2 221L51.6 220.2L51.9 219.4L52.3 218.7L52.7 217.9L53.1 217.1L53.5 216.3L53.9 215.6L54.3 214.8L54.7 214L55.1 213.2L55.4 212.4L55.8 211.7L56.2 210.9L56.6 210.1L57 209.3L57.4 208.6L57.8 207.8L58.2 207L58.6 206.2L58.9 205.4L59.3 204.7L59.7 203.9L60.1 203.1L60.5 202.3L60.9 201.6L61.3 200.8L61.7 200L62.1 199.2L62.4 198.4L62.8 197.7L63.2 196.9L63.6 196.1L64 195.3L64.4 194.6L64.8 193.8L65.2 193L65.6 192.2L65.9 191.4L66.3 190.7L66.7 189.9L67.1 189.1L67.5 188.3L67.9 187.6L68.3 186.8L68.7 186L69.1 185.2L69.4 184.4L69.8 183.7L70.2 182.9L70.6 182.1L71 181.3L71.4 180.6L71.8 179.8L72.2 179L72.6 178.2L72.9 177.4L73.3 176.7L73.7 175.9L74.1 175.1L74.5 174.3L74.9 173.6L75.3 172.8L75.7 172L76.1 171.2L76.4 170.4L76.8 169.7L77.2 168.9L77.6 168.1L78 167.3L78.4 166.6L78.8 165.8L79.2 165L79.6 164.2L79.9 163.4L80.3 162.7L80.7 161.9L81.1 161.1L81.5 160.3L81.9 159.6L82.3 158.8L82.7 158L83.1 157.2L83.4 156.4L83.8 155.7L84.2 154.9L84.6 154.1L85 153.3L85.4 152.6L85.8 151.8L86.2 151L86.6 150.2L86.9 149.4L87.3 148.7L87.7 147.9L88.1 147.1L88.5 146.3L88.9 145.6L89.3 144.8L89.7 144L90.1 143.2L90.4 142.4L90.8 141.7L91.2 140.9L91.6 140.1L92 139.3L92.4 138.6L92.8 137.8L93.2 137L93.6 136.2L93.9 135.4L94.3 134.7L94.7 133.9L95.1 133.1L95.5 132.3L95.9 131.6L96.3 130.8L96.7 130L97.1 129.2L97.4 128.4L97.8 127.7L98.2 126.9L98.6 126.1L99 125.3L99.4 124.6L99.8 123.8L100.2 123L100.6 122.2L100.9 121.4L101.3 120.7L101.7 119.9L102.1 119.1L102.5 118.3L102.9 117.6L103.3 116.8L103.7 116L104.1 115.2L104.4 114.4L104.8 113.7L105.2 112.9L105.6 112.1L106 111.3L106.4 110.6L106.8 109.8L107.2 109L107.6 108.2L107.9 107.4L108.3 106.7L108.7 105.9L109.1 105.1L109.5 104.3L109.9 103.6L110.3 102.8L110.7 102L111.1 101.2L111.4 100.4L111.8 99.7L112.2 98.9L112.6 98.1L113 97.3L113.4 96.6L113.8 95.8L114.2 95L114.6 94.2L114.9 93.4L115.3 92.7L115.7 91.9L116.1 91.1L116.5 90.3L116.9 89.6L117.3 88.8L117.7 88L118.1 87.2L118.4 86.4L118.8 85.7L119.2 84.9L119.6 84.1L120 83.3L120.4 82.6L120.8 81.8L121.2 81L121.6 80.2L121.9 79.4L122.3 78.7L122.7 77.9L123.1 77.1L123.5 76.3L123.9 75.6L124.3 74.8L124.7 74L125.1 73.2L125.4 72.4L125.8 71.7L126.2 70.9L126.6 70.1L127 69.3L127.4 68.6L127.8 67.8L128.2 67L128.6 66.2L128.9 65.4L129.3 64.7L129.7 63.9L130.1 63.1L130.5 62.3L130.9 61.6L131.3 60.8L131.7 60L132.1 59.2L132.4 58.4L132.8 57.7L133.2 56.9L133.6 56.1L134 55.3L134.4 54.6L134.8 53.8L135.2 53L135.6 52.2L135.9 51.4L136.3 50.7L136.7 49.9L137.1 49.1L137.5 48.3L137.9 47.6L138.3 46.8L138.7 46L139.1 45.2L139.4 44.4L139.8 43.7L140.2 42.9L140.6 42.1L141 41.3L141.4 40.6L141.8 39.8L142.2 39L142.6 38.2L142.9 37.4L143.3 36.7" stroke-width="2.2"/><text x="146" y="38.2" fill="currentColor" stroke="none" text-anchor="start" font-style="italic">y = 2x</text><path d="M103.3 36.7L104.1 37.4L104.9 38.2L105.7 39L106.4 39.8L107.2 40.6L108 41.3L108.8 42.1L109.6 42.9L110.3 43.7L111.1 44.4L111.9 45.2L112.7 46L113.4 46.8L114.2 47.6L115 48.3L115.8 49.1L116.6 49.9L117.3 50.7L118.1 51.4L118.9 52.2L119.7 53L120.4 53.8L121.2 54.6L122 55.3L122.8 56.1L123.6 56.9L124.3 57.7L125.1 58.4L125.9 59.2L126.7 60L127.4 60.8L128.2 61.6L129 62.3L129.8 63.1L130.6 63.9L131.3 64.7L132.1 65.4L132.9 66.2L133.7 67L134.4 67.8L135.2 68.6L136 69.3L136.8 70.1L137.6 70.9L138.3 71.7L139.1 72.4L139.9 73.2L140.7 74L141.4 74.8L142.2 75.6L143 76.3L143.8 77.1L144.6 77.9L145.3 78.7L146.1 79.4L146.9 80.2L147.7 81L148.4 81.8L149.2 82.6L150 83.3L150.8 84.1L151.6 84.9L152.3 85.7L153.1 86.4L153.9 87.2L154.7 88L155.4 88.8L156.2 89.6L157 90.3L157.8 91.1L158.6 91.9L159.3 92.7L160.1 93.4L160.9 94.2L161.7 95L162.4 95.8L163.2 96.6L164 97.3L164.8 98.1L165.6 98.9L166.3 99.7L167.1 100.4L167.9 101.2L168.7 102L169.4 102.8L170.2 103.6L171 104.3L171.8 105.1L172.6 105.9L173.3 106.7L174.1 107.4L174.9 108.2L175.7 109L176.4 109.8L177.2 110.6L178 111.3L178.8 112.1L179.6 112.9L180.3 113.7L181.1 114.4L181.9 115.2L182.7 116L183.4 116.8L184.2 117.6L185 118.3L185.8 119.1L186.6 119.9L187.3 120.7L188.1 121.4L188.9 122.2L189.7 123L190.4 123.8L191.2 124.6L192 125.3L192.8 126.1L193.6 126.9L194.3 127.7L195.1 128.4L195.9 129.2L196.7 130L197.4 130.8L198.2 131.6L199 132.3L199.8 133.1L200.6 133.9L201.3 134.7L202.1 135.4L202.9 136.2L203.7 137L204.4 137.8L205.2 138.6L206 139.3L206.8 140.1L207.6 140.9L208.3 141.7L209.1 142.4L209.9 143.2L210.7 144L211.4 144.8L212.2 145.6L213 146.3L213.8 147.1L214.6 147.9L215.3 148.7L216.1 149.4L216.9 150.2L217.7 151L218.4 151.8L219.2 152.6L220 153.3L220.8 154.1L221.6 154.9L222.3 155.7L223.1 156.4L223.9 157.2L224.7 158L225.4 158.8L226.2 159.6L227 160.3L227.8 161.1L228.6 161.9L229.3 162.7L230.1 163.4L230.9 164.2L231.7 165L232.4 165.8L233.2 166.6L234 167.3L234.8 168.1L235.6 168.9L236.3 169.7L237.1 170.4L237.9 171.2L238.7 172L239.4 172.8L240.2 173.6L241 174.3L241.8 175.1L242.6 175.9L243.3 176.7L244.1 177.4L244.9 178.2L245.7 179L246.4 179.8L247.2 180.6L248 181.3L248.8 182.1L249.6 182.9L250.3 183.7L251.1 184.4L251.9 185.2L252.7 186L253.4 186.8L254.2 187.6L255 188.3L255.8 189.1L256.6 189.9L257.3 190.7L258.1 191.4L258.9 192.2L259.7 193L260.4 193.8L261.2 194.6L262 195.3L262.8 196.1L263.6 196.9L264.3 197.7L265.1 198.4L265.9 199.2L266.7 200L267.4 200.8L268.2 201.6L269 202.3L269.8 203.1L270.6 203.9L271.3 204.7L272.1 205.4L272.9 206.2L273.7 207L274.4 207.8L275.2 208.6L276 209.3L276.8 210.1L277.6 210.9L278.3 211.7L279.1 212.4L279.9 213.2L280.7 214L281.4 214.8L282.2 215.6L283 216.3L283.8 217.1L284.6 217.9L285.3 218.7L286.1 219.4L286.9 220.2L287.7 221L288.4 221.8L289.2 222.6L290 223.3" stroke-width="2.2"/><text x="209.3" y="131.6" fill="currentColor" stroke="none" text-anchor="start" font-style="italic">y = -x+6</text><polygon points="63.3,196.7 130,63.3 263.3,196.7" fill="currentColor" fill-opacity="0.12"/><circle cx="130" cy="63.3" r="3" fill="currentColor" stroke="none"/><text x="130" y="54.2" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><circle cx="263.3" cy="196.7" r="3" fill="currentColor" stroke="none"/><text x="273.8" y="191.1" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text></svg>', true),
  -- mat-14-006 · şekilli · doğrulandı
  ('7702991a-421f-5e79-96ea-1b1c0a880a19'::uuid, 'Matematik & Geometri', 'Analitik Geometri ve Katı Cisimler', 'multiple_choice', 1,
   'Şekildeki küpün tüm ayrıtlarının uzunlukları toplamı $48$ cm''dir.
Buna göre bu küpün hacmi kaç cm³''tür?',
   '{"options":["27","48","96","64","125"],"correctIndex":3}'::jsonb,
   'Bir küpün birbirine eşit $12$ tane ayrıtı vardır. Bir ayrıt uzunluğuna $a$ denirse $12a = 48 \Rightarrow a = 4$ cm bulunur. Küpün hacmi $a^3 = 4^3 = 64$ cm³ olur.',
   'C şıkkı (96), bir ayrıtı $4$ cm bulduktan sonra hacim ($a^3 = 64$) yerine yüzey alanını ($6a^2 = 96$) hesaplayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 270 260" width="270" height="260" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><line x1="30" y1="230" x2="180" y2="230"/><text x="105" y="246.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">a</text><line x1="180" y1="230" x2="180" y2="80"/><line x1="180" y1="80" x2="30" y2="80"/><line x1="30" y1="80" x2="30" y2="230"/><line x1="30" y1="80" x2="90" y2="30"/><line x1="90" y1="30" x2="240" y2="30"/><line x1="240" y1="30" x2="180" y2="80"/><line x1="180" y1="230" x2="240" y2="180"/><line x1="240" y1="180" x2="240" y2="30"/><line x1="30" y1="230" x2="90" y2="180" stroke-dasharray="6 5"/><line x1="90" y1="180" x2="240" y2="180" stroke-dasharray="6 5"/><line x1="90" y1="180" x2="90" y2="30" stroke-dasharray="6 5"/></svg>', true),
  -- mat-14-007 · şekilli · doğrulandı
  ('149fd090-438c-52e7-8cbf-4f02cf677f19'::uuid, 'Matematik & Geometri', 'Analitik Geometri ve Katı Cisimler', 'multiple_choice', 2,
   'Şekildeki dikdörtgenler prizmasının ayrıt uzunlukları $3$ cm, $4$ cm ve $12$ cm''dir.
Buna göre prizmanın en uzak iki köşesini birleştiren $|AG|$ cisim köşegeni kaç cm''dir?',
   '{"options":["5","13","15","17","19"],"correctIndex":1}'::jsonb,
   'Ayrıtları $a$, $b$, $c$ olan bir dikdörtgenler prizmasının cisim köşegen uzunluğu $\sqrt{a^2 + b^2 + c^2}$ formülüyle bulunur. Verilen ayrıtlarla $|AG| = \sqrt{12^2 + 4^2 + 3^2} = \sqrt{144 + 16 + 9} = \sqrt{169} = 13$ cm elde edilir.',
   'E şıkkı (19), köşegeni hesaplamak yerine üç ayrıtın toplamını ($12 + 4 + 3 = 19$) işaretleyen; A şıkkı (5) ise yalnızca taban yüzeyi ($3$ ve $4$) üzerinden yüzey köşegeni bulan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 340 215.1" width="340" height="215.1" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><line x1="30" y1="185.1" x2="245.4" y2="185.1"/><text x="137.7" y="201.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">12</text><line x1="245.4" y1="185.1" x2="245.4" y2="77.4"/><line x1="245.4" y1="77.4" x2="30" y2="77.4"/><line x1="30" y1="77.4" x2="30" y2="185.1"/><text x="16.1" y="135.8" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">3</text><line x1="30" y1="77.4" x2="94.6" y2="30"/><line x1="94.6" y1="30" x2="310" y2="30"/><line x1="310" y1="30" x2="245.4" y2="77.4"/><line x1="245.4" y1="185.1" x2="310" y2="137.7"/><text x="285.4" y="176.5" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">4</text><line x1="310" y1="137.7" x2="310" y2="30"/><line x1="30" y1="185.1" x2="94.6" y2="137.7" stroke-dasharray="6 5"/><line x1="94.6" y1="137.7" x2="310" y2="137.7" stroke-dasharray="6 5"/><line x1="94.6" y1="137.7" x2="94.6" y2="30" stroke-dasharray="6 5"/><line x1="30" y1="185.1" x2="310" y2="30" stroke-dasharray="6 5"/><text x="19.5" y="200.5" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="320.5" y="24.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">G</text></svg>', true),
  -- mat-14-008 · doğrulandı
  ('7525976b-b432-5420-a945-f36005653aac'::uuid, 'Matematik & Geometri', 'Analitik Geometri ve Katı Cisimler', 'multiple_choice', 2,
   'Taban ayrıtları $6$ cm ve $8$ cm, yüksekliği $10$ cm olan dikdörtgenler prizması biçimindeki boş bir kaba $240$ cm³ su konuluyor.
Buna göre kaptaki suyun yüksekliği kaç cm olur?',
   '{"options":["5","4","6","8","10"],"correctIndex":0}'::jsonb,
   'Dikdörtgenler prizması şeklindeki bir kapta suyun hacmi $\text{Taban alanı} \cdot \text{Su yüksekliği}$ formülüyle hesaplanır. Taban alanı $6 \cdot 8 = 48$ cm² olduğundan su yüksekliği $h$ için $48 \cdot h = 240 \Rightarrow h = \dfrac{240}{48} = 5$ cm bulunur. (Kap $10$ cm yüksekliğinde olduğundan su taşmaz.)',
   'B şıkkı (4), $240$''ı $6 \cdot 8 = 48$ yerine $6 \cdot 10 = 60$''a bölerek kabın yüksekliğini taban kenarı gibi kullanan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-14-009 · doğrulandı
  ('74a4656f-9f87-5690-93ab-1964eff58860'::uuid, 'Matematik & Geometri', 'Analitik Geometri ve Katı Cisimler', 'multiple_choice', 2,
   'Kenar uzunlukları $4$ cm ve $6$ cm olan bir dikdörtgen, önce $4$ cm''lik kenarı etrafında $360^\circ$ döndürülerek $V_1$ hacimli silindir, ardından $6$ cm''lik kenarı etrafında $360^\circ$ döndürülerek $V_2$ hacimli silindir elde ediliyor.
Buna göre $\dfrac{V_1}{V_2}$ oranı kaçtır?',
   '{"options":["$\\dfrac{2}{3}$","$\\dfrac{4}{9}$","$1$","$\\dfrac{3}{2}$","$\\dfrac{9}{4}$"],"correctIndex":3}'::jsonb,
   'Bir dikdörtgen hangi kenarı etrafında döndürülürse o kenar silindirin yüksekliği ($h$), diğer kenar ise taban yarıçapı ($r$) olur:
- $4$ cm''lik kenar etrafında ($h = 4, r = 6$): $V_1 = \pi \cdot 6^2 \cdot 4 = 144\pi$.
- $6$ cm''lik kenar etrafında ($h = 6, r = 4$): $V_2 = \pi \cdot 4^2 \cdot 6 = 96\pi$.
Hacimler oranı $\dfrac{V_1}{V_2} = \dfrac{144\pi}{96\pi} = \dfrac{3}{2}$ bulunur.',
   'A şıkkı ($\frac{2}{3}$) veya C şıkkı ($1$), iki farklı kenar etrafında döndürmenin aynı hacmi vereceğini sanan ya da yarıçap ile yüksekliği ters atayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-14-010 · doğrulandı
  ('3843c282-a43b-5c2e-9f91-9bfe79801848'::uuid, 'Matematik & Geometri', 'Analitik Geometri ve Katı Cisimler', 'multiple_choice', 3,
   'Taban yarıçapı $4$ cm ve yüksekliği $12$ cm olan dik dairesel silindir biçimindeki ağzına kadar su ile dolu kaptaki suyun tamamı, taban yarıçapı $8$ cm olan daha geniş boş bir dik dairesel silindire boşaltılıyor.
Buna göre ikinci kaptaki suyun yüksekliği kaç cm olur?',
   '{"options":["2","4","6","8","3"],"correctIndex":4}'::jsonb,
   'Aktarılan suyun hacmi değişmez. İlk kaptaki suyun hacmi $V = \pi \cdot 4^2 \cdot 12 = 192\pi$ cm³''tür. İkinci kapta taban yarıçapı $8$ cm ve su yüksekliği $h$ olursa $\pi \cdot 8^2 \cdot h = 192\pi \Rightarrow 64h = 192 \Rightarrow h = 3$ cm bulunur. (Yarıçap $2$ katına çıktığında taban alanı $4$ katına çıkar ve yükseklik dörtte birine iner.)',
   'C şıkkı (6), taban yarıçapı $4$''ten $8$''e yani $2$ katına çıktığı için su yüksekliğinin yarıya ($12 \div 2 = 6$) düşeceğini sanan adayı yakalar. Silindir hacminde yarıçapın karesi etkili olduğu için yükseklik $4$ kat azalır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-14-011 · doğrulandı
  ('d85bf144-37f0-5652-91fc-19a24f9fa758'::uuid, 'Matematik & Geometri', 'Analitik Geometri ve Katı Cisimler', 'multiple_choice', 1,
   'Dik koordinat düzleminde uç noktaları $A(-3, 7)$ ve $B(9, -1)$ olan $[AB]$ doğru parçasının orta noktası $M(a, b)$''dir.
Buna göre $a \cdot b$ çarpımı kaçtır?',
   '{"options":["6","9","12","15","18"],"correctIndex":1}'::jsonb,
   'Orta nokta koordinatları uç noktaların koordinatlarının aritmetik ortalamasıdır:
$a = \dfrac{-3 + 9}{2} = \dfrac{6}{2} = 3$ ve
$b = \dfrac{7 + (-1)}{2} = \dfrac{6}{2} = 3$.
Çarpım $a \cdot b = 3 \cdot 3 = 9$ bulunur.',
   'C şıkkı (12) veya E şıkkı (18), orta nokta formülünde toplamak yerine çıkarma ($7 - (-1) = 8 \Rightarrow 4$) veya $2$''ye bölmeyi unutan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-14-012 · doğrulandı
  ('beeaae7d-045f-5d60-b81c-dfa8e1114c8e'::uuid, 'Matematik & Geometri', 'Analitik Geometri ve Katı Cisimler', 'multiple_choice', 1,
   'Dik koordinat düzleminde $A(2, -1)$ ve $B(6, 7)$ noktalarından geçen doğrunun eğimi kaçtır?',
   '{"options":["$\\dfrac{1}{2}$","$1$","$\\dfrac{3}{2}$","$2$","$4$"],"correctIndex":3}'::jsonb,
   'İki noktadan geçen doğrunun eğimi $m = \dfrac{y_2 - y_1}{x_2 - x_1}$ formülüyle bulunur:
$m = \dfrac{7 - (-1)}{6 - 2} = \dfrac{8}{4} = 2$ bulunur.',
   'C şıkkı ($\frac{3}{2}$), paydaki $7 - (-1)$ çıkarmasında eksi işaretini unutup $7 - 1 = 6$ yazan ($\dfrac{6}{4} = \dfrac{3}{2}$) adayı; A şıkkı ($\frac{1}{2}$) ise $x$ ve $y$ farklarını ters oranlayanları yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-14-013 · şekilli · doğrulandı
  ('74a79a29-0c8c-589d-8e97-0c15da602a74'::uuid, 'Matematik & Geometri', 'Analitik Geometri ve Katı Cisimler', 'multiple_choice', 2,
   'Şekildeki dik koordinat düzleminde $d_1$ doğrusunun denklemi $y = 2x + 4$''tür.
$C(3, 1)$ noktasından geçen ve $d_1$ doğrusuna paralel olan $d_2$ doğrusunun $y$-eksenini kestiği noktanın ordinatı kaçtır?',
   '{"options":["$-5$","$-3$","$-2$","$5$","$7$"],"correctIndex":0}'::jsonb,
   'Paralel doğruların eğimleri eşittir; $d_1$''in eğimi $m_1 = 2$ olduğundan $d_2$''nin eğimi de $m_2 = 2$''dir. Eğimi $2$ olan ve $C(3, 1)$ noktasından geçen doğrunun denklemi $y - 1 = 2(x - 3) \Rightarrow y = 2x - 5$ bulunur. Doğrunun $y$-eksenini kestiği nokta için $x = 0$ yazılırsa $y = -5$ elde edilir.',
   'D şıkkı (5), denklem kurarken $y - 1 = 2(x - 3)$ ifadesinde işaret hatası yapan adayı; B şıkkı ($-3$) ise $y = 2x + n$ denkleminde $x$ ve $y$''nin yerini karıştıranları yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 220 300" width="220" height="300" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><g stroke-width="0.6" stroke-opacity="0.25"><line x1="50" y1="270" x2="50" y2="30"/><line x1="90" y1="270" x2="90" y2="30"/><line x1="130" y1="270" x2="130" y2="30"/><line x1="170" y1="270" x2="170" y2="30"/><line x1="30" y1="270" x2="190" y2="270"/><line x1="30" y1="230" x2="190" y2="230"/><line x1="30" y1="190" x2="190" y2="190"/><line x1="30" y1="150" x2="190" y2="150"/><line x1="30" y1="110" x2="190" y2="110"/><line x1="30" y1="70" x2="190" y2="70"/><line x1="30" y1="30" x2="190" y2="30"/></g><line x1="24" y1="150" x2="200" y2="150"/><line x1="90" y1="276" x2="90" y2="20"/><path d="M200 150 l-7 -4 m7 4 l-7 4"/><path d="M90 20 l-4 7 m4 -7 l4 7"/><text x="204" y="166.9" fill="currentColor" stroke="none" text-anchor="end" font-style="italic">x</text><text x="102" y="22.9" fill="currentColor" stroke="none" text-anchor="start" font-style="italic">y</text><g stroke-width="1.2"><line x1="50" y1="147" x2="50" y2="153"/><text x="50" y="167.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">-2</text><line x1="130" y1="147" x2="130" y2="153"/><text x="130" y="167.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">2</text><line x1="170" y1="147" x2="170" y2="153"/><text x="170" y="167.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">4</text><line x1="87" y1="270" x2="93" y2="270"/><text x="84" y="273.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">-6</text><line x1="87" y1="230" x2="93" y2="230"/><text x="84" y="233.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">-4</text><line x1="87" y1="190" x2="93" y2="190"/><text x="84" y="193.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">-2</text><line x1="87" y1="110" x2="93" y2="110"/><text x="84" y="113.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">2</text><line x1="87" y1="70" x2="93" y2="70"/><text x="84" y="73.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">4</text><line x1="87" y1="30" x2="93" y2="30"/><text x="84" y="33.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">6</text><text x="82" y="165.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">O</text></g><path d="M30 190L30.3 189.3L30.7 188.7L31 188L31.3 187.3L31.7 186.7L32 186L32.3 185.3L32.7 184.7L33 184L33.3 183.3L33.7 182.7L34 182L34.3 181.3L34.7 180.7L35 180L35.3 179.3L35.7 178.7L36 178L36.3 177.3L36.7 176.7L37 176L37.3 175.3L37.7 174.7L38 174L38.3 173.3L38.7 172.7L39 172L39.3 171.3L39.7 170.7L40 170L40.3 169.3L40.7 168.7L41 168L41.3 167.3L41.7 166.7L42 166L42.3 165.3L42.7 164.7L43 164L43.3 163.3L43.7 162.7L44 162L44.3 161.3L44.7 160.7L45 160L45.3 159.3L45.7 158.7L46 158L46.3 157.3L46.7 156.7L47 156L47.3 155.3L47.7 154.7L48 154L48.3 153.3L48.7 152.7L49 152L49.3 151.3L49.7 150.7L50 150L50.3 149.3L50.7 148.7L51 148L51.3 147.3L51.7 146.7L52 146L52.3 145.3L52.7 144.7L53 144L53.3 143.3L53.7 142.7L54 142L54.3 141.3L54.7 140.7L55 140L55.3 139.3L55.7 138.7L56 138L56.3 137.3L56.7 136.7L57 136L57.3 135.3L57.7 134.7L58 134L58.3 133.3L58.7 132.7L59 132L59.3 131.3L59.7 130.7L60 130L60.3 129.3L60.7 128.7L61 128L61.3 127.3L61.7 126.7L62 126L62.3 125.3L62.7 124.7L63 124L63.3 123.3L63.7 122.7L64 122L64.3 121.3L64.7 120.7L65 120L65.3 119.3L65.7 118.7L66 118L66.3 117.3L66.7 116.7L67 116L67.3 115.3L67.7 114.7L68 114L68.3 113.3L68.7 112.7L69 112L69.3 111.3L69.7 110.7L70 110L70.3 109.3L70.7 108.7L71 108L71.3 107.3L71.7 106.7L72 106L72.3 105.3L72.7 104.7L73 104L73.3 103.3L73.7 102.7L74 102L74.3 101.3L74.7 100.7L75 100L75.3 99.3L75.7 98.7L76 98L76.3 97.3L76.7 96.7L77 96L77.3 95.3L77.7 94.7L78 94L78.3 93.3L78.7 92.7L79 92L79.3 91.3L79.7 90.7L80 90L80.3 89.3L80.7 88.7L81 88L81.3 87.3L81.7 86.7L82 86L82.3 85.3L82.7 84.7L83 84L83.3 83.3L83.7 82.7L84 82L84.3 81.3L84.7 80.7L85 80L85.3 79.3L85.7 78.7L86 78L86.3 77.3L86.7 76.7L87 76L87.3 75.3L87.7 74.7L88 74L88.3 73.3L88.7 72.7L89 72L89.3 71.3L89.7 70.7L90 70L90.3 69.3L90.7 68.7L91 68L91.3 67.3L91.7 66.7L92 66L92.3 65.3L92.7 64.7L93 64L93.3 63.3L93.7 62.7L94 62L94.3 61.3L94.7 60.7L95 60L95.3 59.3L95.7 58.7L96 58L96.3 57.3L96.7 56.7L97 56L97.3 55.3L97.7 54.7L98 54L98.3 53.3L98.7 52.7L99 52L99.3 51.3L99.7 50.7L100 50L100.3 49.3L100.7 48.7L101 48L101.3 47.3L101.7 46.7L102 46L102.3 45.3L102.7 44.7L103 44L103.3 43.3L103.7 42.7L104 42L104.3 41.3L104.7 40.7L105 40L105.3 39.3L105.7 38.7L106 38L106.3 37.3L106.7 36.7L107 36L107.3 35.3L107.7 34.7L108 34L108.3 33.3L108.7 32.7L109 32L109.3 31.3L109.7 30.7L110 30" stroke-width="2.2"/><text x="114" y="28.9" fill="currentColor" stroke="none" text-anchor="start" font-style="italic">d₁</text><path d="M80 270L80.4 269.1L80.9 268.2L81.3 267.4L81.8 266.5L82.2 265.6L82.7 264.7L83.1 263.8L83.5 262.9L84 262L84.4 261.2L84.9 260.3L85.3 259.4L85.7 258.5L86.2 257.6L86.6 256.8L87.1 255.9L87.5 255L88 254.1L88.4 253.2L88.8 252.3L89.3 251.5L89.7 250.6L90.2 249.7L90.6 248.8L91 247.9L91.5 247L91.9 246.2L92.4 245.3L92.8 244.4L93.3 243.5L93.7 242.6L94.1 241.7L94.6 240.9L95 240L95.5 239.1L95.9 238.2L96.3 237.3L96.8 236.4L97.2 235.6L97.7 234.7L98.1 233.8L98.6 232.9L99 232L99.4 231.1L99.9 230.3L100.3 229.4L100.8 228.5L101.2 227.6L101.6 226.7L102.1 225.8L102.5 225L103 224.1L103.4 223.2L103.9 222.3L104.3 221.4L104.7 220.5L105.2 219.7L105.6 218.8L106.1 217.9L106.5 217L106.9 216.1L107.4 215.2L107.8 214.4L108.3 213.5L108.7 212.6L109.2 211.7L109.6 210.8L110 209.9L110.5 209.1L110.9 208.2L111.4 207.3L111.8 206.4L112.2 205.5L112.7 204.6L113.1 203.8L113.6 202.9L114 202L114.5 201.1L114.9 200.2L115.3 199.3L115.8 198.5L116.2 197.6L116.7 196.7L117.1 195.8L117.5 194.9L118 194L118.4 193.2L118.9 192.3L119.3 191.4L119.8 190.5L120.2 189.6L120.6 188.7L121.1 187.9L121.5 187L122 186.1L122.4 185.2L122.8 184.3L123.3 183.4L123.7 182.6L124.2 181.7L124.6 180.8L125 179.9L125.5 179L125.9 178.1L126.4 177.3L126.8 176.4L127.3 175.5L127.7 174.6L128.1 173.7L128.6 172.8L129 172L129.5 171.1L129.9 170.2L130.4 169.3L130.8 168.4L131.2 167.5L131.7 166.6L132.1 165.8L132.6 164.9L133 164L133.4 163.1L133.9 162.2L134.3 161.4L134.8 160.5L135.2 159.6L135.6 158.7L136.1 157.8L136.5 156.9L137 156.1L137.4 155.2L137.9 154.3L138.3 153.4L138.7 152.5L139.2 151.6L139.6 150.8L140.1 149.9L140.5 149L141 148.1L141.4 147.2L141.8 146.3L142.3 145.5L142.7 144.6L143.2 143.7L143.6 142.8L144 141.9L144.5 141L144.9 140.1L145.4 139.3L145.8 138.4L146.3 137.5L146.7 136.6L147.1 135.7L147.6 134.9L148 134L148.5 133.1L148.9 132.2L149.3 131.3L149.8 130.4L150.2 129.6L150.7 128.7L151.1 127.8L151.6 126.9L152 126L152.4 125.1L152.9 124.3L153.3 123.4L153.8 122.5L154.2 121.6L154.6 120.7L155.1 119.8L155.5 119L156 118.1L156.4 117.2L156.9 116.3L157.3 115.4L157.7 114.5L158.2 113.7L158.6 112.8L159.1 111.9L159.5 111L159.9 110.1L160.4 109.2L160.8 108.4L161.3 107.5L161.7 106.6L162.2 105.7L162.6 104.8L163 103.9L163.5 103.1L163.9 102.2L164.4 101.3L164.8 100.4L165.2 99.5L165.7 98.6L166.1 97.7L166.6 96.9L167 96L167.5 95.1L167.9 94.2L168.3 93.3L168.8 92.5L169.2 91.6L169.7 90.7L170.1 89.8L170.5 88.9L171 88L171.4 87.2L171.9 86.3L172.3 85.4L172.8 84.5L173.2 83.6L173.6 82.7L174.1 81.9L174.5 81L175 80.1L175.4 79.2L175.8 78.3L176.3 77.4L176.7 76.5L177.2 75.7L177.6 74.8L178.1 73.9L178.5 73L178.9 72.1L179.4 71.3L179.8 70.4L180.3 69.5L180.7 68.6L181.1 67.7L181.6 66.8L182 66L182.5 65.1L182.9 64.2L183.4 63.3L183.8 62.4L184.2 61.5L184.7 60.7L185.1 59.8L185.6 58.9L186 58" stroke-width="2.2"/><text x="180" y="76.9" fill="currentColor" stroke="none" text-anchor="start" font-style="italic">d₂</text><circle cx="150" cy="130" r="3" fill="currentColor" stroke="none"/><text x="160.5" y="145.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text></svg>', true),
  -- mat-14-014 · doğrulandı
  ('86c5a90c-7380-54fa-9b45-5fcc4bd7df5f'::uuid, 'Matematik & Geometri', 'Analitik Geometri ve Katı Cisimler', 'multiple_choice', 2,
   'Dik koordinat düzleminde $A(2, 3)$, $B(5, 9)$ ve $C(8, k)$ noktaları doğrusal olduğuna göre $k$ değeri kaçtır?',
   '{"options":["11","12","15","16","18"],"correctIndex":2}'::jsonb,
   'Üç nokta aynı doğru üzerindeyse ikişerli eğimleri eşittir: $m_{AB} = m_{BC}$.
$m_{AB} = \dfrac{9 - 3}{5 - 2} = \dfrac{6}{3} = 2$ ve $m_{BC} = \dfrac{k - 9}{8 - 5} = \dfrac{k - 9}{3}$.
Eşitlenirse $\dfrac{k - 9}{3} = 2 \Rightarrow k - 9 = 6 \Rightarrow k = 15$ bulunur.',
   'B şıkkı (12), $x$''teki artışa ($8 - 5 = 3$) eğimi çarpmak yerine doğrudan $3$ ekleyip $9 + 3 = 12$ bulan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-14-015 · şekilli · doğrulandı
  ('c3a95cbf-bb3e-5ba9-86f8-0d557d86b588'::uuid, 'Matematik & Geometri', 'Analitik Geometri ve Katı Cisimler', 'multiple_choice', 2,
   'Şekildeki dik koordinat düzleminde $x + y = 6$ ve $x + y = 2$ doğruları ile koordinat eksenleri arasında kalan taralı bölgenin alanı kaç birimkaredir?',
   '{"options":["8","12","14","18","16"],"correctIndex":4}'::jsonb,
   'Büyük $x + y = 6$ doğrusunun eksenlerle oluşturduğu dik üçgenin dik kenarları $6$ birim olup alanı $\dfrac{6 \cdot 6}{2} = 18$ birimkaredir. Küçük $x + y = 2$ doğrusunun eksenlerle oluşturduğu dik üçgenin dik kenarları $2$ birim olup alanı $\dfrac{2 \cdot 2}{2} = 2$ birimkaredir. İki doğru arasındaki taralı yamuğun alanı $18 - 2 = 16$ birimkare bulunur.',
   'B şıkkı (12) veya D şıkkı (18), büyük üçgenin alanından ($18$) küçük üçgeni çıkarmayı unutan ya da $(6 - 2) \cdot (6 - 2) \div 2 = 8$ alan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 260 260" width="260" height="260" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><g stroke-width="0.6" stroke-opacity="0.25"><line x1="30" y1="230" x2="30" y2="30"/><line x1="55" y1="230" x2="55" y2="30"/><line x1="80" y1="230" x2="80" y2="30"/><line x1="105" y1="230" x2="105" y2="30"/><line x1="130" y1="230" x2="130" y2="30"/><line x1="155" y1="230" x2="155" y2="30"/><line x1="180" y1="230" x2="180" y2="30"/><line x1="205" y1="230" x2="205" y2="30"/><line x1="230" y1="230" x2="230" y2="30"/><line x1="30" y1="230" x2="230" y2="230"/><line x1="30" y1="205" x2="230" y2="205"/><line x1="30" y1="180" x2="230" y2="180"/><line x1="30" y1="155" x2="230" y2="155"/><line x1="30" y1="130" x2="230" y2="130"/><line x1="30" y1="105" x2="230" y2="105"/><line x1="30" y1="80" x2="230" y2="80"/><line x1="30" y1="55" x2="230" y2="55"/><line x1="30" y1="30" x2="230" y2="30"/></g><line x1="24" y1="205" x2="240" y2="205"/><line x1="55" y1="236" x2="55" y2="20"/><path d="M240 205 l-7 -4 m7 4 l-7 4"/><path d="M55 20 l-4 7 m4 -7 l4 7"/><text x="244" y="221.9" fill="currentColor" stroke="none" text-anchor="end" font-style="italic">x</text><text x="67" y="22.9" fill="currentColor" stroke="none" text-anchor="start" font-style="italic">y</text><g stroke-width="1.2"><line x1="30" y1="202" x2="30" y2="208"/><text x="30" y="222.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">-1</text><line x1="80" y1="202" x2="80" y2="208"/><text x="80" y="222.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">1</text><line x1="105" y1="202" x2="105" y2="208"/><text x="105" y="222.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">2</text><line x1="130" y1="202" x2="130" y2="208"/><text x="130" y="222.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">3</text><line x1="155" y1="202" x2="155" y2="208"/><text x="155" y="222.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">4</text><line x1="180" y1="202" x2="180" y2="208"/><text x="180" y="222.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">5</text><line x1="205" y1="202" x2="205" y2="208"/><text x="205" y="222.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">6</text><line x1="230" y1="202" x2="230" y2="208"/><text x="230" y="222.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">7</text><line x1="52" y1="230" x2="58" y2="230"/><text x="49" y="233.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">-1</text><line x1="52" y1="180" x2="58" y2="180"/><text x="49" y="183.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">1</text><line x1="52" y1="155" x2="58" y2="155"/><text x="49" y="158.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">2</text><line x1="52" y1="130" x2="58" y2="130"/><text x="49" y="133.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">3</text><line x1="52" y1="105" x2="58" y2="105"/><text x="49" y="108.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">4</text><line x1="52" y1="80" x2="58" y2="80"/><text x="49" y="83.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">5</text><line x1="52" y1="55" x2="58" y2="55"/><text x="49" y="58.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">6</text><line x1="52" y1="30" x2="58" y2="30"/><text x="49" y="33.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">7</text><text x="47" y="220.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">O</text></g><path d="M42.5 42.5L43.2 43.2L44 44L44.7 44.7L45.4 45.4L46.1 46.1L46.9 46.9L47.6 47.6L48.3 48.3L49.1 49.1L49.8 49.8L50.5 50.5L51.3 51.2L52 52L52.7 52.7L53.4 53.4L54.2 54.2L54.9 54.9L55.6 55.6L56.4 56.4L57.1 57.1L57.8 57.8L58.5 58.5L59.3 59.3L60 60L60.7 60.7L61.5 61.5L62.2 62.2L62.9 62.9L63.6 63.6L64.4 64.4L65.1 65.1L65.8 65.8L66.6 66.6L67.3 67.3L68 68L68.8 68.8L69.5 69.5L70.2 70.2L70.9 70.9L71.7 71.7L72.4 72.4L73.1 73.1L73.9 73.9L74.6 74.6L75.3 75.3L76 76L76.8 76.8L77.5 77.5L78.2 78.2L79 79L79.7 79.7L80.4 80.4L81.1 81.1L81.9 81.9L82.6 82.6L83.3 83.3L84.1 84.1L84.8 84.8L85.5 85.5L86.3 86.3L87 87L87.7 87.7L88.4 88.4L89.2 89.2L89.9 89.9L90.6 90.6L91.4 91.4L92.1 92.1L92.8 92.8L93.5 93.5L94.3 94.3L95 95L95.7 95.7L96.5 96.5L97.2 97.2L97.9 97.9L98.6 98.6L99.4 99.4L100.1 100.1L100.8 100.8L101.6 101.6L102.3 102.3L103 103L103.8 103.8L104.5 104.5L105.2 105.2L105.9 105.9L106.7 106.7L107.4 107.4L108.1 108.1L108.9 108.9L109.6 109.6L110.3 110.3L111 111L111.8 111.8L112.5 112.5L113.2 113.2L114 114L114.7 114.7L115.4 115.4L116.1 116.1L116.9 116.9L117.6 117.6L118.3 118.3L119.1 119.1L119.8 119.8L120.5 120.5L121.3 121.3L122 122L122.7 122.7L123.4 123.4L124.2 124.2L124.9 124.9L125.6 125.6L126.4 126.4L127.1 127.1L127.8 127.8L128.5 128.5L129.3 129.3L130 130L130.7 130.7L131.5 131.5L132.2 132.2L132.9 132.9L133.6 133.6L134.4 134.4L135.1 135.1L135.8 135.8L136.6 136.6L137.3 137.3L138 138L138.8 138.8L139.5 139.5L140.2 140.2L140.9 140.9L141.7 141.7L142.4 142.4L143.1 143.1L143.9 143.9L144.6 144.6L145.3 145.3L146 146L146.8 146.8L147.5 147.5L148.2 148.2L149 149L149.7 149.7L150.4 150.4L151.1 151.1L151.9 151.9L152.6 152.6L153.3 153.3L154.1 154.1L154.8 154.8L155.5 155.5L156.3 156.3L157 157L157.7 157.7L158.4 158.4L159.2 159.2L159.9 159.9L160.6 160.6L161.4 161.4L162.1 162.1L162.8 162.8L163.5 163.5L164.3 164.3L165 165L165.7 165.7L166.5 166.5L167.2 167.2L167.9 167.9L168.6 168.6L169.4 169.4L170.1 170.1L170.8 170.8L171.6 171.6L172.3 172.3L173 173L173.8 173.8L174.5 174.5L175.2 175.2L175.9 175.9L176.7 176.7L177.4 177.4L178.1 178.1L178.9 178.9L179.6 179.6L180.3 180.3L181 181L181.8 181.8L182.5 182.5L183.2 183.2L184 184L184.7 184.7L185.4 185.4L186.1 186.1L186.9 186.9L187.6 187.6L188.3 188.3L189.1 189.1L189.8 189.8L190.5 190.5L191.3 191.3L192 192L192.7 192.7L193.4 193.4L194.2 194.2L194.9 194.9L195.6 195.6L196.4 196.4L197.1 197.1L197.8 197.8L198.5 198.5L199.3 199.3L200 200L200.7 200.7L201.5 201.5L202.2 202.2L202.9 202.9L203.6 203.6L204.4 204.4L205.1 205.1L205.8 205.8L206.6 206.6L207.3 207.3L208 208L208.8 208.8L209.5 209.5L210.2 210.2L210.9 210.9L211.7 211.7L212.4 212.4L213.1 213.1L213.9 213.9L214.6 214.6L215.3 215.3L216 216L216.8 216.8L217.5 217.5" stroke-width="2.2"/><text x="148.5" y="137.4" fill="currentColor" stroke="none" text-anchor="start" font-style="italic">x+y=6</text><path d="M42.5 142.5L42.8 142.8L43.1 143.1L43.4 143.4L43.8 143.8L44.1 144.1L44.4 144.4L44.7 144.7L45 145L45.3 145.3L45.6 145.6L45.9 145.9L46.3 146.3L46.6 146.6L46.9 146.9L47.2 147.2L47.5 147.5L47.8 147.8L48.1 148.1L48.4 148.4L48.8 148.8L49.1 149.1L49.4 149.4L49.7 149.7L50 150L50.3 150.3L50.6 150.6L50.9 150.9L51.3 151.3L51.6 151.6L51.9 151.9L52.2 152.2L52.5 152.5L52.8 152.8L53.1 153.1L53.4 153.4L53.8 153.8L54.1 154.1L54.4 154.4L54.7 154.7L55 155L55.3 155.3L55.6 155.6L55.9 155.9L56.3 156.3L56.6 156.6L56.9 156.9L57.2 157.2L57.5 157.5L57.8 157.8L58.1 158.1L58.4 158.4L58.8 158.8L59.1 159.1L59.4 159.4L59.7 159.7L60 160L60.3 160.3L60.6 160.6L60.9 160.9L61.3 161.3L61.6 161.6L61.9 161.9L62.2 162.2L62.5 162.5L62.8 162.8L63.1 163.1L63.4 163.4L63.8 163.8L64.1 164.1L64.4 164.4L64.7 164.7L65 165L65.3 165.3L65.6 165.6L65.9 165.9L66.3 166.3L66.6 166.6L66.9 166.9L67.2 167.2L67.5 167.5L67.8 167.8L68.1 168.1L68.4 168.4L68.8 168.8L69.1 169.1L69.4 169.4L69.7 169.7L70 170L70.3 170.3L70.6 170.6L70.9 170.9L71.3 171.3L71.6 171.6L71.9 171.9L72.2 172.2L72.5 172.5L72.8 172.8L73.1 173.1L73.4 173.4L73.8 173.8L74.1 174.1L74.4 174.4L74.7 174.7L75 175L75.3 175.3L75.6 175.6L75.9 175.9L76.3 176.3L76.6 176.6L76.9 176.9L77.2 177.2L77.5 177.5L77.8 177.8L78.1 178.1L78.4 178.4L78.8 178.8L79.1 179.1L79.4 179.4L79.7 179.7L80 180L80.3 180.3L80.6 180.6L80.9 180.9L81.3 181.3L81.6 181.6L81.9 181.9L82.2 182.2L82.5 182.5L82.8 182.8L83.1 183.1L83.4 183.4L83.8 183.8L84.1 184.1L84.4 184.4L84.7 184.7L85 185L85.3 185.3L85.6 185.6L85.9 185.9L86.3 186.3L86.6 186.6L86.9 186.9L87.2 187.2L87.5 187.5L87.8 187.8L88.1 188.1L88.4 188.4L88.8 188.8L89.1 189.1L89.4 189.4L89.7 189.7L90 190L90.3 190.3L90.6 190.6L90.9 190.9L91.3 191.3L91.6 191.6L91.9 191.9L92.2 192.2L92.5 192.5L92.8 192.8L93.1 193.1L93.4 193.4L93.8 193.8L94.1 194.1L94.4 194.4L94.7 194.7L95 195L95.3 195.3L95.6 195.6L95.9 195.9L96.3 196.3L96.6 196.6L96.9 196.9L97.2 197.2L97.5 197.5L97.8 197.8L98.1 198.1L98.4 198.4L98.8 198.8L99.1 199.1L99.4 199.4L99.7 199.7L100 200L100.3 200.3L100.6 200.6L100.9 200.9L101.3 201.3L101.6 201.6L101.9 201.9L102.2 202.2L102.5 202.5L102.8 202.8L103.1 203.1L103.4 203.4L103.8 203.8L104.1 204.1L104.4 204.4L104.7 204.7L105 205L105.3 205.3L105.6 205.6L105.9 205.9L106.3 206.3L106.6 206.6L106.9 206.9L107.2 207.2L107.5 207.5L107.8 207.8L108.1 208.1L108.4 208.4L108.8 208.8L109.1 209.1L109.4 209.4L109.7 209.7L110 210L110.3 210.3L110.6 210.6L110.9 210.9L111.3 211.3L111.6 211.6L111.9 211.9L112.2 212.2L112.5 212.5L112.8 212.8L113.1 213.1L113.4 213.4L113.8 213.8L114.1 214.1L114.4 214.4L114.7 214.7L115 215L115.3 215.3L115.6 215.6L115.9 215.9L116.3 216.3L116.6 216.6L116.9 216.9L117.2 217.2L117.5 217.5" stroke-width="2.2"/><polygon points="105,205 205,205 55,55 55,155" fill="currentColor" fill-opacity="0.12"/></svg>', true),
  -- mat-14-016 · şekilli · doğrulandı
  ('a593f5e8-6c8f-54bb-ac24-ebc7cf97cd5e'::uuid, 'Matematik & Geometri', 'Analitik Geometri ve Katı Cisimler', 'multiple_choice', 3,
   'Şekildeki dik koordinat düzleminde verilen $A(-3, 4)$ noktasının $x$-eksenine göre simetriği $B$ noktası, $B$ noktasının $y$-eksenine göre simetriği ise $C$ noktasıdır.
Buna göre $|AC|$ uzaklığı kaç birimdir?',
   '{"options":["8","10","$2\\sqrt{13}$","12","14"],"correctIndex":1}'::jsonb,
   'Bir noktanın $x$-eksenine göre simetriği alınırken ordinatın işareti değişir: $A(-3, 4) \to B(-3, -4)$.
$B$ noktasının $y$-eksenine göre simetriği alınırken apsisin işareti değişir: $B(-3, -4) \to C(3, -4)$.
$A(-3, 4)$ ile $C(3, -4)$ arasındaki uzaklık $|AC| = \sqrt{(3 - (-3))^2 + (-4 - 4)^2} = \sqrt{6^2 + (-8)^2} = \sqrt{100} = 10$ birim bulunur (orijinden simetrik oldukları için $|OA| = 5$ uzaklığının $2$ katıdır).',
   'A şıkkı (8) veya E şıkkı (14), $x$-eksenine göre simetride apsisi değiştirip $B(3, 4)$ alan ya da uzaklık formülünde dik kenarları toplama hatasına düşen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 340 340" width="340" height="340" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><g stroke-width="0.6" stroke-opacity="0.25"><line x1="30" y1="310" x2="30" y2="30"/><line x1="58" y1="310" x2="58" y2="30"/><line x1="86" y1="310" x2="86" y2="30"/><line x1="114" y1="310" x2="114" y2="30"/><line x1="142" y1="310" x2="142" y2="30"/><line x1="170" y1="310" x2="170" y2="30"/><line x1="198" y1="310" x2="198" y2="30"/><line x1="226" y1="310" x2="226" y2="30"/><line x1="254" y1="310" x2="254" y2="30"/><line x1="282" y1="310" x2="282" y2="30"/><line x1="310" y1="310" x2="310" y2="30"/><line x1="30" y1="310" x2="310" y2="310"/><line x1="30" y1="282" x2="310" y2="282"/><line x1="30" y1="254" x2="310" y2="254"/><line x1="30" y1="226" x2="310" y2="226"/><line x1="30" y1="198" x2="310" y2="198"/><line x1="30" y1="170" x2="310" y2="170"/><line x1="30" y1="142" x2="310" y2="142"/><line x1="30" y1="114" x2="310" y2="114"/><line x1="30" y1="86" x2="310" y2="86"/><line x1="30" y1="58" x2="310" y2="58"/><line x1="30" y1="30" x2="310" y2="30"/></g><line x1="24" y1="170" x2="320" y2="170"/><line x1="170" y1="316" x2="170" y2="20"/><path d="M320 170 l-7 -4 m7 4 l-7 4"/><path d="M170 20 l-4 7 m4 -7 l4 7"/><text x="324" y="186.9" fill="currentColor" stroke="none" text-anchor="end" font-style="italic">x</text><text x="182" y="22.9" fill="currentColor" stroke="none" text-anchor="start" font-style="italic">y</text><g stroke-width="1.2"><line x1="30" y1="167" x2="30" y2="173"/><text x="30" y="187.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">-5</text><line x1="58" y1="167" x2="58" y2="173"/><text x="58" y="187.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">-4</text><line x1="86" y1="167" x2="86" y2="173"/><text x="86" y="187.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">-3</text><line x1="114" y1="167" x2="114" y2="173"/><text x="114" y="187.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">-2</text><line x1="142" y1="167" x2="142" y2="173"/><text x="142" y="187.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">-1</text><line x1="198" y1="167" x2="198" y2="173"/><text x="198" y="187.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">1</text><line x1="226" y1="167" x2="226" y2="173"/><text x="226" y="187.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">2</text><line x1="254" y1="167" x2="254" y2="173"/><text x="254" y="187.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">3</text><line x1="282" y1="167" x2="282" y2="173"/><text x="282" y="187.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">4</text><line x1="310" y1="167" x2="310" y2="173"/><text x="310" y="187.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">5</text><line x1="167" y1="310" x2="173" y2="310"/><text x="164" y="313.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">-5</text><line x1="167" y1="282" x2="173" y2="282"/><text x="164" y="285.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">-4</text><line x1="167" y1="254" x2="173" y2="254"/><text x="164" y="257.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">-3</text><line x1="167" y1="226" x2="173" y2="226"/><text x="164" y="229.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">-2</text><line x1="167" y1="198" x2="173" y2="198"/><text x="164" y="201.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">-1</text><line x1="167" y1="142" x2="173" y2="142"/><text x="164" y="145.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">1</text><line x1="167" y1="114" x2="173" y2="114"/><text x="164" y="117.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">2</text><line x1="167" y1="86" x2="173" y2="86"/><text x="164" y="89.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">3</text><line x1="167" y1="58" x2="173" y2="58"/><text x="164" y="61.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">4</text><line x1="167" y1="30" x2="173" y2="30"/><text x="164" y="33.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">5</text><text x="162" y="185.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">O</text></g><circle cx="86" cy="58" r="3" fill="currentColor" stroke="none"/><text x="75.5" y="52.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text></svg>', true),
  -- mat-14-017 · doğrulandı
  ('8b2dc9e5-fc4b-5b6f-9887-674a5dc07310'::uuid, 'Matematik & Geometri', 'Analitik Geometri ve Katı Cisimler', 'multiple_choice', 1,
   'Bir dikdörtgenler prizmasının farklı üç yüzünün alanları sırasıyla $12\text{ cm}^2$, $15\text{ cm}^2$ ve $20\text{ cm}^2$''dir.
Buna göre bu prizmanın hacmi kaç $\text{cm}^3$''tür?',
   '{"options":["47","48","50","54","60"],"correctIndex":4}'::jsonb,
   'Prizmanın ayrıtları $a, b, c$ cm olsun. Farklı üç yüzün alanları $a \cdot b = 12$, $b \cdot c = 15$ ve $a \cdot c = 20$''dir. Üç eşitlik taraf tarafa çarpılırsa:
$$(a \cdot b \cdot c)^2 = 12 \cdot 15 \cdot 20 = 3.600 \Rightarrow V = a \cdot b \cdot c = \sqrt{3.600} = 60\text{ cm}^3$$
bulunur.',
   'A şıkkı ($47$), verilen üç yüzey alanını doğrudan toplayan ($12 + 15 + 20 = 47$) adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-14-018 · şekilli · doğrulandı
  ('c94147f1-d193-5709-b233-c03b699d93b0'::uuid, 'Matematik & Geometri', 'Analitik Geometri ve Katı Cisimler', 'multiple_choice', 1,
   'Şekildeki dikdörtgenler prizmasının ayrıt uzunlukları $2$ cm, $4$ cm ve $5$ cm''dir.
Buna göre prizmanın tüm yüzey alanı kaç cm²''dir?',
   '{"options":["76","38","40","64","80"],"correctIndex":0}'::jsonb,
   'Dikdörtgenler prizmasının yüzey alanı $2(ab + ac + bc)$ formülüyle bulunur: $2(2 \cdot 4 + 2 \cdot 5 + 4 \cdot 5) = 2(8 + 10 + 20) = 2 \cdot 38 = 76$ cm².',
   'B şıkkı (38), karşılıklı yüzlerden yalnızca birer tanesinin alanını toplayıp $2$ ile çarpmayı unutan adayı; C şıkkı (40) ise alan yerine hacim ($2 \cdot 4 \cdot 5 = 40$) hesaplayanları yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 340 204.4" width="340" height="204.4" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><line x1="30" y1="174.4" x2="248.8" y2="174.4"/><text x="139.4" y="190.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">5</text><line x1="248.8" y1="174.4" x2="248.8" y2="86.9"/><line x1="248.8" y1="86.9" x2="30" y2="86.9"/><line x1="30" y1="86.9" x2="30" y2="174.4"/><text x="16.1" y="135.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">2</text><line x1="30" y1="86.9" x2="91.3" y2="30"/><line x1="91.3" y1="30" x2="310" y2="30"/><line x1="310" y1="30" x2="248.8" y2="86.9"/><line x1="248.8" y1="174.4" x2="310" y2="117.5"/><text x="288.4" y="160.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">4</text><line x1="310" y1="117.5" x2="310" y2="30"/><line x1="30" y1="174.4" x2="91.3" y2="117.5" stroke-dasharray="6 5"/><line x1="91.3" y1="117.5" x2="310" y2="117.5" stroke-dasharray="6 5"/><line x1="91.3" y1="117.5" x2="91.3" y2="30" stroke-dasharray="6 5"/></svg>', true),
  -- mat-14-019 · şekilli · doğrulandı
  ('0590b24b-1eee-5e76-a924-2bc486c8e6e3'::uuid, 'Matematik & Geometri', 'Analitik Geometri ve Katı Cisimler', 'multiple_choice', 2,
   'Şekildeki kare dik prizmanın taban ayrıtı $4$ cm ve yüksekliği $7$ cm''dir.
Buna göre bu prizmanın toplam yüzey alanı kaç cm²''dir?',
   '{"options":["112","128","144","160","176"],"correctIndex":2}'::jsonb,
   'Kare dik prizmada $2$ tane $4 \times 4$''lük kare taban ($2 \cdot 16 = 32$ cm²) ve $4$ tane $4 \times 7$''lik dikdörtgen yan yüz ($4 \cdot 28 = 112$ cm²) vardır. Toplam yüzey alanı $32 + 112 = 144$ cm² bulunur.',
   'A şıkkı (112), yalnızca yanal alanı veya hacmi ($4 \cdot 4 \cdot 7 = 112$) hesaplayıp taban alanlarını eklemeyi unutan adayı; B şıkkı (128) ise yalnızca bir taban ekleyenleri yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 207.7 260" width="207.7" height="260" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><line x1="30" y1="230" x2="137.7" y2="230"/><text x="83.8" y="246.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">4</text><line x1="137.7" y1="230" x2="137.7" y2="60.8"/><line x1="137.7" y1="60.8" x2="30" y2="60.8"/><line x1="30" y1="60.8" x2="30" y2="230"/><text x="16.1" y="149.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">7</text><line x1="30" y1="60.8" x2="70" y2="30"/><line x1="70" y1="30" x2="177.7" y2="30"/><line x1="177.7" y1="30" x2="137.7" y2="60.8"/><line x1="137.7" y1="230" x2="177.7" y2="199.2"/><text x="165.7" y="229.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">4</text><line x1="177.7" y1="199.2" x2="177.7" y2="30"/><line x1="30" y1="230" x2="70" y2="199.2" stroke-dasharray="6 5"/><line x1="70" y1="199.2" x2="177.7" y2="199.2" stroke-dasharray="6 5"/><line x1="70" y1="199.2" x2="70" y2="30" stroke-dasharray="6 5"/></svg>', true),
  -- mat-14-020 · şekilli · doğrulandı
  ('a4055e69-8a4e-5ed4-94ed-3aecf663ea5c'::uuid, 'Matematik & Geometri', 'Analitik Geometri ve Katı Cisimler', 'multiple_choice', 2,
   'Şekildeki dik üçgen dik prizmanın tabanı dik kenarları $3$ cm ve $4$ cm olan bir dik üçgendir. Prizmanın yüksekliği $10$ cm olduğuna göre hacmi kaç cm³''tür?',
   '{"options":["30","40","100","120","60"],"correctIndex":4}'::jsonb,
   'Tüm prizmaların hacmi $\text{Taban alanı} \cdot \text{Yükseklik}$ formülüyle bulunur. Dik üçgen tabanın alanı $\dfrac{3 \cdot 4}{2} = 6$ cm²''dir. Yükseklik $10$ cm olduğundan hacim $6 \cdot 10 = 60$ cm³ bulunur.',
   'D şıkkı (120), üçgen tabanın alanında $2$''ye bölmeyi unutup $3 \cdot 4 \cdot 10 = 120$ hesaplayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 183.1 260" width="183.1" height="260" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><line x1="30" y1="230" x2="153.1" y2="230"/><line x1="30" y1="230" x2="30" y2="76.2"/><text x="14.2" y="157.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">10</text><line x1="153.1" y1="230" x2="153.1" y2="76.2"/><line x1="30" y1="76.2" x2="153.1" y2="76.2"/><line x1="153.1" y1="76.2" x2="76.2" y2="30"/><text x="121.3" y="46.5" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">4</text><line x1="76.2" y1="30" x2="30" y2="76.2"/><text x="43.6" y="48.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">3</text><line x1="30" y1="230" x2="76.2" y2="183.8" stroke-dasharray="6 5"/><line x1="153.1" y1="230" x2="76.2" y2="183.8" stroke-dasharray="6 5"/><line x1="76.2" y1="183.8" x2="76.2" y2="30" stroke-dasharray="6 5"/></svg>', true),
  -- mat-14-021 · doğrulandı
  ('2a4f1d37-4b2d-5f9d-a5f4-f03238266221'::uuid, 'Matematik & Geometri', 'Analitik Geometri ve Katı Cisimler', 'multiple_choice', 2,
   'Bir ayrıtı $6$ cm olan dolu bir tahta küpün içinden, tabanları küpün alt ve üst yüzlerine oturan en büyük hacimli dik dairesel silindir oyulup çıkarılıyor.
Buna göre geriye kalan cismin hacmi kaç $\text{cm}^3$''tür?',
   '{"options":["$216 - 54\\pi$","$216 - 36\\pi$","$216 - 108\\pi$","$108 - 54\\pi$","$216 - 18\\pi$"],"correctIndex":0}'::jsonb,
   'Küpün bir ayrıtı $6$ cm olduğundan içine sığabilecek en büyük silindirin taban çapı $6$ cm ($r = 3$ cm) ve yüksekliği $h = 6$ cm olur.
- Küpün hacmi: $6^3 = 216\text{ cm}^3$
- Çıkarılan silindirin hacmi: $\pi \cdot 3^2 \cdot 6 = 54\pi\text{ cm}^3$
Geriye kalan cismin hacmi $216 - 54\pi\text{ cm}^3$ bulunur.',
   'C şıkkı ($216 - 108\pi$) veya B şıkkı ($216 - 36\pi$), silindirin çapı olan $6$''yı yarıçap sanıp $\pi \cdot 6^2$ alan ya da $\pi r^2 h$ yerine yanal alan $2\pi r h = 36\pi$ çıkaran adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-14-022 · şekilli · doğrulandı
  ('fa053bf2-1492-52ff-a196-5074c455f442'::uuid, 'Matematik & Geometri', 'Analitik Geometri ve Katı Cisimler', 'multiple_choice', 2,
   'Bir ayrıtı $3$ cm olan iki özdeş küp, birer yüzleri tamamen çakışacak biçimde yan yana yapıştırılarak şekildeki dikdörtgenler prizması oluşturuluyor.
Buna göre oluşan yeni prizmanın toplam yüzey alanı kaç cm²''dir?',
   '{"options":["54","72","99","90","108"],"correctIndex":3}'::jsonb,
   'Başlangıçta iki küpte toplam $6 + 6 = 12$ adet $3 \times 3$''lük kare yüz vardır. İki küp yapıştırıldığında iki küpten birer yüz ($2$ yüz) iç kısımda kalarak dış yüzeyden kaybolur; geriye $12 - 2 = 10$ dış kare yüz kalır. Her bir kare yüzün alanı $3^2 = 9$ cm² olduğundan toplam yüzey alanı $10 \cdot 9 = 90$ cm² bulunur.',
   'E şıkkı (108), yapışan yüzlerin kaybolduğunu gözden kaçırıp iki küpün alanını ($54 + 54 = 108$) doğrudan toplayan; C şıkkı (99) ise iki yüz yerine yalnızca bir yüz ($9$ cm²) eksilten adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 340 215.6" width="340" height="215.6" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><line x1="30" y1="185.6" x2="263.3" y2="185.6"/><line x1="263.3" y1="185.6" x2="263.3" y2="68.9"/><line x1="263.3" y1="68.9" x2="30" y2="68.9"/><line x1="30" y1="68.9" x2="30" y2="185.6"/><text x="16.1" y="131.8" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">3</text><line x1="146.7" y1="185.6" x2="146.7" y2="68.9"/><line x1="146.7" y1="68.9" x2="193.3" y2="30"/><line x1="30" y1="68.9" x2="76.7" y2="30"/><line x1="76.7" y1="30" x2="310" y2="30"/><line x1="310" y1="30" x2="263.3" y2="68.9"/><line x1="263.3" y1="185.6" x2="310" y2="146.7"/><line x1="310" y1="146.7" x2="310" y2="30"/><line x1="30" y1="185.6" x2="76.7" y2="146.7" stroke-dasharray="6 5"/><line x1="76.7" y1="146.7" x2="310" y2="146.7" stroke-dasharray="6 5"/><line x1="76.7" y1="146.7" x2="76.7" y2="30" stroke-dasharray="6 5"/><line x1="146.7" y1="185.6" x2="193.3" y2="146.7" stroke-dasharray="6 5"/><line x1="193.3" y1="146.7" x2="193.3" y2="30" stroke-dasharray="6 5"/></svg>', true),
  -- mat-14-023 · şekilli · doğrulandı
  ('638c3002-c9ce-5c26-9038-9ea2c21abbdc'::uuid, 'Matematik & Geometri', 'Analitik Geometri ve Katı Cisimler', 'multiple_choice', 3,
   'Boyutları $12\pi$ cm ve $8$ cm olan dikdörtgen biçimindeki bir karton, $12\pi$ cm''lik kenarı taban çevresi olacak biçimde kıvrılarak üstü ve altı açık bir dik dairesel silindir elde ediliyor.
Buna göre bu silindirin hacmi kaç cm³''tür?',
   '{"options":["$288\\pi$","$144\\pi$","$96\\pi$","$576\\pi$","$1.152\\pi$"],"correctIndex":0}'::jsonb,
   '$12\pi$ cm''lik kenar silindirin taban çevresini oluşturduğundan $2\pi r = 12\pi \Rightarrow r = 6$ cm bulunur. Silindirin yüksekliği $h = 8$ cm''dir. Silindirin hacmi $V = \pi r^2 h = \pi \cdot 6^2 \cdot 8 = 36\pi \cdot 8 = 288\pi$ cm³ olur.',
   'E şıkkı ($1.152\pi$), $12\pi$ taban çevresini $2\pi r$''ye eşitleyip $r = 6$ bulmak yerine doğrudan $r = 12$ alıp $\pi \cdot 12^2 \cdot 8$ hesaplayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 348.6 200" width="348.6" height="200" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><polygon points="30,170 310,170 310,30 30,30"/><line x1="30" y1="170" x2="310" y2="170"/><text x="170" y="186.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">12π cm</text><line x1="310" y1="170" x2="310" y2="30"/><text x="329.5" y="104.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">8 cm</text></svg>', true),
  -- mat-14-024 · şekilli · doğrulandı
  ('4d24c3c9-8da8-5a36-b318-9f6ce8eaeb0c'::uuid, 'Matematik & Geometri', 'Analitik Geometri ve Katı Cisimler', 'multiple_choice', 3,
   'İç boyutları $7$ cm, $8$ cm ve $11$ cm olan dikdörtgenler prizması biçimindeki boş bir kutuya, bir ayrıtı $2$ cm olan küçük küplerden en fazla kaç tane yerleştirilebilir?',
   '{"options":["48","56","60","64","77"],"correctIndex":2}'::jsonb,
   'Küpler bölünemeyeceği için her ayrıt boyunca tam sığabilecek küp sayısı ayrı ayrı hesaplanır:
$7$ cm''lik ayrıt boyunca $\lfloor 7 \div 2 \rfloor = 3$ küp,
$8$ cm''lik ayrıt boyunca $\lfloor 8 \div 2 \rfloor = 4$ küp,
$11$ cm''lik ayrıt boyunca $\lfloor 11 \div 2 \rfloor = 5$ küp sığar.
Toplam yerleştirilebilecek küp sayısı $3 \cdot 4 \cdot 5 = 60$ tanedir.',
   'E şıkkı (77), küplerin bölünemeyeceğini unutup kutunun hacmini bir küpün hacmine ($\dfrac{7 \cdot 8 \cdot 11}{2^3} = 77$) bölerek artan boşlukları da sığdırılabilecekmiş gibi hesaplayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 340 247.9" width="340" height="247.9" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><line x1="30" y1="217.9" x2="241" y2="217.9"/><text x="135.5" y="234.5" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">11</text><line x1="241" y1="217.9" x2="241" y2="83.7"/><line x1="241" y1="83.7" x2="30" y2="83.7"/><line x1="30" y1="83.7" x2="30" y2="217.9"/><text x="16.1" y="155.4" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">7</text><line x1="30" y1="83.7" x2="99" y2="30"/><line x1="99" y1="30" x2="310" y2="30"/><line x1="310" y1="30" x2="241" y2="83.7"/><line x1="241" y1="217.9" x2="310" y2="164.2"/><text x="283.6" y="206" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">8</text><line x1="310" y1="164.2" x2="310" y2="30"/><line x1="30" y1="217.9" x2="99" y2="164.2" stroke-dasharray="6 5"/><line x1="99" y1="164.2" x2="310" y2="164.2" stroke-dasharray="6 5"/><line x1="99" y1="164.2" x2="99" y2="30" stroke-dasharray="6 5"/></svg>', true),
  -- mat-14-025 · doğrulandı
  ('a633cc18-9d34-5654-9d6d-1461fdc85457'::uuid, 'Matematik & Geometri', 'Analitik Geometri ve Katı Cisimler', 'multiple_choice', 1,
   'Dik koordinat düzleminde $2x - 3y + 7 = 0$ doğrusu ile $ax + 6y - 5 = 0$ doğrusu birbirine dik olduğuna göre $a$ değeri kaçtır?',
   '{"options":["$-9$","$-4$","$9$","$4$","$12$"],"correctIndex":2}'::jsonb,
   'İlk doğrunun eğimi $m_1 = -\dfrac{2}{-3} = \dfrac{2}{3}$, ikinci doğrunun eğimi $m_2 = -\dfrac{a}{6}$''dır. İki doğru birbirine dik olduğunda eğimler çarpımı $-1$''e eşittir:
$$\frac{2}{3} \cdot \left(-\frac{a}{6}\right) = -1 \Rightarrow -\frac{2a}{18} = -1 \Rightarrow a = 9$$',
   'A şıkkı ($-9$), eğimleri çarparken $-1$ yerine $+1$''e eşitleyen ($m_1 \cdot m_2 = 1$) ya da eğim formülündeki eksi işaretini unutan adayı; B şıkkı ($-4$) ise iki doğruyu paralel kabul edip $m_1 = m_2$ çözenleri yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-14-026 · şekilli · doğrulandı
  ('4a00e6bb-e425-51a4-8c7d-de8b2858a34a'::uuid, 'Matematik & Geometri', 'Analitik Geometri ve Katı Cisimler', 'multiple_choice', 1,
   'Şekilde dik koordinat düzleminde grafiği verilen $3x + 2y - 12 = 0$ doğrusunun koordinat eksenleriyle oluşturduğu $AOB$ üçgensel bölgesinin alanı kaç birimkaredir?',
   '{"options":["6","8","9","10","12"],"correctIndex":4}'::jsonb,
   'Doğrunun eksenleri kestiği noktalar bulunur:
- $x = 0$ için $2y = 12 \Rightarrow y = 6$ olduğundan $A(0, 6)$ ve $|OA| = 6$ birimdir.
- $y = 0$ için $3x = 12 \Rightarrow x = 4$ olduğundan $B(4, 0)$ ve $|OB| = 4$ birimdir.
Dik üçgenin alanı $\dfrac{|OA| \cdot |OB|}{2} = \dfrac{6 \cdot 4}{2} = 12$ birimkare bulunur.',
   'A şıkkı ($6$) veya E yerine D ($10$) işaretleyenlerin yanında $24$ bulanlar taban $\times$ yükseklik çarpımında $2$''ye bölmeyi unutanlardır; eksen kesim noktalarını ters koymak yerine mutlaka $x = 0$ ve $y = 0$ değerleri ayrı kontrol edilmelidir.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 215.6 260" width="215.6" height="260" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><g stroke-width="0.6" stroke-opacity="0.25"><line x1="52.2" y1="230" x2="52.2" y2="30"/><line x1="96.7" y1="230" x2="96.7" y2="30"/><line x1="141.1" y1="230" x2="141.1" y2="30"/><line x1="185.6" y1="230" x2="185.6" y2="30"/><line x1="30" y1="207.8" x2="185.6" y2="207.8"/><line x1="30" y1="163.3" x2="185.6" y2="163.3"/><line x1="30" y1="118.9" x2="185.6" y2="118.9"/><line x1="30" y1="74.4" x2="185.6" y2="74.4"/><line x1="30" y1="30" x2="185.6" y2="30"/></g><line x1="24" y1="207.8" x2="195.6" y2="207.8"/><line x1="52.2" y1="236" x2="52.2" y2="20"/><path d="M195.6 207.8 l-7 -4 m7 4 l-7 4"/><path d="M52.2 20 l-4 7 m4 -7 l4 7"/><text x="199.6" y="224.7" fill="currentColor" stroke="none" text-anchor="end" font-style="italic">x</text><text x="64.2" y="22.9" fill="currentColor" stroke="none" text-anchor="start" font-style="italic">y</text><g stroke-width="1.2"><line x1="96.7" y1="204.8" x2="96.7" y2="210.8"/><text x="96.7" y="225.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">2</text><line x1="141.1" y1="204.8" x2="141.1" y2="210.8"/><text x="141.1" y="225.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">4</text><line x1="185.6" y1="204.8" x2="185.6" y2="210.8"/><text x="185.6" y="225.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">6</text><line x1="49.2" y1="163.3" x2="55.2" y2="163.3"/><text x="46.2" y="167.2" fill="currentColor" stroke="none" text-anchor="end" font-size="11">2</text><line x1="49.2" y1="118.9" x2="55.2" y2="118.9"/><text x="46.2" y="122.7" fill="currentColor" stroke="none" text-anchor="end" font-size="11">4</text><line x1="49.2" y1="74.4" x2="55.2" y2="74.4"/><text x="46.2" y="78.3" fill="currentColor" stroke="none" text-anchor="end" font-size="11">6</text><line x1="49.2" y1="30" x2="55.2" y2="30"/><text x="46.2" y="33.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">8</text><text x="44.2" y="223.6" fill="currentColor" stroke="none" text-anchor="end" font-size="11">O</text></g><path d="M41.1 57.8L41.6 58.5L42.1 59.2L42.5 59.9L43 60.6L43.5 61.3L43.9 62L44.4 62.7L44.9 63.4L45.4 64.2L45.8 64.9L46.3 65.6L46.8 66.3L47.3 67L47.7 67.7L48.2 68.4L48.7 69.1L49.1 69.8L49.6 70.5L50.1 71.2L50.6 71.9L51 72.7L51.5 73.4L52 74.1L52.4 74.8L52.9 75.5L53.4 76.2L53.9 76.9L54.3 77.6L54.8 78.3L55.3 79L55.8 79.7L56.2 80.4L56.7 81.2L57.2 81.9L57.6 82.6L58.1 83.3L58.6 84L59.1 84.7L59.5 85.4L60 86.1L60.5 86.8L60.9 87.5L61.4 88.2L61.9 88.9L62.4 89.7L62.8 90.4L63.3 91.1L63.8 91.8L64.3 92.5L64.7 93.2L65.2 93.9L65.7 94.6L66.1 95.3L66.6 96L67.1 96.7L67.6 97.4L68 98.2L68.5 98.9L69 99.6L69.4 100.3L69.9 101L70.4 101.7L70.9 102.4L71.3 103.1L71.8 103.8L72.3 104.5L72.8 105.2L73.2 105.9L73.7 106.7L74.2 107.4L74.6 108.1L75.1 108.8L75.6 109.5L76.1 110.2L76.5 110.9L77 111.6L77.5 112.3L77.9 113L78.4 113.7L78.9 114.4L79.4 115.2L79.8 115.9L80.3 116.6L80.8 117.3L81.2 118L81.7 118.7L82.2 119.4L82.7 120.1L83.1 120.8L83.6 121.5L84.1 122.2L84.6 122.9L85 123.7L85.5 124.4L86 125.1L86.4 125.8L86.9 126.5L87.4 127.2L87.9 127.9L88.3 128.6L88.8 129.3L89.3 130L89.8 130.7L90.2 131.4L90.7 132.2L91.2 132.9L91.6 133.6L92.1 134.3L92.6 135L93.1 135.7L93.5 136.4L94 137.1L94.5 137.8L94.9 138.5L95.4 139.2L95.9 139.9L96.4 140.7L96.8 141.4L97.3 142.1L97.8 142.8L98.2 143.5L98.7 144.2L99.2 144.9L99.7 145.6L100.1 146.3L100.6 147L101.1 147.7L101.6 148.4L102 149.2L102.5 149.9L103 150.6L103.4 151.3L103.9 152L104.4 152.7L104.9 153.4L105.3 154.1L105.8 154.8L106.3 155.5L106.8 156.2L107.2 156.9L107.7 157.7L108.2 158.4L108.6 159.1L109.1 159.8L109.6 160.5L110.1 161.2L110.5 161.9L111 162.6L111.5 163.3L111.9 164L112.4 164.7L112.9 165.4L113.4 166.2L113.8 166.9L114.3 167.6L114.8 168.3L115.2 169L115.7 169.7L116.2 170.4L116.7 171.1L117.1 171.8L117.6 172.5L118.1 173.2L118.6 173.9L119 174.7L119.5 175.4L120 176.1L120.4 176.8L120.9 177.5L121.4 178.2L121.9 178.9L122.3 179.6L122.8 180.3L123.3 181L123.8 181.7L124.2 182.4L124.7 183.2L125.2 183.9L125.6 184.6L126.1 185.3L126.6 186L127.1 186.7L127.5 187.4L128 188.1L128.5 188.8L128.9 189.5L129.4 190.2L129.9 190.9L130.4 191.7L130.8 192.4L131.3 193.1L131.8 193.8L132.3 194.5L132.7 195.2L133.2 195.9L133.7 196.6L134.1 197.3L134.6 198L135.1 198.7L135.6 199.4L136 200.2L136.5 200.9L137 201.6L137.4 202.3L137.9 203L138.4 203.7L138.9 204.4L139.3 205.1L139.8 205.8L140.3 206.5L140.8 207.2L141.2 207.9L141.7 208.7L142.2 209.4L142.6 210.1L143.1 210.8L143.6 211.5L144.1 212.2L144.5 212.9L145 213.6L145.5 214.3L145.9 215L146.4 215.7L146.9 216.4L147.4 217.2L147.8 217.9L148.3 218.6L148.8 219.3L149.2 220L149.7 220.7L150.2 221.4L150.7 222.1L151.1 222.8L151.6 223.5L152.1 224.2L152.6 224.9L153 225.7L153.5 226.4L154 227.1L154.4 227.8" stroke-width="2.2"/><text x="107.1" y="142.7" fill="currentColor" stroke="none" text-anchor="start" font-style="italic">d</text><circle cx="52.2" cy="74.4" r="3" fill="currentColor" stroke="none"/><text x="62.7" y="68.8" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><circle cx="141.1" cy="207.8" r="3" fill="currentColor" stroke="none"/><text x="151.6" y="202.2" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text></svg>', true),
  -- mat-14-027 · şekilli · doğrulandı
  ('2d2f9536-142e-542a-99d0-c36aef2f646e'::uuid, 'Matematik & Geometri', 'Analitik Geometri ve Katı Cisimler', 'multiple_choice', 2,
   'Şekildeki dik koordinat düzleminde $d_1: y = x + 2$ ve $d_2: y = 8 - x$ doğruları $C$ noktasında kesişmektedir.
Buna göre bu iki doğrunun $x$-ekseni ile oluşturduğu boyalı $ABC$ üçgeninin alanı kaç birimkaredir?',
   '{"options":["20","25","30","40","50"],"correctIndex":1}'::jsonb,
   'Doğruların $x$-eksenini kestiği noktalar ($y = 0$) bulunur: $d_1$ için $x = -2 \Rightarrow A(-2, 0)$; $d_2$ için $x = 8 \Rightarrow B(8, 0)$. Taban uzunluğu $|AB| = 8 - (-2) = 10$ birimdir.
Kesişim noktası $C$ için $x + 2 = 8 - x \Rightarrow 2x = 6 \Rightarrow x = 3$ ve $y = 3 + 2 = 5$ bulunur. Üçgenin yüksekliği $C$ noktasının ordinatı olan $h = 5$ birimdir. Alan $\dfrac{10 \cdot 5}{2} = 25$ birimkare olur.',
   'E şıkkı ($50$), taban ve yüksekliği bulduktan sonra üçgen alan formülünde $2$''ye bölmeyi unutan adayı; C şıkkı ($30$) ise $|AB|$ mesafesini $8 - (-2) = 10$ yerine yanlışlıkla $12$ alanları yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 300 260" width="300" height="260" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><g stroke-width="0.6" stroke-opacity="0.25"><line x1="50" y1="230" x2="50" y2="30"/><line x1="90" y1="230" x2="90" y2="30"/><line x1="130" y1="230" x2="130" y2="30"/><line x1="170" y1="230" x2="170" y2="30"/><line x1="210" y1="230" x2="210" y2="30"/><line x1="250" y1="230" x2="250" y2="30"/><line x1="30" y1="210" x2="270" y2="210"/><line x1="30" y1="170" x2="270" y2="170"/><line x1="30" y1="130" x2="270" y2="130"/><line x1="30" y1="90" x2="270" y2="90"/><line x1="30" y1="50" x2="270" y2="50"/></g><line x1="24" y1="210" x2="280" y2="210"/><line x1="90" y1="236" x2="90" y2="20"/><path d="M280 210 l-7 -4 m7 4 l-7 4"/><path d="M90 20 l-4 7 m4 -7 l4 7"/><text x="284" y="226.9" fill="currentColor" stroke="none" text-anchor="end" font-style="italic">x</text><text x="102" y="22.9" fill="currentColor" stroke="none" text-anchor="start" font-style="italic">y</text><g stroke-width="1.2"><line x1="50" y1="207" x2="50" y2="213"/><text x="50" y="227.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">-2</text><line x1="130" y1="207" x2="130" y2="213"/><text x="130" y="227.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">2</text><line x1="170" y1="207" x2="170" y2="213"/><text x="170" y="227.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">4</text><line x1="210" y1="207" x2="210" y2="213"/><text x="210" y="227.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">6</text><line x1="250" y1="207" x2="250" y2="213"/><text x="250" y="227.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">8</text><line x1="87" y1="170" x2="93" y2="170"/><text x="84" y="173.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">2</text><line x1="87" y1="130" x2="93" y2="130"/><text x="84" y="133.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">4</text><line x1="87" y1="90" x2="93" y2="90"/><text x="84" y="93.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">6</text><line x1="87" y1="50" x2="93" y2="50"/><text x="84" y="53.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">8</text><text x="82" y="225.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">O</text></g><path d="M34 226L34.7 225.3L35.4 224.6L36.1 223.9L36.8 223.2L37.5 222.5L38.2 221.9L38.8 221.2L39.5 220.5L40.2 219.8L40.9 219.1L41.6 218.4L42.3 217.7L43 217L43.7 216.3L44.4 215.6L45.1 214.9L45.8 214.2L46.5 213.6L47.1 212.9L47.8 212.2L48.5 211.5L49.2 210.8L49.9 210.1L50.6 209.4L51.3 208.7L52 208L52.7 207.3L53.4 206.6L54.1 205.9L54.8 205.3L55.4 204.6L56.1 203.9L56.8 203.2L57.5 202.5L58.2 201.8L58.9 201.1L59.6 200.4L60.3 199.7L61 199L61.7 198.3L62.4 197.6L63.1 197L63.7 196.3L64.4 195.6L65.1 194.9L65.8 194.2L66.5 193.5L67.2 192.8L67.9 192.1L68.6 191.4L69.3 190.7L70 190L70.7 189.3L71.4 188.6L72 188L72.7 187.3L73.4 186.6L74.1 185.9L74.8 185.2L75.5 184.5L76.2 183.8L76.9 183.1L77.6 182.4L78.3 181.7L79 181L79.7 180.4L80.3 179.7L81 179L81.7 178.3L82.4 177.6L83.1 176.9L83.8 176.2L84.5 175.5L85.2 174.8L85.9 174.1L86.6 173.4L87.3 172.7L88 172L88.6 171.4L89.3 170.7L90 170L90.7 169.3L91.4 168.6L92.1 167.9L92.8 167.2L93.5 166.5L94.2 165.8L94.9 165.1L95.6 164.4L96.3 163.8L96.9 163.1L97.6 162.4L98.3 161.7L99 161L99.7 160.3L100.4 159.6L101.1 158.9L101.8 158.2L102.5 157.5L103.2 156.8L103.9 156.1L104.6 155.5L105.2 154.8L105.9 154.1L106.6 153.4L107.3 152.7L108 152L108.7 151.3L109.4 150.6L110.1 149.9L110.8 149.2L111.5 148.5L112.2 147.8L112.9 147.2L113.5 146.5L114.2 145.8L114.9 145.1L115.6 144.4L116.3 143.7L117 143L117.7 142.3L118.4 141.6L119.1 140.9L119.8 140.2L120.5 139.5L121.2 138.8L121.8 138.2L122.5 137.5L123.2 136.8L123.9 136.1L124.6 135.4L125.3 134.7L126 134L126.7 133.3L127.4 132.6L128.1 131.9L128.8 131.2L129.5 130.6L130.1 129.9L130.8 129.2L131.5 128.5L132.2 127.8L132.9 127.1L133.6 126.4L134.3 125.7L135 125L135.7 124.3L136.4 123.6L137.1 122.9L137.8 122.3L138.4 121.6L139.1 120.9L139.8 120.2L140.5 119.5L141.2 118.8L141.9 118.1L142.6 117.4L143.3 116.7L144 116L144.7 115.3L145.4 114.6L146.1 113.9L146.7 113.3L147.4 112.6L148.1 111.9L148.8 111.2L149.5 110.5L150.2 109.8L150.9 109.1L151.6 108.4L152.3 107.7L153 107L153.7 106.3L154.4 105.7L155 105L155.7 104.3L156.4 103.6L157.1 102.9L157.8 102.2L158.5 101.5L159.2 100.8L159.9 100.1L160.6 99.4L161.3 98.7L162 98L162.7 97.3L163.3 96.7L164 96L164.7 95.3L165.4 94.6L166.1 93.9L166.8 93.2L167.5 92.5L168.2 91.8L168.9 91.1L169.6 90.4L170.3 89.7L171 89.1L171.6 88.4L172.3 87.7L173 87L173.7 86.3L174.4 85.6L175.1 84.9L175.8 84.2L176.5 83.5L177.2 82.8L177.9 82.1L178.6 81.4L179.3 80.7L179.9 80.1L180.6 79.4L181.3 78.7L182 78L182.7 77.3L183.4 76.6L184.1 75.9L184.8 75.2L185.5 74.5L186.2 73.8L186.9 73.1L187.6 72.4L188.2 71.8L188.9 71.1L189.6 70.4L190.3 69.7L191 69L191.7 68.3L192.4 67.6L193.1 66.9L193.8 66.2L194.5 65.5L195.2 64.8L195.9 64.1L196.5 63.5L197.2 62.8L197.9 62.1L198.6 61.4L199.3 60.7L200 60" stroke-width="2.2"/><text x="192" y="68.9" fill="currentColor" stroke="none" text-anchor="start" font-style="italic">d₁</text><path d="M100 60L100.7 60.7L101.4 61.4L102.1 62.1L102.8 62.8L103.5 63.5L104.2 64.1L104.8 64.8L105.5 65.5L106.2 66.2L106.9 66.9L107.6 67.6L108.3 68.3L109 69L109.7 69.7L110.4 70.4L111.1 71.1L111.8 71.8L112.5 72.5L113.1 73.1L113.8 73.8L114.5 74.5L115.2 75.2L115.9 75.9L116.6 76.6L117.3 77.3L118 78L118.7 78.7L119.4 79.4L120.1 80.1L120.8 80.8L121.4 81.4L122.1 82.1L122.8 82.8L123.5 83.5L124.2 84.2L124.9 84.9L125.6 85.6L126.3 86.3L127 87L127.7 87.7L128.4 88.4L129.1 89.1L129.7 89.7L130.4 90.4L131.1 91.1L131.8 91.8L132.5 92.5L133.2 93.2L133.9 93.9L134.6 94.6L135.3 95.3L136 96L136.7 96.7L137.4 97.4L138 98L138.7 98.7L139.4 99.4L140.1 100.1L140.8 100.8L141.5 101.5L142.2 102.2L142.9 102.9L143.6 103.6L144.3 104.3L145 105L145.7 105.7L146.3 106.3L147 107L147.7 107.7L148.4 108.4L149.1 109.1L149.8 109.8L150.5 110.5L151.2 111.2L151.9 111.9L152.6 112.6L153.3 113.3L154 114L154.6 114.6L155.3 115.3L156 116L156.7 116.7L157.4 117.4L158.1 118.1L158.8 118.8L159.5 119.5L160.2 120.2L160.9 120.9L161.6 121.6L162.3 122.3L162.9 122.9L163.6 123.6L164.3 124.3L165 125L165.7 125.7L166.4 126.4L167.1 127.1L167.8 127.8L168.5 128.5L169.2 129.2L169.9 129.9L170.6 130.6L171.2 131.2L171.9 131.9L172.6 132.6L173.3 133.3L174 134L174.7 134.7L175.4 135.4L176.1 136.1L176.8 136.8L177.5 137.5L178.2 138.2L178.9 138.9L179.5 139.5L180.2 140.2L180.9 140.9L181.6 141.6L182.3 142.3L183 143L183.7 143.7L184.4 144.4L185.1 145.1L185.8 145.8L186.5 146.5L187.2 147.2L187.8 147.8L188.5 148.5L189.2 149.2L189.9 149.9L190.6 150.6L191.3 151.3L192 152L192.7 152.7L193.4 153.4L194.1 154.1L194.8 154.8L195.5 155.5L196.1 156.1L196.8 156.8L197.5 157.5L198.2 158.2L198.9 158.9L199.6 159.6L200.3 160.3L201 161L201.7 161.7L202.4 162.4L203.1 163.1L203.8 163.8L204.4 164.4L205.1 165.1L205.8 165.8L206.5 166.5L207.2 167.2L207.9 167.9L208.6 168.6L209.3 169.3L210 170L210.7 170.7L211.4 171.4L212.1 172.1L212.7 172.7L213.4 173.4L214.1 174.1L214.8 174.8L215.5 175.5L216.2 176.2L216.9 176.9L217.6 177.6L218.3 178.3L219 179L219.7 179.7L220.4 180.4L221 181L221.7 181.7L222.4 182.4L223.1 183.1L223.8 183.8L224.5 184.5L225.2 185.2L225.9 185.9L226.6 186.6L227.3 187.3L228 188L228.7 188.7L229.3 189.3L230 190L230.7 190.7L231.4 191.4L232.1 192.1L232.8 192.8L233.5 193.5L234.2 194.2L234.9 194.9L235.6 195.6L236.3 196.3L237 197L237.6 197.6L238.3 198.3L239 199L239.7 199.7L240.4 200.4L241.1 201.1L241.8 201.8L242.5 202.5L243.2 203.2L243.9 203.9L244.6 204.6L245.3 205.3L245.9 205.9L246.6 206.6L247.3 207.3L248 208L248.7 208.7L249.4 209.4L250.1 210.1L250.8 210.8L251.5 211.5L252.2 212.2L252.9 212.9L253.6 213.6L254.2 214.2L254.9 214.9L255.6 215.6L256.3 216.3L257 217L257.7 217.7L258.4 218.4L259.1 219.1L259.8 219.8L260.5 220.5L261.2 221.2L261.9 221.9L262.5 222.5L263.2 223.2L263.9 223.9L264.6 224.6L265.3 225.3L266 226" stroke-width="2.2"/><text x="220" y="168.9" fill="currentColor" stroke="none" text-anchor="start" font-style="italic">d₂</text><polygon points="50,210 250,210 150,110" fill="currentColor" fill-opacity="0.12"/><circle cx="50" cy="210" r="3" fill="currentColor" stroke="none"/><text x="39.5" y="204.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><circle cx="250" cy="210" r="3" fill="currentColor" stroke="none"/><text x="260.5" y="204.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><circle cx="150" cy="110" r="3" fill="currentColor" stroke="none"/><text x="150" y="100.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text></svg>', true),
  -- mat-14-028 · doğrulandı
  ('a8505c3d-be1d-578e-8751-949f9e0bbefd'::uuid, 'Matematik & Geometri', 'Analitik Geometri ve Katı Cisimler', 'multiple_choice', 2,
   'Dik koordinat düzleminde $A(2, -1)$ noktasından geçen ve $2x + 3y - 6 = 0$ doğrusuna dik olan doğrunun $y$-eksenini kestiği noktanın ordinatı kaçtır?',
   '{"options":["$-6$","$-5$","$-4$","$-2$","$4$"],"correctIndex":2}'::jsonb,
   'Verilen $2x + 3y - 6 = 0$ doğrusunun eğimi $m_1 = -\dfrac{2}{3}$''tür. Bu doğruya dik olan doğrunun eğimi $m_1 \cdot m_2 = -1$ kuralından $m_2 = \dfrac{3}{2}$ olur.
$A(2, -1)$ noktasından geçen doğru denklemi yazılır:
$$y - (-1) = \frac{3}{2}(x - 2) \Rightarrow y = \frac{3}{2}x - 4$$
Doğrunun $y$-eksenini kestiği noktada $x = 0$ olduğundan ordinat $y = -4$ bulunur.',
   'D şıkkı ($-2$) veya B şıkkı ($-5$), dik doğruların eğimleri çarpımı $-1$ yerine eğimi yalnızca işaret değiştirip $\dfrac{2}{3}$ ya da ters çevirmeden $-\dfrac{3}{2}$ alan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-14-029 · şekilli · doğrulandı
  ('cf76782f-2799-5a6b-9c97-8e2df9b2f5d5'::uuid, 'Matematik & Geometri', 'Analitik Geometri ve Katı Cisimler', 'multiple_choice', 2,
   'Şekilde ayrıt uzunlukları $4$ cm, $6$ cm ve $8$ cm olan dikdörtgenler prizması biçimindeki kapalı kap, $4 \times 6$''lık yüzeyi taban olacak şekilde yerleştirildiğinde içinde $6$ cm yüksekliğinde su bulunmaktadır.
Bu kap, $6 \times 8$''lik yüzeyi taban olacak biçimde yan yatırıldığında kaptaki suyun yeni yüksekliği kaç cm olur?',
   '{"options":["1,5","2","2,5","3","4"],"correctIndex":3}'::jsonb,
   'Kap yatırıldığında içindeki suyun hacmi değişmez. İlk durumda suyun hacmi:
$$V_{\text{su}} = 4 \cdot 6 \cdot 6 = 144\text{ cm}^3$$
İkinci durumda taban alanı $6 \cdot 8 = 48\text{ cm}^2$ olur. Yeni su yüksekliği $h$ için $48 \cdot h = 144 \Rightarrow h = \dfrac{144}{48} = 3$ cm bulunur.',
   'B şıkkı ($2$), ilk durumda su yüksekliği $6$ yerine kabın tüm yüksekliği $8$''in yarısını alıp farklı işlem yapan veya $4 \cdot 6$ yerine yanlış taban alanı bölen adayı; E şıkkı ($4$) ise doğrudan üçüncü ayrıt olan $4$''ü su yüksekliği sananları yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 224.2 260" width="224.2" height="260" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><line x1="30" y1="230" x2="156.3" y2="230"/><text x="93.2" y="246.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">6</text><line x1="156.3" y1="230" x2="156.3" y2="61.6"/><line x1="156.3" y1="61.6" x2="30" y2="61.6"/><line x1="30" y1="61.6" x2="30" y2="230"/><text x="16.1" y="150.3" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">8</text><line x1="30" y1="61.6" x2="67.9" y2="30"/><line x1="67.9" y1="30" x2="194.2" y2="30"/><line x1="194.2" y1="30" x2="156.3" y2="61.6"/><line x1="156.3" y1="230" x2="194.2" y2="198.4"/><text x="183.7" y="228.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">4</text><line x1="194.2" y1="198.4" x2="194.2" y2="30"/><line x1="30" y1="230" x2="67.9" y2="198.4" stroke-dasharray="6 5"/><line x1="67.9" y1="198.4" x2="194.2" y2="198.4" stroke-dasharray="6 5"/><line x1="67.9" y1="198.4" x2="67.9" y2="30" stroke-dasharray="6 5"/></svg>', true),
  -- mat-14-030 · şekilli · doğrulandı
  ('22732df4-77bd-59af-8f73-6b0c51111e2c'::uuid, 'Matematik & Geometri', 'Analitik Geometri ve Katı Cisimler', 'multiple_choice', 3,
   'Şekildeki ayrıt uzunlukları $3$ cm, $5$ cm ve $15$ cm olan dikdörtgenler prizması biçimindeki kutunun $A$ köşesinde bulunan bir karınca, kutunun yüzeyleri üzerinden yürüyerek $G$ köşesine gidecektir.
Buna göre karıncanın alabileceği en kısa yol kaç cm''dir?',
   '{"options":["12","13","15","23","17"],"correctIndex":4}'::jsonb,
   'Yüzeyler üzerinden $A$''dan en uzak köşe $G$''ye giden karıncanın izleyeceği düzlemsel açılımda en kısa yol $\sqrt{(x + y)^2 + z^2}$ biçimindedir (burada $x, y, z$ ayrıtların üç farklı permütasyonudur). Toplamı en küçük yapmak için en küçük iki ayrıt ($3$ ve $5$) toplanıp dik kenarlardan biri yapılır:
$$\sqrt{(3 + 5)^2 + 15^2} = \sqrt{8^2 + 15^2} = \sqrt{64 + 225} = \sqrt{289} = 17\text{ cm}$$
(Diğer iki açılımda $\sqrt{18^2 + 5^2} = \sqrt{349}$ ve $\sqrt{20^2 + 3^2} = \sqrt{409}$ elde edilir ve ikisi de $17$''den büyüktür.)',
   'D şıkkı ($23$), yüzeylerden geçerken Pisagor almak yerine doğrudan üç ayrıtı ($3 + 5 + 15 = 23$) kenarlar boyunca toplayan adayı yakalar. En kısa yol iki yüzün aynı düzleme açılmasıyla oluşan hipotenüstür.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 340 165.5" width="340" height="165.5" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><line x1="30" y1="135.5" x2="260.1" y2="135.5"/><text x="145.1" y="152" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">15</text><line x1="260.1" y1="135.5" x2="260.1" y2="68.4"/><line x1="260.1" y1="68.4" x2="30" y2="68.4"/><line x1="30" y1="68.4" x2="30" y2="135.5"/><text x="16.1" y="106.5" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">3</text><line x1="30" y1="68.4" x2="79.9" y2="30"/><line x1="79.9" y1="30" x2="310" y2="30"/><line x1="310" y1="30" x2="260.1" y2="68.4"/><line x1="260.1" y1="135.5" x2="310" y2="97.1"/><text x="293.1" y="131.3" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">5</text><line x1="310" y1="97.1" x2="310" y2="30"/><line x1="30" y1="135.5" x2="79.9" y2="97.1" stroke-dasharray="6 5"/><line x1="79.9" y1="97.1" x2="310" y2="97.1" stroke-dasharray="6 5"/><line x1="79.9" y1="97.1" x2="79.9" y2="30" stroke-dasharray="6 5"/><circle cx="30" cy="135.5" r="3" fill="currentColor" stroke="none"/><text x="19.5" y="150.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><text x="270.6" y="150.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="274.1" y="73.3" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="19.5" y="62.8" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">D</text><text x="79.9" y="116" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">E</text><text x="324" y="102" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">F</text><circle cx="310" cy="30" r="3" fill="currentColor" stroke="none"/><text x="320.5" y="24.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">G</text><text x="79.9" y="20.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">H</text></svg>', true)
on conflict (id) do update set
  lesson = excluded.lesson, topic = excluded.topic, question_type = excluded.question_type,
  difficulty = excluded.difficulty, prompt_text = excluded.prompt_text,
  interaction_data = excluded.interaction_data, explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap, exam_scopes = excluded.exam_scopes,
  education_level = excluded.education_level, figure_svg = excluded.figure_svg, is_active = true;

commit;
