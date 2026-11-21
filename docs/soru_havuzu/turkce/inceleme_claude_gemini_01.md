# `gemini_01_parti.sql` — Claude Denetim Raporu

**Tarih:** 2026-11-21 · **Denetlenen:** 30 soru (hepsi Paragrafta Anlam ve Yapı) · **Yöntem:** Her soru, açıklamaya bakmadan bağımsız çözüldü; ardından anahtar, açıklama ve tuzak metniyle karşılaştırıldı. Telif ve tekrar için kaynak metinler ve mevcut havuzla otomatik karşılaştırma yapıldı.

## Sonuç
- **Cevap anahtarı:** 30 sorunun 30'unda doğru şık doğru. Birden çok doğru şık ya da yanlış anahtar bulunmadı.
- **Yapı:** 5 farklı şık, geçerli `correctIndex`, doğru şıklar A–E arasında 6'şar dağılmış, zorluk 10 orta / 20 zor.
- **Açıklama ve tuzak metinleri:** Şıklara harfle değil içerikle gönderme yapıyor; somut ve soruya özgü. (Benim önceki partilerimdeki "ilk cümle" hatası burada yok.)
- **Telif:** Kaynak dosyalarla 6 kelimelik örtüşme yalnızca standart soru kökünde ("Bu parçada boş bırakılan yere düşüncenin akışına göre…") çıktı. Parça ve şıklarda kopya yok. Mevcut havuzla içerik benzerliği yok.

## Dikkat edilecek noktalar (hiçbiri cevabı bozmuyor)
| # | Soru | Sorun | Öneri |
|---|---|---|---|
| 11 | Tuzlanma, paragraf bölme | Bölme noktası IV (çözüme geçiş) olarak verilmiş. V cümlesi "Ne var ki bu iyileştirme çalışmaları…" diyerek IV'e bağlı olduğu için doğru, ama "Ne var ki" yeni paragraf başlangıcı gibi de okunabilir. Hafif belirsizlik. | V cümlesindeki "Ne var ki" yerine "Üstelik" gibi sürekliliği belirginleştiren bir bağ kullanılabilir. |
| 29 | Meyve suyu, paragraf bölme | Bölme noktası IV ("Ancak bu fark…") verilmiş. Ancak IV, "bu fark" ile önceki üç cümleye bağlandığı için paragrafın sonu gibi de okunabilir; V ("Özellikle sabah öğününde…") yeni paragraf için daha güçlü bir aday. **En belirsiz soru.** | IV'ün başındaki "Ancak bu fark" ifadesini kaldırıp IV'ü bağımsız bir öneri cümlesine çevirin ya da soruyu "baştan dördüncü cümle" gibi tek yanıtlı bir tipe dönüştürün. |
| 8 | Mantar ağları, cümle işlevi | Ağaçların mantar ağıyla karbon aktarması ve komşuları kimyasal uyarması bilimsel olarak tartışmalı bir alan ("ormanın internet'i" anlatısı). Cevap (II. cümle yaygın algıyı düzeltir) bundan etkilenmiyor, ancak olgu iddiası sağlam kaynağa dayandırılmalı. | İddiayı "bazı araştırmalar … öne sürüyor" gibi temkinli ifadeye çevirin. |
| 22 | Kavşak, düşünceyi geliştirme | Tema, benim havuzumdaki trafik ışıkları sorusuyla yakın (kavşak/trafik). İçerik farklı. | Gerekirse tema değiştirilebilir; zorunlu değil. |

## Genel gözlem: "en uzun şık" ipucu
- Gemini'nin partisinde doğru şık, 30 sorunun **18'inde** (%60) en uzun şık; doğru şığın uzunluğu ortalama şık uzunluğunun 1,17 katı.
- Çeldiricilerde "her zaman, hiçbir zaman, yalnızca, tamamen, hiçbir" gibi mutlak ifadeler toplam 29 kez geçiyor; doğru şıklarda ise 5 kez. Deneyimli bir aday bu iki ipucuyla elemeyi içerikten bağımsız yapabilir.
- **Aynı eğilim benim 530 soruluk havuzumda da var:** doğru şık 530 sorunun 306'sında (%58) en uzun şık, oran ortalama 1,22. Yani bu bir Gemini sorunu değil, iki yazarın da ortak eğilimi. Çözüm olarak doğru şıkları kısaltmak ya da çeldiricileri aynı özgüllükte uzatmak gerekir.

## Önerilen düzeltme sırası
1. Soru 29 ve 11 (paragraf bölme belirsizliği).
2. Soru 8 (olgu iddiasının yumuşatılması).
3. Yükleme öncesi tüm havuzda "en uzun şık / mutlak ifade" dengesi için ayrı bir düzeltme turu (hem Gemini hem Claude partileri için).

> **Güncelleme (aynı gün):** Kullanıcı onayıyla 29, 11 ve 8 numaralı sorular düzeltildi: 29'da IV. cümle bağımsız bir öneri cümlesine çevrildi; 11'de V. cümlenin bağı "Üstelik" yapıldı; 8'de mantar ağı iddiası "bulgular / bazı araştırmalara göre / düşündürmektedir" biçiminde yumuşatıldı. 22 numaralı soru ve "en uzun şık" konusu bu turda değiştirilmedi.
