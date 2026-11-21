# Gemini'ye Verilecek Prompt — KPSS GY Türkçe Soru Denetimi ve Yeni Soru Üretimi

Aşağıdaki bloğun tamamını Gemini'ye (Antigravity ya da başka bir oturum) yapıştır. Gemini bu depoya erişebiliyor olmalıdır.

````text
Sen Kadro (KPSS hazırlık uygulaması) projesinde çalışan bir içerik editörü ve soru yazarısın. Görevin iki aşamalıdır: (A) mevcut sorular ve kaynaklar üzerinde bağımsız bir denetim yapmak, (B) yeni özgün sorular yazmak. Türkçe yaz ve Türkçe konuş.

## 0. Önce şunları oku (sırayla)
1. `GEMINI.md` (proje kuralları; çelişirse bu prompt değil GEMINI.md'nin içerik kuralları geçerlidir).
2. `docs/content-specification-guide.md` (soru veri formatı: 5 şık, `correctIndex`, `explanation`, `distractor_trap`, `exam_scopes`).
3. `docs/soru_havuzu/tarih/01_islamiyet_oncesi_turk_tarihi.sql` (SQL biçiminin örneği).
4. `docs/soru_kaynaklari/kaynak_inceleme_plani.md`, `docs/soru_kaynaklari/inceleme/kayit.json` ve `docs/soru_kaynaklari/inceleme/kpss-gy-turkce/*.md` (hangi kaynaklar onaylı, koşullu, ret).
5. `docs/soru_kaynaklari/konu_matrisi.json` (kpss_gy_gk → Türkçe konuları).
6. `docs/soru_havuzu/turkce/` klasöründeki tüm `.sql` dosyaları (şu an 530 soru; bunlar Claude tarafından yazıldı).

Kaynak dosyalar masaüstünde: `C:\Users\omere\OneDrive\Desktop\KPSS\Ders Notlari\kpss-gy-turkce\` (`notlar\` ve `sorular\` alt klasörleri). Reddedilenler `...\_reddedilen\kpss-gy-turkce\` altındadır; onları kaynak olarak KULLANMA.

## 1. Değişmez kurallar
- Bu depoda commit yapma, branch değiştirme, `lib/` altındaki koda dokunma, Supabase'e hiçbir şey yazma veya yükleme.
- Yeni dosyaları yalnızca `docs/soru_havuzu/turkce/` altına yaz. Mevcut `.sql` dosyalarını DEĞİŞTİRME; düzeltme önerilerini ayrı bir rapor dosyasında ver.
- Telif: Kaynaklardaki hiçbir soruyu, paragrafı ya da cümleyi birebir veya çok yakın biçimde kullanma. ÖSYM çıkmış sorularını kopyalama. Kaynaklar yalnızca konu bilgisi (kurallar, kavramlar) ve tarz/zorluk referansıdır. Ticari yayın kaynakları (Pegem, hocakafasi çözüm kitapçığı) yalnızca tarz referansıdır.
- Edebiyat konuları (edebî dönemler, şiir bilgisi, söz sanatları, İstiklal Marşı tahlili vb.) KPSS GY Türkçe'de yoktur; bu konularda soru yazma.
- Her soru özgün olacak: paragraf metinleri, cümleler, örnekler senin tarafından yazılacak.

## 2. AŞAMA A — Mevcut soruların bağımsız denetimi
Her `.sql` dosyasındaki her soruyu şu adımlarla denetle. Soruyu önce kendin çöz, SONRA `correctIndex` değerine ve açıklamaya bak (cevabı görerek çözme).

Kontrol listesi (her soru için):
1. Cevap doğruluğu: `correctIndex` gerçekten doğru mu? Tek doğru cevap var mı, yoksa birden çok şık savunulabilir mi?
2. Dil bilgisi/TDK doğruluğu: Yazım ve noktalama kuralları, ek ve sözcük türü bilgileri, deyim-atasözü anlamları güncel TDK kurallarına uygun mu?
3. Şıkların ayırt ediciliği: Şıklar arasında anlamca örtüşen veya hepsi doğru ya da hepsi yanlış olan var mı? Saçma (kolay elenen) çeldirici var mı?
4. `explanation` doğru mu ve cevabı gerçekten açıklıyor mu?
5. `distractor_trap` somut mu? Hangi şıkka neden düşüldüğünü açıklıyor mu, yoksa genel mi?
6. Zorluk etiketi (`difficulty` 1/2/3) uygun mu? Lisans GY-GK düzeyinde mi?
7. Konu etiketi (`topic`) doğru mu? `lesson = 'Türkçe'` ve topic adı aşağıdaki listeyle harfi harfine aynı mı?
8. Paragraf sorularında: parça kendi içinde tutarlı mı? "Çıkarılamaz / söylenemez / değinilmemiştir" tipi soruların doğru şıkkı gerçekten parçadan çıkarılamıyor mu? Cümle sıralama sorularında ROM numaralı sıra mantıksal olarak tek mi?
9. Sözel mantık sorularında: bulmacanın tek çözümü var mı? Çözümü adım adım doğrula.
10. Telif/özgünlük: Metin kaynak dosyalardaki bir metne çok benziyor mu? Başka partilerdeki bir soruyla neredeyse aynı mı (tema veya cümle tekrarı)?

Çıktı: `docs/soru_havuzu/turkce/inceleme_gemini.md` dosyası. İçinde:
- Özet tablo: dosya adı | soru sayısı | sorunlu soru sayısı.
- Her sorunlu soru için: dosya adı, sorunun ilk 8 kelimesi, sorunun türü (cevap hatalı / birden çok doğru / TDK hatası / zayıf çeldirici / açıklama yanlış / zorluk etiketi / konu etiketi / tekrar), 1-2 cümle gerekçe, önerilen düzeltme.
- Önem sırası: önce cevabı yanlış veya belirsiz sorular.
Sorunsuz soruları listeleme. Emin olmadığın noktaları "emin değilim" diye açıkça işaretle; uydurma kural veya kaynak gösterme.

## 3. AŞAMA B — Yeni soru üretimi
Mevcut dağılım ve hedef (ana oturumun önerisi, resmî değil):

| Konu (topic, harfi harfine) | Hazır | Hedef |
|---|---|---|
| Paragrafta Anlam ve Yapı | 234 | 300 |
| Cümlede Anlam | 75 | 80 |
| Sözcükte Anlam | 50 | 50 |
| Sözcük Türleri (İsim, Sıfat, Zamir, Zarf, Edat, Fiil) | 18 | 60 (dil bilgisi toplamı: ses + yapı + sözcük türleri + cümle ögeleri) |
| Ses Bilgisi ve Ses Olayları | 13 | (dil bilgisi toplamına dâhil) |
| Sözcükte Yapı ve Ekler | 14 | (dil bilgisi toplamına dâhil) |
| Cümlenin Ögeleri ve Cümle Türleri | 20 | (dil bilgisi toplamına dâhil) |
| Yazım Kuralları | 18 | 40 (yazım + noktalama) |
| Noktalama İşaretleri | 18 | (yazım-noktalama toplamına dâhil) |
| Anlatım Bozuklukları | 19 | 20 |
| Sözel Mantık ve Muhakeme | 51 | 50 |

(Sayıları `.sql` dosyalarından kendin de doğrula.)

Yeni sorular için önceliğin: (1) zor (difficulty 3) ve orta (2) sorular; mevcut havuzda kolay sorular fazla. (2) Paragraf konusu: en az 66 yeni soru. (3) Yazım ve noktalama + anlatım bozukluğu eksikleri. (4) Mevcut havuzda zayıf olan ve A aşamasında sorunlu bulunan konu/soru tiplerini telafi eden sorular.

Toplam hedef: en az 100 yeni soru. 25-30'luk partiler hâlinde yaz; her partiyi ayrı `.sql` dosyası yap ve her partiden sonra durup kullanıcıya özet ver.

### Soru kalitesi kuralları
- 5 şık (A-E), tek doğru cevap, doğru şık A-E arasında dengeli dağılsın.
- Her soruda `explanation` (cevabın gerekçesi) ve `distractor_trap` ("ÖSYM Çeldirici Tuzağı": adayın en çok düşeceği şıkkı ve nedenini somut olarak açıkla) zorunlu.
- Açıklama ve tuzak metinlerinde şıklara harfle ("A şıkkı") değil içerikle gönderme yap (şıklar karıştırılabilir).
- Paragraf metinleri 3-6 cümle, özgün, konu çeşitli (bilim, çevre, eğitim, toplum, sağlık, ekonomi, teknoloji, doğa). Edebiyat yok. Aynı temayı iki kez kullanma; mevcut parçaların temalarını (`docs/soru_havuzu/turkce/*.sql`) tara ve tekrar etme.
- Soru kökleri ÖSYM biçiminde: ana düşünce, çıkarılamaz, boşluk tamamlama, cümle sıralama, paragraf bölme, akışı bozan cümle, cümle işlevi, başlık, yazarın tutumu, anlatım biçimi vb. Çeşitli kullan.
- Sözel mantık: bulmacanın tek çözümü olduğunu mümkünse bir betikle (kaba kuvvet) doğrula.
- Dil bilgisi/yazım: yalnızca TDK ile uyumlu, tartışmasız kuralları kullan. Emin olmadığın bir kuralla soru yazma.
- Deyim ve atasözü: yalnızca anlamından kesin emin olduğun yaygın örnekleri kullan.

### Veri biçimi (mevcut dosyalarla aynı)
Her parti şu yapıda bir `.sql` dosyası olsun (örnek için `docs/soru_havuzu/turkce/zor_01_parti.sql`'e bak):

```sql
insert into public.questions (
  lesson, topic, question_type, difficulty, prompt_text,
  interaction_data, explanation, distractor_trap, exam_scopes, education_level
) values
(
  'Türkçe',
  '<topic adı harfi harfine>',
  'multiple_choice',
  2,
  '<soru metni; tek tırnak ikiye katlanır>',
  '{"options": ["...", "...", "...", "...", "..."], "correctIndex": 0}'::jsonb,
  '<açıklama>',
  '<çeldirici tuzağı>',
  array['lisans_gygk']::text[],
  'lisans'
),
...;
```

- Dosya başına şu başlık yorumlarını koy: parti adı, soru sayısı, "Özgün üretim", "Kullanıcı onayı bekliyor".
- `topic` yalnızca şu adlardan biri olabilir: Sözcükte Anlam, Cümlede Anlam, Paragrafta Anlam ve Yapı, Sözcükte Yapı ve Ekler, Sözcük Türleri (İsim, Sıfat, Zamir, Zarf, Edat, Fiil), Ses Bilgisi ve Ses Olayları, Yazım Kuralları, Noktalama İşaretleri, Cümlenin Ögeleri ve Cümle Türleri, Anlatım Bozuklukları, Sözel Mantık ve Muhakeme.

## 4. Teslim edeceklerin
1. `docs/soru_havuzu/turkce/inceleme_gemini.md` (A aşaması raporu).
2. Yeni `.sql` parti dosyaları (`gemini_01_parti.sql` ...).
3. Sonda kısa bir özet: kaç soru denetlendi, kaç sorun bulundu, kaç yeni soru yazıldı, hangi konularda eksik kaldı, hangi noktalarda emin olmadığın.

Kendi yazdığın yeni soruları da teslim etmeden önce Aşama A'daki 10 maddelik listeyle kendin denetle.
````
