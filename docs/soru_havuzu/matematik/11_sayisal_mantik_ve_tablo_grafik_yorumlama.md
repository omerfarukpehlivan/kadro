---
ders: Matematik & Geometri
konu: Sayısal Mantık ve Tablo-Grafik Yorumlama
kod: mat
kapsam: [lisans_gygk, b_grubu_gygk]
---

### mat-11-001
- zorluk: 1
- dogru: C
- dogrulama: (24 + 48) * 100 / (25 + 35 + 24 + 48 + 28)

**Soru:**
Bir kütüphaneye yılın ilk beş ayında kaydolan yeni üye sayıları grafikte verilmiştir.
Buna göre Mart ve Nisan aylarında kaydolan toplam üye sayısı, beş aylık toplam yeni üye sayısının yüzde kaçıdır?

**Şekil:**
```json
{
  "kind": "bar",
  "categories": ["Oca", "Şub", "Mar", "Nis", "May"],
  "values": [25, 35, 24, 48, 28],
  "yLabel": "Üye",
  "yStep": 10,
  "yMax": 60,
  "valueLabels": true
}
```

**Şıklar:**
A) %35
B) %40
C) %45
D) %48
E) %50

**Açıklama:**
Beş ayda kaydolan toplam üye sayısı $25 + 35 + 24 + 48 + 28 = 160$'tır. Mart ve Nisan aylarındaki toplam üye sayısı $24 + 48 = 72$'dir. Yüzde oranı $\dfrac{72}{160} \cdot 100 = \dfrac{9}{20} \cdot 100 = 45$ olduğundan $\%45$ bulunur.

**Çeldirici Tuzağı:**
D şıkkı (%48), yalnızca Nisan ayındaki $48$ değerini görüp yüzdeyle karıştıran ya da paydadaki $160$ toplamını eksik toplayarak farklı bir orana ulaşan adayı yakalar.

### mat-11-002
- zorluk: 2
- dogru: A
- dogrulama: (45 + 40) + (65 + 45)

**Soru:**
Bir teknoloji mağazasının dört çeyrekteki çevrimiçi ve mağaza içi satış tutarları grafikte verilmiştir.
Çevrimiçi satışların mağaza içi satışları geçtiği çeyreklerdeki toplam satış tutarı (çevrimiçi ve mağaza içi birlikte) kaç bin TL'dir?

**Şekil:**
```json
{
  "kind": "line",
  "categories": ["Ç1", "Ç2", "Ç3", "Ç4"],
  "series": [
    { "name": "Çevrimiçi", "values": [30, 45, 40, 65] },
    { "name": "Mağaza", "values": [50, 40, 55, 45] }
  ],
  "yLabel": "Bin TL",
  "yStep": 10,
  "yMax": 70
}
```

**Şıklar:**
A) 195
B) 110
C) 170
D) 180
E) 210

**Açıklama:**
Grafikte düz çizgi çevrimiçi satışları, kesikli çizgi mağaza içi satışları göstermektedir. Ç1'de $30 < 50$ ve Ç3'te $40 < 55$ olduğundan çevrimiçi satışlar geridedir. Ç2'de $45 > 40$ ve Ç4'te $65 > 45$ olduğundan bu iki çeyrek koşulu sağlar. İstenen çeyreklerdeki toplam satış $(45 + 40) + (65 + 45) = 85 + 110 = 195$ bin TL olur.

**Çeldirici Tuzağı:**
B şıkkı (110), doğru çeyrekler olan Ç2 ve Ç4'ü belirledikten sonra yalnızca çevrimiçi satışları ($45 + 65 = 110$) toplayıp mağaza içi satışları toplama katmayı unutan adayı yakalar.

### mat-11-003
- zorluk: 2
- dogru: E
- dogrulama: (144 - 72) * (18 / 54)

**Soru:**
Bir çiftçinin arazisindeki dört ürünün ekili alan dağılımı merkez açılarıyla daire grafiğinde gösterilmiştir.
Nohut ekili alan $18$ dönüm olduğuna göre buğday ekili alan, mısır ekili alandan kaç dönüm fazladır?

**Şekil:**
```json
{
  "kind": "pie",
  "slices": [
    { "label": "Buğday", "value": 144 },
    { "label": "Arpa", "value": 90 },
    { "label": "Mısır", "value": 72 },
    { "label": "Nohut", "value": 54 }
  ],
  "show": "degree"
}
```

**Şıklar:**
A) 12
B) 16
C) 18
D) 20
E) 24

**Açıklama:**
Grafikte $54^\circ$'lik dilime $18$ dönüm karşılık gelmektedir; buradan her $3^\circ$'nin $1$ dönüme ($18 \div 54 = 1/3$ dönüm/derece) denk geldiği görülür. Buğday ($144^\circ$) ile mısır ($72^\circ$) arasındaki açı farkı $144^\circ - 72^\circ = 72^\circ$'dir. Bu açı farkı $72 \div 3 = 24$ dönüme karşılık gelir.

**Çeldirici Tuzağı:**
C şıkkı (18), açı farkını oranlamak yerine doğrudan nohut alanıyla aynı sanan ya da yanlış dilimi çıkaran adayı yakalar. Önce bir dereceye veya sade bir açıya karşılık gelen alan bulunmalıdır.

### mat-11-004
- zorluk: 2
- dogru: D
- dogrulama: ((3 * 1800 + 2 * 2400) - (3 * 1200 + 2 * 1600)) * 100 / (3 * 1200 + 2 * 1600)

**Soru:**
Bir otelin üç farklı oda tipine ait gecelik konaklama ücretleri tabloda verilmiştir.
Hafta içi $3$ gece ve hafta sonu $2$ gece konaklayacak bir misafir, Standart oda yerine Aile odasını tercih ederse ödeyeceği toplam ücret yüzde kaç artar?

**Şekil:**
```json
{
  "kind": "table",
  "headers": ["Oda Tipi", "Hafta İçi (TL)", "Hafta Sonu (TL)"],
  "rows": [
    ["Standart", "1.200", "1.600"],
    ["Aile", "1.800", "2.400"],
    ["Süit", "2.500", "3.200"]
  ]
}
```

**Şıklar:**
A) %25
B) %33
C) %40
D) %50
E) %60

**Açıklama:**
Standart odada $3$ hafta içi ve $2$ hafta sonu gecesinin toplam ücreti $3 \cdot 1.200 + 2 \cdot 1.600 = 3.600 + 3.200 = 6.800$ TL'dir. Aile odasında aynı konaklamanın toplam ücreti $3 \cdot 1.800 + 2 \cdot 2.400 = 5.400 + 4.800 = 10.200$ TL olur. Ücretteki artış $10.200 - 6.800 = 3.400$ TL olduğundan artış oranı $\dfrac{3.400}{6.800} = \dfrac{1}{2} = \%50$ bulunur.

**Çeldirici Tuzağı:**
B şıkkı (%33), aradaki $3.400$ TL'lik farkı başlangıç ücreti olan $6.800$ TL'ye bölmek yerine büyük tutar olan $10.200$ TL'ye bölen adayı yakalar. Artış yüzdesi her zaman başlangıçtaki (referans) değer üzerinden hesaplanır.

### mat-11-005
- zorluk: 1
- dogru: B
- dogrulama: (19 * 2 - 5) / 3

**Soru:**
Şekildeki işlem düzeneneğinde dairelerin içine sayılar yazılmakta, okların üzerindeki işlemler soldan sağa sırayla uygulanmaktadır.
Çıkış değeri $19$ olduğuna göre girişteki $x$ sayısı kaçtır?

**Şekil:**
```json
{
  "kind": "flow",
  "nodes": [
    { "id": "in", "text": "x", "at": [0, 0], "shape": "circle" },
    { "id": "a", "text": "3x", "at": [1.5, 0] },
    { "id": "b", "text": "3x + 5", "at": [3, 0] },
    { "id": "out", "text": "19", "at": [4.5, 0], "shape": "circle" }
  ],
  "edges": [
    { "from": "in", "to": "a", "label": "×3" },
    { "from": "a", "to": "b", "label": "+5" },
    { "from": "b", "to": "out", "label": "÷2" }
  ]
}
```

**Şıklar:**
A) 9
B) 11
C) 13
D) 15
E) 17

**Açıklama:**
Şemadaki işlemler tersten uygulanabilir veya denklem kurulabilir: $\dfrac{3x + 5}{2} = 19 \Rightarrow 3x + 5 = 38 \Rightarrow 3x = 33 \Rightarrow x = 11$ bulunur.

**Çeldirici Tuzağı:**
C şıkkı (13), sondan başa giderken $+5$ yerine yanlışlıkla $-5$ işlem sırasını bozup $\dfrac{19 \cdot 2 + 5}{3}$ ya da hatalı denklem kuran adayı yakalar.

### mat-11-006
- zorluk: 3
- dogru: A
- dogrulama: (3 * 7 - 1) / 2 + 5

**Soru:**
Şekildeki akış şemasında $n$ tam sayısı tek veya çift olmasına göre ilgili koldan ilerleyerek bir çıkış değeri üretmektedir. Elde edilen ilk çıkış değeri tekrar girişe verilerek sistem ikinci kez çalıştırılıyor.
İlk giriş $n = 7$ olduğuna göre ikinci çalıştırma sonunda elde edilen çıkış değeri kaçtır?

**Şekil:**
```json
{
  "kind": "flow",
  "nodes": [
    { "id": "in", "text": "n", "at": [0, 1], "shape": "circle" },
    { "id": "even", "text": "n ÷ 2 + 5", "at": [2, 0] },
    { "id": "odd", "text": "3n − 1", "at": [2, 2] },
    { "id": "out", "text": "Çıkış", "at": [4, 1], "shape": "circle" }
  ],
  "edges": [
    { "from": "in", "to": "even", "label": "n çift" },
    { "from": "in", "to": "odd", "label": "n tek" },
    { "from": "even", "to": "out" },
    { "from": "odd", "to": "out" }
  ]
}
```

**Şıklar:**
A) 15
B) 20
C) 25
D) 40
E) 59

**Açıklama:**
İlk çalıştırmada $n = 7$ tek sayı olduğu için alt kol uygulanır: $3 \cdot 7 - 1 = 20$. İkinci çalıştırmada yeni giriş $n = 20$ çift sayı olduğu için üst kol seçilir: $20 \div 2 + 5 = 10 + 5 = 15$ bulunur.

**Çeldirici Tuzağı:**
B şıkkı (20), ilk adımın sonucunu bulduktan sonra ikinci kez sisteme sokmayı unutan adayı yakalar. E şıkkı (59) ise $20$'nin çift olduğunu gözden kaçırıp ikinci adımda da tek kolunu ($3 \cdot 20 - 1$) uygulayanların işaretlediği şıktır.

### mat-11-007
- zorluk: 2
- dogru: D
- dogrulama: 3 + 8

**Soru:**
Rakamları sıfırdan ve birbirinden farklı üç basamaklı bir $A6C$ doğal sayısının "denge kodu" şu iki kuraldan biriyle hesaplanmaktadır:
- $A + C > 6$ ise $\text{kod} = 6A + C$
- $A + C \le 6$ ise $\text{kod} = 6C - A$
Denge kodu $26$ olduğuna göre $A + C$ toplamı kaçtır?

**Şıklar:**
A) 6
B) 8
C) 9
D) 11
E) 13

**Açıklama:**
İki durum ayrı ayrı kontrol edilir ($A, C \in \{1, \ldots, 9\} \setminus \{6\}$ ve $A \neq C$):
1. $A + C > 6$ durumu: $6A + C = 26$. Burada $A = 4$ seçilirse $C = 2$ olur ancak $4 + 2 = 6$ olup $6$'dan büyük değildir; koşul sağlanmaz. $A = 3$ için $C = 8$ bulunur; $3 + 8 = 11 > 6$ ve $\{3, 6, 8\}$ rakamları farklıdır (geçerli tek sayı $368$).
2. $A + C \le 6$ durumu: $6C - A = 26 \Rightarrow 6C = 26 + A$. Rakam aralığında yalnızca $C = 5, A = 4$ çıkar; ancak $4 + 5 = 9 > 6$ olduğundan geçersizdir.
O hâlde $A = 3$ ve $C = 8$ olup $A + C = 11$ bulunur.

**Çeldirici Tuzağı:**
A şıkkı ($6$), $6A + C = 26$ eşitliğinden bulduğu $A = 4, C = 2$ çiftinin $A + C > 6$ kesin eşitsizliğini sağlamadığını kontrol etmeden $4 + 2 = 6$ işaretleyen; C şıkkı ($9$) ise ikinci kolda $4 + 5 = 9$'u kontrolsüz alan adayı yakalar.

### mat-11-008
- zorluk: 3
- dogru: E
- dogrulama: (sqrt(30 - 5) + 3) / 2 + (-sqrt(30 - 5) + 3) / 2

**Soru:**
Gerçel sayılar kümesinde $\Delta$ ve $\circ$ işlemleri her $a$ ve $b$ gerçel sayısı için
$a \Delta b = 2a - b$
$a \circ b = a^2 + b$
biçiminde tanımlanıyor.
Buna göre $(x \Delta 3) \circ 5 = 30$ eşitliğini sağlayan $x$ gerçel sayılarının toplamı kaçtır?

**Şıklar:**
A) $-1$
B) $1$
C) $2$
D) $4$
E) $3$

**Açıklama:**
Önce parantez içi hesaplanır: $x \Delta 3 = 2x - 3$. Ardından $\circ$ işlemi uygulanır: $(2x - 3) \circ 5 = (2x - 3)^2 + 5 = 30 \Rightarrow (2x - 3)^2 = 25$. Karesi $25$ olan iki gerçel sayı olduğundan iki durum incelenir: $2x - 3 = 5 \Rightarrow x_1 = 4$ ve $2x - 3 = -5 \Rightarrow x_2 = -1$. Eşitliği sağlayan $x$ değerlerinin toplamı $4 + (-1) = 3$ bulunur.

**Çeldirici Tuzağı:**
D şıkkı (4), $(2x - 3)^2 = 25$ denkleminden yalnızca pozitif kök olan $2x - 3 = 5 \Rightarrow x = 4$ değerini alıp negatif karekök ($-5$) durumunu unutan adayı yakalar.

### mat-11-009
- zorluk: 1
- dogru: D
- dogrulama: (100 - 40) * 100 / 40

**Soru:**
Bir işletmenin dört farklı ürününün aylık satış adetleri grafikte gösterilmiştir.
Buna göre D ürününün satış adedi, A ürününün satış adedinden yüzde kaç fazladır?

**Şekil:**
```json
{
  "kind": "bar",
  "categories": ["A", "B", "C", "D"],
  "values": [40, 80, 60, 100],
  "yLabel": "Adet",
  "yStep": 20,
  "yMax": 120,
  "valueLabels": false
}
```

**Şıklar:**
A) %60
B) %100
C) %125
D) %150
E) %250

**Açıklama:**
Grafikten A ürününün satış adedi $40$, D ürününün satış adedi $100$ okunur. Artış miktarı $100 - 40 = 60$ adettir. A ürününe göre fazlalık yüzdesi $\dfrac{60}{40} \cdot 100 = 150$, yani $\%150$ bulunur.

**Çeldirici Tuzağı:**
E şıkkı (%250), $\dfrac{100}{40} \cdot 100 = 250$ hesaplayarak "yüzde kaçıdır?" ile "yüzde kaç fazlasıdır?" sorularını karıştıran adayı yakalar. A şıkkı (%60) ise doğrudan farkı ($100 - 40 = 60$) yüzde sananların tuzağıdır.

### mat-11-010
- zorluk: 2
- dogru: B
- dogrulama: 720 * (25 - 20) / 100

**Soru:**
Bir okul kütüphanesindeki toplam $720$ kitabın türlere göre dağılımı daire grafiğinde verilmiştir.
Buna göre kütüphanedeki Tarih kitaplarının sayısı, Şiir kitaplarının sayısından kaç fazladır?

**Şekil:**
```json
{
  "kind": "pie",
  "slices": [
    { "label": "Roman", "value": 35 },
    { "label": "Tarih", "value": 25 },
    { "label": "Bilim", "value": 20 },
    { "label": "Şiir", "value": 20 }
  ],
  "show": "percent"
}
```

**Şıklar:**
A) 24
B) 36
C) 48
D) 72
E) 144

**Açıklama:**
Tarih kitapları toplamın $\%25$'i, Şiir kitapları ise $\%20$'sidir. Aradaki yüzde farkı $\%25 - \%20 = \%5$'tir. Toplam $720$ kitabın $\%5$'i $720 \cdot \dfrac{5}{100} = 36$ kitap fazlalık verir.

**Çeldirici Tuzağı:**
E şıkkı (144), yalnızca Şiir kitaplarının sayısını ($720 \cdot 0{,}20 = 144$) hesaplayıp fark almayı unutan adayı yakalar.

### mat-11-011
- zorluk: 2
- dogru: A
- dogrulama: max(55 - 40, 75 - 45)

**Soru:**
Bir öğrencinin hafta içi beş gün boyunca çözdüğü günlük soru sayıları çizgi grafiğinde verilmiştir.
Bir önceki güne göre günlük soru sayısında yaşanan en büyük artış kaç sorudur?

**Şekil:**
```json
{
  "kind": "line",
  "categories": ["Pzt", "Sal", "Çar", "Per", "Cum"],
  "series": [{ "name": "Soru", "values": [40, 55, 45, 75, 60] }],
  "yLabel": "Soru",
  "yStep": 15,
  "yMax": 90
}
```

**Şıklar:**
A) 30
B) 15
C) 20
D) 35
E) 75

**Açıklama:**
Artış yaşanan günler incelenir: Pazartesi'den Salı'ya artış $55 - 40 = 15$ sorudur. Salı'dan Çarşamba'ya düşüş yaşanmıştır. Çarşamba'dan Perşembe'ye artış $75 - 45 = 30$ sorudur. Perşembe'den Cuma'ya düşüş yaşanmıştır. Dolayısıyla en büyük günlük artış $30$ sorudur.

**Çeldirici Tuzağı:**
E şıkkı (75), artış miktarı yerine en yüksek soru çözülen Perşembe günündeki toplam sayıyı ($75$) işaretleyen; D şıkkı (35) ise tüm haftanın en yüksek ve en düşük değerleri farkını ($75 - 40 = 35$) alan adayı yakalar.

### mat-11-012
- zorluk: 2
- dogru: E
- dogrulama: (1400 - (40 * 15 + 15 * 20)) / 25

**Soru:**
Bir kırtasiyede gün içinde satılan üç ürüne ait birim fiyat ve satış adedi bilgileri tabloda verilmiştir.
Bu üç ürünün satışından elde edilen toplam gelir $1.400$ TL olduğuna göre satılan kalem adedi ($x$) kaçtır?

**Şekil:**
```json
{
  "kind": "table",
  "headers": ["Ürün", "Birim Fiyat (TL)", "Satılan Adet"],
  "rows": [
    ["Defter", "40", "15"],
    ["Kalem", "25", "x"],
    ["Silgi", "15", "20"]
  ]
}
```

**Şıklar:**
A) 12
B) 15
C) 16
D) 18
E) 20

**Açıklama:**
Defter ve silgi satışlarından elde edilen gelirler hesaplanır: $40 \cdot 15 = 600$ TL ve $15 \cdot 20 = 300$ TL (toplam $900$ TL). Toplam gelirin $1.400$ TL olması için kalem satışından $1.400 - 900 = 500$ TL gelir gelmelidir. Tanesi $25$ TL olan kalemlerden $x = \dfrac{500}{25} = 20$ adet satılmıştır.

**Çeldirici Tuzağı:**
C şıkkı (16), $1.400$'den $600 + 300 = 900$ yerine $1.000$ çıkarıp $400 \div 25 = 16$ bulan ya da silgi adetini yanlış çarpan adayı yakalar.

### mat-11-013
- zorluk: 1
- dogru: C
- dogrulama: 90 + 140 + 50

**Soru:**
Bir otoparkın tek girişlik ücret tarifesi tabloda verilmiştir.
Aracını bu otoparka Pazartesi günü $3$ saat, Salı günü $6$ saat ve Çarşamba günü $1$ saat bırakan bir sürücü üç gün için toplam kaç TL öder?

**Şekil:**
```json
{
  "kind": "table",
  "headers": ["Kalış Süresi", "Ücret (TL)"],
  "rows": [
    ["0 - 2 saat", "50"],
    ["2 - 5 saat", "90"],
    ["5 - 10 saat", "140"]
  ]
}
```

**Şıklar:**
A) 190
B) 240
C) 280
D) 300
E) 330

**Açıklama:**
Her gün ayrı giriş yapıldığı için günlere karşılık gelen tarife dilimleri okunur: Pazartesi ($3$ saat $\to 2 - 5$ saat dilimi) için $90$ TL, Salı ($6$ saat $\to 5 - 10$ saat dilimi) için $140$ TL ve Çarşamba ($1$ saat $\to 0 - 2$ saat dilimi) için $50$ TL ödenir. Toplam ücret $90 + 140 + 50 = 280$ TL'dir.

**Çeldirici Tuzağı:**
A şıkkı (190) veya E şıkkı (330), üç günün saatlerini toplayıp ($10$ saat) tek gün üzerinden tarife uygulamaya çalışan ya da saatleri $90 \cdot 3$ gibi çarpan adayı yakalar.

### mat-11-014
- zorluk: 2
- dogru: D
- dogrulama: (29 + 4) / 3 - 5

**Soru:**
Şekildeki işlem makinesinde ilk kutuda $5$ ve $b$ sayıları toplanmakta, ardından okların üzerindeki işlemler sırayla uygulanarak çıkışa $29$ sayısı yazılmaktadır.
Buna göre $b$ değeri kaçtır?

**Şekil:**
```json
{
  "kind": "flow",
  "nodes": [
    { "id": "in", "text": "5 + b", "at": [0, 0] },
    { "id": "m", "text": "3(5 + b)", "at": [1.8, 0] },
    { "id": "out", "text": "29", "at": [3.6, 0], "shape": "circle" }
  ],
  "edges": [
    { "from": "in", "to": "m", "label": "×3" },
    { "from": "m", "to": "out", "label": "−4" }
  ]
}
```

**Şıklar:**
A) 3
B) 4
C) 5
D) 6
E) 11

**Açıklama:**
Denklem soldan sağa kurulur: $3(5 + b) - 4 = 29 \Rightarrow 3(5 + b) = 33 \Rightarrow 5 + b = 11 \Rightarrow b = 6$ bulunur.

**Çeldirici Tuzağı:**
E şıkkı (11), $5 + b = 11$ ara değerini bulduktan sonra $5$'i çıkarmadan doğrudan $11$'i işaretleyen adayı yakalar.

### mat-11-015
- zorluk: 3
- dogru: B
- dogrulama: 10 + 8 - 3 * 2

**Soru:**
Şekildeki iki kollu işlem düzeneğine aynı $x$ sayısı girildiğinde üst koldan $A$, alt koldan $B$ çıkışı elde edilmektedir.
$B - A = 10$ olduğuna göre girişteki $x$ sayısı kaçtır?

**Şekil:**
```json
{
  "kind": "flow",
  "nodes": [
    { "id": "in", "text": "x", "at": [0, 1], "shape": "circle" },
    { "id": "u1", "text": "2x", "at": [1.6, 0] },
    { "id": "u2", "text": "A", "at": [3.2, 0], "shape": "circle" },
    { "id": "d1", "text": "x + 2", "at": [1.6, 2] },
    { "id": "d2", "text": "B", "at": [3.2, 2], "shape": "circle" }
  ],
  "edges": [
    { "from": "in", "to": "u1", "label": "×2" },
    { "from": "u1", "to": "u2", "label": "+8" },
    { "from": "in", "to": "d1", "label": "+2" },
    { "from": "d1", "to": "d2", "label": "×3" }
  ]
}
```

**Şıklar:**
A) 8
B) 12
C) 14
D) 16
E) 18

**Açıklama:**
Üst koldaki çıkış $A = 2x + 8$, alt koldaki çıkış ise $B = 3(x + 2) = 3x + 6$ olur. Verilen $B - A = 10$ eşitliğinde yerine konursa $(3x + 6) - (2x + 8) = 10 \Rightarrow x - 2 = 10 \Rightarrow x = 12$ bulunur.

**Çeldirici Tuzağı:**
D şıkkı (16), alt kolda parantez dağıtmayı unutup $B = 3x + 2$ yazarak $(3x + 2) - (2x + 8) = x - 6 = 10 \Rightarrow x = 16$ bulan adayı yakalar.

### mat-11-016
- zorluk: 1
- dogru: B
- dogrulama: yok

**Soru:**
Bir ekipteki Arda, Burak, Can, Deniz ve Emre isimli beş çalışan, Pazartesi gününden başlayarak haftanın her günü yalnızca bir kişi görev alacak biçimde sırayla (Arda, Burak, Can, Deniz, Emre, Arda, ...) nöbet tutmaktadır.
İlk nöbeti Pazartesi günü Arda tuttuğuna göre, **$43.$ nöbeti** kim ve hangi gün tutar?

**Şıklar:**
A) Arda - Salı
B) Can - Pazartesi
C) Can - Salı
D) Deniz - Pazartesi
E) Burak - Pazar

**Açıklama:**
- Kişi döngüsü $5$ günde bir başa döner: $43 = 5 \cdot 8 + 3$ (mod $5$'te $3$) olduğundan $3.$ sıradaki çalışan olan **Can** nöbet tutar.
- Gün döngüsü $7$ günde bir başa döner: $43 = 7 \cdot 6 + 1$ (mod $7$'de $1$) olduğundan ilk gün olan **Pazartesi** gününe denk gelir.
Sonuç olarak $43.$ nöbeti **Can - Pazartesi** günü tutar.

**Çeldirici Tuzağı:**
C şıkkı (Can - Salı), $43 \div 7$ bölmesinin kalanını $1$ bulduktan sonra Pazartesi'yi $0$. gün sanıp $1$ gün ileri kayarak Salı'yı seçen adayı yakalar. İlk nöbet Pazartesi ($1.$ gün) olduğundan kalan $1$ doğrudan Pazartesi'yi verir.

### mat-11-017
- zorluk: 2
- dogru: C
- dogrulama: 9 + 2 + (20 - 9 * 2)

**Soru:**
Üç basamaklı bir $abc$ doğal sayısının "kodu", $a \cdot b + c$ işlemiyle tanımlanmaktadır (örneğin $243$ sayısının kodu $2 \cdot 4 + 3 = 11$'dir).
Buna göre kodu $20$ olan üç basamaklı en büyük doğal sayının rakamları toplamı kaçtır?

**Şıklar:**
A) 9
B) 11
C) 13
D) 14
E) 15

**Açıklama:**
Üç basamaklı en büyük sayıyı elde etmek için önce yüzler basamağı olan $a$ en büyük değer olan $9$ seçilir. $9 \cdot b + c = 20$ eşitliğinde $b$'nin alabileceği en büyük rakam $2$'dir ($b = 3$ için $27 > 20$; $b = 1$ için $c = 11$ rakam olmaz). $b = 2$ alındığında $18 + c = 20 \Rightarrow c = 2$ olur ve sayı $922$ bulunur. Rakamları toplamı $9 + 2 + 2 = 13$'tür.

**Çeldirici Tuzağı:**
A şıkkı (9), büyük sayıyı kurarken en büyük yüzler basamağı yerine $a \cdot b = 20$ yapıp $540$ ($5 + 4 + 0 = 9$) seçen adayı yakalar. Oysa $c = 2$ bırakılarak yüzler basamağı $9$ yapılabilmektedir.

### mat-11-018
- zorluk: 2
- dogru: D
- dogrulama: 2 * C(6, 2)

**Soru:**
$6$ takımın katıldığı bir futbol liginde her takım diğer tüm takımlarla biri kendi sahasında diğeri deplasmanda olmak üzere ikişer kez karşılaşmaktadır.
Bu ligde sezon boyunca toplam kaç maç oynanır?

**Şıklar:**
A) 12
B) 15
C) 24
D) 30
E) 36

**Açıklama:**
Her iki takım arasında bir maç oynansaydı toplam $\binom{6}{2} = \dfrac{6 \cdot 5}{2} = 15$ maç oynanırdı. Her çift birbiriyle ikişer kez (ev ve deplasman) karşılaştığı için toplam maç sayısı $2 \cdot 15 = 30$ olur.

**Çeldirici Tuzağı:**
B şıkkı (15), iki takımın birbiriyle iki kez oynayacağını unutup tek devreli lig hesabıyla $\binom{6}{2} = 15$ işaretleyen adayı; E şıkkı (36) ise $6 \cdot 6 = 36$ yapanları yakalar.

### mat-11-019
- zorluk: 3
- dogru: E
- dogrulama: 99 + (252 - 9 - 90 * 2) / 3

**Soru:**
$1$'den başlayarak ardışık biçimde numaralandırılan bir kitabın tüm sayfalarını numaralandırmak için toplam $252$ adet rakam kullanılmıştır.
Buna göre bu kitap kaç sayfadır?

**Şıklar:**
A) 110
B) 118
C) 121
D) 126
E) 120

**Açıklama:**
Tek basamaklı sayfalar ($1$'den $9$'a kadar) için $9 \cdot 1 = 9$ rakam kullanılır.
İki basamaklı sayfalar ($10$'dan $99$'a kadar $90$ sayfa) için $90 \cdot 2 = 180$ rakam kullanılır.
İlk $99$ sayfada toplam $9 + 180 = 189$ rakam harcanmıştır. Kalan $252 - 189 = 63$ rakam üç basamaklı sayfalar içindir; her sayfa $3$ rakam kullandığından $\dfrac{63}{3} = 21$ tane üç basamaklı sayfa vardır. Kitabın son sayfası $99 + 21 = 120$'dir.

**Çeldirici Tuzağı:**
D şıkkı (126), iki basamaklı sayfa adedini $90$ yerine $99 - 10 = 89$ sanarak hesaplayan; C şıkkı (121) ise $100$'den başlayarak $21$ sayfa sayarken $+1$ ekleyen adayı yakalar.

### mat-11-020
- zorluk: 2
- dogru: B
- dogrulama: 30 * 360 / (120 + 90 + 60 + 30)

**Soru:**
Bir kırtasiyede bulunan dört farklı renkteki toplam $300$ kalemin dağılımı daire grafiğinde verilmiştir.
Buna göre Yeşil kalemleri gösteren daire diliminin merkez açısı kaç derecedir?

**Şekil:**
```json
{
  "kind": "pie",
  "slices": [
    { "label": "Mavi", "value": 120 },
    { "label": "Siyah", "value": 90 },
    { "label": "Kırmızı", "value": 60 },
    { "label": "Yeşil", "value": 30 }
  ],
  "show": "value"
}
```

**Şıklar:**
A) 30
B) 36
C) 40
D) 45
E) 72

**Açıklama:**
Toplam kalem sayısı $120 + 90 + 60 + 30 = 300$'dür ve tam daire $360^\circ$'ye karşılık gelir. Yeşil kalemlerin sayısı $30$ olduğundan tüm kalemlerin $\dfrac{30}{300} = \dfrac{1}{10}$'udur. Merkez açısı $\dfrac{360^\circ}{10} = 36^\circ$ bulunur.

**Çeldirici Tuzağı:**
A şıkkı (30), kalem adedini doğrudan merkez açı sanıp $30^\circ$ işaretleyen adayı yakalar. $300$ kalem $360^\circ$'ye karşılık geldiği için sayı ile açı aynı değildir.

### mat-11-021
- zorluk: 1
- dogru: C
- dogrulama: (16 + 24 + 20 + 28) / 4

**Soru:**
Bir kargo şubesinin dört günde dağıttığı paket sayıları grafikte verilmiştir.
Buna göre dört gün boyunca günlük ortalama kaç paket dağıtılmıştır?

**Şekil:**
```json
{
  "kind": "bar",
  "categories": ["Pzt", "Sal", "Çar", "Per"],
  "values": [16, 24, 20, 28],
  "yLabel": "Paket",
  "yStep": 5,
  "yMax": 30,
  "valueLabels": true
}
```

**Şıklar:**
A) 20
B) 21
C) 22
D) 23
E) 24

**Açıklama:**
Dört günün paket sayıları toplanır: $16 + 24 + 20 + 28 = 88$. Günlük ortalama toplamın gün sayısına bölünmesiyle $\dfrac{88}{4} = 22$ paket bulunur.

**Çeldirici Tuzağı:**
B şıkkı (21) veya E şıkkı (24), verileri toplayıp $4$'e bölmek yerine grafikteki ortadaki değerleri seçmeye çalışan veya toplamı hatalı yapan adayı yakalar.

### mat-11-022
- zorluk: 3
- dogru: A
- dogrulama: (0.25 * (6 + 13 + 11) - 6) / (1 - 0.25)

**Soru:**
Bir sınıftaki kız ve erkek öğrencilerin gözlük kullanma durumları tabloda verilmiştir.
Bu sınıftaki gözlüklü öğrencilerin sayısı, tüm sınıf mevcudunun $\%25$'i olduğuna göre gözlüklü erkek öğrenci sayısı ($x$) kaçtır?

**Şekil:**
```json
{
  "kind": "table",
  "headers": ["Grup", "Gözlüklü", "Gözlüksüz"],
  "rows": [
    ["Kız", "6", "13"],
    ["Erkek", "x", "11"]
  ]
}
```

**Şıklar:**
A) 2
B) 3
C) 4
D) 6
E) 8

**Açıklama:**
Sınıftaki toplam öğrenci sayısı $6 + 13 + x + 11 = 30 + x$, gözlüklü öğrenci sayısı ise $6 + x$'tir. Verilen yüzde oranından $\dfrac{6 + x}{30 + x} = \dfrac{25}{100} = \dfrac{1}{4}$ denklemi kurulur. İçler dışlar çarpımı yapılırsa $4(6 + x) = 30 + x \Rightarrow 24 + 4x = 30 + x \Rightarrow 3x = 6 \Rightarrow x = 2$ bulunur.

**Çeldirici Tuzağı:**
E şıkkı (8), sınıf mevcudunu $32$ bulduktan sonra gözlüklü erkek sayısı $x = 2$ yerine sınıftaki toplam gözlüklü öğrenci sayısını ($6 + 2 = 8$) işaretleyen adayı yakalar.

### mat-11-023
- zorluk: 1
- dogru: C
- dogrulama: (((140 + 180 + 160 + 220) / 4) - 140) / 140 * 100

**Soru:**
Bir kırtasiyenin yılın ilk dört ayında sattığı defter sayıları aşağıdaki sütun grafiğinde verilmiştir.
Buna göre bu dört aydaki aylık ortalama defter satışı, **Ocak** ayındaki satış adedinden yüzde kaç fazladır?

**Şekil:**
```json
{
  "kind": "bar",
  "categories": ["Ocak", "Şubat", "Mart", "Nisan"],
  "values": [140, 180, 160, 220],
  "yLabel": "Adet",
  "yStep": 40,
  "yMax": 240,
  "valueLabels": true
}
```

**Şıklar:**
A) %15
B) %20
C) %25
D) %30
E) %35

**Açıklama:**
Grafikten okunan aylık satış adetlerinin ortalaması $\dfrac{140 + 180 + 160 + 220}{4} = \dfrac{700}{4} = 175$ adettir. Ortalama satış, Ocak ayındaki $140$ adetten $175 - 140 = 35$ adet fazladır. Artış yüzdesi Ocak ayına göre hesaplanır:
$$\frac{35}{140} \cdot 100 = \frac{1}{4} \cdot 100 = \%25$$

**Çeldirici Tuzağı:**
B şıkkı ($\%20$), fark olan $35$'i Ocak ayı ($140$) yerine ortalama satış olan $175$'e bölerek $\dfrac{35}{175} = \%20$ bulan adayların düştüğü klasik referans noktası tuzağıdır.

### mat-11-024
- zorluk: 2
- dogru: D
- dogrulama: 3600 * (90 - 54) / 360

**Soru:**
Bir fabrikada bir ayda üretilen toplam $3.600$ adet ürünün A, B, C ve D modellerine göre dağılımı aşağıdaki daire grafiğinde merkez açılarıyla gösterilmiştir.
Buna göre bu ayda üretilen B modeli ürün sayısı, C modeli ürün sayısından kaç fazladır?

**Şekil:**
```json
{
  "kind": "pie",
  "slices": [
    { "label": "A", "value": 108 },
    { "label": "B", "value": 90 },
    { "label": "C", "value": 54 },
    { "label": "D", "value": 108 }
  ],
  "show": "degree"
}
```

**Şıklar:**
A) 240
B) 280
C) 320
D) 360
E) 420

**Açıklama:**
Daire grafiğinde $360^\circ$'nin tamamı $3.600$ ürüne karşılık geldiğinden her $1^\circ$'lik dilim $\dfrac{3.600}{360} = 10$ ürünü temsil eder. B modelinin merkez açısı $90^\circ$, C modelinin merkez açısı $54^\circ$ olduğundan aradaki açı farkı $90 - 54 = 36^\circ$'dir. Bu durumda ürün sayısı farkı $36 \times 10 = 360$ adet olur.

**Çeldirici Tuzağı:**
C şıkkı ($320$), $1^\circ$'yi $10$ ürün olarak doğru hesapladıktan sonra $90 - 54$ çıkarma işlemini aceleyle $32^\circ$ almanın sonucudur; her bir modelin ayrı sayısını bulup ($900 - 540 = 360$) kontrol etmek hatayı önler.

### mat-11-025
- zorluk: 2
- dogru: E
- dogrulama: (120 - 80) / 80 * 100

**Soru:**
Bir kütüphanenin hafta içi beş günlük ziyaretçi sayıları aşağıdaki çizgi grafiğinde gösterilmiştir.
Ziyaretçi sayısının bir önceki güne göre **oransal olarak** en çok arttığı günde, bu artış yüzde kaçtır?

**Şekil:**
```json
{
  "kind": "line",
  "categories": ["Pzt", "Sal", "Çar", "Per", "Cum"],
  "series": [{ "name": "Kişi", "values": [80, 120, 100, 140, 175] }],
  "yLabel": "Kişi",
  "yStep": 40,
  "yMax": 200
}
```

**Şıklar:**
A) %25
B) %35
C) %40
D) %45
E) %50

**Açıklama:**
Artış yaşanan günler tek tek incelenir:
- Salı günü: $80 \to 120$ artışı $40$ kişi olup oran $\dfrac{40}{80} = \%50$'dir.
- Çarşamba günü azalış vardır.
- Perşembe günü: $100 \to 140$ artışı $40$ kişi olup oran $\dfrac{40}{100} = \%40$'tır.
- Cuma günü: $140 \to 175$ artışı $35$ kişi olup oran $\dfrac{35}{140} = \%25$'tir.
En yüksek oransal artış Salı günü gerçekleşmiştir ve $\%50$'dir.

**Çeldirici Tuzağı:**
C şıkkı ($\%40$), Perşembe günündeki $40$ kişilik sayısal artışı yüzdesiyle karıştıran veya paydaya başlangıç değerini ($80$) değil bir sonraki artışın başlangıcını ($100$) koyan adaylar için hazırlanmış en güçlü çeldiricidir.

### mat-11-026
- zorluk: 1
- dogru: A
- dogrulama: 300 - (3 * 45 + 2 * 60)

**Soru:**
Bir müzenin hafta içi ve hafta sonu uyguladığı bilet tarifesi aşağıdaki tabloda verilmiştir.
Hafta içi müzeye giden $3$ öğrenci ve $2$ tam biletli yetişkin gişeye toplam $300$ TL verirse kaç TL para üstü alır?

**Şekil:**
```json
{
  "kind": "table",
  "headers": ["Bilet Türü", "Hafta İçi (TL)", "Hafta Sonu (TL)"],
  "rows": [
    ["Tam", "60", "80"],
    ["Öğrenci", "45", "55"],
    ["65 Yaş Üstü", "30", "40"]
  ]
}
```

**Şıklar:**
A) 45
B) 55
C) 60
D) 65
E) 75

**Açıklama:**
Tablonun "Hafta İçi" sütunundan öğrenci bileti $45$ TL, tam bilet $60$ TL okunur. Toplam bilet tutarı $3 \times 45 + 2 \times 60 = 135 + 120 = 255$ TL'dir. Verilen $300$ TL'den $255$ TL çıkarılırsa $300 - 255 = 45$ TL para üstü alınır.

**Çeldirici Tuzağı:**
D şıkkı ($65$) ve E şıkkı ($75$), öğrenci ve yetişkin sayılarını çaprazlayarak $2 \times 45 + 3 \times 60 = 270$ hesaplayıp farklı çıkarma yapmaktan ya da hafta sonu sütunundan veri okumaktan kaynaklanan dikkatsizlik tuzaklarıdır.

### mat-11-027
- zorluk: 2
- dogru: C
- dogrulama: ((43 + 5) / 3 - 7 + 3) / 2

**Soru:**
Şekildeki akış şemasına pozitif bir $x$ tam sayısı girilmekte, elde edilen sayı tek veya çift olmasına göre ilgili koldan ilerleyip son kutuda $3$ ile çarpılıp $5$ çıkarılarak çıkışa ulaşmaktadır.
Çıkışta $43$ sayısı elde edildiğine göre girişe yazılan $x$ tam sayısı kaçtır?

**Şekil:**
```json
{
  "kind": "flow",
  "nodes": [
    { "id": "in", "text": "x", "at": [0, 1], "shape": "circle" },
    { "id": "a", "text": "2x − 3", "at": [1.8, 1] },
    { "id": "odd", "text": "+7", "at": [3.6, 0] },
    { "id": "even", "text": "÷2", "at": [3.6, 2] },
    { "id": "out", "text": "43", "at": [5.5, 1], "shape": "circle" }
  ],
  "edges": [
    { "from": "in", "to": "a" },
    { "from": "a", "to": "odd", "label": "tek" },
    { "from": "a", "to": "even", "label": "çift" },
    { "from": "odd", "to": "out", "label": "×3, −5" },
    { "from": "even", "to": "out", "label": "×3, −5" }
  ]
}
```

**Şıklar:**
A) 4
B) 5
C) 6
D) 8
E) 9

**Açıklama:**
Çıkıştan geriye doğru gidilir. Son adımda $3y - 5 = 43 \Rightarrow 3y = 48 \Rightarrow y = 16$ bulunur. Bir önceki adımda $16$ sayısının elde edilmesi için iki durum incelenir:
- Gelen sayı tek ise $t + 7 = 16 \Rightarrow t = 9$ (tektir, koşulu sağlar).
- Gelen sayı çift ise $\dfrac{c}{2} = 16 \Rightarrow c = 32$ (çifttir, koşulu sağlar).
Ancak ikinci kutudan çıkan sayı $2x - 3$ olup $x$ tam sayı iken $2x - 3$ her zaman tek sayıdır (çift olan $32$'ye eşit olamaz; $2x - 3 = 32 \Rightarrow x = 17{,}5$). Dolayısıyla $2x - 3 = 9 \Rightarrow 2x = 12 \Rightarrow x = 6$ bulunur.

**Çeldirici Tuzağı:**
D şıkkı ($8$) veya E şıkkı ($9$), üçüncü kolda elde edilen $t = 9$ ara değerini doğrudan $x$ sanıp $2x - 3 = 9$ adımını uygulamayan adayların düştüğü yanılgıdır.

### mat-11-028
- zorluk: 1
- dogru: D
- dogrulama: 8 + (12 - 1) * 3

**Soru:**
Bir konser salonunun $1.$ sırasında $8$ koltuk bulunmaktadır. İlk sıradan sonraki her sırada, bir önceki sıraya göre $3$ koltuk fazla yer almaktadır.
Buna göre bu salondaki baştan $12.$ sırada kaç koltuk vardır?

**Şıklar:**
A) 35
B) 38
C) 40
D) 41
E) 44

**Açıklama:**
Sıralardaki koltuk sayısı ortak farkı $3$ olan bir aritmetik dizi oluşturur. İlk terim $a_1 = 8$ olduğuna göre $12.$ sıradaki koltuk sayısı:
$$a_{12} = 8 + (12 - 1) \times 3 = 8 + 33 = 41$$
olarak bulunur.

**Çeldirici Tuzağı:**
E şıkkı ($44$), terim sayısı formülündeki $(n - 1)$ yerine doğrudan $n = 12$ koyarak $8 + 12 \times 3 = 44$ hesaplayanların düştüğü klasik $+1$ adım tuzağıdır.

### mat-11-029
- zorluk: 2
- dogru: E
- dogrulama: 2 * 6 + 4 * 5

**Soru:**
Bir sayı oyununda her satırdaki ilk üç sayıdan okun sağındaki sayı aynı kurala göre üretilmektedir:
- $3,\; 2,\; 4 \;\to\; 14$
- $5,\; 3,\; 2 \;\to\; 16$
- $4,\; 5,\; 3 \;\to\; 23$
- $6,\; 4,\; 5 \;\to\; ?$

Buna göre son satırdaki soru işareti (?) yerine hangi sayı gelmelidir?

**Şıklar:**
A) 26
B) 28
C) 29
D) 30
E) 32

**Açıklama:**
Her satırdaki sayılar soldan sağa $a, b, c$ olarak adlandırılırsa kural $2a + b \cdot c$ biçimindedir:
- $2(3) + 2 \cdot 4 = 6 + 8 = 14$
- $2(5) + 3 \cdot 2 = 10 + 6 = 16$
- $2(4) + 5 \cdot 3 = 8 + 15 = 23$
Aynı kural son satıra uygulanırsa $2(6) + 4 \cdot 5 = 12 + 20 = 32$ elde edilir.

**Çeldirici Tuzağı:**
C şıkkı ($29$), yalnızca diğer satırlarda sınamadan $a \cdot b + c$ kuralını ($6 \times 4 + 5 = 29$) uygulayan adayları yanıltır; bulunan kural mutlaka verilen üç satırın tamamında doğrulanmalıdır.

### mat-11-030
- zorluk: 3
- dogru: B
- dogrulama: (206 - 36 - 54 - (94 - 40)) - (184 - 52 - 48 - 40)

**Soru:**
Bir firmanın K, L, M ve N şubelerinin iki dönemlik satış adetleri ile dönemlik ve yıllık toplamları aşağıdaki tabloda verilmiştir.
Tablodaki verilere göre $c - a$ farkı kaçtır?

**Şekil:**
```json
{
  "kind": "table",
  "headers": ["Şube", "1. Dönem", "2. Dönem", "Yıllık Toplam"],
  "rows": [
    ["K", "a", "36", "b"],
    ["L", "52", "c", "d"],
    ["M", "48", "54", "102"],
    ["N", "40", "e", "94"],
    ["Toplam", "184", "206", "390"]
  ]
}
```

**Şıklar:**
A) 12
B) 18
C) 22
D) 24
E) 28

**Açıklama:**
1. Dönem sütununun toplamı $184$ olduğundan $a + 52 + 48 + 40 = 184 \Rightarrow a + 140 = 184 \Rightarrow a = 44$ bulunur.
N şubesinin yıllık toplamı $94$ olduğundan $40 + e = 94 \Rightarrow e = 54$ olur.
2. Dönem sütununun toplamı $206$ olduğundan $36 + c + 54 + 54 = 206 \Rightarrow c + 144 = 206 \Rightarrow c = 62$ elde edilir.
Sonuç olarak $c - a = 62 - 44 = 18$'dir.

**Çeldirici Tuzağı:**
C şıkkı ($22$) ve D şıkkı ($24$), 2. Dönem toplamında N şubesi için bulduğu $e = 54$ değerini sütun toplamına katarken hatalı hesaplama yapmaktan kaynaklanır.

### mat-11-031
- zorluk: 2
- dogru: A
- dogrulama: 60 / (45 + 30 + 60 + 45) * 360

**Soru:**
Bir okuldaki dört kulübe kayıtlı öğrenci sayıları aşağıdaki sütun grafiğinde gösterilmiştir.
Bu veriler bir daire grafiğiyle gösterilseydi Spor kulübüne ait daire diliminin merkez açısı kaç derece olurdu?

**Şekil:**
```json
{
  "kind": "bar",
  "categories": ["Müzik", "Tiyatro", "Spor", "Bilim"],
  "values": [45, 30, 60, 45],
  "yLabel": "Kişi",
  "yStep": 15,
  "yMax": 75,
  "valueLabels": true
}
```

**Şıklar:**
A) 120
B) 105
C) 90
D) 135
E) 150

**Açıklama:**
Toplam öğrenci sayısı $45 + 30 + 60 + 45 = 180$'dir. Daire grafiğinin tamamı $360^\circ$ olduğu için $180$ öğrenciye $360^\circ$ karşılık gelir (öğrenci başına $2^\circ$). Spor kulübünde $60$ öğrenci olduğundan merkez açısı $\dfrac{60}{180} \times 360 = 120^\circ$ bulunur.

**Çeldirici Tuzağı:**
C şıkkı ($90$), Spor kulübündeki $60$ sayısını hatalı şekilde toplam $240$ ile ilişkilendirip dörtte bir sanmaktan; B şıkkı ($105$) ise toplam öğrenciyi yanlış hesaplamaktan kaynaklanır.

### mat-11-032
- zorluk: 3
- dogru: D
- dogrulama: floor(40 / 2) + floor(40 / 3) + floor(40 / 5) - 2 * (floor(40 / 6) + floor(40 / 10) + floor(40 / 15)) + 4 * floor(40 / 30)

**Soru:**
$1$'den $40$'a kadar numaralandırılmış $40$ dolabın tamamının kapağı başlangıçta kapalıdır. Sırasıyla şu üç işlem uygulanır:
- $1.$ adımda numarası $2$'nin katı olan dolapların,
- $2.$ adımda numarası $3$'ün katı olan dolapların,
- $3.$ adımda numarası $5$'in katı olan dolapların
durumu değiştirilir (kapalıysa açılır, açıksa kapatılır).

Üçüncü adımın sonunda kapağı **açık** kalan toplam kaç dolap vardır?

**Şıklar:**
A) 17
B) 19
C) 20
D) 21
E) 30

**Açıklama:**
Başlangıçta kapalı olan bir dolabın sonunda açık kalabilmesi için durumunun **tek sayıda** ($1$ veya $3$ kez) değişmiş olması gerekir:
- Her üç sayıya da ($2, 3, 5 \Rightarrow 30$'un katı) bölünen dolap sayısı $\lfloor 40/30 \rfloor = 1$'dir (yalnızca $30$; $3$ kez değiştiğinden **açık**).
- Tam iki sayıya bölünenler ($2$ kez değiştiğinden **kapalı**):
  - Yalnız $2$ ve $3$'e ($6$'nın katı, $30$ hariç): $6 - 1 = 5$
  - Yalnız $2$ ve $5$'e ($10$'un katı, $30$ hariç): $4 - 1 = 3$
  - Yalnız $3$ ve $5$'e ($15$'in katı, $30$ hariç): $2 - 1 = 1$
- Yalnız bir sayıya bölünenler ($1$ kez değiştiğinden **açık**):
  - Yalnız $2$'nin katı: $20 - 5 - 3 - 1 = 11$
  - Yalnız $3$'ün katı: $13 - 5 - 1 - 1 = 6$
  - Yalnız $5$'in katı: $8 - 3 - 1 - 1 = 3$
Toplam açık dolap sayısı $11 + 6 + 3 + 1 = 21$'dir.

**Çeldirici Tuzağı:**
E şıkkı ($30$), $2$, $3$ veya $5$'e bölünen tüm dolapların birleşimini ($20 + 13 + 8 - 6 - 4 - 2 + 1 = 30$) bulup iki kez değişenlerin tekrar kapandığını unutanları; C şıkkı ($20$) ise $30$ numaralı dolabın $3$ kez değişip yeniden açıldığını gözden kaçıranları yakalar.

### mat-11-033
- zorluk: 1
- dogru: C
- dogrulama: 720 * (105 - 45) / 360

**Soru:**
Bir mağazada bir günde satılan toplam $720$ ürünün türlerine göre dağılımı aşağıdaki daire grafiğinde verilmiştir.
Buna göre satılan ayakkabı sayısı, satılan çanta sayısından kaç fazladır?

**Şekil:**
```json
{
  "kind": "pie",
  "slices": [
    { "label": "Gömlek", "value": 120 },
    { "label": "Pantolon", "value": 90 },
    { "label": "Ayakkabı", "value": 105 },
    { "label": "Çanta", "value": 45 }
  ],
  "show": "degree"
}
```

**Şıklar:**
A) 90
B) 105
C) 120
D) 135
E) 150

**Açıklama:**
$360^\circ$ toplam $720$ ürüne denk geldiğinden her $1^\circ$'lik açı $\dfrac{720}{360} = 2$ ürüne karşılık gelir. Ayakkabı ($105^\circ$) ile çanta ($45^\circ$) arasındaki açı farkı $105 - 45 = 60^\circ$'dir. Dolayısıyla ürün farkı $60 \times 2 = 120$ adet olur.

**Çeldirici Tuzağı:**
B şıkkı ($105$) ve E şıkkı ($150$), ayakkabı açısı olan $105^\circ$'yi doğrudan adet sanmaktan veya çarpan olan $2$ yerine farklı bir oran kullanmaktan kaynaklanır.

### mat-11-034
- zorluk: 2
- dogru: B
- dogrulama: (25 - (15 + 21 + 18 + 26) / 4) / ((15 + 21 + 18 + 26) / 4) * 100

**Soru:**
Bir işletmenin ilk beş ayda elde ettiği aylık kâr tutarları (milyon TL) aşağıdaki çizgi grafiğinde verilmiştir.
Buna göre Mayıs ayındaki kâr, **ilk dört ayın** ortalama kârından yüzde kaç fazladır?

**Şekil:**
```json
{
  "kind": "line",
  "categories": ["Oca", "Şub", "Mar", "Nis", "May"],
  "series": [{ "name": "mn TL", "values": [15, 21, 18, 26, 25] }],
  "yLabel": "mn TL",
  "yStep": 5,
  "yMax": 30
}
```

**Şıklar:**
A) %20
B) %25
C) %30
D) %35
E) %40

**Açıklama:**
İlk dört ayın (Ocak–Nisan) toplam kârı $15 + 21 + 18 + 26 = 80$ milyon TL, ortalaması ise $\dfrac{80}{4} = 20$ milyon TL'dir. Mayıs ayındaki kâr ($25$ milyon TL), bu ortalamadan $25 - 20 = 5$ milyon TL fazladır. Artış yüzdesi $\dfrac{5}{20} \times 100 = \%25$ olarak bulunur.

**Çeldirici Tuzağı:**
A şıkkı ($\%20$), farkı ($5$) ilk dört ayın ortalaması olan $20$'ye bölmek yerine Mayıs ayı değeri olan $25$'e bölerek $\dfrac{5}{25} = \%20$ hesaplayanların düştüğü temel yüzde referansı tuzağıdır.

### mat-11-035
- zorluk: 3
- dogru: E
- dogrulama: ((12 - 1)^2 + 1 + 12^2) / 2

**Soru:**
Pozitif tam sayılar $1$'den başlanarak her $k.$ satırda $2k - 1$ tane ardışık tam sayı olacak biçimde aşağıdaki düzende satırlara yazılıyor:
- $1.$ satır: $1$
- $2.$ satır: $2,\; 3,\; 4$
- $3.$ satır: $5,\; 6,\; 7,\; 8,\; 9$
- $4.$ satır: $10,\; 11,\; 12,\; 13,\; 14,\; 15,\; 16$

Buna göre $12.$ satırın tam ortasında yer alan sayı kaçtır?

**Şıklar:**
A) 121
B) 125
C) 129
D) 131
E) 133

**Açıklama:**
İlk $k$ satırdaki toplam terim sayısı $1 + 3 + 5 + \cdots + (2k - 1) = k^2$'dir. Bu nedenle her $k.$ satırın son sayısı $k^2$, bir sonraki satırın ilk sayısı ise $(k - 1)^2 + 1$ olur.
$12.$ satırda ilk sayı $11^2 + 1 = 122$, son sayı $12^2 = 144$'tür. Ardışık sayıların ortancası ilk ve son sayının ortalamasıdır:
$$\frac{122 + 144}{2} = \frac{266}{2} = 133$$

**Çeldirici Tuzağı:**
A şıkkı ($121$), $11.$ satırın son terimi olan $11^2$ değeridir; D şıkkı ($131$) ise $12.$ satırın başlangıcını $121$ alıp sonu hatalı sınırlamaktan ortaya çıkar.

### mat-11-036
- zorluk: 2
- dogru: D
- dogrulama: (3 * ((3 * ((3 * 4 - 1 + 5) / 2) - 1 + 5) / 2) - 1 + 5) / 2

**Soru:**
Şekildeki işlem makinesine girilen bir sayıya okların üzerindeki işlemler soldan sağa uygulanmaktadır. Elde edilen çıkış değeri tekrar girişe verilerek işlem zinciri art arda çalıştırılmaktadır.
Başlangıçta girişe $4$ sayısı yazıldığında **3. turun** sonunda çıkışta hangi sayı görülür?

**Şekil:**
```json
{
  "kind": "flow",
  "nodes": [
    { "id": "in", "text": "x", "at": [0, 0], "shape": "circle" },
    { "id": "a", "text": "3x − 1", "at": [1.6, 0] },
    { "id": "b", "text": "3x + 4", "at": [3.2, 0] },
    { "id": "out", "text": "Çıkış", "at": [4.8, 0], "shape": "circle" }
  ],
  "edges": [
    { "from": "in", "to": "a", "label": "×3, −1" },
    { "from": "a", "to": "b", "label": "+5" },
    { "from": "b", "to": "out", "label": "÷2" }
  ]
}
```

**Şıklar:**
A) 14
B) 17
C) 20
D) 23
E) 26

**Açıklama:**
Makinenin bir turda uyguladığı net kural $\dfrac{(3x - 1) + 5}{2} = \dfrac{3x + 4}{2}$'dir. Başlangıç değeri $x = 4$ için turlar izlenir:
- $1.$ tur: $\dfrac{3(4) + 4}{2} = \dfrac{16}{2} = 8$
- $2.$ tur: $\dfrac{3(8) + 4}{2} = \dfrac{28}{2} = 14$
- $3.$ tur: $\dfrac{3(14) + 4}{2} = \dfrac{46}{2} = 23$
Üçüncü turun sonunda çıkışta $23$ sayısı görülür.

**Çeldirici Tuzağı:**
A şıkkı ($14$), ikinci tur sonunda durup 3. turu uygulamayan adayların bulacağı ara değerdir; C şıkkı ($20$) ise her turda artışın sabit ($+6$) ilerlediğini sanarak $8 + 6 + 6 = 20$ yazanların düştüğü doğrusallık tuzağıdır.


### mat-11-037
- zorluk: 1
- dogru: A
- dogrulama: (60 - 40) / 40 * 100

**Soru:**
Bir öğrencinin dört gün boyunca okuduğu kitap sayfa sayıları aşağıdaki sütun grafiğinde gösterilmiştir.
En çok kitap okuduğu gündeki sayfa sayısı, en az kitap okuduğu gündeki sayfa sayısından yüzde kaç fazladır?

**Şekil:**
```json
{
  "kind": "bar",
  "categories": ["Pzt", "Sal", "Çar", "Per"],
  "values": [40, 55, 45, 60],
  "yLabel": "Sayfa",
  "yStep": 15,
  "yMax": 75,
  "valueLabels": true
}
```

**Şıklar:**
A) %50
B) %40
C) %33
D) %25
E) %20

**Açıklama:**
Grafikten en az okunan günün Pazartesi ($40$ sayfa), en çok okunan günün Perşembe ($60$ sayfa) olduğu görülür. Aradaki fark $60 - 40 = 20$ sayfadır. En az okunan güne göre fazlalık yüzdesi $\dfrac{20}{40} \cdot 100 = \%50$ bulunur.

**Çeldirici Tuzağı:**
C şıkkı ($\%33$), $20$ sayfalık farkı başlangıçtaki küçük değer ($40$) yerine büyük değer olan $60$'a bölerek $\dfrac{20}{60} \approx \%33$ hesaplayanların düştüğü referans hatasıdır.

### mat-11-038
- zorluk: 2
- dogru: B
- dogrulama: 1440 * (100 - 65) / 360

**Soru:**
Bir üniversitedeki toplam $1.440$ öğrencinin dört fakülteye göre dağılımı aşağıdaki daire grafiğinde verilmiştir.
Buna göre Mühendislik fakültesindeki öğrenci sayısı, Tıp fakültesindeki öğrenci sayısından kaç fazladır?

**Şekil:**
```json
{
  "kind": "pie",
  "slices": [
    { "label": "Mühendislik", "value": 100 },
    { "label": "Eğitim", "value": 85 },
    { "label": "Tıp", "value": 65 },
    { "label": "Hukuk", "value": 110 }
  ],
  "show": "degree"
}
```

**Şıklar:**
A) 120
B) 140
C) 160
D) 180
E) 200

**Açıklama:**
$360^\circ$ toplam $1.440$ öğrenciye denk geldiğinden her $1^\circ$'lik merkez açı $\dfrac{1.440}{360} = 4$ öğrenciyi temsil eder. Mühendislik ($100^\circ$) ile Tıp ($65^\circ$) arasındaki açı farkı $100 - 65 = 35^\circ$ olduğundan öğrenci farkı $35 \cdot 4 = 140$ kişi bulunur.

**Çeldirici Tuzağı:**
A şıkkı ($120$) veya C şıkkı ($160$), her $1^\circ$'ye düşen $4$ öğrenci çarpanını doğru bulduktan sonra $100 - 65$ çıkarma işleminde veya çarpmada dikkatsizlik yapanları yakalar.

### mat-11-039
- zorluk: 1
- dogru: C
- dogrulama: 200 - (3 * 15 + 2 * 60) * 0.8

**Soru:**
Bir kafede satılan dört ürünün birim satış fiyatları aşağıdaki tabloda verilmiştir.
Bu kafeden $3$ çay ve $2$ tost sipariş eden bir müşteriye toplam tutar üzerinden $\%20$ indirim uygulanmıştır. Kasaya $200$ TL veren müşteri kaç TL para üstü alır?

**Şekil:**
```json
{
  "kind": "table",
  "headers": ["Ürün", "Fiyat (TL)"],
  "rows": [
    ["Çay", "15"],
    ["Kahve", "45"],
    ["Tost", "60"],
    ["Meyve Suyu", "35"]
  ]
}
```

**Şıklar:**
A) 33
B) 35
C) 68
D) 72
E) 132

**Açıklama:**
İndirimsiz toplam tutar $3 \cdot 15 + 2 \cdot 60 = 45 + 120 = 165$ TL'dir. $\%20$ indirim sonrası ödenecek tutar $165 \cdot 0{,}80 = 132$ TL olur. Kasaya $200$ TL verildiğinde alınan para üstü $200 - 132 = 68$ TL bulunur.

**Çeldirici Tuzağı:**
E şıkkı ($132$) indirimli fatura tutarını para üstü yerine işaretleyen adayı; A şıkkı ($33$) ise yalnızca yapılan indirim tutarını ($165 \cdot 0{,}20 = 33$) seçen adayı yakalar.

### mat-11-040
- zorluk: 2
- dogru: D
- dogrulama: (50 + 70 + 60 + 90) - (30 + 45 + 40 + 50)

**Soru:**
Bir atölyenin ilk dört aydaki aylık gelir ve gider tutarları (bin TL cinsinden) aşağıdaki çift çizgi grafiğinde verilmiştir.
Buna göre bu dört ayda elde edilen **toplam net kâr** (Gelir $-$ Gider) kaç bin TL'dir?

**Şekil:**
```json
{
  "kind": "line",
  "categories": ["Oca", "Şub", "Mar", "Nis"],
  "series": [
    { "name": "Gelir", "values": [50, 70, 60, 90] },
    { "name": "Gider", "values": [30, 45, 40, 50] }
  ],
  "yLabel": "Bin TL",
  "yStep": 20,
  "yMax": 100
}
```

**Şıklar:**
A) 85
B) 95
C) 100
D) 105
E) 115

**Açıklama:**
Her ayın net kârı (Gelir $-$ Gider) ayrı ayrı toplanır veya toplam gelirden toplam gider çıkarılır:
- Toplam gelir: $50 + 70 + 60 + 90 = 270$ bin TL.
- Toplam gider: $30 + 45 + 40 + 50 = 165$ bin TL.
Net kâr $270 - 165 = 105$ bin TL olarak bulunur.

**Çeldirici Tuzağı:**
E şıkkı ($115$) veya C şıkkı ($100$), Şubat ayındaki gideri ($45$) çizgi ekseninden $40$ ya da $50$ okuyup toplam gideri yanlış hesaplayan adayı yakalar.

### mat-11-041
- zorluk: 1
- dogru: E
- dogrulama: 2 + 4 - 1

**Soru:**
$\{1, 2, 3, 4, 5\}$ kümesinin elemanlarının tamamı birer kez kullanılarak oluşturulan beş basamaklı $ABCDE$ doğal sayısında;
- $C = 3$
- $A + B = D + E$
- $B > A$
koşulları sağlanmaktadır.
Buna göre yazılabilecek **en büyük** $ABCDE$ sayısında $D$ rakamı kaçtır?

**Şıklar:**
A) 1
B) 2
C) 3
D) 4
E) 5

**Açıklama:**
$C = 3$ kullanıldığı için kalan dört rakam $\{1, 2, 4, 5\}$ olup toplamları $1 + 2 + 4 + 5 = 12$'dir. $A + B = D + E = 6$ olmalıdır. Bu kümede toplamı $6$ veren yalnızca iki çift vardır: $\{1, 5\}$ ve $\{2, 4\}$.
$ABCDE$ sayısının en büyük olması için $A$ en büyük seçilmelidir; ancak $B > A$ koşulu nedeniyle $5$ başa gelemez ($A = 1, B = 5$ olur). Bu yüzden $A = 2, B = 4$ seçilir ve diğer çift $\{1, 5\}$ son iki basamağa $D = 5, E = 1$ olarak yerleştirilir. En büyük sayı $24.351$ olup $D = 5$'tir.

**Çeldirici Tuzağı:**
D şıkkı ($4$), $B > A$ koşulunu unutup $A = 5, B = 1$ alarak en büyük sayıyı $51.342$ ($D = 4$) sanan adayı yakalar.

### mat-11-042
- zorluk: 2
- dogru: A
- dogrulama: sqrt(27 * 2 - 5)

**Soru:**
Şekildeki akış şemasına pozitif bir $x$ tam sayısı girilmekte, $x^2 + 5$ sonucu çift veya tek olmasına göre ilgili koldan ilerleyerek çıkışa ulaşmaktadır.
Çıkışta $27$ sayısı elde edildiğine göre girişe yazılan $x$ tam sayısı kaçtır?

**Şekil:**
```json
{
  "kind": "flow",
  "nodes": [
    { "id": "in", "text": "x", "at": [0, 1], "shape": "circle" },
    { "id": "a", "text": "x² + 5", "at": [1.8, 1] },
    { "id": "even", "text": "÷2", "at": [3.6, 0] },
    { "id": "odd", "text": "−3", "at": [3.6, 2] },
    { "id": "out", "text": "27", "at": [5.4, 1], "shape": "circle" }
  ],
  "edges": [
    { "from": "in", "to": "a" },
    { "from": "a", "to": "even", "label": "çift" },
    { "from": "a", "to": "odd", "label": "tek" },
    { "from": "even", "to": "out" },
    { "from": "odd", "to": "out" }
  ]
}
```

**Şıklar:**
A) 7
B) 5
C) 6
D) 8
E) 9

**Açıklama:**
İki kol ayrı ayrı test edilir:
- Alt kol (tek koşulu): $x^2 + 5 - 3 = 27 \Rightarrow x^2 = 25 \Rightarrow x = 5$ gelir; ancak $x = 5$ için ara değer $5^2 + 5 = 30$ çifttir, bu yüzden alt kola giremez.
- Üst kol (çift koşulu): $\dfrac{x^2 + 5}{2} = 27 \Rightarrow x^2 + 5 = 54 \Rightarrow x^2 = 49 \Rightarrow x = 7$ gelir. $7^2 + 5 = 54$ gerçekten çift olduğundan koşul sağlanır.
Doğru değer $x = 7$'dir.

**Çeldirici Tuzağı:**
B şıkkı ($5$), alt koldan çıkan $x = 5$ değerini bulduktan sonra $5^2 + 5 = 30$ ara sayısının tek mi çift mi olduğunu kontrol etmeden işaretleyen adayların düştüğü tuzaktır.

### mat-11-043
- zorluk: 2
- dogru: B
- dogrulama: (3 * 24 - 18 - 24) - (20 + 16 + 28) / 4

**Soru:**
Dört yarışmacının üç etaplı bir bilgi yarışmasında aldığı puanlar aşağıdaki tabloda verilmiştir.
Ali'nin üç etap ortalaması $24$ puan ve Can'ın $2$. etap puanı ($b$) Burak'ın toplam puanının $\dfrac{1}{4}$'üne eşit olduğuna göre $a - b$ farkı kaçtır?

**Şekil:**
```json
{
  "kind": "table",
  "headers": ["Yarışmacı", "1. Etap", "2. Etap", "3. Etap"],
  "rows": [
    ["Ali", "18", "24", "a"],
    ["Burak", "20", "16", "28"],
    ["Can", "22", "b", "20"],
    ["Deniz", "15", "25", "20"]
  ]
}
```

**Şıklar:**
A) 12
B) 14
C) 16
D) 18
E) 20

**Açıklama:**
Ali'nin üç etaptaki toplam puanı $3 \cdot 24 = 72$ olduğundan $18 + 24 + a = 72 \Rightarrow a = 30$ bulunur.
Burak'ın toplam puanı $20 + 16 + 28 = 64$'tür; buradan Can'ın $2$. etap puanı $b = \dfrac{64}{4} = 16$ elde edilir.
Sonuç olarak $a - b = 30 - 16 = 14$ bulunur.

**Çeldirici Tuzağı:**
C şıkkı ($16$), yalnızca $b$'yi bulup soru $a - b$ farkını istediği hâlde $16$'yı işaretleyen adayı yakalar.

### mat-11-044
- zorluk: 3
- dogru: C
- dogrulama: (7 - 297 / 99) * (297 / 99) * 7

**Soru:**
Rakamları sıfırdan farklı üç basamaklı bir $ABC$ doğal sayısı şu üç koşulu sağlamaktadır:
- $A + B = C$'dir.
- $CBA - ABC = 297$'dir.
- $ABC$ sayısının $5$ ile bölümünden kalan $2$'dir.

Buna göre $ABC$ sayısının rakamları çarpımı $A \cdot B \cdot C$ kaçtır?

**Şıklar:**
A) 42
B) 63
C) 84
D) 96
E) 105

**Açıklama:**
İkinci koşul açılırsa $CBA - ABC = 99(C - A) = 297 \Rightarrow C - A = 3$ bulunur. İlk koşuldan $A + B = C \Rightarrow B = C - A = 3$ elde edilir.
Üçüncü koşula göre $ABC$'nin $5$'e bölümünden kalan $2$ ise birler basamağı $C = 2$ veya $C = 7$ olmalıdır. Ancak $A \ge 1$ ve $C = A + 3$ olduğundan $C \ge 4$ olur; yani $C = 7$'dir. Buradan $A = 7 - 3 = 4$ ve sayı $437$ olarak bulunur. Rakamlar çarpımı $4 \cdot 3 \cdot 7 = 84$'tür.

**Çeldirici Tuzağı:**
B şıkkı ($63$), basamak farkından $C - A = 3$ yerine $C - A = 2$ veya yanlış basamak çözümüyle $A = 3, B = 3, C = 7$ ($3 \cdot 3 \cdot 7 = 63$) bulan adayı yakalar.

### mat-11-045
- zorluk: 2
- dogru: E
- dogrulama: (25 + 30) / (12 + 25 + 18 + 30 + 15) * 100

**Soru:**
Bir okuldaki beş şubeden yarışmaya katılan öğrenci sayıları aşağıdaki sütun grafiğinde gösterilmiştir.
Katılımcı sayısı tüm şubelerin **ortalamasının üzerinde** olan şubelerdeki öğrencilerin toplamı, tüm katılımcıların yüzde kaçıdır?

**Şekil:**
```json
{
  "kind": "bar",
  "categories": ["A", "B", "C", "D", "E"],
  "values": [12, 25, 18, 30, 15],
  "yLabel": "Öğrenci",
  "yStep": 5,
  "yMax": 35,
  "valueLabels": true
}
```

**Şıklar:**
A) %30
B) %40
C) %45
D) %50
E) %55

**Açıklama:**
Beş şubedeki toplam katılımcı sayısı $12 + 25 + 18 + 30 + 15 = 100$ öğrencidir. Şube ortalaması $\dfrac{100}{5} = 20$ öğrenci olur. Ortalamanın ($20$'nin) üzerinde olan şubeler $B$ ($25$) ve $D$ ($30$) olup toplamları $25 + 30 = 55$ öğrencidir. Tüm katılımcılar $100$ kişi olduğundan oran $\%55$ bulunur.

**Çeldirici Tuzağı:**
A şıkkı ($\%30$) en kalabalık tek şubeyi seçenleri; C şıkkı ($\%45$) ise ortalamanın altında kalan şubelerin toplam oranını ($\dfrac{12 + 18 + 15}{100} = \%45$) hesaplayan adayı yakalar.

### mat-11-046
- zorluk: 1
- dogru: B
- dogrulama: 24000 * (25 + 15) / 100

**Soru:**
Aylık toplam bütçesi $24.000$ TL olan bir ailenin gider dağılımı aşağıdaki daire grafiğinde yüzde cinsinden verilmiştir.
Buna göre bu ailenin **Gıda ve Ulaşım** harcamalarının toplamı kaç TL'dir?

**Şekil:**
```json
{
  "kind": "pie",
  "slices": [
    { "label": "Kira", "value": 40 },
    { "label": "Gıda", "value": 25 },
    { "label": "Ulaşım", "value": 15 },
    { "label": "Diğer", "value": 20 }
  ],
  "show": "percent"
}
```

**Şıklar:**
A) 8.400
B) 9.600
C) 10.200
D) 10.800
E) 12.000

**Açıklama:**
Gıda ($\%25$) ve Ulaşım ($\%15$) harcamalarının toplam payı $\%25 + \%15 = \%40$'tır. $24.000$ TL bütçenin $\%40$'ı $24.000 \cdot \dfrac{40}{100} = 9.600$ TL olarak bulunur.

**Çeldirici Tuzağı:**
E şıkkı ($12.000$), bütçenin yarısını tahmin edenleri; A şıkkı ($8.400$) ise yanlışlıkla diğer ($\%20$) ve ulaşım ($\%15$) toplamını ($\%35$) hesaplayan adayı yakalar.

### mat-11-047
- zorluk: 2
- dogru: D
- dogrulama: (56 - 32) / 32 * 100

**Soru:**
Bir ürünün beş yıllık satış fiyatı değişimi aşağıdaki çizgi grafiğinde gösterilmiştir.
Buna göre $2020$ yılından $2024$ yılına kadar geçen sürede bu ürünün fiyatı toplam yüzde kaç artmıştır?

**Şekil:**
```json
{
  "kind": "line",
  "categories": ["2020", "2021", "2022", "2023", "2024"],
  "series": [{ "name": "TL", "values": [32, 40, 36, 48, 56] }],
  "yLabel": "TL",
  "yStep": 10,
  "yMax": 60
}
```

**Şıklar:**
A) %50
B) %60
C) %70
D) %75
E) %80

**Açıklama:**
$2020$ yılı fiyatı $32$ TL, $2024$ yılı fiyatı $56$ TL'dir. Toplam fiyat artışı $56 - 32 = 24$ TL olduğundan $2020$ yılına göre artış yüzdesi:
$$\frac{24}{32} \cdot 100 = \frac{3}{4} \cdot 100 = \%75$$
olarak bulunur.

**Çeldirici Tuzağı:**
A şıkkı ($\%50$) veya B şıkkı ($\%60$), aradaki artışları yıllara bölüp yanlışlıkla bir ara yıla ($40$ TL) oranlayan ($24/40 = \%60$) adayı yakalar.

### mat-11-048
- zorluk: 1
- dogru: A
- dogrulama: 3 + 6 + 1

**Soru:**
$3$ haneli bir dijital kilidin her hanesi $\{1, 2, 3, 4\}$ kümesindeki rakamlardan biriyle oluşturulacaktır.
Rakamları toplamı $6$ olan kaç farklı $3$ haneli şifre yazılabilir?

**Şıklar:**
A) 10
B) 11
C) 12
D) 14
E) 16

**Açıklama:**
Toplamı $6$ veren rakam üçlüleri ve kendi aralarındaki sıralanış sayıları yazılır:
- $(1, 1, 4)$ üçlüsü: $\dfrac{3!}{2!} = 3$ farklı şifre (`114`, `141`, `411`).
- $(1, 2, 3)$ üçlüsü: $3! = 6$ farklı şifre.
- $(2, 2, 2)$ üçlüsü: $1$ farklı şifre (`222`).
Toplam $3 + 6 + 1 = 10$ farklı şifre yazılabilir.

**Çeldirici Tuzağı:**
C şıkkı ($12$), $(2, 2, 2)$ durumunu ya da $(1, 1, 4)$ permütasyon sayısını yanlış sayıp iki kez sayan; B şıkkı ($11$) ise $(2, 2, 2)$ dizilimini $2$ sayan adayı yakalar.

### mat-11-049
- zorluk: 2
- dogru: C
- dogrulama: (sqrt(77 + 4) - 3) / 2

**Soru:**
Şekildeki işlem makinesine pozitif bir $x$ sayısı girilmekte ve okların üzerindeki işlemler sırasıyla uygulanarak çıkışta $77$ sayısı elde edilmektedir.
Buna göre girişe yazılan $x$ sayısı kaçtır?

**Şekil:**
```json
{
  "kind": "flow",
  "nodes": [
    { "id": "in", "text": "x", "at": [0, 0], "shape": "circle" },
    { "id": "a", "text": "2x + 3", "at": [1.8, 0] },
    { "id": "out", "text": "77", "at": [3.8, 0], "shape": "circle" }
  ],
  "edges": [
    { "from": "in", "to": "a", "label": "×2, +3" },
    { "from": "a", "to": "out", "label": "karesi − 4" }
  ]
}
```

**Şıklar:**
A) 1
B) 2
C) 3
D) 4
E) 5

**Açıklama:**
Son adımdan geriye gidilir: $(2x + 3)^2 - 4 = 77 \Rightarrow (2x + 3)^2 = 81$. $x > 0$ olduğu için $2x + 3 > 0$ olduğundan $2x + 3 = 9 \Rightarrow 2x = 6 \Rightarrow x = 3$ bulunur.

**Çeldirici Tuzağı:**
D şıkkı ($4$) veya E şıkkı ($5$), $2x + 3 = 9$ adımında $3$'ü çıkarmak yerine $9 \div 2$ gibi yaklaşık tahmine ya da işlem önceliği hatasına düşen adayı yakalar.

### mat-11-050
- zorluk: 3
- dogru: E
- dogrulama: 3 + 4 * 3 + 1

**Soru:**
İçinde $9$ kırmızı, $7$ mavi, $6$ yeşil ve $3$ sarı özdeş topun bulunduğu karanlık bir kutudan renklerine bakılmadan art arda toplar çekiliyor.
Çekilen toplar arasında **aynı renkten en az $5$ adet** bulunmasını kesin olarak garantilemek için kutudan en az kaç top çekilmelidir?

**Şıklar:**
A) 8
B) 12
C) 13
D) 15
E) 16

**Açıklama:**
Güvercin yuvası (en kötü durum) ilkesi uygulanır. $5$ topa ulaşamayacak renk olan sarıların tamamı ($3$ adet) en kötü senaryoda çekilebilir; kırmızı, mavi ve yeşil renklerden ise her birinden $4$'er adet ($4 \cdot 3 = 12$ adet) çekildiğinde hâlâ aynı renkten $5$ top sağlanmamış olur. Bu en kötü durumda toplam $3 + 12 = 15$ top çekilmiştir. Çekilecek $16.$ top kesinlikle kırmızı, mavi veya yeşilden biri olacağı için aynı renkten $5$ topu garantiler.

**Çeldirici Tuzağı:**
D şıkkı ($15$), en kötü senaryo sınırında kalıp garantilemek için $+1$ top eklemeyi unutan adayı; C şıkkı ($13$) ise $3$ sarı topun tamamının ($4$ sınırından küçük olsa bile) çekilebileceğini gözden kaçırıp $4 \cdot 3 + 1 = 13$ hesaplayan adayı yakalar.


### mat-11-051
- zorluk: 1
- dogru: A
- dogrulama: (120 + 180 + 150 + 150) / 15

**Soru:**
Bir öğrencinin okuduğu dört farklı kitabın sayfa sayıları aşağıdaki sütun grafiğinde gösterilmiştir.
Bu öğrenci dört kitabın tamamını toplam $15$ günde okuyup bitirdiğine göre günde ortalama kaç sayfa kitap okumuştur?

**Şekil:**
```json
{
  "kind": "bar",
  "categories": ["K1", "K2", "K3", "K4"],
  "values": [120, 180, 150, 150],
  "yLabel": "Sayfa",
  "yStep": 30,
  "yMax": 210,
  "valueLabels": true
}
```

**Şıklar:**
A) 40
B) 30
C) 35
D) 45
E) 50

**Açıklama:**
Dört kitabın toplam sayfa sayısı $120 + 180 + 150 + 150 = 600$ sayfadır. Toplam $15$ günde okunduğuna göre günlük ortalama $\dfrac{600}{15} = 40$ sayfa bulunur.

**Çeldirici Tuzağı:**
C şıkkı ($35$) veya D şıkkı ($45$), toplam sayfa sayısını $600$ yerine yanlış toplayarak $525$ ya da $675$ hesaplayan; veya yalnızca tek bir kitabın ortalamasına bakan adayı yakalar.

### mat-11-052
- zorluk: 1
- dogru: B
- dogrulama: (40 + 65 + 95) - 130

**Soru:**
Bir kargo firmasının ağırlığa göre uyguladığı paket gönderim ücretleri aşağıdaki tabloda verilmiştir.
Ağırlıkları $1{,}5$ kg, $3$ kg ve $7$ kg olan üç paketi **ayrı ayrı** göndermek yerine hepsini **tek bir koliye** koyarak gönderen bir müşteri kaç TL tasarruf etmiş olur?

**Şekil:**
```json
{
  "kind": "table",
  "headers": ["Ağırlık Aralığı", "Ücret (TL)"],
  "rows": [
    ["0 - 2 kg", "40"],
    ["2 - 5 kg", "65"],
    ["5 - 10 kg", "95"],
    ["10 - 15 kg", "130"]
  ]
}
```

**Şıklar:**
A) 60
B) 70
C) 80
D) 90
E) 105

**Açıklama:**
Üç paket ayrı ayrı gönderilirse: $1{,}5$ kg ($0-2$ kg dilimi) için $40$ TL, $3$ kg ($2-5$ kg dilimi) için $65$ TL, $7$ kg ($5-10$ kg dilimi) için $95$ TL ödenir; toplam $40 + 65 + 95 = 200$ TL tutar.
Tek kolide toplam ağırlık $1{,}5 + 3 + 7 = 11{,}5$ kg olur ($10-15$ kg dilimi) ve ücret $130$ TL'dir. Tasarruf tutarı $200 - 130 = 70$ TL bulunur.

**Çeldirici Tuzağı:**
A şıkkı ($60$) veya E şıkkı ($105$), tek koli ağırlığını yanlış toplayıp $5-10$ kg diliminden ($95$ TL) hesaplayan adayı ($200 - 95 = 105$) yakalar.

### mat-11-053
- zorluk: 2
- dogru: C
- dogrulama: (180 / 60) * (108 - 72)

**Soru:**
Bir depodaki A, B, C ve D ürünlerinin adet dağılımı aşağıdaki daire grafiğinde merkez açılarıyla gösterilmiştir.
Depoda D ürününden $180$ adet bulunduğuna göre **C ürünü B ürününden** kaç adet fazladır?

**Şekil:**
```json
{
  "kind": "pie",
  "slices": [
    { "label": "A", "value": 120 },
    { "label": "B", "value": 72 },
    { "label": "C", "value": 108 },
    { "label": "D", "value": 60 }
  ],
  "show": "degree"
}
```

**Şıklar:**
A) 72
B) 90
C) 108
D) 120
E) 144

**Açıklama:**
$60^\circ$'lik D dilimi $180$ ürüne denk geldiğinden her $1^\circ$'lik açı $\dfrac{180}{60} = 3$ ürünü temsil eder. C ($108^\circ$) ile B ($72^\circ$) arasındaki açı farkı $108 - 72 = 36^\circ$'dir. Ürün sayısı farkı $36 \cdot 3 = 108$ adet bulunur.

**Çeldirici Tuzağı:**
A şıkkı ($72$) ve E şıkkı ($144$), açı farkı yerine doğrudan C ve B derecelerini ikiye katlayan veya $1^\circ$'ye düşen ürün sayısını yanlış bölen adayı yakalar.

### mat-11-054
- zorluk: 2
- dogru: D
- dogrulama: (60 + 80 + 75 + 95) - (45 + 70 + 60 + 90)

**Soru:**
Bir fabrikanın dört yılda ürettiği ve sattığı bisiklet adetleri aşağıdaki çift çizgi grafiğinde verilmiştir.
Bu dört yılın sonunda üretilip de **satılamayan** toplam kaç bisiklet kalmıştır?

**Şekil:**
```json
{
  "kind": "line",
  "categories": ["2021", "2022", "2023", "2024"],
  "series": [
    { "name": "Üretim", "values": [60, 80, 75, 95] },
    { "name": "Satış", "values": [45, 70, 60, 90] }
  ],
  "yLabel": "Adet",
  "yStep": 20,
  "yMax": 100
}
```

**Şıklar:**
A) 30
B) 35
C) 40
D) 45
E) 55

**Açıklama:**
Yıllara göre satılamayan stok miktarı ($\text{Üretim} - \text{Satış}$) hesaplanıp toplanır:
- $2021$: $60 - 45 = 15$
- $2022$: $80 - 70 = 10$
- $2023$: $75 - 60 = 15$
- $2024$: $95 - 90 = 5$
Toplam kalan stok $15 + 10 + 15 + 5 = 45$ bisiklettir.

**Çeldirici Tuzağı:**
C şıkkı ($40$), $2023$ yılındaki $75$ üretim değerini eksenden $70$ gibi okuyup $15 + 10 + 10 + 5 = 40$ bulan adayı yakalar.

### mat-11-055
- zorluk: 2
- dogru: E
- dogrulama: ((3 + 4) * 2 + 5) + ((6 + 4) * 3)

**Soru:**
Şekildeki akış şemasına girilen tam sayıya ilk kutuda $4$ eklenmekte; çıkan sayı çift ise üst koldan, tek ise alt koldan ilerleyerek çıkışa ulaşılmaktadır.
Girişe önce $x = 3$, ardından $x = 6$ yazıldığında elde edilen iki çıkış değerinin **toplamı** kaç olur?

**Şekil:**
```json
{
  "kind": "flow",
  "nodes": [
    { "id": "in", "text": "x", "at": [0, 1], "shape": "circle" },
    { "id": "a", "text": "x + 4", "at": [1.6, 1] },
    { "id": "even", "text": "× 3", "at": [3.3, 0] },
    { "id": "odd", "text": "× 2 + 5", "at": [3.3, 2] },
    { "id": "out", "text": "Çıkış", "at": [5.0, 1], "shape": "circle" }
  ],
  "edges": [
    { "from": "in", "to": "a" },
    { "from": "a", "to": "even", "label": "çift" },
    { "from": "a", "to": "odd", "label": "tek" },
    { "from": "even", "to": "out" },
    { "from": "odd", "to": "out" }
  ]
}
```

**Şıklar:**
A) 35
B) 39
C) 42
D) 45
E) 49

**Açıklama:**
İki giriş değeri için dallar ayrı ayrı izlenir:
- $x = 3$ için: $3 + 4 = 7$ (tek sayı $\to$ alt kol): $7 \cdot 2 + 5 = 19$.
- $x = 6$ için: $6 + 4 = 10$ (çift sayı $\to$ üst kol): $10 \cdot 3 = 30$.
İki çıkış değerinin toplamı $19 + 30 = 49$ bulunur.

**Çeldirici Tuzağı:**
C şıkkı ($42$) veya B şıkkı ($39$), kol seçiminde $x + 4$ yerine ilk girilen $x$'in tekliğine/çiftliğine bakarak kolları ters uygulayan ($3 \to$ tek değil $6 \to$ çift sanarak yanlış çaprazlama) adayı yakalar.

### mat-11-056
- zorluk: 1
- dogru: B
- dogrulama: 26 - (9 + 8 + 7)

**Soru:**
Toplam $26$ öğrencinin bulunduğu bir kursta öğrenciler $4$ farklı sınıfa dağıtılmıştır. Her sınıfta **farklı sayıda** öğrenci bulunmakta ve en kalabalık sınıfta $9$ öğrenci yer almaktadır.
Buna göre bu $4$ sınıftan öğrenci sayısı en az olanında **en az** kaç öğrenci vardır?

**Şıklar:**
A) 1
B) 2
C) 3
D) 4
E) 5

**Açıklama:**
En az öğrencisi bulunan sınıfı en küçük tutmak için diğer iki sınıf mümkün olan en büyük farklı değerleri almalıdır. En kalabalık sınıfta $9$ öğrenci bulunduğundan diğer iki sınıf en fazla $8$ ve $7$ öğrenci alabilir. Bu durumda en küçük sınıfta $26 - (9 + 8 + 7) = 26 - 24 = 2$ öğrenci bulunur.

**Çeldirici Tuzağı:**
A şıkkı ($1$), "her sınıfta farklı sayıda öğrenci" şartını gözden kaçırıp iki sınıfa da $9$ öğrenci ($9 + 9 + 7 + 1$) veren adayı yakalar.

### mat-11-057
- zorluk: 2
- dogru: B
- dogrulama: 70 / (40 + 60 + 50 + 70 + 80) * 360

**Soru:**
Bir mağazanın hafta içi beş gün boyunca sattığı gömlek sayıları aşağıdaki sütun grafiğinde verilmiştir.
Bu veriler bir daire grafiğiyle gösterilseydi **Perşembe** gününe ait daire diliminin merkez açısı kaç derece olurdu?

**Şekil:**
```json
{
  "kind": "bar",
  "categories": ["Pzt", "Sal", "Çar", "Per", "Cum"],
  "values": [40, 60, 50, 70, 80],
  "yLabel": "Adet",
  "yStep": 20,
  "yMax": 100,
  "valueLabels": true
}
```

**Şıklar:**
A) 72
B) 84
C) 90
D) 96
E) 108

**Açıklama:**
Beş günlük toplam gömlek satışı $40 + 60 + 50 + 70 + 80 = 300$ adettir. Daire grafiğinin tamamı $360^\circ$ olduğundan Perşembe ($70$ adet) diliminin merkez açısı:
$$\frac{70}{300} \cdot 360^\circ = \frac{7 \cdot 360^\circ}{30} = 7 \cdot 12^\circ = 84^\circ$$
olarak bulunur.

**Çeldirici Tuzağı:**
A şıkkı ($72$) veya D şıkkı ($96$), sırasıyla Salı ($60$) ya da Cuma ($80$) günlerinin açılarını hesaplayıp Perşembe yerine işaretleyen adayı yakalar.

### mat-11-058
- zorluk: 2
- dogru: C
- dogrulama: (25 - 20) * 10 + (39 - 30) * 20 + (48 - 40) * 15 + (55 - 50) * 12

**Soru:**
Bir mağazada satılan dört ürünün birim alış fiyatı, birim satış fiyatı ve satılan adet sayıları aşağıdaki tabloda verilmiştir.
Buna göre bu dört ürünün satışından elde edilen **toplam kâr** kaç TL'dir?

**Şekil:**
```json
{
  "kind": "table",
  "headers": ["Ürün", "Alış (TL)", "Satış (TL)", "Adet"],
  "rows": [
    ["K", "20", "25", "10"],
    ["L", "30", "39", "20"],
    ["M", "40", "48", "15"],
    ["N", "50", "55", "12"]
  ]
}
```

**Şıklar:**
A) 350
B) 380
C) 410
D) 430
E) 460

**Açıklama:**
Her ürünün birim kârı ($\text{Satış} - \text{Alış}$) satılan adetle çarpılıp toplanır:
- $K$: $(25 - 20) \cdot 10 = 50$ TL
- $L$: $(39 - 30) \cdot 20 = 180$ TL
- $M$: $(48 - 40) \cdot 15 = 120$ TL
- $N$: $(55 - 50) \cdot 12 = 60$ TL
Toplam kâr $50 + 180 + 120 + 60 = 410$ TL bulunur.

**Çeldirici Tuzağı:**
B şıkkı ($380$) veya D şıkkı ($430$), özellikle $L$ ve $M$ ürünlerinde birim kârı adetle çarparken hata yapmaktan ya da toplam satış tutarından eksik çıkarma yapmaktan kaynaklanır.

### mat-11-059
- zorluk: 3
- dogru: D
- dogrulama: 16 + 10 + 10

**Soru:**
$1$'den $160$'a kadar numaralandırılmış (sınırlar dahil) bir kitabın tüm sayfaları numaralandırılırken **`5` rakamı** toplam kaç kez kullanılır?

**Şıklar:**
A) 32
B) 34
C) 35
D) 36
E) 38

**Açıklama:**
$5$ rakamının basamaklara göre kaç kez yazıldığı ayrı ayrı sayılır ($1$–$160$ arasında yüzler basamağında $5$ yoktur):
- **Birler basamağında $5$:** $5, 15, 25, \ldots, 155$ olmak üzere toplam $\dfrac{155 - 5}{10} + 1 = 16$ kez.
- **Onlar basamağında $5$:** $50$–$59$ arasında $10$ kez ve $150$–$159$ arasında $10$ kez olmak üzere toplam $20$ kez.
Toplam $16 + 20 = 36$ kez $5$ rakamı kullanılır ($55$ ve $155$ sayılarında $5$ rakamı ikişer kez kullanıldığı için iki basamakta da ayrı sayılır).

**Çeldirici Tuzağı:**
B şıkkı ($34$), $55$ ve $155$ sayılarında iki tane $5$ rakamı olduğunu fark etmeyip "kaç sayıda $5$ vardır?" mantığıyla $2$ eksik sayan adayların düştüğü klasik basamak sayma tuzağıdır.

### mat-11-060
- zorluk: 3
- dogru: E
- dogrulama: (5 + 3) * 5 + (5 - 3)

**Soru:**
Aşağıdaki $3 \times 3$'lük tablonun her satırındaki, her sütunundaki ve her iki köşegenindeki üç sayının toplamı birbirine eşittir (sihirli kare).
Buna göre $a \cdot x + b$ değeri kaçtır?

**Şekil:**
```json
{
  "kind": "table",
  "headers": ["Sütun 1", "Sütun 2", "Sütun 3"],
  "rows": [
    ["a", "1", "6"],
    ["3", "x", "7"],
    ["4", "9", "b"]
  ]
}
```

**Şıklar:**
A) 32
B) 36
C) 38
D) 40
E) 42

**Açıklama:**
Sabit toplam $S$ olsun. $2.$ sütun toplamı $1 + x + 9 = 10 + x$ ve sol üstten sağ alta ana köşegen $a + x + b = S$'dir.
$1.$ satırdan $a + 1 + 6 = 10 + x \Rightarrow a = x + 3$ ve $3.$ satırdan $4 + 9 + b = 10 + x \Rightarrow b = x - 3$ bulunur.
Bu değerler ana köşegende yerine yazılırsa:
$$(x + 3) + x + (x - 3) = 10 + x \Rightarrow 3x = 10 + x \Rightarrow 2x = 10 \Rightarrow x = 5$$
Buradan $a = 5 + 3 = 8$ ve $b = 5 - 3 = 2$ elde edilir (sihirli toplam $15$). Sonuç olarak $a \cdot x + b = 8 \cdot 5 + 2 = 42$'dir.

**Çeldirici Tuzağı:**
D şıkkı ($40$), $x = 5$ ve $a = 8$ bulunduktan sonra $b = 2$ yerine $a \cdot x = 40$'ı işaretleyen veya $b$'yi toplarken $3 - 5 = -2$ gibi işaret hatası yapan adayı yakalar.