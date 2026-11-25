---
lesson: Matematik & Geometri
topic: Permütasyon, Kombinasyon ve Olasılık
exam_scopes: [b_grubu_gygk]
sources:
  - "ÖSYM 2026 KPSS Lisans Kılavuzu (konu kapsamı)"
  - "MEB Ortaöğretim Matematik Ders Kitapları (yalnızca kavram ve formül doğrulama)"
---

## Bölüm 1: Sayma İlkeleri ve Permütasyon (Sıralama)

Sayma sorularında önce iki temel ilkeyi doğru ayırt etmek gerekir: Bir iş $m$ farklı yolla, başka bir iş $n$ farklı yolla yapılabiliyorsa "veya" durumunda ($A$ ya da $B$'den **birini** seçme) seçenekler **toplanır** ($m + n$); "ve" durumunda ($A$ ve $B$'yi **art arda** gerçekleştirme) seçenekler **çarpılır** ($m \cdot n$). Örneğin $A$'dan $B$'ye $3$, $B$'den $C$'ye $4$ yol varsa $A$'dan $C$'ye $3 \cdot 4 = 12$ farklı gidiş yolu vardır; eğer gidip dönülecek ve gidilen yollar dönüşte kullanılmayacaksa dönüşte $(4 - 1) \cdot (3 - 1) = 6$ yol kalır, toplam $12 \cdot 6 = 72$ gidiş-dönüş oluşur.

### Basamaklı Sayı Yazma ve Sıfır/Çift Koşulu

Küme elemanlarıyla rakamları farklı sayı yazma sorularında **en kısıtlı basamaktan** (önce çiftlik için birler basamağından, sıfır varsa yüzler/binler basamağından) başlanır:

- Kümede **$0$ varsa ve çift sayı** isteniyorsa birler basamağı **$0$ olma durumu** ile **diğer çift rakamlar** mutlaka ayrı hesaplanıp toplanır! Çünkü $0$ birler basamağında kullanıldığında en başa zaten gelemeyeceği için sorun çıkarmaz; ancak birler basamağında $2$ veya $4$ kullanıldığında en soldaki basamağa $0$ gelemeyeceğinden bir seçenek eksilir.

### Permütasyon, Yan Yana Gelme ve Ayrık Durumlar

$n$ farklı elemanın $r$ tanesinin **sıralı diziliş sayısına** permütasyon denir: $P(n, r) = \frac{n!}{(n - r)!}$ ve tüm elemanların yan yana dizilişi $n!$'dir. İki standart koşul sık sorulur:

- **Belirli nesneler yan yana olsun:** Yan yana olması istenen grup tek bir paket gibi bağlanır, grup sayısı faktöriyel alınır ve paketin kendi içindeki diziliş faktöriyeli ile çarpılır.
- **Hiçbir ikisi yan yana gelmesin ($3$ erkek ve $3$ kız, hiçbir iki kız yan yana değil):** Önce kısıtsız grup ($3$ erkek) dizilir ($3!$). Ardından erkeklerin aralarında ve uçlarında oluşan $4$ boşluktan $3$'üne kızlar yerleştirilir: $P(4, 3)$ ya da $\binom{4}{3} \cdot 3!$.

Tekrarlı dizilişlerde ($KELEBEK$ kelimesi gibi) toplam harf sayısının faktöriyeli, tekrar eden her harfin kendi adedinin faktöriyel çarpımına bölünür (**tekrarlı permütasyon**).

:::tablo
| Koşul | Yöntem | Örnek Sonuç |
|---|---|---|
| Kümede $0$ var, çift sayı | Birler basamağı $= 0$ ve $\neq 0$ ayrı çözülür | İki durum toplanır |
| $3$ kişi yan yana | Grubu tek kişi sayıp içini de sırala | Grup $1$ kişi + iç sıralama $3!$ |
| Hiçbir $2$ kız yan yana değil | Önce erkekleri diz, boşluklara kızları koy | $3! \cdot P(4, 3)$ |
| Tekrarlı permütasyon | $\frac{n!}{a! \cdot b! \cdot c!}$ | Aynı nesnelerin yer değişimi bölünür |
:::

:::ornek
$A = \{0, 1, 2, 3, 4, 5\}$ kümesinin elemanları kullanılarak rakamları birbirinden farklı üç basamaklı kaç çift doğal sayı yazılabilir? Birler basamağında $0$ özel durum olduğu için iki ayrı parçada çözeriz. Birinci durum: birler basamağı $0$ olsun ($1$ seçenek). Kalan $5$ rakamdan yüzler basamağına $5$, onlar basamağına $4$ rakam gelir: $5 \cdot 4 \cdot 1 = 20$ sayı. İkinci durum: birler basamağı $2$ veya $4$ olsun ($2$ seçenek). Yüzler basamağına $0$ ve seçilen son rakam gelemeyeceği için $4$ seçenek kalır; onlar basamağına ise $0$ geri dönebildiği için yine $4$ seçenek kalır: $4 \cdot 4 \cdot 2 = 32$ sayı. Toplam: $20 + 32 = 52$ çift sayı yazılabilir.
:::

:::kodlama
**SIFIR VARSA BÖL, YOKSA ÇARP**: Çift sayı yazarken kümede $0$ varsa "sonu $0$ olanlar" ve "sonu diğer çiftler olanlar" diye iki parçaya bölmeden tek kutuda çarpma yapma; aksi hâlde yüzler basamağında $0$ hatası yaparsın.
:::

:::tuzak
"Hiçbir iki kız yan yana gelmesin" sorusunu "tüm durumlar eksi kızların hepsinin yan yana olduğu durum" şeklinde çözmek yalnızca $2$ kız varsa doğrudur! $3$ veya daha fazla kız varsa iki kız yan yana gelip üçüncü ayrı durduğunda da şart bozulur; bu yüzden $3+$ nesnede mutlaka önce karşı grubu dizip boşluklara yerleştirme tekniğini kullan.
:::

:::akilda-kalsin
- "Veya" bağlacında durumlar toplanır, "ve" (art arda) bağlacında çarpılır.
- Rakamları farklı çift sayı yazımında kümede $0$ varsa son basamağı $0$ ve diğer çiftler diye ayır.
- Yan yana olma şartında grubu bağla (tek paket say) ve grup içi sıralamayla çarp.
- Hiçbir ikisi yan yana gelmesin sorularında önce diğer grubu diz, sonra oluşan boşluklara yerleştir.
:::

:::kontrol
0c01e680-f9a5-5514-a18e-7d77326c282c
19622c51-82c5-517b-a18a-69680c06fcc1
:::

## Bölüm 2: Kombinasyon (Seçme) ve Geometrik Sayma

**Permütasyon** sıralama yapar; **kombinasyon** ise sıranın önemli olmadığı **grup/ekip seçimi** yapar. $n$ elemandan $r$ eleman seçme sayısı şöyle hesaplanır:

$$C(n, r) = \binom{n}{r} = \frac{n!}{(n - r)! \cdot r!}$$

Temel özellikler hesap hızını çok artırır: $\binom{n}{0} = \binom{n}{n} = 1$, $\binom{n}{1} = n$ ve simetri kuralı gereği **$\binom{n}{r} = \binom{n}{n - r}$** (örneğin $\binom{10}{8}$ yerine $\binom{10}{2} = \frac{10 \cdot 9}{2} = 45$ hesaplanır). Ayrıca bir kümenin tüm alt kümeleri seçiminin toplamı $2^n$'dir ($\binom{n}{0} + \binom{n}{1} + \cdots + \binom{n}{n} = 2^n$).

### En Az / En Çok ve Birlikte Bulunmama Şartları

Kombinasyon problemlerinde iki kalıp sürekli sorulur: 1. **"En az $2$ doktor" (Ekip Seçimi):** $4$ kişilik ekipte en az $2$ doktor isteniyorsa tüm geçerli dağılımlar ($2$ doktor $2$ hemşire $+$ $3$ doktor $1$ hemşire $+$ $4$ doktor $0$ hemşire) ayrı ayrı çarpılıp toplanır; ya da çok fazla durum varsa **Tüm Seçimler $-$ İstenmeyen Durumlar** ($0$ ve $1$ doktor) çıkarılır. 2. **"Ali ve Veli aynı ekipte bulunmasın":** En temiz yol tüm $3$ kişilik seçimlerden, Ali ve Veli'nin **ikisinin de birlikte** bulunduğu seçimleri çıkarmaktır: $\binom{7}{3} - \binom{5}{1}$ (çünkü ikisi seçilince yanlarına kalan $5$ kişiden $1$ kişi seçilir). "Biri varsa diğeri mutlaka olsun" ya da "ikisi ya birlikte gelsin ya hiçbiri gelmesin" gibi şartlar da aynı mantıkla ayrı durumlara ayrılır.

### Geometrik Kombinasyon (Doğru, Üçgen ve Dörtgen Sayma)

Herhangi $3$'ü doğrusal olmayan $n$ noktadan en fazla **$\binom{n}{2}$ doğru** ve **$\binom{n}{3}$ üçgen** geçer. Eğer noktaların $k$ tanesi aynı doğru üzerindeyse, o doğru üzerindeki noktalar tek bir doğru oluşturacağı için doğru sayısı $\binom{n}{2} - \binom{k}{2} + 1$ olur; üçgen sayısı ise doğrusal noktalardan üçgen çıkmayacağı için $\binom{n}{3} - \binom{k}{3}$ şeklinde hesaplanır. Paralel iki doğru grubundan ($m$ yatay, $n$ dikey) oluşan **paralelkenar / dikdörtgen sayısı** ise $\binom{m}{2} \cdot \binom{n}{2}$ formülüyle bulunur.

Özdeş nesnelerin dağılımı veya "en az $1$'er tane vermek şartıyla" paylaştırma gibi ek soru tiplerinde de her çocuğa önce $1$'er nesne verilip kalanları dağıtmak ayraç yönteminin temelidir. Örneğin $3$ farklı hediyeyi $5$ çocuğa her çocuk en fazla $1$ hediye alacak şekilde dağıtmak $P(5, 3)$ iken, herhangi bir sınırlama yoksa her hediye $5$ çocuğa gidebileceğinden $5^3$ olur. Benzer şekilde bir masada veya rafta "belirli $3$ kitap kendi içinde alfabetik ya da boy sırasına göre dizilsin" deniyorsa o $3$ kitap kendi aralarında yalnızca tek bir sırada durabileceğinden tüm diziliş sayısı $n!$'i $3!$'e bölerek sonuca ulaşırsın.

:::tablo
| Geometrik / Seçim Durumu | Formül | Kritik Not |
|---|---|---|
| $n$ noktadan doğru ($k$ doğrusal var) | $\binom{n}{2} - \binom{k}{2} + 1$ | Doğrunun kendisi için $+1$ eklenir |
| $n$ noktadan üçgen ($k$ doğrusal var) | $\binom{n}{3} - \binom{k}{3}$ | Üçgen oluşmadığı için $+1$ eklenmez |
| $m$ paralel ile $n$ paralel kesişimi | $\binom{m}{2} \cdot \binom{n}{2}$ | Her $2$ yatay ve $2$ dikey $1$ paralelkenar kurar |
| $n$ farklı doğru en çok kaç noktada kesişir | $\binom{n}{2}$ | Çember veya paralel şartı yoksa |
:::

:::ornek
$4$ doktor ve $5$ hemşire arasından içinde en az $2$ doktor bulunan $4$ kişilik bir sağlık ekibi kaç farklı biçimde seçilebilir? En az $2$ doktor şartı üç durumu kapsar: ($2$ doktor ve $2$ hemşire), ($3$ doktor ve $1$ hemşire), ($4$ doktor ve $0$ hemşire). Her birini kombinasyonla hesaplayıp toplarız: $\binom{4}{2}\binom{5}{2} + \binom{4}{3}\binom{5}{1} + \binom{4}{4}\binom{5}{0} = 6 \cdot 10 + 4 \cdot 5 + 1 \cdot 1 = 60 + 20 + 1 = 81$ farklı ekip oluşturulabilir. Çember üzerinde $6$ farklı nokta verildiğinde ise doğrusal $3$ nokta olmayacağı için çizilebilecek üçgen sayısı doğrudan $\binom{6}{3} = 20$'dir.
:::

:::tuzak
İki klasik hata puan kaybettirir: Birincisi, doğrusal noktalar içeren doğru sayma sorusunda $\binom{n}{2} - \binom{k}{2}$ yazdıktan sonra o doğrusal noktaların üzerinde yer aldığı doğrunun kendisi için **$+1$** eklemeyi unutmaktır. İkincisi, "Ali ve Veli aynı ekipte bulunmasın" dendiğinde tüm seçimlerden $\binom{5}{1}$ çıkarmak yerine yanlışlıkla sadece "ikisi de olmasın" ($\binom{5}{3}$) almaktır; oysa yalnızca Ali'nin olup Veli'nin olmadığı ekipler de geçerlidir.
:::

:::akilda-kalsin
- Sıra önemli değilse kombinasyon ($\binom{n}{r}$), sıra önemliyse permütasyon ($P(n,r)$) kullan.
- $\binom{n}{r} = \binom{n}{n-r}$ eşitliği büyük sayılarda hesabı yarıya indirir.
- "En az $k$" veya "aynı anda bulunmasın" sorularında tüm durumdan istenmeyeni çıkarmak çoğu zaman en hızlı yoldur.
- Doğrusal noktalardan doğru sayarken $+1$ ekle, üçgen sayarken ekleme.
:::

:::kontrol
2252e027-c1bd-5f5a-b6e5-c64dcf131a4c
2f1198c0-8beb-5d53-b5ed-78a449d73b5e
:::

## Bölüm 3: Olasılık Hesabı, Koşullu Olasılık ve Torba Aktarımları

Bir deneyin olası bütün sonuçlarının kümesine **örnek uzay ($E$)**, bizden istenen alt kümeye ise **olay ($A$)** denir. Eş olası bir örnek uzayda $A$ olayının gerçekleşme olasılığı:

$$P(A) = \frac{s(A)}{s(E)} \qquad \text{ve} \qquad 0 \le P(A) \le 1$$

İmkânsız olayın olasılığı $0$, kesin olayın olasılığı $1$'dir. Bir olayın gerçekleşme olasılığı ile gerçekleşmeme olasılığının toplamı daima $1$ olduğundan (**$P(A) + P(A') = 1$**), "en az bir tane kırmızı gelsin" veya "en az bir soru doğru çözülsün" gibi sorularda **$1 - P(\text{hiçbiri gelmesin})$** yöntemini kullanmak bütün alt durumları tek tek hesaplamaktan kurtarır.

### Bağımsız Olaylar, Ardışık Çekim ve Torbadan Torbaya Aktarım

Birden fazla deney veya çekim yapıldığında şu kurallar geçerlidir:

- **Bağımsız Olaylar:** Zar ve madeni para birlikte atıldığında sonuçlar birbirini etkilemez; birlikte gerçekleşme olasılıkları çarpılır ($P(A \text{ ve } B) = P(A) \cdot P(B)$). "Veya" durumunda ise $P(A \cup B) = P(A) + P(B) - P(A \cap B)$ unutulmamalıdır.
- **Geri Atılmadan Çekim:** Torbadan art arda çekilen bilyeler geri konmuyorsa her adımda hem paydadaki toplam bilye sayısı hem de aynı renkten çekildiyse pay $1$ azalır. Eğer çekim sırası verilmemişse ("biri kırmızı biri beyaz") kombinasyonla $\frac{\binom{k}{1}\binom{b}{1}}{\binom{n}{2}}$ yapmak ya da çekim olasılığını sıra sayısıyla ($2!$) çarpmak gerekir!
- **A Torbasından B Torbasına Aktarım:** $A$'dan rastgele $1$ bilye çekilip $B$'ye atılıyor, sonra $B$'den çekiliyorsa **iki ayrı senaryo** mutlaka toplanır: ($A$'dan kırmızı çekilip $B$'den istenen çekilme) $+$ ($A$'dan beyaz çekilip $B$'den istenen çekilme). Burada $B$ torbasının toplam bilye sayısının $1$ arttığını unutma!

### Koşullu Olasılık

Soru içinde **"bilindiğine göre"**, **"olduğu biliniyorsa"** veya **"seçilen kişinin gözlüklü olduğu bilindiğine göre"** gibi bir ön bilgi varsa örnek uzay küçülür! Tüm sınıf yerine yalnızca **koşulu sağlayan alt küme** paydaya yazılır: $P(A \mid B) = \frac{s(A \cap B)}{s(B)}$. Örneğin iki zar atıldığında toplamın $8$ olduğu biliniyorsa paydaya $36$ değil yalnızca toplamı $8$ yapan $5$ durum ($2+6, 3+5, 4+4, 5+3, 6+2$) yazılır ve bunların içinde zarların eşit olduğu ($4+4$) tek durum varsa olasılık $\frac{1}{5}$ olur. Benzer şekilde $3$ madeni para atıldığında en az birinin yazı geldiği biliniyorsa örnek uzay $8$ yerine $7$'ye düşer (TTT dışlanır).

### Sayısal ve Geometrik Olasılık Soruları

Rakamlarla oluşturulan sayılar arasından seçilen bir sayının çift veya $5$'e bölünebilir olma olasılığı sorulduğunda hem paydaki istenen sayı adedi hem de paydadaki tüm sayı adedi sayma ilkeleriyle hesaplanır. Geometrik olasılıklarda ise (örneğin bir hedef tahtasına atılan okun taralı alana isabet etmesi) olasılık doğrudan $\frac{\text{İstenen Taralı Alan}}{\text{Toplam Şekil Alanı}}$ oranıyla bulunur; koordinat veya şekil boyutları orantı kurularak sadeleştirilir. Çift zar atışlarında ise toplamın $7$ olma olasılığının en yüksek ($\frac{6}{36} = \frac{1}{6}$) olduğunu, toplam $2$ ile $12$'ye gidildikçe durum sayısının simetrik biçimde $1$'er azaldığını bilmek saniyeler kazandırır.

:::sekil Şekil 2. Torbadan torbaya bilye aktarımında iki dallı olasılık ağacı
{"kind":"flow","nodes":[{"id":"a","at":[0,1],"text":"A Torbası (3K, 2B)"},{"id":"r","at":[2,0],"text":"Kırmızı aktar (3/5) → B: 5K, 1B"},{"id":"b","at":[2,2],"text":"Beyaz aktar (2/5) → B: 4K, 2B"},{"id":"c","at":[4,1],"shape":"circle","text":"B'den Kırmızı Çekme"}],"edges":[{"from":"a","to":"r","label":"3/5"},{"from":"a","to":"b","label":"2/5"},{"from":"r","to":"c","label":"5/6"},{"from":"b","to":"c","label":"4/6"}]}
:::

:::ornek
Şekil 2'deki düzenekte A torbasında $3$ kırmızı, $2$ beyaz; B torbasında $4$ kırmızı, $1$ beyaz bilye vardır. A torbasından rastgele $1$ bilye çekilip rengine bakılmadan B torbasına atılıyor, ardından B torbasından $1$ bilye çekiliyor. Çekilen bilyenin kırmızı olma olasılığını hesaplayalım. İki ayrık yol vardır: birinci yolda A'dan kırmızı gelir ($\frac{3}{5}$), B torbası $5$ kırmızı $1$ beyaz ($6$ bilye) olur ve B'den kırmızı çekilir ($\frac{5}{6}$). İkinci yolda A'dan beyaz gelir ($\frac{2}{5}$), B torbası $4$ kırmızı $2$ beyaz ($6$ bilye) olur ve B'den kırmızı çekilir ($\frac{4}{6}$). Toplam olasılık: $\frac{3}{5} \cdot \frac{5}{6} + \frac{2}{5} \cdot \frac{4}{6} = \frac{15}{30} + \frac{8}{30} = \frac{23}{30}$ olur.
:::

:::tuzak
İki klasik tuzak sürekli puan götürür: Birincisi, "biri kırmızı biri beyaz çekilme olasılığı" dendiğinde tek tek çekim çarpımı yapıp ($\frac{3}{5} \cdot \frac{2}{4}$) bunu **önce beyaz sonra kırmızı** olma ihtimali olan $2$ ile çarpmayı unutmaktır (kombinasyon kullanırsan bu sırayı zaten otomatik kapsarsın). İkincisi, koşullu olasılıkta ("... olduğu bilindiğine göre") paydaya hâlâ tüm örnek uzayı yazmaktır.
:::

:::akilda-kalsin
- $P(A) = \frac{\text{İstenen Durum}}{\text{Tüm Durum}}$ her zaman $0$ ile $1$ arasındadır.
- "En az bir" olasılığı sorulduğunda $1 - P(\text{hiçbiri})$ hesabı en hızlı ve hatasız yoldur.
- Koşullu olasılıkta ("bilindiğine göre") paydaya tüm evreni değil sadece verilen şartı sağlayan alt kümeyi yaz.
- Torbadan torbaya aktarım sorularında aktarılan her renk ihtimalini ayrı dal olarak hesaplayıp topla.
:::

:::kontrol
428fafc0-b839-5c04-b235-cf2ba8a77826
4bab903d-2b65-540a-82e6-3db5a4d71181
:::
