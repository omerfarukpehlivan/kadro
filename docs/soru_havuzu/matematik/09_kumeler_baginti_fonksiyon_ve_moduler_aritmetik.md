---
ders: Matematik & Geometri
konu: Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik
kod: mat
kapsam: [lisans_gygk, b_grubu_gygk]
---

### mat-09-001
- zorluk: 1
- dogru: A
- dogrulama: 2^(6 - 2)

**Soru:**
$$A = \{1, 2, 3, 4, 5, 6\}$$
kümesinin alt kümelerinin kaç tanesinde $1$ elemanı bulunur ancak $2$ elemanı bulunmaz?

**Şıklar:**
A) 16
B) 15
C) 24
D) 32
E) 64

**Açıklama:**
Alt kümede $1$'in bulunması ve $2$'nin bulunmaması kesin olduğu için karar vereceğimiz elemanlar geriye kalan $\{3, 4, 5, 6\}$ kümesinin $4$ elemanıdır. Bu $4$ elemanla oluşturulabilecek her alt kümeye $1$ eklendiğinde istenen koşulu sağlayan $2^4 = 16$ tane alt küme elde edilir.

**Çeldirici Tuzağı:**
D şıkkı (32), yalnızca bir eleman için şart varmış gibi $2^5 = 32$ hesaplayan adayı; B şıkkı (15) ise öz alt küme sorusu sanıp $1$ çıkaranları yakalar.

### mat-09-002
- zorluk: 2
- dogru: C
- dogrulama: (28 - (2 + 4 - 1 + 5)) / 3 + 2

**Soru:**
Şekildeki Venn şemasında her bölgedeki eleman sayısı verilmiştir. Evrensel küme $s(E) = 28$ olduğuna göre $s(A \setminus B)$ kaçtır?

**Şekil:**
```json
{
  "kind": "venn",
  "universe": "E",
  "sets": ["A", "B"],
  "regions": { "A": "x + 2", "AB": "4", "B": "2x − 1", "out": "5" }
}
```

**Şıklar:**
A) 6
B) 7
C) 8
D) 10
E) 12

**Açıklama:**
Venn şemasındaki tüm ayrık bölgelerin eleman sayıları toplamı evrensel kümeyi verir: $(x + 2) + 4 + (2x - 1) + 5 = 28 \Rightarrow 3x + 10 = 28 \Rightarrow 3x = 18 \Rightarrow x = 6$. $A \setminus B$ bölgesi yalnızca $A$'ya ait bölge olduğundan $s(A \setminus B) = x + 2 = 6 + 2 = 8$ bulunur.

**Çeldirici Tuzağı:**
A şıkkı (6), $x = 6$ değerini bulduktan sonra $x + 2$ yerine $x$'i işaretleyen; E şıkkı (12) ise $s(A \setminus B)$ yerine $s(A) = 8 + 4 = 12$'yi seçen adayı yakalar.

### mat-09-003
- zorluk: 2
- dogru: D
- dogrulama: 2 * ((32 - 4 + 5) / 3) - 5

**Soru:**
$32$ kişilik bir sınıfta İngilizce bilenlerin sayısı, Almanca bilenlerin sayısının $2$ katıdır. Bu sınıfta her iki dili de bilen $5$ kişi, iki dili de bilmeyen $4$ kişi vardır.
Buna göre bu sınıfta yalnızca İngilizce bilen kaç kişi vardır?

**Şıklar:**
A) 11
B) 14
C) 16
D) 17
E) 22

**Açıklama:**
İki dili de bilmeyen $4$ kişi çıkarılırsa en az bir dil bilenlerin sayısı $s(I \cup A) = 32 - 4 = 28$ olur. Almanca bilenlere $x$ denirse İngilizce bilenler $2x$ olur. Birleşim formülü yazılır: $s(I \cup A) = s(I) + s(A) - s(I \cap A) \Rightarrow 28 = 2x + x - 5 \Rightarrow 3x = 33 \Rightarrow x = 11$. İngilizce bilenler $2 \cdot 11 = 22$ kişidir; bunların $5$'i Almanca da bildiği için yalnızca İngilizce bilen $22 - 5 = 17$ kişi bulunur.

**Çeldirici Tuzağı:**
E şıkkı (22), İngilizce bilenlerin tamamını ($2x = 22$) bulup kesişimdeki $5$ kişiyi çıkarmayı unutan adayı yakalar. Soru "yalnızca İngilizce" bilenleri sormaktadır.

### mat-09-004
- zorluk: 3
- dogru: E
- dogrulama: 19 + 6 + 4

**Soru:**
Şekildeki üç kümeli Venn şemasında her bölgeye ait eleman sayısı yazılmıştır. $s(A \cup B) = 19$ olduğuna göre $s(E)$ kaçtır?

**Şekil:**
```json
{
  "kind": "venn",
  "universe": "E",
  "sets": ["A", "B", "C"],
  "regions": {
    "A": "5",
    "B": "4",
    "C": "6",
    "AB": "3",
    "AC": "2",
    "BC": "1",
    "ABC": "x",
    "out": "4"
  }
}
```

**Şıklar:**
A) 25
B) 26
C) 27
D) 28
E) 29

**Açıklama:**
$A \cup B$ kümesi $A$ veya $B$ çemberlerinin içinde kalan tüm bölgeleri kapsar: $s(A \cup B) = 5 + 4 + 3 + 2 + 1 + x = 15 + x$. Verilen $15 + x = 19$ eşitliğinden $x = 4$ bulunur. Evrensel küme $E$, şemadaki tüm bölgelerin toplamıdır: $s(E) = 19 + 6 + 4 = 29$ olur.

**Çeldirici Tuzağı:**
B şıkkı (26), $A \cup B$'yi hesaplarken $C$ ile ortak olan $AC$ ($2$) ve $BC$ ($1$) bölgelerini dışarıda bırakıp $x$'i $7$ bularak sonraki toplamda hata yapan veya dıştaki $4$'ü eklemeyi unutan adayı yakalar.

### mat-09-005
- zorluk: 1
- dogru: B
- dogrulama: 4 * ((5 + 3) / 2) + 5

**Soru:**
Gerçel sayılar kümesinde tanımlı $f$ fonksiyonu için
$$f(2x - 3) = 4x + 5$$
eşitliği verilmektedir.
Buna göre $f(5)$ değeri kaçtır?

**Şıklar:**
A) 17
B) 21
C) 23
D) 25
E) 29

**Açıklama:**
Parantez içinin $5$ olması için $2x - 3 = 5 \Rightarrow 2x = 8 \Rightarrow x = 4$ yazılmalıdır. Sağ tarafta $x = 4$ yerine konursa $f(5) = 4 \cdot 4 + 5 = 16 + 5 = 21$ bulunur.

**Çeldirici Tuzağı:**
D şıkkı (25), $2x - 3 = 5$ eşitliğini çözmeden doğrudan $x$ yerine $5$ yazarak $4 \cdot 5 + 5 = 25$ hesaplayan adayı yakalar.

### mat-09-006
- zorluk: 2
- dogru: A
- dogrulama: (3 * (2^2 + 1) - 2) - ((3 * 1 - 2)^2 + 1)

**Soru:**
Gerçel sayılarda tanımlı $f(x) = 3x - 2$ ve $g(x) = x^2 + 1$ fonksiyonları için
$$(f \circ g)(2) - (g \circ f)(1)$$
işleminin sonucu kaçtır?

**Şıklar:**
A) 11
B) 9
C) 7
D) 5
E) 3

**Açıklama:**
Bileşke işlemlerinde içten dışa doğru gidilir:
$(f \circ g)(2) = f(g(2))$. Önce $g(2) = 2^2 + 1 = 5$, sonra $f(5) = 3 \cdot 5 - 2 = 13$.
$(g \circ f)(1) = g(f(1))$. Önce $f(1) = 3 \cdot 1 - 2 = 1$, sonra $g(1) = 1^2 + 1 = 2$.
Fark $13 - 2 = 11$ bulunur.

**Çeldirici Tuzağı:**
C şıkkı (7) veya B şıkkı (9), bileşke sırasını karıştırıp $(f \circ g)(2)$ yerine $g(f(2)) = 4^2 + 1 = 17$ ya da çıkarma işleminde değerleri ters sırada alan adayı yakalar.

### mat-09-007
- zorluk: 2
- dogru: C
- dogrulama: (2 * 4 + 1) / (4 - 3)

**Soru:**
Uygun tanım kümesinde bire bir ve örten olan
$$f(x) = \dfrac{3x + 1}{x - 2}$$
fonksiyonu için $f^{-1}(4)$ değeri kaçtır?

**Şıklar:**
A) $\dfrac{13}{2}$
B) 7
C) 9
D) $-7$
E) $\dfrac{7}{3}$

**Açıklama:**
$f^{-1}(4) = a$ demek $f(a) = 4$ demektir. Denklem yazılırsa $\dfrac{3a + 1}{a - 2} = 4 \Rightarrow 3a + 1 = 4a - 8 \Rightarrow a = 9$ bulunur. (Kısa yoldan $f^{-1}(x) = \dfrac{2x + 1}{x - 3}$ yazılarak $x = 4$ için $\dfrac{9}{1} = 9$ da elde edilir.)

**Çeldirici Tuzağı:**
A şıkkı ($\frac{13}{2}$), ters fonksiyon yerine doğrudan $f(4) = \dfrac{3 \cdot 4 + 1}{4 - 2} = \dfrac{13}{2}$ değerini hesaplayan adayı yakalar.

### mat-09-008
- zorluk: 3
- dogru: D
- dogrulama: (3 - (3 / 4) * 8) + ((3 - 6) * 4 / 3)

**Soru:**
Şekildeki dik koordinat düzleminde $y = f(x)$ doğrusal fonksiyonunun grafiği $A(0, 3)$ ve $B(4, 0)$ noktalarından geçmektedir.
Buna göre $f(8) + f^{-1}(6)$ toplamı kaçtır?

**Şekil:**
```json
{
  "kind": "geometry",
  "axes": { "x": [-2, 6], "y": [-2, 5], "step": 1, "grid": true },
  "points": { "A": [0, 3], "B": [4, 0] },
  "labelPos": { "A": "tr", "B": "tr" },
  "dots": ["A", "B"],
  "functions": [
    { "expr": "3 - 3x/4", "domain": [-2, 6], "label": "f", "labelAt": -1.3 }
  ]
}
```

**Şıklar:**
A) $-1$
B) $-3$
C) $-5$
D) $-7$
E) 1

**Açıklama:**
Doğru eksenleri $(4, 0)$ ve $(0, 3)$ noktalarında kestiğinden denklemi $\dfrac{x}{4} + \dfrac{y}{3} = 1 \Rightarrow y = f(x) = 3 - \dfrac{3}{4}x$ olur.
$x = 8$ için $f(8) = 3 - \dfrac{3}{4} \cdot 8 = 3 - 6 = -3$ bulunur.
$f^{-1}(6) = k$ için $f(k) = 6 \Rightarrow 3 - \dfrac{3}{4}k = 6 \Rightarrow -\dfrac{3}{4}k = 3 \Rightarrow k = -4$ bulunur.
Toplam $-3 + (-4) = -7$'dir.

**Çeldirici Tuzağı:**
A şıkkı ($-1$), $f^{-1}(6)$ yerine $f(6) = -\frac{3}{2}$ hesaplayan ya da $f^{-1}(6)$ adımında işaret hatası yaparak $k = +4$ alıp $-3 + 4 = 1$ (E şıkkı) bulan adayı yakalar.

### mat-09-009
- zorluk: 1
- dogru: B
- degerler: 16 | 18 | 19 | 20 | 22
- dogrulama: (14 + 100) % 24

**Soru:**
Şu an saat $14{:}00$'ı göstermektedir.
Buna göre $100$ saat sonra saat kaçı gösterir?

**Şıklar:**
A) 16:00
B) 18:00
C) 19:00
D) 20:00
E) 22:00

**Açıklama:**
Bir gün $24$ saat olduğundan saat $24$'ün katlarında aynı değeri gösterir. $100$ sayısının $24$ ile bölümünden kalan $100 = 24 \cdot 4 + 4$'tür. Şu anki saat olan $14{:}00$'a $4$ saat eklendiğinde saat $18{:}00$ bulunur.

**Çeldirici Tuzağı:**
D şıkkı (20:00), mod $24$ yerine yanlış bölme yapıp kalanı $6$ sanan veya $14$'ten geriye giderek farklı bir saate ulaşan adayı yakalar.

### mat-09-010
- zorluk: 2
- dogru: E
- dogrulama: (2^(53 % 3)) % 7

**Soru:**
$$2^{53}$$
sayısının $7$ ile bölümünden kalan kaçtır?

**Şıklar:**
A) 1
B) 2
C) 3
D) 5
E) 4

**Açıklama:**
$2$'nin kuvvetlerinin $7$ ile bölümünden kalanlar incelenir:
$2^1 \equiv 2$ (mod $7$),
$2^2 \equiv 4$ (mod $7$),
$2^3 = 8 \equiv 1$ (mod $7$).
Kalan $1$ olduğu için periyot $3$'tür. Üs olan $53$, periyot $3$'e bölünür: $53 = 3 \cdot 17 + 2$. Dolayısıyla $2^{53} \equiv 2^2 = 4$ (mod $7$) bulunur.

**Çeldirici Tuzağı:**
B şıkkı (2), periyodu $3$ almak yerine üs $53$'ü doğrudan bölen $7$'ye bölerek $53 = 7 \cdot 7 + 4$ (ya da mod $6$ alıp $2^5 = 32 \equiv 4$ yerine yanlış kalan) üzerinden hesap yapan adayı yakalar.

### mat-09-011
- zorluk: 1
- dogru: C
- dogrulama: 21 - (7 + 9)

**Soru:**
$A$ ve $B$ iki küme olmak üzere $s(A \setminus B) = 7$, $s(B \setminus A) = 9$ ve $s(A \cup B) = 21$'dir.
Buna göre $s(A \cap B)$ kaçtır?

**Şıklar:**
A) 2
B) 4
C) 5
D) 7
E) 16

**Açıklama:**
$A \cup B$ kümesi üç ayrık bölgenin birleşimidir: $s(A \cup B) = s(A \setminus B) + s(A \cap B) + s(B \setminus A)$. Verilenler yerine konursa $21 = 7 + s(A \cap B) + 9 \Rightarrow s(A \cap B) = 21 - 16 = 5$ bulunur.

**Çeldirici Tuzağı:**
E şıkkı (16), $A \setminus B$ ile $B \setminus A$'nın toplamını ($7 + 9 = 16$) bulup $21$'den çıkarmayı unutan adayı yakalar.

### mat-09-012
- zorluk: 1
- dogru: D
- dogrulama: 2^5 - 2^3

**Soru:**
$$A = \{1, 2, 3, 4, 5\} \quad \text{ve} \quad B = \{3, 4, 5, 6, 7\}$$
kümeleri verilmektedir.
Buna göre $A$ kümesinin alt kümelerinden kaç tanesi aynı zamanda **$B$ kümesinin alt kümesi değildir**?

**Şıklar:**
A) 8
B) 16
C) 23
D) 24
E) 25

**Açıklama:**
$A$ kümesinin tüm alt kümelerinin sayısı $2^5 = 32$'dir. Hem $A$'nın hem de $B$'nin alt kümesi olan kümeler, yalnızca kesişim kümesi $A \cap B = \{3, 4, 5\}$'in alt kümeleridir ve sayısı $2^3 = 8$'dir. Dolayısıyla $B$'nin alt kümesi olmayan $A$ alt kümelerinin sayısı $32 - 8 = 24$ bulunur.

**Çeldirici Tuzağı:**
A şıkkı ($8$), kesişim kümesinin alt küme sayısını bulup tümünden çıkarmayan; C şıkkı ($23$) ise boş kümeyi çıkarıp $2^5 - 1 - 8$ hesaplayan adayı yakalar.

### mat-09-013
- zorluk: 2
- dogru: B
- dogrulama: (26 - (6 + 4 + 2)) / 2 + 4 + 6

**Soru:**
Şekildeki Venn şemasında $26$ kişilik bir topluluğun A ve B etkinliklerine katılım sayıları gösterilmiştir.
Buna göre B etkinliğine katılan toplam kişi sayısı $s(B)$ kaçtır?

**Şekil:**
```json
{
  "kind": "venn",
  "universe": "E",
  "sets": ["A", "B"],
  "regions": { "A": "x", "AB": "6", "B": "x + 4", "out": "2" }
}
```

**Şıklar:**
A) 11
B) 17
C) 13
D) 15
E) 20

**Açıklama:**
Tüm bölgelerin eleman sayıları toplamı evrensel kümeyi ($26$) verir: $x + 6 + (x + 4) + 2 = 26 \Rightarrow 2x + 12 = 26 \Rightarrow 2x = 14 \Rightarrow x = 7$. B kümesi hem yalnızca B ($x + 4 = 11$) hem de kesişim ($6$) bölgesini kapsadığından $s(B) = 11 + 6 = 17$ bulunur.

**Çeldirici Tuzağı:**
A şıkkı (11), $s(B)$ yerine yalnızca B'ye katılanları ($s(B \setminus A) = 7 + 4 = 11$) işaretleyen adayı yakalar.

### mat-09-014
- zorluk: 2
- dogru: D
- dogrulama: floor(80 / 3) - floor(80 / lcm(3, 5))

**Soru:**
$1$'den $80$'e kadar olan doğal sayılar içinde $3$'ün katı olanların kümesi $A$, $5$'in katı olanların kümesi $B$'dir.
Buna göre $s(A \setminus B)$ kaçtır?

**Şıklar:**
A) 16
B) 18
C) 20
D) 21
E) 26

**Açıklama:**
$1$ ile $80$ arasında $3$'ün katı olan $\lfloor 80 \div 3 \rfloor = 26$ tane sayı vardır ($s(A) = 26$). $A \cap B$ kümesi hem $3$'ün hem $5$'in katı yani $15$'in katı olan sayılardır: $\lfloor 80 \div 15 \rfloor = 5$ tane. $A \setminus B$, $A$'da olup $B$'de olmayanlar olduğundan $s(A \setminus B) = 26 - 5 = 21$ bulunur.

**Çeldirici Tuzağı:**
E şıkkı (26), tüm $A$ kümesinin eleman sayısını bulup kesişimdeki $15$'in katlarını çıkarmayı unutan adayı yakalar.

### mat-09-015
- zorluk: 1
- dogru: A
- dogrulama: (1 + 2) * (-3)

**Soru:**
Gerçel sayılarda tanımlı
$$f(x) = (a - 2)x + b + 3$$
fonksiyonu birim fonksiyon olduğuna göre $a \cdot b$ çarpımı kaçtır?

**Şıklar:**
A) $-9$
B) $-6$
C) $0$
D) $6$
E) $9$

**Açıklama:**
Birim fonksiyon her $x$ için $f(x) = x$ (yani $1 \cdot x + 0$) biçimindedir. Katsayılar eşitlenirse $a - 2 = 1 \Rightarrow a = 3$ ve sabit terim $b + 3 = 0 \Rightarrow b = -3$ bulunur. Çarpım $a \cdot b = 3 \cdot (-3) = -9$'dur.

**Çeldirici Tuzağı:**
B şıkkı ($-6$), birim fonksiyonu sabit fonksiyonla ($f(x) = c$, $a - 2 = 0$) karıştırıp $a = 2$ alan adayı yakalar.

### mat-09-016
- zorluk: 2
- dogru: D
- dogrulama: (2 * 1 + 1) + (4^2 - 4)

**Soru:**
Gerçel sayılar kümesinde tanımlı $f$ parçalı fonksiyonu için
$x < 3$ iken $f(x) = 2x + 1$,
$x \ge 3$ iken $f(x) = x^2 - 4$
kuralları geçerlidir.
Buna göre $f(1) + f(4)$ toplamı kaçtır?

**Şıklar:**
A) 1
B) 9
C) 12
D) 15
E) 18

**Açıklama:**
$1 < 3$ olduğundan $f(1)$ için ilk kural uygulanır: $f(1) = 2 \cdot 1 + 1 = 3$.
$4 \ge 3$ olduğundan $f(4)$ için ikinci kural uygulanır: $f(4) = 4^2 - 4 = 12$.
Toplam $f(1) + f(4) = 3 + 12 = 15$ bulunur.

**Çeldirici Tuzağı:**
C şıkkı (12), $f(1)$'i hesaplarken ikinci kuralı kullanıp $1^2 - 4 = -3$ veya $f(1)$'i toplamaya katmayan adayı yakalar.

### mat-09-017
- zorluk: 2
- dogru: C
- dogrulama: (1^2 - 4)^2 - 4

**Soru:**
Şekildeki dik koordinat düzleminde grafiği verilen $f(x) = a(x^2 - 4)$ parabolü $A(-2, 0)$, $B(2, 0)$ ve $C(0, -4)$ noktalarından geçmektedir.
Buna göre $(f \circ f)(1)$ değeri kaçtır?

**Şekil:**
```json
{
  "kind": "geometry",
  "width": 340,
  "height": 340,
  "axes": { "x": [-3, 3], "y": [-5, 5], "step": 1, "grid": true },
  "points": { "A": [-2, 0], "B": [2, 0], "C": [0, -4] },
  "labelPos": { "A": "tl", "B": "tr", "C": "br" },
  "dots": ["A", "B", "C"],
  "functions": [
    { "expr": "x^2 - 4", "domain": [-2.9, 2.9], "label": "f", "labelAt": 2.7 }
  ]
}
```

**Şıklar:**
A) $-3$
B) $0$
C) $5$
D) $9$
E) $12$

**Açıklama:**
$C(0, -4)$ noktası denklemde yerine konursa $f(0) = a(0 - 4) = -4 \Rightarrow a = 1$ bulunur; yani $f(x) = x^2 - 4$'tür. İstenen bileşke değerde önce $f(1) = 1^2 - 4 = -3$ hesaplanır, ardından $f(-3) = (-3)^2 - 4 = 9 - 4 = 5$ bulunur.

**Çeldirici Tuzağı:**
A şıkkı ($-3$), yalnızca $f(1) = -3$'ü bulup ikinci kez $f$'ye uygulamayı unutan adayı yakalar.

### mat-09-018
- zorluk: 2
- dogru: B
- dogrulama: 6 * ((7 - 1) / 2) - 5

**Soru:**
Gerçel sayılarda tanımlı fonksiyonlar için $(f \circ g)(x) = 6x - 5$ ve $g(x) = 2x + 1$ eşitlikleri veriliyor.
Buna göre $f(7)$ değeri kaçtır?

**Şıklar:**
A) 7
B) 13
C) 15
D) 37
E) 85

**Açıklama:**
$(f \circ g)(x) = f(g(x)) = 6x - 5$ olduğundan $f(2x + 1) = 6x - 5$ yazılır. Parantez içinin $7$ olması için $2x + 1 = 7 \Rightarrow 2x = 6 \Rightarrow x = 3$ konur. Buradan $f(7) = 6 \cdot 3 - 5 = 18 - 5 = 13$ bulunur.

**Çeldirici Tuzağı:**
D şıkkı (37), $2x + 1 = 7$ çözmeden doğrudan $x = 7$ yazarak $6 \cdot 7 - 5 = 37$ hesaplayan adayı yakalar.

### mat-09-019
- zorluk: 3
- dogru: E
- dogrulama: (15 - 2 * 3) / (1 - 4)

**Soru:**
Gerçel sayılar kümesinde tanımlı $f$ fonksiyonu her $x$ gerçel sayısı için
$$f(x) + 2f(-x) = 3x + 9$$
eşitliğini sağlamaktadır.
Buna göre $f(2)$ değeri kaçtır?

**Şıklar:**
A) $-9$
B) $-1$
C) $3$
D) $9$
E) $-3$

**Açıklama:**
Denklemde sırasıyla $x = 2$ ve $x = -2$ yazılır:
$x = 2$ için $f(2) + 2f(-2) = 3(2) + 9 = 15$.
$x = -2$ için $f(-2) + 2f(2) = 3(-2) + 9 = 3$.
İkinci denklem $-2$ ile çarpılıp birinci denklemle toplanırsa $(f(2) + 2f(-2)) + (-2f(-2) - 4f(2)) = 15 - 6 \Rightarrow -3f(2) = 9 \Rightarrow f(2) = -3$ bulunur.

**Çeldirici Tuzağı:**
D şıkkı (9), denklem sistemini çözerken $f(2)$ yerine $f(-2) = 9$ değerini bulan ya da $-3f(2) = 9$ adımında işareti unutan adayı yakalar.

### mat-09-020
- zorluk: 1
- dogru: B
- dogrulama: ((4 + 3) % 5 * ((4 + 4) % 5)) % 5

**Soru:**
$A = \{0, 1, 2, 3, 4\}$ kümesi üzerinde $\Delta$ ve $\circ$ işlemleri her $a, b \in A$ için:
- $a \Delta b$: "$a + b$ toplamının $5$ ile bölümünden kalan"
- $a \circ b$: "$a \cdot b$ çarpımının $5$ ile bölümünden kalan"
biçiminde tanımlanıyor.
Buna göre $(4 \Delta 3) \circ (4 \Delta 4)$ işleminin sonucu kaçtır?

**Şıklar:**
A) 0
B) 1
C) 2
D) 3
E) 4

**Açıklama:**
Parantez içindeki modüler toplama işlemleri ayrı ayrı hesaplanır:
- $4 + 3 = 7$ olduğundan $4 \Delta 3 = 2$ (mod $5$),
- $4 + 4 = 8$ olduğundan $4 \Delta 4 = 3$ (mod $5$).
Ardından çarpma işlemi uygulanır: $2 \cdot 3 = 6$ olup $5$ ile bölümünden kalan $1$ bulunur.

**Çeldirici Tuzağı:**
D şıkkı ($3$) veya C şıkkı ($2$), mod $5$ yerine kalanları farklı bir modda hesaplayan veya parantezlerdeki $\Delta$ işlemi yerine çarpma yapan adayı yakalar.

### mat-09-021
- zorluk: 2
- dogru: D
- dogrulama: yok

**Soru:**
`KADROKADROKADRO...` biçiminde harfleri belirli bir düzende tekrar eden dizinin baştan $138$. sıradaki harfi aşağıdakilerden hangisidir?

**Şıklar:**
A) K
B) A
C) R
D) D
E) O

**Açıklama:**
Tekrar eden blok `KADRO` olup $5$ harften oluşmaktadır. $138$ sayısı blok uzunluğu olan $5$'e bölünür: $138 = 5 \cdot 27 + 3$. Kalan $3$ olduğundan bloğun $3$. harfi olan D harfi bulunur ($1$: K, $2$: A, $3$: D, $4$: R, $5$: O).

**Çeldirici Tuzağı:**
C şıkkı (R) veya B şıkkı (A), sıfır tabanlı indeksleme gibi kayma yapıp $2$. veya $4$. harfi seçen adayı yakalar.

### mat-09-022
- zorluk: 3
- dogru: A
- dogrulama: ((3^(40 % 4)) % 5 + (4^(25 % 2)) % 5) % 5

**Soru:**
$$3^{40} + 4^{25}$$
toplamının $5$ ile bölümünden kalan kaçtır?

**Şıklar:**
A) 0
B) 1
C) 2
D) 3
E) 4

**Açıklama:**
İki terimin $5$ ile bölümünden kalanlar ayrı ayrı bulunur:
$3$'ün kuvvetleri mod $5$'te $3^1 \equiv 3$, $3^2 \equiv 4$, $3^3 \equiv 2$, $3^4 \equiv 1$ olarak $4$'lük periyoda sahiptir. $40$ sayısı $4$'ün tam katı olduğundan $3^{40} \equiv 1$ (mod $5$) olur.
$4 \equiv -1$ (mod $5$) olduğundan $4^{25} \equiv (-1)^{25} = -1 \equiv 4$ (mod $5$) olur.
İki kalanın toplamı $1 + 4 = 5 \equiv 0$ (mod $5$) bulunur.

**Çeldirici Tuzağı:**
C şıkkı (2), $4 \equiv -1$ yerine $4$'ün tüm kuvvetlerinin kalanını $4$ veya $1$ sanıp $1 + 1 = 2$ bulan adayı yakalar.


### mat-09-023
- zorluk: 1
- dogru: C
- dogrulama: yok

**Soru:**
$A$ ve $B$ iki küme olmak üzere $s(A \setminus B) = 4$, $s(B \setminus A) = 7$ ve $s(A \cup B) = 15$'tir.
Buna göre,
I. $s(A \cap B) = 4$'tür.
II. $s(A) + s(B) = 15$'tir.
III. $A$ ve $B$ ayrık kümeler değildir.
ifadelerinden hangileri doğrudur?

**Şıklar:**
A) Yalnız I
B) Yalnız II
C) I ve III
D) I ve II
E) I, II ve III

**Açıklama:**
Birleşim kümesi üç ayrık bölgeden oluşur: $s(A \cup B) = s(A \setminus B) + s(A \cap B) + s(B \setminus A)$.
Buradan $15 = 4 + s(A \cap B) + 7 \Rightarrow s(A \cap B) = 4$ bulunur (I doğru). Kesişim kümesi boş olmadığından $A$ ve $B$ ayrık kümeler değildir (III doğru). Diğer yandan $s(A) = 4 + 4 = 8$ ve $s(B) = 7 + 4 = 11$ olduğundan $s(A) + s(B) = 19 \neq 15$'tir (II yanlış).

**Çeldirici Tuzağı:**
E şıkkı (I, II ve III), $s(A) + s(B)$ toplamını $s(A \cup B)$ ile özdeş sanıp kesişim elemanlarını ikinci kez eklemeyi unutan adayı yakalar.

### mat-09-024
- zorluk: 2
- dogru: C
- dogrulama: 6 + (42 - 6 - 3 - 9) / 3 + 3

**Soru:**
Şekildeki Venn şemasında ayrık bölgelerin eleman sayıları verilmiştir. Evrensel küme $s(E) = 42$ olduğuna göre $s(B)$ kaçtır?

**Şekil:**
```json
{
  "kind": "venn",
  "universe": "E",
  "sets": ["A", "B"],
  "regions": { "A": "2x", "AB": "6", "B": "x + 3", "out": "9" }
}
```

**Şıklar:**
A) 8
B) 11
C) 17
D) 22
E) 24

**Açıklama:**
Evrensel kümenin eleman sayısı şemadaki dört ayrık bölgenin toplamına eşittir:
$$2x + 6 + (x + 3) + 9 = 42 \Rightarrow 3x + 18 = 42 \Rightarrow 3x = 24 \Rightarrow x = 8$$
$B$ kümesi $A \cap B$ ile $B \setminus A$ bölgelerinden oluştuğundan $s(B) = 6 + (8 + 3) = 6 + 11 = 17$ bulunur.

**Çeldirici Tuzağı:**
B şıkkı ($11$), $x = 8$'i doğru bulduktan sonra $s(B)$ yerine yalnızca $s(B \setminus A) = x + 3 = 11$ bölgesini alan; A şıkkı ($8$) ise doğrudan $x$'i işaretleyen adayı yakalar.

### mat-09-025
- zorluk: 2
- dogru: E
- dogrulama: (28 / 7 + 35 / 7 - 1) * 7

**Soru:**
$A$, $B$ ve $C$ kümeleri için $s(B) > 1$, $s(A \times B) = 28$, $s(C \times B) = 35$ ve $s(A \cap C) = 1$ veriliyor.
Buna göre $s((A \cup C) \times B)$ kaçtır?

**Şıklar:**
A) 35
B) 42
C) 49
D) 54
E) 56

**Açıklama:**
$s(A \times B) = s(A) \cdot s(B) = 28$ ve $s(C \times B) = s(C) \cdot s(B) = 35$ olduğundan $s(B)$ hem $28$'i hem de $35$'i bölen $1$'den büyük tam sayı olmalıdır: $\text{EBOB}(28, 35) = 7 \Rightarrow s(B) = 7$.
Buradan $s(A) = \dfrac{28}{7} = 4$ ve $s(C) = \dfrac{35}{7} = 5$ bulunur.
$s(A \cup C) = s(A) + s(C) - s(A \cap C) = 4 + 5 - 1 = 8$ olduğundan $s((A \cup C) \times B) = 8 \cdot 7 = 56$ elde edilir.

**Çeldirici Tuzağı:**
B şıkkı ($42$) veya C şıkkı ($49$), $s(A \cap C) = 1$ ortak elemanını çıkarırken veya $s(B) = 7$ çarpanını uygularken işlem hatası yapan; ya da $63$ ($9 \cdot 7$) doğrultusunda ortak elemanı unutarak yanılgıya düşen adayları hedefler.

### mat-09-026
- zorluk: 1
- dogru: A
- dogrulama: yok

**Soru:**
Gerçel sayılarda tanımlı $f(x) = 3x - 2$ fonksiyonu verilmektedir.
Buna göre $f(2x + 1)$ ifadesinin $f(x)$ türünden eşiti aşağıdakilerden hangisidir?

**Şıklar:**
A) $2f(x) + 5$
B) $2f(x) + 1$
C) $2f(x) - 1$
D) $3f(x) + 5$
E) $2f(x) + 3$

**Açıklama:**
Verilen tanımdan $3x = f(x) + 2$ çekilir. İstenen ifade açıldığında:
$$f(2x + 1) = 3(2x + 1) - 2 = 6x + 3 - 2 = 2(3x) + 1$$
Burada $3x = f(x) + 2$ yerine yazılırsa $2(f(x) + 2) + 1 = 2f(x) + 5$ elde edilir.

**Çeldirici Tuzağı:**
B şıkkı ($2f(x) + 1$), yalnızca $6x$'i $2f(x)$ yerine koyup $3x = f(x) + 2$ eşitliğindeki $+2$ sabitini çarpmayı unutan adayı yakalar.

### mat-09-027
- zorluk: 2
- dogru: B
- dogrulama: 4 + 3 + 2 + (38 - (8 + 6 + 7 + 4 + 3 + 2 + 3))

**Soru:**
$38$ öğrencinin bulunduğu bir sınıfta İngilizce (İ), Almanca (A) ve Fransızca (F) dillerini bilenlerin dağılımı aşağıdaki Venn şemasında verilmiştir.
Buna göre bu sınıfta bu üç dilden **en az ikisini** bilen toplam kaç öğrenci vardır?

**Şekil:**
```json
{
  "kind": "venn",
  "universe": "E",
  "sets": ["İ", "A", "F"],
  "regions": {
    "A": "8",
    "B": "6",
    "C": "7",
    "AB": "4",
    "AC": "3",
    "BC": "2",
    "ABC": "x",
    "out": "3"
  }
}
```

**Şıklar:**
A) 12
B) 14
C) 15
D) 16
E) 19

**Açıklama:**
Tüm bölgelerin toplamı $38$'i vermelidir:
$$8 + 6 + 7 + 4 + 3 + 2 + x + 3 = 38 \Rightarrow 33 + x = 38 \Rightarrow x = 5$$
En az iki dil bilen öğrenciler ikişerli kesişim bölgeleri ile üçlü kesişim bölgesinde yer alır: $4 + 3 + 2 + x = 4 + 3 + 2 + 5 = 14$ kişi bulunur.

**Çeldirici Tuzağı:**
E şıkkı ($19$), $x = 5$'i doğru bulduktan sonra "en az iki dil" yerine dıştaki $3$ kişiyi veya yalnızca tek dil bilen bir bölgeyi yanlışlıkla toplama dahil edenleri; A şıkkı ($12$) ise üçlü kesişimi saymayanları yakalar.

### mat-09-028
- zorluk: 2
- dogru: D
- dogrulama: 19 + (8 - 5) * ((19 - 7) / (5 - 2))

**Soru:**
Gerçel sayılarda tanımlı $f$ doğrusal bir fonksiyon olup $f(2) = 7$ ve $f(5) = 19$ eşitliklerini sağlamaktadır.
Buna göre $f(8)$ değeri kaçtır?

**Şıklar:**
A) 23
B) 25
C) 27
D) 31
E) 35

**Açıklama:**
Doğrusal fonksiyon $f(x) = ax + b$ biçimindedir. Tanım kümesindeki değişime oranla değer artışı sabittir:
$$a = \frac{f(5) - f(2)}{5 - 2} = \frac{19 - 7}{3} = 4$$
$x = 5$'ten $x = 8$'e $3$ birimlik artış olduğunda fonksiyon değeri $3 \cdot 4 = 12$ artar: $f(8) = 19 + 12 = 31$ bulunur.

**Çeldirici Tuzağı:**
C şıkkı ($27$), $x$'in $5$'ten $8$'e $3$ birim artmasını gözden kaçırıp sabit artış miktarı olan $12$'yi değil $8$'i ekleyen adayı; E şıkkı ($35$) ise bir adım fazla ekleyenleri yakalar.

### mat-09-029
- zorluk: 3
- dogru: A
- dogrulama: 4 * (((((5 + 4) / 3) + 2) + 1) / 2) + 5

**Soru:**
Gerçel sayılarda tanımlı $f$ ve bire bir örten $g$ fonksiyonları için
$$f(2x - 1) = 4x + 5$$
$$g^{-1}(x + 2) = 3x - 4$$
eşitlikleri veriliyor.
Buna göre $(f \circ g)(5)$ değeri kaçtır?

**Şıklar:**
A) 17
B) 19
C) 21
D) 23
E) 25

**Açıklama:**
Önce $g(5)$ değeri bulunur. $g^{-1}(x + 2) = 3x - 4 \Leftrightarrow g(3x - 4) = x + 2$ olduğundan parantez içini $5$'e eşitleyen $x$ aranır: $3x - 4 = 5 \Rightarrow 3x = 9 \Rightarrow x = 3$. Buradan $g(5) = 3 + 2 = 5$ elde edilir.
Şimdi $(f \circ g)(5) = f(g(5)) = f(5)$ hesaplanır. $f(2x - 1) = 4x + 5$ eşitliğinde $2x - 1 = 5 \Rightarrow x = 3$ konursa $f(5) = 4(3) + 5 = 17$ bulunur.

**Çeldirici Tuzağı:**
E şıkkı ($25$), $f(5)$'i hesaplarken $2x - 1 = 5$ denklemini çözmeden doğrudan $x = 5$ koyarak $4 \cdot 5 + 5 = 25$ yazan; B şıkkı ($19$) ise $g^{-1}$ ters dönüşümünde $x + 2$ yerine doğrudan $5 + 2$ koyan adayı yakalar.

### mat-09-030
- zorluk: 1
- dogru: E
- dogrulama: (15 + 100) % 24

**Soru:**
Bir deney sayacı $0$'dan $23$'e kadar tam saatleri göstermekte, $23$'ten bir saat sonra tekrar $0$'a dönmektedir. Sayaç şu an $15$'i gösterdiğine göre $100$ saat sonra kaçı gösterir?

**Şıklar:**
A) 11
B) 13
C) 15
D) 17
E) 19

**Açıklama:**
Sayaç $24$ saatte bir aynı değere döndüğünden $100$ sayısı $24$'e bölünür: $100 = 24 \cdot 4 + 4$, kalan $4$'tür. Şu an $15$'te bulunan sayaca $4$ saat eklenirse $15 + 4 = 19$ bulunur.

**Çeldirici Tuzağı:**
A şıkkı ($11$), $4$ saati eklemek yerine $15$'ten $4$ çıkararak $11$ bulan; C şıkkı ($15$) ise $100$'ü yanlışlıkla $24$'ün değil $25$'in tam katı sanan adayı yakalar.

### mat-09-031
- zorluk: 2
- dogru: D
- dogrulama: ((3 * 2 + 5 + 2 - 3) / 2) * ((3 * 2 + 5 - (2 - 3)) / 2)

**Soru:**
Gerçel sayılarda tanımlı $f$ ve $g$ fonksiyonları için
$$(f + g)(x) = 3x + 5 \quad \text{ve} \quad (f - g)(x) = x - 3$$
eşitlikleri verilmektedir.
Buna göre $(f \cdot g)(2)$ değeri kaçtır?

**Şıklar:**
A) 11
B) 18
C) 24
D) 30
E) 36

**Açıklama:**
Verilen her iki eşitlikte de $x = 2$ yazılır:
- $f(2) + g(2) = 3(2) + 5 = 11$
- $f(2) - g(2) = 2 - 3 = -1$
Bu iki denklem taraf tarafa toplanırsa $2f(2) = 10 \Rightarrow f(2) = 5$ bulunur. Buradan $g(2) = 11 - 5 = 6$ olur. Çarpımları $(f \cdot g)(2) = f(2) \cdot g(2) = 5 \cdot 6 = 30$'dur.

**Çeldirici Tuzağı:**
A şıkkı ($11$), $f(2) = 5$ ve $g(2) = 6$ değerlerini bulduktan sonra çarpım yerine $f(2) + g(2)$ toplamını işaretleyen adayı yakalar.

### mat-09-032
- zorluk: 1
- dogru: D
- dogrulama: 32 - (12 + 9 + 4)

**Soru:**
Şekildeki Venn şemasında ayrık bölgelerdeki eleman sayıları verilmiştir. Evrensel küme $s(E) = 32$ olduğuna göre $s(A \cap B)$ kaçtır?

**Şekil:**
```json
{
  "kind": "venn",
  "universe": "E",
  "sets": ["A", "B"],
  "regions": { "A": "12", "AB": "x", "B": "9", "out": "4" }
}
```

**Şıklar:**
A) 4
B) 5
C) 6
D) 7
E) 8

**Açıklama:**
Şemadaki dört ayrık bölgenin toplamı evrensel küme eleman sayısına eşittir:
$$12 + x + 9 + 4 = 32 \Rightarrow 25 + x = 32 \Rightarrow x = 7$$
Buna göre $s(A \cap B) = 7$'dir.

**Çeldirici Tuzağı:**
A şıkkı ($4$) veya B şıkkı ($5$), toplama yaparken dıştaki $4$ elemanını hesaba katmayıp çıkarma hatası yapan veya $x$ yerine başka bir bölgeyi seçen adayı yakalar.

### mat-09-033
- zorluk: 2
- dogru: E
- dogrulama: yok

**Soru:**
Gerçel sayılarda tanımlı $f$ çift fonksiyon, $g$ ise tek fonksiyon olup $f(3) = 4$ ve $g(-2) = 5$ verilmektedir.
Buna göre,
I. $f(-3) + g(2) = 9$
II. $h(x) = f(x) \cdot g(x)$ tek fonksiyondur.
III. $f(-3) \cdot g(2) = -20$
ifadelerinden hangileri doğrudur?

**Şıklar:**
A) Yalnız I
B) Yalnız II
C) I ve II
D) I ve III
E) II ve III

**Açıklama:**
$f$ çift fonksiyon olduğu için $f(-3) = f(3) = 4$'tür. $g$ tek fonksiyon olduğu için $g(-2) = -g(2) = 5 \Rightarrow g(2) = -5$ bulunur.
- I: $f(-3) + g(2) = 4 + (-5) = -1 \neq 9$ (yanlış).
- II: $h(-x) = f(-x) \cdot g(-x) = f(x) \cdot (-g(x)) = -h(x)$ olduğundan $h$ tek fonksiyondur (doğru).
- III: $f(-3) \cdot g(2) = 4 \cdot (-5) = -20$ (doğru).

**Çeldirici Tuzağı:**
C şıkkı (I ve II), tek fonksiyonda $g(-2) = 5$ iken $g(2)$'yi işaret değiştirmeden $+5$ sanıp $4 + 5 = 9$ bulan adayı yakalar.

### mat-09-034
- zorluk: 3
- dogru: B
- dogrulama: 3 + 2 * (9 * 10 / 2)

**Soru:**
Pozitif tam sayılarda tanımlı bir $f$ fonksiyonu her $n$ pozitif tam sayısı için
$$f(n + 1) = f(n) + 2n$$
eşitliğini sağlamaktadır. $f(1) = 3$ olduğuna göre $f(10)$ değeri kaçtır?

**Şıklar:**
A) 83
B) 93
C) 95
D) 103
E) 113

**Açıklama:**
$n = 1, 2, \ldots, 9$ için eşitlik alt alta yazılıp taraf tarafa toplanır (teleskopik toplam):
$$f(2) - f(1) = 2 \cdot 1$$
$$f(3) - f(2) = 2 \cdot 2$$
$$f(10) - f(9) = 2 \cdot 9$$
Taraf tarafa toplandığında aradaki terimler birbirini götürür ve $f(10) - f(1) = 2(1 + 2 + \cdots + 9)$ elde edilir. $1$'den $9$'a kadar toplam $\dfrac{9 \cdot 10}{2} = 45$ olduğundan $f(10) - 3 = 2 \cdot 45 = 90 \Rightarrow f(10) = 93$ bulunur.

**Çeldirici Tuzağı:**
D şıkkı ($103$) veya E şıkkı ($113$), teleskopik toplamın son teriminde $n = 9$ yerine $n = 10$ alarak $1$'den $10$'a kadar ($55 \cdot 2 = 110 \Rightarrow 113$) toplayan adayı yakalar.

### mat-09-035
- zorluk: 3
- dogru: E
- dogrulama: log2(384 / 3) * (log2(384 / 3) + 8 - 11)

**Soru:**
Bir $A$ kümesinin eleman sayısı $2$ artırıldığında alt küme sayısı $384$ artmaktadır. $s(B) = 8$ ve $s(A \cup B) = 11$ olduğuna göre $s(A \times (A \cap B))$ kaçtır?

**Şıklar:**
A) 14
B) 18
C) 21
D) 24
E) 28

**Açıklama:**
$s(A) = n$ olsun. Eleman sayısı $2$ artırıldığında alt küme sayısı farkı:
$$2^{n + 2} - 2^n = 384 \Rightarrow 2^n(4 - 1) = 384 \Rightarrow 3 \cdot 2^n = 384 \Rightarrow 2^n = 128 \Rightarrow n = 7$$
Böylece $s(A) = 7$ bulunur. Birleşim formülünden $11 = 7 + 8 - s(A \cap B) \Rightarrow s(A \cap B) = 4$ elde edilir. Sonuç olarak $s(A \times (A \cap B)) = s(A) \cdot s(A \cap B) = 7 \cdot 4 = 28$'dir.

**Çeldirici Tuzağı:**
C şıkkı ($21$) veya D şıkkı ($24$), $2^n = 128$ değerinden $n = 6$ gibi üs hatası yapan ya da Kartezyen çarpım eleman sayısında toplama yaparak yanlış sonuca ulaşan adayı yakalar.


### mat-09-036
- zorluk: 1
- dogru: B
- dogrulama: 36 - 6 + (36 - 10 - 12 - 6)

**Soru:**
Şekildeki Venn şemasında ayrık bölgelerin eleman sayıları verilmiştir. Evrensel küme $s(E) = 36$ olduğuna göre $s(A) + s(B)$ toplamı kaçtır?

**Şekil:**
```json
{
  "kind": "venn",
  "universe": "E",
  "sets": ["A", "B"],
  "regions": { "A": "10", "AB": "x", "B": "12", "out": "6" }
}
```

**Şıklar:**
A) 30
B) 38
C) 32
D) 36
E) 44

**Açıklama:**
Tüm ayrık bölgelerin toplamı $36$ olmalıdır: $10 + x + 12 + 6 = 36 \Rightarrow 28 + x = 36 \Rightarrow x = 8$.
Buradan $s(A) = 10 + 8 = 18$ ve $s(B) = 12 + 8 = 20$ bulunur. Toplam $s(A) + s(B) = 18 + 20 = 38$'dir.

**Çeldirici Tuzağı:**
A şıkkı ($30$), $s(A) + s(B)$ yerine $s(A \cup B) = 36 - 6 = 30$ değerini işaretleyen (kesişimdeki $x = 8$'i ikinci kez saymayı unutan) adayı yakalar.

### mat-09-037
- zorluk: 2
- dogru: A
- dogrulama: (2 * 4 + 6) + ((2 - 6) / 2)

**Soru:**
Şekildeki dik koordinat düzleminde $y = f(x)$ doğrusal fonksiyonunun grafiği $A(-3, 0)$ ve $B(0, 6)$ noktalarından geçmektedir.
Buna göre $f(4) + f^{-1}(2)$ toplamı kaçtır?

**Şekil:**
```json
{
  "kind": "geometry",
  "axes": { "x": [-4, 4], "y": [-1, 8], "step": 2, "grid": true },
  "points": { "A": [-3, 0], "B": [0, 6] },
  "labelPos": { "A": "tl", "B": "right" },
  "dots": ["A", "B"],
  "functions": [
    { "expr": "2x + 6", "domain": [-3.4, 0.8], "label": "f", "labelAt": -1.2 }
  ]
}
```

**Şıklar:**
A) 12
B) 10
C) 14
D) 16
E) 18

**Açıklama:**
Eksenleri $(-3, 0)$ ve $(0, 6)$ noktalarında kesen doğrunun denklemi $\dfrac{x}{-3} + \dfrac{y}{6} = 1 \Rightarrow y = 2x + 6$'dır; yani $f(x) = 2x + 6$.
- $f(4) = 2 \cdot 4 + 6 = 14$.
- $f^{-1}(2) = a \Leftrightarrow 2a + 6 = 2 \Rightarrow 2a = -4 \Rightarrow a = -2$.
Toplam $14 + (-2) = 12$ bulunur.

**Çeldirici Tuzağı:**
D şıkkı ($16$), $2a + 6 = 2$ denkleminden $a = -2$ yerine $+2$ alıp $14 + 2 = 16$ hesaplayan adayı yakalar.

### mat-09-038
- zorluk: 2
- dogru: C
- dogrulama: ((6 - 1) + 2) + (6 - 4)

**Soru:**
Şekildeki dik koordinat düzleminde $f$ ve $g$ doğrusal fonksiyonlarının grafikleri $C(2, 4)$ noktasında kesişmektedir. $f$ doğrusu $(-2, 0)$ ve $(0, 2)$ noktalarından, $g$ doğrusu ise $(0, 6)$ ve $(6, 0)$ noktalarından geçmektedir.
Buna göre $(f \circ g)(1) + g^{-1}(4)$ toplamı kaçtır?

**Şekil:**
```json
{
  "kind": "geometry",
  "axes": { "x": [-3, 7], "y": [-1, 7], "step": 2, "grid": true },
  "points": { "C": [2, 4] },
  "labelPos": { "C": "top" },
  "dots": ["C"],
  "functions": [
    { "expr": "x + 2", "domain": [-2.4, 4.4], "label": "f", "labelAt": 3.8 },
    { "expr": "6 - x", "domain": [-0.4, 6.4], "label": "g", "labelAt": 4.8 }
  ]
}
```

**Şıklar:**
A) 5
B) 7
C) 9
D) 11
E) 13

**Açıklama:**
Grafikten doğrunun denklemleri yazılır: $f(x) = x + 2$ ve $g(x) = 6 - x$.
- $(f \circ g)(1) = f(g(1)) = f(6 - 1) = f(5) = 5 + 2 = 7$.
- $g(2) = 4$ ($C(2, 4)$ noktası grafik üzerinde) olduğundan $g^{-1}(4) = 2$'dir.
Toplam $7 + 2 = 9$ bulunur.

**Çeldirici Tuzağı:**
B şıkkı ($7$), yalnızca $(f \circ g)(1) = 7$ değerini hesaplayıp $g^{-1}(4) = 2$'yi eklemeyi unutan adayı; E şıkkı ($13$) ise $g^{-1}(4)$ yerine $g(4)$ veya ters sırada $(g \circ f)(1)$ alanları yakalar.

### mat-09-039
- zorluk: 2
- dogru: D
- dogrulama: 9 + 4 + 7

**Soru:**
Şekildeki Venn şemasında ayrık bölgelerdeki eleman sayıları verilmiştir.
Buna göre $s((A \cup B) \setminus C)$ kaçtır?

**Şekil:**
```json
{
  "kind": "venn",
  "universe": "E",
  "sets": ["A", "B", "C"],
  "regions": {
    "A": "9",
    "B": "7",
    "C": "6",
    "AB": "4",
    "AC": "3",
    "BC": "2",
    "ABC": "3",
    "out": "5"
  }
}
```

**Şıklar:**
A) 16
B) 18
C) 19
D) 20
E) 25

**Açıklama:**
$(A \cup B) \setminus C$ kümesi, $A$ veya $B$'nin içinde olup $C$ kümesinin dışında kalan bölgelerden oluşur. Bunlar sırasıyla yalnızca $A$ ($9$), yalnızca $A \cap B$ ($4$) ve yalnızca $B$ ($7$) bölgeleridir. Toplam eleman sayısı $9 + 4 + 7 = 20$ bulunur.

**Çeldirici Tuzağı:**
A şıkkı ($16$), ikişerli kesişim olan $AB = 4$ bölgesini çıkarmayıp yalnızca $9 + 7 = 16$ alan adayı; E şıkkı ($25$) ise dıştaki $5$ veya $C$'nin içindeki bir bölgeyi de ekleyenleri yakalar.

### mat-09-040
- zorluk: 3
- dogru: E
- dogrulama: (3 * ((3 * ((3 * ((3 * ((3 * (2025 % 7) + 1) % 7) + 1) % 7) + 1) % 7) + 1) % 7) + 1) % 7

**Soru:**
Şekildeki işlem makinesine girilen sayıya ok üzerindeki işlem uygulanıp $7$ ile bölümünden kalan $y$ değeri elde edilmekte, ardından bu $y$ değeri tekrar girişe verilerek sistem art arda çalıştırılmaktadır.
Başlangıçta girişe $x = 2025$ yazıldığında **$29.$ turun sonunda** çıkışta hangi $y$ değeri görülür?

**Şekil:**
```json
{
  "kind": "flow",
  "nodes": [
    { "id": "in", "text": "x", "at": [0, 0], "shape": "circle" },
    { "id": "a", "text": "3x + 1", "at": [1.8, 0] },
    { "id": "out", "text": "y", "at": [3.6, 0], "shape": "circle" }
  ],
  "edges": [
    { "from": "in", "to": "a", "label": "×3, +1" },
    { "from": "a", "to": "out", "label": "mod 7" }
  ]
}
```

**Şıklar:**
A) 0
B) 1
C) 2
D) 4
E) 5

**Açıklama:**
Önce $2025$ sayısının $7$ ile bölümünden kalan bulunur: $2025 = 7 \cdot 289 + 2 \equiv 2$ (mod $7$).
Şimdi turlar mod $7$'de takip edilir:
- $1.$ tur: $3(2) + 1 = 7 \equiv 0$ (mod $7$)
- $2.$ tur: $3(0) + 1 = 1 \equiv 1$ (mod $7$)
- $3.$ tur: $3(1) + 1 = 4 \equiv 4$ (mod $7$)
- $4.$ tur: $3(4) + 1 = 13 \equiv 6$ (mod $7$)
- $5.$ tur: $3(6) + 1 = 19 \equiv 5$ (mod $7$)
- $6.$ tur: $3(5) + 1 = 16 \equiv 2$ (mod $7$)
$6$ turda bir $(0, 1, 4, 6, 5, 2)$ dizisi tekrar eder. $29 = 6 \cdot 4 + 5$ olduğundan $29.$ turun sonunda $5.$ turdaki değer olan $5$ elde edilir.

**Çeldirici Tuzağı:**
C şıkkı ($2$) veya B şıkkı ($1$), $29$ sayısını yanlış periyoda bölerek ya da başlangıç kalanı olan $2$'yi $1.$ tur sanarak bir adım kaydıran adayı yakalar.