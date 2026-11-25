---
lesson: Matematik & Geometri
topic: Analitik Geometri ve Katı Cisimler
exam_scopes: [b_grubu_gygk]
sources:
  - "ÖSYM 2026 KPSS Lisans Kılavuzu (konu kapsamı)"
  - "MEB Ortaöğretim Matematik Ders Kitapları (yalnızca kavram ve formül doğrulama)"
---

## Bölüm 1: Nokta Analitiği, Uzaklık, Orta Nokta ve Ağırlık Merkezi

Dik koordinat düzleminde bir $P(x, y)$ noktasının birinci bileşeni ($x$) **apsis**, ikinci bileşeni ($y$) **ordinat** adını alır. Bir noktanın **$x$-eksenine olan uzaklığı $\lvert y \rvert$**, **$y$-eksenine olan uzaklığı $\lvert x \rvert$** birimdir (eksene uzaklıklar daima ters koordinatın mutlak değeridir!). İşaretlere göre dört bölge oluşur: I. Bölge $(+, +)$, II. Bölge $(-, +)$, III. Bölge $(-, -)$, IV. Bölge $(+, -)$; eksenler üzerindeki noktalar hiçbir bölgeye dahil edilmez.

### İki Nokta Arası Uzaklık, Orta Nokta ve Paralelkenar Kuralı

$A(x_1, y_1)$ ve $B(x_2, y_2)$ noktaları arasında en çok kullanılan dört temel bağıntı şunlardır:

- **İki Nokta Arası Uzaklık:** Koordinat farklarının kareleri toplamının kareköküdür (Pisagor):

$$\lvert AB \rvert = \sqrt{(x_2 - x_1)^2 + (y_2 - y_1)^2}$$

- **Orta Nokta:** Koordinatların aritmetik ortalamasıdır: $M\left(\frac{x_1 + x_2}{2}, \frac{y_1 + y_2}{2}\right)$.
- **Paralelkenar (Kare / Dikdörtgen) Karşılıklı Köşeler Kuralı:** Köşeleri sırayla $A, B, C, D$ olan paralelkenarda köşegenler birbirini ortaladığı için **karşılıklı köşelerin** apsisler toplamı ile ordinatlar toplamı birbirine eşittir:

$$x_A + x_C = x_B + x_D \qquad \text{ve} \qquad y_A + y_C = y_B + y_D$$

- **Üçgenin Ağırlık Merkezi:** Köşeleri $A, B, C$ olan üçgenin ağırlık merkezi $G$, üç köşenin koordinatlarının üçe bölünmesiyle bulunur: $G\left(\frac{x_A + x_B + x_C}{3}, \frac{y_A + y_B + y_C}{3}\right)$. Doğru parçasını içten belirli oranda bölen nokta sorularında ise $x$ ve $y$ koordinatlarının artış miktarları toplam parçaya orantılı olarak paylaşılır.
- **Analitik Düzlemde Simetri (Yansıma):** Bir $P(a, b)$ noktasının $x$-eksenine göre simetriği $P'(a, -b)$, $y$-eksenine göre simetriği $P'(-a, b)$, orijine göre simetriği $P'(-a, -b)$ ve $y = x$ birinci açıortay doğrusuna göre simetriği $P'(b, a)$'dır. Simetri alırken yalnızca değişen eksenlerin işaretini veya sırasını değiştirmen yeterlidir.

:::tablo
| İstenen Kavram | Formül | Dikkat Edilecek Nokta |
|---|---|---|
| $P(x, y)$'nin $x$ / $y$ eksenine uzaklığı | $\lvert y \rvert$ / $\lvert x \rvert$ | Uzaklık her zaman pozitiftir ve ters eksen alınır |
| İki nokta arası uzaklık | $\sqrt{(\Delta x)^2 + (\Delta y)^2}$ | Eksili koordinatlarda çıkarma işaretine dikkat et |
| Orta nokta | $\left(\frac{x_1+x_2}{2}, \frac{y_1+y_2}{2}\right)$ | İşaretleriyle birlikte toplayıp $2$'ye böl |
| Paralelkenar $ABCD$ | $A + C = B + D$ | Köşelerin sırasını ($A, B, C, D$) mutlaka kontrol et |
:::

:::ornek
Köşe koordinatları sırasıyla $A(1, 2)$, $B(5, 4)$, $C(7, 8)$ ve $D(x, y)$ olan $ABCD$ paralelkenarı için $x + y$ toplamını bulalım. Karşılıklı köşeler $A$ ile $C$ ve $B$ ile $D$'dir. Kural gereği $x_A + x_C = x_B + x_D \Rightarrow 1 + 7 = 5 + x \Rightarrow x = 3$ bulunur. Ordinatlar için $y_A + y_C = y_B + y_D \Rightarrow 2 + 8 = 4 + y \Rightarrow y = 6$ olur. Sonuç olarak $D(3, 6)$ ve $x + y = 9$ elde edilir. İki nokta uzaklığı örneğinde ise $K(-2, 5)$ ve $L(4, -3)$ arası uzaklık $\sqrt{(4 - (-2))^2 + (-3 - 5)^2} = \sqrt{6^2 + (-8)^2} = \sqrt{36 + 64} = 10$ birim çıkar.
:::

:::tuzak
İki tuzak adayın en kolay soruyu kaçırmasına yol açar: Birincisi, paralelkenar kuralında karşılıklı köşeleri ($A + C = B + D$) eşitlemek yerine komşu köşeleri ($A + B = C + D$) toplamaktır. İkincisi, koordinat farkı alırken $(-3 - 5)$ veya $(4 - (-2))$ işlemlerinde eksi işaretini unutup $2$ ya da $4$ gibi yanlış farklar bulmaktır; bu nedenle eksili sayıları mutlaka parantezle çıkar ve bölgelerin işaretlerini ($II: (-,+)$, $IV: (+,-)$) kontrol et.
:::

:::akilda-kalsin
- $P(x, y)$ noktasının $x$-eksenine uzaklığı $\lvert y \rvert$, $y$-eksenine uzaklığı $\lvert x \rvert$'tir.
- Uzaklık formülü Pisagor'dur; $3-4-5$ veya $6-8-10$ üçgenleri yakalandığında doğrudan yazılır.
- Sıralı $ABCD$ paralelkenarında daima $A + C = B + D$ sağlanır.
- Ağırlık merkezi üç köşenin, orta nokta ise iki ucun aritmetik ortalamasıdır.
:::

:::kontrol
0590b24b-1eee-5e76-a924-2bc486c8e6e3
149fd090-438c-52e7-8cbf-4f02cf677f19
:::

## Bölüm 2: Doğrunun Analitiği, Eğim ve Kesişim Noktaları

Bir doğrunun $x$-ekseniyle pozitif yönde yaptığı açının tanjantına **eğim ($m$)** denir. İki noktası bilinen doğrunun eğimi, ordinatlar farkının apsisler farkına bölümüdür:

$$m = \frac{y_2 - y_1}{x_2 - x_1}$$

Eğim sağa yatık doğrularda pozitif ($m > 0$), sola yatık doğrularda negatiftir ($m < 0$). $x$-eksenine paralel doğruların ($y = c$) eğimi **$0$**, $y$-eksenine paralel doğruların ($x = c$) eğimi ise **tanımsızdır**. Denklemi verilen bir doğrudan eğimi iki şekilde doğrudan okuyabilirsin:

- **$y = mx + n$ biçiminde:** $x$'in katsayısı $m$ doğrudan eğimdir.
- **$ax + by + c = 0$ biçiminde:** $m = -\frac{a}{b}$'dir.

### Paralel ve Dik Doğrular ile Eksenleri Kesen Doğrular

- **Paralel İki Doğru ($d_1 \parallel d_2$):** Eğimleri **eşittir** ($m_1 = m_2$).
- **Dik Kesişen İki Doğru ($d_1 \perp d_2$):** Eğimleri çarpımı **$-1$**'dir ($m_1 \cdot m_2 = -1$, yani biri diğerinin ters işaretli çarpmaya göre tersidir).
- **Doğru Denklemi Yazma:** Eğimi $m$ ve geçtiği bir noktası $A(x_1, y_1)$ bilinen doğrunun denklemi $y - y_1 = m(x - x_1)$ formülüyle kurulur.
- **Kesişim Noktası ve Eksene Göre Alan:** İki doğrunun kesişim noktasını bulmak için denklemler **ortak çözülür** (yok etme veya eşitleme ile $x$ ve $y$ bulunur). Bir doğrunun eksenleri kestiği noktaları bulmak için $x = 0$ verip $y$ eksenini kestiği yeri, $y = 0$ verip $x$ eksenini kestiği yeri bul; oluşan dik üçgenin alanı daima eksen uzunluklarının çarpımının yarısıdır. Örneğin $3x + 4y = 12$ doğrusunda $x = 0 \Rightarrow y = 3$ ve $y = 0 \Rightarrow x = 4$ çıktığından eksenlerle oluşan dik üçgenin dik kenarları $3$ ve $4$, hipotenüsü $5$, çevresi $3 + 4 + 5 = 12$ ve alanı $\frac{3 \cdot 4}{2} = 6$ olur.
- **Bir Noktanın Bir Doğruya Uzaklığı:** $P(x_0, y_0)$ noktasının $ax + by + c = 0$ doğrusuna en kısa dik uzaklığı $d = \frac{\lvert ax_0 + by_0 + c \rvert}{\sqrt{a^2 + b^2}}$ formülüyle bulunur; paralel iki doğru arasındaki uzaklıkta ise katsayılar eşitlendikten sonra $\frac{\lvert c_1 - c_2 \rvert}{\sqrt{a^2 + b^2}}$ yazılır.

:::sekil Şekil 1. Dik koordinat düzleminde iki doğrunun kesişimi ve eksenle oluşturduğu üçgen
{"kind":"geometry","axes":{"x":[-1,7],"y":[-1,5],"grid":true},"functions":[{"expr":"2*x","domain":[-0.5,2.4],"label":"y = 2x"},{"expr":"-x + 6","domain":[1,6.4],"label":"y = -x + 6"}],"points":{"O_pt":[0,0],"A":[2,4],"B":[6,0]},"hideLabels":["O_pt"],"dots":["A","B"],"labelPos":{"A":"top","B":"br"},"shapes":[{"type":"polygon","points":["O_pt","A","B"],"fill":true,"fillOpacity":0.14}]}
:::

:::ornek
Şekil 1'deki dik koordinat düzleminde $y = 2x$ ve $y = -x + 6$ doğruları $A$ noktasında kesişmektedir. Taralı $OAB$ üçgeninin alanını bulalım. Önce iki doğrunun kesişim noktası olan $A$'yı ortak çözümle buluruz: $2x = -x + 6 \Rightarrow 3x = 6 \Rightarrow x = 2$. Yerine yazarsak $y = 2(2) = 4$ çıkar; yani $A(2, 4)$ noktasıdır. $y = -x + 6$ doğrusunun $x$-eksenini kestiği $B$ noktasını bulmak için $y = 0$ veririz ve $x = 6$ ($B(6, 0)$) elde edilir. Taralı $OAB$ üçgeninin tabanı $|OB| = 6$ birim, yüksekliği ise $A$ noktasının ordinatı olan $4$ birimdir; dolayısıyla alan $\frac{6 \cdot 4}{2} = 12$ birimkare olur. Dik kesişen doğru örneğinde ise $A(-2, 0)$ ve $B(0, 4)$'ten geçen doğrunun eğimi $m_1 = \frac{4 - 0}{0 - (-2)} = 2$ ise buna dik doğrunun eğimi $m_2 = -\frac{1}{2}$ olur.
:::

:::kodlama
**DİKSE ÇARPIMLARI EKSİ BİR ($m_1 \cdot m_2 = -1$)**: Bir doğruya dik doğrunun eğimini bulurken sadece işaret değiştirmekle kalma ($2 \to -2$ yanlıştır!), kesri hem ters çevir hem işaretini değiştir ($2 \to -\frac{1}{2}$).
:::

:::tuzak
İki hata çok sık görülür: Birincisi, $ax + by + c = 0$ doğrusunun eğimini $-\frac{a}{b}$ yerine doğrudan $a$ sanmaktır ($y$'yi yalnız bırakmadan $x$'in katsayısı eğim olmaz). İkincisi, Şekil 1 gibi taralı alan sorularında kesişim noktasının yüksekliği olarak $y$ koordinatı yerine $x$ koordinatını alıp alanı yanlış hesaplamaktır; taban $x$-ekseni üzerindeyse yükseklik daima noktanın $y$ değeridir.
:::

:::akilda-kalsin
- İki nokta arası eğim $m = \frac{y_2 - y_1}{x_2 - x_1}$, doğru denkleminde ise $y = mx + n$ formunda $m$ eğimdir.
- Paralel doğruların eğimleri eşit ($m_1 = m_2$), dik doğruların eğimleri çarpımı $-1$'dir ($m_1 \cdot m_2 = -1$).
- Kesişim noktası iki doğrunun ortak çözümüyle bulunur.
- Eksenleri kesen noktalar için sırasıyla $x = 0$ ve $y = 0$ değerlerini ver.
:::

:::kontrol
2a4f1d37-4b2d-5f9d-a5f4-f03238266221
2d2f9536-142e-542a-99d0-c36aef2f646e
:::

## Bölüm 3: Katı Cisimler (Prizmalar, Küp, Silindir, Piramit ve Koni)

Katı cisimler üç boyutlu hacim ve yüzey alanı sorularıdır ve KPSS'de formülleri oldukça düzenli bir mantığa oturur. Bütün dik prizma ve silindirler tek bir çatı altında özetlenebilir: **Tabanı ile tavanı eş olan bütün dik cisimlerde:**

$$\text{Hacim} = \text{Taban Alanı} \cdot \text{Yükseklik} \qquad \text{ve} \qquad \text{Yanal Alan} = \text{Taban Çevresi} \cdot \text{Yükseklik}$$

Toplam yüzey alanı ise **$\text{Yanal Alan} + 2 \cdot \text{Taban Alanı}$** ile bulunur (çünkü hem alt hem üst taban vardır; üstü açık kaplarda yalnızca $1$ taban alanı eklenir!).

### Küp, Dikdörtgenler Prizması ve Dik Dairesel Silindir

- **Dikdörtgenler Prizması:** Ayrıtları $a, b, c$ ise toplam ayrıt uzunluğu $4(a + b + c)$, yüzey alanı $2(ab + ac + bc)$, hacmi $a \cdot b \cdot c$ ve cisim köşegeni $\sqrt{a^2 + b^2 + c^2}$'dir.
- **Küp:** $12$ ayrıtının her biri $a$, $6$ yüzünün her biri $a^2$ alanlı karedir. Toplam yüzey alanı $6a^2$, hacmi $a^3$, cisim köşegeni $a\sqrt{3}$'tür.
- **Dik Dairesel Silindir:** Taban yarıçapı $r$, yüksekliği $h$ olan silindir açıldığında yan yüzeyi bir kenarı $2\pi r$ diğer kenarı $h$ olan bir **dikdörtgen** oluşur! Hacmi $\pi r^2 h$, yanal alanı $2\pi r h$, tüm alanı ise $2\pi r h + 2\pi r^2$'dir. Silindir yüzeyinden en kısa yol sorularında silindiri açıp o dikdörtgen üzerinde **Pisagor** uygulanır!

### Tepesi Sivri Cisimler (Piramit ve Koni) ile Küre

Tepesi sivri birleşen bütün düzgün piramit ve konilerde hacim, aynı tabanlı ve aynı yüksekliğe sahip prizma veya silindirin **üçte birine** eşittir:

$$V_{\text{piramit / koni}} = \frac{1}{3} \cdot \text{Taban Alanı} \cdot h$$

Dik dairesel konide ana doğru $l$, yarıçap $r$ ve yükseklik $h$ olmak üzere $l^2 = r^2 + h^2$ Pisagor'u ve yan yüzey açınımında merkez açı $\alpha$ ile $\frac{r}{l} = \frac{\alpha}{360^\circ}$ ilişkisi geçerlidir; yanal alanı $\pi r l$'dir. **Kürenin** hacmi $\frac{4}{3}\pi r^3$, yüzey alanı ise $4\pi r^2$ olarak hesaplanır. Sıvı boşaltma ve doldurma sorularında ise daima **hacimlerin eşitliği** ($V_1 = V_2$) kurulur; bir prizma veya silindir eğik konumda tutulsa dahi içindeki suyun hacmi sabit kaldığından yamuk prizma kesitinde ortalama yükseklik ($\frac{h_1 + h_2}{2}$) kullanılarak hacim korunur. Bir dikdörtgeni kendi kenarlarından biri etrafında $360^\circ$ döndürürsen oluşan cisim her zaman bir **dik dairesel silindir**, bir dik üçgeni dik kenarı etrafında döndürürsen oluşan cisim ise bir **dik dairesel koni** olur (etrafında dönülen kenar yükseklik $h$, diğer dik kenar yarıçap $r$ alınır!).

:::tablo
| Katı Cisim | Hacim | Yüzey Alanı / Kritik Not |
|---|---|---|
| Küp (ayrıt $a$) | $a^3$ | Alan $6a^2$, $12$ eşit ayrıt toplamı $12a$ |
| Dikdörtgenler Prizması ($a, b, c$) | $a \cdot b \cdot c$ | Alan $2(ab + ac + bc)$ |
| Silindir ($r, h$) | $\pi r^2 h$ | Yanal alan $2\pi r h$, toplam $2\pi r h + 2\pi r^2$ |
| Koni / Piramit | $\frac{1}{3} \cdot \text{Taban Alanı} \cdot h$ | Koni yanal alanı $\pi r l$ |
| Küre ($r$) | $\frac{4}{3} \pi r^3$ | Yüzey alanı $4\pi r^2$ |
:::

:::ornek
Bir küpün tüm ayrıtlarının uzunlukları toplamı $48$ cm olduğuna göre bu küpün hacmini ve yüzey alanını bulalım. Küpte birbirine eşit toplam $12$ ayrıt bulunduğu için bir ayrıt uzunluğu $a = \frac{48}{12} = 4$ cm bulunur. Küpün hacmi $a^3 = 4^3 = 64\text{ cm}^3$, toplam yüzey alanı ise $6a^2 = 6 \cdot 4^2 = 96\text{ cm}^2$ olur. İkinci bir örnekte taban yarıçapı $3$ cm, yüksekliği $8$ cm olan dolu bir silindirin içindeki suyun tamamı taban yarıçapı $6$ cm olan boş bir silindire boşaltılırsa su yüksekliği ne olur? Hacimler eşit olacağından $\pi \cdot 3^2 \cdot 8 = \pi \cdot 6^2 \cdot h \Rightarrow 72\pi = 36\pi h \Rightarrow h = 2$ cm bulunur.
:::

:::tuzak
Üç klasik hata katı cisimlerde puan kaybettirir: Birincisi, küpün ayrıt sayısını $12$ yerine $8$ (köşe sayısı) ya da $6$ (yüz sayısı) sanmaktır. İkincisi, koni ve piramit hacminde baştaki **$\frac{1}{3}$** çarpanını unutmaktır. Üçüncüsü, küp veya silindirde hacim ($a^3$) yerine yanlışlıkla alan ($6a^2$) hesaplayıp işaretlemektir.
:::

:::akilda-kalsin
- Tüm prizma ve silindirlerde hacim $\text{Taban Alanı} \cdot h$; piramit ve konide ise $\frac{1}{3} \cdot \text{Taban Alanı} \cdot h$'dir.
- Küpte $12$ ayrıt ($12a$), $6$ kare yüz ($6a^2$) ve $8$ köşe vardır.
- Silindirin yan yüzü açıldığında $2\pi r$ uzunluğunda ve $h$ yüksekliğinde bir dikdörtgen oluşur; en kısa yol buradan Pisagorla bulunur.
- Su aktarma veya cisim eritip yeni cisim dökme sorularında değişmeyen tek büyüklük hacimdir.
:::

:::kontrol
4a00e6bb-e425-51a4-8c7d-de8b2858a34a
6e25644f-8016-5784-8c35-2c7cbb5e4eee
:::
