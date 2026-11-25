---
ders: Matematik & Geometri
konu: Analitik Geometri ve Katı Cisimler
kod: mat
kapsam: [lisans_gygk, b_grubu_gygk]
---

### mat-14-001
- zorluk: 1
- dogru: A
- dogrulama: sqrt((4 - (-2))^2 + (-3 - 5)^2)

**Soru:**
Dik koordinat düzleminde $A(-2, 5)$ ve $B(4, -3)$ noktaları arasındaki uzaklık kaç birimdir?

**Şıklar:**
A) 10
B) 8
C) $2\sqrt{5}$
D) $2\sqrt{13}$
E) 14

**Açıklama:**
İki nokta arası uzaklık formülü uygulanır:
$|AB| = \sqrt{(4 - (-2))^2 + (-3 - 5)^2} = \sqrt{6^2 + (-8)^2} = \sqrt{36 + 64} = \sqrt{100} = 10$ birim bulunur.

**Çeldirici Tuzağı:**
C şıkkı ($2\sqrt{5}$) veya D şıkkı ($2\sqrt{13}$), koordinat farklarını alırken eksili sayılarda işaret hatası yapıp $4 - 2 = 2$ veya $5 - 3 = 2$ alan adayı yakalar.

### mat-14-002
- zorluk: 1
- dogru: C
- dogrulama: (1 + 7 - 5) + (2 + 8 - 4)

**Soru:**
Köşe koordinatları sırasıyla $A(1, 2)$, $B(5, 4)$, $C(7, 8)$ ve $D(x, y)$ olan $ABCD$ paralelkenarı için $x + y$ toplamı kaçtır?

**Şıklar:**
A) 6
B) 8
C) 9
D) 11
E) 13

**Açıklama:**
Bir paralelkenarda karşılıklı köşelerin apsisleri toplamı ve ordinatları toplamı birbirine eşittir (köşegenler birbirini ortalar):
$1 + 7 = 5 + x \Rightarrow x = 3$ ve
$2 + 8 = 4 + y \Rightarrow y = 6$.
Buna göre $x + y = 3 + 6 = 9$ bulunur.

**Çeldirici Tuzağı:**
D şıkkı (11) veya E şıkkı (13), karşılıklı köşeler olan $A$ ve $C$ yerine komşu köşeleri eşleştiren ($1 + 5 = 7 + x$ vb.) adayı yakalar. Paralelkenar harf sırasına göre $A$ ile $C$, $B$ ile $D$ karşılıklıdır.

### mat-14-003
- zorluk: 2
- dogru: D
- dogrulama: -4 / (-1 / ((4 - 0) / (0 - (-2))))

**Soru:**
Şekildeki dik koordinat düzleminde $d_1$ doğrusu $A(-2, 0)$ ve $B(0, 4)$ noktalarından geçmektedir. $B$ noktasından geçen ve $d_1$ doğrusuna dik olan $d_2$ doğrusunun $x$-eksenini kestiği $C$ noktasının apsisi kaçtır?

**Şekil:**
```json
{
  "kind": "geometry",
  "axes": { "x": [-3, 9], "y": [-1, 5], "step": 2, "grid": true },
  "points": { "A": [-2, 0], "B": [0, 4], "C": [8, 0] },
  "labelPos": { "A": "tl", "B": "tr", "C": "tr" },
  "dots": ["A", "B", "C"],
  "functions": [
    { "expr": "2x + 4", "domain": [-2.5, 0.5], "label": "d₁", "labelAt": -0.6 },
    { "expr": "4 - x/2", "domain": [-1, 9], "label": "d₂", "labelAt": 6 }
  ]
}
```

**Şıklar:**
A) 2
B) 4
C) 6
D) 8
E) 10

**Açıklama:**
$d_1$ doğrusunun eğimi $m_1 = \dfrac{4 - 0}{0 - (-2)} = 2$'dir. İki doğru dik olduğunda eğimleri çarpımı $-1$ olacağından $d_2$ doğrusunun eğimi $m_2 = -\dfrac{1}{2}$ olur. $B(0, 4)$ noktasından geçen $d_2$ doğrusunun denklemi $y = -\dfrac{1}{2}x + 4$'tür. $x$-eksenini kestiği noktada $y = 0$ yazılırsa $-\dfrac{1}{2}x + 4 = 0 \Rightarrow x = 8$ bulunur.

**Çeldirici Tuzağı:**
A şıkkı (2), dik doğruların eğimleri çarpımını $-1$ almak yerine $m_2 = -2$ alarak $y = -2x + 4 \Rightarrow x = 2$ bulan adayı yakalar.

### mat-14-004
- zorluk: 2
- dogru: B
- dogrulama: 3 + 4 + sqrt(3^2 + 4^2)

**Soru:**
Şekildeki dik koordinat düzleminde $3x + 4y = 12$ doğrusunun koordinat eksenleriyle sınırladığı taralı üçgenin çevresi kaç birimdir?

**Şekil:**
```json
{
  "kind": "geometry",
  "axes": { "x": [-1, 5], "y": [-1, 4], "step": 1, "grid": true },
  "points": { "O": [0, 0], "A": [4, 0], "B": [0, 3] },
  "hideLabels": ["O"],
  "labelPos": { "A": "tr", "B": "tr" },
  "dots": ["A", "B"],
  "functions": [
    { "expr": "3 - 3x/4", "domain": [-0.8, 4.8], "label": "d", "labelAt": 1.6 }
  ],
  "shapes": [
    { "type": "polygon", "points": ["O", "A", "B"], "fill": true }
  ]
}
```

**Şıklar:**
A) 6
B) 12
C) 10
D) 14
E) 15

**Açıklama:**
Doğrunun eksenleri kestiği noktalar bulunur: $y = 0$ için $3x = 12 \Rightarrow x = 4$ ($A(4, 0)$); $x = 0$ için $4y = 12 \Rightarrow y = 3$ ($B(0, 3)$). $OAB$ dik üçgeninin dik kenarları $3$ ve $4$ birim olduğundan $3-4-5$ üçgeninden hipotenüs $|AB| = 5$ birim olur. Üçgenin çevresi $3 + 4 + 5 = 12$ birimdir.

**Çeldirici Tuzağı:**
A şıkkı (6), taralı üçgenin çevresi yerine alanını ($\dfrac{3 \cdot 4}{2} = 6$) hesaplayan adayı yakalar.

### mat-14-005
- zorluk: 3
- dogru: E
- dogrulama: (6 * (2 * (6 / 3))) / 2

**Soru:**
Şekildeki dik koordinat düzleminde $y = 2x$ ve $y = -x + 6$ doğruları $A$ noktasında kesişmektedir.
Buna göre bu iki doğru ile $x$-ekseni arasında kalan taralı $OAB$ üçgeninin alanı kaç birimkaredir?

**Şekil:**
```json
{
  "kind": "geometry",
  "axes": { "x": [-1, 7], "y": [-1, 5], "step": 1, "grid": true },
  "points": { "O": [0, 0], "A": [2, 4], "B": [6, 0] },
  "hideLabels": ["O"],
  "labelPos": { "A": "top", "B": "tr" },
  "dots": ["A", "B"],
  "functions": [
    { "expr": "2x", "domain": [-0.4, 2.4], "label": "y = 2x", "labelAt": 2.3 },
    { "expr": "6 - x", "domain": [1.2, 6.8], "label": "y = -x+6", "labelAt": 4.2 }
  ],
  "shapes": [
    { "type": "polygon", "points": ["O", "A", "B"], "fill": true }
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
$y = -x + 6$ doğrusunun $x$-eksenini kestiği nokta $y = 0 \Rightarrow x = 6$ olduğundan üçgenin tabanı $|OB| = 6$ birimdir. Kesişim noktası $A$'yı bulmak için iki doğru eşitlenir: $2x = -x + 6 \Rightarrow 3x = 6 \Rightarrow x = 2$. $y = 2 \cdot 2 = 4$ olduğundan üçgenin yüksekliği $4$ birim olur. Alan $\dfrac{6 \cdot 4}{2} = 12$ birimkaredir.

**Çeldirici Tuzağı:**
A şıkkı (6), kesişim noktasının yüksekliği olan $y = 4$ yerine apsisi olan $x = 2$'yi yükseklik sanıp $\dfrac{6 \cdot 2}{2} = 6$ bulan adayı yakalar.

### mat-14-006
- zorluk: 1
- dogru: D
- dogrulama: (48 / 12)^3

**Soru:**
Şekildeki küpün tüm ayrıtlarının uzunlukları toplamı $48$ cm'dir.
Buna göre bu küpün hacmi kaç cm³'tür?

**Şekil:**
```json
{
  "kind": "geometry",
  "pointLabels": false,
  "points": {
    "A": [0, 0],
    "B": [3, 0],
    "C": [3, 3],
    "D": [0, 3],
    "E": [1.2, 1.0],
    "F": [4.2, 1.0],
    "G": [4.2, 4.0],
    "H": [1.2, 4.0]
  },
  "shapes": [
    { "type": "segment", "from": "A", "to": "B", "label": "a" },
    { "type": "segment", "from": "B", "to": "C" },
    { "type": "segment", "from": "C", "to": "D" },
    { "type": "segment", "from": "D", "to": "A" },
    { "type": "segment", "from": "D", "to": "H" },
    { "type": "segment", "from": "H", "to": "G" },
    { "type": "segment", "from": "G", "to": "C" },
    { "type": "segment", "from": "B", "to": "F" },
    { "type": "segment", "from": "F", "to": "G" },
    { "type": "segment", "from": "A", "to": "E", "dashed": true },
    { "type": "segment", "from": "E", "to": "F", "dashed": true },
    { "type": "segment", "from": "E", "to": "H", "dashed": true }
  ]
}
```

**Şıklar:**
A) 27
B) 48
C) 96
D) 64
E) 125

**Açıklama:**
Bir küpün birbirine eşit $12$ tane ayrıtı vardır. Bir ayrıt uzunluğuna $a$ denirse $12a = 48 \Rightarrow a = 4$ cm bulunur. Küpün hacmi $a^3 = 4^3 = 64$ cm³ olur.

**Çeldirici Tuzağı:**
C şıkkı (96), bir ayrıtı $4$ cm bulduktan sonra hacim ($a^3 = 64$) yerine yüzey alanını ($6a^2 = 96$) hesaplayan adayı yakalar.

### mat-14-007
- zorluk: 2
- dogru: B
- dogrulama: sqrt(3^2 + 4^2 + 12^2)

**Soru:**
Şekildeki dikdörtgenler prizmasının ayrıt uzunlukları $3$ cm, $4$ cm ve $12$ cm'dir.
Buna göre prizmanın en uzak iki köşesini birleştiren $|AG|$ cisim köşegeni kaç cm'dir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [0, 0],
    "B": [5, 0],
    "C": [5, 2.5],
    "D": [0, 2.5],
    "E": [1.5, 1.1],
    "F": [6.5, 1.1],
    "G": [6.5, 3.6],
    "H": [1.5, 3.6]
  },
  "hideLabels": ["B", "C", "D", "E", "F", "H"],
  "labelPos": { "A": "bl", "G": "tr" },
  "shapes": [
    { "type": "segment", "from": "A", "to": "B", "label": "12" },
    { "type": "segment", "from": "B", "to": "C" },
    { "type": "segment", "from": "C", "to": "D" },
    { "type": "segment", "from": "D", "to": "A", "label": "3" },
    { "type": "segment", "from": "D", "to": "H" },
    { "type": "segment", "from": "H", "to": "G" },
    { "type": "segment", "from": "G", "to": "C" },
    { "type": "segment", "from": "B", "to": "F", "label": "4" },
    { "type": "segment", "from": "F", "to": "G" },
    { "type": "segment", "from": "A", "to": "E", "dashed": true },
    { "type": "segment", "from": "E", "to": "F", "dashed": true },
    { "type": "segment", "from": "E", "to": "H", "dashed": true },
    { "type": "segment", "from": "A", "to": "G", "dashed": true }
  ]
}
```

**Şıklar:**
A) 5
B) 13
C) 15
D) 17
E) 19

**Açıklama:**
Ayrıtları $a$, $b$, $c$ olan bir dikdörtgenler prizmasının cisim köşegen uzunluğu $\sqrt{a^2 + b^2 + c^2}$ formülüyle bulunur. Verilen ayrıtlarla $|AG| = \sqrt{12^2 + 4^2 + 3^2} = \sqrt{144 + 16 + 9} = \sqrt{169} = 13$ cm elde edilir.

**Çeldirici Tuzağı:**
E şıkkı (19), köşegeni hesaplamak yerine üç ayrıtın toplamını ($12 + 4 + 3 = 19$) işaretleyen; A şıkkı (5) ise yalnızca taban yüzeyi ($3$ ve $4$) üzerinden yüzey köşegeni bulan adayı yakalar.

### mat-14-008
- zorluk: 2
- dogru: A
- dogrulama: 240 / (6 * 8)

**Soru:**
Taban ayrıtları $6$ cm ve $8$ cm, yüksekliği $10$ cm olan dikdörtgenler prizması biçimindeki boş bir kaba $240$ cm³ su konuluyor.
Buna göre kaptaki suyun yüksekliği kaç cm olur?

**Şıklar:**
A) 5
B) 4
C) 6
D) 8
E) 10

**Açıklama:**
Dikdörtgenler prizması şeklindeki bir kapta suyun hacmi $\text{Taban alanı} \cdot \text{Su yüksekliği}$ formülüyle hesaplanır. Taban alanı $6 \cdot 8 = 48$ cm² olduğundan su yüksekliği $h$ için $48 \cdot h = 240 \Rightarrow h = \dfrac{240}{48} = 5$ cm bulunur. (Kap $10$ cm yüksekliğinde olduğundan su taşmaz.)

**Çeldirici Tuzağı:**
B şıkkı (4), $240$'ı $6 \cdot 8 = 48$ yerine $6 \cdot 10 = 60$'a bölerek kabın yüksekliğini taban kenarı gibi kullanan adayı yakalar.

### mat-14-009
- zorluk: 2
- dogru: D
- dogrulama: (6^2 * 4) / (4^2 * 6)

**Soru:**
Kenar uzunlukları $4$ cm ve $6$ cm olan bir dikdörtgen, önce $4$ cm'lik kenarı etrafında $360^\circ$ döndürülerek $V_1$ hacimli silindir, ardından $6$ cm'lik kenarı etrafında $360^\circ$ döndürülerek $V_2$ hacimli silindir elde ediliyor.
Buna göre $\dfrac{V_1}{V_2}$ oranı kaçtır?

**Şıklar:**
A) $\dfrac{2}{3}$
B) $\dfrac{4}{9}$
C) $1$
D) $\dfrac{3}{2}$
E) $\dfrac{9}{4}$

**Açıklama:**
Bir dikdörtgen hangi kenarı etrafında döndürülürse o kenar silindirin yüksekliği ($h$), diğer kenar ise taban yarıçapı ($r$) olur:
- $4$ cm'lik kenar etrafında ($h = 4, r = 6$): $V_1 = \pi \cdot 6^2 \cdot 4 = 144\pi$.
- $6$ cm'lik kenar etrafında ($h = 6, r = 4$): $V_2 = \pi \cdot 4^2 \cdot 6 = 96\pi$.
Hacimler oranı $\dfrac{V_1}{V_2} = \dfrac{144\pi}{96\pi} = \dfrac{3}{2}$ bulunur.

**Çeldirici Tuzağı:**
A şıkkı ($\frac{2}{3}$) veya C şıkkı ($1$), iki farklı kenar etrafında döndürmenin aynı hacmi vereceğini sanan ya da yarıçap ile yüksekliği ters atayan adayı yakalar.

### mat-14-010
- zorluk: 3
- dogru: E
- dogrulama: (4^2 * 12) / (8^2)

**Soru:**
Taban yarıçapı $4$ cm ve yüksekliği $12$ cm olan dik dairesel silindir biçimindeki ağzına kadar su ile dolu kaptaki suyun tamamı, taban yarıçapı $8$ cm olan daha geniş boş bir dik dairesel silindire boşaltılıyor.
Buna göre ikinci kaptaki suyun yüksekliği kaç cm olur?

**Şıklar:**
A) 2
B) 4
C) 6
D) 8
E) 3

**Açıklama:**
Aktarılan suyun hacmi değişmez. İlk kaptaki suyun hacmi $V = \pi \cdot 4^2 \cdot 12 = 192\pi$ cm³'tür. İkinci kapta taban yarıçapı $8$ cm ve su yüksekliği $h$ olursa $\pi \cdot 8^2 \cdot h = 192\pi \Rightarrow 64h = 192 \Rightarrow h = 3$ cm bulunur. (Yarıçap $2$ katına çıktığında taban alanı $4$ katına çıkar ve yükseklik dörtte birine iner.)

**Çeldirici Tuzağı:**
C şıkkı (6), taban yarıçapı $4$'ten $8$'e yani $2$ katına çıktığı için su yüksekliğinin yarıya ($12 \div 2 = 6$) düşeceğini sanan adayı yakalar. Silindir hacminde yarıçapın karesi etkili olduğu için yükseklik $4$ kat azalır.

### mat-14-011
- zorluk: 1
- dogru: B
- dogrulama: ((-3 + 9) / 2) * ((7 - 1) / 2)

**Soru:**
Dik koordinat düzleminde uç noktaları $A(-3, 7)$ ve $B(9, -1)$ olan $[AB]$ doğru parçasının orta noktası $M(a, b)$'dir.
Buna göre $a \cdot b$ çarpımı kaçtır?

**Şıklar:**
A) 6
B) 9
C) 12
D) 15
E) 18

**Açıklama:**
Orta nokta koordinatları uç noktaların koordinatlarının aritmetik ortalamasıdır:
$a = \dfrac{-3 + 9}{2} = \dfrac{6}{2} = 3$ ve
$b = \dfrac{7 + (-1)}{2} = \dfrac{6}{2} = 3$.
Çarpım $a \cdot b = 3 \cdot 3 = 9$ bulunur.

**Çeldirici Tuzağı:**
C şıkkı (12) veya E şıkkı (18), orta nokta formülünde toplamak yerine çıkarma ($7 - (-1) = 8 \Rightarrow 4$) veya $2$'ye bölmeyi unutan adayı yakalar.

### mat-14-012
- zorluk: 1
- dogru: D
- dogrulama: (7 - (-1)) / (6 - 2)

**Soru:**
Dik koordinat düzleminde $A(2, -1)$ ve $B(6, 7)$ noktalarından geçen doğrunun eğimi kaçtır?

**Şıklar:**
A) $\dfrac{1}{2}$
B) $1$
C) $\dfrac{3}{2}$
D) $2$
E) $4$

**Açıklama:**
İki noktadan geçen doğrunun eğimi $m = \dfrac{y_2 - y_1}{x_2 - x_1}$ formülüyle bulunur:
$m = \dfrac{7 - (-1)}{6 - 2} = \dfrac{8}{4} = 2$ bulunur.

**Çeldirici Tuzağı:**
C şıkkı ($\frac{3}{2}$), paydaki $7 - (-1)$ çıkarmasında eksi işaretini unutup $7 - 1 = 6$ yazan ($\dfrac{6}{4} = \dfrac{3}{2}$) adayı; A şıkkı ($\frac{1}{2}$) ise $x$ ve $y$ farklarını ters oranlayanları yakalar.

### mat-14-013
- zorluk: 2
- dogru: A
- dogrulama: 1 - 2 * 3

**Soru:**
Şekildeki dik koordinat düzleminde $d_1$ doğrusunun denklemi $y = 2x + 4$'tür.
$C(3, 1)$ noktasından geçen ve $d_1$ doğrusuna paralel olan $d_2$ doğrusunun $y$-eksenini kestiği noktanın ordinatı kaçtır?

**Şekil:**
```json
{
  "kind": "geometry",
  "width": 300,
  "height": 300,
  "axes": { "x": [-3, 5], "y": [-6, 6], "step": 2, "grid": true },
  "points": { "C": [3, 1] },
  "labelPos": { "C": "br" },
  "dots": ["C"],
  "functions": [
    { "expr": "2x + 4", "domain": [-3, 1], "label": "d₁", "labelAt": 0.9 },
    { "expr": "2x - 5", "domain": [-0.5, 4.8], "label": "d₂", "labelAt": 4.2 }
  ]
}
```

**Şıklar:**
A) $-5$
B) $-3$
C) $-2$
D) $5$
E) $7$

**Açıklama:**
Paralel doğruların eğimleri eşittir; $d_1$'in eğimi $m_1 = 2$ olduğundan $d_2$'nin eğimi de $m_2 = 2$'dir. Eğimi $2$ olan ve $C(3, 1)$ noktasından geçen doğrunun denklemi $y - 1 = 2(x - 3) \Rightarrow y = 2x - 5$ bulunur. Doğrunun $y$-eksenini kestiği nokta için $x = 0$ yazılırsa $y = -5$ elde edilir.

**Çeldirici Tuzağı:**
D şıkkı (5), denklem kurarken $y - 1 = 2(x - 3)$ ifadesinde işaret hatası yapan adayı; B şıkkı ($-3$) ise $y = 2x + n$ denkleminde $x$ ve $y$'nin yerini karıştıranları yakalar.

### mat-14-014
- zorluk: 2
- dogru: C
- dogrulama: 9 + ((9 - 3) / (5 - 2)) * (8 - 5)

**Soru:**
Dik koordinat düzleminde $A(2, 3)$, $B(5, 9)$ ve $C(8, k)$ noktaları doğrusal olduğuna göre $k$ değeri kaçtır?

**Şıklar:**
A) 11
B) 12
C) 15
D) 16
E) 18

**Açıklama:**
Üç nokta aynı doğru üzerindeyse ikişerli eğimleri eşittir: $m_{AB} = m_{BC}$.
$m_{AB} = \dfrac{9 - 3}{5 - 2} = \dfrac{6}{3} = 2$ ve $m_{BC} = \dfrac{k - 9}{8 - 5} = \dfrac{k - 9}{3}$.
Eşitlenirse $\dfrac{k - 9}{3} = 2 \Rightarrow k - 9 = 6 \Rightarrow k = 15$ bulunur.

**Çeldirici Tuzağı:**
B şıkkı (12), $x$'teki artışa ($8 - 5 = 3$) eğimi çarpmak yerine doğrudan $3$ ekleyip $9 + 3 = 12$ bulan adayı yakalar.

### mat-14-015
- zorluk: 2
- dogru: E
- dogrulama: (6 * 6) / 2 - (2 * 2) / 2

**Soru:**
Şekildeki dik koordinat düzleminde $x + y = 6$ ve $x + y = 2$ doğruları ile koordinat eksenleri arasında kalan taralı bölgenin alanı kaç birimkaredir?

**Şekil:**
```json
{
  "kind": "geometry",
  "axes": { "x": [-1, 7], "y": [-1, 7], "step": 1, "grid": true },
  "points": { "O": [0, 0], "A": [2, 0], "B": [6, 0], "C": [0, 6], "D": [0, 2] },
  "hideLabels": ["O", "A", "B", "C", "D"],
  "functions": [
    { "expr": "6 - x", "domain": [-0.5, 6.5], "label": "x+y=6", "labelAt": 3.5 },
    { "expr": "2 - x", "domain": [-0.5, 2.5] }
  ],
  "shapes": [
    { "type": "polygon", "points": ["A", "B", "C", "D"], "fill": true }
  ]
}
```

**Şıklar:**
A) 8
B) 12
C) 14
D) 18
E) 16

**Açıklama:**
Büyük $x + y = 6$ doğrusunun eksenlerle oluşturduğu dik üçgenin dik kenarları $6$ birim olup alanı $\dfrac{6 \cdot 6}{2} = 18$ birimkaredir. Küçük $x + y = 2$ doğrusunun eksenlerle oluşturduğu dik üçgenin dik kenarları $2$ birim olup alanı $\dfrac{2 \cdot 2}{2} = 2$ birimkaredir. İki doğru arasındaki taralı yamuğun alanı $18 - 2 = 16$ birimkare bulunur.

**Çeldirici Tuzağı:**
B şıkkı (12) veya D şıkkı (18), büyük üçgenin alanından ($18$) küçük üçgeni çıkarmayı unutan ya da $(6 - 2) \cdot (6 - 2) \div 2 = 8$ alan adayı yakalar.

### mat-14-016
- zorluk: 3
- dogru: B
- dogrulama: sqrt((3 - (-3))^2 + (-4 - 4)^2)

**Soru:**
Şekildeki dik koordinat düzleminde verilen $A(-3, 4)$ noktasının $x$-eksenine göre simetriği $B$ noktası, $B$ noktasının $y$-eksenine göre simetriği ise $C$ noktasıdır.
Buna göre $|AC|$ uzaklığı kaç birimdir?

**Şekil:**
```json
{
  "kind": "geometry",
  "width": 340,
  "height": 340,
  "axes": { "x": [-5, 5], "y": [-5, 5], "step": 1, "grid": true },
  "points": { "A": [-3, 4] },
  "labelPos": { "A": "tl" },
  "dots": ["A"]
}
```

**Şıklar:**
A) 8
B) 10
C) $2\sqrt{13}$
D) 12
E) 14

**Açıklama:**
Bir noktanın $x$-eksenine göre simetriği alınırken ordinatın işareti değişir: $A(-3, 4) \to B(-3, -4)$.
$B$ noktasının $y$-eksenine göre simetriği alınırken apsisin işareti değişir: $B(-3, -4) \to C(3, -4)$.
$A(-3, 4)$ ile $C(3, -4)$ arasındaki uzaklık $|AC| = \sqrt{(3 - (-3))^2 + (-4 - 4)^2} = \sqrt{6^2 + (-8)^2} = \sqrt{100} = 10$ birim bulunur (orijinden simetrik oldukları için $|OA| = 5$ uzaklığının $2$ katıdır).

**Çeldirici Tuzağı:**
A şıkkı (8) veya E şıkkı (14), $x$-eksenine göre simetride apsisi değiştirip $B(3, 4)$ alan ya da uzaklık formülünde dik kenarları toplama hatasına düşen adayı yakalar.

### mat-14-017
- zorluk: 1
- dogru: E
- dogrulama: sqrt(12 * 15 * 20)

**Soru:**
Bir dikdörtgenler prizmasının farklı üç yüzünün alanları sırasıyla $12\text{ cm}^2$, $15\text{ cm}^2$ ve $20\text{ cm}^2$'dir.
Buna göre bu prizmanın hacmi kaç $\text{cm}^3$'tür?

**Şıklar:**
A) 47
B) 48
C) 50
D) 54
E) 60

**Açıklama:**
Prizmanın ayrıtları $a, b, c$ cm olsun. Farklı üç yüzün alanları $a \cdot b = 12$, $b \cdot c = 15$ ve $a \cdot c = 20$'dir. Üç eşitlik taraf tarafa çarpılırsa:
$$(a \cdot b \cdot c)^2 = 12 \cdot 15 \cdot 20 = 3.600 \Rightarrow V = a \cdot b \cdot c = \sqrt{3.600} = 60\text{ cm}^3$$
bulunur.

**Çeldirici Tuzağı:**
A şıkkı ($47$), verilen üç yüzey alanını doğrudan toplayan ($12 + 15 + 20 = 47$) adayı yakalar.

### mat-14-018
- zorluk: 1
- dogru: A
- dogrulama: 2 * (2 * 4 + 2 * 5 + 4 * 5)

**Soru:**
Şekildeki dikdörtgenler prizmasının ayrıt uzunlukları $2$ cm, $4$ cm ve $5$ cm'dir.
Buna göre prizmanın tüm yüzey alanı kaç cm²'dir?

**Şekil:**
```json
{
  "kind": "geometry",
  "pointLabels": false,
  "points": {
    "A": [0, 0],
    "B": [5, 0],
    "C": [5, 2],
    "D": [0, 2],
    "E": [1.4, 1.3],
    "F": [6.4, 1.3],
    "G": [6.4, 3.3],
    "H": [1.4, 3.3]
  },
  "shapes": [
    { "type": "segment", "from": "A", "to": "B", "label": "5" },
    { "type": "segment", "from": "B", "to": "C" },
    { "type": "segment", "from": "C", "to": "D" },
    { "type": "segment", "from": "D", "to": "A", "label": "2" },
    { "type": "segment", "from": "D", "to": "H" },
    { "type": "segment", "from": "H", "to": "G" },
    { "type": "segment", "from": "G", "to": "C" },
    { "type": "segment", "from": "B", "to": "F", "label": "4" },
    { "type": "segment", "from": "F", "to": "G" },
    { "type": "segment", "from": "A", "to": "E", "dashed": true },
    { "type": "segment", "from": "E", "to": "F", "dashed": true },
    { "type": "segment", "from": "E", "to": "H", "dashed": true }
  ]
}
```

**Şıklar:**
A) 76
B) 38
C) 40
D) 64
E) 80

**Açıklama:**
Dikdörtgenler prizmasının yüzey alanı $2(ab + ac + bc)$ formülüyle bulunur: $2(2 \cdot 4 + 2 \cdot 5 + 4 \cdot 5) = 2(8 + 10 + 20) = 2 \cdot 38 = 76$ cm².

**Çeldirici Tuzağı:**
B şıkkı (38), karşılıklı yüzlerden yalnızca birer tanesinin alanını toplayıp $2$ ile çarpmayı unutan adayı; C şıkkı (40) ise alan yerine hacim ($2 \cdot 4 \cdot 5 = 40$) hesaplayanları yakalar.

### mat-14-019
- zorluk: 2
- dogru: C
- dogrulama: 2 * 4^2 + 4 * 4 * 7

**Soru:**
Şekildeki kare dik prizmanın taban ayrıtı $4$ cm ve yüksekliği $7$ cm'dir.
Buna göre bu prizmanın toplam yüzey alanı kaç cm²'dir?

**Şekil:**
```json
{
  "kind": "geometry",
  "pointLabels": false,
  "points": {
    "A": [0, 0],
    "B": [3.5, 0],
    "C": [3.5, 5.5],
    "D": [0, 5.5],
    "E": [1.3, 1.0],
    "F": [4.8, 1.0],
    "G": [4.8, 6.5],
    "H": [1.3, 6.5]
  },
  "shapes": [
    { "type": "segment", "from": "A", "to": "B", "label": "4" },
    { "type": "segment", "from": "B", "to": "C" },
    { "type": "segment", "from": "C", "to": "D" },
    { "type": "segment", "from": "D", "to": "A", "label": "7" },
    { "type": "segment", "from": "D", "to": "H" },
    { "type": "segment", "from": "H", "to": "G" },
    { "type": "segment", "from": "G", "to": "C" },
    { "type": "segment", "from": "B", "to": "F", "label": "4" },
    { "type": "segment", "from": "F", "to": "G" },
    { "type": "segment", "from": "A", "to": "E", "dashed": true },
    { "type": "segment", "from": "E", "to": "F", "dashed": true },
    { "type": "segment", "from": "E", "to": "H", "dashed": true }
  ]
}
```

**Şıklar:**
A) 112
B) 128
C) 144
D) 160
E) 176

**Açıklama:**
Kare dik prizmada $2$ tane $4 \times 4$'lük kare taban ($2 \cdot 16 = 32$ cm²) ve $4$ tane $4 \times 7$'lik dikdörtgen yan yüz ($4 \cdot 28 = 112$ cm²) vardır. Toplam yüzey alanı $32 + 112 = 144$ cm² bulunur.

**Çeldirici Tuzağı:**
A şıkkı (112), yalnızca yanal alanı veya hacmi ($4 \cdot 4 \cdot 7 = 112$) hesaplayıp taban alanlarını eklemeyi unutan adayı; B şıkkı (128) ise yalnızca bir taban ekleyenleri yakalar.

### mat-14-020
- zorluk: 2
- dogru: E
- dogrulama: ((3 * 4) / 2) * 10

**Soru:**
Şekildeki dik üçgen dik prizmanın tabanı dik kenarları $3$ cm ve $4$ cm olan bir dik üçgendir. Prizmanın yüksekliği $10$ cm olduğuna göre hacmi kaç cm³'tür?

**Şekil:**
```json
{
  "kind": "geometry",
  "pointLabels": false,
  "points": {
    "A": [0, 0],
    "B": [4, 0],
    "C": [1.5, 1.5],
    "D": [0, 5],
    "E": [4, 5],
    "F": [1.5, 6.5]
  },
  "shapes": [
    { "type": "segment", "from": "A", "to": "B" },
    { "type": "segment", "from": "A", "to": "D", "label": "10" },
    { "type": "segment", "from": "B", "to": "E" },
    { "type": "segment", "from": "D", "to": "E" },
    { "type": "segment", "from": "E", "to": "F", "label": "4" },
    { "type": "segment", "from": "F", "to": "D", "label": "3" },
    { "type": "segment", "from": "A", "to": "C", "dashed": true },
    { "type": "segment", "from": "B", "to": "C", "dashed": true },
    { "type": "segment", "from": "C", "to": "F", "dashed": true }
  ]
}
```

**Şıklar:**
A) 30
B) 40
C) 100
D) 120
E) 60

**Açıklama:**
Tüm prizmaların hacmi $\text{Taban alanı} \cdot \text{Yükseklik}$ formülüyle bulunur. Dik üçgen tabanın alanı $\dfrac{3 \cdot 4}{2} = 6$ cm²'dir. Yükseklik $10$ cm olduğundan hacim $6 \cdot 10 = 60$ cm³ bulunur.

**Çeldirici Tuzağı:**
D şıkkı (120), üçgen tabanın alanında $2$'ye bölmeyi unutup $3 \cdot 4 \cdot 10 = 120$ hesaplayan adayı yakalar.

### mat-14-021
- zorluk: 2
- dogru: A
- dogrulama: 6^3 - pi * 3^2 * 6

**Soru:**
Bir ayrıtı $6$ cm olan dolu bir tahta küpün içinden, tabanları küpün alt ve üst yüzlerine oturan **en büyük hacimli** dik dairesel silindir oyulup çıkarılıyor.
Buna göre geriye kalan cismin hacmi kaç $\text{cm}^3$'tür?

**Şıklar:**
A) $216 - 54\pi$
B) $216 - 36\pi$
C) $216 - 108\pi$
D) $108 - 54\pi$
E) $216 - 18\pi$

**Açıklama:**
Küpün bir ayrıtı $6$ cm olduğundan içine sığabilecek en büyük silindirin taban çapı $6$ cm ($r = 3$ cm) ve yüksekliği $h = 6$ cm olur.
- Küpün hacmi: $6^3 = 216\text{ cm}^3$
- Çıkarılan silindirin hacmi: $\pi \cdot 3^2 \cdot 6 = 54\pi\text{ cm}^3$
Geriye kalan cismin hacmi $216 - 54\pi\text{ cm}^3$ bulunur.

**Çeldirici Tuzağı:**
C şıkkı ($216 - 108\pi$) veya B şıkkı ($216 - 36\pi$), silindirin çapı olan $6$'yı yarıçap sanıp $\pi \cdot 6^2$ alan ya da $\pi r^2 h$ yerine yanal alan $2\pi r h = 36\pi$ çıkaran adayı yakalar.

### mat-14-022
- zorluk: 2
- dogru: D
- dogrulama: 10 * 3^2

**Soru:**
Bir ayrıtı $3$ cm olan iki özdeş küp, birer yüzleri tamamen çakışacak biçimde yan yana yapıştırılarak şekildeki dikdörtgenler prizması oluşturuluyor.
Buna göre oluşan yeni prizmanın toplam yüzey alanı kaç cm²'dir?

**Şekil:**
```json
{
  "kind": "geometry",
  "pointLabels": false,
  "points": {
    "A": [0, 0],
    "M": [3, 0],
    "B": [6, 0],
    "C": [6, 3],
    "N": [3, 3],
    "D": [0, 3],
    "E": [1.2, 1.0],
    "P": [4.2, 1.0],
    "F": [7.2, 1.0],
    "G": [7.2, 4.0],
    "Q": [4.2, 4.0],
    "H": [1.2, 4.0]
  },
  "shapes": [
    { "type": "segment", "from": "A", "to": "B" },
    { "type": "segment", "from": "B", "to": "C" },
    { "type": "segment", "from": "C", "to": "D" },
    { "type": "segment", "from": "D", "to": "A", "label": "3" },
    { "type": "segment", "from": "M", "to": "N" },
    { "type": "segment", "from": "N", "to": "Q" },
    { "type": "segment", "from": "D", "to": "H" },
    { "type": "segment", "from": "H", "to": "G" },
    { "type": "segment", "from": "G", "to": "C" },
    { "type": "segment", "from": "B", "to": "F" },
    { "type": "segment", "from": "F", "to": "G" },
    { "type": "segment", "from": "A", "to": "E", "dashed": true },
    { "type": "segment", "from": "E", "to": "F", "dashed": true },
    { "type": "segment", "from": "E", "to": "H", "dashed": true },
    { "type": "segment", "from": "M", "to": "P", "dashed": true },
    { "type": "segment", "from": "P", "to": "Q", "dashed": true }
  ]
}
```

**Şıklar:**
A) 54
B) 72
C) 99
D) 90
E) 108

**Açıklama:**
Başlangıçta iki küpte toplam $6 + 6 = 12$ adet $3 \times 3$'lük kare yüz vardır. İki küp yapıştırıldığında iki küpten birer yüz ($2$ yüz) iç kısımda kalarak dış yüzeyden kaybolur; geriye $12 - 2 = 10$ dış kare yüz kalır. Her bir kare yüzün alanı $3^2 = 9$ cm² olduğundan toplam yüzey alanı $10 \cdot 9 = 90$ cm² bulunur.

**Çeldirici Tuzağı:**
E şıkkı (108), yapışan yüzlerin kaybolduğunu gözden kaçırıp iki küpün alanını ($54 + 54 = 108$) doğrudan toplayan; C şıkkı (99) ise iki yüz yerine yalnızca bir yüz ($9$ cm²) eksilten adayı yakalar.

### mat-14-023
- zorluk: 3
- dogru: A
- dogrulama: pi * (12 / 2)^2 * 8

**Soru:**
Boyutları $12\pi$ cm ve $8$ cm olan dikdörtgen biçimindeki bir karton, $12\pi$ cm'lik kenarı taban çevresi olacak biçimde kıvrılarak üstü ve altı açık bir dik dairesel silindir elde ediliyor.
Buna göre bu silindirin hacmi kaç cm³'tür?

**Şekil:**
```json
{
  "kind": "geometry",
  "pointLabels": false,
  "points": {
    "A": [0, 0],
    "B": [10, 0],
    "C": [10, 5],
    "D": [0, 5]
  },
  "shapes": [
    { "type": "polygon", "points": ["A", "B", "C", "D"] },
    { "type": "segment", "from": "A", "to": "B", "label": "12π cm" },
    { "type": "segment", "from": "B", "to": "C", "label": "8 cm" }
  ]
}
```

**Şıklar:**
A) $288\pi$
B) $144\pi$
C) $96\pi$
D) $576\pi$
E) $1.152\pi$

**Açıklama:**
$12\pi$ cm'lik kenar silindirin taban çevresini oluşturduğundan $2\pi r = 12\pi \Rightarrow r = 6$ cm bulunur. Silindirin yüksekliği $h = 8$ cm'dir. Silindirin hacmi $V = \pi r^2 h = \pi \cdot 6^2 \cdot 8 = 36\pi \cdot 8 = 288\pi$ cm³ olur.

**Çeldirici Tuzağı:**
E şıkkı ($1.152\pi$), $12\pi$ taban çevresini $2\pi r$'ye eşitleyip $r = 6$ bulmak yerine doğrudan $r = 12$ alıp $\pi \cdot 12^2 \cdot 8$ hesaplayan adayı yakalar.

### mat-14-024
- zorluk: 3
- dogru: C
- dogrulama: floor(7 / 2) * floor(8 / 2) * floor(11 / 2)

**Soru:**
İç boyutları $7$ cm, $8$ cm ve $11$ cm olan dikdörtgenler prizması biçimindeki boş bir kutuya, bir ayrıtı $2$ cm olan küçük küplerden en fazla kaç tane yerleştirilebilir?

**Şekil:**
```json
{
  "kind": "geometry",
  "pointLabels": false,
  "points": {
    "A": [0, 0],
    "B": [5.5, 0],
    "C": [5.5, 3.5],
    "D": [0, 3.5],
    "E": [1.8, 1.4],
    "F": [7.3, 1.4],
    "G": [7.3, 4.9],
    "H": [1.8, 4.9]
  },
  "shapes": [
    { "type": "segment", "from": "A", "to": "B", "label": "11" },
    { "type": "segment", "from": "B", "to": "C" },
    { "type": "segment", "from": "C", "to": "D" },
    { "type": "segment", "from": "D", "to": "A", "label": "7" },
    { "type": "segment", "from": "D", "to": "H" },
    { "type": "segment", "from": "H", "to": "G" },
    { "type": "segment", "from": "G", "to": "C" },
    { "type": "segment", "from": "B", "to": "F", "label": "8" },
    { "type": "segment", "from": "F", "to": "G" },
    { "type": "segment", "from": "A", "to": "E", "dashed": true },
    { "type": "segment", "from": "E", "to": "F", "dashed": true },
    { "type": "segment", "from": "E", "to": "H", "dashed": true }
  ]
}
```

**Şıklar:**
A) 48
B) 56
C) 60
D) 64
E) 77

**Açıklama:**
Küpler bölünemeyeceği için her ayrıt boyunca tam sığabilecek küp sayısı ayrı ayrı hesaplanır:
$7$ cm'lik ayrıt boyunca $\lfloor 7 \div 2 \rfloor = 3$ küp,
$8$ cm'lik ayrıt boyunca $\lfloor 8 \div 2 \rfloor = 4$ küp,
$11$ cm'lik ayrıt boyunca $\lfloor 11 \div 2 \rfloor = 5$ küp sığar.
Toplam yerleştirilebilecek küp sayısı $3 \cdot 4 \cdot 5 = 60$ tanedir.

**Çeldirici Tuzağı:**
E şıkkı (77), küplerin bölünemeyeceğini unutup kutunun hacmini bir küpün hacmine ($\dfrac{7 \cdot 8 \cdot 11}{2^3} = 77$) bölerek artan boşlukları da sığdırılabilecekmiş gibi hesaplayan adayı yakalar.


### mat-14-025
- zorluk: 1
- dogru: C
- dogrulama: 6 / (2 / 3)

**Soru:**
Dik koordinat düzleminde $2x - 3y + 7 = 0$ doğrusu ile $ax + 6y - 5 = 0$ doğrusu birbirine **dik** olduğuna göre $a$ değeri kaçtır?

**Şıklar:**
A) $-9$
B) $-4$
C) $9$
D) $4$
E) $12$

**Açıklama:**
İlk doğrunun eğimi $m_1 = -\dfrac{2}{-3} = \dfrac{2}{3}$, ikinci doğrunun eğimi $m_2 = -\dfrac{a}{6}$'dır. İki doğru birbirine dik olduğunda eğimler çarpımı $-1$'e eşittir:
$$\frac{2}{3} \cdot \left(-\frac{a}{6}\right) = -1 \Rightarrow -\frac{2a}{18} = -1 \Rightarrow a = 9$$

**Çeldirici Tuzağı:**
A şıkkı ($-9$), eğimleri çarparken $-1$ yerine $+1$'e eşitleyen ($m_1 \cdot m_2 = 1$) ya da eğim formülündeki eksi işaretini unutan adayı; B şıkkı ($-4$) ise iki doğruyu paralel kabul edip $m_1 = m_2$ çözenleri yakalar.

### mat-14-026
- zorluk: 1
- dogru: E
- dogrulama: 4 * 6 / 2

**Soru:**
Şekilde dik koordinat düzleminde grafiği verilen $3x + 2y - 12 = 0$ doğrusunun koordinat eksenleriyle oluşturduğu $AOB$ üçgensel bölgesinin alanı kaç birimkaredir?

**Şekil:**
```json
{
  "kind": "geometry",
  "axes": { "x": [-1, 6], "y": [-1, 8], "step": 2, "grid": true },
  "points": { "A": [0, 6], "B": [4, 0] },
  "labelPos": { "A": "tr", "B": "tr" },
  "dots": ["A", "B"],
  "functions": [
    { "expr": "6 - 1.5x", "domain": [-0.5, 4.6], "label": "d", "labelAt": 2.2 }
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
Doğrunun eksenleri kestiği noktalar bulunur:
- $x = 0$ için $2y = 12 \Rightarrow y = 6$ olduğundan $A(0, 6)$ ve $|OA| = 6$ birimdir.
- $y = 0$ için $3x = 12 \Rightarrow x = 4$ olduğundan $B(4, 0)$ ve $|OB| = 4$ birimdir.
Dik üçgenin alanı $\dfrac{|OA| \cdot |OB|}{2} = \dfrac{6 \cdot 4}{2} = 12$ birimkare bulunur.

**Çeldirici Tuzağı:**
A şıkkı ($6$) veya E yerine D ($10$) işaretleyenlerin yanında $24$ bulanlar taban $\times$ yükseklik çarpımında $2$'ye bölmeyi unutanlardır; eksen kesim noktalarını ters koymak yerine mutlaka $x = 0$ ve $y = 0$ değerleri ayrı kontrol edilmelidir.

### mat-14-027
- zorluk: 2
- dogru: B
- dogrulama: (8 - (-2)) * 5 / 2

**Soru:**
Şekildeki dik koordinat düzleminde $d_1: y = x + 2$ ve $d_2: y = 8 - x$ doğruları $C$ noktasında kesişmektedir.
Buna göre bu iki doğrunun $x$-ekseni ile oluşturduğu boyalı $ABC$ üçgeninin alanı kaç birimkaredir?

**Şekil:**
```json
{
  "kind": "geometry",
  "axes": { "x": [-3, 9], "y": [-1, 9], "step": 2, "grid": true },
  "points": { "A": [-2, 0], "B": [8, 0], "C": [3, 5] },
  "labelPos": { "A": "tl", "B": "tr", "C": "top" },
  "dots": ["A", "B", "C"],
  "shapes": [
    { "type": "polygon", "points": ["A", "B", "C"], "fill": true }
  ],
  "functions": [
    { "expr": "x + 2", "domain": [-2.8, 5.5], "label": "d₁", "labelAt": 4.8 },
    { "expr": "8 - x", "domain": [0.5, 8.8], "label": "d₂", "labelAt": 6.2 }
  ]
}
```

**Şıklar:**
A) 20
B) 25
C) 30
D) 40
E) 50

**Açıklama:**
Doğruların $x$-eksenini kestiği noktalar ($y = 0$) bulunur: $d_1$ için $x = -2 \Rightarrow A(-2, 0)$; $d_2$ için $x = 8 \Rightarrow B(8, 0)$. Taban uzunluğu $|AB| = 8 - (-2) = 10$ birimdir.
Kesişim noktası $C$ için $x + 2 = 8 - x \Rightarrow 2x = 6 \Rightarrow x = 3$ ve $y = 3 + 2 = 5$ bulunur. Üçgenin yüksekliği $C$ noktasının ordinatı olan $h = 5$ birimdir. Alan $\dfrac{10 \cdot 5}{2} = 25$ birimkare olur.

**Çeldirici Tuzağı:**
E şıkkı ($50$), taban ve yüksekliği bulduktan sonra üçgen alan formülünde $2$'ye bölmeyi unutan adayı; C şıkkı ($30$) ise $|AB|$ mesafesini $8 - (-2) = 10$ yerine yanlışlıkla $12$ alanları yakalar.

### mat-14-028
- zorluk: 2
- dogru: C
- dogrulama: -1 - (3 / 2) * 2

**Soru:**
Dik koordinat düzleminde $A(2, -1)$ noktasından geçen ve $2x + 3y - 6 = 0$ doğrusuna **dik** olan doğrunun $y$-eksenini kestiği noktanın ordinatı kaçtır?

**Şıklar:**
A) $-6$
B) $-5$
C) $-4$
D) $-2$
E) $4$

**Açıklama:**
Verilen $2x + 3y - 6 = 0$ doğrusunun eğimi $m_1 = -\dfrac{2}{3}$'tür. Bu doğruya dik olan doğrunun eğimi $m_1 \cdot m_2 = -1$ kuralından $m_2 = \dfrac{3}{2}$ olur.
$A(2, -1)$ noktasından geçen doğru denklemi yazılır:
$$y - (-1) = \frac{3}{2}(x - 2) \Rightarrow y = \frac{3}{2}x - 4$$
Doğrunun $y$-eksenini kestiği noktada $x = 0$ olduğundan ordinat $y = -4$ bulunur.

**Çeldirici Tuzağı:**
D şıkkı ($-2$) veya B şıkkı ($-5$), dik doğruların eğimleri çarpımı $-1$ yerine eğimi yalnızca işaret değiştirip $\dfrac{2}{3}$ ya da ters çevirmeden $-\dfrac{3}{2}$ alan adayı yakalar.

### mat-14-029
- zorluk: 2
- dogru: D
- dogrulama: (4 * 6 * 6) / (6 * 8)

**Soru:**
Şekilde ayrıt uzunlukları $4$ cm, $6$ cm ve $8$ cm olan dikdörtgenler prizması biçimindeki kapalı kap, $4 \times 6$'lık yüzeyi taban olacak şekilde yerleştirildiğinde içinde $6$ cm yüksekliğinde su bulunmaktadır.
Bu kap, $6 \times 8$'lik yüzeyi taban olacak biçimde yan yatırıldığında kaptaki suyun yeni yüksekliği kaç cm olur?

**Şekil:**
```json
{
  "kind": "geometry",
  "pointLabels": false,
  "points": {
    "A": [0, 0],
    "B": [6, 0],
    "C": [6, 8],
    "D": [0, 8],
    "E": [1.8, 1.5],
    "F": [7.8, 1.5],
    "G": [7.8, 9.5],
    "H": [1.8, 9.5]
  },
  "shapes": [
    { "type": "segment", "from": "A", "to": "B", "label": "6" },
    { "type": "segment", "from": "B", "to": "C" },
    { "type": "segment", "from": "C", "to": "D" },
    { "type": "segment", "from": "D", "to": "A", "label": "8" },
    { "type": "segment", "from": "D", "to": "H" },
    { "type": "segment", "from": "H", "to": "G" },
    { "type": "segment", "from": "G", "to": "C" },
    { "type": "segment", "from": "B", "to": "F", "label": "4" },
    { "type": "segment", "from": "F", "to": "G" },
    { "type": "segment", "from": "A", "to": "E", "dashed": true },
    { "type": "segment", "from": "E", "to": "F", "dashed": true },
    { "type": "segment", "from": "E", "to": "H", "dashed": true }
  ]
}
```

**Şıklar:**
A) 1,5
B) 2
C) 2,5
D) 3
E) 4

**Açıklama:**
Kap yatırıldığında içindeki suyun hacmi değişmez. İlk durumda suyun hacmi:
$$V_{\text{su}} = 4 \cdot 6 \cdot 6 = 144\text{ cm}^3$$
İkinci durumda taban alanı $6 \cdot 8 = 48\text{ cm}^2$ olur. Yeni su yüksekliği $h$ için $48 \cdot h = 144 \Rightarrow h = \dfrac{144}{48} = 3$ cm bulunur.

**Çeldirici Tuzağı:**
B şıkkı ($2$), ilk durumda su yüksekliği $6$ yerine kabın tüm yüksekliği $8$'in yarısını alıp farklı işlem yapan veya $4 \cdot 6$ yerine yanlış taban alanı bölen adayı; E şıkkı ($4$) ise doğrudan üçüncü ayrıt olan $4$'ü su yüksekliği sananları yakalar.

### mat-14-030
- zorluk: 3
- dogru: E
- dogrulama: min(sqrt((3 + 5)^2 + 15^2), min(sqrt((3 + 15)^2 + 5^2), sqrt((5 + 15)^2 + 3^2)))

**Soru:**
Şekildeki ayrıt uzunlukları $3$ cm, $5$ cm ve $15$ cm olan dikdörtgenler prizması biçimindeki kutunun $A$ köşesinde bulunan bir karınca, kutunun **yüzeyleri üzerinden** yürüyerek $G$ köşesine gidecektir.
Buna göre karıncanın alabileceği **en kısa yol** kaç cm'dir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": {
    "A": [0, 0],
    "B": [12, 0],
    "C": [12, 3.5],
    "D": [0, 3.5],
    "E": [2.6, 2.0],
    "F": [14.6, 2.0],
    "G": [14.6, 5.5],
    "H": [2.6, 5.5]
  },
  "dots": ["A", "G"],
  "labelPos": {
    "A": "bl",
    "B": "br",
    "C": "right",
    "D": "tl",
    "E": "bottom",
    "F": "right",
    "G": "tr",
    "H": "top"
  },
  "shapes": [
    { "type": "segment", "from": "A", "to": "B", "label": "15" },
    { "type": "segment", "from": "B", "to": "C" },
    { "type": "segment", "from": "C", "to": "D" },
    { "type": "segment", "from": "D", "to": "A", "label": "3" },
    { "type": "segment", "from": "D", "to": "H" },
    { "type": "segment", "from": "H", "to": "G" },
    { "type": "segment", "from": "G", "to": "C" },
    { "type": "segment", "from": "B", "to": "F", "label": "5" },
    { "type": "segment", "from": "F", "to": "G" },
    { "type": "segment", "from": "A", "to": "E", "dashed": true },
    { "type": "segment", "from": "E", "to": "F", "dashed": true },
    { "type": "segment", "from": "E", "to": "H", "dashed": true }
  ]
}
```

**Şıklar:**
A) 12
B) 13
C) 15
D) 23
E) 17

**Açıklama:**
Yüzeyler üzerinden $A$'dan en uzak köşe $G$'ye giden karıncanın izleyeceği düzlemsel açılımda en kısa yol $\sqrt{(x + y)^2 + z^2}$ biçimindedir (burada $x, y, z$ ayrıtların üç farklı permütasyonudur). Toplamı en küçük yapmak için **en küçük iki ayrıt** ($3$ ve $5$) toplanıp dik kenarlardan biri yapılır:
$$\sqrt{(3 + 5)^2 + 15^2} = \sqrt{8^2 + 15^2} = \sqrt{64 + 225} = \sqrt{289} = 17\text{ cm}$$
(Diğer iki açılımda $\sqrt{18^2 + 5^2} = \sqrt{349}$ ve $\sqrt{20^2 + 3^2} = \sqrt{409}$ elde edilir ve ikisi de $17$'den büyüktür.)

**Çeldirici Tuzağı:**
D şıkkı ($23$), yüzeylerden geçerken Pisagor almak yerine doğrudan üç ayrıtı ($3 + 5 + 15 = 23$) kenarlar boyunca toplayan adayı yakalar. En kısa yol iki yüzün aynı düzleme açılmasıyla oluşan hipotenüstür.