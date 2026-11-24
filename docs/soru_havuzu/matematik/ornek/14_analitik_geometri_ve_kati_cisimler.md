---
ders: Matematik & Geometri
konu: Analitik Geometri ve Katı Cisimler
kod: mat
kapsam: [lisans_gygk, b_grubu_gygk]
---

### mat-14-901
- zorluk: 1
- dogru: B
- dogrulama: 6 * 4 / 2

**Soru:**
Şekildeki $d$ doğrusu $A(0, 4)$ ve $B(6, 0)$ noktalarından geçmektedir.
Buna göre $d$ doğrusu ile koordinat eksenleri arasında kalan taralı bölgenin alanı kaç birimkaredir?

**Şekil:**
```json
{
  "kind": "geometry",
  "axes": { "x": [-1, 7], "y": [-1, 5], "step": 1, "grid": true },
  "points": { "O": [0, 0], "A": [0, 4], "B": [6, 0] },
  "hideLabels": ["O"],
  "labelPos": { "A": "tr", "B": "tr" },
  "dots": ["A", "B"],
  "functions": [{ "expr": "4 - 2x/3", "domain": [-0.75, 6.75], "label": "d", "labelAt": 2 }],
  "shapes": [{ "type": "polygon", "points": ["O", "A", "B"], "fill": true }]
}
```

**Şıklar:**
A) 10
B) 12
C) 18
D) 20
E) 24

**Açıklama:**
Taralı bölge, dik kenarları eksenler üzerinde olan bir dik üçgendir. Dik kenarlar $|OA| = 4$ ve $|OB| = 6$ birimdir. Alan $\dfrac{6 \cdot 4}{2} = 12$ birimkare olur.

**Çeldirici Tuzağı:**
E şıkkı (24), dik kenarları çarpıp ikiye bölmeyi unutan adayı yakalar; $6 \cdot 4 = 24$ dikdörtgenin alanıdır. Üçgenin alanı bunun yarısıdır.
