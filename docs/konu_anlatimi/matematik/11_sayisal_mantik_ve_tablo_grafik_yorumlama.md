---
lesson: Matematik & Geometri
topic: Sayısal Mantık ve Tablo-Grafik Yorumlama
exam_scopes: [b_grubu_gygk]
sources:
  - "ÖSYM 2026 KPSS Lisans Kılavuzu (konu kapsamı)"
  - "MEB Ortaöğretim Matematik Ders Kitapları (yalnızca kavram ve formül doğrulama)"
---

## Bölüm 1: İşlem Tanımlama, Örüntü ve Sayısal Akış Şemaları

KPSS Matematik testinin son $4$–$6$ sorusu genellikle **sayısal mantık**, işlem makineleri, kurallı sayı tabloları ve grafik okuma sorularından oluşur. Bu sorular ağır formüller yerine **verilen kuralı eksiksiz okuma ve adım adım takip etme** becerisini ölçer.

### Tanımlı İşlemler ve İç İçe İşlem Zincirleri

Soru içinde $\Delta$, $\circ$ veya $*$ gibi alışılmadık bir sembol görürsen hemen tanım satırına bak. Örneğin $a \Delta b = 2a - b$ ve $a \circ b = a + 3b$ tanımlanmışsa yapman gereken tek şey soldaki sayıyı $a$, sağdaki sayıyı $b$ yerine yazmaktır. Parantez varsa önce parantez içi hesaplanır ($((3 \Delta 2) \circ 4)$ gibi). Bazı sorularda işlem doğrudan sayılar arasında değil **değişme/birleşme veya ters eleman** üzerinden sorulur: $a \Delta b = b \Delta a$ eşitliği çıkıyorsa işlem değişmelidir; birim eleman ($e$) için $a \Delta e = a$ çözülür. Ayrıca parçalı tanımlı işlemlerde ($a < b$ ise $a + b$, $a \ge b$ ise $2a - b$ gibi) her parantez içi hesaplanırken sayılar yeniden karşılaştırılarak hangi kuralın çalışacağına karar verilir.

### Rakam Toplamı, Basamak ve Kurallı Dizi Örüntüleri

Sayısal mantık sorularında sık kullanılan bir diğer başlık da belirli bir kurala göre tanımlanan sayı özellikleridir: "Kendisi rakamları toplamına tam bölünen sayılara Harshad sayısı denir" veya "Bir sayının rakamları soldan sağa artıyorsa yükselici sayı denir" gibi o soruya özel yeni bir tanım verilir. Bu sorularda ekstra formül ezberlemene hiç gerek yoktur; tanımı bir örnek üzerinde $10$ saniyede test ettikten sonra istenen aralıktaki veya şarttaki sayıları sistematik olarak (basamak basamak) sayman yeterlidir.

### İşlem Makineleri, İki Kollu Düzenekler ve Akış Şemaları

Şekil üzerinde kutular ve oklarla kurulan işlem makinelerinde üç temel kurala dikkat et:

- **İleri yönlü hesap:** Sayı girişten verildiyse okların üzerindeki işlemleri soldan sağa doğru hiç atlamadan sırayla uygula.
- **Sondan başa (ters işlem):** Çıkış değeri verilip giriş ($x$) soruluyorsa son kutudan geriye giderken her işlemin **tersini** al ($+$ yerine $-$, $\times$ yerine $\div$) veya girişe $x$ yazarak cebirsel denklem kurup çıkışa eşitle (cebirsel yol işlem sırası hatasını önler).
- **Koşullu akış şemaları (Tek / Çift dallanması):** Başlangıç değerini ilk kola soktuktan sonra çıkan sayının okun ucunda yeniden sisteme girip girmediğini kontrol et! Örneğin "sonuç $20$'den küçükse tekrar başa dön" şartı varsa döngüden çıkana kadar işlemi tekrar etmelisin.

:::sekil Şekil 1. İki kollu işlem düzeneği örneği
{"kind":"flow","nodes":[{"id":"x","at":[0,1],"shape":"circle","text":"x"},{"id":"a","at":[2,0],"text":"A = 3x - 4"},{"id":"b","at":[2,2],"text":"B = 2x + 5"}],"edges":[{"from":"x","to":"a","label":"×3, -4"},{"from":"x","to":"b","label":"×2, +5"}]}
:::

:::ornek
Şekil 1'deki iki kollu işlem düzeneğine aynı $x$ sayısı girildiğinde üst koldan $A$, alt koldan $B$ çıkışı elde ediliyor. Eğer $A + B = 31$ ise girişe verilen $x$ sayısını bulalım. Üst kolun çıkışı $A = 3x - 4$, alt kolun çıkışı $B = 2x + 5$ olur. Toplamları $A + B = (3x - 4) + (2x + 5) = 5x + 1 = 31$ eşitliğini verir. Buradan $5x = 30 \Rightarrow x = 6$ bulunur. Gerçekten $x = 6$ için üstten $14$, alttan $17$ çıkar ve $14 + 17 = 31$ doğrulanır. Başka bir düzenekte sayı satırında $3, 2, 4 \to 10$ ve $5, 1, 6 \to 11$ kuralı verilmişse hemen dört işlem ilişkisi aranır: ilk iki sayıyı çarpıp üçüncüyü eklemek ($3 \cdot 2 + 4 = 10$ ve $5 \cdot 1 + 6 = 11$) ortak kuralı verir.
:::

:::kodlama
**TERSTEN GİTMEK YERİNE X YAZ**: İşlem makinelerinde çıkış verilip giriş sorulduğunda kafadan ters işlem yaparken işlem sırasını bozma riskin yüksektir; girişe $x$ yazıp okları ileri takip ederek denklemi çıkışa eşitlemek hatasızdır.
:::

:::tuzak
Akış şeması sorularında iki nokta sürekli tuzak olur: Birincisi, döngü okunu görmeyip ilk adımda çıkan değeri doğrudan final sonuç sanmaktır. İkincisi, işlem tanımlama sorularında $a \Delta b = 2a - b$ gibi değişmeli olmayan bir kuralda $a$ ile $b$'nin yerini karıştırmaktır ($2 \Delta 5 \neq 5 \Delta 2$).
:::

:::akilda-kalsin
- Tanımlı işlemlerde daima sol terimi birinci harf, sağ terimi ikinci harf yerine yaz ve parantez içinden başla.
- Çıkıştan girişi bulurken girişe $x$ verip ileri yönlü cebirsel denklem kurmak ters işlemden daha güvenlidir.
- Akış şemasında dallanma şartını ($n$ tek/çift veya büyük/küçük) her döngüde yeniden test et.
- Sayı örüntülerinde kuralı bulduktan sonra mutlaka verilen **tüm** örnek satırlarda test et.
:::

:::kontrol
06dace96-1e9c-587a-9ec7-3aaa90f92855
0ee35075-5b23-5330-b56a-c2c5d0678699
:::

## Bölüm 2: Sütun, Çizgi ve Daire Grafiklerinin Yorumlanması

Tablo ve grafik yorumlama soruları KPSS'de puan kaçırılmaması gereken en net bölümdür; çünkü bütün veriler görselde açıkça sunulur. Üç temel grafik türünün okuma ve dönüşüm kurallarını bilmek bütün grafikleri tek bakışta çözdürür:

1. **Sütun Grafiği:** Kategorilerin sayısal miktarlarını karşılaştırır. Sütunların tepesindeki sayılar veya dikey eksendeki çizgi hizaları dikkatle okunmalıdır. "Yüzde artış veya azalış" sorulduğunda paydaya daima **ilk (referans) değer** yazılır: $\frac{\text{Fark}}{\text{Başlangıç Değeri}} \cdot 100$. Birden fazla kategori aynı grafikte yan yana sütunlarla veriliyorsa renk veya desen açıklamasını (lejantı) okumadan işlem yapma. 2. **Çizgi Grafiği:** Zamana bağlı değişimi (artış, azalış, fark, kesişim) gösterir. İki çizgi aynı yıl/ayda üst üste biniyorsa o noktada iki serinin değeri birbirine eşittir. Eğimin en dik yükseldiği aralık artış hızının en yüksek olduğu dönemdir; dikkat et: sayıca en çok artış olan aralıkla **yüzdece** en çok artış olan aralık farklı olabilir ($10$'dan $20$'ye çıkış $+10$ artış yani $\%100$'dür, $40$'tan $55$'e çıkış $+15$ artış ama yalnızca $\%37{,}5$'tir!). 3. **Daire (Pasta) Grafiği:** Bütünün parçalara dağılımını **açı ($360^\circ$)** veya **yüzde ($\%100$)** olarak gösterir. Tüm grafik sorularının kilit dönüşüm bağıntısı şudur:

$$\frac{\text{Merkez Açı}}{360^\circ} = \frac{\text{Dilimin Yüzdesi}}{100} = \frac{\text{Parçanın Miktarı}}{\text{Toplam Miktar}}$$

Bu orantı sayesinde bir sütun veya tablo verisi daire grafiğine dönüştürülürken toplam veri adedi $360^\circ$'ye eşitlenir ve her kategorinin merkez açısı doğrudan oranlanır. Örneğin toplam $90$ adet ürün içinde $15$ adet gömlek satılmışsa gömleğin merkez açısı $\frac{15}{90} \cdot 360^\circ = 60^\circ$ bulunur. Pratik bir kısayol olarak **$\%1$'lik dilimin $3{,}6^\circ$'ye**, **$\%10$'luk dilimin $36^\circ$'ye** ve **$\%25$'lik dilimin $90^\circ$'ye** karşılık geldiğini aklında tut.

### İki Grafik Arası Geçiş ve Ağırlıklı Dağılım

KPSS'de çok sık sorulan ileri düzey grafik sorusu **iki farklı grafiğin birleştirilmesidir**: örneğin birinci daire grafiğinde üretilen toplam meyve türlerinin açıları ($A: 90^\circ, B: 120^\circ, C: 150^\circ$), ikinci sütun veya daire grafiğinde ise bu meyvelerin kuruyunca fire oranları veya kâr yüzdeleri verilir. Bu tip sorularda $360^\circ$'ye karşılık toplam $360x$ ya da açıların EBOB'una bölerek $A = 3x, B = 4x, C = 5x$ vermek (örneğin açıları $30^\circ$'ye bölerek küçültmek) bütün hesapları küçük tam sayılarla saniyeler içinde çözmeni sağlar. Bir başka pratik durum da açı verilmediğinde $360^\circ$'den diğer tüm açıları çıkararak kalan dilimin açısını bulmaktır. Sütun grafiğinde bir yıldaki toplam üretimin belirli bir yüzdeyle değişimi sorulduğunda her kategoriyi ayrı ayrı güncelleyip sonra daire açısını yeniden oranlamayı unutma; çünkü farklı oranlarda büyüyen kategorilerin daire içindeki merkez açıları da değişir.

:::sekil Şekil 3. Daire grafiğinde açı ve yüzde dengesi ($150^\circ + 90^\circ + 120^\circ = 360^\circ$)
{"kind":"pie","show":"degree","slices":[{"label":"A","value":150},{"label":"B","value":90},{"label":"C","value":120}]}
:::

:::sekil Şekil 2. Bir mağazanın hafta içi satış dağılımı (Sütun grafiği ve daire grafiği karşılığı)
{"kind":"bar","title":"Hafta İçi Gömlek Satışı","yLabel":"Adet","yStep":6,"categories":["Pzt","Sal","Çar","Per","Cum"],"values":[12,18,15,21,24]}
:::

:::tablo
| Yüzde Dilimi | Daire Grafiği Merkez Açısı | Kesir Değeri |
|---|---|---|
| $\%10$ | $36^\circ$ | $\frac{1}{10}$ |
| $\%20$ | $72^\circ$ | $\frac{1}{5}$ |
| $\%25$ | $90^\circ$ | $\frac{1}{4}$ |
| $\%50$ | $180^\circ$ | $\frac{1}{2}$ |
:::

:::ornek
Şekil 2'deki sütun grafiğinde bir mağazanın hafta içi sattığı gömlek sayıları sırasıyla $12, 18, 15, 21$ ve $24$ olarak verilmiştir. Bu veriler bir daire grafiği ile gösterilmek istense Cuma gününe ait dilimin merkez açısı kaç derece olur? Önce toplam satışı buluruz: $12 + 18 + 15 + 21 + 24 = 90$ adet. Cuma günü $24$ adet satıldığı için oranı kurarız: $\frac{24}{90} = \frac{x}{360^\circ}$. Sadeleştirirsek $90$'dan $360$'a $4$ kat büyüdüğü görülür; dolayısıyla $x = 24 \cdot 4 = 96^\circ$ bulunur. Aynı grafikte Pazartesi'den Salı'ya satış artışı yüzdesi sorulsaydı fark $18 - 12 = 6$, başlangıç değeri $12$ olduğu için artış oranı $\frac{6}{12} = \%50$ olurdu.
:::

:::tuzak
Daire grafiği sorularında en sık yapılan hata iki farklı ölçeği birbirine karıştırmaktır: açı verilerini toplarken $100$'e tamamlamak ya da yüzde verilerini $360$'a tamamlamaya çalışmak tüm dilimleri bozar. Ayrıca iki dönem arasındaki yüzde değişim sorusunda paydaya yeni değeri değil mutlaka **eski (ilk) değeri** yazmalısın; örneğin $12$'den $18$'e çıkış $\%50$ artıştır ama $18$'den $12$'ye düşüş $\%33{,}3$ azalıştır! İkinci kritik nokta da ortalama hız veya ortalama fiyat sorulurken sütun değerlerini önce ağırlıkla çarpıp sonra toplam adede bölmektir.
:::

:::akilda-kalsin
- Daire grafiğinde tam daire $360^\circ$ veya $\%100$'dür; her $\%10$'luk pay $36^\circ$'dir.
- Sütun/çizgi verisinden daire açısına geçerken $\frac{\text{Parça}}{\text{Toplam}} \cdot 360^\circ$ formülünü uygula.
- Yüzde artış-azalış hesabında paydaya daima başlangıç (önceki) dönem değerini koy.
- Çizgi grafikte iki eğrinin kesiştiği nokta değerlerin birbirine eşit olduğu andır.
:::

:::kontrol
10da261d-c63f-5acb-bbb0-29196a9542b6
1150b36b-a1d0-5b7a-83c5-d140162fa1f6
:::

## Bölüm 3: Tablo Okuma, Çekmece İlkesi ve Sözel-Sayısal Akıl Yürütme

KPSS sayısal mantık bölümünün ikinci büyük ayağını **iki boyutlu tablo analizi**, **en kötü durum (çekmece / güvercin yuvası) soruları** ve **çok koşullu mantık yerleştirmeleri** oluşturur.

### Tablo Yorumlama ve Ağırlıklı Ortalamalar

Satır ve sütunlardan oluşan fiyat, puan veya dağılım tablolarında ("kız-erkek / gözlüklü-gözlüksüz", "otel hafta içi-hafta sonu gecelik ücreti") istenen hücreyi kesiştirirken satır ve sütun başlığını parmağınla takip et. Tabloda bazı hücreler boş bırakılıp satır/sütun toplamları verilmişse bilinmeyen hücreleri toplamdan çıkararak doldur. İki grup ortalaması birleştirilirken (**ağırlıklı ortalama**) kişi sayıları eşit değilse ortalamaların doğrudan ortalaması alınmaz; her grubun ortalaması kendi kişi sayısıyla çarpılıp toplam kişi sayısına bölünür!

### En Kötü Durum (Garanti Etme / Karanlık Kutu) Soruları

"Karanlık bir kutuda $9$ kırmızı, $7$ mavi, $6$ yeşil ve $3$ sarı top vardır; en az kaç top çekilirse kesinlikle..." sorularında tek bir ilke vardır: **en şanssız (hedefe ulaşmayı en çok geciktiren) senaryoyu kur!**

- **"Kesinlikle her renkten en az $1$ tane":** En çok sayıda bulunan renklerden başla ve en az sayıda olan son rengi en sona bırak: $(9 + 7 + 6) + 1 = 23$ top.
- **"Kesinlikle herhangi bir renkten $3$ tane":** Tüm renklerden $2$'şer tane çek ($2 + 2 + 2 + 2 = 8$), bir sonraki çekeceğin $9$. top mutlaka bir rengi $3$'e tamamlar!
- **"Kesinlikle $1$ kırmızı":** Kırmızı dışındaki bütün renklerin tamamını bitir ($7 + 6 + 3$), sonra $+1$ çek: $17$ top.

### Çok Koşullu Sayısal Yerleştirme ve Oyun Stratejileri

Tarih, saat, puan veya ağırlık kıyaslaması verilen sayısal mantık bloklarında hemen küçük bir tablo taslağı çiz; kesin verilen verileri (örneğin "Ali'nin üç etap ortalaması $80$") doğrudan sayıya çevirip ($80 \cdot 3 = 240$) bilinmeyeni çöz. Kısıtları sağlamayan olasılıkları satır satır ele.

:::tablo
| Karanlık Kutu Sorusu ($9K, 7M, 6Y, 3S$) | En Şanssız (Kötü) Senaryo | Garanti İçin Minimum Çekim |
|---|---|---|
| Kesinlikle $1$ Kırmızı | Önce tüm Kırmızı dışındakiler biter | $(7 + 6 + 3) + 1 = 17$ |
| Her renkten en az $1$ tane | En kalabalık $3$ rengin tamamı biter | $(9 + 7 + 6) + 1 = 23$ |
| Aynı renkten $2$ tane | Her renkten $1$'er tane gelir | $(1 + 1 + 1 + 1) + 1 = 5$ |
| Aynı renkten $4$ tane | Sarıdan $3$, diğerlerinden $3$'er tane | $(3 + 3 + 3 + 3) + 1 = 13$ |
:::

:::ornek
İçinde $9$ kırmızı, $7$ mavi, $6$ yeşil ve $3$ sarı özdeş topun bulunduğu karanlık bir kutudan renklerine bakılmadan art arda toplar çekiliyor. Kutudan çekilen toplar arasında **her renkten en az $2$'şer tane** bulunmasını garanti etmek için en az kaç top çekilmelidir? En kötü senaryoyu düşünürüz: bir renkten $2$ tane çekemediğimiz en uzun yol, sayısı en az olan sarı toplardan hiç çekmeyip diğer üç rengin ($9, 7, 6$) tamamını bitirmektir. Bu durumda $9 + 7 + 6 = 22$ top çektiğimizde hâlâ hiç sarı topumuz yoktur. Sonrasında kalan $3$ sarı toptan $2$ tane çekmemiz gerektiğinden $22 + 2 = 24$ top çekmek sonucu kesin olarak garanti eder.
:::

:::tuzak
En kötü durum sorularında en yaygın tuzak, "her renkten en az $1$ tane" istenirken en küçük sayıyı dışarıda bırakmak yerine en büyük sayıyı ($9$) dışarıda bırakmaktır ($3 + 6 + 7 + 1 = 17$ demek yanlıştır; çünkü şanssız senaryoda ilk $22$ topun kırmızı-mavi-yeşilden gelmesi mümkündür). Ayrıca sayısal mantık tablo sorularında boş bırakılan hücreleri veya hafta içi-hafta sonu gün sayılarını ($5$ gün vs $2$ gün) karıştırmamaya dikkat et.
:::

:::akilda-kalsin
- En kötü durum (garanti etme) sorularında daima seni hedeften en uzak tutacak en şanssız çekimleri sırala.
- "Her renkten en az $k$ tane" garanti etmek için en az sayıdaki rengin $k$'ncı topuna ulaşana kadar diğer tüm renkleri tamamen tüket.
- Ağırlıklı ortalama sorularında grup ortalamalarını önce toplam puana/değere çevir, sonra toplam kişi sayısına böl.
- Sayısal mantık bloklarında verilen her kesin ipucunu tablo üzerine yerleştirerek olasılıkları daralt.
:::

:::kontrol
122e16a3-4289-523c-a6ea-a0b913e33df6
1549d305-f530-5752-9dd2-b7f7b3fca2c9
:::
