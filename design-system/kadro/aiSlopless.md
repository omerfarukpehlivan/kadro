# 🛡️ aiSlopless: Yapay Zekâ Klişelerinden Arındırılmış UI/UX Tasarım ve Mühendislik Manifestosu

> Bu doküman, yapay zekâ (AI) modellerinin arayüz üretirken varsayılan olarak sergilediği ucuz, kalabalık ve klişe tasarım reflekslerini (**"AI Slop"**) engellemek; Stripe, Linear, Apple ve Vercel kalitesinde temiz, amaca hizmet eden ve editoryal düzeyde profesyonel ürünler inşa etmek için hazırlanmış bağlayıcı kurallar bütünüdür.
> 
> **Her yeni projede, bileşende ve ekran tasarımında bu kurallar baz alınmalıdır.**

---

## 🚫 1. Kural: Rastgele Renkli Durum Noktaları Yasağı (No Colored Dots Slop)

* **AI Slop Refleksi:** AI modelleri hemen her listenin, başlığın, konu satırının veya oturum kartının başına yeşil, sarı, mavi minik yuvarlaklar (`rounded-full size-2 bg-emerald`, `bg-amber`, `bg-blue`) serpiştirir. Bu durum ekranda gereksiz bir "renkli boncuk / Noel ağacı" gürültüsü yaratır ve profesyonel olmayan yapay bir prototip hissi verir.
* **aiSlopless Standardı:** 
  - Liste satırlarının başına sebepsiz renkli daireler koyulmaz.
  - Bir durum (çözüldü, beklemede, sıradaki); satırın hover durumu, tipografi hiyerarşisi, sade bir semantik ikon (örneğin sadece çözülmüşlerde `CheckCircle`) veya sağ kenardaki net/başarı rozeti ile zarifçe ifade edilir.
  - Nokta sadece canlı/kritik bir bağlantı durumunu (örn. `Live`, `Recording`) göstermek gibi gerçek bir amaca hizmet ediyorsa kullanılır.

---

## 📦 2. Kural: Kart İçinde Kart Kutucukları Yasağı (No Nested Cards / Box-in-a-Box)

* **AI Slop Refleksi:** Bir kart oluşturup (`rounded-2xl border bg-card p-6`), içine tekrar kenarlıklı, gölgeli mini kutucuklar (`space-y-3` içinde `rounded-xl border border-border bg-card p-3`) doldurmak. Bu yaklaşım çift dolgu (`double padding`), gereksiz çizgi kalabalığı ve ciddi bir dikey boşluk israfı yaratır.
* **aiSlopless Standardı:**
  - Tek bir ana dış kart kullanılır: `overflow-hidden rounded-2xl border border-border bg-card shadow-2xs`.
  - Kart başlığı: `border-b border-border bg-muted/20 px-5 py-3.5 sm:px-6`.
  - İçerik listesi: İç içe kutular yerine kenarlara sıfır (flush) oturan, ince ayraç çizgileriyle ayrılmış satırlar kullanılır: `divide-y divide-border`.
  - Satır dolgusu: `px-5 py-3.5 sm:px-6 hover:bg-muted/35 transition-colors`.

---

## 🎭 3. Kural: Maskot ve İkon Enflasyonu / Tekrar Yasağı (No Duplicate Avatar/Ring Slop)

* **AI Slop Refleksi:** Aynı viewport içinde; hem üstteki sekme butonlarında minik maskot/halka, hem de hemen 20px altındaki ana kartta büyük maskot ve ilerleme halkası kullanmak. Aynı ekranda aynı karakterin ve dairenin üst üste tekrar etmesi hiyerarşiyi sıfırlar.
* **aiSlopless Standardı:**
  - Maskot ve büyük ilerleme halkası ekranın **tek bir "Hero" odak noktasında** güçlü ve prestijli şekilde konumlandırılır.
  - Üst gezinme sekmelerinde maskot tekrarlanmaz; bunun yerine amaca yönelik sade semantik ders/kategori ikonları (`Scroll`, `Compass`, `Scales`, `Newspaper`) ve net tipografi kullanılır.

---

## 🎯 4. Kural: Buton Spami ve Parlak Renk Kirliliği Yasağı (No CTA Button Spam)

* **AI Slop Refleksi:** Tablodaki veya listedeki 10-15 satırın her birine parlak mavi, kalın kenarlıklı "Çöz", "Detay", "İncele" butonu basmak. Kullanıcının dikkati dağılır, hangi adımın öncelikli olduğu kaybolur.
* **aiSlopless Standardı:**
  - Satırın tamamı tıklanabilir (`<Link>` veya `<button>`) olmalı ve hover edildiğinde arka plan tonu hafifçe değişmelidir (`hover:bg-muted/35`).
  - Yalnızca **birincil eylem** (örneğin sıradaki çözülmesi gereken test) birincil buton rengiyle (`bg-primary text-primary-foreground`) vurgulanır. Diğer satırlar şık ve pasif bir yön oku (`ArrowRight`) veya sade bir metin taşır.

---

## 📏 5. Kural: Asimetrik ve Standartsız Boşluklar Yasağı (No Unstandardized Spacing)

* **AI Slop Refleksi:** Bir bileşende sol boşluğu `sm:pl-15` (60px), sağ boşluğu `px-6` (24px) yapmak; ya da dış karta rastgele `p-6` verip iç tablonun ayraç çizgilerini kartın kenarlarına 24px kala bitirerek eğreti bir çerçeve bırakmak.
* **aiSlopless Standardı:**
  - Tüm kart başlıkları, alt tablolar ve liste satırları **aynı simetrik yatay dolguya** kilitlenir: `px-5 sm:px-6`.
  - Masaüstü ızgarası: Başlık sütunları ile veri satırları aynı 12 sütunluk ızgarayı paylaşır (`md:grid-cols-12 md:gap-4` veya `md:gap-6`).
  - Dış kartlar `p-0 overflow-hidden` olur; satırlar kartın sol ve sağ sınırlarına tam oturur.

---

## 📐 6. Kural: Zikzak Çizen Değişken Genişlikler Yasağı (No Zig-Zag Layout Slop)

* **AI Slop Refleksi:** Rozetlerin (badge) içeriğindeki metin uzunluğuna göre esneyip yanındaki soru sayısı etiketini veya butonunu her satırda farklı bir yatay x-koordinatına itmesi (zikzak görünüm).
* **aiSlopless Standardı:**
  - Değişken metinli rozetler sabit genişlikli slotlara sarılır (örneğin `w-36 shrink-0` veya ızgarada `md:col-span-2`).
  - Test etiketleri sabit genişliktedir (`w-16 shrink-0 font-mono`).
  - Sağdaki eylem butonları pikseli pikseline aynı sağ kenar sınırında (`h-7 min-w-[84px]`) biter.

---

## 🎬 7. Kural: Kullanıcıyı Görsel Olarak Yarı Yolda Bırakmama (Auto-Scroll & Focus)

* **AI Slop Refleksi:** Akordeon açıldığında, sekme değiştirildiğinde veya soru çözüldüğünde yeni açılan içeriğin ekranın altında veya dışında kalması; kullanıcının her seferinde elle aşağı kaydırmaya zorlanması.
* **aiSlopless Standardı:**
  - Bir içerik açıldığında veya durum onaylandığında akıllı `smooth scroll` ile içerik görüş alanına taşınır:
    `element.scrollIntoView({ behavior: "smooth", block: "start" | "nearest" })`.
  - Üstte yapışkan menü (`sticky header`) varsa, başlığın menünün altına girmemesi için daima `scroll-mt-20 md:scroll-mt-24` nefes payı tanımlanır.
  - Kullanıcı klavye/ekran okuyucu ile devam edebilsin diye birincil butona otomatik odak (`target.focus({ preventScroll: true })`) verilir.

---

## 🕊️ 8. Kural: Yapay & Abartılı Giriş Animasyonları Yasağı (No Animation Slop)

* **AI Slop Refleksi:** Sayfa açılırken ekrandaki 10 kartın her birine yapay `.animate().fadeIn().slideY().scale()` basmak. Arayüzü yavaşlatır, cihazı yorar ve tipik bir "hazır yapay zekâ şablonu" hissi verir.
* **aiSlopless Standardı:**
  - Liste ve kart girişlerinde yapay uçuşma efektleri kullanılmaz; sayfalar anında ve net render edilir.
  - Animasyon yalnızca gerçek durumsal geri bildirimlerde (hover renk geçişi `transition-colors`, odak halkası, akordeon açılışı veya başarı konfetisi) mikroskobik düzeyde kullanılır.

---

## 🖋️ 9. Kural: Editoryal Tipografi ve Rakam Standardı (Typographic Discipline)

* **AI Slop Refleksi:** Bütün metinlere aynı font ailesini basmak, sayıları orantısal fontla yazıp sütunların titremesine (sayı basamaklarının hizasızlığına) sebep olmak.
* **aiSlopless Standardı:**
  - Başlıklar: Karakterli ve tok (`font-heading`, örn. `Outfit`).
  - Gövde Metinleri: Üst düzey okunabilirlik (`DM Sans`).
  - Süre, soru sayısı, net skoru, yüzde ve test numaraları: **Daima** `font-mono tabular-nums`. Bu sayede sayılar alt alta geldiğinde basamakları asla kaymaz.

---

## 🎛️ 10. Kural: Seçenekleri Kutu Kutu Karta Boğma Yasağı — Dropdown Önceliği (No Option Card Explosion Slop)

* **AI Slop Refleksi:** Formlarda, ayarlarda veya filtrelerde 3-5 tane seçenek varken her bir seçenek için koca koca kartlar (`grid-cols-2` veya `grid-cols-3` içinde `p-3.5 rounded-xl border`), başlıklar ve açıklamalar basmak. Bu yaklaşım formu anında bir "kutu mezarlığına" çevirir, dikey alanı tüketir ve arayüzü aşırı karmaşıklaştırır.
* **aiSlopless Standardı:**
  - Seçenek sunulan ayarlarda (Sınav Ailesi, Öğrenim Düzeyi, Test Kapsamı, Çözüm Modu, Yazı Boyutu, Sınav Yılı, Günlük Hedef vb.) standart, kompakt ve erişilebilir Dropdown (`Select`) bileşenleri kullanılır.
  - Seçeneklerin açıklamaları dropdown item'ı içinde `— {açıklama}` formatında zarifçe verilir.
  - Kartlı seçimler yalnızca zengin görsel preview veya şema gerektiren nadir onboarding adımlarında tercih edilir; ayar ve profil sayfalarında form bütünlüğü korunur.

---

## 💡 Sonraki Projeler İçin Hızlı Kontrol Listesi (Checklist)

Yeni bir ekran veya bileşen teslim etmeden önce sor:
- [ ] Listelerin başında gereksiz renkli yuvarlaklar/boncuklar var mı? *(Kaldır!)*
- [ ] Kart içinde kart kutucukları var mı? *(Tek dış karta al, `divide-y` yap!)*
- [ ] Her seçenek için ayrı ayrı kartlar yapılıp ekran kutu mezarlığına çevrilmiş mi? *(Standart Dropdown `Select` kullan!)*
- [ ] Aynı maskot/ikon aynı ekranda mükerrer mi? *(Tek bir hero alana topla!)*
- [ ] Satırların başında ve sonunda boşluklar simetrik ve eşit mi? *(Standart `px-5 sm:px-6` yap!)*
- [ ] Butonlar veya rozetler her satırda zikzak çiziyor mu? *(Sabit ızgaraya veya genişliğe sabitle!)*
- [ ] Akordeon açılınca içerik ekran dışında kalıyor mu? *(Smooth scroll + focus ekle!)*
- [ ] Sayılar basamak hizalı mı? *(`font-mono tabular-nums` kullan!)*
