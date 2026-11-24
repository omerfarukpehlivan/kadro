---
ders: Matematik & Geometri
konu: Doğruda ve Üçgende Açılar, Üçgenler
kod: mat
kapsam: [lisans_gygk, b_grubu_gygk]
---

### mat-12-901
- zorluk: 2
- dogru: C
- dogrulama: (180 - 40) / 2 - (180 - 2 * ((180 - 40) / 2))

**Soru:**
Şekildeki $ABC$ üçgeninde $|AB| = |AC|$, $|BD| = |BC|$ ve $m(\widehat{BAC}) = 40^\circ$ olduğuna göre $m(\widehat{ABD}) = x$ kaç derecedir?

**Şekil:**
```json
{
  "kind": "geometry",
  "points": { "A": [1.71, 4.698], "B": [0, 0], "C": [3.42, 0], "D": [2.62, 2.199] },
  "shapes": [
    { "type": "polygon", "points": ["A", "B", "C"] },
    { "type": "segment", "from": "B", "to": "C", "ticks": 2 },
    { "type": "segment", "from": "B", "to": "D", "ticks": 2 },
    { "type": "angle", "vertex": "A", "from": "B", "to": "C", "label": "40°", "radius": 26 },
    { "type": "angle", "vertex": "B", "from": "D", "to": "A", "label": "x", "radius": 30 }
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
$|AB|=|AC|$ olduğundan taban açıları eşittir: $m(\widehat{B})=m(\widehat{C})=\dfrac{180^\circ-40^\circ}{2}=70^\circ$. $BDC$ üçgeninde $|BD|=|BC|$ olduğundan $m(\widehat{BDC})=m(\widehat{BCD})=70^\circ$, buradan $m(\widehat{DBC})=180^\circ-140^\circ=40^\circ$ bulunur. Sonuç olarak $x=70^\circ-40^\circ=30^\circ$ olur.

**Çeldirici Tuzağı:**
E şıkkı (40), $DBC$ açısını bulup işi bitmiş sanan adayı yakalar; soru $ABD$ açısını sormaktadır ve $B$ açısının kalan parçası $70^\circ-40^\circ$ ile hesaplanmalıdır.
