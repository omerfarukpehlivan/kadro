---
ders: Matematik & Geometri
konu: Çokgenler, Dörtgenler ve Çember-Daire
kod: mat
kapsam: [lisans_gygk, b_grubu_gygk]
---

### mat-13-001
- zorluk: 1
- dogru: D
- dogrulama: (4 * 360 / 180 + 2) - 3

**Soru:**
Bir dışbükey çokgenin iç açılarının ölçüleri toplamı, dış açılarının ölçüleri toplamının $4$ katıdır.
Buna göre bu çokgenin bir köşesinden en fazla kaç tane köşegen çizilebilir?

**Şıklar:**
A) 5
B) 6
C) 8
D) 7
E) 10

**Açıklama:**
$n$ kenarlı bir dışbükey çokgenin iç açıları toplamı $(n - 2) \cdot 180^\circ$, dış açıları toplamı ise $360^\circ$'dir. Verilen koşuldan $(n - 2) \cdot 180 = 4 \cdot 360 \Rightarrow n - 2 = 8 \Rightarrow n = 10$ (on gen) bulunur. Bir köşesinden kendisine ve komşu iki köşeye köşegen çizilemediği için en fazla $n - 3 = 10 - 3 = 7$ köşegen çizilebilir.

**Çeldirici Tuzağı:**
E şıkkı (10), çokgenin kenar sayısını bulup sorunun istediği köşegen sayısını hesaplamadan $10$'u işaretleyen adayı yakalar. C şıkkı (8) ise $n - 2$ değerini seçenlerin tuzağıdır.

### mat-13-002
- zorluk: 2
- dogru: B
- dogrulama: (4 * 4 * sqrt(3)) / 2

**Soru:**
Şekildeki $ABCDEF$ düzgün altıgeninin bir kenar uzunluğu $4$ cm'dir.
Buna göre taralı $ACD$ üçgeninin alanı kaç cm²'dir?

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
  "labelPos": {
    "A": "right",
    "B": "tr",
    "C": "tl",
    "D": "left",
    "E": "bl",
    "F": "br"
  },
  "shapes": [
    { "type": "polygon", "points": ["A", "C", "D"], "fill": true },
    { "type": "polygon", "points": ["A", "B", "C", "D", "E", "F"] },
    { "type": "segment", "from": "A", "to": "B", "label": "4 cm" }
  ]
}
```

**Şıklar:**
A) $4\sqrt{3}$
B) $8\sqrt{3}$
C) $12\sqrt{3}$
D) $16$
E) $16\sqrt{3}$

**Açıklama:**
Düzgün altıgenin bir iç açısı $120^\circ$'dir. $ABC$ üçgeninde $|AB| = |BC| = 4$ cm ve $m(\widehat{B}) = 120^\circ$ olduğundan $[AC]$ kısa köşegeni $4\sqrt{3}$ cm ve $m(\widehat{BCA}) = 30^\circ$'dir. Altıgenin $C$ iç açısı $120^\circ$ olduğu için $m(\widehat{ACD}) = 120^\circ - 30^\circ = 90^\circ$ olur. $ACD$ dik üçgeninin dik kenarları $|CD| = 4$ cm ve $|AC| = 4\sqrt{3}$ cm olduğundan alanı $\dfrac{4 \cdot 4\sqrt{3}}{2} = 8\sqrt{3}$ cm² bulunur.

**Çeldirici Tuzağı:**
E şıkkı ($16\sqrt{3}$), dik üçgenin alan formülünde ikiye bölmeyi unutup $4 \cdot 4\sqrt{3}$ çarpan adayı yakalar. C şıkkı ($12\sqrt{3}$) ise altıgenin yarısının alanını hesaplayanların tuzağıdır.

### mat-13-003
- zorluk: 1
- dogru: A
- dogrulama: (6^2 / 2) * (2 / 3)

**Soru:**
Şekildeki $ABCD$ karesinin bir kenarı $6$ cm ve $[AC]$ köşegeni üzerinde $|AE| = 2|EC|$ olacak biçimde $E$ noktası alınmıştır.
Buna göre taralı $ABE$ üçgeninin alanı kaç cm²'dir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [0, 6],
    "B": [0, 0],
    "C": [6, 0],
    "D": [6, 6],
    "E": [4, 2]
  },
  "labelPos": {
    "A": "tl",
    "B": "bl",
    "C": "br",
    "D": "tr",
    "E": "tr"
  },
  "shapes": [
    { "type": "polygon", "points": ["A", "B", "E"], "fill": true },
    { "type": "polygon", "points": ["A", "B", "C", "D"] },
    { "type": "segment", "from": "A", "to": "C" },
    { "type": "segment", "from": "B", "to": "E" },
    { "type": "segment", "from": "A", "to": "B", "label": "6 cm" }
  ]
}
```

**Şıklar:**
A) 12
B) 6
C) 9
D) 18
E) 24

**Açıklama:**
Karenin alanı $6^2 = 36$ cm², $[AC]$ köşegeninin ayırdığı $ABC$ üçgeninin alanı ise $\dfrac{36}{2} = 18$ cm²'dir. $ABE$ ve $CBE$ üçgenlerinin $B$ köşesinden $[AC]$'ye inen yükseklikleri ortak olduğundan alanları tabanları oranındadır. $|AE| = 2|EC|$ verildiğine göre $ABE$ üçgeni $ABC$ alanının $\dfrac{2}{3}$'üne eşittir: $18 \cdot \dfrac{2}{3} = 12$ cm².

**Çeldirici Tuzağı:**
B şıkkı (6), taralı olmayan $CBE$ üçgeninin alanını ($18 \cdot \frac{1}{3} = 6$) işaretleyen adayı; D şıkkı (18) ise $ABC$ yarım karenin alanını seçenleri yakalar.

### mat-13-004
- zorluk: 2
- dogru: C
- dogrulama: 6 * (4 + (6 * 6) / 4)

**Soru:**
Şekildeki $ABCD$ dikdörtgeninde $E \in [DC]$ ve $AE \perp BE$'dir. $|AD| = 6$ cm ve $|DE| = 4$ cm olduğuna göre $ABCD$ dikdörtgeninin alanı kaç cm²'dir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [0, 0],
    "B": [13, 0],
    "C": [13, 6],
    "D": [0, 6],
    "E": [4, 6]
  },
  "labelPos": {
    "A": "bl",
    "B": "br",
    "C": "tr",
    "D": "tl",
    "E": "top"
  },
  "shapes": [
    { "type": "polygon", "points": ["A", "B", "C", "D"] },
    { "type": "segment", "from": "A", "to": "D", "label": "6" },
    { "type": "segment", "from": "D", "to": "E", "label": "4" },
    { "type": "segment", "from": "A", "to": "E" },
    { "type": "segment", "from": "B", "to": "E" },
    { "type": "angle", "vertex": "E", "from": "A", "to": "B", "right": true }
  ]
}
```

**Şıklar:**
A) 48
B) 54
C) 78
D) 84
E) 96

**Açıklama:**
$ADE$ ve $ECB$ dik üçgenlerinde $\widehat{DEA}$ ile $\widehat{CEB}$ açılarının toplamı $90^\circ$ olduğundan bu iki üçgen benzerdir ($ADE \sim ECB$). Benzerlikten $\dfrac{|AD|}{|EC|} = \dfrac{|DE|}{|CB|}$ yazılır. $|CB| = |AD| = 6$ cm olduğundan $\dfrac{6}{|EC|} = \dfrac{4}{6} \Rightarrow 4|EC| = 36 \Rightarrow |EC| = 9$ cm bulunur. Böylece uzun kenar $|DC| = 4 + 9 = 13$ cm ve dikdörtgenin alanı $6 \cdot 13 = 78$ cm² olur.

**Çeldirici Tuzağı:**
B şıkkı (54), $|EC| = 9$ cm uzunluğunu bulduktan sonra $|DE| = 4$ cm'yi eklemeden $6 \cdot 9 = 54$ alanını işaretleyen adayı yakalar.

### mat-13-005
- zorluk: 2
- dogru: E
- dogrulama: 2 * (5 + 2 * 5)

**Soru:**
Şekildeki $ABCD$ paralelkenarında $[AE]$ ve $[BE]$ sırasıyla $\widehat{DAB}$ ve $\widehat{CBA}$ açılarının açıortaylarıdır ($E \in [DC]$). $|AD| = 5$ cm olduğuna göre $ABCD$ paralelkenarının çevresi kaç cm'dir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [0, 0],
    "B": [10, 0],
    "C": [11.4, 4.8],
    "D": [1.4, 4.8],
    "E": [6.4, 4.8]
  },
  "labelPos": {
    "A": "bl",
    "B": "br",
    "C": "tr",
    "D": "tl",
    "E": "top"
  },
  "shapes": [
    { "type": "polygon", "points": ["A", "B", "C", "D"] },
    { "type": "segment", "from": "A", "to": "D", "label": "5" },
    { "type": "segment", "from": "A", "to": "E" },
    { "type": "segment", "from": "B", "to": "E" },
    { "type": "angle", "vertex": "A", "from": "D", "to": "E", "radius": 22 },
    { "type": "angle", "vertex": "A", "from": "E", "to": "B", "radius": 26 },
    { "type": "angle", "vertex": "B", "from": "A", "to": "E", "double": true, "radius": 22 },
    { "type": "angle", "vertex": "B", "from": "E", "to": "C", "double": true, "radius": 26 }
  ]
}
```

**Şıklar:**
A) 15
B) 20
C) 24
D) 25
E) 30

**Açıklama:**
$DC \parallel AB$ olduğundan iç ters açılar nedeniyle $m(\widehat{DEA}) = m(\widehat{EAB}) = m(\widehat{DAE})$ olur; buradan $ADE$ ikizkenar üçgen çıkar ve $|DE| = |AD| = 5$ cm bulunur. Aynı şekilde $m(\widehat{CEB}) = m(\widehat{EBA}) = m(\widehat{EBC})$ olduğundan $|EC| = |BC| = 5$ cm'dir. Dolayısıyla $|DC| = |AB| = 5 + 5 = 10$ cm olur. Paralelkenarın çevresi $2(5 + 10) = 30$ cm bulunur.

**Çeldirici Tuzağı:**
B şıkkı (20), paralelkenarın tabanını $10$ cm yerine $5$ cm sanan ($4 \cdot 5 = 20$) adayı; A şıkkı (15) ise yalnızca iki kenar toplamı $5 + 10 = 15$'i işaretleyenleri yakalar.

### mat-13-006
- zorluk: 2
- dogru: D
- dogrulama: ((5 + 11) / 2) * sqrt(10^2 - (11 - 5)^2)

**Soru:**
Şekildeki $ABCD$ dik yamuğunda $AB \parallel DC$, $AD \perp AB$, $|DC| = 5$ cm, $|AB| = 11$ cm ve $|BC| = 10$ cm'dir.
Buna göre $ABCD$ yamuğunun alanı kaç cm²'dir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [0, 0],
    "B": [11, 0],
    "C": [5, 8],
    "D": [0, 8]
  },
  "labelPos": {
    "A": "bl",
    "B": "br",
    "C": "tr",
    "D": "tl"
  },
  "shapes": [
    { "type": "polygon", "points": ["A", "B", "C", "D"] },
    { "type": "segment", "from": "D", "to": "C", "label": "5" },
    { "type": "segment", "from": "A", "to": "B", "label": "11" },
    { "type": "segment", "from": "B", "to": "C", "label": "10" },
    { "type": "angle", "vertex": "A", "from": "D", "to": "B", "right": true },
    { "type": "angle", "vertex": "D", "from": "A", "to": "C", "right": true }
  ]
}
```

**Şıklar:**
A) 48
B) 56
C) 60
D) 64
E) 80

**Açıklama:**
$C$ köşesinden $[AB]$ tabanına $CH$ yüksekliği indirilirse $AHCD$ dikdörtgeni oluşur ve $|AH| = |DC| = 5$ cm, dolayısıyla $|HB| = 11 - 5 = 6$ cm kalır. $CHB$ dik üçgeninde $6-8-10$ özel üçgeninden yükseklik $|CH| = \sqrt{10^2 - 6^2} = 8$ cm bulunur. Yamuğun alanı $\dfrac{\text{Alt taban} + \text{Üst taban}}{2} \cdot h = \dfrac{11 + 5}{2} \cdot 8 = 8 \cdot 8 = 64$ cm² olur.

**Çeldirici Tuzağı:**
E şıkkı (80), dikme indirip yüksekliği $8$ bulmak yerine yan kenar olan $10$ cm'yi doğrudan yükseklik alıp $\dfrac{11 + 5}{2} \cdot 10 = 80$ hesaplayan adayı yakalar.

### mat-13-007
- zorluk: 1
- dogru: B
- dogrulama: 90 - 28

**Soru:**
Şekildeki $O$ merkezli çemberde $[AB]$ çap, $C$ ve $D$ çember üzerinde noktalardır. $m(\widehat{CAB}) = 28^\circ$ olduğuna göre $m(\widehat{ADC}) = x$ kaç derecedir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "O": [0, 0],
    "A": [-4, 0],
    "B": [4, 0],
    "C": [2.237, 3.316],
    "D": [2, -3.464]
  },
  "dots": ["O"],
  "labelPos": {
    "O": "bottom",
    "A": "left",
    "B": "right",
    "C": "tr",
    "D": "br"
  },
  "shapes": [
    { "type": "circle", "center": "O", "through": "A" },
    { "type": "segment", "from": "A", "to": "B" },
    { "type": "segment", "from": "A", "to": "C" },
    { "type": "segment", "from": "A", "to": "D" },
    { "type": "segment", "from": "D", "to": "C" },
    { "type": "angle", "vertex": "A", "from": "B", "to": "C", "label": "28°", "radius": 32 },
    { "type": "angle", "vertex": "D", "from": "A", "to": "C", "label": "x", "radius": 28 }
  ]
}
```

**Şıklar:**
A) 56
B) 62
C) 64
D) 72
E) 118

**Açıklama:**
$m(\widehat{CAB}) = 28^\circ$ çevre açısının gördüğü $BC$ yayı $2 \cdot 28^\circ = 56^\circ$'dir. $[AB]$ çap olduğu için üst yarım çember $180^\circ$'dir; dolayısıyla $AC$ yayının ölçüsü $180^\circ - 56^\circ = 124^\circ$ olur. İstenen $x = m(\widehat{ADC})$ çevre açısı da $AC$ yayını gördüğü için $x = \dfrac{124^\circ}{2} = 62^\circ$ bulunur.

**Çeldirici Tuzağı:**
A şıkkı (56), $BC$ yayının ölçüsünü ($56^\circ$) bulup yarım çemberden çıkarmayı unutan ya da $\widehat{ADC}$ açısını $BC$ yayını görüyor sanan adayı yakalar.

### mat-13-008
- zorluk: 2
- dogru: D
- dogrulama: sqrt(5^2 + (24 / 2)^2)

**Soru:**
Şekildeki $O$ merkezli çemberde $[AB]$ kiriş ve $OH \perp AB$'dir. $|OH| = 5$ cm ve $|AB| = 24$ cm olduğuna göre çemberin yarıçapı kaç cm'dir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "O": [0, 0],
    "H": [0, -5],
    "A": [-12, -5],
    "B": [12, -5]
  },
  "dots": ["O"],
  "labelPos": {
    "O": "top",
    "H": "bottom",
    "A": "bl",
    "B": "br"
  },
  "shapes": [
    { "type": "circle", "center": "O", "radius": 13 },
    { "type": "segment", "from": "A", "to": "B" },
    { "type": "segment", "from": "O", "to": "H", "label": "5", "labelSide": "in" },
    { "type": "segment", "from": "O", "to": "B", "label": "r" },
    { "type": "angle", "vertex": "H", "from": "O", "to": "B", "right": true }
  ]
}
```

**Şıklar:**
A) 10
B) 12
C) $\sqrt{601}$
D) 13
E) 17

**Açıklama:**
Merkezden kirişe indirilen dikme kirişi iki eşit parçaya böler: $|AH| = |HB| = \dfrac{24}{2} = 12$ cm. Oluşan $OHB$ dik üçgeninde $5-12-13$ özel üçgeninden yarıçap $r = \sqrt{5^2 + 12^2} = 13$ cm bulunur.

**Çeldirici Tuzağı:**
C şıkkı ($\sqrt{601}$), merkezden inen dikmenin kirişi ikiye böldüğünü unutup $12$ yerine kirişin tamamı olan $24$'ü Pisagor'da ($\sqrt{5^2 + 24^2}$) kullanan adayı yakalar.

### mat-13-009
- zorluk: 3
- dogru: A
- dogrulama: (8^2 - 4^2) / (2 * 4)

**Soru:**
Şekildeki $O$ merkezli çembere $PT$ ışını $T$ noktasında teğettir. $P, A, O, B$ noktaları doğrusal, $|PA| = 4$ cm ve $|PT| = 8$ cm olduğuna göre çemberin yarıçapı kaç cm'dir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "O": [0, 0],
    "A": [-6, 0],
    "B": [6, 0],
    "P": [-10, 0],
    "T": [-3.6, 4.8]
  },
  "dots": ["O", "T"],
  "labelPos": {
    "O": "bottom",
    "A": "bottom",
    "B": "right",
    "P": "left",
    "T": "top"
  },
  "shapes": [
    { "type": "circle", "center": "O", "radius": 6 },
    { "type": "segment", "from": "P", "to": "B" },
    { "type": "segment", "from": "P", "to": "T", "label": "8" },
    { "type": "segment", "from": "P", "to": "A", "label": "4" },
    { "type": "segment", "from": "O", "to": "T", "label": "r", "dashed": true },
    { "type": "angle", "vertex": "T", "from": "P", "to": "O", "right": true }
  ]
}
```

**Şıklar:**
A) 6
B) 8
C) 10
D) 12
E) 16

**Açıklama:**
Merkezden teğet değme noktasına çizilen yarıçap teğete diktir ($OT \perp PT$). Çemberin yarıçapına $r$ denirse $|PO| = 4 + r$ olur. $PTO$ dik üçgeninde Pisagor bağıntısı yazılır:
$r^2 + 8^2 = (r + 4)^2 \Rightarrow r^2 + 64 = r^2 + 8r + 16 \Rightarrow 8r = 48 \Rightarrow r = 6$ cm bulunur. (Çemberde kuvvet bağıntısından $|PT|^2 = |PA| \cdot |PB| \Rightarrow 64 = 4(4 + 2r)$ ile de aynı sonuç elde edilir.)

**Çeldirici Tuzağı:**
D şıkkı (12), $64 = 4 \cdot |PB| \Rightarrow |PB| = 16 \Rightarrow |AB| = 12$ bulup çapı yarıçap sanarak $12$'yi işaretleyen adayı yakalar.

### mat-13-010
- zorluk: 1
- dogru: C
- dogrulama: pi * 6^2 * (60 / 360)

**Soru:**
Şekildeki $O$ merkezli, $6$ cm yarıçaplı dairede $m(\widehat{AOB}) = 60^\circ$'dir.
Buna göre taralı daire diliminin alanı kaç cm²'dir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "O": [0, 0],
    "B": [6, 0],
    "A": [3, 5.196]
  },
  "dots": ["O"],
  "labelPos": {
    "O": "bl",
    "B": "right",
    "A": "tr"
  },
  "shapes": [
    { "type": "circle", "center": "O", "radius": 6 },
    { "type": "sector", "center": "O", "from": "B", "to": "A" },
    { "type": "segment", "from": "O", "to": "B", "label": "6 cm" },
    { "type": "segment", "from": "O", "to": "A" },
    { "type": "angle", "vertex": "O", "from": "B", "to": "A", "label": "60°", "radius": 26 }
  ]
}
```

**Şıklar:**
A) $2\pi$
B) $4\pi$
C) $6\pi$
D) $9\pi$
E) $12\pi$

**Açıklama:**
Daire diliminin alanı $\pi r^2 \cdot \dfrac{\alpha}{360^\circ}$ formülüyle hesaplanır. $r = 6$ cm ve $\alpha = 60^\circ$ yerine konursa $\pi \cdot 6^2 \cdot \dfrac{60}{360} = 36\pi \cdot \dfrac{1}{6} = 6\pi$ cm² bulunur.

**Çeldirici Tuzağı:**
A şıkkı ($2\pi$), alan formülü ($\pi r^2$) yerine yay uzunluğu formülünü ($2\pi r \cdot \frac{60}{360} = 2\pi$) hesaplayan adayı yakalar.

### mat-13-011
- zorluk: 2
- dogru: E
- dogrulama: pi * (16 / 2)^2 * ((360 - 135) / 360)

**Soru:**
Çevresi $16\pi$ cm olan bir daireden merkez açısı $135^\circ$ olan bir daire dilimi kesilip çıkarılıyor.
Buna göre kalan daire parçasının alanı kaç cm²'dir?

**Şıklar:**
A) $24\pi$
B) $30\pi$
C) $32\pi$
D) $36\pi$
E) $40\pi$

**Açıklama:**
Dairenin çevresi $2\pi r = 16\pi \Rightarrow r = 8$ cm bulunur. $135^\circ$'lik dilim çıkarıldığında geriye $360^\circ - 135^\circ = 225^\circ$'lik bir daire dilimi kalır. Kalan alan $\pi \cdot 8^2 \cdot \dfrac{225}{360} = 64\pi \cdot \dfrac{5}{8} = 40\pi$ cm² olur.

**Çeldirici Tuzağı:**
A şıkkı ($24\pi$), kalan bölgenin alanı yerine kesilip çıkarılan $135^\circ$'lik dilimin alanını ($\pi \cdot 64 \cdot \frac{3}{8} = 24\pi$) işaretleyen adayı yakalar.

### mat-13-012
- zorluk: 3
- dogru: B
- dogrulama: 6^2 - (pi * 6^2) / 4

**Soru:**
Şekildeki $ABCD$ karesinin bir kenar uzunluğu $6$ cm'dir.
$B$ merkezli $6$ cm yarıçaplı çeyrek daire karenin içine çizildiğine göre karenin taralı olmayan bölgesinin alanı kaç cm²'dir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [0, 6],
    "B": [0, 0],
    "C": [6, 0],
    "D": [6, 6]
  },
  "labelPos": {
    "A": "tl",
    "B": "bl",
    "C": "br",
    "D": "tr"
  },
  "shapes": [
    { "type": "sector", "center": "B", "from": "C", "to": "A" },
    { "type": "polygon", "points": ["A", "B", "C", "D"] },
    { "type": "segment", "from": "A", "to": "B", "label": "6 cm" }
  ]
}
```

**Şıklar:**
A) $36 - 6\pi$
B) $36 - 9\pi$
C) $36 - 18\pi$
D) $9\pi$
E) $24 - 9\pi$

**Açıklama:**
$ABCD$ karesinin alanı $6^2 = 36$ cm²'dir. $B$ merkezli ve $6$ cm yarıçaplı taralı çeyrek dairenin alanı $\dfrac{\pi \cdot 6^2}{4} = 9\pi$ cm²'dir. Taralı olmayan bölgenin alanı, karenin alanından çeyrek dairenin alanının çıkarılmasıyla $36 - 9\pi$ cm² bulunur.

**Çeldirici Tuzağı:**
D şıkkı ($9\pi$), sorulan taralı olmayan bölge yerine taralı çeyrek dairenin alanını işaretleyen; C şıkkı ($36 - 18\pi$) ise çeyrek daire ($90^\circ$) yerine yarım daire ($180^\circ$) alanı çıkaran adayı yakalar.

### mat-13-013
- zorluk: 1
- dogru: A
- dogrulama: 180 - 2 * ((180 - (5 - 2) * 180 / 5) / 2)

**Soru:**
Şekildeki $ABCDE$ düzgün beşgeninde $[AC]$ ve $[BE]$ köşegenleri $P$ noktasında kesişmektedir.
Buna göre $m(\widehat{APB}) = x$ kaç derecedir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [0, 4],
    "B": [-3.804, 1.236],
    "C": [-2.351, -3.236],
    "D": [2.351, -3.236],
    "E": [3.804, 1.236],
    "P": [-0.898, 1.236]
  },
  "labelPos": {
    "A": "top",
    "B": "left",
    "C": "bl",
    "D": "br",
    "E": "right",
    "P": "br"
  },
  "shapes": [
    { "type": "polygon", "points": ["A", "B", "C", "D", "E"] },
    { "type": "segment", "from": "A", "to": "C" },
    { "type": "segment", "from": "B", "to": "E" },
    { "type": "angle", "vertex": "P", "from": "B", "to": "A", "label": "x", "radius": 22 }
  ]
}
```

**Şıklar:**
A) 108
B) 72
C) 90
D) 100
E) 120

**Açıklama:**
Düzgün beşgenin bir iç açısı $\dfrac{(5 - 2) \cdot 180^\circ}{5} = 108^\circ$'dir. $ABC$ ve $BAE$ ikizkenar üçgenlerinin tepe açıları $108^\circ$ olduğu için taban açıları $\dfrac{180^\circ - 108^\circ}{2} = 36^\circ$ olur; yani $m(\widehat{BAC}) = 36^\circ$ ve $m(\widehat{ABE}) = 36^\circ$'dir. $ABP$ üçgeninin iç açıları toplamından $x = 180^\circ - (36^\circ + 36^\circ) = 108^\circ$ bulunur.

**Çeldirici Tuzağı:**
B şıkkı (72), $m(\widehat{APB})$ iç açısı yerine bütünleri olan $m(\widehat{BPC}) = 72^\circ$ dış açısını işaretleyen adayı yakalar.

### mat-13-014
- zorluk: 1
- dogru: C
- dogrulama: 180 - 2 * 28

**Soru:**
Şekildeki $ABCD$ dikdörtgeninin köşegenleri $E$ noktasında kesişmektedir.
$m(\widehat{EAB}) = 28^\circ$ olduğuna göre $m(\widehat{AEB}) = x$ kaç derecedir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [0, 0],
    "B": [10, 0],
    "C": [10, 5.317],
    "D": [0, 5.317],
    "E": [5, 2.659]
  },
  "labelPos": {
    "A": "bl",
    "B": "br",
    "C": "tr",
    "D": "tl",
    "E": "top"
  },
  "shapes": [
    { "type": "polygon", "points": ["A", "B", "C", "D"] },
    { "type": "segment", "from": "A", "to": "C" },
    { "type": "segment", "from": "B", "to": "D" },
    { "type": "angle", "vertex": "A", "from": "B", "to": "E", "label": "28°", "radius": 32 },
    { "type": "angle", "vertex": "E", "from": "A", "to": "B", "label": "x", "radius": 24 }
  ]
}
```

**Şıklar:**
A) 56
B) 118
C) 124
D) 136
E) 152

**Açıklama:**
Dikdörtgenin köşegenleri eşit uzunlukta olup birbirini ortalar; bu nedenle $|EA| = |EB|$ olur ve $AEB$ ikizkenar üçgen elde edilir. Taban açıları eşit olduğundan $m(\widehat{EBA}) = m(\widehat{EAB}) = 28^\circ$ bulunur. Üçgenin iç açıları toplamından $x = 180^\circ - (28^\circ + 28^\circ) = 124^\circ$ olur.

**Çeldirici Tuzağı:**
A şıkkı (56), $m(\widehat{AEB})$ yerine bütünleri olan $m(\widehat{BEC}) = 28^\circ + 28^\circ = 56^\circ$ açısını işaretleyen adayı yakalar.

### mat-13-015
- zorluk: 2
- dogru: E
- dogrulama: (12 * (2 * sqrt(10^2 - (12 / 2)^2))) / 2

**Soru:**
Şekildeki $ABCD$ eşkenar dörtgeninde $|AB| = 10$ cm ve $|BD| = 12$ cm'dir.
Buna göre $ABCD$ eşkenar dörtgeninin alanı kaç cm²'dir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [0, 0],
    "B": [10, 0],
    "C": [12.8, 9.6],
    "D": [2.8, 9.6],
    "O": [6.4, 4.8]
  },
  "labelPos": {
    "A": "bl",
    "B": "br",
    "C": "tr",
    "D": "tl",
    "O": "top"
  },
  "shapes": [
    { "type": "polygon", "points": ["A", "B", "C", "D"] },
    { "type": "segment", "from": "A", "to": "B", "label": "10", "ticks": 1 },
    { "type": "segment", "from": "B", "to": "C", "ticks": 1 },
    { "type": "segment", "from": "C", "to": "D", "ticks": 1 },
    { "type": "segment", "from": "D", "to": "A", "ticks": 1 },
    { "type": "segment", "from": "A", "to": "C" },
    { "type": "segment", "from": "B", "to": "D" }
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
Eşkenar dörtgende köşegenler birbirini dik ortalar. $|BD| = 12$ cm olduğundan $|BO| = |OD| = 6$ cm olur. $AOB$ dik üçgeninde $6-8-10$ özel üçgeninden $|AO| = \sqrt{10^2 - 6^2} = 8$ cm, dolayısıyla diğer köşegen $|AC| = 2 \cdot 8 = 16$ cm bulunur. Eşkenar dörtgenin alanı köşegenler çarpımının yarısıdır: $\dfrac{12 \cdot 16}{2} = 96$ cm².

**Çeldirici Tuzağı:**
A şıkkı (48), $|AO| = 8$ cm değerini bulduktan sonra $2$ ile çarpıp tüm köşegeni ($16$ cm) almak yerine $\dfrac{12 \cdot 8}{2} = 48$ hesaplayan adayı yakalar.

### mat-13-016
- zorluk: 2
- dogru: A
- dogrulama: (20 * 15) / sqrt(20^2 + 15^2)

**Soru:**
Şekildeki $ABCD$ dikdörtgeninde $BH \perp AC$, $|AB| = 20$ cm ve $|BC| = 15$ cm'dir.
Buna göre $|BH| = x$ kaç cm'dir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [0, 0],
    "B": [20, 0],
    "C": [20, 15],
    "D": [0, 15],
    "H": [12.8, 9.6]
  },
  "labelPos": {
    "A": "bl",
    "B": "br",
    "C": "tr",
    "D": "tl",
    "H": "tl"
  },
  "shapes": [
    { "type": "polygon", "points": ["A", "B", "C", "D"] },
    { "type": "segment", "from": "A", "to": "B", "label": "20" },
    { "type": "segment", "from": "B", "to": "C", "label": "15" },
    { "type": "segment", "from": "A", "to": "C" },
    { "type": "segment", "from": "B", "to": "H", "label": "x", "labelSide": "in" },
    { "type": "angle", "vertex": "H", "from": "A", "to": "B", "right": true }
  ]
}
```

**Şıklar:**
A) 12
B) 9
C) 10
D) 14
E) 16

**Açıklama:**
$ABC$ dik üçgeninde $15-20-25$ ($3-4-5$'in $5$ katı) özel üçgeninden $|AC| = \sqrt{20^2 + 15^2} = 25$ cm bulunur. $ABC$ dik üçgeninin alanı iki farklı yoldan eşitlenir: $\dfrac{20 \cdot 15}{2} = \dfrac{25 \cdot x}{2} \Rightarrow 300 = 25x \Rightarrow x = 12$ cm bulunur.

**Çeldirici Tuzağı:**
E şıkkı (16) veya B şıkkı (9), Öklid bağlantısından ayırdığı $|AH| = 16$ ve $|HC| = 9$ parçalarından birini yükseklik $|BH|$ yerine işaretleyen adayı yakalar.

### mat-13-017
- zorluk: 2
- dogru: D
- dogrulama: ((14 + 6) / 2) * sqrt(5^2 - ((14 - 6) / 2)^2)

**Soru:**
Şekildeki $ABCD$ ikizkenar yamuğunda $DC \parallel AB$, $|AD| = |BC| = 5$ cm, $|DC| = 6$ cm ve $|AB| = 14$ cm'dir.
Buna göre $ABCD$ yamuğunun alanı kaç cm²'dir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [0, 0],
    "B": [14, 0],
    "C": [10, 3],
    "D": [4, 3]
  },
  "labelPos": {
    "A": "bl",
    "B": "br",
    "C": "tr",
    "D": "tl"
  },
  "shapes": [
    { "type": "polygon", "points": ["A", "B", "C", "D"] },
    { "type": "segment", "from": "A", "to": "D", "label": "5", "ticks": 1 },
    { "type": "segment", "from": "B", "to": "C", "label": "5", "ticks": 1 },
    { "type": "segment", "from": "D", "to": "C", "label": "6" },
    { "type": "segment", "from": "A", "to": "B", "label": "14" }
  ]
}
```

**Şıklar:**
A) 20
B) 24
C) 40
D) 30
E) 50

**Açıklama:**
$D$ ve $C$ köşelerinden $[AB]$ tabanına dikmeler indirildiğinde ortada $6$ cm'lik parça kalır ve iki uçtaki eşit parçalar $\dfrac{14 - 6}{2} = 4$'er cm olur. Yanlardaki $3-4-5$ dik üçgenlerinden yamuğun yüksekliği $h = \sqrt{5^2 - 4^2} = 3$ cm bulunur. Yamuğun alanı $\dfrac{14 + 6}{2} \cdot 3 = 10 \cdot 3 = 30$ cm²'dir.

**Çeldirici Tuzağı:**
E şıkkı (50), yüksekliği $3$ cm bulmak yerine yan kenar uzunluğu $5$ cm'yi yükseklik sanıp $\dfrac{14 + 6}{2} \cdot 5 = 50$ hesaplayan adayı yakalar.

### mat-13-018
- zorluk: 1
- dogru: B
- dogrulama: 180 - 50

**Soru:**
Şekildeki $O$ merkezli çembere $P$ noktasından $A$ ve $B$ noktalarında teğet olan $PA$ ve $PB$ ışınları çizilmiştir.
$m(\widehat{APB}) = 50^\circ$ olduğuna göre $m(\widehat{AOB}) = x$ kaç derecedir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "O": [0, 0],
    "A": [-1.69, 3.625],
    "B": [-1.69, -3.625],
    "P": [-9.465, 0]
  },
  "dots": ["O", "A", "B"],
  "labelPos": {
    "O": "right",
    "A": "top",
    "B": "bottom",
    "P": "left"
  },
  "shapes": [
    { "type": "circle", "center": "O", "radius": 4 },
    { "type": "segment", "from": "P", "to": "A" },
    { "type": "segment", "from": "P", "to": "B" },
    { "type": "segment", "from": "O", "to": "A" },
    { "type": "segment", "from": "O", "to": "B" },
    { "type": "angle", "vertex": "P", "from": "B", "to": "A", "label": "50°", "radius": 28 },
    { "type": "angle", "vertex": "O", "from": "A", "to": "B", "label": "x", "radius": 24 }
  ]
}
```

**Şıklar:**
A) 100
B) 130
C) 115
D) 140
E) 150

**Açıklama:**
Merkezden teğet değme noktalarına çizilen yarıçaplar teğetlere diktir: $m(\widehat{OAP}) = m(\widehat{OBP}) = 90^\circ$. $PAOB$ dörtgeninin iç açıları toplamı $360^\circ$ olduğundan $x + 50^\circ + 90^\circ + 90^\circ = 360^\circ \Rightarrow x = 180^\circ - 50^\circ = 130^\circ$ bulunur.

**Çeldirici Tuzağı:**
A şıkkı (100), $m(\widehat{AOB})$ merkez açısını $m(\widehat{APB})$ dış açısının $2$ katı ($2 \cdot 50^\circ = 100^\circ$) sanan adayı yakalar.

### mat-13-019
- zorluk: 2
- dogru: C
- dogrulama: 37 + 23

**Soru:**
Şekildeki çemberde $[AC]$ ve $[BD]$ kirişleri $E$ noktasında kesişmektedir. $m(\widehat{ADB}) = 37^\circ$ ve $m(\widehat{CAD}) = 23^\circ$ olduğuna göre $m(\widehat{AEB}) = x$ kaç derecedir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [-3.064, 2.571],
    "B": [-3.316, -2.237],
    "C": [3.595, -1.754],
    "D": [3.759, 1.368],
    "E": [0.973, -0.051]
  },
  "labelPos": {
    "A": "tl",
    "B": "bl",
    "C": "br",
    "D": "tr",
    "E": "bottom"
  },
  "shapes": [
    { "type": "circle", "center": [0, 0], "radius": 4 },
    { "type": "segment", "from": "A", "to": "C" },
    { "type": "segment", "from": "B", "to": "D" },
    { "type": "segment", "from": "A", "to": "D" },
    { "type": "angle", "vertex": "D", "from": "B", "to": "A", "label": "37°", "radius": 32 },
    { "type": "angle", "vertex": "A", "from": "C", "to": "D", "label": "23°", "radius": 34 },
    { "type": "angle", "vertex": "E", "from": "A", "to": "B", "label": "x", "radius": 24 }
  ]
}
```

**Şıklar:**
A) 30
B) 50
C) 60
D) 74
E) 120

**Açıklama:**
$AED$ üçgeninde $m(\widehat{AEB}) = x$ açısı, $E$ köşesine ait dış açıdır ve kendisine komşu olmayan iki iç açının toplamına eşittir: $x = 37^\circ + 23^\circ = 60^\circ$ bulunur. (Çemberdeki iç açı kuralından $\widehat{AB} = 74^\circ$ ve $\widehat{CD} = 46^\circ$ yaylarının yarı toplamı $\dfrac{74^\circ + 46^\circ}{2} = 60^\circ$ ile de aynı sonuca ulaşılır.)

**Çeldirici Tuzağı:**
E şıkkı (120), $m(\widehat{AED}) = 180^\circ - 60^\circ = 120^\circ$ açısını bulup bütünler olan $x$'i değil $120^\circ$'yi işaretleyen adayı yakalar.

### mat-13-020
- zorluk: 2
- dogru: E
- dogrulama: 7 + 11 - 9

**Soru:**
Bir çemberin tüm kenarlarına içten teğet olduğu $ABCD$ teğetler dörtgeninde $|AB| = 7$ cm, $|BC| = 9$ cm ve $|CD| = 11$ cm'dir.
Buna göre $|AD|$ uzunluğu kaç cm'dir?

**Şıklar:**
A) 5
B) 7
C) 10
D) 13
E) 9

**Açıklama:**
Teğetler dörtgeninde karşılıklı kenar uzunluklarının toplamı birbirine eşittir: $|AB| + |CD| = |BC| + |AD|$. Verilen değerler yerine konursa $7 + 11 = 9 + |AD| \Rightarrow 18 = 9 + |AD| \Rightarrow |AD| = 9$ cm bulunur.

**Çeldirici Tuzağı:**
D şıkkı (13), karşılıklı kenarlar yerine komşu kenarları toplayıp $7 + 9 = 11 + |AD| \Rightarrow |AD| = 5$ (A şıkkı) veya $9 + 11 - 7 = 13$ bulan adayı yakalar.

### mat-13-021
- zorluk: 1
- dogru: A
- dogrulama: pi * (8 / 2)^2

**Soru:**
Şekildeki $O$ merkezli iç içe iki çemberden dıştakinin $[AB]$ kirişi, içteki çembere $H$ noktasında teğettir. $|AB| = 8$ cm olduğuna göre iki çember arasında kalan daire halkasının alanı kaç cm²'dir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "O": [0, 0],
    "H": [0, -3],
    "A": [-4, -3],
    "B": [4, -3]
  },
  "dots": ["O", "H"],
  "labelPos": {
    "O": "top",
    "H": "bottom",
    "A": "bl",
    "B": "br"
  },
  "shapes": [
    { "type": "circle", "center": "O", "radius": 5 },
    { "type": "circle", "center": "O", "radius": 3 },
    { "type": "segment", "from": "A", "to": "B" },
    { "type": "segment", "from": "O", "to": "H" },
    { "type": "segment", "from": "O", "to": "B", "dashed": true },
    { "type": "angle", "vertex": "H", "from": "O", "to": "B", "right": true }
  ]
}
```

**Şıklar:**
A) $16\pi$
B) $8\pi$
C) $24\pi$
D) $32\pi$
E) $64\pi$

**Açıklama:**
Merkezden teğet değme noktası $H$'ye inen yarıçap kirişe diktir ve kirişi iki eşit parçaya böler: $|HB| = \dfrac{8}{2} = 4$ cm. Büyüğün yarıçapı $R = |OB|$, küçüğün yarıçapı $r = |OH|$ olmak üzere $OHB$ dik üçgeninde Pisagor yazılırsa $R^2 - r^2 = |HB|^2 = 4^2 = 16$ bulunur. Daire halkasının alanı $\pi R^2 - \pi r^2 = \pi(R^2 - r^2) = 16\pi$ cm²'dir.

**Çeldirici Tuzağı:**
E şıkkı ($64\pi$), $|AB| = 8$ kirişini ikiye bölmeden doğrudan karesini ($8^2 = 64\pi$) alan adayı yakalar.

### mat-13-022
- zorluk: 2
- dogru: A
- dogrulama: pi * ((6 * 360) / (2 * 72))^2 * (72 / 360)

**Soru:**
Bir çemberde $72^\circ$'lik merkez açının gördüğü yayın uzunluğu $6\pi$ cm olduğuna göre, aynı merkez açılı **daire diliminin alanı** kaç $\text{cm}^2$'dir?

**Şıklar:**
A) $45\pi$
B) $30\pi$
C) $60\pi$
D) $75\pi$
E) $225\pi$

**Açıklama:**
Önce yay uzunluğu formülünden yarıçap $r$ bulunur:
$$2\pi r \cdot \frac{72^\circ}{360^\circ} = 6\pi \Rightarrow 2\pi r \cdot \frac{1}{5} = 6\pi \Rightarrow r = 15\text{ cm}$$
Aynı $72^\circ$'lik daire diliminin alanı ise:
$$\pi \cdot 15^2 \cdot \frac{72^\circ}{360^\circ} = 225\pi \cdot \frac{1}{5} = 45\pi\text{ cm}^2$$
bulunur.

**Çeldirici Tuzağı:**
E şıkkı ($225\pi$), $r = 15$ değerini bulduktan sonra daire dilimi yerine tüm dairenin alanını ($\pi \cdot 15^2 = 225\pi$) işaretleyen adayı yakalar.

### mat-13-023
- zorluk: 3
- dogru: B
- dogrulama: (4 * 3) * (2 * 3) - 2 * pi * 3^2

**Soru:**
Şekildeki $ABCD$ dikdörtgeninin içine, birbirine ve dikdörtgenin kenarlarına teğet olacak biçimde $3$ cm yarıçaplı iki eş daire çizilmiştir.
Buna göre dikdörtgenin içinde olup dairelerin dışında kalan taralı olmayan bölgenin alanı kaç cm²'dir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [0, 0],
    "B": [12, 0],
    "C": [12, 6],
    "D": [0, 6],
    "O₁": [3, 3],
    "O₂": [9, 3]
  },
  "dots": ["O₁", "O₂"],
  "hideLabels": ["O₁", "O₂"],
  "labelPos": {
    "A": "bl",
    "B": "br",
    "C": "tr",
    "D": "tl"
  },
  "shapes": [
    { "type": "circle", "center": "O₁", "radius": 3, "fill": true },
    { "type": "circle", "center": "O₂", "radius": 3, "fill": true },
    { "type": "polygon", "points": ["A", "B", "C", "D"] },
    { "type": "segment", "from": "O₁", "to": [6, 3], "label": "3", "labelSide": "in" }
  ]
}
```

**Şıklar:**
A) $72 - 9\pi$
B) $72 - 18\pi$
C) $36 - 18\pi$
D) $72 - 36\pi$
E) $18\pi$

**Açıklama:**
Her bir dairenin çapı $2 \cdot 3 = 6$ cm olduğundan dikdörtgenin kısa kenarı $6$ cm, yan yana iki daireden dolayı uzun kenarı ise $6 + 6 = 12$ cm'dir. Dikdörtgenin alanı $12 \cdot 6 = 72$ cm², iki eş dairenin toplam alanı ise $2 \cdot (\pi \cdot 3^2) = 18\pi$ cm² bulunur. Taralı olmayan bölgenin alanı $72 - 18\pi$ cm²'dir.

**Çeldirici Tuzağı:**
A şıkkı ($72 - 9\pi$), iki dairenin alanını toplamak yerine yalnızca bir dairenin alanını ($9\pi$) çıkaran adayı; C şıkkı ($36 - 18\pi$) ise dikdörtgenin kenarlarını $6$ ve $6$ alanların düştüğü tuzaktır.

### mat-13-024
- zorluk: 3
- dogru: D
- dogrulama: 10 * 2 * 3

**Soru:**
Şekildeki $ABCD$ paralelkenarında $E \in [DC]$ ve $|DE| = 2|EC|$ verilmektedir.
Taralı $BCE$ üçgeninin alanı $10$ cm² olduğuna göre $ABCD$ paralelkenarının alanı kaç cm²'dir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [0, 0],
    "B": [9, 0],
    "C": [11, 5],
    "D": [2, 5],
    "E": [8, 5]
  },
  "labelPos": {
    "A": "bl",
    "B": "br",
    "C": "tr",
    "D": "tl",
    "E": "top"
  },
  "shapes": [
    { "type": "polygon", "points": ["B", "C", "E"], "fill": true },
    { "type": "polygon", "points": ["A", "B", "C", "D"] },
    { "type": "segment", "from": "D", "to": "E", "label": "2k" },
    { "type": "segment", "from": "E", "to": "C", "label": "k" },
    { "type": "segment", "from": "B", "to": "E" }
  ]
}
```

**Şıklar:**
A) 30
B) 40
C) 50
D) 60
E) 80

**Açıklama:**
Paralelkenarda $[BD]$ köşegeni çizilirse $BCD$ üçgeni paralelkenarın yarısı olur. $BDE$ ve $BCE$ üçgenlerinin yükseklikleri ortak olduğundan alanları tabanlarıyla orantılıdır: $|EC| = k$ tabanına $10$ cm² düşerse $|DE| = 2k$ tabanına $20$ cm² düşer. Dolayısıyla $\text{Alan}(\triangle BCD) = 10 + 20 = 30$ cm² olur. Paralelkenarın tamamı bunun $2$ katı olduğundan $2 \cdot 30 = 60$ cm² bulunur.

**Çeldirici Tuzağı:**
A şıkkı (30), $BCD$ üçgeninin alanını bulduktan sonra paralelkenarın yarısı olduğu için $2$ ile çarpmayı unutan adayı yakalar.


### mat-13-025
- zorluk: 1
- dogru: C
- dogrulama: (360 / 30) + (360 / (180 - 135))

**Soru:**
Bir dış açısının ölçüsü $30^\circ$ olan düzgün çokgen ile bir iç açısının ölçüsü $135^\circ$ olan düzgün çokgenin **kenar sayıları toplamı** kaçtır?

**Şıklar:**
A) 16
B) 18
C) 20
D) 22
E) 24

**Açıklama:**
Düzgün çokgenlerde kenar sayısı $n = \dfrac{360^\circ}{\text{Dış açı}}$ bağıntısıyla bulunur:
- İlk çokgenin dış açısı $30^\circ$ olduğundan kenar sayısı $n_1 = \dfrac{360}{30} = 12$'dir.
- İkinci çokgenin iç açısı $135^\circ$ olduğundan bir dış açısı $180^\circ - 135^\circ = 45^\circ$ ve kenar sayısı $n_2 = \dfrac{360}{45} = 8$'dir.
Kenar sayıları toplamı $12 + 8 = 20$ bulunur.

**Çeldirici Tuzağı:**
B şıkkı ($18$) veya A şıkkı ($16$), ikinci çokgenin dış açısını $180^\circ - 135^\circ = 45^\circ$ almak yerine bölmede $36^\circ$ veya hatalı tam bölen seçen adayı yakalar.

### mat-13-026
- zorluk: 1
- dogru: B
- dogrulama: 2 * 32

**Soru:**
Şekildeki $ABCD$ dikdörtgeninde $[AC]$ ve $[BD]$ köşegenleri $E$ noktasında kesişmektedir. $m(\widehat{CAB}) = 32^\circ$ olduğuna göre $m(\widehat{CEB}) = x$ kaç derecedir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [0, 0],
    "B": [10, 0],
    "C": [10, 6.249],
    "D": [0, 6.249],
    "E": [5, 3.124]
  },
  "labelPos": {
    "A": "bl",
    "B": "br",
    "C": "tr",
    "D": "tl",
    "E": "top"
  },
  "shapes": [
    { "type": "polygon", "points": ["A", "B", "C", "D"] },
    { "type": "segment", "from": "A", "to": "C" },
    { "type": "segment", "from": "B", "to": "D" },
    { "type": "angle", "vertex": "A", "from": "B", "to": "C", "label": "32°", "radius": 34 },
    { "type": "angle", "vertex": "E", "from": "B", "to": "C", "label": "x", "radius": 24 }
  ]
}
```

**Şıklar:**
A) 32
B) 64
C) 58
D) 116
E) 128

**Açıklama:**
Dikdörtgende köşegenler eşittir ve birbirini ortalar: $|EA| = |EB|$. $EAB$ ikizkenar üçgeninde $m(\widehat{EBA}) = m(\widehat{EAB}) = 32^\circ$ olur. $E$ köşesindeki dış açı iki iç açının toplamına eşittir: $x = m(\widehat{CEB}) = 32^\circ + 32^\circ = 64^\circ$ bulunur.

**Çeldirici Tuzağı:**
D şıkkı ($116$), soru $m(\widehat{CEB})$ dar açısını sorduğu hâlde $EAB$ üçgeninin tepe açısı $m(\widehat{AEB}) = 180^\circ - 64^\circ = 116^\circ$'yi işaretleyen adayı yakalar.

### mat-13-027
- zorluk: 2
- dogru: C
- dogrulama: 16 * (2 * sqrt((40 / 4)^2 - (16 / 2)^2)) / 2

**Soru:**
Şekildeki $ABCD$ eşkenar dörtgeninin çevresi $40$ cm ve köşegenlerinden biri $|AC| = 16$ cm'dir.
Buna göre $ABCD$ eşkenar dörtgeninin alanı kaç cm²'dir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [-8, 0],
    "B": [0, -6],
    "C": [8, 0],
    "D": [0, 6],
    "O": [0, 0]
  },
  "labelPos": {
    "A": "left",
    "B": "bottom",
    "C": "right",
    "D": "top",
    "O": "tl"
  },
  "shapes": [
    { "type": "polygon", "points": ["A", "B", "C", "D"] },
    { "type": "segment", "from": "A", "to": "C" },
    { "type": "segment", "from": "B", "to": "D" },
    { "type": "angle", "vertex": "O", "from": "D", "to": "C", "right": true }
  ]
}
```

**Şıklar:**
A) 48
B) 64
C) 96
D) 120
E) 160

**Açıklama:**
Eşkenar dörtgenin çevresi $40$ cm olduğundan bir kenarı $\dfrac{40}{4} = 10$ cm'dir. Köşegenler birbirini dik ortaladığından $|AO| = \dfrac{16}{2} = 8$ cm olur. $AOD$ dik üçgeninde $6-8-10$ özel üçgeninden $|OD| = 6$ cm, yani diğer köşegen $|BD| = 12$ cm bulunur. Alan köşegenler çarpımının yarısıdır:
$$\text{Alan}(ABCD) = \frac{16 \cdot 12}{2} = 96\text{ cm}^2$$

**Çeldirici Tuzağı:**
E şıkkı ($160$), yükseklik yerine kenar uzunluğu ($10$) ile köşegeni ($16$) çarpan; A şıkkı ($48$) ise alan hesabında $|BD| = 12$ yerine yarı köşegen $|OD| = 6$ kullanarak $\dfrac{16 \cdot 6}{2} = 48$ bulan adayı yakalar.

### mat-13-028
- zorluk: 2
- dogru: D
- dogrulama: 12 * 16

**Soru:**
Şekildeki $ABCD$ paralelkenarında $[AE]$ ve $[BE]$ sırasıyla $\widehat{DAB}$ ve $\widehat{CBA}$ açılarının açıortaylarıdır ($E \in [DC]$).
$|AE| = 12$ cm ve $|BE| = 16$ cm olduğuna göre $ABCD$ paralelkenarının **alanı** kaç $\text{cm}^2$'dir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [0, 0],
    "B": [20, 0],
    "C": [17.2, 9.6],
    "D": [-2.8, 9.6],
    "E": [7.2, 9.6]
  },
  "labelPos": {
    "A": "bl",
    "B": "br",
    "C": "tr",
    "D": "tl",
    "E": "top"
  },
  "shapes": [
    { "type": "polygon", "points": ["A", "B", "C", "D"] },
    { "type": "segment", "from": "A", "to": "E", "label": "12" },
    { "type": "segment", "from": "B", "to": "E", "label": "16" },
    { "type": "angle", "vertex": "A", "from": "E", "to": "D", "radius": 20 },
    { "type": "angle", "vertex": "A", "from": "B", "to": "E", "radius": 24 },
    { "type": "angle", "vertex": "B", "from": "E", "to": "A", "double": true, "radius": 20 },
    { "type": "angle", "vertex": "B", "from": "C", "to": "E", "double": true, "radius": 24 }
  ]
}
```

**Şıklar:**
A) 60
B) 96
C) 128
D) 192
E) 256

**Açıklama:**
Paralelkenarda ardışık iki açının toplamı $180^\circ$ olduğundan açıortayların kesiştiği açı $m(\widehat{AEB}) = 90^\circ$'dir. Dolayısıyla $AEB$ bir dik üçgendir ve alanı:
$$\text{Alan}(\triangle AEB) = \frac{12 \cdot 16}{2} = 96\text{ cm}^2$$
$E \in [DC]$ noktası karşı kenar üzerinde olduğundan $AEB$ üçgeni paralelkenarın alanının tam yarısına eşittir. O hâlde $\text{Alan}(ABCD) = 2 \cdot 96 = 192\text{ cm}^2$ bulunur.

**Çeldirici Tuzağı:**
B şıkkı ($96$), dik üçgenin alanını hesapladıktan sonra paralelkenarın alanının bunun $2$ katı olduğunu unutup $96$'yı işaretleyen; A şıkkı ($60$) ise alan yerine çevreyi hesaplayan adayı yakalar.

### mat-13-029
- zorluk: 2
- dogru: E
- dogrulama: ((13 + 5) / 2) * sqrt(10^2 - (13 - 5)^2)

**Soru:**
Şekildeki $ABCD$ dik yamuğunda $DC \parallel AB$, $[AD] \perp [AB]$, $|DC| = 5$ cm, $|AB| = 13$ cm ve $|BC| = 10$ cm'dir.
Buna göre $ABCD$ yamuğunun alanı kaç cm²'dir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [0, 0],
    "B": [13, 0],
    "C": [5, 6],
    "D": [0, 6]
  },
  "labelPos": {
    "A": "bl",
    "B": "br",
    "C": "tr",
    "D": "tl"
  },
  "shapes": [
    { "type": "polygon", "points": ["A", "B", "C", "D"] },
    { "type": "segment", "from": "D", "to": "C", "label": "5" },
    { "type": "segment", "from": "A", "to": "B", "label": "13" },
    { "type": "segment", "from": "B", "to": "C", "label": "10" },
    { "type": "angle", "vertex": "A", "from": "B", "to": "D", "right": true },
    { "type": "angle", "vertex": "D", "from": "A", "to": "C", "right": true }
  ]
}
```

**Şıklar:**
A) 30
B) 42
C) 45
D) 48
E) 54

**Açıklama:**
$C$ köşesinden $[AB]$ tabanına $[CH] \perp [AB]$ dikmesi indirilir. $|AH| = |DC| = 5$ cm olduğundan $|HB| = 13 - 5 = 8$ cm kalır. $CHB$ dik üçgeninde $6-8-10$ özel üçgeninden yükseklik $|CH| = 6$ cm bulunur. Yamuğun alanı $\dfrac{13 + 5}{2} \cdot 6 = 9 \cdot 6 = 54$ cm²'dir.

**Çeldirici Tuzağı:**
D şıkkı ($48$), yükseklik $h = 6$ ve parça $8$ değerlerinden yanlışlıkla dik üçgen ya da başka alan kombinasyonları hesaplayan; $90$ bulanlar ise yüksekliği yan kenar $10$ sananlardır.

### mat-13-030
- zorluk: 2
- dogru: A
- dogrulama: (180 - (90 - 60)) / 2

**Soru:**
Şekildeki $ABCD$ karesinin içine $DEC$ eşkenar üçgeni yerleştirilmiştir ($|DE| = |EC| = |DC|$).
Buna göre $m(\widehat{DAE}) = x$ kaç derecedir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [0, 0],
    "B": [10, 0],
    "C": [10, 10],
    "D": [0, 10],
    "E": [5, 1.34]
  },
  "labelPos": {
    "A": "bl",
    "B": "br",
    "C": "tr",
    "D": "tl",
    "E": "bottom"
  },
  "shapes": [
    { "type": "polygon", "points": ["A", "B", "C", "D"] },
    { "type": "segment", "from": "D", "to": "E" },
    { "type": "segment", "from": "C", "to": "E" },
    { "type": "segment", "from": "A", "to": "E" },
    { "type": "angle", "vertex": "A", "from": "E", "to": "D", "label": "x", "radius": 28 }
  ]
}
```

**Şıklar:**
A) 75
B) 30
C) 45
D) 60
E) 80

**Açıklama:**
Kare kenarları eşkenar üçgen kenarlarına eşit olduğundan $|AD| = |DC| = |DE|$'dir.
$m(\widehat{EDC}) = 60^\circ$ olduğu için $m(\widehat{ADE}) = 90^\circ - 60^\circ = 30^\circ$ bulunur. $ADE$ ikizkenar üçgeninde taban açıları birbirine eşittir:
$$x = m(\widehat{DAE}) = \frac{180^\circ - 30^\circ}{2} = \frac{150^\circ}{2} = 75^\circ$$

**Çeldirici Tuzağı:**
C şıkkı ($45$), $[AE]$ doğru parçasını karenin köşegeni sanıp $90^\circ$'nin yarısını işaretleyen; D şıkkı ($60$) ise eşkenar üçgen açısıyla karıştıran adayı yakalar.

### mat-13-031
- zorluk: 1
- dogru: C
- dogrulama: (180 - 2 * 52) / 2

**Soru:**
Şekildeki $O$ merkezli çember üzerinde $A$, $B$ ve $C$ noktaları verilmiştir. $m(\widehat{ABC}) = 52^\circ$ olduğuna göre $m(\widehat{OAC}) = x$ kaç derecedir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "O": [0, 0],
    "A": [-3.152, -2.463],
    "C": [3.152, -2.463],
    "B": [-1.368, 3.759]
  },
  "dots": ["O"],
  "labelPos": {
    "O": "top",
    "A": "bl",
    "C": "br",
    "B": "tl"
  },
  "shapes": [
    { "type": "circle", "center": "O", "radius": 4 },
    { "type": "segment", "from": "A", "to": "B" },
    { "type": "segment", "from": "B", "to": "C" },
    { "type": "segment", "from": "O", "to": "A" },
    { "type": "segment", "from": "O", "to": "C" },
    { "type": "segment", "from": "A", "to": "C" },
    { "type": "angle", "vertex": "B", "from": "A", "to": "C", "label": "52°", "radius": 26 },
    { "type": "angle", "vertex": "A", "from": "C", "to": "O", "label": "x", "radius": 28 }
  ]
}
```

**Şıklar:**
A) 26
B) 32
C) 38
D) 52
E) 76

**Açıklama:**
$m(\widehat{ABC}) = 52^\circ$ çevre açısının gördüğü $AC$ yayı $2 \cdot 52^\circ = 104^\circ$'dir. Aynı yayı gören merkez açı $m(\widehat{AOC}) = 104^\circ$ olur. Yarıçaplar eşit olduğundan ($|OA| = |OC|$) $OAC$ ikizkenar üçgeninde $x = \dfrac{180^\circ - 104^\circ}{2} = \dfrac{76^\circ}{2} = 38^\circ$ bulunur.

**Çeldirici Tuzağı:**
D şıkkı ($52$) veya E şıkkı ($76$), $76^\circ$'yi ikiye bölmeyi unutan ya da $\widehat{OAC}$ açısını doğrudan $52^\circ$'ye eşit sanan adayı yakalar.

### mat-13-032
- zorluk: 2
- dogru: D
- dogrulama: ((16 / 2)^2 + 4^2) / (2 * 4)

**Soru:**
Şekildeki $O$ merkezli çemberde $[OC] \perp [AB]$, $|AB| = 16$ cm ve $|HC| = 4$ cm'dir.
Buna göre bu çemberin yarıçapı kaç cm'dir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "O": [0, 0],
    "H": [0, -6],
    "C": [0, -10],
    "A": [-8, -6],
    "B": [8, -6]
  },
  "dots": ["O", "H", "C"],
  "labelPos": {
    "O": "top",
    "H": "tl",
    "C": "bottom",
    "A": "bl",
    "B": "br"
  },
  "shapes": [
    { "type": "circle", "center": "O", "radius": 10 },
    { "type": "segment", "from": "A", "to": "B" },
    { "type": "segment", "from": "O", "to": "H" },
    { "type": "segment", "from": "H", "to": "C", "label": "4" },
    { "type": "segment", "from": "O", "to": "B", "dashed": true },
    { "type": "angle", "vertex": "H", "from": "O", "to": "B", "right": true }
  ]
}
```

**Şıklar:**
A) 6
B) 8
C) 9
D) 10
E) 12

**Açıklama:**
Merkezden kirişe inen dikme kirişi ortalar: $|HB| = \dfrac{16}{2} = 8$ cm. Yarıçap $r = |OB| = |OC|$ olmak üzere $|OH| = r - 4$ cm olur. $OHB$ dik üçgeninde Pisagor teoremi uygulanır:
$$(r - 4)^2 + 8^2 = r^2 \Rightarrow r^2 - 8r + 16 + 64 = r^2 \Rightarrow 8r = 80 \Rightarrow r = 10\text{ cm}$$

**Çeldirici Tuzağı:**
B şıkkı ($8$) veya E şıkkı ($12$), kirişin yarısını ($8$) doğrudan yarıçap sanan ya da $|OH| = 6$ değerini bulduktan sonra $6 + 4 = 10$ yerine yanlış işlem yapan adayı yakalar.

### mat-13-033
- zorluk: 3
- dogru: B
- dogrulama: sqrt((9 + 4)^2 - (9 - 4)^2)

**Soru:**
Şekildeki $O_1$ ve $O_2$ merkezli, sırasıyla $9$ cm ve $4$ cm yarıçaplı iki çember birbirine dıştan teğettir. Doğrusal bir $[AB]$ teğeti iki çembere $A$ ve $B$ noktalarında değmektedir.
Buna göre $|AB| = x$ uzunluğu kaç cm'dir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "O₁": [0, 9],
    "A": [0, 0],
    "O₂": [12, 4],
    "B": [12, 0]
  },
  "dots": ["O₁", "O₂", "A", "B"],
  "labelPos": {
    "O₁": "top",
    "A": "bottom",
    "O₂": "top",
    "B": "bottom"
  },
  "shapes": [
    { "type": "circle", "center": "O₁", "radius": 9 },
    { "type": "circle", "center": "O₂", "radius": 4 },
    { "type": "segment", "from": "A", "to": "B", "label": "x" },
    { "type": "segment", "from": "O₁", "to": "O₂" },
    { "type": "segment", "from": "O₁", "to": "A", "label": "9" },
    { "type": "segment", "from": "O₂", "to": "B", "label": "4" },
    { "type": "angle", "vertex": "A", "from": "O₁", "to": "B", "right": true },
    { "type": "angle", "vertex": "B", "from": "A", "to": "O₂", "right": true }
  ]
}
```

**Şıklar:**
A) 10
B) 12
C) 13
D) 15
E) 16

**Açıklama:**
Merkezler arasındaki uzaklık yarıçaplar toplamıdır: $|O_1 O_2| = 9 + 4 = 13$ cm. $O_2$ merkezinden $[O_1 A]$ yarıçapına dikme indirildiğinde oluşan dik üçgende düşey kenar $9 - 4 = 5$ cm, hipotenüs $13$ cm olur. $5-12-13$ özel dik üçgeninden yatay kenar $x = |AB| = 12$ cm bulunur.

**Çeldirici Tuzağı:**
C şıkkı ($13$), merkezler arası mesafeyi ($9 + 4 = 13$) teğet uzunluğuyla aynı sanan; A şıkkı ($10$) ise $2\sqrt{r_1 r_2}$ ortak dış teğet formülünü yanlış uygulayan adayı yakalar.

### mat-13-034
- zorluk: 3
- dogru: E
- dogrulama: (360 / 36) * (360 / 36 - 3) / 2

**Soru:**
Bir dış açısının ölçüsü $36^\circ$ olan bir düzgün çokgenin **toplam köşegen sayısı** kaçtır?

**Şıklar:**
A) 20
B) 25
C) 27
D) 30
E) 35

**Açıklama:**
Dış açılar toplamı $360^\circ$ olduğundan çokgenin kenar sayısı $n = \dfrac{360^\circ}{36^\circ} = 10$'dur (düzgün ongen). $n$ kenarlı bir konveks çokgenin toplam köşegen sayısı $\dfrac{n(n - 3)}{2}$ formülüyle bulunur:
$$\frac{10 \cdot (10 - 3)}{2} = \frac{10 \cdot 7}{2} = 35$$

**Çeldirici Tuzağı:**
C şıkkı ($27$) veya D şıkkı ($30$), dokuzgen ($9 \cdot 6 / 2 = 27$) ile karıştıran ya da köşegen formülünde $(n - 3)$ yerine yanlış terim kullanan adayı yakalar.

### mat-13-035
- zorluk: 3
- dogru: E
- dogrulama: ((10 + 4) / 2)^2

**Soru:**
Şekildeki $ABCD$ ikizkenar yamuğunda $DC \parallel AB$, $|AD| = |BC|$, $[AC] \perp [BD]$, $|DC| = 4$ cm ve $|AB| = 10$ cm'dir.
Buna göre $ABCD$ yamuğunun alanı kaç cm²'dir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [0, 0],
    "B": [10, 0],
    "C": [7, 7],
    "D": [3, 7],
    "E": [5, 5]
  },
  "labelPos": {
    "A": "bl",
    "B": "br",
    "C": "tr",
    "D": "tl",
    "E": "top"
  },
  "shapes": [
    { "type": "polygon", "points": ["A", "B", "C", "D"] },
    { "type": "segment", "from": "A", "to": "C" },
    { "type": "segment", "from": "B", "to": "D" },
    { "type": "segment", "from": "A", "to": "D", "ticks": 1 },
    { "type": "segment", "from": "B", "to": "C", "ticks": 1 },
    { "type": "segment", "from": "D", "to": "C", "label": "4" },
    { "type": "segment", "from": "A", "to": "B", "label": "10" },
    { "type": "angle", "vertex": "E", "from": "A", "to": "D", "right": true }
  ]
}
```

**Şıklar:**
A) 28
B) 35
C) 40
D) 42
E) 49

**Açıklama:**
Köşegenleri dik kesişen bir ikizkenar yamukta yükseklik orta tabana eşittir: $h = \dfrac{|AB| + |DC|}{2} = \dfrac{10 + 4}{2} = 7$ cm. (Simetriden $ABE$ ve $DCE$ ikizkenar dik üçgenlerinin yükseklikleri sırasıyla $5$ ve $2$ cm olup toplam yükseklik $5 + 2 = 7$ cm'dir.)
Yamuğun alanı $\text{Orta taban} \cdot h = 7 \cdot 7 = 49$ cm² bulunur.

**Çeldirici Tuzağı:**
B şıkkı ($35$) veya D şıkkı ($42$), yüksekliği orta taban $7$ yerine sırasıyla $5$ ya da $6$ sanarak yamuk alanını çarpan adayı yakalar.


### mat-13-036
- zorluk: 1
- dogru: C
- dogrulama: 6 * sqrt(3)

**Soru:**
Şekildeki $ABCDEF$ düzgün altıgeninin bir kenar uzunluğu $|AB| = 6$ cm'dir.
Buna göre $[AC]$ köşegeninin uzunluğu kaç cm'dir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [-3, -5.196],
    "B": [3, -5.196],
    "C": [6, 0],
    "D": [3, 5.196],
    "E": [-3, 5.196],
    "F": [-6, 0]
  },
  "labelPos": {
    "A": "bl",
    "B": "br",
    "C": "right",
    "D": "tr",
    "E": "tl",
    "F": "left"
  },
  "shapes": [
    { "type": "polygon", "points": ["A", "B", "C", "D", "E", "F"] },
    { "type": "segment", "from": "A", "to": "C" },
    { "type": "segment", "from": "A", "to": "B", "label": "6" }
  ]
}
```

**Şıklar:**
A) $6$
B) $6\sqrt{2}$
C) $6\sqrt{3}$
D) $12$
E) $12\sqrt{3}$

**Açıklama:**
Düzgün altıgenin bir iç açısı $120^\circ$'dir. $ABC$ üçgeninde $|AB| = |BC| = 6$ cm ve $m(\widehat{ABC}) = 120^\circ$ olduğundan $120^\circ-30^\circ-30^\circ$ ikizkenar üçgeni oluşur; taban uzunluğu $|AC| = 6\sqrt{3}$ cm bulunur.

**Çeldirici Tuzağı:**
D şıkkı ($12$), kısa köşegen olan $[AC]$ yerine düzgün altıgenin en uzun köşegeni (simetri ekseni) olan $[AD] = 2 \cdot 6 = 12$ cm'yi işaretleyen adayı yakalar.

### mat-13-037
- zorluk: 2
- dogru: A
- dogrulama: 16 * (sqrt(10^2 - 8^2) + sqrt(17^2 - 8^2)) / 2

**Soru:**
Şekildeki $ABCD$ deltoidinde $|AB| = |AD| = 10$ cm, $|CB| = |CD| = 17$ cm ve $|BD| = 16$ cm veriliyor.
Buna göre $ABCD$ deltoidinin alanı kaç cm²'dir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [0, 6],
    "B": [-8, 0],
    "C": [0, -15],
    "D": [8, 0],
    "O": [0, 0]
  },
  "labelPos": {
    "A": "top",
    "B": "left",
    "C": "bottom",
    "D": "right",
    "O": "tl"
  },
  "shapes": [
    { "type": "polygon", "points": ["A", "B", "C", "D"] },
    { "type": "segment", "from": "A", "to": "C", "dashed": true },
    { "type": "segment", "from": "B", "to": "D", "dashed": true },
    { "type": "segment", "from": "A", "to": "B", "label": "10", "ticks": 1 },
    { "type": "segment", "from": "A", "to": "D", "ticks": 1 },
    { "type": "segment", "from": "B", "to": "C", "label": "17", "ticks": 2 },
    { "type": "segment", "from": "C", "to": "D", "ticks": 2 },
    { "type": "angle", "vertex": "O", "from": "A", "to": "D", "right": true }
  ]
}
```

**Şıklar:**
A) 168
B) 84
C) 120
D) 144
E) 192

**Açıklama:**
Deltoidde köşegenler dik kesişir ve $[AC]$ ana köşegeni $[BD]$'yi ortalar: $|BO| = |OD| = \dfrac{16}{2} = 8$ cm.
- $AOB$ dik üçgeninden ($6-8-10$): $|AO| = 6$ cm.
- $COB$ dik üçgeninden ($8-15-17$): $|OC| = 15$ cm.
Ana köşegen $|AC| = 6 + 15 = 21$ cm olur. Deltoidin alanı $\dfrac{|AC| \cdot |BD|}{2} = \dfrac{21 \cdot 16}{2} = 168$ cm² bulunur.

**Çeldirici Tuzağı:**
B şıkkı ($84$), iki üçgenin alanlarını hesaplamak yerine $21 \cdot 16$ çarpımında fazladan $2$'ye bölen; C şıkkı ($120$) ise $|OC|$ parçasını yanlış üçlüyle $9$ alan adayı yakalar.

### mat-13-038
- zorluk: 2
- dogru: B
- dogrulama: 12 * (12 * 5 / 8)

**Soru:**
Şekildeki $ABCD$ dikdörtgeninde $E \in [DC]$, $|DE| = 4$ cm ve $|EC| = 8$ cm veriliyor. $[AC]$ ve $[BE]$ doğru parçaları $F$ noktasında kesişmektedir.
Taralı $CEF$ üçgeninin alanı $12$ cm² olduğuna göre $ABCD$ dikdörtgeninin alanı kaç cm²'dir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [0, 0],
    "B": [12, 0],
    "C": [12, 7.5],
    "D": [0, 7.5],
    "E": [4, 7.5],
    "F": [7.2, 4.5]
  },
  "labelPos": {
    "A": "bl",
    "B": "br",
    "C": "tr",
    "D": "tl",
    "E": "top",
    "F": "right"
  },
  "shapes": [
    { "type": "polygon", "points": ["C", "E", "F"], "fill": true },
    { "type": "polygon", "points": ["A", "B", "C", "D"] },
    { "type": "segment", "from": "A", "to": "C" },
    { "type": "segment", "from": "B", "to": "E" },
    { "type": "segment", "from": "D", "to": "E", "label": "4" },
    { "type": "segment", "from": "E", "to": "C", "label": "8" }
  ]
}
```

**Şıklar:**
A) 72
B) 90
C) 96
D) 108
E) 120

**Açıklama:**
$|AB| = |DC| = 4 + 8 = 12$ cm'dir. $EC \parallel AB$ olduğundan $ECF$ ve $BAF$ üçgenleri kelebek benzeridir; benzerlik oranı $\dfrac{|EC|}{|AB|} = \dfrac{8}{12} = \dfrac{2}{3}$'tür.
Benzerlik oranının karesinden $\text{Alan}(\triangle BAF) = \left(\dfrac{3}{2}\right)^2 \cdot 12 = \dfrac{9}{4} \cdot 12 = 27$ cm² olur.
Ayrıca $\dfrac{|BF|}{|FE|} = \dfrac{3}{2}$ olduğundan $\text{Alan}(\triangle BCF) = \dfrac{3}{2} \cdot 12 = 18$ cm²'dir.
Dikdörtgenin yarısı olan $\text{Alan}(\triangle ABC) = 27 + 18 = 45$ cm² olduğundan $\text{Alan}(ABCD) = 2 \cdot 45 = 90$ cm² bulunur.

**Çeldirici Tuzağı:**
A şıkkı ($72$), benzerlikte yükseklik oranını $\dfrac{2}{3}$ yerine $\dfrac{1}{2}$ alarak dikdörtgenin yüksekliğini $6$ cm sanan ($12 \cdot 6 = 72$) adayı yakalar.

### mat-13-039
- zorluk: 2
- dogru: D
- dogrulama: 52 - 22

**Soru:**
Şekildeki çemberin dışındaki $P$ noktasından çizilen iki kesen çemberi sırasıyla $A, B$ ve $C, D$ noktalarında kesmektedir.
$m(\widehat{BAD}) = 52^\circ$ ve $m(\widehat{ADC}) = 22^\circ$ olduğuna göre $m(\widehat{BPD}) = x$ kaç derecedir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "P": [-9, 0],
    "A": [-3.453, 2.019],
    "B": [1.348, 3.766],
    "C": [-3.898, -0.9],
    "D": [3.355, -2.179]
  },
  "labelPos": {
    "P": "left",
    "A": "tl",
    "B": "top",
    "C": "bl",
    "D": "br"
  },
  "shapes": [
    { "type": "circle", "center": [0, 0], "radius": 4 },
    { "type": "segment", "from": "P", "to": "B" },
    { "type": "segment", "from": "P", "to": "D" },
    { "type": "segment", "from": "A", "to": "D" },
    { "type": "angle", "vertex": "A", "from": "D", "to": "B", "label": "52°", "radius": 24 },
    { "type": "angle", "vertex": "D", "from": "C", "to": "A", "label": "22°", "radius": 28 },
    { "type": "angle", "vertex": "P", "from": "D", "to": "B", "label": "x", "radius": 34 }
  ]
}
```

**Şıklar:**
A) 22
B) 26
C) 28
D) 30
E) 37

**Açıklama:**
$PAD$ üçgeninde $m(\widehat{BAD}) = 52^\circ$ açısı dış açı olduğundan kendisine komşu olmayan iki iç açının toplamına eşittir:
$$52^\circ = x + 22^\circ \Rightarrow x = 30^\circ$$
(Aynı sonuç çemberde dış açı kuralıyla $\widehat{BD} = 104^\circ$ ve $\widehat{AC} = 44^\circ$ yaylarından $\dfrac{104^\circ - 44^\circ}{2} = 30^\circ$ şeklinde de bulunur.)

**Çeldirici Tuzağı:**
E şıkkı ($37$), $\dfrac{52^\circ + 22^\circ}{2} = 37^\circ$ diyerek iki açının aritmetik ortalamasını alan adayı; C şıkkı ($28$) ise çıkarma işlemini hatalı yapanları yakalar.

### mat-13-040
- zorluk: 3
- dogru: E
- dogrulama: (4 + 16) * sqrt(4 * 16) / 2

**Soru:**
Şekildeki $[AB]$ çaplı çember üzerinde $C$ noktası alınmış ve $[CH] \perp [AB]$ dikmesi indirilmiştir.
$|AH| = 4$ cm ve $|HB| = 16$ cm olduğuna göre boyalı $ABC$ üçgeninin alanı kaç cm²'dir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [-10, 0],
    "B": [10, 0],
    "H": [-6, 0],
    "C": [-6, 8]
  },
  "labelPos": {
    "A": "left",
    "B": "right",
    "H": "bottom",
    "C": "tl"
  },
  "shapes": [
    { "type": "polygon", "points": ["A", "B", "C"], "fill": true },
    { "type": "circle", "center": [0, 0], "radius": 10 },
    { "type": "segment", "from": "C", "to": "H" },
    { "type": "segment", "from": "A", "to": "H", "label": "4" },
    { "type": "segment", "from": "H", "to": "B", "label": "16" },
    { "type": "angle", "vertex": "H", "from": "C", "to": "B", "right": true }
  ]
}
```

**Şıklar:**
A) 32
B) 40
C) 64
D) 72
E) 80

**Açıklama:**
Çapı gören çevre açı $90^\circ$ olduğundan $m(\widehat{ACB}) = 90^\circ$'dir. $ABC$ dik üçgeninde $[CH] \perp [AB]$ için Öklid bağıntısı uygulanır:
$$|CH|^2 = |AH| \cdot |HB| = 4 \cdot 16 = 64 \Rightarrow |CH| = 8\text{ cm}$$
Taban $|AB| = 4 + 16 = 20$ cm ve yükseklik $|CH| = 8$ cm olduğundan:
$$\text{Alan}(\triangle ABC) = \frac{20 \cdot 8}{2} = 80\text{ cm}^2$$

**Çeldirici Tuzağı:**
C şıkkı ($64$), Öklid bağlantısından $|CH|^2 = 64$ değerini bulup karekök almadan veya yarım çap ($10$) üzerinden farklı alan hesaplayıp $64$ bulan adayı yakalar.