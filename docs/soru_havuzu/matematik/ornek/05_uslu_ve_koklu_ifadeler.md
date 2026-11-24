---
ders: Matematik & Geometri
konu: Üslü ve Köklü İfadeler
kod: mat
kapsam: [lisans_gygk, b_grubu_gygk]
---

### mat-05-901
- zorluk: 1
- dogru: C
- dogrulama: sqrt(75) - sqrt(12) + sqrt(27)

**Soru:**
$\sqrt{75} - \sqrt{12} + \sqrt{27}$ işleminin sonucu kaçtır?

**Şıklar:**
A) $4\sqrt{3}$
B) $5\sqrt{3}$
C) $6\sqrt{3}$
D) $7\sqrt{3}$
E) $10\sqrt{3}$

**Açıklama:**
Her kök, içindeki en büyük tam kare çarpan dışarı çıkarılarak $\sqrt{3}$ cinsinden yazılır: $\sqrt{75}=\sqrt{25\cdot 3}=5\sqrt{3}$, $\sqrt{12}=\sqrt{4\cdot 3}=2\sqrt{3}$, $\sqrt{27}=\sqrt{9\cdot 3}=3\sqrt{3}$. Benzer terimlerin katsayıları toplanır: $5-2+3=6$, sonuç $6\sqrt{3}$ olur.

**Çeldirici Tuzağı:**
E şıkkı ($10\sqrt{3}$), kökleri doğru sadeleştirip işaretleri gözden kaçıran adayı yakalar: $5+2+3=10$. Ortadaki terimin önündeki eksi, sadeleştirmeden sonra da katsayıya taşınmalıdır.

### mat-05-902
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
Paydaki iki terimde de $2^{x}$ ortak çarpandır: $2^{x+3}-2^{x+1}=2^{x}\left(2^{3}-2^{1}\right)=2^{x}\cdot 6$. Paydadaki $2^{x}$ ile sadeleşince ifadenin değeri $x$'ten bağımsız olarak 6 bulunur.

**Çeldirici Tuzağı:**
C şıkkı (4), üslü sayıların farkını üslerin farkıyla karıştırıp $2^{(x+3)-(x+1)}=2^{2}$ yazan adayı yakalar. Bölmede üsler çıkarılır; çıkarmada ise önce ortak çarpan parantezine alınmalıdır.

### mat-05-903
- zorluk: 3
- dogru: A
- dogrulama: yok

**Soru:**
$a=\sqrt{2}$, $b=\sqrt[3]{3}$ ve $c=\sqrt[6]{10}$ olduğuna göre aşağıdaki sıralamalardan hangisi doğrudur?

**Şıklar:**
A) $a<b<c$
B) $a<c<b$
C) $b<a<c$
D) $c<a<b$
E) $c<b<a$

**Açıklama:**
Kök dereceleri 2, 3 ve 6'nın ortak katı 6 olduğundan sayıların altıncı kuvvetleri karşılaştırılır: $a^{6}=\left(2^{1/2}\right)^{6}=2^{3}=8$, $b^{6}=\left(3^{1/3}\right)^{6}=3^{2}=9$, $c^{6}=10$. Pozitif sayılarda kuvvetlerin sırası sayıların sırasını korur: $8<9<10$ olduğundan $a<b<c$ bulunur.

**Çeldirici Tuzağı:**
E şıkkı, kök derecesi büyüdükçe sayının büyüyeceğini sanan adayı yakalar; oysa kökün içindeki sayı ve derece birlikte değerlendirilmelidir. Dereceleri eşitlemeden yalnızca kök içlerine (2, 3, 10) bakan aday da sonucu tesadüfen doğru bulur ama gerekçesi yanlıştır.
