---
ders: Matematik & Geometri
konu: Çarpanlara Ayırma ve Oran-Orantı
kod: mat
kapsam: [lisans_gygk, b_grubu_gygk]
---

### mat-06-001
- zorluk: 1
- dogru: C
- dogrulama: 5 * 4

**Soru:**
$x - y = 5$ ve $a + b = 4$ olduğuna göre
$$ax - ay + bx - by$$
ifadesinin değeri kaçtır?

**Şıklar:**
A) 9
B) 16
C) 20
D) 24
E) 25

**Açıklama:**
İfade ikişerli gruplandırılarak ortak çarpan parantezine alınır: $ax - ay + bx - by = a(x - y) + b(x - y) = (x - y)(a + b)$. Verilen değerler yerine yazılırsa $5 \cdot 4 = 20$ bulunur.

**Çeldirici Tuzağı:**
A şıkkı (9), çarpanlara ayırma sonucunda elde edilen iki çarpanı çarpmak yerine toplayan ($5 + 4 = 9$) adayı yakalar.

### mat-06-002
- zorluk: 1
- dogru: A
- dogrulama: (55^2 - 45^2) / (55^2 - 2 * 55 * 45 + 45^2)

**Soru:**
$$\dfrac{55^2 - 45^2}{55^2 - 2 \cdot 55 \cdot 45 + 45^2}$$
işleminin sonucu kaçtır?

**Şıklar:**
A) 10
B) 5
C) 2
D) 20
E) 100

**Açıklama:**
Payda iki kare farkı, paydada ise tam kare farkı özdeşliği vardır:
Pay: $55^2 - 45^2 = (55 - 45)(55 + 45) = 10 \cdot 100$.
Payda: $(55 - 45)^2 = 10^2$.
Bölme yapıldığında $\dfrac{10 \cdot 100}{10 \cdot 10} = \dfrac{100}{10} = 10$ bulunur.

**Çeldirici Tuzağı:**
E şıkkı (100), paydadaki $(55 - 45)^2$'nin karesini unutup yalnızca $55 - 45 = 10$ ile sadeleştirme yapan ($100$) adayı yakalar.

### mat-06-003
- zorluk: 2
- dogru: D
- dogrulama: 4^2 + 2

**Soru:**
$$x - \dfrac{1}{x} = 4$$
olduğuna göre $x^2 + \dfrac{1}{x^2}$ ifadesinin değeri kaçtır?

**Şıklar:**
A) 12
B) 14
C) 16
D) 18
E) 20

**Açıklama:**
Verilen eşitliğin her iki tarafının karesi alınır: $\left(x - \dfrac{1}{x}\right)^2 = 4^2 \Rightarrow x^2 - 2 \cdot x \cdot \dfrac{1}{x} + \dfrac{1}{x^2} = 16$. Ortadaki $x$'ler sadeleşince $x^2 - 2 + \dfrac{1}{x^2} = 16 \Rightarrow x^2 + \dfrac{1}{x^2} = 16 + 2 = 18$ bulunur.

**Çeldirici Tuzağı:**
B şıkkı (14), $x^2 - 2 + \frac{1}{x^2} = 16$ denkleminden $-2$'yi karşıya $+2$ yerine $-2$ olarak geçirip $16 - 2 = 14$ bulan adayı yakalar. C şıkkı (16) ise açılımdaki ortanca $-2$ terimini tamamen unutanların tuzağıdır.

### mat-06-004
- zorluk: 2
- dogru: B
- dogrulama: (9^2 - 53) / 2

**Soru:**
$a + b = 9$ ve $a^2 + b^2 = 53$ olduğuna göre $a \cdot b$ çarpımı kaçtır?

**Şıklar:**
A) 12
B) 14
C) 16
D) 24
E) 28

**Açıklama:**
Tam kare toplamı özdeşliği yazılır: $(a + b)^2 = a^2 + 2ab + b^2$. Verilenler yerine konursa $9^2 = 53 + 2ab \Rightarrow 81 - 53 = 2ab \Rightarrow 28 = 2ab \Rightarrow ab = 14$ bulunur.

**Çeldirici Tuzağı:**
E şıkkı (28), $81 - 53 = 28$ farkını bulduktan sonra $2ab$'deki $2$'ye bölmeyi unutan adayı yakalar.

### mat-06-005
- zorluk: 2
- dogru: E
- dogrulama: yok

**Soru:**
$x \notin \{-2, -1, 3\}$ olmak üzere
$$\dfrac{x^2 - 9}{x^2 - 2x - 3} \cdot \dfrac{x + 1}{x + 2}$$
ifadesinin en sade biçimi aşağıdakilerden hangisidir?

**Şıklar:**
A) $1$
B) $\dfrac{x - 3}{x + 2}$
C) $\dfrac{x + 3}{x - 3}$
D) $\dfrac{x - 1}{x + 2}$
E) $\dfrac{x + 3}{x + 2}$

**Açıklama:**
Paydaki ifade iki kare farkıyla $x^2 - 9 = (x - 3)(x + 3)$ şeklinde, paydadaki ifade ise çarpımları $-3$ ve toplamları $-2$ olan sayılarla $x^2 - 2x - 3 = (x - 3)(x + 1)$ şeklinde çarpanlarına ayrılır. Çarpım yazılırsa $\dfrac{(x - 3)(x + 3)}{(x - 3)(x + 1)} \cdot \dfrac{x + 1}{x + 2}$ olur; $(x - 3)$ ve $(x + 1)$ çarpanları sadeleşince sonuç $\dfrac{x + 3}{x + 2}$ bulunur.

**Çeldirici Tuzağı:**
B şıkkı ($\frac{x - 3}{x + 2}$), $x^2 - 2x - 3$ ifadesini $(x + 3)(x - 1)$ şeklinde yanlış çarpanlara ayırıp $(x + 3)$'leri sadeleştiren adayı yakalar. Kök çarpımı ve toplamının işaretleri dikkatle kontrol edilmelidir.

### mat-06-006
- zorluk: 3
- dogru: D
- dogrulama: 30 - (6/2)^2 - (8/2)^2

**Soru:**
$x$ ve $y$ gerçel sayıları için
$$x^2 + y^2 - 6x + 8y + 30$$
ifadesinin alabileceği en küçük değer kaçtır?

**Şıklar:**
A) 1
B) 3
C) 4
D) 5
E) 21

**Açıklama:**
$x$ ve $y$ terimleri tam kareye tamamlanır:
$x^2 - 6x = (x - 3)^2 - 9$ ve
$y^2 + 8y = (y + 4)^2 - 16$.
İfade yeniden yazılırsa $(x - 3)^2 + (y + 4)^2 - 9 - 16 + 30 = (x - 3)^2 + (y + 4)^2 + 5$ olur. Gerçel sayıların kareleri en az $0$ olabildiğinden ($x = 3$ ve $y = -4$ için) toplamın en küçük değeri $0 + 0 + 5 = 5$ bulunur.

**Çeldirici Tuzağı:**
E şıkkı (21), yalnızca $x$ terimini tam kareye tamamlayıp $y^2 + 8y$ için gereken $-16$ düzeltmesini unutan ($30 - 9 = 21$) adayı yakalar.

### mat-06-007
- zorluk: 1
- dogru: B
- dogrulama: (5 - 3) * (33 / (2 * 3 + 5))

**Soru:**
$\dfrac{a}{b} = \dfrac{3}{5}$ ve $2a + b = 33$ olduğuna göre $b - a$ farkı kaçtır?

**Şıklar:**
A) 3
B) 6
C) 9
D) 12
E) 15

**Açıklama:**
Orandan $a = 3k$ ve $b = 5k$ yazılıp denklemde yerine konur: $2(3k) + 5k = 33 \Rightarrow 11k = 33 \Rightarrow k = 3$. Buna göre $a = 9$ ve $b = 15$ olur; fark $b - a = 15 - 9 = 6$ bulunur.

**Çeldirici Tuzağı:**
A şıkkı (3), orantı sabiti $k = 3$'ü bulduktan sonra doğrudan $k$'yı işaretleyen adayı; C şıkkı (9) ise $a$'nın değerini seçenleri yakalar.

### mat-06-008
- zorluk: 1
- dogru: D
- dogrulama: (4 - 2) * (180 / (2 + 3 + 4))

**Soru:**
$180$ adet kalem üç kardeşe $2$, $3$ ve $4$ sayılarıyla doğru orantılı olacak biçimde paylaştırılıyor.
Buna göre en fazla kalem alan kardeş, en az kalem alan kardeşten kaç kalem fazla almıştır?

**Şıklar:**
A) 20
B) 30
C) 36
D) 40
E) 60

**Açıklama:**
Kardeşlerin aldığı kalem sayıları sırasıyla $2k$, $3k$ ve $4k$ olsun. Toplam $2k + 3k + 4k = 9k = 180 \Rightarrow k = 20$ bulunur. En fazla alan $4 \cdot 20 = 80$, en az alan $2 \cdot 20 = 40$ kalem alır; fark $80 - 40 = 40$ kalemdir.

**Çeldirici Tuzağı:**
A şıkkı (20), orantı sabiti $k = 20$'yi veya ardışık iki kardeş arasındaki farkı ($3k - 2k = 20$) işaretleyen adayı yakalar. Soru en büyük ile en küçük pay arasındaki farkı sormaktadır.

### mat-06-009
- zorluk: 2
- dogru: B
- dogrulama: (12 / 4) * (260 / (12 / 2 + 12 / 3 + 12 / 4))

**Soru:**
$260$ TL üç kişiye sırasıyla $2$, $3$ ve $4$ sayılarıyla ters orantılı olarak paylaştırılıyor.
Buna göre en az para alan kişi kaç TL almıştır?

**Şıklar:**
A) 40
B) 60
C) 80
D) 100
E) 120

**Açıklama:**
Ters orantılı paylar $\dfrac{k}{2}$, $\dfrac{k}{3}$ ve $\dfrac{k}{4}$ olur. Paydaların ortak katı $12$ üzerinden paylar $6m$, $4m$ ve $3m$ şeklinde yazılabilir. Toplam $6m + 4m + 3m = 13m = 260 \Rightarrow m = 20$ bulunur. En az para alan kişi $4$ ile ters orantılı olan paydır: $3 \cdot 20 = 60$ TL alır.

**Çeldirici Tuzağı:**
E şıkkı (120), en az yerine en fazla para alan kişinin payını ($6m = 120$) işaretleyen adayı yakalar. Ayrıca ters orantıda büyük sayıyla orantılı payın en küçük olacağına dikkat edilmelidir.

### mat-06-010
- zorluk: 2
- dogru: A
- dogrulama: (6 * 8 * 15) / ((6 + 4) * 6)

**Soru:**
Eşit kapasitedeki $6$ işçi günde $8$ saat çalışarak bir işi $15$ günde bitirebilmektedir.
İşçi sayısı $4$ artırılır ve günlük çalışma süresi $6$ saate düşürülürse aynı iş kaç günde biter?

**Şıklar:**
A) 12
B) 15
C) 18
D) 24
E) 30

**Açıklama:**
Yapılan aynı iş için toplam çalışma saati sabittir: $\text{İşçi} \cdot \text{Saat/gün} \cdot \text{Gün} = 6 \cdot 8 \cdot 15 = 720$ işçi-saat. İşçi sayısı $4$ artırıldığında $6 + 4 = 10$ işçi olur. Yeni günlük çalışma süresi $6$ saat ve gereken gün sayısı $g$ olursa $10 \cdot 6 \cdot g = 720 \Rightarrow 60g = 720 \Rightarrow g = 12$ gün bulunur.

**Çeldirici Tuzağı:**
E şıkkı (30), "işçi sayısı 4 artırılır" ifadesini "işçi sayısı 4'e düşürülür" gibi okuyup $4 \cdot 6 \cdot g = 720 \Rightarrow g = 30$ hesaplayan adayı yakalar.

### mat-06-011
- zorluk: 2
- dogru: C
- dogrulama: (2 * 10)^2 - 2 * (6^2)

**Soru:**
$a$ ve $b$ pozitif gerçel sayılarının aritmetik ortalaması $10$, geometrik ortalaması $6$'dır.
Buna göre $a^2 + b^2$ toplamı kaçtır?

**Şıklar:**
A) 28
B) 64
C) 328
D) 388
E) 400

**Açıklama:**
Aritmetik ortalama $\dfrac{a + b}{2} = 10 \Rightarrow a + b = 20$'dir. Geometrik ortalama $\sqrt{a \cdot b} = 6 \Rightarrow a \cdot b = 36$'dır. Tam kare özdeşliğinden $a^2 + b^2 = (a + b)^2 - 2ab = 20^2 - 2 \cdot 36 = 400 - 72 = 328$ bulunur.

**Çeldirici Tuzağı:**
D şıkkı (388), geometrik ortalamanın $6$ olmasından $a \cdot b$'yi $6^2 = 36$ yerine doğrudan $6$ alıp $400 - 2 \cdot 6 = 388$ bulan adayı yakalar. A şıkkı (28) ise $a + b$ toplamını $20$ yerine $10$ alanların tuzağıdır.

### mat-06-012
- zorluk: 3
- dogru: E
- dogrulama: (2 + 3 + 5) * sqrt(152 / (2^2 + 3^2 + 5^2))

**Soru:**
$a$, $b$ ve $c$ pozitif gerçel sayılar olmak üzere
$$\dfrac{a}{2} = \dfrac{b}{3} = \dfrac{c}{5} \quad \text{ve} \quad a^2 + b^2 + c^2 = 152$$
eşitlikleri veriliyor.
Buna göre $a + b + c$ toplamı kaçtır?

**Şıklar:**
A) 10
B) 12
C) 15
D) 40
E) 20

**Açıklama:**
Orantı sabitine $k$ ($k > 0$) denirse $a = 2k$, $b = 3k$ ve $c = 5k$ olur. Kareler toplamında yerine yazılırsa $(2k)^2 + (3k)^2 + (5k)^2 = 152 \Rightarrow 4k^2 + 9k^2 + 25k^2 = 152 \Rightarrow 38k^2 = 152 \Rightarrow k^2 = 4$ elde edilir. Sayılar pozitif olduğundan $k = 2$ bulunur. Toplam $a + b + c = 2k + 3k + 5k = 10k = 20$'dir.

**Çeldirici Tuzağı:**
D şıkkı (40), $38k^2 = 152$ denkleminde $k$'nın karesini unutarak $38k = 152 \Rightarrow k = 4$ alıp $10 \cdot 4 = 40$ bulan adayı yakalar.

### mat-06-013
- zorluk: 1
- dogru: B
- dogrulama: sqrt(98 * 102 + 4)

**Soru:**
$$\sqrt{98 \cdot 102 + 4}$$
işleminin sonucu kaçtır?

**Şıklar:**
A) 98
B) 100
C) 102
D) 104
E) 200

**Açıklama:**
$98$ ve $102$ sayıları $100$'e eşit uzaklıkta olduğundan $98 = 100 - 2$ ve $102 = 100 + 2$ yazılır. İki kare farkı özdeşliğiyle $\sqrt{(100 - 2)(100 + 2) + 4} = \sqrt{100^2 - 4 + 4} = \sqrt{100^2} = 100$ bulunur.

**Çeldirici Tuzağı:**
C şıkkı (102) veya D şıkkı (104), $98 \cdot 102$ çarpımını $100^2$'ye eşitlemeyip $+4$'ü kök dışına $2$ olarak çıkarmaya çalışan adayı yakalar.

### mat-06-014
- zorluk: 1
- dogru: C
- dogrulama: (5 + 2) / (5 - 2)

**Soru:**
$x \neq y$ olmak üzere
$$\dfrac{x + 2y}{x - y} = 3$$
eşitliği sağlanmaktadır. Buna göre $\dfrac{x^2 - y^2}{(x - y)^2}$ ifadesinin değeri kaçtır?

**Şıklar:**
A) $\dfrac{3}{7}$
B) $\dfrac{5}{3}$
C) $\dfrac{7}{3}$
D) $\dfrac{9}{4}$
E) $3$

**Açıklama:**
İçler dışlar çarpımıyla $x$ ile $y$ arasındaki oran bulunur: $x + 2y = 3x - 3y \Rightarrow 2x = 5y$. Buradan $x = 5k$ ve $y = 2k$ ($k \neq 0$) yazılabilir. İstenen ifade iki kare farkıyla sadeleştirilip yerine konursa:
$$\dfrac{x^2 - y^2}{(x - y)^2} = \dfrac{(x - y)(x + y)}{(x - y)^2} = \dfrac{x + y}{x - y} = \dfrac{5k + 2k}{5k - 2k} = \dfrac{7}{3}$$
elde edilir.

**Çeldirici Tuzağı:**
A şıkkı ($\frac{3}{7}$), sadeleştirme ya da yerine koyma sırasında $x = 5k, y = 2k$ yerine yanlışlıkla $x = 2k, y = 5k$ seçip pay ve paydanın yerini ters çeviren adayı yakalar.

### mat-06-015
- zorluk: 2
- dogru: C
- dogrulama: 5^2 - 2

**Soru:**
$$x^2 - 5x + 1 = 0$$
denklemini sağlayan $x$ sayısı için $x^2 + \dfrac{1}{x^2}$ ifadesinin değeri kaçtır?

**Şıklar:**
A) 19
B) 21
C) 23
D) 25
E) 27

**Açıklama:**
$x = 0$ denklemi sağlamadığından ($1 \neq 0$) denklemin her terimi $x$'e bölünebilir: $x - 5 + \dfrac{1}{x} = 0 \Rightarrow x + \dfrac{1}{x} = 5$. Her iki tarafın karesi alınırsa $x^2 + 2 + \dfrac{1}{x^2} = 25 \Rightarrow x^2 + \dfrac{1}{x^2} = 23$ bulunur.

**Çeldirici Tuzağı:**
E şıkkı (27), $x + \frac{1}{x} = 5$ eşitliğinin karesini alırken ortadaki $+2$ terimini karşıya $-2$ yerine $+2$ geçiren ($25 + 2 = 27$) adayı yakalar.

### mat-06-016
- zorluk: 2
- dogru: A
- dogrulama: 3^3 + 3 * 4 * 3

**Soru:**
$a - b = 3$ ve $a \cdot b = 4$ olduğuna göre $a^3 - b^3$ ifadesinin değeri kaçtır?

**Şıklar:**
A) 63
B) 27
C) 36
D) 51
E) 75

**Açıklama:**
Küp farkı özdeşliği kullanılır: $a^3 - b^3 = (a - b)^3 + 3ab(a - b)$. Verilen değerler yerine konursa $3^3 + 3 \cdot 4 \cdot 3 = 27 + 36 = 63$ bulunur.

**Çeldirici Tuzağı:**
B şıkkı (27), yalnızca $(a - b)^3 = 27$ terimini hesaplayıp $3ab(a - b)$ eklemesini unutan adayı yakalar.

### mat-06-017
- zorluk: 2
- dogru: E
- dogrulama: yok

**Soru:**
$a \neq 0$ ve $a \neq \pm b$ olmak üzere
$$\dfrac{a^2 - b^2}{a^2 + ab} \div \dfrac{a - b}{a^2}$$
ifadesinin en sade biçimi aşağıdakilerden hangisidir?

**Şıklar:**
A) $\dfrac{1}{a}$
B) $b$
C) $a - b$
D) $a + b$
E) $a$

**Açıklama:**
Pay ve payda çarpanlarına ayrılır ve ikinci kesir ters çevrilip çarpılır:
$\dfrac{(a - b)(a + b)}{a(a + b)} \cdot \dfrac{a^2}{a - b}$.
$(a + b)$ ve $(a - b)$ çarpanları sadeleşir, geriye $\dfrac{a^2}{a} = a$ kalır.

**Çeldirici Tuzağı:**
A şıkkı ($\frac{1}{a}$), bölme işleminde ikinci kesri ters çevirmeden doğrudan çarpmaya çalışıp $\frac{a}{a^2}$ sadeleştirmesine düşen adayı yakalar.

### mat-06-018
- zorluk: 3
- dogru: C
- dogrulama: -3 + 1 + (-4) + 2

**Soru:**
$$(x^2 + 2x)^2 - 11(x^2 + 2x) + 24 = 0$$
denklemini sağlayan farklı $x$ gerçel sayılarının toplamı kaçtır?

**Şıklar:**
A) $-2$
B) $0$
C) $-4$
D) $4$
E) $11$

**Açıklama:**
Değişken değiştirme yapılır: $x^2 + 2x = t$ denirse denklem $t^2 - 11t + 24 = 0 \Rightarrow (t - 3)(t - 8) = 0$ olur. Buradan $t = 3$ veya $t = 8$ bulunur.
1. durum: $x^2 + 2x = 3 \Rightarrow x^2 + 2x - 3 = 0 \Rightarrow (x + 3)(x - 1) = 0 \Rightarrow x_1 = -3, x_2 = 1$.
2. durum: $x^2 + 2x = 8 \Rightarrow x^2 + 2x - 8 = 0 \Rightarrow (x + 4)(x - 2) = 0 \Rightarrow x_3 = -4, x_4 = 2$.
Dört kök de birbirinden farklıdır ve toplamları $-3 + 1 + (-4) + 2 = -4$ bulunur.

**Çeldirici Tuzağı:**
E şıkkı (11), değişken değiştirmeyle bulduğu $t = 3$ ve $t = 8$ değerlerini $x$'in kökleri sanıp $3 + 8 = 11$ işaretleyen adayı yakalar.

### mat-06-019
- zorluk: 1
- dogru: D
- dogrulama: (6 - 3) * (26 / (6 + 4 + 3))

**Soru:**
$a$, $b$ ve $c$ gerçel sayıları için
$$2a = 3b = 4c \quad \text{ve} \quad a + b + c = 26$$
eşitlikleri verilmektedir.
Buna göre $a - c$ farkı kaçtır?

**Şıklar:**
A) 2
B) 3
C) 4
D) 6
E) 12

**Açıklama:**
$2$, $3$ ve $4$'ün ortak katı olan $12k$ değeri orantı sabiti seçilirse $2a = 3b = 4c = 12k \Rightarrow a = 6k$, $b = 4k$ ve $c = 3k$ olur. Toplamda yerine konursa $6k + 4k + 3k = 26 \Rightarrow 13k = 26 \Rightarrow k = 2$ bulunur. Fark $a - c = 6k - 3k = 3k = 3 \cdot 2 = 6$'dır.

**Çeldirici Tuzağı:**
A şıkkı (2), orantı sabiti $k = 2$'yi bulduktan sonra $3k$ yerine doğrudan $k$'yı işaretleyen; E şıkkı (12) ise $a = 12$ değerini seçen adayı yakalar.

### mat-06-020
- zorluk: 1
- dogru: E
- dogrulama: (3/4 + 2) * (4/3)

**Soru:**
$$\dfrac{a}{b} = \dfrac{c}{d} = \dfrac{3}{4}$$
olduğuna göre
$$\dfrac{a + 2b}{b} \cdot \dfrac{d}{c}$$
ifadesinin değeri kaçtır?

**Şıklar:**
A) $\dfrac{11}{4}$
B) $\dfrac{9}{4}$
C) $\dfrac{8}{3}$
D) $3$
E) $\dfrac{11}{3}$

**Açıklama:**
İlk kesir parçalanırsa $\dfrac{a}{b} + \dfrac{2b}{b} = \dfrac{3}{4} + 2 = \dfrac{11}{4}$ olur. İkinci kesir $\dfrac{c}{d} = \dfrac{3}{4}$'ün tersi olduğu için $\dfrac{d}{c} = \dfrac{4}{3}$'tür. Çarpım $\dfrac{11}{4} \cdot \dfrac{4}{3} = \dfrac{11}{3}$ bulunur.

**Çeldirici Tuzağı:**
A şıkkı ($\frac{11}{4}$), yalnızca ilk kesrin değerini hesaplayıp $\frac{d}{c} = \frac{4}{3}$ çarpanını unutan adayı yakalar.

### mat-06-021
- zorluk: 2
- dogru: B
- dogrulama: ((6 * 3 / 4) * 10) / 5

**Soru:**
$x$ sayısı $y$ ile doğru, $z$ ile ters orantılıdır.
$y = 4$ ve $z = 3$ iken $x = 6$ olduğuna göre $y = 10$ ve $z = 5$ iken $x$ kaçtır?

**Şıklar:**
A) 6
B) 9
C) 10
D) 12
E) 15

**Açıklama:**
Doğru orantılı çokluk bölme, ters orantılı çokluk çarpma ile yazılır: $\dfrac{x \cdot z}{y} = k$. İlk değerler yerine konursa $\dfrac{6 \cdot 3}{4} = \dfrac{18}{4} = \dfrac{9}{2}$ olur. İkinci durumda $\dfrac{x \cdot 5}{10} = \dfrac{9}{2} \Rightarrow \dfrac{x}{2} = \dfrac{9}{2} \Rightarrow x = 9$ bulunur.

**Çeldirici Tuzağı:**
E şıkkı (15), hem $y$ hem $z$'yi doğru orantılıymış gibi $\frac{x}{y \cdot z} = k$ şeklinde kuran veya $z$ ters orantısını ters çeviren adayı yakalar.

### mat-06-022
- zorluk: 2
- dogru: C
- dogrulama: (175 * 30 - 166 * 30) / (175 - 160)

**Soru:**
$30$ kişilik bir sınıfta kız öğrencilerin boy ortalaması $160$ cm, erkek öğrencilerin boy ortalaması $175$ cm ve tüm sınıfın boy ortalaması $166$ cm'dir.
Buna göre bu sınıfta kaç tane kız öğrenci vardır?

**Şıklar:**
A) 12
B) 15
C) 18
D) 20
E) 22

**Açıklama:**
Kız öğrenci sayısına $k$ denirse erkek öğrenci sayısı $30 - k$ olur. Tüm sınıfın boy toplamı iki yoldan eşitlenir:
$160k + 175(30 - k) = 166 \cdot 30 \Rightarrow 160k + 5.250 - 175k = 4.980 \Rightarrow 15k = 270 \Rightarrow k = 18$ kız öğrenci bulunur.

**Çeldirici Tuzağı:**
A şıkkı (12), kız öğrenci sayısı ($18$) yerine erkek öğrenci sayısını ($30 - 18 = 12$) işaretleyen adayı yakalar.

### mat-06-023
- zorluk: 2
- dogru: A
- dogrulama: (12 * 250000) / 100000

**Soru:**
$\dfrac{1}{250.000}$ ölçekli bir haritada iki şehir arasındaki uzaklık $12$ cm olarak ölçülmüştür.
Buna göre bu iki şehir arasındaki gerçek uzaklık kaç km'dir?

**Şıklar:**
A) 30
B) 3
C) 25
D) 300
E) 3.000

**Açıklama:**
Ölçek $\dfrac{\text{Harita uzunluğu}}{\text{Gerçek uzunluk}}$ olduğundan gerçek uzaklık $12 \cdot 250.000 = 3.000.000$ cm olur. $1$ km $= 100.000$ cm olduğu için gerçek uzaklık $\dfrac{3.000.000}{100.000} = 30$ km bulunur.

**Çeldirici Tuzağı:**
D şıkkı (300) ve B şıkkı (3), santimetreden kilometreye çevirirken $5$ sıfır silmek yerine $4$ veya $6$ sıfır silen adayı yakalar.

### mat-06-024
- zorluk: 3
- dogru: E
- dogrulama: 12 + (24 * 12) / 36 + (24 * 12) / 48

**Soru:**
Birbirini döndüren üç dişli çarktan birincisinde $24$, ikincisinde $36$ ve üçüncüsünde $48$ diş vardır.
Birinci çark $12$ tur döndüğünde üç çarkın yaptığı toplam tur sayısı kaç olur?

**Şıklar:**
A) 14
B) 20
C) 24
D) 54
E) 26

**Açıklama:**
Birbirini döndüren dişli çarklarda diş sayısı ile tur sayısı ters orantılıdır (toplam dönen diş sayısı eşittir): $24 \cdot 12 = 36 \cdot t_2 = 48 \cdot t_3 = 288$.
Buradan ikinci çark $t_2 = \dfrac{288}{36} = 8$ tur, üçüncü çark $t_3 = \dfrac{288}{48} = 6$ tur döner. Üç çarkın toplam tur sayısı $12 + 8 + 6 = 26$ bulunur.

**Çeldirici Tuzağı:**
D şıkkı (54), diş sayısıyla tur sayısını ters değil doğru orantılı sanıp $t_2 = 18$ ve $t_3 = 24$ hesaplayarak $12 + 18 + 24 = 54$ bulan adayı yakalar.


### mat-06-025
- zorluk: 1
- dogru: D
- dogrulama: yok

**Soru:**
$a \neq 0$ ve $a \neq \pm b$ olmak üzere
$$\dfrac{a^2 - b^2}{a^2 + ab} \cdot \dfrac{a^2}{a - b}$$
ifadesinin sadeleştirilmiş biçimi aşağıdakilerden hangisidir?

**Şıklar:**
A) $1$
B) $b$
C) $a - b$
D) $a$
E) $a + b$

**Açıklama:**
İlk kesrin payı iki kare farkıyla $(a - b)(a + b)$, paydası ise $a$ ortak çarpanıyla $a(a + b)$ şeklinde yazılır:
$$\dfrac{(a - b)(a + b)}{a(a + b)} \cdot \dfrac{a^2}{a - b} = \dfrac{a - b}{a} \cdot \dfrac{a^2}{a - b} = a$$
bulunur.

**Çeldirici Tuzağı:**
A şıkkı ($1$), paydadaki $a$ ile ikinci kesrin payındaki $a^2$ terimini sadeleştirirken üssün $1$ azaldığını unutup tüm ifadelerin birbirini götürdüğünü sanan adayı yakalar.

### mat-06-026
- zorluk: 1
- dogru: B
- dogrulama: (3 + 5 + 7) * (15 / (3 + 7 - 5))

**Soru:**
$$\dfrac{a}{3} = \dfrac{b}{5} = \dfrac{c}{7}$$
ve $a + c - b = 15$ olduğuna göre $a + b + c$ toplamı kaçtır?

**Şıklar:**
A) 30
B) 45
C) 50
D) 60
E) 75

**Açıklama:**
Orantı sabiti $k$ olsun: $a = 3k$, $b = 5k$ ve $c = 7k$. Verilen denklemde yerine konursa $3k + 7k - 5k = 15 \Rightarrow 5k = 15 \Rightarrow k = 3$ bulunur. Toplam $a + b + c = 3k + 5k + 7k = 15k = 15 \cdot 3 = 45$'tir.

**Çeldirici Tuzağı:**
E şıkkı ($75$) veya A şıkkı ($30$), $a + c - b$ yerine tüm terimleri toplam ($15k = 15 \Rightarrow k = 1$) ya da hatalı katsayı ($3k = 15$) alan adayı yakalar.

### mat-06-027
- zorluk: 1
- dogru: B
- dogrulama: (15 - 8) * (105 / (8 + 12 + 15))

**Soru:**
Bir depodaki A, B ve C marka ürünlerin sayıları hakkında aşağıdakiler bilinmektedir:
- A marka ürünlerin sayısının B marka ürünlerin sayısına oranı $\dfrac{2}{3}$'tür.
- B marka ürünlerin sayısının C marka ürünlerin sayısına oranı $\dfrac{4}{5}$'tir.
Depoda bu üç markadan toplam $105$ adet ürün bulunduğuna göre, C marka ürün sayısı A marka ürün sayısından kaç fazladır?

**Şıklar:**
A) 14
B) 21
C) 24
D) 36
E) 45

**Açıklama:**
Her iki oranda ortak olan B markasının katsayıları $\text{EKOK}(3, 4) = 12$ üzerinde eşitlenir:
- $\dfrac{A}{B} = \dfrac{2 \cdot 4}{3 \cdot 4} = \dfrac{8}{12}$
- $\dfrac{B}{C} = \dfrac{4 \cdot 3}{5 \cdot 3} = \dfrac{12}{15}$
Böylece $A = 8k$, $B = 12k$ ve $C = 15k$ yazılır. Toplam $8k + 12k + 15k = 35k = 105 \Rightarrow k = 3$ bulunur. Fark ise $C - A = 15k - 8k = 7k = 7 \cdot 3 = 21$'dir.

**Çeldirici Tuzağı:**
C şıkkı ($24$), $A = 8 \cdot 3 = 24$ değerini bulup fark yerine doğrudan A marka ürün sayısını işaretleyen; E şıkkı ($45$) ise $C$'yi işaretleyen adayı yakalar.

### mat-06-028
- zorluk: 2
- dogru: A
- dogrulama: yok

**Soru:**
$a \notin \{-3, -2, 0, 2, 3\}$ olmak üzere
$$\dfrac{a^2 - a - 6}{a^2 - 4} \div \dfrac{a^2 - 9}{a^2 + 3a}$$
ifadesinin sadeleştirilmiş biçimi aşağıdakilerden hangisidir?

**Şıklar:**
A) $\dfrac{a}{a - 2}$
B) $\dfrac{a}{a + 2}$
C) $\dfrac{a + 2}{a - 2}$
D) $\dfrac{a - 3}{a + 3}$
E) $\dfrac{a + 3}{a - 2}$

**Açıklama:**
Tüm pay ve paydalar çarpanlarına ayrılır ve ikinci kesir ters çevrilip çarpılır:
$$\dfrac{(a - 3)(a + 2)}{(a - 2)(a + 2)} \cdot \dfrac{a(a + 3)}{(a - 3)(a + 3)}$$
Ortak $(a - 3)$, $(a + 2)$ ve $(a + 3)$ çarpanları sadeleştiğinde geriye $\dfrac{a}{a - 2}$ kalır.

**Çeldirici Tuzağı:**
B şıkkı ($\frac{a}{a+2}$), $a^2 - a - 6$ üç terimlisini $(a + 3)(a - 2)$ şeklinde ters işaretle çarpanlara ayıran adayı yakalar.

### mat-06-029
- zorluk: 2
- dogru: E
- dogrulama: (27 - 23) + (23 - 27)^2

**Soru:**
$x = 27$ ve $y = 23$ olduğuna göre
$$\dfrac{x^3 - y^3}{x^2 + xy + y^2} + (y - x)^2$$
ifadesinin değeri kaçtır?

**Şıklar:**
A) 4
B) 8
C) 12
D) 16
E) 20

**Açıklama:**
Pay kısmı küp farkı özdeşliğiyle $x^3 - y^3 = (x - y)(x^2 + xy + y^2)$ biçiminde açılır; paydadaki $x^2 + xy + y^2$ ile sadeleştiğinde ilk terim yalnızca $x - y$ olur. İkinci terimle birlikte ifade $(x - y) + (y - x)^2$ hâline gelir. $x = 27$ ve $y = 23$ yazılırsa $(27 - 23) + (23 - 27)^2 = 4 + 16 = 20$ bulunur.

**Çeldirici Tuzağı:**
D şıkkı ($16$) veya A şıkkı ($4$), sadeleştirmeden sonra yalnızca $(y - x)^2 = 16$'yı veya yalnızca $x - y = 4$'ü işaretleyen adayı yakalar.

### mat-06-030
- zorluk: 2
- dogru: A
- dogrulama: 15 * (930 / (15 + 10 + 6))

**Soru:**
$930$ TL, yaşları $2$, $3$ ve $5$ olan üç kardeşe yaşlarıyla **ters orantılı** olarak paylaştırılıyor.
Buna göre en küçük kardeş kaç TL alır?

**Şıklar:**
A) 450
B) 180
C) 270
D) 300
E) 540

**Açıklama:**
Ters orantılı paylaştırmada paylar $\dfrac{k}{2}$, $\dfrac{k}{3}$ ve $\dfrac{k}{5}$'tir (veya ortak kat olan $30$'la genişleterek $15t$, $10t$, $6t$ yazılır). Toplam para $15t + 10t + 6t = 31t = 930 \Rightarrow t = 30$ olur. En küçük kardeş ($2$ yaşındaki) $15 \cdot 30 = 450$ TL alır.

**Çeldirici Tuzağı:**
B şıkkı ($180$), en küçük kardeşi yaşlarla **doğru orantılı** paylaştırmış gibi hesaplayıp $\frac{2}{10} \cdot 930 \approx 186$ veya ters sıradaki en büyük kardeşin payını ($6 \cdot 30 = 180$) işaretleyen adayı yakalar.

### mat-06-031
- zorluk: 2
- dogru: D
- dogrulama: yok

**Soru:**
Pozitif $a, b, c, d$ gerçel sayıları için $\dfrac{a}{b} = \dfrac{c}{d} = \dfrac{3}{4}$ eşitliği sağlanmaktadır. Buna göre,
I. $\dfrac{a + c}{b + d} = \dfrac{3}{4}$
II. $\dfrac{a + b}{b} = \dfrac{c + d}{d}$
III. $\dfrac{a \cdot c}{b \cdot d} = \dfrac{3}{4}$
ifadelerinden hangileri **her zaman** doğrudur?

**Şıklar:**
A) Yalnız I
B) Yalnız II
C) Yalnız III
D) I ve II
E) I, II ve III

**Açıklama:**
Orantı özelliklerine göre $a = 3k, b = 4k$ ve $c = 3m, d = 4m$ ($k, m > 0$) yazılır:
- I: $\dfrac{a + c}{b + d} = \dfrac{3(k + m)}{4(k + m)} = \dfrac{3}{4}$ her zaman doğrudur.
- II: $\dfrac{a + b}{b} = \dfrac{a}{b} + 1 = \dfrac{3}{4} + 1 = \dfrac{7}{4}$ ve $\dfrac{c + d}{d} = \dfrac{c}{d} + 1 = \dfrac{7}{4}$ olduğundan eşitlik her zaman doğrudur.
- III: $\dfrac{a \cdot c}{b \cdot d} = \dfrac{a}{b} \cdot \dfrac{c}{d} = \dfrac{3}{4} \cdot \dfrac{3}{4} = \dfrac{9}{16} \neq \dfrac{3}{4}$ olduğundan III yanlıştır.

**Çeldirici Tuzağı:**
E şıkkı (I, II ve III), oranların toplamda korunduğu gibi çarpımda da aynı sabit $\frac{3}{4}$ değerini koruduğunu zanneden adayı yakalar.

### mat-06-032
- zorluk: 2
- dogru: C
- dogrulama: 7^2 - 2 * 10

**Soru:**
Sıfırdan farklı $x$ ve $y$ gerçel sayıları için
$$x + y = 7 \quad \text{ve} \quad \dfrac{1}{x} + \dfrac{1}{y} = \dfrac{7}{10}$$
eşitlikleri sağlanmaktadır. Buna göre $x^2 + y^2$ toplamı kaçtır?

**Şıklar:**
A) 19
B) 25
C) 29
D) 39
E) 49

**Açıklama:**
İkinci eşitlikte payda eşitlenirse $\dfrac{x + y}{x \cdot y} = \dfrac{7}{10}$ elde edilir. Soruda $x + y = 7$ verildiğinden $\dfrac{7}{x \cdot y} = \dfrac{7}{10} \Rightarrow x \cdot y = 10$ bulunur.
Tam kare özdeşliğiyle:
$$x^2 + y^2 = (x + y)^2 - 2xy = 7^2 - 2 \cdot 10 = 49 - 20 = 29$$
hesaplanır.

**Çeldirici Tuzağı:**
D şıkkı ($39$), $x^2 + y^2 = (x + y)^2 - 2xy$ özdeşliğinde $2xy$ yerine yalnızca $xy = 10$ çıkaran ($49 - 10 = 39$) adayı; E şıkkı ($49$) ise doğrudan $(x + y)^2$ sonucunu alanları yakalar.

### mat-06-033
- zorluk: 3
- dogru: D
- dogrulama: (9^2 - 35) / 2

**Soru:**
$a$, $b$ ve $c$ gerçel sayıları için
$$a + b + c = 9 \quad \text{ve} \quad a^2 + b^2 + c^2 = 35$$
eşitlikleri veriliyor.
Buna göre $ab + ac + bc$ toplamı kaçtır?

**Şıklar:**
A) 11
B) 18
C) 20
D) 23
E) 46

**Açıklama:**
Üç terimli tam kare açılımı uygulanır:
$$(a + b + c)^2 = a^2 + b^2 + c^2 + 2(ab + ac + bc)$$
Bilinenler yerine yazılırsa $9^2 = 35 + 2(ab + ac + bc) \Rightarrow 81 - 35 = 2(ab + ac + bc) \Rightarrow 46 = 2(ab + ac + bc) \Rightarrow ab + ac + bc = 23$ bulunur.

**Çeldirici Tuzağı:**
E şıkkı ($46$), $2(ab + ac + bc) = 46$ bulduktan sonra katsayı olan $2$'ye bölmeyi unutup doğrudan $46$'yı işaretleyen adayı yakalar.

### mat-06-034
- zorluk: 3
- dogru: E
- dogrulama: 30 * (24 - 6) / (30 + 6)

**Soru:**
Bir izci kampındaki $30$ kişiye $24$ gün yetecek kadar erzak bulunmaktadır. Kamp başladıktan $6$ gün sonra kampa $6$ kişi daha katılıyor.
Kalan erzak kamptaki tüm kişilere kaç gün yeter?

**Şıklar:**
A) 10
B) 12
C) 13
D) 14
E) 15

**Açıklama:**
$6$ gün sonunda başlangıçtaki $30$ kişiye kalan erzak $24 - 6 = 18$ gün daha yetecek miktardadır. Kampa $6$ kişi katılınca kişi sayısı $30 + 6 = 36$ olur. Kişi sayısıyla yetme süresi ters orantılıdır:
$$30 \cdot 18 = 36 \cdot g \Rightarrow 540 = 36g \Rightarrow g = 15$$
gün yeter.

**Çeldirici Tuzağı:**
B şıkkı ($12$) veya D şıkkı ($14$), $6$ gün geçtiğini unutup başlangıçtaki $24$ günü ters orantılayarak $30 \cdot 24 = 36 \cdot g \Rightarrow 20$ ya da $6$ düşenleri yakalar.

### mat-06-035
- zorluk: 3
- dogru: A
- dogrulama: (3^2 + 2)^2 - 2

**Soru:**
$x$ sıfırdan farklı bir gerçel sayı olmak üzere
$$x - \dfrac{1}{x} = 3$$
eşitliği sağlanmaktadır.
Buna göre $x^4 + \dfrac{1}{x^4}$ değeri kaçtır?

**Şıklar:**
A) 119
B) 47
C) 81
D) 121
E) 123

**Açıklama:**
İki aşamada kare alınır:
1. İlk eşitliğin karesi: $x^2 - 2 + \dfrac{1}{x^2} = 9 \Rightarrow x^2 + \dfrac{1}{x^2} = 11$.
2. Elde edilen denklemin karesi: $x^4 + 2 + \dfrac{1}{x^4} = 121 \Rightarrow x^4 + \dfrac{1}{x^4} = 121 - 2 = 119$ bulunur.

**Çeldirici Tuzağı:**
B şıkkı ($47$), ilk adımda $x^2 + \dfrac{1}{x^2}$'yi $3^2 + 2 = 11$ yerine $3^2 - 2 = 7$ bulan adayın ($7^2 - 2 = 47$) düştüğü işaret tuzağıdır; E şıkkı ($123$) ise ikinci adımda $-2$ yerine $+2$ ekleyenleri yakalar.


### mat-06-036
- zorluk: 1
- dogru: C
- dogrulama: 14^2 - 6^2

**Soru:**
Şekildeki bir kenarı $14$ cm olan büyük kareden, bir köşesinden kenarı $6$ cm olan küçük kare kesilerek çıkarılıyor.
Buna göre kalan taralı bölgenin alanı kaç cm²'dir?

**Şekil:**
```json
{
  "kind": "geometry",
  "pointLabels": false,
  "points": {
    "A": [0, 0],
    "E": [6, 0],
    "B": [14, 0],
    "C": [14, 14],
    "D": [0, 14],
    "F": [6, 6],
    "G": [0, 6]
  },
  "shapes": [
    { "type": "polygon", "points": ["E", "B", "C", "D", "G", "F"], "fill": true },
    { "type": "polygon", "points": ["A", "E", "F", "G"] },
    { "type": "segment", "from": "D", "to": "C", "label": "14" },
    { "type": "segment", "from": "A", "to": "E", "label": "6" }
  ]
}
```

**Şıklar:**
A) 64
B) 100
C) 160
D) 176
E) 196

**Açıklama:**
İki kare farkı özdeşliği doğrudan uygulanır:
$$14^2 - 6^2 = (14 - 6)(14 + 6) = 8 \cdot 20 = 160\text{ cm}^2$$

**Çeldirici Tuzağı:**
A şıkkı ($64$), $(14 - 6)^2 = 8^2 = 64$ sanarak iki kare farkı özdeşliği ile tam kare farkını karıştıran adayı yakalar.

### mat-06-037
- zorluk: 2
- dogru: A
- dogrulama: 2400 * 360 / (150 + 90 - 120)

**Soru:**
Bir ailenin aylık gelirinin üç harcama kalemine göre dağılımı aşağıdaki daire grafiğinde verilmiştir.
Kira ve Eğitim giderlerinin toplamı, Gıda giderinden $2.400$ TL fazla olduğuna göre bu ailenin toplam aylık harcaması kaç TL'dir?

**Şekil:**
```json
{
  "kind": "pie",
  "slices": [
    { "label": "Kira", "value": 150 },
    { "label": "Gıda", "value": 120 },
    { "label": "Eğitim", "value": 90 }
  ],
  "show": "degree"
}
```

**Şıklar:**
A) 7.200
B) 4.800
C) 6.000
D) 8.400
E) 9.600

**Açıklama:**
Daire dilimlerinin açıları harcama tutarlarıyla doğru orantılıdır. Kira ve Eğitim toplam açısı $150^\circ + 90^\circ = 240^\circ$, Gıda açısı ise $120^\circ$'dir. Aradaki açı farkı $240^\circ - 120^\circ = 120^\circ$ olup $2.400$ TL'ye karşılık gelir. Bütün daire $360^\circ = 3 \cdot 120^\circ$ olduğundan toplam harcama $3 \cdot 2.400 = 7.200$ TL bulunur.

**Çeldirici Tuzağı:**
E şıkkı ($9.600$), açı farkını $120^\circ$ yerine $90^\circ$ sanarak $4 \cdot 2.400 = 9.600$ hesaplayan adayı yakalar.

### mat-06-038
- zorluk: 2
- dogru: B
- dogrulama: 6 * 24 / 12 + 6 * 24 / 9

**Soru:**
$x$ ve $y$ pozitif sayılarının aldığı değerlere ait tablo aşağıda verilmiştir.
$y$ sayısı $x$ ile **ters orantılı** olduğuna göre $a + b$ toplamı kaçtır?

**Şekil:**
```json
{
  "kind": "table",
  "headers": ["x", "y"],
  "rows": [
    ["6", "24"],
    ["12", "b"],
    ["a", "9"]
  ]
}
```

**Şıklar:**
A) 24
B) 28
C) 30
D) 32
E) 36

**Açıklama:**
Ters orantılı çoklukların çarpımı sabittir: $x \cdot y = 6 \cdot 24 = 144$.
- $2.$ satırdan $12 \cdot b = 144 \Rightarrow b = 12$.
- $3.$ satırdan $a \cdot 9 = 144 \Rightarrow a = 16$.
Toplam $a + b = 16 + 12 = 28$ bulunur.

**Çeldirici Tuzağı:**
C şıkkı ($30$) veya E şıkkı ($36$), ters orantı yerine doğru orantı kurup $\dfrac{6}{24} = \dfrac{12}{b} \Rightarrow b = 48$ veya bölme hatası yapan adayı yakalar.

### mat-06-039
- zorluk: 2
- dogru: D
- dogrulama: (64 - 40) / 2

**Soru:**
Şekildeki bir kenarı $(a + b)$ birim olan büyük kare dört dikdörtgensel bölgeye ayrılmıştır. Boyalı küçük karelerin alanları toplamı $a^2 + b^2 = 40\text{ cm}^2$ ve büyük karenin tamamının alanı $(a + b)^2 = 64\text{ cm}^2$ olduğuna göre boyalı olmayan iki dikdörtgenden **birinin** alanı kaç cm²'dir?

**Şekil:**
```json
{
  "kind": "geometry",
  "pointLabels": false,
  "points": {
    "A": [0, 0],
    "B": [8, 0],
    "C": [8, 8],
    "D": [0, 8],
    "M1": [0, 3],
    "M2": [5, 3],
    "M3": [5, 8],
    "M4": [5, 0],
    "M5": [8, 3]
  },
  "shapes": [
    { "type": "polygon", "points": ["M1", "M2", "M3", "D"], "fill": true },
    { "type": "polygon", "points": ["M2", "M4", "B", "M5"], "fill": true },
    { "type": "polygon", "points": ["A", "B", "C", "D"] },
    { "type": "segment", "from": "M1", "to": "M5" },
    { "type": "segment", "from": "M4", "to": "M3" },
    { "type": "segment", "from": "D", "to": "M3", "label": "a" },
    { "type": "segment", "from": "M3", "to": "C", "label": "b" },
    { "type": "segment", "from": "D", "to": "M1", "label": "a" },
    { "type": "segment", "from": "M1", "to": "A", "label": "b" }
  ]
}
```

**Şıklar:**
A) 6
B) 8
C) 10
D) 12
E) 24

**Açıklama:**
Tam kare özdeşliği açılır:
$$(a + b)^2 = a^2 + b^2 + 2ab \Rightarrow 64 = 40 + 2ab \Rightarrow 2ab = 24 \Rightarrow ab = 12$$
Boyalı olmayan iki eş dikdörtgenin her birinin alanı $a \cdot b = 12$ cm² bulunur.

**Çeldirici Tuzağı:**
E şıkkı ($24$), $2ab = 24$ değerini bulduktan sonra iki dikdörtgenden **yalnızca birinin** alanı sorulduğu hâlde $2$'ye bölmeyi unutup $24$'ü işaretleyen adayı yakalar.

### mat-06-040
- zorluk: 3
- dogru: E
- dogrulama: (12 / 2^2) * 3^2 + sqrt(48 / (12 / 2^2))

**Soru:**
Aşağıdaki tabloda $x$ ve $y$ değişkenlerinin aldığı pozitif değerler verilmiştir.
$y$ sayısı **$x$'in karesi ile doğru orantılı** olduğuna göre $a + b$ toplamı kaçtır?

**Şekil:**
```json
{
  "kind": "table",
  "headers": ["Durum", "x", "y"],
  "rows": [
    ["1.", "2", "12"],
    ["2.", "3", "a"],
    ["3.", "b", "48"]
  ]
}
```

**Şıklar:**
A) 18
B) 22
C) 27
D) 29
E) 31

**Açıklama:**
$y$, $x^2$ ile doğru orantılı olduğundan $\dfrac{y}{x^2} = k$ sabittir. İlk satırdan orantı sabiti $k = \dfrac{12}{2^2} = \dfrac{12}{4} = 3$ bulunur.
- $2.$ satırdan $\dfrac{a}{3^2} = 3 \Rightarrow a = 3 \cdot 9 = 27$.
- $3.$ satırdan $\dfrac{48}{b^2} = 3 \Rightarrow b^2 = 16 \Rightarrow b = 4$ ($b > 0$).
Sonuç olarak $a + b = 27 + 4 = 31$ bulunur.

**Çeldirici Tuzağı:**
A şıkkı ($18$) veya B şıkkı ($22$), $y$'nin $x^2$ ile değil doğrudan $x$ ile doğru orantılı olduğunu sanarak $a = 18$ ve $b = 8$ ($18 + 8 = 26$ ya da sadece $18$) bulan adayı yakalar.