---
ders: Matematik & Geometri
konu: Basit Eşitsizlikler ve Mutlak Değer
kod: mat
kapsam: [lisans_gygk, b_grubu_gygk]
---

### mat-04-901
- zorluk: 2
- dogru: A
- dogrulama: yok

**Soru:**
Sayı doğrusunda gösterilen aralık, aşağıdaki eşitsizliklerden hangisinin çözüm kümesidir?

**Şekil:**
```json
{
  "kind": "numberline",
  "min": -3,
  "max": 6,
  "intervals": [{ "from": -1, "to": 4 }]
}
```

**Şıklar:**
A) $|2x-3| \le 5$
B) $|2x-3| < 5$
C) $|2x+3| \le 5$
D) $|x-3| \le 5$
E) $|2x-5| \le 3$

**Açıklama:**
Gösterilen aralık $[-1, 4]$ kapalı aralığıdır; uç noktalar dolu çemberle işaretlendiği için kümeye dahildir. A şıkkında $-5 \le 2x-3 \le 5$ yazılır, her tarafa 3 eklenip 2'ye bölünür: $-1 \le x \le 4$. Bu, şekildeki aralığın aynısıdır.

**Çeldirici Tuzağı:**
B şıkkı aynı uç noktaları verir ama kesin eşitsizlik olduğu için çözüm kümesi $(-1, 4)$ açık aralığıdır. Şekildeki dolu çemberleri gözden kaçıran aday B'yi işaretler; dolu çember "dahil", boş çember "hariç" demektir.

### mat-04-902
- zorluk: 1
- dogru: C
- dogrulama: 4 - (-1) + 1

**Soru:**
$|2x-3| \le 5$ eşitsizliğini sağlayan kaç farklı $x$ tam sayısı vardır?

**Şıklar:**
A) 4
B) 5
C) 6
D) 7
E) 8

**Açıklama:**
Mutlak değer eşitsizliği iki taraflı yazılır: $-5 \le 2x-3 \le 5$. Her tarafa 3 eklenir: $-2 \le 2x \le 8$; 2'ye bölünür: $-1 \le x \le 4$. Bu aralıktaki tam sayılar $-1, 0, 1, 2, 3, 4$ olup toplam 6 tanedir.

**Çeldirici Tuzağı:**
B şıkkı (5), aralıktaki tam sayıları $4-(-1)=5$ diye uç noktaların farkıyla sayan adayı yakalar. Kapalı aralıkta tam sayı adedi "büyük uç − küçük uç + 1" ile bulunur.
