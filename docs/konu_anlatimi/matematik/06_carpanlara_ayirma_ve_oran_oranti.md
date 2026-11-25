---
lesson: Matematik & Geometri
topic: Çarpanlara Ayırma ve Oran-Orantı
exam_scopes: [b_grubu_gygk]
sources:
  - "ÖSYM 2026 KPSS Lisans Kılavuzu (konu kapsamı)"
  - "MEB Ortaöğretim Matematik Ders Kitapları (yalnızca kavram ve formül doğrulama)"
---

## Bölüm 1: Ortak Çarpan, Gruplandırma ve Özdeşlikler

Bir cebirsel ifadeyi daha sade çarpanların çarpımı biçiminde yazmaya **çarpanlara ayırma** denir. KPSS'de kesirli sadeleştirme sorularından en küçük değer bulma ve geometrik alan farkı sorularına kadar geniş bir alanda kullanılır. İlk başvurulacak adım daima **ortak çarpan parantezine** almaktır ($ax + ay = a(x + y)$). Eğer bütün terimlerde ortak bir çarpan yoksa terimler ikili veya üçlü gruplara ayrılır (**gruplandırarak çarpanlara ayırma**): $ax - ay + bx - by = a(x - y) + b(x - y) = (x - y)(a + b)$.

### Temel Özdeşlikler ve Tam Kareye Tamamlama

Çarpanlara ayırmanın bel kemiğini üç grup özdeşlik oluşturur:

- **İki Kare Farkı:** $a^2 - b^2 = (a - b)(a + b)$. Geometrik kesme-yapıştırma sorularında büyük kareden küçük kare kesildiğinde kalan taralı alan daima $(a - b)(a + b)$ olarak ifade edilir.
- **Tam Kare Açılımları:** $(a + b)^2 = a^2 + 2ab + b^2$ ve $(a - b)^2 = a^2 - 2ab + b^2$. Toplamları ve çarpımları verilen iki sayının kareleri toplamını bulmak için $a^2 + b^2 = (a + b)^2 - 2ab$ veya $(a - b)^2 + 2ab$ dönüşümü uygulanır.
- **İki Küp Toplamı ve Farkı:** $a^3 - b^3 = (a - b)(a^2 + ab + b^2)$ ve $a^3 + b^3 = (a + b)(a^2 - ab + b^2)$. Değer bulma sorularında ise sıklıkla $a^3 - b^3 = (a - b)^3 + 3ab(a - b)$ özdeşliği zaman kazandırır.

**En küçük değer soruları** ($x^2 + y^2 - 6x + 8y + 30$ gibi) mutlaka **tam kareye tamamlama** yöntemiyle çözülür. $x$'li ve $y$'li terimler ayrı ayrı paranteze alınıp birinci dereceden terimin katsayısının yarısının karesi eklenip çıkarılır: $(x^2 - 6x + 9) + (y^2 + 8y + 16) + 5 = (x - 3)^2 + (y + 4)^2 + 5$. Gerçel bir sayının karesi en az $0$ olabildiğinden parantezler $x = 3$ ve $y = -4$ değerlerinde sıfırlanır ve ifadenin alabileceği en küçük değer $5$'tir. Aynı yöntem paydada tam kare oluşturulan en büyük kesir değeri sorularında da doğrudan uygulanır.

:::tablo
| Özdeşlik | Açılım | KPSS Kullanım Alanı |
|---|---|---|
| İki kare farkı | $a^2 - b^2 = (a - b)(a + b)$ | Büyük sayılar ve geometrik alan farkı |
| Tam kare toplamı | $(a + b)^2 = a^2 + 2ab + b^2$ | $a + \frac{1}{a}$ kalıpları |
| Küp farkı | $(a - b)(a^2 + ab + b^2)$ | Kesirli sadeleştirme soruları |
| Tam kareye tamamlama | $(x - h)^2 + (y - k)^2 + c$ | İfadenin alabileceği en küçük değer |
:::

:::sekil Şekil 1. İki kare farkı özdeşliğinin geometrik anlamı ($14^2 - 6^2$)
{"kind":"geometry","width":260,"height":260,"points":{"A":[0,0],"B":[14,0],"C":[14,8],"D":[8,8],"E":[8,14],"F":[0,14],"G":[14,14]},"pointLabels":false,"shapes":[{"type":"polygon","points":["A","B","C","D","E","F"],"fill":true,"fillOpacity":0.14},{"type":"polygon","points":["D","C","G","E"],"dashed":true},{"type":"segment","from":"A","to":"B","label":"14"},{"type":"segment","from":"E","to":"G","label":"6"},{"type":"segment","from":"G","to":"C","label":"6"}]}
:::

:::ornek
$a - b = 3$ ve $a \cdot b = 4$ olduğuna göre $a^3 - b^3$ değerini bulalım. Önce $a^2 + b^2$ toplamını tam kare özdeşliğinden hesaplarız: $(a - b)^2 = a^2 - 2ab + b^2 \Rightarrow 3^2 = a^2 + b^2 - 2(4) \Rightarrow a^2 + b^2 = 17$. Ardından iki küp farkını açarız: $a^3 - b^3 = (a - b)(a^2 + ab + b^2) = 3 \cdot (17 + 4) = 3 \cdot 21 = 63$. Doğrudan $(a - b)^3 + 3ab(a - b)$ kullanılsaydı $3^3 + 3(4)(3) = 27 + 36 = 63$ yine aynı sonucu verirdi.
:::

:::tuzak
İki kritik hata sık tekrarlanır: Birincisi, $(a - b)^2$ açılımını $a^2 - b^2$ sanıp ortadaki $-2ab$ terimini unutmaktır. İkincisi, $x^2 + bx + c$ biçimindeki üç terimliyi çarpanlarına ayırırken çarpımları $c$'yi, toplamları $b$'yi veren sayıları işaretleriyle eşleştirmemektir; ayrıca $ax^2 + bx + c$ ifadesinde $a \neq 1$ ise çapraz çarpım kontrolünü mutlaka yapmalısın.
:::

:::akilda-kalsin
- Çarpanlara ayırmaya her zaman önce ortak çarpan paranteziyle başla.
- $a^2 - b^2 = (a - b)(a + b)$ hem büyük sayı hesaplarında hem alan farkı sorularında hız kazandırır.
- $x^2 + y^2 + \cdots$ ifadesinin en küçük değerini bulmak için $x$ ve $y$'yi tam kareye tamamla.
- İki küp farkında içteki üç terimli $a^2 + ab + b^2$ ifadesinde $2$ katsayısı yoktur.
:::

:::kontrol
049035c4-6f8b-5a48-9387-2822b57fa11e
070ed491-04fc-53d6-afe8-cc85b45736b5
:::

## Bölüm 2: Rasyonel İfadelerin Sadeleştirilmesi ve $x + \frac{1}{x}$ Kalıbı

Pay ve paydası polinom biçiminde verilen kesirli ifadeleri en sade hâle getirirken üç adımlı sistem izlenir: önce ortak çarpan veya gruplandırma varsa uygulanır, ardından özdeşlikler ve üç terimliler ($ax^2 + bx + c$) çarpanlarına ayrılır, son olarak bölme işlemi varsa ikinci kesir ters çevrilip çarpılarak sadeleştirme yapılır. Sadeleştirme sonunda hangi terimlerin kaldığını görmek için sadeleşen çarpanların üstünü tek çizgiyle çizmek hata payını sıfıra indirir.

### $x \pm \frac{1}{x}$ Yapıları ve Gizli Payda Bölümlemesi

KPSS'de sık çıkan klasik bir soru tipi, $x^2 - 5x + 1 = 0$ gibi ikinci derece bir denklem verip $x^2 + \frac{1}{x^2}$ değerini sormaktır. Burada denklemin köklerini bulmaya çalışmak yerine tüm terimleri $x$'e bölersin ($x = 0$ kök olmadığı için bölünebilir):

$$x - 5 + \frac{1}{x} = 0 \quad \Rightarrow \quad x + \frac{1}{x} = 5$$

Ardından her iki tarafın karesi alındığında ortadaki $2 \cdot x \cdot \frac{1}{x} = 2$ çarpımı sabit sayıya dönüşür: $x^2 + 2 + \frac{1}{x^2} = 25 \Rightarrow x^2 + \frac{1}{x^2} = 23$. Eğer soru $x - \frac{1}{x}$ üzerinden $x^2 + \frac{1}{x^2}$ isterse kareden $-2$ geleceği için sonuca $+2$ eklenerek $k^2 + 2$ bulunur.

Başka bir önemli sadeleştirme kalıbı da kesrin sadeleştirilmiş hâli verilirken "ifadenin en sade biçimi $\frac{x - 2}{x + 3}$ olduğuna göre $a$ kaçtır?" sorularında ortaya çıkar. Kesir sadeleşebiliyorsa pay ve paydada **ortak bir çarpan** ($x + 3$ gibi) var demektir; sadeleşen çarpanın kökü paydayı da payı da sıfır yapar. Dolayısıyla ortak çarpanın kökünü payda yerine koyup $0$'a eşitleyerek bilinmeyen katsayı saniyeler içinde bulunur. Ayrıca iki terimli kare toplamlarını verilen denklemlerde değişken değiştirmek, örneğin $x^2 + 3x = t$ yazarak yüksek dereceli ifadeyi $(t + 1)(t - 5)$ biçimine indirmek büyük sayılardan kurtarır. İkinci derece üç terimlilerde ($ax^2 + bx + c$) çarpanlar bulunduktan sonra çapraz çarpımların toplamının ortadaki $bx$ terimini birebir verdiğini her zaman kontrol et.

:::tablo
| Verilen | Karesi Alınınca Oluşan | İstenen Kareler Toplamı |
|---|---|---|
| $x + \frac{1}{x} = k$ | $x^2 + 2 + \frac{1}{x^2} = k^2$ | $x^2 + \frac{1}{x^2} = k^2 - 2$ |
| $x - \frac{1}{x} = k$ | $x^2 - 2 + \frac{1}{x^2} = k^2$ | $x^2 + \frac{1}{x^2} = k^2 + 2$ |
| $x + \frac{1}{x} = k$ (küp) | $(x + \frac{1}{x})^3 = k^3$ | $x^3 + \frac{1}{x^3} = k^3 - 3k$ |
:::

:::ornek
$\dfrac{x^2 - 9}{x^2 - 5x + 6} \div \dfrac{x + 3}{x^2 - 4}$ ifadesini en sade biçimine getirelim. Önce tüm ifadeleri çarpanlarına ayırırız: $x^2 - 9 = (x - 3)(x + 3)$, $x^2 - 5x + 6 = (x - 2)(x - 3)$ ve $x^2 - 4 = (x - 2)(x + 2)$. Bölme işaretini çarpmaya çevirip ikinci kesri ters çeviririz: $$\frac{(x - 3)(x + 3)}{(x - 2)(x - 3)} \cdot \frac{(x - 2)(x + 2)}{x + 3}$$ Burada $(x - 3)$, $(x + 3)$ ve $(x - 2)$ çarpanları sadeleşir; sonuç olarak geriye yalnızca $x + 2$ kalır. İkinci örnekte $x^2 - 4x - 1 = 0$ verilirse her terimi $x$'e böleriz: $x - \frac{1}{x} = 4$. Karesini alırsak $x^2 - 2 + \frac{1}{x^2} = 16 \Rightarrow x^2 + \frac{1}{x^2} = 18$ elde edilir.
:::

:::tuzak
$x - \frac{1}{x} = k$ verildiğinde $x^2 + \frac{1}{x^2}$ değerini $k^2 - 2$ diye ezberden yazmak en yaygın tuzaktır; eksi olduğu için ortadaki terim $-2$ çıkar ve karşıya $+2$ olarak geçer ($k^2 + 2$). Ayrıca kesirli sadeleştirme işleminde bölme ($\div$) sembolünden sonra gelen kesri ters çevirmeyi unutup olduğu gibi çarpmak da sonucu tamamen değiştirir.
:::

:::akilda-kalsin
- $ax^2 + bx + c = 0$ denkleminden $x \pm \frac{1}{x}$ türetmek için tüm terimleri $x$'e böl.
- $(x + \frac{1}{x})^2 = x^2 + \frac{1}{x^2} + 2$ iken $(x - \frac{1}{x})^2 = x^2 + \frac{1}{x^2} - 2$ eşittir.
- Kesir sadeleşmesinde bölme varsa ikinci kesri mutlaka ters çevirerek çarp.
- Ortak çarpanla sadeleşen ifadede yok olan çarpanın kökü hem payı hem paydayı sıfır yapar.
:::

:::kontrol
111fb641-a9d8-5b9c-a6cd-abcdd258bd42
112dfddb-1d74-5676-9599-993ae5d842c5
:::

## Bölüm 3: Oran-Orantı Özellikleri ve Ortalama Kavramları

Aynı cins iki çokluğun birbirine bölümüne **oran**, iki veya daha fazla oranın birbirine eşitlenmesine ise **orantı** denir. $\frac{a}{b} = \frac{c}{d} = k$ ifadesinde $k$ sayısına **orantı sabiti** adı verilir. Orantı sorularının çoğunu tek hamlede çözen iki temel özellik vardır:

- **Sabit Katsayı Atama:** $\frac{a}{3} = \frac{b}{5} = \frac{c}{7} = k$ verilirse hemen $a = 3k$, $b = 5k$ ve $c = 7k$ yazarak sorudaki ek denklemde yerine koyarsın. Eğer $3x = 4y = 5z$ gibi çarpım hâlinde verilmişse $3, 4, 5$'in EKOK'u olan $60k$'ya eşitleyerek $x = 20k, y = 15k, z = 12k$ yazmak kesirlerden kurtarır.
- **Payları ve Paydaları Aynı Katsayıyla Toplama:** $\frac{a}{b} = \frac{c}{d} = k$ ise $\frac{m \cdot a + n \cdot c}{m \cdot b + n \cdot d} = k$ eşitliği bozulmaz (payda sıfır olmamak şartıyla). Ancak **orantıdaki terimlerin karesini veya çarpımını alırsan orantı sabiti de etkilenir**: $\frac{a \cdot c}{b \cdot d} = k^2$ ve $\frac{a^2 + c^2}{b^2 + d^2} = k^2$ olur.

### Doğru Orantı, Ters Orantı ve Bileşik Orantı

İki çokluktan biri artarken diğeri de aynı oranda artıyorsa **doğru orantı** ($\frac{x}{y} = k$), biri artarken diğeri aynı oranda azalıyorsa **ters orantı** ($x \cdot y = k$) vardır. Yalnızca "orantılıdır" kelimesi geçiyorsa aksine bir ifade yoksa **doğru orantı** anlaşılır. Aynı soruda hem doğru hem ters orantı varsa **bileşik orantı** denklemi kurulur: örneğin $x$ sayısı $y$ ile doğru, $z$ ile ters orantılıysa $\frac{x \cdot z}{y} = k$ sabit kalır.

### Aritmetik ve Geometrik Ortalama

- **Aritmetik Ortalama (AO):** Sayıların toplamının sayı adedine bölümüdür: $\text{AO} = \frac{a_1 + a_2 + \cdots + a_n}{n}$. Toplam veri sayısıyla ortalamayı çarparak doğrudan gruba ait toplamı bulursun.
- **Geometrik Ortalama (GO):** Pozitif $n$ sayının çarpımının $n$. dereceden köküdür: iki sayı için $\text{GO} = \sqrt{a \cdot b}$. İki pozitif sayının aritmetik ortalaması $10$, geometrik ortalaması $6$ ise hemen $a + b = 20$ ve $a \cdot b = 36$ yazılarak özdeşliklerle $a^2 + b^2$ veya sayılar bulunur.

:::tablo
| Orantı / Ortalama Türü | Matematiksel Bağıntı | Hızlı Kural |
|---|---|---|
| Doğru Orantı ($x, y$) | $\frac{x}{y} = k$ | Çapraz çarpım yapılır |
| Ters Orantı ($x, y$) | $x \cdot y = k$ | Düz çarpım yapılır |
| Bileşik Orantı ($y$ doğru, $z$ ters) | $\frac{x \cdot z}{y} = k$ | İlk ve ikinci durum oranlanır |
| Aritmetik / Geometrik Ortalama ($a, b$) | $\text{AO} = \frac{a+b}{2}$, $\text{GO} = \sqrt{ab}$ | $a + b = 2\text{AO}$ ve $ab = \text{GO}^2$ |
:::

:::ornek
$x$ sayısı $y$ ile doğru, $z$ ile ters orantılıdır. $y = 4$ ve $z = 3$ iken $x = 6$ olduğuna göre $y = 10$ ve $z = 5$ iken $x$ kaç olur? Önce bileşik orantı sabitini kurarız: $x$ ile $y$ doğru (bölüm), $z$ ters (çarpım) olduğu için $\frac{x \cdot z}{y} = k$ sabittir. İlk değerleri yerleştiririz: $\frac{6 \cdot 3}{4} = \frac{18}{4} = \frac{9}{2}$. İkinci durumu aynı sabite eşitleriz: $\frac{x \cdot 5}{10} = \frac{9}{2} \Rightarrow \frac{x}{2} = \frac{9}{2} \Rightarrow x = 9$ bulunur.
:::

:::kodlama
**DOĞRUDA BÖL, TERSTE ÇARP**: Doğru orantılı çokluklar birbirine bölünür ($\frac{x}{y} = k$), ters orantılı çokluklar ise yan yana çarpılır ($x \cdot y = k$). İşçi sayısı ile duvar örme süresini karıştırma: yapılan iş artınca süre artar (doğru), işçi artınca süre azalır (ters).
:::

:::tuzak
$\frac{a}{b} = \frac{c}{d} = k$ verildiğinde $\frac{a \cdot c}{b \cdot d}$ değerini yine $k$ almak en yaygın hatadır; iki oranın çarpımından dolayı sonuç $k^2$ olur. Ayrıca ters orantılı paylaştırmada ($3$ ve $5$ ile ters orantılı) sayıları $3k$ ve $5k$ almak yerine $\frac{k}{3}$ ve $\frac{k}{5}$ ya da EKOK üzerinden $5m$ ve $3m$ yazmalısın.
:::

:::akilda-kalsin
- $\frac{a}{3} = \frac{b}{5} = \frac{c}{7} = k$ eşitliğinde $a = 3k, b = 5k, c = 7k$ yazarak tüm bilinmeyenleri tek harfe indirge.
- İki oranın çarpımında veya kareleri toplamında orantı sabiti $k$ değil $k^2$ olur.
- Doğru orantı bölüm, ters orantı çarpım biçiminde sabitlenir.
- İki pozitif sayının $\text{AO}$'sunu $2$ ile çarpınca toplamı, $\text{GO}$'sunun karesini alınca çarpımı elde edersin.
:::

:::kontrol
115321b6-b433-51bd-9e7f-e9cb828961b8
1a7ec293-52a9-5c25-8961-dfef78401b18
:::
