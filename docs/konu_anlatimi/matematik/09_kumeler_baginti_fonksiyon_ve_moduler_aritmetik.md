---
lesson: Matematik & Geometri
topic: Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik
exam_scopes: [b_grubu_gygk]
sources:
  - "ÖSYM 2026 KPSS Lisans Kılavuzu (konu kapsamı)"
  - "MEB Ortaöğretim Matematik Ders Kitapları (yalnızca kavram ve formül doğrulama)"
---

## Bölüm 1: Kümeler, Alt Küme ve Venn Şeması Problemleri

İyi tanımlanmış, birbirinden farklı nesnelerin oluşturduğu topluluğa **küme** denir. Bir $A$ kümesinin eleman sayısı $s(A)$ ile gösterilir. Küme içinde bir eleman yalnızca bir kez sayılır ve parantez içindeki virgüllerle ayrılan her bağımsız öğe (içinde başka süslü parantez varsa o tek bir eleman sayılır!) $1$ eleman değerindedir. Örneğin $K = \{1, 2, \{3, 4\}\}$ kümesinin $4$ değil **$3$** elemanı vardır.

### Alt Küme Sayısı ve Şartlı Alt Kümeler

$n$ elemanlı bir kümenin **tüm alt kümelerinin sayısı $2^n$**, kendisi hariç **öz alt kümelerinin sayısı $2^n - 1$**'dir. Boş küme ($\emptyset$) her kümenin, her küme ise kendisinin alt kümesidir. KPSS'de en sık sorulan kalıp "belirli elemanların bulunup bulunmadığı" alt küme sorularıdır: hem bulunması istenen hem de bulunmaması istenen elemanlar kümeden **silinir**, geriye kalan $k$ elemanla $2^k$ adet alt küme kurulur (çünkü bulunması gereken elemanlar her alt kümeye otomatik eklenecektir). Örneğin $6$ elemanlı kümenin alt kümelerinin kaçında $1$ bulunur ama $2$ bulunmaz denirse $1$ ve $2$'yi çıkarır, kalan $4$ elemanla $2^4 = 16$ alt küme elde ederiz. "Veya" bağlacıyla en az biri bulunan sorularda ise **Tüm Durum $-$ İkisinin de Bulunmadığı Durum** yöntemi en kısa yoldur.

### Küme İşlemleri ve Problemler

İki kümenin birleşiminin eleman sayısı daima şu formülle hesaplanır:

$$s(A \cup B) = s(A) + s(B) - s(A \cap B) = s(A \setminus B) + s(A \cap B) + s(B \setminus A)$$

Küme problemlerinde ("sınıfta İngilizce bilenler, Almanca bilenler, hiçbirini bilmeyenler") mutlaka **evrensel küme içinde Venn şeması** çiz. "Yalnız bir dil bilenler" $s(A \setminus B) + s(B \setminus A)$, "en çok bir dil bilenler" ise yalnızca $1$ dil bilenlerle hiç bilmeyenlerin toplamıdır ($s(E) - s(A \cap B)$). "İngilizce bilmeyenler" dendiğinde ise $A$ kümesinin dışındaki tüm bölgeler yani $s(B \setminus A) + s(\text{dış})$ toplanmalıdır. Kesir veya yüzde içeren sınıf problemlerinde sınıf mevcuduna paydaların EKOK'u (örneğin $100x$ veya $12x$) vermek her bölgeyi tam sayıya dönüştürür; "$A$ bilenlerin sayısı $B$ bilenlerin $2$ katıdır" denildiğinde ise yalnızca $A \setminus B$ kısmını değil kesişimle birlikte tüm $A$ dairesini $2$ kat almak gerektiğini unutma!

Eğer soru **"hem $A$ hem $B$ hem de $C$ dillerini konuşabilenler en az kaçtır?"** veya iki kümenin kesişiminin **en küçük ve en büyük değerini** soruyorsa basit sınır kuralını uygula: $s(A \cap B)$'nin en büyük olması için küçük küme büyüğün içine tamamen yerleştirilir; en küçük olması için ise toplamlar evrensel kümeden çıkarılır ($s(A) + s(B) - s(E)$, negatifse $0$ alınır).

:::sekil Şekil 1. İki kümeli Venn şemasında ayrık bölgelerin dağılımı
{"kind":"venn","universe":"E","sets":["A","B"],"regions":{"A":"7","AB":"x","B":"9","out":"5"}}
:::

:::tablo
| İfade | Venn Şeması Karşılığı | Sembolik Gösterim |
|---|---|---|
| Yalnız $A$ | $A$'da olup $B$'de olmayan | $A \setminus B$ |
| Her ikisi | Hem $A$ hem $B$ | $A \cap B$ |
| En az biri | $A$ veya $B$ | $A \cup B$ |
| En çok biri | İkisini de yapanların dışı | $(A \cap B)'$ |
:::

:::ornek
Evrensel küme $s(E) = 36$ olmak üzere Şekil 1'deki Venn şemasında $s(A \setminus B) = 7$, $s(B \setminus A) = 9$, kesişim bölgesi $x$ ve her iki kümenin dışındaki eleman sayısı $5$ olsun. Önce kesişimi bulalım: tüm ayrık bölgelerin toplamı evrensel kümeyi verir, yani $7 + x + 9 + 5 = 36 \Rightarrow 21 + x = 36 \Rightarrow x = 15$. Buradan $s(A) = 7 + 15 = 22$ ve $s(B) = 9 + 15 = 24$ çıkar. Eğer soru "$A$'nın tümleyeni $s(A')$ kaçtır?" diye sorarsa $A$ dairesinin dışındaki iki bölgeyi toplarız: $9 + 5 = 14$. Dikkat edilirse $s(A) + s(A') = 22 + 14 = 36 = s(E)$ her zaman sağlanır.
:::

:::tuzak
İki klasik hata vardır: Birincisi, $s(A \cup B) = s(A) + s(B)$ sanıp kesişimi çıkarmamaktır. İkincisi, "en çok bir dil bilenler" ifadesinde hiç dil bilmeyen dış bölgeyi unutmak veya "Almanca bilmeyenler" sorusunda yalnızca İngilizce bilenleri alıp hiç bilmeyenleri dahil etmemektir. Alt küme sorularında ise $\in$ (eleman) ile $\subset$ (alt küme) sembollerini küme içindeki süslü parantezlerle karıştırmamaya dikkat et.
:::

:::akilda-kalsin
- $n$ elemanlı bir kümenin $2^n$ alt kümesi, $2^n - 1$ öz alt kümesi vardır.
- Şartlı alt küme sorularında bulunacak ve bulunmayacak elemanları çıkarıp kalanlarla $2^k$ hesapla.
- Venn şemasında dört ayrık bölge ($A\setminus B$, $A\cap B$, $B\setminus A$, dış) toplamı evrensel kümeyi verir.
- Bir küme ile tümleyeninin toplamı daima evrensel kümeye eşittir ($s(A) + s(A') = s(E)$).
:::

:::kontrol
0b45e078-247a-5d6b-8df8-eaa44222dc8e
1b85ac11-ffa3-50d2-ac06-71020d37d2cd
:::

## Bölüm 2: Kartezyen Çarpım, Bağıntı ve Fonksiyon Temelleri

$A$ ve $B$ boş olmayan iki küme olmak üzere birinci bileşeni $A$'dan, ikinci bileşeni $B$'den alınan tüm sıralı ikililerin kümesine **kartezyen çarpım** denir ($A \times B$). Eleman sayısı $s(A \times B) = s(A) \cdot s(B)$ ile bulunur; çarpım değişmeli değildir ($A \neq B$ iken $A \times B \neq B \times A$), ancak eleman sayıları eşittir. Bir $A \times B$ kümesinin herhangi bir alt kümesine $A$'dan $B$'ye bir **bağıntı** denir ve bağıntı sayısı $2^{s(A) \cdot s(B)}$ olur.

### Fonksiyon Olma Şartları ve Fonksiyon Türleri

$A$ (tanım kümesi) ve $B$ (değer kümesi) kümeleri arasında $f: A \to B$ bağıntısının **fonksiyon** olabilmesi için iki kural şarttır: 1. **Tanım kümesinde açıkta eleman kalmamalı** ($A$'daki her eleman mutlaka eşleşmelidir). 2. **Tanım kümesindeki bir eleman değer kümesinden yalnızca bir tek elemana gitmelidir** (bir çocuk aynı anda iki anneye gidemez; ancak iki farklı eleman aynı sonuca gidebilir).

Grafik sorularında dikey doğru testi uygulanır: $y$-eksenine paralel çizilen dik doğrular grafiği her noktada **en fazla $1$** noktada kesiyorsa o grafik fonksiyondur ($x$'e karşılık iki farklı $y$ çıkarsa fonksiyon değildir).

Fonksiyon çeşitleri sıkça öncüllü sorularda karşımıza çıkar:

- **Bire bir ($1-1$):** Farklı elemanlar farklı görüntülere gider; yatay doğru testi grafiği en fazla $1$ noktada keser.
- **Örten:** Değer kümesi olan $B$'de açıkta eleman kalmaz ($f(A) = B$). Açıkta eleman varsa fonksiyon **içine**dir.
- **Sabit Fonksiyon:** Bütün $x$ değerleri aynı tek sayıya gider ($f(x) = c$). Doğrusal kesir biçimindeyse ($\frac{ax + b}{cx + d}$) sabit olması için $\frac{a}{c} = \frac{b}{d}$ olmalıdır.
- **Birim Fonksiyon:** Her elemanı kendisine götürür ($f(x) = x$). Örneğin $f(x) = (a - 2)x^2 + (b + 1)x + (c - 4)$ birim fonksiyon ise $x^2$'nin katsayısı $0$ ($a = 2$), $x$'in katsayısı $1$ ($b = 0$) ve sabit terim $0$ ($c = 4$) olmalıdır.
- **Tek ve Çift Fonksiyonlar:** Çift fonksiyonda $f(-x) = f(x)$ sağlanır ve yalnızca çift kuvvetli $x$ terimleri bulunur (grafiği $y$-eksenine göre simetriktir). Tek fonksiyonda ise $f(-x) = -f(x)$ sağlanır, sabit terim dahil çift kuvvet bulunmaz (grafiği orijine göre simetriktir).
- **Doğrusal Fonksiyon ($f(x) = ax + b$):** Sabit artış hızına sahiptir; $f(2) = 5$ ve $f(5) = 14$ verildiğinde $x$ değeri $3$ artarken $y$ değeri $9$ arttığı için eğim $a = \frac{9}{3} = 3$ doğrudan okunur, sonra bir noktadan $b = -1$ bulunur.

:::tablo
| Fonksiyon Türü | Cebirsel Tanım | Grafik / Katsayı İpucu |
|---|---|---|
| Sabit fonksiyon | $f(x) = c$ | $x$'li tüm terimlerin katsayısı $0$ yapılır |
| Birim fonksiyon | $f(x) = x$ | $x$'in katsayısı $1$, diğer katsayılar $0$ |
| Doğrusal fonksiyon | $f(x) = ax + b$ | İki nokta verilince eğimden $a, b$ bulunur |
| Çift / Tek fonksiyon | $f(-x) = f(x)$ / $f(-x) = -f(x)$ | Çiftte tek üsler $0$; tekte çift üsler ve sabit $0$ |
:::

:::ornek
Gerçel sayılarda tanımlı $f(x) = 3x - 2$ ve $g(x) = x^2 + 1$ fonksiyonları için $f$ tek veya çift fonksiyon mudur ve $f(x)$ bire bir midir? İnceleyelim: $f(-x) = -3x - 2$ olduğundan ne $f(x)$'e ne de $-f(x)$'e eşittir; sabit $-2$ nedeniyle $f$ ne tek ne çifttir (ama $g(-x) = (-x)^2 + 1 = g(x)$ olduğundan $g$ **çift** fonksiyondur). Ayrıca $f(x) = 3x - 2$ doğrusal bir fonksiyon olduğu ve gerçel sayılarda tanımlandığı için hem **bire bir** hem de **örten**dir. Buna karşılık $g(x) = x^2 + 1$ kümesinde $g(-2) = g(2) = 5$ olduğu için bire bir değildir; görüntü kümesi $[1, \infty)$ olduğundan $\mathbb{R}$'yi örtmez, **içine** fonksiyondur.
:::

:::tuzak
Bir bağıntının fonksiyon olup olmadığını test ederken kuralı ters okumak en büyük tuzaktır: tanım kümesindeki iki farklı elemanın değer kümesinde aynı elemana gitmesi ($f(1) = 5$ ve $f(2) = 5$) fonksiyon olmayı **bozmaz** (sadece bire birliği bozar). Fonksiyon olmayı bozan şey tanım kümesinde boş eleman kalması veya tek bir $x$'in iki farklı $y$'ye gitmesidir.
:::

:::akilda-kalsin
- Fonksiyon olması için tanım kümesinde açık eleman kalmaz ve her girdi tek çıktı verir.
- Sabit fonksiyonda $x$'li tüm terimlerin katsayısı sıfırlanır; birim fonksiyonda sonuç daima girdiyle aynıdır.
- Parçalı fonksiyonda ($x < 3$ ve $x \ge 3$ gibi) değeri yerine yazmadan önce sınır şartına bak.
- Çift fonksiyonda tek üslü terim olmaz, tek fonksiyonda sabit sayı ($c \cdot x^0$) bile bulunamaz.
:::

:::kontrol
3921fc20-7003-55ff-bfb9-280f61226d58
542df0c6-892f-5313-a632-d27fcf52d0f4
:::

## Bölüm 3: Bileşke Fonksiyon, Ters Fonksiyon ve Türünden Yazma

İki fonksiyonun art arda uygulanmasına **bileşke fonksiyon** denir ve $(f \circ g)(x) = f(g(x))$ biçiminde **sağdan sola** hesaplanır. Önce en içteki $g(x)$ değeri bulunur, çıkan sonuç $f$ fonksiyonuna girdi olarak yazılır. Bileşke işleminde değişme özelliği yoktur ($f \circ g \neq g \circ f$), ancak birleşme özelliği vardır. Ayrıca bir fonksiyon ile tersinin bileşkesi birim fonksiyonu verir: $(f \circ f^{-1})(x) = x$.

### Ters Fonksiyon Alma Kuralları

Bir $f$ fonksiyonunun tersinin ($f^{-1}$) yine bir fonksiyon olabilmesi için $f$'nin mutlaka **bire bir ve örten** olması gerekir. Cebirsel olarak $f^{-1}(x)$ bulunurken $y = f(x)$ yazılıp $x$ yalnız bırakılır; pratikte ise doğrudan ters işlem uygulanır:

- **Doğrusal fonksiyon:** $f(x) = ax + b \Rightarrow f^{-1}(x) = \frac{x - b}{a}$.
- **Rasyonel doğrusal fonksiyon:** $f(x) = \dfrac{ax + b}{cx + d}$ için paydaki $x$'in katsayısı $a$ ile paydadaki sabit $d$ **hem yer hem işaret değiştirir**:

$$f^{-1}(x) = \frac{-dx + b}{cx - a}$$

- **Değer sorusunda ters almadan çözme:** Eğer soru yalnızca $f^{-1}(7)$ değerini soruyorsa ters kuralını bulmana hiç gerek yoktur! **$f(a) = b \Leftrightarrow f^{-1}(b) = a$** özelliğini kullanarak doğrudan $f(x) = 7$ denklemini çözersin. Aynı şekilde $f(2x + 1) = 3x - 5$ verilip $f(7)$ soruluyorsa içeriği $7$'ye eşitleyerek $2x + 1 = 7 \Rightarrow x = 3$ bulup sağ tarafta yerine koyarsın ($f(7) = 3(3) - 5 = 4$).

### Fonksiyonu Türünden Yazma ve İşlem Yapma

$f(x) = 3x - 2$ verilip $f(2x + 1)$'in $f(x)$ türünden değeri sorulduğunda iki adımda kesin sonuca gidilir: önce verilen $f(x)$ denkleminden $x$ yalnız bırakılır ($x = \frac{f(x) + 2}{3}$), sonra $f(2x + 1)$ açık yazılıp ($3(2x + 1) - 2 = 6x + 1$) bulunan $x$ yerine konur: $6 \cdot \frac{f(x) + 2}{3} + 1 = 2f(x) + 5$. Toplama/çıkarma sorularında ise $(f + g)(x) = f(x) + g(x)$ ve $(f - g)(x) = f(x) - g(x)$ yazılır; iki denklem taraf tarafa toplanarak $f(x)$ ve $g(x)$ ayrı ayrı bulunur.

:::tablo
| İfade / İşlem | Pratik Kural | Örnek |
|---|---|---|
| $(f \circ g)(x)$ | $f(g(x))$ (içten dışa) | $f(x)=3x-2, g(x)=x^2+1 \Rightarrow f(g(2))=f(5)=13$ |
| $f(a) = b$ tersi | $f^{-1}(b) = a$ (yer değiştir) | $f(2x-1)=5x+3 \Rightarrow f^{-1}(13)$ için $5x+3=13$ |
| $\frac{ax+b}{cx+d}$ tersi | $a$ ve $d$ yer+işaret değişir | $f(x)=\frac{2x+1}{x-3} \Rightarrow f^{-1}(x)=\frac{3x+1}{x-2}$ |
| Bileşke tersi | $(f \circ g)^{-1} = g^{-1} \circ f^{-1}$ | Sıra mutlaka ters döner |
:::

:::ornek
Gerçel sayılarda tanımlı $f(x) = 3x - 2$ ve $g(x) = x^2 + 1$ fonksiyonları için $(f \circ g)(2) - (g \circ f)(1)$ değerini bulalım. İlk terim için önce $g(2) = 2^2 + 1 = 5$ hesaplanır, ardından $f(5) = 3(5) - 2 = 13$ bulunur. İkinci terim için önce $f(1) = 3(1) - 2 = 1$ hesaplanır, ardından $g(1) = 1^2 + 1 = 2$ bulunur. Fark: $13 - 2 = 11$ olur. Bir başka örnekte $(f + g)(x) = 3x + 5$ ve $(f - g)(x) = x - 1$ verilirse iki denklemi taraf tarafa toplayarak $2f(x) = 4x + 4 \Rightarrow f(x) = 2x + 2$ ve yerine koyarak $g(x) = x + 3$ elde ederiz.
:::

:::tuzak
İki klasik hata sık yapılır: Birincisi, $(f \circ g)^{-1}$ alınırken sırayı değiştirmeyip $f^{-1} \circ g^{-1}$ yazmaktır; ters dağılırken sıranın tersine döndüğünü unutma ($g^{-1} \circ f^{-1}$). İkincisi, $\frac{ax + b}{cx + d}$ tersinde $a$ ve $d$ yerine sabit ile $x$'li terimi yanlış sıraya göre değiştirmektir; önce payı $ax + b$, paydayı $cx + d$ sırasına dizip yalnızca sol üstteki $a$ ile sağ alttaki $d$'yi hem yer hem işaret değiştir.
:::

:::akilda-kalsin
- Bileşke işleminde $(f \circ g)(x) = f(g(x))$ her zaman sağdan sola doğru uygulanır.
- Noktasal ters değer ($f^{-1}(k)$) soruluyorsa ters kuralı bulma; doğrudan $f(x) = k$ denklemini çöz.
- $\frac{ax + b}{cx + d}$ kesrinde yalnızca $a$ ve $d$ hem yer hem işaret değiştirir.
- $(f \circ g)^{-1} = g^{-1} \circ f^{-1}$ kuralında sıra ters döner.
:::

:::kontrol
5c1ca2ae-d3f1-5eee-9730-9df90a89e7d3
66b65ffd-8ca3-5f37-babd-300a9b3ed359
:::

## Bölüm 4: Modüler Aritmetik ve Periyodik Tekrar Problemleri

KPSS'de doğrudan "mod" kelimesi geçmese bile "bugün günlerden salı ise $200$ gün sonra hangi gündür", "$KADROKADRO...$ dizisinin $138$. harfi nedir", "saat $14.00$ iken $85$ saat önce saat kaçtı" veya "$4$ günde bir nöbet tutan doktor" gibi tüm sorular **modüler aritmetik (periyodik durum)** konusudur. Temel prensip son derece basittir:

1. Önce olayın kendini **kaç adımda bir** tekrar ettiğini (periyodu $T$) belirle (haftanın günleri için $T = 7$, $24$ saatlik dijital saat için $T = 24$, $5$ harfli kelime için $T = 5$). 2. İlerlenen toplam adım sayısını $N$ ile göster ve **$N$'yi periyot $T$'ye bölerek kalanı ($r$) bul**. 3. Tam katlar başlangıç konumuna geri döndürür; dolayısıyla **ileri gidiliyorsa kalan $r$ kadar ileri say**, **geri gidiliyorsa kalan $r$ kadar geri say**.

### Dikkat Edilecek İnce Ayrıntı: Sıra Sayısı mı, Geçen Süre mi?

Burada en kritik ayrım sorunun "baştan $N$. sırada" mı yoksa "$N$ gün/saat sonra" mı sorduğudur:

- **"Bugün Salı, $100$ gün sonra":** Bugün $0$. gündür. $100 \div 7$ kalanı $2$ olduğu için Salı'dan $2$ gün ileri sayılır: Çarşamba ($1$), **Perşembe** ($2$).
- **"$KADROKADRO\ldots$ dizisinin $138$. harfi":** İlk harf $1$. sıradadır ($K$). $138 \div 5$ işleminde kalan $3$ olur; $1$. harf $K$, $2$. harf $A$, **$3$. harf $D$** bulunur. Kalan $0$ çıkarsa kelimenin **en son harfi** ($O$) alınır!
- **"1. nöbetini Salı günü tutan doktorun $15$. nöbeti":** $1$. nöbet zaten tutulduğu için $15$. nöbete ulaşana kadar **$15 - 1 = 14$ nöbet aralığı** geçer! Yani $N$'yi $15$ değil $14$ alıp periyotla çarpmak gerekir.

Modüler denklik içeren işlemlerde (örneğin $3^{2026}$ sayısının $7$ ile bölümünden kalan veya birler basamağı) kuvvetlerin kalanları periyodik olarak tekrar edene kadar $n = 1, 2, 3, \ldots$ değerleri denenir; $1$ kalanı bulunduğu anda periyot yakalanmış olur. Örneğin $3^1 \equiv 3$, $3^2 \equiv 2$, $3^3 \equiv 6$, $3^4 \equiv 4$, $3^5 \equiv 5$, $3^6 \equiv 1$ (mod $7$) olduğundan periyot $6$'dır; ardından $2026$ üssü $6$'ya bölünerek kalan $4$ bulunur ve sonuç $3^4$'ün kalanı olan $4$'e eşitlenir. Birler basamağı sorulduğunda da daima $10$ ile bölümünden kalan aynı mantıkla hesaplanır.

:::tablo
| Problem Tipi | Periyot ($T$) | Kalan $0$ Çıkarsa Sonuç | Kalan $r > 0$ Çıkarsa |
|---|---|---|---|
| Gün soruları ($N$ gün sonra) | $7$ | Başlangıç günü | Başlangıçtan $r$ gün ileri |
| Saat soruları ($N$ saat önce) | $24$ (veya $12$) | Başlangıç saati | Başlangıçtan $r$ saat geri |
| Harf/şekil dizisi ($N$. eleman) | Döngü uzunluğu | Döngünün **son elemanı** | Döngünün **$r$. elemanı** |
| $1$.'den $k$. nöbete/etkinliğe | $(k - 1) \cdot \text{aralık}$ | Başlangıç günü | Toplam günü $7$'ye böl |
:::

:::ornek
`KADROKADROKADRO...` biçiminde harfleri tekrar eden dizinin baştan $138$. sıradaki harfini ve $138$. sıraya kadar kaç tane `A` harfi yazıldığını bulalım. Kelimemiz `KADRO` olmak üzere $5$ harfli bir periyoda sahiptir ($T = 5$). $138$'i $5$'e böleriz: $138 = 5 \cdot 27 + 3$. Yani tam $27$ kez `KADRO` bloğu yazılmış ve üzerine $3$ harf daha eklenmiştir (`K`, `A`, `D`). Bu nedenle $138$. harf `D`'dir. Kaç adet `A` yazıldığını bulmak için: her tam blokta $1$ adet `A` olduğundan $27$ bloktan $27$ tane gelir; kalan $3$ harf olan `KAD` içinde de $1$ adet `A` bulunduğundan toplam $27 + 1 = 28$ adet `A` vardır.
:::

:::kodlama
**KAÇINCI SIRA İSE KENDİNDEN SAY, KAÇ GÜN SONRA İSE SIFIRDAN SAY**: Dizide $1$. eleman daima $1$. sıradır (kalan $0$ son elemanı verir); takvimde ise bugün $0$. gündür (kalan $0$ bugünün kendisini verir).
:::

:::tuzak
Nöbet ve zil sorularında "1. nöbet Salı ise 20. nöbet hangi gündür" dendiğinde $20$'yi periyotla çarpmak en yaygın hatadır; $1$. ile $20$. arasında $19$ aralık vardır, bu yüzden $(20 - 1) = 19$ çarpılır. Aynı şekilde harf dizisinde kalan $0$ çıktığında ilk harfi değil **son harfi** seçmeyi unutma.
:::

:::akilda-kalsin
- Periyodik sorularda önce tekrar uzunluğunu ($T$) belirle, sonra adımı $T$'ye bölüp yalnızca kalanla ilgilen.
- Harf/sayı dizilerinde kalan $r$ ise baştan $r$. eleman, kalan $0$ ise döngünün son elemanı seçilir.
- Takvim sorularında ileri tarih için kalan eklenir, geçmiş tarih için kalan çıkarılır.
- İlk nöbet verilip $k$. nöbet soruluyorsa aradaki boşluk sayısı daima $k - 1$'dir.
:::

:::kontrol
6a8a92a6-f201-527d-98f1-0c3246364288
6cc578eb-4481-55a1-91b6-1d172d383e44
:::
