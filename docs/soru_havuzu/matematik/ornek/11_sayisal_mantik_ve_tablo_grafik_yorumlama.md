---
ders: Matematik & Geometri
konu: Sayısal Mantık ve Tablo-Grafik Yorumlama
kod: mat
kapsam: [lisans_gygk, b_grubu_gygk]
---

### mat-11-901
- zorluk: 1
- dogru: C
- dogrulama: (12 + 18 + 9 + 15 + 26) / 5

**Soru:**
Bir kırtasiyenin beş günde sattığı defter sayıları grafikte verilmiştir.
Buna göre günlük ortalama satış kaç defterdir?

**Şekil:**
```json
{
  "kind": "bar",
  "categories": ["Pzt", "Sal", "Çar", "Per", "Cum"],
  "values": [12, 18, 9, 15, 26],
  "yLabel": "Defter"
}
```

**Şıklar:**
A) 14
B) 15
C) 16
D) 17
E) 18

**Açıklama:**
Beş günün satışları toplanır: $12 + 18 + 9 + 15 + 26 = 80$. Ortalama, toplamın gün sayısına bölümüdür: $80 \div 5 = 16$.

**Çeldirici Tuzağı:**
B şıkkı (15), değerleri sıralayıp ortadakini ($9, 12, 15, 18, 26$ dizisinde 15) alan adayı yakalar; bu ortanca (medyan) değerdir. Soru aritmetik ortalamayı sormaktadır.

### mat-11-902
- zorluk: 2
- dogru: B
- dogrulama: 120 * 25 / 100 - 120 * 15 / 100

**Soru:**
Bir şirketteki 120 çalışanın ulaşım tercihleri tabloda verilmiştir.
Servis kullananların sayısı, bisiklet kullananların sayısından kaç fazladır?

**Şekil:**
```json
{
  "kind": "table",
  "headers": ["Ulaşım türü", "Yüzde"],
  "rows": [
    ["Toplu taşıma", "%40"],
    ["Servis", "%25"],
    ["Özel araç", "%20"],
    ["Bisiklet", "%15"]
  ]
}
```

**Şıklar:**
A) 10
B) 12
C) 15
D) 18
E) 30

**Açıklama:**
Servis kullananlar $120 \cdot \dfrac{25}{100} = 30$, bisiklet kullananlar $120 \cdot \dfrac{15}{100} = 18$ kişidir. Fark $30 - 18 = 12$ olur. Kısaca yüzdelerin farkı da kullanılabilir: $120 \cdot \dfrac{10}{100} = 12$.

**Çeldirici Tuzağı:**
A şıkkı (10), yüzde farkını ($25 - 15 = 10$) doğrudan kişi sayısı sanan adayı yakalar. Yüzde farkı, toplam çalışan sayısı üzerinden kişiye çevrilmelidir.
