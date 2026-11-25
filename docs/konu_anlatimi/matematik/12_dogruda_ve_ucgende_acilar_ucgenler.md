---
lesson: Matematik & Geometri
topic: Doğruda ve Üçgende Açılar, Üçgenler
exam_scopes: [b_grubu_gygk]
sources:
  - "ÖSYM 2026 KPSS Lisans Kılavuzu (konu kapsamı)"
  - "MEB Ortaöğretim Matematik Ders Kitapları (yalnızca kavram ve formül doğrulama)"
---

## Bölüm 1: Doğruda Açılar ve Paralel Doğru Kuralları

Geometri sorularında ilk adım şeklin yanındaki metni okuyarak hangi doğruların paralel ($\parallel$) ve hangi açıların eşit olduğunu işaretlemektir. Doğru üzerinde oluşan tam açının ölçüsü $360^\circ$, doğru açının ölçüsü $180^\circ$ ve dik açının ölçüsü $90^\circ$'dir. Toplamları $90^\circ$ olan iki açıya **tümler**, toplamları $180^\circ$ olan iki açıya **bütünler** açılar denir. Kesişen iki doğrunun karşılıklı açıları (**ters açılar**) birbirine eşittir.

### Paralel İki Doğru Arasındaki Pratik Kurallar

$d_1 \parallel d_2$ iki paralel doğru bir kesen ile kesildiğinde üç ana açı ilişkisi doğar: **yöndeş açılar** aynı yöne baktıkları için eşittir, **iç ters açılar (Z kuralı)** eşittir ve aynı tarafta içte kalan **karşı durumlu açılar (U kuralı)** toplamı $180^\circ$'dir. Doğruda açı sorularında bilinmeyen açıya geçmeden önce verilen bütün $180^\circ$ doğrusal açıları (örneğin bir doğrunun üzerinde yan yana duran açıları) ve ters açıları yaz; çoğu zaman paralel çizgi çekmeye bile gerek kalmadan üçgen veya dörtgenin iç açılarından sonuca ulaşılır.

Kırık çizgiler içeren sorularda kuralı göremiyorsan kırılma köşesinden **paralellere yeni bir paralel doğru** çiz; bütün karışık sorular anında Z ve U kurallarına bölünür! Eğer soru içinde $90^\circ$'lik diklik ve açıortaylar aynı köşeden çıkıyorsa iki komşu bütünler açının açıortayları arasındaki açının daima **$90^\circ$** olduğunu hatırla: $2a + 2b = 180^\circ \Rightarrow a + b = 90^\circ$. Bu bilgi paralel kenar ve yamuk sorularında da sıkça işe yarar.

Sık kullanılan hızlandırıcı kalıplar şunlardır:

- **M Kuralı ($d_1 \parallel d_2$):** Sola bakan açıların toplamı, sağa bakan açının ölçüsüne eşittir. Çok kırıklı **zikzak kuralında** da aynı şekilde sola bakan tüm dar açıların toplamı sağa bakan tüm dar açıların toplamına eşittir.
- **Kalem Ucu Kuralı:** Paralel iki doğru arasında tek yönde kırılan üç açının toplamı $360^\circ$'dir. Genel olarak iki paralel doğru arasında $n$ tane iç açı oluşuyorsa bu açıların toplamı daima $(n - 1) \cdot 180^\circ$ kuralına uyar (örneğin $3$ açıda $360^\circ$, $4$ açıda $540^\circ$).
- **Paralel ve Açıortay Birlikteliği:** Paralel iki doğru arasında açıortay çizilmişse Z kuralından dolayı mutlaka bir **ikizkenar üçgen** gizlidir!
- **Bütünler ve Ters Açı Zinciri:** Kesişen doğruların bulunduğu şekillerde yan yana duran açılar $180^\circ$'ye tamamlanırken karşılıklı açıların eşitliği doğrudan yazılır. Özellikle ışın yönlerine dikkat et: $[BA \parallel [DE$ ifadesinde iki ışının aynı yöne mi yoksa zıt yöne mi baktığı hangi U veya Z kuralının çalışacağını belirler.

:::tablo
| Kural Adı | Şekil Yapısı | Açı Bağıntısı |
|---|---|---|
| Z Kuralı (İç Ters) | Paralel doğrular arası ters köşeler | Açılar birbirine eşittir |
| U Kuralı (Karşı Durumlu) | Aynı yöne bakan iki iç açı | Toplamları $180^\circ$'dir |
| M Kuralı / Zikzak | Sağa ve sola kıvrılan ışınlar | Sola bakanlar toplamı = Sağa bakanlar |
| Kalem Ucu | Aynı tarafa kıvrılan $3$ açı | Üçünün toplamı $360^\circ$'dir |
:::

:::sekil Şekil 1. Paralel doğrular arasında M kuralı ve kırılma köşesi
{"kind":"geometry","width":340,"height":240,"points":{"L1":[0,6],"R1":[10,6],"L2":[0,0],"R2":[10,0],"P":[3.2,6],"E":[6.6,3],"Q":[3.6,0]},"hideLabels":["L1","R1","L2","R2"],"labelPos":{"P":"top","E":"right","Q":"bottom"},"shapes":[{"type":"segment","from":"L1","to":"R1"},{"type":"segment","from":"L2","to":"R2"},{"type":"segment","from":"P","to":"E"},{"type":"segment","from":"Q","to":"E"},{"type":"angle","vertex":"P","from":"R1","to":"E","radius":24,"fill":true,"label":"38°"},{"type":"angle","vertex":"Q","from":"E","to":"R2","radius":24,"fill":true,"label":"47°"},{"type":"angle","vertex":"E","from":"P","to":"Q","radius":22,"fill":true,"label":"85°"}]}
:::

:::ornek
Şekil 1'de $d_1 \parallel d_2$ olmak üzere $m(\widehat{BPE}) = 38^\circ$ ve $m(\widehat{PEQ}) = 85^\circ$ verilsin; $m(\widehat{EQD})$ açısını bulalım. M kuralına göre sağa bakan köşelerdeki iki açının toplamı, ortadaki sola bakan açıya eşittir: $38^\circ + m(\widehat{EQD}) = 85^\circ \Rightarrow m(\widehat{EQD}) = 47^\circ$. Başka bir soruda $[BA \parallel [DE$ iken kalem ucu şeklinde $m(\widehat{ABC}) = 115^\circ$ ve $m(\widehat{BCD}) = 105^\circ$ verilirse üç açının toplamı $360^\circ$ olacağından $m(\widehat{CDE}) = 360^\circ - (115^\circ + 105^\circ) = 140^\circ$ bulunur.
:::

:::kodlama
**KIRILMA KÖŞESİNE PARALEL ÇİZ**: Zikzak veya M kuralı aklından çıktığında ya da çizgi karmaşıklaştığında her kırılma köşesinden tabanlara paralel yardımcı çizgi çek; şekil tek hamlede Z ve U kuralına dönüşür.
:::

:::tuzak
Zikzak kuralını uygularken paralel doğruların dışında kalan geniş açıyı değil mutlaka **içte kalan dar açıyı** toplama dahil etmelisin. Ayrıca kalem ucu kuralında toplamı $360^\circ$ almak yerine üçgen gibi $180^\circ$ sanmak ya da $[BA \parallel [DE$ veriliyorken ters yönlü M ile aynı yönlü kalem ucu şekillerini karıştırmak klasik çeldiricilerdir.
:::

:::akilda-kalsin
- Tümler açıların toplamı $90^\circ$, bütünler açıların toplamı $180^\circ$'dir.
- Paralel doğrularda Z kuralı açıları eşitler, U kuralı iki açıyı $180^\circ$'ye tamamlar.
- M kuralında zıt yöne bakan açıların toplamları birbirine eşittir.
- İki paralel doğru arasında açıortay varsa Z kuralından gizli ikizkenar üçgen aramalısın.
:::

:::kontrol
019d55bd-2b95-51c9-af72-90824015dacd
08ea2fc0-1b0e-572a-a99c-c19aa3933b0b
:::

## Bölüm 2: Üçgende Açılar, İkizkenar-Eşkenar Üçgen ve Açı-Kenar Bağıntıları

Her üçgende **iç açılar toplamı $180^\circ$**, **dış açılar toplamı ise $360^\circ$**'dir. Üçgen açısı sorularının yüzde seksenini çözen en kritik kural şudur: **bir dış açının ölçüsü, kendisine komşu olmayan iki iç açının ölçüleri toplamına eşittir**. Bu kuralı kullandığında ek denklem kurmadan doğrudan bilinmeyene geçersin.

### İkizkenar, Eşkenar Üçgen ve Açıortay Formülleri

- **İkizkenar Üçgen:** Eşit iki kenarın karşısındaki taban açıları da eşittir. İki ikizkenar parça uç uca eklenmişse ($|AB| = |BD| = |DC|$ gibi) taban açılarına harf ($a$) verip dış açıyı $2a$ yazarak zincirleme ilerle. **DAKİ** kuralını unutma: ikizkenar üçgende tepeden indirilen Dikme aynı zamanda Açıortay, Kenarortaydır (ikizkenar varsa bu dörtlüden ikisi geldiğinde diğer ikisi kendiliğinden oluşur).
- **Eşkenar Üçgen:** Üç kenarı eşit, her iç açısı **$60^\circ$** ve bütün kenarlara çizilen yükseklik, açıortay ve kenarortaylar aynı doğru parçasıdır. Eşkenar üçgenle başka bir eşit kenar birleşmişse ($|BD| = |BC|$ gibi) aynı uzunlukları çizgilerle işaretleyip gizli ikizkenar üçgenleri mutlaka gör! Çünkü eşkenarın bütün kenarları eşit olduğundan dışarıdaki eşitlik diğer iki kenarla da otomatik olarak ikizkenar üçgen kurar ($|AB| = |BD|$ gibi).
- **İç ve Dış Açıortaylar:** İki iç açıortayın kesiştiği açının ölçüsü $90^\circ + \frac{A}{2}$, iki dış açıortayın kesiştiği açının ölçüsü $90^\circ - \frac{A}{2}$, bir iç ve bir dış açıortayın kesiştiği açının ölçüsü ise $\frac{A}{2}$'dir. Bir üçgenin köşesindeki açıortay ile yükseklik arasındaki dar açı ise diğer iki açının farkının yarısına eşittir ($\frac{\lvert B - C \rvert}{2}$).

### Açı-Kenar Bağıntıları ve Üçgen Eşitsizliği

Bir üçgende büyük açının karşısında büyük kenar, küçük açının karşısında küçük kenar bulunur. Üç kenarı $a, b, c$ olan bir üçgenin çizilebilmesi için her kenar diğer iki kenarın farkının mutlak değerinden büyük, toplamından küçük olmalıdır:

$$\lvert b - c \rvert < a < b + c$$

Eğer soruda özel bir açı koşulu verilmişse ($m(\widehat{A}) > 90^\circ$ geniş açı gibi) Pisagor kıyaslaması da devreye girer: geniş açının karşısı için $a^2 > b^2 + c^2$, dar açının karşısı için $a^2 < b^2 + c^2$ sınırları daraltıcı olarak eklenir. Ayrıca çevresi tam sayı verilen ya da iki kenarı bilinen bir üçgenin üçüncü kenarının alabileceği tam sayı değerleri sayılırken bu iki koşulun kesişimi alınır; kenar uzunluğu tam sayı denmemişse yalnızca üçgen eşitsizliği uç değerlerinden tam sayı toplamına geçilir.

:::tablo
| Koşul | Kenar Bağıntısı | Kullanım Yeri |
|---|---|---|
| Genel üçgen | $\lvert b - c \rvert < a < b + c$ | Her kenar diğer ikisinin farkından büyük, toplamından küçüktür |
| $\widehat{A} = 90^\circ$ (Dik açı) | $a^2 = b^2 + c^2$ | Pisagor eşitliği |
| $\widehat{A} > 90^\circ$ (Geniş açı) | $a^2 > b^2 + c^2$ | En büyük kenar alt sınırını daraltır |
| $\widehat{A} < 90^\circ$ (Dar açı) | $a^2 < b^2 + c^2$ | Kenar üst sınırını daraltır |
:::

:::sekil Şekil 2. İki dış açı ve ikizkenar üçgen zinciri ($|AB| = |BD| = |DC|$)
{"kind":"geometry","width":340,"height":220,"points":{"A":[0,0],"B":[2.33,5.33],"C":[10,0],"D":[5,0]},"labelPos":{"A":"bl","B":"top","C":"br","D":"bottom"},"shapes":[{"type":"polygon","points":["A","B","C"]},{"type":"segment","from":"B","to":"D","ticks":1},{"type":"segment","from":"A","to":"B","ticks":1},{"type":"segment","from":"D","to":"C","ticks":1},{"type":"angle","vertex":"C","from":"B","to":"D","radius":26,"fill":true,"label":"34°"},{"type":"angle","vertex":"B","from":"A","to":"D","radius":22,"fill":true,"label":"x"}]}
:::

:::ornek
Şekil 2'deki $ABC$ üçgeninde $D \in [AC]$, $|AB| = |BD| = |DC|$ ve $m(\widehat{ACB}) = 34^\circ$ olduğuna göre $m(\widehat{ABD}) = x$ kaç derecedir? Önce $|BD| = |DC|$ ikizkenarlığından $m(\widehat{DBC}) = 34^\circ$ yazarız. Ardından $BDC$ üçgeninde iki iç açının toplamı kendisine komşu olmayan dış açı olan $m(\widehat{ADB})$'yi verir: $34^\circ + 34^\circ = 68^\circ$. Şimdi $ABD$ üçgenine geçeriz: $|AB| = |BD|$ olduğu için taban açısı $m(\widehat{BAD}) = 68^\circ$ olur. Son olarak $ABD$ üçgeninin iç açılar toplamından $x = 180^\circ - (68^\circ + 68^\circ) = 44^\circ$ elde edilir.
:::

:::tuzak
İki nokta üçgen açılarında en çok puan götürür: Birincisi, ikizkenarlıkta hangi iki açının eşit olduğunu kenarların **karşısındaki açılara** bakmadan tahmin etmektir; eşit kenarların karşısındaki açılar eşittir. İkincisi, üçgen eşitsizliği sorularında kenarın tam sayı olduğu belirtilmişken diğer ek dar/geniş açı kısıtını gözden kaçırmaktır.
:::

:::akilda-kalsin
- Bir dış açı, kendisine komşu olmayan iki iç açının toplamına eşittir.
- Eşkenar üçgenin bir kenarına eşit başka bir kenar verilmişse diğer iki kenara da aynı işareti koyarak gizli ikizkenarı gör.
- İkizkenar üçgende **DAKİ** (Dikme-Açıortay-Kenarortay-İkizkenar) dörtlüsünden ikisi varsa diğer ikisi de vardır.
- Üçgen eşitsizliğinde $\lvert b - c \rvert < a < b + c$ her kenar için geçerlidir.
:::

:::kontrol
0c6291f1-6556-5210-8b15-48208a22050f
0e6dba2c-6703-5cf6-90e3-ddd1b146185a
:::

## Bölüm 3: Dik Üçgen, Özel Üçgenler ve Öklid Bağıntıları

Bir açısı $90^\circ$ olan üçgene **dik üçgen**, $90^\circ$'lik açının karşısındaki en uzun kenara ise **hipotenüs** denir. Dik kenarları $a, b$ ve hipotenüsü $c$ olan her dik üçgende **Pisagor teoremi** geçerlidir:

$$a^2 + b^2 = c^2$$

KPSS sorularında sayıları kare alıp toplamak yerine şu beş tam sayı ve açı dik üçgenini hızla tanımalısın:

- **Kenarlarına Göre Özel Dik Üçgenler:** $(3 - 4 - 5)$ ve katları ($6-8-10, 9-12-15, 12-16-20$); $(5 - 12 - 13)$ ve katları ($10-24-26$); $(8 - 15 - 17)$; $(7 - 24 - 25)$.
- **Açılarına Göre Özel Dik Üçgenler:** $30^\circ-60^\circ-90^\circ$ üçgeninde $30^\circ$'nin karşısı $a$ ise hipotenüs $2a$, $60^\circ$'nin karşısı $a\sqrt{3}$'tür. $45^\circ-45^\circ-90^\circ$ ikizkenar dik üçgeninde dik kenarlar $a$, hipotenüs $a\sqrt{2}$'dir. $15^\circ-75^\circ-90^\circ$ üçgeninde ise hipotenüse inen yükseklik $h$ ise hipotenüs $4h$'dir.

### Muhteşem Üçlü ve Öklid Bağıntıları

Dik üçgende $90^\circ$'lik köşeden hipotenüse çizilen **kenarortay**, hipotenüsü böldüğü iki eş parçaya eşittir (**Muhteşem Üçlü**); herhangi bir soruda eşitlik bu üçlüden ikisini veriyorsa o köşe mutlaka $90^\circ$'dir. Dik köşeden hipotenüse indirilen **yükseklik ($h$)** hipotenüsü $p$ ve $k$ uzunluklarına ayırıyorsa **Öklid bağıntıları** çalışır ($c = p + k$):

- $h^2 = p \cdot k$ (yükseklik bağıntısı)
- $a^2 = p \cdot c$ ve $b^2 = k \cdot c$ (dik kenar bağıntıları)
- $a \cdot b = c \cdot h$ (alan eşitliği sayesinde hem yükseklik hem dik kenarlar kolayca birbirine bağlanır)
- $\frac{1}{h^2} = \frac{1}{a^2} + \frac{1}{b^2}$ (dik üçgende yüksekliğin dik kenarlarla doğrudan ilişkisi)

Geniş ya da dar açılı bir üçgende $30^\circ$, $45^\circ$ veya $60^\circ$ açısı gördüğünde o açının **karşısına** bir dikme indirerek özel dik üçgen oluştur; asla $30^\circ$ veya $45^\circ$ gibi özel açıyı bölmeye çalışma! Eğer şeklin içinde hem dik üçgen hem de eşit açı veya tümler açılar ($90^\circ - \alpha$) varsa kenarlar özel üçgen çıkmadığında benzerliği düşünerek açıları $\alpha$ ve $\beta$ ($\alpha + \beta = 90^\circ$) diye harflendir.

:::tablo
| Özel Üçgen | Kenar / Açı Oranları | Hızlı Kontrol |
|---|---|---|
| $3 - 4 - 5$ ve katları | $3k, 4k, 5k$ ($6-8-10, 9-12-15$) | Hipotenüs daima $5k$'dır |
| $5 - 12 - 13$ ve katları | $5k, 12k, 13k$ ($10-24-26$) | Hipotenüs $13k$ olmalıdır |
| $8 - 15 - 17$ ve $7 - 24 - 25$ | $8, 15, 17$ ve $7, 24, 25$ | İki dik kenar farkı küçük olanlar |
| $30^\circ - 60^\circ - 90^\circ$ | $a : a\sqrt{3} : 2a$ | $60^\circ$ karşısı $30^\circ$'nin $\sqrt{3}$ katıdır |
| $45^\circ - 45^\circ - 90^\circ$ | $a : a : a\sqrt{2}$ | Hipotenüs dik kenarın $\sqrt{2}$ katıdır |
:::

:::sekil Şekil 3. İki bitişik dik üçgen ve özel üçgen zinciri ($3-4-5$ ve $5-12-13$)
{"kind":"geometry","width":340,"height":260,"points":{"A":[0,3],"B":[0,0],"C":[4,0],"D":[10,8]},"labelPos":{"A":"left","B":"bl","C":"bottom","D":"tr"},"shapes":[{"type":"polygon","points":["A","B","C"]},{"type":"polygon","points":["A","C","D"]},{"type":"angle","vertex":"B","from":"A","to":"C","right":true},{"type":"angle","vertex":"C","from":"A","to":"D","right":true},{"type":"segment","from":"A","to":"B","label":"3"},{"type":"segment","from":"B","to":"C","label":"4"},{"type":"segment","from":"C","to":"D","label":"12"},{"type":"segment","from":"A","to":"D","label":"x"}]}
:::

:::ornek
Şekil 3'teki $ABC$ ve $ACD$ birer dik üçgendir; $AB \perp BC$, $AC \perp CD$, $|AB| = 3$ cm, $|BC| = 4$ cm ve $|CD| = 12$ cm verilmişse $|AD| = x$ kaç cm'dir? Önce $ABC$ dik üçgeninde $3 - 4 - 5$ özel üçgeninden $|AC| = 5$ cm bulunur. Ardından $ACD$ dik üçgeninde dik kenarlar $|AC| = 5$ cm ve $|CD| = 12$ cm olduğu için $5 - 12 - 13$ özel üçgeninden $|AD| = 13$ cm elde edilir. Bir başka özel açı sorusunda $m(\widehat{B}) = 45^\circ$, $m(\widehat{C}) = 30^\circ$ ve $|AB| = 6\sqrt{2}$ cm ise $A$'dan $BC$'ye dikme indiririz: $45^\circ-45^\circ-90^\circ$ üçgeninden yükseklik $\frac{6\sqrt{2}}{\sqrt{2}} = 6$ cm çıkar, $30^\circ-60^\circ-90^\circ$ üçgeninde $30^\circ$'nin karşısı $6$ olduğundan $|AC| = 12$ cm bulunur.
:::

:::tuzak
İki klasik hata sık yapılır: Birincisi, bir üçgende kenarları $3$ ve $5$ görünce hipotenüsü aramadan doğrudan $3-4-5$ üçgeni sanıp diğer kenara $4$ yazmaktır; eğer $5$ dik kenar ve $3$ diğer dik kenarsa hipotenüs $\sqrt{34}$ çıkar! İkincisi, $30^\circ-60^\circ-90^\circ$ üçgeninde $30^\circ$ ile $60^\circ$'nin karşısındaki katları ($\sqrt{3}$ ve $2$) ters kullanmaktır.
:::

:::akilda-kalsin
- $3-4-5$, $5-12-13$, $8-15-17$ ve $7-24-25$ özel dik üçgenlerinde en büyük sayı daima hipotenüstür.
- $30^\circ, 45^\circ, 60^\circ$ gördüğünde bu açıları bozmadan karşılarına dikme indir.
- Dik köşeden hipotenüse inen dikme varsa Öklid ($h^2 = p \cdot k$); kenarortay varsa Muhteşem Üçlü uygula.
- $30^\circ-60^\circ-90^\circ$'de oranlar $1 : \sqrt{3} : 2$, $45^\circ-45^\circ-90^\circ$'de ise $1 : 1 : \sqrt{2}$'dir.
:::

:::kontrol
20de0cb1-82f7-5644-82ea-c4dc2b242cef
21232c15-93cc-507c-88dd-3bf0603617ba
:::

## Bölüm 4: Üçgende Alan, Benzerlik, Açıortay ve Kenarortay

Üçgenlerde uzunluk ve alan sorularının ikinci yarısı **alan taşıma**, **benzerlik (Tales)**, **iç açıortay** ve **ağırlık merkezi (kenarortay)** kurallarına dayanır.

### Açıortay ve Kenarortay (Ağırlık Merkezi)

- **İç Açıortay Teoremi:** Bir üçgende çizilen iç açıortay, karşı kenarı komşu yan kenarlarla **orantılı** böler: $\frac{\lvert AB \rvert}{\lvert AC \rvert} = \frac{\lvert BD \rvert}{\lvert DC \rvert}$. Aynı zamanda açıortay doğrusu üzerindeki bir noktadan açının kollarına inilen dikmeler birbirine eşittir.
- **Kenarortay ve Ağırlık Merkezi ($G$):** Üç kenarortayın kesiştiği noktaya **ağırlık merkezi ($G$)** denir. $G$ noktası her kenarortayı **tabandan $1$ birim ($k$), köşeden $2$ birim ($2k$)** oranında böler! Ayrıca üç kenarortay üçgenin alanını **$6$ eş alana** böler; yalnızca $G$'yi üç köşeye birleştirirsen üçgen **$3$ eş alana** ayrılır.

### Benzerlik ve Alan Oranları

İki üçgenin karşılıklı açıları eşitse (**Açı-Açı benzerliği**) kenarları aynı oranda (**benzerlik oranı $k$**) orantılıdır. Paralel doğrularla kesilen üçgenlerde **Tales (Temel Benzerlik)** ve **Kelebek** modelleri oluşur:

- Benzer iki üçgenin çevreleri, yükseklikleri, açıortayları ve kenarortayları oranı doğrudan **$k$**'dır.
- Benzer iki üçgenin **alanları oranı benzerlik oranının karesi olan $k^2$**'ye eşittir! Örneğin bir kenarı tabana paralel orta tabanla böldüğünde $1 : 2$ benzerlik oranı doğar; alan oranı $\left(\frac{1}{2}\right)^2 = \frac{1}{4}$ olduğu için üst küçük üçgen $S$, alttaki yamuk $3S$ alanına sahip olur.

### Üçgende Alan Formülleri ve Yükseklik Paylaşımı

Tabanı $a$, yüksekliği $h$ olan üçgenin alanı $\frac{a \cdot h}{2}$'dir. Aynı tepe noktasını paylaşan (yükseklikleri eşit) iki üçgenin **alanları oranı tabanlarının oranına eşittir!** Örneğin taban $2 : 3$ oranında bölünmüşse alanlar da $2S$ ve $3S$ paylaşır. İki kenarı $b, c$ ve aradaki açısı $\alpha$ verilen üçgenlerde ise $\frac{1}{2} \cdot b \cdot c \cdot \sin\alpha$ formülü (özellikle $30^\circ, 45^\circ, 60^\circ$ veya ortak köşeden kenar oranlı alan bölünmelerinde $\frac{S_1}{S_2} = \frac{a_1 \cdot b_1}{a_2 \cdot b_2}$) çok hızlı sonuç verir. Eşkenar üçgende bir kenar $a$ iken alan daima $\frac{a^2\sqrt{3}}{4}$ formülüyle, yükseklik ise $\frac{a\sqrt{3}}{2}$ ile hesaplanır.

Ayrıca dış açıortay teoremi sorulduğunda ($ABC$ üçgeninde $A$ köşesinin dış açıortayı $[BC]$ uzantısını $D$ noktasında kesiyorsa), $D$ noktasından başlayarak $\frac{\lvert DC \rvert}{\lvert DB \rvert} = \frac{\lvert AC \rvert}{\lvert AB \rvert}$ oranı yazılır; bu oranı kurarken küçük parçayı ($\lvert DC \rvert$) kenarın tamamına ($\lvert DB \rvert$) oranlamaya dikkat et. İç teğet çemberin merkezi iç açıortayların, çevrel çemberin merkezi ise kenar orta dikmelerin kesişim noktasıdır.

:::tablo
| Kavram | Oran Kuralı | Alan Etkisi |
|---|---|---|
| Eş yüksekli üçgenler | Tabanlar $m : n$ | Alanlar $mS : nS$ |
| Benzer üçgenler | Kenar oranı $k$ | Alanlar oranı $k^2$ |
| Orta taban | Tabanlar $1 : 2$ | Üst üçgen $S$, alt yamuk $3S$ |
| Ağırlık merkezi ($G$) | Köşeden $2k$, tabandan $k$ | $3$ köşe birleşince $3$ eş alan ($S, S, S$) |
:::

:::ornek
Bir $ABC$ üçgeninde $[DE] \parallel [BC]$ olmak üzere $D \in [AB]$, $E \in [AC]$, $|AD| = 4$ cm ve $|DB| = 6$ cm verilmiş olsun; $ADE$ üçgeninin alanı $16\text{ cm}^2$ ise $DBCE$ yamuğunun alanı kaç $\text{cm}^2$'dir? Temel benzerlik oranı $k = \frac{|AD|}{|AB|} = \frac{4}{4 + 6} = \frac{4}{10} = \frac{2}{5}$ bulunur. Benzer üçgenlerin alanları oranı $k^2 = \left(\frac{2}{5}\right)^2 = \frac{4}{25}$'tir. Küçük üçgenin alanı $4S = 16 \Rightarrow S = 4$ alındığında büyük $ABC$ üçgeninin toplam alanı $25S = 100\text{ cm}^2$ olur. Dolayısıyla alttaki yamuğun alanı $100 - 16 = 84\text{ cm}^2$'dir.
:::

:::tuzak
Temel benzerlik sorularında benzerlik oranını $\frac{|AD|}{|DB|} = \frac{4}{6}$ şeklinde parçayı parçaya oranlamak en büyük tuzaktır; benzerlikte her zaman **küçük üçgenin kenarı ($\lvert AD \rvert$) bölü büyük üçgenin kenarı ($\lvert AB \rvert = \lvert AD \rvert + \lvert DB \rvert$)** alınmalıdır! Ayrıca $k$ oranı alan sorularında karesi ($k^2$) alınmadan doğrudan alana oranlanmamalıdır.
:::

:::akilda-kalsin
- Benzerlikte küçük parçayı parçaya değil, daima küçük üçgeni **büyük üçgene** oranla.
- Benzerlik oranı $k$ iken uzunluklar $k$, alanlar ise **$k^2$** oranındadır.
- Aynı tepe noktasını paylaşan üçgenlerin alanları doğrudan tabanlarıyla orantılıdır.
- Ağırlık merkezi $G$, kenarortayı köşeye $2$, tabana $1$ oranında böler ($2k : k$).
:::

:::kontrol
23dafe34-58de-53cd-84bb-046addd226b3
297b8dc9-2bd9-5cd5-b8a4-e398fd86f23b
:::
