# Gemini'ye Geri Bildirim — Denetimde Bulunan Hatalar ve Doğrusu

Aşağıdaki metni Gemini'ye olduğu gibi yapıştır.

````text
Yazdığın `gemini_01_parti.sql`, `gemini_02_parti.sql` ve `gemini_03_parti.sql` dosyalarını bağımsız olarak denetledim. Paragraf sorularının tamamı sağlam çıktı; sorunlar yazım, noktalama ve anlatım bozukluğu sorularında yoğunlaştı. Aşağıdaki hataları bir daha yapma. Bu üç dosyadaki düzeltmeleri ben yaptım; yeni soru yazarken aynı hatalara düşmemen için nedenlerini yazıyorum.

## A. Cevabı geçersiz kılan hatalar (gemini_03)
1. **#11 Yazım — TDK'da olmayan kural uydurdun.** "Ön yargı, ön söz, alt geçit ayrı yazılır; yer altı somutsa ayrı, mecazsa bitişik" dedin. TDK sözlüğünde `önyargı`, `önsöz`, `altgeçit` bitişik yazılır; "somut ayrı / mecaz bitişik" diye bir kural yoktur. Sonuç: şıkların çoğunda "hata" çıktı, doğru şık kalmadı.
2. **#16 Sayı yazımı — "2'şer yanlıştır" dedin.** TDK, rakamla yazılan sayıya ek getirilirken kesme kullanılmasını kabul eder (5'er, 2'şer). "2'şer" yanlış değil; soruda doğru şık kalmadı.
3. **#21 Virgül — "Eve geldiğinde, yorgunluktan…" cümlesindeki virgülü yanlış saydın.** Zarf-fiil yan cümleciğinden sonra virgül kabul gören bir kullanımdır; "yanlış" diyemezsin. Soruda gerçekten yanlış virgül yoktu.
4. **#28 Anlatım bozukluğu — "hem özel hem de devlet okulları"nı bozuk tamlama saydın.** Bu yapı doğaldır, anlam bozulmaz. Şıklarda net bir bozukluk yoktu.
5. **#29 Anlatım bozukluğu — iki bozuk şık bıraktın.** Anahtar doğruydu, ama A şıkkında "Genç yazarı çok takdir ediyor, eserlerini ilgiyle okuyoruz" cümlesinde "ediyor ↔ okuyoruz" kişi uyumsuzluğu vardı (ben "ediyoruz" yaptım).

## B. İkinci doğru şık riski (gemini_03)
- **#20 Noktalı virgül:** Çeldiricide "Güneş doğdu; kuşlar…" gibi TDK'nın kabul ettiği bir kullanımı "yanlış" diye koydun. Çeldirici, tartışmasız yanlış olmalı.
- **#23 Noktalama yanlışı yoktur:** B şıkkındaki `…kullanın," dedi.` (virgül tırnak içinde) yaygın ve kabul gören yazım. "Yanlışı yoktur" sorularında diğer şıklar kesin yanlış olmalı.
- **#12 Büyük harf:** Cevap doğruydu (`Haziran` → `haziran`) ama gerekçeni yanlış yazdın: ay ve gün adları, "gün sayısıyla kullanılsa da kullanılmasa da" özel ad parçası olmadıkça küçük harfle yazılır.
- **#4 Deniz feneri:** "Gündüz nemli otlarla duman çıkarma" gibi tarihsel iddialar kaynağa dayanmıyorsa kesin dille yazma ("bazı kulelerde" gibi temkinli ol).

## C. Paragraf sorularında küçük aksaklıklar (gemini_01, gemini_02)
- **Paragraf bölme soruları:** Bölme noktasına gelen cümleyi "Ancak bu fark…" gibi önceki cümleye bağlayan bir ifadeyle başlatma; yeni paragrafın başı bağımsız olmalı. Bölme noktası tek olmalı (gemini_01 #29, #11).
- **Olgu iddiaları:** Bilimsel olarak tartışmalı konuları ("ağaçların mantar ağıyla haberleşmesi") "bulgular, bazı araştırmalara göre, düşündürmektedir" gibi temkinli ifadelerle yaz (gemini_01 #8).
- **Soru kökü:** "Hangilerine başvurmuştur?" gibi iki yanıt isteyen kökler yazma; ÖSYM tek yanıt sorar (gemini_02 #22).

## D. Yinelenen sorunlar
1. **Doğru şık en uzun şık:** gemini_01'de 18/30, gemini_02'de 15/30, gemini_03'te 11/30 soruda doğru şık en uzun şıktı. Çeldiricileri doğru şıkla aynı uzunluk ve özgüllükte yaz. İdeal oran: doğru şık en uzun şık olan soru sayısı yaklaşık 6/30.
2. **Mutlak ifadeli çeldiriciler:** "her zaman, hiçbir zaman, yalnızca, tamamen, hiçbir" sözcükleri yalnızca çeldiricilerde geçiyor (gemini_01'de 29 kez, doğru şıkta 5). Bu bir ipucu. Doğru şıkta da, çeldiricilerde de benzer oranda kullan veya hiç kullanma.
3. **Zayıf çeldirici:** "Hem açıklayıcı hem tartışmacı anlatım" şıkkı saçma ve kolay elenir (gemini_01 #30, gemini_02 #30). Çeldiriciler ciddi ve makul olmalı.

## E. Yazarken uyulacak kurallar (kontrol listesi)
- TDK'ya göre emin olmadığın bir kuralla soru yazma. Emin olduğun yaygın örnekleri kullan (ya da, hiçbir, birkaç, herhangi, her şey, fark etti, tespit etti, seyretti, zannetti, mahcup, birleşik fiil vb.).
- "Yanlış var" sorularında tek yanlış şık olsun; "yanlışı yoktur" sorularında diğer dört şık kesin yanlış olsun. Her şıkkı TDK kuralıyla tek tek sına.
- Bir kurala "TDK'ya göre…" diye gerekçe yazıyorsan bu kuralı gerçekten bildiğine emin ol; uydurma kural yazma. Emin değilsen "emin değilim" yaz.
- Yazım kılavuzunda tartışmalı olan şeylerden (tırnak içi virgül, noktalı virgülle bağımsız cümle ayırma, zarf-fiil sonrası virgül) çeldirici ya da anahtar üretme.
- Her soruyu yazdıktan sonra şıkları tek tek TDK ile, anlam ve mantık açısından yeniden sına: "Başka bir şık da doğru olabilir mi?"
- Paragraf sıralama ve bölme sorularında bağlaçları ve gönderme sözcüklerini ("bu", "bu nedenle", "ancak") kullanarak sırayı tek yapacak biçimde kur.
````
