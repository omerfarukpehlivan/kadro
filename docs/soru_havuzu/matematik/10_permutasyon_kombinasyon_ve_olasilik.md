---
ders: Matematik & Geometri
konu: Permütasyon, Kombinasyon ve Olasılık
kod: mat
kapsam: [lisans_gygk, b_grubu_gygk]
---

### mat-10-001
- zorluk: 1
- dogru: C
- dogrulama: 4 * 3 * 2

**Soru:**
$$A = \{1, 2, 3, 4, 5\}$$
kümesinin elemanları kullanılarak rakamları birbirinden farklı üç basamaklı kaç çift doğal sayı yazılabilir?

**Şıklar:**
A) 12
B) 18
C) 24
D) 36
E) 60

**Açıklama:**
Sayının çift olabilmesi için birler basamağına kümedeki çift rakamlardan ($2$ veya $4$) biri yazılmalıdır; yani birler basamağı için $2$ seçenek vardır. Rakamlar farklı olacağından kalan $4$ rakam yüzler basamağına ($4$ seçenek), ardından kalan $3$ rakam onlar basamağına ($3$ seçenek) yazılır. Çarpma ilkesiyle $4 \cdot 3 \cdot 2 = 24$ farklı çift sayı yazılabilir.

**Çeldirici Tuzağı:**
E şıkkı (60), çift olma koşulunu unutup tüm rakamları farklı üç basamaklı sayıları ($5 \cdot 4 \cdot 3 = 60$) hesaplayan adayı yakalar.

### mat-10-002
- zorluk: 1
- dogru: A
- dogrulama: fact(4) * fact(2)

**Soru:**
Birbirinden farklı $3$ matematik kitabı ve $2$ tarih kitabı düz bir rafa, tarih kitapları yan yana olmak şartıyla kaç farklı biçimde sıralanabilir?

**Şıklar:**
A) 48
B) 24
C) 36
D) 72
E) 120

**Açıklama:**
Yan yana durması gereken $2$ tarih kitabı tek bir paket gibi düşünülür. $3$ matematik kitabı ile bu $1$ paket toplam $4$ nesne oluşturur ve $4! = 24$ farklı biçimde dizilir. Tarih kitapları kendi aralarında $2! = 2$ farklı biçimde yer değiştirebildiğinden toplam $24 \cdot 2 = 48$ farklı sıralama vardır.

**Çeldirici Tuzağı:**
B şıkkı (24), tarih kitaplarını tek paket sayıp $4! = 24$ bulduktan sonra iki tarih kitabının kendi aralarında yer değiştirmesini ($2!$) çarpmayı unutan adayı yakalar.

### mat-10-003
- zorluk: 2
- dogru: D
- dogrulama: fact(7) / (fact(2) * fact(3) * fact(2))

**Soru:**
`MARMARA` kelimesindeki harflerin yerleri değiştirilerek $7$ harfli anlamlı ya da anlamsız kaç farklı kelime yazılabilir?

**Şıklar:**
A) 105
B) 140
C) 180
D) 210
E) 420

**Açıklama:**
$7$ harfli `MARMARA` kelimesinde M harfi $2$ kez, A harfi $3$ kez ve R harfi $2$ kez tekrar etmektedir. Tekrarlı permütasyon formülüne göre farklı sıralamaların sayısı $\dfrac{7!}{2! \cdot 3! \cdot 2!} = \dfrac{5.040}{2 \cdot 6 \cdot 2} = \dfrac{5.040}{24} = 210$ bulunur.

**Çeldirici Tuzağı:**
E şıkkı (420), paydadaki tekrar eden harflerden M veya R'nin $2!$ çarpanını eksik yazıp yalnızca $12$'ye bölen adayı yakalar.

### mat-10-004
- zorluk: 2
- dogru: E
- dogrulama: fact(5 - 1) * fact(2)

**Soru:**
Anne, baba ve $4$ çocuktan oluşan $6$ kişilik bir aile yuvarlak bir masa etrafında, anne ve baba yan yana oturmak şartıyla kaç farklı biçimde oturabilir?

**Şıklar:**
A) 24
B) 60
C) 120
D) 240
E) 48

**Açıklama:**
Anne ve baba yan yana oturacağı için $1$ grup kabul edilir; $4$ çocukla birlikte yuvarlak masa etrafına dizilecek toplam $5$ birim oluşur. Dairesel permütasyonda $5$ birim $(5 - 1)! = 4! = 24$ farklı biçimde oturur. Anne ile babanın kendi aralarındaki yer değişimi $2! = 2$ olduğundan toplam $24 \cdot 2 = 48$ farklı oturma düzeni elde edilir.

**Çeldirici Tuzağı:**
D şıkkı (240), yuvarlak masa yerine düz sıra permütasyonu ($5! \cdot 2!$) uygulayan; A şıkkı (24) ise anne ve babanın yer değişimini ($2!$) çarpmayı unutan adayı yakalar.

### mat-10-005
- zorluk: 1
- dogru: B
- dogrulama: C(5, 2) * C(4, 2)

**Soru:**
$5$ erkek ve $4$ kadın arasından $2$ erkek ve $2$ kadından oluşan $4$ kişilik bir komisyon kaç farklı biçimde seçilebilir?

**Şıklar:**
A) 16
B) 60
C) 72
D) 120
E) 126

**Açıklama:**
$5$ erkekten $2$ erkek $\binom{5}{2} = \dfrac{5 \cdot 4}{2} = 10$ farklı biçimde, $4$ kadından $2$ kadın $\binom{4}{2} = \dfrac{4 \cdot 3}{2} = 6$ farklı biçimde seçilir. İki seçim birlikte yapıldığı için çarpma ilkesiyle $10 \cdot 6 = 60$ farklı komisyon oluşturulur.

**Çeldirici Tuzağı:**
A şıkkı (16), iki kombinasyon değerini çarpmak yerine toplayan ($10 + 6 = 16$) adayı yakalar. E şıkkı (126) ise cinsiyet şartı olmadan $\binom{9}{4}$ seçenlerin düştüğü tuzaktır.

### mat-10-006
- zorluk: 2
- dogru: C
- dogrulama: C(4, 2) * C(5, 2) + C(4, 3) * C(5, 1) + C(4, 4)

**Soru:**
$4$ doktor ve $5$ hemşire arasından içinde en az $2$ doktor bulunan $4$ kişilik bir sağlık ekibi kaç farklı biçimde oluşturulabilir?

**Şıklar:**
A) 60
B) 80
C) 81
D) 105
E) 121

**Açıklama:**
Ekipte en az $2$ doktor bulunması, $2$, $3$ veya $4$ doktor seçilmesi demektir:
$2$ doktor, $2$ hemşire: $\binom{4}{2}\binom{5}{2} = 6 \cdot 10 = 60$.
$3$ doktor, $1$ hemşire: $\binom{4}{3}\binom{5}{1} = 4 \cdot 5 = 20$.
$4$ doktor, $0$ hemşire: $\binom{4}{4}\binom{5}{0} = 1 \cdot 1 = 1$.
Toplam $60 + 20 + 1 = 81$ farklı ekip oluşturulabilir.

**Çeldirici Tuzağı:**
A şıkkı (60), "en az 2 doktor" koşulunu "tam 2 doktor" gibi anlayıp $3$ ve $4$ doktorlu durumları eklemeyen adayı yakalar.

### mat-10-007
- zorluk: 2
- dogru: A
- dogrulama: C(9, 3) - C(4, 3)

**Soru:**
Bir düzlemde bulunan $9$ farklı noktadan $4$'ü aynı doğru üzerindedir; bu $4$ nokta dışındaki hiçbir üç nokta doğrusal değildir.
Köşeleri bu noktalar olan en çok kaç farklı üçgen çizilebilir?

**Şıklar:**
A) 80
B) 78
C) 82
D) 84
E) 81

**Açıklama:**
Üçgen oluşturmak için doğrusal olmayan $3$ nokta seçilmelidir. Tüm $9$ noktadan seçilebilecek üçlülerin sayısı $\binom{9}{3} = \dfrac{9 \cdot 8 \cdot 7}{6} = 84$'tür. Aynı doğru üzerindeki $4$ noktadan seçilen $\binom{4}{3} = 4$ tane üçlü üçgen oluşturmaz. Dolayısıyla $84 - 4 = 80$ farklı üçgen çizilebilir.

**Çeldirici Tuzağı:**
D şıkkı (84), doğru üzerindeki $4$ noktanın üçgen oluşturamayacağını hesaba katmayıp doğrudan $\binom{9}{3} = 84$ bulan adayı yakalar.

### mat-10-008
- zorluk: 2
- dogru: D
- dogrulama: (C(4, 2) + C(5, 2)) / C(9, 2)

**Soru:**
Bir torbada aynı büyüklükte $4$ kırmızı ve $5$ mavi bilye vardır.
Torbadan aynı anda rastgele çekilen $2$ bilyenin aynı renkte olma olasılığı kaçtır?

**Şıklar:**
A) $\dfrac{1}{6}$
B) $\dfrac{5}{18}$
C) $\dfrac{1}{3}$
D) $\dfrac{4}{9}$
E) $\dfrac{5}{9}$

**Açıklama:**
$9$ bilyeden $2$ bilye çekmenin tüm durumları $\binom{9}{2} = \dfrac{9 \cdot 8}{2} = 36$'dır. İki bilyenin de aynı renkte olması, ikisinin de kırmızı veya ikisinin de mavi olması demektir: $\binom{4}{2} + \binom{5}{2} = 6 + 10 = 16$. Olasılık $\dfrac{16}{36} = \dfrac{4}{9}$ bulunur.

**Çeldirici Tuzağı:**
E şıkkı ($\frac{5}{9}$), istenen durum olan aynı renk yerine zıt renk olma olasılığını ($\dfrac{4 \cdot 5}{36} = \dfrac{5}{9}$) hesaplayan adayı yakalar.

### mat-10-009
- zorluk: 3
- dogru: E
- dogrulama: 1 - (1 - 2/3) * (1 - 3/4)

**Soru:**
Bir hedefi Ahmet'in vurma olasılığı $\dfrac{2}{3}$, Mehmet'in vurma olasılığı ise $\dfrac{3}{4}$'tür.
Ahmet ve Mehmet aynı anda hedefe birer atış yaptıklarında hedefin vurulmuş olma olasılığı kaçtır?

**Şıklar:**
A) $\dfrac{1}{12}$
B) $\dfrac{1}{2}$
C) $\dfrac{7}{12}$
D) $\dfrac{5}{6}$
E) $\dfrac{11}{12}$

**Açıklama:**
Hedefin vurulmuş olması en az birinin vurması demektir; bunun tümleyeni ikisinin de hedefi vuramamasıdır. Ahmet'in vuramama olasılığı $1 - \dfrac{2}{3} = \dfrac{1}{3}$, Mehmet'in vuramama olasılığı $1 - \dfrac{3}{4} = \dfrac{1}{4}$'tür. İkisinin de vuramama olasılığı $\dfrac{1}{3} \cdot \dfrac{1}{4} = \dfrac{1}{12}$ olduğundan hedefin vurulma olasılığı $1 - \dfrac{1}{12} = \dfrac{11}{12}$ bulunur.

**Çeldirici Tuzağı:**
B şıkkı ($\frac{1}{2}$), en az birinin vurması yerine ikisinin birden vurma olasılığını ($\dfrac{2}{3} \cdot \dfrac{3}{4} = \dfrac{1}{2}$) hesaplayan adayı yakalar. A şıkkı ($\frac{1}{12}$) ise tümleyeni bulup $1$'den çıkarmayı unutanların tuzağıdır.

### mat-10-010
- zorluk: 3
- dogru: B
- dogrulama: 2 / (6 - 2 + 1)

**Soru:**
İki hilesiz zar birlikte atıldığında üst yüze gelen sayıların toplamının $8$ olduğu biliniyor.
Buna göre zarların ikisinin de tek sayı gelmiş olma olasılığı kaçtır?

**Şıklar:**
A) $\dfrac{1}{18}$
B) $\dfrac{2}{5}$
C) $\dfrac{1}{3}$
D) $\dfrac{1}{5}$
E) $\dfrac{3}{5}$

**Açıklama:**
Koşullu olasılık sorusu olduğu için örnek uzay toplamı $8$ olan ikililerle sınırlanır: $(2, 6)$, $(3, 5)$, $(4, 4)$, $(5, 3)$, $(6, 2)$ olmak üzere $5$ olası durum vardır. Bunların içinde her iki zarın da tek sayı olduğu durumlar $(3, 5)$ ve $(5, 3)$ olmak üzere $2$ tanedir. İstenen olasılık $\dfrac{2}{5}$ bulunur.

**Çeldirici Tuzağı:**
A şıkkı ($\frac{1}{18}$), koşullu olasılık gereği örnek uzayı $5$'e daraltmak yerine tüm zar uzayı olan $36$'ya bölerek $\frac{2}{36}$ bulan adayı yakalar. D şıkkı ($\frac{1}{5}$) ise $(3, 5)$ ile $(5, 3)$ ikililerini tek durum sananların tuzağıdır.

### mat-10-011
- zorluk: 1
- dogru: B
- dogrulama: (3 * 4) * (3 * 2)

**Soru:**
A kentinden B kentine $3$ farklı yol, B kentinden C kentine ise $4$ farklı yol vardır.
A'dan yola çıkıp B'ye uğrayarak C'ye giden ve giderken kullandığı yolların hiçbirini kullanmadan B üzerinden A'ya geri dönen bir kişi kaç farklı gidiş-dönüş yapabilir?

**Şıklar:**
A) 36
B) 72
C) 132
D) 144
E) 24

**Açıklama:**
Gidişte A'dan B'ye $3$, B'den C'ye $4$ farklı yol olmak üzere $3 \cdot 4 = 12$ rota vardır. Dönüşte C'den B'ye giderken kullanılan $1$ yol hariç $4 - 1 = 3$ yol, B'den A'ya giderken kullanılan $1$ yol hariç $3 - 1 = 2$ yol kullanılabilir ($3 \cdot 2 = 6$ rota). Toplam $12 \cdot 6 = 72$ farklı gidiş-dönüş yapılır.

**Çeldirici Tuzağı:**
C şıkkı (132), dönüşte her iki etaptan birer yol eksiltmek yerine toplam $12$ rotadan yalnızca $1$ rota çıkarıp $12 \cdot 11 = 132$ hesaplayan adayı; D şıkkı (144) ise yol şartını unutanları yakalar.

### mat-10-012
- zorluk: 1
- dogru: D
- dogrulama: 4 * 4 * 3

**Soru:**
$$A = \{0, 1, 2, 3, 4\}$$
kümesinin elemanlarıyla rakamları birbirinden farklı üç basamaklı kaç doğal sayı yazılabilir?

**Şıklar:**
A) 24
B) 36
C) 60
D) 48
E) 100

**Açıklama:**
Üç basamaklı bir sayının yüzler basamağına $0$ yazılamaz; bu yüzden yüzler basamağı için $\{1, 2, 3, 4\}$ olmak üzere $4$ seçenek vardır. Onlar basamağına $0$ gelebileceğinden kalan $4$ rakamdan biri ($4$ seçenek), birler basamağına ise kalan $3$ rakamdan biri ($3$ seçenek) yazılır. Toplam $4 \cdot 4 \cdot 3 = 48$ sayı yazılabilir.

**Çeldirici Tuzağı:**
C şıkkı (60), $0$'ın yüzler basamağına gelemeyeceğini unutup $5 \cdot 4 \cdot 3 = 60$ hesaplayan adayı yakalar.

### mat-10-013
- zorluk: 2
- dogru: A
- dogrulama: (fact(6) / (fact(2) * fact(3))) * (5 / 6)

**Soru:**
$0, 1, 1, 2, 2, 2$ rakamlarının tamamı birer kez kullanılarak $6$ basamaklı kaç farklı doğal sayı yazılabilir?

**Şıklar:**
A) 50
B) 60
C) 40
D) 30
E) 120

**Açıklama:**
Tekrarlı permütasyonla $0$ dahil tüm dizilişlerin sayısı $\dfrac{6!}{2! \cdot 3!} = \dfrac{720}{12} = 60$'tır. Ancak $6$ rakamdan biri olan $0$ başa gelemez; başa gelemeyen $1$ adet $0$ dışındaki $5$ rakamdan biri başa gelebileceğinden geçerli dizilişler tümünün $\dfrac{5}{6}$'sıdır: $60 \cdot \dfrac{5}{6} = 50$ farklı sayı yazılabilir.

**Çeldirici Tuzağı:**
B şıkkı (60), $0$'ın en soldaki basamağa gelmesi durumunda sayının $6$ basamaklı olmayacağını unutup tüm permütasyonları ($60$) işaretleyen adayı yakalar.

### mat-10-014
- zorluk: 2
- dogru: E
- dogrulama: C(4 + 3, 3)

**Soru:**
Kareli bir düzlemde $A$ noktasında bulunan bir hareketli, yalnızca sağa ve yukarı doğru birim adımlar atarak $A$'nın $4$ birim sağında ve $3$ birim yukarısında bulunan $B$ noktasına ulaşmak istemektedir.
Buna göre $A$'dan $B$'ye en kısa yoldan kaç farklı biçimde gidebilir?

**Şıklar:**
A) 12
B) 21
C) 28
D) 42
E) 35

**Açıklama:**
En kısa yol için toplam $4$ kez sağa (S) ve $3$ kez yukarı (Y) olmak üzere $7$ adım atılmalıdır. `SSSSYYY` harflerinin farklı sıralanışı tekrarlı permütasyonla $\dfrac{7!}{4! \cdot 3!} = \binom{7}{3} = \dfrac{7 \cdot 6 \cdot 5}{6} = 35$ bulunur.

**Çeldirici Tuzağı:**
A şıkkı (12), adım sayılarını permütasyon yerine doğrudan çarpıp $4 \cdot 3 = 12$ bulan adayı yakalar.

### mat-10-015
- zorluk: 1
- dogru: C
- dogrulama: (-1 + sqrt(1 + 8 * 21)) / 2

**Soru:**
$n \ge 2$ bir tam sayı olmak üzere
$$\binom{n}{2} + \binom{n}{1} = 21$$
eşitliğini sağlayan $n$ değeri kaçtır?

**Şıklar:**
A) 4
B) 5
C) 6
D) 7
E) 8

**Açıklama:**
Kombinasyon açılımları yazılır: $\dfrac{n(n - 1)}{2} + n = 21 \Rightarrow \dfrac{n^2 - n + 2n}{2} = 21 \Rightarrow n(n + 1) = 42$ (veya Pascal özdeşliğinden $\binom{n + 1}{2} = 21$). Ardışık iki pozitif tam sayının çarpımı $6 \cdot 7 = 42$ olduğundan $n = 6$ bulunur.

**Çeldirici Tuzağı:**
D şıkkı (7), $\binom{n + 1}{2} = 21$ özdeşliğinden $n + 1 = 7$ bulup $n$ yerine $7$'yi işaretleyen adayı yakalar.

### mat-10-016
- zorluk: 2
- dogru: B
- dogrulama: C(7, 3) - C(5, 1)

**Soru:**
$7$ kişilik bir gruptan $3$ kişilik bir temsil ekibi seçilecektir.
Gruptaki Ali ve Veli aynı ekipte birlikte bulunmak istemediklerine göre bu ekip kaç farklı biçimde seçilebilir?

**Şıklar:**
A) 25
B) 30
C) 32
D) 35
E) 20

**Açıklama:**
Hiçbir koşul olmadan $7$ kişiden $3$ kişi $\binom{7}{3} = 35$ farklı biçimde seçilir. Ali ve Veli'nin ikisinin de aynı ekipte bulunduğu istenmeyen durumlarda kalan $5$ kişiden $1$ kişi $\binom{5}{1} = 5$ farklı biçimde seçilir. Tüm durumlardan istenmeyenler çıkarılırsa $35 - 5 = 30$ farklı ekip seçilebilir.

**Çeldirici Tuzağı:**
D şıkkı (35), kısıtı hesaba katmayan adayı; E şıkkı (20) ise ikisini de tamamen gruptan çıkarıp $\binom{5}{3} = 10$ veya ikisinin tek başına olma sayısını yanlış toplayanları yakalar.

### mat-10-017
- zorluk: 2
- dogru: D
- dogrulama: C(4, 2) * C(5, 2)

**Soru:**
Birbirine paralel $4$ yatay doğru ile birbirine paralel $5$ dikey doğrunun kesişmesiyle en fazla kaç tane paralelkenar oluşur?

**Şıklar:**
A) 20
B) 36
C) 40
D) 60
E) 120

**Açıklama:**
Bir paralelkenar oluşturmak için $2$ tane yatay doğru ve $2$ tane dikey doğru seçmek gerekir. $4$ yatay doğrudan $2$'si $\binom{4}{2} = 6$ farklı biçimde, $5$ dikey doğrudan $2$'si $\binom{5}{2} = 10$ farklı biçimde seçilir. Toplam $6 \cdot 10 = 60$ paralelkenar oluşur.

**Çeldirici Tuzağı:**
A şıkkı (20), doğru çiftleri yerine doğrudan $4 \cdot 5 = 20$ kesişim noktasını (veya $4 + 5$) çarpan adayı yakalar.

### mat-10-018
- zorluk: 2
- dogru: C
- dogrulama: (C(3, 2) + C(3, 3)) / 2^3

**Soru:**
Hilesiz bir madeni para art arda $3$ kez atıldığında en az $2$ kez tura gelme olasılığı kaçtır?

**Şıklar:**
A) $\dfrac{1}{4}$
B) $\dfrac{3}{8}$
C) $\dfrac{1}{2}$
D) $\dfrac{5}{8}$
E) $\dfrac{3}{4}$

**Açıklama:**
$3$ para atışında örnek uzay $2^3 = 8$ elemandan oluşur. En az $2$ tura gelmesi, $2$ tura ($\binom{3}{2} = 3$ durum: TTY, TYT, YTT) veya $3$ tura ($\binom{3}{3} = 1$ durum: TTT) gelmesi demektir. İstenen durum sayısı $3 + 1 = 4$ olduğundan olasılık $\dfrac{4}{8} = \dfrac{1}{2}$ bulunur.

**Çeldirici Tuzağı:**
B şıkkı ($\frac{3}{8}$), "en az 2 tura" ifadesini "tam 2 tura" gibi yorumlayıp $3$ tura durumunu (TTT) eklemeyi unutan adayı yakalar.

### mat-10-019
- zorluk: 1
- dogru: A
- dogrulama: 4 / (9 - 1 + 1)

**Soru:**
$$A = \{1, 2, 3, 4, 5, 6, 7, 8, 9\}$$
kümesinden rastgele seçilen bir sayının asal sayı olma olasılığı kaçtır?

**Şıklar:**
A) $\dfrac{4}{9}$
B) $\dfrac{1}{3}$
C) $\dfrac{5}{9}$
D) $\dfrac{2}{9}$
E) $\dfrac{1}{2}$

**Açıklama:**
Kümedeki $9$ elemandan asal olanlar $2, 3, 5, 7$ olmak üzere $4$ tanedir ($1$ asal sayı değildir). Bu nedenle istenen olasılık $\dfrac{4}{9}$ bulunur.

**Çeldirici Tuzağı:**
C şıkkı ($\frac{5}{9}$), en küçük asal sayının $2$ olduğunu unutup $1$'i de asal sayan adayı yakalar.

### mat-10-020
- zorluk: 2
- dogru: E
- dogrulama: 1 - (3 / 6)^2

**Soru:**
İki hilesiz zar birlikte atıldığında üst yüze gelen sayıların çarpımının çift sayı olma olasılığı kaçtır?

**Şıklar:**
A) $\dfrac{1}{4}$
B) $\dfrac{1}{2}$
C) $\dfrac{2}{3}$
D) $\dfrac{5}{6}$
E) $\dfrac{3}{4}$

**Açıklama:**
İki sayının çarpımının tek olabilmesi için her iki sayının da tek olması gerekir; diğer tüm durumlarda çarpım çifttir. Bir zarda tek gelme olasılığı $\dfrac{3}{6} = \dfrac{1}{2}$ olduğundan ikisinin de tek gelme olasılığı $\dfrac{1}{2} \cdot \dfrac{1}{2} = \dfrac{1}{4}$'tür. Tümleyeninden çarpımın çift olma olasılığı $1 - \dfrac{1}{4} = \dfrac{3}{4}$ bulunur.

**Çeldirici Tuzağı:**
B şıkkı ($\frac{1}{2}$), zarda çift ve tek sayıların eşit sayıda olmasından hareketle çarpımlarının da yarı yarıya çift çıkacağını sanan adayı yakalar.

### mat-10-021
- zorluk: 3
- dogru: D
- dogrulama: (3 / 5) * (5 / 6) + (2 / 5) * (4 / 6)

**Soru:**
A torbasında $3$ kırmızı, $2$ beyaz; B torbasında $4$ kırmızı, $1$ beyaz bilye vardır.
A torbasından rastgele $1$ bilye çekilip rengine bakılmadan B torbasına atılıyor, ardından B torbasından rastgele $1$ bilye çekiliyor.
Buna göre B torbasından çekilen bilyenin kırmızı olma olasılığı kaçtır?

**Şıklar:**
A) $\dfrac{2}{5}$
B) $\dfrac{3}{5}$
C) $\dfrac{4}{5}$
D) $\dfrac{23}{30}$
E) $\dfrac{7}{10}$

**Açıklama:**
İki ayrık durum incelenir:
1. A'dan kırmızı çekilip B'ye atılırsa (olasılık $\dfrac{3}{5}$), B'de $5$ kırmızı, $1$ beyaz toplam $6$ bilye olur ve kırmızı çekme olasılığı $\dfrac{5}{6}$'dır.
2. A'dan beyaz çekilip B'ye atılırsa (olasılık $\dfrac{2}{5}$), B'de $4$ kırmızı, $2$ beyaz toplam $6$ bilye olur ve kırmızı çekme olasılığı $\dfrac{4}{6}$'dır.
Toplam olasılık $\dfrac{3}{5} \cdot \dfrac{5}{6} + \dfrac{2}{5} \cdot \dfrac{4}{6} = \dfrac{15 + 8}{30} = \dfrac{23}{30}$ bulunur.

**Çeldirici Tuzağı:**
C şıkkı ($\frac{4}{5}$), B torbasının başlangıçtaki kırmızı olasılığını kullanıp A'dan gelen bilyenin B'deki dağılımı değiştirdiğini hesaba katmayan adayı yakalar.

### mat-10-022
- zorluk: 3
- dogru: B
- dogrulama: (fact(4) * fact(3)) / fact(6)

**Soru:**
$3$ kız ve $3$ erkek öğrenci düz bir sıraya rastgele dizilecektir.
Buna göre kız öğrencilerin tamamının yan yana olma olasılığı kaçtır?

**Şıklar:**
A) $\dfrac{1}{20}$
B) $\dfrac{1}{5}$
C) $\dfrac{1}{10}$
D) $\dfrac{1}{30}$
E) $\dfrac{2}{5}$

**Açıklama:**
$6$ kişinin tüm sıralanış sayısı $6! = 720$'dir. Kızların yan yana olması için $3$ kız tek paket kabul edilir; $3$ erkekle birlikte $4$ nesne $4!$ biçimde sıralanır, kızlar da kendi içinde $3!$ yer değiştirir: $4! \cdot 3! = 24 \cdot 6 = 144$. Olasılık $\dfrac{144}{720} = \dfrac{1}{5}$ bulunur.

**Çeldirici Tuzağı:**
A şıkkı ($\frac{1}{20}$), kızların kendi arasındaki $3! = 6$ yer değişimini unutup yalnızca $\dfrac{4!}{6!} = \dfrac{1}{30}$ bulan veya paydada yanlış sadeleştirme yapan adayı yakalar.


### mat-10-023
- zorluk: 1
- dogru: A
- dogrulama: 4 * 5 * 3

**Soru:**
Bir dolapta $4$ farklı gömlek, $5$ farklı pantolon ve $3$ farklı çift ayakkabı bulunmaktadır.
Bir gömlek, bir pantolon ve bir çift ayakkabıdan oluşan bir kombin kaç farklı biçimde seçilebilir?

**Şıklar:**
A) 60
B) 48
C) 36
D) 24
E) 12

**Açıklama:**
Çarpma yoluyla sayma ilkesine göre her türden birer parça seçimi birbirinden bağımsızdır: $4 \cdot 5 \cdot 3 = 60$ farklı kombin oluşturulabilir.

**Çeldirici Tuzağı:**
E şıkkı ($12$), seçimler bağımsız olarak aynı anda yapıldığı hâlde çarpmak yerine toplama ($4 + 5 + 3 = 12$) yapan adayı yakalar.

### mat-10-024
- zorluk: 1
- dogru: D
- dogrulama: C(7, 4)

**Soru:**
$9$ kişilik bir basketbol aday kadrosundan $5$ kişilik bir maç kadrosu oluşturulacaktır. Takımın kaptanı Ali kadroda **kesinlikle yer alacak**, sakatlığı bulunan Burak ise kadroda **yer almayacaktır**.
Buna göre bu $5$ kişilik maç kadrosu kaç farklı biçimde seçilebilir?

**Şıklar:**
A) 15
B) 20
C) 21
D) 35
E) 56

**Açıklama:**
Ali kesinlikle seçileceğinden kadroda kalan $4$ kişilik yer için seçim yapılmalıdır. Burak da elendiğinden geriye kalan $9 - 2 = 7$ kişi arasından seçim yapılır:
$$\binom{7}{4} = \binom{7}{3} = \frac{7 \cdot 6 \cdot 5}{3 \cdot 2 \cdot 1} = 35$$
farklı kadro oluşturulabilir.

**Çeldirici Tuzağı:**
C şıkkı ($21$), Ali'nin seçilecek $5$ kişilik kontenjandan $1$ kişilik yeri doldurduğunu unutup kalan $7$ kişiden $5$ kişi ($\binom{7}{5} = 21$) seçen adayı yakalar.

### mat-10-025
- zorluk: 2
- dogru: B
- dogrulama: fact(5) - fact(4) * fact(2)

**Soru:**
Aralarında Zeynep ve Kerem'in de bulunduğu $5$ arkadaş düz bir sıraya yan yana oturacaktır.
Buna göre **Zeynep ile Kerem'in yan yana OLMADIĞI** kaç farklı oturma düzeni oluşturulabilir?

**Şıklar:**
A) 48
B) 72
C) 84
D) 96
E) 120

**Açıklama:**
Tüm oturma düzenlerinden ($5! = 120$), Zeynep ile Kerem'in yan yana olduğu düzenler çıkarılır. İkisi tek grup sayıldığında $4! \cdot 2! = 24 \cdot 2 = 48$ durumda yan yana olurlar.
Yan yana olmadıkları durum sayısı $120 - 48 = 72$ bulunur.

**Çeldirici Tuzağı:**
A şıkkı ($48$), sorudaki "yan yana olmadığı" ifadesi yerine ikisinin yan yana geldiği durumların sayısını işaretleyen adayı yakalar.

### mat-10-026
- zorluk: 2
- dogru: B
- dogrulama: 5 * 4 * 1 + 4 * 4 * 2

**Soru:**
$$A = \{0, 1, 2, 3, 4, 5\}$$
kümesinin elemanları kullanılarak rakamları birbirinden farklı üç basamaklı kaç farklı **çift** doğal sayı yazılabilir?

**Şıklar:**
A) 48
B) 52
C) 60
D) 64
E) 72

**Açıklama:**
$0$ rakamı yüzler basamağına gelemeyeceğinden birler basamağının $0$ olduğu ve olmadığı durumlar ayrı incelenir:
- **Birler basamağı $0$ ise:** Yüzler basamağı için kalan $5$ rakamdan biri, onlar basamağı için kalan $4$ rakamdan biri seçilir: $5 \cdot 4 \cdot 1 = 20$ sayı.
- **Birler basamağı $2$ veya $4$ ise ($2$ durum):** Yüzler basamağına $0$ ve birler basamağındaki rakam gelemeyeceği için $4$ seçenek, onlar basamağına ise $0$ dahil kalan $4$ rakamdan biri gelir: $4 \cdot 4 \cdot 2 = 32$ sayı.
Toplam $20 + 32 = 52$ farklı çift doğal sayı yazılabilir.

**Çeldirici Tuzağı:**
C şıkkı ($60$), üç durumun tamamında $0$'ın başa gelememesi ayrımını yapmadan $5 \cdot 4 \cdot 3 = 60$ biçiminde tek adımda çarpan adayı yakalar.

### mat-10-027
- zorluk: 2
- dogru: C
- dogrulama: fact(6) / (fact(2) * fact(2) * fact(2))

**Soru:**
`KARAKTER` kelimesindeki tüm harflerin yerleri değiştirilerek oluşturulan $8$ harfli anlamlı ya da anlamsız kelimelerin kaç tanesi **`T` harfi ile başlar ve `E` harfi ile biter**?

**Şıklar:**
A) 45
B) 60
C) 90
D) 180
E) 360

**Açıklama:**
Başta `T` ve sonda `E` harfleri sabitlendiğinde, ortaya geriye kalan `K, A, R, A, K, R` harfleri ($6$ harf: $2$ `K`, $2$ `A`, $2$ `R`) sıralanmalıdır. Tekrarlı permütasyonla:
$$\frac{6!}{2! \cdot 2! \cdot 2!} = \frac{720}{8} = 90$$
farklı kelime yazılabilir.

**Çeldirici Tuzağı:**
D şıkkı ($180$), başa `T` ve sona `E` sabitlemek yerine ikisinin uçlarda yer değiştirebileceğini düşünerek sonucu $2$ ile çarpan adayı yakalar.

### mat-10-028
- zorluk: 3
- dogru: A
- dogrulama: C(9, 3) - C(4, 3) - C(5, 3)

**Soru:**
Aynı düzlemde bulunan birbirine paralel iki doğrudan $d_1$ doğrusu üzerinde $4$ nokta, $d_2$ doğrusu üzerinde $5$ nokta işaretlenmiştir.
Köşeleri bu $9$ noktadan seçilen kaç farklı **üçgen** çizilebilir?

**Şıklar:**
A) 70
B) 74
C) 80
D) 84
E) 90

**Açıklama:**
$9$ noktadan herhangi $3$'ü $\binom{9}{3} = \dfrac{9 \cdot 8 \cdot 7}{6} = 84$ farklı biçimde seçilebilir. Ancak aynı doğru üzerindeki $3$ nokta doğrusal olduğundan üçgen oluşturmaz. $d_1$'den seçilen $\binom{4}{3} = 4$ ve $d_2$'den seçilen $\binom{5}{3} = 10$ üçlü çıkarılırsa:
$$84 - 4 - 10 = 70$$
farklı üçgen çizilebilir.

**Çeldirici Tuzağı:**
D şıkkı ($84$), tüm noktaların $\binom{9}{3} = 84$ üçlüsünü alıp doğrusal üçlüleri çıkarmayı unutan adayı; C şıkkı ($80$) ise yalnızca $4$'lü doğrudaki $\binom{4}{3} = 4$ üçlüyü çıkaranları yakalar.

### mat-10-029
- zorluk: 1
- dogru: B
- dogrulama: (12 / 2 + 12 / 3 - 12 / 6) / 12

**Soru:**
$1$'den $12$'ye kadar (sınırlar dahil) numaralandırılmış özdeş $12$ kart bir torbaya atılıyor.
Torbadan rastgele çekilen bir kartın üzerindeki sayının $2$ **veya** $3$ ile tam bölünebilme olasılığı kaçtır?

**Şıklar:**
A) $\dfrac{1}{2}$
B) $\dfrac{2}{3}$
C) $\dfrac{3}{4}$
D) $\dfrac{5}{6}$
E) $\dfrac{7}{12}$

**Açıklama:**
$1$'den $12$'ye kadar $2$ ile bölünen sayılar $\{2, 4, 6, 8, 10, 12\}$ ($6$ adet), $3$ ile bölünen sayılar $\{3, 6, 9, 12\}$ ($4$ adet) ve her ikisine birden ($6$ ile) bölünen sayılar $\{6, 12\}$ ($2$ adet) olmak üzere istenen eleman sayısı $6 + 4 - 2 = 8$'dir. Olasılık $\dfrac{8}{12} = \dfrac{2}{3}$ bulunur.

**Çeldirici Tuzağı:**
D şıkkı ($\frac{5}{6}$), $6$ ve $12$ sayılarını iki kez sayıp ortak katları çıkarmayı unutan ($6 + 4 = 10 \Rightarrow \dfrac{10}{12}$) adayı yakalar.

### mat-10-030
- zorluk: 2
- dogru: D
- dogrulama: 1 - 3 / C(6, 2)

**Soru:**
$3$ evli çiftin bulunduğu $6$ kişilik bir topluluktan rastgele seçilen $2$ kişinin **birbiriyle evli OLMAMA** olasılığı kaçtır?

**Şıklar:**
A) $\dfrac{1}{5}$
B) $\dfrac{2}{5}$
C) $\dfrac{3}{5}$
D) $\dfrac{4}{5}$
E) $\dfrac{5}{6}$

**Açıklama:**
$6$ kişiden $2$ kişi $\binom{6}{2} = 15$ farklı biçimde seçilir. Seçilen iki kişinin birbiriyle evli olması $3$ çift arasından $3$ farklı durumdur (olasılık $\dfrac{3}{15} = \dfrac{1}{5}$). Dolayısıyla birbiriyle evli **olmama** olasılığı $1 - \dfrac{1}{5} = \dfrac{4}{5}$ bulunur.

**Çeldirici Tuzağı:**
A şıkkı ($\frac{1}{5}$), sorudaki olumsuz eki atlayıp seçilen ikilinin evli olma olasılığını işaretleyen adayı yakalar.

### mat-10-031
- zorluk: 2
- dogru: D
- dogrulama: fact(3) * P(4, 3)

**Soru:**
$3$ erkek ve $3$ kız öğrenci, **hiçbir iki kız öğrenci yan yana gelmemek** şartıyla düz bir sıraya kaç farklı biçimde oturabilir?

**Şıklar:**
A) 36
B) 72
C) 108
D) 144
E) 288

**Açıklama:**
Önce $3$ erkek öğrenci $3! = 6$ farklı biçimde sıralanır. Erkeklerin sağında, solunda ve aralarında kızların yerleşebileceği $4$ boşluk oluşur (`_ E _ E _ E _`). Bu $4$ boşluğa $3$ kız öğrenci $P(4, 3) = 4 \cdot 3 \cdot 2 = 24$ farklı biçimde oturabilir. Toplam oturma düzeni $6 \cdot 24 = 144$'tür.

**Çeldirici Tuzağı:**
B şıkkı ($72$), $4$ boşluk yerine yalnızca dönüşümlü `K E K E K E` ve `E K E K E K` dizilimlerini ($3! \cdot 3! \cdot 2 = 72$) sayıp araya iki erkek gelebileceği durumları unutan adayı yakalar.

### mat-10-032
- zorluk: 1
- dogru: C
- dogrulama: 1 - (1 / 2)^3

**Soru:**
Hilesiz bir madeni para art arda $3$ kez havaya atıldığında **en az bir kez** tura gelme olasılığı kaçtır?

**Şıklar:**
A) $\dfrac{1}{8}$
B) $\dfrac{3}{8}$
C) $\dfrac{7}{8}$
D) $\dfrac{1}{2}$
E) $\dfrac{3}{4}$

**Açıklama:**
Toplam örnek uzay $2^3 = 8$ durumdan oluşur. "En az bir kez tura gelmesi" olayının tümleyeni, üç atışın tamamının yazı (`Y-Y-Y`) gelmesidir; bunun olasılığı $\dfrac{1}{8}$'dir. İstenen olasılık $1 - \dfrac{1}{8} = \dfrac{7}{8}$ bulunur.

**Çeldirici Tuzağı:**
B şıkkı ($\frac{3}{8}$), "en az bir tura" yerine "tam olarak bir tura" (`T-Y-Y`, `Y-T-Y`, `Y-Y-T`) olasılığını hesaplayan adayı yakalar.

### mat-10-033
- zorluk: 2
- dogru: B
- dogrulama: fact(4) * 2

**Soru:**
Anne, baba ve $5$ çocuktan oluşan $7$ kişilik bir aile yuvarlak bir masa etrafında, anne ile baba arasında **yalnızca en küçük çocuk** oturmak koşuluyla kaç farklı biçimde oturabilir?

**Şıklar:**
A) 24
B) 48
C) 72
D) 96
E) 120

**Açıklama:**
Anne, en küçük çocuk ve baba birbirinden ayrılmadan $3$'lü tek bir blok oluşturur (`Anne - EnKüçükÇocuk - Baba` veya `Baba - EnKüçükÇocuk - Anne` olmak üzere $2$ iç sıralama). Bu blok ve kalan $4$ çocuk olmak üzere toplam $5$ öge yuvarlak masa etrafında $(5 - 1)! = 4! = 24$ şekilde dizilir. Toplam oturma biçimi $24 \cdot 2 = 48$'dir.

**Çeldirici Tuzağı:**
A şıkkı ($24$), en küçük çocuğun ortada olduğu $2$ farklı anne-baba yönünü çarpmayı unutan adayı; E şıkkı ($120$) ise blok içindeki $3$ kişiyi serbestçe $3!$ ile çarpanları yakalar.

### mat-10-034
- zorluk: 3
- dogru: E
- dogrulama: C(9, 4) - C(4, 2) * C(5, 2)

**Soru:**
Dik koordinat düzleminde $A(0, 0)$ noktasından hareket eden bir robot, her adımda yalnızca $1$ birim sağa veya $1$ birim yukarı ilerleyerek $B(5, 4)$ noktasına ulaşacaktır.
Robotun yol üzerinde bulunan $C(2, 2)$ noktasından **geçmeden** $A$'dan $B$'ye gidebileceği kaç farklı en kısa yol vardır?

**Şıklar:**
A) 36
B) 48
C) 54
D) 60
E) 66

**Açıklama:**
$A(0, 0)$'dan $B(5, 4)$'e giden tüm en kısa yollar $5$ sağ ve $4$ yukarı adımdan oluşur: $\dfrac{9!}{5! \cdot 4!} = \binom{9}{4} = 126$ yol vardır.
$C(2, 2)$ noktasından geçen yollar iki parçada hesaplanır:
- $A(0, 0) \to C(2, 2)$ ($2$ sağ, $2$ yukarı): $\binom{4}{2} = 6$ yol.
- $C(2, 2) \to B(5, 4)$ ($3$ sağ, $2$ yukarı): $\binom{5}{2} = 10$ yol.
$C$'den geçen toplam yol sayısı $6 \cdot 10 = 60$'tır. $C$'den **geçmeyen** yolların sayısı $126 - 60 = 66$ bulunur.

**Çeldirici Tuzağı:**
D şıkkı ($60$), sorunun "$C$'den geçmeden" dediğini gözden kaçırıp $C$'den geçen yolların sayısını ($60$) işaretleyen adayların düştüğü en güçlü tuzaktır.

### mat-10-035
- zorluk: 3
- dogru: E
- dogrulama: (C(4, 2) * C(3, 1) + C(4, 3)) / (C(7, 3) - C(3, 3))

**Soru:**
$4$ kız ve $3$ erkek öğrenciden oluşan $7$ kişilik bir gruptan rastgele $3$ kişilik bir nöbet ekibi seçiliyor.
Seçilen ekipte **en az $1$ kız öğrenci bulunduğu bilindiğine göre**, ekipteki kız sayısının erkek sayısından fazla olma olasılığı kaçtır?

**Şıklar:**
A) $\dfrac{9}{17}$
B) $\dfrac{18}{35}$
C) $\dfrac{22}{35}$
D) $\dfrac{12}{17}$
E) $\dfrac{11}{17}$

**Açıklama:**
Koşullu olasılık gereği örnek uzay en az $1$ kız bulunan $3$ kişilik tüm ekiplerdir: tüm $\binom{7}{3} = 35$ ekipten hiç kız bulunmayan $\binom{3}{3} = 1$ ekip çıkarılırsa $35 - 1 = 34$ durum kalır.
Kız sayısının erkek sayısından fazla olması ($2$ kız $1$ erkek veya $3$ kız $0$ erkek):
$$\binom{4}{2}\binom{3}{1} + \binom{4}{3} = 6 \cdot 3 + 4 = 22$$
İstenen olasılık $\dfrac{22}{34} = \dfrac{11}{17}$ bulunur.

**Çeldirici Tuzağı:**
C şıkkı ($\frac{22}{35}$), "en az $1$ kız bulunduğu bilindiğine göre" koşullu olasılık şartını atlayıp tüm $35$ ekip üzerinden oranlayan adayı yakalar.


### mat-10-036
- zorluk: 1
- dogru: A
- dogrulama: C(6, 3)

**Soru:**
Şekildeki çember üzerinde birbirinden farklı $6$ nokta ($A, B, C, D, E, F$) işaretlenmiştir.
Köşeleri bu noktalardan oluşan kaç farklı **üçgen** çizilebilir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [4, 0],
    "B": [2, 3.464],
    "C": [-2, 3.464],
    "D": [-4, 0],
    "E": [-2, -3.464],
    "F": [2, -3.464]
  },
  "dots": ["A", "B", "C", "D", "E", "F"],
  "labelPos": {
    "A": "right",
    "B": "tr",
    "C": "tl",
    "D": "left",
    "E": "bl",
    "F": "br"
  },
  "shapes": [
    { "type": "circle", "center": [0, 0], "radius": 4 }
  ]
}
```

**Şıklar:**
A) 20
B) 12
C) 15
D) 24
E) 30

**Açıklama:**
Bir çember üzerindeki herhangi üç nokta hiçbir zaman doğrusal değildir. Dolayısıyla $6$ noktadan seçilen her $3$ nokta bir üçgen oluşturur:
$$\binom{6}{3} = \frac{6 \cdot 5 \cdot 4}{3 \cdot 2 \cdot 1} = 20$$
farklı üçgen çizilebilir.

**Çeldirici Tuzağı:**
C şıkkı ($15$), üçgen yerine iki nokta seçerek oluşturulan doğru/kiriş sayısını ($\binom{6}{2} = 15$) hesaplayan adayı yakalar.

### mat-10-037
- zorluk: 2
- dogru: B
- dogrulama: C(4, 2) * C(5, 2)

**Soru:**
Şekilde birbirine paralel $4$ yatay ve bunları dik kesen $5$ dikey doğrunun oluşturduğu ızgara verilmiştir.
Bu doğrularla sınırlanan kaç farklı **dikdörtgen** vardır?

**Şekil:**
```json
{
  "kind": "geometry",
  "pointLabels": false,
  "points": {
    "H1L": [-0.6, 0], "H1R": [8.6, 0],
    "H2L": [-0.6, 2], "H2R": [8.6, 2],
    "H3L": [-0.6, 4], "H3R": [8.6, 4],
    "H4L": [-0.6, 6], "H4R": [8.6, 6],
    "V1B": [0, -0.6], "V1T": [0, 6.6],
    "V2B": [2, -0.6], "V2T": [2, 6.6],
    "V3B": [4, -0.6], "V3T": [4, 6.6],
    "V4B": [6, -0.6], "V4T": [6, 6.6],
    "V5B": [8, -0.6], "V5T": [8, 6.6]
  },
  "shapes": [
    { "type": "segment", "from": "H1L", "to": "H1R" },
    { "type": "segment", "from": "H2L", "to": "H2R" },
    { "type": "segment", "from": "H3L", "to": "H3R" },
    { "type": "segment", "from": "H4L", "to": "H4R" },
    { "type": "segment", "from": "V1B", "to": "V1T" },
    { "type": "segment", "from": "V2B", "to": "V2T" },
    { "type": "segment", "from": "V3B", "to": "V3T" },
    { "type": "segment", "from": "V4B", "to": "V4T" },
    { "type": "segment", "from": "V5B", "to": "V5T" }
  ]
}
```

**Şıklar:**
A) 30
B) 60
C) 45
D) 72
E) 90

**Açıklama:**
Bir dikdörtgen oluşturmak için $4$ yatay doğrudandan $2$ tane, $5$ dikey doğrudan da $2$ tane seçilmelidir:
$$\binom{4}{2} \cdot \binom{5}{2} = 6 \cdot 10 = 60$$
farklı dikdörtgen vardır.

**Çeldirici Tuzağı:**
A şıkkı ($30$), çizgi sayıları yerine ızgaradaki küçük birim kare sayısı olan $3 \cdot 4 = 12$'yi ya da $1 \times k$ biçimli eksik sayımları düşünen adayı yakalar.

### mat-10-038
- zorluk: 2
- dogru: C
- dogrulama: (54 + 90) / 360

**Soru:**
Merkez açıları aşağıdaki daire grafiğinde verilen dört renkli şans çarkı bir kez döndürülüp durduğunda, ibrenin **Kırmızı veya Mavi** bölge üzerinde durma olasılığı kaçtır?

**Şekil:**
```json
{
  "kind": "pie",
  "slices": [
    { "label": "Kırmızı", "value": 54 },
    { "label": "Mavi", "value": 90 },
    { "label": "Sarı", "value": 108 },
    { "label": "Yeşil", "value": 108 }
  ],
  "show": "degree"
}
```

**Şıklar:**
A) $\dfrac{3}{20}$
B) $\dfrac{1}{4}$
C) $\dfrac{2}{5}$
D) $\dfrac{3}{5}$
E) $\dfrac{3}{4}$

**Açıklama:**
Kırmızı ($54^\circ$) ve Mavi ($90^\circ$) bölgelerin toplam merkez açısı $54^\circ + 90^\circ = 144^\circ$'dir. Çarkın tamamı $360^\circ$ olduğundan istenen olasılık:
$$\frac{144}{360} = \frac{2}{5}$$
olarak bulunur.

**Çeldirici Tuzağı:**
D şıkkı ($\frac{3}{5}$), Sarı ve Yeşil dilimlerin olasılığını ($1 - \frac{2}{5} = \frac{3}{5}$) bulan; B şıkkı ($\frac{1}{4}$) ise yalnızca Mavi ($90^\circ$) dilimi hesaplayan adayı yakalar.

### mat-10-039
- zorluk: 2
- dogru: D
- dogrulama: C(6, 2)

**Soru:**
Şekildeki $4 \times 2$'lik birim kareli ızgaranın $A$ köşesinden hareket eden bir hareketli, çizgiler boyunca yalnızca **sağa ve yukarı** ilerleyerek $B$ köşesine en kısa yoldan kaç farklı biçimde ulaşabilir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [0, 0],
    "B": [8, 4],
    "P1": [2, 0], "P2": [4, 0], "P3": [6, 0], "P4": [8, 0],
    "Q0": [0, 2], "Q4": [8, 2],
    "R0": [0, 4], "R1": [2, 4], "R2": [4, 4], "R3": [6, 4]
  },
  "hideLabels": ["P1", "P2", "P3", "P4", "Q0", "Q4", "R0", "R1", "R2", "R3"],
  "dots": ["A", "B"],
  "labelPos": { "A": "bl", "B": "tr" },
  "shapes": [
    { "type": "segment", "from": "A", "to": "P4" },
    { "type": "segment", "from": "Q0", "to": "Q4" },
    { "type": "segment", "from": "R0", "to": "B" },
    { "type": "segment", "from": "A", "to": "R0" },
    { "type": "segment", "from": "P1", "to": "R1" },
    { "type": "segment", "from": "P2", "to": "R2" },
    { "type": "segment", "from": "P3", "to": "R3" },
    { "type": "segment", "from": "P4", "to": "B" }
  ]
}
```

**Şıklar:**
A) 8
B) 10
C) 12
D) 15
E) 20

**Açıklama:**
$A$'dan $B$'ye gitmek için toplam $4$ sağ ve $2$ yukarı adım (toplam $6$ adım) atılmalıdır. Tekrarlı permütasyon ile:
$$\frac{6!}{4! \cdot 2!} = \binom{6}{2} = \frac{6 \cdot 5}{2} = 15$$
farklı en kısa yol vardır.

**Çeldirici Tuzağı:**
A şıkkı ($8$), yatay ve dikey birim kare sayılarını çarpan ($4 \cdot 2 = 8$); E şıkkı ($20$) ise adım sayısını $6$ yerine yanlışlıkla farklı kombinasyonla hesaplayan adayı yakalar.

### mat-10-040
- zorluk: 3
- dogru: E
- dogrulama: (8 + 12 + 14) / (8 + 12 + 6 + 14)

**Soru:**
$40$ kişilik bir topluluktaki bireylerin cinsiyet ve gözlük kullanma dağılımları aşağıdaki tabloda verilmiştir.
Bu topluluktan rastgele seçilen bir kişinin **kadın veya gözlüksüz** olma olasılığı kaçtır?

**Şekil:**
```json
{
  "kind": "table",
  "headers": ["Grup", "Gözlüklü", "Gözlüksüz"],
  "rows": [
    ["Kadın", "8", "12"],
    ["Erkek", "6", "14"]
  ]
}
```

**Şıklar:**
A) $\dfrac{13}{20}$
B) $\dfrac{3}{5}$
C) $\dfrac{7}{10}$
D) $\dfrac{4}{5}$
E) $\dfrac{17}{20}$

**Açıklama:**
İstenen olay, Kadın kümesi ($8 + 12 = 20$) ile Gözlüksüz kümesinin ($12 + 14 = 26$) birleşimidir. İki kez sayılan Gözlüksüz Kadın ($12$) çıkarılır:
$$s(\text{Kadın} \cup \text{Gözlüksüz}) = 20 + 26 - 12 = 34$$
(veya tümleyen olan Gözlüklü Erkek ($6$) kişi $40$'tan çıkarılır: $40 - 6 = 34$). Olasılık $\dfrac{34}{40} = \dfrac{17}{20}$ bulunur.

**Çeldirici Tuzağı:**
A şıkkı ($\frac{13}{20}$), yalnızca gözlüksüzler toplamını ($\frac{26}{40} = \frac{13}{20}$) işaretleyen; B şıkkı ($\frac{3}{5}$) ise yalnızca gözlüklü veya diğer ayrık iki hücreyi toplayan adayı yakalar.