---
ders: Matematik & Geometri
konu: Doğruda ve Üçgende Açılar, Üçgenler
kod: mat
kapsam: [lisans_gygk, b_grubu_gygk]
---

### mat-12-001
- zorluk: 1
- dogru: B
- dogrulama: 85 - 38

**Soru:**
Şekilde $d_1 \parallel d_2$ olmak üzere $m(\widehat{BPE}) = 38^\circ$ ve $m(\widehat{PEQ}) = 85^\circ$ veriliyor.
Buna göre $m(\widehat{DQE}) = x$ kaç derecedir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [0, 3],
    "P": [1.5, 3],
    "B": [5.5, 3],
    "C": [0, 0],
    "Q": [2.021, 0],
    "D": [5.5, 0],
    "E": [3.42, 1.5]
  },
  "hideLabels": ["A", "C"],
  "labelPos": {
    "P": "top",
    "B": "right",
    "Q": "bottom",
    "D": "right",
    "E": "right"
  },
  "shapes": [
    { "type": "segment", "from": "A", "to": "B" },
    { "type": "segment", "from": "C", "to": "D" },
    { "type": "segment", "from": "P", "to": "E" },
    { "type": "segment", "from": "Q", "to": "E" },
    { "type": "angle", "vertex": "P", "from": "B", "to": "E", "label": "38°", "radius": 26 },
    { "type": "angle", "vertex": "Q", "from": "D", "to": "E", "label": "x", "radius": 26 },
    { "type": "angle", "vertex": "E", "from": "P", "to": "Q", "label": "85°", "radius": 22 },
    { "type": "label", "at": "A", "text": "d₁", "dx": -14, "dy": 0, "size": 13 },
    { "type": "label", "at": "C", "text": "d₂", "dx": -14, "dy": 0, "size": 13 }
  ]
}
```

**Şıklar:**
A) 42
B) 47
C) 52
D) 57
E) 62

**Açıklama:**
$E$ noktasından $d_1$ ve $d_2$ doğrularına paralel bir yardımcı doğru çizildiğinde iç ters açılar nedeniyle $85^\circ$'lik açı üstte $38^\circ$ ve altta $x$ olmak üzere iki parçaya ayrılır (M kuralı). Buradan $38^\circ + x = 85^\circ \Rightarrow x = 85^\circ - 38^\circ = 47^\circ$ bulunur.

**Çeldirici Tuzağı:**
C şıkkı (52), $90^\circ - 38^\circ = 52^\circ$ hesabıyla ortadaki açıyı $85^\circ$ yerine dik açı gibi düşünen veya $85 - 38$ çıkarmasında onluk bozmayı yanlış yapan adayı yakalar.

### mat-12-002
- zorluk: 2
- dogru: D
- dogrulama: 360 - 115 - 105

**Soru:**
Şekilde $[BA \parallel [DE$ olmak üzere $m(\widehat{ABC}) = 115^\circ$ ve $m(\widehat{BCD}) = 105^\circ$ veriliyor.
Buna göre $m(\widehat{CDE}) = x$ kaç derecedir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [-0.5, 3],
    "B": [1.5, 3],
    "C": [2.199, 1.5],
    "D": [0.411, 0],
    "E": [-1.2, 0]
  },
  "labelPos": {
    "A": "left",
    "B": "top",
    "C": "right",
    "D": "bottom",
    "E": "left"
  },
  "shapes": [
    { "type": "segment", "from": "A", "to": "B" },
    { "type": "segment", "from": "B", "to": "C" },
    { "type": "segment", "from": "C", "to": "D" },
    { "type": "segment", "from": "D", "to": "E" },
    { "type": "angle", "vertex": "B", "from": "A", "to": "C", "label": "115°", "radius": 24 },
    { "type": "angle", "vertex": "C", "from": "B", "to": "D", "label": "105°", "radius": 22 },
    { "type": "angle", "vertex": "D", "from": "C", "to": "E", "label": "x", "radius": 24 }
  ]
}
```

**Şıklar:**
A) 120
B) 130
C) 135
D) 140
E) 150

**Açıklama:**
$C$ noktasından $[BA$ ve $[DE$ ışınlarına paralel ve sola doğru bir ışın çizilirse iki tane U kuralı oluşur. Bu paralel ışının üstte ve altta oluşturduğu açıların toplamı $105^\circ$'dir. Üst U kuralından üst parça $180^\circ - 115^\circ = 65^\circ$, alt parça $105^\circ - 65^\circ = 40^\circ$ olur. Alt U kuralından $x = 180^\circ - 40^\circ = 140^\circ$ bulunur (kısaca üç açının toplamı $360^\circ$'dir).

**Çeldirici Tuzağı:**
B şıkkı (130), ardışık açılar toplamını $360^\circ$ yerine $350^\circ$ alan ya da $180^\circ$'ye tamamlarken $65^\circ$ yerine $55^\circ$ çıkaran adayı yakalar. İki kırılmalı paralel sistemde iç bölge açılarının toplamı her zaman $360^\circ$'dir.

### mat-12-003
- zorluk: 2
- dogru: A
- dogrulama: 180 - 2 * (34 + 34)

**Soru:**
Şekildeki $ABC$ üçgeninde $D \in [AC]$, $|AB| = |BD| = |DC|$ ve $m(\widehat{ACB}) = 34^\circ$ olduğuna göre $m(\widehat{ABD}) = x$ kaç derecedir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [0.831, 3.913],
    "B": [0, 0],
    "C": [6.632, 0],
    "D": [3.316, 2.237]
  },
  "labelPos": {
    "A": "top",
    "B": "bl",
    "C": "br",
    "D": "tr"
  },
  "shapes": [
    { "type": "polygon", "points": ["A", "B", "C"] },
    { "type": "segment", "from": "A", "to": "B", "ticks": 2 },
    { "type": "segment", "from": "B", "to": "D", "ticks": 2 },
    { "type": "segment", "from": "D", "to": "C", "ticks": 2 },
    { "type": "angle", "vertex": "C", "from": "A", "to": "B", "label": "34°", "radius": 34 },
    { "type": "angle", "vertex": "B", "from": "D", "to": "A", "label": "x", "radius": 28 }
  ]
}
```

**Şıklar:**
A) 44
B) 46
C) 52
D) 68
E) 78

**Açıklama:**
$|BD| = |DC|$ olduğu için $BDC$ ikizkenar üçgeninde taban açıları eşittir: $m(\widehat{DBC}) = m(\widehat{DCB}) = 34^\circ$. İki iç açının toplamı komşu olmayan dış açıya eşit olduğundan $m(\widehat{ADB}) = 34^\circ + 34^\circ = 68^\circ$ olur. $ABD$ üçgeninde $|AB| = |BD|$ verildiğinden $m(\widehat{BAD}) = m(\widehat{ADB}) = 68^\circ$ bulunur. Üçgenin iç açıları toplamından $x = 180^\circ - (68^\circ + 68^\circ) = 44^\circ$ elde edilir.

**Çeldirici Tuzağı:**
D şıkkı (68), $m(\widehat{ADB}) = 68^\circ$ dış açısını bulduktan sonra bunu $x$ açısı sanan ya da $A$ ve $D$ açılarından yalnızca birini $180^\circ$'den çıkaran adayı yakalar.

### mat-12-004
- zorluk: 3
- dogru: C
- dogrulama: (180 - 40) / 2 - (180 - (60 + 40)) / 2

**Soru:**
Şekildeki $ABC$ eşkenar üçgeninde $|BD| = |BC|$ ve $m(\widehat{CBD}) = 40^\circ$ olduğuna göre $m(\widehat{ADC}) = x$ kaç derecedir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [2, 3.464],
    "B": [0, 0],
    "C": [4, 0],
    "D": [3.064, -2.571]
  },
  "labelPos": {
    "A": "top",
    "B": "left",
    "C": "right",
    "D": "bottom"
  },
  "shapes": [
    { "type": "segment", "from": "A", "to": "B", "ticks": 1 },
    { "type": "segment", "from": "B", "to": "C", "ticks": 1 },
    { "type": "segment", "from": "A", "to": "C", "ticks": 1 },
    { "type": "segment", "from": "B", "to": "D", "ticks": 1 },
    { "type": "segment", "from": "C", "to": "D" },
    { "type": "segment", "from": "A", "to": "D" },
    { "type": "angle", "vertex": "B", "from": "D", "to": "C", "label": "40°", "radius": 26 },
    { "type": "angle", "vertex": "D", "from": "A", "to": "C", "label": "x", "radius": 34 }
  ]
}
```

**Şıklar:**
A) 20
B) 25
C) 30
D) 35
E) 40

**Açıklama:**
$ABC$ eşkenar üçgen olduğundan $|AB| = |BC| = |AC|$ ve $m(\widehat{ABC}) = 60^\circ$'dir. Soruda $|BD| = |BC|$ verildiği için $|AB| = |BD|$ gizli ikizkenar üçgeni ortaya çıkar. $ABD$ üçgeninin tepe açısı $m(\widehat{ABD}) = 60^\circ + 40^\circ = 100^\circ$ olduğundan $m(\widehat{ADB}) = \dfrac{180^\circ - 100^\circ}{2} = 40^\circ$ bulunur. Diğer yandan $BCD$ ikizkenar üçgeninde $m(\widehat{BDC}) = \dfrac{180^\circ - 40^\circ}{2} = 70^\circ$'dir. O hâlde $x = m(\widehat{BDC}) - m(\widehat{ADB}) = 70^\circ - 40^\circ = 30^\circ$ olur.

**Çeldirici Tuzağı:**
E şıkkı (40), $|AB| = |BD|$ gizli ikizkenarını kullanarak $m(\widehat{ADB}) = 40^\circ$ açısını bulup sonucu $40^\circ$ işaretleyen adayı yakalar. Oysa soru $ADC$ açısını sormaktadır ve $70^\circ$'den $40^\circ$ çıkarılmalıdır.

### mat-12-005
- zorluk: 1
- dogru: E
- dogrulama: sqrt(4^2 + 3^2 + 12^2)

**Soru:**
Şekildeki $ABC$ ve $ACD$ birer dik üçgendir. $AB \perp BC$, $AC \perp CD$, $|AB| = 4$ cm, $|BC| = 3$ cm ve $|CD| = 12$ cm olduğuna göre $|AD| = x$ kaç cm'dir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [0, 4],
    "B": [0, 0],
    "C": [3, 0],
    "D": [12.6, 7.2]
  },
  "labelPos": {
    "A": "tl",
    "B": "bl",
    "C": "br",
    "D": "tr"
  },
  "shapes": [
    { "type": "segment", "from": "A", "to": "B", "label": "4" },
    { "type": "segment", "from": "B", "to": "C", "label": "3" },
    { "type": "segment", "from": "A", "to": "C" },
    { "type": "segment", "from": "C", "to": "D", "label": "12" },
    { "type": "segment", "from": "A", "to": "D", "label": "x" },
    { "type": "angle", "vertex": "B", "from": "A", "to": "C", "right": true },
    { "type": "angle", "vertex": "C", "from": "A", "to": "D", "right": true }
  ]
}
```

**Şıklar:**
A) 10
B) 11
C) 12
D) $\sqrt{149}$
E) 13

**Açıklama:**
$ABC$ dik üçgeninde $3-4-5$ özel üçgeninden $|AC| = \sqrt{3^2 + 4^2} = 5$ cm bulunur. $ACD$ dik üçgeninde dik kenarlar $|AC| = 5$ cm ve $|CD| = 12$ cm olduğundan $5-12-13$ özel üçgeniyle hipotenüs $x = \sqrt{5^2 + 12^2} = 13$ cm elde edilir.

**Çeldirici Tuzağı:**
D şıkkı ($\sqrt{149}$), $|AC|$ hipotenüsünü hesaplamadan doğrudan $4, 3, 12$ kenarlarını kullanıp $5$ yerine $4$ ya da $3$'ü $12$ ile Pisagor'a sokan adayı yakalar ($\sqrt{12^2 + 5} = \sqrt{149}$ veya $\sqrt{169}$ yerine karekök toplamı hatası).

### mat-12-006
- zorluk: 2
- dogru: A
- dogrulama: (6 * sqrt(2) / sqrt(2)) * 2

**Soru:**
Şekildeki $ABC$ üçgeninde $m(\widehat{B}) = 45^\circ$, $m(\widehat{C}) = 30^\circ$ ve $|AB| = 6\sqrt{2}$ cm olduğuna göre $|AC| = x$ kaç cm'dir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [6, 6],
    "B": [0, 0],
    "C": [16.392, 0]
  },
  "labelPos": {
    "A": "top",
    "B": "bl",
    "C": "br"
  },
  "shapes": [
    { "type": "segment", "from": "A", "to": "B", "label": "6√2 cm" },
    { "type": "segment", "from": "B", "to": "C" },
    { "type": "segment", "from": "A", "to": "C", "label": "x", "labelSide": "in" },
    { "type": "angle", "vertex": "B", "from": "A", "to": "C", "label": "45°", "radius": 24 },
    { "type": "angle", "vertex": "C", "from": "A", "to": "B", "label": "30°", "radius": 32 }
  ]
}
```

**Şıklar:**
A) 12
B) $6\sqrt{3}$
C) $6\sqrt{6}$
D) $12\sqrt{2}$
E) 18

**Açıklama:**
$A$ köşesinden $[BC]$ kenarına $AH$ yüksekliği indirilir. Solda oluşan $ABH$ dik üçgeni $45^\circ - 45^\circ - 90^\circ$ ikizkenar dik üçgeni olduğundan $|AH| = \dfrac{6\sqrt{2}}{\sqrt{2}} = 6$ cm bulunur. Sağda oluşan $AHC$ dik üçgeni $30^\circ - 60^\circ - 90^\circ$ üçgenidir ve $30^\circ$'nin karşısındaki $|AH| = 6$ cm olduğundan hipotenüs $x = 2 \cdot 6 = 12$ cm olur.

**Çeldirici Tuzağı:**
D şıkkı ($12\sqrt{2}$), $|AB|$ kenarını $\sqrt{2}$'ye bölerek yüksekliği $6$ bulmak yerine doğrudan $6\sqrt{2}$'yi $2$ ile çarpan adayı yakalar. Özel açılı üçgenlerde önce ortak yüksekliği bulmak gerekir.

### mat-12-007
- zorluk: 2
- dogru: D
- dogrulama: 6 * (4 + 6) / 4

**Soru:**
Şekildeki $ABC$ üçgeninde $D \in [AB]$, $E \in [AC]$ ve $DE \parallel BC$'dir. $|AD| = 4$ cm, $|DB| = 6$ cm ve $|DE| = 6$ cm olduğuna göre $|BC| = x$ kaç cm'dir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [5, 10],
    "B": [0, 0],
    "C": [15, 0],
    "D": [3, 6],
    "E": [9, 6]
  },
  "labelPos": {
    "A": "top",
    "B": "bl",
    "C": "br",
    "D": "left",
    "E": "right"
  },
  "shapes": [
    { "type": "segment", "from": "A", "to": "D", "label": "4" },
    { "type": "segment", "from": "D", "to": "B", "label": "6" },
    { "type": "segment", "from": "B", "to": "C", "label": "x" },
    { "type": "segment", "from": "A", "to": "C" },
    { "type": "segment", "from": "D", "to": "E", "label": "6", "labelSide": "in" }
  ]
}
```

**Şıklar:**
A) 9
B) 10
C) 12
D) 15
E) 18

**Açıklama:**
$DE \parallel BC$ olduğundan $ADE$ ve $ABC$ üçgenleri benzerdir (Temel Orantı Teoremi). Benzerlik oranı tepe noktası $A$'dan tüm kenara göre yazılır: $\dfrac{|AD|}{|AB|} = \dfrac{|DE|}{|BC|}$. Buradan $\dfrac{4}{4 + 6} = \dfrac{6}{x} \Rightarrow \dfrac{4}{10} = \dfrac{6}{x} \Rightarrow 4x = 60 \Rightarrow x = 15$ cm bulunur.

**Çeldirici Tuzağı:**
A şıkkı (9), taban oranını yazarken $\dfrac{|AD|}{|AB|}$ yerine parça-parça oranı $\dfrac{|AD|}{|DB|} = \dfrac{4}{6}$ alıp $\dfrac{4}{6} = \dfrac{6}{x} \Rightarrow x = 9$ yazan adayı yakalar. Tabanların oranı yalnızca yan parçaların birbirine oranına değil, küçük kenarın tüm kenara oranına eşittir.

### mat-12-008
- zorluk: 3
- dogru: C
- dogrulama: ((8^2 / 4) * 8 / 2) / 2

**Soru:**
Şekildeki $ABC$ dik üçgeninde $m(\widehat{BAC}) = 90^\circ$, $AH \perp BC$ ve $|AE| = |EC|$ veriliyor. $|BH| = 4$ cm ve $|AH| = 8$ cm olduğuna göre taralı $AHE$ üçgeninin alanı kaç cm²'dir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [4, 8],
    "B": [0, 0],
    "H": [4, 0],
    "C": [20, 0],
    "E": [12, 4]
  },
  "labelPos": {
    "A": "top",
    "B": "bl",
    "H": "bottom",
    "C": "br",
    "E": "tr"
  },
  "shapes": [
    { "type": "polygon", "points": ["A", "H", "E"], "fill": true },
    { "type": "segment", "from": "A", "to": "B" },
    { "type": "segment", "from": "B", "to": "H", "label": "4" },
    { "type": "segment", "from": "H", "to": "C" },
    { "type": "segment", "from": "A", "to": "E", "ticks": 1 },
    { "type": "segment", "from": "E", "to": "C", "ticks": 1 },
    { "type": "segment", "from": "A", "to": "H", "label": "8", "labelSide": "in" },
    { "type": "segment", "from": "H", "to": "E" },
    { "type": "angle", "vertex": "A", "from": "B", "to": "C", "right": true },
    { "type": "angle", "vertex": "H", "from": "A", "to": "C", "right": true }
  ]
}
```

**Şıklar:**
A) 16
B) 24
C) 32
D) 40
E) 64

**Açıklama:**
Öklid bağıntısından $|AH|^2 = |BH| \cdot |HC|$ yazılır: $8^2 = 4 \cdot |HC| \Rightarrow 64 = 4|HC| \Rightarrow |HC| = 16$ cm bulunur. $AHC$ dik üçgeninin alanı $\dfrac{16 \cdot 8}{2} = 64$ cm²'dir. $[HE]$ doğru parçası, $AHC$ üçgeninde $[AC]$ tabanını $|AE| = |EC|$ olacak şekilde iki eşit parçaya böldüğünden $AHE$ ve $CHE$ üçgenlerinin alanları eşittir. Dolayısıyla taralı alan $\dfrac{64}{2} = 32$ cm² olur.

**Çeldirici Tuzağı:**
E şıkkı (64), $AHC$ üçgeninin tüm alanını bulup $E$'nin orta nokta olması nedeniyle ikiye bölmeyi unutan adayı yakalar. D şıkkı (40) ise $ABC$ toplam alanının ($80$) yarısını alanların düştüğü tuzaktır.

### mat-12-009
- zorluk: 1
- dogru: E
- dogrulama: 12 * (3 + 5) / 3

**Soru:**
Şekildeki $ABC$ üçgeninde $D \in [BC]$, $|BD| = 3$ cm ve $|DC| = 5$ cm'dir. Taralı $ABD$ üçgeninin alanı $12$ cm² olduğuna göre $ABC$ üçgeninin alanı kaç cm²'dir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [2.5, 5],
    "B": [0, 0],
    "D": [3, 0],
    "C": [8, 0]
  },
  "labelPos": {
    "A": "top",
    "B": "bl",
    "D": "bottom",
    "C": "br"
  },
  "shapes": [
    { "type": "polygon", "points": ["A", "B", "D"], "fill": true },
    { "type": "polygon", "points": ["A", "B", "C"] },
    { "type": "segment", "from": "B", "to": "D", "label": "3 cm" },
    { "type": "segment", "from": "D", "to": "C", "label": "5 cm" }
  ]
}
```

**Şıklar:**
A) 15
B) 20
C) 24
D) 28
E) 32

**Açıklama:**
$ABD$ ve $ADC$ üçgenlerinin $A$ köşesinden $[BC]$ doğrusuna inilen yükseklikleri ortaktır; bu yüzden alanları tabanlarıyla doğru orantılıdır. $3$ cm'lik tabana karşılık $12$ cm² alan düştüğüne göre birim taban başına $4$ cm² alan düşer. Tüm $ABC$ üçgeninin tabanı $|BC| = 3 + 5 = 8$ cm olduğundan alanı $8 \cdot 4 = 32$ cm² bulunur.

**Çeldirici Tuzağı:**
B şıkkı (20), $ADC$ üçgeninin alanını ($5 \cdot 4 = 20$) hesaplayıp soru $ABC$ üçgeninin tamamını sorduğu hâlde $20$'yi işaretleyen adayı yakalar.

### mat-12-010
- zorluk: 2
- dogru: B
- dogrulama: (7 + 11 - 1) - 7

**Soru:**
Kenar uzunlukları tam sayı olan bir $ABC$ üçgeninde $|AB| = 7$ cm, $|BC| = 11$ cm ve $m(\widehat{B}) > m(\widehat{C})$ olduğu bilinmektedir.
Buna göre $|AC|$ kenarının uzunluğu kaç farklı tam sayı değeri alabilir?

**Şıklar:**
A) 9
B) 10
C) 11
D) 12
E) 13

**Açıklama:**
Üçgen eşitsizliğine göre $|BC| - |AB| < |AC| < |BC| + |AB|$, yani $11 - 7 < |AC| < 11 + 7 \Rightarrow 4 < |AC| < 18$ olmalıdır. Ayrıca $m(\widehat{B}) > m(\widehat{C})$ açı koşulundan büyük açının karşısında büyük kenar bulunacağı için $|AC| > |AB| = 7$ olmalıdır. İki eşitsizliğin kesişimi $7 < |AC| < 18$ olur. Bu aralıktaki tam sayılar $8, 9, \ldots, 17$ olup toplam $17 - 8 + 1 = 10$ tanedir.

**Çeldirici Tuzağı:**
E şıkkı (13), $m(\widehat{B}) > m(\widehat{C})$ açı-kenar bağıntısını gözden kaçırıp yalnızca üçgen eşitsizliğindeki $5$'ten $17$'ye kadar olan $13$ tam sayıyı sayan adayı yakalar.

### mat-12-011
- zorluk: 1
- dogru: A
- dogrulama: (180 - 90) / (3 + 2)

**Soru:**
Şekilde $A, O, B$ noktaları doğrusal, $OC \perp OD$, $m(\widehat{AOC}) = 3x - 10^\circ$ ve $m(\widehat{DOB}) = 2x + 10^\circ$'dir.
Buna göre $x$ kaç derecedir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [-4, 0],
    "O": [0, 0],
    "B": [4, 0],
    "C": [-2.877, 2.779],
    "D": [2.779, 2.877]
  },
  "labelPos": {
    "A": "left",
    "O": "bottom",
    "B": "right",
    "C": "tl",
    "D": "tr"
  },
  "shapes": [
    { "type": "segment", "from": "A", "to": "B" },
    { "type": "segment", "from": "O", "to": "C" },
    { "type": "segment", "from": "O", "to": "D" },
    { "type": "angle", "vertex": "O", "from": "C", "to": "D", "right": true },
    { "type": "angle", "vertex": "O", "from": "A", "to": "C", "label": "3x−10°", "radius": 34 },
    { "type": "angle", "vertex": "O", "from": "D", "to": "B", "label": "2x+10°", "radius": 34 }
  ]
}
```

**Şıklar:**
A) 18
B) 16
C) 20
D) 22
E) 36

**Açıklama:**
$A, O, B$ doğrusal olduğundan doğru açı $180^\circ$'dir: $(3x - 10^\circ) + 90^\circ + (2x + 10^\circ) = 180^\circ \Rightarrow 5x + 90^\circ = 180^\circ \Rightarrow 5x = 90^\circ \Rightarrow x = 18^\circ$ bulunur.

**Çeldirici Tuzağı:**
E şıkkı (36), ortadaki $90^\circ$'lik dik açıyı çıkardıktan sonra toplamı $180^\circ$ alıp $5x = 180^\circ \Rightarrow x = 36^\circ$ bulan adayı yakalar.

### mat-12-012
- zorluk: 2
- dogru: D
- dogrulama: 2 * (118 - 90)

**Soru:**
Şekildeki $ABC$ üçgeninde $[BD]$ ve $[CD]$ iç açıortaylardır. $m(\widehat{BDC}) = 118^\circ$ olduğuna göre $m(\widehat{BAC}) = x$ kaç derecedir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [0, 5.642],
    "B": [-3, 0],
    "C": [3, 0],
    "D": [0, 1.803]
  },
  "labelPos": {
    "A": "top",
    "B": "bl",
    "C": "br",
    "D": "top"
  },
  "shapes": [
    { "type": "polygon", "points": ["A", "B", "C"] },
    { "type": "segment", "from": "B", "to": "D" },
    { "type": "segment", "from": "C", "to": "D" },
    { "type": "angle", "vertex": "D", "from": "B", "to": "C", "label": "118°", "radius": 24 },
    { "type": "angle", "vertex": "A", "from": "B", "to": "C", "label": "x", "radius": 26 },
    { "type": "angle", "vertex": "B", "from": "A", "to": "D", "radius": 22 },
    { "type": "angle", "vertex": "B", "from": "D", "to": "C", "radius": 26 },
    { "type": "angle", "vertex": "C", "from": "D", "to": "A", "double": true, "radius": 22 },
    { "type": "angle", "vertex": "C", "from": "B", "to": "D", "double": true, "radius": 26 }
  ]
}
```

**Şıklar:**
A) 28
B) 48
C) 52
D) 56
E) 62

**Açıklama:**
Bir üçgende iki iç açıortayın oluşturduğu açı $m(\widehat{BDC}) = 90^\circ + \dfrac{m(\widehat{A})}{2}$ kuralıyla hesaplanır. Yerine yazılırsa $118^\circ = 90^\circ + \dfrac{x}{2} \Rightarrow \dfrac{x}{2} = 28^\circ \Rightarrow x = 56^\circ$ bulunur. (Açıortaylara $\alpha$ ve $\beta$ denerek $118 + \alpha + \beta = 180$ ile de aynı sonuca ulaşılır.)

**Çeldirici Tuzağı:**
A şıkkı (28), $118^\circ - 90^\circ = 28^\circ$ farkını bulduktan sonra $2$ ile çarpmayı unutan adayı; E şıkkı (62) ise $180^\circ - 118^\circ = 62^\circ$'yi doğrudan tepe açısı sananları yakalar.

### mat-12-013
- zorluk: 2
- dogru: B
- dogrulama: (12 * sqrt(10^2 - (12 / 2)^2)) / 2

**Soru:**
Şekildeki $ABC$ ikizkenar üçgeninde $|AB| = |AC| = 10$ cm ve $|BC| = 12$ cm'dir.
Buna göre $ABC$ üçgeninin alanı kaç cm²'dir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [6, 8],
    "B": [0, 0],
    "C": [12, 0]
  },
  "labelPos": {
    "A": "top",
    "B": "bl",
    "C": "br"
  },
  "shapes": [
    { "type": "polygon", "points": ["A", "B", "C"] },
    { "type": "segment", "from": "A", "to": "B", "label": "10", "ticks": 1 },
    { "type": "segment", "from": "A", "to": "C", "label": "10", "ticks": 1 },
    { "type": "segment", "from": "B", "to": "C", "label": "12" }
  ]
}
```

**Şıklar:**
A) 24
B) 48
C) 60
D) 80
E) 96

**Açıklama:**
İkizkenar üçgende tepe noktasından tabana indirilen yükseklik tabanı iki eşit parçaya böler: $|BH| = |HC| = \dfrac{12}{2} = 6$ cm. Oluşan $ABH$ dik üçgeninde $6-8-10$ özel üçgeninden yükseklik $h = \sqrt{10^2 - 6^2} = 8$ cm olur. Üçgenin alanı $\dfrac{12 \cdot 8}{2} = 48$ cm² bulunur.

**Çeldirici Tuzağı:**
C şıkkı (60), dikme indirip yüksekliği $8$ bulmak yerine yan kenar $10$ cm'yi yükseklik sanıp $\dfrac{12 \cdot 10}{2} = 60$ hesaplayan adayı; E şıkkı (96) ise alan formülünde ikiye bölmeyi unutanları yakalar.

### mat-12-014
- zorluk: 1
- dogru: C
- dogrulama: ((4 * sqrt(36) / 3)^2 * sqrt(3)) / 4

**Soru:**
Bir tel bükülerek alanı $36\text{ cm}^2$ olan bir kare oluşturuluyor.
Aynı tel bozulup tamamıyla bir **eşkenar üçgen** oluşturulduğunda bu eşkenar üçgenin alanı kaç $\text{cm}^2$ olur?

**Şıklar:**
A) $8\sqrt{3}$
B) $12\sqrt{3}$
C) $16\sqrt{3}$
D) $24\sqrt{3}$
E) $32\sqrt{3}$

**Açıklama:**
Alanı $36\text{ cm}^2$ olan karenin bir kenarı $\sqrt{36} = 6$ cm, dolayısıyla telin toplam uzunluğu (kare çevresi) $4 \cdot 6 = 24$ cm'dir. Bu telle yapılan eşkenar üçgenin bir kenarı $\dfrac{24}{3} = 8$ cm olur. Eşkenar üçgenin alanı $\dfrac{8^2\sqrt{3}}{4} = 16\sqrt{3}\text{ cm}^2$ bulunur.

**Çeldirici Tuzağı:**
D şıkkı ($24\sqrt{3}$) veya B şıkkı ($12\sqrt{3}$), karenin çevresi ($24$) yerine kenarını $9$ alıp kare alanını veya eşkenar üçgen paydasındaki $4$ yerine $2$'ye bölen adayı yakalar.

### mat-12-015
- zorluk: 2
- dogru: C
- dogrulama: 10 * 6 / (6 + 9)

**Soru:**
Şekildeki $ABC$ üçgeninde $[AD]$ iç açıortaydır. $|AB| = 6$ cm, $|AC| = 9$ cm ve $|BC| = 10$ cm olduğuna göre $|BD| = x$ kaç cm'dir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [2.75, 5.333],
    "B": [0, 0],
    "D": [4, 0],
    "C": [10, 0]
  },
  "labelPos": {
    "A": "top",
    "B": "bl",
    "D": "bottom",
    "C": "br"
  },
  "shapes": [
    { "type": "polygon", "points": ["A", "B", "C"] },
    { "type": "segment", "from": "A", "to": "D" },
    { "type": "segment", "from": "A", "to": "B", "label": "6" },
    { "type": "segment", "from": "A", "to": "C", "label": "9" },
    { "type": "segment", "from": "B", "to": "D", "label": "x" },
    { "type": "angle", "vertex": "A", "from": "B", "to": "D", "radius": 24 },
    { "type": "angle", "vertex": "A", "from": "D", "to": "C", "radius": 28 }
  ]
}
```

**Şıklar:**
A) 2
B) 3
C) 4
D) 5
E) 6

**Açıklama:**
İç açıortay teoremine göre kolların oranı taban parçalarının oranına eşittir: $\dfrac{|BD|}{|DC|} = \dfrac{|AB|}{|AC|} = \dfrac{6}{9} = \dfrac{2}{3}$. Buradan $|BD| = 2k$ ve $|DC| = 3k$ denirse $2k + 3k = 10 \Rightarrow 5k = 10 \Rightarrow k = 2$ olur. İstenen uzunluk $x = 2k = 4$ cm bulunur.

**Çeldirici Tuzağı:**
E şıkkı (6), $k = 2$ bulduktan sonra küçük parça $|BD| = 4$ yerine büyük parça $|DC| = 6$'yı işaretleyen adayı yakalar.

### mat-12-016
- zorluk: 2
- dogru: D
- dogrulama: (sqrt(6^2 + (6 * sqrt(3))^2) / 2) * (2 / 3)

**Soru:**
Şekildeki $ABC$ dik üçgeninde $m(\widehat{BAC}) = 90^\circ$ ve $G$ noktası üçgenin ağırlık merkezidir. $|AB| = 6$ cm ve $|AC| = 6\sqrt{3}$ cm olduğuna göre $|AG| = x$ kaç cm'dir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [3, 5.196],
    "B": [0, 0],
    "C": [12, 0],
    "D": [6, 0],
    "G": [5, 1.732]
  },
  "dots": ["G"],
  "labelPos": {
    "A": "top",
    "B": "bl",
    "C": "br",
    "D": "bottom",
    "G": "tr"
  },
  "shapes": [
    { "type": "polygon", "points": ["A", "B", "C"] },
    { "type": "segment", "from": "A", "to": "D" },
    { "type": "segment", "from": "A", "to": "B", "label": "6" },
    { "type": "segment", "from": "A", "to": "C", "label": "6√3" },
    { "type": "segment", "from": "B", "to": "D", "ticks": 1 },
    { "type": "segment", "from": "D", "to": "C", "ticks": 1 },
    { "type": "angle", "vertex": "A", "from": "B", "to": "C", "right": true }
  ]
}
```

**Şıklar:**
A) 2
B) 3
C) $2\sqrt{3}$
D) 4
E) 6

**Açıklama:**
$ABC$ dik üçgeninde Pisagor ile hipotenüs $|BC| = \sqrt{6^2 + (6\sqrt{3})^2} = \sqrt{36 + 108} = 12$ cm bulunur. Dik açıdan hipotenüse çizilen kenarortay hipotenüsün yarısına eşittir (muhteşem üçlü): $|AD| = \dfrac{12}{2} = 6$ cm. Ağırlık merkezi $G$, kenarortayı köşeden itibaren $2 : 1$ oranında böldüğü için $x = |AG| = \dfrac{2}{3} \cdot 6 = 4$ cm bulunur.

**Çeldirici Tuzağı:**
E şıkkı (6), kenarortayın tamamını ($|AD| = 6$) bulup ağırlık merkezi oranını uygulamayı unutan adayı; A şıkkı (2) ise $|AG|$ yerine $|GD| = 2$ cm'yi seçenleri yakalar.

### mat-12-017
- zorluk: 1
- dogru: B
- dogrulama: 5 + 2 * 5 + 5 * sqrt(3)

**Soru:**
Şekildeki $ABC$ dik üçgeninde $m(\widehat{BAC}) = 90^\circ$, $m(\widehat{C}) = 30^\circ$ ve $|AB| = 5$ cm'dir.
Buna göre $ABC$ üçgeninin çevresi kaç cm'dir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [0, 0],
    "B": [0, 5],
    "C": [8.66, 0]
  },
  "labelPos": {
    "A": "bl",
    "B": "top",
    "C": "br"
  },
  "shapes": [
    { "type": "polygon", "points": ["A", "B", "C"] },
    { "type": "segment", "from": "A", "to": "B", "label": "5" },
    { "type": "angle", "vertex": "A", "from": "B", "to": "C", "right": true },
    { "type": "angle", "vertex": "C", "from": "A", "to": "B", "label": "30°", "radius": 28 }
  ]
}
```

**Şıklar:**
A) $10 + 5\sqrt{3}$
B) $15 + 5\sqrt{3}$
C) $15 + 5\sqrt{2}$
D) $20$
E) $10 + 10\sqrt{3}$

**Açıklama:**
$30^\circ - 60^\circ - 90^\circ$ dik üçgeninde $30^\circ$'nin karşısındaki kenar $|AB| = 5$ cm olduğundan hipotenüs $|BC| = 2 \cdot 5 = 10$ cm ve $60^\circ$'nin karşısındaki dik kenar $|AC| = 5\sqrt{3}$ cm olur. Üçgenin çevresi $5 + 10 + 5\sqrt{3} = 15 + 5\sqrt{3}$ cm bulunur.

**Çeldirici Tuzağı:**
A şıkkı ($10 + 5\sqrt{3}$), yalnızca $|BC| = 10$ ile $|AC| = 5\sqrt{3}$'ü toplayıp dik kenar $|AB| = 5$'i çevreye eklemeyi unutan adayı yakalar.

### mat-12-018
- zorluk: 3
- dogru: E
- dogrulama: 6 * (12 / 4)^2

**Soru:**
Şekilde $DC \parallel AB$ olmak üzere $[AC]$ ve $[BD]$ doğru parçaları $E$ noktasında kesişmektedir. $|DC| = 4$ cm, $|AB| = 12$ cm ve taralı $DEC$ üçgeninin alanı $6$ cm² olduğuna göre $AEB$ üçgeninin alanı kaç cm²'dir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "D": [2, 4],
    "C": [6, 4],
    "A": [0, 0],
    "B": [12, 0],
    "E": [4.5, 3]
  },
  "labelPos": {
    "D": "tl",
    "C": "tr",
    "A": "bl",
    "B": "br",
    "E": "right"
  },
  "shapes": [
    { "type": "polygon", "points": ["D", "E", "C"], "fill": true },
    { "type": "segment", "from": "D", "to": "C", "label": "4" },
    { "type": "segment", "from": "A", "to": "B", "label": "12" },
    { "type": "segment", "from": "A", "to": "C" },
    { "type": "segment", "from": "B", "to": "D" }
  ]
}
```

**Şıklar:**
A) 12
B) 18
C) 24
D) 36
E) 54

**Açıklama:**
$DC \parallel AB$ olduğundan $DEC$ ve $BEA$ üçgenleri benzerdir (kelebek benzerliği). Benzerlik oranı $k = \dfrac{|AB|}{|DC|} = \dfrac{12}{4} = 3$'tür. Benzer üçgenlerin alanları oranı benzerlik oranının karesine ($k^2 = 3^2 = 9$) eşittir. Dolayısıyla $\text{Alan}(\triangle AEB) = 9 \cdot \text{Alan}(\triangle DEC) = 9 \cdot 6 = 54$ cm² bulunur.

**Çeldirici Tuzağı:**
B şıkkı (18), alanlar oranını benzerlik oranının karesi yerine doğrudan benzerlik oranına ($3$) eşit sanıp $6 \cdot 3 = 18$ bulan adayı yakalar.

### mat-12-019
- zorluk: 2
- dogru: A
- dogrulama: 2 * (7 + 4 + 5)

**Soru:**
Şekildeki $ABC$ üçgeninde $D$ ve $E$ sırasıyla $[AB]$ ve $[AC]$ kenarlarının orta noktalarıdır. $|DE| = 7$ cm, $|BD| = 4$ cm ve $|EC| = 5$ cm olduğuna göre $ABC$ üçgeninin çevresi kaç cm'dir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [5.714, 5.599],
    "B": [0, 0],
    "C": [14, 0],
    "D": [2.857, 2.799],
    "E": [9.857, 2.799]
  },
  "labelPos": {
    "A": "top",
    "B": "bl",
    "C": "br",
    "D": "tl",
    "E": "tr"
  },
  "shapes": [
    { "type": "polygon", "points": ["A", "B", "C"] },
    { "type": "segment", "from": "A", "to": "D", "ticks": 1 },
    { "type": "segment", "from": "D", "to": "B", "label": "4", "ticks": 1 },
    { "type": "segment", "from": "A", "to": "E", "ticks": 2 },
    { "type": "segment", "from": "E", "to": "C", "label": "5", "ticks": 2 },
    { "type": "segment", "from": "D", "to": "E", "label": "7", "labelSide": "in" }
  ]
}
```

**Şıklar:**
A) 32
B) 23
C) 25
D) 28
E) 36

**Açıklama:**
$D$ ve $E$ orta noktalar olduğu için $[DE]$ orta tabandır ve $|BC| = 2|DE| = 2 \cdot 7 = 14$ cm'dir. Ayrıca $|AB| = 2|BD| = 8$ cm ve $|AC| = 2|EC| = 10$ cm olur. Üçgenin çevresi $8 + 10 + 14 = 32$ cm bulunur.

**Çeldirici Tuzağı:**
B şıkkı (23), $|BC| = 14$ bulduktan sonra $|AB|$ ve $|AC|$ yerine yarım parçalar olan $4$ ve $5$'i toplayan ($14 + 4 + 5 = 23$) adayı yakalar.

### mat-12-020
- zorluk: 2
- dogru: C
- dogrulama: (180 - (180 - 110)) / 2

**Soru:**
Şekildeki $ABC$ dik üçgeninde $m(\widehat{BAC}) = 90^\circ$, $|AD| = |BD| = |DC|$ ve $m(\widehat{ADB}) = 110^\circ$ olduğuna göre $m(\widehat{ACD}) = x$ kaç derecedir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [6.71, 4.698],
    "B": [0, 0],
    "D": [5, 0],
    "C": [10, 0]
  },
  "labelPos": {
    "A": "top",
    "B": "bl",
    "D": "bottom",
    "C": "br"
  },
  "shapes": [
    { "type": "polygon", "points": ["A", "B", "C"] },
    { "type": "segment", "from": "A", "to": "D", "ticks": 1 },
    { "type": "segment", "from": "B", "to": "D", "ticks": 1 },
    { "type": "segment", "from": "D", "to": "C", "ticks": 1 },
    { "type": "angle", "vertex": "D", "from": "B", "to": "A", "label": "110°", "radius": 24 },
    { "type": "angle", "vertex": "C", "from": "A", "to": "D", "label": "x", "radius": 26 },
    { "type": "angle", "vertex": "A", "from": "B", "to": "C", "right": true }
  ]
}
```

**Şıklar:**
A) 35
B) 45
C) 55
D) 65
E) 70

**Açıklama:**
$B, D, C$ doğrusal olduğundan $m(\widehat{ADC}) = 180^\circ - 110^\circ = 70^\circ$'dir. $ADC$ üçgeninde $|AD| = |DC|$ verildiği için taban açıları eşittir: $x = m(\widehat{DAC}) = \dfrac{180^\circ - 70^\circ}{2} = \dfrac{110^\circ}{2} = 55^\circ$ bulunur.

**Çeldirici Tuzağı:**
A şıkkı (35), $ABD$ üçgeninde taban açısı olan $m(\widehat{B}) = 35^\circ$'yi bulup soru $\widehat{C}$ açısını sorduğu hâlde $35^\circ$'yi işaretleyen adayı yakalar.

### mat-12-021
- zorluk: 3
- dogru: D
- dogrulama: 9 + 11

**Soru:**
Şekildeki $ABC$ üçgeninde $I$ noktası iç açıortayların kesim noktasıdır ve $DE \parallel BC$ veriliyor. $|AB| = 9$ cm, $|AC| = 11$ cm ve $|BC| = 12$ cm olduğuna göre $ADE$ üçgeninin çevresi kaç cm'dir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [4.333, 7.888],
    "B": [0, 0],
    "C": [12, 0],
    "I": [5, 2.958],
    "D": [1.625, 2.958],
    "E": [9.125, 2.958]
  },
  "dots": ["I"],
  "labelPos": {
    "A": "top",
    "B": "bl",
    "C": "br",
    "D": "tl",
    "E": "tr",
    "I": "bottom"
  },
  "shapes": [
    { "type": "polygon", "points": ["A", "B", "C"] },
    { "type": "segment", "from": "D", "to": "E" },
    { "type": "segment", "from": "B", "to": "I" },
    { "type": "segment", "from": "C", "to": "I" },
    { "type": "angle", "vertex": "B", "from": "A", "to": "I", "radius": 22 },
    { "type": "angle", "vertex": "B", "from": "I", "to": "C", "radius": 26 },
    { "type": "angle", "vertex": "C", "from": "I", "to": "A", "double": true, "radius": 22 },
    { "type": "angle", "vertex": "C", "from": "B", "to": "I", "double": true, "radius": 26 }
  ]
}
```

**Şıklar:**
A) 18
B) 21
C) 23
D) 20
E) 32

**Açıklama:**
$DE \parallel BC$ ve $[BI]$ açıortay olduğundan iç ters açılar nedeniyle $m(\widehat{DIB}) = m(\widehat{IBC}) = m(\widehat{DBI})$ olur; buradan $|DI| = |DB|$ bulunur. Aynı şekilde $[CI]$ açıortayından $|IE| = |EC|$ elde edilir. $ADE$ üçgeninin çevresi $|AD| + |DI| + |IE| + |AE| = (|AD| + |DB|) + (|AE| + |EC|) = |AB| + |AC| = 9 + 11 = 20$ cm bulunur.

**Çeldirici Tuzağı:**
E şıkkı (32), üç kenarı da toplayarak $ABC$ üçgeninin çevresini ($9 + 11 + 12 = 32$) işaretleyen adayı yakalar. Paralellik + açıortay ikizkenarı nedeniyle $|BC| = 12$ bilgisi $ADE$ çevresini etkilemez.

### mat-12-022
- zorluk: 1
- dogru: B
- dogrulama: (180 - 2 * 40) - 40

**Soru:**
İkizkenar bir üçgenin bir iç açısının ölçüsü $40^\circ$'dir.
Buna göre bu üçgenin **en büyük iç açısı ile en küçük iç açısı** arasındaki fark **en çok** kaç derece olabilir?

**Şıklar:**
A) 30
B) 60
C) 70
D) 80
E) 100

**Açıklama:**
İkizkenar üçgende verilen $40^\circ$'lik açı tepe açısı veya taban açısı olabilir:
- $40^\circ$ tepe açısıysa iç açılar $(40^\circ, 70^\circ, 70^\circ)$ olur; en büyük ve en küçük açı farkı $70^\circ - 40^\circ = 30^\circ$'dir.
- $40^\circ$ taban açısıysa iç açılar $(40^\circ, 40^\circ, 100^\circ)$ olur; en büyük ve en küçük açı farkı $100^\circ - 40^\circ = 60^\circ$'dir.
Fark en çok $60^\circ$ olabilir.

**Çeldirici Tuzağı:**
A şıkkı ($30$), $40^\circ$'nin yalnızca tepe açısı olabileceğini düşünüp $(40^\circ, 70^\circ, 70^\circ)$ üçgenini inceleyen; E şıkkı ($100$) ise fark yerine yalnızca en büyük tepe açısını ($100^\circ$) işaretleyen adayı yakalar.


### mat-12-023
- zorluk: 1
- dogru: E
- dogrulama: 38 + 47

**Soru:**
Şekilde $[PB \parallel [RE$, $m(\widehat{BPK}) = 38^\circ$ ve $m(\widehat{ERK}) = 47^\circ$ veriliyor.
Buna göre $m(\widehat{PKR}) = x$ kaç derecedir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [0, 8],
    "P": [4, 8],
    "B": [14, 8],
    "K": [9.12, 4],
    "D": [0, 0],
    "R": [5.39, 0],
    "E": [14, 0]
  },
  "dots": ["P", "K", "R"],
  "labelPos": {
    "A": "left",
    "P": "top",
    "B": "right",
    "K": "left",
    "D": "left",
    "R": "bottom",
    "E": "right"
  },
  "shapes": [
    { "type": "segment", "from": "A", "to": "B" },
    { "type": "segment", "from": "D", "to": "E" },
    { "type": "segment", "from": "P", "to": "K" },
    { "type": "segment", "from": "K", "to": "R" },
    { "type": "angle", "vertex": "P", "from": "K", "to": "B", "label": "38°", "radius": 26 },
    { "type": "angle", "vertex": "R", "from": "E", "to": "K", "label": "47°", "radius": 24 },
    { "type": "angle", "vertex": "K", "from": "P", "to": "R", "label": "x", "radius": 24 }
  ]
}
```

**Şıklar:**
A) 65
B) 70
C) 75
D) 80
E) 85

**Açıklama:**
Paralel doğrular arasında kırık çizgi (M) kuralı uygulanır veya $K$ noktasından $PB$ ve $RE$ ışınlarına paralel üçüncü bir doğru çizilir. İç ters açılardan $x$ açısı $38^\circ$ ve $47^\circ$'lik iki açıya bölünür:
$$x = 38^\circ + 47^\circ = 85^\circ$$

**Çeldirici Tuzağı:**
C şıkkı ($75$) veya D şıkkı ($80$), $38 + 47$ toplamını aceleyle $85$ yerine yanlış toplamanın; A şıkkı ($65$) ise açıları çıkarıp $90^\circ$'ye tamamlamaya çalışan adayın düştüğü tuzaktır.

### mat-12-024
- zorluk: 2
- dogru: A
- dogrulama: 44 + (180 - 44) / 4

**Soru:**
Şekildeki $ABC$ ikizkenar üçgeninde $|AB| = |AC|$, $[BD]$ açıortay ve $m(\widehat{BAC}) = 44^\circ$ veriliyor.
Buna göre $m(\widehat{BDC}) = x$ kaç derecedir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [4, 9.9],
    "B": [0, 0],
    "C": [8, 0],
    "D": [6.287, 4.24]
  },
  "labelPos": {
    "A": "top",
    "B": "bl",
    "C": "br",
    "D": "tr"
  },
  "shapes": [
    { "type": "polygon", "points": ["A", "B", "C"] },
    { "type": "segment", "from": "A", "to": "B", "ticks": 1 },
    { "type": "segment", "from": "A", "to": "C", "ticks": 1 },
    { "type": "segment", "from": "B", "to": "D" },
    { "type": "angle", "vertex": "A", "from": "B", "to": "C", "label": "44°", "radius": 24 },
    { "type": "angle", "vertex": "B", "from": "A", "to": "D", "radius": 22 },
    { "type": "angle", "vertex": "B", "from": "D", "to": "C", "radius": 26 },
    { "type": "angle", "vertex": "D", "from": "B", "to": "C", "label": "x", "radius": 22 }
  ]
}
```

**Şıklar:**
A) 78
B) 82
C) 84
D) 92
E) 102

**Açıklama:**
$|AB| = |AC|$ olduğu için $ABC$ üçgeninin taban açıları eşittir:
$$m(\widehat{ABC}) = m(\widehat{ACB}) = \frac{180^\circ - 44^\circ}{2} = 68^\circ$$
$[BD]$ açıortay olduğundan $m(\widehat{ABD}) = m(\widehat{DBC}) = \dfrac{68^\circ}{2} = 34^\circ$ olur. $ABD$ üçgeninde iki iç açının toplamı komşu olmayan dış açıya eşittir:
$$x = m(\widehat{BDC}) = 44^\circ + 34^\circ = 78^\circ$$

**Çeldirici Tuzağı:**
E şıkkı ($102$), $x$ olarak sorulan $\widehat{BDC}$ açısı yerine bütünleri olan $\widehat{ADB} = 180^\circ - 78^\circ = 102^\circ$ açısını bulanların işaretlediği güçlü çeldiricidir.

### mat-12-025
- zorluk: 2
- dogru: C
- dogrulama: sqrt((15^2 / 9)^2 - 15^2)

**Soru:**
Şekildeki $ABC$ dik üçgeninde $m(\widehat{BAC}) = 90^\circ$ ve $[AH] \perp [BC]$ veriliyor. $|AB| = 15$ cm ve $|BH| = 9$ cm olduğuna göre $|AC| = x$ kaç cm'dir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [4.5, 6],
    "B": [0, 0],
    "H": [4.5, 0],
    "C": [12.5, 0]
  },
  "labelPos": {
    "A": "top",
    "B": "bl",
    "H": "bottom",
    "C": "br"
  },
  "shapes": [
    { "type": "polygon", "points": ["A", "B", "C"] },
    { "type": "segment", "from": "A", "to": "H" },
    { "type": "segment", "from": "A", "to": "B", "label": "15" },
    { "type": "segment", "from": "B", "to": "H", "label": "9" },
    { "type": "segment", "from": "A", "to": "C", "label": "x", "labelSide": "in" },
    { "type": "angle", "vertex": "A", "from": "B", "to": "C", "right": true },
    { "type": "angle", "vertex": "H", "from": "A", "to": "C", "right": true }
  ]
}
```

**Şıklar:**
A) 16
B) 18
C) 20
D) 22
E) 24

**Açıklama:**
$ABC$ dik üçgeninde Öklid bağıntısı uygulanır:
$$|AB|^2 = |BH| \cdot |BC| \Rightarrow 15^2 = 9 \cdot |BC| \Rightarrow |BC| = \frac{225}{9} = 25\text{ cm}$$
Böylece $ABC$ dik üçgeni $15-20-25$ ($3-4-5$ üçgeninin $5$ katı) özel dik üçgeni olur ve $x = |AC| = 20$ cm bulunur (alternatif olarak $|HC| = 25 - 9 = 16$ üzerinden $|AC| = \sqrt{16 \cdot 25} = 20$ elde edilir).

**Çeldirici Tuzağı:**
A şıkkı ($16$), $|BC| = 25$ bulup $|HC| = 25 - 9 = 16$ parçasını doğrudan $|AC|$ sanan adayı; D şıkkı ($22$) ise Öklid yerine yanlış orantı kuranları yakalar.

### mat-12-026
- zorluk: 2
- dogru: B
- dogrulama: 12 / 2 * sqrt(2)

**Soru:**
Şekildeki $ABC$ üçgeninde $m(\widehat{ABC}) = 45^\circ$, $m(\widehat{ACB}) = 30^\circ$ ve $|AC| = 12$ cm veriliyor.
Buna göre $|AB| = x$ kaç cm'dir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [6, 6],
    "B": [0, 0],
    "C": [16.392, 0]
  },
  "labelPos": {
    "A": "top",
    "B": "bl",
    "C": "br"
  },
  "shapes": [
    { "type": "polygon", "points": ["A", "B", "C"] },
    { "type": "segment", "from": "A", "to": "C", "label": "12" },
    { "type": "segment", "from": "A", "to": "B", "label": "x" },
    { "type": "angle", "vertex": "B", "from": "A", "to": "C", "label": "45°", "radius": 24 },
    { "type": "angle", "vertex": "C", "from": "B", "to": "A", "label": "30°", "radius": 30 }
  ]
}
```

**Şıklar:**
A) 6
B) $6\sqrt{2}$
C) $6\sqrt{3}$
D) $8\sqrt{2}$
E) 12

**Açıklama:**
$A$ köşesinden $[BC]$ kenarına $[AH] \perp [BC]$ yüksekliği indirilir. Oluşan $AHC$ üçgeni $30^\circ-60^\circ-90^\circ$ üçgeni olduğundan $30^\circ$'nin karşısındaki yükseklik hipotenüsün yarısıdır: $|AH| = \dfrac{12}{2} = 6$ cm. Soldaki $ABH$ üçgeni $45^\circ-45^\circ-90^\circ$ ikizkenar dik üçgeni olduğundan hipotenüs $x = |AB| = 6\sqrt{2}$ cm bulunur.

**Çeldirici Tuzağı:**
C şıkkı ($6\sqrt{3}$), $45^\circ-45^\circ-90^\circ$ oranı ($\sqrt{2}$) ile $30^\circ-60^\circ-90^\circ$ kenar oranı ($\sqrt{3}$) çarpımını karıştıran; A şıkkı ($6$) ise yalnızca yükseklik uzunluğunda duran adayı yakalar.

### mat-12-027
- zorluk: 3
- dogru: E
- dogrulama: 5 * 6 / (9 - 6)

**Soru:**
Şekildeki $ABC$ üçgeninde $[AD]$ dış açıortaydır ($m(\widehat{CAD}) = m(\widehat{DAE})$). $|AB| = 9$ cm, $|AC| = 6$ cm ve $|BC| = 5$ cm olduğuna göre $|CD| = x$ kaç cm'dir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "B": [0, 0],
    "C": [5, 0],
    "D": [15, 0],
    "A": [7, 5.657],
    "E": [10.5, 8.485]
  },
  "labelPos": {
    "B": "bl",
    "C": "bottom",
    "D": "br",
    "A": "tl",
    "E": "tr"
  },
  "shapes": [
    { "type": "polygon", "points": ["A", "B", "C"] },
    { "type": "segment", "from": "A", "to": "B", "label": "9" },
    { "type": "segment", "from": "A", "to": "C", "label": "6", "labelSide": "in" },
    { "type": "segment", "from": "B", "to": "C", "label": "5" },
    { "type": "segment", "from": "C", "to": "D", "label": "x" },
    { "type": "segment", "from": "A", "to": "D" },
    { "type": "segment", "from": "A", "to": "E", "style": "dashed" },
    { "type": "angle", "vertex": "A", "from": "E", "to": "D", "radius": 20 },
    { "type": "angle", "vertex": "A", "from": "D", "to": "C", "radius": 24 }
  ]
}
```

**Şıklar:**
A) 6
B) 7
C) 8
D) 9
E) 10

**Açıklama:**
Dış açıortay teoremine göre dış açıortayın uzantı üzerindeki bitim noktasından yakın ve uzak köşelere olan uzaklıklarının oranı, komşu üçgen kenarlarının oranına eşittir:
$$\frac{|CD|}{|BD|} = \frac{|AC|}{|AB|} \Rightarrow \frac{x}{x + 5} = \frac{6}{9} = \frac{2}{3}$$
İçler dışlar çarpımıyla $3x = 2x + 10 \Rightarrow x = 10$ cm bulunur.

**Çeldirici Tuzağı:**
C şıkkı ($8$) veya D şıkkı ($9$), dış açıortay oranını kurarken paydaya tüm $|BD| = x + 5$ yerine yanlışlıkla sadece $|BC| = 5$ yazarak $\dfrac{x}{5} = \dfrac{9}{6}$ gibi ters/hatalı orantılar kuran adayları düşürür.

### mat-12-028
- zorluk: 1
- dogru: C
- dogrulama: (8 + 5 - 1) - (8 - 5) - 2

**Soru:**
Kenar uzunlukları $5$ cm, $8$ cm ve $x$ cm olan bir **çeşitkenar** üçgende $x$'in alabileceği kaç farklı tam sayı değeri vardır?

**Şıklar:**
A) 5
B) 6
C) 7
D) 8
E) 9

**Açıklama:**
Üçgen eşitsizliğine göre $x$ kenarı diğer iki kenarın farkından büyük, toplamından küçük olmalıdır:
$$8 - 5 < x < 8 + 5 \Rightarrow 3 < x < 13$$
Bu aralıktaki tam sayılar $\{4, 5, 6, 7, 8, 9, 10, 11, 12\}$ olmak üzere $9$ tanedir. Ancak üçgen **çeşitkenar** olduğundan $x \neq 5$ ve $x \neq 8$ olmalıdır. Bu iki değer çıkarılırsa $9 - 2 = 7$ farklı tam sayı değeri kalır.

**Çeldirici Tuzağı:**
E şıkkı ($9$), üçgen eşitsizliğini doğru kurduktan sonra sorudaki "çeşitkenar" koşulunu atlayıp $5$ ve $8$ değerlerini de sayan adayların neredeyse tamamının düştüğü sorudaki kelime tuzağıdır.

### mat-12-029
- zorluk: 2
- dogru: D
- dogrulama: 30 * 15 / (15 + 10)

**Soru:**
Şekilde $AB \parallel DE$ ve $[AE] \cap [BD] = \{C\}$ veriliyor. $|AB| = 15$ cm, $|DE| = 10$ cm ve $|BD| = 30$ cm olduğuna göre $|BC| = x$ kaç cm'dir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [0, 10],
    "B": [15, 10],
    "C": [7.5, 4],
    "D": [2.5, 0],
    "E": [12.5, 0]
  },
  "labelPos": {
    "A": "tl",
    "B": "tr",
    "C": "right",
    "D": "bl",
    "E": "br"
  },
  "shapes": [
    { "type": "polygon", "points": ["A", "B", "C"] },
    { "type": "polygon", "points": ["D", "E", "C"] },
    { "type": "segment", "from": "A", "to": "B", "label": "15" },
    { "type": "segment", "from": "D", "to": "E", "label": "10" }
  ]
}
```

**Şıklar:**
A) 10
B) 12
C) 15
D) 18
E) 20

**Açıklama:**
$AB \parallel DE$ olduğundan $ABC$ ve $EDC$ üçgenleri kelebek benzerliğiyle benzerdir:
$$\frac{|BC|}{|CD|} = \frac{|AB|}{|DE|} = \frac{15}{10} = \frac{3}{2}$$
Buradan $|BC| = 3k$ ve $|CD| = 2k$ yazılırsa $|BD| = 5k = 30 \Rightarrow k = 6$ olur. Aranan uzunluk $x = |BC| = 3 \cdot 6 = 18$ cm bulunur.

**Çeldirici Tuzağı:**
B şıkkı ($12$), $k = 6$ bulduktan sonra büyük parça olan $|BC| = 3k$ yerine küçük parça olan $|CD| = 2k = 12$ uzunluğunu işaretleyen; C şıkkı ($15$) ise $30$'u doğrudan ikiye bölen adayı yakalar.

### mat-12-030
- zorluk: 2
- dogru: E
- dogrulama: 4 * 3 * 3

**Soru:**
Şekildeki $ABC$ üçgeninde $|BD| = 2|DC|$ ve $|AE| = 2|ED|$ veriliyor.
$\text{Alan}(\triangle EDC) = 4\text{ cm}^2$ olduğuna göre $\text{Alan}(\triangle ABC)$ kaç $\text{cm}^2$'dir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [5, 9],
    "B": [0, 0],
    "C": [12, 0],
    "D": [8, 0],
    "E": [7, 3]
  },
  "labelPos": {
    "A": "top",
    "B": "bl",
    "C": "br",
    "D": "bottom",
    "E": "tl"
  },
  "shapes": [
    { "type": "polygon", "points": ["A", "B", "C"] },
    { "type": "polygon", "points": ["E", "D", "C"], "fill": true },
    { "type": "segment", "from": "A", "to": "D" },
    { "type": "segment", "from": "B", "to": "D", "label": "2k" },
    { "type": "segment", "from": "D", "to": "C", "label": "k" },
    { "type": "segment", "from": "A", "to": "E", "label": "2m", "labelSide": "in" },
    { "type": "segment", "from": "E", "to": "D", "label": "m", "labelSide": "in" }
  ]
}
```

**Şıklar:**
A) 18
B) 24
C) 27
D) 32
E) 36

**Açıklama:**
Yükseklikleri ortak olan üçgenlerin alanları tabanlarıyla orantılıdır. Önce $ADC$ üçgeninde $C$ köşesinden bakılırsa $|AE| = 2|ED|$ olduğundan $\text{Alan}(\triangle AEC) = 2 \cdot \text{Alan}(\triangle EDC) = 2 \cdot 4 = 8\text{ cm}^2$ ve buradan $\text{Alan}(\triangle ADC) = 8 + 4 = 12\text{ cm}^2$ olur.
Ardından $ABC$ üçgeninde $A$ köşesinden bakılırsa $|BD| = 2|DC|$ olduğundan $\text{Alan}(\triangle ABD) = 2 \cdot 12 = 24\text{ cm}^2$ bulunur. Tüm alan $\text{Alan}(\triangle ABC) = 24 + 12 = 36\text{ cm}^2$'dir.

**Çeldirici Tuzağı:**
B şıkkı ($24$), $\text{Alan}(\triangle ABD) = 24$ değerini tüm üçgenin alanı sanıp $\text{Alan}(\triangle ADC) = 12$'yi eklemeyi unutanları; A şıkkı ($18$) ise oranları $2$ yerine $3/2$ gibi alan hatası yapanları yakalar.

### mat-12-031
- zorluk: 1
- dogru: B
- dogrulama: 3 * 3 + 10 + 10 / 2

**Soru:**
Şekildeki $ABC$ üçgeninde $G$ noktası ağırlık merkezi ($|BD| = |DC|$ ve $|AE| = |EC|$) olup $|GD| = 3$ cm ve $|BG| = 10$ cm'dir.
Buna göre $|AD| + |BE|$ toplamı kaç cm'dir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [4, 9],
    "B": [0, 0],
    "C": [12, 0],
    "D": [6, 0],
    "E": [8, 4.5],
    "G": [5.333, 3]
  },
  "dots": ["G"],
  "labelPos": {
    "A": "top",
    "B": "bl",
    "C": "br",
    "D": "bottom",
    "E": "tr",
    "G": "tl"
  },
  "shapes": [
    { "type": "polygon", "points": ["A", "B", "C"] },
    { "type": "segment", "from": "A", "to": "D" },
    { "type": "segment", "from": "B", "to": "E" },
    { "type": "segment", "from": "B", "to": "D", "ticks": 1 },
    { "type": "segment", "from": "D", "to": "C", "ticks": 1 },
    { "type": "segment", "from": "A", "to": "E", "ticks": 2 },
    { "type": "segment", "from": "E", "to": "C", "ticks": 2 },
    { "type": "segment", "from": "G", "to": "D", "label": "3", "labelSide": "in" },
    { "type": "segment", "from": "B", "to": "G", "label": "10" }
  ]
}
```

**Şıklar:**
A) 21
B) 24
C) 26
D) 27
E) 30

**Açıklama:**
Ağırlık merkezi $G$, her kenarortayı köşeye $2$, kenara $1$ oranında böler:
- $|AG| = 2|GD| = 2 \cdot 3 = 6\text{ cm} \Rightarrow |AD| = 6 + 3 = 9\text{ cm}$.
- $|GE| = \dfrac{|BG|}{2} = \dfrac{10}{2} = 5\text{ cm} \Rightarrow |BE| = 10 + 5 = 15\text{ cm}$.
Bu iki kenarortayın toplamı $|AD| + |BE| = 9 + 15 = 24$ cm bulunur.

**Çeldirici Tuzağı:**
A şıkkı ($21$), $|AG| = 6$ ve $|GE| = 5$ bulunduktan sonra soru $|AD| + |BE|$ toplamını istediği hâlde eksik parça eklemesiyle $6 + 15$ veya $9 + 12$ gibi hatalı toplam yapanları; E şıkkı ($30$) ise $|BG|$ için de $2$ ile çarpıp $10 + 20$ yazanları yakalar.

### mat-12-032
- zorluk: 2
- dogru: A
- dogrulama: 6 * (12 + 6) / 12

**Soru:**
Şekildeki $ABC$ üçgeninde $DE \parallel BC$ ve $[BE]$ açıortaydır ($m(\widehat{ABE}) = m(\widehat{EBC})$). $|AD| = 12$ cm ve $|BD| = 6$ cm olduğuna göre $|BC| = x$ kaç cm'dir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [10, 14.967],
    "B": [0, 0],
    "C": [9, 0],
    "D": [3.333, 4.989],
    "E": [9.333, 4.989]
  },
  "labelPos": {
    "A": "top",
    "B": "bl",
    "C": "br",
    "D": "tl",
    "E": "tr"
  },
  "shapes": [
    { "type": "polygon", "points": ["A", "B", "C"] },
    { "type": "segment", "from": "D", "to": "E" },
    { "type": "segment", "from": "B", "to": "E" },
    { "type": "segment", "from": "A", "to": "D", "label": "12" },
    { "type": "segment", "from": "B", "to": "D", "label": "6" },
    { "type": "segment", "from": "B", "to": "C", "label": "x" },
    { "type": "angle", "vertex": "B", "from": "A", "to": "E", "radius": 22 },
    { "type": "angle", "vertex": "B", "from": "E", "to": "C", "radius": 26 }
  ]
}
```

**Şıklar:**
A) 9
B) 10
C) 11
D) 12
E) 14

**Açıklama:**
$DE \parallel BC$ ve $[BE]$ açıortay olduğundan iç ters açılardan $m(\widehat{DEB}) = m(\widehat{EBC}) = m(\widehat{DBE})$ elde edilir. Bu nedenle $BDE$ üçgeni ikizkenardır ve $|DE| = |BD| = 6$ cm olur.
$DE \parallel BC$ paralelliğinden Tales (temel orantı) benzerliği kurulur:
$$\frac{|AD|}{|AB|} = \frac{|DE|}{|BC|} \Rightarrow \frac{12}{12 + 6} = \frac{6}{x} \Rightarrow \frac{12}{18} = \frac{6}{x} \Rightarrow \frac{2}{3} = \frac{6}{x} \Rightarrow x = 9\text{ cm}$$

**Çeldirici Tuzağı:**
D şıkkı ($12$), temel orantıda $|AD|/|AB| = 12/18$ yerine dikkatsizce $|AD|/|BD| = 12/6$ yazıp $\dfrac{12}{6} = \dfrac{6}{x}$ (veya tersi) hatasıyla $12$ bulanları yakalar.

### mat-12-033
- zorluk: 3
- dogru: D
- dogrulama: 50 / 2

**Soru:**
Şekildeki $ABC$ üçgeninde $|AB| = |AC|$, $|AD| = |AE|$ ve $m(\widehat{BAD}) = 50^\circ$ veriliyor.
Buna göre $m(\widehat{EDC}) = x$ kaç derecedir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [7, 10],
    "B": [0, 0],
    "C": [14, 0],
    "D": [9.679, 0],
    "E": [12.937, 1.519]
  },
  "labelPos": {
    "A": "top",
    "B": "bl",
    "C": "br",
    "D": "bottom",
    "E": "tr"
  },
  "shapes": [
    { "type": "polygon", "points": ["A", "B", "C"] },
    { "type": "segment", "from": "A", "to": "D", "ticks": 1 },
    { "type": "segment", "from": "A", "to": "E", "ticks": 1 },
    { "type": "segment", "from": "D", "to": "E" },
    { "type": "angle", "vertex": "A", "from": "B", "to": "D", "label": "50°", "radius": 26 },
    { "type": "angle", "vertex": "D", "from": "E", "to": "C", "label": "x", "radius": 24 }
  ]
}
```

**Şıklar:**
A) 15
B) 20
C) 22
D) 25
E) 50

**Açıklama:**
$|AB| = |AC|$ olduğundan taban açılarına $m(\widehat{B}) = m(\widehat{C}) = \beta$ diyelim.
$ABD$ üçgeninde dış açı özelliğinden $m(\widehat{ADC}) = \beta + 50^\circ$ olur. O hâlde $m(\widehat{ADE}) = \beta + 50^\circ - x$'tir.
Diğer yandan $EDC$ üçgeninde $m(\widehat{AED})$ dış açısı $\beta + x$'e eşittir. $|AD| = |AE|$ ikizkenarlığından $m(\widehat{ADE}) = m(\widehat{AED})$ yazılır:
$$\beta + 50^\circ - x = \beta + x \Rightarrow 2x = 50^\circ \Rightarrow x = 25^\circ$$

**Çeldirici Tuzağı:**
E şıkkı ($50$), $|AD| = |AE|$ açılarındaki $\beta$ bilinmeyenini sadeleştirmeyip açının doğrudan $50^\circ$'ye eşit olacağını tahmin eden adayı yakalar. Oysa $\beta$'nın değeri ne olursa olsun $x$ her zaman $\widehat{BAD}$ açısının yarısıdır.

### mat-12-034
- zorluk: 1
- dogru: A
- dogrulama: (5 + 9 + (9 - 5 + 1)) + (5 + 9 + (9 + 5 - 1))

**Soru:**
Kenar uzunlukları birer tam sayı olan bir $ABC$ üçgeninin iki kenar uzunluğu $5$ cm ve $9$ cm'dir.
Buna göre bu üçgenin çevresinin alabileceği **en büyük** değer ile **en küçük** değerin toplamı kaç cm'dir?

**Şıklar:**
A) 46
B) 44
C) 42
D) 40
E) 38

**Açıklama:**
Üçgenin üçüncü kenarı $c$ olmak üzere üçgen eşitsizliği uygulanır:
$$9 - 5 < c < 9 + 5 \Rightarrow 4 < c < 14$$
Kenar uzunlukları tam sayı olduğundan $c$'nin en küçük değeri $5$ cm, en büyük değeri $13$ cm olur (soruda çeşitkenar şartı aranmamaktadır).
- En küçük çevre: $5 + 9 + 5 = 19$ cm
- En büyük çevre: $5 + 9 + 13 = 27$ cm
İki değerin toplamı $19 + 27 = 46$ cm bulunur.

**Çeldirici Tuzağı:**
B şıkkı ($44$), soruda "çeşitkenar" koşulu verilmediği hâlde $c = 5$ değerini eleyip en küçük kenarı $c = 6$ ($20 + 27 = 47$ veya farklı hatalı sınırlarla $44$) alan adayı; E şıkkı ($38$) ise uç sınırları karıştıranları yakalar.

### mat-12-035
- zorluk: 2
- dogru: C
- dogrulama: sqrt((2 * 13)^2 - (2 * 5)^2)

**Soru:**
Şekildeki $ABC$ dik üçgeninde $m(\widehat{BAC}) = 90^\circ$, $[DE] \perp [AC]$, $|BD| = |DC|$, $|AD| = 13$ cm ve $|DE| = 5$ cm veriliyor.
Buna göre $|AC| = x$ kaç cm'dir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [0, 0],
    "B": [0, 5],
    "C": [12, 0],
    "D": [6, 2.5],
    "E": [6, 0]
  },
  "labelPos": {
    "A": "bl",
    "B": "tl",
    "C": "br",
    "D": "tr",
    "E": "bottom"
  },
  "shapes": [
    { "type": "polygon", "points": ["A", "B", "C"] },
    { "type": "segment", "from": "A", "to": "D", "label": "13" },
    { "type": "segment", "from": "D", "to": "E", "label": "5" },
    { "type": "segment", "from": "B", "to": "D", "ticks": 1 },
    { "type": "segment", "from": "D", "to": "C", "ticks": 1 },
    { "type": "segment", "from": "A", "to": "C", "label": "x", "labelSide": "in" },
    { "type": "angle", "vertex": "A", "from": "B", "to": "C", "right": true },
    { "type": "angle", "vertex": "E", "from": "D", "to": "C", "right": true }
  ]
}
```

**Şıklar:**
A) 18
B) 20
C) 24
D) 25
E) 26

**Açıklama:**
$m(\widehat{BAC}) = 90^\circ$ ve $[DE] \perp [AC]$ olduğu için $DE \parallel AB$'dir. $D$ noktası $[BC]$'nin orta noktası olduğundan $[DE]$ orta tabandır ve $|AB| = 2|DE| = 2 \cdot 5 = 10$ cm bulunur.
Diğer yandan dik üçgende hipotenüse ait kenarortay hipotenüsün yarısına eşittir (muhteşem üçlü): $|BD| = |DC| = |AD| = 13$ cm, yani $|BC| = 26$ cm olur.
$ABC$ üçgeninde $10-24-26$ ($5-12-13$ üçgeninin $2$ katı) özel dik üçgeninden $x = |AC| = 24$ cm elde edilir.

**Çeldirici Tuzağı:**
E şıkkı ($26$), hipotenüs uzunluğu olan $|BC| = 26$ değerini bulup Pisagor adımına geçmeden işaretleyen; B şıkkı ($20$) ise $13$'ün yerine yanlışlıkla $5-12-13$ üçgeninin katlarını karıştıran adayları hedefler.

### mat-12-036
- zorluk: 3
- dogru: B
- dogrulama: 10 * (16 * 6 / sqrt(10^2 - 6^2)) / 2

**Soru:**
Şekildeki $ABC$ dik üçgeninde $m(\widehat{ABC}) = 90^\circ$ ve $[AD]$ açıortaydır ($m(\widehat{BAD}) = m(\widehat{DAC})$). $|BD| = 6$ cm ve $|DC| = 10$ cm olduğuna göre boyalı $ADC$ üçgeninin alanı kaç $\text{cm}^2$'dir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [0, 12],
    "B": [0, 0],
    "C": [16, 0],
    "D": [6, 0]
  },
  "labelPos": {
    "A": "top",
    "B": "bl",
    "C": "br",
    "D": "bottom"
  },
  "shapes": [
    { "type": "polygon", "points": ["A", "B", "C"] },
    { "type": "polygon", "points": ["A", "D", "C"], "fill": true },
    { "type": "segment", "from": "A", "to": "D" },
    { "type": "segment", "from": "B", "to": "D", "label": "6" },
    { "type": "segment", "from": "D", "to": "C", "label": "10" },
    { "type": "angle", "vertex": "B", "from": "A", "to": "C", "right": true },
    { "type": "angle", "vertex": "A", "from": "B", "to": "D", "radius": 22 },
    { "type": "angle", "vertex": "A", "from": "D", "to": "C", "radius": 26 }
  ]
}
```

**Şıklar:**
A) 48
B) 60
C) 72
D) 80
E) 96

**Açıklama:**
İç açıortay teoremine göre $\dfrac{|AB|}{|AC|} = \dfrac{|BD|}{|DC|} = \dfrac{6}{10} = \dfrac{3}{5}$ olduğundan $|AB| = 3k$ ve $|AC| = 5k$ yazılır.
$ABC$ dik üçgeninde $|BC| = 6 + 10 = 16$ cm olup $3k - 4k - 5k$ özel dik üçgeninden $4k = 16 \Rightarrow k = 4$ bulunur. Buradan dik kenar $|AB| = 3 \cdot 4 = 12$ cm olur.
$[DC]$ tabanına ait $ADC$ üçgeninin dışarıdan düşen yüksekliği $|AB| = 12$ cm olduğundan:
$$\text{Alan}(\triangle ADC) = \frac{|DC| \cdot |AB|}{2} = \frac{10 \cdot 12}{2} = 60\text{ cm}^2$$

**Çeldirici Tuzağı:**
E şıkkı ($96$), $|AB| = 12$ bulunduktan sonra yalnızca boyalı $ADC$ üçgeninin alanı yerine tüm $ABC$ üçgeninin alanını ($\dfrac{16 \cdot 12}{2} = 96$) işaretleyen adayı yakalar.


### mat-12-037
- zorluk: 1
- dogru: A
- dogrulama: 360 - 135 - 115

**Soru:**
Şekilde $[BA \parallel [DE$, $m(\widehat{ABC}) = 135^\circ$ ve $m(\widehat{CDE}) = 115^\circ$ veriliyor.
Buna göre $m(\widehat{BCD}) = x$ kaç derecedir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [0, 8],
    "B": [4, 8],
    "C": [8, 4],
    "D": [6.135, 0],
    "E": [0, 0]
  },
  "labelPos": {
    "A": "left",
    "B": "top",
    "C": "right",
    "D": "bottom",
    "E": "left"
  },
  "shapes": [
    { "type": "segment", "from": "A", "to": "B" },
    { "type": "segment", "from": "B", "to": "C" },
    { "type": "segment", "from": "C", "to": "D" },
    { "type": "segment", "from": "D", "to": "E" },
    { "type": "angle", "vertex": "B", "from": "A", "to": "C", "label": "135°", "radius": 24 },
    { "type": "angle", "vertex": "D", "from": "C", "to": "E", "label": "115°", "radius": 24 },
    { "type": "angle", "vertex": "C", "from": "B", "to": "D", "label": "x", "radius": 24 }
  ]
}
```

**Şıklar:**
A) 110
B) 115
C) 120
D) 125
E) 130

**Açıklama:**
Paralel iki ışın arasındaki "kalem ucu" (U toplamı) kuralına göre üç iç açının toplamı $360^\circ$'dir:
$$135^\circ + x + 115^\circ = 360^\circ \Rightarrow 250^\circ + x = 360^\circ \Rightarrow x = 110^\circ$$

**Çeldirici Tuzağı:**
C şıkkı ($120$) veya D şıkkı ($125$), $135 + 115 = 250$ toplamını yaparken $240$ ya da $235$ bulmaktan; ya da U kuralındaki toplamı iki paralel açı gibi $180^\circ$ sanmaya çalışmaktan kaynaklanır.

### mat-12-038
- zorluk: 2
- dogru: B
- dogrulama: (74 - 38) / 2

**Soru:**
Şekildeki $ABC$ üçgeninde $[AH] \perp [BC]$ ve $[AN]$ açıortaydır ($m(\widehat{BAN}) = m(\widehat{NAC})$). $m(\widehat{ABC}) = 74^\circ$ ve $m(\widehat{ACB}) = 38^\circ$ olduğuna göre $m(\widehat{HAN}) = x$ kaç derecedir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [0, 7],
    "B": [-2.007, 0],
    "H": [0, 0],
    "N": [2.274, 0],
    "C": [8.96, 0]
  },
  "labelPos": {
    "A": "top",
    "B": "bl",
    "H": "bottom",
    "N": "bottom",
    "C": "br"
  },
  "shapes": [
    { "type": "polygon", "points": ["A", "B", "C"] },
    { "type": "segment", "from": "A", "to": "H" },
    { "type": "segment", "from": "A", "to": "N" },
    { "type": "angle", "vertex": "H", "from": "A", "to": "C", "right": true },
    { "type": "angle", "vertex": "B", "from": "A", "to": "C", "label": "74°", "radius": 22 },
    { "type": "angle", "vertex": "C", "from": "B", "to": "A", "label": "38°", "radius": 28 },
    { "type": "angle", "vertex": "A", "from": "H", "to": "N", "label": "x", "radius": 38 }
  ]
}
```

**Şıklar:**
A) 14
B) 18
C) 22
D) 28
E) 36

**Açıklama:**
$ABC$ üçgeninde $m(\widehat{BAC}) = 180^\circ - (74^\circ + 38^\circ) = 68^\circ$'dir. $[AN]$ açıortay olduğundan $m(\widehat{BAN}) = 34^\circ$ olur. Diğer yandan $ABH$ dik üçgeninde $m(\widehat{BAH}) = 90^\circ - 74^\circ = 16^\circ$'dir. Bu iki açı arasındaki fark:
$$x = m(\widehat{HAN}) = 34^\circ - 16^\circ = 18^\circ$$
(Kısa yoldan $x = \dfrac{|74^\circ - 38^\circ|}{2} = 18^\circ$).

**Çeldirici Tuzağı:**
E şıkkı ($36$), $|74^\circ - 38^\circ| = 36^\circ$ farkını bulup $2$'ye bölmeyi unutan adayı; A şıkkı ($14$) ise $m(\widehat{BAH})$ değerini $90 - 74 = 16$ yerine hatalı hesaplayanları yakalar.

### mat-12-039
- zorluk: 2
- dogru: C
- dogrulama: 5 + sqrt(12^2 + 5^2)

**Soru:**
Şekildeki $ABC$ dik üçgeninde $m(\widehat{BAC}) = 90^\circ$, $|BD| = |DC|$ ve $[DE] \perp [BC]$ veriliyor. $|AB| = 12$ cm ve $|AE| = 5$ cm olduğuna göre $|AC|$ kaç cm'dir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [0, 0],
    "B": [0, 12],
    "C": [18, 0],
    "D": [9, 6],
    "E": [5, 0]
  },
  "labelPos": {
    "A": "bl",
    "B": "tl",
    "C": "br",
    "D": "tr",
    "E": "bottom"
  },
  "shapes": [
    { "type": "polygon", "points": ["A", "B", "C"] },
    { "type": "segment", "from": "D", "to": "E" },
    { "type": "segment", "from": "B", "to": "E", "style": "dashed" },
    { "type": "segment", "from": "B", "to": "D", "ticks": 1 },
    { "type": "segment", "from": "D", "to": "C", "ticks": 1 },
    { "type": "segment", "from": "A", "to": "B", "label": "12" },
    { "type": "segment", "from": "A", "to": "E", "label": "5" },
    { "type": "angle", "vertex": "A", "from": "B", "to": "C", "right": true },
    { "type": "angle", "vertex": "D", "from": "E", "to": "C", "right": true }
  ]
}
```

**Şıklar:**
A) 13
B) 15
C) 18
D) 20
E) 24

**Açıklama:**
$[DE]$ doğrusu $[BC]$ kenarının orta dikmesidir (hem dik hem iki eş parçaya böler). Bu nedenle $E$ noktasından $B$ ve $C$ köşelerine uzaklıklar eşittir: $|BE| = |EC|$.
$BAE$ dik üçgeninde $5-12-13$ özel üçgeninden $|BE| = 13$ cm bulunur; dolayısıyla $|EC| = 13$ cm'dir. Buradan $|AC| = |AE| + |EC| = 5 + 13 = 18$ cm elde edilir.

**Çeldirici Tuzağı:**
A şıkkı ($13$), $5-12-13$ özel üçgeniyle $|EC| = 13$ cm değerini bulduktan sonra $|AE| = 5$ parçasını ekleyip $|AC|$ uzunluğunu tamamlamadan işaretleyen adayı yakalar.

### mat-12-040
- zorluk: 3
- dogru: A
- dogrulama: sqrt((9^2 + 12^2) + (12^2 + (12 * 12 / 9)^2))

**Soru:**
Şekilde $B, C, D$ noktaları doğrusal olup $[AB] \perp [BD]$, $[AC] \perp [CE]$ ve $[ED] \perp [BD]$ veriliyor. $|AB| = 9$ cm, $|BC| = 12$ cm ve $|CD| = 12$ cm olduğuna göre $|AE|$ uzunluğu kaç cm'dir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [0, 9],
    "B": [0, 0],
    "C": [12, 0],
    "D": [24, 0],
    "E": [24, 16]
  },
  "labelPos": {
    "A": "tl",
    "B": "bl",
    "C": "bottom",
    "D": "br",
    "E": "tr"
  },
  "shapes": [
    { "type": "polygon", "points": ["A", "B", "C"] },
    { "type": "polygon", "points": ["C", "D", "E"] },
    { "type": "segment", "from": "A", "to": "E" },
    { "type": "segment", "from": "A", "to": "B", "label": "9" },
    { "type": "segment", "from": "B", "to": "C", "label": "12" },
    { "type": "segment", "from": "C", "to": "D", "label": "12" },
    { "type": "angle", "vertex": "B", "from": "A", "to": "C", "right": true },
    { "type": "angle", "vertex": "C", "from": "A", "to": "E", "right": true },
    { "type": "angle", "vertex": "D", "from": "C", "to": "E", "right": true }
  ]
}
```

**Şıklar:**
A) 25
B) 20
C) 24
D) 28
E) 30

**Açıklama:**
$ABC$ dik üçgeninde $9-12-15$ ($3-4-5$ üçgeninin $3$ katı) özel üçgeninden $|AC| = 15$ cm bulunur.
$C$ noktasındaki diklikten $m(\widehat{ACB}) + m(\widehat{ECD}) = 90^\circ$ olduğu için $ABC$ ve $CDE$ dik üçgenleri açı-açı benzeridir ($\triangle ABC \sim \triangle CDE$):
$$\frac{|AB|}{|CD|} = \frac{|BC|}{|DE|} \Rightarrow \frac{9}{12} = \frac{12}{|DE|} \Rightarrow |DE| = 16\text{ cm}$$
Böylece $CDE$ dik üçgeni $12-16-20$ üçgenidir ve $|CE| = 20$ cm olur. Son olarak $ACE$ dik üçgeninde $15-20-25$ özel üçgeninden $|AE| = 25$ cm bulunur.

**Çeldirici Tuzağı:**
B şıkkı ($20$), yalnızca $CDE$ üçgeninin hipotenüsü olan $|CE| = 20$ uzunluğunu bulup son $ACE$ Pisagor adımına geçmeyen adayı; C şıkkı ($24$) ise $|BD| = 24$ yatay mesafesini $|AE|$ ile karıştıranları yakalar.