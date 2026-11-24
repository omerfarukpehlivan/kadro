# 📖 Kadro Konu Anlatımı — İçerik Formatı ve Yazım Kuralları

> **Kime:** Konu anlatımı içeriğini yazan ajan (Gemini) ve inceleyen ajan (Claude).
> **Görevler:** `TASK-168` (altyapı), `TASK-169` (üretim hattı + pilot), `TASK-170` (içerik partileri) — `docs/task-board.md`.
> **Tek kaynak:** Bu dosya içeriğin *biçimini* tanımlar; veri sözleşmesi (tablo, JSON blokları) `TASK-168` Ortak Sözleşme bölümündedir. İkisi çelişirse task board geçerlidir.

---

## 1. Temel Kavramlar

| Kavram | Anlamı | Örnek |
|---|---|---|
| **Ders** | Müfredattaki ders (kanonik ad, `kpss_lessons.dart` ile birebir) | `Tarih` |
| **Konu** | Dersin konusu (kanonik ad, soru havuzundaki `topic` ile birebir) | `Osmanlı Kültür ve Uygarlığı` |
| **Bölüm (ünite)** | Bir konunun 6–12 dakikada okunabilen alt parçası. Uzun konular 3–8 bölüme ayrılır. | `Bölüm 2: Osmanlı Merkez Teşkilatı` |
| **Blok** | Bölümün içindeki tek içerik parçası (paragraf, tablo, tuzak notu…) | `:::tuzak` |

Kullanıcı bir konuyu açınca bölümleri sırayla okur; her bölümün sonunda **"Akılda Kalsın"** özeti ve 2–3 **mini kontrol sorusu** vardır; konunun sonunda ilgili konu testine geçer.

## 2. Dosya Düzeni

```
docs/konu_anlatimi/
  FORMAT.md                       ← bu dosya
  tarih/
    01_islamiyet_oncesi_turk_tarihi.md
    02_ilk_turk_islam_devletleri.md
  cografya/ ...
  vatandaslik/ ...
  turkce/ ...
```

- **Bir dosya = bir konu.** Dosya adı `NN_konu_slug.md` (NN = müfredattaki sıra).
- Dosyalar `tools/konu_anlatimi_to_sql.mjs` ile doğrulanıp SQL'e dönüştürülür (`TASK-169`); çıktı `docs/supabase_migrations/konu_anlatimi/<ders>_<NN>.sql`.
- **Güncel Bilgiler** konu anlatımına dahil değildir (aylık bülten modülü bu işi görür).

## 3. Dosya Şablonu

````markdown
---
lesson: Tarih
topic: İslamiyet Öncesi Türk Tarihi
exam_scopes: [b_grubu_gk]
sources:
  - "ÖSYM 2026 KPSS Lisans Kılavuzu, Tablo-1 (konu kapsamı)"
  - "MEB Ortaöğretim Tarih 9. Sınıf Ders Kitabı (yalnızca olgu doğrulama)"
---

## Bölüm 1: Orta Asya ve İlk Türk Kültür Merkezleri

Türklerin ana yurdu olarak kabul edilen Orta Asya, ... (özgün paragraf)

### Başlıca Kültür Merkezleri

:::tablo
| Kültür | Bölge | Öne çıkan özellik |
|---|---|---|
| Anav | Aşkabat yakınları | Orta Asya'nın bilinen en eski kültürü |
| Afanesyova | Altay-Sayan | Türklere ait kabul edilen en eski kültür |
:::

:::kodlama
**"AAA-KT"** → **A**nav, **A**fanesyova, **A**ndronova, **K**arasuk, **T**agar (eskiden yeniye)
:::

:::tuzak
"Orta Asya'nın en eski kültürü" ile "Türklerin en eski kültürü" farklı sorulardır: ilki **Anav**, ikincisi **Afanesyova**. ÖSYM bu iki ifadeyi yer değiştirerek çeldirici kurar.
:::

:::akilda-kalsin
- Orta Asya'nın en eski kültürü: Anav
- Türklere ait en eski kültür: Afanesyova
- Demir ilk kez Karasuk'ta işlendi
:::

:::kontrol
:::

## Bölüm 2: ...
````

## 4. Blok Türleri (yalnızca bunlar)

| Yazım | Blok `type` | Ne zaman | Görünüm |
|---|---|---|---|
| Düz paragraf | `paragraph` | Anlatımın gövdesi. 2–5 cümle. | Normal metin |
| `### Başlık` | `heading` | Bölüm içi alt başlık (yalnız `###`). | Kalın alt başlık |
| `- madde` listesi | `bullets` | 3–7 kısa madde. İç içe liste yok. | Madde işaretli liste |
| `:::tablo` … `:::` | `table` | Karşılaştırma, sınıflandırma. En çok 5 sütun, 10 satır. | Kaydırılabilir tablo |
| `:::zaman` … `:::` | `timeline` | Kronoloji. Her satır `YIL \| olay`. | Dikey zaman çizgisi |
| `:::bilgi` … `:::` | `callout` (`kind: info`) | Mutlaka bilinmesi gereken kritik bilgi. | Mavi bilgi kutusu |
| `:::kodlama` … `:::` | `callout` (`kind: mnemonic`) | Hafıza kodu/kısaltma. Konu başına en az 1. | Mor/kobalt kutu |
| `:::tuzak` … `:::` | `callout` (`kind: trap`) | **ÖSYM Çeldirici Tuzağı.** Bölüm başına en az 1. | Altın/kehribar uyarı rozeti (soru ekranındaki `distractorTrap` ile aynı stil) |
| `:::ornek` … `:::` | `callout` (`kind: example`) | Kural için kısa örnek (özellikle Türkçe dil bilgisi). | Gri örnek kutusu |
| `:::akilda-kalsin` … `:::` | `key_points` | **Her bölümün sonunda zorunlu**, 3–5 madde. | Bölüm sonu özet kartı |
| `:::kontrol` … `:::` | `check_questions` | Her bölümün sonunda zorunlu. **Boş bırakılır** → uygulama o konudan otomatik 2 kolay/orta soru seçer (kural `TASK-168`). İstenirse içine satır satır soru UUID'si (`questions.id`) yazılabilir. | Satır içi mini soru |
| `:::sekil Alt yazı` … `:::` | `figure` | (TASK-172) Matematik/geometri şekli, grafik, tablo görseli, Venn şeması, sayı doğrusu. İçine şekil tarifi (JSON) yazılır; dönüştürücü bunu tema uyumlu SVG'ye çizer. Tarif biçimi: `docs/soru_havuzu/matematik/FORMAT.md` §6. Yönerge satırındaki metin alt yazıdır (isteğe bağlı). | Ortalanmış şekil + alt yazı |

**Satır içi biçim:** `**kalın**`, `*italik*` ve (TASK-172) matematik: `$...$` satır içi, `$$...$$` ayrı satırda ortalanmış LaTeX. İzinli LaTeX komutları ve yazım kuralları `docs/soru_havuzu/matematik/FORMAT.md` §3'tedir (kimya formülü gibi dik yazılacak harfler: `$\mathrm{H_2O}$`). Dönüştürücü matematik yazımını da denetler. Link, resim, HTML, emoji **yok**.

Şekil örneği:

```markdown
:::sekil Şekil 1. Dik üçgende kenarlar
{
  "kind": "geometry",
  "points": { "A": [0, 0], "B": [4, 0], "C": [4, 3] },
  "shapes": [
    { "type": "polygon", "points": ["A", "B", "C"] },
    { "type": "angle", "vertex": "B", "from": "A", "to": "C", "right": true },
    { "type": "segment", "from": "A", "to": "B", "label": "4" },
    { "type": "segment", "from": "B", "to": "C", "label": "3" },
    { "type": "segment", "from": "A", "to": "C", "label": "5" }
  ]
}
:::
```

## 5. İçerik Kuralları

1. **Özgünlük (zorunlu):** Metin tamamen özgün yazılır. Yayınevi kitapları, dershane notları, alonot.com PDF'leri ve ÖSYM çıkmış soru metinleri **kopyalanmaz, cümle cümle yeniden yazılmaz**. Bu kaynaklar yalnızca *kapsam kontrolü* için okunabilir. Olgular (tarih, isim, madde numarası) serbesttir; anlatım özgün olmalıdır.
2. **Kapsam = sınav:** Bölümler ÖSYM resmî kapsamına (`docs/soru_kaynaklari/konu_matrisi.md`) ve **o konudaki soru havuzumuza** göre seçilir. Soru havuzunda (`docs/soru_havuzu/<ders>/`) bir sorunun ölçtüğü her bilgi konu anlatımında bulunmalıdır; sorularda hiç geçmeyen ayrıntıya boğulma.
3. **Kaynak önceliği:** (a) ÖSYM kılavuzu kapsamı → (b) bizim soru açıklamalarımız ve `distractorTrap` notlarımız (en değerli kaynak: adayın nerede yanıldığını söyler) → (c) MEB ders kitapları ve resmî metinler (Anayasa, kanun metinleri) yalnızca olgu doğrulama için.
4. **Doğruluk:** Her tarih, sayı, madde numarası ve isim bir resmî kaynakla doğrulanabilir olmalı. Emin olunmayan bilgi yazılmaz. Vatandaşlık'ta güncel Anayasa ve kanun metni esas alınır (değişiklik tarihleriyle).
5. **Dil:** Sade, sınav odaklı, ikinci tekil şahıs ("Dikkat et: …"). Paragraf başına en çok 5 cümle. Ders kitabı ağırlığında uzun anlatım yok.
6. **Uzunluk:** Bölüm başına 600–1.400 kelime (≈ 4–9 dk okuma, 180 kelime/dk). Konu başına 3–8 bölüm.
7. **Zorunlu bloklar (bölüm başına):** en az 1 `:::tuzak`, sonda 1 `:::akilda-kalsin` (3–5 madde), sonda 1 `:::kontrol` (2–3 soru). **Konu başına** en az 1 `:::kodlama`.
8. **Kontrol soruları:** Varsayılan olarak `:::kontrol` bloğu boş bırakılır; uygulama soruları kendisi seçer. UUID yazılırsa yalnızca canlıda var olan ve o konuya ait sorular kullanılır; aynı soru iki bölümde kullanılmaz.
9. **Düzey:** Tek metin Lisans, Ön Lisans ve Ortaöğretim için ortaktır (`exam_scopes: [b_grubu_gk]` veya Türkçe için `[b_grubu_gygk]`). Ayrı düzey metni yazılmaz.

## 6. İnceleme Kontrol Listesi (Claude)

- [ ] Ön bilgideki `lesson` / `topic` kanonik adlarla birebir aynı
- [ ] Bölüm sayısı ve uzunlukları kurallara uygun; dönüştürücü uyarı vermiyor
- [ ] Her bölümde tuzak + akılda kalsın + kontrol var; konuda kodlama var
- [ ] Rastgele 10 olgu resmî kaynakla doğrulandı
- [ ] Konunun soru havuzundan rastgele 10 sorunun ölçtüğü bilgi anlatımda var
- [ ] Kontrol bloğuna UUID yazıldıysa hepsi veritabanında var ve konuya ait
- [ ] Kopya/yakın yeniden yazım şüphesi yok (yayınevi cümle kalıpları, birebir tanımlar)
