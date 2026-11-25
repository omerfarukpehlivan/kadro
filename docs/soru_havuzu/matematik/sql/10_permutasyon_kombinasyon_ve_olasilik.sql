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
