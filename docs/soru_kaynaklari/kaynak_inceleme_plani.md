# 🔍 Kaynak İnceleme Planı (alonot.com ve diğer indirilen kaynaklar)

> **Kural:** Hiçbir kaynak, bu plandaki incelemeden **"Onaylı"** kararı almadan soru üretimine veya not kaynağı olarak kullanıma girmez.
> **Ölçüt:** [konu_matrisi.json](konu_matrisi.json) (ÖSYM 2026 kılavuzlarının resmî konu ve ağırlık tabloları).
> **Çalışma şekli:** Her aşama ayrı bir turda yapılır. Bir aşama bitmeden ve kullanıcı onaylamadan sonrakine geçilmez.

## Kim Ne Yapar

| İş | Kim | Neden |
|---|---|---|
| alonot.com'dan dosya indirmek | **Kullanıcı** | Site üyelik istiyor. Claude hesap açamaz, şifre giremez. Kullanıcı yüklemeli bir paylaşım sitesi olduğu için dosyaları Claude'un indirmesi uygun değil. |
| Dosyayı `_gelen/` klasörüne koymak | Kullanıcı | — |
| Otomatik ön tarama, soru okuma, puanlama, rapor | Claude | — |
| Onaylı dosyayı hedef klasöre taşımak | Claude (kullanıcı kararı onayladıktan sonra) | — |

## Masaüstü Klasör Düzeni (`Desktop\KPSS\Ders Notlari\`)

```
Ders Notlari\
  _gelen\<ders>\                ← indirilen ham dosyalar (incelenmedi, KULLANILMAZ)
  <ders>\notlar\                ← onaylı konu anlatımları (olgu kaynağı)
  <ders>\sorular\               ← onaylı test/soru dosyaları (yalnızca tarz ve zorluk referansı)
  <ders>\mevzuat\               ← mevzuat.gov.tr kanun metinleri
  _reddedilen\<ders>\           ← reddedilenler (red nedeni raporda)
  kpss-tarih\ kpss-cografya\ …  ← mevcut GK klasörleri (dokunulmaz, geriye dönük denetim ayrı aşama)
```

`<ders>` adları: `kpss-gy-turkce`, `kpss-gy-matematik`, `kpss-gy-geometri`, `ekpss`, `dhbt-1`, `dhbt-2-lisans`, `dhbt-2-onlisans`, `dhbt-2-ortaogretim`, `ags-sozel-sayisal`, `ags-egitim-bilimleri`, `ags-mevzuat`, `oabt-<brans>`, `a-hukuk`, `a-iktisat`, `a-maliye`, `a-muhasebe`, …

## İnceleme Aşamaları (her dosya için)

### Aşama A — Otomatik ön tarama (Node betiği, dakikalar)

| Kontrol | Nasıl | Elenme koşulu |
|---|---|---|
| **Kopyalanabilirlik (zorunlu)** | (1) Metin katmanı: sayfa başına en az 100 karakter. (2) Metin anlamlı mı: Türkçenin en sık 27 kelimesinin oranı en az %2 (düzgün metinde %5–13, bozuk font eşlemesinde ~%0). | Biri tutmazsa **❌ KOPYALANAMAZ** → hiçbir incelemeye girmez, `_reddedilen` (OCR ayrı karar) |
| Köken izi | Gömülü URL'ler, yayınevi adları, Facebook/Drive izleri, Zone.Identifier | Ticari yayınevi soru bankası veya ÖSYM çıkmış sorusu → yalnızca `sorular/` (asla not kaynağı değil) |
| Tarih ve eskilik | Metindeki yıllar, eski terimler (ör. "Bakanlar Kurulu", "KHK", "öğretmenlik alan bilgisi alan eğitimi", TYMM'nin yokluğu) | Mevzuatı eskimişse → ret veya "yalnızca tarih/kavram" etiketi |
| Konu eşleşmesi | Metin, `konu_matrisi.json`'daki konu anahtar kelimeleriyle eşleştirilir; konu başına kapsam yüzdesi | Hedef sınavın konularının dışında kalan içerik oranı yüksekse → düşük puan |
| Soru yapısı | Soru sayısı, şık sayısı (ÖSYM: **5 şık A–E**), cevap anahtarı var mı | 4 şıklı veya cevap anahtarı yok → `sorular/` için düşük puan |

### Aşama B — İnsan gözüyle kalite incelemesi (Claude okur)

Her dosyadan **rastgele en az 15 soru** (veya not dosyasında en az 5 konu bölümü) okunur ve puanlanır:

| Ölçüt | Soru dosyası | Not dosyası | Puan |
|---|---|---|---|
| **Doğruluk** | Cevap anahtarı doğru mu, tek doğru cevap var mı | Bilgiler doğru ve güncel mi | 0–5 (**< 4 → ret**) |
| **Konu uyumu** | Soru, hedef sınavın resmî konusuna giriyor mu (ör. E-KPSS'te Osmanlı sorusu = uyumsuz) | Anlatılan konular matristeki konularla örtüşüyor mu | 0–5 (**< 3 → ret**) |
| **Düzey uyumu** | Lisans / Ön Lisans / Ortaöğretim zorluğuna uygun mu | Derinlik düzeye uygun mu | 0–5 |
| **ÖSYM tarzı** | Kök yapısı, öncüllü sorular, 5 şık, çeldirici mantığı | — | 0–5 |
| **Çeldirici kalitesi** | Şıklar makul mu, saçma şık var mı | — | 0–5 |
| **Dil ve biçim** | Yazım/anlatım hatası, bozuk karakter, eksik şekil | Okunabilirlik | 0–5 |
| **Güncellik** | Mevzuat, istatistik, teşkilat güncel mi | Aynı | 0–5 (**hukuk/maliye/AGS mevzuat için < 4 → ret**) |

### Aşama C — Karar

| Karar | Koşul | Hedef |
|---|---|---|
| ✅ **Onaylı** | Ret eşiğine takılmıyor ve ortalama ≥ 3,5 | `<ders>\notlar\` veya `<ders>\sorular\` |
| 🟡 **Koşullu** | Ortalama 2,5–3,5 veya kısmen kapsam dışı | Hedef klasör + raporda "yalnızca şu konular / şu sayfalar" notu |
| ❌ **Ret** | Herhangi bir ret eşiği veya ortalama < 2,5 | `_reddedilen\<ders>\` |

Her dosya için rapor: `docs/soru_kaynaklari/inceleme/<ders>/<dosya-adı>.md`. Tüm kararların listesi: `docs/soru_kaynaklari/inceleme/kayit.json` (dosya, karar, puanlar, köken, kapsadığı konular, tarih).

## Uygulama Sırası (her biri ayrı tur)

| # | Aşama | Çıktı | Durum |
|---|---|---|---|
| 0 | Klasör düzenini masaüstünde kurmak + tarama betiğini yazıp mevcut 1–2 GK dosyası üzerinde denemek | Klasörler, `inceleme/` iskeleti, çalışan betik | ✅ 2026-11-20 (ayrıntı aşağıda) |
| 1 | **Pilot: KPSS GY Türkçe** — kullanıcı [alonot.md](alonot.md) §1'deki ~10 dosyayı `_gelen\kpss-gy-turkce\` klasörüne indirir | Ham dosyalar | ✅ 2026-11-21 (17 dosya; indirme Downloads üzerinden, _gelen atlandı) |
| 2 | Pilot Aşama A: otomatik ön tarama | Tarama tablosu | ✅ 2026-11-21 (araç .doc/.docx ve bazı cevap anahtarı biçimlerini okuyamadı, elle tamamlandı) |
| 3 | Pilot Aşama B–C: kalite incelemesi ve kararlar. Kullanıcı kararları gözden geçirir. | Raporlar + kararlar | ✅ 2026-11-21 (11 onaylı, 3 koşullu, 3 ret; kullanıcı onayladı) |
| 4 | Pilot dersi: onaylıları taşı. Ölçütleri pilot deneyimine göre gerekirse düzelt. | Düzenlenmiş klasör | ✅ 2026-11-21 (3 ret → _reddedilen; ölçüt notu: tarayıcı anahtar biçimlerini tanımıyor, .doc/.docx okunmuyor) |
| 5 | GY Matematik + Geometri | — | — |
| 6 | Eğitim Bilimleri (AGS) — TYMM, program okuryazarlığı ve 7528 kapsamı ayrıca kontrol | — | — |
| 7 | DHBT (düzeylere göre) | — | — |
| 8 | A Grubu (önce Hukuk, İktisat, Maliye, Muhasebe) — güncellik eşiği sıkı | — | — |
| 9 | ÖABT branşları | — | — |
| 10 | Geriye dönük: mevcut GK klasörleri (tarih, coğrafya, vatandaşlık, güncel) aynı ölçütlerle | — | — |

## Aşama 0 Sonucu (2026-11-20)

**Kurulanlar:**
- Masaüstü: `Ders Notlari\_gelen\kpss-gy-turkce\` (+ `OKU-BENI.txt`), `_reddedilen\`, `kpss-gy-turkce\notlar\`, `kpss-gy-turkce\sorular\`. Diğer derslerin klasörleri kendi aşamalarında açılacak.
- `inceleme/kayit.json`: karar kayıt defteri (şema içinde, kayıt yok).
- `araclar/konu_anahtar_kelimeleri.json`: GY Türkçe ve 4 GK dersi için konu, kapsam dışı ve eskilik anahtar kelimeleri.
- `araclar/kaynak_tara.mjs`: Aşama A betiği.

**Çalıştırma** (`docs/soru_kaynaklari/araclar/` içinden):

```bash
node kaynak_tara.mjs --ders kpss-gy-turkce "C:/Users/omere/OneDrive/Desktop/KPSS/Ders Notlari/_gelen/kpss-gy-turkce" --json ../inceleme/kpss-gy-turkce/_tarama.json
```

**Deneme (mevcut 4 GK dosyası):**

| Dosya | Betiğin bulduğu | Değerlendirme |
|---|---|---|
| `kpss-tarih/Kpss-Tarih-Test-Sorulari-Ve-Cevaplari-10.pdf` | 3 sayfa, 20 soru, 5 şık, cevap anahtarı var, kaynak alonot.com, ağırlık Osmanlı | Doğru tespit |
| `kpss-tarih/Türk-İslam-Tarihi-Test-2-Ösym-Çıkmış-Sorular-.pdf` | Yargı/Rektör "Tarihsavar", kitapsec, yadi.sk izleri, 2016 | Doğru: ticari kitap alıntısı → en fazla `sorular/` |
| `kpss-vatandaslik/Kpss-Vatandaslik-Anayasa-Ders-Notlari-.pdf` | En büyük yıl 2008; "Bakanlar Kurulu" ×19, "Başbakan" ×10, "KHK" ×1 | ⚠️ **Gerçek bulgu:** Not, 2017 Anayasa değişikliği öncesini anlatıyor. Bu dosyadan GK havuzuna üretilmiş Vatandaşlık soruları geriye dönük denetimde (adım 10) öncelikli kontrol edilmeli. |
| `kpss-tarih/Kpss-Tarih-Önemli-Notlar-.docx` | DOCX metni okunuyor, kaynak alonot.com | Doğru |

**Kopyalanabilirlik denemesi (mevcut 47 GK dosyası):**
- 45 dosya ✅ (sık kelime oranı %5–13).
- ❌ `kpss-cografya/Kpss-Cografya-Haritalar-.pdf` (~79 karakter/sayfa, harita görselleri) ve `kpss-guncel/Kpss-Guncel-Bilgiler-Ders-Notlari-7.pdf` (~27 karakter/sayfa, görüntü). Bu iki dosya GK klasörlerinde kullanımda görünüyor; geriye dönük denetimde (adım 10) bakılacak.
- ❌ `kpss-tarih/kullanilmayanlar/Kpss-Tarih-Kronolojisi…` → kullanıcının elle "kopyalanmıyor" ayırdığı dosya; betik de aynı sonuca vardı.
- Betik düzeltmesi: Git Bash `pdftotext` Türkçe/Unicode karakterli dosya adlarını açamıyordu; dosya artık geçici ASCII adlı kopyadan okunuyor.

**Bilinen sınırlar:**
- Konu eşleşmesi anahtar kelime sayımıdır; konu uyumuna kesin kararı Aşama B'deki okuma verir.
- Taranmış (metinsiz) PDF'ler için OCR yok; bunlar "metin katmanı: HAYIR" olarak işaretlenir.
- `pdfinfo` kurulu değil; sayfa sayısı `pdftotext` çıktısından hesaplanıyor.

> Telif kuralı değişmez: Onaylı soru dosyası bile **birebir kopyalanmaz**. Yalnızca tarz, zorluk ve konu dağılımı referansıdır. Uygulamaya giren her soru özgün yazılır ve `distractorTrap` içerir.
