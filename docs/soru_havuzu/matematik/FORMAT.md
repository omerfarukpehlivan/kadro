# Matematik & Geometri Soru Yazım Biçimi (TASK-172)

Bu belge, Matematik & Geometri sorularının **nasıl yazılacağını** tanımlar. Sorular SQL olarak elle yazılmaz: her konu için bir Markdown dosyası yazılır, `tools/math/compile_questions.mjs` bu dosyayı doğrular, şekilleri SVG'ye çizer ve Supabase'e yüklenecek SQL'i üretir.

```
docs/soru_havuzu/matematik/NN_konu.md  ──►  compile_questions.mjs  ──►  docs/soru_havuzu/matematik/sql/NN_konu.sql  ──►  Supabase SQL Editor
                                          (doğrular + cevabı hesaplar + şekli çizer)
```

Örnekler: `docs/soru_havuzu/matematik/ornek/*.md` (her özelliği gösteren, derleyiciden hatasız geçen sorular; yüklenmez).

---

## 1. Dosya düzeni

Her konu tek dosyadır; dosya adı ve kimlik numarası aşağıdaki tablodan alınır. Konu adı `lib/features/lessons/data/kpss_lessons.dart` ile **harfi harfine** aynı olmalıdır (derleyici denetler).

| NN | Konu (`konu:`) | Dosya |
|---|---|---|
| 01 | Temel Kavramlar ve Sayı Basamakları | `01_temel_kavramlar_ve_sayi_basamaklari.md` |
| 02 | Bölme-Bölünebilme ve EBOB-EKOK | `02_bolme_bolunebilme_ve_ebob_ekok.md` |
| 03 | Rasyonel ve Ondalık Sayılar | `03_rasyonel_ve_ondalik_sayilar.md` |
| 04 | Basit Eşitsizlikler ve Mutlak Değer | `04_basit_esitsizlikler_ve_mutlak_deger.md` |
| 05 | Üslü ve Köklü İfadeler | `05_uslu_ve_koklu_ifadeler.md` |
| 06 | Çarpanlara Ayırma ve Oran-Orantı | `06_carpanlara_ayirma_ve_oran_oranti.md` |
| 07 | Denklem Çözme ve Sayı-Kesir Problemleri | `07_denklem_cozme_ve_sayi_kesir_problemleri.md` |
| 08 | Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri | `08_yas_isci_hareket_yuzde_ve_karisim_problemleri.md` |
| 09 | Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik | `09_kumeler_baginti_fonksiyon_ve_moduler_aritmetik.md` |
| 10 | Permütasyon, Kombinasyon ve Olasılık | `10_permutasyon_kombinasyon_ve_olasilik.md` |
| 11 | Sayısal Mantık ve Tablo-Grafik Yorumlama | `11_sayisal_mantik_ve_tablo_grafik_yorumlama.md` |
| 12 | Doğruda ve Üçgende Açılar, Üçgenler | `12_dogruda_ve_ucgende_acilar_ucgenler.md` |
| 13 | Çokgenler, Dörtgenler ve Çember-Daire | `13_cokgenler_dortgenler_ve_cember_daire.md` |
| 14 | Analitik Geometri ve Katı Cisimler | `14_analitik_geometri_ve_kati_cisimler.md` |

## 2. Dosya şablonu

```markdown
---
ders: Matematik & Geometri
konu: Üslü ve Köklü İfadeler
kod: mat
kapsam: [lisans_gygk, b_grubu_gygk]
---

### mat-05-001
- zorluk: 2
- dogru: D
- dogrulama: (2^(5+3) - 2^(5+1)) / 2^5

**Soru:**
$x$ bir gerçek sayı olmak üzere
$$\dfrac{2^{x+3} - 2^{x+1}}{2^{x}}$$
ifadesinin değeri kaçtır?

**Şıklar:**
A) 2
B) 3
C) 4
D) 6
E) 8

**Açıklama:**
Paydaki iki terimde de $2^{x}$ ortak çarpandır: ... sonuç 6 bulunur.

**Çeldirici Tuzağı:**
C şıkkı (4), üslü sayıların farkını üslerin farkıyla karıştıran adayı yakalar. ...
```

### Alanlar (sorunun başlığından hemen sonra, bölümlerden önce)

| Alan | Zorunlu | Açıklama |
|---|---|---|
| `### mat-NN-SSS` | ✔ | Kimlik. `NN` dosya numarası, `SSS` 001'den başlayan sıra. **Bir kez verilen kimlik asla değiştirilmez ve başka soruya verilmez** (veritabanı kimliği bundan üretilir; düzeltme aynı kimlikle yapılır ve SQL soruyu günceller). |
| `- zorluk:` | ✔ | `1` kolay · `2` orta · `3` zor |
| `- dogru:` | ✔ | `A`–`E` |
| `- dogrulama:` | ✔ | Cevabı **sorudaki verilerden bağımsız olarak** hesaplayan ifade (§5). Cevap sayı değilse `yok`. |
| `- degerler:` | gerekirse | Şıklar otomatik sayıya çevrilemiyorsa 5 şıkkın sayısal değeri: `v1 \| v2 \| v3 \| v4 \| v5` (§5). |

### Bölümler (bu sırayla)

| Bölüm | Zorunlu | Kural |
|---|---|---|
| `**Soru:**` | ✔ | Soru kökü. Birden çok satır olabilir (öncüller I., II., III. ayrı satırda). |
| `**Şekil:**` | şekilli soruda | ` ```json ` bloğu içinde şekil tarifi (§6). Şekil soru metninin **üstünde** gösterilir. |
| `**Şıklar:**` | ✔ | Tam 5 satır: `A) ...` … `E) ...`. Her şık tek satır, birbirinden farklı. |
| `**Açıklama:**` | ✔ | Adım adım çözüm (en az 60 karakter). Sonucu ve neden doğru olduğunu yazar. |
| `**Çeldirici Tuzağı:**` | ✔ | ⚠️ ÖSYM Çeldirici Tuzağı: en güçlü **yanlış** şıkkı harfiyle anar ("C şıkkı (4) …"), adayın hangi hatayla o şıkka gittiğini somut olarak açıklar. Doğru şıkkı tuzak gibi anlatmaz. |

## 3. Matematik yazımı (LaTeX)

Matematik ifadeleri `$...$` (satır içi) veya `$$...$$` (ayrı satırda ortalanmış) arasına LaTeX olarak yazılır. Mobilde `flutter_math_fork`, web'de KaTeX ile çizilir; iki platform da yalnızca aşağıdaki komutlar için test edilmiştir.

**İzinli komutlar** (`docs/parity_fixtures/math_text.json → latexCommands`; listede olmayan komut derleyicide hata verir):

```
\frac \dfrac \tfrac \sqrt \cdot \times \div \pm \mp
\leq \geq \neq \le \ge \ne \approx \equiv \sim \cong
\parallel \perp \angle \triangle \circ \infty
\pi \alpha \beta \gamma \theta \lambda \mu \sigma \Delta
\in \notin \subset \subseteq \supset \cup \cap \emptyset \setminus
\mathbb \mathrm \text \left \right \lvert \rvert \lfloor \rfloor \lceil \rceil
\overline \underline \hat \widehat \bar \vec
\quad \qquad \ldots \cdots \log \ln \sin \cos \tan \cot
\binom \Rightarrow \Leftrightarrow \rightarrow \leftarrow \to \displaystyle \mid
ve simgeler: \, \; \! \  \% \$ \{ \} \|
```

**Yazım kuralları**

| Ne | Doğru | Yanlış |
|---|---|---|
| Karekök / küpkök | `$\sqrt{75}$`, `$\sqrt[3]{8}$` | `√75`, `75^(1/2)` |
| Kesir | `$\frac{3}{4}$`; büyük kesir için `$\dfrac{a+b}{2}$` | `3/4` (yalnızca düz metinde kabul) |
| Tam sayılı kesir | `$2\frac{1}{3}$` (= 2 + 1/3) | `$2 \cdot \frac{1}{3}$` |
| Ondalık sayı | `$3{,}5$` veya düz metinde `3,5` | `$3.5$`, `$3,5$` (virgülden sonra boşluk oluşur) |
| Binlik ayırıcı | düz metinde `1.250` | `1,250` |
| Çarpma | `$3 \cdot 4$` (sayılar), `$2x$` (değişken) | `3*4`, `3x4` |
| Açı ölçüsü | `$m(\widehat{ABC}) = 40^\circ$` | `ABC açısı 40 derece` (metin içinde olabilir ama tutarlı olun) |
| Uzunluk | `$\lvert AB \rvert = 5$` veya `$|AB| = 5$` | |
| Küme | `$A = \{1, 2, 3\}$`, `$s(A \cup B)$` | `{1,2,3}` (matematik dışında) |
| Aralık | `$[-1, 4)$` | |
| Yüzde | düz metinde `%25` | `$25\%$` (gerekmedikçe) |
| Birim | matematiğin dışında: `$12$ cm`, `48 km/sa` | `$12 cm$` |
| Türkçe sözcük | matematiğin **dışında**; zorunluysa `$\text{kişi}$` | `$x kişi$` |

Diğer kurallar:
- `$` tek satırda kapanmalıdır; matematik içinde satır kırma (`\\`), `\begin{...}` ortamları, matris ve renk komutları yoktur. Çok satırlı işlem gerekiyorsa her satırı ayrı `$$...$$` olarak yazın.
- Uzun ifade satır içinde (`$...$`) bırakılabilir: ekranda işlem işaretlerinden alt satıra bölünür. Ama tek parça büyük kesir/kök ifadeleri `$$...$$` ile ayrı satıra yazın.
- Para birimi olarak `$` gerekiyorsa `\$` yazın (Türkçe sorularda **TL** tercih edilir).
- Şıklar da LaTeX içerebilir: `A) $5\sqrt{3}$`. Şık metni sade olsun (yalnızca değer).

## 4. Şıklar ve sayısal değer

Derleyici her şıkkı sayıya çevirmeyi dener. Çevrilebilen biçimler:

```
12 · -3 · 3,5 · 1.250 · %25 · 48 km · 120°
$\frac{3}{4}$ · $-\dfrac{1}{2}$ · $2\frac{1}{3}$ · $5\sqrt{3}+2$ · $\sqrt[3]{4}$ · $2^{-3}$ · $3{,}5$ · $4\pi$ · $x = 7$ · $12$ cm
```

- Beş şık sayıya çevrilebiliyorsa: **iki şık sayısal olarak eşit olamaz** (ör. `6` ve `$\frac{12}{2}$`), ve `dogrulama: yok` yazılamaz.
- Değişkenli, küme, eşitsizlik, sözel ("Yalnız I", "I ve III") şıklar çevrilemez; bunlarda ya `dogrulama: yok` ya da (cevap yine de sayıysa) `degerler` yazılır.

## 5. Sayısal doğrulama (`dogrulama` / `degerler`)

Amaç: **yanlış cevap anahtarının yayına çıkmasını imkânsız kılmak.** Derleyici `dogrulama` ifadesini hesaplar; sonuç doğru şıkkın değerine eşit değilse veya başka bir şıkka eşitse hata verir (`CEVAP ANAHTARI HATALI`).

- İfade, cevabı **sorudaki verilerden hesaplamalıdır**; cevabın kendisini yazmak (`dogrulama: 6`) doğrulama değildir. Ör. hız problemi: `dogrulama: 240 / (60 + 20)`.
- Değişkenli sorularda değişkene uygun bir değer koyun: `(2^(5+3) - 2^(5+1)) / 2^5` (x = 5).
- Birden çok adımlı problemde ara sonuçları ifadenin içine gömün: `8 + 8 / 2 + 2 * (8 / 2)`.
- `degerler`: şıklar sayıya çevrilemediğinde (ör. `A) $3a$` ve a = 4 verilmişse) 5 değeri `|` ile ayırarak yazın: `- degerler: 12 | 8 | 16 | 20 | 24`. Çevrilebilen şıklarla çelişirse derleyici hata verir.
- Sözel / öncüllü / sıralama sorularında `- dogrulama: yok`.

**İfade dili** (güvenli hesaplayıcı, `tools/math/expr.mjs`):

```
+ - * / ^ (üs, sağdan) % (mod) ( )      örtük çarpım: 2x, 3(x+1), 2pi
sabitler: pi, e
sqrt(x) cbrt(x) root(n, x) abs(x) floor(x) ceil(x) round(x) min(a, b) max(a, b)
log(x) [10 tabanı]  ln(x)  log2(x)  sin(d) cos(d) tan(d) [derece]
fact(n)  C(n, r)  P(n, r)  gcd(a, b)  lcm(a, b)
```

Örnekler: olasılık `C(4,2) * C(6,1) / C(10,3)`, EBOB `gcd(84, 126)`, mod `(7^3) % 5`, Pisagor `sqrt(6^2 + 8^2)`, kök sadeleştirme `sqrt(75) - sqrt(12)`.

## 6. Şekiller (`**Şekil:**`)

Şekil, bir JSON **tarif** olarak yazılır; derleyici bunu tema uyumlu SVG'ye çizer (çizgiler açık temada koyu, koyu temada açık görünür). SVG veya resim bağlantısı yazılmaz. Şekil içindeki yazılar **LaTeX değildir**: `²`, `³`, `√`, `π`, `°`, `α`, `β`, `θ`, `·` gibi Unicode karakterler kullanılır.

Genel kurallar:
- Şekil cevabı **vermez**: aranan uzunluk/açı `x` veya `?` ile gösterilir.
- Ölçüler gerçeğe uygun çizilir: koordinatları verilen uzunluk ve açılara göre hesaplayın (ör. 40°'lik ikizkenar üçgen). Uygun değilse soru metnine "(Şekil ölçekli değildir.)" ekleyin.
- Bir soruda tek şekil vardır. Şıkların şekil olduğu soru yazılmaz.

### 6.1 `geometry` — üçgen, dörtgen, çember, açı, koordinat düzlemi

```json
{
  "kind": "geometry",
  "points": { "A": [1.71, 4.698], "B": [0, 0], "C": [3.42, 0], "D": [2.62, 2.199] },
  "shapes": [
    { "type": "polygon", "points": ["A", "B", "C"] },
    { "type": "segment", "from": "B", "to": "D", "ticks": 2 },
    { "type": "segment", "from": "B", "to": "C", "ticks": 2 },
    { "type": "angle", "vertex": "A", "from": "B", "to": "C", "label": "40°", "radius": 26 },
    { "type": "angle", "vertex": "B", "from": "D", "to": "A", "label": "x", "radius": 30 }
  ]
}
```

| Alan | Açıklama |
|---|---|
| `points` | Ad → `[x, y]` (matematik ekseni: **y yukarı**). Ölçek otomatik. Adlar noktaların yanına yazılır. |
| `shapes[]` | Aşağıdaki öğeler, yazıldığı sırayla çizilir. |
| `dots` | İçi dolu nokta işareti konacak noktalar: `["A", "B"]` |
| `hideLabels` | Adı yazılmayacak noktalar: `["O"]` |
| `labelPos` | Ad konumu: `{"A": "tr"}` → `top bottom left right tl tr bl br` (varsayılan: şeklin merkezinden dışarı) |
| `pointLabels` | `false` → hiçbir nokta adı yazılmaz |
| `axes` | Koordinat düzlemi: `{"x": [-1, 7], "y": [-1, 5], "step": 1, "grid": true, "labels": true, "xLabel": "x", "yLabel": "y"}` |
| `functions[]` | Grafik: `{"expr": "x^2 - 1", "domain": [-3, 3], "label": "f(x)", "labelAt": 2, "dashed": false}` (ifade dili §5) |
| `width`, `height` | En büyük çizim alanı (px, varsayılan 340×260) |

| Öğe (`type`) | Alanlar |
|---|---|
| `polygon` | `points` (sıralı), `fill` (taralı), `fillOpacity`, `dashed` |
| `segment` | `from`, `to`, `label` (ör. `"5 cm"`, `"x"`), `labelSide` (`"in"` içeri), `ticks` (eşitlik çentiği 1–3), `dashed` |
| `circle` | `center` + `radius` **veya** `through` (çember üstündeki nokta), `fill`, `dashed` |
| `sector` | `center`, `from`, `to` (saat yönünün tersine taralı daire dilimi) |
| `angle` | `vertex`, `from`, `to` (iki ışın arasındaki 180°'den küçük açı işaretlenir), `label`, `radius`, `right: true` (dik açı kare işareti), `double: true` (çift yay), `fill` |
| `label` | `at` (nokta adı veya `[x, y]`), `text`, `dx`, `dy`, `size` |

Bir nokta adı yerine doğrudan koordinat da yazılabilir: `"from": [0, 0]`.

### 6.2 `bar` — sütun grafiği

```json
{ "kind": "bar", "categories": ["Pzt", "Sal", "Çar"], "values": [12, 18, 9], "title": "Satışlar", "yLabel": "Adet", "xLabel": "Gün", "yStep": 5, "yMax": 30, "valueLabels": true }
```
`valueLabels: false` → sütun üstündeki değerler yazılmaz (değeri okumayı soran sorularda).

### 6.3 `line` — çizgi grafiği (bir veya birkaç seri)

```json
{ "kind": "line", "categories": ["2021", "2022", "2023"], "series": [{ "name": "Gelir", "values": [40, 55, 50] }, { "name": "Gider", "values": [30, 35, 45] }], "yLabel": "Bin TL", "title": "..." }
```
Seriler çizgi deseniyle (düz, kesikli, noktalı) ayrılır; birden çok seride açıklama otomatik eklenir.

### 6.4 `pie` — daire grafiği

```json
{ "kind": "pie", "slices": [{ "label": "Tarih", "value": 27 }, { "label": "Coğrafya", "value": 18 }], "show": "percent" }
```
`show`: `percent` (varsayılan) · `degree` · `value` · `none` (oranı soran sorularda).

### 6.5 `table` — tablo

```json
{ "kind": "table", "headers": ["Ürün", "Fiyat (TL)"], "rows": [["Kalem", "12"], ["Defter", "30"]] }
```

### 6.6 `venn` — 2 veya 3 kümeli Venn şeması

```json
{ "kind": "venn", "universe": "E", "sets": ["A", "B"], "regions": { "A": "8", "AB": "x", "B": "2x", "out": "4" } }
```
Bölgeler: 2 kümede `A B AB out`; 3 kümede `A B C AB AC BC ABC out` (yalnızca o bölgeye ait eleman sayısı).

### 6.7 `numberline` — sayı doğrusu

```json
{ "kind": "numberline", "min": -3, "max": 6, "step": 1, "intervals": [{ "from": -1, "to": 4, "toOpen": true }], "points": [{ "at": 5, "label": "a", "open": true }] }
```
`from` yazılmazsa aralık −∞'a, `to` yazılmazsa +∞'a uzanır. `fromOpen`/`toOpen`/`open` → boş (dahil değil) çember.

### 6.8 `flow` — kutu-ok şeması (işlem makinesi, sayısal mantık)

```json
{ "kind": "flow", "nodes": [{ "id": "a", "text": "x", "at": [0, 0], "shape": "circle" }, { "id": "b", "text": "3x + 2", "at": [2, 0] }], "edges": [{ "from": "a", "to": "b", "label": "×3" }] }
```
`at` ızgara konumudur (`[sütun, satır]`, 1 birim = 80 px); `shape`: `box` (varsayılan) veya `circle`.

## 7. İçerik kuralları

- **Özgünlük:** Kaynaklardaki (ÖSYM çıkmış soruları, yayınevi denemeleri, ders notları) hiçbir soru, sayı kurgusu veya cümle birebir ya da çok yakın biçimde kullanılmaz. Kaynaklar yalnızca konu kapsamı, soru tarzı ve zorluk referansıdır. Soru metninde yıl/ÖSYM atfı yazılmaz.
- **Tek doğru cevap:** Soru yalnızca bir şıkla doğrulanmalı; kökte gereken tüm koşullar (pozitif tam sayı, farklı rakamlar vb.) yazılmalı.
- **Çeldiriciler:** Her yanlış şık gerçek bir hatadan gelmeli (işaret hatası, birim çevirme, ½'yi unutma, EBOB yerine EKOK, medyan-ortalama karışıklığı…). Saçma, kolay elenen şık yazılmaz.
- **Doğru şık dağılımı:** Bir dosyada doğru şıklar A–E arasında dengeli dağılır (her harf yaklaşık %20; derleyici dağılımı yazar).
- **Zorluk dağılımı (konu başına):** yaklaşık %30 kolay (1), %50 orta (2), %20 zor (3).
- **KPSS düzeyi:** Lisans/ön lisans/ortaöğretim GY ortak havuzu; ileri lise konuları (türev, integral, trigonometri ayrıntısı) yazılmaz.
- **Dil:** Türkçe yazım kuralları; sayılar Türkçe biçimde (3,5 · 1.250); "kaçtır?", "kaç TL'dir?" gibi KPSS kalıpları.
- Emoji, HTML, bağlantı, Markdown kalın/italik (soru metninde) kullanılmaz.

## 8. Komutlar

```bash
# Doğrula (hata varsa çıkış kodu 1, SQL yazılmaz)
node tools/math/compile_questions.mjs --check

# Tek dosya + görsel önizleme (_onizleme.html tarayıcıda açılır; açık/koyu tema düğmesi var)
node tools/math/compile_questions.mjs --file docs/soru_havuzu/matematik/05_uslu_ve_koklu_ifadeler.md --check --preview

# SQL üret → docs/soru_havuzu/matematik/sql/NN_konu.sql
node tools/math/compile_questions.mjs

# Araçların kendi testleri
node --test tools/math/
```

Derleyicinin denetledikleri: ön bilgi ve kanonik konu · kimlik biçimi ve tekrarı · zorluk/doğru şık · 5 farklı şık · zorunlu bölümler ve uzunlukları · tuzakta şık harfi · LaTeX (izinli komut, kapanmamış `$`, dengesiz `{}`, matematik dışında kalmış komut, KaTeX ile gerçek render) · şekil tarifi · sayısal doğrulama ve cevap anahtarı · aynı soru metninin tekrarı.

Yükleme sırası (Supabase SQL Editor): önce bir kez `docs/supabase_migrations/12_math_figures.sql`, sonra `sql/NN_konu.sql` dosyaları. SQL idempotenttir; aynı dosya tekrar çalıştırılırsa sorular çiftlenmez, güncellenir.
