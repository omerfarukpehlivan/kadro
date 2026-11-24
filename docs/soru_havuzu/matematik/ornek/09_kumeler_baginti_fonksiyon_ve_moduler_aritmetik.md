---
ders: Matematik & Geometri
konu: Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik
kod: mat
kapsam: [lisans_gygk, b_grubu_gygk]
---

### mat-09-901
- zorluk: 2
- dogru: C
- dogrulama: 8 + 8 / 2 + 2 * (8 / 2)

**Soru:**
Şekildeki Venn şemasında her bölgedeki eleman sayısı yazılmıştır.
$s(A) = s(B)$ olduğuna göre $s(A \cup B)$ kaçtır?

**Şekil:**
```json
{
  "kind": "venn",
  "universe": "E",
  "sets": ["A", "B"],
  "regions": { "A": "8", "AB": "x", "B": "2x", "out": "4" }
}
```

**Şıklar:**
A) 16
B) 18
C) 20
D) 22
E) 24

**Açıklama:**
$s(A) = 8 + x$ ve $s(B) = x + 2x = 3x$ olur. $s(A) = s(B)$ eşitliğinden $8 + x = 3x$, yani $x = 4$ bulunur. Birleşim kümesi kesişimi bir kez sayar: $s(A \cup B) = 8 + 4 + 8 = 20$.

**Çeldirici Tuzağı:**
E şıkkı (24), şemadaki tüm sayıları toplayıp $A \cup B$ dışında kalan 4 elemanı da birleşime katan adayı yakalar. Evrensel kümede olup iki kümenin de dışında kalan bölge birleşime dahil değildir.
