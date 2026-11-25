---
ders: Matematik & Geometri
konu: Bölme-Bölünebilme ve EBOB-EKOK
kod: mat
kapsam: [lisans_gygk, b_grubu_gygk]
---

### mat-02-001
- zorluk: 1
- dogru: B
- dogrulama: (8 + 4) / 3

**Soru:**
$A$, $B$ ve $C$ sıfırdan farklı pozitif tam sayılardır.
$A$ sayısı $8$ ile bölündüğünde bölüm $B$, kalan $0$ olmaktadır.
$A + 4B$ sayısı $3B$ ile bölündüğünde bölüm $C$ ve kalan $0$ olduğuna göre $C$ kaçtır?

**Şıklar:**
A) 3
B) 4
C) 5
D) 6
E) 8

**Açıklama:**
İlk bölme işleminden $A = 8B$ yazılır. İkinci bölme işleminde bölünen yerine $8B$ konulduğunda $A + 4B = 8B + 4B = 12B$ elde edilir. $12B = 3B \cdot C$ eşitliğinde $B > 0$ olduğu için $B$'ler sadeleşir ve $C = \dfrac{12}{3} = 4$ bulunur.

**Çeldirici Tuzağı:**
A şıkkı ($3$), $A = 8B$ yerine $A + 4B$ toplamını $9B$ gibi eksik toplayan ya da bölen olan $3$'ü bölümle karıştıran adayı yakalar.

### mat-02-002
- zorluk: 2
- dogru: D
- dogrulama: (12 * 3 + 5) % 15

**Soru:**
$A$ pozitif tam sayısı $12$ ile bölündüğünde bölüm $B$, kalan $5$'tir. $B$ sayısı $5$ ile bölündüğünde kalan $3$ olduğuna göre $A$ sayısının $15$ ile bölümünden kalan kaçtır?

**Şıklar:**
A) 5
B) 8
C) 9
D) 11
E) 13

**Açıklama:**
Verilen bölme işlemleri denklem biçiminde yazılır: $A = 12B + 5$ ve $B = 5k + 3$ ($k \in \mathbb{Z}$). İkinci ifade birincide yerine konursa $A = 12(5k + 3) + 5 = 60k + 36 + 5 = 60k + 41$ elde edilir. $60k$ sayısı $15$'in tam katı olduğundan kalanı $41$'in $15$ ile bölümünden kalan belirler: $41 = 15 \cdot 2 + 11$, yani kalan $11$'dir.

**Çeldirici Tuzağı:**
B şıkkı (8), kalanları doğrudan toplayıp $5 + 3 = 8$ bulan adayı yakalar. Oysa $B$'den gelen $3$ kalanı $12$ katsayısıyla çarpılarak $A$'ya yansır.

### mat-02-003
- zorluk: 1
- dogru: A
- dogrulama: 8 + 1 + 4 + 7

**Soru:**
Rakamları birbirinden farklı dört basamaklı $5A3B$ doğal sayısı $12$ ile tam bölünebilmektedir.
Buna göre $A$ rakamının alabileceği değerler toplamı kaçtır?

**Şıklar:**
A) 20
B) 22
C) 25
D) 27
E) 29

**Açıklama:**
$12$ ile tam bölünebilme, aralarında asal olan $3$ ve $4$ ile tam bölünebilme demektir. $4$ ile bölünebilme için son iki basamak olan $3B$ sayısı $4$'ün katı olmalıdır; buradan $B = 2$ veya $B = 6$ bulunur.
$B = 2$ için sayının rakamları toplamı $5 + A + 3 + 2 = 10 + A$'dır; $3$'ün katı olması için $A \in \{2, 5, 8\}$ olabilir. Rakamlar farklı koşulu nedeniyle $2$ ve $5$ elenir, yalnızca $A = 8$ kalır.
$B = 6$ için rakamlar toplamı $5 + A + 3 + 6 = 14 + A$ olur; $3$'ün katı için $A \in \{1, 4, 7\}$ değerlerinin üçü de $\{5, 3, 6\}$'dan farklıdır.
O hâlde $A$'nın alabileceği değerler toplamı $8 + 1 + 4 + 7 = 20$'dir.

**Çeldirici Tuzağı:**
D şıkkı (27), sorudaki "rakamları birbirinden farklı" şartını unutup $B = 2$ durumunda $A = 2$ ve $A = 5$ değerlerini de toplama ($20 + 2 + 5 = 27$) dahil eden adayı yakalar.

### mat-02-004
- zorluk: 2
- dogru: C
- dogrulama: 18 + 3 - (4 + 8 + 1) - 2

**Soru:**
Rakamları birbirinden farklı beş basamaklı $4A81B$ doğal sayısı $45$ ile bölündüğünde $12$ kalanını vermektedir.
Buna göre $A$ kaçtır?

**Şıklar:**
A) 1
B) 4
C) 6
D) 7
E) 9

**Açıklama:**
$45$ ile bölündüğünde $12$ kalanını veren bir sayının $5$ ile bölümünden kalan $12 \div 5$'ten $2$, $9$ ile bölümünden kalan $12 \div 9$'dan $3$ olmalıdır.
$5$'ten kalan $2$ olduğu için birler basamağı $B = 2$ veya $B = 7$ olabilir.
Rakamlar toplamı $4 + A + 8 + 1 + B = 13 + A + B$ ifadesinin $9$ ile bölümünden kalan $3$ olmalı, yani $13 + A + B$ toplamı $21$ veya $30$ olmalıdır ($A + B = 8$ veya $A + B = 17$).
$B = 7$ seçilirse $A = 1$ çıkar (rakam tekrarı olduğu için elenir; $A = 10$ rakam değildir). $B = 2$ seçildiğinde $A = 6$ bulunur ve $46.812$ sayısının tüm rakamları birbirinden farklıdır.

**Çeldirici Tuzağı:**
A şıkkı (1), $B = 7$ durumunu deneyip $A = 1$ bulduktan sonra sayıdaki $1$ rakamıyla çakıştığını görmeden işaretleyen adayı yakalar. Koşullu sorularda bulunan tüm adayların "rakamları farklı" şartına göre elenmesi gerekir.

### mat-02-005
- zorluk: 2
- dogru: E
- dogrulama: 6 + 0

**Soru:**
Rakamları birbirinden farklı beş basamaklı $3A52B$ doğal sayısı $88$ ile tam bölünebilmektedir.
Buna göre $A + B$ toplamı kaçtır?

**Şıklar:**
A) 3
B) 5
C) 8
D) 11
E) 6

**Açıklama:**
$88 = 8 \cdot 11$ olduğundan sayı hem $8$ hem $11$ ile tam bölünmelidir. $8$ ile bölünebilme için son üç basamak olan $52B$ sayısı $8$'in katı olmalıdır: $520 = 8 \cdot 65$ olduğundan $B = 0$ veya $B = 8$ olabilir.
$11$ ile bölünebilme için sağdan sola $+, -, +, -, +$ işaretleri uygulanır: $(B + 5 + 3) - (2 + A) = 6 + B - A$ sayısı $11$'in katı olmalıdır.
$B = 8$ alınırsa $14 - A$ ifadesinin $11$'in katı olması için $A = 3$ gerekir; ancak sayıda $3$ rakamı bulunduğu için rakamlar farklı şartına aykırıdır.
$B = 0$ alınırsa $6 - A$ ifadesinin $11$'in katı olması için $A = 6$ bulunur ($36.520$). Böylece $A + B = 6 + 0 = 6$ olur.

**Çeldirici Tuzağı:**
D şıkkı (11), $B = 8$ ve $A = 3$ çiftini bulup $3$ rakamının zaten yüz binler değil on binler basamağında var olduğunu gözden kaçırarak $3 + 8 = 11$ işaretleyen adayı yakalar.

### mat-02-006
- zorluk: 2
- dogru: B
- dogrulama: (7^2 + 3 * 9) % 11

**Soru:**
$x$ doğal sayısının $11$ ile bölümünden kalan $7$, $y$ doğal sayısının $11$ ile bölümünden kalan $9$'dur.
Buna göre $x^2 + 3y$ sayısının $11$ ile bölümünden kalan kaçtır?

**Şıklar:**
A) 1
B) 10
C) 7
D) 5
E) 3

**Açıklama:**
Bölme kalanları işlemlerde doğrudan sayıların yerine yazılabilir. Buna göre $x^2 + 3y$ yerine $7^2 + 3 \cdot 9 = 49 + 27 = 76$ hesaplanır. $76$ sayısının $11$ ile bölümünden kalan $76 = 11 \cdot 6 + 10$ olduğundan $10$ bulunur.

**Çeldirici Tuzağı:**
A şıkkı (1), $x^2$ yerine $x$'in karesini almayı unutup $7 + 3 \cdot 9 = 34$ değerinin $11$ ile bölümünden kalan $1$'i işaretleyen adayı yakalar.

### mat-02-007
- zorluk: 1
- dogru: D
- dogrulama: 5 + sqrt(180 * 5)

**Soru:**
$a$ ve $b$ pozitif tam sayılar olmak üzere
$$180 \cdot a = b^2$$
eşitliğini sağlayan en küçük $a$ ve $b$ değerleri için $a + b$ toplamı kaçtır?

**Şıklar:**
A) 25
B) 30
C) 32
D) 35
E) 45

**Açıklama:**
$180$ asal çarpanlarına ayrılır: $180 = 2^2 \cdot 3^2 \cdot 5^1$. Çarpımın bir tam sayının karesi ($b^2$) olabilmesi için tüm asal çarpanların üsleri çift olmalıdır. $2$ ve $3$'ün üsleri zaten çift olduğundan $5^1$'in üssünü çift yapmak için en küçük $a = 5$ seçilir. Bu durumda $b^2 = 2^2 \cdot 3^2 \cdot 5^2 = 30^2$ olur ve $b = 30$ bulunur. Toplam $a + b = 5 + 30 = 35$'tir.

**Çeldirici Tuzağı:**
B şıkkı (30), $a = 5$ ve $b = 30$ değerlerini doğru bulduktan sonra yalnızca $b$'yi işaretleyen adayı yakalar. A şıkkı (25) ise $180$'i yanlış çarpanlara ayırma hatasından gelir.

### mat-02-008
- zorluk: 2
- dogru: A
- dogrulama: (-3 + sqrt(9 - 4 * (2 - 36 / 3))) / 2

**Soru:**
$n$ bir pozitif tam sayı olmak üzere $A = 15^n \cdot 12$ sayısının $36$ tane pozitif tam sayı böleni vardır.
Buna göre $n$ kaçtır?

**Şıklar:**
A) 2
B) 3
C) 4
D) 5
E) 6

**Açıklama:**
Sayı asal çarpanlarına ayrılır: $A = (3 \cdot 5)^n \cdot (2^2 \cdot 3) = 2^2 \cdot 3^{n+1} \cdot 5^n$. Pozitif tam sayı bölen adedi, asal çarpanların üslerinin $1$ fazlasının çarpımıdır: $(2 + 1)(n + 2)(n + 1) = 36 \Rightarrow 3(n + 1)(n + 2) = 36 \Rightarrow (n + 1)(n + 2) = 12$. Ardışık iki pozitif tam sayının çarpımı $12 = 3 \cdot 4$ olduğundan $n + 1 = 3 \Rightarrow n = 2$ bulunur.

**Çeldirici Tuzağı:**
B şıkkı (3), $n + 1 = 3$ eşitliğini bulduktan sonra $n$ yerine doğrudan $3$'ü seçen ya da $12$'nin içindeki $3^1$ çarpanını $3^n$'e eklemeyi unutan adayı yakalar.

### mat-02-009
- zorluk: 1
- dogru: C
- dogrulama: 2 * (48 + 64) / gcd(48, 64)

**Soru:**
Boyutları $48$ metre ve $64$ metre olan dikdörtgen biçimindeki bir bahçenin çevresine, köşelerine de birer adet gelmek koşuluyla eşit aralıklarla en az sayıda ağaç dikilecektir.
Buna göre toplam kaç ağaç gerekir?

**Şıklar:**
A) 10
B) 12
C) 14
D) 15
E) 28

**Açıklama:**
Ağaç sayısının en az olması için iki ağaç arasındaki mesafe en büyük seçilmelidir; bu değer $\text{EBOB}(48, 64) = 16$ metredir. Dikdörtgenin çevresi kapalı bir yol olduğundan ağaç sayısı doğrudan çevrenin aralığa bölünmesiyle bulunur: $\dfrac{2(48 + 64)}{16} = \dfrac{224}{16} = 14$ ağaç dikilir.

**Çeldirici Tuzağı:**
D şıkkı (15), kapalı dikdörtgen çevresinde fazladan $1$ eklenmeyeceğini unutup düz doğru parçası gibi $+1$ ekleyen adayı yakalar. B şıkkı (12) ise alan hesabına kayıp $48 \cdot 64 \div 16^2$ işlemi yapanların düştüğü tuzaktır.

### mat-02-010
- zorluk: 2
- dogru: D
- dogrulama: yok

**Soru:**
Üç hemşire sırasıyla $4$, $6$ ve $9$ günde bir nöbet tutmaktadır.
Üçü birlikte ilk nöbetlerini Salı günü tuttuklarına göre üçüncü kez birlikte tutacakları nöbet hangi güne denk gelir?

**Şıklar:**
A) Pazartesi
B) Salı
C) Çarşamba
D) Perşembe
E) Cuma

**Açıklama:**
Üç hemşirenin birlikte nöbet tutma periyodu $\text{EKOK}(4, 6, 9) = 36$ gündür. İlk nöbet $0$. gün (Salı) tutulduğuna göre ikinci birlikte nöbet $36$ gün sonra, üçüncü birlikte nöbet ise $2 \cdot 36 = 72$ gün sonra tutulur. $72$ günün $7$ ile bölümünden kalan $72 = 7 \cdot 10 + 2$ olduğundan Salı gününden $2$ gün ileri gidilir ve Perşembe günü bulunur.

**Çeldirici Tuzağı:**
E şıkkı (Cuma), "üçüncü kez" ifadesini görünce aradan $2$ değil $3$ periyot ($3 \cdot 36 = 108$ gün, kalan $3$) geçtiğini sanan adayı yakalar. İlk nöbet zaten başlangıçta tutulduğu için $n$. nöbet $(n - 1)$ periyot sonradır.

### mat-02-011
- zorluk: 3
- dogru: E
- dogrulama: 6 * (180 / 6 / 6 + 180 / 6 / 5)

**Soru:**
$a$ ve $b$ pozitif tam sayılar olmak üzere $\text{EBOB}(a, b) = 6$ ve $\text{EKOK}(a, b) = 180$'dir.
$a$ ve $b$ sayılarından hiçbiri $6$'ya eşit olmadığına göre $a + b$ toplamı en az kaçtır?

**Şıklar:**
A) 186
B) 102
C) 84
D) 78
E) 66

**Açıklama:**
$\text{EBOB}(a, b) = 6$ olduğundan aralarında asal $x$ ve $y$ pozitif tam sayıları için $a = 6x$ ve $b = 6y$ yazılabilir. $\text{EKOK}(a, b) = 6 \cdot x \cdot y = 180 \Rightarrow x \cdot y = 30$ bulunur. Sayıların hiçbiri $6$ olmadığından $x > 1$ ve $y > 1$ olmalıdır. Aralarında asal $x \cdot y = 30$ çarpan çiftleri $(2, 15)$, $(3, 10)$ ve $(5, 6)$'dır. Toplamın en küçük olması için birbirine en yakın çift olan $(5, 6)$ seçilir: $a = 30$, $b = 36$ ve $a + b = 66$ olur.

**Çeldirici Tuzağı:**
D şıkkı (78), $(3, 10)$ çiftini alıp daha küçük toplam veren $(5, 6)$ çiftini gözden kaçıran adayı yakalar. A şıkkı (186) ise "hiçbiri 6 değildir" şartını yok sayıp $(1, 30)$ çiftiyle $6 + 180$ bulanların tuzağıdır.

### mat-02-012
- zorluk: 3
- dogru: B
- dogrulama: lcm(5, lcm(6, 8)) * 3 - 3

**Soru:**
Bir sepetteki cevizler beşerli, altışarlı ve sekizerli sayıldığında her seferinde $3$ ceviz eksik kalmaktadır.
Sepetteki ceviz sayısı $300$'den fazla olduğuna göre sepette en az kaç ceviz vardır?

**Şıklar:**
A) 237
B) 357
C) 360
D) 363
E) 477

**Açıklama:**
Ceviz sayısına $C$ denirse her sayımda $3$ eksik kaldığı için $C + 3$ sayısı $5$, $6$ ve $8$'in ortak katı olmalıdır. $\text{EKOK}(5, 6, 8) = 120$ olduğundan $C + 3 = 120k$ ($k \in \mathbb{Z}^+$) yazılır. $C > 300$ koşulunu sağlayan en küçük kat $k = 3$ için $C + 3 = 360 \Rightarrow C = 357$ bulunur.

**Çeldirici Tuzağı:**
D şıkkı (363), "3 eksik kalmaktadır" ifadesini "3 fazla kalmaktadır" gibi yorumlayıp $360$'a $3$ ekleyen adayı yakalar. A şıkkı (237) ise $300$'den büyük olma koşulunu unutanların seçtiği şıktır.

### mat-02-013
- zorluk: 1
- dogru: C
- dogrulama: 3 + (4 - 1)

**Soru:**
Rakamları birbirinden farklı dört basamaklı $4A6B$ doğal sayısı $15$ ile tam bölünebilmektedir.
Bu koşulu sağlayan kaç farklı $4A6B$ sayısı yazılabilir?

**Şıklar:**
A) 3
B) 5
C) 6
D) 7
E) 8

**Açıklama:**
$15$ ile tam bölünen sayı hem $5$ hem $3$ ile tam bölünmelidir. $5$ ile bölünme nedeniyle $B = 0$ veya $B = 5$ olur.
$B = 0$ için rakamlar toplamı $4 + A + 6 + 0 = 10 + A$ olup $3$'ün katı olması için $A \in \{2, 5, 8\}$ olabilir (üçü de $\{4, 6, 0\}$'dan farklıdır, $3$ sayı).
$B = 5$ için rakamlar toplamı $4 + A + 6 + 5 = 15 + A$ olup $3$'ün katı olması için $A \in \{0, 3, 6, 9\}$ olabilir; ancak sayıda $6$ bulunduğu için $A = 6$ elenir ($0, 3, 9$ olmak üzere $3$ sayı).
Toplam $3 + 3 = 6$ farklı sayı yazılabilir.

**Çeldirici Tuzağı:**
D şıkkı (7), $B = 5$ durumunda $A = 6$ seçeneğinin rakam tekrarına yol açtığını gözden kaçırıp $3 + 4 = 7$ sayan adayı yakalar.

### mat-02-014
- zorluk: 1
- dogru: B
- dogrulama: yok

**Soru:**
$x$ ve $y$ pozitif tam sayıları için $x$ sayısı $12$ ile bölündüğünde kalan $y$ olmaktadır.
$y$'nin tek sayı olduğu bilindiğine göre aşağıdakilerden hangisi **her zaman** doğrudur?

**Şıklar:**
A) $x$ sayısı $3$ ile tam bölünür.
B) $x$ tek sayıdır.
C) $x$ çift sayıdır.
D) $x + y$ tek sayıdır.
E) $y < 6$'dır.

**Açıklama:**
Bölme özdeşliğine göre bölüm $k$ olmak üzere $x = 12k + y$ yazılır ($0 \le y < 12$). $12k$ terimi $k$ hangi tam sayı olursa olsun daima çifttir. $y$ tek sayı olduğu için $x = \text{çift} + \text{tek} = \text{tek}$ olur; dolayısıyla $x$ her zaman tek sayıdır. Ayrıca iki tek sayının toplamı olan $x + y$ çift olur ($D$ yanlış), $y = 7$ veya $11$ seçilebileceğinden $E$ kesin değildir.

**Çeldirici Tuzağı:**
D şıkkı ($x + y$ tek sayıdır), $x$'in tek olduğunu gördükten sonra $x$ ve $y$'nin toplamında iki tek sayının toplamının çift olacağını unutan adayı yakalar.

### mat-02-015
- zorluk: 2
- dogru: A
- dogrulama: (42 * 5) % 9

**Soru:**
$42$ basamaklı $555\ldots5$ doğal sayısının $9$ ile bölümünden kalan kaçtır?

**Şıklar:**
A) 3
B) 2
C) 4
D) 5
E) 6

**Açıklama:**
Bir sayının $9$ ile bölümünden kalan, rakamları toplamının $9$ ile bölümünden kalana eşittir. $42$ tane $5$ rakamının toplamı $42 \cdot 5 = 210$ olur. $210$ sayısının rakamları toplamı $2 + 1 + 0 = 3$ olduğundan $9$ ile bölümünden kalan $3$ bulunur.

**Çeldirici Tuzağı:**
E şıkkı (6), basamak sayısının $9$ ile bölümünden kalanı ($42 \equiv 6$) alıp $5$ ile çarpmadan işaretleyen adayı yakalar.

### mat-02-016
- zorluk: 2
- dogru: D
- dogrulama: ((10 + 3) + 3) / 2

**Soru:**
Dört basamaklı $6A4B$ sayısının $11$ ile bölümünden kalan $3$'tür.
$A - B = 3$ olduğuna göre $A$ kaçtır?

**Şıklar:**
A) 5
B) 6
C) 7
D) 8
E) 9

**Açıklama:**
$11$ ile bölünebilme kuralına göre sağdan sola $+, -, +, -$ işaretleri uygulanır: $(B + A) - (4 + 6) = A + B - 10$. Kalan $3$ olduğundan $A + B - 10 = 3 \Rightarrow A + B = 13$ bulunur ($A + B - 10 = 14 \Rightarrow A + B = 24$ rakamlarla imkânsızdır). $A + B = 13$ ve $A - B = 3$ denklemleri taraf tarafa toplanırsa $2A = 16 \Rightarrow A = 8$ elde edilir.

**Çeldirici Tuzağı:**
A şıkkı (5), $A$ yerine $B$'nin değerini ($8 - 3 = 5$) işaretleyen adayı yakalar.

### mat-02-017
- zorluk: 2
- dogru: B
- dogrulama: (2 + 1) * (1 + 1)

**Soru:**
$360$ sayısının kaç tane tek pozitif tam sayı böleni vardır?

**Şıklar:**
A) 4
B) 6
C) 8
D) 12
E) 24

**Açıklama:**
$360$ sayısı asal çarpanlarına ayrılır: $360 = 8 \cdot 9 \cdot 5 = 2^3 \cdot 3^2 \cdot 5^1$. Tek bölenler $2$ çarpanını içermeyeceğinden yalnızca tek asal çarpanlardan ($3^2 \cdot 5^1$) üretilir. Tek pozitif tam sayı bölen adedi $(2 + 1)(1 + 1) = 3 \cdot 2 = 6$ bulunur.

**Çeldirici Tuzağı:**
E şıkkı (24), tek bölen yerine tüm pozitif bölen sayısını ($4 \cdot 3 \cdot 2 = 24$) hesaplayan; A şıkkı (4) ise üslere $1$ eklemeyi veya $2$'yi ayırmayı karıştıran adayı yakalar.

### mat-02-018
- zorluk: 1
- dogru: C
- dogrulama: (42 + 70) / gcd(42, 70)

**Soru:**
$42$ litre zeytinyağı ve $70$ litre ayçiçek yağı birbirine karıştırılmadan ve hiç artmayacak biçimde eşit hacimli en büyük şişelere doldurulacaktır.
Bu iş için en az kaç şişe gerekir?

**Şıklar:**
A) 5
B) 6
C) 8
D) 12
E) 14

**Açıklama:**
Şişe sayısının en az olması için şişe hacmi en büyük seçilmelidir: $\text{EBOB}(42, 70) = 14$ litre. Zeytinyağı için $\dfrac{42}{14} = 3$ şişe, ayçiçek yağı için $\dfrac{70}{14} = 5$ şişe gerekir; toplam $3 + 5 = 8$ şişe olur.

**Çeldirici Tuzağı:**
E şıkkı (14), gereken şişe sayısı ($8$) yerine bir şişenin hacmini ($14$ litre) işaretleyen adayı yakalar.

### mat-02-019
- zorluk: 2
- dogru: E
- dogrulama: (lcm(12, 18) / 12) * (lcm(12, 18) / 18)

**Soru:**
Boyutları $12$ cm ve $18$ cm olan dikdörtgen biçimindeki fayanslar boşluk kalmadan yan yana dizilerek en küçük alanlı bir kare oluşturulacaktır.
Bu iş için kaç adet fayans gerekir?

**Şıklar:**
A) 2
B) 3
C) 4
D) 12
E) 6

**Açıklama:**
Oluşturulacak karenin bir kenarı $12$ ve $18$'in en küçük ortak katıdır: $\text{EKOK}(12, 18) = 36$ cm. Karenin bir kenarı boyunca $\dfrac{36}{12} = 3$ fayans, diğer kenarı boyunca $\dfrac{36}{18} = 2$ fayans yerleştirilir. Toplam fayans sayısı $3 \cdot 2 = 6$ adettir.

**Çeldirici Tuzağı:**
D şıkkı (12) veya C şıkkı (4), kenar uzunluklarını $72$ cm alarak veya alan oranında yanlış bölme yaparak farklı adede ulaşan adayı yakalar.

### mat-02-020
- zorluk: 2
- dogru: B
- dogrulama: ((7 % 4) * (5 % 4)) % 4

**Soru:**
$a$ doğal sayısının $12$ ile bölümünden kalan $7$, $b$ doğal sayısının $8$ ile bölümünden kalan $5$'tir.
Buna göre $a \cdot b$ çarpımının $4$ ile bölümünden kalan kaçtır?

**Şıklar:**
A) 1
B) 3
C) 2
D) 0
E) 5

**Açıklama:**
$12$ ve $8$ sayıları $4$'ün katı olduğu için $a = 12k + 7$ sayısının $4$ ile bölümünden kalan $7 \div 4$'ten $3$, $b = 8m + 5$ sayısının $4$ ile bölümünden kalan $5 \div 4$'ten $1$ olur. Çarpımın $4$ ile bölümünden kalan $3 \cdot 1 = 3$ bulunur.

**Çeldirici Tuzağı:**
A şıkkı (1), $7 \cdot 5 = 35$ işlemini $4$'e bölmek yerine $7$ ve $5$'in kendi kalanlarını ya da toplamlarını karıştıran adayı yakalar.

### mat-02-021
- zorluk: 1
- dogru: A
- dogrulama: 84 / 12

**Soru:**
Aralarında asal iki doğal sayının en küçük ortak katı (EKOK) $84$'tür.
Bu sayılardan biri $12$ olduğuna göre diğeri kaçtır?

**Şıklar:**
A) 7
B) 6
C) 14
D) 21
E) 28

**Açıklama:**
Aralarında asal iki sayının $\text{EBOB}$'u $1$ olduğundan çarpımları $\text{EKOK}$'larına eşittir: $a \cdot b = \text{EKOK}(a, b) = 84$. Sayılardan biri $12$ ise diğeri $\dfrac{84}{12} = 7$ bulunur ($12$ ve $7$ aralarında asaldır).

**Çeldirici Tuzağı:**
C şıkkı (14) veya E şıkkı (28), $12$ ile aralarında asal olmayan sayıları ($14$ veya $28$ ile $12$'nin EKOK'u $84$ olsa da EBOB'u $1$ değildir) seçen adayı yakalar.

### mat-02-022
- zorluk: 2
- dogru: D
- dogrulama: floor(200 / 4) + floor(200 / 6) - floor(200 / lcm(4, 6))

**Soru:**
$1$'den $200$'e kadar olan doğal sayılardan (sınırlar dahil) kaç tanesi $4$ veya $6$ ile tam bölünür?

**Şıklar:**
A) 50
B) 58
C) 66
D) 67
E) 83

**Açıklama:**
$4$'ün katı olan sayılar $\lfloor 200 \div 4 \rfloor = 50$ tanedir.
$6$'nın katı olan sayılar $\lfloor 200 \div 6 \rfloor = 33$ tanedir.
Hem $4$'e hem $6$'ya bölünenler $\text{EKOK}(4, 6) = 12$'nin katları olup iki kez sayılmıştır: $\lfloor 200 \div 12 \rfloor = 16$ tane.
Birleşim $50 + 33 - 16 = 67$ bulunur.

**Çeldirici Tuzağı:**
E şıkkı (83), iki kez sayılan $12$'nin katlarını çıkarmayı unutup $50 + 33 = 83$ bulan adayı yakalar.

### mat-02-023
- zorluk: 3
- dogru: C
- dogrulama: gcd(77 - 7, gcd(105 - 7, 147 - 7))

**Soru:**
$77$, $105$ ve $147$ sayıları bir $x$ pozitif tam sayısına bölündüğünde her seferinde $7$ kalanını vermektedir.
Buna göre $x$'in alabileceği en büyük değer kaçtır?

**Şıklar:**
A) 7
B) 10
C) 14
D) 21
E) 28

**Açıklama:**
Her bölmede $7$ kalanı verdiğine göre bu sayılardan $7$ çıkarıldığında elde edilen $77 - 7 = 70$, $105 - 7 = 98$ ve $147 - 7 = 140$ sayıları $x$'e tam bölünür. $x$'in en büyük değeri $\text{EBOB}(70, 98, 140) = 14$ bulunur (bölen $14 > 7$ olduğundan kalan $7$ olabilir).

**Çeldirici Tuzağı:**
A şıkkı (7), sayılardan $7$ çıkarmayı unutup $\text{EBOB}(77, 105, 147) = 7$ bulan adayı yakalar. Bölen kalanla aynı ($7$) olursa kalan $7$ değil $0$ olur.

### mat-02-024
- zorluk: 3
- dogru: E
- dogrulama: (61 - 1) / 12 + 12

**Soru:**
Aralarında asal $x$ ve $y$ pozitif tam sayıları için
$$\text{EKOK}(x, y) + \text{EBOB}(x, y) = 61 \quad \text{ve} \quad x + \dfrac{24}{y} = 7$$
eşitlikleri verilmektedir.
Buna göre $x + y$ toplamı kaçtır?

**Şıklar:**
A) 13
B) 16
C) 19
D) 23
E) 17

**Açıklama:**
$x$ ve $y$ aralarında asal olduğundan $\text{EBOB}(x, y) = 1$ ve $\text{EKOK}(x, y) = x \cdot y$'dir. İlk eşitlikten $x \cdot y + 1 = 61 \Rightarrow x \cdot y = 60$ bulunur.
İkinci eşitlikte $y$'ye $24$'ü bölen değerler ve $x \cdot y = 60$ uyumu denenir: $y = 12$ için $x = 5$ olur; $\text{EBOB}(5, 12) = 1$ ve $5 + \dfrac{24}{12} = 7$ sağlanır ($y = 4 \Rightarrow x = 15$ ve $y = 1 \Rightarrow x = 60$ sağlamaz). Toplam $x + y = 5 + 12 = 17$ bulunur.

**Çeldirici Tuzağı:**
B şıkkı (16) veya C şıkkı (19), $\text{EKOK} + \text{EBOB} = 61$ denkleminde $\text{EBOB} = 1$'i düşmeyip $x \cdot y = 61$ sanan veya aralarında asal olmayan $(6, 10)$ çarpan çiftini deneyen adayı yakalar.


### mat-02-025
- zorluk: 1
- dogru: A
- dogrulama: 18 - (5 + 2 + 4)

**Soru:**
Rakamları birbirinden farklı beş basamaklı $52a4b$ doğal sayısı $36$ ile tam bölünebilmektedir.
Buna göre $a$ rakamı kaçtır?

**Şıklar:**
A) 7
B) 8
C) 5
D) 4
E) 9

**Açıklama:**
$36 = 4 \cdot 9$ ve $\text{EBOB}(4, 9) = 1$ olduğundan sayı hem $4$'e hem $9$'a tam bölünmelidir. $4$'e bölünebilmesi için son iki basamak $4b$ ifadesi $40$, $44$ veya $48$ olabilir. Rakamları farklı ($5, 2, 4$ kullanılmış) olduğundan $b = 0$ veya $b = 8$'dir:
- $b = 8$ seçilirse rakamlar toplamı $5 + 2 + a + 4 + 8 = 19 + a = 9k \Rightarrow a = 8$ olur; ancak $8$ rakamı tekrarlanmış olur (elenir).
- $b = 0$ seçilirse $5 + 2 + a + 4 + 0 = 11 + a = 9k \Rightarrow a = 7$ olur ($52740$ rakamları farklıdır).
Buna göre $a = 7$'dir.

**Çeldirici Tuzağı:**
B şıkkı ($8$), $b = 8$ durumu için bulunan $a = 8$ değerini rakamların birbirinden farklı olma şartıyla denetlemeden işaretleyen adayı yakalar.

### mat-02-026
- zorluk: 1
- dogru: D
- dogrulama: (15 * 4 + 14) + 14

**Soru:**
$m$ ve $n$ pozitif tam sayılar olmak üzere, $m$ sayısı $15$ ile bölündüğünde bölüm $4$ ve kalan $n$ olmaktadır.
Buna göre $m + n$ toplamının alabileceği **en büyük** değer kaçtır?

**Şıklar:**
A) 60
B) 74
C) 75
D) 88
E) 90

**Açıklama:**
Bölme kuralına göre kalan bölenden küçük olmalıdır: $n < 15$. Dolayısıyla $n$'nin alabileceği en büyük tam sayı değeri $14$'tür. Bu durumda $m = 15 \cdot 4 + 14 = 74$ olur ve toplam $m + n = 74 + 14 = 88$ bulunur.

**Çeldirici Tuzağı:**
B şıkkı ($74$), yalnızca bölünen sayı olan $m$'nin en büyük değerini bulup $n$'yi toplamaya eklemeyi unutan adayı; E şıkkı ($90$) ise $n < 15$ yerine $n = 15$ alanları yakalar.

### mat-02-027
- zorluk: 2
- dogru: C
- dogrulama: 8 + 3

**Soru:**
Beş basamaklı $38a5b$ doğal sayısı $5$ ile bölündüğünde $2$ kalanını vermekte ve $11$ ile tam bölünmektedir.
Buna göre $a$ rakamının alabileceği değerlerin toplamı kaçtır?

**Şıklar:**
A) 5
B) 8
C) 11
D) 13
E) 15

**Açıklama:**
$5$'e bölümünden $2$ kalanını vermesi için birler basamağı $b = 2$ veya $b = 7$ olmalıdır. Sağdan sola $+, -, +, -, +$ işaretleri yazılarak $11$ ile bölünebilme incelenir:
- $b = 2$ için: $(2 + a + 3) - (5 + 8) = a - 8 = 11k \Rightarrow a = 8$.
- $b = 7$ için: $(7 + a + 3) - (5 + 8) = a - 3 = 11k \Rightarrow a = 3$.
$a$'nın alabileceği değerlerin toplamı $8 + 3 = 11$ bulunur.

**Çeldirici Tuzağı:**
B şıkkı ($8$), $5$'e bölümünden $2$ kalanı için yalnızca $b = 2$'yi düşünüp $b = 7$ durumunu unutan adayı yakalar.

### mat-02-028
- zorluk: 2
- dogru: E
- dogrulama: 24 * 8 + 4

**Soru:**
Bir kütüphanedeki kitaplar $6$'şarlı ve $8$'erli paketlendiğinde her seferinde $4$ kitap artmaktadır. Aynı kitaplar $7$'şerli paketlendiğinde ise hiç kitap artmamaktadır.
Kitap sayısı $200$'den az olduğuna göre bu kütüphanede **en çok** kaç kitap vardır?

**Şıklar:**
A) 28
B) 148
C) 168
D) 172
E) 196

**Açıklama:**
Kitap sayısına $K$ denirse $K - 4$ sayısı hem $6$'nın hem $8$'in tam katıdır. $\text{EKOK}(6, 8) = 24$ olduğundan $K = 24k + 4$ biçimindedir ve aynı zamanda $7$'nin tam katı ($K < 200$) olmalıdır. $200$'ün hemen altındaki $24k + 4$ sayıları denenir: $k = 8$ için $K = 24 \cdot 8 + 4 = 196$. $196 = 7 \cdot 28$ olduğundan $7$'ye tam bölünür ve $200$'den küçüktür.

**Çeldirici Tuzağı:**
C şıkkı ($168$), üç sayının ortak katı $\text{EKOK}(6, 8, 7) = 168$'i doğrudan cevap sanıp "+4 kalan" şartını göz ardı eden adayı; A şıkkı ($28$) ise en büyük yerine en küçük değeri ($k = 1$) işaretleyenleri yakalar.

### mat-02-029
- zorluk: 2
- dogru: E
- dogrulama: 2 * lcm(3, lcm(4, 5)) - 1

**Soru:**
$3$ ile bölündüğünde $2$, $4$ ile bölündüğünde $3$ ve $5$ ile bölündüğünde $4$ kalanını veren üç basamaklı en küçük doğal sayı kaçtır?

**Şıklar:**
A) 59
B) 61
C) 89
D) 118
E) 119

**Açıklama:**
Aranan sayıya $A$ diyelim. Her bölmede kalan, bölenden $1$ eksiktir; dolayısıyla $A + 1$ sayısı $3$, $4$ ve $5$'in tam katıdır. $\text{EKOK}(3, 4, 5) = 60$ olduğundan $A + 1 = 60k \Rightarrow A = 60k - 1$ yazılır. Üç basamaklı en küçük değer için $k = 2$ alınır: $A = 60 \cdot 2 - 1 = 119$.

**Çeldirici Tuzağı:**
A şıkkı ($59$), sorudaki "üç basamaklı" şartını gözden kaçırıp $k = 1$ için $59$'u işaretleyen; D şıkkı ($118$) ise $-1$ yerine $-2$ veya yanlış kalan hesabı yapan adayı yakalar.

### mat-02-030
- zorluk: 1
- dogru: D
- dogrulama: yok

**Soru:**
$A = 2^3 \cdot 3^2 \cdot 5$ sayısı için,
I. Pozitif tam sayı bölenlerinin sayısı $24$'tür.
II. Asal olmayan pozitif tam sayı bölenlerinin sayısı $20$'dir.
III. Tek pozitif tam sayı bölenlerinin sayısı $6$'dır.
ifadelerinden hangileri doğrudur?

**Şıklar:**
A) Yalnız I
B) Yalnız III
C) I ve II
D) I ve III
E) I, II ve III

**Açıklama:**
- I: Pozitif bölen sayısı $(3 + 1)(2 + 1)(1 + 1) = 4 \cdot 3 \cdot 2 = 24$'tür (I doğru).
- II: Asal bölenler $\{2, 3, 5\}$ olmak üzere $3$ tanedir; dolayısıyla asal olmayan pozitif bölen sayısı $24 - 3 = 21$ olur, $20$ değildir (II yanlış).
- III: Tek bölenler $2$ çarpanı içermez; $3^2 \cdot 5^1$ kısmından $(2 + 1)(1 + 1) = 6$ tane tek pozitif bölen gelir (III doğru).

**Çeldirici Tuzağı:**
E şıkkı (I, II ve III), asal olmayan bölen sayısını bulurken $3$ asal sayının yanında $1$'i de ayrıca çıkarıp $24 - 4 = 20$ bulan adayı yakalar. Oysa $1$ sayısı zaten asal değildir ve bu kümenin içinde yer alır.

### mat-02-031
- zorluk: 2
- dogru: B
- dogrulama: 6 * 3 + 6 * 5

**Soru:**
Biri diğerinin tam katı olmayan $a$ ve $b$ pozitif tam sayıları için $\text{EBOB}(a, b) = 6$ ve $\text{EKOK}(a, b) = 90$ veriliyor.
Buna göre $a + b$ toplamı kaçtır?

**Şıklar:**
A) 36
B) 48
C) 60
D) 84
E) 96

**Açıklama:**
$\text{EBOB}(a, b) = 6$ olduğundan aralarında asal $x$ ve $y$ pozitif tam sayıları için $a = 6x$ ve $b = 6y$ yazılır. $\text{EKOK}(a, b) = 6xy = 90 \Rightarrow xy = 15$ bulunur. Aralarında asal çarpan çiftleri $(1, 15)$ ve $(3, 5)$'tir. Biri diğerinin tam katı olmayacağı için $(1, 15)$ çifti $(6, 90)$ elenir; $(3, 5)$ çiftinden sayılar $18$ ve $30$ elde edilir. Toplam $18 + 30 = 48$'dir.

**Çeldirici Tuzağı:**
E şıkkı ($96$), "biri diğerinin tam katı olmayan" koşulunu atlayıp $(6, 90)$ çiftinin toplamını ($6 + 90 = 96$) işaretleyen adayı yakalar.

### mat-02-032
- zorluk: 2
- dogru: C
- dogrulama: (36 / 4) * (36 / 6) * (36 / 9)

**Soru:**
Ayrıt uzunlukları $4$ cm, $6$ cm ve $9$ cm olan dikdörtgenler prizması biçimindeki tuğlalar boşluk kalmadan yan yana ve üst üste dizilerek **en küçük hacimli bir küp** oluşturulacaktır.
Buna göre bu iş için en az kaç tuğla gerekir?

**Şıklar:**
A) 19
B) 36
C) 216
D) 270
E) 324

**Açıklama:**
Oluşacak en küçük küpün bir ayrıtı $4, 6$ ve $9$'un en küçük ortak katı olan $\text{EKOK}(4, 6, 9) = 36$ cm olmalıdır. Küpün üç boyutuna sığacak tuğla sayıları çarpılarak toplam adet bulunur:
$$\frac{36}{4} \cdot \frac{36}{6} \cdot \frac{36}{9} = 9 \cdot 6 \cdot 4 = 216$$

**Çeldirici Tuzağı:**
A şıkkı ($19$), boyutlara sığan adetleri çarpmak yerine $9 + 6 + 4 = 19$ olarak toplayan adayı; B şıkkı ($36$) ise sadece küpün bir kenar uzunluğunu işaretleyenleri yakalar.

### mat-02-033
- zorluk: 3
- dogru: D
- dogrulama: (5^2 + 7^2 + 5) % 9

**Soru:**
$A$ doğal sayısının $9$ ile bölümünden kalan $5$, $B$ doğal sayısının $9$ ile bölümünden kalan $7$'dir.
Buna göre $A^2 + B^2 + 5$ sayısının $9$ ile bölümünden kalan kaçtır?

**Şıklar:**
A) 1
B) 3
C) 5
D) 7
E) 8

**Açıklama:**
Bölmede kalanlarla doğrudan işlem yapılabilir: $A \equiv 5$ ve $B \equiv 7$ (mod $9$) alınır:
$$5^2 + 7^2 + 5 = 25 + 49 + 5 = 79$$
$79$ sayısı $9$'a bölünürse $79 = 9 \cdot 8 + 7$ elde edilir; yani kalan $7$'dir.

**Çeldirici Tuzağı:**
A şıkkı ($1$) veya E şıkkı ($8$), $7^2 = 49$ hesaplamasını mod $9$'da indirgerken veya $+5$ sabitini eklemeyi unuttuğunda ortaya çıkan yanlış kalanlardır ($74 \equiv 2$ veya $79$ bölme hatası).

### mat-02-034
- zorluk: 3
- dogru: E
- dogrulama: floor(23 / 5) + 2

**Soru:**
$$23! + 24!$$
toplamının sondan kaç basamağı sıfırdır?

**Şıklar:**
A) 2
B) 3
C) 4
D) 5
E) 6

**Açıklama:**
Toplama işlemi ortak çarpan parantezine alınır:
$$23! + 24! = 23! + 24 \cdot 23! = 23!(1 + 24) = 23! \cdot 25 = 23! \cdot 5^2$$
$23!$ içindeki $5$ çarpanı sayısı $\lfloor 23 \div 5 \rfloor = 4$ adettir ($5^4$). Yanındaki $25 = 5^2$ çarpanından $2$ tane daha $5$ çarpanı geldiğinden toplam $4 + 2 = 6$ tane $5$ çarpanı (ve yeterince fazla $2$ çarpanı) vardır. Dolayısıyla sayının sondan $6$ basamağı sıfırdır.

**Çeldirici Tuzağı:**
C şıkkı ($4$), $23! + 24!$ toplamını paranteze almadan doğrudan küçük faktöriyel olan $23!$'in sondan sıfır sayısını ($\lfloor 23/5 \rfloor = 4$) işaretleyen adayların düştüğü klasik faktöriyel tuzağıdır.

### mat-02-035
- zorluk: 3
- dogru: A
- dogrulama: 4 * lcm(4, lcm(5, 6)) - 3

**Soru:**
Bir $A$ doğal sayısı $4$ ile bölündüğünde $1$, $5$ ile bölündüğünde $2$, $6$ ile bölündüğünde $3$ kalanını vermektedir.
$A > 200$ olduğuna göre $A$'nın alabileceği en küçük değer kaçtır?

**Şıklar:**
A) 237
B) 117
C) 177
D) 243
E) 297

**Açıklama:**
Her bölmede kalan bölenden $3$ eksiktir ($4 - 1 = 5 - 2 = 6 - 3 = 3$). O hâlde $A + 3$ sayısı $4$, $5$ ve $6$'nın tam katıdır. $\text{EKOK}(4, 5, 6) = 60$ olduğundan $A + 3 = 60k \Rightarrow A = 60k - 3$ olur. $A > 200$ şartını sağlayan en küçük $k$ değeri $k = 4$'tür ($k = 3 \Rightarrow 177$): $A = 60 \cdot 4 - 3 = 237$ bulunur.

**Çeldirici Tuzağı:**
D şıkkı ($243$), $A = 60k - 3$ yerine yanlışlıkla $60k + 3$ kurarak $240 + 3 = 243$ bulan adayı; C şıkkı ($177$) ise $200$'den büyük olma şartını ihmal edenleri yakalar.


### mat-02-036
- zorluk: 1
- dogru: A
- dogrulama: (42 / gcd(42, 56)) * (56 / gcd(42, 56))

**Soru:**
Şekildeki $42$ cm ve $56$ cm kenar uzunluklarına sahip dikdörtgen biçimindeki bir levha, hiç parça artmayacak şekilde eşit büyüklükte en büyük **karelere** bölünecektir.
Buna göre en az kaç kare elde edilir?

**Şekil:**
```json
{
  "kind": "geometry",
  "pointLabels": false,
  "points": {
    "A": [0, 0],
    "B": [5.6, 0],
    "C": [5.6, 4.2],
    "D": [0, 4.2],
    "P1": [1.4, 0], "P2": [1.4, 4.2],
    "P3": [2.8, 0], "P4": [2.8, 4.2],
    "P5": [4.2, 0], "P6": [4.2, 4.2],
    "Q1": [0, 1.4], "Q2": [5.6, 1.4],
    "Q3": [0, 2.8], "Q4": [5.6, 2.8]
  },
  "shapes": [
    { "type": "polygon", "points": ["A", "B", "C", "D"] },
    { "type": "segment", "from": "A", "to": "B", "label": "56 cm" },
    { "type": "segment", "from": "B", "to": "C", "label": "42 cm" },
    { "type": "segment", "from": "P1", "to": "P2", "dashed": true },
    { "type": "segment", "from": "P3", "to": "P4", "dashed": true },
    { "type": "segment", "from": "P5", "to": "P6", "dashed": true },
    { "type": "segment", "from": "Q1", "to": "Q2", "dashed": true },
    { "type": "segment", "from": "Q3", "to": "Q4", "dashed": true }
  ]
}
```

**Şıklar:**
A) 12
B) 7
C) 14
D) 16
E) 24

**Açıklama:**
Elde edilecek karelerin sayısının en az olması için karenin bir kenarı $42$ ve $56$'nın en büyük ortak böleni olmalıdır: $\text{EBOB}(42, 56) = 14$ cm. Yatayda $\dfrac{56}{14} = 4$, dikeyde $\dfrac{42}{14} = 3$ kare oluştuğundan toplam $4 \cdot 3 = 12$ kare elde edilir.

**Çeldirici Tuzağı:**
C şıkkı ($14$), kare sayısını bulmak yerine karenin bir kenar uzunluğu olan $\text{EBOB} = 14$ değerini işaretleyen; B şıkkı ($7$) ise parçaları $4 + 3 = 7$ şeklinde toplayan adayı yakalar.

### mat-02-037
- zorluk: 2
- dogru: B
- dogrulama: lcm(18, lcm(24, 30)) / 60

**Soru:**
Bir duraktan kalkan üç farklı otobüs hattının dakika cinsinden hareket aralıkları aşağıdaki tabloda verilmiştir.
Üç otobüs aynı anda ilk seferine çıktıktan en az **kaç saat sonra** tekrar birlikte hareket eder?

**Şekil:**
```json
{
  "kind": "table",
  "headers": ["Otobüs Hattı", "Hareket Aralığı (dk)"],
  "rows": [
    ["A Hattı", "18"],
    ["B Hattı", "24"],
    ["C Hattı", "30"]
  ]
}
```

**Şıklar:**
A) 4
B) 6
C) 8
D) 9
E) 12

**Açıklama:**
Üç hattın tekrar aynı anda hareket etmesi için geçen süre $18$, $24$ ve $30$'un en küçük ortak katıdır:
$$\text{EKOK}(18, 24, 30) = 360\text{ dakika}$$
$1$ saat $60$ dakika olduğundan $\dfrac{360}{60} = 6$ saat sonra tekrar birlikte hareket ederler.

**Çeldirici Tuzağı:**
A şıkkı ($4$) veya C şıkkı ($8$), asal çarpanlara ayırırken $18 = 2 \cdot 3^2$, $24 = 2^3 \cdot 3$, $30 = 2 \cdot 3 \cdot 5$ içinden $2$'nin en büyük kuvveti ($8$) yerine yanlış kat alarak $240$ ya da $480$ dakika hesaplayan adayı yakalar.

### mat-02-038
- zorluk: 2
- dogru: C
- dogrulama: 18 - (5 + 2 + 4)

**Soru:**
Şekildeki akış şemasına rakamları birbirinden farklı dört basamaklı bir $5a2b$ doğal sayısı giriliyor ve sırasıyla tüm koşulları sağlayan **en büyük** $5a2b$ sayısı çıkışa yazılıyor.
Buna göre bu sayıdaki $a$ rakamı kaçtır?

**Şekil:**
```json
{
  "kind": "flow",
  "nodes": [
    { "id": "in", "text": "5a2b", "at": [0, 0], "shape": "circle" },
    { "id": "s1", "text": "4'ün katı", "at": [1.8, 0] },
    { "id": "s2", "text": "9'un katı", "at": [3.6, 0] },
    { "id": "out", "text": "En büyük", "at": [5.4, 0], "shape": "circle" }
  ],
  "edges": [
    { "from": "in", "to": "s1" },
    { "from": "s1", "to": "s2" },
    { "from": "s2", "to": "out", "label": "a ≠ b" }
  ]
}
```

**Şıklar:**
A) 3
B) 5
C) 7
D) 8
E) 9

**Açıklama:**
$5a2b$ sayısının en büyük olması için yüzler basamağı $a$'nın en büyük değeri aranır:
- $4$'ün katı olması için son iki basamak $2b \in \{20, 24, 28\}$ olmalıdır ($b \in \{0, 4, 8\}$).
- $b = 0 \Rightarrow 5 + a + 2 + 0 = 9k \Rightarrow a = 2$ ($5220$, $2$ tekrar eder).
- $b = 4 \Rightarrow 5 + a + 2 + 4 = 11 + a = 9k \Rightarrow a = 7$ ($5724$, rakamları farklı ve en büyük).
- $b = 8 \Rightarrow 5 + a + 2 + 8 = 15 + a = 9k \Rightarrow a = 3$ ($5328$, daha küçük).
En büyük sayı $5724$ olduğundan $a = 7$ bulunur.

**Çeldirici Tuzağı:**
A şıkkı ($3$), yalnızca en büyük birler basamağı olan $b = 8$'i deneyip sayının büyüklüğünü belirleyen basamağın $a$ olduğunu gözden kaçırarak $5328$ sayısını alan adayı yakalar.

### mat-02-039
- zorluk: 2
- dogru: D
- dogrulama: (24 / gcd(24, gcd(36, 42)) - 1) + (36 / gcd(24, gcd(36, 42)) - 1) + (42 / gcd(24, gcd(36, 42)) - 1)

**Soru:**
Şekildeki uzunlukları $24$ cm, $36$ cm ve $42$ cm olan üç ahşap çubuk, hiç parça artmayacak biçimde **eşit uzunlukta en büyük parçalara** kesilecektir.
Her kesim işlemi ayrı yapıldığına göre bu iş için toplam **en az kaç kesim** yapılmalıdır?

**Şekil:**
```json
{
  "kind": "geometry",
  "pointLabels": false,
  "points": {
    "A": [0, 4],
    "B": [4.8, 4],
    "C": [0, 2],
    "D": [7.2, 2],
    "E": [0, 0],
    "F": [8.4, 0]
  },
  "shapes": [
    { "type": "segment", "from": "A", "to": "B", "label": "24 cm" },
    { "type": "segment", "from": "C", "to": "D", "label": "36 cm" },
    { "type": "segment", "from": "E", "to": "F", "label": "42 cm" }
  ]
}
```

**Şıklar:**
A) 6
B) 11
C) 12
D) 14
E) 17

**Açıklama:**
Kesim sayısının en az olması için her parçanın uzunluğu en büyük seçilir: $\text{EBOB}(24, 36, 42) = 6$ cm.
Oluşan parça sayıları ve gereken kesim sayıları ($n$ parça için $n - 1$ kesim):
- $24 \div 6 = 4$ parça $\to 3$ kesim,
- $36 \div 6 = 6$ parça $\to 5$ kesim,
- $42 \div 6 = 7$ parça $\to 6$ kesim.
Toplam kesim sayısı $3 + 5 + 6 = 14$'tür.

**Çeldirici Tuzağı:**
E şıkkı ($17$), kesim sayısı yerine elde edilen toplam parça sayısını ($4 + 6 + 7 = 17$) işaretleyen adayın düştüğü klasik parça-kesim tuzağıdır.

### mat-02-040
- zorluk: 3
- dogru: E
- dogrulama: 3 + 4

**Soru:**
Dört basamaklı $4a3b$ doğal sayısı $15$ ile bölündüğünde $2$ kalanını vermektedir.
Buna göre bu koşulu sağlayan **kaç farklı** $4a3b$ doğal sayısı yazılabilir?

**Şıklar:**
A) 3
B) 4
C) 5
D) 6
E) 7

**Açıklama:**
$4a3b$ sayısı $15$'e bölündüğünde $2$ kalanını veriyorsa $4a3b - 2$ sayısı hem $5$'e hem $3$'e tam bölünür:
- $5$'e bölünebilmeden $b - 2 \equiv 0$ (mod $5$) $\Rightarrow b = 2$ veya $b = 7$ olur.
- $3$'e bölünebilmeden $4 + a + 3 + b - 2 = 5 + a + b \equiv 0$ (mod $3$):
  - $b = 2$ için $7 + a \equiv 0$ (mod $3$) $\Rightarrow a \in \{2, 5, 8\}$ ($3$ sayı).
  - $b = 7$ için $12 + a \equiv 0$ (mod $3$) $\Rightarrow a \in \{0, 3, 6, 9\}$ ($4$ sayı).
Toplam $3 + 4 = 7$ farklı $4a3b$ sayısı yazılabilir.

**Çeldirici Tuzağı:**
A şıkkı ($3$) veya D şıkkı ($6$), $b = 7$ durumunu gözden kaçıran ya da $b = 7$ için $a = 0$ rakamını ($4037$) saymayı unutan adayı yakalar.