---
lesson: Matematik & Geometri
topic: Denklem Çözme ve Sayı-Kesir Problemleri
exam_scopes: [b_grubu_gygk]
sources:
  - "ÖSYM 2026 KPSS Lisans Kılavuzu (konu kapsamı)"
  - "MEB Ortaöğretim Matematik Ders Kitapları (yalnızca kavram ve formül doğrulama)"
---

## Bölüm 1: Birinci Dereceden Denklemler ve Çözüm Kümesi

İçinde en büyük kuvveti $1$ olan bilinmeyen bulunan eşitliklere **birinci dereceden denklem** denir ($ax + b = 0$). Rasyonel terimli denklemleri çözerken iki hızlı teknik uygulanır: ya tüm kesirlerin paydaları ortak katta eşitlenip payda silinir ya da önce **aynı paydalı** veya tam sayı üreten terimler bir araya getirilir. İçler-dışlar çarpımı ($\frac{a}{b} = \frac{c}{d} \Rightarrow ad = bc$) yapılırken kesir çizgisinin önündeki eksi işaretinin paydaki **her terime** dağılması gerektiği unutulmamalıdır. Örneğin $-\frac{x + 2}{4}$ ifadesi payda eşitlendikten sonra $-(x + 2) = -x - 2$ olarak yazılır.

### Çözüm Kümesinin Üç Olası Durumu

$ax + b = cx + d$ biçimindeki bir denklem düzenlenip $(a - c)x = d - b$ hâline getirildiğinde üç farklı sonuç çıkabilir:

- **Tek Çözüm ($a \neq c$):** $x = \frac{d - b}{a - c}$ olmak üzere çözüm kümesi tek elemanlıdır.
- **Boş Küme ($a = c$ ve $b \neq d$):** Denklem $0 \cdot x = 5$ gibi imkânsız bir eşitliğe dönüşür; hiçbir $x$ sağlayamaz ve ÇK $= \emptyset$ olur.
- **Sonsuz Çözüm ($a = c$ ve $b = d$):** Denklem $0 \cdot x = 0$ özdeşliğine dönüşür; her gerçel sayı denklemi sağlar ve ÇK $= \mathbb{R}$ olur.

Paydasında bilinmeyen bulunan rasyonel denklemlerde ($\frac{1}{x - 2} + \frac{3}{2x - 4} = \frac{5}{4}$ gibi) bulduğun kökün **hiçbir paydayı sıfır yapmadığını** mutlaka kontrol et. Eğer bulunan değer paydayı sıfır yapıyorsa o değer çözüm kümesinden çıkarılır ve başka kök yoksa ÇK $= \emptyset$ kalır. İki bilinmeyenli denklem sistemlerinde ise ($ax + by = c$ ve $dx + ey = f$) yok etme veya yerine koyma metodu uygulanır; soru toplam veya fark istiyorsa her iki denklemi doğrudan taraf tarafa toplayıp çıkararak tek tek $x$ ve $y$'yi bulmadan da sonuca gidilebilir. Eğer katsayılar birbirine çapraz simetrik ise ($13x + 17y = 43$ ve $17x + 13y = 47$ gibi) denklemleri topladığında $30(x + y) = 90 \Rightarrow x + y = 3$, çıkardığında $4(y - x) = 4 \Rightarrow y - x = 1$ hemen ortaya çıkar.

:::tablo
| Denklem Biçimi | Katsayı Koşulu | Çözüm Kümesi |
|---|---|---|
| $Ax = B$ ($A \neq 0$) | Katsayılar farklı | Tek elemanlı $\{B/A\}$ |
| $0 \cdot x = B$ ($B \neq 0$) | $x$ katsayıları eşit, sabitler farklı | Boş küme ($\emptyset$) |
| $0 \cdot x = 0$ | $x$ katsayıları ve sabitler aynı | Tüm gerçel sayılar ($\mathbb{R}$) |
| Paydalı denklem | Bulunan kök paydayı sıfır yaparsa | O kök atılır |
:::

:::ornek
$$\frac{2x - 1}{3} - \frac{x + 2}{4} = \frac{5}{6}$$ denklemini çözelim. Paydalar $3, 4, 6$ olduğundan tüm terimleri EKOK olan $12$'de eşitleriz (veya tüm denklemi $12$ ile çarparız): $4(2x - 1) - 3(x + 2) = 2 \cdot 5$. Parantezleri dikkatle açarsak $8x - 4 - 3x - 6 = 10 \Rightarrow 5x - 10 = 10 \Rightarrow 5x = 20 \Rightarrow x = 4$ bulunur. Paydalar sabit tam sayılar olduğu için tanımsızlık riski yoktur; çözüm kümesi $\{4\}$ olur. Eğer $\frac{1}{x - 2} + \frac{3}{2x - 4} = \frac{5}{4}$ verilseydi $2x - 4 = 2(x - 2)$ yazılarak $\frac{2 + 3}{2(x - 2)} = \frac{5}{4} \Rightarrow 2(x - 2) = 4 \Rightarrow x = 4$ elde edilirdi.
:::

:::kodlama
**EKSİYİ PARANTEZE DAĞIT, KÖKÜ PAYDAYA SOR**: Kesrin önündeki eksi tüm paya aittir; parantez açmadan eksi dağıtma! Denklem bitiminde bulduğun $x$ değerini paydalara sor: sıfır yapan kök sahtedir.
:::

:::tuzak
İki klasik hata sık yapılır: Birincisi, $-\frac{x + 2}{4}$ kesrinde eksiyi yalnızca $x$'e verip $+2$'yi eksiyle çarpmamak ve $-3x + 6$ yazmaktır; doğrusu $-3x - 6$'dır. İkincisi, sonsuz çözüm sorusunda $0 \cdot x = 0$ şartını bilip yalnızca $x$ katsayılarını eşitleyerek sabitlerin de eşit olması gerektiğini unutmaktır.
:::

:::akilda-kalsin
- Payda eşitledikten sonra kesrin önündeki eksi işaretini paydaki bütün terimlere dağıt.
- Çözüm kümesi $\mathbb{R}$ (sonsuz) ise hem $x$ katsayıları hem sabit terimler eşittir.
- Çözüm kümesi $\emptyset$ ise $x$'in katsayıları eşit, sabit terimler farklıdır.
- Paydasında $x$ bulunan denklemlerde bulduğun kökü paydayı sıfır yapıp yapmadığına göre test et.
:::

:::kontrol
072fa4b0-27a9-57be-9ffa-26907a4bd19a
0c5702be-be1c-5940-ab56-8cfc08b2c288
:::

## Bölüm 2: Sayı Problemleri, Denklem Kurma ve Kuyruk/Paylaşım Modelleri

Sayı problemleri KPSS Matematik bölümünün kalbidir; çünkü sonraki bütün yaş, işçi, yüzde ve sayısal mantık problemlerinde aynı **Türkçe cümleyi matematiksel denkleme çevirme** becerisi kullanılır. Denklem kurarken en az değişken kullanmaya özen göster: iki sayının toplamı $40$ verilmişse sayılara $x$ ve $y$ demek yerine $x$ ve $40 - x$ demek tek denklemde işi bitirir.

Sık kullanılan cümle kalıpları şunlardır:

- "Bir sayının $3$ katının $5$ eksiği" $\Rightarrow 3x - 5$
- "Bir sayının $5$ eksiğinin $3$ katı" $\Rightarrow 3(x - 5)$ (kelime sırası parantez yerini belirler!)
- "Biri diğerinin $3$ katından $4$ fazla" $\Rightarrow x$ ve $3x + 4$
- "$A$ sayısının $B$'ye oranı $\frac{2}{5}$" $\Rightarrow A = 2k$ ve $B = 5k$

### Kuyruk, Eşit Paylaşım, Puan ve Kademeli Tarife Kalıpları

Sınavda en çok çıkan dört sayı problemi modeli şunlardır: 1. **Eşit Paylaşım / Grup Ödemesi:** $n$ arkadaş fiyatı $F$ olan bir hediyeyi paylaşacakken $k$ kişi ayrılırsa kalan kişi başı ödeme $\frac{F}{n - k} - \frac{F}{n}$ kadar artar. Bu tür sorularda kurulan kesirli denklemde tam sayı bölenleri denemek de hızlı kontrol sağlar. 2. **Sıra / Kuyruk ve Oturma Problemleri:** Her sıraya $a$ kişi oturursa $m$ kişi ayakta kalıyor, $b$ kişi oturursa $n$ sıra boş kalıyor deniyorsa sıra sayısına $x$ de: kişi sayısı birinci durumda $ax + m$, ikinci durumda $b(x - n)$ olur ve eşitlenir. Kuyruk sorularında "baştan $p$. ve sondan $q$." verilen kişinin her iki sayımda da kendisi sayıldığı için toplam kişi sayısı $p + q - 1$'dir. 3. **Doğru-Yanlış-Boş Puanlama:** Toplam $T$ soruda doğruya $+d$, yanlışa $-y$, boşa $b$ puan veriliyorsa hem $D + Y + B = T$ hem de puan denklemi yazılır. Sadece doğru ve yanlış soruluyorsa boşları ayrı tutmayı unutma. 4. **Kademeli Tarife (Su/Elektrik/Taksi):** İlk $10\text{ m}^3$ sabit birim fiyatla çarpılır, toplam tüketimden yalnızca $10$'u **aşan kısım** ($x - 10$) ikinci tarifeyle çarpılır; tüm $x$'i yüksek tarifeyle çarpmak en yaygın hatadır! Örneğin ilk $10\text{ m}^3$ için $\text{m}^3$ başına $18$ TL, $10\text{ m}^3$'ü aşan her $\text{m}^3$ için $25$ TL alınan bir tarifede $280$ TL fatura gelmişse ilk $10\text{ m}^3$ $180$ TL tutar, kalan $100$ TL ise $25$'e bölünerek $4\text{ m}^3$ bulunur ve toplam tüketim $14\text{ m}^3$ olur.

:::tablo
| Kalıp Adı | Değişken Seçimi | Kurulacak Kritik Eşitlik |
|---|---|---|
| Sıra-oturma | Sıra sayısı $= x$ | $ax + \text{ayakta} = b(x - \text{boş sıra})$ |
| Kuyruk | İki kişinin arası $= k$ | En çok: $p + q + k$; En az: $p + q - k - 2$ |
| Kademeli fatura | Tüketim $= x$ ($x > \text{sınır}$) | $\text{sınır} \cdot f_1 + (x - \text{sınır}) \cdot f_2$ |
| Tokalaşma / Hediye | Kişi $= n$ | Karşılıklı hediye: $n(n-1)$; Tokalaşma: $\frac{n(n-1)}{2}$ |
:::

:::ornek
Bir grup arkadaş $720$ TL tutarındaki bir hediyeyi eşit paylaşacaktır. Gruptan $3$ kişi ayrılınca diğerlerinin ödeyeceği tutar kişi başı $20$ TL artıyor. Başlangıçtaki kişi sayısına $n$ dersek kişi başı pay $\frac{720}{n}$, yeni pay $\frac{720}{n - 3}$ olur. Aradaki fark $20$ TL olduğundan $\frac{720}{n - 3} - \frac{720}{n} = 20$ yazarız. Her tarafı $20$'ye bölersek $\frac{36}{n - 3} - \frac{36}{n} = 1 \Rightarrow \frac{36 \cdot 3}{n(n - 3)} = 1 \Rightarrow n(n - 3) = 108$. Aralarında $3$ fark olup çarpımı $108$ olan pozitif sayılar $12$ ve $9$'dur; yani $n = 12$ bulunur.
:::

:::tuzak
İki klasik hata vardır: Birincisi, "her sıraya $3$ kişi oturursa $2$ sıra boş kalıyor, son sırada $1$ kişi oturuyor" denildiğinde boş kalan $2$ sırayı çıkarıp $1$ kişinin oturduğu eksik sırayı da tam $3$ kişilik saymaktır; doğrusu $3(x - 3) + 1$ yazmaktır. İkincisi, "en az" kuyruk sorusunda iki kişinin yer değiştirip aradaki $k$ kişinin ikişer kez sayıldığını unutup $-2$ çıkarmayı atlamaktır.
:::

:::akilda-kalsin
- Sözel ifadede "katının eksiği" ($3x - 5$) ile "eksiğinin katı" ($3(x - 5)$) arasındaki farka dikkat et.
- Eşit paylaşım ve sıra sorularında değişkeni mümkünse tek harfe ($x$) indir.
- Kademeli faturalarda ikinci birim fiyatı yalnızca sınırı aşan $(x - \text{sınır})$ miktara uygula.
- İlk sıradan son sıraya uzanan sıra ve kuyruk sorularında aynı kişinin iki kez sayılmasını $-1$ ile düzelt.
:::

:::kontrol
124e76a7-b021-5c7f-a8a7-7ade9518d9d0
14641e16-5cd3-50db-b5d1-2cc749bc5ae8
:::

## Bölüm 3: Kesir Problemleri ve Kalanın Kesri Stratejisi

Kesir problemlerinde sorunun yarısını çözdüren kural, kesirlerle uğraşmak yerine **paydaların EKOK'u kadar değişken atamaktır**. Örneğin soruda bir yolun $\frac{1}{4}$'ü ve kalanın $\frac{2}{5}$'i geçiyorsa yolun tamamına $x$ demek yerine $4 \cdot 5 = 20x$ dersen bütün adımlarda tam sayılarla çalışırsın ve kesir toplama hatası yapmazsın!

Kesir problemlerinde iki cümle birbirinden çok farklı sonuç üretir:

- **"Tümünün $\frac{1}{6}$'sı ve tümünün $\frac{1}{4}$'ü":** İki kesir de bütünden alındığı için doğrudan toplanır: $\frac{1}{6} + \frac{1}{4} = \frac{5}{12}$ kesilmiş, $\frac{7}{12}$ kalmıştır.
- **"Önce $\frac{2}{5}$'si, sonra KALANIN $\frac{1}{4}$'ü":** Birinci adımdan sonra kalan $\frac{3}{5}$'tir; ikinci adım bu kalanın $\frac{1}{4}$'ü alınarak $\frac{3}{5} \cdot \frac{1}{4} = \frac{3}{20}$ hesaplanır veya geriye kalan üzerinden doğrudan $\frac{3}{5} \cdot \frac{3}{4} = \frac{9}{20}$ bulunur.

### Telin Orta Nokta Kayması ve Su Dolu Kap Modelleri

Kesir sorularında iki özel kalıp sık sorulur:

- **Orta Nokta Kayması:** Bir telin yalnızca bir ucundan $a$ cm kesilirse orta nokta kesilen tarafa ters yönde **$\frac{a}{2}$ cm** kayar. Eğer sol ucundan $a$, sağ ucundan $b$ kesilirse orta nokta, çok kesilen ucun tersine doğru **$\frac{\lvert a - b \rvert}{2}$** kadar kayar. Örneğin bir ucundan $\frac{x}{6}$, diğer ucundan $\frac{x}{4}$ kesilirse orta nokta $\frac{1}{2}\left(\frac{x}{4} - \frac{x}{6}\right) = \frac{x}{24}$ kadar kayar.
- **Boş Kap + Sıvı Ağırlığı:** Bir kabın kendi ağırlığına $K$, tam dolu iken içindeki sıvıya $S$ de. "Kabın $\frac{1}{3}$'ü su ile doluyken toplam ağırlık $18$, tamamı doluyken $34$" denirse $K + \frac{S}{3} = 18$ ve $K + S = 34$ kurulur; alttan üstü çıkarınca $K$ hemen yok olur: $\frac{2S}{3} = 16 \Rightarrow S = 24$ ve $K = 10$ bulunur!
- **Mum / Yanma Süresi Kalıbı:** Aynı boydaki iki mumdan biri $a$ saatte, diğeri $b$ saatte tamamen yanıp bitiyorsa $t$ saat sonra kalan boyları sırasıyla $(1 - \frac{t}{a})$ ve $(1 - \frac{t}{b})$ oranında olur; boy oranları sorulduğunda bu iki ifade oranlanır.

:::tablo
| Model | Doğru Değişken | Kritik Formül |
|---|---|---|
| Kalanın kesri ($\frac{a}{b}$, kalan $\frac{c}{d}$) | Bütüne $b \cdot d \cdot x$ de | Kalan oranı doğrudan $(1 - \frac{a}{b})(1 - \frac{c}{d})$ |
| Tek uçtan kesilen tel | Kesilen parça $= a$ | Orta nokta $\frac{a}{2}$ diğer uca kayar |
| İki uçtan kesilen tel | Kesilenler $= a, b$ | Orta nokta $\frac{\lvert a - b \rvert}{2}$ kayar |
| Dolu/yarım kap tartımı | Kap $= K$, Sıvı $= S$ | İki tartımın farkı doğrudan sıvı farkını verir ($K$ gider) |
:::

:::ornek
Deposunun $\frac{2}{7}$'si yakıtla dolu olan bir araç, deposundaki yakıtın $\frac{1}{4}$'ünü harcadıktan sonra depoya $15$ litre daha yakıt koyuyor ve depo tam yarısına kadar doluyor. Deponun tamamına $7 \cdot 4 = 28x$ diyelim. Başlangıçta depoda $28x \cdot \frac{2}{7} = 8x$ yakıt vardır. Bu yakıtın $\frac{1}{4}$'ü yani $2x$ harcanınca $6x$ kalır. Üzerine $15$ litre eklenince deponun yarısı olan $14x$'e ulaşılır: $6x + 15 = 14x \Rightarrow 8x = 15$ değil, örneğin $16$ litre eklenmişse $8x = 16 \Rightarrow x = 2$ ve depo $28 \cdot 2 = 56$ litre olur. Başka bir örnekte bir öğrenci kitabın ilk gün $\frac{2}{5}$'ini, ikinci gün kalanın $\frac{1}{4}$'ünü okuyorsa kitaba $20x$ deriz: ilk gün $8x$ okur ($12x$ kalır), ikinci gün $12x \cdot \frac{1}{4} = 3x$ okur ve $9x$ kalır.
:::

:::kodlama
**ORTA NOKTA YARIM KAYAR**: Tel veya çubuğun bir ucundan $L$ kesildiğinde orta nokta $\frac{L}{2}$ kayar; her iki ucundan kesim varsa kesimlerin **farkının yarısı** ($\frac{\lvert a - b \rvert}{2}$) kadar kayma gerçekleşir.
:::

:::tuzak
Üç büyük tuzak adayın soruyu kaybetmesine yol açar: Birincisi, "kalanın $\frac{1}{4}$'ü" ifadesini "tümünün $\frac{1}{4}$'ü" gibi okuyup $\frac{2}{5} + \frac{1}{4}$ toplamaktır. İkincisi, "deposundaki yakıtın $\frac{1}{4}$'ü" ifadesini deponun tamamının $\frac{1}{4}$'ü sanmaktır; mevcut yakıt $8x$ ise harcanan $8x \cdot \frac{1}{4} = 2x$'tir. Üçüncüsü, boş kap ağırlığını hesaba katmadan tartım ağırlığını doğrudan sıvı ağırlığı saymaktır.
:::

:::akilda-kalsin
- Kesir problemlerinde paydaların çarpımı veya EKOK'u kadar değişken atayarak kesirlerden kurtul.
- "Kalanın $\frac{c}{d}$'si" ile "tümünün $\frac{c}{d}$'si" ifadelerini çözüm başında çizerek ayır.
- Telin uçlarından $a$ ve $b$ kesildiğinde orta nokta $\frac{\lvert a - b \rvert}{2}$ kadar kayar.
- Kap tartımı sorularında iki durumun farkı alındığında boş kap ağırlığı $K$ doğrudan yok olur.
:::

:::kontrol
161456ca-7f74-5a70-863a-69fadf1f62c0
16ba7daa-a2d9-5a38-8174-b507ae63f489
:::
