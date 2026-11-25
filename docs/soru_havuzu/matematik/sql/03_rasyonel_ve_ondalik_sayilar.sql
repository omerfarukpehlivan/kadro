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
