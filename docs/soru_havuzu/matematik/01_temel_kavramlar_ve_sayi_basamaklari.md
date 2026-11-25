---
ders: Matematik & Geometri
konu: Temel Kavramlar ve Sayı Basamakları
kod: mat
kapsam: [lisans_gygk, b_grubu_gygk]
---

### mat-01-001
- zorluk: 1
- dogru: B
- dogrulama: -12 + 102

**Soru:**
Rakamları sıfırdan ve birbirinden farklı iki basamaklı en büyük negatif tam sayı ile rakamları birbirinden farklı üç basamaklı en küçük pozitif tam sayının toplamı kaçtır?

**Şıklar:**
A) 4
B) 90
C) 92
D) 104
E) 114

**Açıklama:**
Negatif sayılar sıfıra yaklaştıkça büyür. İki basamaklı, rakamları sıfırdan ve birbirinden farklı en büyük negatif tam sayı $-12$'dir ($-10$ sıfır içerdiği, $-11$ ise aynı rakamdan oluştuğu için seçilemez). Rakamları birbirinden farklı üç basamaklı en küçük pozitif tam sayı ise yüzler basamağı $1$, onlar basamağı $0$, birler basamağı $2$ seçilerek $102$ bulunur. İki sayının toplamı $-12 + 102 = 90$ olur.

**Çeldirici Tuzağı:**
C şıkkı (92), sorudaki sıfırdan farklı koşulunu gözden kaçırıp iki basamaklı en büyük negatif sayıyı $-10$ alan adayı yakalar. A şıkkı (4) ise negatiflerde en büyük yerine en küçük sayıyı ($-98$) seçme hatasından doğar.

### mat-01-002
- zorluk: 1
- dogru: D
- dogrulama: yok

**Soru:**
$a$, $b$ ve $c$ tam sayıları için
$$3a + 4b = 5c + 1$$
eşitliği sağlanmaktadır.
Buna göre,
I. $a + c$ tek sayıdır.
II. $b$ çift sayıdır.
III. $a \cdot c$ çift sayıdır.
ifadelerinden hangileri her zaman doğrudur?

**Şıklar:**
A) Yalnız I
B) Yalnız II
C) I ve II
D) I ve III
E) II ve III

**Açıklama:**
$4b$ terimi $b$ tam sayısı ne olursa olsun her zaman çifttir; dolayısıyla $b$'nin tek mi çift mi olduğu belirlenemez (II kesin değildir). Eşitliğin sol tarafı $3a + \text{çift}$, sağ tarafı $5c + 1$ biçimindedir. $3$ ve $5$ tek katsayılar olduğu için $3a$'nın tekliği $a$'nın, $5c$'nin tekliği $c$'nin tekliğiyle aynıdır. Buna göre $a$ çift ise $5c + 1$ çift olacağından $c$ tektir; $a$ tek ise $5c + 1$ tek olacağından $c$ çifttir. Her iki durumda da $a$ ve $c$ zıt paritededir; biri tek biri çift olduğundan $a + c$ toplamı her zaman tek (I doğru), $a \cdot c$ çarpımı ise her zaman çifttir (III doğru).

**Çeldirici Tuzağı:**
C şıkkı (I ve II), denklemde $4b$ terimini görüp $b$'nin de çift olmak zorunda olduğunu sanan adayı yakalar. Oysa $4$ çarpanı nedeniyle $b$ tek bir tam sayı olsa bile $4b$ çift kalır.

### mat-01-003
- zorluk: 2
- dogru: A
- dogrulama: yok

**Soru:**
$x$, $y$ ve $z$ sıfırdan farklı gerçel sayılar olmak üzere
$x^2 \cdot y < 0$
$y \cdot z < 0$
$x \cdot z^3 < 0$
eşitsizlikleri veriliyor.
Buna göre $x$, $y$ ve $z$ sayılarının işaretleri sırasıyla aşağıdakilerden hangisidir?

**Şıklar:**
A) $-, -, +$
B) $-, +, -$
C) $+, -, +$
D) $+, +, -$
E) $-, +, +$

**Açıklama:**
$x \neq 0$ olduğundan $x^2 > 0$'dır. İlk eşitsizlikten $x^2 \cdot y < 0$ olduğuna göre $y < 0$ (negatif) olmalıdır. İkinci eşitsizlikte $y < 0$ ve $y \cdot z < 0$ olduğundan $z > 0$ (pozitif) bulunur. Üçüncü eşitsizlikte $z > 0$ olduğu için $z^3 > 0$ olur; çarpımın negatif kalması için $x < 0$ (negatif) olmalıdır. İşaretler sırasıyla $-, -, +$ şeklindedir.

**Çeldirici Tuzağı:**
C şıkkı ($+, -, +$), ilk eşitsizlikten $y < 0$ ve $z > 0$ bulduktan sonra $x^2$'nin pozitifliğini $x$'in kendisi pozitifmiş gibi yorumlayan adayı yakalar. Bir sayının karesinin pozitif olması, o sayının işaretini değil yalnızca sıfırdan farklı olduğunu gösterir.

### mat-01-004
- zorluk: 1
- dogru: E
- dogrulama: (140 / 5 - 4) * (140 / 5 + 4)

**Soru:**
Ardışık beş çift tam sayının toplamı $140$'tır.
Buna göre bu sayıların en küçüğü ile en büyüğünün çarpımı kaçtır?

**Şıklar:**
A) 640
B) 700
C) 720
D) 756
E) 768

**Açıklama:**
Ardışık beş çift tam sayının ortancası toplamın terim sayısına bölünmesiyle bulunur: $140 \div 5 = 28$. Ardışık çift sayılar ikişer ikişer arttığı için bu beş sayı $24, 26, 28, 30, 32$ olur. En küçük sayı $24$, en büyük sayı $32$'dir; çarpımları $24 \cdot 32 = 768$ olarak bulunur.

**Çeldirici Tuzağı:**
D şıkkı (756), ortanca sayı $28$'i bulduktan sonra sayıları birer birer artan ardışık tam sayı sanıp $26 \cdot 30$ ya da $27 \cdot 28$ gibi hatalı uç değerler seçen adayı yakalar. Çift sayılarda ardışık iki terim arasındaki fark $2$'dir.

### mat-01-005
- zorluk: 2
- dogru: C
- dogrulama: sqrt(165 + 4) * 2

**Soru:**
$a$ ve $b$ asal sayılar olmak üzere
$$a^2 - b^2 = 165$$
eşitliği sağlanmaktadır.
Buna göre $a \cdot b$ çarpımı kaçtır?

**Şıklar:**
A) 15
B) 22
C) 26
D) 38
E) 58

**Açıklama:**
İki kare farkı özdeşliğiyle $(a - b)(a + b) = 165$ yazılır. $165 = 3 \cdot 5 \cdot 11$ pozitif çarpan çiftleri incelenir: $(1, 165)$ için $a = 83, b = 82$ ($82$ asal değil); $(3, 55)$ için $a = 29, b = 26$ ($26$ asal değil); $(5, 33)$ için $a = 19, b = 14$ ($14$ asal değil); $(11, 15)$ için $a = 13, b = 2$ (ikisi de asal). Dolayısıyla tek çözüm $a = 13$ ve $b = 2$'dir; çarpımları $13 \cdot 2 = 26$ bulunur.

**Çeldirici Tuzağı:**
D şıkkı (38), $(5, 33)$ çarpan çiftinden $a = 19$ bulup $19$'un asal olmasından hareketle $b$'nin asal olup olmadığını denetlemeden $19 \cdot 2 = 38$ işaretleyen adayı yakalar. $2$ dışındaki tüm asal sayılar tek olduğundan iki tek asalın toplamı ve farkı çift olamaz; bu nedenle küçük asal mutlaka $2$ olmalıdır.

### mat-01-006
- zorluk: 2
- dogru: D
- dogrulama: 100 * 1 + 10 * (1 + 100 / 25) + 100 / 25

**Soru:**
Rakamları sıfırdan ve birbirinden farklı üç basamaklı bir $ABC$ doğal sayısının yüzler basamağındaki rakamın basamak değeri, birler basamağındaki rakamın basamak değerinin $25$ katıdır. Onlar basamağındaki rakam ise yüzler ve birler basamağındaki rakamların toplamına eşittir.
Buna göre $ABC$ sayısı kaçtır?

**Şıklar:**
A) 124
B) 145
C) 152
D) 154
E) 289

**Açıklama:**
Yüzler basamağındaki $A$ rakamının basamak değeri $100A$, birler basamağındaki $C$ rakamının basamak değeri $C$'dir. Verilen koşuldan $100A = 25C$, yani $C = 4A$ elde edilir. $A$ ve $C$ sıfırdan farklı birer rakam olduğundan $A = 1$ için $C = 4$, $A = 2$ için $C = 8$ olur. Ancak onlar basamağındaki $B = A + C$ rakamı tek haneli olmalıdır: $A = 2$ durumunda $B = 2 + 8 = 10$ çıkacağından elenir. $A = 1, C = 4$ seçildiğinde $B = 1 + 4 = 5$ olur ve sayı $154$ bulunur.

**Çeldirici Tuzağı:**
B şıkkı (145), $A = 1, B = 5, C = 4$ rakamlarını doğru bulduktan sonra onlar ve birler basamağının yerini karıştıran adayı yakalar. Soruda $4$'ün birler, $5$'in onlar basamağı olduğu açıkça verilmiştir.

### mat-01-007
- zorluk: 2
- dogru: B
- dogrulama: 3^2 + ((318 - 91 * 3) / 9)^2

**Soru:**
Üç basamaklı $ABA$ doğal sayısı ile iki basamaklı $AB$ doğal sayısının farkı
$$ABA - AB = 318$$
olduğuna göre $A^2 + B^2$ toplamı kaçtır?

**Şıklar:**
A) 25
B) 34
C) 41
D) 52
E) 65

**Açıklama:**
Basamak çözümlemesi yapılırsa $ABA = 100A + 10B + A = 101A + 10B$ ve $AB = 10A + B$ olur. Fark alındığında $(101A + 10B) - (10A + B) = 91A + 9B = 318$ elde edilir. $A$ sıfırdan farklı bir rakam olmak üzere değer denenirse $A = 1$ için $9B = 227$ ve $A = 2$ için $9B = 136$ tam bölünmez; $A = 3$ için $91 \cdot 3 = 273$ ve $9B = 318 - 273 = 45$ olduğundan $B = 5$ bulunur ($A \ge 4$ için $91A > 318$). O hâlde $A^2 + B^2 = 3^2 + 5^2 = 9 + 25 = 34$ olur.

**Çeldirici Tuzağı:**
C şıkkı (41), $ABA$'yı $100A + 10B$ gibi eksik çözümleyip $A$ ve $B$ için yanlış rakamlara (örneğin $4$ ve $5$) ulaşan adayı yakalar. Yüzler ve birler basamağındaki aynı $A$ harfinin toplam katkısı $101A$'dır.

### mat-01-008
- zorluk: 1
- dogru: C
- dogrulama: 2 * 5 / (7 - 5)

**Soru:**
$n$ bir pozitif tam sayı olmak üzere
$$\dfrac{(n + 1)! + n!}{(n + 1)! - n!} = \dfrac{7}{5}$$
eşitliğini sağlayan $n$ değeri kaçtır?

**Şıklar:**
A) 3
B) 4
C) 5
D) 6
E) 7

**Açıklama:**
Pay ve payda $n!$ ortak çarpan parantezine alınır:
$$\dfrac{n!((n + 1) + 1)}{n!((n + 1) - 1)} = \dfrac{n + 2}{n} = \dfrac{7}{5}$$
İçler dışlar çarpımı yapıldığında $5(n + 2) = 7n \Rightarrow 5n + 10 = 7n \Rightarrow 2n = 10 \Rightarrow n = 5$ bulunur.

**Çeldirici Tuzağı:**
D şıkkı ($6$), paydadaki $(n + 1)! - n!$ sadeleştirmesinde $-1$'i unutup $n + 1 = 6$ sonucuna giden veya bulduğu $n$ yerine $n + 1$ değerini işaretleyen adayı yakalar.

### mat-01-009
- zorluk: 2
- dogru: C
- dogrulama: floor(18 / 5) + 1

**Soru:**
$$18! + 19!$$
sayısının sondan kaç basamağı sıfırdır?

**Şıklar:**
A) 2
B) 3
C) 4
D) 5
E) 6

**Açıklama:**
İfade küçük olan faktöriyel parantezine alınır: $18! + 19! = 18!(1 + 19) = 18! \cdot 20$. Sondaki sıfır sayısını $10 = 2 \cdot 5$ çarpanlarının adedi ve belirleyici olarak daha az bulunan $5$ çarpanı tayin eder. $18!$ içinde $\lfloor 18 \div 5 \rfloor = 3$ tane $5$ çarpanı vardır. Yanındaki $20 = 4 \cdot 5$ çarpanından da $1$ tane daha $5$ çarpanı geldiği için toplam $3 + 1 = 4$ tane $5$ çarpanı bulunur (yeterince $2$ çarpanı vardır). Dolayısıyla sayının sondan $4$ basamağı sıfırdır.

**Çeldirici Tuzağı:**
B şıkkı (3), yalnızca $18!$ içindeki $5$ çarpanlarını sayıp parantez dışından gelen $1 + 19 = 20$ çarpanındaki $5$'i unutan adayı yakalar. E şıkkı (6) ise $18!$ ve $19!$'in ayrı ayrı sondan sıfır sayılarını ($3 + 3$) toplayan adayın düştüğü tuzaktır.

### mat-01-010
- zorluk: 3
- dogru: E
- dogrulama: (20 * 21 / 2 - 195 - 1) / 2 + 1

**Soru:**
$1$'den $n$'ye kadar olan ardışık doğal sayıların yazılı olduğu bir listeden ardışık iki doğal sayı siliniyor. Kalan sayıların toplamı $195$ olduğuna göre silinen sayılardan büyük olanı kaçtır?

**Şıklar:**
A) 4
B) 5
C) 6
D) 7
E) 8

**Açıklama:**
$1$'den $n$'ye kadar olan sayıların toplamı $\dfrac{n(n + 1)}{2}$'dir. Silinen ardışık iki sayı $k$ ve $k + 1$ ($1 \le k \le n - 1$) ise toplamları $2k + 1$ olur; bu toplam tek sayıdır ve en az $3$, en çok $2n - 1$ olabilir.
$n = 19$ için $\dfrac{19 \cdot 20}{2} = 190 < 195$ olduğundan yetmez.
$n = 20$ için $\dfrac{20 \cdot 21}{2} = 210$ olur ve silinen toplam $210 - 195 = 15$ bulunur; $2k + 1 = 15 \Rightarrow k = 7$ (uygun aralıktadır).
$n = 21$ için $231 - 195 = 36$ çift sayıdır ($2k + 1$'e eşit olamaz); $n \ge 22$ için ise fark en az $253 - 195 = 58 > 2n - 1$ olacağından imkânsızdır.
Silinen sayılar $7$ ve $8$ olup büyük olanı $8$'dir.

**Çeldirici Tuzağı:**
D şıkkı (7), $2k + 1 = 15$ denkleminden $k = 7$ değerini bulup küçük olan sayıyı işaretleyen adayı yakalar. Soru silinen ardışık iki sayıdan büyük olanını ($k + 1 = 8$) sormaktadır.

### mat-01-011
- zorluk: 2
- dogru: D
- dogrulama: yok

**Soru:**
Sayı doğrusunda gösterilen $a$, $b$ ve $c$ gerçel sayıları $-2 < a < -1 < 0 < b < 1 < c < 2$ eşitsizliğini sağlamaktadır.
Buna göre,
I. $b - a$
II. $a + c$
III. $a(b - c)$
ifadelerinden hangileri her zaman pozitiftir?

**Şekil:**
```json
{
  "kind": "numberline",
  "min": -3,
  "max": 3,
  "step": 1,
  "points": [
    { "at": -1.4, "label": "a" },
    { "at": 0.4, "label": "b" },
    { "at": 1.6, "label": "c" }
  ]
}
```

**Şıklar:**
A) Yalnız I
B) Yalnız III
C) I ve II
D) I ve III
E) I, II ve III

**Açıklama:**
$b > 0$ ve $a < 0$ olduğundan $b > a$'dır; büyük sayıdan küçük sayı çıkarıldığında $b - a > 0$ her zaman pozitiftir (I doğru). II numaralı ifadede $a \in (-2, -1)$ ve $c \in (1, 2)$ aralığındadır; örneğin $a = -1{,}8$ ve $c = 1{,}2$ seçilirse $a + c = -0{,}6 < 0$ olur, yani her zaman pozitif değildir (II yanlış). III numaralı ifadede $a < 0$ ve $b < c$ olduğu için $b - c < 0$ olur; iki negatif sayının çarpımı olan $a(b - c)$ her zaman pozitiftir (III doğru).

**Çeldirici Tuzağı:**
E şıkkı (I, II ve III), şekilde $c$'nin sıfıra olan uzaklığının $a$'nınkine kıyasla biraz daha büyük görünmesine aldanıp $a + c$'nin de kesinlikle pozitif olduğunu düşünen adayı yakalar. Aralık verilerinde uç değerler ($a = -1{,}9$, $c = 1{,}1$) denenerek işaretin değişebildiği kontrol edilmelidir.

### mat-01-012
- zorluk: 3
- dogru: C
- dogrulama: floor(((1655 + 2998) / 9) / 100) + floor((((1655 + 2998) / 9) % 100) / 10) + ((1655 + 2998) / 9) % 10

**Soru:**
Üç basamaklı bir $ABC$ doğal sayısının sağına $2$ rakamı yazılarak dört basamaklı $ABC2$ sayısı, soluna $3$ rakamı yazılarak dört basamaklı $3ABC$ sayısı elde ediliyor.
$$ABC2 - 3ABC = 1.655$$
olduğuna göre $A + B + C$ toplamı kaçtır?

**Şıklar:**
A) 11
B) 12
C) 13
D) 14
E) 15

**Açıklama:**
Üç basamaklı sayı $x = ABC$ olarak adlandırılırsa sağına $2$ yazmak sayıyı $10$ ile çarpıp $2$ eklemek demektir: $ABC2 = 10x + 2$. Soluna $3$ yazmak ise binler basamağına $3$ eklemektir: $3ABC = 3.000 + x$. Verilen fark denkleminde yerine konursa $(10x + 2) - (3.000 + x) = 1.655 \Rightarrow 9x - 2.998 = 1.655 \Rightarrow 9x = 4.653 \Rightarrow x = 517$ bulunur. $ABC = 517$ olduğundan rakamlar toplamı $5 + 1 + 7 = 13$ olur.

**Çeldirici Tuzağı:**
B şıkkı (12), $3ABC$ sayısını çıkarırken $+2$ ve $-3.000$ terimlerinin işaretini karıştırıp $9x = 4.653$ yerine hatalı bir bölme veya rakam toplamı elde eden adayı yakalar. Dört basamaklı çözümlemeyi tek tek $1000A + \ldots$ açmak yerine $ABC$ bloğunu $x$ değişkeni olarak tutmak işlem hatasını önler.

### mat-01-013
- zorluk: 1
- dogru: A
- dogrulama: (28 - 2 * 1 - 2) / 3

**Soru:**
$a$, $b$ ve $c$ birbirinden farklı pozitif tam sayılar olmak üzere
$$3a + 2b + c = 28$$
eşitliğini sağlayan en büyük $a$ değeri kaçtır?

**Şıklar:**
A) 8
B) 7
C) 9
D) 6
E) 10

**Açıklama:**
$a$'nın en büyük değerini alması için $2b + c$ toplamı en küçük seçilmelidir. Katsayısı büyük olan $b$ en küçük pozitif tam sayı $1$, $c$ ise farklı pozitif tam sayı $2$ seçilirse $2(1) + 2 = 4$ olur. Buradan $3a = 28 - 4 = 24 \Rightarrow a = 8$ bulunur ($a = 9$ için $2b + c = 1$ gerekir, pozitif tam sayılarla imkânsızdır).

**Çeldirici Tuzağı:**
C şıkkı (9), "pozitif tam sayı" şartını sıfır dahil sanıp $b = 0, c = 1$ alarak $3a = 27 \Rightarrow a = 9$ bulan adayı yakalar.

### mat-01-014
- zorluk: 1
- dogru: D
- dogrulama: 13

**Soru:**
$x$ ve $y$ birer tam sayı olmak üzere $x \cdot y = 24$ eşitliği verilmektedir.
Buna göre $x + y$ toplamı aşağıdakilerden hangisi **olamaz**?

**Şıklar:**
A) -25
B) -14
C) -10
D) 13
E) 25

**Açıklama:**
$x$ ve $y$ "tam sayı" olduğu için negatif çarpan çiftleri de dikkate alınmalıdır. Çarpımları $24$ olan tam sayı ikilileri ve toplamları:
- $(1, 24) \rightarrow 25$ ve $(-1, -24) \rightarrow -25$
- $(2, 12) \rightarrow 14$ ve $(-2, -12) \rightarrow -14$
- $(3, 8) \rightarrow 11$ ve $(-3, -8) \rightarrow -11$
- $(4, 6) \rightarrow 10$ ve $(-4, -6) \rightarrow -10$
Dolayısıyla $x + y$ toplamı $13$ değerini alamaz.

**Çeldirici Tuzağı:**
A şıkkı ($-25$) veya B şıkkı ($-14$), sorudaki "tam sayı" ifadesini "pozitif tam sayı" sanıp negatif toplamların olamayacağını düşünen adayı yakalar.

### mat-01-015
- zorluk: 2
- dogru: C
- dogrulama: yok

**Soru:**
$a$, $b$ ve $c$ pozitif tam sayılar olmak üzere
$$\dfrac{a \cdot b + 3}{2} = c$$
eşitliğinde $c$ bir tek tam sayıdır.
Buna göre aşağıdakilerden hangisi her zaman bir çift sayıdır?

**Şıklar:**
A) $a \cdot b$
B) $a + 2b$
C) $a + b$
D) $a^b + 2$
E) $2a + b$

**Açıklama:**
Eşitlikten $a \cdot b + 3 = 2c$ yazılır. $c$ tam sayı olduğundan $2c$ kesinlikle çifttir. $3$ tek sayı olduğuna göre toplamın çift çıkması için $a \cdot b$ çarpımı mutlaka tek olmalıdır. İki tam sayının çarpımı tek ise her ikisi de tek sayıdır ($a$ tek, $b$ tek). İki tek sayının toplamı olan $a + b$ her zaman çifttir.

**Çeldirici Tuzağı:**
A şıkkı ($a \cdot b$), soruda verilen "$c$ tek sayıdır" bilgisini karıştırıp $a \cdot b$'nin de çift olacağını sanan adayı yakalar. Oysa $2c$ daima çift olduğu için $a \cdot b + 3$ çifttir.

### mat-01-016
- zorluk: 2
- dogru: E
- dogrulama: (156 / 6) - 5

**Soru:**
Ardışık altı tek tam sayının toplamı $156$'dır.
Buna göre bu sayıların en küçüğü kaçtır?

**Şıklar:**
A) 17
B) 19
C) 23
D) 25
E) 21

**Açıklama:**
Ardışık $6$ tek tam sayının aritmetik ortalaması $\dfrac{156}{6} = 26$'dır. Terim sayısı çift olduğu için bu ortalama, ortadaki iki tek sayının ($25$ ve $27$) tam ortasıdır. Buna göre sayılar $21, 23, 25, 27, 29, 31$ olur ve en küçük sayı $21$ bulunur.

**Çeldirici Tuzağı:**
D şıkkı (25), ortadaki sayılardan küçüğü olan $25$'i en küçük sayı sanan adayı; B şıkkı (19) ise $26$'dan geriye yanlış adımda gidenleri yakalar.

### mat-01-017
- zorluk: 2
- dogru: B
- dogrulama: ((11 + 75) / 2) * ((75 - 11) / 4 + 1)

**Soru:**
$$11 + 15 + 19 + \cdots + 75$$
toplamının sonucu kaçtır?

**Şıklar:**
A) 688
B) 731
C) 748
D) 774
E) 817

**Açıklama:**
Terimler $4$'er artmaktadır. Önce terim sayısı bulunur: $\dfrac{75 - 11}{4} + 1 = \dfrac{64}{4} + 1 = 16 + 1 = 17$ terim. Ardından terimler toplamı hesaplanır: $\dfrac{11 + 75}{2} \cdot 17 = 43 \cdot 17 = 731$ bulunur.

**Çeldirici Tuzağı:**
A şıkkı (688), terim sayısını hesaplarken sondaki $+1$'i ekleyip $17$ bulmak yerine $\dfrac{75 - 11}{4} = 16$ alıp $43 \cdot 16 = 688$ hesaplayan adayı yakalar.

### mat-01-018
- zorluk: 2
- dogru: A
- dogrulama: ((36 / gcd(36, 60)) + 3) / 2 + ((60 / gcd(36, 60)) - 4)

**Soru:**
$(2x - 3)$ ve $(y + 4)$ aralarında asal pozitif tam sayılar olmak üzere
$$\dfrac{2x - 3}{y + 4} = \dfrac{36}{60}$$
eşitliği verilmektedir.
Buna göre $x + y$ toplamı kaçtır?

**Şıklar:**
A) 4
B) 5
C) 8
D) 24
E) 76

**Açıklama:**
$(2x - 3)$ ve $(y + 4)$ aralarında asal olduğundan eşitliğin sağ tarafındaki kesir en sade hâle getirilir: $\dfrac{36}{60} = \dfrac{3}{5}$ ($\text{EBOB}(3, 5) = 1$). Aralarında asal iki orantıda pay paya, payda paydaya eşitlenir: $2x - 3 = 3 \Rightarrow x = 3$ ve $y + 4 = 5 \Rightarrow y = 1$. Toplam $x + y = 3 + 1 = 4$ bulunur.

**Çeldirici Tuzağı:**
E şıkkı (76), kesri sadeleştirmeden doğrudan $2x - 3 = 36$ veya $y + 4 = 60$ almaya çalışan ya da $x$ ve $y$'nin tam sayı olması için mutlaka en sade hâle gelmesi gerektiğini unutan adayı yakalar.

### mat-01-019
- zorluk: 1
- dogru: E
- dogrulama: fact(((-3 + sqrt(9 + 4 * (56 - 2))) / 2) - 1)

**Soru:**
$n$ bir doğal sayı olmak üzere
$$\dfrac{(n + 2)!}{n!} = 56$$
eşitliği sağlanmaktadır.
Buna göre $(n - 1)!$ değeri kaçtır?

**Şıklar:**
A) 6
B) 24
C) 60
D) 720
E) 120

**Açıklama:**
Paydaki faktöriyel paydaya kadar açılır: $\dfrac{(n + 2)(n + 1) \cdot n!}{n!} = 56 \Rightarrow (n + 2)(n + 1) = 56$. Ardışık iki sayının çarpımı $8 \cdot 7 = 56$ olduğundan $n + 1 = 7 \Rightarrow n = 6$ bulunur. İstenen değer $(6 - 1)! = 5! = 120$'dir.

**Çeldirici Tuzağı:**
D şıkkı (720), $n = 6$ bulduktan sonra $(n - 1)! = 5!$ yerine $n! = 6! = 720$ hesaplayan adayı yakalar.

### mat-01-020
- zorluk: 2
- dogru: C
- dogrulama: 9 - (45 / 9)

**Soru:**
$A$ ve $B$ sıfırdan farklı rakamlar olmak üzere iki basamaklı $AB$ sayısının rakamları yer değiştirildiğinde elde edilen iki basamaklı $BA$ sayısı, $AB$ sayısından $45$ fazladır.
Bu koşulu sağlayan kaç farklı $AB$ sayısı vardır?

**Şıklar:**
A) 2
B) 3
C) 4
D) 5
E) 8

**Açıklama:**
$BA - AB = 45$ eşitliği basamak çözümlemesiyle açılır: $(10B + A) - (10A + B) = 45 \Rightarrow 9(B - A) = 45 \Rightarrow B - A = 5$. Sıfırdan farklı rakamlar için $(A, B)$ ikilileri $(1, 6)$, $(2, 7)$, $(3, 8)$ ve $(4, 9)$ olabilir. Dolayısıyla $16, 27, 38, 49$ olmak üzere $4$ farklı sayı vardır.

**Çeldirici Tuzağı:**
D şıkkı (5), "sıfırdan farklı" şartını unutup $(0, 5)$ ikilisini ($05$) de geçerli sayan adayı yakalar.

### mat-01-021
- zorluk: 2
- dogru: D
- dogrulama: 2 * 100 - 3 * 10 + 4

**Soru:**
Üç basamaklı bir $ABC$ doğal sayısının yüzler basamağındaki rakam $2$ artırılır, onlar basamağındaki rakam $3$ azaltılır ve birler basamağındaki rakam $4$ artırılırsa sayının değeri kaç artar?

**Şıklar:**
A) 134
B) 166
C) 170
D) 174
E) 234

**Açıklama:**
Basamak değerlerindeki değişimler toplanır: yüzler basamağı $+2 \cdot 100 = +200$, onlar basamağı $-3 \cdot 10 = -30$ ve birler basamağı $+4 \cdot 1 = +4$ değişir. Net değişim $200 - 30 + 4 = 174$ artış olur.

**Çeldirici Tuzağı:**
E şıkkı (234), onlar basamağındaki $3$ azalmayı çıkarmak yerine ekleyen ($200 + 30 + 4 = 234$) adayı yakalar.

### mat-01-022
- zorluk: 1
- dogru: B
- dogrulama: 594 / 99

**Soru:**
Rakamları sıfırdan ve birbirinden farklı üç basamaklı bir doğal sayının rakamlarının yerleri değiştirilerek yazılabilen **en büyük** sayı ile **en küçük** sayı arasındaki fark $594$'tür.
Buna göre bu sayının en büyük rakamı ile en küçük rakamı arasındaki fark kaçtır?

**Şıklar:**
A) 5
B) 6
C) 7
D) 8
E) 9

**Açıklama:**
Rakamları büyükten küçüğe $x > y > z > 0$ olsun. Bu rakamlarla yazılabilecek en büyük üç basamaklı sayı $xyz$, en küçük üç basamaklı sayı ise $zyx$'tir. Basamak çözümlemesi yapılırsa:
$$xyz - zyx = 99(x - z) = 594 \Rightarrow x - z = 6$$
En büyük rakam $x$ ile en küçük rakam $z$ arasındaki fark $6$ bulunur.

**Çeldirici Tuzağı:**
A şıkkı ($5$) veya C şıkkı ($7$), $594 \div 99$ bölmesinde tahmini değer deneyen ya da ortadaki $y$ rakamının farkı etkilediğini sanan adayı yakalar.

### mat-01-023
- zorluk: 3
- dogru: C
- dogrulama: min(floor((floor(25 / 2) + floor(25 / 4) + floor(25 / 8) + floor(25 / 16)) / 2), floor(25 / 3) + floor(25 / 9))

**Soru:**
$x$ ve $y$ pozitif tam sayılar olmak üzere
$$25! = 12^x \cdot y$$
eşitliğinde $x$'in alabileceği en büyük değer kaçtır?

**Şıklar:**
A) 2
B) 8
C) 10
D) 11
E) 22

**Açıklama:**
$12 = 2^2 \cdot 3$ olduğundan $25!$ içindeki $2^2$ çiftlerinin sayısı ile $3$ çarpanlarının sayısından küçük olanı $x$'in en büyük değerini belirler.
$25!$ içindeki $3$ çarpanları: $\lfloor 25 \div 3 \rfloor + \lfloor 8 \div 3 \rfloor = 8 + 2 = 10$ adettir.
$25!$ içindeki $2$ çarpanları: $\lfloor 25 \div 2 \rfloor + \lfloor 12 \div 2 \rfloor + \lfloor 6 \div 2 \rfloor + \lfloor 3 \div 2 \rfloor = 12 + 6 + 3 + 1 = 22$ adettir; bundan $\lfloor 22 \div 2 \rfloor = 11$ tane $2^2$ oluşur.
$11$ tane $2^2$ ve $10$ tane $3$ ile en fazla $10$ tane $12$ oluşturulabilir; dolayısıyla $x = 10$ bulunur.

**Çeldirici Tuzağı:**
D şıkkı (11), $2^2$ sayısını hesaplayıp $3$ çarpanlarını kontrol etmeden $11$'i seçen; B şıkkı (8) ise $\lfloor 25 \div 9 \rfloor$'u eklemeyi unutan adayı yakalar.

### mat-01-024
- zorluk: 2
- dogru: B
- dogrulama: (4 - 2) * ((61 - 4) / 3 + 1)

**Soru:**
$$A = 4 + 7 + 10 + \cdots + 61$$
$$B = 2 + 5 + 8 + \cdots + 59$$
olduğuna göre $A - B$ farkı kaçtır?

**Şıklar:**
A) 38
B) 40
C) 42
D) 58
E) 60

**Açıklama:**
Her iki toplamdaki terim sayısı $\dfrac{61 - 4}{3} + 1 = 19 + 1 = 20$'dir. İki dizi terim terime çıkarıldığında her terim çiftinin farkı sabittir: $(4 - 2) + (7 - 5) + \cdots + (61 - 59) = 2 + 2 + \cdots + 2$ ($20$ kez). Buna göre $A - B = 20 \cdot 2 = 40$ bulunur.

**Çeldirici Tuzağı:**
A şıkkı (38), terim sayısını $20$ yerine $19$ bularak $19 \cdot 2 = 38$ işaretleyen adayı yakalar.

### mat-01-025
- zorluk: 3
- dogru: E
- dogrulama: (270 / (2 + 4)) * 24

**Soru:**
Bir öğrenci iki basamaklı bir $AB$ sayısını $24$ ile çarparken ikinci satırı bir basamak sola kaydırmak yerine, yanlışlıkla birinci satırla aynı hizaya yazarak alt alta toplamış ve sonucu $270$ bulmuştur.
Buna göre bu çarpma işleminin doğru sonucu kaçtır?

**Şıklar:**
A) 45
B) 540
C) 900
D) 1.008
E) 1.080

**Açıklama:**
Doğru işlemde $4 \cdot AB$ ile $20 \cdot AB$ toplanırken, kaydırma yapılmadan alt alta hizalandığında $4 \cdot AB$ ile $2 \cdot AB$ toplanmış olur. Buna göre $4 \cdot AB + 2 \cdot AB = 6 \cdot AB = 270 \Rightarrow AB = \dfrac{270}{6} = 45$ bulunur. Doğru çarpma sonucu $45 \cdot 24 = 1.080$'dir.

**Çeldirici Tuzağı:**
A şıkkı (45), $AB$ sayısını bulup $24$ ile çarpmayı unutan adayı yakalar. D şıkkı (1.008) ise kaydırma hatasında $AB = 42$ gibi işlem hatası yapanların seçtiği şıktır.

### mat-01-026
- zorluk: 3
- dogru: A
- dogrulama: (6 * 100 + 2 * 10 + 9) - (2 * 100 + 6 * 10 + 3)

**Soru:**
$x$, $y$ ve $z$ sıfırdan farklı birer rakam olmak üzere
$$x \cdot y = 12 \quad \text{ve} \quad y \cdot z = 18$$
eşitlikleri verilmektedir.
Buna göre üç basamaklı $xyz$ doğal sayısının alabileceği en büyük değer ile en küçük değerin farkı kaçtır?

**Şıklar:**
A) 366
B) 193
C) 283
D) 386
E) 466

**Açıklama:**
$y$ hem $12$'nin hem $18$'in ortak böleni olan bir rakamdır: $y \in \{1, 2, 3, 6\}$.
$y = 1$ için $x = 12$ (rakam değildir, elenir).
$y = 2$ için $x = 6, z = 9 \Rightarrow xyz = 629$.
$y = 3$ için $x = 4, z = 6 \Rightarrow xyz = 436$.
$y = 6$ için $x = 2, z = 3 \Rightarrow xyz = 263$.
En büyük değer $629$, en küçük değer $263$ olduğundan fark $629 - 263 = 366$ bulunur.

**Çeldirici Tuzağı:**
B şıkkı (193), yalnızca $629 - 436$ farkını alan veya $y = 6$ durumunu gözden kaçıran adayı yakalar.

### mat-01-027
- zorluk: 1
- dogru: B
- dogrulama: yok

**Soru:**
$a$, $b$ ve $c$ gerçel sayıları için $a < b < 0 < c$ sıralaması verilmektedir.
Buna göre aşağıdakilerden hangisi **kesinlikle pozitiftir**?

**Şıklar:**
A) $a + b$
B) $(b - a) \cdot c$
C) $a \cdot c$
D) $a + c$
E) $b - c$

**Açıklama:**
$a < b$ olduğundan büyük sayıdan küçük sayı çıkarıldığında $b - a > 0$ pozitiftir. $c > 0$ da pozitif olduğundan iki pozitif sayının çarpımı olan $(b - a) \cdot c > 0$ her zaman pozitiftir. Diğer şıklarda $a + b < 0$, $a \cdot c < 0$, $b - c < 0$ negatiftir; $a + c$ ise değerlere göre işaret değiştirebilir.

**Çeldirici Tuzağı:**
D şıkkı ($a + c$), $c$'nin pozitif olmasından dolayı toplamın da pozitif olacağını sanan adayı yakalar; oysa $a = -5$ ve $c = 1$ seçilirse $a + c = -4 < 0$ olur.

### mat-01-028
- zorluk: 1
- dogru: C
- dogrulama: yok

**Soru:**
$m$ ve $n$ birer tam sayı olmak üzere
$$m \cdot (n + 2) = 15$$
eşitliği sağlanmaktadır.
Buna göre,
I. $m$ tek sayıdır.
II. $n$ tek sayıdır.
III. $m + n$ tek sayıdır.
ifadelerinden hangileri **her zaman** doğrudur?

**Şıklar:**
A) Yalnız I
B) Yalnız II
C) I ve II
D) I ve III
E) I, II ve III

**Açıklama:**
İki tam sayının çarpımı tek sayı ($15$) olduğuna göre her iki çarpan da mutlaka tek tam sayıdır. Dolayısıyla $m$ tek sayıdır (I doğru) ve $n + 2$ de tek sayıdır. $2$ çift sayı olduğu için $n + 2$'nin tek kalabilmesi adına $n$ kesinlikle tek sayı olmalıdır (II doğru). İki tek sayının toplamı çift olacağından $m + n$ tek değil çifttir (III yanlış).

**Çeldirici Tuzağı:**
D şıkkı (I ve III), $n + 2$'nin tek olmasından $n$'nin çift olması gerektiğini zanneden adayı yakalar. Oysa bir tam sayıya çift sayı ($2$) eklendiğinde sayının tekliği veya çiftliği değişmez.

### mat-01-029
- zorluk: 2
- dogru: A
- dogrulama: yok

**Soru:**
$x$, $y$ ve $z$ tam sayılar olmak üzere
$$x(y + 1) + 2z = 11$$
eşitliği sağlanmaktadır.
Buna göre aşağıdakilerden hangisi **kesinlikle çifttir**?

**Şıklar:**
A) $x \cdot y$
B) $x + y$
C) $x + 2y$
D) $y + 3$
E) $x^2 + y$

**Açıklama:**
$z$ tam sayı olduğu için $2z$ daima çifttir. Eşitliğin sağ tarafı $11$ tek sayı olduğundan $x(y + 1)$ çarpımı mutlaka tek olmalıdır. İki tam sayının çarpımı tek ise ikisi de tektir: $x$ tek ve $y + 1$ tek $\Rightarrow y$ çifttir. $y$ çift olduğundan $x \cdot y$ çarpımı kesinlikle çifttir; diğer şıkların hepsi ($x + y$, $x + 2y$, $y + 3$, $x^2 + y$) kesinlikle tektir.

**Çeldirici Tuzağı:**
B şıkkı ($x + y$) veya D şıkkı ($y + 3$), $y + 1$ tek olduğu için $y$'nin de tek olduğunu sanarak işaret hatası yapan adayı yakalar.

### mat-01-030
- zorluk: 2
- dogru: C
- dogrulama: 2 * (91 / 7)

**Soru:**
Ardışık $7$ tam sayının toplamı $91$'dir.
Buna göre bu sayıların en küçüğü ile en büyüğünün toplamı kaçtır?

**Şıklar:**
A) 13
B) 24
C) 26
D) 28
E) 32

**Açıklama:**
Ardışık $7$ tam sayının ortancası (ve aritmetik ortalaması) $\dfrac{91}{7} = 13$'tür. En küçük ve en büyük sayı ortancaya eşit uzaklıkta olduğundan ($10$ ve $16$) ikisinin toplamı ortancanın $2$ katıdır: $2 \cdot 13 = 26$ bulunur.

**Çeldirici Tuzağı:**
A şıkkı (13), ortanca sayıyı bulup en küçük ve en büyük terimlerin toplamını almayı unutan adayı yakalar.

### mat-01-031
- zorluk: 1
- dogru: E
- dogrulama: (fact(8) - 2 * fact(7)) / fact(6)

**Soru:**
$$\dfrac{8! - 2 \cdot 7!}{6!}$$
işleminin sonucu kaçtır?

**Şıklar:**
A) 7
B) 14
C) 36
D) 48
E) 42

**Açıklama:**
Pay kısmı $7!$ ortak çarpan parantezine alınır: $8! - 2 \cdot 7! = 7!(8 - 2) = 6 \cdot 7 \cdot 6!$. Paydadaki $6!$ ile sadeleştirilirse $6 \cdot 7 = 42$ bulunur.

**Çeldirici Tuzağı:**
D şıkkı (48) veya A şıkkı (7), $8! - 2 \cdot 7!$ ifadesini $6!$ parantezine alırken $8 \cdot 7$ çarpımını eksik hesaplayan ya da $8 - 2$ çıkarma adımını yanlış kuran adayı yakalar.

### mat-01-032
- zorluk: 2
- dogru: B
- dogrulama: 11 - 2

**Soru:**
$a$, $b$ ve $c$ asal sayılar olmak üzere $a < b < c$ ve $a + b + c = 20$ eşitliği verilmektedir.
Buna göre $c - a$ farkı **en az** kaç olabilir?

**Şıklar:**
A) 7
B) 9
C) 11
D) 13
E) 15

**Açıklama:**
Üç asal sayının toplamı $20$ (çift) olduğuna göre üçünün birden tek olması mümkün değildir (üç tek sayının toplamı tek olur). Dolayısıyla en küçük asal sayı olan $a$ mutlaka çift asal $2$ olmalıdır. Geriye $b + c = 18$ kalır ($2 < b < c$ asal). Bu koşulu sağlayan asal ikililer $(5, 13)$ ve $(7, 11)$'dir. $c - a$ farkının en küçük olması için $c = 11$ seçilir ve $11 - 2 = 9$ bulunur.

**Çeldirici Tuzağı:**
C şıkkı (11), $(5, 13)$ asal çiftinden $13 - 2 = 11$ değerini bulup daha yakın $(7, 11)$ asal çiftini denemeyi unutan adayı yakalar.

### mat-01-033
- zorluk: 2
- dogru: D
- dogrulama: ((18 + 90) / 2) * 9

**Soru:**
Rakamları toplamı $9$ olan tüm iki basamaklı doğal sayıların toplamı kaçtır?

**Şıklar:**
A) 396
B) 405
C) 450
D) 486
E) 495

**Açıklama:**
Rakamları toplamı $9$ olan iki basamaklı doğal sayılar küçükten büyüğe $18, 27, 36, 45, 54, 63, 72, 81, 90$ olmak üzere $9$ tanedir ($9$'ar artan bir dizi). Toplamları $\dfrac{18 + 90}{2} \cdot 9 = 54 \cdot 9 = 486$ bulunur.

**Çeldirici Tuzağı:**
A şıkkı (396), son terim olan $90$ sayısını ($9 + 0 = 9$) unutarak yalnızca $18$'den $81$'e kadar olan $8$ sayıyı toplayan adayı yakalar.

### mat-01-034
- zorluk: 2
- dogru: A
- dogrulama: 15 + 24

**Soru:**
Rakamları çarpımının $3$ katına eşit olan iki basamaklı doğal sayıların toplamı kaçtır?

**Şıklar:**
A) 39
B) 15
C) 24
D) 51
E) 63

**Açıklama:**
İki basamaklı sayı $AB$ olsun: $10A + B = 3 \cdot A \cdot B \Rightarrow B(3A - 1) = 10A$. $A \in \{1, 2, \ldots, 9\}$ rakamları denenir:
$A = 1$ için $2B = 10 \Rightarrow B = 5$ (sayı $15$).
$A = 2$ için $5B = 20 \Rightarrow B = 4$ (sayı $24$).
$A \ge 3$ için $3A - 1$ sayısı $10A$'yı tam bölmez (örneğin $A = 3$ için $30 \div 8$ ve $A = 7$ için $70 \div 20$ tam sayı değildir). Koşulu sağlayan sayılar $15$ ve $24$ olup toplamları $15 + 24 = 39$ bulunur.

**Çeldirici Tuzağı:**
B şıkkı (15) veya C şıkkı (24), iki çözümden yalnızca birini bulup diğer rakamları denemeyi bırakan adayı yakalar.

### mat-01-035
- zorluk: 1
- dogru: D
- dogrulama: (19 + 45) / 2

**Soru:**
Bir sokaktaki evler baştan sona doğru $1, 3, 5, \ldots$ biçiminde ardışık tek tam sayılarla numaralandırılmıştır.
Bu sokakta baştan $k.$ sıradaki evin numarası $19$, sondan $k.$ sıradaki evin numarası ise $45$ olduğuna göre sokakta toplam kaç ev vardır?

**Şıklar:**
A) 26
B) 28
C) 30
D) 32
E) 33

**Açıklama:**
Baştan $k.$ sıradaki tek sayı $2k - 1 = 19 \Rightarrow 2k = 20 \Rightarrow k = 10$ bulunur. Sondan $10.$ evin numarası $45$ olduğuna göre bu evden sonra $9$ ev daha vardır ve numaralar $2$'şer arttığı için son evin numarası $45 + 9 \cdot 2 = 63$ olur. $1$'den $63$'e kadar olan tek sayı adedi $\dfrac{63 - 1}{2} + 1 = 32$'dir. (Kısaca simetri nedeniyle $\dfrac{19 + 45}{2} = 32$ ev vardır.)

**Çeldirici Tuzağı:**
E şıkkı ($33$) veya C şıkkı ($30$), $k = 10$ bulduktan sonra sondan $10.$ sırayı $9$ yerine $10$ ev ekleyerek $65$ numarasını bulan ya da $+1$ sınır terimini hatalı sayan adayı yakalar.

### mat-01-036
- zorluk: 2
- dogru: D
- dogrulama: ((29 + 1) / 2) * ((29 - 1) / 2)

**Soru:**
$a$ ve $b$ pozitif tam sayılar olmak üzere
$$a^2 - b^2 = 29$$
eşitliği verilmektedir.
Buna göre $a \cdot b$ çarpımı kaçtır?

**Şıklar:**
A) 180
B) 196
C) 205
D) 210
E) 225

**Açıklama:**
İki kare farkı özdeşliğiyle $(a - b)(a + b) = 29$ yazılır. $29$ asal bir sayı ve $a, b$ pozitif tam sayılar olduğu için küçük çarpan $a - b = 1$, büyük çarpan $a + b = 29$ olmalıdır. İki denklem toplanırsa $2a = 30 \Rightarrow a = 15$ ve $b = 14$ bulunur. Çarpım $15 \cdot 14 = 210$'dur.

**Çeldirici Tuzağı:**
B şıkkı (196) veya E şıkkı (225), $a$ ve $b$'yi doğru bulduktan sonra çarpımları yerine karelerinden birini işaretleyen veya $a$ ile $b$'yi bulmada $1$ kayması yapan adayı yakalar.

### mat-01-037
- zorluk: 3
- dogru: E
- dogrulama: (fact(1) + fact(2) + fact(3)) % 12

**Soru:**
$$1! + 2! + 3! + 4! + \cdots + 30!$$
toplamının $12$ ile bölümünden kalan kaçtır?

**Şıklar:**
A) 1
B) 3
C) 6
D) 7
E) 9

**Açıklama:**
$4! = 24$ sayısı $12$'nin tam katı olduğundan $n \ge 4$ için tüm $n!$ terimleri $12$'ye tam bölünür (kalan $0$ olur). Bu nedenle toplamın $12$ ile bölümünden kalanı yalnızca ilk üç terim belirler: $1! + 2! + 3! = 1 + 2 + 6 = 9$. $9 < 12$ olduğu için kalan $9$ bulunur.

**Çeldirici Tuzağı:**
C şıkkı (6), $3! = 6$ değerinin $12$'ye bölünmediğini görüp yalnızca $3!$'i kalan sanan veya $1! + 2!$ terimlerini toplama katmayan adayı yakalar.

### mat-01-038
- zorluk: 3
- dogru: B
- dogrulama: ((18 - 6 + 396 / 99) / 2) * ((18 - 6 - 396 / 99) / 2)

**Soru:**
Üç basamaklı $ABC$ doğal sayısından $CBA$ doğal sayısı çıkarıldığında $396$ elde edilmektedir.
$A + B + C = 18$ ve $B = 6$ olduğuna göre $A \cdot C$ çarpımı kaçtır?

**Şıklar:**
A) 24
B) 32
C) 36
D) 40
E) 48

**Açıklama:**
Basamak çözümlemesi yapılırsa $ABC - CBA = (100A + 10B + C) - (100C + 10B + A) = 99(A - C) = 396 \Rightarrow A - C = 4$ bulunur. Diğer yandan $A + 6 + C = 18 \Rightarrow A + C = 12$ elde edilir. $A + C = 12$ ve $A - C = 4$ denklemlerinden $A = 8$, $C = 4$ olur; çarpımları $8 \cdot 4 = 32$'dir.

**Çeldirici Tuzağı:**
C şıkkı (36), $A + C = 12$ eşitliğinde $A - C = 4$'ü gözden kaçırıp $6 \cdot 6$ veya hatalı bölme sonucu $9 \cdot 4 = 36$ bulan adayı yakalar.

### mat-01-039
- zorluk: 2
- dogru: C
- dogrulama: floor(19 / 2) * ceil(19 / 2)

**Soru:**
Toplamları $19$ olan aralarında asal iki pozitif tam sayının çarpımı **en çok** kaç olabilir?

**Şıklar:**
A) 84
B) 88
C) 90
D) 91
E) 96

**Açıklama:**
Toplamları sabit iki sayının çarpımı birbirine en yakın seçildiğinde en büyük değerini alır: $19 = 9 + 10$. Ardışık iki pozitif tam sayı ($9$ ve $10$) her zaman aralarında asaldır ($\text{EBOB}(9, 10) = 1$). Bu nedenle en büyük çarpım $9 \cdot 10 = 90$ bulunur.

**Çeldirici Tuzağı:**
B şıkkı (88), çift sayı olan $10$'un aralarında asallığı bozacağını sanıp tek-çift yerine $8 + 11$ (veya tek asal $7 + 12 = 84$) ikilisini seçen adayı yakalar.

### mat-01-040
- zorluk: 3
- dogru: D
- dogrulama: (35 - 3) / 2

**Soru:**
Her $n$ pozitif tam sayısı için $1$'den $n$'ye kadar olan tam sayıların toplamı $T_n$ ile gösterilmektedir.
$$T_{n + 2} - T_n = 35$$
eşitliğini sağlayan $n$ değeri kaçtır?

**Şıklar:**
A) 14
B) 15
C) 17
D) 16
E) 18

**Açıklama:**
$T_{n + 2} = 1 + 2 + \cdots + n + (n + 1) + (n + 2)$ olduğundan $T_n$ çıkarıldığında geriye yalnızca son iki terim kalır: $T_{n + 2} - T_n = (n + 1) + (n + 2) = 2n + 3$. Verilen eşitlikten $2n + 3 = 35 \Rightarrow 2n = 32 \Rightarrow n = 16$ bulunur.

**Çeldirici Tuzağı:**
C şıkkı (17), $T_{n + 2} - T_n$ farkını son iki terim yerine $n + (n + 1) = 35 \Rightarrow n = 17$ ya da tek terim $n + 2$ sanıp yanlış denklem kuran adayı yakalar.
