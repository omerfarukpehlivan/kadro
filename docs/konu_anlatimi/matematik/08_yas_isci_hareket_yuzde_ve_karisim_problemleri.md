---
lesson: Matematik & Geometri
topic: Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri
exam_scopes: [b_grubu_gygk]
sources:
  - "ÖSYM 2026 KPSS Lisans Kılavuzu (konu kapsamı)"
  - "MEB Ortaöğretim Matematik Ders Kitapları (yalnızca kavram ve formül doğrulama)"
---

## Bölüm 1: Yaş Problemleri

Yaş problemlerinin tamamı üç değişmez zaman kuralına dayanır:

- $t$ yıl **sonra** her bireyin yaşı $t$ artar; $t$ yıl **önce** her bireyin yaşı $t$ azalır.
- İki kişi arasındaki **yaş farkı hiçbir zaman değişmez** (geçmişte de gelecekte de sabittir).
- **$n$ kişilik bir grubun** $t$ yıl sonraki yaşları toplamı $n \cdot t$ kadar artar, $t$ yıl önceki yaşları toplamı ise $n \cdot t$ kadar azalır; aynı şekilde grubun yaş ortalaması da doğrudan $t$ artar veya azalır.

Yaş sorularında iki kişi veya bir ebeveyn ile birden fazla çocuk varsa tablo çizip kişi sayısını mutlaka not et. Çünkü en yaygın tuzak, "anne ve iki çocuk" sorularında $6$ yıl sonra annenin yaşını $6$ artırıp iki çocuğun yaşları toplamını da yanlışlıkla $6$ artırmaktır; oysa $2$ çocuk bulunduğu için çocukların yaşları toplamı $2 \cdot 6 = 12$ artar!

### "Senin Yaşındayken" ve Doğum Yılı Kalıpları

"Ben senin bugünkü yaşına geldiğimde" veya "ben senin bugünkü yaşındayken" sorularında ikili bir tablo (Geçmiş / Bugün / Gelecek) kurup aradan geçen yıl sayısını eşitlemek en güvenli yöntemdir. Örneğin Ali'nin bugünkü yaşı $A$, Veli'nin bugünkü yaşı $V$ ($A > V$) olsun. Ali, Veli'nin yaşındayken aradan $A - V$ yıl geriye gidilmiş demektir; o tarihte Veli'nin yaşı $V - (A - V) = 2V - A$ olur. Eğer soru "ben senin yaşına geldiğimde ikimizin yaşları toplamı $72$ olacak" diyorsa geçen $t = A - V$ yıl boyunca ikisi de büyüdüğü için gelecekte toplam $A + V + 2t$ olur ve tek denklemle $A$ ve $V$ kolayca bulunur.

Bir kimsenin doğum yılı küçüldükçe yaşı büyür: $1990$ doğumlu biri, $1995$ doğumlu birinden $5$ yaş daha büyüktür ve $t$ yılında doğan birinin $Y$ yılındaki yaşı $Y - t$'dir. "Bugünkü yaşları oranı $\frac{3}{5}$, $8$ yıl sonra $\frac{5}{7}$ oluyor" gibi oran sorularında ise bugünkü yaşlara hemen $3k$ ve $5k$ yazıp $\frac{3k + 8}{5k + 8} = \frac{5}{7}$ eşitliğinden $k$ bulunur; aynı zamanda yaş farkının $2k$ kalması gerektiği pratik kontrol sağlar.

:::tablo
| İfade | Matematiksel Karşılığı | Kritik Nokta |
|---|---|---|
| $k$ kişinin $t$ yıl sonraki toplam yaşı | $\text{Bugünkü Toplam} + k \cdot t$ | Kişi sayısı $k$ ile çarpmayı unutma |
| İki kişi arası yaş farkı | $A - B$ (sabit) | Yıl geçse de sıfırlanmaz, değişmez |
| $A$, $B$'nin yaşına geldiğinde ($A < B$) | $B - A$ yıl geçer | $B$'nin yaşı $2B - A$ olur |
| Doğmamış olma şartı | Yaş $\ge 0$ | Birinin yaşı negatif çıkmışsa o yıl grupta yoktur |
:::

:::ornek
Bir annenin bugünkü yaşı, iki çocuğunun yaşları toplamının $3$ katından $4$ fazladır. $6$ yıl sonra annenin yaşı, iki çocuğunun yaşları toplamının $2$ katından $2$ eksik olacağına göre annenin bugünkü yaşı kaçtır? Çocukların bugünkü yaşları toplamına $T$ dersek anne $3T + 4$ yaşındadır. $6$ yıl sonra annenin yaşı $3T + 4 + 6 = 3T + 10$ olur. İki çocuk olduğu için çocukların yaşları toplamı $6$ değil $2 \cdot 6 = 12$ artarak $T + 12$ olur. Eşitliği kurarız: $3T + 10 = 2(T + 12) - 2 \Rightarrow 3T + 10 = 2T + 22 \Rightarrow T = 12$. Annenin bugünkü yaşı $3(12) + 4 = 40$ bulunur.
:::

:::kodlama
**YAŞ FARKI SABİTTİR, TOPLAM KİŞİ SAYISIYLA ARTAR**: Tek kişi $t$ büyürken, $k$ kişinin toplam yaşı $k \cdot t$ büyür. Biri diğerinin yaşına geliyorsa aradaki fark kadar yıl ileri veya geri git.
:::

:::tuzak
"İki çocuğun yaşları toplamı" veya "$3$ arkadaşın yaşları toplamı" geçen sorularda $t$ yıl sonra toplamı yalnızca $t$ artırmak tüm çözümü bozar. Ayrıca "$2000$ yılında doğan" ile "yaşının rakamları toplamı" sorularında çocuğun henüz doğmadığı yılları toplam yaş hesabına katmamaya dikkat et.
:::

:::akilda-kalsin
- $k$ kişilik grubun yaşları toplamı $t$ yıl sonra $k \cdot t$ artar, ortalaması ise $t$ artar.
- İki kişi arasındaki yaş farkı geçmişte de gelecekte de değişmez.
- "Senin yaşındayken" sorularında Geçmiş-Bugün-Gelecek tablosu kurarak yıl farkını eşitle.
- Doğum yılı küçük olan kişi yaşça daha büyüktür.
:::

:::kontrol
010b6835-b6f8-593c-bd7a-39622fe48753
045514d0-9652-5616-ba7f-1ef41a0805df
:::

## Bölüm 2: İşçi ve Havuz Problemleri

İşçi problemlerinin tamamı tek bir temel mantığa dayanır: Bir işin tamamını tek başına $a$ günde bitiren bir işçi, $1$ günde işin **$\frac{1}{a}$**'sını yapar. Birden fazla işçi birlikte çalışıyorsa her birinin $1$ günlük çalışma hızı toplanır; örneğin tek başına $a$ ve $b$ günde bitiren iki işçi birlikte $t$ gün çalışırsa yapılan toplam iş miktarı şu formülle bulunur:

$$\left(\frac{1}{a} + \frac{1}{b}\right) \cdot t = \text{Yapılan İş Oranı} \quad (\text{Tam iş} = 1)$$

### Kapasite Artırma ve "Tam İş = EKOK" Yöntemi

Kesirlerle işlem yapmadan işçi ve havuz sorularını çözmenin çok pratik bir ikinci yolu vardır: **işin tamamına sürelerin EKOK'u kadar birim değer ver!** Örneğin usta $12$ günde, çırak $24$ günde bitiriyorsa toplam iş $24$ birim kabul edilir; böylece ustanın günlük hızı $2$ birim/gün, çırağın günlük hızı $1$ birim/gün olur. Bu yöntem özellikle "usta kapasitesini $\%50$ artırırsa" veya "çırak hızını yarıya düşürürse" sorularında olağanüstü hız kazandırır: ustanın hızı $2$'den $3$'e çıkar, ikisinin toplam günlük üretimi hemen tam sayılarla toplanır.

Aynı mantık **havuz (musluk) problemlerinde** de birebir geçerlidir: Havuzu dolduran muslukların birim zamanda yaptığı iş pozitif ($+\frac{1}{a}$), havuzu boşaltan muslukların yaptığı iş ise negatif ($-\frac{1}{c}$) alınır. Yalnız musluğun havuzun tam tabanında mı yoksa orta yüksekliğinde mi olduğu çizim veya metin kontrolü gerektirir: ortadaki bir boşaltma musluğu havuz yarıya dolana kadar etkisizdir, yalnızca üst yarıda çalışır!

Benzer bir standart kalıp da **birlikte bitirme süresi üzerinden tekli süre bulma** sorularıdır: "Ali ile Veli birlikte $12$ günde, Ali tek başına $x$ günde, Veli tek başına $y$ günde..." sorularında eğer üçlü ($A+B$, $B+C$, $A+C$) verilmişse üç denklemi taraf tarafa topladığında $2(\frac{1}{a} + \frac{1}{b} + \frac{1}{c})$ elde edilir; her biri ikişer kez sayıldığı için toplamı $2$'ye bölmeyi asla unutma. Eşit kapasiteli işçi gruplarında ($m$ işçi $g$ günde $k$ iş yaparsa) doğrudan bileşik orantı formülü $\frac{\text{İş}_1}{\text{İşçi}_1 \cdot \text{Gün}_1 \cdot \text{Saat}_1} = \frac{\text{İş}_2}{\text{İşçi}_2 \cdot \text{Gün}_2 \cdot \text{Saat}_2}$ işçi-saat sorularını saniyeler içinde çözer.

:::tablo
| Durum | Denklem Yaklaşımı | EKOK Yaklaşımı ($a=12, b=24$) |
|---|---|---|
| İkisi birlikte tam iş | $\frac{t}{a} + \frac{t}{b} = 1$ | İş $= 24$, hızlar $2 + 1 = 3 \Rightarrow t = 8$ gün |
| Biri $t_1$ gün çalışıp ayrılırsa | $\frac{t_1}{a} + \frac{t_2}{b} = 1$ | Önce $t_1 \cdot v_1$ düş, kalanı $v_2$'ye böl |
| Kapasite $\%p$ artarsa | Süre $\frac{100}{100+p}$ katına düşer | Hızı doğrudan $\times(1 + \frac{p}{100})$ yap |
| Dolduran ($a$) + Boşaltan ($c$) | $\frac{1}{a} - \frac{1}{c}$ | Dolma hızından boşaltma hızını çıkar |
:::

:::ornek
Bir usta bir işi tek başına $12$ günde, bir çırak ise aynı işi tek başına $24$ günde bitirebilmektedir. Usta tek başına $3$ gün çalıştıktan sonra yanına çırağı alıyor ve kalan işi birlikte bitiriyorlar. Toplam işin kaç günde bittiğini EKOK yöntemiyle çözelim: $\mathrm{EKOK}(12, 24) = 24$ birim iş olsun. Ustanın hızı $2$ birim/gün, çırağın hızı $1$ birim/gün olur. İlk $3$ günde usta tek başına $3 \cdot 2 = 6$ birim iş yapar; geriye $24 - 6 = 18$ birim iş kalır. Sonra ikisi birlikte günlük $2 + 1 = 3$ birim hızla çalışarak kalan işi $\frac{18}{3} = 6$ günde bitirir. İşin toplam süresi $3 + 6 = 9$ gündür.
:::

:::tuzak
İki tuzak adayın şıkları karıştırmasına yol açar: Birincisi, sorunun "kalan işi birlikte kaç günde bitirirler?" ($6$ gün) mi yoksa "işin tamamı toplam kaç günde biter?" ($3 + 6 = 9$ gün) mi sorduğunu son satırda kontrol etmemektir. İkincisi, "Ahmet'in çalışma hızı Mehmet'in hızının $2$ katıdır" denildiğinde Ahmet'in bitirme süresini $2t$, Mehmet'inkini $t$ sanmaktır; hız arttıkça süre **azalır** (hızlı olan $t$ günde, yavaş olan $2t$ günde bitirir).
:::

:::akilda-kalsin
- Hız ile bitirme süresi ters orantılıdır: $2$ kat hızlı işçi işi yarı sürede bitirir.
- Kesirlerle boğuşmamak için işin tamamına sürelerin EKOK'unu ver ve günlük birim hızları bul.
- İşçi sayısının veya kapasitenin değiştiği sorularda toplam işi adım adım (1. aşama + 2. aşama) topla.
- Sonuçta "kalan süre" mi yoksa "toplam süre" mi sorulduğunu mutlaka kontrol et.
:::

:::kontrol
084f9ef7-ef44-525b-86c0-3c3e83aeae7b
148818c1-d2e7-593c-bfca-5494c12e0c35
:::

## Bölüm 3: Hareket (Hız) Problemleri

Hareket problemlerinin tek ana formülü vardır; tüm diğer formüller bundan türetilir:

$$\text{Yol} = \text{Hız} \cdot \text{Zaman} \qquad (x = v \cdot t)$$

Bu formülü kullanmadan önce mutlaka **birim uyumu** kontrol edilmelidir: hız $\text{km/sa}$ ise zaman saat ve yol $\text{km}$; hız $\text{m/dk}$ ise zaman dakika ve yol metre olmalıdır. Örneğin $15$ dakikalık süreyi saat cinsinden $\frac{15}{60} = \frac{1}{4}$ saat olarak yazmadan doğrudan $v \cdot 15$ çarpmak en klasik birim hatasıdır.

### Karşılıklı Hareket, Yetişme, Tren-Tünel ve Ortalama Hız

KPSS'de en çok çıkan dört hareket modeli şunlardır: 1. **Karşılıklı Hareket (Zıt Yön):** Aralarında $x$ mesafe bulunan iki araç $v_1$ ve $v_2$ hızlarıyla birbirine doğru çıkarsa karşılaşma süresi $t = \frac{x}{v_1 + v_2}$ olur (hızlar **toplanır**). Aynı kural dairesel pistte zıt yönde hareket eden araçlar için de geçerlidir. 2. **Aynı Yönde Yetişme:** Aralarında $x$ farkla aynı yöne giden iki araçtan arkadaki daha hızlıysa ($v_1 > v_2$) yetişme süresi $t = \frac{x}{v_1 - v_2}$ olur (hızlar **çıkarılır**). 3. **Tren ve Tünel / Köprü:** Boyu $L_{\text{tren}}$ olan bir trenin uzunluğu $L_{\text{tünel}}$ olan bir tüneli tamamen geçmesi için katetmesi gereken toplam yol kendi boyu dahil **$L_{\text{tren}} + L_{\text{tünel}}$** kadardır. 4. **Ortalama Hız:** Ortalama hız **asla hızların aritmetik ortalaması değildir!** Genel formül şudur:

$$V_{\text{ort}} = \frac{\text{Toplam Yol}}{\text{Toplam Zaman}}$$

Eğer gidiş-dönüş gibi iki **eşit yol** sırasıyla $v_1$ ve $v_2$ hızlarıyla alınırsa $V_{\text{ort}} = \frac{2 v_1 v_2}{v_1 + v_2}$ olur (örneğin $60$'la gidip $40$'la dönen aracın ortalama hızı $50$ değil $\frac{2 \cdot 60 \cdot 40}{60 + 40} = 48$ km/sa'tir!). Akıntı ve rüzgar sorularında ise akıntıyla aynı yönde giderken toplam hız $v_{\text{tekne}} + v_{\text{akıntı}}$, akıntıya karşı giderken ise $v_{\text{tekne}} - v_{\text{akıntı}}$ alınır. İki aracın bir karşılaşmadan sonra birbirlerinin başlangıç noktalarına varış süreleri ($t_1$ ve $t_2$) verilmişse $\frac{v_1}{v_2} = \sqrt{\frac{t_2}{t_1}}$ ve buluşma süresi $t = \sqrt{t_1 \cdot t_2}$ pratik oranları da doğrudan sonuca götürür.

Dairesel pist sorularında ise pist uzunluğu $L$ olmak üzere, aynı noktadan zıt yönde çıkan araçların $k$. karşılaşma süresi $\frac{k \cdot L}{v_1 + v_2}$, aynı yönde çıkan araçların hızlı olanın yavaş olana $k$. kez tur bindirme (yakalama) süresi ise $\frac{k \cdot L}{v_1 - v_2}$ formülüyle hesaplanır.

:::tablo
| Hareket Durumu | Etkili Hız / Yol | Formül |
|---|---|---|
| Zıt yönlü / Karşılıklı buluşma | Hızlar toplanır | $t = \frac{x}{v_1 + v_2}$ |
| Aynı yönlü yetişme / tur bindirme | Hızlar farkı alınır | $t = \frac{x}{v_1 - v_2}$ |
| Trenin tüneli geçmesi | Yol $= L_{\text{tren}} + L_{\text{tünel}}$ | $L_{\text{tren}} + L_{\text{tünel}} = v \cdot t$ |
| Ortalama hız | Toplam yol / Toplam süre | Eşit yolda $\frac{2v_1v_2}{v_1 + v_2}$ |
:::

:::ornek
Bir sürücü evinden işine saatte $60$ km sabit hızla giderse planladığı saatten $1$ saat geç, saatte $90$ km sabit hızla giderse planladığı saatten $1$ saat erken varıyor. Ev ile iş arasındaki mesafeyi bulalım. Planlanan varış süresine $t$ saat dersek ilk durumda yolculuk $t + 1$ saat, ikinci durumda $t - 1$ saat sürer. Aynı yol ($x$) alındığı için iki ifadeyi birbirine eşitleriz: $60(t + 1) = 90(t - 1)$. Sadeleştirirsek $2(t + 1) = 3(t - 1) \Rightarrow 2t + 2 = 3t - 3 \Rightarrow t = 5$ saat bulunur. Yol ise $60 \cdot (5 + 1) = 360$ km olur.
:::

:::tuzak
Ortalama hız sorularında hızların aritmetik ortalamasını ($\frac{v_1 + v_2}{2}$) almak, tren sorularında trenin kendi boyunu tünele eklememek ve dakika olarak verilen süreyi saate çevirmeden km/sa cinsindeki hızla çarpmak en sık düşülen üç tuzaktır. Ayrıca dairesel pistte aynı noktadan aynı yöne çıkan iki araç yan yana geldiğinde aralarındaki mesafe tam pist çevresi ($1$ tur) kadardır.
:::

:::akilda-kalsin
- İşleme girmeden önce hız ile zamanın birimlerinin ($\text{km/sa}$ ve $\text{saat}$) uyumlu olduğunu kontrol et.
- Zıt yönlerde hızlar toplanır, aynı yönlerde hızların farkı alınır.
- Ortalama hız yalnızca $\frac{\text{Toplam Yol}}{\text{Toplam Zaman}}$ ile hesaplanır.
- Bir trenin bir tüneli tamamen terk etmesi için aldığı yol $L_{\text{tren}} + L_{\text{tünel}}$'dir.
:::

:::kontrol
168e3fe9-96eb-58bd-ac5d-6bb3cac3dabc
17fa151a-9dbb-5ea5-b73c-2d887e99387d
:::

## Bölüm 4: Yüzde ve Kâr-Zarar Problemleri

Yüzde problemlerinin temel fikri çok basittir: bir $A$ sayısının $\%x$'i $A \cdot \frac{x}{100}$'dür. Kesirlerle vakit kaybetmemek için sayı verilmeyen bütün yüzde, kâr-zarar ve alan-fiyat değişim sorularında başlangıç değerine **$100$** veya **$100x$** demek çözümü tek satıra indirir. Örneğin bir ürünün fiyatına önce $\%20$ zam yapılıp sonra yeni fiyattan $\%20$ indirim yapılırsa fiyat eski hâline dönmez: $100 \to 120 \to 120 \cdot 0{,}8 = 96$ olur; yani $\%4$ zarar edilmiş olur!

### Kâr-Zarar Terimleri ve Ardışık Değişimler

Kâr ve zarar problemlerinde dört kavramı kesinlikle ayırmalısın:

- **Maliyet (Alış) Fiyatı ($M$):** Aksi belirtilmedikçe kâr ve zarar yüzdesi daima **maliyet fiyatı** üzerinden hesaplanır.
- **Etiket (Satış) Fiyatı ($S$):** $\%k$ kârla satış $M \cdot (1 + \frac{k}{100})$, $\%z$ zararla satış $M \cdot (1 - \frac{z}{100})$'dür.
- **İndirim (İskonto):** İndirim daima maliyet üzerinden değil **etiket (liste) fiyatı** üzerinden yapılır!
- **Enflasyon / Alım Gücü ve Fire:** Çürüyen veya kuruyan ürün sorularında ($10$ kg yaş üzüm kuruyunca $8$ kg oluyor) toplam ödenen maliyet değişmezken eldeki kilogram azaldığı için birim maliyet yükselir: toplam gelir ile toplam maliyet karşılaştırılır.

İki değişkenli gelir veya alan sorularında ($\text{Gelir} = \text{Fiyat} \times \text{Adet}$) başlangıçta iki değişkene de $10$ vererek $10 \cdot 10 = 100$ bütünü kurmak olağanüstü kolaylık sağlar: fiyat $\%20$ düşerse $8$, adet $\%30$ artarsa $13$ olur; yeni gelir $8 \cdot 13 = 104$ olduğundan ciro $\%4$ artar.

### İndirimli Satışta Etiket-Maliyet Bağlantısı ve KDV

Sınavda en sık çıkan kâr-zarar kalıplarından biri şudur: "Maliyet üzerinden $\%40$ kârla etiketlenen bir ürüne etiket fiyatı üzerinden $\%20$ indirim yapılıyor; yeni kâr oranı nedir?" Burada maliyet $100$ TL alınınca etiket $140$ TL olur. Etiket üzerinden $\%20$ indirim yani $140 \cdot \frac{20}{100} = 28$ TL düşüldüğünde satış fiyatı $140 - 28 = 112$ TL olur; maliyet $100$ TL olduğu için net kâr $\%12$'dir. Eğer bir ürünün satışından $\%x$ kârla elde edilen tutar ile $\%y$ zararla elde edilen tutar arasındaki fark verilmişse hemen $(100 + x) - (100 - y) = x + y$ yüzdelik farkını paraya eşitleyerek maliyet $100k$ doğrudan bulunur.

Yaş üzüm-kuru üzüm veya yaş sabun-kuru sabun sorularında da toplam ödenen para değişmez: $10$ kg yaş ürün $10$ TL'den alındıysa toplam maliyet $100$ TL'dir; kuruyunca $8$ kg kalırsa $8$ kg'ı kaçtan satarsak hedeflenen kârlı gelire ($120$ TL gibi) ulaşacağımızı $8 \cdot S = 120 \Rightarrow S = 15$ TL diye çözeriz.

:::tablo
| Kavram | Hesaplama Temeli | Örnek ($M = 100$ TL) |
|---|---|---|
| $\%25$ kârlı satış | Maliyet üzerinden | $100 + 25 = 125$ TL |
| Etikete $\%20$ indirim | Etiket fiyatı üzerinden | $125 \cdot 0{,}80 = 100$ TL |
| Ardışık $+\%20$ ve $-\%20$ | İkinci yüzde yeni değer üzerinden | $100 \to 120 \to 96$ ($\%4$ azalış) |
| Kâr oranı | $\frac{\text{Satış} - \text{Maliyet}}{\text{Maliyet}} \cdot 100$ | Payda her zaman maliyettir |
:::

:::ornek
Bir tüccar elindeki ürünlerin $\%40$'ını $\%25$ kârla, kalan ürünlerini ise $\%10$ zararla satıyor. Tüm satıştan yüzde kaç kâr elde eder? Ürün sayısına $10$, her ürünün maliyetine $10$ TL dersek toplam maliyet $10 \cdot 10 = 100$ TL olur. Ürünlerin $\%40$'ı yani $4$ adedi $\%25$ kârla $12{,}5$ TL'den satılır ve $4 \cdot 12{,}5 = 50$ TL gelir getirir. Kalan $6$ adet ürün $\%10$ zararla $9$ TL'den satılır ve $6 \cdot 9 = 54$ TL gelir getirir. Toplam satış geliri $50 + 54 = 104$ TL olur; maliyet $100$ TL olduğu için tüm satıştan $\%4$ kâr edilmiştir.
:::

:::kodlama
**GELİRDE 10x10=100 KUR**: Hem fiyat hem adet değişen (sinema bileti, dikdörtgen alanı, ürün satışı) sorularda iki büyüklüğü de $10$ seç; çarpımları doğrudan $100$ ettiği için yeni çarpım sana net yüzde değişimi verir.
:::

:::tuzak
İki büyük tuzak vardır: Birincisi, "satış fiyatı üzerinden $\%20$ kâr" ile "maliyet üzerinden $\%20$ kâr" ifadelerini aynı sanmaktır; aksi yazmıyorsa maliyet esas alınır ama özellikle "satış fiyatı üzerinden" yazıyorsa paydaya satışı koymalısın. İkincisi, önce $\%20$ zam sonra $\%20$ indirim yapıldığında başlangıç fiyatına dönüldüğünü ($\%0$ değişim) sanmaktır; ikinci işlem büyümüş sayı üzerinden yapıldığı için net değişim $-\%4$ olur.
:::

:::akilda-kalsin
- Bilinmeyen toplamlı yüzde sorularında başlangıç maliyetini $100$ (veya $100x$) seç.
- Kâr-zarar aksine hüküm yoksa maliyetten, indirim ise etiket fiyatından hesaplanır.
- Ardışık yüzde değişimlerinde her yeni yüzde bir önceki güncel değer üzerinden alınır.
- Çarpımlı değişimlerde ($f \cdot a$) iki çarpanı $10$ alarak başlangıç $100$ bütününü kur.
:::

:::kontrol
1ea2e763-f6f8-5008-8de0-2ccadc2d9db2
25776297-31e0-59e3-a9bc-297846084354
:::

## Bölüm 5: Karışım Problemleri

Karışım problemleri yüzde problemlerinin doğrudan bir uygulamasıdır ve tek bir altın formülle her türü çözülür: **karışımlardaki saf madde (tuz, şeker, alkol, altın) miktarlarının toplamı, son karışımdaki saf madde miktarına eşittir.** İki karışımın miktarları $m_1, m_2$ ve saf madde yüzdeleri $\%y_1, \%y_2$ olmak üzere genel denklem şöyle kurulur:

$$m_1 \cdot y_1 + m_2 \cdot y_2 = (m_1 + m_2) \cdot y_{\text{son}}$$

Bu formülün en güzel yanı, dışarıdan **saf madde** veya **saf su** eklendiğinde ya da su buharlaştırıldığında bile hiçbir ek kural gerektirmemesidir:

- Karışıma saf alkol/tuz/şeker ekleniyorsa yüzdesi **$\%100$** alınır.
- Karışıma saf su ekleniyorsa içindeki alkol/tuz oranı **$\%0$** alınır.
- Karışımdan su buharlaştırılıyorsa miktar **eksi** ($-m_{\text{su}}$) ve yüzdesi **$\%0$** alınır (buharlaşma toplam kütleyi azaltır ama saf tuz/şeker miktarını değiştirmez!).

### Eşit Kütlede Karıştırma, İki Kap Aktarımı ve Döküp Su Ekleme

İki kap **eşit miktarda** ($m_1 = m_2$) karıştırılıyorsa yeni karışımın yüzdesi doğrudan iki yüzdenin **aritmetik ortalamasıdır** ($\frac{y_1 + y_2}{2}$). Eğer önce A kabından B kabına bir miktar aktarılıp sonra B'den A'ya geri aktarılıyorsa, birinci aktarımdan sonra B kabının yeni yüzdesini hesaplamadan ikinci aktarıma geçmemelisin!

Sınavda çok çıkan bir diğer kalıp da **"karışımın $\frac{1}{3}$'ü dökülüp yerine aynı miktarda saf su ekleniyor"** sorusudur. Burada bilmen gereken temel kural şudur: bir kapta homojen karışımın bir kısmı döküldüğünde geriye kalan karışımın **miktarı azalır ama yüzdesi kesinlikle değişmez!** Örneğin $\%30$'luk $60$ gram tuzlu suyun $\frac{1}{3}$'ü ($20$ gram) dökülünce kalan $40$ gram hâlâ $\%30$'luktur. Üzerine dökülen miktar kadar ($20$ gram) $\%0$'lık saf su eklendiğinde denklem $40 \cdot 30 + 20 \cdot 0 = 60 \cdot x \Rightarrow x = 20$ biçiminde saniyeler içinde çözülür. Altın ayar sorularında ise tam saf altın $24$ ayar kabul edildiğinden yüzde yerine ayar değeri ($18$ ayar, $22$ ayar gibi) doğrudan aynı formülde $y$ yerine konur ($24$ ayar saf altın $y = 24$, bakır katkısı $y = 0$ alınır).

:::kodlama
**SU EKLERSEN YÜZDE SIFIR, TUZ EKLERSEN YÜZDE YÜZ**: Karışımın tüm formülünü tuz/alkol/şeker üzerinden kur. Dökülen karışım kalanın yüzdesini bozmaz, yalnızca miktarı azaltır; buharlaşan suda ise miktarı eksi al ve yüzdeyi sıfır yaz.
:::

:::tablo
| Eklenen / Çıkarılan | Kütle Etkisi | Yüzde ($y$) Değeri |
|---|---|---|
| Saf tuz / şeker / alkol ekleme | $+m$ | $y = 100$ |
| Saf su ekleme | $+m$ | $y = 0$ (tuz/alkol soruluyorsa) |
| Su buharlaştırma | $-m$ | $y = 0$ |
| Eşit hacimde karıştırma | $m_1 = m_2$ | $y_{\text{son}} = \frac{y_1 + y_2}{2}$ |
:::

:::ornek
Alkol oranı $\%24$ olan $250$ mL kolonyaya $40$ mL saf alkol ve $110$ mL saf su ekleniyor. Oluşan yeni karışımın alkol yüzdesini bulalım. Önce tüm kütleleri ve yüzdeleri formüle yazarız: $250 \cdot 24 + 40 \cdot 100 + 110 \cdot 0 = (250 + 40 + 110) \cdot x$. Hesaplayalım: $250 \cdot 24 = 6000$ ve $40 \cdot 100 = 4000$, toplam saf alkol $6000 + 4000 = 10000$. Toplam yeni kütle ise $250 + 40 + 110 = 400$ mL olur. Dolayısıyla $10000 = 400 \cdot x \Rightarrow x = 25$ çıkar; yeni karışımın alkol oranı $\%25$'tir.
:::

:::tuzak
İki nokta karışım sorularında sıkça hataya neden olur: Birincisi, sorunun başında alkol/tuz yüzdesi verilip son cümlede **"su yüzdesi kaçtır?"** diye sorulmasıdır; tüm hesabı alkol üzerinden yaptıysan son adımda $100$'den çıkararak su yüzdesine geçmelisin. İkincisi, karışıma eklenen saf suyu veya buharlaşan suyu sağ taraftaki toplam kütle olan $(m_1 + m_2)$ içine eklemeyi ya da çıkarmayı unutmaktır.
:::

:::akilda-kalsin
- Tüm karışım soruları $m_1 y_1 + m_2 y_2 = (m_1 + m_2) y_{\text{son}}$ denklemiyle çözülür.
- İstenen maddeye göre saf madde eklendiğinde yüzde $100$, su eklendiğinde yüzde $0$ yazılır.
- Su buharlaştırılırken toplam kütle azalır ama içerideki tuz/şeker kütlesi değişmez.
- Çözüm sonunda sorunun "tuz/alkol oranı" mı yoksa "su oranı" mı istediğini kontrol et.
:::

:::kontrol
2921a832-8b0f-5f8b-87e6-6beab2962be4
2d6b1629-5103-50ff-8904-ebab3e749233
:::
