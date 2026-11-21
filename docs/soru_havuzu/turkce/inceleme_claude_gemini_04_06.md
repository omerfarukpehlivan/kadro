# `gemini_04/05/06_parti.sql` — Claude Denetim Raporu

**Tarih:** 2026-11-21 · **Denetlenen:** 90 soru (04, 05, 06: 30'ar) · **Yöntem:** Her soru açıklamaya bakmadan bağımsız çözüldü; Sözel Mantık bulmacaları kaba kuvvetle (tüm permütasyonlar) doğrulandı; telif/tekrar otomatik karşılaştırıldı.

## Özet
| Dosya | Soru | Sorunsuz | Dikkat | Düzeltildi |
|---|---:|---:|---:|---:|
| `gemini_04_parti.sql` | 30 | 29 | 0 | 1 (#11) |
| `gemini_05_parti.sql` | 30 | 27 | 2 | 1 (#22) + #12 sıkılaştırıldı |
| `gemini_06_parti.sql` | 30 | 28 | 1 | 1 (#8) |

- **Bulmaca soruları:** 04 ve 06'daki tüm Sözel Mantık bulmacaları (sıralama, eşleştirme, yalancı, dolap) tek çözümlü ve anahtarlar doğru.
- **Yapı:** 5 farklı şık, geçerli indeks, konu adları birebir doğru, doğru şıklar A–E arasında 6'şar dağılmış.
- **Telif/tekrar:** Parça ve şıklarda kaynaktan kopya yok (yalnızca standart soru kökü eşleşiyor). Mevcut havuzla içerik tekrarı yok.
- **Stil iyileşmiş:** Doğru şık en uzun şık olan soru sayısı: 04'te 12/30, 05'te 3/30, 06'da 4/30 (01–03'te 18/15/11'di). Mutlak ifade ipucu da büyük ölçüde kalktı. Geri bildirim işe yaramış.

## Düzeltilen sorunlar (yedekler scratchpad'de)
| Soru | Sorun | Yapılan |
|---|---|---|
| 04 #11 (Sözel Mantık) | "Katılan her **öğretmen** sertifika almıştır" önermesinden "Selin programa katılmamıştır" çıkmıyor (Selin öğretmen olmayabilir). Anahtar kesin doğru değildi. | Önerme "katılan **herkes**" yapıldı; açıklama uyarlandı. |
| 05 #22 (Virgül görevi) | Anahtar cümlede virgüller de eş görevli sıralama sayılabiliyordu; metin ile açıklama birbirinden farklıydı ("yıllar geçse de / sonra bile"). | Net ara sözlü cümle yazıldı: "Mahallemizin yaşlı çınarı, tam otuz yıllık komşumuz, geçen kış kurudu."; açıklama eşlendi. |
| 06 #8 (-ki) | A şıkkındaki "her zam**anki** düzeninden" de sıfat yapan -ki; E ile birlikte iki doğru şık vardı. | A şıkkı "her zaman olduğu gibi" yapıldı. |
| 05 #12 | "Gerçekleşmemiş beklenti" çıkarımla anlaşılıyordu (E şıkkı "plan" ile karışabilir). | Cümleye "ne var ki öyle olmadı" eklendi; beklentinin gerçekleşmediği açık. |

## Dikkat (değiştirilmedi)
- **05 #11:** "Yargı gerekçesiyle verilmemiş" — anahtar amaç ("katılmak üzere") cümlesi; "kurgusuyla" gibi şıklar nedensel okunabildiği için sıkı bir kök değil, ama anahtar savunulabilir.
- **06 #2 (-im/-üm):** Doğru şıkta "öğretmenimiz" de var; soru yine tek yanıtlı ama sade bir örnekle yeniden yazılabilir.
- **06 #17:** "İsim tamlaması yüklem olduğunda bölünmez" bazı kaynaklarda tartışmalı; başka aday olmadığı için anahtar geçerli.
- **06 #24:** "Bodrum en son kalkmayacak" bilgisi gereksiz (zaten sağlanıyor); açıklamadaki "önemlidir" iddiası yersiz.
- **06 #29:** Açıklama (Banu, Efe) için yalnızca iki durumu sayıyor; ters sıralı durumlar da elenir, sonuç değişmez.

## Sonuç
Tüm 90 soru yüklemeye uygun; yukarıdaki dört düzeltme yapıldı. Henüz Supabase'e hiçbir şey yüklenmedi.
