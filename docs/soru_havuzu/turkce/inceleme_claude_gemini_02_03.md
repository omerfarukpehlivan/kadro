# `gemini_02_parti.sql` ve `gemini_03_parti.sql` — Claude Denetim Raporu

**Tarih:** 2026-11-21 · **Denetlenen:** 60 soru (02: 30 paragraf; 03: 10 paragraf, 8 yazım, 7 noktalama, 5 anlatım bozukluğu) · **Yöntem:** Her soru, açıklamaya bakmadan bağımsız çözüldü; sonra anahtar, açıklama ve tuzakla karşılaştırıldı. Telif ve tekrar için kaynak metinler ve mevcut havuzla otomatik karşılaştırma yapıldı.

## Özet
| Dosya | Soru | Sorunsuz | Dikkat | Sorunlu |
|---|---:|---:|---:|---:|
| `gemini_02_parti.sql` | 30 | 29 | 1 | 0 |
| `gemini_03_parti.sql` | 30 | 17 | 4 | 9 |

- **Paragraf sorularının tamamı (gemini_02 + gemini_03'ün ilk 10'u) sağlam.** Anahtarlar doğru, parçalar özgün ve tutarlı.
- **Sorun, dil bilgisi türü sorularda yoğunlaşıyor** (yazım, noktalama, anlatım bozukluğu). Bu alan kuralların TDK'ya göre kesin olmasını gerektirir ve Gemini birkaç kuralı yanlış ya da tartışmalı kullanmış.
- **Telif/tekrar:** Parça ve şıklarda kaynaktan kopya yok; yalnızca standart soru kökü eşleşiyor. Mevcut havuzla içerik tekrarı yok.
- **Yapı:** 5 farklı şık, geçerli indeks, doğru şıklar A–E arasında 6'şar dağılmış.

## Öncelik 1 — Cevabı geçersiz kılan sorunlar (`gemini_03_parti.sql`)
| # | Soru | Sorun | Güven |
|---|---|---|---|
| 11 | Yazım yanlışı (yer altı / ön yargı / ön söz / alt geçit) | Gemini açıklamasında "ön yargı, ön söz, alt geçit ayrı yazılır" diyor. TDK sözlüğünde bunlar bitişik yazılır (**önyargı, önsöz, altgeçit**); "yeraltı" da büyük olasılıkla bitişik. Dolayısıyla şıkların çoğunda "hata" var, doğru şık yok. "Somut yer bildirince ayrı, mecazda bitişik" kuralı TDK'da yok. | Yüksek (TDK sözlüğünden doğrulanmalı) |
| 16 | Sayı yazımı ("2'şer" yanlış) | TDK, rakamla yazılan sayılara ek getirilirken kesme kullanılmasını kabul eder (5'er, 2'şer). Bu durumda "2'şer" yanlış değildir ve diğer şıklar da doğru olduğu için doğru şık kalmaz. | Orta-yüksek |
| 21 | Virgül yanlış kullanılmıştır ("Eve geldiğinde, yorgunluktan…") | Zarf-fiil yan cümleciğinden sonra virgül konması yaygın ve kabul görür; "yanlış" denemez. Soruda gerçekten yanlış bir virgül yok. | Orta-yüksek |
| 28 | Anlatım bozukluğu ("hem özel hem de devlet okulları") | Bu yapı doğaldır; "özel okulları" biçiminde bozuk bir tamlama doğmaz. Şıklarda net bir bozukluk yok. | Yüksek |
| 29 | Anlatım bozukluğu (ortak nesne) | Anahtar (C, "Kardeşimi ... destek oluyorum") doğru. Ancak A şıkkı ("Genç yazarı çok takdir ediyor, eserlerini ilgiyle okuyoruz") "ediyor ↔ okuyoruz" kişi uyumsuzluğu taşıyor (muhtemelen "ediyoruz" olacaktı). İki bozuk şık oluşuyor. | Yüksek |

## Öncelik 2 — Tartışmalı kural, ikinci doğru şık riski
| # | Soru | Sorun |
|---|---|---|
| 03-20 | Noktalı virgül yerinde | Anahtar (virgüllü gruplar) doğru ve klasik. Ancak A şıkkındaki "Güneş doğdu; kuşlar…" cümlesi TDK'da bağımsız yakın cümleleri ayırmak için kabul edilir; iki doğru ihtimali var. |
| 03-23 | Noktalama yanlışı yoktur | Anahtar (A) doğru. B şıkkındaki "…kullanın," dedi. yazımı (virgül tırnak içinde) yaygın ve kabul gören bir biçim; "yanlışı yoktur" sorusunda ikinci doğru şık sayılabilir. |
| 03-12 | Büyük harf yanlışı | Anahtar (E, "Haziran") doğru. Açıklamadaki kural yanlış: ay adları "gün sayısıyla kullanılmasa" değil, her zaman küçük harfle yazılır (özel ad parçası olmadıkça). |
| 03-4 | Deniz feneri sıralaması | Sıralama doğru. Ancak "gündüz nemli otlarla duman çıkarma" iddiası tarihsel olarak doğrulanmalı; sağlam bir kaynağa dayanmıyorsa "bazı işaret kulelerinde" gibi temkinli yazılmalı. |

## Öncelik 3 — Küçük noktalar
- `gemini_02` #26 (seçim haritaları): Bölme noktası IV, II'nin "haritalar" göndermesi nedeniyle hafif belirsiz; cevap yine de savunulabilir.
- `gemini_02` #22: Soru kökü "hangilerine" diye iki yöntem soruyor; ÖSYM tek yanıtlı sorar. Zorunlu değil.
- Zayıf çeldirici: `gemini_02` #30 ve `gemini_01` #30'daki "Hem açıklayıcı hem tartışmacı anlatım" şıkkı saçma biçimde kolay elenir.
- "Doğru şık en uzun şık": `gemini_02` 15/30, `gemini_03` 11/30 (`gemini_01` 18/30). 03. parti daha dengeli.

## Önerilen sıra
1. `gemini_03` #11, #16, #21, #28, #29: yeniden yazılmalı ya da çıkarılmalı (TDK doğrulaması şart).
2. `gemini_03` #20, #23: ikinci doğru şıkkı kaldıracak biçimde çeldiriciler değiştirilmeli.
3. #12 açıklaması düzeltilmeli; #4 tarihsel iddia yumuşatılmalı.

> **Güncelleme (aynı gün):** Kullanıcı onayıyla `gemini_03_parti.sql` içinde şunlar yapıldı: #11 (ya da/yada yazımı), #16 (45'inci sayı yazımı), #21 ("ve," virgül hatası) ve #28 (özne-yüklem kişi uyumsuzluğu) yeniden yazıldı; #29'daki A şıkkı "ediyoruz" olarak düzeltildi; #20 ve #23'te ikinci doğru şık riski taşıyan çeldiriciler netleştirildi; #12'nin açıklaması ve #4'ün tarihsel iddiası düzeltildi. Dosyanın satır sonları CRLF'den LF'ye çevrildi (yedek scratchpad'de). `gemini_02_parti.sql` değişmedi.
