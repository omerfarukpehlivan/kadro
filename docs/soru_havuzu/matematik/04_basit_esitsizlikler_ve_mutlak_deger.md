---
ders: Matematik & Geometri
konu: Basit Eşitsizlikler ve Mutlak Değer
kod: mat
kapsam: [lisans_gygk, b_grubu_gygk]
---

### mat-04-001
- zorluk: 1
- dogru: D
- dogrulama: 4 - (-2) + 1

**Soru:**
Sayı doğrusunda gösterilen aralığın içinde kaç tane tam sayı vardır?

**Şekil:**
```json
{
  "kind": "numberline",
  "min": -3,
  "max": 6,
  "step": 1,
  "intervals": [{ "from": -2, "to": 5, "toOpen": true }]
}
```

**Şıklar:**
A) 5
B) 6
C) 8
D) 7
E) 9

**Açıklama:**
Sayı doğrusunda sol uç $-2$ dolu çemberle gösterildiği için kümeye dahildir; sağ uç $5$ boş çemberle gösterildiği için kümeye dahil değildir. Yani aralık $[-2, 5)$ yarı açık aralığıdır. Bu aralıktaki tam sayılar $-2, -1, 0, 1, 2, 3, 4$ olup toplam $4 - (-2) + 1 = 7$ tanedir.

**Çeldirici Tuzağı:**
C şıkkı (8), sağ uçtaki boş çemberi de dahil sayıp $5$'i kümeye katan adayı yakalar. B şıkkı (6) ise $-2$ ile $5$ arasındaki tam sayıları uç noktaların ikisini de hariç tutarak sayanların tuzağıdır.

### mat-04-002
- zorluk: 1
- dogru: B
- dogrulama: (1 * (-3) + 5) / 2

**Soru:**
$$\dfrac{2x - 5}{-3} \ge 1$$
eşitsizliğini sağlayan en büyük $x$ tam sayısı kaçtır?

**Şıklar:**
A) 0
B) 1
C) 2
D) 4
E) $-1$

**Açıklama:**
Eşitsizliğin her iki tarafı negatif olan $-3$ ile çarpıldığında eşitsizlik yön değiştirir: $2x - 5 \le -3$. Buradan $2x \le 2 \Rightarrow x \le 1$ elde edilir. Bu koşulu sağlayan en büyük $x$ tam sayısı $1$'dir.

**Çeldirici Tuzağı:**
C şıkkı (2) veya D şıkkı (4), negatif sayıyla çarpma sırasında eşitsizliğin yönünü çevirmeyi unutup $x \ge 1$ sonucuna ulaşan adayı yakalar.

### mat-04-003
- zorluk: 2
- dogru: A
- dogrulama: (2 * 4 - 3 * (-2)) - 1

**Soru:**
$x$ ve $y$ gerçel sayıları için
$$-3 < x \le 4 \quad \text{ve} \quad -2 < y \le 5$$
eşitsizlikleri veriliyor.
Buna göre $2x - 3y$ ifadesinin alabileceği en büyük tam sayı değeri kaçtır?

**Şıklar:**
A) 13
B) 14
C) 11
D) 12
E) 10

**Açıklama:**
$x$ ve $y$ gerçel sayılar olduğu için değer seçilmez, aralıklarla işlem yapılır.
$2x$ için $-6 < 2x \le 8$,
$-3y$ için $-15 \le -3y < 6$ (negatif $-3$ ile çarpılınca yön değişir).
İki eşitsizlik taraf tarafa toplanır (biri $\le$, diğeri $<$ olduğu için üst sınır açık olur): $-21 < 2x - 3y < 14$. İfadenin alabileceği en büyük tam sayı değeri $13$'tür.

**Çeldirici Tuzağı:**
C şıkkı (11), $x$ ve $y$'yi gerçel sayı yerine tam sayı sanıp $x = 4, y = -1$ seçerek $2(4) - 3(-1) = 11$ bulan adayı yakalar. B şıkkı (14) ise üst sınırın açık olduğunu gözden kaçıranların tuzağıdır.

### mat-04-004
- zorluk: 2
- dogru: E
- dogrulama: 4 * 5 / 2

**Soru:**
$a$ bir gerçel sayı olmak üzere $a^2 < a$ eşitsizliği sağlanmaktadır.
Buna göre $6a - 1$ ifadesinin alabileceği tam sayı değerlerinin toplamı kaçtır?

**Şıklar:**
A) 5
B) 6
C) 9
D) 15
E) 10

**Açıklama:**
Karesi kendisinden küçük olan gerçel sayılar $0 < a < 1$ aralığındadır. Eşitsizliğin tüm tarafları $6$ ile çarpılır: $0 < 6a < 6$. Ardından her taraftan $1$ çıkarılır: $-1 < 6a - 1 < 5$. Bu aralıktaki tam sayılar $0, 1, 2, 3, 4$ olup toplamları $0 + 1 + 2 + 3 + 4 = 10$ bulunur.

**Çeldirici Tuzağı:**
D şıkkı (15), sağ uç açık olduğu hâlde $5$'i de dahil edip $10 + 5 = 15$ toplayan adayı yakalar. B şıkkı (6) ise yalnızca $1, 2, 3$ değerlerini sayan veya üst sınırı yanlış kuranların seçtiği şıktır.

### mat-04-005
- zorluk: 3
- dogru: C
- dogrulama: (16 + 5 - 1) - 2 + 1

**Soru:**
$x$ ve $y$ gerçel sayıları için
$$-4 < x \le 3 \quad \text{ve} \quad 1 < y < 5$$
eşitsizlikleri veriliyor.
Buna göre $x^2 + y$ ifadesi kaç farklı tam sayı değeri alabilir?

**Şıklar:**
A) 10
B) 15
C) 19
D) 20
E) 21

**Açıklama:**
$-4 < x \le 3$ aralığında $x = 0$ değeri bulunduğu için $x^2$'nin alabileceği en küçük değer $0$'dır (dahil). Uçların kareleri $(-4)^2 = 16$ ve $3^2 = 9$ olduğundan büyük olan $16$ açık sınır olur: $0 \le x^2 < 16$.
Diğer yandan $1 < y < 5$ eşitsizliğiyle taraf tarafa toplandığında $1 < x^2 + y < 21$ bulunur. Bu aralıktaki tam sayılar $2$'den $20$'ye kadar olup toplam $20 - 2 + 1 = 19$ adettir.

**Çeldirici Tuzağı:**
A şıkkı (10), $-4 < x \le 3$ aralığında $0$'ı unutarak doğrudan uçların karesini ($9 < x^2 < 16 \Rightarrow 10 < x^2 + y < 21$) alan adayı yakalar. Negatiften pozitife geçen bir aralığın karesinde alt sınır her zaman $0$'dır.

### mat-04-006
- zorluk: 1
- dogru: A
- dogrulama: ((9 + 6) / 3) * ((-9 + 6) / 3)

**Soru:**
$$|3x - 6| = 9$$
denklemini sağlayan $x$ gerçel sayılarının çarpımı kaçtır?

**Şıklar:**
A) $-5$
B) $-3$
C) 3
D) 4
E) 5

**Açıklama:**
Mutlak değer dışına iki durum çıkar:
$3x - 6 = 9 \Rightarrow 3x = 15 \Rightarrow x_1 = 5$ ve
$3x - 6 = -9 \Rightarrow 3x = -3 \Rightarrow x_2 = -1$.
Köklerin çarpımı $5 \cdot (-1) = -5$ bulunur.

**Çeldirici Tuzağı:**
E şıkkı (5), yalnızca pozitif durumu çözüp $x = 5$ kökünü bulan ve $-1$ kökünü gözden kaçıran adayı yakalar. D şıkkı (4) ise iki kökün çarpımı yerine toplamını ($5 - 1 = 4$) hesaplayanların tuzağıdır.

### mat-04-007
- zorluk: 2
- dogru: D
- dogrulama: yok

**Soru:**
$x < 0 < y$ olmak üzere
$$|x - y| + |x| - |y|$$
ifadesinin en sade biçimi aşağıdakilerden hangisidir?

**Şıklar:**
A) $0$
B) $2y$
C) $-2y$
D) $-2x$
E) $2x - 2y$

**Açıklama:**
$x < y$ olduğundan $x - y < 0$ negatiftir; mutlak değer dışına eksi ile çarpılarak çıkar: $|x - y| = y - x$.
$x < 0$ olduğundan $|x| = -x$, $y > 0$ olduğundan $|y| = y$'dir.
Yerine yazılırsa $(y - x) + (-x) - y = y - x - x - y = -2x$ bulunur.

**Çeldirici Tuzağı:**
E şıkkı ($2x - 2y$), $x - y < 0$ ifadesinin mutlak değerini işaret değiştirmeden $x - y$ olarak çıkaran adayı yakalar. Her mutlak değerin içinin işareti önce belirlenmelidir.

### mat-04-008
- zorluk: 2
- dogru: B
- dogrulama: ((-7 - 1) / 2 + (7 - 1) / 2) * ((7 - 1) / 2 - (-7 - 1) / 2 + 1) / 2

**Soru:**
$$|2x + 1| \le 7$$
eşitsizliğini sağlayan $x$ tam sayılarının toplamı kaçtır?

**Şıklar:**
A) $-7$
B) $-4$
C) 0
D) 6
E) 8

**Açıklama:**
Mutlak değer eşitsizliği iki taraflı yazılır: $-7 \le 2x + 1 \le 7$. Her taraftan $1$ çıkarılırsa $-8 \le 2x \le 6$, ardından $2$'ye bölünürse $-4 \le x \le 3$ elde edilir. Bu aralıktaki tam sayılar $-4, -3, -2, -1, 0, 1, 2, 3$'tür; $-3$'ten $3$'e kadar olan simetrik sayılar birbirini sıfırlayacağından toplam $-4$ olur.

**Çeldirici Tuzağı:**
E şıkkı (8), çözüm aralığındaki tam sayıların toplamı yerine adedini ($8$ tane) bulan adayı yakalar. D şıkkı (6) ise negatif kısmı ihmal edip yalnızca $0 + 1 + 2 + 3$ toplayanların düştüğü tuzaktır.

### mat-04-009
- zorluk: 2
- dogru: E
- dogrulama: (4 + 5) / 3

**Soru:**
$$|x - 4| = 2x - 5$$
denklemini sağlayan $x$ gerçel sayılarının toplamı kaçtır?

**Şıklar:**
A) 1
B) 2
C) 4
D) 5
E) 3

**Açıklama:**
Mutlak değer sonucu negatif olamayacağı için önce $2x - 5 \ge 0 \Rightarrow x \ge 2{,}5$ şartı sağlanmalıdır.
İki durum çözülür:
$x - 4 = 2x - 5 \Rightarrow x = 1$ (ancak $x = 1$ değeri $2x - 5 = -3 < 0$ yaptığı için denklemi sağlamaz ve elenir).
$x - 4 = -(2x - 5) = -2x + 5 \Rightarrow 3x = 9 \Rightarrow x = 3$ (kontrol: $|3 - 4| = 1$ ve $2(3) - 5 = 1$, sağlar).
Tek geçerli kök $x = 3$ olduğundan toplam $3$ bulunur.

**Çeldirici Tuzağı:**
C şıkkı (4), bulduğu $x = 1$ ve $x = 3$ adaylarının ikisini de sağlama yapmadan toplayan ($1 + 3 = 4$) adayı yakalar. Mutlak değerin bir tarafında değişken varken bulunan kökler mutlaka başlangıç denkleminde denenmelidir.

### mat-04-010
- zorluk: 3
- dogru: C
- dogrulama: (6 - 4 + 1) + (-2 - (-4) + 1)

**Soru:**
$$2 < |x - 1| \le 5$$
eşitsizliğini sağlayan kaç farklı $x$ tam sayısı vardır?

**Şıklar:**
A) 3
B) 4
C) 6
D) 7
E) 8

**Açıklama:**
Çift taraflı mutlak değer eşitsizliği iki ayrı durum olarak incelenir:
1. $2 < x - 1 \le 5 \Rightarrow 3 < x \le 6$: Bu aralıktaki tam sayılar $4, 5, 6$ ($3$ adet).
2. $-5 \le x - 1 < -2 \Rightarrow -4 \le x < -1$: Bu aralıktaki tam sayılar $-4, -3, -2$ ($3$ adet).
İki küme ayrık olduğundan toplam $3 + 3 = 6$ farklı tam sayı değeri vardır.

**Çeldirici Tuzağı:**
A şıkkı (3), yalnızca pozitif durumu ($2 < x - 1 \le 5$) çözüp negatif simetriyi unutan adayı yakalar. E şıkkı (8) ise kesin eşitsizlik ($<$) olan uç noktalar $3$ ve $-1$'i de sayanların tuzağıdır.

### mat-04-011
- zorluk: 1
- dogru: B
- dogrulama: 3 - (-1) + 1

**Soru:**
Yukarıdaki sayı doğrusunda gösterilen kalın aralıklara **dahil olmayan** kaç tane tam sayı vardır?

**Şekil:**
```json
{
  "kind": "numberline",
  "min": -4,
  "max": 6,
  "step": 1,
  "intervals": [
    { "to": -1, "toOpen": true },
    { "from": 4 }
  ]
}
```

**Şıklar:**
A) 4
B) 5
C) 6
D) 3
E) 7

**Açıklama:**
Sayı doğrusunda kalın çizgiler $(-\infty, -1)$ ve $[4, +\infty)$ bölgelerini göstermektedir ($-1$ noktası boş çemberle hariç, $4$ noktası ise dolu çemberle dahildir). Bu iki aralığın dışında kalan, yani dahil olmayan tam sayılar $[-1, 4)$ aralığındaki $-1, 0, 1, 2, 3$ sayılarıdır; toplam $5$ tanedir.

**Çeldirici Tuzağı:**
A şıkkı (4), $-1$'deki boş çemberin bu noktanın taralı bölgeye dahil olmadığını gösterdiğini gözden kaçırıp yalnızca $0, 1, 2, 3$'ü sayan adayı; C şıkkı (6) ise $4$'ü de hariç sayanları yakalar.

### mat-04-012
- zorluk: 1
- dogru: D
- dogrulama: yok

**Soru:**
$x$ ve $y$ gerçel sayıları için
$$x < 0 < y \quad \text{ve} \quad |x| > |y|$$
koşulları sağlanmaktadır. Buna göre,
I. $x + y < 0$
II. $y - x > 0$
III. $x^2 \cdot y < 0$
ifadelerinden hangileri **her zaman** doğrudur?

**Şıklar:**
A) Yalnız I
B) Yalnız II
C) Yalnız III
D) I ve II
E) II ve III

**Açıklama:**
$x < 0 < y$ ve $|x| > |y|$ olduğundan $-x > y$ yazılır; buradan $x + y < 0$ elde edilir (I doğru). $y > x$ olduğundan $y - x > 0$ her zaman sağlanır (II doğru). $x \neq 0$ için $x^2 > 0$ ve $y > 0$ olduğundan $x^2 \cdot y > 0$ olur; dolayısıyla III yanlıştır.

**Çeldirici Tuzağı:**
A şıkkı (Yalnız I) ve E şıkkı (II ve III), $x < 0$ iken $x^2$ ifadesinin işaretini negatif sanıp $x^2 \cdot y < 0$ sonucuna varan veya mutlak değer büyüklüğünü işaret yönüyle karıştıran adayı yakalar.

### mat-04-013
- zorluk: 2
- dogru: A
- dogrulama: yok

**Soru:**
$a < 0 < b$ ve $|a| > b$ olduğuna göre aşağıdakilerden hangisi **kesinlikle negatiftir**?

**Şıklar:**
A) $a + b$
B) $b - a$
C) $a^2 - b^2$
D) $a^2 + ab$
E) $b(b - a)$

**Açıklama:**
$a$ negatif, $b$ pozitif ve mutlak değerce $|a| > b$ olduğundan $a$'nın negatif büyüklüğü $b$'den fazladır (örneğin $a = -3$, $b = 1$). Bu nedenle $a + b < 0$ toplamı her zaman negatiftir. Diğer şıklarda $b - a > 0$, $a^2 - b^2 > 0$, $a^2 + ab = a(a + b) > 0$ ve $b(b - a) > 0$ ifadelerinin hepsi pozitiftir.

**Çeldirici Tuzağı:**
D şıkkı ($a^2 + ab$), $ab$ çarpımının negatif olmasına bakarak toplamın da negatif olacağını sanan adayı yakalar; oysa $|a| > b$ nedeniyle $a^2 > |ab|$ olduğundan sonuç pozitif kalır.

### mat-04-014
- zorluk: 2
- dogru: C
- dogrulama: (12 - 1) + (-20 + 1)

**Soru:**
$x$ ve $y$ gerçel sayıları için
$$-3 < x < 5 \quad \text{ve} \quad -4 < y < 2$$
eşitsizlikleri veriliyor.
Buna göre $x \cdot y$ çarpımının alabileceği en büyük tam sayı değeri ile en küçük tam sayı değerinin toplamı kaçtır?

**Şıklar:**
A) 1
B) $-2$
C) $-8$
D) $-10$
E) $-12$

**Açıklama:**
Gerçel sayı aralıklarının çarpımı için uç değerlerin tüm ikili çarpımları kontrol edilir:
$(-3) \cdot (-4) = 12$, $(-3) \cdot 2 = -6$, $5 \cdot (-4) = -20$ ve $5 \cdot 2 = 10$.
En küçük ve en büyük değerlere göre $-20 < x \cdot y < 12$ elde edilir. En büyük tam sayı $11$, en küçük tam sayı $-19$ olduğundan toplamları $11 + (-19) = -8$ bulunur.

**Çeldirici Tuzağı:**
A şıkkı (1), çapraz uç çarpımlarını ($5 \cdot (-4) = -20$) kontrol etmeyip yalnızca aynı taraf uçlarını çarparak $-6 < xy < 10$ veya $-10$ aralığı kuran adayı yakalar.

### mat-04-015
- zorluk: 2
- dogru: E
- dogrulama: 5 + 6

**Soru:**
$$\dfrac{1}{5} < \dfrac{1}{x - 2} < \dfrac{1}{2}$$
eşitsizliğini sağlayan $x$ tam sayılarının toplamı kaçtır?

**Şıklar:**
A) 7
B) 9
C) 10
D) 15
E) 11

**Açıklama:**
Aynı işaretli (pozitif) kesirler ters çevrildiğinde eşitsizlikler yön değiştirir: $5 > x - 2 > 2$, yani $2 < x - 2 < 5$. Her tarafa $2$ eklenirse $4 < x < 7$ bulunur. Bu aralıktaki tam sayılar $5$ ve $6$ olup toplamları $5 + 6 = 11$'dir.

**Çeldirici Tuzağı:**
A şıkkı (7), $2 < x - 2 < 5$ aralığındaki $3 + 4 = 7$ değerini alan ($2$'yi eklemeyi unutan) adayı; D şıkkı (15) ise sınır değer olan $4$'ü de toplayanları yakalar.

### mat-04-016
- zorluk: 1
- dogru: D
- dogrulama: (6 / 2) * (-4)

**Soru:**
$x$ ve $y$ gerçel sayıları için
$$|2x - 6| + |y + 4| = 0$$
eşitliği sağlanmaktadır.
Buna göre $x \cdot y$ çarpımı kaçtır?

**Şıklar:**
A) $-24$
B) $-6$
C) 12
D) $-12$
E) 24

**Açıklama:**
Mutlak değerler sıfırdan küçük olamayacağı için iki mutlak değerin toplamının $0$ olması ancak her birinin ayrı ayrı $0$ olmasıyla mümkündür: $2x - 6 = 0 \Rightarrow x = 3$ ve $y + 4 = 0 \Rightarrow y = -4$. Çarpım $3 \cdot (-4) = -12$ bulunur.

**Çeldirici Tuzağı:**
C şıkkı (12), $y + 4 = 0$ denkleminden $y = +4$ çıkararak işaret hatası yapan adayı yakalar.

### mat-04-017
- zorluk: 2
- dogru: B
- dogrulama: (8 + 2) + (-8 + 2) + (2 + 2) + (-2 + 2)

**Soru:**
$$\left\lvert|x - 2| - 5\right\rvert = 3$$
denklemini sağlayan farklı $x$ gerçel sayılarının toplamı kaçtır?

**Şıklar:**
A) 4
B) 8
C) 10
D) 12
E) 14

**Açıklama:**
Dıştaki mutlak değer açılır: $|x - 2| - 5 = 3$ veya $|x - 2| - 5 = -3$.
1. durum: $|x - 2| = 8 \Rightarrow x - 2 = 8$ ($x = 10$) veya $x - 2 = -8$ ($x = -6$).
2. durum: $|x - 2| = 2 \Rightarrow x - 2 = 2$ ($x = 4$) veya $x - 2 = -2$ ($x = 0$).
Dört farklı kökün toplamı $10 + (-6) + 4 + 0 = 8$ bulunur.

**Çeldirici Tuzağı:**
A şıkkı (4), yalnızca $|x - 2| = 8$ durumunu çözüp $-3$ durumundan gelen kökleri unutan adayı; E şıkkı (14) ise $-6$ yerine $+6$ alanları yakalar.

### mat-04-018
- zorluk: 2
- dogru: D
- dogrulama: (3 + 7) * (3 - 7)

**Soru:**
$$|x - 3| + |3 - x| = 14$$
denklemini sağlayan $x$ değerlerinin çarpımı kaçtır?

**Şıklar:**
A) $-187$
B) $-70$
C) $-28$
D) $-40$
E) $40$

**Açıklama:**
$|3 - x| = |x - 3|$ olduğundan denklem $2|x - 3| = 14 \Rightarrow |x - 3| = 7$ hâline gelir. Buradan $x - 3 = 7 \Rightarrow x_1 = 10$ ve $x - 3 = -7 \Rightarrow x_2 = -4$ bulunur. Köklerin çarpımı $10 \cdot (-4) = -40$'tır.

**Çeldirici Tuzağı:**
A şıkkı ($-187$), eşitliği $2$'ye bölmeyi unutup $|x - 3| = 14$ çözerek $17 \cdot (-11) = -187$ bulan adayı yakalar.

### mat-04-019
- zorluk: 1
- dogru: A
- dogrulama: (3 + 5) - (3 - 5) + 1

**Soru:**
Sayı doğrusunda $3$ noktasına olan uzaklığı en fazla $5$ birim olan kaç tane tam sayı vardır?

**Şıklar:**
A) 11
B) 9
C) 10
D) 7
E) 5

**Açıklama:**
$x$ sayısının $3$'e uzaklığının en fazla $5$ birim olması $|x - 3| \le 5$ eşitsizliğiyle ifade edilir: $-5 \le x - 3 \le 5 \Rightarrow -2 \le x \le 8$. Bu aralıktaki tam sayıların adedi $8 - (-2) + 1 = 11$ bulunur.

**Çeldirici Tuzağı:**
B şıkkı (9), "en fazla" ifadesinde uç noktalar $-2$ ve $8$'i hariç tutarak sayan adayı; C şıkkı (10) ise $8 - (-2) = 10$ diyerek $+1$ eklemeyi unutanları yakalar.

### mat-04-020
- zorluk: 2
- dogru: C
- dogrulama: ((9 + 6) / 3) - ((-9 + 6) / 3) + 1

**Soru:**
$$|3x - 6| > 9$$
eşitsizliğini **sağlamayan** kaç farklı $x$ tam sayısı vardır?

**Şıklar:**
A) 4
B) 5
C) 7
D) 6
E) 8

**Açıklama:**
$|3x - 6| > 9$ eşitsizliğini sağlamayan değerler, tümleyeni olan $|3x - 6| \le 9$ eşitsizliğini sağlayan değerlerdir. İki taraflı yazılırsa $-9 \le 3x - 6 \le 9 \Rightarrow -3 \le 3x \le 15 \Rightarrow -1 \le x \le 5$ bulunur. Bu aralıktaki tam sayılar $-1, 0, 1, 2, 3, 4, 5$ olup toplam $7$ tanedir.

**Çeldirici Tuzağı:**
B şıkkı (5), $> 9$ eşitsizliğinin tümleyenini $\le 9$ yerine $< 9$ alarak uç noktalar $-1$ ve $5$'i dışarıda bırakan adayı yakalar.

### mat-04-021
- zorluk: 3
- dogru: E
- dogrulama: 42 / (abs(7 - 2) + 1)

**Soru:**
$x$ bir gerçel sayı olmak üzere
$$\dfrac{42}{|x - 2| + |x - 7| + 1}$$
ifadesinin alabileceği en büyük tam sayı değeri kaçtır?

**Şıklar:**
A) 1
B) 3
C) 6
D) 42
E) 7

**Açıklama:**
Kesrin en büyük değeri için payda en küçük olmalıdır. Üçgen eşitsizliğinden (veya sayı doğrusunda $2$ ve $7$ noktalarına uzaklıklar toplamından) $x \in [2, 7]$ aralığındaki her sayı için $|x - 2| + |x - 7|$ toplamı en küçük değeri olan $7 - 2 = 5$'i alır. Dolayısıyla paydanın en küçük değeri $5 + 1 = 6$, kesrin en büyük değeri ise $\dfrac{42}{6} = 7$ bulunur.

**Çeldirici Tuzağı:**
D şıkkı (42), $|x - 2|$ ve $|x - 7|$ ifadelerinin aynı $x$ değeri için aynı anda sıfır olabileceğini sanıp paydayı $0 + 0 + 1 = 1$ alan adayı yakalar.

### mat-04-022
- zorluk: 3
- dogru: B
- dogrulama: ((-2 + 8) / 2) * (8 - (-2) + 1)

**Soru:**
$x$ bir gerçel sayı olmak üzere
$$|x - 2| < 3 \quad \text{ve} \quad 2x + y = 7$$
koşullarını sağlayan $y$ tam sayılarının toplamı kaçtır?

**Şıklar:**
A) 15
B) 33
C) 24
D) 30
E) 42

**Açıklama:**
Önce $x$'in aralığı bulunur: $-3 < x - 2 < 3 \Rightarrow -1 < x < 5$. Eşitlikten $y = 7 - 2x$ çekilir. $x$ gerçel sayı olduğundan aralıkla işlem yapılır: $-10 < -2x < 2 \Rightarrow -3 < 7 - 2x < 9$, yani $-3 < y < 9$ elde edilir. Bu aralıktaki $y$ tam sayıları $-2, -1, 0, \ldots, 8$ olup toplamları $\dfrac{-2 + 8}{2} \cdot 11 = 3 \cdot 11 = 33$ bulunur.

**Çeldirici Tuzağı:**
A şıkkı (15), soruda "$x$ bir gerçel sayı" denmesine rağmen $x$'i tam sayı ($0, 1, 2, 3, 4$) seçip yalnızca $y \in \{-1, 1, 3, 5, 7\}$ değerlerini toplayan adayı yakalar.


### mat-04-023
- zorluk: 1
- dogru: B
- dogrulama: 2 * 3 - 3 * (-1)

**Soru:**
$x$ ve $y$ birer tam sayı olmak üzere
$$-3 \le x < 4 \quad \text{ve} \quad -2 < y \le 5$$
eşitsizlikleri verilmektedir. Buna göre $2x - 3y$ ifadesinin alabileceği **en büyük** tam sayı değeri kaçtır?

**Şıklar:**
A) 7
B) 9
C) 11
D) 13
E) 14

**Açıklama:**
$x$ ve $y$ tam sayı olduğundan $2x - 3y$ farkını en büyük yapmak için $x$ en büyük, $y$ en küçük seçilir. Verilen aralıklarda en büyük $x = 3$ ve en küçük $y = -1$ olur. Buna göre $2(3) - 3(-1) = 6 + 3 = 9$ bulunur.

**Çeldirici Tuzağı:**
D şıkkı ($13$), $x$ ve $y$'nin tam sayı olduğunu gözden kaçırıp gerçel sayı aralığından $2x - 3y < 14 \Rightarrow 13$ sonucunu bulan adayı yakalar.

### mat-04-024
- zorluk: 1
- dogru: C
- dogrulama: yok

**Soru:**
$x < y < 0$ olmak üzere
$$|x - y| + |y| - |x + y|$$
ifadesinin eşiti aşağıdakilerden hangisidir?

**Şıklar:**
A) $-y$
B) $-x$
C) $y$
D) $x$
E) $2y - x$

**Açıklama:**
Verilen sıralamaya göre mutlak değer içlerindeki işaretler belirlenir:
- $x < y \Rightarrow x - y < 0$ olduğundan $|x - y| = y - x$.
- $y < 0$ olduğundan $|y| = -y$.
- $x < 0$ ve $y < 0 \Rightarrow x + y < 0$ olduğundan $|x + y| = -(x + y) = -x - y$.
Yerine yazıldığında $(y - x) + (-y) - (-x - y) = y - x - y + x + y = y$ bulunur.

**Çeldirici Tuzağı:**
A şıkkı ($-y$), mutlak değer önündeki çıkarma işaretini dağıtırken $-(-x - y)$ ifadesini $-x - y$ olarak bırakan adayı yakalar.

### mat-04-025
- zorluk: 2
- dogru: E
- dogrulama: 4^2 + (-2 * (-2)) - 1

**Soru:**
$x$ ve $y$ gerçel sayıları için $-3 < x < 4$ ve $-2 < y < 5$ eşitsizlikleri veriliyor.
Buna göre $x^2 - 2y$ ifadesinin alabileceği **en büyük tam sayı** değeri kaçtır?

**Şıklar:**
A) 15
B) 16
C) 17
D) 18
E) 19

**Açıklama:**
$x$ ve $y$ gerçel sayı olduğu için aralıklar üzerinde işlem yapılır:
- $-3 < x < 4$ aralığında $0$ yer aldığından $0 \le x^2 < 16$'dır.
- $-2 < y < 5$ eşitsizliği $-2$ ile çarpılınca yön değişir: $-10 < -2y < 4$.
Taraf tarafa toplanırsa $-10 < x^2 - 2y < 20$ bulunur. $20$'den küçük en büyük tam sayı $19$'dur.

**Çeldirici Tuzağı:**
B şıkkı ($16$) veya C şıkkı ($17$), $x$ ve $y$'yi gerçel değil tam sayı sanıp $x = 3, y = -1 \Rightarrow 9 + 2 = 11$ ya da uçlarda $-2$'yi alamayıp $17$ bulan adayı yakalar.

### mat-04-026
- zorluk: 2
- dogru: E
- dogrulama: yok

**Soru:**
$a$ ve $b$ gerçel sayıları için
$$a^2 < a \quad \text{ve} \quad a \cdot b < 0$$
eşitsizlikleri sağlanmaktadır. Buna göre,
I. $a + b < 0$
II. $\dfrac{b}{a} < b$
III. $a^2 \cdot b > b$
ifadelerinden hangileri **her zaman** doğrudur?

**Şıklar:**
A) Yalnız I
B) Yalnız II
C) I ve II
D) I ve III
E) II ve III

**Açıklama:**
$a^2 < a$ eşitsizliği yalnızca $0 < a < 1$ aralığında sağlanır. $a \cdot b < 0$ ve $a > 0$ olduğundan $b < 0$ bulunur.
- I: $a = \frac{1}{2}$ ve $b = -\frac{1}{4}$ için $a + b > 0$ olduğundan her zaman doğru değildir.
- II: $0 < a < 1 \Rightarrow \frac{1}{a} > 1$ olur; bu eşitsizlik negatif $b$ ile çarpılırsa yön değiştirir ve $\frac{b}{a} < b$ elde edilir (doğru).
- III: $0 < a^2 < 1$ eşitsizliği negatif $b$ ile çarpılınca yön değiştirir ve $a^2 \cdot b > b$ elde edilir (doğru).

**Çeldirici Tuzağı:**
D şıkkı (I ve III), $0 < a < 1$ ile $b < 0$ eşitsizliklerinde $b$'nin mutlak değerinin $a$'dan büyük olmak zorunda olduğunu varsayıp I. öncülü doğru sanan adayı yakalar.

### mat-04-027
- zorluk: 2
- dogru: A
- dogrulama: (7 - 1) + (5 - 2)

**Soru:**
$2 < x < 5$ olduğuna göre
$$|x - 7| + |x - 1| + |5 - x| + |x - 2|$$
ifadesinin eşiti kaçtır?

**Şıklar:**
A) 9
B) 5
C) 7
D) 11
E) 15

**Açıklama:**
$2 < x < 5$ aralığında her mutlak değerin içinin işareti belirlenir:
- $x - 7 < 0 \Rightarrow |x - 7| = 7 - x$
- $x - 1 > 0 \Rightarrow |x - 1| = x - 1$
- $5 - x > 0 \Rightarrow |5 - x| = 5 - x$
- $x - 2 > 0 \Rightarrow |x - 2| = x - 2$
Toplam yazılır: $(7 - x) + (x - 1) + (5 - x) + (x - 2) = 7 - 1 + 5 - 2 = 9$ bulunur ($x$'ler sadeleşir).

**Çeldirici Tuzağı:**
C şıkkı ($7$) veya D şıkkı ($11$), $5 - x$ ifadesini negatif sanarak $x - 5$ diye çıkarıp sadeleştirme sonrasında yanlış sabit elde eden adayı yakalar.

### mat-04-028
- zorluk: 2
- dogru: B
- dogrulama: 3 * 1 + 1 * 3

**Soru:**
$a$ ve $b$ birer tam sayı olmak üzere
$$|a - 1| \le 2 \quad \text{ve} \quad |b + 1| \le 2$$
eşitsizliklerini sağlayan ve $a \cdot b > 0$ koşuluna uyan kaç farklı $(a, b)$ sıralı ikilisi vardır?

**Şıklar:**
A) 3
B) 6
C) 8
D) 12
E) 16

**Açıklama:**
Eşitsizlikler çözüldüğünde:
- $-2 \le a - 1 \le 2 \Rightarrow -1 \le a \le 3 \Rightarrow a \in \{-1, 0, 1, 2, 3\}$
- $-2 \le b + 1 \le 2 \Rightarrow -3 \le b \le 1 \Rightarrow b \in \{-3, -2, -1, 0, 1\}$
$a \cdot b > 0$ olması için $a$ ve $b$ aynı işaretli ve sıfırdan farklı olmalıdır:
- Her ikisi pozitif ($a \in \{1, 2, 3\}$, $b \in \{1\}$): $3 \cdot 1 = 3$ ikili.
- Her ikisi negatif ($a \in \{-1\}$, $b \in \{-3, -2, -1\}$): $1 \cdot 3 = 3$ ikili.
Toplam $3 + 3 = 6$ farklı sıralı ikili vardır.

**Çeldirici Tuzağı:**
A şıkkı ($3$), yalnızca $a$ ve $b$'nin ikisinin de pozitif olduğu durumu sayıp ikisinin de negatif olduğu durumu unutan adayı; C şıkkı ($8$) ise $0$ değerini de katan adayı yakalar.

### mat-04-029
- zorluk: 3
- dogru: E
- dogrulama: 2 + 3 + 4 + 5 + 6

**Soru:**
$a$ bir gerçel sayı olmak üzere $-3 < a < 2$ ve
$$b = \frac{12}{a^2 + 2}$$
olduğuna göre $b$'nin alabileceği **tam sayı** değerlerinin toplamı kaçtır?

**Şıklar:**
A) 10
B) 14
C) 15
D) 18
E) 20

**Açıklama:**
$-3 < a < 2$ aralığında $a = 0$ bulunduğundan $0 \le a^2 < 9$ olur. Her tarafa $2$ eklenirse $2 \le a^2 + 2 < 11$ elde edilir. Pozitif ifadeler ters çevrildiğinde yön değişir:
$$\frac{1}{11} < \frac{1}{a^2 + 2} \le \frac{1}{2} \Rightarrow \frac{12}{11} < b \le 6$$
Bu aralıktaki $b$ tam sayıları $\{2, 3, 4, 5, 6\}$ olup toplamları $2 + 3 + 4 + 5 + 6 = 20$'dir.

**Çeldirici Tuzağı:**
D şıkkı ($18$), $12/11 > 1$ olduğundan $2$'yi atlayıp veya $0 \le a^2$ yerine yanlışlıkla $4 < a^2 < 9$ alıp $b = 6$'yı kaçıran adayı yakalar.

### mat-04-030
- zorluk: 3
- dogru: B
- dogrulama: 1 + 4 + 8

**Soru:**
$$|x - 2| + |y + 1| \le 2$$
eşitsizliğini sağlayan kaç farklı $(x, y)$ tam sayı ikilisi vardır?

**Şıklar:**
A) 9
B) 13
C) 15
D) 17
E) 25

**Açıklama:**
$u = x - 2$ ve $v = y + 1$ tam sayıları için $|u| + |v| \le 2$ koşulu incelenir:
- $|u| + |v| = 0$: $(0, 0) \to 1$ ikili.
- $|u| + |v| = 1$: $(\pm 1, 0), (0, \pm 1) \to 4$ ikili.
- $|u| + |v| = 2$: $(\pm 2, 0), (0, \pm 2), (\pm 1, \pm 1) \to 2 + 2 + 4 = 8$ ikili.
Toplam $1 + 4 + 8 = 13$ farklı $(x, y)$ tam sayı ikilisi vardır.

**Çeldirici Tuzağı:**
A şıkkı ($9$), $(1, 1)$ gibi her ikisi de $\pm 1$ olan çapraz $4$ ikiliyi saymayı unutan; E şıkkı ($25$) ise her iki değişkeni bağımsız $[-2, 2]$ aralığında $5 \cdot 5 = 25$ sanan adayı yakalar.