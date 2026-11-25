---
lesson: Matematik & Geometri
topic: Basit Eşitsizlikler ve Mutlak Değer
exam_scopes: [b_grubu_gygk]
sources:
  - "ÖSYM 2026 KPSS Lisans Kılavuzu (konu kapsamı)"
  - "MEB Ortaöğretim Matematik Ders Kitapları (yalnızca kavram ve formül doğrulama)"
---

## Bölüm 1: Aralık Kavramı ve Basit Eşitsizliklerin Temel Kuralları

Sayı doğrusunda iki sınır arasındaki tüm gerçel sayıları gösteren yapıya **aralık** denir. Sınır değerleri aralığa dahilse kapalı parantez $[a, b]$ ve dolu nokta ($\le$ veya $\ge$), dahil değilse açık parantez $(a, b)$ ve boş çember ($<$ veya $>$) kullanılır. Eşitsizliklerin neredeyse tamamı denklem kurallarına benzer şekilde çözülür, ancak üç noktada keskin biçimde ayrılır:

1. Eşitsizliğin her iki yanına aynı sayı eklenebilir veya çıkarılabilir; yön değişmez. 2. Eşitsizliğin her iki yanı **pozitif** bir sayıyla çarpılır veya bölünürse yön değişmez; ancak **negatif bir sayıyla çarpılır veya bölünürse eşitsizlik mutlaka yön değiştirir**. 3. Eşitsizliğin her iki yanında **aynı işaretli** ($a \cdot b > 0$) iki sayı varsa ve ikisini de ters çevirirsen ($\frac{1}{a}$ ve $\frac{1}{b}$) eşitsizlik yön değiştirir ($2 < 4 \Rightarrow \frac{1}{2} > \frac{1}{4}$). Ancak biri negatif biri pozitifken ters çevirmede yön değişmez ($-2 < 3 \Rightarrow -\frac{1}{2} < \frac{1}{3}$).

:::sekil Şekil 1. Sayı doğrusunda açık ve kapalı uçlu aralık gösterimi ($-1 \le x < 4$)
{"kind":"numberline","min":-3,"max":6,"step":1,"intervals":[{"from":-1,"to":4,"fromOpen":false,"toOpen":true}]}
:::

### Aralıklarla Toplama, Çıkarma, Kare Alma ve Çarpma

İki eşitsizlik arasında **taraf tarafa toplama** yapılabilir; sınırların dahil olup olmadığını belirlerken yalnızca her iki uç da kapalı ($\le$) ise sonuç kapalı kalır, uçlardan biri bile açıksa ($<$) sonuç açık uçlu olur. Buna karşılık **taraf tarafa çıkarma ve bölme kesinlikle yapılmaz!** Çıkarma sorulduğunda ($x - y$) önce ikinci eşitsizliği $-1$ ile çarpıp yönünü çevirir ($-y$'nin aralığını bulur), ardından taraf tarafa toplarsın.

Bir aralığın **karesi** ($x^2$) alınırken kritik bir kural vardır: eğer $x$ aralığı negatiften pozitife geçiyorsa ($-3 < x < 4$ gibi) aralık içinde $0$ bulunduğu için $x^2$'nin alabileceği en küçük değer **$0$ olur** ve $0 \le x^2$ biçiminde dahil edilir; üst sınır ise sınırların karelerinden büyük olanı alınarak belirlenir ($0 \le x^2 < 16$). İki gerçel aralığın **çarpım** aralığı ($x \cdot y$) bulunurken de uçların tüm dört olası ikili çarpımı hesaplanır; bu dört sonuçtan en küçüğü alt sınır, en büyüğü üst sınır olur.

Bir sayının karesi kendisinden küçükse ($a^2 < a$), bu sayı mutlaka **$0 < a < 1$** aralığındaki pozitif bir basit kesirdir. Tersi olarak $a^2 > a$ ise $a < 0$ veya $a > 1$ olur. Bu kalıp KPSS'de hemen her yıl aralık daraltma veya kesinlik sorusu olarak karşımıza çıkar.

:::tablo
| İfade / İşlem | Kural | Kritik Örnek |
|---|---|---|
| Negatif ile çarpma/bölme | Yön kesinlikle değişir | $\frac{2x-5}{-3} \ge 1 \Rightarrow 2x-5 \le -3$ |
| $x \in (-3, 4)$ iken $x^2$ aralığı | $0$ aralıkta ise alt sınır $0 \le x^2$ olur | $-3 < x < 4 \Rightarrow 0 \le x^2 < 16$ |
| $x - y$ aralığı bulma | $-y$ aralığını bulup $x$ ile topla | Taraf tarafa çıkarma yasaktır |
| $a^2 < a$ koşulu | Sayı $0$ ile $1$ arasındadır | $0 < a < 1$ |
:::

:::ornek
$x$ ve $y$ gerçel sayıları için $-3 < x < 4$ ve $-2 < y < 5$ olsun; $x^2 - 2y$ ifadesinin alabileceği en küçük ve en büyük tam sayı değerlerini inceleyelim. Burada $x$ ve $y$ **gerçel sayı** olduğu için başlangıçta $x$ veya $y$'ye tam sayı değeri seçmek yasaktır! Önce aralıkları üretiriz: $-3$ ile $4$ arasında $0$ bulunduğundan $0 \le x^2 < 16$ olur (çünkü $(-3)^2 = 9$ ve $4^2 = 16$). Sonra $-2 < y < 5$ eşitsizliğini $-2$ ile çarpıp yön değiştiririz: $-10 < -2y < 4$. İkisini taraf tarafa toplarsak $-10 < x^2 - 2y < 20$ bulunur. Böylece aralıktaki en küçük tam sayı $-9$, en büyük tam sayı $19$ olur. Eğer $a^2 < a$ verilirse $0 < a < 1$ yazıp $6a - 1$ aralığını $-1 < 6a - 1 < 5$ şeklinde buluruz.
:::

:::kodlama
**TAM SAYI İSE SEÇ, GERÇEL SAYI İSE ARALIK KUR**: Soru kökünde "tam sayı" yazıyorsa doğrudan uygun tam sayıları seç; "gerçel sayı" yazıyorsa asla tekil değer seçme, istenen ifadeyi aralık işlemleriyle sıfırdan üret!
:::

:::tuzak
Üç büyük hata sürekli tuzak olarak kurulur: Birincisi, $-3 < x < 4$ aralığının karesini alırken alt sınırı $(-3)^2 = 9$ yazıp $9 < x^2 < 16$ demektir; oysa aralıkta $0$ olduğu için $x^2$ en az $0$ olur ($0 \le x^2 < 16$). İkincisi, "gerçel sayı" sorusunda tam sayı seçmeye çalışarak ara kesirli değerlerin ürettiği tam sayıları kaçırmaktır. Üçüncüsü, $\frac{2x-5}{-3} \ge 1$ işleminde $-3$ ile çarparken $\ge$ işaretini $\le$ yapmayı unutmaktır.
:::

:::akilda-kalsin
- Eşitsizliği negatif sayıyla çarparken veya bölerken yön mutlaka ters döner.
- Taraf tarafa çıkarma yapılmaz; eksili eşitsizliği $-1$ ile çarpıp taraf tarafa topla.
- Negatiften pozitife geçen aralığın karesi alınırken alt sınır her zaman $0 \le x^2$ olur.
- Tam sayı sorularında baştan değer seçilir; gerçel sayı sorularında önce aralık üretilir.
:::

:::kontrol
0467e393-e83e-568a-9b94-c9796d20c159
0feda377-f0b4-57cc-aa55-d1eb8f96e890
:::

## Bölüm 2: Mutlak Değer Tanımı, Özellikleri ve Sıfır Eşitliği

Bir $x$ gerçel sayısının sayı doğrusunda başlangıç noktası olan $0$'a uzaklığına $x$'in **mutlak değeri** denir ve $\lvert x \rvert$ ile gösterilir. Uzaklık hiçbir zaman negatif olamayacağından $\lvert x \rvert \ge 0$'dır. Mutlak değerin parçalı tanımı tüm mutlak değer sorularının anahtarıdır:

$$\lvert x \rvert = x \quad (x \ge 0 \text{ ise, aynen çıkar})$$

$$\lvert x \rvert = -x \quad (x < 0 \text{ ise, eksi ile çarpılıp çıkar})$$

Burada "$-x$" ifadesi sonucun negatif olduğu anlamına gelmez; $x$ zaten negatif olduğu için önündeki eksi onu pozitife çevirir (örneğin $x = -5$ iken $\lvert x \rvert = -(-5) = 5$). Bu nedenle mutlak değerin içini sıfırın sağında mı solunda mı olduğuna göre işaret inceleyip pozitifse **olduğu gibi**, negatifse **tüm terimlerin işaretini değiştirerek** dışarı çıkarmalısın.

### Mutlak Değerin Temel Özellikleri ve İç İçe Mutlak Değer

Mutlak değerin en çok kullanılan cebirsel özellikleri şunlardır:

- $\lvert -x \rvert = \lvert x \rvert$ ve $\lvert x - y \rvert = \lvert y - x \rvert$ (çıkarma işleminde sıra değişse bile uzaklık değişmez).
- $\lvert x \cdot y \rvert = \lvert x \rvert \cdot \lvert y \rvert$ ve $\lvert \frac{x}{y} \rvert = \frac{\lvert x \rvert}{\lvert y \rvert}$ ($y \neq 0$).
- $\sqrt{x^2} = \lvert x \rvert$ (çift dereceli kökten çıkan ifade mutlaka mutlak değerle çıkar).
- **Sıfır Toplam Özelliği:** $\lvert A \rvert + \lvert B \rvert = 0$ (veya mutlak değer ile çift kuvvet toplamı $0$) ise ikisi de negatif olamayacağından **hem $A = 0$ hem de $B = 0$** olmak zorundadır.

Eğer mutlak değerin içi başka bir mutlak değer içeriyorsa ya da harfli sıralama ($a < 0 < b$ ve $\lvert a \rvert > b$) verilmişse, sayı vererek değil kesin işaret ve büyüklük karşılaştırmasıyla ilerle: $\lvert a \rvert > b$ ve $a$ negatifse $a$'nın mutlak uzaklığı $b$'den fazladır, yani $a + b < 0$ kesindir!

:::tablo
| İfade | İçinin İşareti | Dışarı Çıkış Biçimi |
|---|---|---|
| $\lvert x - y \rvert$ ($x < y$ ise) | Negatif | $y - x$ |
| $\lvert x - y \rvert$ ($x > y$ ise) | Pozitif | $x - y$ |
| $\lvert x \rvert + \lvert y \rvert = 0$ | Her ikisi $\ge 0$ | $x = 0$ ve $y = 0$ |
| $\lvert x - a \rvert$ geometrik anlamı | Uzaklık | $x$'in $a$'ya olan uzaklığı |
:::

:::ornek
$x < 0 < y$ olmak üzere $\lvert x - y \rvert + \lvert x \rvert - \lvert y \rvert$ ifadesini sadeleştirelim. Önce her mutlak değerin içinin işaretini belirleriz: $x$ negatif, $y$ pozitif olduğundan $x - y < 0$ (negatif), $x < 0$ (negatif), $y > 0$ (pozitif). Şimdi işaretlere göre dışarı çıkarırız: ilk mutlak değer eksi ile çarpılarak $-(x - y) = -x + y$, ikinci mutlak değer $-x$, üçüncü mutlak değer olduğu gibi $y$ çıkar. Başındaki eksiyle birleştirirsek $(-x + y) + (-x) - (y) = -2x$ sonucunu elde ederiz. Başka bir soru tipinde $\lvert 2x - 6 \rvert + \lvert y + 4 \rvert = 0$ verilseydi her iki mutlak değer sıfır olacağından $2x - 6 = 0 \Rightarrow x = 3$ ve $y + 4 = 0 \Rightarrow y = -4$ çıkar, çarpımları $3 \cdot (-4) = -12$ olurdu.
:::

:::tuzak
$x < 0 < y$ veriliyorken $\lvert x \rvert$ ifadesini sadece $x$ diye çıkarmak veya $-\lvert y \rvert$ önündeki eksiyi yok saymak en büyük işaretleme hatalarıdır. Mutlak değeri kaldırırken önüne normal parantez koyup dışındaki işareti paranteze dağıtarak yazarsan işaret hatası yapmazsın. Ayrıca $\lvert a \rvert > b$ gibi bir şart varken $a + b$'nin işaretini soran sorularda sayı denerken $\lvert a \rvert > \lvert b \rvert$ koşulunu sağlamayan sayılar seçmek yanlış yargıya götürür.
:::

:::akilda-kalsin
- Mutlak değer bir uzaklıktır; sonucu asla negatif olamaz ($\lvert A \rvert \ge 0$).
- Dışarı çıkarırken önce içerideki ifadenin işaretini test et: pozitifse aynen, negatifse eksiyle çarparak çıkar.
- İki mutlak değerin toplamı $0$ ise ayrı ayrı ikisinin de içi sıfırdır.
- Çift dereceli kökten çıkan ifade doğrudan $x$ değil $\lvert x \rvert$ olarak çıkar.
:::

:::kontrol
1137f2b8-e8e0-57b6-9b5e-6a4f953c6c14
2180a9a2-74b5-5dec-8ea2-0147321ccfc3
:::

## Bölüm 3: Mutlak Değerli Denklemler ve Eşitsizlikler

Mutlak değerli denklemlerde tek temel kural vardır: $a \ge 0$ iken $\lvert f(x) \rvert = a$ denklemi **ya $f(x) = a$ ya da $f(x) = -a$** çözümlerini verir. Eğer mutlak değer negatif bir sayıya eşitlenmişse ($\lvert x - 2 \rvert = -3$) çözüm kümesi **boş kümedir**. Eğer $\lvert f(x) \rvert = g(x)$ biçiminde sağ tarafta da değişken varsa, bulduğun $x$ değerlerini $g(x) \ge 0$ şartında mutlaka yerine koyup kontrol etmelisin; $g(x)$'i negatif yapan kök **alınmaz**. İki mutlak değer birbirine eşitse ($\lvert f(x) \rvert = \lvert g(x) \rvert$) yine $f(x) = g(x)$ veya $f(x) = -g(x)$ çözülür ve burada sağ taraf kontrolüne gerek yoktur.

### Mutlak Değerli Eşitsizliklerin İki Kalıbı

Mutlak değerli eşitsizliklerde iki temel kalıp vardır ($a > 0$):

- **Küçüktür kalıbı ($\lvert f(x) \rvert < a$ veya $\le a$):** İfade $-a$ ile $+a$ arasına sıkışır: $-a < f(x) < a$.
- **Büyüktür kalıbı ($\lvert f(x) \rvert > a$ veya $\ge a$):** İfade $a$'nın sağında veya $-a$'nın solunda iki ayrı bölgededir: $f(x) > a$ veya $f(x) < -a$.

Çift taraflı mutlak değer eşitsizliği ($2 < \lvert x - 1 \rvert \le 5$ gibi) hem alttan hem üstten sınırlıdır. Bu durumda ya doğrudan $2 < x - 1 \le 5$ veya $-5 \le x - 1 < -2$ şeklinde **iki ayrı simetrik bölge** yazılır; ya da mutlak değerin uzaklık anlamı kullanılarak "$1$ noktasına uzaklığı $2$'den büyük, en fazla $5$ birim olan sayılar" düşünülür: sağ kolda $\{4, 5, 6\}$, sol kolda $\{-4, -3, -2\}$ olmak üzere toplam $6$ tam sayı elde edilir. Benzer şekilde $\lvert x - a \rvert + \lvert x - b \rvert$ toplamının alabileceği **en küçük değer**, $x$ değeri $a$ ile $b$ arasına seçildiğinde oluşan iki nokta arasındaki uzaklık yani $\lvert a - b \rvert$'dir. Eğer kesirli bir ifadede pay ve paydada aynı ifadenin mutlak değeri varsa ($\frac{1}{\lvert x - 2 \rvert} > \frac{1}{4}$ gibi) pozitif terimlerle içler-dışlar çarpımı yaparak doğrudan $\lvert x - 2 \rvert < 4$ ($x \neq 2$ şartıyla) yazabilirsin.

:::sekil Şekil 2. $2 < \lvert x - 1 \rvert \le 5$ eşitsizliğinin sayı doğrusundaki simetrik iki bölgesi
{"kind":"numberline","min":-5,"max":7,"step":1,"intervals":[{"from":-4,"to":-1,"fromOpen":false,"toOpen":true},{"from":3,"to":6,"fromOpen":true,"toOpen":false}]}
:::

:::ornek
Sayı doğrusunda $3$ noktasına olan uzaklığı en fazla $5$ birim olan kaç tam sayı vardır? "Uzaklığı en fazla $5$" ifadesi mutlak değerle $\lvert x - 3 \rvert \le 5$ şeklinde yazılır. Küçüktür kalıbı gereği $-5 \le x - 3 \le 5$ olur. Her tarafa $3$ eklersek $-2 \le x \le 8$ aralığı elde edilir. Bu aralıktaki tam sayıların sayısı $8 - (-2) + 1 = 11$ adettir. Başka bir örnekte $\lvert x - 2 \rvert < 3$ ve $2x + y = 7$ koşulları verilsin: önce $-3 < x - 2 < 3 \Rightarrow -1 < x < 5$ yazarız. $y = 7 - 2x$ olduğundan $x$ aralığından $-2x$ üretiriz ($-10 < -2x < 2$), ardından $7$ ekleyerek $-3 < y < 9$ buluruz. Aralıktaki $y$ tam sayıları $-2$'den $8$'e kadar $11$ tanedir.
:::

:::tuzak
İki tuzak adayın yarısını eler: Birincisi, $\lvert x - 2 \rvert = 2x - 7$ gibi sağ tarafında bilinmeyen bulunan denklemde bulduğun her kökü kontrol etmemektir; örneğin $x = 3$ için sağ taraf $-1$ çıkıyorsa o kök **geçersizdir**. İkincisi, $2 < \lvert x - 1 \rvert \le 5$ gibi çift eşitsizliklerde yalnızca pozitif kolu ($3 < x \le 6$) alıp negatif simetrik kolu ($-4 \le x < -1$) unutmak veya açık-kapalı sınırları karıştırıp boş çemberli uçları da tam sayı sayısına katmaktır.
:::

:::akilda-kalsin
- $\lvert A \rvert = a$ ($a \ge 0$) için $A = a$ veya $A = -a$ çözülür; $a < 0$ ise çözüm boş kümedir.
- Sağ tarafta $x$ varsa bulunan kökleri $g(x) \ge 0$ şartıyla mutlaka doğrula.
- $\lvert A \rvert < a \Leftrightarrow -a < A < a$; $\lvert A \rvert > a \Leftrightarrow A > a \text{ veya } A < -a$.
- $\lvert x - c \rvert \le r$ ifadesi "$c$ noktasına uzaklığı en fazla $r$ birim olan sayılar" demektir.
:::

:::kontrol
265f37b2-2c1f-56bb-b27c-ec8a15a38699
31086a42-4cb6-5f15-b037-629adf089941
:::
